//
//  ViewController.m
//  Twitterizer
//
//  Created by Paul Lefebvre on 5/25/16.
//  Copyright © 2016 Paul Lefebvre. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *characterCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

// Step 2: We loop over the characters in our text and remove the vowels a,e,i,o,u
// THen we set the text of the UITextView to the newly created string without vowels
- (IBAction)twitterize:(id)sender {
    NSString *text = self.textView.text;
    NSMutableString *noVowelsText = [[NSMutableString alloc] init];
    
    for (int i = 0; i < text.length; i++) {
        char c = [text characterAtIndex:i];
        
        if (c != 'a' && c != 'e' && c != 'i' && c !='o' && c != 'u' && c != 'A' && c != 'E' && c != 'I' && c !='O' && c != 'U') {
            [noVowelsText appendFormat:@"%c",c];
            
        }
    }
    self.textView.text = noVowelsText;
}

// Step 3: Whenever the user types a character, update the character count in the UILabel
-(void)textViewDidChange:(UITextView *)textView {
    self.characterCount.text = [NSString stringWithFormat:@"%lu", textView.text.length];
    
    
    // Step 4: Limit us from typing past 140 characters
    self.textView.text = (self.textView.text.length > 139 ? [self.textView.text substringToIndex:139] : self.textView.text);
    
    // Stretch 1: Beginning with the first word in the UITextView, make every other word begin with a “#”
    
}

- (IBAction)addHashtags:(id)sender {
    NSArray *array = [self.textView.text componentsSeparatedByString:@" "];
    NSMutableArray *second = [[NSMutableArray alloc] initWithArray:array];
    
    for (int i = 0; i < array.count; i = i + 2) {
        //NSLog(@"%@",[array objectAtIndex:i]);
        NSString *test = [NSString stringWithFormat:@"#%@",[second objectAtIndex:i]];
        [second replaceObjectAtIndex:i withObject:test];
        //[second objectAtIndex:i] = [NSString stringWithFormat:@"#%@",[second objectAtIndex:i]];
    }
    
    self.textView.text = [second componentsJoinedByString:@" "];
    
}








@end

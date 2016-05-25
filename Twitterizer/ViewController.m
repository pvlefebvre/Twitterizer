//
//  ViewController.m
//  Twitterizer
//
//  Created by Paul Lefebvre on 5/25/16.
//  Copyright © 2016 Paul Lefebvre. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
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

@end

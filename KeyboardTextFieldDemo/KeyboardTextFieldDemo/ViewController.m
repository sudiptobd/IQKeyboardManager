//
//  ViewController.m
//  KeyboardTextFieldDemo

#import "ViewController.h"
#import "IQKeyboardManager.h"
#import "IQUIView+IQKeyboardToolbar.h"

@interface ViewController ()<UIActionSheetDelegate>

@end


@implementation ViewController

- (IBAction)shareClicked:(UIBarButtonItem *)sender
{
    NSString *shareString = @"IQKeyboardManager is really great control for iOS developer to manage keyboard-textField.";
    UIImage *shareImage = [UIImage imageNamed:@"IQKeyboardManagerScreenshot"];
    NSURL *youtubeUrl = [NSURL URLWithString:@"http://youtu.be/6nhLw6hju2A"];
    
    NSArray *activityItems = [NSArray arrayWithObjects:
                              youtubeUrl,
                              shareString,
                              shareImage,
                              nil];
    
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    NSArray *excludedActivities = @[UIActivityTypePrint,
                                    UIActivityTypeCopyToPasteboard,
                                    UIActivityTypeAssignToContact,
                                    UIActivityTypeSaveToCameraRoll];
    controller.excludedActivityTypes = excludedActivities;
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [[IQKeyboardManager sharedManager] setToolbarManageBehaviour:IQAutoToolbarByPosition];
}

-(BOOL)shouldAutorotate
{
    return NO;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

@end


//
//  ViewController.m
//  FastestRPM
//
//  Created by Katherine Peterson on 2015-09-03.
//  Copyright (c) 2015 KatieExpatriated. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIView *needleContainer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    float degrees = -230;
    self.needleContainer.transform = CGAffineTransformMakeRotation(degrees*M_PI/180);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculatePanSpeed:(UIPanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateChanged: {
            CGPoint output = [sender velocityInView:self.view];
            float velocity = sqrtf(output.x*output.x + output.y+output.y);
            
            float degrees = -230 + velocity*180/1000;
            self.needleContainer.transform = CGAffineTransformMakeRotation(degrees*M_PI/180);
            break;
        }
        case UIGestureRecognizerStateEnded:
            self.needleContainer.transform = CGAffineTransformMakeRotation(-230*M_PI/180);
            break;
        default:
            self.needleContainer.transform = CGAffineTransformMakeRotation(-230*M_PI/180);
            break;
    }
}

@end

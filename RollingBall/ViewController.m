//
//  ViewController.m
//  RollingBall
//
//  Created by BMXStudio03 on 8/29/15.
//  Copyright (c) 2015 Trung Hoang Dang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    UIImageView *ball;
    NSTimer *timer;
    CGFloat angle, angle2, ballRadius;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBall];
    angle = 0.0;
    angle2 = 0.0;
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                             target:self
                                           selector:@selector(rollBallLeftToRight)
                                           userInfo:nil repeats:YES];
    

}

-(void) addBall {
    CGSize mainViewSize = self.view.bounds.size;
    
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"football.png"]];
    ball.frame = CGRectMake(0, 0, 60, 60);
    ballRadius = 30.0;
    ball.center = CGPointMake(ballRadius, mainViewSize.height - ballRadius);
    [self.view addSubview:ball];
}

- (void) rollBallLeftToRight {
    CGFloat deltaAngle = 0.1;
    angle += deltaAngle;
    ball.transform = CGAffineTransformMakeRotation(angle);
    ball.center = CGPointMake(ball.center.x + ballRadius*deltaAngle, ball.center.y);
    if (ball.center.x > self.view.bounds.size.width - ballRadius) {
        [timer invalidate];
        timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self
                                               selector:@selector(rollingBallRightToLeft) userInfo:nil repeats:YES];
        
    }
}

- (void) rollingBallRightToLeft {
    CGFloat deltaAngle = 0.1;
    angle2 += deltaAngle;
    ball.transform = CGAffineTransformMakeRotation(-angle2);
    ball.center = CGPointMake(ball.center.x - ballRadius*deltaAngle, ball.center.y);
    if (ball.center.x < ballRadius) {
        [timer invalidate];
        timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                                 target:self
                                               selector:@selector(rollBallLeftToRight)
                                               userInfo:nil repeats:YES];
    }
    
}

//- (void) viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    [timer invalidate];
//    timer = nil;
//}

@end

//
//  ViewController.m
//  LearnGPUImage
//
//  Created by bigfish on 2018/7/24.
//  Copyright © 2018年 bigfish. All rights reserved.
//

#import "ViewController.h"
#import <GPUImageView.h>
#import <GPUImageVideoCamera.h>
#import <GPUImageSepiaFilter.h>
@interface ViewController ()
@property (strong, nonatomic) IBOutlet GPUImageView *mImageView;

@property (strong, nonatomic) GPUImageVideoCamera *mGPUVideoCamera  ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mGPUVideoCamera =[[GPUImageVideoCamera
                            alloc]initWithSessionPreset:AVCaptureSessionPreset640x480 cameraPosition:AVCaptureDevicePositionBack];
    self.mImageView.fillMode = kGPUImageFillModeStretch;
    
    GPUImageSepiaFilter *filter = [[GPUImageSepiaFilter alloc]init];
    [self.mGPUVideoCamera addTarget:filter];
    [filter addTarget: self.mImageView];
    [self.mGPUVideoCamera startCameraCapture];
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
    
    
  



}

- (void)deviceOrientationDidChange:(NSNotification *)notification {
    UIInterfaceOrientation orientation = (UIInterfaceOrientation)[UIDevice currentDevice].orientation;
    self.mGPUVideoCamera.outputImageOrientation = orientation;
}


@end

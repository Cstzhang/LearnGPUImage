//
//  ViewController.m
//  LearnGPUImage
//
//  Created by bigfish on 2018/7/24.
//  Copyright © 2018年 bigfish. All rights reserved.
//

#import "ViewController.h"
#import <GPUImageView.h>
#import <GPUImage.h>
@interface ViewController ()
@property (nonatomic,strong) UIImageView *catImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
    self.catImageView = imageView;
    
    [self onCustom];
}


- (void)onCustom{
    GPUImageFilter *filter = [[GPUImageSepiaFilter alloc]init];
    UIImage *image = [UIImage imageNamed:@"cat"];
    if (image) {
        self.catImageView.image = [filter imageByFilteringImage:image];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

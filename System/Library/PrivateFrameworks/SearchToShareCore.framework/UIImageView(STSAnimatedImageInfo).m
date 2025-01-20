@interface UIImageView(STSAnimatedImageInfo)
- (void)sts_addAnimationsForSTSAnimatedImageInfo:()STSAnimatedImageInfo;
@end

@implementation UIImageView(STSAnimatedImageInfo)

- (void)sts_addAnimationsForSTSAnimatedImageInfo:()STSAnimatedImageInfo
{
  id v4 = a3;
  v5 = [v4 frames];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    [v4 duration];
    double v8 = v7;
    if (v7 == 0.0) {
      double v9 = 0.0;
    }
    else {
      double v9 = v7 / (double)v6 / v7;
    }
    v10 = [v4 frames];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __78__UIImageView_STSAnimatedImageInfo__sts_addAnimationsForSTSAnimatedImageInfo___block_invoke;
    v16[3] = &__block_descriptor_40_e11__24__0_8Q16l;
    *(double *)&v16[4] = v9;
    v11 = objc_msgSend(v10, "sts_map:", v16);

    v12 = [MEMORY[0x263F157D8] animationWithKeyPath:@"contents"];
    [v12 setCalculationMode:*MEMORY[0x263F15968]];
    LODWORD(v13) = 2139095040;
    [v12 setRepeatCount:v13];
    v14 = [v4 frames];
    [v12 setValues:v14];

    [v12 setKeyTimes:v11];
    [v12 setDuration:v8];
    [v12 setRemovedOnCompletion:0];
    v15 = [a1 layer];
    [v15 addAnimation:v12 forKey:@"contents"];

    [MEMORY[0x263F158F8] flush];
  }
}

@end
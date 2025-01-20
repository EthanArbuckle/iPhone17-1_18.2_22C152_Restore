@interface UIView(SBHAdditions)
- (void)blurAnimationFor:()SBHAdditions duration:startRadius:endRadius:;
- (void)scaleAndBlurForDuration:()SBHAdditions initiallyHidden:visibleAlpha:completion:;
@end

@implementation UIView(SBHAdditions)

- (void)scaleAndBlurForDuration:()SBHAdditions initiallyHidden:visibleAlpha:completion:
{
  id v10 = a6;
  if (a5)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __88__UIView_SBHAdditions__scaleAndBlurForDuration_initiallyHidden_visibleAlpha_completion___block_invoke;
    v20[3] = &unk_1E6AAC810;
    v20[4] = a1;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v20];
    double v11 = 10.0;
    double v12 = 0.0;
  }
  else
  {
    double v11 = 0.0;
    double v12 = 10.0;
  }
  v13 = [a1 layer];
  [a1 blurAnimationFor:v13 duration:a2 startRadius:v11 endRadius:v12];

  v14 = (void *)MEMORY[0x1E4FB1EB0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__UIView_SBHAdditions__scaleAndBlurForDuration_initiallyHidden_visibleAlpha_completion___block_invoke_2;
  v18[3] = &unk_1E6AAED58;
  char v19 = a5;
  *(double *)&v18[5] = a3;
  v18[4] = a1;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__UIView_SBHAdditions__scaleAndBlurForDuration_initiallyHidden_visibleAlpha_completion___block_invoke_3;
  v16[3] = &unk_1E6AADF78;
  id v17 = v10;
  id v15 = v10;
  [v14 animateWithDuration:v18 animations:v16 completion:a2];
}

- (void)blurAnimationFor:()SBHAdditions duration:startRadius:endRadius:
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v9 = NSNumber;
  id v10 = a6;
  double v11 = [v9 numberWithDouble:a2];
  double v12 = [NSNumber numberWithDouble:a3];
  v13 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  [v13 setValue:@"low" forKey:*MEMORY[0x1E4F3A1A8]];
  [v13 setValue:@"low" forKey:*MEMORY[0x1E4F3A1D0]];
  [v13 setValue:v12 forKey:*MEMORY[0x1E4F3A1D8]];
  v17[0] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v10 setFilters:v14];

  [MEMORY[0x1E4F39CF8] begin];
  uint64_t v15 = [MEMORY[0x1E4F39CF8] disableActions];
  v16 = [MEMORY[0x1E4F39B48] animation];
  [v16 setKeyPath:@"filters.gaussianBlur.inputRadius"];
  [v16 setFromValue:v11];
  [v16 setToValue:v12];
  [v16 setDuration:a1];
  [v16 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v10 addAnimation:v16 forKey:@"blurAnimation"];

  [MEMORY[0x1E4F39CF8] commit];
  [MEMORY[0x1E4F39CF8] setDisableActions:v15];
}

@end
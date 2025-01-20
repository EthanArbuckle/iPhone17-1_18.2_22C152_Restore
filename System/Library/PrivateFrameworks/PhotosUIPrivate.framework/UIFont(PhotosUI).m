@interface UIFont(PhotosUI)
+ (double)pu_scaledValue:()PhotosUI usingFontOfAttributedString:;
- (id)pu_fontWithMonospacedNumbers;
@end

@implementation UIFont(PhotosUI)

- (id)pu_fontWithMonospacedNumbers
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 fontDescriptor];
  uint64_t v14 = *MEMORY[0x1E4FB0910];
  uint64_t v3 = *MEMORY[0x1E4FB0960];
  v11[0] = *MEMORY[0x1E4FB0968];
  v11[1] = v3;
  v12[0] = &unk_1F078D160;
  v12[1] = &unk_1F078D178;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v13 = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v15[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v7 = [v2 fontDescriptorByAddingAttributes:v6];

  v8 = (void *)MEMORY[0x1E4FB08E0];
  [a1 pointSize];
  v9 = objc_msgSend(v8, "fontWithDescriptor:size:", v7);

  return v9;
}

+ (double)pu_scaledValue:()PhotosUI usingFontOfAttributedString:
{
  id v5 = a4;
  v6 = v5;
  double v7 = 0.0;
  BOOL v8 = a1 == 0.0 || v5 == 0;
  if (!v8 && [v5 length])
  {
    v9 = [v6 attribute:*MEMORY[0x1E4FB06F8] atIndex:0 effectiveRange:0];
    [v9 _scaledValueForValue:a1];
    double v11 = v10;
    if (PUMainScreenScale_onceToken != -1) {
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
    }
    double v7 = round(*(double *)&PUMainScreenScale_screenScale * v11) / *(double *)&PUMainScreenScale_screenScale;
  }
  return v7;
}

@end
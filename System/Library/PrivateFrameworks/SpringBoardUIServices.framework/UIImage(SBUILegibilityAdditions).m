@interface UIImage(SBUILegibilityAdditions)
+ (id)sbui_legibilityImageForSettings:()SBUILegibilityAdditions scale:inputImage:inputSize:allowMinFillHeightHack:strength:type:pool:;
+ (id)sbui_legibilityImageForSettings:()SBUILegibilityAdditions scale:inputImage:inputSize:allowMinFillHeightHack:type:pool:;
+ (id)sbui_legibilityImageForSettings:()SBUILegibilityAdditions scale:inputImage:inputSize:type:pool:;
- (id)sbui_legibilityImageForSettings:()SBUILegibilityAdditions scale:pool:;
- (id)sbui_strikeImageForLegibilitySettings:()SBUILegibilityAdditions strength:size:type:pool:;
@end

@implementation UIImage(SBUILegibilityAdditions)

- (id)sbui_strikeImageForLegibilitySettings:()SBUILegibilityAdditions strength:size:type:pool:
{
  id v14 = a6;
  id v15 = a8;
  id v16 = a1;
  v17 = v16;
  if (a2 > 0.0)
  {
    [v16 scale];
    double v19 = v18;
    if (v14)
    {
      [v14 shadowSettings];
      uint64_t v20 = *((void *)&v32 + 1);
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v20 = 0;
    }
    v21 = (void *)MEMORY[0x1E4F42A80];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __98__UIImage_SBUILegibilityAdditions__sbui_strikeImageForLegibilitySettings_strength_size_type_pool___block_invoke;
    v24[3] = &unk_1E5CCD848;
    uint64_t v26 = v20;
    double v27 = a2;
    id v25 = v17;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    double v30 = a3;
    double v31 = a4;
    id v22 = v17;
    v17 = objc_msgSend(v21, "sbf_imageFromContextWithSize:scale:type:pool:drawing:encapsulation:", a7, v15, v24, 0, a3, a4, v19);
  }
  return v17;
}

+ (id)sbui_legibilityImageForSettings:()SBUILegibilityAdditions scale:inputImage:inputSize:allowMinFillHeightHack:strength:type:pool:
{
  id v19 = a6;
  id v20 = a7;
  id v21 = a11;
  double v22 = SBUILegibilityImageSizeForContentSizeAndSettings(v19, a2);
  double v24 = v23;
  UIRectCenteredIntegralRectScale();
  double Height = CGRectGetHeight(v61);
  objc_msgSend(v19, "minFillHeight", *(void *)&a1);
  if (Height < v26) {
    char v27 = a8;
  }
  else {
    char v27 = 0;
  }
  if (a10 == 4) {
    [MEMORY[0x1E4F428B8] whiteColor];
  }
  else {
  uint64_t v28 = [v19 shadowColor];
  }
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__1;
  v58 = __Block_byref_object_dispose__1;
  id v59 = 0;
  float v29 = v22 * 0.2;
  float v30 = v24 * 0.2;
  double v31 = (void *)MEMORY[0x1E4F42A80];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __137__UIImage_SBUILegibilityAdditions__sbui_legibilityImageForSettings_scale_inputImage_inputSize_allowMinFillHeightHack_strength_type_pool___block_invoke;
  v41[3] = &unk_1E5CCD870;
  double v47 = ceilf(v29);
  double v48 = ceilf(v30);
  double v49 = a2;
  double v50 = a3;
  double v51 = a1;
  id v32 = v28;
  id v42 = v32;
  char v53 = v27;
  id v33 = v20;
  id v43 = v33;
  id v34 = v19;
  id v44 = v34;
  v46 = &v54;
  uint64_t v52 = a10;
  id v35 = v21;
  id v45 = v35;
  id v36 = (id)objc_msgSend(v31, "sbf_imageFromContextWithSize:scale:type:pool:drawing:", a10, v35, v41, v47, v48, a1);
  if (a9)
  {
    uint64_t v37 = objc_msgSend((id)v55[5], "sbui_strikeImageForLegibilitySettings:strength:size:type:pool:", v34, a10, v35, *a9, v22, v24);
  }
  else
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __137__UIImage_SBUILegibilityAdditions__sbui_legibilityImageForSettings_scale_inputImage_inputSize_allowMinFillHeightHack_strength_type_pool___block_invoke_3;
    v40[3] = &unk_1E5CCD898;
    v40[5] = 0;
    v40[6] = 0;
    v40[4] = &v54;
    *(double *)&v40[7] = v22;
    *(double *)&v40[8] = v24;
    uint64_t v37 = objc_msgSend(MEMORY[0x1E4F42A80], "sbf_imageFromContextWithSize:scale:type:pool:drawing:", a10, v35, v40, v22, v24, a1);
  }
  v38 = (void *)v37;

  _Block_object_dispose(&v54, 8);
  return v38;
}

- (id)sbui_legibilityImageForSettings:()SBUILegibilityAdditions scale:pool:
{
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_class();
  [a1 size];
  v13 = objc_msgSend(v10, "sbui_legibilityImageForSettings:scale:inputImage:inputSize:type:pool:", v9, a1, 4, v8, a2, v11, v12);

  return v13;
}

+ (id)sbui_legibilityImageForSettings:()SBUILegibilityAdditions scale:inputImage:inputSize:type:pool:
{
  id v15 = a9;
  id v16 = a7;
  id v17 = a6;
  double v18 = objc_msgSend((id)objc_opt_class(), "sbui_legibilityImageForSettings:scale:inputImage:inputSize:allowMinFillHeightHack:type:pool:", v17, v16, 1, a8, v15, a1, a2, a3);

  return v18;
}

+ (id)sbui_legibilityImageForSettings:()SBUILegibilityAdditions scale:inputImage:inputSize:allowMinFillHeightHack:type:pool:
{
  id v17 = a10;
  id v18 = a7;
  id v19 = a6;
  id v20 = objc_msgSend((id)objc_opt_class(), "sbui_legibilityImageForSettings:scale:inputImage:inputSize:allowMinFillHeightHack:strength:type:pool:", v19, v18, a8, 0, a9, v17, a1, a2, a3);

  return v20;
}

@end
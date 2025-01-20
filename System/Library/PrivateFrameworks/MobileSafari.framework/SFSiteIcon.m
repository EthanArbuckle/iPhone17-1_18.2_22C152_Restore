@interface SFSiteIcon
@end

@implementation SFSiteIcon

id __34___SFSiteIcon_defaultIconKeyColor__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 userInterfaceStyle] == 2)
  {
    uint64_t v3 = [v2 userInterfaceLevel];
    v4 = (void *)MEMORY[0x1E4FB1618];
    if (v3 == 1) {
      double v5 = 0.294117647;
    }
    else {
      double v5 = 0.180392157;
    }
    double v8 = 1.0;
    double v6 = v5;
    double v7 = v5;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4FB1618];
    double v5 = 0.8;
    double v6 = 0.803921569;
    double v7 = 0.831372549;
    double v8 = 1.0;
  }
  v9 = [v4 colorWithRed:v5 green:v6 blue:v7 alpha:v8];

  return v9;
}

void __39___SFSiteIcon_precompositedDefaultIcon__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) defaultSize];
  double v3 = v2;
  double v5 = v4;
  double v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v2, v4);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __39___SFSiteIcon_precompositedDefaultIcon__block_invoke_2;
  aBlock[3] = &__block_descriptor_56_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&aBlock[4] = v3;
  *(double *)&aBlock[5] = v5;
  aBlock[6] = *(void *)(a1 + 32);
  double v7 = _Block_copy(aBlock);
  uint64_t v8 = [v6 imageWithActions:v7];
  v9 = (void *)precompositedDefaultIcon_icon;
  precompositedDefaultIcon_icon = v8;

  v10 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
  v11 = [MEMORY[0x1E4FB1E20] _currentTraitCollection];
  [MEMORY[0x1E4FB1E20] _setCurrentTraitCollection:v10];
  v12 = [v6 imageWithActions:v7];
  [MEMORY[0x1E4FB1E20] _setCurrentTraitCollection:v11];
  v13 = [(id)precompositedDefaultIcon_icon imageAsset];
  [v13 registerImage:v12 withTraitCollection:v10];
}

void __39___SFSiteIcon_precompositedDefaultIcon__block_invoke_2(uint64_t a1, void *a2)
{
  CGFloat v3 = *MEMORY[0x1E4F1DAD8];
  CGFloat v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  CGFloat v6 = *(double *)(a1 + 32);
  CGFloat v5 = *(double *)(a1 + 40);
  double v7 = *(void **)(a1 + 48);
  id v8 = a2;
  [v7 cornerRadius];
  CGFloat v10 = v9;
  v19.origin.x = v3;
  v19.origin.y = v4;
  v19.size.width = v6;
  v19.size.height = v5;
  v11 = CGPathCreateWithRoundedRect(v19, v10, v10, 0);
  v12 = (CGContext *)[v8 CGContext];

  CGContextAddPath(v12, v11);
  CGPathRelease(v11);
  CGContextClip(v12);
  v20.origin.x = v3;
  v20.origin.y = v4;
  v20.size.width = v6;
  v20.size.height = v5;
  UIRectFill(v20);
  v13 = [*(id *)(a1 + 48) defaultIconKeyColor];
  [v13 setFill];

  v21.origin.x = v3;
  v21.origin.y = v4;
  v21.size.width = v6;
  v21.size.height = v5;
  UIRectFillUsingBlendMode(v21, kCGBlendModeMultiply);
  id v17 = [*(id *)(a1 + 48) defaultGlyph];
  [v17 size];
  double v16 = _SFCGRectOfSizeAlignedWithinRect(0, 0, v14, v15, v3, v4, v6, v5);
  [v17 drawInRect:_SFRoundRectToPixels(v16)];
}

@end
@interface UIKBRenderFactoryiPad10Key_Portrait
- (CGPoint)abcKeyTextOffset;
- (CGPoint)dictationKeyTextOffset;
- (CGPoint)globeKeyTextOffset;
- (CGPoint)numberPadKeyPrimaryTextOffset;
- (CGPoint)numberPadKeySecondaryTextOffset;
- (CGPoint)numberPadVBarSecondaryTextOffset;
- (UIEdgeInsets)topEdgeAdjustmentInsets;
- (UIEdgeInsets)wideShadowPaddleInsets;
- (double)controlColumnWidthFactor;
- (double)keyCornerRadius;
- (double)numberPadKeyPrimarySymbolSize;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)backgroundTraitsForKeyplane:(id)a3;
- (id)messagesWriteboardKeyImageName;
- (id)multitapCompleteKeyImageName;
- (id)muttitapReverseKeyImageName;
- (int64_t)assetIdiom;
- (unint64_t)edgesAdjustedForTranslucentGapsForGeometry:(id)a3 key:(id)a4 onKeyplane:(id)a5;
- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6;
- (void)setupLayoutSegments;
@end

@implementation UIKBRenderFactoryiPad10Key_Portrait

- (int64_t)assetIdiom
{
  return 1;
}

- (CGPoint)globeKeyTextOffset
{
  double v2 = 0.0;
  double v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationKeyTextOffset
{
  double v2 = 0.0;
  double v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (UIEdgeInsets)wideShadowPaddleInsets
{
  double v2 = 18.0;
  double v3 = 6.0;
  double v4 = 22.0;
  double v5 = 6.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGPoint)abcKeyTextOffset
{
  double v2 = 0.0;
  double v3 = 0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)numberPadKeyPrimarySymbolSize
{
  return 18.5;
}

- (CGPoint)numberPadKeyPrimaryTextOffset
{
  double v2 = 0.0;
  double v3 = -7.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)numberPadKeySecondaryTextOffset
{
  double v2 = 1.0;
  double v3 = 9.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)numberPadVBarSecondaryTextOffset
{
  [(UIKBRenderFactory *)self scale];
  double v2 = 9.5;
  if (v3 != 2.0) {
    double v2 = 10.0;
  }
  double v4 = 1.0;
  result.y = v2;
  result.x = v4;
  return result;
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (id)multitapCompleteKeyImageName
{
  [(UIKBRenderFactory *)self RivenFactor:1.0];
  if (v2 <= 1.0) {
    double v3 = @"kana_multitap_complete_arrow.png";
  }
  else {
    double v3 = @"kana_multitap_complete_arrow-163r.png";
  }
  return v3;
}

- (id)muttitapReverseKeyImageName
{
  [(UIKBRenderFactory *)self RivenFactor:1.0];
  if (v2 <= 1.0) {
    double v3 = @"kana_multitap_reverse_arrow.png";
  }
  else {
    double v3 = @"kana_multitap_reverse_arrow-163r.png";
  }
  return v3;
}

- (id)messagesWriteboardKeyImageName
{
  return @"messages_writeboard_portrait.png";
}

- (double)controlColumnWidthFactor
{
  return 0.081;
}

- (void)setupLayoutSegments
{
  [(UIKBRenderFactoryiPad10Key_Portrait *)self controlColumnWidthFactor];
  [(UIKBRenderFactory10Key *)self setupColumnLayoutSegmentsWithControlWidth:"setupColumnLayoutSegmentsWithControlWidth:"];
}

- (UIEdgeInsets)topEdgeAdjustmentInsets
{
  [(UIKBRenderFactory *)self translucentGapWidth];
  double v3 = v2;
  double v4 = -v2;
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v3;
  result.left = v5;
  result.top = v4;
  return result;
}

- (unint64_t)edgesAdjustedForTranslucentGapsForGeometry:(id)a3 key:(id)a4 onKeyplane:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v48.receiver = self;
  v48.super_class = (Class)UIKBRenderFactoryiPad10Key_Portrait;
  id v11 = [(UIKBRenderFactory10Key *)&v48 edgesAdjustedForTranslucentGapsForGeometry:v8 key:v9 onKeyplane:v10];
  [(UIKBRenderFactory *)self RivenFactor:1.0];
  if (v12 > 1.0)
  {
    [v9 frame];
    double v14 = v13;
    [(UIKBRenderFactory *)self RivenFactor:1.0];
    if (v14 <= v15)
    {
      [v9 frame];
      double v16 = 1.0 - v18;
      if ([v10 isSplit])
      {
        [(UIKBRenderFactory *)self translucentGapWidth];
        double v16 = v16 + v19;
      }
      if ([v10 isSplit])
      {
        [(UIKBRenderFactory *)self stretchFactor];
        if (v20 != 1.0) {
          [(UIKBRenderFactory *)self translucentGapWidth];
        }
      }
    }
    else
    {
      double v16 = -1.0;
      if ([v10 isSplit])
      {
        [(UIKBRenderFactory *)self translucentGapWidth];
        double v16 = -v17;
      }
    }
    [v8 paddedFrame];
    objc_msgSend(v8, "setPaddedFrame:", v21 + 0.0, v16 + v22);
    [v8 displayFrame];
    objc_msgSend(v8, "setDisplayFrame:", v23 + 0.0, v16 + v24);
  }
  [(UIKBRenderFactory *)self RivenFactor:1.0];
  if (v25 > 1.0)
  {
    [v9 frame];
    double v27 = v26;
    [v10 frameForKeylayoutName:@"split-right"];
    if (v27 == v28)
    {
      [v8 paddedFrame];
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      [(UIKBRenderFactory *)self translucentGapWidth];
      objc_msgSend(v8, "setPaddedFrame:", v37 + v30, v32 + 0.0, v34 - (v37 + 0.0), v36);
      [v8 displayFrame];
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      [(UIKBRenderFactory *)self translucentGapWidth];
      objc_msgSend(v8, "setDisplayFrame:", v46 + v39, v41 + 0.0, v43 - (v46 + 0.0), v45);
    }
  }

  return (unint64_t)v11;
}

- (id)backgroundTraitsForKeyplane:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UIKBRenderFactoryiPad10Key_Portrait;
  double v5 = [(UIKBRenderFactory *)&v13 backgroundTraitsForKeyplane:v4];
  if (([v4 visualStyling] & 0x80) != 0)
  {
    double v6 = (void *)MEMORY[0x1E4F29238];
    [v4 frameForKeylayoutName:@"split-left"];
    v7 = objc_msgSend(v6, "valueWithCGRect:");
    id v8 = [v5 geometry];
    [v8 setSplitLeftRect:v7];

    id v9 = (void *)MEMORY[0x1E4F29238];
    [v4 frameForKeylayoutName:@"split-right"];
    id v10 = objc_msgSend(v9, "valueWithCGRect:");
    id v11 = [v5 geometry];
    [v11 setSplitRightRect:v10];
  }
  return v5;
}

- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6
{
  id v30 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  [v30 removeAllRenderEffects];
  objc_super v13 = +[UIKBTextStyle styleWithFontName:v11 withFontSize:22.0];

  [v30 setSymbolStyle:v13];
  double v14 = [v12 renderConfig];

  int v15 = [v14 lightKeyboard];
  double v16 = UIKBColorBlack;
  if (!v15) {
    double v16 = UIKBColorWhite;
  }
  double v17 = *v16;
  double v18 = [v30 symbolStyle];
  [v18 setTextColor:v17];

  if ([v10 displayType] == 13)
  {
    double v19 = [v30 symbolStyle];
    objc_msgSend(v19, "setTextOffset:", 0.0, -1.0);

    double v20 = [v30 symbolStyle];
    [v20 setUsesSymbolImage:1];

    [(UIKBRenderFactory10Key *)self symbolImageControlKeyFontSize];
    double v22 = v21;
    double v23 = [v30 symbolStyle];
    [v23 setFontSizeForSymbolImage:v22];
  }
  if ([v10 displayType] == 4 || objc_msgSend(v10, "displayType") == 5)
  {
    double v24 = [v30 symbolStyle];
    [v24 setUsesSymbolImage:1];

    [(UIKBRenderFactory10Key *)self symbolImageControlKeyFontSize];
    double v26 = v25;
    double v27 = [v30 symbolStyle];
    [v27 setFontSizeForSymbolImage:v26];
  }
  double v28 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
  double v29 = +[UIKBGradient gradientWithFlatColor:v28];
  [v30 setBackgroundGradient:v29];

  [(UIKBRenderFactory10Key *)self modifyTraitsForDetachedInputSwitcher:v30 withKey:v10];
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)UIKBRenderFactoryiPad10Key_Portrait;
  id v8 = [(UIKBRenderFactory10Key *)&v36 _traitsForKey:v6 onKeyplane:v7];
  if ([v6 displayType] == 35)
  {
    [(UIKBRenderFactory *)self translucentGapWidth];
    double v10 = v9;
    id v11 = [v8 geometry];
    [v11 symbolFrame];
    double v13 = v12;
    double v14 = -2.0 - v10;
    double v15 = v10 + -2.0;
    double v17 = v10 + -2.0 + v16;
    double v19 = v18 - (v14 + v15);
    double v21 = v20 + 0.0;
    double v22 = [v8 geometry];
    objc_msgSend(v22, "setSymbolFrame:", v17, v21, v19, v13);

LABEL_5:
    goto LABEL_6;
  }
  if ([v6 displayType] == 1)
  {
    id v11 = [v8 geometry];
    [v11 frame];
    objc_msgSend(v11, "setFrame:", v23 + 0.0, v24 + 0.0, v25 + -0.5);
    [v11 paddedFrame];
    objc_msgSend(v11, "setPaddedFrame:", v26 + 0.0, v27 + 0.0, v28 + -0.5);
    [v11 displayFrame];
    objc_msgSend(v11, "setDisplayFrame:", v29 + 0.0, v30 + 0.0, v31 + -0.5);
    goto LABEL_5;
  }
  if (([v7 visualStyling] & 0x80) != 0 && objc_msgSend(v6, "state") == 20)
  {
    double v33 = [v8 variantTraits];
    uint64_t v34 = [v33 symbolStyle];
    [(id)v34 setFontSize:27.0];

    double v35 = [(UIKBRenderFactory *)self renderConfig];
    LOBYTE(v34) = [v35 lightKeyboard];

    if ((v34 & 1) == 0)
    {
      id v11 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorClear"];
      [v8 setBackgroundGradient:v11];
      goto LABEL_5;
    }
  }
LABEL_6:
  [(UIKBRenderFactory *)self scaleTraits:v8];

  return v8;
}

@end
@interface UIKBRenderFactoryiPadSplit
- (BOOL)supportsInputTraits:(id)a3 forKeyplane:(id)a4;
- (CGPoint)deleteKeyOffset;
- (CGPoint)dismissKeyOffset;
- (CGPoint)internationalKeyOffset;
- (CGPoint)shiftKeyOffset;
- (CGPoint)variantAnnotationTextOffset;
- (UIEdgeInsets)dynamicInsets;
- (double)_row4ControlSegmentWidthLeft;
- (double)defaultPathWeight;
- (double)dynamicBottomRowMultiplier;
- (double)keyCornerRadius;
- (double)keyInsetBottom;
- (double)skinnyKeyThreshold;
- (double)symbolFrameInset;
- (double)symbolImageControlKeyFontSize;
- (double)variantAnnotationTextFontSize;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)backgroundTraitsForKeyplane:(id)a3;
- (id)multitapCompleteKeyImageName;
- (id)muttitapReverseKeyImageName;
- (id)variantGeometriesForGeometry:(id)a3 variantCount:(unint64_t)a4 rowLimit:(int64_t)a5 annotationIndex:(unint64_t)a6;
- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5;
- (void)_customizeSymbolStyle:(id)a3 forKey:(id)a4 contents:(id)a5;
- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6;
@end

@implementation UIKBRenderFactoryiPadSplit

- (CGPoint)internationalKeyOffset
{
  [(UIKBRenderFactory *)self scale];
  BOOL v3 = v2 == 2.0;
  double v4 = 0.0;
  if (v3) {
    double v4 = -0.5;
  }
  double v5 = v4;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)dismissKeyOffset
{
  [(UIKBRenderFactory *)self scale];
  BOOL v3 = v2 == 2.0;
  double v4 = 0.0;
  if (v3) {
    double v4 = -0.5;
  }
  double v5 = v4;
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)deleteKeyOffset
{
  [(UIKBRenderFactory *)self scale];
  double v2 = -1.5;
  if (v3 != 2.0) {
    double v2 = -1.0;
  }
  double v4 = 0.0;
  result.y = v2;
  result.x = v4;
  return result;
}

- (CGPoint)shiftKeyOffset
{
  [(UIKBRenderFactory *)self scale];
  double v2 = -2.5;
  if (v3 != 2.0) {
    double v2 = -2.0;
  }
  double v4 = 0.0;
  result.y = v2;
  result.x = v4;
  return result;
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

- (double)keyCornerRadius
{
  return 5.0;
}

- (double)symbolImageControlKeyFontSize
{
  return 20.0;
}

- (double)skinnyKeyThreshold
{
  return -1.0;
}

- (CGPoint)variantAnnotationTextOffset
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)variantAnnotationTextFontSize
{
  return 8.0;
}

- (UIEdgeInsets)dynamicInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 6.0;
  double v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)dynamicBottomRowMultiplier
{
  return 0.9;
}

- (BOOL)supportsInputTraits:(id)a3 forKeyplane:(id)a4
{
  return 0;
}

- (id)backgroundTraitsForKeyplane:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)UIKBRenderFactoryiPadSplit;
  id v3 = a3;
  double v4 = [(UIKBRenderFactory *)&v20 backgroundTraitsForKeyplane:v3];
  double v5 = (void *)MEMORY[0x1E4F29238];
  objc_msgSend(v3, "frameForKeylayoutName:", @"split-left", v20.receiver, v20.super_class);
  v6 = objc_msgSend(v5, "valueWithCGRect:");
  v7 = [v4 geometry];
  [v7 setSplitLeftRect:v6];

  v8 = (void *)MEMORY[0x1E4F29238];
  [v3 frameForKeylayoutName:@"split-right"];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  v17 = objc_msgSend(v8, "valueWithCGRect:", v10, v12, v14, v16);
  v18 = [v4 geometry];
  [v18 setSplitRightRect:v17];

  return v4;
}

- (double)defaultPathWeight
{
  return 1.0;
}

- (double)symbolFrameInset
{
  return 6.0;
}

- (double)keyInsetBottom
{
  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactoryiPadSplit;
  [(UIKBRenderFactoryiPad *)&v4 keyInsetBottom];
  -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
  return result;
}

- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)UIKBRenderFactoryiPadSplit;
  [(UIKBRenderFactoryiPad *)&v17 _customizeTraits:v10 forPopupForKey:v11 withRenderingContext:a5 keycapsFontName:a6];
  if ([v11 displayType] == 13)
  {
    [(UIKBRenderFactoryiPadSplit *)self internationalKeyOffset];
LABEL_10:
    double v14 = v12;
    double v15 = v13;
    double v16 = [v10 symbolStyle];
    objc_msgSend(v16, "setTextOffset:", v14, v15);

    goto LABEL_11;
  }
  if ([v11 displayType] == 5)
  {
    [(UIKBRenderFactoryiPadSplit *)self dismissKeyOffset];
    goto LABEL_10;
  }
  if ([v11 displayType] == 3)
  {
    [(UIKBRenderFactoryiPadSplit *)self deleteKeyOffset];
    goto LABEL_10;
  }
  if ([v11 displayType] == 23 || objc_msgSend(v11, "interactionType") == 14)
  {
    [(UIKBRenderFactoryiPadSplit *)self shiftKeyOffset];
    goto LABEL_10;
  }
LABEL_11:
}

- (double)_row4ControlSegmentWidthLeft
{
  return 0.25;
}

- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5
{
  id v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UIKBRenderFactoryiPadSplit;
  id v9 = a4;
  [(UIKBRenderFactoryiPad *)&v20 _customizeGeometry:v8 forKey:v9 contents:a5];
  LODWORD(a5) = objc_msgSend(v9, "displayType", v20.receiver, v20.super_class);

  if (a5 == 2)
  {
    [v8 symbolFrame];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [(UIKBRenderFactoryiPadSplit *)self symbolFrameInset];
    CGFloat v19 = v18;
    v21.origin.x = v11;
    v21.origin.y = v13;
    v21.size.width = v15;
    v21.size.height = v17;
    CGRect v22 = CGRectInset(v21, v19, 0.0);
    objc_msgSend(v8, "setSymbolFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
  }
}

- (id)variantGeometriesForGeometry:(id)a3 variantCount:(unint64_t)a4 rowLimit:(int64_t)a5 annotationIndex:(unint64_t)a6
{
  id v9 = (void *)[a3 copy];
  [v9 paddedInsets];
  double v43 = v10;
  double v44 = v11;
  double v41 = v12;
  double v42 = v13;
  [(UIKBRenderFactory *)self RivenFactor:50.0];
  double v15 = v14;
  [(UIKBRenderFactory *)self RivenFactor:54.0];
  double v17 = v16;
  [v9 frame];
  double v19 = v18;
  double v21 = v20;
  [v9 frame];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  [(UIKBRenderFactory *)self scale];
  UIRectCenteredXInRectScale(v19, v21, v15, v17, v23, v25, v27, v29, v30);
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  objc_msgSend(v9, "setFrame:");
  objc_msgSend(v9, "setPaddedFrame:", v41 + v32, v43 + v34, v36 - (v41 + v42), v38 - (v43 + v44));
  [v9 paddedFrame];
  objc_msgSend(v9, "setSymbolFrame:");
  v39 = [v9 iPadVariantGeometries:a4 rowLimit:a5];

  return v39;
}

- (void)_customizeSymbolStyle:(id)a3 forKey:(id)a4 contents:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIKBRenderFactoryiPadSplit;
  [(UIKBRenderFactoryiPad *)&v11 _customizeSymbolStyle:v8 forKey:v9 contents:a5];
  [v8 setFontSize:18.0];
  if ([v9 displayType] == 23)
  {
    [(UIKBRenderFactory *)self RivenFactor:1.0];
LABEL_3:
    double v10 = 16.0;
LABEL_6:
    [v8 setFontSize:v10];
    goto LABEL_14;
  }
  if ([v9 displayType] == 3)
  {
    double v10 = 15.0;
    goto LABEL_6;
  }
  if ([v9 displayType] == 13)
  {
    [(UIKBRenderFactoryiPadSplit *)self internationalKeyOffset];
LABEL_13:
    objc_msgSend(v8, "setTextOffset:");
    goto LABEL_14;
  }
  if ([v9 displayType] == 4)
  {
    [(UIKBRenderFactoryiPad *)self dictationKeyOffset];
    goto LABEL_13;
  }
  if ([v9 displayType] == 5)
  {
    [(UIKBRenderFactoryiPadSplit *)self dismissKeyOffset];
    goto LABEL_13;
  }
  if ([v9 displayType] == 21 || objc_msgSend(v9, "displayType") == 18) {
    goto LABEL_3;
  }
LABEL_14:
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UIKBRenderFactoryiPadSplit;
  v7 = [(UIKBRenderFactoryiPad *)&v19 _traitsForKey:v6 onKeyplane:a4];
  id v8 = [v6 displayString];
  int v9 = [v8 isEqualToString:@",!"];

  if (v9)
  {
    double v10 = [v7 symbolStyle];
    [v10 textOffset];
    double v12 = v11;
    double v14 = v13;

    double v15 = [v7 symbolStyle];
    objc_msgSend(v15, "setTextOffset:", v12 + 1.0, v14);
  }
  [(UIKBRenderFactory *)self scaleTraits:v7];
  if ([(UIKBRenderFactoryiPhone *)self _shouldConfigureSecondarySymbolStyleForSpaceKey:v6])
  {
    double v16 = [v7 secondarySymbolStyles];
    double v17 = [v16 firstObject];

    [v17 setFontSize:11.0];
    objc_msgSend(v17, "setTextOffset:", 8.0, 8.0);
  }
  return v7;
}

@end
@interface UIKBRenderFactoryiPad
- (BOOL)_onLeftSide:(id)a3 onKeyplane:(id)a4;
- (BOOL)iPadFudgeLayout;
- (BOOL)iPadSansHomeButtonLayout;
- (BOOL)shouldClearBaseDisplayStringForVariants:(id)a3;
- (BOOL)supportsInputTraits:(id)a3 forKeyplane:(id)a4;
- (CGPoint)ZWNJKeyOffset;
- (CGPoint)deleteKeyOffset;
- (CGPoint)dictationKeyOffset;
- (CGPoint)dismissKeyOffset;
- (CGPoint)dualStringKeyOffset;
- (CGPoint)internationalKeyOffset;
- (CGPoint)returnKeyOffset;
- (CGPoint)shiftKeyOffset;
- (CGPoint)stringKeyOffset;
- (CGPoint)symbolImageControlKeyOffset;
- (CGPoint)tinyPunctuationGlyphOffset;
- (CGPoint)variantAnnotationTextOffset;
- (CGRect)dismissKeySymbolFrame;
- (CGRect)insetFrame:(CGRect)a3 forKey:(id)a4;
- (CGRect)shiftKeySymbolFrame;
- (CGSize)defaultVariantGeometrySize;
- (UIEdgeInsets)variantDisplayFrameInsets;
- (UIEdgeInsets)variantPaddedFrameInsets;
- (UIEdgeInsets)variantSymbolFrameInsets;
- (UIEdgeInsets)wideShadowPaddleInsets;
- (double)_row4ControlSegmentWidthLeft;
- (double)_row4ControlSegmentWidthRight;
- (double)bottomRowDefaultFontSize;
- (double)cornerRadiusForKey:(id)a3;
- (double)defaultPathWeight;
- (double)deleteKeyFontSize;
- (double)dictationKeyFontSize;
- (double)dismissKeyFontSize;
- (double)dualStringKeyFontSizeAdjustment;
- (double)emailDotKeyFontSize;
- (double)facemarkKeyFontSize;
- (double)fallbackFontSize;
- (double)fontSizeAdjustmentForNonAlphanumericKeycaps;
- (double)internationalKeyFontSize;
- (double)keyCornerRadius;
- (double)keyInsetBottom;
- (double)messagesTypeKeyplanSwitchKeyFontSize;
- (double)moreKeyFontSize;
- (double)predictiveKeyCornerRadius;
- (double)returnKeySymbolFrameInset;
- (double)shiftKeyFontSize;
- (double)skinnyKeyThreshold;
- (double)smallKanaKeyFontSize;
- (double)spaceKeyFontSize;
- (double)stringKeyFontSize;
- (double)symbolFrameInset;
- (double)symbolImageControlKeyFontSize;
- (double)tinyPunctuationGlyphFontSize;
- (double)zhuyinFirstToneKeyFontSize;
- (id)ZWNJKeyImageName;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)capslockKeyImageName;
- (id)displayContentsForKey:(id)a3;
- (id)lowQualityLayeredBackgroundColorName;
- (id)messagesWriteboardKeyImageName;
- (id)multitapCompleteKeyImageName;
- (id)muttitapReverseKeyImageName;
- (id)returnKeyImageName;
- (id)tabKeyImageName;
- (id)variantGeometriesForGeometry:(id)a3 variantCount:(unint64_t)a4 rowLimit:(int64_t)a5 annotationIndex:(unint64_t)a6;
- (int64_t)assetIdiom;
- (int64_t)rowLimitForKey:(id)a3;
- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5;
- (void)_customizePopupTraits:(id)a3 forKey:(id)a4 onKeyplane:(id)a5;
- (void)_customizeSymbolStyle:(id)a3 forKey:(id)a4 contents:(id)a5;
- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6;
- (void)setAllowsPaddles:(BOOL)a3;
- (void)setupLayoutSegments;
@end

@implementation UIKBRenderFactoryiPad

- (int64_t)assetIdiom
{
  return 1;
}

- (void)setAllowsPaddles:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UIKBRenderFactoryiPad;
  [(UIKBRenderFactory *)&v3 setAllowsPaddles:1];
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (CGRect)shiftKeySymbolFrame
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 20.0;
  double v5 = 18.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)dismissKeySymbolFrame
{
  double v2 = 62.0;
  double v3 = 60.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (double)symbolFrameInset
{
  return 12.0;
}

- (double)returnKeySymbolFrameInset
{
  return 6.0;
}

- (double)keyInsetBottom
{
  return 4.0;
}

- (CGPoint)internationalKeyOffset
{
  double v2 = 0.0;
  double v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationKeyOffset
{
  double v2 = 0.0;
  double v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)deleteKeyOffset
{
  double v2 = 0.0;
  double v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)shiftKeyOffset
{
  double v2 = 0.0;
  double v3 = -2.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)returnKeyOffset
{
  [(UIKBRenderFactory *)self scale];
  BOOL v3 = v2 == 2.0;
  double v4 = 0.0;
  if (!v3) {
    double v4 = *MEMORY[0x1E4F1DAD8];
  }
  double v5 = -0.5;
  if (!v3) {
    double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)symbolImageControlKeyOffset
{
  double v2 = 0.0;
  double v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)ZWNJKeyOffset
{
  double v2 = 0.0;
  double v3 = -1.0;
  result.y = v3;
  result.x = v2;
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

- (id)messagesWriteboardKeyImageName
{
  return @"messages_writeboard_portrait.png";
}

- (id)ZWNJKeyImageName
{
  return @"ZWNJ_portrait.png";
}

- (id)capslockKeyImageName
{
  return @"capslock";
}

- (id)tabKeyImageName
{
  return @"arrow.right.to.line";
}

- (id)returnKeyImageName
{
  return @"return";
}

- (double)skinnyKeyThreshold
{
  return -1.0;
}

- (double)predictiveKeyCornerRadius
{
  return 4.0;
}

- (BOOL)iPadFudgeLayout
{
  return 0;
}

- (BOOL)iPadSansHomeButtonLayout
{
  return 0;
}

- (UIEdgeInsets)wideShadowPaddleInsets
{
  double v2 = 15.0;
  double v3 = 5.0;
  double v4 = 0.0;
  double v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)variantPaddedFrameInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)variantDisplayFrameInsets
{
  double v2 = -40.0;
  double v3 = -40.0;
  double v4 = -40.0;
  double v5 = -40.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)variantSymbolFrameInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGPoint)variantAnnotationTextOffset
{
  double v2 = 6.0;
  double v3 = 6.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)_onLeftSide:(id)a3 onKeyplane:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if ([v6 dynamicLayout])
  {
    uint64_t v7 = [v6 dynamicDisplayCorner];

    BOOL v8 = v7 != 8;
  }
  else
  {
    [v6 frame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    v19.origin.x = v10;
    v19.origin.y = v12;
    v19.size.width = v14;
    v19.size.height = v16;
    double MidX = CGRectGetMidX(v19);
    [v5 frame];
    BOOL v8 = MidX < CGRectGetMidX(v20);
  }

  return v8;
}

- (BOOL)supportsInputTraits:(id)a3 forKeyplane:(id)a4
{
  id v5 = a4;
  if ([a3 keyboardType] != 12)
  {
    id v6 = +[UIKeyboardPreferencesController sharedPreferencesController];
    uint64_t v7 = [v6 preferencesActions];
    int v8 = [v7 BOOLForPreferenceKey:@"GesturesEnabled"];

    if (!v8) {
      goto LABEL_5;
    }
  }
  double v9 = [v5 firstCachedKeyWithName:@"International-Key"];
  int v10 = [v9 displayRowHint];

  if (v10 == 5) {
    BOOL v11 = 0;
  }
  else {
LABEL_5:
  }
    BOOL v11 = 1;

  return v11;
}

- (double)cornerRadiusForKey:(id)a3
{
  id v4 = a3;
  int v5 = [v4 displayType];
  if (v5 == 48)
  {
    uint64_t v7 = [v4 name];
    double v8 = 0.0;
    if ([v7 isEqualToString:@"SelectionBackground"])
    {
      [(UIKBRenderFactoryiPad *)self predictiveKeyCornerRadius];
      double v8 = v9;
    }
  }
  else
  {
    if (v5 == 47) {
      [(UIKBRenderFactoryiPad *)self predictiveKeyCornerRadius];
    }
    else {
      [(UIKBRenderFactoryiPad *)self keyCornerRadius];
    }
    double v8 = v6;
  }

  return v8;
}

- (CGRect)insetFrame:(CGRect)a3 forKey:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([a4 displayType] != 48)
  {
    [(UIKBRenderFactoryiPad *)self keyInsetBottom];
    double x = x + 3.0;
    double width = width + -6.0;
    double y = y + 1.0;
    double height = height - (v9 + 1.0);
  }
  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (id)displayContentsForKey:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)UIKBRenderFactoryiPad;
  int v5 = [(UIKBRenderFactory *)&v27 displayContentsForKey:v4];
  if ([v4 interactionType] == 17)
  {
    [v5 setStringKeycapOverImage:1];
    uint64_t v6 = [(UIKBRenderFactory *)self undoKeyImageName];
LABEL_19:
    CGRect v19 = (void *)v6;
    [v5 setDisplayStringImage:v6];

LABEL_20:
    objc_msgSend(v5, "setFlipImageHorizontally:", -[UIKBRenderFactory keyIsRightToLeftSensitive:](self, "keyIsRightToLeftSensitive:", v4));
    goto LABEL_21;
  }
  if ([v4 interactionType] == 12)
  {
    [v5 setStringKeycapOverImage:1];
    uint64_t v6 = [(UIKBRenderFactory *)self redoKeyImageName];
    goto LABEL_19;
  }
  if ([v4 interactionType] == 37)
  {
    uint64_t v7 = [v4 overrideDisplayString];
    if (v7)
    {
      [v5 setDisplayString:v7];
    }
    else
    {
      v18 = [v4 displayString];
      [v5 setDisplayString:v18];
    }
    uint64_t v6 = [(UIKBRenderFactoryiPad *)self tabKeyImageName];
    goto LABEL_19;
  }
  if ([v4 interactionType] == 13)
  {
    uint64_t v8 = [v4 overrideDisplayString];
    if (!v8) {
      goto LABEL_11;
    }
    double v9 = (void *)v8;
    double v10 = [v4 overrideDisplayString];
    double v11 = [v4 displayString];
    char v12 = [v10 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      [v5 setDisplayStringImage:0];
    }
    else
    {
LABEL_11:
      uint64_t v13 = [v5 displayString];
      if (v13)
      {
        CGFloat v14 = (void *)v13;
        char v15 = [v5 forceImageKeycap];

        if ((v15 & 1) == 0)
        {
          CGFloat v16 = [(UIKBRenderFactoryiPad *)self returnKeyImageName];
          [v5 setDisplayStringImage:v16];
        }
      }
    }
    if (![v5 forceImageKeycap]
      || ([v5 displayStringImage],
          v21 = objc_claimAutoreleasedReturnValue(),
          v21,
          !v21))
    {
      v22 = [v4 overrideDisplayString];
      if (v22)
      {
        [v5 setDisplayString:v22];
      }
      else
      {
        v23 = [v4 displayString];
        [v5 setDisplayString:v23];
      }
    }
    BOOL v24 = ([v5 forceImageKeycap] & 1) == 0
       && [(UIKBRenderFactory *)self preferStringKeycapOverImage];
    [v5 setStringKeycapOverImage:v24];
    goto LABEL_20;
  }
  if ([v4 interactionType] == 38)
  {
    v17 = [v4 overrideDisplayString];
    if (v17)
    {
      [v5 setDisplayString:v17];
    }
    else
    {
      v25 = [v4 displayString];
      [v5 setDisplayString:v25];
    }
    if ([v4 state] < 3) {
      [(UIKBRenderFactoryiPad *)self capslockKeyImageName];
    }
    else {
    v26 = [(UIKBRenderFactory *)self shiftLockImageName];
    }
    [v5 setDisplayStringImage:v26];
  }
LABEL_21:

  return v5;
}

- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5
{
  id v43 = a3;
  id v7 = a4;
  [(UIKBRenderFactoryiPad *)self cornerRadiusForKey:v7];
  objc_msgSend(v43, "setRoundRectRadius:");
  [v43 paddedFrame];
  -[UIKBRenderFactoryiPad insetFrame:forKey:](self, "insetFrame:forKey:", v7);
  objc_msgSend(v43, "setPaddedFrame:");
  [(UIKBRenderFactoryiPad *)self symbolFrameInset];
  double v9 = v8;
  int v10 = [v7 displayType];

  if (v10 <= 13)
  {
    if (v10 == 3)
    {
LABEL_10:
      [v43 symbolFrame];
      CGFloat v26 = 0.0;
      CGFloat v27 = v9;
LABEL_16:
      *(CGRect *)&double v18 = CGRectInset(*(CGRect *)&v22, v27, v26);
      double v13 = v41;
      double v15 = v42;
    }
    else
    {
      if (v10 != 5) {
        goto LABEL_18;
      }
      [(UIKBRenderFactoryiPad *)self dismissKeySymbolFrame];
      double v13 = v12;
      double v15 = v14;
      [v43 symbolFrame];
      double v18 = round(v17 + (v16 - v13) * 0.5);
      double v21 = round(v20 + (v19 - v15) * 0.5);
    }
    objc_msgSend(v43, "setSymbolFrame:", v18, v21, v13, v15);
  }
  else
  {
    switch(v10)
    {
      case 14:
        goto LABEL_10;
      case 15:
      case 16:
      case 17:
      case 19:
      case 20:
      case 22:
        break;
      case 18:
        [(UIKBRenderFactory *)self rivenSizeFactor];
        if (v11 > 1.0) {
          double v9 = 4.0;
        }
        goto LABEL_10;
      case 21:
        [(UIKBRenderFactoryiPad *)self returnKeySymbolFrameInset];
        double v29 = v28;
        [v43 symbolFrame];
        if (v24 - v29 > v25) {
          CGFloat v27 = v29;
        }
        else {
          CGFloat v27 = v29 * 0.5;
        }
        CGFloat v26 = 0.0;
        goto LABEL_16;
      case 23:
        [(UIKBRenderFactoryiPad *)self shiftKeySymbolFrame];
        double v31 = v30;
        [(UIKBRenderFactory *)self RivenFactor:v32];
        double v34 = v33;
        [(UIKBRenderFactory *)self RivenFactor:v31];
        double v36 = v35;
        [v43 symbolFrame];
        objc_msgSend(v43, "setSymbolFrame:", round(v38 + (v37 - v34) * 0.5), round(v40 + (v39 - v36) * 0.5), v34, v36);
        [v43 symbolFrame];
        CGFloat v27 = -5.0;
        CGFloat v26 = -5.0;
        goto LABEL_16;
      default:
        if (v10 == 54) {
          goto LABEL_10;
        }
        break;
    }
  }
LABEL_18:
}

- (double)stringKeyFontSize
{
  return 22.0;
}

- (CGPoint)stringKeyOffset
{
  [(UIKBRenderFactory *)self scale];
  BOOL v3 = v2 == 2.0;
  double v4 = 0.0;
  if (!v3) {
    double v4 = *MEMORY[0x1E4F1DAD8];
  }
  double v5 = 0.5;
  if (!v3) {
    double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (double)dualStringKeyFontSizeAdjustment
{
  return -2.0;
}

- (double)bottomRowDefaultFontSize
{
  return 19.0;
}

- (double)fontSizeAdjustmentForNonAlphanumericKeycaps
{
  return 4.0;
}

- (double)defaultPathWeight
{
  return 1.5;
}

- (double)shiftKeyFontSize
{
  return 18.0;
}

- (double)deleteKeyFontSize
{
  return 17.0;
}

- (double)moreKeyFontSize
{
  return 16.0;
}

- (double)internationalKeyFontSize
{
  return 30.0;
}

- (double)dictationKeyFontSize
{
  return 19.0;
}

- (double)spaceKeyFontSize
{
  return 18.0;
}

- (double)dismissKeyFontSize
{
  return 37.0;
}

- (double)smallKanaKeyFontSize
{
  return 15.0;
}

- (double)emailDotKeyFontSize
{
  return 12.0;
}

- (double)facemarkKeyFontSize
{
  return 22.0;
}

- (double)zhuyinFirstToneKeyFontSize
{
  return 18.0;
}

- (double)symbolImageControlKeyFontSize
{
  return 24.0;
}

- (double)fallbackFontSize
{
  return 22.0;
}

- (double)messagesTypeKeyplanSwitchKeyFontSize
{
  return 16.0;
}

- (double)tinyPunctuationGlyphFontSize
{
  return 40.0;
}

- (CGPoint)tinyPunctuationGlyphOffset
{
  double v2 = 0.0;
  double v3 = -2.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)dualStringKeyOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)dismissKeyOffset
{
  double v2 = 0.0;
  double v3 = -1.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (id)lowQualityLayeredBackgroundColorName
{
  double v2 = [(UIKBRenderFactory *)self renderConfig];
  int v3 = [v2 lightKeyboard];
  double v4 = UIKBColorGray_Percent55;
  if (!v3) {
    double v4 = UIKBColorBlack;
  }
  double v5 = *v4;

  return v5;
}

- (void)_customizeSymbolStyle:(id)a3 forKey:(id)a4 contents:(id)a5
{
  id v86 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [v8 displayType];
  double v11 = (void *)[v8 interactionType];
  int v12 = [v8 displayTypeHint];
  BOOL v13 = (v10 & 0xFFFFFFF7) == 0 || v10 == 27;
  int v15 = v13 || v10 == 7;
  if (v15 == 1 && v11 != 9 && v12 != 10)
  {
    [(UIKBRenderFactoryiPad *)self stringKeyFontSize];
    objc_msgSend(v86, "setFontSize:");
    [(UIKBRenderFactory *)self scale];
    double v28 = *MEMORY[0x1E4F1DAD8];
    double v29 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    BOOL v30 = v27 == 2.0;
    double v31 = 0.0;
    if (!v30) {
      double v31 = *MEMORY[0x1E4F1DAD8];
    }
    double v32 = 0.5;
    if (!v30) {
      double v32 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    objc_msgSend(v86, "setTextOffset:", v31, v32);
    double v33 = [v8 displayString];
    uint64_t v34 = [v33 length];

    if (v34 != 1 && v10 != 7) {
      goto LABEL_37;
    }
    double v35 = [v8 displayString];
    [v35 characterAtIndex:0];

    if ((TICharIsAlphaNumeric() & 1) == 0 && (TICharIsDevanagariPUA() & 1) == 0)
    {
      [v86 fontSize];
      double v37 = v36;
      [(UIKBRenderFactoryiPad *)self fontSizeAdjustmentForNonAlphanumericKeycaps];
      [v86 setFontSize:v37 + v38];
    }
    if (v10 == 7)
    {
      [v86 fontSize];
      double v40 = v39;
      [(UIKBRenderFactoryiPad *)self dualStringKeyFontSizeAdjustment];
      [v86 setFontSize:v40 + v41];
    }
    else
    {
LABEL_37:
      if (v10 == 27)
      {
LABEL_39:
        [(UIKBRenderFactoryiPad *)self bottomRowDefaultFontSize];
        objc_msgSend(v86, "setFontSize:");
        objc_msgSend(v86, "setTextOffset:", v28, v29);
        v44 = [(UIKBRenderFactory *)self lightTextFontName];
        [v86 setFontName:v44];

LABEL_40:
        v45 = [v8 displayString];
        int v46 = [v45 isEqualToString:@"匹配"];

        if (v46)
        {
          [(UIKBRenderFactoryiPad *)self bottomRowDefaultFontSize];
LABEL_48:
          objc_msgSend(v86, "setFontSize:");
          goto LABEL_63;
        }
        v48 = [v8 name];
        int v49 = [v48 isEqualToString:@"Zhuyin-Letter-FIRST_TONE"];

        if (v49)
        {
          [(UIKBRenderFactoryiPad *)self zhuyinFirstToneKeyFontSize];
          goto LABEL_48;
        }
        v50 = [v8 name];
        int v51 = [v50 isEqualToString:@"Arabic-Thousands-Separator"];

        if (v51)
        {
          [(UIKBRenderFactoryiPad *)self tinyPunctuationGlyphFontSize];
          objc_msgSend(v86, "setFontSize:");
          [(UIKBRenderFactoryiPad *)self tinyPunctuationGlyphOffset];
        }
        else
        {
          v56 = [v8 representedString];
          int v57 = [v56 isEqualToString:@"‌"];

          if (!v57) {
            goto LABEL_63;
          }
          [(UIKBRenderFactoryiPad *)self ZWNJKeyOffset];
        }
        goto LABEL_62;
      }
    }
    double v42 = [v8 name];
    int v43 = [v42 _containsSubstring:@"Email-Dot-"];

    if (!v43) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  int v18 = v12;
  if (v12 != 10) {
    int v15 = 0;
  }
  if (v15 != 1)
  {
    if (v10 == 3)
    {
      v52 = [(UIKBRenderFactory *)self lightTextFontName];
      [v86 setFontName:v52];

      [v86 setUsesSymbolImage:1];
      [v86 setFontWeightForSymbolImage:*(double *)off_1E52D6BE8];
      [(UIKBRenderFactoryiPad *)self symbolImageControlKeyFontSize];
      objc_msgSend(v86, "setFontSizeForSymbolImage:");
      [(UIKBRenderFactoryiPad *)self deleteKeyFontSize];
      -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
      objc_msgSend(v86, "setFontSize:");
      [(UIKBRenderFactoryiPad *)self deleteKeyOffset];
      goto LABEL_62;
    }
    if (v10 == 23)
    {
      v47 = [(UIKBRenderFactory *)self lightTextFontName];
      [v86 setFontName:v47];

      [(UIKBRenderFactoryiPad *)self shiftKeyFontSize];
      -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
      objc_msgSend(v86, "setFontSize:");
      [v86 setUsesSymbolImage:1];
      [v86 setFontWeightForSymbolImage:*(double *)off_1E52D6BE8];
      [(UIKBRenderFactoryiPad *)self symbolImageControlKeyFontSize];
      objc_msgSend(v86, "setFontSizeForSymbolImage:");
      if ([v8 displayTypeHint]) {
        goto LABEL_63;
      }
      [(UIKBRenderFactoryiPad *)self shiftKeyOffset];
      goto LABEL_62;
    }
    if (v11 != 9)
    {
      int v58 = 1;
      switch(v10)
      {
        case 2:
        case 18:
          v66 = [(UIKBRenderFactory *)self lightTextFontName];
          [v86 setFontName:v66];

          [(UIKBRenderFactoryiPad *)self moreKeyFontSize];
          -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
          objc_msgSend(v86, "setFontSize:");
          [(UIKBRenderFactory *)self scale];
          double v67 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
          BOOL v69 = v68 == 2.0;
          if (v68 == 2.0) {
            double v67 = -0.5;
          }
          double v70 = 0.0;
          if (!v69) {
            double v70 = *MEMORY[0x1E4F1DAD8];
          }
          objc_msgSend(v86, "setTextOffset:", v70, v67, *MEMORY[0x1E4F1DAD8]);
          if (v10 == 18)
          {
            [(UIKBRenderFactory *)self rivenSizeFactor];
            if (v71 <= 1.0)
            {
              [v86 setIgnoreTextMarginOnKey:1];
            }
            else
            {
              v72 = [v9 displayString];
              objc_msgSend(v86, "setIgnoreTextMarginOnKey:", objc_msgSend(v72, "_containsCJScripts") ^ 1);
            }
          }
          goto LABEL_100;
        case 3:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 12:
        case 13:
        case 15:
        case 16:
        case 17:
        case 19:
        case 20:
        case 22:
        case 23:
          goto LABEL_91;
        case 4:
          [(UIKBRenderFactoryiPad *)self dictationKeyOffset];
          objc_msgSend(v86, "setTextOffset:");
          v55 = v86;
          goto LABEL_58;
        case 5:
LABEL_100:
          [v86 setUsesSymbolImage:1];
          goto LABEL_59;
        case 11:
        case 21:
        case 25:
          double v11 = [v9 displayStringImage];
          if (([v11 containsString:@"grinning"] & 1) == 0)
          {
            v59 = [v9 displayStringImage];
            int v58 = [v59 containsString:@"return"];
          }
          goto LABEL_83;
        case 14:
          v78 = [(UIKBRenderFactory *)self lightTextFontName];
          [v86 setFontName:v78];

          v79 = [(UIKBRenderFactory *)self renderingContext];
          uint64_t v80 = [v79 keyboardType];

          [v86 setIgnoreTextMarginOnKey:v80 == 126];
          if (v80 == 126) {
            [(UIKBRenderFactoryiPad *)self messagesTypeKeyplanSwitchKeyFontSize];
          }
          else {
            [(UIKBRenderFactoryiPad *)self spaceKeyFontSize];
          }
          -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
          objc_msgSend(v86, "setFontSize:");
          [(UIKBRenderFactory *)self scale];
          double v26 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
          BOOL v84 = v83 == 2.0;
          if (v83 == 2.0) {
            double v26 = -0.5;
          }
          double v25 = 0.0;
          if (!v84) {
            double v25 = *MEMORY[0x1E4F1DAD8];
          }
          goto LABEL_62;
        case 24:
          [(UIKBRenderFactoryiPad *)self smallKanaKeyFontSize];
          goto LABEL_48;
        case 26:
          goto LABEL_83;
        default:
          if (v10 == 51)
          {
LABEL_83:
            if (v10 != 26 && v10 != 51) {

            }
            if (v58)
            {
              [v86 setUsesSymbolImage:1];
              [(UIKBRenderFactoryiPad *)self symbolImageControlKeyFontSize];
              objc_msgSend(v86, "setFontSizeForSymbolImage:");
              [v86 setFontWeightForSymbolImage:*(double *)off_1E52D6BE8];
              [(UIKBRenderFactoryiPad *)self symbolImageControlKeyOffset];
            }
            else
            {
              [(UIKBRenderFactory *)self scale];
              BOOL v13 = v74 == 2.0;
              double v73 = 0.0;
              if (!v13) {
                double v73 = *MEMORY[0x1E4F1DAD8];
              }
            }
            [v86 setTextOffset:v73];
            v75 = [(UIKBRenderFactory *)self lightTextFontName];
            [v86 setFontName:v75];

            [(UIKBRenderFactoryiPad *)self spaceKeyFontSize];
          }
          else
          {
LABEL_91:
            v76 = [v8 name];
            int v77 = [v76 _containsSubstring:@"Email-Dot-"];

            if (v77)
            {
              [(UIKBRenderFactoryiPad *)self emailDotKeyFontSize];
            }
            else
            {
              v81 = [v8 name];
              int v82 = [v81 hasSuffix:@"Chinese-Facemark"];

              if (v82)
              {
                [(UIKBRenderFactoryiPad *)self facemarkKeyFontSize];
              }
              else if ([v8 displayRowHint] != 4 || v18 == 10)
              {
                [(UIKBRenderFactoryiPad *)self fallbackFontSize];
              }
              else
              {
                v85 = [(UIKBRenderFactory *)self lightTextFontName];
                [v86 setFontName:v85];
              }
            }
          }
          break;
      }
      goto LABEL_48;
    }
    [(UIKBRenderFactoryiPad *)self internationalKeyOffset];
    objc_msgSend(v86, "setTextOffset:");
    if ([(UIKBRenderFactoryiPad *)self iPadFudgeLayout]
      || [(UIKBRenderFactoryiPad *)self iPadSansHomeButtonLayout])
    {
      v53 = [(UIKBRenderFactory *)self lightTextFontName];
      [v86 setFontName:v53];

      [(UIKBRenderFactoryiPad *)self spaceKeyFontSize];
      -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
      objc_msgSend(v86, "setFontSize:");
    }
    else
    {
      int v60 = [v8 displayType];
      id v54 = v86;
      if (v60) {
        goto LABEL_57;
      }
      v61 = [(UIKBRenderFactory *)self lightTextFontName];
      [v86 setFontName:v61];

      [(UIKBRenderFactoryiPad *)self moreKeyFontSize];
      -[UIKBRenderFactory RivenFactor:](self, "RivenFactor:");
      objc_msgSend(v86, "setFontSize:");
      [(UIKBRenderFactory *)self scale];
      BOOL v63 = v62 == 2.0;
      double v64 = 0.0;
      if (!v63) {
        double v64 = *MEMORY[0x1E4F1DAD8];
      }
      double v65 = -0.5;
      if (!v63) {
        double v65 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      }
      objc_msgSend(v86, "setTextOffset:", v64, v65, *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    }
    id v54 = v86;
LABEL_57:
    v55 = v54;
LABEL_58:
    [v55 setUsesSymbolImage:1];
    [v86 setFontWeightForSymbolImage:*(double *)off_1E52D6BE8];
LABEL_59:
    [(UIKBRenderFactoryiPad *)self symbolImageControlKeyFontSize];
    objc_msgSend(v86, "setFontSizeForSymbolImage:");
    goto LABEL_63;
  }
  [(UIKBRenderFactoryiPad *)self stringKeyFontSize];
  objc_msgSend(v86, "setFontSize:");
  if (v10 == 7)
  {
    [v86 fontSize];
    double v20 = v19;
    [(UIKBRenderFactoryiPad *)self dualStringKeyFontSizeAdjustment];
    [v86 setFontSize:v20 + v21];
  }
  uint64_t v22 = [v8 representedString];
  uint64_t v23 = [v22 length];

  if (v23)
  {
    double v24 = [v8 representedString];
    [v24 characterAtIndex:0];

    if (uscript_hasScript())
    {
      double v25 = 0.0;
      double v26 = -2.0;
LABEL_62:
      objc_msgSend(v86, "setTextOffset:", v25, v26);
    }
  }
LABEL_63:
}

- (BOOL)shouldClearBaseDisplayStringForVariants:(id)a3
{
  return 0;
}

- (void)_customizePopupTraits:(id)a3 forKey:(id)a4 onKeyplane:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = [v8 state];
  int v10 = [v7 geometry];
  double v11 = v10;
  if (v9 == 16)
  {
    [v10 setDetachedVariants:1];

    int v12 = [(UIKBRenderFactory *)self renderConfig];
    if ([v12 lightKeyboard])
    {
      BOOL v13 = [(UIKBRenderFactory *)self renderConfig];
      objc_msgSend(v7, "setBlurBlending:", objc_msgSend(v13, "animatedBackground"));
    }
    else
    {
      [v7 setBlurBlending:1];
    }
  }
  else
  {
    [v10 setPopupBias:0];

    [v7 setBlurBlending:1];
    [v7 setRenderFlagsForAboveEffects:2];
  }
  [(UIKBRenderFactory *)self suppressLayoutSegments];
  if (![(UIKBRenderFactory *)self lightweightFactory])
  {
    double v14 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
    int v15 = +[UIKBGradient gradientWithFlatColor:v14];
    [v7 setBackgroundGradient:v15];

    double v16 = [(UIKBRenderFactory *)self renderConfig];
    LODWORD(v14) = [v16 lightKeyboard];

    if (v14 && ([v8 state] & 0x10) != 0)
    {
      double v17 = +[UIKBEdgeEffect effectWithColor:@"UIKBColorBlack_Alpha12" edges:15 inset:-0.25 weight:0.5];
      [v7 addRenderEffect:v17];
    }
    [(UIKBRenderFactoryiPad *)self wideShadowPaddleInsets];
    uint64_t v22 = +[UIKBShadowEffect effectWithColor:@"UIKBColorBlack_Alpha35", 0.0, 2.0, v18, v19, v20, v21, 4.5 offset insets weight];
    [v7 addRenderEffect:v22];

    if (([v8 state] & 0x10) != 0)
    {
      uint64_t v23 = [(UIKBRenderFactoryiPad *)self lightKeycapsFontName];
      double v24 = +[UIKBTextStyle styleWithFontName:v23 withFontSize:22.0];

      if ([v8 displayType] == 27 || objc_msgSend(v8, "variantType") == 4)
      {
        double v25 = [(UIKBRenderFactory *)self lightTextFontName];
        [v24 setFontName:v25];

        [v24 setFontSize:16.0];
      }
      objc_msgSend(v24, "setTextOffset:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      double v26 = [v7 symbolStyle];
      double v27 = [v26 textColor];
      [v24 setTextColor:v27];

      double v28 = +[UIKBRenderTraits traitsWithSymbolStyle:v24];
      [v7 setVariantTraits:v28];

      double v29 = +[UIKBRenderTraits traitsWithSymbolStyle:0];
      BOOL v30 = [(UIKBRenderFactory *)self renderConfig];
      int v31 = [v30 lightKeyboard];
      double v32 = UIKBColorKeyBlueKeyBackground;
      if (!v31) {
        double v32 = UIKBColorBlack_Alpha30;
      }
      double v33 = *v32;

      uint64_t v34 = +[UIKBGradient gradientWithFlatColor:v33];
      [v29 setLayeredForegroundGradient:v34];

      double v35 = +[UIKBTextStyle styleWithTextColor:@"UIKBColorWhite"];
      [v29 setSymbolStyle:v35];

      [v7 setHighlightedVariantTraits:v29];
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      double v36 = [v8 subtrees];
      uint64_t v37 = [v36 countByEnumeratingWithState:&v56 objects:v62 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        id v54 = v33;
        v55 = v24;
        uint64_t v39 = *(void *)v57;
        while (2)
        {
          for (uint64_t i = 0; i != v38; ++i)
          {
            if (*(void *)v57 != v39) {
              objc_enumerationMutation(v36);
            }
            double v41 = [*(id *)(*((void *)&v56 + 1) + 8 * i) secondaryDisplayStrings];
            uint64_t v42 = [v41 count];

            if (v42)
            {

              double v24 = v55;
              double v36 = (void *)[v55 copy];
              [(UIKBRenderFactoryiPhone *)self variantAnnotationTextFontSize];
              objc_msgSend(v36, "setFontSize:");
              int v43 = [(UIKBRenderFactory *)self renderConfig];
              if ([v43 lightKeyboard]) {
                v44 = @"UIKBColorBlack_Alpha40";
              }
              else {
                v44 = @"UIKBColorWhite";
              }
              [v36 setTextColor:v44];

              [v36 setAnchorCorner:2];
              [(UIKBRenderFactoryiPad *)self variantAnnotationTextOffset];
              objc_msgSend(v36, "setTextOffset:");
              v61 = v36;
              v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
              int v46 = [v7 variantTraits];
              [v46 setSecondarySymbolStyles:v45];

              v47 = +[UIKBTextStyle styleWithTextColor:@"UIKBColorWhite"];
              int v60 = v47;
              v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
              [v29 setSecondarySymbolStyles:v48];

              goto LABEL_30;
            }
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v56 objects:v62 count:16];
          if (v38) {
            continue;
          }
          break;
        }
        double v24 = v55;
LABEL_30:
        double v33 = v54;
      }
    }
    int v49 = [v7 geometry];
    if ([v8 displayTypeHint] == 10 && objc_msgSend(v8, "state") == 4)
    {
      [v49 displayFrame];
      double v51 = v50;
      double v53 = v52;
      [v49 displayFrame];
      CGRect v65 = CGRectInset(v64, v51 * -0.5, v53 * -0.5);
      objc_msgSend(v49, "setDisplayFrame:", v65.origin.x, v65.origin.y, v65.size.width, v65.size.height);
    }
  }
}

- (CGSize)defaultVariantGeometrySize
{
  double v2 = 62.0;
  double v3 = 66.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (int64_t)rowLimitForKey:(id)a3
{
  id v3 = a3;
  double v4 = [v3 name];
  int v5 = [v4 isEqualToString:@"EmojiPopupKey"];

  if (v5)
  {
    uint64_t v6 = [v3 subtrees];
    int64_t v7 = [v6 count];
  }
  else
  {
    int64_t v7 = 5;
  }

  return v7;
}

- (id)variantGeometriesForGeometry:(id)a3 variantCount:(unint64_t)a4 rowLimit:(int64_t)a5 annotationIndex:(unint64_t)a6
{
  id v9 = a3;
  [v9 paddedFrame];
  double v11 = v10;
  [(UIKBRenderFactoryiPad *)self defaultVariantSizeThreshold];
  int v12 = v9;
  if (v11 > v13)
  {
    int v12 = (void *)[v9 copy];

    [v12 paddedInsets];
    double v43 = v15;
    double v44 = v14;
    double v41 = v17;
    double v42 = v16;
    [v12 paddedFrame];
    double v19 = v18;
    double v21 = v20;
    [(UIKBRenderFactoryiPad *)self defaultVariantGeometrySize];
    double v23 = v22;
    double v25 = v24;
    [v12 paddedFrame];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    [(UIKBRenderFactory *)self scale];
    UIRectCenteredXInRectScale(v19, v21, v23, v25, v27, v29, v31, v33, v34);
    objc_msgSend(v12, "setPaddedFrame:");
    [v12 paddedFrame];
    objc_msgSend(v12, "setSymbolFrame:");
    [v12 frame];
    objc_msgSend(v12, "setFrame:", v35 - v42, v37 - v44, v36 - (-v42 - v43), v38 - (-v41 - v44));
  }
  uint64_t v39 = [v12 iPadVariantGeometries:a4 rowLimit:a5];

  return v39;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v55.receiver = self;
  v55.super_class = (Class)UIKBRenderFactoryiPad;
  id v8 = [(UIKBRenderFactoryiPhone *)&v55 _traitsForKey:v6 onKeyplane:v7];
  int v9 = [v6 displayType];
  if ([(UIKBRenderFactoryiPhone *)self _popupMenuStyleForKey:v6])
  {
    double v10 = [(UIKBRenderFactory *)self renderingContext];
    double v11 = [(UIKBRenderFactoryiPad *)self lightKeycapsFontName];
    [(UIKBRenderFactoryiPad *)self _customizeTraits:v8 forPopupForKey:v6 withRenderingContext:v10 keycapsFontName:v11];

LABEL_3:
    goto LABEL_30;
  }
  if ([(UIKBRenderFactoryiPhone *)self _shouldConfigureSecondarySymbolStyleForSpaceKey:v6])
  {
    int v12 = [v8 secondarySymbolStyles];
    double v13 = [v12 firstObject];

    [v13 setFontSize:15.0];
    objc_msgSend(v13, "setTextOffset:", 8.0, 8.0);
  }
  if (([v6 interactionType] == 1 || objc_msgSend(v6, "interactionType") == 2)
    && [v6 state] == 4)
  {
    double v14 = [(UIKBRenderFactoryiPhone *)self controlKeyTraits];
    [v8 overlayWithTraits:v14];
  }
  if (v9 <= 7)
  {
    if (v9)
    {
      if (v9 != 7) {
        goto LABEL_30;
      }
      [(UIKBRenderFactoryiPad *)self dualStringKeyOffset];
      double v16 = v15;
      double v18 = v17;
      double v19 = [v8 symbolStyle];
      [v19 textOffset];
      double v21 = v20;
      double v23 = v22;

      double v24 = [v8 symbolStyle];
      objc_msgSend(v24, "setTextOffset:", v16 + v21, v18 + v23);

      double v25 = [v8 secondarySymbolStyles];
      double v26 = [v25 firstObject];

      [v26 textOffset];
      objc_msgSend(v26, "setTextOffset:", v16 + v27, v18 + v28);
    }
  }
  else if (v9 != 8)
  {
    if (v9 == 21)
    {
      uint64_t v39 = [v8 symbolStyle];
      int v40 = [v39 usesSymbolImage];

      if (v40)
      {
        [(UIKBRenderFactoryiPad *)self symbolImageControlKeyFontSize];
        double v42 = v41;
        double v43 = [v8 symbolStyle];
        [v43 setFontSizeForSymbolImage:v42];

        double v44 = *(double *)off_1E52D6BE8;
        v45 = [v8 symbolStyle];
        [v45 setFontWeightForSymbolImage:v44];

        [(UIKBRenderFactoryiPad *)self symbolImageControlKeyOffset];
        double v47 = v46;
        double v49 = v48;
        double v50 = [v8 symbolStyle];
        objc_msgSend(v50, "setTextOffset:", v47, v49);

        double v51 = [v7 cachedKeysByKeyName:@"Return-Key"];
        unint64_t v52 = [v51 count];

        if (v52 >= 2)
        {
          double v53 = [v8 symbolStyle];
          [v53 setAnchorCorner:8];

          double v10 = [v8 symbolStyle];
          objc_msgSend(v10, "setTextOffset:", 3.0, 10.0);
          goto LABEL_3;
        }
      }
      goto LABEL_30;
    }
    if (v9 != 25) {
      goto LABEL_30;
    }
  }
  double v29 = [v7 firstCachedKeyWithName:@"International-Key"];
  int v30 = [v29 displayRowHint];

  if ([v6 displayRowHint] == v30 && objc_msgSend(v6, "interactionType") != 9) {
    [(UIKBRenderFactory *)self suppressLayoutSegments];
  }
  double v31 = [v6 displayString];
  int v32 = [v31 isEqualToString:@"kr"];

  if (v32)
  {
    double v33 = [(UIKBRenderFactory *)self lightTextFontName];
    double v34 = [v8 symbolStyle];
    [v34 setFontName:v33];
  }
  else
  {
    double v35 = [v6 secondaryDisplayStrings];
    double v36 = [v35 firstObject];
    int v37 = [v36 isEqualToString:@"kr"];

    if (!v37) {
      goto LABEL_30;
    }
    double v33 = [(UIKBRenderFactory *)self lightTextFontName];
    double v34 = [v8 secondarySymbolStyles];
    double v38 = [v34 firstObject];
    [v38 setFontName:v33];
  }
LABEL_30:

  return v8;
}

- (double)_row4ControlSegmentWidthLeft
{
  return 0.24;
}

- (double)_row4ControlSegmentWidthRight
{
  id v3 = [(UIKBRenderFactory *)self renderingContext];
  if ([v3 keyboardType] == 126)
  {
    double v4 = 0.35;
  }
  else
  {
    [(UIKBRenderFactoryiPad *)self _row4ControlSegmentWidthLeft];
    double v4 = v5;
  }

  return v4;
}

- (void)setupLayoutSegments
{
  [(UIKBRenderFactoryiPad *)self _row4ControlSegmentWidthLeft];
  double v4 = v3;
  [(UIKBRenderFactoryiPad *)self _row4ControlSegmentWidthRight];
  double v6 = 1.0 - v5;
  [(UIKBRenderFactoryiPad *)self _row4ControlSegmentWidthRight];
  double v8 = v7;
  id v23 = [(UIKBRenderFactoryiPhone *)self controlKeyTraits];
  int v9 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:](UIKBRenderFactoryLayoutSegment, "segmentWithTraits:");
  [v9 setKeyStates:3];
  [v9 addRelativeLayoutRectFromEdge:10 ofCachedKey:@"Shift-Key"];
  [v9 addRelativeLayoutRectFromEdge:2 ofCachedKey:@"Delete-Key"];
  [v9 addRelativeLayoutRectFromEdge:2 ofCachedKey:@"Return-Key"];
  uint64_t v10 = 8;
  [v9 addRelativeLayoutRectFromEdge:8 ofCachedKey:@"Tab-Key"];
  [v9 addRelativeLayoutRectFromEdge:8 ofCachedKey:@"Caps-Lock-Key"];
  [v9 addRelativeLayoutRectFromEdge:8 ofCachedKey:@"Roman-to-Non-Roman-Switch-Key"];
  [v9 addRelativeLayoutRectFromEdge:8 ofCachedKey:@"Non-Roman-to-Roman-Switch-Key"];
  if (![(UIKBRenderFactoryiPad *)self iPadFudgeLayout])
  {
    if ([(UIKBRenderFactoryiPad *)self iPadSansHomeButtonLayout]) {
      uint64_t v10 = 8;
    }
    else {
      uint64_t v10 = 2;
    }
  }
  [v9 addRelativeLayoutRectFromEdge:v10 ofCachedKey:@"Undo-Key"];
  [v9 addRelativeLayoutRectFromEdge:v10 ofCachedKey:@"Redo-Key"];
  objc_msgSend(v9, "addLayoutRect:asTriangle:", 0, 0.0, 0.8, v4, 0.2);
  objc_msgSend(v9, "addLayoutRect:asTriangle:", 0, v6, 0.8, v8, 0.2);
  [(UIKBRenderFactory *)self addLayoutSegment:v9];
  double v11 = [(UIKBRenderFactoryiPhone *)self shiftDeleteGlyphTraits];
  int v12 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v11];

  [v12 setKeyStates:3];
  [v12 addRelativeLayoutRectFromEdge:10 ofCachedKey:@"Shift-Key"];
  [v12 addRelativeLayoutRectFromEdge:2 ofCachedKey:@"Delete-Key"];
  [(UIKBRenderFactory *)self addLayoutSegment:v12];
  double v13 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v23];
  [v13 setKeyStates:4];
  objc_msgSend(v13, "addLayoutRect:asTriangle:", 0, 0.0, 0.75, 1.0, 0.25);
  [(UIKBRenderFactory *)self addLayoutSegment:v13];
  double v14 = [(UIKBRenderFactoryiPhone *)self shiftedControlKeyTraits];
  double v15 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v14];

  [v15 setKeyStates:100];
  [v15 addRelativeLayoutRectFromEdge:10 ofCachedKey:@"Shift-Key"];
  [(UIKBRenderFactory *)self addLayoutSegment:v15];
  double v16 = [(UIKBRenderFactoryiPhone *)self shiftLockControlKeyTraits];
  double v17 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v16];

  uint64_t v18 = 8;
  [v17 setKeyStates:8];
  [v17 addRelativeLayoutRectFromEdge:10 ofCachedKey:@"Shift-Key"];
  [(UIKBRenderFactory *)self addLayoutSegment:v17];
  double v19 = [(UIKBRenderFactoryiPhone *)self shiftLockControlKeyTraits];
  double v20 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v19];

  [v20 setKeyStates:8];
  [v20 addRelativeLayoutRectFromEdge:10 ofCachedKey:@"Caps-Lock-Key"];
  [(UIKBRenderFactory *)self addLayoutSegment:v20];
  double v21 = [(UIKBRenderFactoryiPhone *)self activeControlKeyTraits];
  double v22 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v21];
  [v22 setKeyStates:4];
  [v22 addRelativeLayoutRectFromEdge:2 ofCachedKey:@"Delete-Key"];
  [v22 addRelativeLayoutRectFromEdge:2 ofCachedKey:@"Return-Key"];
  [v22 addRelativeLayoutRectFromEdge:8 ofCachedKey:@"Tab-Key"];
  [v22 addRelativeLayoutRectFromEdge:8 ofCachedKey:@"Caps-Lock-Key"];
  [v22 addRelativeLayoutRectFromEdge:8 ofCachedKey:@"Roman-to-Non-Roman-Switch-Key"];
  [v22 addRelativeLayoutRectFromEdge:8 ofCachedKey:@"Non-Roman-to-Roman-Switch-Key"];
  if (![(UIKBRenderFactoryiPad *)self iPadFudgeLayout])
  {
    if ([(UIKBRenderFactoryiPad *)self iPadSansHomeButtonLayout]) {
      uint64_t v18 = 8;
    }
    else {
      uint64_t v18 = 2;
    }
  }
  [v22 addRelativeLayoutRectFromEdge:v18 ofCachedKey:@"Undo-Key"];
  [v22 addRelativeLayoutRectFromEdge:v18 ofCachedKey:@"Redo-Key"];
  objc_msgSend(v22, "addLayoutRect:asTriangle:", 0, 0.0, 0.8, v4, 0.2);
  objc_msgSend(v22, "addLayoutRect:asTriangle:", 0, v6, 0.8, v8, 0.2);
  [(UIKBRenderFactory *)self addLayoutSegment:v22];
}

- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6
{
  v90[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = +[UIKBTextStyle styleWithFontName:a6 withFontSize:22.0];
  [v10 setSymbolStyle:v13];

  double v14 = [v12 renderConfig];
  int v15 = [v14 lightKeyboard];
  double v16 = UIKBColorBlack;
  if (!v15) {
    double v16 = UIKBColorWhite;
  }
  double v17 = *v16;
  uint64_t v18 = [v10 symbolStyle];
  [v18 setTextColor:v17];

  [v10 removeAllRenderEffects];
  if ([v11 displayType] == 13)
  {
    double v19 = [v10 symbolStyle];
    [v19 setUsesSymbolImage:1];

    [(UIKBRenderFactoryiPad *)self symbolImageControlKeyFontSize];
    double v21 = v20;
    double v22 = [v10 symbolStyle];
    [v22 setFontSizeForSymbolImage:v21];

    id v23 = [v10 symbolStyle];
    double v24 = v23;
    double v25 = 0.0;
    double v26 = -1.0;
LABEL_13:
    objc_msgSend(v23, "setTextOffset:", v25, v26);
LABEL_14:

    goto LABEL_15;
  }
  if ([v11 displayType] == 5)
  {
    double v27 = [v10 symbolStyle];
    [v27 setUsesSymbolImage:1];

    [(UIKBRenderFactoryiPad *)self symbolImageControlKeyFontSize];
    double v29 = v28;
    int v30 = [v10 symbolStyle];
    [v30 setFontSizeForSymbolImage:v29];

    [(UIKBRenderFactory *)self scale];
    if (v31 == 2.0) {
      double v32 = *MEMORY[0x1E4F1DAD8];
    }
    else {
      double v32 = 0.0;
    }
    if (v31 == 2.0) {
      double v33 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    else {
      double v33 = -1.0;
    }
    id v23 = [v10 symbolStyle];
    double v24 = v23;
    double v25 = v32;
    double v26 = v33;
    goto LABEL_13;
  }
  if ([v11 displayType] == 4)
  {
    double v48 = [v10 symbolStyle];
    [v48 setUsesSymbolImage:1];

    [(UIKBRenderFactoryiPad *)self symbolImageControlKeyFontSize];
    double v50 = v49;
    double v24 = [v10 symbolStyle];
    [v24 setFontSizeForSymbolImage:v50];
    goto LABEL_14;
  }
LABEL_15:
  double v34 = [v10 geometry];
  [v34 setDetachedVariants:1];

  double v35 = +[UIKBRenderTraits traitsWithSymbolStyle:0];
  [v10 setVariantTraits:v35];

  double v36 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
  int v37 = +[UIKBGradient gradientWithFlatColor:v36];
  double v38 = [v10 variantTraits];
  [v38 setBackgroundGradient:v37];

  uint64_t v39 = [v12 renderConfig];
  LODWORD(v36) = [v39 lightKeyboard];

  if (v36)
  {
    int v40 = [v10 variantTraits];
    double v41 = +[UIKBEdgeEffect effectWithColor:@"UIKBColorBlack_Alpha12" edges:15 inset:-0.25 weight:0.5];
    [v40 addRenderEffect:v41];
  }
  double v42 = [v12 renderConfig];
  int v43 = [v42 lightKeyboard];

  if (v43)
  {
    double v44 = +[UIKBShadowEffect effectWithColor:@"UIKBColorBlack_Alpha35", 0.0, 2.0, 1.0, 1.0, 0.0, 1.0, 4.5 offset insets weight];
    [v10 addRenderEffect:v44];
  }
  v45 = [(UIKBRenderFactory *)self renderConfig];
  if ([v45 lightKeyboard])
  {
    double v46 = [(UIKBRenderFactory *)self renderConfig];
    objc_msgSend(v10, "setBlurBlending:", objc_msgSend(v46, "animatedBackground"));
  }
  else
  {
    [v10 setBlurBlending:1];
  }

  if ([v11 displayType] == 13 || objc_msgSend(v11, "displayType") == 4) {
    double v47 = off_1E52D3B08;
  }
  else {
    double v47 = off_1E52D40B8;
  }
  double v51 = [(__objc2_class *)*v47 sharedInstance];
  [v51 popupRect];
  double v53 = v52;
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  int v60 = +[UIKeyboardImpl activeInstance];
  v61 = [v60 _layout];
  objc_msgSend(v61, "convertRect:fromView:", v51, v53, v55, v57, v59);
  CGFloat v63 = v62;
  CGFloat v65 = v64;
  CGFloat v67 = v66;
  CGFloat v69 = v68;

  [(UIKBRenderFactoryiPad *)self keyCornerRadius];
  CGFloat v71 = v70;
  [(UIKBRenderFactoryiPad *)self keyCornerRadius];
  CGFloat v73 = v72;
  v91.origin.double x = v63;
  v91.origin.double y = v65;
  v91.size.double width = v67;
  v91.size.double height = v69;
  CGRect v92 = CGRectInset(v91, v71, v73);
  double x = v92.origin.x;
  double y = v92.origin.y;
  double width = v92.size.width;
  double height = v92.size.height;
  v78 = [v10 geometry];
  [v78 displayFrame];
  v95.origin.double x = x;
  v95.origin.double y = y;
  v95.size.double width = width;
  v95.size.double height = height;
  CGRect v94 = CGRectUnion(v93, v95);
  double v79 = v94.origin.x;
  double v80 = v94.origin.y;
  double v81 = v94.size.width;
  double v82 = v94.size.height;

  double v83 = [v10 geometry];
  objc_msgSend(v83, "setDisplayFrame:", v79, v80, v81, v82);

  BOOL v84 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", x, y, width, height, x, y, width, height);
  v90[0] = v84;
  v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:1];
  [v10 setVariantGeometries:v85];

  id v86 = [v10 geometry];
  [v86 setPopupBias:40];

  [(UIKBRenderFactoryiPad *)self keyCornerRadius];
  double v88 = v87;
  v89 = [v10 geometry];
  [v89 setRoundRectRadius:v88];
}

@end
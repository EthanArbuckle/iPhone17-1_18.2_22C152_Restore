@interface UIKBRenderFactoryiPadHWR_Portrait
- (BOOL)_anchorControlKeys;
- (BOOL)_displaysAsControlKeyStyle:(id)a3;
- (BOOL)shouldUseRoundCornerForKey:(id)a3;
- (CGPoint)_controlKeyOffset;
- (CGPoint)dismissKeyOffset;
- (CGPoint)spaceReturnKeyTextOffset;
- (UIEdgeInsets)symbolFrameInsets;
- (double)controlColumnWidthFactor;
- (double)deleteKeyFontSize;
- (double)dictationKeyFontSize;
- (double)dismissKeyFontSize;
- (double)internationalKeyFontSize;
- (double)keyCornerRadius;
- (double)moreKeyFontSize;
- (double)spaceKeyFontSize;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)messagesWriteboardKeyImageName;
- (int64_t)assetIdiom;
- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6;
- (void)setupLayoutSegments;
@end

@implementation UIKBRenderFactoryiPadHWR_Portrait

- (int64_t)assetIdiom
{
  return 1;
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (double)deleteKeyFontSize
{
  return 18.0;
}

- (double)moreKeyFontSize
{
  return 17.0;
}

- (double)internationalKeyFontSize
{
  return 30.0;
}

- (double)dictationKeyFontSize
{
  return 28.0;
}

- (double)spaceKeyFontSize
{
  return 18.0;
}

- (double)dismissKeyFontSize
{
  return 37.0;
}

- (CGPoint)dismissKeyOffset
{
  double v2 = 0.0;
  double v3 = 6.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)spaceReturnKeyTextOffset
{
  [(UIKBRenderFactory *)self scale];
  double v2 = 1.5;
  if (v3 != 2.0) {
    double v2 = 1.0;
  }
  double v4 = 0.0;
  result.y = v2;
  result.x = v4;
  return result;
}

- (id)messagesWriteboardKeyImageName
{
  return @"messages_writeboard_portrait.png";
}

- (UIEdgeInsets)symbolFrameInsets
{
  double v2 = 7.0;
  double v3 = 2.0;
  double v4 = 7.0;
  double v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)_anchorControlKeys
{
  return 0;
}

- (CGPoint)_controlKeyOffset
{
  [(UIKBRenderFactory *)self RivenFactor:9.0];
  double v4 = v3;
  [(UIKBRenderFactory *)self RivenFactor:8.0];
  double v6 = v5;
  double v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (BOOL)shouldUseRoundCornerForKey:(id)a3
{
  id v4 = a3;
  if ([v4 displayType] == 3)
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKBRenderFactoryiPadHWR_Portrait;
    BOOL v5 = [(UIKBRenderFactory10Key_Round *)&v7 shouldUseRoundCornerForKey:v4];
  }

  return v5;
}

- (BOOL)_displaysAsControlKeyStyle:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 displayType];
  char v5 = v4;
  BOOL v6 = v4 < 0x16;
  int v7 = [v3 interactionType];

  if (v7 == 40 || v7 == 9) {
    LOBYTE(v8) = 1;
  }
  else {
    return v6 & (0x242030u >> v5);
  }
  return v8;
}

- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6
{
  id v48 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  [v48 removeAllRenderEffects];
  v13 = +[UIKBTextStyle styleWithFontName:v11 withFontSize:22.0];

  [v48 setSymbolStyle:v13];
  v14 = [v12 renderConfig];

  int v15 = [v14 lightKeyboard];
  v16 = UIKBColorBlack;
  if (!v15) {
    v16 = UIKBColorWhite;
  }
  v17 = *v16;
  v18 = [v48 symbolStyle];
  [v18 setTextColor:v17];

  if ([v10 displayType] == 5)
  {
    v19 = [v48 geometry];
    [v19 paddedFrame];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    [(UIKBRenderFactory *)self translucentGapWidth];
    double v29 = v28 + v23;
    double v30 = v27 - (v28 + 0.0);
    v31 = [v48 geometry];
    objc_msgSend(v31, "setPaddedFrame:", v21 + 0.0, v29, v25, v30);

    v32 = [v48 geometry];
    [v32 paddedFrame];
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    v41 = [v48 geometry];
    objc_msgSend(v41, "setDisplayFrame:", v34, v36, v38, v40);

LABEL_7:
    v42 = [v48 symbolStyle];
    [v42 setUsesSymbolImage:1];

    [(UIKBRenderFactory10Key *)self symbolImageControlKeyFontSize];
    double v44 = v43;
    v45 = [v48 symbolStyle];
    [v45 setFontSizeForSymbolImage:v44];

    goto LABEL_8;
  }
  if ([v10 displayType] == 13 || objc_msgSend(v10, "displayType") == 4) {
    goto LABEL_7;
  }
LABEL_8:
  v46 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
  v47 = +[UIKBGradient gradientWithFlatColor:v46];
  [v48 setBackgroundGradient:v47];

  [(UIKBRenderFactory10Key *)self modifyTraitsForDetachedInputSwitcher:v48 withKey:v10];
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  v77[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v76.receiver = self;
  v76.super_class = (Class)UIKBRenderFactoryiPadHWR_Portrait;
  BOOL v8 = [(UIKBRenderFactory10Key_Round *)&v76 _traitsForKey:v6 onKeyplane:v7];
  int v9 = [v6 displayType];
  if (v9 == 25 || (int v10 = v9, v9 == 21))
  {
    id v11 = [(UIKBRenderFactory *)self lightTextFontName];
    id v12 = [v8 symbolStyle];
    [v12 setFontName:v11];

    [(UIKBRenderFactoryiPadHWR_Portrait *)self spaceKeyFontSize];
    double v14 = v13;
    int v15 = [v8 symbolStyle];
    [v15 setFontSize:v14];

    [(UIKBRenderFactoryiPadHWR_Portrait *)self spaceReturnKeyTextOffset];
    double v17 = v16;
    double v19 = v18;
    double v20 = [v8 symbolStyle];
    objc_msgSend(v20, "setTextOffset:", v17, v19);

    double v21 = [v8 symbolStyle];
    LODWORD(v12) = [v21 usesSymbolImage];

    if (v12)
    {
      double v22 = [(UIKBRenderFactoryiPadHWR_Portrait *)self lightKeycapsFontName];
      double v23 = [v8 symbolStyle];
      [v23 setFontName:v22];

      double v24 = *(double *)off_1E52D6BE8;
      double v25 = [v8 symbolStyle];
      [v25 setFontWeight:v24];

      [(UIKBRenderFactory10Key *)self symbolImageControlKeyFontSize];
      double v27 = v26;
      double v28 = [v8 symbolStyle];
      [v28 setFontSize:v27];

      [(UIKBRenderFactory10Key *)self symbolImageControlKeyOffset];
      double v30 = v29;
      double v32 = v31;
      double v33 = [v8 symbolStyle];
      objc_msgSend(v33, "setTextOffset:", v30, v32);
LABEL_8:
    }
  }
  else
  {
    if ((v9 & 0xFFFFFFEF) == 2
      || ([v6 localizationKey],
          double v34 = objc_claimAutoreleasedReturnValue(),
          int v35 = [v34 isEqualToString:@"UI-abc"],
          v34,
          v35))
    {
      double v36 = [(UIKBRenderFactory *)self lightTextFontName];
      double v37 = [v8 symbolStyle];
      [v37 setFontName:v36];

      [(UIKBRenderFactoryiPadHWR_Portrait *)self moreKeyFontSize];
      double v39 = v38;
      double v40 = [v8 symbolStyle];
      [v40 setFontSize:v39];

      [(UIKBRenderFactoryiPadHWR_Portrait *)self spaceReturnKeyTextOffset];
      double v42 = v41;
      double v44 = v43;
      v45 = [v8 symbolStyle];
      objc_msgSend(v45, "setTextOffset:", v42, v44);

      double v33 = [v8 symbolStyle];
      [v33 setUsesSymbolImage:1];
      goto LABEL_8;
    }
    if (v10 <= 11)
    {
      if (v10 == 3)
      {
        [(UIKBRenderFactoryiPadHWR_Portrait *)self deleteKeyFontSize];
        double v61 = v60;
        v62 = [v8 symbolStyle];
        [v62 setFontSize:v61];

        if (([v6 state] & 4) != 0)
        {
          v64 = [(UIKBRenderFactory *)self renderConfig];
          int v65 = [v64 lightKeyboard];
          v66 = UIKBColorHWRCellLightBackground;
          if (!v65) {
            v66 = UIKBColorHWRCellDarkBackground;
          }
          v63 = *v66;

          v67 = [(UIKBRenderFactory *)self renderConfig];
          int v68 = [v67 lightKeyboard];
          v69 = UIKBColorHWRCellLightBackgroundClear;
          if (!v68) {
            v69 = UIKBColorHWRCellDarkBackgroundClear;
          }
          v70 = *v69;

          v77[0] = v63;
          v77[1] = v63;
          v77[2] = v70;
          v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:3];
          v72 = +[UIKBGradient gradientWith3Colors:v71 middleLocation:0.5];

          [v8 setBackgroundGradient:v72];
        }
        else
        {
          v63 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorClear"];
          [v8 setBackgroundGradient:v63];
        }

        [v8 removeAllRenderEffects];
      }
      else if (v10 != 5)
      {
        goto LABEL_9;
      }
      v73 = [v8 symbolStyle];
      [v73 setUsesSymbolImage:1];

      [(UIKBRenderFactory10Key *)self symbolImageControlKeyFontSize];
      double v75 = v74;
      double v33 = [v8 symbolStyle];
      [v33 setFontSizeForSymbolImage:v75];
      goto LABEL_8;
    }
    if (v10 == 12)
    {
      [v8 setBackgroundGradient:0];
      goto LABEL_9;
    }
    if (v10 == 13)
    {
      v55 = [v8 symbolStyle];
      [v55 setUsesSymbolImage:1];

      [(UIKBRenderFactory10Key *)self symbolImageControlKeyFontSize];
      double v57 = v56;
      v58 = [v8 symbolStyle];
      [v58 setFontSizeForSymbolImage:v57];

      double v59 = *(double *)off_1E52D6BE8;
      double v33 = [v8 symbolStyle];
      [v33 setFontWeightForSymbolImage:v59];
      goto LABEL_8;
    }
  }
LABEL_9:
  if ([(UIKBRenderFactoryiPadHWR_Portrait *)self _anchorControlKeys]
    && [(UIKBRenderFactoryiPadHWR_Portrait *)self _displaysAsControlKeyStyle:v6])
  {
    [v6 frame];
    double MidX = CGRectGetMidX(v79);
    [v7 frame];
    if (MidX >= CGRectGetMidX(v80)) {
      uint64_t v47 = 8;
    }
    else {
      uint64_t v47 = 4;
    }
    id v48 = [v8 symbolStyle];
    [v48 setAnchorCorner:v47];

    [(UIKBRenderFactoryiPadHWR_Portrait *)self _controlKeyOffset];
    double v50 = v49;
    double v52 = v51;
    v53 = [v8 symbolStyle];
    objc_msgSend(v53, "setTextOffset:", v50, v52);
  }
  return v8;
}

- (double)controlColumnWidthFactor
{
  return 0.27;
}

- (void)setupLayoutSegments
{
  [(UIKBRenderFactoryiPadHWR_Portrait *)self controlColumnWidthFactor];
  double v4 = v3;
  char v5 = [(UIKBRenderFactory10Key_Round *)self controlKeyTraits];
  id v8 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v5];

  [v8 setKeyStates:3];
  objc_msgSend(v8, "addLayoutRect:asTriangle:", 0, 0.0, 0.75, v4, 0.25);
  objc_msgSend(v8, "addLayoutRect:asTriangle:", 0, 1.0 - v4, 0.75, v4, 0.25);
  [(UIKBRenderFactory *)self addLayoutSegment:v8];
  id v6 = [(UIKBRenderFactory10Key_Round *)self activeControlKeyTraits];
  id v7 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v6];

  [v7 setKeyStates:4];
  objc_msgSend(v7, "addLayoutRect:asTriangle:", 0, 0.0, 0.75, v4, 0.25);
  objc_msgSend(v7, "addLayoutRect:asTriangle:", 0, 1.0 - v4, 0.75, v4, 0.25);
  [(UIKBRenderFactory *)self addLayoutSegment:v7];
}

@end
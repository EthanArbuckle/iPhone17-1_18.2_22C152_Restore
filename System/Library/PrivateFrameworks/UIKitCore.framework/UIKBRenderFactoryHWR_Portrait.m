@interface UIKBRenderFactoryHWR_Portrait
- (BOOL)shouldUseRoundCornerForKey:(id)a3;
- (CGPoint)deleteGlyphOffset;
- (CGPoint)globeKeyTextOffset;
- (CGPoint)moreKeyTextOffset;
- (CGPoint)spaceKeyTextOffset;
- (UIEdgeInsets)handwritingAreaInsets;
- (UIEdgeInsets)symbolFrameInsets;
- (double)handwritingGradientStartLocation;
- (double)spaceKeyFontSize;
- (double)symbolImageControlKeyFontSize;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (void)setupLayoutSegments;
@end

@implementation UIKBRenderFactoryHWR_Portrait

- (double)handwritingGradientStartLocation
{
  return 0.22;
}

- (UIEdgeInsets)handwritingAreaInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 5.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  return 19.0;
}

- (CGPoint)deleteGlyphOffset
{
  double v2 = 0.5;
  double v3 = 2.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)spaceKeyTextOffset
{
  double v2 = 0.0;
  double v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)moreKeyTextOffset
{
  double v2 = 0.5;
  double v3 = 1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)spaceKeyFontSize
{
  return 16.0;
}

- (CGPoint)globeKeyTextOffset
{
  double v2 = 0.0;
  double v3 = -0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (UIEdgeInsets)symbolFrameInsets
{
  double v2 = 1.0;
  double v3 = 2.0;
  double v4 = 3.0;
  double v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
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
    v7.super_class = (Class)UIKBRenderFactoryHWR_Portrait;
    BOOL v5 = [(UIKBRenderFactory10Key_Round *)&v7 shouldUseRoundCornerForKey:v4];
  }

  return v5;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  v99[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v94.receiver = self;
  v94.super_class = (Class)UIKBRenderFactoryHWR_Portrait;
  objc_super v7 = [(UIKBRenderFactory10Key_Round *)&v94 _traitsForKey:v6 onKeyplane:a4];
  int v8 = [v6 displayType];
  switch(v8)
  {
    case 12:
      v9 = [v7 geometry];
      [(UIKBRenderFactoryHWR_Portrait *)self handwritingAreaInsets];
      objc_msgSend(v9, "applyInsets:");

      v10 = [(UIKBRenderFactory *)self renderConfig];
      int v11 = [v10 lightKeyboard];

      if (v11)
      {
        [v6 originalFrame];
        double v13 = v12;
        [v6 frame];
        if (v13 <= 0.0 || (double v15 = v14, v14 <= v13))
        {
          v95[0] = @"UIKBColorWhite_Alpha87";
          v95[1] = @"UIKBColorWhite_Alpha87";
          v95[2] = @"UIKBColorWhite_Alpha87_60";
          v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:3];
          [(UIKBRenderFactoryHWR_Portrait *)self handwritingGradientStartLocation];
          v19 = +[UIKBGradient gradientWith3Colors:middleLocation:](UIKBGradient, "gradientWith3Colors:middleLocation:", v16);
          [v7 setBackgroundGradient:v19];
        }
        else
        {
          v97[0] = @"UIKBColorWhite_Alpha87";
          v97[1] = @"UIKBColorWhite_Alpha87";
          v97[2] = @"UIKBColorWhite_Alpha87_60";
          v97[3] = @"UIKBColorWhite_Alpha87_60";
          v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:4];
          v17 = NSNumber;
          [(UIKBRenderFactoryHWR_Portrait *)self handwritingGradientStartLocation];
          v19 = [v17 numberWithDouble:v13 * v18 / v15];
          v96[0] = v19;
          v20 = [NSNumber numberWithDouble:v13 / v15];
          v96[1] = v20;
          v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:2];
          v22 = +[UIKBGradient gradientWithColors:v16 middleLocations:v21];
          [v7 setBackgroundGradient:v22];
        }
        v83 = [v7 geometry];
        [v83 paddedFrame];
        double v85 = v84;
        double v87 = v86 + 0.0;
        double v89 = v88 + 0.5;
        double v91 = v90 + -0.5;
        v92 = [v7 geometry];
        objc_msgSend(v92, "setPaddedFrame:", v87, v89, v85, v91);

        v46 = +[UIKBEdgeEffect effectWithColor:@"UIKBColorBlack_Alpha20" edges:1 inset:-0.5 weight:0.5];
        [v7 addRenderEffect:v46];
        goto LABEL_29;
      }
      [v7 setBackgroundGradient:0];
      goto LABEL_30;
    case 13:
      v47 = [v7 symbolStyle];
      [v47 setUsesSymbolImage:1];

      [(UIKBRenderFactoryHWR_Portrait *)self symbolImageControlKeyFontSize];
      double v49 = v48;
      v50 = [v7 symbolStyle];
      [v50 setFontSizeForSymbolImage:v49];

      double v51 = *(double *)off_1E52D6BF8;
      v46 = [v7 symbolStyle];
      [v46 setFontWeightForSymbolImage:v51];
      goto LABEL_29;
    case 14:
    case 15:
    case 16:
    case 17:
    case 19:
    case 20:
      goto LABEL_30;
    case 18:
      v52 = [(UIKBRenderFactory *)self lightTextFontName];
      v53 = [v7 symbolStyle];
      [v53 setFontName:v52];

      v54 = [v7 symbolStyle];
      [v54 setFontSize:16.0];

      [(UIKBRenderFactoryHWR_Portrait *)self moreKeyTextOffset];
      double v56 = v55;
      double v58 = v57;
      v59 = [v7 symbolStyle];
      objc_msgSend(v59, "setTextOffset:", v56, v58);

      v46 = [v7 symbolStyle];
      [v46 setKerning:0.0];
      goto LABEL_29;
    case 21:
      goto LABEL_8;
    default:
      if (v8 == 3)
      {
        if (([v6 state] & 4) != 0)
        {
          v61 = [(UIKBRenderFactory *)self renderConfig];
          int v62 = [v61 lightKeyboard];
          v63 = UIKBColorHWRCellLightBackground;
          if (!v62) {
            v63 = UIKBColorHWRCellDarkBackground;
          }
          v64 = *v63;

          v65 = [(UIKBRenderFactory *)self renderConfig];
          int v66 = [v65 lightKeyboard];
          v67 = UIKBColorHWRCellLightBackgroundClear;
          if (!v66) {
            v67 = UIKBColorHWRCellDarkBackgroundClear;
          }
          v68 = *v67;

          v99[0] = v64;
          v99[1] = v64;
          v99[2] = v68;
          v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:3];
          v70 = +[UIKBGradient gradientWith3Colors:v69 middleLocation:0.5];

          [v7 setBackgroundGradient:v70];
        }
        else
        {
          v60 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorClear"];
          [v7 setBackgroundGradient:v60];
        }
        [v7 removeAllRenderEffects];
        v71 = [(UIKBRenderFactory *)self renderConfig];
        int v72 = [v71 whiteText];
        v73 = UIKBColorWhite_Alpha10;
        if (!v72) {
          v73 = UIKBColorBlack_Alpha10;
        }
        v74 = *v73;

        v75 = [(UIKBRenderFactory *)self renderConfig];
        int v76 = [v75 whiteText];
        v77 = @"UIKBColorWhite_Alpha0";
        if (!v76) {
          v77 = @"UIKBColorClear";
        }
        v78 = v77;

        v98[0] = v74;
        v98[1] = v74;
        v98[2] = v78;
        v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:3];
        v80 = +[UIKBGradient gradientWith3Colors:v79 middleLocation:0.5];

        v81 = +[UIKBEdgeEffect effectWithColor:0 edges:2 inset:-0.5 weight:0.5];

        [v81 setGradient:v80];
        [v7 addRenderEffect:v81];
        v82 = [v7 symbolStyle];
        objc_msgSend(v82, "setTextOffset:", 0.5, 2.0);
      }
      else if (v8 == 25)
      {
LABEL_8:
        [(UIKBRenderFactoryHWR_Portrait *)self spaceKeyFontSize];
        double v24 = v23;
        v25 = [v7 symbolStyle];
        [v25 setFontSize:v24];

        [(UIKBRenderFactoryHWR_Portrait *)self spaceKeyTextOffset];
        double v27 = v26;
        double v29 = v28;
        v30 = [v7 symbolStyle];
        objc_msgSend(v30, "setTextOffset:", v27, v29);

        if ([(UIKBRenderFactory10Key_Round *)self useRoundCorner])
        {
          v31 = [v7 symbolStyle];
          [v31 setKerning:0.0];
        }
        v32 = [v6 displayString];
        int v33 = [v32 containsString:@"Emoji"];

        if (v33)
        {
          v34 = [v7 symbolStyle];
          [v34 setUsesSymbolImage:1];

          v35 = [(UIKBRenderFactory *)self lightKeycapsFontName];
          v36 = [v7 symbolStyle];
          [v36 setFontName:v35];

          [(UIKBRenderFactoryHWR_Portrait *)self symbolImageControlKeyFontSize];
          double v38 = v37;
          v39 = [v7 symbolStyle];
          [v39 setFontSize:v38];

          double v40 = *(double *)off_1E52D6BE8;
          v41 = [v7 symbolStyle];
          [v41 setFontWeight:v40];

          [(UIKBRenderFactory10Key *)self symbolImageControlKeyOffset];
          double v43 = v42;
          double v45 = v44;
          v46 = [v7 symbolStyle];
          objc_msgSend(v46, "setTextOffset:", v43, v45);
LABEL_29:
        }
      }
LABEL_30:

      return v7;
  }
}

- (void)setupLayoutSegments
{
  double v3 = [(UIKBRenderFactory10Key_Round *)self controlKeyTraits];
  id v6 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v3];

  [v6 setKeyStates:3];
  objc_msgSend(v6, "addLayoutRect:asTriangle:", 0, 0.0, 0.75, 0.26, 0.25);
  objc_msgSend(v6, "addLayoutRect:asTriangle:", 0, 0.66, 0.75, 0.33, 0.25);
  [(UIKBRenderFactory *)self addLayoutSegment:v6];
  id v4 = [(UIKBRenderFactory10Key_Round *)self activeControlKeyTraits];
  BOOL v5 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v4];

  [v5 setKeyStates:4];
  objc_msgSend(v5, "addLayoutRect:asTriangle:", 0, 0.0, 0.75, 0.26, 0.25);
  objc_msgSend(v5, "addLayoutRect:asTriangle:", 0, 0.66, 0.75, 0.33, 0.25);
  [(UIKBRenderFactory *)self addLayoutSegment:v5];
}

@end
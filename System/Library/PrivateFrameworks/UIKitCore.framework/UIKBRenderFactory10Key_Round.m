@interface UIKBRenderFactory10Key_Round
- (BOOL)shouldUseRoundCornerForKey:(id)a3;
- (BOOL)useRoundCorner;
- (UIEdgeInsets)symbolFrameInsets;
- (UIEdgeInsets)wideShadowPaddleInsets;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)activeControlKeyTraits;
- (id)controlKeyBackgroundColorName;
- (id)controlKeyTraits;
- (id)defaultKeyShadowColorName;
- (id)shiftLockControlKeyTraits;
- (id)shiftedControlKeyTraits;
- (int64_t)lightHighQualityEnabledBlendForm;
- (unint64_t)edgesWithInsetsForKey:(id)a3 onKeyplane:(id)a4;
- (unint64_t)roundCornersForKey:(id)a3 onKeyplane:(id)a4;
- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5 onKeyplane:(id)a6;
- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6;
@end

@implementation UIKBRenderFactory10Key_Round

- (UIEdgeInsets)symbolFrameInsets
{
  double v2 = 3.0;
  double v3 = 3.0;
  double v4 = 3.0;
  double v5 = 3.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)wideShadowPaddleInsets
{
  double v2 = 18.0;
  double v3 = 6.0;
  double v4 = 28.0;
  double v5 = 6.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)useRoundCorner
{
  return 1;
}

- (unint64_t)edgesWithInsetsForKey:(id)a3 onKeyplane:(id)a4
{
  return 15;
}

- (unint64_t)roundCornersForKey:(id)a3 onKeyplane:(id)a4
{
  return -1;
}

- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5 onKeyplane:(id)a6
{
  id v30 = a4;
  id v9 = a6;
  id v10 = a3;
  [(UIKBRenderFactory *)self scale];
  double v12 = v11;
  double v13 = 5.0;
  if (v12 <= 2.0)
  {
    objc_msgSend(v30, "paddedFrame", 5.0);
    double v13 = 4.0;
    if (v14 > 42.0) {
      double v13 = 5.0;
    }
  }
  [v10 setRoundRectRadius:v13];
  [(UIKBRenderFactory10Key_Round *)self symbolFrameInsets];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  char v23 = [(UIKBRenderFactory10Key_Round *)self edgesWithInsetsForKey:v30 onKeyplane:v9];

  if ((v23 & 1) == 0) {
    double v16 = 0.0;
  }
  if ((v23 & 2) == 0) {
    double v18 = 0.0;
  }
  if ((v23 & 4) == 0) {
    double v20 = 0.0;
  }
  if ((v23 & 8) == 0) {
    double v22 = 0.0;
  }
  [v10 paddedFrame];
  objc_msgSend(v10, "setSymbolFrame:", v18 + v24, v16 + v26, v25 - (v22 + v18), v27 - (v16 + v20));
  [v10 symbolFrame];
  objc_msgSend(v10, "setPaddedFrame:", v28 + 0.0, v29 + 0.0);
}

- (id)defaultKeyShadowColorName
{
  double v2 = [(UIKBRenderFactory *)self renderConfig];
  int v3 = [v2 lightKeyboard];
  double v4 = UIKBColorBlack_Alpha35;
  if (!v3) {
    double v4 = UIKBColorBlack_Alpha40;
  }
  double v5 = *v4;

  return v5;
}

- (id)controlKeyBackgroundColorName
{
  if ([(UIKBRenderFactory10Key_Round *)self useRoundCorner])
  {
    int v3 = [(UIKBRenderFactory *)self _controlKeyBackgroundColorName];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKBRenderFactory10Key_Round;
    int v3 = [(UIKBRenderFactory10Key *)&v5 controlKeyBackgroundColorName];
  }
  return v3;
}

- (int64_t)lightHighQualityEnabledBlendForm
{
  if ([(UIKBRenderFactory10Key_Round *)self useRoundCorner]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIKBRenderFactory10Key_Round;
  return [(UIKBRenderFactory10Key *)&v4 lightHighQualityEnabledBlendForm];
}

- (id)controlKeyTraits
{
  if ([(UIKBRenderFactory10Key_Round *)self useRoundCorner])
  {
    int v3 = +[UIKBRenderTraits traitsWithSymbolStyle:0];
    [v3 setControlOpacities:1];
    objc_super v4 = [(UIKBRenderFactory10Key_Round *)self controlKeyBackgroundColorName];
    objc_super v5 = +[UIKBGradient gradientWithFlatColor:v4];
    [v3 setBackgroundGradient:v5];

    v6 = [(UIKBRenderFactory10Key *)self controlKeyForegroundColorName];
    if (v6)
    {
      v7 = +[UIKBGradient gradientWithFlatColor:v6];
      [v3 setLayeredForegroundGradient:v7];
    }
    else
    {
      [v3 setLayeredForegroundGradient:0];
    }
    v8 = [(UIKBRenderFactory10Key_Round *)self controlKeyShadowColorName];
    id v9 = +[UIKBEdgeEffect effectWithColor:v8 edges:4 inset:-1.0 weight:1.0];
    [v3 addRenderEffect:v9];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIKBRenderFactory10Key_Round;
    int v3 = [(UIKBRenderFactory10Key *)&v11 controlKeyTraits];
  }
  return v3;
}

- (id)activeControlKeyTraits
{
  if ([(UIKBRenderFactory10Key_Round *)self useRoundCorner])
  {
    int v3 = +[UIKBRenderTraits traitsWithSymbolStyle:0];
    [v3 setControlOpacities:0];
    objc_super v4 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
    objc_super v5 = +[UIKBGradient gradientWithFlatColor:v4];
    [v3 setBackgroundGradient:v5];

    v6 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorClear"];
    [v3 setLayeredForegroundGradient:v6];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIKBRenderFactory10Key_Round;
    int v3 = [(UIKBRenderFactory10Key *)&v8 activeControlKeyTraits];
  }
  return v3;
}

- (id)shiftedControlKeyTraits
{
  if (![(UIKBRenderFactory10Key_Round *)self useRoundCorner])
  {
    v12.receiver = self;
    v12.super_class = (Class)UIKBRenderFactory10Key_Round;
    uint64_t v6 = [(UIKBRenderFactory10Key *)&v12 shiftedControlKeyTraits];
LABEL_7:
    v7 = (void *)v6;
    goto LABEL_8;
  }
  int v3 = [(UIKBRenderFactory *)self renderConfig];
  char v4 = [v3 lightKeyboard];

  if ((v4 & 1) == 0)
  {
    uint64_t v6 = [(UIKBRenderFactory10Key_Round *)self shiftLockControlKeyTraits];
    goto LABEL_7;
  }
  objc_super v5 = [(UIKBRenderFactory *)self renderConfig];
  if ([v5 lightKeyboard]) {
    [(UIKBRenderFactory10Key_Round *)self activeControlKeyTraits];
  }
  else {
  v7 = [(UIKBRenderFactory10Key_Round *)self controlKeyTraits];
  }

  id v9 = [(UIKBRenderFactory *)self renderConfig];
  int v10 = [v9 lightKeyboard];

  if (v10)
  {
    objc_super v11 = +[UIKBTextStyle styleWithTextColor:@"UIKBColorBlack"];
    [v7 setSymbolStyle:v11];
  }
LABEL_8:
  return v7;
}

- (id)shiftLockControlKeyTraits
{
  int v3 = [(UIKBRenderFactory *)self renderConfig];
  int v4 = [v3 lightKeyboard];

  if (v4) {
    [(UIKBRenderFactory10Key_Round *)self shiftedControlKeyTraits];
  }
  else {
  objc_super v5 = +[UIKBRenderTraits emptyTraits];
  }
  return v5;
}

- (BOOL)shouldUseRoundCornerForKey:(id)a3
{
  return [a3 state] != 16;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v47.receiver = self;
  v47.super_class = (Class)UIKBRenderFactory10Key_Round;
  objc_super v8 = [(UIKBRenderFactory10Key *)&v47 _traitsForKey:v6 onKeyplane:v7];
  if (![(UIKBRenderFactory10Key_Round *)self useRoundCorner]) {
    goto LABEL_56;
  }
  unsigned int v9 = [v6 displayType];
  if (v9 == 12) {
    goto LABEL_56;
  }
  unsigned int v10 = v9;
  if (([v6 state] & 0x10) != 0 && v10 <= 0xD && ((1 << v10) & 0x2030) != 0)
  {
    [(UIKBRenderFactory10Key_Round *)self shouldUseRoundCornerForKey:v6];
    char v11 = 1;
  }
  else
  {
    if (![(UIKBRenderFactory10Key_Round *)self shouldUseRoundCornerForKey:v6]) {
      goto LABEL_54;
    }
    char v11 = 0;
  }
  [v8 setControlOpacities:0];
  objc_msgSend(v8, "setBlendForm:", -[UIKBRenderFactory enabledBlendForm](self, "enabledBlendForm"));
  unint64_t v12 = [(UIKBRenderFactory10Key_Round *)self roundCornersForKey:v6 onKeyplane:v7];
  double v13 = [v8 geometry];
  [v13 setRoundRectCorners:v12];

  double v14 = [(UIKBRenderFactory10Key *)self displayContentsForKey:v6];
  double v15 = [v8 geometry];
  [(UIKBRenderFactory10Key_Round *)self _customizeGeometry:v15 forKey:v6 contents:v14 onKeyplane:v7];

  if ((v11 & 1) == 0)
  {
    [v8 removeAllRenderEffects];
    double v16 = [(UIKBRenderFactory10Key_Round *)self defaultKeyShadowColorName];
    if (([v6 state] & 0x6C) == 0)
    {
      if ([(UIKBRenderFactory *)self useBlueThemingForKey:v6])
      {
LABEL_38:
        char v30 = [(UIKBRenderFactory10Key_Round *)self edgesWithInsetsForKey:v6 onKeyplane:v7];
        unint64_t v31 = ~v30 & 6;
        [v6 paddedFrame];
        double MinX = CGRectGetMinX(v49);
        [v6 frame];
        double v33 = MinX - CGRectGetMinX(v50);
        if ((~v30 & 6) != 0)
        {
          v34 = [(UIKBRenderFactory10Key *)self controlKeyDividerColorName];
          [(UIKBRenderFactory *)self translucentGapWidth];
          double v36 = -v35;
          if ((~v30 & 2) != 0) {
            double v37 = v36;
          }
          else {
            double v37 = 0.0;
          }
          if (v31 >= 4) {
            double v38 = v36;
          }
          else {
            double v38 = 0.0;
          }
          v39 = v16;
          if (v33 > 0.0)
          {
            double v37 = v37 - v33;
            v40 = +[UIKBEdgeEffect effectWithColor:v34 edges:2 inset:-v33 weight:v33];
            [v8 addRenderEffect:v40];
          }
          [(UIKBRenderFactory *)self translucentGapWidth];
          v42 = +[UIKBEdgeEffect effectWithColor:edges:insets:weight:](UIKBEdgeEffect, "effectWithColor:edges:insets:weight:", v34, v31, 0.0, v37, v38, 0.0, v41);
          [v8 addRenderEffect:v42];

          double v16 = v39;
        }
        if ((v30 & 4) != 0)
        {
          double v43 = 0.0;
          if ((v30 & 2) == 0)
          {
            [(UIKBRenderFactory *)self translucentGapWidth];
            double v43 = -v33 - v44;
          }
          v45 = +[UIKBEdgeEffect effectWithColor:edges:insets:weight:](UIKBEdgeEffect, "effectWithColor:edges:insets:weight:", v16, 4, 0.0, v43, -1.0, 0.0, 1.0);
          [v8 addRenderEffect:v45];
        }
        goto LABEL_53;
      }
      double v18 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
LABEL_37:
      double v29 = +[UIKBGradient gradientWithFlatColor:v18];
      [v8 setBackgroundGradient:v29];

      goto LABEL_38;
    }
    BOOL v17 = [v6 displayType] == 14 || objc_msgSend(v6, "displayType") == 11;
    double v19 = [(UIKBRenderFactory *)self renderConfig];
    int v20 = [v19 animatedBackground];

    if (v20)
    {
      double v18 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
      double v21 = +[UIKBGradient gradientWithFlatColor:@"UIKBColorWhite_Alpha10"];
      [v8 setLayeredForegroundGradient:v21];
LABEL_25:

      goto LABEL_37;
    }
    double v22 = [(UIKBRenderFactory *)self renderConfig];
    int v23 = [v22 lightKeyboard];

    if (v23)
    {
      if (!v17)
      {
        if (+[UIKBRenderFactory _graphicsQuality] == 10) {
          double v24 = UIKBColorLightGrayPressState;
        }
        else {
          double v24 = UIKBColorLightGrayPressState10Key;
        }
LABEL_35:
        double v25 = *v24;
        goto LABEL_36;
      }
    }
    else
    {
      if (!v17)
      {
        if ([v6 state] == 20)
        {
          double v18 = @"UIKBColorClear";

          double v16 = v18;
          goto LABEL_37;
        }
        if ([(id)objc_opt_class() _graphicsQuality] == 100)
        {
          double v26 = [(UIKBRenderFactory *)self renderingContext];
          char v27 = [v26 isFloating];

          if ((v27 & 1) == 0) {
            [v8 setBlendForm:6];
          }
          double v18 = @"UIKBColorKeyGrayKeyActiveDarkBackground";
          double v28 = @"UIKBColorClear";

          double v16 = v28;
          goto LABEL_37;
        }
        double v24 = UIKBColorKeyGrayKeyDarkBackground;
        goto LABEL_35;
      }
      if ([v6 displayType] != 11)
      {
        double v25 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
LABEL_36:
        double v18 = v25;
        goto LABEL_37;
      }
    }
    double v21 = [(UIKBRenderFactory *)self renderConfig];
    double v18 = [v21 activatedKeyplaneSwitchControlKeyBackgroundName];
    goto LABEL_25;
  }
LABEL_53:

LABEL_54:
  if ([v6 displayType] == 1) {
    [v8 setBackgroundGradient:0];
  }
LABEL_56:

  return v8;
}

- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6
{
  id rect_24 = a3;
  id v10 = a4;
  id v11 = a6;
  unint64_t v12 = [a5 renderConfig];
  int v13 = [v12 lightKeyboard];

  double v14 = UIKBColorGray_Percent37;
  if (v13) {
    double v14 = UIKBColorWhite;
  }
  double v15 = +[UIKBGradient gradientWithFlatColor:*v14];
  [rect_24 setBackgroundGradient:v15];

  [rect_24 removeAllRenderEffects];
  double v16 = +[UIKBShadowEffect effectWithColor:@"UIKBColorBlack_Alpha35", 0.0, 2.5, 1.0, 0.0, 1.0, 0.0, 3.0 offset insets weight];
  [rect_24 addRenderEffect:v16];

  [(UIKBRenderFactory10Key_Round *)self wideShadowPaddleInsets];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v25 = [(UIKBRenderFactory *)self renderingContext];
  char v26 = [v25 isFloating];

  if ((v26 & 1) == 0)
  {
    char v27 = +[UIKBShadowEffect effectWithColor:@"UIKBColorBlack_Alpha55", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v18, v20, v22 + 6.0, v24, 40.0 offset insets weight];
    [rect_24 addRenderEffect:v27];
  }
  double v28 = [(UIKBRenderFactory *)self renderConfig];
  int v29 = [v28 lightKeyboard];

  if (v29)
  {
    char v30 = +[UIKBEdgeEffect effectWithColor:@"UIKBColorBlack_Alpha12" edges:15 inset:-0.25 weight:0.5];
    [rect_24 addRenderEffect:v30];
  }
  if ([v10 displayType] == 13 || objc_msgSend(v10, "displayType") == 4) {
    unint64_t v31 = off_1E52D3B08;
  }
  else {
    unint64_t v31 = off_1E52D40B8;
  }
  v32 = [(__objc2_class *)*v31 sharedInstance];
  double v33 = +[UIKeyboardImpl activeInstance];
  v34 = [v33 _layout];

  [v34 bounds];
  objc_msgSend(v34, "convertRect:toView:", 0);
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  double v43 = [v34 window];
  [v43 frame];
  CGFloat v45 = v44;
  CGFloat rect = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;
  CGFloat v51 = v50;

  v90.origin.double x = v36;
  v90.origin.double y = v38;
  v90.size.width = v40;
  v90.size.height = v42;
  double rect_16 = CGRectGetMinY(v90);
  v91.origin.double x = v36;
  v91.origin.double y = v38;
  v91.size.width = v40;
  v91.size.height = v42;
  double rect_8 = CGRectGetMinX(v91);
  v92.origin.double x = v45;
  v92.origin.double y = v47;
  v92.size.width = v49;
  v92.size.height = v51;
  double Height = CGRectGetHeight(v92);
  v93.origin.double x = v36;
  v93.origin.double y = v38;
  v93.size.width = v40;
  v93.size.height = v42;
  double v53 = Height - CGRectGetMaxY(v93);
  v94.origin.double x = rect;
  v94.origin.double y = v47;
  v94.size.width = v49;
  v94.size.height = v51;
  double Width = CGRectGetWidth(v94);
  v95.origin.double x = v36;
  v95.origin.double y = v38;
  v95.size.width = v40;
  v95.size.height = v42;
  double v55 = Width - CGRectGetMaxX(v95);
  v56 = [rect_24 geometry];
  objc_msgSend(v56, "setLayoutMargins:", rect_16, rect_8, v53, v55);

  [v32 popupRect];
  double v58 = v57;
  double v60 = v59;
  double v62 = v61;
  double v64 = v63;
  [v10 paddedFrame];
  CGFloat v66 = v65;
  CGFloat v68 = v67;
  CGFloat v70 = v69;
  CGFloat v72 = v71;
  objc_msgSend(v34, "convertRect:fromView:", v32, v58, v60, v62, v64);
  v99.origin.double x = v73;
  v99.origin.double y = v74;
  v99.size.width = v75;
  v99.size.height = v76;
  v96.origin.double x = v66;
  v96.origin.double y = v68;
  v96.size.width = v70;
  v96.size.height = v72;
  CGRect v97 = CGRectUnion(v96, v99);
  CGRect v98 = CGRectInset(v97, -12.0, -2.0);
  double x = v98.origin.x;
  double y = v98.origin.y;
  double v79 = v98.size.width;
  double v80 = v98.size.height;
  v81 = [rect_24 geometry];
  objc_msgSend(v81, "setDisplayFrame:", x, y, v79, v80);

  [rect_24 setBlurBlending:1];
  v82 = [rect_24 geometry];
  [v82 setPopupBias:40];

  v83 = +[UIKBTextStyle styleWithFontName:v11 withFontSize:22.0];

  [rect_24 setSymbolStyle:v83];
  v84 = [rect_24 symbolStyle];
  [v84 setTextColor:@"UIKBColorClear"];

  if (+[UIKBRenderFactory _graphicsQuality] == 10) {
    [rect_24 removeAllRenderEffects];
  }
}

@end
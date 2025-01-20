@interface UIKBRenderFactory50On_Portrait
- (BOOL)shouldShowBottomRowEdge;
- (BOOL)shouldShowTopRowEdge;
- (UIEdgeInsets)symbolFrameInsets;
- (double)controlColumnWidthFactor;
- (double)deleteKeyFontSize;
- (double)keyCornerRadius;
- (double)keyplaneSwitchKeyFontSize;
- (double)returnKeyFontSize;
- (double)spaceKeyFontSize;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)messagesWriteboardKeyImageName;
- (int64_t)assetIdiom;
- (unint64_t)edgesWithInsetsForKey:(id)a3 onKeyplane:(id)a4;
- (unint64_t)roundCornersForKey:(id)a3 onKeyplane:(id)a4;
- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6;
- (void)setupLayoutSegments;
@end

@implementation UIKBRenderFactory50On_Portrait

- (int64_t)assetIdiom
{
  return 1;
}

- (double)keyCornerRadius
{
  return 5.0;
}

- (double)keyplaneSwitchKeyFontSize
{
  return 17.0;
}

- (double)returnKeyFontSize
{
  return 18.0;
}

- (double)spaceKeyFontSize
{
  return 17.0;
}

- (double)deleteKeyFontSize
{
  return 16.0;
}

- (id)messagesWriteboardKeyImageName
{
  return @"messages_writeboard_portrait.png";
}

- (BOOL)shouldShowTopRowEdge
{
  return 1;
}

- (BOOL)shouldShowBottomRowEdge
{
  return 1;
}

- (UIEdgeInsets)symbolFrameInsets
{
  double v2 = 4.0;
  double v3 = 4.0;
  double v4 = 4.0;
  double v5 = 4.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (unint64_t)edgesWithInsetsForKey:(id)a3 onKeyplane:(id)a4
{
  return [a3 groupNeighbor] ^ 0xF;
}

- (unint64_t)roundCornersForKey:(id)a3 onKeyplane:(id)a4
{
  char v4 = ~[(UIKBRenderFactory50On_Portrait *)self edgesWithInsetsForKey:a3 onKeyplane:a4];
  unint64_t v5 = (v4 & 3) == 0;
  if ((v4 & 9) == 0) {
    v5 |= 2uLL;
  }
  if ((v4 & 6) == 0) {
    v5 |= 4uLL;
  }
  if ((v4 & 0xC) != 0) {
    return v5;
  }
  else {
    return v5 | 8;
  }
}

- (void)_customizeTraits:(id)a3 forPopupForKey:(id)a4 withRenderingContext:(id)a5 keycapsFontName:(id)a6
{
  id v25 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  [v25 removeAllRenderEffects];
  v13 = +[UIKBTextStyle styleWithFontName:v11 withFontSize:22.0];

  [v25 setSymbolStyle:v13];
  v14 = [v12 renderConfig];

  int v15 = [v14 lightKeyboard];
  v16 = UIKBColorBlack;
  if (!v15) {
    v16 = UIKBColorWhite;
  }
  v17 = *v16;
  v18 = [v25 symbolStyle];
  [v18 setTextColor:v17];

  v19 = [(UIKBRenderFactory *)self defaultKeyBackgroundColorName];
  v20 = +[UIKBGradient gradientWithFlatColor:v19];
  [v25 setBackgroundGradient:v20];

  if ([v10 displayType] == 13
    || [v10 displayType] == 4
    || [v10 displayType] == 5)
  {
    v21 = [v25 symbolStyle];
    [v21 setUsesSymbolImage:1];

    [(UIKBRenderFactory10Key *)self symbolImageControlKeyFontSize];
    double v23 = v22;
    v24 = [v25 symbolStyle];
    [v24 setFontSizeForSymbolImage:v23];
  }
  [(UIKBRenderFactory10Key *)self modifyTraitsForDetachedInputSwitcher:v25 withKey:v10];
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6 = a3;
  v45.receiver = self;
  v45.super_class = (Class)UIKBRenderFactory50On_Portrait;
  v7 = [(UIKBRenderFactory10Key_Round *)&v45 _traitsForKey:v6 onKeyplane:a4];
  if ([v6 state] <= 3)
  {
    v8 = [v7 geometry];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17 = [v7 geometry];
    objc_msgSend(v17, "setDisplayFrame:", v10, v12, v14, v16);
  }
  int v18 = [v6 displayType];
  v19 = [v6 name];
  int v20 = [v19 isEqualToString:@"Facemark"];

  if (v20)
  {
    v21 = [(UIKBRenderFactory50On_Portrait *)self lightKeycapsFontName];
    double v22 = [v7 symbolStyle];
    [v22 setFontName:v21];

    double v23 = [v7 symbolStyle];
    v24 = v23;
    double v25 = 20.0;
LABEL_24:
    [v23 setFontSize:v25];
    goto LABEL_25;
  }
  v26 = [v6 displayString];
  if ([v26 length] == 1)
  {
    v27 = [v6 displayString];
    uint64_t v28 = [@"年月日時分" rangeOfString:v27];

    if (v28 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v24 = [v7 symbolStyle];
      [v24 setFontName:@"HiraKakuProN-W3"];
LABEL_25:

      goto LABEL_26;
    }
  }
  else
  {
  }
  if (v18 > 13)
  {
    if (v18 > 22)
    {
      if (v18 != 23)
      {
        if (v18 == 25)
        {
          [(UIKBRenderFactory50On_Portrait *)self spaceKeyFontSize];
          goto LABEL_23;
        }
        goto LABEL_33;
      }
      v40 = [(UIKBRenderFactory *)self renderConfig];
      int v41 = [v40 lightKeyboard];

      if (!v41)
      {
LABEL_35:
        v42 = [v7 symbolStyle];
        [v42 setUsesSymbolImage:1];

        [(UIKBRenderFactory10Key *)self symbolImageControlKeyFontSize];
        double v44 = v43;
        v24 = [v7 symbolStyle];
        [v24 setFontSizeForSymbolImage:v44];
        goto LABEL_25;
      }
      v39 = +[UIKBTextStyle styleWithTextColor:@"UIKBColorBlack"];
      [v7 setSymbolStyle:v39];
LABEL_32:

      goto LABEL_35;
    }
    if (v18 != 14)
    {
      if (v18 == 21)
      {
        [(UIKBRenderFactory50On_Portrait *)self returnKeyFontSize];
        double v31 = v30;
        v32 = [v7 symbolStyle];
        [v32 setFontSize:v31];

        v33 = [v7 symbolStyle];
        int v34 = [v33 usesSymbolImage];

        if (!v34) {
          goto LABEL_26;
        }
        [(UIKBRenderFactory10Key *)self symbolImageControlKeyFontSize];
        goto LABEL_23;
      }
      goto LABEL_33;
    }
LABEL_19:
    [(UIKBRenderFactory50On_Portrait *)self keyplaneSwitchKeyFontSize];
    goto LABEL_23;
  }
  if ((v18 - 10) < 2) {
    goto LABEL_19;
  }
  if (v18 == 2)
  {
    [(UIKBRenderFactory50On_Portrait *)self keyplaneSwitchKeyFontSize];
    double v38 = v37;
    v39 = [v7 symbolStyle];
    [v39 setFontSize:v38];
    goto LABEL_32;
  }
  if (v18 == 3)
  {
    [(UIKBRenderFactory50On_Portrait *)self deleteKeyFontSize];
LABEL_23:
    double v35 = v29;
    double v23 = [v7 symbolStyle];
    v24 = v23;
    double v25 = v35;
    goto LABEL_24;
  }
LABEL_33:
  if ([v6 interactionType] == 12
    || [v6 interactionType] == 17)
  {
    goto LABEL_35;
  }
LABEL_26:

  return v7;
}

- (double)controlColumnWidthFactor
{
  return 0.1;
}

- (void)setupLayoutSegments
{
  [(UIKBRenderFactory50On_Portrait *)self controlColumnWidthFactor];
  [(UIKBRenderFactory10Key *)self setupColumnLayoutSegmentsWithControlWidth:"setupColumnLayoutSegmentsWithControlWidth:"];
}

@end
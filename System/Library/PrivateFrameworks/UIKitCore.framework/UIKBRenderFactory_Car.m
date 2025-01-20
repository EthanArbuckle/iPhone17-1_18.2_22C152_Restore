@interface UIKBRenderFactory_Car
- (double)carScale;
- (double)defaultKeyFontSize;
- (double)skinnyKeyThreshold;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)activeKeyColor;
- (id)backgroundTraitsForKeyplane:(id)a3;
- (id)deleteKeyImageName;
- (id)deleteOnKeyImageName;
- (id)displayContentsForKey:(id)a3;
- (id)dividerColor;
- (id)enabledKeyColor;
- (id)globalKeyImageName;
- (id)highlightedKeyColor;
- (id)shiftKeyImageName;
- (id)shiftLockImageName;
- (id)shiftOnKeyImageName;
- (int64_t)assetIdiom;
- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5 onKeyplane:(id)a6;
- (void)customizeLanguageIndicatorTraitsForTraits:(id)a3;
@end

@implementation UIKBRenderFactory_Car

- (int64_t)assetIdiom
{
  return 3;
}

- (double)carScale
{
  [(UIKBRenderFactory *)self scale];
  double v4 = v3;
  double result = 2.0;
  if (v4 != 3.0)
  {
    [(UIKBRenderFactory *)self scale];
    return fmax(v6, 1.0);
  }
  return result;
}

- (id)dividerColor
{
  v2 = [(UIKBRenderFactory *)self renderConfig];
  int v3 = [v2 lightKeyboard];
  double v4 = UIKBColorCarLightDivider;
  if (!v3) {
    double v4 = UIKBColorCarDarkDivider;
  }
  v5 = *v4;

  return v5;
}

- (id)enabledKeyColor
{
  v2 = [(UIKBRenderFactory *)self renderConfig];
  int v3 = [v2 lightKeyboard];
  double v4 = UIKBColorBlack_Alpha18;
  if (!v3) {
    double v4 = UIKBColorWhite_Alpha15;
  }
  v5 = *v4;

  return v5;
}

- (id)activeKeyColor
{
  v2 = [(UIKBRenderFactory *)self renderConfig];
  int v3 = [v2 lightKeyboard];
  double v4 = UIKBColorKeyBlueKeyBackground;
  if (!v3) {
    double v4 = UIKBColorCarTeal;
  }
  v5 = *v4;

  return v5;
}

- (id)highlightedKeyColor
{
  v2 = [(UIKBRenderFactory *)self renderConfig];
  int v3 = [v2 lightKeyboard];
  double v4 = UIKBColorWhite;
  if (!v3) {
    double v4 = UIKBColorBlack;
  }
  v5 = *v4;

  return v5;
}

- (double)defaultKeyFontSize
{
  [(UIKBRenderFactory_Car *)self carScale];
  return 32.0 / v2;
}

- (id)globalKeyImageName
{
  return @"global.png";
}

- (id)deleteKeyImageName
{
  return @"delete.png";
}

- (id)deleteOnKeyImageName
{
  return @"delete-on.png";
}

- (id)shiftKeyImageName
{
  return @"shift.png";
}

- (id)shiftOnKeyImageName
{
  return @"shift-on.png";
}

- (id)shiftLockImageName
{
  return @"shift-lock.png";
}

- (double)skinnyKeyThreshold
{
  return -1.0;
}

- (id)displayContentsForKey:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UIKBRenderFactory_Car;
  double v4 = [(UIKBRenderFactory *)&v10 displayContentsForKey:a3];
  uint64_t v5 = [v4 displayStringImage];
  if (v5)
  {
    double v6 = (void *)v5;
    [(UIKBRenderFactory *)self scale];
    double v8 = v7;

    if (v8 == 1.0) {
      [v4 setForce1xImages:1];
    }
  }
  return v4;
}

- (id)backgroundTraitsForKeyplane:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIKBRenderFactory_Car;
  double v4 = [(UIKBRenderFactory *)&v8 backgroundTraitsForKeyplane:a3];
  uint64_t v5 = [(UIKBRenderFactory_Car *)self dividerColor];
  double v6 = +[UIKBGradient gradientWithFlatColor:v5];
  [v4 setBackgroundGradient:v6];

  return v4;
}

- (void)_customizeGeometry:(id)a3 forKey:(id)a4 contents:(id)a5 onKeyplane:(id)a6
{
  id v10 = a3;
  [v10 symbolFrame];
  objc_msgSend(v10, "setSymbolFrame:", v6 + 2.0, v8 + 3.0, v7 + -4.0, v9 + -6.0);
}

- (void)customizeLanguageIndicatorTraitsForTraits:(id)a3
{
  id v8 = a3;
  double v4 = [(UIKBRenderFactory_Car *)self enabledKeyColor];
  uint64_t v5 = +[UIKBGradient gradientWithFlatColor:v4];
  [v8 setBackgroundGradient:v5];

  double v6 = [(UIKBRenderFactory_Car *)self dividerColor];
  double v7 = +[UIKBGradient gradientWithFlatColor:v6];
  [v8 setLayeredBackgroundGradient:v7];

  [v8 setBlurBlending:1];
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 shape];
  double v9 = +[UIKBRenderGeometry geometryWithShape:v8];
  id v10 = +[UIKBRenderTraits traitsWithGeometry:v9];

  int v11 = [v6 state] & 0xC;
  int v12 = [v6 state] & 0x60;
  if (v11) {
    [(UIKBRenderFactory_Car *)self activeKeyColor];
  }
  else {
  v13 = [(UIKBRenderFactory_Car *)self enabledKeyColor];
  }
  if (v12)
  {
    v14 = [(UIKBRenderFactory *)self renderConfig];
    int v15 = [v14 lightKeyboard];
    v16 = UIKBColorCarLightShift;
    if (!v15) {
      v16 = UIKBColorCarDarkShift;
    }
    v17 = *v16;

    v13 = v17;
  }
  v18 = +[UIKBGradient gradientWithFlatColor:v13];
  [v10 setBackgroundGradient:v18];

  v19 = [(UIKBRenderFactory *)self lightTextFontName];
  [(UIKBRenderFactory_Car *)self defaultKeyFontSize];
  v20 = +[UIKBTextStyle styleWithFontName:withFontSize:](UIKBTextStyle, "styleWithFontName:withFontSize:", v19);

  if ([(UIKBRenderFactory *)self useBlueThemingForKey:v6])
  {
    v21 = [(UIKBRenderFactory_Car *)self activeKeyColor];
    if (!v11) {
      goto LABEL_15;
    }
LABEL_14:
    uint64_t v25 = [(UIKBRenderFactory_Car *)self highlightedKeyColor];

    v21 = (__CFString *)v25;
    goto LABEL_15;
  }
  v22 = [(UIKBRenderFactory *)self renderConfig];
  int v23 = [v22 lightKeyboard];
  v24 = UIKBColorBlack;
  if (!v23) {
    v24 = UIKBColorWhite;
  }
  v21 = *v24;

  if (v11) {
    goto LABEL_14;
  }
LABEL_15:
  if (v12)
  {
    uint64_t v26 = [(UIKBRenderFactory_Car *)self dividerColor];

    v21 = (__CFString *)v26;
  }
  v27 = [(UIKBRenderFactory_Car *)self displayContentsForKey:v6];
  if (![v6 displayType]) {
    goto LABEL_19;
  }
  v28 = [v27 displayString];
  [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  v43 = self;
  v29 = v21;
  v30 = v27;
  id v31 = v6;
  v32 = v20;
  v33 = v10;
  v34 = v13;
  v36 = id v35 = v7;
  [v28 rangeOfCharacterFromSet:v36];
  uint64_t v38 = v37;

  id v7 = v35;
  v13 = v34;
  id v10 = v33;
  v20 = v32;
  id v6 = v31;
  v27 = v30;
  v21 = v29;
  self = v43;

  if (!v38)
  {
LABEL_19:
    v39 = [(UIKBRenderFactory *)self lightKeycapsFontName];
    [v20 setFontName:v39];
  }
  [v20 setTextColor:v21];
  [v10 setSymbolStyle:v20];
  if ([v6 state] == 1)
  {
    v40 = [v10 symbolStyle];
    [v40 setTextOpacity:0.35];
  }
  v41 = [v10 geometry];
  [(UIKBRenderFactory_Car *)self _customizeGeometry:v41 forKey:v6 contents:v27 onKeyplane:v7];

  return v10;
}

@end
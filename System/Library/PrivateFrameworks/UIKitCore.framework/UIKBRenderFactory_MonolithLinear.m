@interface UIKBRenderFactory_MonolithLinear
- (BOOL)forceVariantsInsideKeyplane;
- (CGSize)pillControlKeyFocusIncreaseSize;
- (double)pillControlKeyFontSize;
- (double)pillControlKeyHeight;
- (id)_enabledTraitsForControlKey:(id)a3;
- (id)_highlightedTraitsForControlKey:(id)a3;
- (id)pillControlKeyPillBackgroundColor;
- (void)configureGeometry:(id)a3 forControlKey:(id)a4;
- (void)configureSymbolStyle:(id)a3 forControlKey:(id)a4;
@end

@implementation UIKBRenderFactory_MonolithLinear

- (double)pillControlKeyFontSize
{
  return 20.0;
}

- (double)pillControlKeyHeight
{
  return 64.0;
}

- (id)pillControlKeyPillBackgroundColor
{
  v2 = [(UIKBRenderFactory *)self renderConfig];
  v3 = _labelColorSecondary([v2 lightKeyboard]);

  return v3;
}

- (CGSize)pillControlKeyFocusIncreaseSize
{
  [(UIKBRenderFactory_Monolith *)self letterKeyFocusIncreaseSize];
  double v3 = 15.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (BOOL)forceVariantsInsideKeyplane
{
  return 1;
}

- (void)configureGeometry:(id)a3 forControlKey:(id)a4
{
  id v12 = a3;
  if ([a4 interactionType] == 15)
  {
    [v12 displayFrame];
    double v7 = v6;
    [(UIKBRenderFactory_MonolithLinear *)self pillControlKeyHeight];
    double v9 = (v7 - v8) * 0.5;
    [v12 displayFrame];
    objc_msgSend(v12, "setDisplayFrame:", v10 + 0.0, v11 + v9);
  }
}

- (void)configureSymbolStyle:(id)a3 forControlKey:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKBRenderFactory_MonolithLinear;
  id v7 = a4;
  [(UIKBRenderFactory_Monolith *)&v9 configureSymbolStyle:v6 forControlKey:v7];
  int v8 = objc_msgSend(v7, "interactionType", v9.receiver, v9.super_class);

  if (v8 == 15)
  {
    [(UIKBRenderFactory_MonolithLinear *)self pillControlKeyFontSize];
    objc_msgSend(v6, "setFontSize:");
  }
}

- (id)_enabledTraitsForControlKey:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)UIKBRenderFactory_MonolithLinear;
  id v4 = a3;
  v5 = [(UIKBRenderFactory_Monolith *)&v14 _enabledTraitsForControlKey:v4];
  int v6 = objc_msgSend(v4, "interactionType", v14.receiver, v14.super_class);

  if ((v6 - 9) >= 2)
  {
    if (v6 == 15)
    {
      [(UIKBRenderFactory_Monolith *)self controlKeyRectCornerRadius];
      double v8 = v7;
      objc_super v9 = [v5 geometry];
      [v9 setRoundRectRadius:v8];

      double v10 = [(UIKBRenderFactory_MonolithLinear *)self pillControlKeyPillBackgroundColor];
      double v11 = +[UIKBGradient gradientWithFlatColor:v10];
      [v5 setBackgroundGradient:v11];

      [v5 setRenderFlags:&unk_1ED3F01A8];
      id v12 = [v5 symbolStyle];
      [v12 setTextColor:@"UIKBColorBlack"];

      [v5 setBlendForm:4];
    }
  }
  else
  {
    [v5 setRenderFlags:&unk_1ED3F0190];
  }
  return v5;
}

- (id)_highlightedTraitsForControlKey:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)UIKBRenderFactory_MonolithLinear;
  id v4 = a3;
  v5 = [(UIKBRenderFactory_Monolith *)&v14 _highlightedTraitsForControlKey:v4];
  int v6 = objc_msgSend(v4, "interactionType", v14.receiver, v14.super_class);

  if (v6 == 15)
  {
    [(UIKBRenderFactory_Monolith *)self controlKeyRectCornerRadius];
    double v8 = v7;
    objc_super v9 = [v5 geometry];
    [v9 setRoundRectRadius:v8];

    double v10 = [(UIKBRenderFactory_Monolith *)self highlightedTextColor];
    double v11 = +[UIKBGradient gradientWithFlatColor:v10];
    [v5 setBackgroundGradient:v11];

    [v5 setRenderFlags:&unk_1ED3F01C0];
    id v12 = [v5 symbolStyle];
    [v12 setTextColor:@"UIKBColorBlack"];

    [v5 setBlendForm:4];
    [(UIKBRenderFactory_MonolithLinear *)self pillControlKeyFocusIncreaseSize];
    objc_msgSend(v5, "setFloatingContentViewFocusedIncreaseSize:");
  }
  return v5;
}

@end
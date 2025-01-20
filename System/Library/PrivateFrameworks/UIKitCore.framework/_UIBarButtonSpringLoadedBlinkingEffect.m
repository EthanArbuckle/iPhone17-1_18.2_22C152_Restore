@interface _UIBarButtonSpringLoadedBlinkingEffect
- (void)_prepareLayer:(id)a3 forView:(id)a4;
@end

@implementation _UIBarButtonSpringLoadedBlinkingEffect

- (void)_prepareLayer:(id)a3 forView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v7 visualProvider];
    v9 = [v8 pointerShapeInContainer:v7];

    [v9 rect];
    objc_msgSend(v6, "setFrame:");
    v10 = [v9 cornerCurve];
    [v6 setCornerCurve:v10];

    [v9 cornerRadius];
    objc_msgSend(v6, "setCornerRadius:");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIBarButtonSpringLoadedBlinkingEffect;
    [(_UISpringLoadedBlinkingEffect *)&v11 _prepareLayer:v6 forView:v7];
  }
}

@end
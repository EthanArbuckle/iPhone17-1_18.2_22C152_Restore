@interface UIKBRenderFactoryiPadPasscode
- (double)passcodeEdgeWeight;
- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4;
- (id)defaultKeyBackgroundColorName;
- (id)hashStringElement;
@end

@implementation UIKBRenderFactoryiPadPasscode

- (id)defaultKeyBackgroundColorName
{
  return @"UIKBColorClear";
}

- (double)passcodeEdgeWeight
{
  return 1.5;
}

- (id)hashStringElement
{
  v2 = NSNumber;
  v3 = [(UIKBRenderFactory *)self renderConfig];
  [v3 keycapOpacity];
  v4 = objc_msgSend(v2, "numberWithDouble:");

  return v4;
}

- (id)_traitsForKey:(id)a3 onKeyplane:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)UIKBRenderFactoryiPadPasscode;
  id v6 = a4;
  id v7 = a3;
  v8 = [(UIKBRenderFactoryiPad *)&v12 _traitsForKey:v7 onKeyplane:v6];
  -[UIKBRenderFactory modifyKeyTraitsForPasscode:forKey:onKeyplane:](self, "modifyKeyTraitsForPasscode:forKey:onKeyplane:", v8, v7, v6, v12.receiver, v12.super_class);

  BOOL v9 = [(UIKBRenderFactoryiPhone *)self _popupStyleForKey:v7];
  if (v9)
  {
    v10 = [(UIKBRenderFactoryiPadPasscode *)self activeControlKeyTraits];
    [v8 overlayWithTraits:v10];
  }
  return v8;
}

@end
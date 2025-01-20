@interface CardShadowSettings
+ (id)darkButtonShadowSettings;
+ (id)darkCardMacShadowSettings;
+ (id)darkCardShadowSettings;
+ (id)lightButtonShadowSettings;
+ (id)lightCardMacShadowSettings;
+ (id)lightCardShadowSettings;
+ (id)settingsForTraitCollection:(id)a3 button:(BOOL)a4;
- (CardShadowSettings)initWithRadius:(double)a3 opacity:(double)a4 rimOpacity:(double)a5 cornerRadius:(double)a6;
- (double)cornerRadius;
- (double)expansion;
- (double)opacity;
- (double)radius;
- (double)rimOpacity;
@end

@implementation CardShadowSettings

- (double)rimOpacity
{
  return self->_rimOpacity;
}

- (double)radius
{
  return self->_radius;
}

- (double)opacity
{
  return self->_opacity;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

+ (id)settingsForTraitCollection:(id)a3 button:(BOOL)a4
{
  id v6 = a3;
  id v7 = [v6 userInterfaceStyle];
  id v8 = [v6 userInterfaceIdiom];

  if (v7 == (id)2)
  {
    if (v8 == (id)5)
    {
      v9 = [a1 darkCardMacShadowSettings];
      goto LABEL_13;
    }
    if (a4) {
      [a1 darkButtonShadowSettings];
    }
    else {
      [a1 darkCardShadowSettings];
    }
  }
  else
  {
    if (v8 == (id)5)
    {
      v9 = [a1 lightCardMacShadowSettings];
      goto LABEL_13;
    }
    if (a4) {
      [a1 lightButtonShadowSettings];
    }
    else {
      [a1 lightCardShadowSettings];
    }
  v9 = };
LABEL_13:

  return v9;
}

+ (id)lightButtonShadowSettings
{
  id v2 = [objc_alloc((Class)a1) initWithRadius:7.0 opacity:0.150000006 rimOpacity:0.0500000007 cornerRadius:9.0];

  return v2;
}

- (CardShadowSettings)initWithRadius:(double)a3 opacity:(double)a4 rimOpacity:(double)a5 cornerRadius:(double)a6
{
  v14.receiver = self;
  v14.super_class = (Class)CardShadowSettings;
  v10 = [(CardShadowSettings *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_radius = a3;
    v10->_opacity = a4;
    v10->_rimOpacity = a5;
    v10->_cornerRadius = a6;
    v12 = v10;
  }

  return v11;
}

- (double)expansion
{
  return ceil(self->_radius);
}

+ (id)lightCardShadowSettings
{
  id v2 = objc_alloc((Class)a1);
  id v3 = [v2 initWithRadius:15.0 opacity:0.0799999982 rimOpacity:0.0700000003 cornerRadius:_UISheetCornerRadius];

  return v3;
}

+ (id)darkCardShadowSettings
{
  id v2 = objc_alloc((Class)a1);
  id v3 = [v2 initWithRadius:15.0 opacity:0.217999995 rimOpacity:0.135100007 cornerRadius:_UISheetCornerRadius];

  return v3;
}

+ (id)darkButtonShadowSettings
{
  id v2 = [objc_alloc((Class)a1) initWithRadius:7.0 opacity:0.234999999 rimOpacity:0.116499998 cornerRadius:9.0];

  return v2;
}

+ (id)lightCardMacShadowSettings
{
  id v2 = objc_alloc((Class)a1);
  id v3 = [v2 initWithRadius:15.0 opacity:0.200000003 rimOpacity:0.100000001 cornerRadius:_UISheetCornerRadius];

  return v3;
}

+ (id)darkCardMacShadowSettings
{
  id v2 = objc_alloc((Class)a1);
  id v3 = [v2 initWithRadius:15.0 opacity:0.217999995 rimOpacity:0.135100007 cornerRadius:_UISheetCornerRadius];

  return v3;
}

@end
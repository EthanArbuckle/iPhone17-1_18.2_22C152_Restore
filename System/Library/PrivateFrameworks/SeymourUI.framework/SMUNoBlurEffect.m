@interface SMUNoBlurEffect
+ (id)effectWithStyle:(int64_t)a3;
- (id)effectSettings;
@end

@implementation SMUNoBlurEffect

+ (id)effectWithStyle:(int64_t)a3
{
  return (id)[a1 _effectWithStyle:a3 tintColor:0 invertAutomaticStyle:0];
}

- (id)effectSettings
{
  v4.receiver = self;
  v4.super_class = (Class)SMUNoBlurEffect;
  v2 = [(UIBlurEffect *)&v4 effectSettings];
  [v2 setBlurRadius:0.0];
  [v2 setUsesBackdropEffectView:0];

  return v2;
}

@end
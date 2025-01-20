@interface _UIWallpaperEffectEntry
- (BOOL)canTransitionToEffect:(id)a3;
- (BOOL)isSameTypeOfEffect:(id)a3;
- (UIColor)backgroundColor;
- (void)addEffectToView:(id)a3;
- (void)applyIdentityEffectToView:(id)a3;
- (void)applyRequestedEffectToView:(id)a3;
- (void)setBackgroundColor:(id)a3;
@end

@implementation _UIWallpaperEffectEntry

- (void)addEffectToView:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIWallpaperEffectEntry *)self backgroundColor];
  [v4 setBackgroundColor:v5];
}

- (void)applyRequestedEffectToView:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIWallpaperEffectEntry *)self backgroundColor];
  [v4 setBackgroundColor:v5];
}

- (void)applyIdentityEffectToView:(id)a3
{
  id v3 = a3;
  id v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];
}

- (BOOL)canTransitionToEffect:(id)a3
{
  return 1;
}

- (BOOL)isSameTypeOfEffect:(id)a3
{
  return 1;
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface _UIBarCustomizationCustomViewPortalSourceContainer
+ (id)sharedContainer;
- (_UIBarCustomizationCustomViewPortalSourceContainer)init;
- (void)setAlpha:(double)a3;
@end

@implementation _UIBarCustomizationCustomViewPortalSourceContainer

+ (id)sharedContainer
{
  if (_MergedGlobals_1156 != -1) {
    dispatch_once(&_MergedGlobals_1156, &__block_literal_global_383);
  }
  v2 = (void *)qword_1EB261DD0;
  return v2;
}

- (_UIBarCustomizationCustomViewPortalSourceContainer)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIBarCustomizationCustomViewPortalSourceContainer;
  v2 = [(UIView *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(_UIBarCustomizationCustomViewPortalSourceContainer *)v2 setAlpha:0.0];
    [(UIView *)v3 setInsetsLayoutMarginsFromSafeArea:0];
  }
  return v3;
}

- (void)setAlpha:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIBarCustomizationCustomViewPortalSourceContainer;
  [(UIView *)&v3 setAlpha:0.0];
}

@end
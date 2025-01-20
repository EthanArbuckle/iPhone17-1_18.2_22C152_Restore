@interface SBUILegibilityShadowView
- (BOOL)_updateFilters;
- (id)_contentColor;
- (void)setImage:(id)a3 strengthenedImage:(id)a4 strength:(double)a5;
@end

@implementation SBUILegibilityShadowView

- (BOOL)_updateFilters
{
  v14.receiver = self;
  v14.super_class = (Class)SBUILegibilityShadowView;
  BOOL v3 = [(SBUILegibilityContainerView *)&v14 _updateFilters];
  v13.receiver = self;
  v13.super_class = (Class)SBUILegibilityShadowView;
  v4 = [(SBUILegibilityContainerView *)&v13 legibilitySettings];
  v5 = [(SBUILegibilityShadowView *)self layer];
  if (!v4)
  {
LABEL_5:
    v6 = [v5 compositingFilter];
    v7 = v6;
    v8 = (uint64_t *)MEMORY[0x1E4F3A2B8];
    goto LABEL_8;
  }
  [v4 shadowSettings];
  if (v12 == 2)
  {
    v6 = [v5 compositingFilter];
    v7 = v6;
    v8 = (uint64_t *)MEMORY[0x1E4F3A228];
  }
  else
  {
    if (v12 != 1)
    {
      if (v12) {
        goto LABEL_10;
      }
      goto LABEL_5;
    }
    v6 = [v5 compositingFilter];
    v7 = v6;
    v8 = (uint64_t *)MEMORY[0x1E4F3A078];
  }
LABEL_8:
  uint64_t v9 = *v8;
  char v10 = [v6 isEqual:*v8];

  if ((v10 & 1) == 0)
  {
    [v5 setCompositingFilter:v9];
    BOOL v3 = 1;
  }
LABEL_10:

  return v3;
}

- (id)_contentColor
{
  v2 = [(SBUILegibilityContainerView *)self legibilitySettings];
  BOOL v3 = [v2 shadowColor];

  return v3;
}

- (void)setImage:(id)a3 strengthenedImage:(id)a4 strength:(double)a5
{
  v5.receiver = self;
  v5.super_class = (Class)SBUILegibilityShadowView;
  [(SBUILegibilityContainerView *)&v5 setImage:a3 strengthenedImage:a4 strength:a5];
}

@end
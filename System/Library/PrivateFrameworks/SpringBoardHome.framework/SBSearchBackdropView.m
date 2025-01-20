@interface SBSearchBackdropView
+ (int64_t)_builtInMaterialRecipeForStyle:(int64_t)a3;
- (BOOL)isTransitioningToBlurred;
- (SBSearchBackdropView)initWithFrame:(CGRect)a3;
- (SBSearchBackdropView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (double)transitionProgress;
- (id)_materialViewForStyle:(int64_t)a3;
- (void)completeTransitionSuccessfully:(BOOL)a3;
- (void)prepareForTransitionToBlurred:(BOOL)a3;
- (void)setTransitionProgress:(double)a3;
@end

@implementation SBSearchBackdropView

- (SBSearchBackdropView)initWithFrame:(CGRect)a3
{
  return -[SBSearchBackdropView initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBSearchBackdropView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBSearchBackdropView;
  v5 = -[SBSearchBackdropView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    char v6 = SBHIsSpotlightFloatingWindowEnabled();
    if (a4 == 1 || (v6 & 1) == 0)
    {
      v7 = [(SBSearchBackdropView *)v5 _materialViewForStyle:a4];
      if (v7)
      {
        objc_storeStrong((id *)&v5->_materialView, v7);
        materialView = v5->_materialView;
        [(SBSearchBackdropView *)v5 bounds];
        -[MTMaterialView setFrame:](materialView, "setFrame:");
        [(MTMaterialView *)v5->_materialView setShouldCrossfade:1];
        [(MTMaterialView *)v5->_materialView setAutoresizingMask:18];
        [(SBSearchBackdropView *)v5 addSubview:v5->_materialView];
      }
    }
  }
  return v5;
}

- (void)prepareForTransitionToBlurred:(BOOL)a3
{
  self->_transitioningToBlurred = a3;
  [(SBSearchBackdropView *)self setTransitionProgress:0.0];
}

- (void)completeTransitionSuccessfully:(BOOL)a3
{
}

- (void)setTransitionProgress:(double)a3
{
  self->_transitionProgress = a3;
  if (!self->_transitioningToBlurred) {
    a3 = 1.0 - a3;
  }
  [(MTMaterialView *)self->_materialView setWeighting:a3];
}

- (id)_materialViewForStyle:(int64_t)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  if (a3 == 4)
  {
    v12 = (void *)MEMORY[0x1E4F743C8];
    v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v11 = [v12 materialViewWithRecipeNamed:@"coplanarLeadingTrailingBackgroundBlur" inBundle:v13 options:0 initialWeighting:0 scaleAdjustment:1.0];
  }
  else if (a3 == 3)
  {
    v4 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:0];
    v16[0] = v4;
    v17[0] = @"knowledgeBackgroundZoomed";
    v5 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:1];
    v16[1] = v5;
    v17[1] = @"knowledgeBackgroundZoomed";
    char v6 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
    v16[2] = v6;
    v17[2] = @"knowledgeBackgroundDarkZoomed";
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

    v8 = (void *)MEMORY[0x1E4F743C8];
    v9 = SBHBundle();
    objc_super v10 = [(SBSearchBackdropView *)self traitCollection];
    v11 = [v8 materialViewWithRecipeNamesByTraitCollection:v7 inBundle:v9 options:0 initialWeighting:0 scaleAdjustment:v10 compatibleWithTraitCollection:0.0];
  }
  else
  {
    uint64_t v14 = [(id)objc_opt_class() _builtInMaterialRecipeForStyle:a3];
    if (v14)
    {
      v11 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:v14];
    }
    else
    {
      v11 = 0;
    }
  }
  return v11;
}

+ (int64_t)_builtInMaterialRecipeForStyle:(int64_t)a3
{
  if (a3) {
    return 4 * (a3 == 2);
  }
  else {
    return 14;
  }
}

- (BOOL)isTransitioningToBlurred
{
  return self->_transitioningToBlurred;
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (void).cxx_destruct
{
}

@end
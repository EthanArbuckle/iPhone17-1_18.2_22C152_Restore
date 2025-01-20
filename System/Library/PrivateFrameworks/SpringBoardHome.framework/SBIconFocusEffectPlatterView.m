@interface SBIconFocusEffectPlatterView
- (MTMaterialView)materialView;
- (SBIconFocusEffectPlatterView)initWithFrame:(CGRect)a3;
- (UIView)vibrantFillView;
- (void)layoutSubviews;
@end

@implementation SBIconFocusEffectPlatterView

- (SBIconFocusEffectPlatterView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBIconFocusEffectPlatterView;
  v3 = -[SBIconFocusEffectPlatterView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SBIconFocusEffectPlatterView *)v3 layer];
    [v5 setAllowsGroupOpacity:1];

    [(SBIconFocusEffectPlatterView *)v4 setClipsToBounds:1];
    uint64_t v6 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:MTMaterialRecipeForUIBlurEffectStyle()];
    materialView = v4->_materialView;
    v4->_materialView = (MTMaterialView *)v6;

    [(SBIconFocusEffectPlatterView *)v4 addSubview:v4->_materialView];
    v8 = [(MTMaterialView *)v4->_materialView visualStylingProviderForCategory:2];
    uint64_t v9 = [v8 newAutomaticallyUpdatingViewWithStyle:0];
    vibrantFillView = v4->_vibrantFillView;
    v4->_vibrantFillView = (UIView *)v9;

    [(SBIconFocusEffectPlatterView *)v4 addSubview:v4->_vibrantFillView];
  }
  return v4;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SBIconFocusEffectPlatterView;
  [(SBIconFocusEffectPlatterView *)&v5 layoutSubviews];
  materialView = self->_materialView;
  [(SBIconFocusEffectPlatterView *)self bounds];
  -[MTMaterialView setFrame:](materialView, "setFrame:");
  vibrantFillView = self->_vibrantFillView;
  [(SBIconFocusEffectPlatterView *)self bounds];
  -[UIView setFrame:](vibrantFillView, "setFrame:");
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (UIView)vibrantFillView
{
  return self->_vibrantFillView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrantFillView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
}

@end
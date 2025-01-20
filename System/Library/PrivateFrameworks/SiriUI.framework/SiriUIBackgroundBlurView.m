@interface SiriUIBackgroundBlurView
- (MTMaterialView)materialView;
- (SiriUIBackgroundBlurView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setMaterialView:(id)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation SiriUIBackgroundBlurView

- (SiriUIBackgroundBlurView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SiriUIBackgroundBlurView;
  v3 = -[SiriUIBackgroundBlurView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SiriUIBackgroundBlurView *)v3 setAutoresizingMask:18];
    uint64_t v5 = [MEMORY[0x263F53FE8] materialViewWithRecipeNamed:@"knowledgeBackground" inBundle:0 configuration:1 initialWeighting:&__block_literal_global_4 scaleAdjustment:1.0];
    materialView = v4->_materialView;
    v4->_materialView = (MTMaterialView *)v5;

    v7 = [(MTMaterialView *)v4->_materialView layer];
    [v7 setAllowsHitTesting:0];

    [(MTMaterialView *)v4->_materialView setOverrideUserInterfaceStyle:2];
    [(MTMaterialView *)v4->_materialView setRecipeDynamic:0];
    [(MTMaterialView *)v4->_materialView setShouldCrossfade:1];
    [(MTMaterialView *)v4->_materialView setWeighting:0.0];
    [(SiriUIBackgroundBlurView *)v4 addSubview:v4->_materialView];
    v8 = [(SiriUIBackgroundBlurView *)v4 layer];
    [v8 setAllowsGroupBlending:0];
  }
  return v4;
}

double __42__SiriUIBackgroundBlurView_initWithFrame___block_invoke()
{
  return 1.0;
}

- (void)setVisible:(BOOL)a3
{
  materialView = self->_materialView;
  double v4 = 0.0;
  if (a3) {
    double v4 = 1.0;
  }
  [(MTMaterialView *)materialView setWeighting:v4];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUIBackgroundBlurView;
  [(SiriUIBackgroundBlurView *)&v4 layoutSubviews];
  materialView = self->_materialView;
  [(SiriUIBackgroundBlurView *)self bounds];
  -[MTMaterialView setFrame:](materialView, "setFrame:");
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
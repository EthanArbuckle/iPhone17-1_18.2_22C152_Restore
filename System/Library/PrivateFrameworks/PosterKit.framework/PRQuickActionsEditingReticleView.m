@interface PRQuickActionsEditingReticleView
- (BOOL)isActive;
- (BOOL)showsEmptyView;
- (PRQuickActionsEditingReticleView)init;
- (void)layoutSubviews;
- (void)setActive:(BOOL)a3;
- (void)setShowsEmptyView:(BOOL)a3;
@end

@implementation PRQuickActionsEditingReticleView

- (PRQuickActionsEditingReticleView)init
{
  v36[4] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)PRQuickActionsEditingReticleView;
  v2 = [(PRQuickActionsEditingReticleView *)&v35 init];
  if (v2)
  {
    v3 = (BSUIVibrancyEffectView *)objc_alloc_init(MEMORY[0x1E4F4F8F0]);
    vibrancyView = v2->_vibrancyView;
    v2->_vibrancyView = v3;

    [(BSUIVibrancyEffectView *)v2->_vibrancyView setUserInteractionEnabled:0];
    [(BSUIVibrancyEffectView *)v2->_vibrancyView setBlurEnabled:PREditingSupportsLiveBlurs()];
    [(PRQuickActionsEditingReticleView *)v2 addSubview:v2->_vibrancyView];
    v5 = objc_alloc_init(PREditingReticleView);
    reticleView = v2->_reticleView;
    v2->_reticleView = v5;

    [(PREditingReticleView *)v2->_reticleView setAutoresizingMask:18];
    v7 = [(BSUIVibrancyEffectView *)v2->_vibrancyView contentView];
    [v7 addSubview:v2->_reticleView];

    v8 = (void *)MEMORY[0x1E4FB1818];
    v9 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
    v34 = [v8 systemImageNamed:@"plus" withConfiguration:v9];

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v34];
    plusImageView = v2->_plusImageView;
    v2->_plusImageView = (UIImageView *)v10;

    v12 = v2->_plusImageView;
    v13 = (void *)MEMORY[0x1E4FB1618];
    v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v15 = [v14 objectForKey:@"PRReticleBorderColor"];
    v16 = v15;
    if (!v15) {
      v15 = &unk_1ED9EF220;
    }
    [v15 doubleValue];
    v17 = objc_msgSend(v13, "colorWithWhite:alpha:");
    [(UIImageView *)v12 setTintColor:v17];

    [(UIImageView *)v2->_plusImageView setContentMode:1];
    [(UIImageView *)v2->_plusImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = [(BSUIVibrancyEffectView *)v2->_vibrancyView contentView];
    [v18 addSubview:v2->_plusImageView];

    [(UIImageView *)v2->_plusImageView setHidden:1];
    v28 = (void *)MEMORY[0x1E4F28DC8];
    v33 = [(UIImageView *)v2->_plusImageView heightAnchor];
    v32 = [(PRQuickActionsEditingReticleView *)v2 heightAnchor];
    v31 = [v33 constraintEqualToAnchor:v32 multiplier:0.5];
    v36[0] = v31;
    v30 = [(UIImageView *)v2->_plusImageView widthAnchor];
    v29 = [(PRQuickActionsEditingReticleView *)v2 widthAnchor];
    v19 = [v30 constraintEqualToAnchor:v29 multiplier:0.5];
    v36[1] = v19;
    v20 = [(UIImageView *)v2->_plusImageView centerYAnchor];
    v21 = [(PRQuickActionsEditingReticleView *)v2 centerYAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v36[2] = v22;
    v23 = [(UIImageView *)v2->_plusImageView centerXAnchor];
    v24 = [(PRQuickActionsEditingReticleView *)v2 centerXAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v36[3] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
    [v28 activateConstraints:v26];
  }
  return v2;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PRQuickActionsEditingReticleView;
  [(PRQuickActionsEditingReticleView *)&v11 layoutSubviews];
  [(PRQuickActionsEditingReticleView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[BSUIVibrancyEffectView setFrame:](self->_vibrancyView, "setFrame:");
  -[PREditingReticleView setFrame:](self->_reticleView, "setFrame:", v4, v6, v8, v10);
  [(PREditingReticleView *)self->_reticleView setOutlineBorderCornerRadius:v10 * 0.5];
}

- (BOOL)isActive
{
  return [(PREditingReticleView *)self->_reticleView isActive];
}

- (void)setActive:(BOOL)a3
{
}

- (void)setShowsEmptyView:(BOOL)a3
{
  if (self->_showsEmptyView != a3)
  {
    self->_showsEmptyView = a3;
    [(UIImageView *)self->_plusImageView setHidden:!a3];
  }
}

- (BOOL)showsEmptyView
{
  return self->_showsEmptyView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plusImageView, 0);
  objc_storeStrong((id *)&self->_reticleView, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
}

@end
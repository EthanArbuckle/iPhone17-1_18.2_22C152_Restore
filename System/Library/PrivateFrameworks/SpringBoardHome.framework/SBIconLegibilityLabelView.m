@interface SBIconLegibilityLabelView
- (SBIconLabelImageParameters)imageParameters;
- (SBIconLegibilityLabelView)initWithSettings:(id)a3;
- (SBIconLegibilityLabelView)initWithSettings:(id)a3 legibilityEngine:(id)a4;
- (SBIconView)iconView;
- (void)setIconView:(id)a3;
- (void)setImageParameters:(id)a3;
- (void)updateIconLabelWithSettings:(id)a3 imageParameters:(id)a4;
@end

@implementation SBIconLegibilityLabelView

- (void)updateIconLabelWithSettings:(id)a3 imageParameters:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  v7 = [(SBIconLegibilityLabelView *)self imageParameters];
  v8 = v7;
  if ((v6 != 0) == (v7 != 0)
    && [v7 isEqual:v6]
    && ([(SBUILegibilityView *)self image],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v10 = [(SBUILegibilityView *)self image];
  }
  else if (v6)
  {
    v11 = [(SBIconLegibilityLabelView *)self iconView];
    v10 = [v11 labelImageWithParameters:v6];
    if (!v10)
    {
      v10 = +[SBIconLabelImage imageWithParameters:v6];
    }
    [(SBIconLegibilityLabelView *)self setImageParameters:v6];
  }
  else
  {
    v10 = 0;
  }
  if ([v6 containsEmoji])
  {
    BOOL v12 = [v24 style] == 2;
    v13 = v24;
    unsigned int v14 = !v12;
    uint64_t v15 = 2 * v14;
  }
  else
  {
    uint64_t v15 = 2;
    v13 = v24;
  }
  +[SBIconLabelImage legibilityStrengthForLegibilityStyle:](SBIconLabelImage, "legibilityStrengthForLegibilityStyle:", [v13 style]);
  double v17 = v16;
  v18 = SBLogLegibility();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);

  if (v19)
  {
    v20 = [(SBUILegibilityView *)self userInfo];
    uint64_t v21 = [v6 text];
    v22 = (void *)v21;
    if (v21) {
      v23 = (__CFString *)v21;
    }
    else {
      v23 = @"(Undefined)";
    }
    [v20 setObject:v23 forKey:@"underlyingText"];
  }
  [(SBUILegibilityView *)self updateForChangedSettings:v24 options:v15 image:v10 strength:v17];
}

- (SBIconLabelImageParameters)imageParameters
{
  return self->_imageParameters;
}

- (void)setImageParameters:(id)a3
{
}

- (SBIconView)iconView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconView);
  return (SBIconView *)WeakRetained;
}

- (SBIconLegibilityLabelView)initWithSettings:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FA7C98];
  id v5 = a3;
  id v6 = [v4 defaultEngine];
  v7 = [(SBIconLegibilityLabelView *)self initWithSettings:v5 legibilityEngine:v6];

  return v7;
}

- (SBIconLegibilityLabelView)initWithSettings:(id)a3 legibilityEngine:(id)a4
{
  id v5 = a4;
  id v6 = [(SBIconLegibilityLabelView *)self init];
  v7 = v6;
  if (v6) {
    [(SBUILegibilityView *)v6 setLegibilityEngine:v5];
  }

  return v7;
}

- (void)setIconView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageParameters, 0);
  objc_destroyWeak((id *)&self->_iconView);
}

@end
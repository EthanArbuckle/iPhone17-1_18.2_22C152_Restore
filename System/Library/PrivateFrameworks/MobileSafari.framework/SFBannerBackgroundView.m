@interface SFBannerBackgroundView
- (SFBannerBackgroundView)initWithEffect:(id)a3;
- (int64_t)bannerStyle;
- (void)_updateStyle;
- (void)_updateVibrancy;
- (void)setBannerStyle:(int64_t)a3;
@end

@implementation SFBannerBackgroundView

- (SFBannerBackgroundView)initWithEffect:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)SFBannerBackgroundView;
  v3 = [(SFBannerBackgroundView *)&v9 initWithEffect:a3];
  v4 = v3;
  if (v3)
  {
    [(SFBannerBackgroundView *)v3 _updateStyle];
    v10[0] = objc_opt_class();
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v6 = (id)[(SFBannerBackgroundView *)v4 registerForTraitChanges:v5 withTarget:v4 action:sel__updateVibrancy];

    v7 = v4;
  }

  return v4;
}

- (void)setBannerStyle:(int64_t)a3
{
  if (self->_bannerStyle != a3)
  {
    self->_bannerStyle = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __41__SFBannerBackgroundView_setBannerStyle___block_invoke;
    v3[3] = &unk_1E54E9858;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
  }
}

uint64_t __41__SFBannerBackgroundView_setBannerStyle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStyle];
}

- (void)_updateStyle
{
  int64_t bannerStyle = self->_bannerStyle;
  if (bannerStyle)
  {
    if (bannerStyle != 1) {
      goto LABEL_6;
    }
    double v4 = 8.0;
  }
  else
  {
    double v4 = 10.0;
  }
  [(SFBannerBackgroundView *)self _setContinuousCornerRadius:v4];
LABEL_6:

  [(SFBannerBackgroundView *)self _updateVibrancy];
}

- (void)_updateVibrancy
{
  v3 = [(SFBannerBackgroundView *)self traitCollection];
  int v4 = objc_msgSend(v3, "sf_usesVibrantAppearance");

  if (v4)
  {
    v5 = [(SFBannerBackgroundView *)self contentView];
    [v5 setBackgroundColor:0];

    int64_t bannerStyle = self->_bannerStyle;
    uint64_t v7 = 10;
    if (bannerStyle != 1) {
      uint64_t v7 = 0;
    }
    if (bannerStyle) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 6;
    }
    id v12 = [MEMORY[0x1E4FB14C8] effectWithStyle:v8];
    -[SFBannerBackgroundView setEffect:](self, "setEffect:");
  }
  else
  {
    [(SFBannerBackgroundView *)self setEffect:0];
    int64_t v9 = self->_bannerStyle;
    if (v9 == 1)
    {
      uint64_t v10 = [MEMORY[0x1E4FB1618] tertiarySystemGroupedBackgroundColor];
    }
    else
    {
      if (v9) {
        return;
      }
      uint64_t v10 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    }
    id v12 = (id)v10;
    v11 = [(SFBannerBackgroundView *)self contentView];
    [v11 setBackgroundColor:v12];
  }
}

- (int64_t)bannerStyle
{
  return self->_bannerStyle;
}

@end
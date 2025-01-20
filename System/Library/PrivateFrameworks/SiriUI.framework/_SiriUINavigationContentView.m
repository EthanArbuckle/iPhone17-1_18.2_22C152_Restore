@interface _SiriUINavigationContentView
- (BOOL)isContentLayoutEnabled;
- (UIView)contentView;
- (_SiriUINavigationContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setContentLayoutEnabled:(BOOL)a3;
- (void)setContentView:(id)a3;
@end

@implementation _SiriUINavigationContentView

- (_SiriUINavigationContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_SiriUINavigationContentView;
  v3 = -[_SiriUINavigationContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_contentLayoutEnabled = 1;
    v3->_supportsSAE = [MEMORY[0x263F286B8] isSAEEnabled];
  }
  return v4;
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)_SiriUINavigationContentView;
  [(_SiriUINavigationContentView *)&v35 layoutSubviews];
  if (self->_contentLayoutEnabled)
  {
    [(_SiriUINavigationContentView *)self safeAreaInsets];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(_SiriUINavigationContentView *)self bounds];
    uint64_t v31 = v14;
    uint64_t v33 = v13;
    double v15 = v12 - (v4 + v8);
    if (self->_supportsSAE)
    {
      [(_SiriUINavigationContentView *)self bounds];
      double v17 = v16;
      double v19 = v18;
    }
    else
    {
      double v17 = v11 - (v6 + v10);
      double v19 = v12 - (v4 + v8);
    }
    v20 = [(_SiriUINavigationContentView *)self contentView];
    objc_msgSend(v20, "sizeThatFits:", v17, v15);
    double v22 = v21;
    double v24 = v23;

    if (self->_supportsSAE)
    {
      BOOL IsPhone = SiriUIDeviceIsPhone();
      BOOL v26 = v17 > v19;
      double v27 = 0.0;
      double v28 = v8;
      if (IsPhone && v26) {
        double v29 = v4;
      }
      else {
        double v29 = 0.0;
      }
      if (IsPhone && v26) {
        double v22 = v17 - v4 - v28;
      }
      else {
        double v22 = v17;
      }
    }
    else
    {
      double v29 = v6 + v34;
      double v27 = v4 + v32;
      if (v24 >= v15) {
        double v19 = v15;
      }
      else {
        double v19 = v24;
      }
    }
    v30 = [(_SiriUINavigationContentView *)self contentView];
    objc_msgSend(v30, "setFrame:", v29, v27, v22, v19);
  }
}

- (void)setContentView:(id)a3
{
  p_contentView = &self->_contentView;
  double v7 = (UIView *)a3;
  if (*p_contentView != v7)
  {
    double v6 = [(_SiriUINavigationContentView *)self contentView];
    [v6 removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    [(UIView *)*p_contentView recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];
    [(_SiriUINavigationContentView *)self addSubview:v7];
  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (BOOL)isContentLayoutEnabled
{
  return self->_contentLayoutEnabled;
}

- (void)setContentLayoutEnabled:(BOOL)a3
{
  self->_contentLayoutEnabled = a3;
}

- (void).cxx_destruct
{
}

@end
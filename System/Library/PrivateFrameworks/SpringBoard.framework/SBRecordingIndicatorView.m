@interface SBRecordingIndicatorView
+ (Class)layerClass;
- (SBRecordingIndicatorView)initWithCoder:(id)a3;
- (SBRecordingIndicatorView)initWithFrame:(CGRect)a3;
- (unint64_t)indicatorType;
- (void)_resetSecureLayerIndicatorType;
- (void)layoutSubviews;
- (void)setIndicatorType:(unint64_t)a3;
@end

@implementation SBRecordingIndicatorView

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)SBRecordingIndicatorView;
  [(SBRecordingIndicatorView *)&v8 layoutSubviews];
  if ([(SBRecordingIndicatorView *)self indicatorType] > 1)
  {
    v5 = [(SBRecordingIndicatorView *)self layer];
    v6 = v5;
    double v7 = 0.0;
  }
  else
  {
    [(SBRecordingIndicatorView *)self bounds];
    double v4 = v3 * 0.5;
    v5 = [(SBRecordingIndicatorView *)self layer];
    v6 = v5;
    double v7 = v4;
  }
  [v5 setCornerRadius:v7];

  [(SBRecordingIndicatorView *)self _setAllowsHighContrastForBackgroundColor:1];
}

- (unint64_t)indicatorType
{
  return self->_indicatorType;
}

- (void)setIndicatorType:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_indicatorType != a3)
  {
    self->_indicatorType = a3;
    v5 = [(SBRecordingIndicatorView *)self layer];
    v6 = CAPrivacyIndicatorTypeForIndicatorType((id)a3);
    double v7 = [v5 privacyIndicatorType];

    if (v6 != v7)
    {
      objc_super v8 = SBLogStatusBarish();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] updating secure indicator type for view-dot to %@", (uint8_t *)&v9, 0xCu);
      }

      [v5 setPrivacyIndicatorType:v6];
      [(SBRecordingIndicatorView *)self setNeedsLayout];
      [(SBRecordingIndicatorView *)self layoutIfNeeded];
    }
  }
}

- (SBRecordingIndicatorView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBRecordingIndicatorView;
  double v3 = -[SBRecordingIndicatorView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    -[SBRecordingIndicatorView _resetSecureLayerIndicatorType]((id *)&v3->super.super.super.isa);
  }
  return v4;
}

- (void)_resetSecureLayerIndicatorType
{
  if (a1)
  {
    CAPrivacyIndicatorTypeForIndicatorType(a1[51]);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = objc_opt_class();
    double v3 = [a1 layer];
    double v4 = SBSafeCast(v2, v3);

    [v4 setPrivacyIndicatorType:v5];
  }
}

- (SBRecordingIndicatorView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBRecordingIndicatorView;
  double v3 = [(SBRecordingIndicatorView *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    -[SBRecordingIndicatorView _resetSecureLayerIndicatorType]((id *)&v3->super.super.super.isa);
  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
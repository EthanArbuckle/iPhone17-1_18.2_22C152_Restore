@interface SFUnreadIndicator
- (CGSize)intrinsicContentSize;
- (SFUnreadIndicator)initWithFrame:(CGRect)a3;
- (void)tintColorDidChange;
@end

@implementation SFUnreadIndicator

- (CGSize)intrinsicContentSize
{
  double v2 = 10.0;
  double v3 = 10.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)SFUnreadIndicator;
  [(SFUnreadIndicator *)&v4 tintColorDidChange];
  double v3 = [(SFUnreadIndicator *)self tintColor];
  [(UIView *)self->_indicator setBackgroundColor:v3];
}

- (SFUnreadIndicator)initWithFrame:(CGRect)a3
{
  v22[4] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)SFUnreadIndicator;
  double v3 = -[SFUnreadIndicator initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3)
  {
    [(SFUnreadIndicator *)v3 setUserInteractionEnabled:0];
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    indicator = v4->_indicator;
    v4->_indicator = v5;

    [(UIView *)v4->_indicator _setCornerRadius:5.0];
    [(UIView *)v4->_indicator setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFUnreadIndicator *)v4 addSubview:v4->_indicator];
    v18 = (void *)MEMORY[0x1E4F28DC8];
    v20 = [(UIView *)v4->_indicator centerXAnchor];
    v19 = [(SFUnreadIndicator *)v4 centerXAnchor];
    v7 = [v20 constraintEqualToAnchor:v19];
    v22[0] = v7;
    v8 = [(UIView *)v4->_indicator centerYAnchor];
    v9 = [(SFUnreadIndicator *)v4 centerYAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v22[1] = v10;
    v11 = [(UIView *)v4->_indicator widthAnchor];
    v12 = [v11 constraintEqualToConstant:10.0];
    v22[2] = v12;
    v13 = [(UIView *)v4->_indicator heightAnchor];
    v14 = [v13 constraintEqualToConstant:10.0];
    v22[3] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
    [v18 activateConstraints:v15];

    v16 = v4;
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end
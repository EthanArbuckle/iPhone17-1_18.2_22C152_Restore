@interface MTSettingsWithActionHeaderView
- (CGRect)_contentViewLayoutRect;
- (MTSettingHeaderAction)action;
- (MTSettingsWithActionHeaderView)initWithReuseIdentifier:(id)a3;
- (UIButton)actionButton;
- (id)_actionButtonDisplayTitleForActionTitle:(id)a3;
- (void)_reloadActionButtonContent;
- (void)_updateButtonFontAndTextAlignment;
- (void)actionButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAction:(id)a3;
@end

@implementation MTSettingsWithActionHeaderView

- (MTSettingsWithActionHeaderView)initWithReuseIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MTSettingsWithActionHeaderView;
  v3 = [(MTSettingsWithActionHeaderView *)&v8 initWithReuseIdentifier:a3];
  if (v3)
  {
    uint64_t v4 = +[UIButton buttonWithType:1];
    actionButton = v3->_actionButton;
    v3->_actionButton = (UIButton *)v4;

    [(UIButton *)v3->_actionButton addTarget:v3 action:"actionButtonTapped:" forControlEvents:64];
    v6 = [(MTSettingsWithActionHeaderView *)v3 contentView];
    [v6 addSubview:v3->_actionButton];
  }
  return v3;
}

- (void)setAction:(id)a3
{
  v5 = (MTSettingHeaderAction *)a3;
  p_action = &self->_action;
  if (self->_action != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_action, a3);
    p_action = (MTSettingHeaderAction **)[(MTSettingsWithActionHeaderView *)self _reloadActionButtonContent];
    v5 = v7;
  }

  _objc_release_x1(p_action, v5);
}

- (void)actionButtonTapped:(id)a3
{
  id v3 = [(MTSettingsWithActionHeaderView *)self action];
  [v3 performAction];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)MTSettingsWithActionHeaderView;
  [(MTSettingsWithActionHeaderView *)&v3 prepareForReuse];
  [(MTSettingsWithActionHeaderView *)self setAction:0];
}

- (void)layoutSubviews
{
  [(MTSettingsWithActionHeaderView *)self _updateButtonFontAndTextAlignment];
  [(MTSettingsWithActionHeaderView *)self _contentViewLayoutRect];
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;
  double v7 = CGRectGetWidth(v27);
  objc_super v8 = [(MTSettingsWithActionHeaderView *)self actionButton];
  [v8 frame];
  [(MTSettingsWithActionHeaderView *)self setMaxTitleWidth:v7 - CGRectGetWidth(v28) + -12.0];

  v26.receiver = self;
  v26.super_class = (Class)MTSettingsWithActionHeaderView;
  [(MTSettingsWithActionHeaderView *)&v26 layoutSubviews];
  LODWORD(v8) = [(MTSettingsWithActionHeaderView *)self mt_isRTL];
  v9 = [(MTSettingsWithActionHeaderView *)self actionButton];
  [v9 frame];
  double v14 = sub_10014D0C4((int)v8, 3, 3, v10, v11, v12, v13, x, y, width, height);
  double v16 = v15;
  double v18 = v17;

  v19 = [(MTSettingsWithActionHeaderView *)self textLabel];
  [v19 mt_baselineOriginY];
  double v21 = v20;
  v22 = [(MTSettingsWithActionHeaderView *)self actionButton];
  [v22 mt_firstBaselineOffsetFromTop];
  double v24 = v21 - v23;

  v25 = [(MTSettingsWithActionHeaderView *)self actionButton];
  [v25 setFrame:v14, v24, v16, v18];
}

- (void)_reloadActionButtonContent
{
  objc_super v3 = [(MTSettingsWithActionHeaderView *)self actionButton];
  uint64_t v4 = [(MTSettingsWithActionHeaderView *)self action];
  v5 = [v4 title];
  v6 = [(MTSettingsWithActionHeaderView *)self _actionButtonDisplayTitleForActionTitle:v5];

  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  CGFloat v11 = sub_10009B074;
  CGFloat v12 = &unk_10054D9B0;
  id v13 = v3;
  id v14 = v6;
  id v7 = v6;
  id v8 = v3;
  +[UIView performWithoutAnimation:&v9];
  [(MTSettingsWithActionHeaderView *)self setNeedsLayout];
}

- (void)_updateButtonFontAndTextAlignment
{
  if ([(MTSettingsWithActionHeaderView *)self mt_isRTL]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(MTSettingsWithActionHeaderView *)self actionButton];
  v5 = [v4 titleLabel];
  [v5 setTextAlignment:v3];

  id v12 = [(MTSettingsWithActionHeaderView *)self actionButton];
  v6 = [(MTSettingsWithActionHeaderView *)self textLabel];
  id v7 = [v6 font];

  if (v7)
  {
    id v8 = [v12 titleLabel];
    v9 = [v8 font];
    unsigned __int8 v10 = [v7 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      CGFloat v11 = [v12 titleLabel];
      [v11 setFont:v7];

      [v12 sizeToFit];
    }
  }
}

- (CGRect)_contentViewLayoutRect
{
  v2 = [(MTSettingsWithActionHeaderView *)self contentView];
  [v2 bounds];
  [v2 layoutMargins];
  [v2 layoutMargins];
  UIRectInset();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (id)_actionButtonDisplayTitleForActionTitle:(id)a3
{
  id v3 = a3;
  double v4 = +[NSLocale currentLocale];
  double v5 = [v3 uppercaseStringWithLocale:v4];

  return v5;
}

- (MTSettingHeaderAction)action
{
  return self->_action;
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

@end
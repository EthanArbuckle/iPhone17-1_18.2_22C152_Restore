@interface RCTrimDeleteButton
- (RCTrimDeleteButton)initWithFrame:(CGRect)a3;
- (id)_accessibilityIdentifier;
- (id)_accessibilityLabel;
- (id)_configurationUpdateHandlerWithTitle:(id)a3;
- (id)_largeContentTitle;
- (id)_title;
- (void)_commonInit;
@end

@implementation RCTrimDeleteButton

- (RCTrimDeleteButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCTrimDeleteButton;
  v3 = -[RCPointerInteractionButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(RCTrimDeleteButton *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  id v7 = [(RCTrimDeleteButton *)self _title];
  v3 = [(RCTrimDeleteButton *)self _configurationUpdateHandlerWithTitle:v7];
  [(RCTrimDeleteButton *)self setConfigurationUpdateHandler:v3];

  v4 = [(RCTrimDeleteButton *)self _accessibilityLabel];
  [(RCTrimDeleteButton *)self setAccessibilityLabel:v4];

  v5 = [(RCTrimDeleteButton *)self _accessibilityIdentifier];
  [(RCTrimDeleteButton *)self setAccessibilityIdentifier:v5];

  objc_super v6 = [(RCTrimDeleteButton *)self _largeContentTitle];
  [(RCTrimDeleteButton *)self setLargeContentTitle:v6];
}

- (id)_configurationUpdateHandlerWithTitle:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100041BEC;
  v7[3] = &unk_1002216A0;
  id v8 = a3;
  id v3 = v8;
  v4 = objc_retainBlock(v7);
  v5 = objc_retainBlock(v4);

  return v5;
}

- (id)_title
{
  return &stru_100228BC8;
}

- (id)_accessibilityLabel
{
  return &stru_100228BC8;
}

- (id)_accessibilityIdentifier
{
  return &stru_100228BC8;
}

- (id)_largeContentTitle
{
  return &stru_100228BC8;
}

@end
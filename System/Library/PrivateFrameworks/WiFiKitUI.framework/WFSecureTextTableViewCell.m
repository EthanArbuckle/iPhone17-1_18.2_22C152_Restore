@interface WFSecureTextTableViewCell
- (BOOL)canBecomeFirstResponder;
- (BOOL)hideSecureText;
- (NSString)credentials;
- (UIFont)placeholderFont;
- (WFSecureTextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)awakeFromNib;
- (void)setCredentials:(id)a3;
- (void)setHideSecureText:(BOOL)a3;
- (void)setPlaceholderFont:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation WFSecureTextTableViewCell

- (WFSecureTextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)WFSecureTextTableViewCell;
  v4 = [(WFSecureTextTableViewCell *)&v12 initWithStyle:1 reuseIdentifier:a4];
  v5 = [(WFSecureTextTableViewCell *)v4 defaultContentConfiguration];
  v6 = [v5 secondaryTextProperties];
  [v6 setNumberOfLines:0];

  v7 = [v5 secondaryTextProperties];
  v8 = [v7 font];
  uint64_t v9 = [v8 copy];
  placeholderFont = v4->_placeholderFont;
  v4->_placeholderFont = (UIFont *)v9;

  [(WFSecureTextTableViewCell *)v4 setContentConfiguration:v5];
  return v4;
}

- (void)setHideSecureText:(BOOL)a3
{
  BOOL v3 = a3;
  id v14 = [(WFSecureTextTableViewCell *)self contentConfiguration];
  if (v3)
  {
    v5 = [(WFSecureTextTableViewCell *)self credentials];
    v6 = [v5 placeholderStringWithMaxCharacters:20];
    [v14 setSecondaryText:v6];

    v7 = [(WFSecureTextTableViewCell *)self placeholderFont];
    v8 = [v14 secondaryTextProperties];
    [v8 setFont:v7];
  }
  else
  {
    uint64_t v9 = [v14 secondaryTextProperties];
    [v9 setNumberOfLines:0];

    v10 = [(WFSecureTextTableViewCell *)self credentials];
    [v14 setSecondaryText:v10];

    v11 = (void *)MEMORY[0x263F81708];
    v7 = [v14 secondaryTextProperties];
    v8 = [v7 font];
    [v8 pointSize];
    objc_super v12 = objc_msgSend(v11, "monospacedSystemFontOfSize:weight:");
    v13 = [v14 secondaryTextProperties];
    [v13 setFont:v12];
  }
  [(WFSecureTextTableViewCell *)self setContentConfiguration:v14];
}

- (void)awakeFromNib
{
  v2.receiver = self;
  v2.super_class = (Class)WFSecureTextTableViewCell;
  [(WFSecureTextTableViewCell *)&v2 awakeFromNib];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)WFSecureTextTableViewCell;
  [(WFSecureTextTableViewCell *)&v4 setSelected:a3 animated:a4];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)hideSecureText
{
  return self->_hideSecureText;
}

- (NSString)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(id)a3
{
}

- (UIFont)placeholderFont
{
  return self->_placeholderFont;
}

- (void)setPlaceholderFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderFont, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
}

@end
@interface PKLinkedAppView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKLinkedAppContentView)linkedAppView;
- (PKLinkedAppView)initWithCoder:(id)a3;
- (PKLinkedAppView)initWithLinkedApplication:(id)a3 reuseIdentifier:(id)a4;
- (PKLinkedAppView)initWithStoreIDs:(id)a3 systemAppBundleIdentifiers:(id)a4 appLaunchURL:(id)a5 reuseIdentifier:(id)a6;
- (PKLinkedAppView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)buttonBackgroundColor;
- (UIColor)buttonTintColor;
- (UIColor)mainLabelColor;
- (UIColor)subTextLabelColor;
- (void)layoutSubviews;
- (void)setButtonBackgroundColor:(id)a3;
- (void)setButtonTintColor:(id)a3;
- (void)setMainLabelColor:(id)a3;
- (void)setSubTextLabelColor:(id)a3;
@end

@implementation PKLinkedAppView

- (PKLinkedAppView)initWithCoder:(id)a3
{
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"This class is not NSCoding compliant"];

  return [(PKLinkedAppView *)self init];
}

- (PKLinkedAppView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return [(PKLinkedAppView *)self initWithStoreIDs:0 systemAppBundleIdentifiers:0 appLaunchURL:0 reuseIdentifier:a4];
}

- (PKLinkedAppView)initWithStoreIDs:(id)a3 systemAppBundleIdentifiers:(id)a4 appLaunchURL:(id)a5 reuseIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[PKLinkedApplication alloc] initWithStoreIDs:v13 systemAppBundleIdentifiers:v12 defaultLaunchURL:v11];

  v15 = [(PKLinkedAppView *)self initWithLinkedApplication:v14 reuseIdentifier:v10];
  return v15;
}

- (PKLinkedAppView)initWithLinkedApplication:(id)a3 reuseIdentifier:(id)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKLinkedAppView;
  v7 = [(PKLinkedAppView *)&v20 initWithStyle:0 reuseIdentifier:a4];
  if (v7)
  {
    v8 = [[PKLinkedAppContentView alloc] initWithLinkedApplication:v6];
    linkedAppView = v7->_linkedAppView;
    v7->_linkedAppView = v8;

    id v10 = [(PKLinkedAppView *)v7 contentView];
    [v10 addSubview:v7->_linkedAppView];

    [(PKLinkedAppView *)v7 setSelectionStyle:0];
    uint64_t v11 = [MEMORY[0x1E4FB1618] labelColor];
    mainLabelColor = v7->_mainLabelColor;
    v7->_mainLabelColor = (UIColor *)v11;

    uint64_t v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    subTextLabelColor = v7->_subTextLabelColor;
    v7->_subTextLabelColor = (UIColor *)v13;

    uint64_t v15 = [MEMORY[0x1E4FB1618] systemBlueColor];
    buttonTintColor = v7->_buttonTintColor;
    v7->_buttonTintColor = (UIColor *)v15;

    uint64_t v17 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
    buttonBackgroundColor = v7->_buttonBackgroundColor;
    v7->_buttonBackgroundColor = (UIColor *)v17;
  }
  return v7;
}

- (CGSize)intrinsicContentSize
{
  [(PKLinkedAppContentView *)self->_linkedAppView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKLinkedAppContentView sizeThatFits:](self->_linkedAppView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKLinkedAppView;
  [(PKLinkedAppView *)&v4 layoutSubviews];
  linkedAppView = self->_linkedAppView;
  [(PKLinkedAppView *)self bounds];
  -[PKLinkedAppContentView setFrame:](linkedAppView, "setFrame:");
}

- (void)setMainLabelColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_mainLabelColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_mainLabelColor, a3);
    v5 = v6;
  }
}

- (void)setSubTextLabelColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_subTextLabelColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_subTextLabelColor, a3);
    v5 = v6;
  }
}

- (void)setButtonBackgroundColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_buttonBackgroundColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_buttonBackgroundColor, a3);
    v5 = v6;
  }
}

- (void)setButtonTintColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_buttonTintColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_buttonTintColor, a3);
    v5 = v6;
  }
}

- (PKLinkedAppContentView)linkedAppView
{
  return self->_linkedAppView;
}

- (UIColor)mainLabelColor
{
  return self->_mainLabelColor;
}

- (UIColor)subTextLabelColor
{
  return self->_subTextLabelColor;
}

- (UIColor)buttonBackgroundColor
{
  return self->_buttonBackgroundColor;
}

- (UIColor)buttonTintColor
{
  return self->_buttonTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTintColor, 0);
  objc_storeStrong((id *)&self->_buttonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_subTextLabelColor, 0);
  objc_storeStrong((id *)&self->_mainLabelColor, 0);

  objc_storeStrong((id *)&self->_linkedAppView, 0);
}

@end
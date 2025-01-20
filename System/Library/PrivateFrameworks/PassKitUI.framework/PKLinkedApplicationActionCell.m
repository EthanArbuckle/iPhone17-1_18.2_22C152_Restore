@interface PKLinkedApplicationActionCell
- (NSArray)storeIDs;
- (NSURL)appLaunchURL;
- (PKLinkedApplication)linkedApplication;
- (PKLinkedApplicationActionCell)initWithCoder:(id)a3;
- (PKLinkedApplicationActionCell)initWithLinkedApplication:(id)a3 reuseIdentifier:(id)a4;
- (PKLinkedApplicationActionCell)initWithStoreIDs:(id)a3 appLaunchURL:(id)a4 reuseIdentifier:(id)a5;
- (PKLinkedApplicationActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)disabledTextColor;
- (UIColor)textColor;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)linkedApplicationDidChangeState:(id)a3;
- (void)reloadApplicationStateIfNecessary;
- (void)setAppLaunchURL:(id)a3;
- (void)setDisabledTextColor:(id)a3;
- (void)setStoreIDs:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation PKLinkedApplicationActionCell

- (PKLinkedApplicationActionCell)initWithCoder:(id)a3
{
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"This class is not NSCoding compliant"];

  return [(PKLinkedApplicationActionCell *)self init];
}

- (PKLinkedApplicationActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return [(PKLinkedApplicationActionCell *)self initWithStoreIDs:0 appLaunchURL:0 reuseIdentifier:a4];
}

- (PKLinkedApplicationActionCell)initWithStoreIDs:(id)a3 appLaunchURL:(id)a4 reuseIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [[PKLinkedApplication alloc] initWithStoreIDs:v10 defaultLaunchURL:v9];

  v12 = [(PKLinkedApplicationActionCell *)self initWithLinkedApplication:v11 reuseIdentifier:v8];
  return v12;
}

- (PKLinkedApplicationActionCell)initWithLinkedApplication:(id)a3 reuseIdentifier:(id)a4
{
  v6 = (PKLinkedApplication *)a3;
  v10.receiver = self;
  v10.super_class = (Class)PKLinkedApplicationActionCell;
  v7 = [(PKLinkedApplicationActionCell *)&v10 initWithStyle:0 reuseIdentifier:a4];
  if (v7)
  {
    id v8 = v6;
    if (!v6) {
      id v8 = [[PKLinkedApplication alloc] initWithStoreIDs:0 defaultLaunchURL:0];
    }
    objc_storeStrong((id *)&v7->_linkedApplication, v8);
    if (!v6) {

    }
    [(PKLinkedApplication *)v7->_linkedApplication addObserver:v7];
    [(PKLinkedApplicationActionCell *)v7 setNeedsLayout];
  }

  return v7;
}

- (void)dealloc
{
  [(PKLinkedApplication *)self->_linkedApplication removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKLinkedApplicationActionCell;
  [(PKLinkedApplicationActionCell *)&v3 dealloc];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)PKLinkedApplicationActionCell;
  [(PKLinkedApplicationActionCell *)&v4 didMoveToWindow];
  objc_super v3 = [(PKLinkedApplicationActionCell *)self window];

  if (v3) {
    [(PKLinkedApplication *)self->_linkedApplication reloadApplicationStateIfNecessary];
  }
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)PKLinkedApplicationActionCell;
  [(PKLinkedApplicationActionCell *)&v17 layoutSubviews];
  int64_t v3 = [(PKLinkedApplication *)self->_linkedApplication state];
  BOOL v4 = v3 != 1 && v3 == 0;
  BOOL v5 = v3 == 1;
  v6 = [(PKLinkedApplicationActionCell *)self textLabel];
  v7 = v6;
  if (v4 || !v5)
  {
    if (!self->_disabledTextColor)
    {
      uint64_t v8 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
      goto LABEL_11;
    }
LABEL_9:
    objc_msgSend(v6, "setTextColor:");
    goto LABEL_12;
  }
  if (self->_textColor) {
    goto LABEL_9;
  }
  uint64_t v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
LABEL_11:
  id v9 = (void *)v8;
  [v7 setTextColor:v8];

LABEL_12:
  objc_super v10 = [(PKLinkedApplication *)self->_linkedApplication displayName];
  if ([v10 length]) {
    PKLocalizedString(&cfstr_OpenApp.isa, &stru_1EF1B4C70.isa, v10, 0);
  }
  else {
  v11 = PKLocalizedString(&cfstr_OpenAppNoName.isa);
  }
  [v7 setText:v11];

  if (v4)
  {
    if (!self->_activityIndicator)
    {
      v12 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      activityIndicator = self->_activityIndicator;
      self->_activityIndicator = v12;
    }
    v14 = [(PKLinkedApplicationActionCell *)self accessoryView];

    if (!v14)
    {
      [(PKLinkedApplicationActionCell *)self setAccessoryView:self->_activityIndicator];
      [(UIActivityIndicatorView *)self->_activityIndicator startAnimating];
    }
  }
  else
  {
    v15 = [(PKLinkedApplicationActionCell *)self accessoryView];

    if (v15)
    {
      [(UIActivityIndicatorView *)self->_activityIndicator stopAnimating];
      [(PKLinkedApplicationActionCell *)self setAccessoryView:0];
    }
  }
  if (v5) {
    uint64_t v16 = 3;
  }
  else {
    uint64_t v16 = 0;
  }
  [(PKLinkedApplicationActionCell *)self setSelectionStyle:v16];
  [(PKLinkedApplicationActionCell *)self setUserInteractionEnabled:v5];
}

- (void)reloadApplicationStateIfNecessary
{
}

- (NSArray)storeIDs
{
  return [(PKLinkedApplication *)self->_linkedApplication storeIDs];
}

- (void)setStoreIDs:(id)a3
{
}

- (NSURL)appLaunchURL
{
  return [(PKLinkedApplication *)self->_linkedApplication defaultLaunchURL];
}

- (void)setAppLaunchURL:(id)a3
{
}

- (void)linkedApplicationDidChangeState:(id)a3
{
  id v5 = a3;
  if (![v5 state])
  {
    BOOL v4 = [(PKLinkedApplicationActionCell *)self window];

    if (v4) {
      [v5 reloadApplicationStateIfNecessary];
    }
  }
  [(PKLinkedApplicationActionCell *)self setNeedsLayout];
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (UIColor)disabledTextColor
{
  return self->_disabledTextColor;
}

- (void)setDisabledTextColor:(id)a3
{
}

- (PKLinkedApplication)linkedApplication
{
  return self->_linkedApplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedApplication, 0);
  objc_storeStrong((id *)&self->_disabledTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);

  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
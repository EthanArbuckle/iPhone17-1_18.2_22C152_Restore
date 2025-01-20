@interface PXStatusViewModel
- (NSAttributedString)attributedMessage;
- (NSString)actionConfirmationAlertButtonTitle;
- (NSString)actionConfirmationAlertSubtitle;
- (NSString)actionConfirmationAlertTitle;
- (NSString)actionTitle;
- (NSString)message;
- (NSString)symbolName;
- (NSString)title;
- (id)action;
- (id)description;
- (void)performChanges:(id)a3;
- (void)setAction:(id)a3;
- (void)setActionConfirmationAlertButtonTitle:(id)a3;
- (void)setActionConfirmationAlertSubtitle:(id)a3;
- (void)setActionConfirmationAlertTitle:(id)a3;
- (void)setActionTitle:(id)a3;
- (void)setAttributedMessage:(id)a3;
- (void)setMessage:(id)a3;
- (void)setSymbolName:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXStatusViewModel

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertButtonTitle, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertSubtitle, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertTitle, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_attributedMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

- (id)action
{
  return self->_action;
}

- (NSString)actionConfirmationAlertButtonTitle
{
  return self->_actionConfirmationAlertButtonTitle;
}

- (NSString)actionConfirmationAlertSubtitle
{
  return self->_actionConfirmationAlertSubtitle;
}

- (NSString)actionConfirmationAlertTitle
{
  return self->_actionConfirmationAlertTitle;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (NSAttributedString)attributedMessage
{
  return self->_attributedMessage;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setAction:(id)a3
{
  if (self->_action != a3)
  {
    v4 = (void *)[a3 copy];
    id action = self->_action;
    self->_id action = v4;

    [(PXStatusViewModel *)self signalChange:256];
  }
}

- (void)setActionConfirmationAlertButtonTitle:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_actionConfirmationAlertButtonTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      actionConfirmationAlertButtonTitle = self->_actionConfirmationAlertButtonTitle;
      self->_actionConfirmationAlertButtonTitle = v6;

      [(PXStatusViewModel *)self signalChange:128];
    }
  }
}

- (void)setActionConfirmationAlertSubtitle:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_actionConfirmationAlertSubtitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      actionConfirmationAlertSubtitle = self->_actionConfirmationAlertSubtitle;
      self->_actionConfirmationAlertSubtitle = v6;

      [(PXStatusViewModel *)self signalChange:64];
    }
  }
}

- (void)setActionConfirmationAlertTitle:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_actionConfirmationAlertTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      actionConfirmationAlertTitle = self->_actionConfirmationAlertTitle;
      self->_actionConfirmationAlertTitle = v6;

      [(PXStatusViewModel *)self signalChange:32];
    }
  }
}

- (void)setActionTitle:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_actionTitle;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      actionTitle = self->_actionTitle;
      self->_actionTitle = v6;

      [(PXStatusViewModel *)self signalChange:16];
    }
  }
}

- (void)setAttributedMessage:(id)a3
{
  v8 = (NSAttributedString *)a3;
  v4 = self->_attributedMessage;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSAttributedString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      v6 = (NSAttributedString *)[(NSAttributedString *)v8 copy];
      attributedMessage = self->_attributedMessage;
      self->_attributedMessage = v6;

      [(PXStatusViewModel *)self signalChange:8];
    }
  }
}

- (void)setMessage:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_message;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      message = self->_message;
      self->_message = v6;

      [(PXStatusViewModel *)self signalChange:4];
    }
  }
}

- (void)setTitle:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_title;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      title = self->_title;
      self->_title = v6;

      [(PXStatusViewModel *)self signalChange:2];
    }
  }
}

- (void)setSymbolName:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_symbolName;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v4 isEqualToString:v8];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      symbolName = self->_symbolName;
      self->_symbolName = v6;

      [(PXStatusViewModel *)self signalChange:1];
    }
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXStatusViewModel;
  [(PXStatusViewModel *)&v3 performChanges:a3];
}

- (id)description
{
  attributedMessage = self->_attributedMessage;
  if (attributedMessage)
  {
    v4 = [(NSAttributedString *)attributedMessage string];
  }
  else
  {
    message = (__CFString *)self->_message;
    if (!message) {
      message = @"-";
    }
    v4 = message;
  }
  v6 = v4;
  symbolName = (__CFString *)self->_symbolName;
  if (!symbolName) {
    symbolName = @"-";
  }
  title = (__CFString *)self->_title;
  if (!title) {
    title = @"-";
  }
  actionTitle = (__CFString *)self->_actionTitle;
  if (!actionTitle) {
    actionTitle = @"-";
  }
  actionConfirmationAlertTitle = (__CFString *)self->_actionConfirmationAlertTitle;
  if (!actionConfirmationAlertTitle) {
    actionConfirmationAlertTitle = @"-";
  }
  actionConfirmationAlertSubtitle = (__CFString *)self->_actionConfirmationAlertSubtitle;
  if (!actionConfirmationAlertSubtitle) {
    actionConfirmationAlertSubtitle = @"-";
  }
  actionConfirmationAlertButtonTitle = (__CFString *)self->_actionConfirmationAlertButtonTitle;
  if (!actionConfirmationAlertButtonTitle) {
    actionConfirmationAlertButtonTitle = @"-";
  }
  v13 = [NSString stringWithFormat:@"<symbolName:\"%@\", title:\"%@\", message:\"%@\", action:\"%@\", alert:\"%@/%@/%@\">", symbolName, title, v4, actionTitle, actionConfirmationAlertTitle, actionConfirmationAlertSubtitle, actionConfirmationAlertButtonTitle];

  return v13;
}

@end
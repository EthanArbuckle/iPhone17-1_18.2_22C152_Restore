@interface SKUIGiftAddressingSection
- (SKUIGift)gift;
- (SKUIGiftAddressingSection)initWithGiftConfiguration:(id)a3;
- (SKUIGiftTextTableViewCell)messageCell;
- (UITextFieldDelegate)textFieldDelegate;
- (UITextView)messagingTextView;
- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4;
- (id)_attributedPlaceholderWithString:(id)a3;
- (id)_footerString;
- (id)_recipientTableViewCell;
- (id)_textFieldTableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (int64_t)numberOfRowsInSection;
- (void)beginEditingMessageForTableView:(id)a3 indexPath:(id)a4;
- (void)endEditingMessageForTableView:(id)a3 indexPath:(id)a4;
- (void)setGift:(id)a3;
- (void)setMessageCell:(id)a3;
- (void)setTextFieldDelegate:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forIndexPath:(id)a5;
@end

@implementation SKUIGiftAddressingSection

- (SKUIGiftAddressingSection)initWithGiftConfiguration:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftAddressingSection initWithGiftConfiguration:]();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUIGiftAddressingSection;
  v5 = [(SKUIGiftTableViewSection *)&v8 initWithGiftConfiguration:v4];
  v6 = v5;
  if (v5) {
    v5->_textViewCellHeight = 46.0;
  }

  return v6;
}

- (void)beginEditingMessageForTableView:(id)a3 indexPath:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([(UITextView *)self->_messagingTextView isFirstResponder] & 1) == 0)
  {
    self->_textViewCellHeight = 137.0;
    v9[0] = v7;
    objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v6 reloadRowsAtIndexPaths:v8 withRowAnimation:5];

    [(UITextView *)self->_messagingTextView setEditable:1];
    [(UITextView *)self->_messagingTextView setUserInteractionEnabled:1];
    [(UITextView *)self->_messagingTextView becomeFirstResponder];
  }
}

- (void)endEditingMessageForTableView:(id)a3 indexPath:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  messagingTextView = self->_messagingTextView;
  id v8 = a3;
  v9 = [(UITextView *)messagingTextView text];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    v11 = self->_messagingTextView;
    [(UITextView *)v11 bounds];
    -[UITextView sizeThatFits:](v11, "sizeThatFits:", v12, v13);
    double v15 = v14 + 46.0 + 10.0;
  }
  else
  {
    double v15 = 46.0;
  }
  self->_textViewCellHeight = v15;
  v17[0] = v6;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v8 reloadRowsAtIndexPaths:v16 withRowAnimation:5];

  [(UITextView *)self->_messagingTextView setEditable:0];
  [(UITextView *)self->_messagingTextView setUserInteractionEnabled:0];
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "row", a3);
  if (v5 == 2) {
    return self->_textViewCellHeight;
  }
  if (v5 == 1) {
    return 46.0;
  }
  if (v5)
  {
    double footerHeight = self->_footerHeight;
    if (footerHeight < 0.00000011920929)
    {
      double v12 = [[SKUIGiftFooterLabelTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
      double v13 = [(SKUIGiftAddressingSection *)self _footerString];
      [(SKUIGiftFooterLabelTableViewCell *)v12 setFooterLabel:v13];

      double v14 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v15 = [v14 userInterfaceIdiom];

      double v16 = 320.0;
      if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v16 = 540.0;
      }
      -[SKUIGiftFooterLabelTableViewCell sizeThatFits:](v12, "sizeThatFits:", v16, 1.79769313e308);
      self->_double footerHeight = v17;

      return self->_footerHeight;
    }
  }
  else
  {
    id v6 = [(SKUIGiftAddressingSection *)self _recipientTableViewCell];
    id v7 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    double v9 = 320.0;
    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v9 = 540.0;
    }
    objc_msgSend(v6, "sizeThatFits:", v9, 1.79769313e308);
    if (v10 >= 46.0) {
      double footerHeight = v10;
    }
    else {
      double footerHeight = 46.0;
    }
  }
  return footerHeight;
}

- (int64_t)numberOfRowsInSection
{
  return 4;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 row];
  switch(v8)
  {
    case 2:
      uint64_t v9 = [(SKUIGiftAddressingSection *)self messageCell];
      goto LABEL_7;
    case 1:
      uint64_t v9 = [(SKUIGiftAddressingSection *)self _textFieldTableViewCellForTableView:v6 indexPath:v7];
      goto LABEL_7;
    case 0:
      uint64_t v9 = [(SKUIGiftAddressingSection *)self _recipientTableViewCell];
LABEL_7:
      double v10 = (SKUIGiftFooterLabelTableViewCell *)v9;
      goto LABEL_11;
  }
  double v10 = [v6 dequeueReusableCellWithIdentifier:@"GF"];
  if (!v10)
  {
    double v10 = [[SKUIGiftFooterLabelTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"GF"];
    [(SKUIGiftFooterLabelTableViewCell *)v10 setSelectionStyle:0];
  }
  v11 = [(SKUIGiftAddressingSection *)self _footerString];
  [(SKUIGiftFooterLabelTableViewCell *)v10 setFooterLabel:v11];

LABEL_11:

  return v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forIndexPath:(id)a5
{
  id v9 = a3;
  id v7 = a4;
  if ([a5 row] == 3)
  {
    uint64_t v8 = [v9 backgroundColor];
    [v7 setBackgroundColor:v8];
  }
}

- (id)_attributedPlaceholderWithString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F28E48];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithString:v4];
  uint64_t v6 = [v4 length];

  uint64_t v7 = *MEMORY[0x1E4FB06F8];
  uint64_t v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
  objc_msgSend(v5, "addAttribute:value:range:", v7, v8, 0, v6);

  uint64_t v9 = *MEMORY[0x1E4FB0700];
  double v10 = [MEMORY[0x1E4FB1618] _placeholderTextColor];
  objc_msgSend(v5, "addAttribute:value:range:", v9, v10, 0, v6);

  uint64_t v11 = *MEMORY[0x1E4FB06C0];
  double v12 = [MEMORY[0x1E4FB1618] clearColor];
  objc_msgSend(v5, "addAttribute:value:range:", v11, v12, 0, v6);

  return v5;
}

- (id)_footerString
{
  footerString = self->_footerString;
  if (!footerString)
  {
    id v4 = [(SKUIGiftTableViewSection *)self giftConfiguration];
    uint64_t v5 = [v4 clientContext];
    uint64_t v6 = v5;
    if (v5) {
      [v5 localizedStringForKey:@"GIFTING_STOREFRONT_WARNING" inTable:@"Gifting"];
    }
    else {
    uint64_t v7 = +[SKUIClientContext localizedStringForKey:@"GIFTING_STOREFRONT_WARNING" inBundles:0 inTable:@"Gifting"];
    }

    uint64_t v8 = NSString;
    uint64_t v9 = [v4 storeFrontName];
    double v10 = [v8 stringWithValidatedFormat:v7, @"%@", 0, v9 validFormatSpecifiers error];
    uint64_t v11 = self->_footerString;
    self->_footerString = v10;

    footerString = self->_footerString;
  }

  return footerString;
}

- (id)_recipientTableViewCell
{
  recipientTableViewCell = self->_recipientTableViewCell;
  if (!recipientTableViewCell)
  {
    id v4 = [(SKUIGiftTableViewSection *)self giftConfiguration];
    uint64_t v5 = [v4 clientContext];

    uint64_t v6 = [[SKUIGiftRecipientTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"GRF"];
    uint64_t v7 = self->_recipientTableViewCell;
    self->_recipientTableViewCell = v6;

    uint64_t v8 = self->_recipientTableViewCell;
    if (v5) {
      [v5 localizedStringForKey:@"GIFTING_PLACEHOLDER_EMAIL" inTable:@"Gifting"];
    }
    else {
    uint64_t v9 = +[SKUIClientContext localizedStringForKey:@"GIFTING_PLACEHOLDER_EMAIL" inBundles:0 inTable:@"Gifting"];
    }
    double v10 = [(SKUIGiftAddressingSection *)self _attributedPlaceholderWithString:v9];
    [(SKUIGiftRecipientTableViewCell *)v8 setAttributedPlaceholder:v10];

    uint64_t v11 = self->_recipientTableViewCell;
    if (v5) {
      [v5 localizedStringForKey:@"GIFTING_FIELD_LABEL_RECIPIENT" inTable:@"Gifting"];
    }
    else {
    double v12 = +[SKUIClientContext localizedStringForKey:@"GIFTING_FIELD_LABEL_RECIPIENT" inBundles:0 inTable:@"Gifting"];
    }
    [(SKUIGiftRecipientTableViewCell *)v11 setLabel:v12];

    double v13 = self->_recipientTableViewCell;
    double v14 = [(SKUIGift *)self->_gift recipientAddresses];
    [(SKUIGiftRecipientTableViewCell *)v13 setRecipientAddresses:v14];

    [(SKUIGiftRecipientTableViewCell *)self->_recipientTableViewCell setSelectionStyle:0];
    recipientTableViewCell = self->_recipientTableViewCell;
  }

  return recipientTableViewCell;
}

- (id)_textFieldTableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"GTF", a4);
  uint64_t v5 = (SKUIGiftTextFieldTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    uint64_t v5 = [[SKUIGiftTextFieldTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"GTF"];
    [(SKUIGiftTextFieldTableViewCell *)v5 setSelectionStyle:0];
  }
  uint64_t v6 = [(SKUIGiftTableViewSection *)self giftConfiguration];
  uint64_t v7 = [v6 clientContext];

  if (v7) {
    [v7 localizedStringForKey:@"GIFTING_PLACEHOLDER_NAME" inTable:@"Gifting"];
  }
  else {
  uint64_t v8 = +[SKUIClientContext localizedStringForKey:@"GIFTING_PLACEHOLDER_NAME" inBundles:0 inTable:@"Gifting"];
  }
  uint64_t v9 = [(SKUIGiftAddressingSection *)self _attributedPlaceholderWithString:v8];
  [(SKUIGiftTextFieldTableViewCell *)v5 setAttributedPlaceholder:v9];

  [(SKUIGiftTextFieldTableViewCell *)v5 setEnabled:1];
  [(SKUIGiftTextFieldTableViewCell *)v5 setKeyboardType:0];
  if (v7) {
    [v7 localizedStringForKey:@"GIFTING_FIELD_LABEL_SENDER_NAME" inTable:@"Gifting"];
  }
  else {
  double v10 = +[SKUIClientContext localizedStringForKey:@"GIFTING_FIELD_LABEL_SENDER_NAME" inBundles:0 inTable:@"Gifting"];
  }
  [(SKUIGiftTextFieldTableViewCell *)v5 setLabel:v10];

  [(SKUIGiftTextFieldTableViewCell *)v5 setTextFieldDelegate:self->_textFieldDelegate];
  uint64_t v11 = [(SKUIGift *)self->_gift senderName];
  [(SKUIGiftTextFieldTableViewCell *)v5 setValue:v11];

  return v5;
}

- (SKUIGiftTextTableViewCell)messageCell
{
  messageCell = self->_messageCell;
  if (!messageCell)
  {
    id v4 = [[SKUIGiftTextTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    uint64_t v5 = [(SKUIGiftTableViewSection *)self giftConfiguration];
    uint64_t v6 = [v5 maximumMessageLength];

    [(SKUIGiftTextTableViewCell *)v4 setMaximumCharacterCount:v6];
    [(SKUIGiftTextTableViewCell *)v4 setSelectionStyle:0];
    uint64_t v7 = [(SKUIGiftTableViewSection *)self giftConfiguration];
    uint64_t v8 = [v7 clientContext];

    if (v8) {
      [v8 localizedStringForKey:@"GIFTING_CONFIRM_MESSAGE_LABEL" inTable:@"Gifting"];
    }
    else {
    uint64_t v9 = +[SKUIClientContext localizedStringForKey:@"GIFTING_CONFIRM_MESSAGE_LABEL" inBundles:0 inTable:@"Gifting"];
    }
    [(SKUIGiftTextTableViewCell *)v4 setLabel:v9];

    if (v8) {
      [v8 localizedStringForKey:@"GIFTING_PLACEHOLDER_MESSAGE" inTable:@"Gifting"];
    }
    else {
    double v10 = +[SKUIClientContext localizedStringForKey:@"GIFTING_PLACEHOLDER_MESSAGE" inBundles:0 inTable:@"Gifting"];
    }
    id v11 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v11 setNumberStyle:1];
    double v12 = NSString;
    double v13 = [NSNumber numberWithInteger:v6];
    double v14 = [v11 stringFromNumber:v13];
    uint64_t v15 = [v12 stringWithValidatedFormat:v10, @"%@", 0, v14 validFormatSpecifiers error];
    [(SKUIGiftTextTableViewCell *)v4 setPlaceholder:v15];

    messagingTextView = self->_messagingTextView;
    if (!messagingTextView)
    {
      double v17 = +[SKUIGiftTextTableViewCell newTextView];
      v18 = self->_messagingTextView;
      self->_messagingTextView = v17;

      [(UITextView *)self->_messagingTextView setEditable:0];
      [(UITextView *)self->_messagingTextView setUserInteractionEnabled:0];
      messagingTextView = self->_messagingTextView;
    }
    [(SKUIGiftTextTableViewCell *)v4 setTextView:messagingTextView];
    v19 = self->_messageCell;
    self->_messageCell = v4;

    messageCell = self->_messageCell;
  }

  return messageCell;
}

- (SKUIGift)gift
{
  return self->_gift;
}

- (void)setGift:(id)a3
{
}

- (UITextView)messagingTextView
{
  return self->_messagingTextView;
}

- (UITextFieldDelegate)textFieldDelegate
{
  return self->_textFieldDelegate;
}

- (void)setTextFieldDelegate:(id)a3
{
  self->_textFieldDelegate = (UITextFieldDelegate *)a3;
}

- (void)setMessageCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageCell, 0);
  objc_storeStrong((id *)&self->_recipientTableViewCell, 0);
  objc_storeStrong((id *)&self->_messagingTextView, 0);
  objc_storeStrong((id *)&self->_gift, 0);

  objc_storeStrong((id *)&self->_footerString, 0);
}

- (void)initWithGiftConfiguration:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGiftAddressingSection initWithGiftConfiguration:]";
}

@end
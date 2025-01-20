@interface SKUIGiftRecipientTableViewCell
- (BOOL)didLayoutSubviews;
- (BOOL)leftToRight;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)recipientAddresses;
- (NSAttributedString)attributedPlaceholder;
- (NSString)label;
- (SKUIGiftRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_contactStore;
- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4;
- (void)_resetSearchController;
- (void)_sendDidChangeRecipients;
- (void)_sendDidUpdateSearchController;
- (void)_sendDismissContactPicker;
- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4;
- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4;
- (void)composeRecipientView:(id)a3 textDidChange:(id)a4;
- (void)composeRecipientViewDidBecomeFirstResponder:(id)a3;
- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3;
- (void)composeRecipientViewRequestAddRecipient:(id)a3;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)presentPeoplePickerPopover:(id)a3 animated:(BOOL)a4;
- (void)presentSearchResultsPopover:(id)a3 animated:(BOOL)a4;
- (void)recipientViewDidResignFirstResponder:(id)a3;
- (void)searchController:(id)a3 didSelectRecipient:(id)a4;
- (void)setAttributedPlaceholder:(id)a3;
- (void)setDidLayoutSubviews:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLeftToRight:(BOOL)a3;
- (void)setRecipientAddresses:(id)a3;
@end

@implementation SKUIGiftRecipientTableViewCell

- (SKUIGiftRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftRecipientTableViewCell initWithStyle:reuseIdentifier:]();
  }
  v44.receiver = self;
  v44.super_class = (Class)SKUIGiftRecipientTableViewCell;
  v7 = [(SKUIGiftRecipientTableViewCell *)&v44 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    uint64_t v8 = SKUIContactsAutocompleteUIFramework();
    v9 = (CNComposeRecipientTextView *)objc_alloc_init((Class)SKUIWeakLinkedClassForString(&cfstr_Cncomposerecip_0.isa, v8));
    recipientView = v7->_recipientView;
    v7->_recipientView = v9;

    v11 = [(CNComposeRecipientTextView *)v7->_recipientView labelView];
    v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
    [v11 setFont:v12];

    v13 = [(CNComposeRecipientTextView *)v7->_recipientView labelView];
    v14 = [MEMORY[0x1E4FB1618] _labelColor];
    [v13 setTextColor:v14];

    v15 = [(CNComposeRecipientTextView *)v7->_recipientView labelView];
    v16 = [MEMORY[0x1E4FB1618] clearColor];
    [v15 setBackgroundColor:v16];

    v17 = v7->_recipientView;
    v18 = [MEMORY[0x1E4FB1618] clearColor];
    [(CNComposeRecipientTextView *)v17 setBackgroundColor:v18];

    [(CNComposeRecipientTextView *)v7->_recipientView setDelegate:v7];
    v19 = v7->_recipientView;
    v20 = [(CNComposeRecipientTextView *)v19 labelView];
    v21 = [v20 font];
    [(CNComposeRecipientTextView *)v19 setBaseFont:v21];

    uint64_t v22 = *MEMORY[0x1E4FB27D8];
    [(CNComposeRecipientTextView *)v7->_recipientView setMaximumContentSizeCategory:*MEMORY[0x1E4FB27D8]];
    [(CNComposeRecipientTextView *)v7->_recipientView setMinimumContentSizeCategory:v22];
    v23 = [(CNComposeRecipientTextView *)v7->_recipientView textView];
    v24 = [v23 textContainer];
    [v24 setLineFragmentPadding:0.0];

    [(CNComposeRecipientTextView *)v7->_recipientView subviews];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v41;
      while (2)
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v41 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          objc_msgSend(v30, "frame", (void)v40);
          if (v31 <= 1.0)
          {
            [v30 setHidden:1];
            goto LABEL_16;
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v27) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    [(CNComposeRecipientTextView *)v7->_recipientView sizeToFit];
    v32 = [(SKUIGiftRecipientTableViewCell *)v7 contentView];
    [v32 addSubview:v7->_recipientView];

    v33 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    topBorderView = v7->_topBorderView;
    v7->_topBorderView = v33;

    v35 = v7->_topBorderView;
    v36 = [MEMORY[0x1E4FB1618] tableSeparatorColor];
    [(UIView *)v35 setBackgroundColor:v36];

    v37 = [(SKUIGiftRecipientTableViewCell *)v7 contentView];
    [v37 addSubview:v7->_topBorderView];

    v38 = [MEMORY[0x1E4FB1438] sharedApplication];
    v7->_leftToRight = [v38 userInterfaceLayoutDirection] == 0;

    [(SKUIGiftRecipientTableViewCell *)v7 setDidLayoutSubviews:0];
  }

  return v7;
}

- (void)dealloc
{
  [(CNContactPickerViewController *)self->_contactPickerController setDelegate:0];
  [(CNComposeRecipientTextView *)self->_recipientView setDelegate:0];
  [(SKUIGiftContactSearchController *)self->_searchController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SKUIGiftRecipientTableViewCell;
  [(SKUIGiftRecipientTableViewCell *)&v3 dealloc];
}

- (NSAttributedString)attributedPlaceholder
{
  return [(UILabel *)self->_placeholderLabel attributedText];
}

- (NSString)label
{
  v2 = [(CNComposeRecipientTextView *)self->_recipientView labelView];
  objc_super v3 = [v2 text];

  return (NSString *)v3;
}

- (void)presentPeoplePickerPopover:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  [(SKUIGiftRecipientTableViewCell *)self frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [(SKUIGiftRecipientTableViewCell *)self superview];
  objc_msgSend(v5, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v14, 1, 1, v7, v9, v11, v13);
}

- (void)presentSearchResultsPopover:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  recipientView = self->_recipientView;
  id v6 = a3;
  id v7 = [(CNComposeRecipientTextView *)recipientView textView];
  [v7 bounds];
  objc_msgSend(v6, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v7, 1, v4);
}

- (NSArray)recipientAddresses
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(CNComposeRecipientTextView *)self->_recipientView recipients];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) address];
        if ([v9 length]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)setAttributedPlaceholder:(id)a3
{
  id v15 = a3;
  id v4 = [(SKUIGiftRecipientTableViewCell *)self attributedPlaceholder];
  if (v4 != v15 && ([v15 isEqual:v4] & 1) == 0)
  {
    placeholderLabel = self->_placeholderLabel;
    if (v15)
    {
      if (!placeholderLabel)
      {
        uint64_t v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        uint64_t v7 = self->_placeholderLabel;
        self->_placeholderLabel = v6;

        double v8 = self->_placeholderLabel;
        double v9 = [MEMORY[0x1E4FB1618] clearColor];
        [(UILabel *)v8 setBackgroundColor:v9];

        double v10 = self->_placeholderLabel;
        long long v11 = [(CNComposeRecipientTextView *)self->_recipientView textView];
        if ([v11 isFirstResponder]) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = [(CNComposeRecipientTextView *)self->_recipientView hasContent];
        }
        [(UILabel *)v10 setHidden:v12];

        long long v14 = [(SKUIGiftRecipientTableViewCell *)self contentView];
        [v14 insertSubview:self->_placeholderLabel belowSubview:self->_recipientView];

        placeholderLabel = self->_placeholderLabel;
      }
      -[UILabel setAttributedText:](placeholderLabel, "setAttributedText:");
      [(UILabel *)self->_placeholderLabel sizeToFit];
    }
    else
    {
      [(UILabel *)placeholderLabel removeFromSuperview];
      long long v13 = self->_placeholderLabel;
      self->_placeholderLabel = 0;
    }
    [(SKUIGiftRecipientTableViewCell *)self setNeedsLayout];
  }
}

- (void)setLabel:(id)a3
{
}

- (void)setRecipientAddresses:(id)a3
{
}

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)SKUIGiftRecipientTableViewCell;
  [(SKUIGiftRecipientTableViewCell *)&v38 layoutSubviews];
  objc_super v3 = [(SKUIGiftRecipientTableViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[CNComposeRecipientTextView setFrame:](self->_recipientView, "setFrame:", v5, v7, v9, v11);
  if ([(SKUIGiftRecipientTableViewCell *)self didLayoutSubviews]) {
    [(CNComposeRecipientTextView *)self->_recipientView reflow];
  }
  [(CNComposeRecipientTextView *)self->_recipientView layoutIfNeeded];
  if (self->_placeholderLabel)
  {
    uint64_t v12 = [(CNComposeRecipientTextView *)self->_recipientView labelView];
    [v12 frame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v21 = [v12 superview];
    -[SKUIGiftRecipientTableViewCell convertRect:fromView:](self, "convertRect:fromView:", v21, v14, v16, v18, v20);
    double v23 = v22;
    double v25 = v24;
    CGFloat v27 = v26;
    double v29 = v28;

    [(UILabel *)self->_placeholderLabel frame];
    double v31 = v30;
    if ([(SKUIGiftRecipientTableViewCell *)self leftToRight])
    {
      v39.origin.x = v23;
      v39.origin.y = v25;
      v39.size.width = v27;
      v39.size.height = v29;
      double v32 = CGRectGetMaxX(v39) + 4.0;
      double v33 = v9 + -15.0 - v32;
    }
    else
    {
      double v33 = v9 + -15.0 + -4.0 + v23 - v9;
      double v32 = 15.0;
    }
    float v34 = (v29 - v31) * 0.5;
    -[UILabel setFrame:](self->_placeholderLabel, "setFrame:", v32, v25 + floorf(v34), v33, v31);
  }
  topBorderView = self->_topBorderView;
  v36 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v36 scale];
  -[UIView setFrame:](topBorderView, "setFrame:", 0.0, 0.0, v9, 1.0 / v37);

  [(SKUIGiftRecipientTableViewCell *)self setDidLayoutSubviews:1];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(CNComposeRecipientTextView *)self->_recipientView frame];
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v5 = a4;
  uint64_t v6 = SKUIContactsAutocompleteUIFramework();
  id v7 = objc_alloc((Class)SKUIWeakLinkedClassForString(&cfstr_Cncomposerecip_1.isa, v6));
  double v8 = [v5 contact];
  double v9 = [v5 value];

  id v10 = (id)[v7 initWithContact:v8 address:v9 kind:0];
  [(CNComposeRecipientTextView *)self->_recipientView addRecipient:v10];
  [(SKUIGiftRecipientTableViewCell *)self _sendDismissContactPicker];
}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height = a4.height;
  id v11 = a3;
  [v11 frame];
  uint64_t v6 = v11;
  if (height != v7)
  {
    objc_msgSend(v11, "setFrame:");
    double v8 = [(SKUIGiftRecipientTableViewCell *)self superview];
    if (v8)
    {
      do
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v9 = [v8 superview];

        double v8 = (void *)v9;
      }
      while (v9);
    }
    id v10 = [v8 delegate];
    if (objc_opt_respondsToSelector()) {
      [v10 tableView:v8 giftRecipientCellDidChangeSize:self];
    }

    uint64_t v6 = v11;
  }
}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v4 = a4;
  uint64_t v5 = SKUIContactsAutocompleteUIFramework();
  uint64_t v6 = objc_msgSend(objc_alloc((Class)SKUIWeakLinkedClassForString(&cfstr_Cncomposerecip_1.isa, v5)), "initWithContact:address:kind:", 0, v4, 0);

  return v6;
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  -[UILabel setHidden:](self->_placeholderLabel, "setHidden:", [a3 hasContent]);

  [(SKUIGiftRecipientTableViewCell *)self setNeedsLayout];
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [v7 clearText];
  if ([v6 length]) {
    [v7 addAddress:v6];
  }
  [(SKUIGiftRecipientTableViewCell *)self _resetSearchController];
  [(SKUIGiftRecipientTableViewCell *)self _sendDidChangeRecipients];
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (!self->_searchController)
  {
    id v7 = objc_alloc_init(SKUIGiftContactSearchController);
    searchController = self->_searchController;
    self->_searchController = v7;

    [(SKUIGiftContactSearchController *)self->_searchController setDelegate:self];
  }
  -[UILabel setHidden:](self->_placeholderLabel, "setHidden:", [v9 hasContent]);
  [(SKUIGiftContactSearchController *)self->_searchController searchForText:v6];
}

- (void)composeRecipientViewDidBecomeFirstResponder:(id)a3
{
  objc_super v3 = [(SKUIGiftRecipientTableViewCell *)self _contactStore];
  if (v3)
  {
    id v4 = v3;
    [v3 requestAccessForEntityType:0 completionHandler:&__block_literal_global_53];
    objc_super v3 = v4;
  }
}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
  [(SKUIGiftRecipientTableViewCell *)self _sendDismissContactPicker];

  [(SKUIGiftRecipientTableViewCell *)self _sendDidChangeRecipients];
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  v17[1] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = [(SKUIGiftRecipientTableViewCell *)self superview];
  if (v4)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v5 = [v4 superview];

      id v4 = (void *)v5;
    }
    while (v5);
  }
  id v6 = [v4 delegate];
  if (objc_opt_respondsToSelector())
  {
    contactPickerController = self->_contactPickerController;
    if (!contactPickerController)
    {
      uint64_t v8 = SKUIContactsUIFramework();
      id v9 = (CNContactPickerViewController *)objc_alloc_init((Class)SKUIWeakLinkedClassForString(&cfstr_Cncontactpicke.isa, v8));
      id v10 = self->_contactPickerController;
      self->_contactPickerController = v9;

      [(CNContactPickerViewController *)self->_contactPickerController setDelegate:self];
      id v11 = (void *)SKUIContactsFramework();
      uint64_t v12 = (id *)SKUIWeakLinkedSymbolForString("CNContactEmailAddressesKey", v11);
      double v13 = self->_contactPickerController;
      v17[0] = *v12;
      double v14 = (void *)MEMORY[0x1E4F1C978];
      id v15 = v17[0];
      double v16 = [v14 arrayWithObjects:v17 count:1];
      [(CNContactPickerViewController *)v13 setDisplayedPropertyKeys:v16];

      contactPickerController = self->_contactPickerController;
    }
    objc_msgSend(v6, "tableView:giftRecipientCell:presentContactPicker:", v4, self, contactPickerController, v17[0]);
  }
}

- (void)recipientViewDidResignFirstResponder:(id)a3
{
  [(UILabel *)self->_placeholderLabel setHidden:[(CNComposeRecipientTextView *)self->_recipientView hasContent]];

  [(SKUIGiftRecipientTableViewCell *)self _resetSearchController];
}

- (void)searchController:(id)a3 didSelectRecipient:(id)a4
{
  [(CNComposeRecipientTextView *)self->_recipientView addRecipient:a4];
  [(CNComposeRecipientTextView *)self->_recipientView clearText];
  [(SKUIGiftRecipientTableViewCell *)self _resetSearchController];

  [(SKUIGiftRecipientTableViewCell *)self _sendDidChangeRecipients];
}

- (id)_contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    uint64_t v4 = SKUIContactsFramework();
    uint64_t v5 = (CNContactStore *)objc_alloc_init((Class)SKUIWeakLinkedClassForString(&cfstr_Cncontactstore.isa, v4));
    id v6 = self->_contactStore;
    self->_contactStore = v5;

    contactStore = self->_contactStore;
  }

  return contactStore;
}

- (void)_resetSearchController
{
  searchController = self->_searchController;
  if (searchController)
  {
    [(SKUIGiftContactSearchController *)searchController resetSearch];
    [(SKUIGiftRecipientTableViewCell *)self _sendDidUpdateSearchController];
  }
}

- (void)_sendDidChangeRecipients
{
  objc_super v3 = [(SKUIGiftRecipientTableViewCell *)self superview];
  if (v3)
  {
    while (1)
    {
      id v6 = v3;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v4 = [v6 superview];

      objc_super v3 = (void *)v4;
      if (!v4) {
        goto LABEL_6;
      }
    }
    objc_super v3 = v6;
  }
LABEL_6:
  id v7 = v3;
  uint64_t v5 = [v3 delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 tableView:v7 giftRecipientCellDidChangeRecipients:self];
  }
}

- (void)_sendDidUpdateSearchController
{
  objc_super v3 = [(SKUIGiftRecipientTableViewCell *)self superview];
  if (v3)
  {
    while (1)
    {
      id v6 = v3;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v4 = [v6 superview];

      objc_super v3 = (void *)v4;
      if (!v4) {
        goto LABEL_6;
      }
    }
    objc_super v3 = v6;
  }
LABEL_6:
  id v7 = v3;
  uint64_t v5 = [v3 delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 tableView:v7 giftRecipientCell:self didUpdateSearchController:self->_searchController];
  }
}

- (void)_sendDismissContactPicker
{
  objc_super v3 = [(SKUIGiftRecipientTableViewCell *)self superview];
  if (v3)
  {
    while (1)
    {
      id v6 = v3;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v4 = [v6 superview];

      objc_super v3 = (void *)v4;
      if (!v4) {
        goto LABEL_6;
      }
    }
    objc_super v3 = v6;
  }
LABEL_6:
  id v7 = v3;
  uint64_t v5 = [v3 delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 tableView:v7 giftRecipientCell:self dismissContactPicker:self->_contactPickerController];
  }
}

- (BOOL)didLayoutSubviews
{
  return self->_didLayoutSubviews;
}

- (void)setDidLayoutSubviews:(BOOL)a3
{
  self->_didLayoutSubviews = a3;
}

- (BOOL)leftToRight
{
  return self->_leftToRight;
}

- (void)setLeftToRight:(BOOL)a3
{
  self->_leftToRight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_recipientView, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_contactPickerController, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGiftRecipientTableViewCell initWithStyle:reuseIdentifier:]";
}

@end
@interface MSTonePurchaseContinuation
- (MSTonePurchaseContinuation)initWithPurchase:(id)a3;
- (id)_copyAllowedToneStyles;
- (void)_destroyActionSheet;
- (void)_destroyAlertView;
- (void)_dismissContactPicker;
- (void)_pickAssigneeToneStyle;
- (void)_showPeoplePicker;
- (void)actionSheet:(id)a3 didDismissWithButtonIndex:(int64_t)a4;
- (void)actionSheetCancel:(id)a3;
- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4;
- (void)alertViewCancel:(id)a3;
- (void)cancel;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)dealloc;
- (void)start;
@end

@implementation MSTonePurchaseContinuation

- (MSTonePurchaseContinuation)initWithPurchase:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MSPurchaseBatch.m", 61, @"Must use with SSTonePurchase");
  }
  v7.receiver = self;
  v7.super_class = (Class)MSTonePurchaseContinuation;
  return [(SUPurchaseContinuation *)&v7 initWithPurchase:a3];
}

- (void)dealloc
{
  [(MSTonePurchaseContinuation *)self _destroyActionSheet];
  [(MSTonePurchaseContinuation *)self _destroyAlertView];
  [(CNContactPickerViewController *)self->_contactPicker setDelegate:0];

  self->_contactPicker = 0;
  v3.receiver = self;
  v3.super_class = (Class)MSTonePurchaseContinuation;
  [(SUPurchaseContinuation *)&v3 dealloc];
}

- (void)cancel
{
  [(UIActionSheet *)self->_actionSheet dismissWithClickedButtonIndex:[(UIActionSheet *)self->_actionSheet cancelButtonIndex] animated:0];
  [(MSTonePurchaseContinuation *)self _destroyActionSheet];
  [(UIAlertView *)self->_alertView dismissWithClickedButtonIndex:[(UIAlertView *)self->_alertView cancelButtonIndex] animated:0];
  [(MSTonePurchaseContinuation *)self _destroyAlertView];
  [(MSTonePurchaseContinuation *)self _dismissContactPicker];
  v3.receiver = self;
  v3.super_class = (Class)MSTonePurchaseContinuation;
  [(SUPurchaseContinuation *)&v3 cancel];
}

- (void)start
{
  id v3 = [(MSTonePurchaseContinuation *)self _copyAllowedToneStyles];
  if ([v3 count])
  {
    v4 = (UIAlertView *)objc_alloc_init(MEMORY[0x263F1C400]);
    self->_alertView = v4;
    [(UIAlertView *)v4 setDelegate:self];
    -[UIAlertView setTitle:](self->_alertView, "setTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"BUY_TONE_ALERT_TITLE", &stru_26EA927B8, 0));
    id v5 = [(SUPurchaseContinuation *)self purchase];
    v6 = (void *)[v5 valueForDownloadProperty:*MEMORY[0x263F7B738]];
    if ([v6 length]) {
      -[UIAlertView setBodyText:](self->_alertView, "setBodyText:", objc_msgSend(NSString, "stringWithFormat:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"BUY_TONE_BODY_FORMAT", &stru_26EA927B8, 0), v6));
    }
    if ([v3 containsObject:*MEMORY[0x263F7B990]]) {
      -[UIAlertView addButtonWithTitle:](self->_alertView, "addButtonWithTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"BUY_TONE_SET_AS_DEFAULT_RINGTONE", &stru_26EA927B8, 0));
    }
    if ([v3 containsObject:*MEMORY[0x263F7B998]]) {
      -[UIAlertView addButtonWithTitle:](self->_alertView, "addButtonWithTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"BUY_TONE_SET_AS_DEFAULT_TEXT_TONE", &stru_26EA927B8, 0));
    }
    -[UIAlertView addButtonWithTitle:](self->_alertView, "addButtonWithTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"BUY_TONE_ASSIGN_TO_CONTACT", &stru_26EA927B8, 0));
    -[UIAlertView setCancelButtonIndex:](self->_alertView, "setCancelButtonIndex:", -[UIAlertView addButtonWithTitle:](self->_alertView, "addButtonWithTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"BUY_TONE_DONE", &stru_26EA927B8, 0)));
    [(UIAlertView *)self->_alertView show];
    v7.receiver = self;
    v7.super_class = (Class)MSTonePurchaseContinuation;
    [(SUPurchaseContinuation *)&v7 start];
  }
  else
  {
    [(SUContinuation *)self sendFinishToDelegate];
  }
}

- (void)actionSheetCancel:(id)a3
{
  [(MSTonePurchaseContinuation *)self _dismissContactPicker];
  [(SUContinuation *)self sendFinishToDelegate];
  [(MSTonePurchaseContinuation *)self _destroyActionSheet];
}

- (void)actionSheet:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  if (a4)
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    id v5 = (void *)MEMORY[0x263F7B998];
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F7B990];
  }
  objc_msgSend(-[SUPurchaseContinuation purchase](self, "purchase", a3), "setAssigneeToneStyle:", *v5);
LABEL_6:
  [(MSTonePurchaseContinuation *)self _dismissContactPicker];
  [(SUContinuation *)self sendFinishToDelegate];
  [(MSTonePurchaseContinuation *)self _destroyActionSheet];
}

- (void)alertViewCancel:(id)a3
{
  [(SUContinuation *)self sendFinishToDelegate];
  [(MSTonePurchaseContinuation *)self _destroyAlertView];
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  id v10 = [(MSTonePurchaseContinuation *)self _copyAllowedToneStyles];
  if ([v10 containsObject:*MEMORY[0x263F7B998]])
  {
    char v6 = [v10 containsObject:*MEMORY[0x263F7B990]];
    uint64_t v7 = 2;
    uint64_t v8 = 1;
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v6) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v8 = 0;
    }
    if ((v6 & 1) == 0) {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v7 = 1;
  }
  if (v9 == a4)
  {
    objc_msgSend(-[SUPurchaseContinuation purchase](self, "purchase"), "setShouldMakeDefaultRingtone:", 1);
  }
  else if (v8 == a4)
  {
    objc_msgSend(-[SUPurchaseContinuation purchase](self, "purchase"), "setShouldMakeDefaultTextTone:", 1);
  }
  else if (v7 == a4)
  {
    [(MSTonePurchaseContinuation *)self _showPeoplePicker];
    goto LABEL_15;
  }
  [(SUContinuation *)self sendFinishToDelegate];
LABEL_15:
  [(MSTonePurchaseContinuation *)self _destroyAlertView];
}

- (void)contactPickerDidCancel:(id)a3
{
  [(MSTonePurchaseContinuation *)self _dismissContactPicker];
  [(SUContinuation *)self sendFinishToDelegate];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  if (a4) {
    objc_msgSend(-[SUPurchaseContinuation purchase](self, "purchase", a3), "setAssigneeContactIdentifier:", objc_msgSend(a4, "identifier"));
  }
  [(MSTonePurchaseContinuation *)self _pickAssigneeToneStyle];
}

- (id)_copyAllowedToneStyles
{
  v2 = objc_msgSend((id)objc_msgSend(-[SUPurchaseContinuation purchase](self, "purchase"), "allowedToneStyles"), "mutableCopy");
  uint64_t v3 = [v2 count];
  v4 = (void *)MEMORY[0x263F7B990];
  if (v3 >= 1)
  {
    uint64_t v5 = *MEMORY[0x263F7B990];
    uint64_t v6 = *MEMORY[0x263F7B998];
    unint64_t v7 = v3 + 1;
    do
    {
      uint64_t v8 = (void *)[v2 objectAtIndex:v7 - 2];
      if (([v8 isEqualToString:v5] & 1) == 0 && (objc_msgSend(v8, "isEqualToString:", v6) & 1) == 0) {
        [v2 removeObjectAtIndex:v7 - 2];
      }
      --v7;
    }
    while (v7 > 1);
  }
  if ((MGGetBoolAnswer() & 1) == 0) {
    [v2 removeObject:*v4];
  }
  return v2;
}

- (void)_destroyActionSheet
{
  self->_actionSheet = 0;
}

- (void)_destroyAlertView
{
  self->_alertView = 0;
}

- (void)_dismissContactPicker
{
  self->_contactPicker = 0;
}

- (void)_pickAssigneeToneStyle
{
  id v4 = [(MSTonePurchaseContinuation *)self _copyAllowedToneStyles];
  if ([v4 count] == 1)
  {
    objc_msgSend(-[SUPurchaseContinuation purchase](self, "purchase"), "setAssigneeToneStyle:", objc_msgSend(v4, "objectAtIndex:", 0));
    [(MSTonePurchaseContinuation *)self _dismissContactPicker];
    [(SUContinuation *)self sendFinishToDelegate];
  }
  else
  {
    uint64_t v3 = (UIActionSheet *)objc_alloc_init(MEMORY[0x263F1C3C8]);
    self->_actionSheet = v3;
    [(UIActionSheet *)v3 setDelegate:self];
    -[UIActionSheet addButtonWithTitle:](self->_actionSheet, "addButtonWithTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"BUY_TONE_SET_AS_RINGTONE", &stru_26EA927B8, 0));
    -[UIActionSheet addButtonWithTitle:](self->_actionSheet, "addButtonWithTitle:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"BUY_TONE_SET_AS_TEXT_TONE", &stru_26EA927B8, 0));
    [(UIActionSheet *)self->_actionSheet showInView:[(CNContactPickerViewController *)self->_contactPicker view]];
  }
}

- (void)_showPeoplePicker
{
  uint64_t v3 = (objc_class *)ISWeakLinkedClassForString();
  if (v3)
  {
    id v4 = (CNContactPickerViewController *)objc_alloc_init(v3);
    self->_contactPicker = v4;
    [(CNContactPickerViewController *)v4 setDelegate:self];
    uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F895D8], "sharedController"), "rootViewController");
    contactPicker = self->_contactPicker;
    [v5 presentViewController:contactPicker animated:1 completion:0];
  }
  else
  {
    [(MSTonePurchaseContinuation *)self cancel];
  }
}

@end
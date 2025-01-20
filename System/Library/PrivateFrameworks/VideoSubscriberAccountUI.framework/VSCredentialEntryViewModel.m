@interface VSCredentialEntryViewModel
- (NSArray)buttons;
- (NSArray)credentialEntryFields;
- (NSString)additionalMessage;
- (NSString)linkTitle;
- (NSString)recentsMessage;
- (NSString)recentsTitle;
- (NSURL)linkURL;
- (VSCredentialEntryPicker)picker;
- (VSCredentialEntryViewModelDelegate)delegate;
- (VSExpressionEvaluator)buttonExpressionEvaluator;
- (void)_bindField:(id)a3;
- (void)_unbindField:(id)a3;
- (void)buttonTappedAtIndex:(unint64_t)a3;
- (void)clearFieldsAfterUsername;
- (void)configureWithRequest:(id)a3;
- (void)pickerDidSelectRow:(unint64_t)a3;
- (void)setAdditionalMessage:(id)a3;
- (void)setButtonExpressionEvaluator:(id)a3;
- (void)setButtons:(id)a3;
- (void)setCredentialEntryFields:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLinkTitle:(id)a3;
- (void)setLinkURL:(id)a3;
- (void)setPicker:(id)a3;
- (void)setRecentsMessage:(id)a3;
- (void)setRecentsTitle:(id)a3;
- (void)validateCredentialEntryFields;
@end

@implementation VSCredentialEntryViewModel

- (void)_unbindField:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "vs_unbind:", @"recentsTitle");
  objc_msgSend(v3, "vs_unbind:", @"recentsMessage");
}

- (void)_bindField:(id)a3
{
  id v4 = a3;
  v5 = VSMainConcurrencyBindingOptions();
  objc_msgSend(v4, "vs_bind:toObject:withKeyPath:options:", @"recentsTitle", self, @"recentsTitle", v5);

  VSMainConcurrencyBindingOptions();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vs_bind:toObject:withKeyPath:options:", @"recentsMessage", self, @"recentsMessage", v6);
}

- (NSString)linkTitle
{
  linkTitle = self->_linkTitle;
  if (linkTitle)
  {
    id v3 = linkTitle;
  }
  else
  {
    id v4 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
    id v3 = [v4 localizedStringForKey:@"CREDENTIAL_ENTRY_FOOTER_LINK" value:0 table:0];
  }
  return v3;
}

- (void)setCredentialEntryFields:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_credentialEntryFields, a3);
  v5 = [v7 firstObject];

  if (!v5) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"The [credentialEntryFields firstObject] parameter must not be nil."];
  }
  id v6 = [v7 firstObject];
  [(VSCredentialEntryViewModel *)self _bindField:v6];

  [(VSCredentialEntryViewModel *)self validateCredentialEntryFields];
}

- (void)configureWithRequest:(id)a3
{
  id v4 = a3;
  v5 = [(VSViewModel *)self identityProvider];
  id v6 = [v5 displayName];
  id v7 = [v6 forceUnwrapObject];

  v8 = (void *)MEMORY[0x263F086E0];
  id v9 = v7;
  v10 = objc_msgSend(v8, "vs_frameworkBundle");
  v11 = [v10 localizedStringForKey:@"CREDENTIAL_ENTRY_MESSAGE" value:0 table:0];

  v12 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  v13 = [v12 localizedStringForKey:@"CREDENTIAL_ENTRY_FOOTER" value:0 table:0];
  v14 = (void *)[v13 mutableCopy];

  [v14 appendString:@" "];
  v15 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  v16 = [v15 localizedStringForKey:@"CREDENTIAL_ENTRY_FOOTER_IOS" value:0 table:0];
  [v14 appendString:v16];

  [(VSViewModel *)self setTitle:v9];
  v17 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  v18 = [v17 localizedStringForKey:@"SIGN_IN_BUTTON_TITLE" value:0 table:0];

  [(VSCuratedViewModel *)self setBeginValidationButtonTitle:v18];
  [(VSCuratedViewModel *)self setMessage:v11];
  v19 = [(VSViewModel *)self identityProvider];
  v20 = [v19 displayName];
  [(VSCuratedViewModel *)self setIdentityProviderDisplayName:v20];

  -[VSCuratedViewModel setShowFooter:](self, "setShowFooter:", [v14 length] != 0);
  [(VSCuratedViewModel *)self setFooterText:v14];
  v21 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  v22 = [v21 localizedStringForKey:@"RECENT_ACCOUNT_TITLE_FORMAT" value:0 table:0];

  v23 = objc_msgSend(NSString, "stringWithFormat:", v22, v9);

  [(VSCredentialEntryViewModel *)self setRecentsTitle:v23];
  v24 = objc_msgSend(MEMORY[0x263F086E0], "vs_frameworkBundle");
  v25 = [v24 localizedStringForKey:@"RECENT_ACCOUNT_INSTRUCTIONS" value:0 table:0];

  [(VSCredentialEntryViewModel *)self setRecentsMessage:v25];
  v26.receiver = self;
  v26.super_class = (Class)VSCredentialEntryViewModel;
  [(VSCuratedViewModel *)&v26 configureWithRequest:v4];
}

- (void)validateCredentialEntryFields
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(VSCredentialEntryViewModel *)self credentialEntryFields];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    char v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 isRequired])
        {
          v10 = [v9 text];
          BOOL v11 = [v10 length] != 0;

          v7 &= v11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    char v7 = 1;
  }

  [(VSCuratedViewModel *)self setBeginValidationButtonEnabled:v7 & 1];
}

- (void)buttonTappedAtIndex:(unint64_t)a3
{
  id v5 = [(VSCredentialEntryViewModel *)self delegate];
  [v5 viewModel:self buttonTappedAtIndex:a3];
}

- (void)pickerDidSelectRow:(unint64_t)a3
{
  id v5 = [(VSCredentialEntryViewModel *)self delegate];
  [v5 viewModel:self pickerDidSelectRow:a3];
}

- (void)clearFieldsAfterUsername
{
  id v3 = [(VSCredentialEntryViewModel *)self credentialEntryFields];
  unint64_t v4 = [v3 count];

  if (v4 >= 2)
  {
    uint64_t v5 = *MEMORY[0x263EFF4A0];
    unint64_t v6 = 1;
    do
    {
      char v7 = [(VSCredentialEntryViewModel *)self credentialEntryFields];
      v8 = [v7 objectAtIndex:v6];

      if (!v8) {
        [MEMORY[0x263EFF940] raise:v5 format:@"The [[self credentialEntryFields] objectAtIndex:i] parameter must not be nil."];
      }
      id v9 = [(VSCredentialEntryViewModel *)self credentialEntryFields];
      v10 = [v9 objectAtIndex:v6];

      [v10 setText:&stru_26F361E90];
      ++v6;
      BOOL v11 = [(VSCredentialEntryViewModel *)self credentialEntryFields];
      unint64_t v12 = [v11 count];
    }
    while (v6 < v12);
  }
}

- (NSArray)credentialEntryFields
{
  return self->_credentialEntryFields;
}

- (VSCredentialEntryPicker)picker
{
  return self->_picker;
}

- (void)setPicker:(id)a3
{
}

- (NSURL)linkURL
{
  return self->_linkURL;
}

- (void)setLinkURL:(id)a3
{
}

- (void)setLinkTitle:(id)a3
{
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (NSString)recentsTitle
{
  return self->_recentsTitle;
}

- (void)setRecentsTitle:(id)a3
{
}

- (NSString)recentsMessage
{
  return self->_recentsMessage;
}

- (void)setRecentsMessage:(id)a3
{
}

- (NSString)additionalMessage
{
  return self->_additionalMessage;
}

- (void)setAdditionalMessage:(id)a3
{
}

- (VSCredentialEntryViewModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VSCredentialEntryViewModelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VSExpressionEvaluator)buttonExpressionEvaluator
{
  return self->_buttonExpressionEvaluator;
}

- (void)setButtonExpressionEvaluator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonExpressionEvaluator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_additionalMessage, 0);
  objc_storeStrong((id *)&self->_recentsMessage, 0);
  objc_storeStrong((id *)&self->_recentsTitle, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_linkTitle, 0);
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_picker, 0);
  objc_storeStrong((id *)&self->_credentialEntryFields, 0);
}

@end
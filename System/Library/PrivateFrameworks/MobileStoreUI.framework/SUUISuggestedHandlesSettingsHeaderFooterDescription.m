@interface SUUISuggestedHandlesSettingsHeaderFooterDescription
- (Class)_viewClassForSettingsHeaderFooterDescription:(id)a3;
- (SUUISuggestedHandlesSettingsHeaderFooterDescription)initWithSuggestedHandles:(id)a3 clientContext:(id)a4 delegate:(id)a5;
- (SUUISuggestedHandlesSettingsHeaderFooterDescriptionDelegate)delegate;
- (id)helpText;
- (id)suggestedHandles;
- (void)selectedHandleAtIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SUUISuggestedHandlesSettingsHeaderFooterDescription

- (SUUISuggestedHandlesSettingsHeaderFooterDescription)initWithSuggestedHandles:(id)a3 clientContext:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SUUISuggestedHandlesSettingsHeaderFooterDescription *)self init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_clientContext, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
    uint64_t v13 = [v8 copy];
    suggestedHandles = v12->_suggestedHandles;
    v12->_suggestedHandles = (NSArray *)v13;
  }
  return v12;
}

- (id)helpText
{
  NSUInteger v3 = [(NSArray *)self->_suggestedHandles count];
  clientContext = self->_clientContext;
  if (v3)
  {
    if (clientContext)
    {
      v5 = @"SETTINGS_PROFILE_EDIT_HANDLE_TAKEN_WITH_SUGGESTIONS";
LABEL_6:
      v6 = [(SUUIClientContext *)clientContext localizedStringForKey:v5 inTable:@"Settings"];
      goto LABEL_10;
    }
    v7 = @"SETTINGS_PROFILE_EDIT_HANDLE_TAKEN_WITH_SUGGESTIONS";
  }
  else
  {
    if (clientContext)
    {
      v5 = @"SETTINGS_PROFILE_EDIT_HANDLE_TAKEN";
      goto LABEL_6;
    }
    v7 = @"SETTINGS_PROFILE_EDIT_HANDLE_TAKEN";
  }
  v6 = +[SUUIClientContext localizedStringForKey:v7 inBundles:0 inTable:@"Settings"];
LABEL_10:
  return v6;
}

- (void)selectedHandleAtIndex:(unint64_t)a3
{
  id v9 = [(NSArray *)self->_suggestedHandles objectAtIndex:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 suggestedHandlesSettingsHeaderFooterDescription:self didSelectSuggestedHandle:v9];
    }
  }
}

- (id)suggestedHandles
{
  v2 = (void *)[(NSArray *)self->_suggestedHandles copy];
  return v2;
}

- (Class)_viewClassForSettingsHeaderFooterDescription:(id)a3
{
  return (Class)objc_opt_class();
}

- (SUUISuggestedHandlesSettingsHeaderFooterDescriptionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUISuggestedHandlesSettingsHeaderFooterDescriptionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestedHandles, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
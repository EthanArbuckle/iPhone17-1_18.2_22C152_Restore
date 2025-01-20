@interface SUUIHandleRulesSettingsHeaderFooterDescription
- (BOOL)showInvalid;
- (Class)_viewClassForSettingsHeaderFooterDescription:(id)a3;
- (SUUIHandleRulesSettingsHeaderFooterDescription)initWithClientContext:(id)a3;
- (id)text;
- (void)setShowInvalid:(BOOL)a3;
@end

@implementation SUUIHandleRulesSettingsHeaderFooterDescription

- (SUUIHandleRulesSettingsHeaderFooterDescription)initWithClientContext:(id)a3
{
  id v5 = a3;
  v6 = [(SUUIHandleRulesSettingsHeaderFooterDescription *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_clientContext, a3);
  }

  return v7;
}

- (id)text
{
  clientContext = self->_clientContext;
  if (clientContext) {
    [(SUUIClientContext *)clientContext localizedStringForKey:@"SETTINGS_PROFILE_EDIT_HANDLE_RULES" inTable:@"Settings"];
  }
  else {
  v3 = +[SUUIClientContext localizedStringForKey:@"SETTINGS_PROFILE_EDIT_HANDLE_RULES" inBundles:0 inTable:@"Settings"];
  }
  return v3;
}

- (Class)_viewClassForSettingsHeaderFooterDescription:(id)a3
{
  return (Class)objc_opt_class();
}

- (BOOL)showInvalid
{
  return self->_showInvalid;
}

- (void)setShowInvalid:(BOOL)a3
{
  self->_showInvalid = a3;
}

- (void).cxx_destruct
{
}

@end
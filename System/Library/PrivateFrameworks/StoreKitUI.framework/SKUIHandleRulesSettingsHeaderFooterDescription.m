@interface SKUIHandleRulesSettingsHeaderFooterDescription
- (BOOL)showInvalid;
- (Class)_viewClassForSettingsHeaderFooterDescription:(id)a3;
- (SKUIHandleRulesSettingsHeaderFooterDescription)initWithClientContext:(id)a3;
- (id)text;
- (void)setShowInvalid:(BOOL)a3;
@end

@implementation SKUIHandleRulesSettingsHeaderFooterDescription

- (SKUIHandleRulesSettingsHeaderFooterDescription)initWithClientContext:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIHandleRulesSettingsHeaderFooterDescription initWithClientContext:]();
  }
  v6 = [(SKUIHandleRulesSettingsHeaderFooterDescription *)self init];
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
    [(SKUIClientContext *)clientContext localizedStringForKey:@"SETTINGS_PROFILE_EDIT_HANDLE_RULES" inTable:@"Settings"];
  }
  else {
  v3 = +[SKUIClientContext localizedStringForKey:@"SETTINGS_PROFILE_EDIT_HANDLE_RULES" inBundles:0 inTable:@"Settings"];
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

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIHandleRulesSettingsHeaderFooterDescription initWithClientContext:]";
}

@end
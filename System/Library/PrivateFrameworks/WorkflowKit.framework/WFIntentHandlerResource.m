@interface WFIntentHandlerResource
- (BOOL)requiresIntentSupport;
- (WFHandleIntentAction)action;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)refreshAvailability;
- (void)setAction:(id)a3;
- (void)setupWithAction:(id)a3;
@end

@implementation WFIntentHandlerResource

- (void).cxx_destruct
{
}

- (void)setAction:(id)a3
{
}

- (WFHandleIntentAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (WFHandleIntentAction *)WeakRetained;
}

- (BOOL)requiresIntentSupport
{
  return self->_requiresIntentSupport;
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  if ([a4 isEqualToString:@"IntentAppDefinition"])
  {
    [(WFResource *)self refreshAvailabilityWithNotification];
  }
}

- (void)setupWithAction:(id)a3
{
  p_action = &self->_action;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_action);
  [WeakRetained removeEventObserver:self];

  objc_storeWeak((id *)p_action, v5);
  [v5 addEventObserver:self];

  [(WFResource *)self invalidateAvailability];
}

- (void)refreshAvailability
{
  id v3 = objc_alloc(MEMORY[0x1E4F223C8]);
  v4 = [(WFIntentHandlerResource *)self action];
  id v5 = [v4 appDescriptor];
  v6 = [v5 bundleIdentifier];
  id v13 = (id)[v3 initWithBundleIdentifier:v6 allowPlaceholder:0 error:0];

  if (v13)
  {
    v7 = [(WFIntentHandlerResource *)self action];
    v8 = [v7 intentDescription];
    v9 = NSStringFromClass((Class)[v8 facadeClass]);

    v10 = [MEMORY[0x1E4F302B0] appInfoWithApplicationRecord:v13];
    v11 = [v10 supportedIntents];
    uint64_t v12 = [v11 containsObject:v9];

    [(WFResource *)self updateAvailability:v12 withError:0];
  }
  else
  {
    [(WFResource *)self updateAvailability:0 withError:0];
  }
}

@end
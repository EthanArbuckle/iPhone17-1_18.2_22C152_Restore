@interface WFScriptingActionResource
+ (BOOL)mustBeAvailableForDisplay;
- (WFScriptingActionResource)initWithDefinition:(id)a3;
- (WFSecuredPreferences)securedPreferences;
- (void)refreshAvailability;
@end

@implementation WFScriptingActionResource

- (void).cxx_destruct
{
}

- (WFSecuredPreferences)securedPreferences
{
  return self->_securedPreferences;
}

- (void)refreshAvailability
{
  BOOL v3 = +[WFShortcutsSecuritySettings areScriptingActionsEnabled];
  if (v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = +[WFShortcutsSecuritySettings scripingActionDisabledErrorWithActionName:0];
  }
  id v5 = (id)v4;
  [(WFResource *)self updateAvailability:v3 withError:v4];
}

- (WFScriptingActionResource)initWithDefinition:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFScriptingActionResource;
  BOOL v3 = [(WFResource *)&v10 initWithDefinition:a3];
  if (v3)
  {
    uint64_t v4 = +[WFSecuredPreferences standardPreferences];
    securedPreferences = v3->_securedPreferences;
    v3->_securedPreferences = (WFSecuredPreferences *)v4;

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v7 = [(WFScriptingActionResource *)v3 securedPreferences];
    [v6 addObserver:v3 selector:sel_preferencesUpdated_ name:@"WFSecuredPreferencesDidChangeNotification" object:v7];

    v8 = v3;
  }

  return v3;
}

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

@end
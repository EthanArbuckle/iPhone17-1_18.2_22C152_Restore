@interface WFAddAutomationEvent
+ (Class)codableEventClass;
- (BOOL)requiresRuntimeConfirmation;
- (BOOL)showsNotification;
- (NSString)activityType;
- (NSString)appBundleIdentifier;
- (NSString)automationSuggestionsTrialIdentifier;
- (NSString)intentType;
- (NSString)key;
- (NSString)shortcutIdentifier;
- (NSString)source;
- (NSString)triggerType;
- (unsigned)actionCount;
- (void)setActionCount:(unsigned int)a3;
- (void)setActivityType:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setAutomationSuggestionsTrialIdentifier:(id)a3;
- (void)setIntentType:(id)a3;
- (void)setKey:(id)a3;
- (void)setRequiresRuntimeConfirmation:(BOOL)a3;
- (void)setShortcutIdentifier:(id)a3;
- (void)setShowsNotification:(BOOL)a3;
- (void)setSource:(id)a3;
- (void)setTriggerType:(id)a3;
@end

@implementation WFAddAutomationEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutIdentifier, 0);
  objc_storeStrong((id *)&self->_automationSuggestionsTrialIdentifier, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setRequiresRuntimeConfirmation:(BOOL)a3
{
  self->_requiresRuntimeConfirmation = a3;
}

- (BOOL)requiresRuntimeConfirmation
{
  return self->_requiresRuntimeConfirmation;
}

- (void)setShowsNotification:(BOOL)a3
{
  self->_showsNotification = a3;
}

- (BOOL)showsNotification
{
  return self->_showsNotification;
}

- (void)setShortcutIdentifier:(id)a3
{
}

- (NSString)shortcutIdentifier
{
  return self->_shortcutIdentifier;
}

- (void)setAutomationSuggestionsTrialIdentifier:(id)a3
{
}

- (NSString)automationSuggestionsTrialIdentifier
{
  return self->_automationSuggestionsTrialIdentifier;
}

- (void)setActivityType:(id)a3
{
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setActionCount:(unsigned int)a3
{
  self->_actionCount = a3;
}

- (unsigned)actionCount
{
  return self->_actionCount;
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setIntentType:(id)a3
{
}

- (NSString)intentType
{
  return self->_intentType;
}

- (void)setTriggerType:(id)a3
{
}

- (NSString)triggerType
{
  return self->_triggerType;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end
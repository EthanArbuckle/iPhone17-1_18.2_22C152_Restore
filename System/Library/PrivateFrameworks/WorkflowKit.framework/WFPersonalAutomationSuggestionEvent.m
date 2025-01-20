@interface WFPersonalAutomationSuggestionEvent
+ (Class)codableEventClass;
- (BOOL)completed;
- (BOOL)interacted;
- (BOOL)visible;
- (NSString)activityType;
- (NSString)appBundleIdentifier;
- (NSString)intentType;
- (NSString)key;
- (NSString)source;
- (NSString)triggerType;
- (void)setActivityType:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setIntentType:(id)a3;
- (void)setInteracted:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSource:(id)a3;
- (void)setTriggerType:(id)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation WFPersonalAutomationSuggestionEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setTriggerType:(id)a3
{
}

- (NSString)triggerType
{
  return self->_triggerType;
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

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setInteracted:(BOOL)a3
{
  self->_interacted = a3;
}

- (BOOL)interacted
{
  return self->_interacted;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (BOOL)visible
{
  return self->_visible;
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

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end
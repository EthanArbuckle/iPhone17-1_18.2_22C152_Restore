@interface WFAutomatorWorkflowActionMigrationEvent
+ (Class)codableEventClass;
- (BOOL)completed;
- (NSString)automatorActionIdentifier;
- (NSString)key;
- (void)setAutomatorActionIdentifier:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setKey:(id)a3;
@end

@implementation WFAutomatorWorkflowActionMigrationEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automatorActionIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setAutomatorActionIdentifier:(id)a3
{
}

- (NSString)automatorActionIdentifier
{
  return self->_automatorActionIdentifier;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end
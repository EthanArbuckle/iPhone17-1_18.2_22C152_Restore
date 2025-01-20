@interface WFAutomatorWorkflowMigrationErrorEvent
+ (Class)codableEventClass;
- (NSString)automatorActionIdentifier;
- (NSString)errorDescription;
- (NSString)key;
- (void)setAutomatorActionIdentifier:(id)a3;
- (void)setErrorDescription:(id)a3;
- (void)setKey:(id)a3;
@end

@implementation WFAutomatorWorkflowMigrationErrorEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_automatorActionIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setErrorDescription:(id)a3
{
}

- (NSString)errorDescription
{
  return self->_errorDescription;
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
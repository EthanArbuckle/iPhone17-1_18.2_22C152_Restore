@interface WFRemoteExecutionEvent
+ (Class)codableEventClass;
- (BOOL)completed;
- (NSString)actionIdentifier;
- (NSString)connectionType;
- (NSString)destinationType;
- (NSString)key;
- (NSString)source;
- (void)setActionIdentifier:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setConnectionType:(id)a3;
- (void)setDestinationType:(id)a3;
- (void)setKey:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation WFRemoteExecutionEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionType, 0);
  objc_storeStrong((id *)&self->_destinationType, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_source, 0);
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

- (void)setConnectionType:(id)a3
{
}

- (NSString)connectionType
{
  return self->_connectionType;
}

- (void)setDestinationType:(id)a3
{
}

- (NSString)destinationType
{
  return self->_destinationType;
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end
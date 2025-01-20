@interface WFRunShortcutErrorEvent
+ (Class)codableEventClass;
- (BOOL)didRunRemotely;
- (NSString)actionIdentifier;
- (NSString)automationType;
- (NSString)errorCode;
- (NSString)errorDomain;
- (NSString)key;
- (NSString)runSource;
- (void)setActionIdentifier:(id)a3;
- (void)setAutomationType:(id)a3;
- (void)setDidRunRemotely:(BOOL)a3;
- (void)setErrorCode:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setKey:(id)a3;
- (void)setRunSource:(id)a3;
@end

@implementation WFRunShortcutErrorEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_runSource, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setDidRunRemotely:(BOOL)a3
{
  self->_didRunRemotely = a3;
}

- (BOOL)didRunRemotely
{
  return self->_didRunRemotely;
}

- (void)setAutomationType:(id)a3
{
}

- (NSString)automationType
{
  return self->_automationType;
}

- (void)setRunSource:(id)a3
{
}

- (NSString)runSource
{
  return self->_runSource;
}

- (void)setErrorCode:(id)a3
{
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorDomain:(id)a3
{
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end
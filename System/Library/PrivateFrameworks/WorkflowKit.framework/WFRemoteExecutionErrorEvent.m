@interface WFRemoteExecutionErrorEvent
+ (Class)codableEventClass;
- (NSString)destinationType;
- (NSString)errorCode;
- (NSString)errorDomain;
- (NSString)key;
- (NSString)source;
- (void)setDestinationType:(id)a3;
- (void)setErrorCode:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setKey:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation WFRemoteExecutionErrorEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_destinationType, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_key, 0);
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

- (void)setDestinationType:(id)a3
{
}

- (NSString)destinationType
{
  return self->_destinationType;
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
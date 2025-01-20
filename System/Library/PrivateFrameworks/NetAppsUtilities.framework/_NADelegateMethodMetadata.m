@interface _NADelegateMethodMetadata
- (NSDictionary)customLogSettingsByArgumentIndex;
- (NSMethodSignature)methodSignature;
- (id)customHandler;
- (void)setCustomHandler:(id)a3;
- (void)setCustomLogSettingsByArgumentIndex:(id)a3;
- (void)setMethodSignature:(id)a3;
@end

@implementation _NADelegateMethodMetadata

- (void)setCustomLogSettingsByArgumentIndex:(id)a3
{
}

- (NSDictionary)customLogSettingsByArgumentIndex
{
  return self->_customLogSettingsByArgumentIndex;
}

- (NSMethodSignature)methodSignature
{
  return self->_methodSignature;
}

- (id)customHandler
{
  return self->_customHandler;
}

- (void)setMethodSignature:(id)a3
{
}

- (void)setCustomHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLogSettingsByArgumentIndex, 0);
  objc_storeStrong(&self->_customHandler, 0);
  objc_storeStrong((id *)&self->_methodSignature, 0);
}

@end
@interface UARPPersonalizationDataTuple
- (NSData)value;
- (NSString)key;
- (UARPPersonalizationDataTuple)initWithKey:(id)a3 value:(id)a4;
- (void)dealloc;
@end

@implementation UARPPersonalizationDataTuple

- (UARPPersonalizationDataTuple)initWithKey:(id)a3 value:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UARPPersonalizationDataTuple;
  v6 = [(UARPPersonalizationDataTuple *)&v8 init];
  if (v6)
  {
    v6->_key = (NSString *)[a3 copy];
    v6->_value = (NSData *)[a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UARPPersonalizationDataTuple;
  [(UARPPersonalizationDataTuple *)&v3 dealloc];
}

- (NSString)key
{
  return self->_key;
}

- (NSData)value
{
  return self->_value;
}

@end
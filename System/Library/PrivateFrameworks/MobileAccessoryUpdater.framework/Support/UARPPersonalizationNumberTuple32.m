@interface UARPPersonalizationNumberTuple32
- (NSString)key;
- (UARPPersonalizationNumberTuple32)initWithKey:(id)a3 value:(unsigned int)a4;
- (id)description;
- (unsigned)value;
- (void)dealloc;
@end

@implementation UARPPersonalizationNumberTuple32

- (UARPPersonalizationNumberTuple32)initWithKey:(id)a3 value:(unsigned int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UARPPersonalizationNumberTuple32;
  v6 = [(UARPPersonalizationNumberTuple32 *)&v8 init];
  if (v6)
  {
    v6->_key = (NSString *)[a3 copy];
    v6->_value = a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UARPPersonalizationNumberTuple32;
  [(UARPPersonalizationNumberTuple32 *)&v3 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ : 0x%08x>", self->_key, self->_value];
}

- (NSString)key
{
  return self->_key;
}

- (unsigned)value
{
  return self->_value;
}

@end
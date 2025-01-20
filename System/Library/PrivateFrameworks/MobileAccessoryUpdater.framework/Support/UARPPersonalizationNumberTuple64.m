@interface UARPPersonalizationNumberTuple64
- (NSString)key;
- (UARPPersonalizationNumberTuple64)initWithKey:(id)a3 value:(unint64_t)a4;
- (id)description;
- (unint64_t)value;
- (void)dealloc;
@end

@implementation UARPPersonalizationNumberTuple64

- (UARPPersonalizationNumberTuple64)initWithKey:(id)a3 value:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UARPPersonalizationNumberTuple64;
  v6 = [(UARPPersonalizationNumberTuple64 *)&v8 init];
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
  v3.super_class = (Class)UARPPersonalizationNumberTuple64;
  [(UARPPersonalizationNumberTuple64 *)&v3 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ : 0x%016llx>", self->_key, self->_value];
}

- (NSString)key
{
  return self->_key;
}

- (unint64_t)value
{
  return self->_value;
}

@end
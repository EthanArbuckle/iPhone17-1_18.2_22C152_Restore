@interface APProtectedDestination
- (APProtectedDestination)initWithString:(id)a3;
- (NSString)value;
- (void)setValue:(id)a3;
@end

@implementation APProtectedDestination

- (APProtectedDestination)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APProtectedDestination;
  v5 = [(APProtectedDestination *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 sha256hash];
    value = v5->_value;
    v5->_value = (NSString *)v6;
  }
  return v5;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
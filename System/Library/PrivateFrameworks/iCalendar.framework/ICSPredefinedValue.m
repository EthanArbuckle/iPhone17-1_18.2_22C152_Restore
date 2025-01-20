@interface ICSPredefinedValue
+ (BOOL)supportsSecureCoding;
+ (id)numberWithLong:(int64_t)a3;
- (Class)classForCoder;
- (ICSPredefinedValue)initWithBytes:(const void *)a3 objCType:(const char *)a4;
- (ICSPredefinedValue)initWithCoder:(id)a3;
- (ICSPredefinedValue)initWithLong:(int64_t)a3;
- (const)objCType;
- (int64_t)longValue;
- (void)encodeWithCoder:(id)a3;
- (void)getValue:(void *)a3;
@end

@implementation ICSPredefinedValue

+ (id)numberWithLong:(int64_t)a3
{
  v3 = (void *)[objc_allocWithZone((Class)a1) initWithLong:a3];
  return v3;
}

- (ICSPredefinedValue)initWithLong:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICSPredefinedValue;
  result = [(ICSPredefinedValue *)&v5 init];
  if (result) {
    result->_value = a3;
  }
  return result;
}

- (ICSPredefinedValue)initWithBytes:(const void *)a3 objCType:(const char *)a4
{
  v6.receiver = self;
  v6.super_class = (Class)ICSPredefinedValue;
  result = [(ICSPredefinedValue *)&v6 init];
  if (result) {
    result->_value = *(void *)a3;
  }
  return result;
}

- (const)objCType
{
  return "l";
}

- (void)getValue:(void *)a3
{
  *(void *)a3 = self->_value;
}

- (int64_t)longValue
{
  return self->_value;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  v3 = NSNumber;
  int64_t value = self->_value;
  id v5 = a3;
  id v6 = [v3 numberWithLong:value];
  [v5 encodeObject:v6 forKey:@"EnumValue"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICSPredefinedValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICSPredefinedValue;
  id v5 = [(ICSPredefinedValue *)&v8 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EnumValue"];
    v5->_int64_t value = [v6 longValue];
  }
  return v5;
}

@end
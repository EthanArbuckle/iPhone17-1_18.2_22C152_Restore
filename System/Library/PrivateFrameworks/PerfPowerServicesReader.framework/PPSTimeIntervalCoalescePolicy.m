@interface PPSTimeIntervalCoalescePolicy
+ (BOOL)supportsSecureCoding;
+ (id)legacyPolicy;
- (PPSTimeIntervalCoalescePolicy)initWithCoder:(id)a3;
- (PPSTimeIntervalCoalescePolicy)initWithNumberCoalescePolicy:(signed __int16)a3 stringCoalescePolicy:(signed __int16)a4;
- (signed)numberPolicy;
- (signed)stringPolicy;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPSTimeIntervalCoalescePolicy

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[PPSTimeIntervalCoalescePolicy numberPolicy](self, "numberPolicy"), @"numberPolicy");
  objc_msgSend(v4, "encodeInteger:forKey:", -[PPSTimeIntervalCoalescePolicy stringPolicy](self, "stringPolicy"), @"stringPolicy");
}

- (PPSTimeIntervalCoalescePolicy)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PPSTimeIntervalCoalescePolicy;
  v5 = [(PPSTimeIntervalCoalescePolicy *)&v7 init];
  if (v5)
  {
    v5->_numberPolicy = [v4 decodeIntegerForKey:@"numberPolicy"];
    v5->_stringPolicy = [v4 decodeIntegerForKey:@"stringPolicy"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)legacyPolicy
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithNumberCoalescePolicy:0 stringCoalescePolicy:0];
  return v2;
}

- (PPSTimeIntervalCoalescePolicy)initWithNumberCoalescePolicy:(signed __int16)a3 stringCoalescePolicy:(signed __int16)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PPSTimeIntervalCoalescePolicy;
  result = [(PPSTimeIntervalCoalescePolicy *)&v7 init];
  if (result)
  {
    result->_numberPolicy = a3;
    result->_stringPolicy = a4;
  }
  return result;
}

- (signed)numberPolicy
{
  return self->_numberPolicy;
}

- (signed)stringPolicy
{
  return self->_stringPolicy;
}

@end
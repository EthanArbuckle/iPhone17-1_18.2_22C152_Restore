@interface APDestination
+ (APDestination)ecRouter;
+ (BOOL)supportsSecureCoding;
- (APDestination)initWithCoder:(id)a3;
- (APDestination)initWithString:(id)a3;
- (APProtectedDestination)protectedDestination;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDestination:(id)a3;
- (NSString)value;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation APDestination

- (APDestination)initWithString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)APDestination;
  v5 = [(APDestination *)&v10 init];
  if (v5
    && (v6 = (NSString *)[v4 copy], value = v5->_value, v5->_value = v6, value, !v5->_value))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (APProtectedDestination)protectedDestination
{
  v3 = [APProtectedDestination alloc];
  id v4 = [(APDestination *)self value];
  v5 = [(APProtectedDestination *)v3 initWithString:v4];

  return v5;
}

- (BOOL)isEqualToDestination:(id)a3
{
  id v4 = a3;
  v5 = [(APDestination *)self value];
  v6 = [v4 value];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (APDestination *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (self == v4)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(APDestination *)self isEqualToDestination:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  v2 = [(APDestination *)self value];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APDestination;
  v5 = [(APDestination *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(APDestination *)self value];
  [v4 encodeObject:v5 forKey:@"value"];
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

+ (APDestination)ecRouter
{
  if (qword_100289C78[0] != -1) {
    dispatch_once(qword_100289C78, &stru_100236AE8);
  }
  v2 = (void *)qword_100289C70;

  return (APDestination *)v2;
}

@end
@interface RBSInvalidateUnderConditionAttribute
+ (id)attributeWithCondition:(id)a3 minValue:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)condition;
- (RBSInvalidateUnderConditionAttribute)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (int64_t)minValue;
- (unint64_t)hash;
- (void)_initWithCondition:(uint64_t)a3 minValue:;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSInvalidateUnderConditionAttribute

+ (id)attributeWithCondition:(id)a3 minValue:(int64_t)a4
{
  id v5 = a3;
  v6 = -[RBSInvalidateUnderConditionAttribute _initWithCondition:minValue:]([RBSInvalidateUnderConditionAttribute alloc], v5, a4);

  return v6;
}

- (void)_initWithCondition:(uint64_t)a3 minValue:
{
  id v5 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)RBSInvalidateUnderConditionAttribute;
    a1 = objc_msgSendSuper2(&v9, sel__init);
    if (a1)
    {
      uint64_t v6 = [v5 copy];
      v7 = (void *)a1[1];
      a1[1] = v6;

      a1[2] = a3;
    }
  }

  return a1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RBSInvalidateUnderConditionAttribute;
  id v4 = a3;
  [(RBSAttribute *)&v5 encodeWithRBSXPCCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_condition, @"_condition", v5.receiver, v5.super_class);
  [v4 encodeInt64:self->_minValue forKey:@"_minValue"];
}

- (RBSInvalidateUnderConditionAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBSInvalidateUnderConditionAttribute;
  objc_super v5 = [(RBSAttribute *)&v10 initWithRBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_condition"];
    uint64_t v7 = [v6 copy];
    condition = v5->_condition;
    v5->_condition = (NSString *)v7;

    v5->_minValue = [v4 decodeInt64ForKey:@"_minValue"];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBSInvalidateUnderConditionAttribute;
  if (![(RBSAttribute *)&v10 isEqual:v4] || self->_minValue != v4[2]) {
    goto LABEL_9;
  }
  condition = self->_condition;
  uint64_t v6 = (NSString *)v4[1];
  if (condition == v6)
  {
    char v9 = 1;
    goto LABEL_10;
  }
  if (condition && v6 != 0) {
    char v9 = -[NSString isEqual:](condition, "isEqual:");
  }
  else {
LABEL_9:
  }
    char v9 = 0;
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  return self->_minValue ^ [(NSString *)self->_condition hash];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  objc_super v5 = (void *)[v3 initWithFormat:@"<%@| condition:%@ minValue:%lld>", v4, self->_condition, self->_minValue];

  return v5;
}

- (NSString)condition
{
  return self->_condition;
}

- (int64_t)minValue
{
  return self->_minValue;
}

- (void).cxx_destruct
{
}

@end
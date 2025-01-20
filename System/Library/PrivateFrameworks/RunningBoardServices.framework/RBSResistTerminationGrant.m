@interface RBSResistTerminationGrant
+ (id)grantWithResistance:(unsigned __int8)a3;
- (BOOL)isEqual:(id)a3;
- (RBSResistTerminationGrant)initWithRBSXPCCoder:(id)a3;
- (id)_initWithResistance:(id)result;
- (id)description;
- (unint64_t)hash;
- (unsigned)resistance;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSResistTerminationGrant

- (unint64_t)hash
{
  v2 = NSStringFromRBSTerminationResistance(self->_resistance);
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSResistTerminationGrant;
  BOOL v5 = [(RBSAttribute *)&v7 isEqual:v4] && self->_resistance == v4[8];

  return v5;
}

- (unsigned)resistance
{
  return self->_resistance;
}

+ (id)grantWithResistance:(unsigned __int8)a3
{
  id v3 = -[RBSResistTerminationGrant _initWithResistance:]([RBSResistTerminationGrant alloc], a3);
  return v3;
}

- (id)_initWithResistance:(id)result
{
  if (result)
  {
    char v2 = a2;
    id v3 = result;
    if ((a2 - 51) <= 0xFFFFFFCD)
    {
      v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:sel__initWithResistance_ object:v3 file:@"RBSResistTerminationGrant.m" lineNumber:65 description:@"initialized with invalid resistance"];
    }
    v5.receiver = v3;
    v5.super_class = (Class)RBSResistTerminationGrant;
    result = objc_msgSendSuper2(&v5, sel__init);
    if (result) {
      *((unsigned char *)result + 8) = v2;
    }
  }
  return result;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RBSResistTerminationGrant;
  id v4 = a3;
  [(RBSAttribute *)&v5 encodeWithRBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_resistance, @"_resistance", v5.receiver, v5.super_class);
}

- (RBSResistTerminationGrant)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSResistTerminationGrant;
  objc_super v5 = [(RBSAttribute *)&v7 initWithRBSXPCCoder:v4];
  if (v5) {
    v5->_resistance = [v4 decodeInt64ForKey:@"_resistance"];
  }

  return v5;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  objc_super v5 = NSStringFromRBSTerminationResistance(self->_resistance);
  v6 = (void *)[v3 initWithFormat:@"<%@| terminationResistance:%@>", v4, v5];

  return v6;
}

@end
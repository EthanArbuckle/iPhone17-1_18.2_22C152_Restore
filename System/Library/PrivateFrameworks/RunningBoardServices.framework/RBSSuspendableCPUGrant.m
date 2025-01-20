@interface RBSSuspendableCPUGrant
+ (id)grantWithRole:(unsigned __int8)a3;
- (BOOL)isEqual:(id)a3;
- (RBSSuspendableCPUGrant)initWithRBSXPCCoder:(id)a3;
- (id)_initWithRole:(id)result;
- (id)description;
- (unint64_t)hash;
- (unsigned)role;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSSuspendableCPUGrant

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSSuspendableCPUGrant;
  if ([(RBSAttribute *)&v7 isEqual:v4]) {
    BOOL v5 = self->_role == v4[8];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_role;
}

- (unsigned)role
{
  return self->_role;
}

+ (id)grantWithRole:(unsigned __int8)a3
{
  id v3 = -[RBSSuspendableCPUGrant _initWithRole:](objc_alloc((Class)a1), a3);
  return v3;
}

- (id)_initWithRole:(id)result
{
  if (result)
  {
    char v2 = a2;
    id v3 = result;
    if ((a2 - 8) <= 0xFFFFFFF8)
    {
      v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:sel__initWithRole_ object:v3 file:@"RBSSuspendableCPUGrant.m" lineNumber:78 description:@"initialized with invalid role"];
    }
    v5.receiver = v3;
    v5.super_class = (Class)RBSSuspendableCPUGrant;
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
  v5.super_class = (Class)RBSSuspendableCPUGrant;
  id v4 = a3;
  [(RBSAttribute *)&v5 encodeWithRBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_role, @"role", v5.receiver, v5.super_class);
}

- (RBSSuspendableCPUGrant)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RBSSuspendableCPUGrant;
  objc_super v5 = [(RBSAttribute *)&v8 initWithRBSXPCCoder:v4];
  if (v5)
  {
    unsigned __int8 v6 = [v4 decodeInt64ForKey:@"role"];
    if (v6 < 8u)
    {
      if (v6) {
        v5->_role = v6;
      }
      else {
        v5->_role = 1;
      }
    }
    else
    {
      v5->_role = 7;
    }
  }

  return v5;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  objc_super v5 = NSStringFromRBSRole(self->_role);
  unsigned __int8 v6 = (void *)[v3 initWithFormat:@"<%@| role:%@>", v4, v5];

  return v6;
}

@end
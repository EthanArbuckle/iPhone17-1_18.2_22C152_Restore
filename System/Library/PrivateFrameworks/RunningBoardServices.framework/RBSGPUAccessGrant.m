@interface RBSGPUAccessGrant
+ (id)grant;
+ (id)grantWithRole:(unsigned __int8)a3;
- (BOOL)isEqual:(id)a3;
- (RBSGPUAccessGrant)initWithRBSXPCCoder:(id)a3;
- (id)_initWithRole:(unsigned __int8)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)role;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSGPUAccessGrant

- (unint64_t)hash
{
  return self->_role;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSGPUAccessGrant;
  if ([(RBSAttribute *)&v7 isEqual:v4]) {
    BOOL v5 = self->_role == v4[8];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unsigned)role
{
  return self->_role;
}

+ (id)grant
{
  v2 = (void *)[objc_alloc((Class)a1) _initWithRole:2];
  return v2;
}

+ (id)grantWithRole:(unsigned __int8)a3
{
  v3 = (void *)[objc_alloc((Class)a1) _initWithRole:a3];
  return v3;
}

- (id)_initWithRole:(unsigned __int8)a3
{
  if ((a3 - 5) <= 0xFFFFFFFB)
  {
    objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"RBSGPUAccessGrant.m" lineNumber:29 description:@"initialized with invalid role"];
  }
  v8.receiver = self;
  v8.super_class = (Class)RBSGPUAccessGrant;
  id result = [(RBSAttribute *)&v8 _init];
  if (result) {
    *((unsigned char *)result + 8) = a3;
  }
  return result;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RBSGPUAccessGrant;
  id v4 = a3;
  [(RBSAttribute *)&v5 encodeWithRBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_role, @"role", v5.receiver, v5.super_class);
}

- (RBSGPUAccessGrant)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RBSGPUAccessGrant;
  objc_super v5 = [(RBSAttribute *)&v8 initWithRBSXPCCoder:v4];
  if (v5)
  {
    unsigned __int8 v6 = [v4 decodeInt64ForKey:@"role"];
    if (v6 < 5u)
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
      v5->_role = 4;
    }
  }

  return v5;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  objc_super v5 = NSStringFromRBSGPURole(self->_role);
  unsigned __int8 v6 = (void *)[v3 initWithFormat:@"<%@| role:%@>", v4, v5];

  return v6;
}

@end
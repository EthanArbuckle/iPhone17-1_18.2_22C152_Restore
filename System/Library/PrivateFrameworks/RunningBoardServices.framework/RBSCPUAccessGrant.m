@interface RBSCPUAccessGrant
+ (id)grant;
+ (id)grantUserInitiated;
+ (id)grantWithRole:(unsigned __int8)a3;
+ (id)grantWithUserInteractivity;
+ (id)grantWithUserInteractivityAndFocus;
- (BOOL)isEqual:(id)a3;
- (RBSCPUAccessGrant)initWithRBSXPCCoder:(id)a3;
- (id)_initWithRole:(id)result;
- (id)description;
- (unint64_t)hash;
- (unsigned)role;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSCPUAccessGrant

- (unint64_t)hash
{
  return self->_role;
}

- (unsigned)role
{
  return self->_role;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSCPUAccessGrant;
  if ([(RBSAttribute *)&v7 isEqual:v4]) {
    BOOL v5 = self->_role == v4[8];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)grant
{
  id v2 = -[RBSCPUAccessGrant _initWithRole:]([RBSCPUAccessGrant alloc], 2);
  return v2;
}

- (id)_initWithRole:(id)result
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v3 = result;
    if ((a2 - 8) <= 0xFFFFFFF8)
    {
      BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:sel__initWithRole_ object:v3 file:@"RBSCPUAccessGrant.m" lineNumber:96 description:@"initialized with invalid role"];
    }
    v4 = rbs_assertion_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v8 = a2;
      _os_log_impl(&dword_191FE8000, v4, OS_LOG_TYPE_DEFAULT, "RBSCPUAccessGrant with role: %d", buf, 8u);
    }

    v6.receiver = v3;
    v6.super_class = (Class)RBSCPUAccessGrant;
    result = objc_msgSendSuper2(&v6, sel__init);
    if (result) {
      *((unsigned char *)result + 8) = a2;
    }
  }
  return result;
}

+ (id)grantUserInitiated
{
  id v2 = -[RBSCPUAccessGrant _initWithRole:]([RBSCPUAccessGrant alloc], 4);
  return v2;
}

+ (id)grantWithUserInteractivity
{
  id v2 = -[RBSCPUAccessGrant _initWithRole:]([RBSCPUAccessGrant alloc], 5);
  return v2;
}

+ (id)grantWithUserInteractivityAndFocus
{
  id v2 = -[RBSCPUAccessGrant _initWithRole:]([RBSCPUAccessGrant alloc], 7);
  return v2;
}

+ (id)grantWithRole:(unsigned __int8)a3
{
  id v3 = -[RBSCPUAccessGrant _initWithRole:]([RBSCPUAccessGrant alloc], a3);
  return v3;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RBSCPUAccessGrant;
  id v4 = a3;
  [(RBSAttribute *)&v5 encodeWithRBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_role, @"role", v5.receiver, v5.super_class);
}

- (RBSCPUAccessGrant)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RBSCPUAccessGrant;
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
@interface RBSAcquisitionCompletionAttribute
+ (id)attributeWithCompletionPolicy:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (RBSAcquisitionCompletionAttribute)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)policy;
- (void)_initWithCompletionPolicy:(void *)a1;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSAcquisitionCompletionAttribute

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RBSAcquisitionCompletionAttribute;
  id v4 = a3;
  [(RBSAttribute *)&v5 encodeWithRBSXPCCoder:v4];
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_policy, @"_policy", v5.receiver, v5.super_class);
}

- (unint64_t)hash
{
  return self->_policy;
}

- (unint64_t)policy
{
  return self->_policy;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  objc_super v5 = NSStringFromRBSAcquisitionCompletionPolicy(self->_policy);
  v6 = (void *)[v3 initWithFormat:@"<%@| policy:%@>", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSAcquisitionCompletionAttribute;
  BOOL v5 = [(RBSAttribute *)&v7 isEqual:v4] && self->_policy == v4[1];

  return v5;
}

+ (id)attributeWithCompletionPolicy:(unint64_t)a3
{
  id v3 = -[RBSAcquisitionCompletionAttribute _initWithCompletionPolicy:]([RBSAcquisitionCompletionAttribute alloc], a3);
  return v3;
}

- (RBSAcquisitionCompletionAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBSAcquisitionCompletionAttribute;
  BOOL v5 = [(RBSAttribute *)&v9 initWithRBSXPCCoder:v4];
  if (v5)
  {
    unint64_t v6 = [v4 decodeUInt64ForKey:@"_policy"];
    if (RBSAcquisitionCompletionPolicyIsValid(v6)) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = 0;
    }
    v5->_policy = v7;
  }

  return v5;
}

- (void)_initWithCompletionPolicy:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)RBSAcquisitionCompletionAttribute;
  id v3 = objc_msgSendSuper2(&v6, sel__init);
  if (v3)
  {
    if (RBSAcquisitionCompletionPolicyIsValid(a2)) {
      unint64_t v4 = a2;
    }
    else {
      unint64_t v4 = 0;
    }
    v3[1] = v4;
  }
  return v3;
}

@end
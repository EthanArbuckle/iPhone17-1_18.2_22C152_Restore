@interface RBSJetsamPriorityGrant
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)grantWithBackgroundPriority;
+ (id)grantWithBand:(unint64_t)a3;
+ (id)grantWithForegroundPriority;
- (BOOL)isEqual:(id)a3;
- (RBSJetsamPriorityGrant)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (unint64_t)band;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSJetsamPriorityGrant

- (unint64_t)hash
{
  return self->_band;
}

- (unint64_t)band
{
  return self->_band;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSJetsamPriorityGrant;
  BOOL v5 = [(RBSAttribute *)&v7 isEqual:v4] && self->_band == v4[1];

  return v5;
}

+ (id)grantWithBand:(unint64_t)a3
{
  v4 = [RBSJetsamPriorityGrant alloc];
  if (v4)
  {
    v6.receiver = v4;
    v6.super_class = (Class)RBSJetsamPriorityGrant;
    v4 = (RBSJetsamPriorityGrant *)objc_msgSendSuper2(&v6, sel__init);
    if (v4) {
      v4->_band = a3;
    }
  }
  return v4;
}

+ (id)grantWithForegroundPriority
{
  return (id)[a1 grantWithBand:100];
}

+ (id)grantWithBackgroundPriority
{
  return (id)[a1 grantWithBand:40];
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RBSJetsamPriorityGrant;
  id v4 = a3;
  [(RBSAttribute *)&v5 encodeWithRBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_band, @"_band", v5.receiver, v5.super_class);
}

- (RBSJetsamPriorityGrant)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSJetsamPriorityGrant;
  objc_super v5 = [(RBSAttribute *)&v7 initWithRBSXPCCoder:v4];
  if (v5) {
    v5->_band = [v4 decodeInt64ForKey:@"_band"];
  }

  return v5;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  objc_super v5 = (void *)[v3 initWithFormat:@"<%@| band:%d>", v4, self->_band];

  return v5;
}

@end
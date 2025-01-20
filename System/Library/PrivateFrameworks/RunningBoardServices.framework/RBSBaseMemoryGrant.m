@interface RBSBaseMemoryGrant
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)grantWithActiveLimit;
+ (id)grantWithCategory:(id)a3 strength:(unsigned __int8)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)category;
- (RBSBaseMemoryGrant)initWithRBSXPCCoder:(id)a3;
- (_BYTE)_initWithCategory:(char)a3 strength:;
- (id)description;
- (unint64_t)hash;
- (unsigned)strength;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSBaseMemoryGrant

- (unint64_t)hash
{
  uint64_t strength = self->_strength;
  return [(NSString *)self->_category hash] ^ strength;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSBaseMemoryGrant;
  BOOL v5 = [(RBSAttribute *)&v7 isEqual:v4]
    && [(NSString *)self->_category isEqualToString:v4[1]]
    && self->_strength == *((unsigned __int8 *)v4 + 16);

  return v5;
}

- (NSString)category
{
  return self->_category;
}

- (unsigned)strength
{
  return self->_strength;
}

- (_BYTE)_initWithCategory:(char)a3 strength:
{
  id v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)RBSBaseMemoryGrant;
    id v7 = objc_msgSendSuper2(&v9, sel__init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 1, a2);
      a1[16] = a3;
    }
  }

  return a1;
}

+ (id)grantWithCategory:(id)a3 strength:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = -[RBSBaseMemoryGrant _initWithCategory:strength:]([RBSBaseMemoryGrant alloc], v5, a4);

  return v6;
}

+ (id)grantWithActiveLimit
{
  return +[RBSBaseMemoryGrant grantWithCategory:@"Active" strength:2];
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RBSBaseMemoryGrant;
  id v4 = a3;
  [(RBSAttribute *)&v5 encodeWithRBSXPCCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_category, @"_category", v5.receiver, v5.super_class);
  [v4 encodeInt64:self->_strength forKey:@"_strength"];
}

- (RBSBaseMemoryGrant)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBSBaseMemoryGrant;
  objc_super v5 = [(RBSAttribute *)&v9 initWithRBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeStringForKey:@"_category"];
    category = v5->_category;
    v5->_category = (NSString *)v6;

    v5->_uint64_t strength = [v4 decodeInt64ForKey:@"_strength"];
  }

  return v5;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(id)objc_opt_class() description];
  objc_super v5 = (void *)v4;
  unint64_t strength = (char)self->_strength;
  if (strength > 2) {
    id v7 = @"(unknown)";
  }
  else {
    id v7 = off_1E57416B0[strength];
  }
  v8 = (void *)[v3 initWithFormat:@"<%@| category:%@ strength:%@>", v4, self->_category, v7];

  return v8;
}

- (void).cxx_destruct
{
}

@end
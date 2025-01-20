@interface RBSPrewarmAttribute
+ (id)attributeWithIdentity:(id)a3 interval:(double)a4;
- (BOOL)isEqual:(id)a3;
- (RBSPrewarmAttribute)initWithRBSXPCCoder:(id)a3;
- (RBSProcessIdentity)identity;
- (double)interval;
- (id)_initWithidentity:(id)a3 interval:(double)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSPrewarmAttribute

- (id)_initWithidentity:(id)a3 interval:(double)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RBSPrewarmAttribute;
  v8 = [(RBSAttribute *)&v12 _init];
  v9 = v8;
  if (v8)
  {
    *((double *)v8 + 1) = a4;
    objc_storeStrong(v8 + 2, a3);
    v10 = v9;
  }

  return v9;
}

+ (id)attributeWithIdentity:(id)a3 interval:(double)a4
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [[RBSPrewarmAttribute alloc] _initWithidentity:v5 interval:a4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RBSPrewarmAttribute;
  if ([(RBSAttribute *)&v13 isEqual:v4]
    && (-[RBSPrewarmAttribute interval](self, "interval"), double v6 = v5, [v4 interval], v6 == v7))
  {
    v8 = [(RBSPrewarmAttribute *)self identity];
    uint64_t v9 = [v4 identity];
    v10 = (void *)v9;
    if (v8 == (void *)v9)
    {
      char v11 = 1;
    }
    else
    {
      char v11 = 0;
      if (v8 && v9) {
        char v11 = [v8 isEqual:v9];
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t interval = (unint64_t)self->_interval;
  return [(RBSProcessIdentity *)self->_identity hash] ^ interval;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  double v5 = (void *)[v3 initWithFormat:@"<%@| identity:%@ interval:%.2f>", v4, self->_identity, *(void *)&self->_interval];

  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RBSPrewarmAttribute;
  id v4 = a3;
  [(RBSAttribute *)&v6 encodeWithRBSXPCCoder:v4];
  [(RBSPrewarmAttribute *)self interval];
  objc_msgSend(v4, "encodeDouble:forKey:", @"_interval");
  double v5 = [(RBSPrewarmAttribute *)self identity];
  [v4 encodeObject:v5 forKey:@"_identity"];
}

- (RBSPrewarmAttribute)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RBSPrewarmAttribute;
  double v5 = [(RBSAttribute *)&v11 initWithRBSXPCCoder:v4];
  if (v5
    && ([v4 decodeDoubleForKey:@"_interval"],
        v5->_unint64_t interval = v6,
        [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identity"],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        identity = v5->_identity,
        v5->_identity = (RBSProcessIdentity *)v7,
        identity,
        v5->_identity))
  {
    uint64_t v9 = v5;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (double)interval
{
  return self->_interval;
}

- (RBSProcessIdentity)identity
{
  return self->_identity;
}

- (void).cxx_destruct
{
}

@end
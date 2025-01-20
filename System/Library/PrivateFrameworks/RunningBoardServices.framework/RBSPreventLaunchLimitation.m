@interface RBSPreventLaunchLimitation
+ (id)limitationWithPredicate:(id)a3;
+ (id)limitationWithPredicate:(id)a3 andException:(id)a4;
- (BOOL)isEqual:(id)a3;
- (RBSPreventLaunchLimitation)initWithRBSXPCCoder:(id)a3;
- (RBSProcessPredicate)allow;
- (RBSProcessPredicate)predicate;
- (id)_initWithPredicate:(void *)a3 andException:;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSPreventLaunchLimitation

+ (id)limitationWithPredicate:(id)a3
{
  id v4 = a3;
  v5 = -[RBSPreventLaunchLimitation _initWithPredicate:andException:]((id *)objc_alloc((Class)a1), v4, 0);

  return v5;
}

- (id)_initWithPredicate:(void *)a3 andException:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    if (!v6)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:sel__initWithPredicate_andException_, a1, @"RBSPreventLaunchLimitation.m", 29, @"Invalid parameter not satisfying: %@", @"predicate" object file lineNumber description];
    }
    v11.receiver = a1;
    v11.super_class = (Class)RBSPreventLaunchLimitation;
    v8 = (id *)objc_msgSendSuper2(&v11, sel__init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

+ (id)limitationWithPredicate:(id)a3 andException:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[RBSPreventLaunchLimitation _initWithPredicate:andException:]((id *)objc_alloc((Class)a1), v7, v6);

  return v8;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  v5 = (void *)[v3 initWithFormat:@"<%@| %@ allow:%@>", v4, self->_predicate, self->_allow];

  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)RBSPreventLaunchLimitation;
  [(RBSAttribute *)&v6 encodeWithRBSXPCCoder:v4];
  [v4 encodeObject:self->_predicate forKey:@"_predicate"];
  allow = self->_allow;
  if (allow) {
    [v4 encodeObject:allow forKey:@"_allow"];
  }
}

- (RBSPreventLaunchLimitation)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RBSPreventLaunchLimitation;
  v5 = [(RBSAttribute *)&v11 initWithRBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_predicate"];
    predicate = v5->_predicate;
    v5->_predicate = (RBSProcessPredicate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_allow"];
    allow = v5->_allow;
    v5->_allow = (RBSProcessPredicate *)v8;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSPreventLaunchLimitation *)a3;
  if (self == v4) {
    goto LABEL_16;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_3;
  }
  predicate = self->_predicate;
  uint64_t v8 = v4->_predicate;
  if (predicate != v8)
  {
    BOOL v9 = !predicate || v8 == 0;
    if (v9 || !-[RBSProcessPredicate isEqual:](predicate, "isEqual:")) {
      goto LABEL_3;
    }
  }
  allow = self->_allow;
  objc_super v11 = v4->_allow;
  if (allow == v11)
  {
LABEL_16:
    char v6 = 1;
    goto LABEL_17;
  }
  if (allow) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    char v6 = -[RBSProcessPredicate isEqual:](allow, "isEqual:");
    goto LABEL_17;
  }
LABEL_3:
  char v6 = 0;
LABEL_17:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(RBSProcessPredicate *)self->_predicate hash];
  return [(RBSProcessPredicate *)self->_allow hash] ^ v3;
}

- (RBSProcessPredicate)predicate
{
  return self->_predicate;
}

- (RBSProcessPredicate)allow
{
  return self->_allow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allow, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
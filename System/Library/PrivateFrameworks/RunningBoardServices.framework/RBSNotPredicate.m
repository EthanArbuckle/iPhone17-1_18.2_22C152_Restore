@interface RBSNotPredicate
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
- (RBSNotPredicate)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (id)initNotWithPredicate:(id *)a1;
- (id)processIdentifier;
- (id)processIdentifiers;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSNotPredicate

- (id)initNotWithPredicate:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)RBSNotPredicate;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (id)processIdentifier
{
  return [(RBSProcessPredicateImpl *)self->_predicate processIdentifier];
}

- (id)processIdentifiers
{
  return [(RBSProcessPredicateImpl *)self->_predicate processIdentifiers];
}

- (BOOL)matchesProcess:(id)a3
{
  return ![(RBSProcessPredicateImpl *)self->_predicate matchesProcess:a3];
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
}

- (RBSNotPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBSNotPredicate;
  v5 = [(RBSNotPredicate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_predicate"];
    predicate = v5->_predicate;
    v5->_predicate = (RBSProcessPredicateImpl *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSNotPredicate *)a3;
  if (self == v4) {
    goto LABEL_10;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_3;
  }
  predicate = self->_predicate;
  v8 = v4->_predicate;
  if (predicate == v8)
  {
LABEL_10:
    char v6 = 1;
    goto LABEL_11;
  }
  if (predicate) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    char v6 = -[RBSProcessPredicateImpl isEqual:](predicate, "isEqual:");
    goto LABEL_11;
  }
LABEL_3:
  char v6 = 0;
LABEL_11:

  return v6;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@ [%@]>", v4, self->_predicate];

  return v5;
}

- (void).cxx_destruct
{
}

@end
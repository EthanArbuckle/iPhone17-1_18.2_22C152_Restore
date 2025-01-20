@interface RBSProcessIntPredicate
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
- (RBSProcessIntPredicate)initWithIdentifier:(unint64_t)a3;
- (RBSProcessIntPredicate)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (id)processPredicate;
- (unint64_t)hash;
- (unint64_t)identifier;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessIntPredicate

- (RBSProcessIntPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSProcessIntPredicate;
  v5 = [(RBSProcessIntPredicate *)&v7 init];
  if (v5) {
    v5->_identifier = [v4 decodeUInt64ForKey:@"_identifier"];
  }

  return v5;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  v5 = (void *)[v3 initWithFormat:@"<%@ %llu>", v4, self->_identifier];

  return v5;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)RBSProcessIntPredicate;
  unint64_t v3 = [(RBSProcessPredicateImpl *)&v6 hash];
  unint64_t v4 = 0xBF58476D1CE4E5B9 * (self->_identifier ^ (self->_identifier >> 30));
  return v3 ^ ((0x94D049BB133111EBLL * (v4 ^ (v4 >> 27))) >> 31) ^ (0x94D049BB133111EBLL * (v4 ^ (v4 >> 27)));
}

- (RBSProcessIntPredicate)initWithIdentifier:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RBSProcessIntPredicate;
  result = [(RBSProcessIntPredicate *)&v5 init];
  if (result) {
    result->_identifier = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (RBSProcessIntPredicate *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      unint64_t identifier = self->_identifier;
      BOOL v6 = identifier == [(RBSProcessIntPredicate *)v4 identifier];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:self];
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (BOOL)matchesProcess:(id)a3
{
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_0_3(v3);
  return 0;
}

@end
@interface RBSProcessStringPredicate
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
- (NSString)identifier;
- (RBSProcessStringPredicate)initWithIdentifier:(id)a3;
- (RBSProcessStringPredicate)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (id)processPredicate;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessStringPredicate

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBSProcessStringPredicate *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      identifier = self->_identifier;
      uint64_t v8 = [(RBSProcessStringPredicate *)v4 identifier];
      v9 = (void *)v8;
      if (identifier == (NSString *)v8)
      {
        char v6 = 1;
      }
      else
      {
        if (identifier) {
          BOOL v10 = v8 == 0;
        }
        else {
          BOOL v10 = 1;
        }
        if (v10) {
          char v6 = 0;
        }
        else {
          char v6 = [(NSString *)identifier isEqual:v8];
        }
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSProcessStringPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBSProcessStringPredicate;
  uint64_t v5 = [(RBSProcessStringPredicate *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@ \"%@\">", v4, self->_identifier];

  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)RBSProcessStringPredicate;
  unint64_t v3 = [(RBSProcessPredicateImpl *)&v5 hash];
  return [(NSString *)self->_identifier hash] ^ v3;
}

- (RBSProcessStringPredicate)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"RBSProcessPredicate.m", 242, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)RBSProcessStringPredicate;
  uint64_t v6 = [(RBSProcessStringPredicate *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v7;
  }
  return v6;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:self];
}

- (BOOL)matchesProcess:(id)a3
{
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_0_3(v3);
  return 0;
}

@end
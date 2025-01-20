@interface RBSProcessPlatformPredicate
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
- (RBSProcessPlatformPredicate)initWithPlatform:(int)a3;
- (RBSProcessPlatformPredicate)initWithRBSXPCCoder:(id)a3;
- (id)description;
- (id)processPredicate;
- (int)platform;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessPlatformPredicate

- (RBSProcessPlatformPredicate)initWithPlatform:(int)a3
{
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)RBSProcessPlatformPredicate;
    v4 = [(RBSProcessPlatformPredicate *)&v7 init];
    if (v4) {
      v4->_platform = a3;
    }
    self = v4;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)matchesProcess:(id)a3
{
  return [a3 platform] == self->_platform;
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatching:self];
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)RBSProcessPlatformPredicate;
  return [(RBSProcessPredicateImpl *)&v3 hash] ^ self->_platform;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBSProcessPlatformPredicate *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class() && self->_platform == v4->_platform;
  }

  return v6;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(id)objc_opt_class() description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| %d>", v4, self->_platform];

  return v5;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
}

- (RBSProcessPlatformPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSProcessPlatformPredicate;
  uint64_t v5 = [(RBSProcessPlatformPredicate *)&v7 init];
  if (v5) {
    v5->_platform = [v4 decodeInt64ForKey:@"_platform"];
  }

  return v5;
}

- (int)platform
{
  return self->_platform;
}

@end
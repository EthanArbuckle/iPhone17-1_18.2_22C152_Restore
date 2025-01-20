@interface RBSProcessIdentifiersPredicate
- (BOOL)matchesProcess:(id)a3;
- (NSSet)processIdentifiers;
- (RBSProcessIdentifiersPredicate)initWithIdentifiers:(id)a3;
- (RBSProcessIdentifiersPredicate)initWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessIdentifiersPredicate

- (BOOL)matchesProcess:(id)a3
{
  identifiers = self->super._identifiers;
  v4 = [a3 instance];
  v5 = [v4 identifier];
  LOBYTE(identifiers) = [(NSSet *)identifiers containsObject:v5];

  return (char)identifiers;
}

- (RBSProcessIdentifiersPredicate)initWithIdentifiers:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"RBSProcessPredicate+Identifier.m", 89, @"Invalid parameter not satisfying: %@", @"identifiers" object file lineNumber description];
  }
  v9.receiver = self;
  v9.super_class = (Class)RBSProcessIdentifiersPredicate;
  v6 = [(RBSProcessCollectionPredicateImpl *)&v9 initWithIdentifiers:v5];

  return v6;
}

- (RBSProcessIdentifiersPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [v4 decodeCollectionOfClass:v5 containingClass:objc_opt_class() forKey:@"_identifiers"];

  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)RBSProcessIdentifiersPredicate;
    self = [(RBSProcessCollectionPredicateImpl *)&v9 initWithIdentifiers:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSSet)processIdentifiers
{
  return self->super._identifiers;
}

@end
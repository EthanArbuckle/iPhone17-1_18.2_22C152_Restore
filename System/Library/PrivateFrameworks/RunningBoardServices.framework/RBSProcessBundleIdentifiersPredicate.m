@interface RBSProcessBundleIdentifiersPredicate
- (BOOL)matchesProcess:(id)a3;
- (RBSProcessBundleIdentifiersPredicate)initWithIdentifiers:(id)a3;
- (RBSProcessBundleIdentifiersPredicate)initWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessBundleIdentifiersPredicate

- (RBSProcessBundleIdentifiersPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [v4 decodeCollectionOfClass:v5 containingClass:objc_opt_class() forKey:@"_identifiers"];

  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)RBSProcessBundleIdentifiersPredicate;
    self = [(RBSProcessCollectionPredicateImpl *)&v9 initWithIdentifiers:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)matchesProcess:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identity];
  uint64_t v6 = [v5 embeddedApplicationIdentifier];
  if (v6)
  {
    v7 = (void *)v6;
  }
  else
  {
    v8 = [v4 bundle];
    v7 = [v8 identifier];

    if (!v7)
    {
      BOOL v9 = 0;
      goto LABEL_5;
    }
  }
  BOOL v9 = [(NSSet *)self->super._identifiers containsObject:v7];

LABEL_5:
  return v9;
}

- (RBSProcessBundleIdentifiersPredicate)initWithIdentifiers:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"RBSProcessPredicate+Bundles.m", 132, @"Invalid parameter not satisfying: %@", @"identifiers" object file lineNumber description];
  }
  v9.receiver = self;
  v9.super_class = (Class)RBSProcessBundleIdentifiersPredicate;
  uint64_t v6 = [(RBSProcessCollectionPredicateImpl *)&v9 initWithIdentifiers:v5];

  return v6;
}

@end
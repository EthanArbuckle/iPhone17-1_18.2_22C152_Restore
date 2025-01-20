@interface RBSProcessBundleIdentifierPredicate
- (BOOL)matchesProcess:(id)a3;
@end

@implementation RBSProcessBundleIdentifierPredicate

- (BOOL)matchesProcess:(id)a3
{
  id v4 = a3;
  v5 = [(RBSProcessStringPredicate *)self identifier];
  v6 = [v4 identity];
  v7 = [v6 embeddedApplicationIdentifier];
  if (v7)
  {
    char v8 = [v5 isEqualToString:v7];
  }
  else
  {
    v9 = [v4 bundle];
    v10 = [v9 identifier];
    char v8 = [v5 isEqualToString:v10];
  }
  return v8;
}

@end
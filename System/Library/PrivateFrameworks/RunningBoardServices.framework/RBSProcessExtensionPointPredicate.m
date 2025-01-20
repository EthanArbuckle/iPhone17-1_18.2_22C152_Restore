@interface RBSProcessExtensionPointPredicate
- (BOOL)matchesProcess:(id)a3;
@end

@implementation RBSProcessExtensionPointPredicate

- (BOOL)matchesProcess:(id)a3
{
  id v4 = a3;
  v5 = [v4 identity];
  int v6 = [v5 isExtension];

  if (v6)
  {
    v7 = [(RBSProcessStringPredicate *)self identifier];
    v8 = [v4 bundle];
    v9 = [v8 extensionPointIdentifier];
    char v10 = [v7 isEqualToString:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

@end
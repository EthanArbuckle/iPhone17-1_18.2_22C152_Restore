@interface RBSProcessBundledDextPredicate
- (BOOL)matchesProcess:(id)a3;
@end

@implementation RBSProcessBundledDextPredicate

- (BOOL)matchesProcess:(id)a3
{
  id v4 = a3;
  v5 = [(RBSProcessStringPredicate *)self identifier];
  v6 = [v4 identity];

  uint64_t v7 = [v6 dextContainingAppBundleID];
  v8 = (void *)v7;
  if (v5 == (void *)v7)
  {
    char v9 = 1;
  }
  else
  {
    char v9 = 0;
    if (v5 && v7) {
      char v9 = [v5 isEqual:v7];
    }
  }

  return v9;
}

@end
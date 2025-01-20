@interface RBSProcessServiceNamePredicate
- (BOOL)matchesProcess:(id)a3;
@end

@implementation RBSProcessServiceNamePredicate

- (BOOL)matchesProcess:(id)a3
{
  id v4 = a3;
  v5 = [(RBSProcessStringPredicate *)self identifier];
  v6 = [v4 identity];

  if ([v6 hasConsistentLaunchdJob])
  {
    uint64_t v7 = [v6 consistentLaunchdJobLabel];
  }
  else if ([v6 isXPCService])
  {
    uint64_t v7 = [v6 xpcServiceIdentifier];
  }
  else if ([v6 isEmbeddedApplication])
  {
    uint64_t v7 = [v6 embeddedApplicationIdentifier];
  }
  else
  {
    if (![v6 isApplication])
    {
      char v9 = 0;
      goto LABEL_10;
    }
    uint64_t v7 = [v6 applicationJobLabel];
  }
  v8 = (void *)v7;
  char v9 = [v5 isEqualToString:v7];

LABEL_10:
  return v9;
}

@end
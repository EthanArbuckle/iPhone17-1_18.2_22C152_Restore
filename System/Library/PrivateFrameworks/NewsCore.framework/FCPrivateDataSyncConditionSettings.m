@interface FCPrivateDataSyncConditionSettings
- (BOOL)isSatisfied;
- (id)description;
@end

@implementation FCPrivateDataSyncConditionSettings

- (id)description
{
  v3 = NSString;
  v4 = +[FCAppleAccount sharedAccount];
  int v5 = [v4 isPrivateDataSyncingEnabled];
  v6 = @"NO";
  if (v5) {
    v6 = @"YES";
  }
  v7 = [v3 stringWithFormat:@"<%p condition=Settings, enabled=%@>", self, v6];

  return v7;
}

- (BOOL)isSatisfied
{
  v2 = +[FCAppleAccount sharedAccount];
  char v3 = [v2 isPrivateDataSyncingEnabled];

  return v3;
}

@end
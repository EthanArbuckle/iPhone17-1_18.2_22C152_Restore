@interface BlankAllowListProvider
- (FCPersonalizationWhitelist)allowlist;
- (unint64_t)allowlistLevelForTagID:(id)a3;
@end

@implementation BlankAllowListProvider

- (FCPersonalizationWhitelist)allowlist
{
  return (FCPersonalizationWhitelist *)0;
}

- (unint64_t)allowlistLevelForTagID:(id)a3
{
  return 2;
}

@end
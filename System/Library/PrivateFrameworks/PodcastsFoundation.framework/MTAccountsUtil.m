@interface MTAccountsUtil
+ (BOOL)userAllowsPersonalization;
- (MTAccountsUtil)init;
@end

@implementation MTAccountsUtil

+ (BOOL)userAllowsPersonalization
{
  return _s18PodcastsFoundation12AccountsUtilC25userAllowsPersonalizationSbvgZ_0() & 1;
}

- (MTAccountsUtil)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AccountsUtil();
  return [(MTAccountsUtil *)&v3 init];
}

@end
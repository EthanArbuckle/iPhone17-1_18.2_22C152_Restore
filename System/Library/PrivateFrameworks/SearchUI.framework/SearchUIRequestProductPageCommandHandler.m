@interface SearchUIRequestProductPageCommandHandler
- (unint64_t)destination;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
@end

@implementation SearchUIRequestProductPageCommandHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v5 = a3;
  id v8 = [v5 distributorBundleIdentifier];
  uint64_t v6 = [v5 itemIdentifier];
  uint64_t v7 = [v5 versionIdentifier];

  +[SearchUIMarketplaceKitUtilities requestProductPageWithDistributorID:v8 itemID:v6 versionID:v7 completionHandler:&__block_literal_global_28];
}

- (unint64_t)destination
{
  return 2;
}

@end
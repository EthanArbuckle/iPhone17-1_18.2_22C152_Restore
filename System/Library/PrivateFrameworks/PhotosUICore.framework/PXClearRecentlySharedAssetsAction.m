@interface PXClearRecentlySharedAssetsAction
- (NSString)actionIdentifier;
- (NSString)actionNameLocalizationKey;
- (PXClearRecentlySharedAssetsAction)initWithAssets:(id)a3;
@end

@implementation PXClearRecentlySharedAssetsAction

- (NSString)actionIdentifier
{
  v2 = (void *)sub_1AB23A72C();
  return (NSString *)v2;
}

- (NSString)actionNameLocalizationKey
{
  v2 = (void *)sub_1AB23A72C();
  return (NSString *)v2;
}

- (PXClearRecentlySharedAssetsAction)initWithAssets:(id)a3
{
  return (PXClearRecentlySharedAssetsAction *)sub_1AA4C0310(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for ClearRecentlySharedAssetsAction);
}

@end
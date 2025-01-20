@interface PXMessagesDebugTapbackStatusManager
- (BOOL)hasTapbacksForAsset:(id)a3;
- (Class)decorationViewClass;
- (id)tapbackUserDataForAsset:(id)a3 previousAsset:(id)a4;
@end

@implementation PXMessagesDebugTapbackStatusManager

- (Class)decorationViewClass
{
  return (Class)objc_opt_class();
}

- (id)tapbackUserDataForAsset:(id)a3 previousAsset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(PXMessagesDebugTapbackUserData);
  if ([v5 isFavorite])
  {
    int v8 = [v5 isFavorite];
    uint64_t v9 = v8 ^ [v6 isFavorite];
  }
  else
  {
    uint64_t v9 = 0;
  }
  [(PXMessagesDebugTapbackUserData *)v7 setShouldAnimate:v9];
  [(PXMessagesDebugTapbackUserData *)v7 setAsset:v5];

  return v7;
}

- (BOOL)hasTapbacksForAsset:(id)a3
{
  return [a3 isFavorite];
}

@end
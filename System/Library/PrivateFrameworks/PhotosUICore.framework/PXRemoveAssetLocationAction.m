@interface PXRemoveAssetLocationAction
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (id)analyticsActionString;
- (id)locationForAsset:(id)a3 shifted:(BOOL *)a4;
@end

@implementation PXRemoveAssetLocationAction

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v6 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___PXRemoveAssetLocationAction;
  if (objc_msgSendSuper2(&v10, sel_canPerformOnAsset_inAssetCollection_, v6, a4))
  {
    v7 = [v6 location];
    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)locationForAsset:(id)a3 shifted:(BOOL *)a4
{
  return 0;
}

- (id)analyticsActionString
{
  return @"remove";
}

- (id)actionNameLocalizationKey
{
  return @"PXRemoveLocationActionName";
}

- (id)actionIdentifier
{
  return @"RemoveAssetsLocation";
}

@end
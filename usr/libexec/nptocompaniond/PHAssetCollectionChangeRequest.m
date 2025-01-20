@interface PHAssetCollectionChangeRequest
+ (id)npto_creationRequestForAssetCollectionWithUUID:(id)a3;
@end

@implementation PHAssetCollectionChangeRequest

+ (id)npto_creationRequestForAssetCollectionWithUUID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)PHAssetCollectionChangeRequest);
  v5 = [v3 UUIDString];

  id v6 = [v4 initWithUUID:v5 objectID:0];

  return v6;
}

@end
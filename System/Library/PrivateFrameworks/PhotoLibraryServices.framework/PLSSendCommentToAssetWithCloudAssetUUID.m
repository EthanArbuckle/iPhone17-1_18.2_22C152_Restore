@interface PLSSendCommentToAssetWithCloudAssetUUID
@end

@implementation PLSSendCommentToAssetWithCloudAssetUUID

void ___PLSSendCommentToAssetWithCloudAssetUUID_block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) assetWithUUID:*(void *)(a1 + 40)];
  id v2 = (id)[v3 userAddCloudSharedCommentWithText:*(void *)(a1 + 48)];
}

@end
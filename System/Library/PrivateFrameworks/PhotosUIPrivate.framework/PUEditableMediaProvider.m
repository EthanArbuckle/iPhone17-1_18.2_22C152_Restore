@interface PUEditableMediaProvider
- (int)requestAVAssetForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestAsynchronousVideoURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
@end

@implementation PUEditableMediaProvider

- (int)requestAsynchronousVideoURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  [v7 handleFailureInMethod:a2 object:self file:@"PUEditableMediaProvider.m" lineNumber:19 description:@"concrete subclass must implement"];

  return 0;
}

- (int)requestAVAssetForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  [v7 handleFailureInMethod:a2 object:self file:@"PUEditableMediaProvider.m" lineNumber:14 description:@"concrete subclass must implement"];

  return 0;
}

@end
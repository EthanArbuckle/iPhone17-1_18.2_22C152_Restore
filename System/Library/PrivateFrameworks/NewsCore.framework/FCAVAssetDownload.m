@interface FCAVAssetDownload
- (NSString)longOperationDescription;
- (NSString)shortOperationDescription;
- (id)initWithAssetID:(void *)a3 underlyingOperation:;
@end

@implementation FCAVAssetDownload

- (id)initWithAssetID:(void *)a3 underlyingOperation:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)FCAVAssetDownload;
    a1 = (id *)objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 copy];
      id v8 = a1[1];
      a1[1] = (id)v7;

      objc_storeStrong(a1 + 2, a3);
      uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
      id v10 = a1[3];
      a1[3] = (id)v9;
    }
  }

  return a1;
}

- (NSString)shortOperationDescription
{
  if (self) {
    self = (FCAVAssetDownload *)self->_underlyingOperation;
  }
  return [(FCAVAssetDownload *)self shortOperationDescription];
}

- (NSString)longOperationDescription
{
  if (self) {
    self = (FCAVAssetDownload *)self->_underlyingOperation;
  }
  return [(FCAVAssetDownload *)self longOperationDescription];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_underlyingOperation, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
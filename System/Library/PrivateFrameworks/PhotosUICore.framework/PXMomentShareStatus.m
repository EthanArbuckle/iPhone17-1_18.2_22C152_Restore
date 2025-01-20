@interface PXMomentShareStatus
+ (PXMomentShareStatus)new;
- (NSString)description;
- (PXCMMInvitation)invitation;
- (PXCPLUIStatusProvider)statusProvider;
- (PXDisplayAssetFetchResult)allAssetsFetchResult;
- (PXDisplayAssetFetchResult)copiedAssetsFetchResult;
- (PXDisplayAssetFetchResult)copyingAssetsFetchResult;
- (PXDisplayMomentShare)momentShare;
- (PXMomentShareStatus)init;
- (PXMomentShareStatus)initWithMomentShare:(id)a3;
- (id)_createStatusProvider;
- (void)performChanges:(id)a3;
- (void)setAllAssetsFetchResult:(id)a3;
- (void)setCopiedAssetsFetchResult:(id)a3;
- (void)setCopyingAssetsFetchResult:(id)a3;
- (void)setMomentShare:(id)a3;
@end

@implementation PXMomentShareStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_copiedAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_copyingAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_statusProvider, 0);
}

- (PXDisplayAssetFetchResult)allAssetsFetchResult
{
  return self->_allAssetsFetchResult;
}

- (PXDisplayAssetFetchResult)copiedAssetsFetchResult
{
  return self->_copiedAssetsFetchResult;
}

- (PXDisplayAssetFetchResult)copyingAssetsFetchResult
{
  return self->_copyingAssetsFetchResult;
}

- (PXCMMInvitation)invitation
{
  return self->_invitation;
}

- (PXDisplayMomentShare)momentShare
{
  return self->_momentShare;
}

- (id)_createStatusProvider
{
  return 0;
}

- (void)setAllAssetsFetchResult:(id)a3
{
  v5 = (PXDisplayAssetFetchResult *)a3;
  if (self->_allAssetsFetchResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_allAssetsFetchResult, a3);
    [(PXMomentShareStatus *)self signalChange:8];
    v5 = v6;
  }
}

- (void)setCopiedAssetsFetchResult:(id)a3
{
  v5 = (PXDisplayAssetFetchResult *)a3;
  if (self->_copiedAssetsFetchResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_copiedAssetsFetchResult, a3);
    [(PXMomentShareStatus *)self signalChange:4];
    v5 = v6;
  }
}

- (void)setCopyingAssetsFetchResult:(id)a3
{
  v5 = (PXDisplayAssetFetchResult *)a3;
  if (self->_copyingAssetsFetchResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_copyingAssetsFetchResult, a3);
    [(PXMomentShareStatus *)self signalChange:2];
    v5 = v6;
  }
}

- (void)setMomentShare:(id)a3
{
  v5 = (PXDisplayMomentShare *)a3;
  if (self->_momentShare != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_momentShare, a3);
    [(PXMomentShareStatus *)self signalChange:1];
    v5 = v6;
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXMomentShareStatus;
  [(PXMomentShareStatus *)&v3 performChanges:a3];
}

- (PXCPLUIStatusProvider)statusProvider
{
  statusProvider = self->_statusProvider;
  if (!statusProvider)
  {
    v4 = [(PXMomentShareStatus *)self _createStatusProvider];
    v5 = self->_statusProvider;
    self->_statusProvider = v4;

    statusProvider = self->_statusProvider;
  }
  return statusProvider;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p, number of downloaded assets: %lu, number of copied assets: %lu, number of assets total: %lu, share: \"%@\">", objc_opt_class(), self, -[PXDisplayAssetFetchResult count](self->_copyingAssetsFetchResult, "count"), -[PXDisplayAssetFetchResult count](self->_copiedAssetsFetchResult, "count"), -[PXDisplayAssetFetchResult count](self->_allAssetsFetchResult, "count"), self->_momentShare];
}

- (PXMomentShareStatus)initWithMomentShare:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXMomentShareStatus.m", 46, @"Invalid parameter not satisfying: %@", @"momentShare" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXMomentShareStatus;
  v7 = [(PXMomentShareStatus *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_momentShare, a3);
  }

  return v8;
}

- (PXMomentShareStatus)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXMomentShareStatus.m", 38, @"%s is not available as initializer", "-[PXMomentShareStatus init]");

  abort();
}

+ (PXMomentShareStatus)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXMomentShareStatus.m", 42, @"%s is not available as initializer", "+[PXMomentShareStatus new]");

  abort();
}

@end
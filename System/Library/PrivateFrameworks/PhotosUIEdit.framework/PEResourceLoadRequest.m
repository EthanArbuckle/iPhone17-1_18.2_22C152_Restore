@interface PEResourceLoadRequest
- (BOOL)_isWorkVersionResolved;
- (BOOL)_needsLoadAdjustments;
- (BOOL)assetLoadingAsRaw;
- (BOOL)requireAdjustments;
- (BOOL)requireLocalResources;
- (BOOL)requireOriginalsDownloaded;
- (BOOL)skipLivePhotoImageAndAVAsset;
- (CGSize)targetSize;
- (PEResourceLoaderDelegate)delegate;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_resolvedVersion;
- (int64_t)version;
- (void)_assertWorkVersionResolved;
- (void)_resolveVersionIfNeededWithWorkVersion:(int64_t)a3;
- (void)_setResolvedVersion:(int64_t)a3;
- (void)setAssetLoadingAsRaw:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setRequireAdjustments:(BOOL)a3;
- (void)setRequireLocalResources:(BOOL)a3;
- (void)setRequireOriginalsDownloaded:(BOOL)a3;
- (void)setSkipLivePhotoImageAndAVAsset:(BOOL)a3;
- (void)setTargetSize:(CGSize)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation PEResourceLoadRequest

- (void).cxx_destruct
{
}

- (void)setAssetLoadingAsRaw:(BOOL)a3
{
  self->_assetLoadingAsRaw = a3;
}

- (BOOL)assetLoadingAsRaw
{
  return self->_assetLoadingAsRaw;
}

- (void)_setResolvedVersion:(int64_t)a3
{
  self->__resolvedVersion = a3;
}

- (int64_t)_resolvedVersion
{
  return self->__resolvedVersion;
}

- (void)setRequireOriginalsDownloaded:(BOOL)a3
{
  self->_requireOriginalsDownloaded = a3;
}

- (BOOL)requireOriginalsDownloaded
{
  return self->_requireOriginalsDownloaded;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setDelegate:(id)a3
{
}

- (PEResourceLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PEResourceLoaderDelegate *)WeakRetained;
}

- (void)setSkipLivePhotoImageAndAVAsset:(BOOL)a3
{
  self->_skipLivePhotoImageAndAVAsset = a3;
}

- (BOOL)skipLivePhotoImageAndAVAsset
{
  return self->_skipLivePhotoImageAndAVAsset;
}

- (void)setRequireAdjustments:(BOOL)a3
{
  self->_requireAdjustments = a3;
}

- (BOOL)requireAdjustments
{
  return self->_requireAdjustments;
}

- (void)setRequireLocalResources:(BOOL)a3
{
  self->_requireLocalResources = a3;
}

- (BOOL)requireLocalResources
{
  return self->_requireLocalResources;
}

- (void)_assertWorkVersionResolved
{
  if (![(PEResourceLoadRequest *)self _isWorkVersionResolved])
  {
    id v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PEResourceLoader.m" lineNumber:106 description:@"Can't fetch media without knowing the version to request"];
  }
}

- (BOOL)_isWorkVersionResolved
{
  return [(PEResourceLoadRequest *)self _resolvedVersion] != 0;
}

- (void)_resolveVersionIfNeededWithWorkVersion:(int64_t)a3
{
  if (![(PEResourceLoadRequest *)self _isWorkVersionResolved])
  {
    [(PEResourceLoadRequest *)self _setResolvedVersion:a3];
  }
}

- (BOOL)_needsLoadAdjustments
{
  BOOL v3 = [(PEResourceLoadRequest *)self requireAdjustments];
  return v3 | ![(PEResourceLoadRequest *)self _isWorkVersionResolved];
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
  -[PEResourceLoadRequest _setResolvedVersion:](self, "_setResolvedVersion:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setRequireLocalResources:", -[PEResourceLoadRequest requireLocalResources](self, "requireLocalResources"));
  objc_msgSend(v4, "setRequireAdjustments:", -[PEResourceLoadRequest requireAdjustments](self, "requireAdjustments"));
  v5 = [(PEResourceLoadRequest *)self delegate];
  [v4 setDelegate:v5];

  objc_msgSend(v4, "setVersion:", -[PEResourceLoadRequest version](self, "version"));
  [(PEResourceLoadRequest *)self targetSize];
  objc_msgSend(v4, "setTargetSize:");
  objc_msgSend(v4, "setRequireOriginalsDownloaded:", -[PEResourceLoadRequest requireOriginalsDownloaded](self, "requireOriginalsDownloaded"));
  return v4;
}

@end
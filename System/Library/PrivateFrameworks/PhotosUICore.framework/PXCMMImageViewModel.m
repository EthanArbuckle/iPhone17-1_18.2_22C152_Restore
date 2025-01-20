@interface PXCMMImageViewModel
- (BOOL)isHighlighted;
- (PXDisplayAsset)asset;
- (PXUIImageProvider)mediaProvider;
- (void)performChanges:(id)a3;
- (void)setAsset:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMediaProvider:(id)a3;
@end

@implementation PXCMMImageViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (PXUIImageProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(PXCMMImageViewModel *)self signalChange:4];
  }
}

- (void)setMediaProvider:(id)a3
{
  v5 = (PXUIImageProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    [(PXCMMImageViewModel *)self signalChange:2];
    v5 = v6;
  }
}

- (void)setAsset:(id)a3
{
  v5 = (PXDisplayAsset *)a3;
  if (self->_asset != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    [(PXCMMImageViewModel *)self signalChange:1];
    v5 = v6;
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXCMMImageViewModel;
  [(PXCMMImageViewModel *)&v3 performChanges:a3];
}

@end
@interface PXImageRequesterHelper
- (CGRect)contentsRect;
- (CGSize)contentSize;
- (PXDisplayAsset)asset;
- (PXImageRequester)imageRequester;
- (PXUIImageProvider)mediaProvider;
- (UIImage)image;
- (double)scale;
- (void)_updateAssetOrMediaProvider;
- (void)_updateContentsRect;
- (void)_updateImage;
- (void)_updateImageRequester;
- (void)didPublishChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)setAsset:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setImage:(id)a3;
- (void)setImageRequester:(id)a3;
- (void)setMediaProvider:(id)a3;
- (void)setScale:(double)a3;
@end

@implementation PXImageRequesterHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (PXImageRequester)imageRequester
{
  return self->_imageRequester;
}

- (UIImage)image
{
  return self->_image;
}

- (double)scale
{
  return self->_scale;
}

- (CGRect)contentsRect
{
  double x = self->_contentsRect.origin.x;
  double y = self->_contentsRect.origin.y;
  double width = self->_contentsRect.size.width;
  double height = self->_contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXUIImageProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((void *)PXImageRequesterObserverContext_189396 == a5)
  {
    id v9 = v8;
    if ((v6 & 4) != 0)
    {
      [(PXImageRequesterHelper *)self _updateImage];
      id v8 = v9;
    }
    if (v6 < 0)
    {
      [(PXImageRequesterHelper *)self _updateContentsRect];
      id v8 = v9;
    }
  }
}

- (void)_updateContentsRect
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45__PXImageRequesterHelper__updateContentsRect__block_invoke;
  v2[3] = &unk_1E5DC3480;
  v2[4] = self;
  [(PXImageRequesterHelper *)self performChanges:v2];
}

void __45__PXImageRequesterHelper__updateContentsRect__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 imageRequester];
  [v4 contentsRect];
  objc_msgSend(v3, "setContentsRect:");
}

- (void)_updateImage
{
  id v3 = [(PXImageRequesterHelper *)self imageRequester];
  id v4 = [v3 image];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__PXImageRequesterHelper__updateImage__block_invoke;
  v6[3] = &unk_1E5DC3480;
  id v7 = v4;
  id v5 = v4;
  [(PXImageRequesterHelper *)self performChanges:v6];
}

uint64_t __38__PXImageRequesterHelper__updateImage__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setImage:*(void *)(a1 + 32)];
}

- (void)_updateAssetOrMediaProvider
{
  id v3 = [(PXImageRequesterHelper *)self asset];
  uint64_t v4 = [(PXImageRequesterHelper *)self mediaProvider];
  id v5 = (void *)v4;
  if (v3 && v4)
  {
    uint64_t v6 = [(PXImageRequesterHelper *)self imageRequester];
    if (v6)
    {
      id v7 = (PXImageRequester *)v6;
      uint64_t v8 = MEMORY[0x1E4F143A8];
      uint64_t v9 = 3221225472;
      v10 = __53__PXImageRequesterHelper__updateAssetOrMediaProvider__block_invoke;
      v11 = &unk_1E5DC3458;
      id v12 = v3;
      id v13 = v5;
      [(PXImageRequester *)v7 performChanges:&v8];
      [(PXImageRequesterHelper *)self _updateImageRequester];
    }
    else
    {
      id v7 = [[PXImageRequester alloc] initWithMediaProvider:v5 asset:v3];
      [(PXImageRequesterHelper *)self setImageRequester:v7];
    }
  }
  else
  {
    [(PXImageRequesterHelper *)self setImageRequester:0];
  }
}

void __53__PXImageRequesterHelper__updateAssetOrMediaProvider__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAsset:v3];
  [v4 setMediaProvider:*(void *)(a1 + 40)];
}

- (void)_updateImageRequester
{
  if (objc_claimAutoreleasedReturnValue())
  {
    [(PXImageRequesterHelper *)self asset];
    objc_claimAutoreleasedReturnValue();
    PXSizeIsEmpty();
  }
}

void __47__PXImageRequesterHelper__updateImageRequester__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(a1 + 32) + 136);
  double v4 = *(double *)(*(void *)(a1 + 32) + 144);
  id v5 = a2;
  objc_msgSend(v5, "setContentSize:", v3, v4);
  objc_msgSend(v5, "setDesiredContentsRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(v5, "setViewportSize:", *(double *)(*(void *)(a1 + 32) + 136), *(double *)(*(void *)(a1 + 32) + 144));
  [v5 setScale:*(double *)(*(void *)(a1 + 32) + 112)];
}

- (void)setImageRequester:(id)a3
{
  id v5 = (PXImageRequester *)a3;
  imageRequester = self->_imageRequester;
  if (imageRequester != v5)
  {
    id v7 = v5;
    [(PXImageRequester *)imageRequester unregisterChangeObserver:self context:PXImageRequesterObserverContext_189396];
    objc_storeStrong((id *)&self->_imageRequester, a3);
    [(PXImageRequester *)self->_imageRequester registerChangeObserver:self context:PXImageRequesterObserverContext_189396];
    [(PXImageRequesterHelper *)self _updateImageRequester];
    [(PXImageRequesterHelper *)self _updateImage];
    id v5 = v7;
  }
}

- (void)setContentsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_contentsRect = &self->_contentsRect;
  if (!CGRectEqualToRect(self->_contentsRect, a3))
  {
    p_contentsRect->origin.CGFloat x = x;
    p_contentsRect->origin.CGFloat y = y;
    p_contentsRect->size.CGFloat width = width;
    p_contentsRect->size.CGFloat height = height;
    [(PXImageRequesterHelper *)self signalChange:8];
  }
}

- (void)setImage:(id)a3
{
  id v7 = (UIImage *)a3;
  id v5 = self->_image;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(UIImage *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_image, a3);
      [(PXImageRequesterHelper *)self signalChange:32];
    }
  }
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    [(PXImageRequesterHelper *)self signalChange:16];
  }
}

- (void)setContentSize:(CGSize)a3
{
  if (a3.width != self->_contentSize.width || a3.height != self->_contentSize.height)
  {
    self->_contentSize = a3;
    [(PXImageRequesterHelper *)self signalChange:4];
  }
}

- (void)setMediaProvider:(id)a3
{
  id v5 = (PXUIImageProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    [(PXImageRequesterHelper *)self signalChange:2];
    id v5 = v6;
  }
}

- (void)setAsset:(id)a3
{
  id v5 = (PXDisplayAsset *)a3;
  if (self->_asset != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    [(PXImageRequesterHelper *)self signalChange:1];
    id v5 = v6;
  }
}

- (void)didPublishChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXImageRequesterHelper;
  [(PXImageRequesterHelper *)&v4 didPublishChanges];
  char v3 = [(PXImageRequesterHelper *)self currentChanges];
  if ((v3 & 3) != 0) {
    [(PXImageRequesterHelper *)self _updateAssetOrMediaProvider];
  }
  if ((v3 & 0x14) != 0) {
    [(PXImageRequesterHelper *)self _updateImageRequester];
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXImageRequesterHelper;
  [(PXImageRequesterHelper *)&v3 performChanges:a3];
}

@end
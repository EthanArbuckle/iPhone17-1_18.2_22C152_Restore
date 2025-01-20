@interface PXDisplayAssetImageContentView
- (BOOL)isDisplayingFullQualityContent;
- (id)contentView;
- (int64_t)currentPreferredImageDynamicRangeValue;
- (int64_t)playbackStyle;
- (void)_updateImageViewContentMode;
- (void)_updateImageViewFilters;
- (void)_updateImageViewPreferredImageDynamicRange;
- (void)contentModeDidChange;
- (void)contentsRectDidChange;
- (void)effectivePreferredImageDynamicRangeDidChange;
- (void)imageDidChange;
- (void)imageProgressDidChange;
- (void)imageRequesterDidChange:(unint64_t)a3;
- (void)isDisplayingFullQualityContentDidChange;
- (void)placeholderImageFiltersDidChange;
@end

@implementation PXDisplayAssetImageContentView

- (id)contentView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    v5 = self->_imageView;
    self->_imageView = v4;

    [(PXDisplayAssetImageContentView *)self _updateImageViewContentMode];
    [(UIImageView *)self->_imageView setClipsToBounds:1];
    [(PXDisplayAssetImageContentView *)self _updateImageViewPreferredImageDynamicRange];
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)contentModeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetImageContentView;
  [(PXDisplayAssetContentView *)&v3 contentModeDidChange];
  [(PXDisplayAssetImageContentView *)self _updateImageViewContentMode];
}

- (void)_updateImageViewContentMode
{
  uint64_t v3 = [(PXDisplayAssetImageContentView *)self contentMode];
  imageView = self->_imageView;
  [(UIImageView *)imageView setContentMode:v3];
}

- (void)_updateImageViewPreferredImageDynamicRange
{
}

- (void)imageRequesterDidChange:(unint64_t)a3
{
  char v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PXDisplayAssetImageContentView;
  -[PXDisplayAssetContentView imageRequesterDidChange:](&v5, sel_imageRequesterDidChange_);
  if ((v3 & 8) != 0) {
    [(PXDisplayAssetImageContentView *)self isDisplayingFullQualityContentDidChange];
  }
}

- (void)imageDidChange
{
  v12.receiver = self;
  v12.super_class = (Class)PXDisplayAssetImageContentView;
  [(PXDisplayAssetContentView *)&v12 imageDidChange];
  uint64_t v3 = [(UIImageView *)self->_imageView image];
  if (v3)
  {
    v4 = (void *)v3;
    objc_super v5 = [(PXDisplayAssetContentView *)self imageRequester];
    if ([v5 hasFullQuality])
    {
      [(PXDisplayAssetContentView *)self placeholderTransitionDuration];
      double v7 = v6;

      if (v7 > 0.0)
      {
        v8 = (void *)MEMORY[0x1E4FB1EB0];
        imageView = self->_imageView;
        [(PXDisplayAssetContentView *)self placeholderTransitionDuration];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __48__PXDisplayAssetImageContentView_imageDidChange__block_invoke;
        v11[3] = &unk_1E5DD36F8;
        v11[4] = self;
        objc_msgSend(v8, "transitionWithView:duration:options:animations:completion:", imageView, 5242880, v11, 0);
        return;
      }
    }
    else
    {
    }
  }
  v10 = [(PXDisplayAssetContentView *)self image];
  [(UIImageView *)self->_imageView setImage:v10];
}

- (void).cxx_destruct
{
}

- (int64_t)currentPreferredImageDynamicRangeValue
{
  return [(UIImageView *)self->_imageView preferredImageDynamicRange];
}

- (void)_updateImageViewFilters
{
  BOOL v4 = [(PXDisplayAssetImageContentView *)self isDisplayingFullQualityContent];
  if (!v4)
  {
    v2 = [(PXDisplayAssetContentView *)self placeholderImageFilters];
    if ([v2 count])
    {

LABEL_7:
      double v7 = [(PXDisplayAssetContentView *)self placeholderImageFilters];
      v8 = [(UIImageView *)self->_imageView layer];
      [v8 setFilters:v7];

      v9 = [(UIImageView *)self->_imageView layer];
      [v9 setShouldRasterize:1];

      id v11 = [(UIImageView *)self->_imageView layer];
      [v11 setRasterizationScale:0.5];
      goto LABEL_9;
    }
  }
  objc_super v5 = +[PXForYouSettings sharedInstance];
  char v6 = [v5 alwaysShowSuggestionRenderingOverlay];

  if (!v4) {
  if (v6)
  }
    goto LABEL_7;
  v10 = [(UIImageView *)self->_imageView layer];
  [v10 setFilters:0];

  id v11 = [(UIImageView *)self->_imageView layer];
  [v11 setShouldRasterize:0];
LABEL_9:
}

- (void)isDisplayingFullQualityContentDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetImageContentView;
  [(PXDisplayAssetContentView *)&v3 isDisplayingFullQualityContentDidChange];
  [(PXDisplayAssetImageContentView *)self _updateImageViewFilters];
}

- (BOOL)isDisplayingFullQualityContent
{
  v2 = [(PXDisplayAssetContentView *)self imageRequester];
  char v3 = [v2 hasFullQuality];

  return v3;
}

- (void)contentsRectDidChange
{
  v12.receiver = self;
  v12.super_class = (Class)PXDisplayAssetImageContentView;
  [(PXDisplayAssetContentView *)&v12 contentsRectDidChange];
  [(PXDisplayAssetContentView *)self contentsRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(UIImageView *)self->_imageView layer];
  objc_msgSend(v11, "setContentsRect:", v4, v6, v8, v10);
}

- (void)placeholderImageFiltersDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetImageContentView;
  [(PXDisplayAssetContentView *)&v3 placeholderImageFiltersDidChange];
  [(PXDisplayAssetImageContentView *)self _updateImageViewFilters];
}

- (void)imageProgressDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetImageContentView;
  [(PXDisplayAssetContentView *)&v3 imageProgressDidChange];
  [(PXDisplayAssetContentView *)self invalidateLoadingProgress];
}

- (void)effectivePreferredImageDynamicRangeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXDisplayAssetImageContentView;
  [(PXDisplayAssetContentView *)&v3 effectivePreferredImageDynamicRangeDidChange];
  [(PXDisplayAssetImageContentView *)self _updateImageViewPreferredImageDynamicRange];
}

uint64_t __48__PXDisplayAssetImageContentView_imageDidChange__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) image];
  [*(id *)(*(void *)(a1 + 32) + 680) setImage:v2];

  objc_super v3 = *(void **)(a1 + 32);
  return [v3 _updateImageViewFilters];
}

- (int64_t)playbackStyle
{
  return 1;
}

@end
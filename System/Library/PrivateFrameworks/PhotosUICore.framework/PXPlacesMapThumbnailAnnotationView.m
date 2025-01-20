@interface PXPlacesMapThumbnailAnnotationView
+ (id)_thumbnailCreationOperationQueue;
+ (id)_thumbnailFetchOperationQueue;
+ (id)_thumbnailSelectionQueue;
- (BOOL)imageIsPlaceholder;
- (PKExtendedTraitCollection)extendedTraitCollection;
- (PXPlacesImageCache)imageCache;
- (PXPlacesMapThumbnailAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4 extendedTraitCollection:(id)a5 imageCache:(id)a6 countLabelStyle:(int64_t)a7;
- (PXPlacesMapThumbnailCurationDelegate)thumbnailCurationDelegate;
- (UIImageView)countLabelBackgroundImageView;
- (UILabel)countLabel;
- (id)_countLabelBackgroundColor;
- (id)displayCompletion;
- (id)extendedTraitObserver;
- (id)preferredGeotaggableWithFallbackGeotaggable:(id)a3;
- (id)primaryGeotaggable;
- (id)renderToImage;
- (id)userCacheKey;
- (int64_t)countLabelStyle;
- (void)_fetchImageForGeotaggable:(id)a3 renderer:(id)a4 networkAccessAllowed:(BOOL)a5;
- (void)_fetchImageWithNetworkAccessAllowed:(BOOL)a3;
- (void)_hideCountLabel;
- (void)_processGeotaggable:(id)a3 withImage:(CGImage *)a4 popoverImageType:(int64_t)a5 imageOptions:(unint64_t)a6 shouldCache:(BOOL)a7 expectedGeotaggable:(id)a8;
- (void)_processPostImage;
- (void)_reloadCount:(int64_t)a3;
- (void)_reloadData:(BOOL)a3;
- (void)_showCountLabel;
- (void)_updatePlaceholderImageIfNeeded;
- (void)dealloc;
- (void)prepareForReuse;
- (void)setAnnotation:(id)a3;
- (void)setCountLabel:(id)a3;
- (void)setCountLabelBackgroundImageView:(id)a3;
- (void)setDisplayCompletion:(id)a3;
- (void)setExtendedTraitCollection:(id)a3;
- (void)setExtendedTraitObserver:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setImageIsPlaceholder:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setThumbnailCurationDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXPlacesMapThumbnailAnnotationView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_countLabelBackgroundImageView, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong(&self->_extendedTraitObserver, 0);
  objc_storeStrong((id *)&self->_extendedTraitCollection, 0);
  objc_destroyWeak((id *)&self->_thumbnailCurationDelegate);
  objc_storeStrong(&self->_displayCompletion, 0);
}

- (int64_t)countLabelStyle
{
  return self->_countLabelStyle;
}

- (void)setImageIsPlaceholder:(BOOL)a3
{
  self->_imageIsPlaceholder = a3;
}

- (BOOL)imageIsPlaceholder
{
  return self->_imageIsPlaceholder;
}

- (void)setImageCache:(id)a3
{
}

- (PXPlacesImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setCountLabelBackgroundImageView:(id)a3
{
}

- (void)setCountLabel:(id)a3
{
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (void)setExtendedTraitObserver:(id)a3
{
}

- (id)extendedTraitObserver
{
  return self->_extendedTraitObserver;
}

- (PKExtendedTraitCollection)extendedTraitCollection
{
  return self->_extendedTraitCollection;
}

- (void)setThumbnailCurationDelegate:(id)a3
{
}

- (PXPlacesMapThumbnailCurationDelegate)thumbnailCurationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailCurationDelegate);
  return (PXPlacesMapThumbnailCurationDelegate *)WeakRetained;
}

- (void)setDisplayCompletion:(id)a3
{
}

- (id)displayCompletion
{
  return self->_displayCompletion;
}

- (id)renderToImage
{
  [(PXPlacesMapThumbnailAnnotationView *)self frame];
  double v4 = v3;
  double v6 = v5;
  v7 = [(PXPlacesMapThumbnailAnnotationView *)self countLabel];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;

  v17.width = v4 + v9 * 0.25;
  v17.height = v6 + v11 * 0.5;
  UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(CurrentContext, 0.0, v11 * 0.5);
  v13 = [(PXPlacesMapThumbnailAnnotationView *)self layer];
  [v13 renderInContext:CurrentContext];

  v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v14;
}

- (void)_hideCountLabel
{
  double v3 = [(PXPlacesMapThumbnailAnnotationView *)self countLabel];
  char v4 = [v3 isHidden];

  if ((v4 & 1) == 0)
  {
    double v5 = [(PXPlacesMapThumbnailAnnotationView *)self countLabel];
    [v5 setHidden:1];

    id v6 = [(PXPlacesMapThumbnailAnnotationView *)self countLabelBackgroundImageView];
    [v6 setHidden:1];
  }
}

- (void)_showCountLabel
{
  double v3 = [(PXPlacesMapThumbnailAnnotationView *)self countLabel];
  int v4 = [v3 isHidden];

  if (v4)
  {
    double v5 = [(PXPlacesMapThumbnailAnnotationView *)self countLabel];
    [v5 setHidden:0];

    id v6 = [(PXPlacesMapThumbnailAnnotationView *)self countLabelBackgroundImageView];
    [v6 setHidden:0];
  }
}

- (void)_reloadCount:(int64_t)a3
{
  if (a3 > 1)
  {
    double v5 = [(PXPlacesMapThumbnailAnnotationView *)self countLabel];
    id v6 = (void *)MEMORY[0x1E4F28EE0];
    v7 = [NSNumber numberWithInteger:a3];
    id v8 = [v6 localizedStringFromNumber:v7 numberStyle:1];

    id v9 = [v5 text];
    if (v8 == v9)
    {
    }
    else
    {
      double v10 = v9;
      char v11 = [v8 isEqualToString:v9];

      if ((v11 & 1) == 0)
      {
        [v5 setText:v8];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __51__PXPlacesMapThumbnailAnnotationView__reloadCount___block_invoke;
        block[3] = &unk_1E5DD36F8;
        block[4] = self;
        if (_reloadCount__onceToken != -1) {
          dispatch_once(&_reloadCount__onceToken, block);
        }
        v12 = [(MKAnnotationView *)self image];
        [v12 size];
        double v14 = v13;

        if ([(PXPlacesMapThumbnailAnnotationView *)self countLabelStyle])
        {
          [v5 intrinsicContentSize];
          objc_msgSend(v5, "setFrame:", 10.0, v14 - v15 + -10.0, v14 + -20.0, v15);
        }
        else
        {
          double v16 = 26.0;
          objc_msgSend(v8, "boundingRectWithSize:options:attributes:context:", 2, _reloadCount__countAttributes, 0, v14, 26.0);
          if (v17 + 10.0 >= 26.0) {
            double v16 = v17 + 10.0;
          }
          [v5 frame];
          if (v18 != v16)
          {
            objc_msgSend(v5, "setFrame:", v14 + v16 * -3.0 * 0.25, -13.0, v16, 26.0);
            [v5 frame];
            double v20 = v19;
            double v22 = v21;
            double v24 = v23;
            double v26 = v25;
            v27 = [(PXPlacesMapThumbnailAnnotationView *)self countLabelBackgroundImageView];
            objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);
          }
        }
        [(PXPlacesMapThumbnailAnnotationView *)self _showCountLabel];
      }
    }
  }
  else
  {
    [(PXPlacesMapThumbnailAnnotationView *)self _hideCountLabel];
  }
}

void __51__PXPlacesMapThumbnailAnnotationView__reloadCount___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4FB06F8];
  v1 = _FontForCountLabelStyle([*(id *)(a1 + 32) countLabelStyle]);
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  double v3 = (void *)_reloadCount__countAttributes;
  _reloadCount__countAttributes = v2;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXPlacesMapThumbnailAnnotationView;
  [(MKAnnotationView *)&v11 setSelected:a3 animated:a4];
  if (v4)
  {
    id v6 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
    id v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
    uint64_t v8 = [v7 CGColor];

    [v6 setValue:v8 forKey:@"inputColor"];
    id v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v6, 0);
    double v10 = [(PXPlacesMapThumbnailAnnotationView *)self layer];
    [v10 setFilters:v9];
  }
  else
  {
    id v6 = [(PXPlacesMapThumbnailAnnotationView *)self layer];
    [v6 setFilters:0];
  }
}

- (void)setImage:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXPlacesMapThumbnailAnnotationView;
  [(MKAnnotationView *)&v7 setImage:a3];
  BOOL v4 = [(MKAnnotationView *)self image];
  [v4 size];
  double v6 = v5;

  -[MKAnnotationView setCenterOffset:](self, "setCenterOffset:", 0.0, v6 * -0.5);
  [(PXPlacesMapThumbnailAnnotationView *)self setImageIsPlaceholder:0];
}

- (void)_processPostImage
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  px_dispatch_on_main_queue();
}

void __55__PXPlacesMapThumbnailAnnotationView__processPostImage__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _reloadCount:*(void *)(*(void *)(a1 + 32) + 1024)];
}

- (void)_processGeotaggable:(id)a3 withImage:(CGImage *)a4 popoverImageType:(int64_t)a5 imageOptions:(unint64_t)a6 shouldCache:(BOOL)a7 expectedGeotaggable:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  if (a4 && (size_t Width = CGImageGetWidth(a4), Height = CGImageGetHeight(a4), Width) && Height)
  {
    CFRetain(a4);
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __130__PXPlacesMapThumbnailAnnotationView__processGeotaggable_withImage_popoverImageType_imageOptions_shouldCache_expectedGeotaggable___block_invoke;
    aBlock[3] = &unk_1E5DCFD28;
    objc_copyWeak(v25, &location);
    id v22 = v14;
    v25[1] = a4;
    v25[2] = (id)a5;
    v25[3] = (id)a6;
    id v18 = v15;
    BOOL v26 = a7;
    id v23 = v18;
    double v24 = self;
    double v19 = _Block_copy(aBlock);
    double v20 = +[PXPlacesMapThumbnailAnnotationView _thumbnailCreationOperationQueue];
    [v20 addOperationWithBlock:v19];

    objc_destroyWeak(v25);
    objc_destroyWeak(&location);
  }
  else if ([v14 isEqual:v15])
  {
    [(PXPlacesMapThumbnailAnnotationView *)self _processPostImage];
  }
}

void __130__PXPlacesMapThumbnailAnnotationView__processGeotaggable_withImage_popoverImageType_imageOptions_shouldCache_expectedGeotaggable___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  BOOL v4 = +[PXPlacesPopoverImageFactory sharedInstance];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  id v9 = [WeakRetained extendedTraitCollection];
  double v10 = [v4 createPopoverImageForGeotaggable:v5 withImage:v6 imageType:v7 imageOptions:v8 usingTraitCollection:v9];

  CFRelease(*(CFTypeRef *)(a1 + 64));
  if ([*(id *)(a1 + 32) isEqual:*(void *)(a1 + 40)])
  {
    if (*(unsigned char *)(a1 + 88))
    {
      objc_super v11 = [WeakRetained userCacheKey];
      v12 = [WeakRetained imageCache];
      [v12 cacheRenderedImage:v10 forGeotaggble:*(void *)(a1 + 32) andKey:v11];
    }
    WeakRetained;
    v10;
    objc_copyWeak(&v13, v2);
    char v14 = *(unsigned char *)(a1 + 88);
    px_dispatch_on_main_queue();
  }
}

void __130__PXPlacesMapThumbnailAnnotationView__processGeotaggable_withImage_popoverImageType_imageOptions_shouldCache_expectedGeotaggable___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _reloadCount:*(void *)(*(void *)(a1 + 48) + 1024)];

  if (*(unsigned char *)(a1 + 64))
  {
    double v3 = *(void **)(a1 + 32);
    [v3 _processPostImage];
  }
}

- (void)_updatePlaceholderImageIfNeeded
{
  uint64_t v3 = [(MKAnnotationView *)self image];
  if (!v3
    || (BOOL v4 = (void *)v3,
        BOOL v5 = [(PXPlacesMapThumbnailAnnotationView *)self imageIsPlaceholder],
        v4,
        v5))
  {
    uint64_t v6 = [(PXPlacesMapThumbnailAnnotationView *)self extendedTraitCollection];
    uint64_t v7 = [(PXPlacesMapThumbnailAnnotationView *)self traitCollection];
    [v6 setTraitCollectionForMapKit:v7];

    if ([(PXPlacesMapThumbnailAnnotationView *)self countLabelStyle] == 1) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = 2;
    }
    id v9 = +[PXPlacesPopoverImageFactory sharedInstance];
    double v10 = [v9 placeholderImageForImageType:v8 usingTraitCollection:v6];

    objc_initWeak(&location, self);
    objc_copyWeak(&v11, &location);
    v10;
    px_dispatch_on_main_queue();
  }
}

void __69__PXPlacesMapThumbnailAnnotationView__updatePlaceholderImageIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setImage:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) setImageIsPlaceholder:1];
  id v4 = objc_loadWeakRetained(v2);
  [v4 _reloadCount:*(void *)(*(void *)(a1 + 40) + 1024)];
}

- (void)_fetchImageForGeotaggable:(id)a3 renderer:(id)a4 networkAccessAllowed:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(PXPlacesMapThumbnailAnnotationView *)self countLabelStyle] == 1) {
    uint64_t v10 = 3;
  }
  else {
    uint64_t v10 = 2;
  }
  id v11 = v9;
  v12 = +[PXPlacesPopoverImageFactory sharedInstance];
  id v13 = [(PXPlacesMapThumbnailAnnotationView *)self extendedTraitCollection];
  [v12 thumbnailImageSizeForImageType:v10 usingTraitCollection:v13 includeScale:1];
  id v15 = v14;
  double v17 = v16;

  if ([v11 conformsToProtocol:&unk_1F048CC68])
  {
    uint64_t v10 = [v11 popoverImageType];
    id v18 = (void *)[v11 imageOptions];
  }
  else
  {
    id v18 = 0;
  }
  objc_initWeak(&location, self);
  double v19 = +[PXPlacesMapThumbnailAnnotationView _thumbnailFetchOperationQueue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __94__PXPlacesMapThumbnailAnnotationView__fetchImageForGeotaggable_renderer_networkAccessAllowed___block_invoke;
  v22[3] = &unk_1E5DCFCD8;
  id v23 = v11;
  id v20 = v8;
  id v24 = v20;
  v26[1] = v15;
  v26[2] = v17;
  BOOL v27 = a5;
  objc_copyWeak(v26, &location);
  id v21 = v23;
  id v25 = v21;
  v26[3] = (id)v10;
  v26[4] = v18;
  [v19 addOperationWithBlock:v22];

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

void __94__PXPlacesMapThumbnailAnnotationView__fetchImageForGeotaggable_renderer_networkAccessAllowed___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 96);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __94__PXPlacesMapThumbnailAnnotationView__fetchImageForGeotaggable_renderer_networkAccessAllowed___block_invoke_2;
  v5[3] = &unk_1E5DCFCB0;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  long long v9 = *(_OWORD *)(a1 + 80);
  objc_msgSend(v2, "imageForGeotaggable:ofSize:networkAccessAllowed:andCompletion:", v3, v4, v5, *(double *)(a1 + 64), *(double *)(a1 + 72));

  objc_destroyWeak(&v8);
}

void __94__PXPlacesMapThumbnailAnnotationView__fetchImageForGeotaggable_renderer_networkAccessAllowed___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v21 = a2;
  id v9 = a5;
  uint64_t v10 = v9;
  if (!a3 || a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _updatePlaceholderImageIfNeeded];

    if (v10)
    {
      id v15 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F39708]];
      id v16 = v15;
      if (v15 && [v15 BOOLValue])
      {
        id v17 = objc_loadWeakRetained((id *)(a1 + 48));
        [v17 _fetchImageForGeotaggable:*(void *)(a1 + 32) renderer:*(void *)(a1 + 40) networkAccessAllowed:1];
      }
      else
      {
        id v17 = objc_loadWeakRetained((id *)(a1 + 48));
        [v17 _processPostImage];
      }
    }
    else
    {
      id v16 = objc_loadWeakRetained((id *)(a1 + 48));
      [v16 _processPostImage];
    }
  }
  else
  {
    id v11 = [v9 objectForKeyedSubscript:PKPlacesCoarseLocationMediaInfoKey];
    char v12 = [v11 BOOLValue];

    if (v12) {
      uint64_t v13 = 4;
    }
    else {
      uint64_t v13 = *(void *)(a1 + 56);
    }
    id v18 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F39708]];
    id v16 = v18;
    if (v18 && [v18 BOOLValue])
    {
      id v19 = objc_loadWeakRetained((id *)(a1 + 48));
      [v19 _processGeotaggable:v21 withImage:a3 popoverImageType:v13 imageOptions:*(void *)(a1 + 64) shouldCache:0 expectedGeotaggable:*(void *)(a1 + 32)];

      id v20 = objc_loadWeakRetained((id *)(a1 + 48));
      [v20 _fetchImageForGeotaggable:*(void *)(a1 + 32) renderer:*(void *)(a1 + 40) networkAccessAllowed:1];
    }
    else
    {
      id v20 = objc_loadWeakRetained((id *)(a1 + 48));
      [v20 _processGeotaggable:v21 withImage:a3 popoverImageType:v13 imageOptions:*(void *)(a1 + 64) shouldCache:1 expectedGeotaggable:*(void *)(a1 + 32)];
    }
  }
}

- (void)_fetchImageWithNetworkAccessAllowed:(BOOL)a3
{
  BOOL v5 = [(MKAnnotationView *)self annotation];
  id v6 = [v5 renderer];
  objc_initWeak(&location, self);
  id v7 = [(id)objc_opt_class() _thumbnailSelectionQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__PXPlacesMapThumbnailAnnotationView__fetchImageWithNetworkAccessAllowed___block_invoke;
  v9[3] = &unk_1E5DD0928;
  objc_copyWeak(&v11, &location);
  id v10 = v6;
  BOOL v12 = a3;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __74__PXPlacesMapThumbnailAnnotationView__fetchImageWithNetworkAccessAllowed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [WeakRetained primaryGeotaggable];
    uint64_t v4 = [v5 preferredGeotaggableWithFallbackGeotaggable:v3];
    [v5 _fetchImageForGeotaggable:v4 renderer:*(void *)(a1 + 32) networkAccessAllowed:*(unsigned __int8 *)(a1 + 48)];

    id WeakRetained = v5;
  }
}

- (id)preferredGeotaggableWithFallbackGeotaggable:(id)a3
{
  id v4 = a3;
  id v5 = [(MKAnnotationView *)self annotation];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(PXPlacesMapThumbnailAnnotationView *)self thumbnailCurationDelegate];

    if (v6)
    {
      id v7 = [(MKAnnotationView *)self annotation];
      id v8 = [v7 geotaggables];
      id v9 = [(PXPlacesMapThumbnailAnnotationView *)self thumbnailCurationDelegate];
      id v10 = [v9 curatedGeotaggableFromSet:v8];

      if (v10) {
        id v11 = v10;
      }
      else {
        id v11 = v4;
      }
      id v12 = v11;

      goto LABEL_9;
    }
  }
  else
  {
  }
  id v12 = v4;
LABEL_9:

  return v12;
}

- (void)_reloadData:(BOOL)a3
{
  if (!self->_geotaggablesCount)
  {
    objc_initWeak(&location, self);
    v10[1] = (id)MEMORY[0x1E4F143A8];
    v10[2] = (id)3221225472;
    v10[3] = __50__PXPlacesMapThumbnailAnnotationView__reloadData___block_invoke;
    v10[4] = &unk_1E5DD32D0;
    objc_copyWeak(&v11, &location);
    px_dispatch_on_main_queue();
  }
  if (!a3)
  {
    objc_initWeak(&location, self);
    objc_copyWeak(v9, &location);
    px_dispatch_on_main_queue();
  }
  id v4 = [(PXPlacesMapThumbnailAnnotationView *)self primaryGeotaggable];
  id v5 = [(PXPlacesMapThumbnailAnnotationView *)self imageCache];

  if (v5)
  {
    id v6 = [(PXPlacesMapThumbnailAnnotationView *)self userCacheKey];
    id v7 = [(PXPlacesMapThumbnailAnnotationView *)self imageCache];
    id v8 = [v7 cachedRenderedImageForGeotaggble:v4 andKey:v6];

    if (v8)
    {
      objc_initWeak(&location, self);
      v9[1] = (id)MEMORY[0x1E4F143A8];
      v9[2] = (id)3221225472;
      v9[3] = __50__PXPlacesMapThumbnailAnnotationView__reloadData___block_invoke_2;
      void v9[4] = &unk_1E5DD2548;
      objc_copyWeak(v10, &location);
      v9[5] = v8;
      v9[6] = self;
      px_dispatch_on_main_queue();
    }
  }
  [(PXPlacesMapThumbnailAnnotationView *)self _fetchImageWithNetworkAccessAllowed:0];
}

void __50__PXPlacesMapThumbnailAnnotationView__reloadData___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setImage:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _hideCountLabel];
}

void __50__PXPlacesMapThumbnailAnnotationView__reloadData___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setImage:*(void *)(a1 + 32)];

  id v4 = objc_loadWeakRetained(v2);
  [v4 _reloadCount:*(void *)(*(void *)(a1 + 40) + 1024)];
}

void __50__PXPlacesMapThumbnailAnnotationView__reloadData___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _reloadCount:*(void *)(*(void *)(a1 + 32) + 1024)];
}

- (id)_countLabelBackgroundColor
{
  if (_countLabelBackgroundColor_token != -1) {
    dispatch_once(&_countLabelBackgroundColor_token, &__block_literal_global_277723);
  }
  id v2 = (void *)_countLabelBackgroundColor_countLabelBackgroundColor;
  return v2;
}

void __64__PXPlacesMapThumbnailAnnotationView__countLabelBackgroundColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.0823529412 green:0.494117647 blue:0.984313725 alpha:1.0];
  v1 = (void *)_countLabelBackgroundColor_countLabelBackgroundColor;
  _countLabelBackgroundColor_countLabelBackgroundColor = v0;
}

- (UIImageView)countLabelBackgroundImageView
{
  id v3 = [(UIImageView *)self->_countLabelBackgroundImageView image];

  if (!v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__PXPlacesMapThumbnailAnnotationView_countLabelBackgroundImageView__block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    if (countLabelBackgroundImageView_token != -1) {
      dispatch_once(&countLabelBackgroundImageView_token, block);
    }
    [(UIImageView *)self->_countLabelBackgroundImageView setImage:countLabelBackgroundImageView_stretchablecountLabelBgImage];
  }
  countLabelBackgroundImageView = self->_countLabelBackgroundImageView;
  return countLabelBackgroundImageView;
}

void __67__PXPlacesMapThumbnailAnnotationView_countLabelBackgroundImageView__block_invoke(uint64_t a1)
{
  v8.width = 26.0;
  v8.height = 26.0;
  UIGraphicsBeginImageContextWithOptions(v8, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v3 = [*(id *)(a1 + 32) _countLabelBackgroundColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v3 CGColor]);

  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = 26.0;
  v9.size.height = 26.0;
  CGContextFillEllipseInRect(CurrentContext, v9);
  UIGraphicsGetImageFromCurrentImageContext();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  uint64_t v4 = objc_msgSend(v6, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, 13.0, 0.0, 13.0);
  id v5 = (void *)countLabelBackgroundImageView_stretchablecountLabelBgImage;
  countLabelBackgroundImageView_stretchablecountLabelBgImage = v4;
}

- (id)userCacheKey
{
  id v3 = NSString;
  uint64_t v4 = [(PXPlacesMapThumbnailAnnotationView *)self extendedTraitCollection];
  [v4 displayScale];
  uint64_t v6 = v5;
  id v7 = [(PXPlacesMapThumbnailAnnotationView *)self extendedTraitCollection];
  uint64_t v8 = [v7 layoutSizeClass];
  CGRect v9 = [(PXPlacesMapThumbnailAnnotationView *)self extendedTraitCollection];
  id v10 = objc_msgSend(v3, "stringWithFormat:", @"%f-%ld-%ld", v6, v8, objc_msgSend(v9, "layoutSizeSubclass"));

  return v10;
}

- (id)primaryGeotaggable
{
  id v2 = [(MKAnnotationView *)self annotation];
  id v3 = [v2 geotaggables];
  uint64_t v4 = [v3 firstObject];

  return v4;
}

- (void)setExtendedTraitCollection:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_extendedTraitCollection, a3);
  [v7 displayScale];
  if (v5 != 0.0)
  {
    uint64_t v6 = [(MKAnnotationView *)self image];

    if (v6) {
      [(PXPlacesMapThumbnailAnnotationView *)self _reloadData:1];
    }
  }
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)PXPlacesMapThumbnailAnnotationView;
  [(MKAnnotationView *)&v5 prepareForReuse];
  [(PXPlacesMapThumbnailAnnotationView *)self setImage:0];
  id v3 = [(PXPlacesMapThumbnailAnnotationView *)self countLabel];
  [v3 setText:&stru_1F00B0030];

  [(PXPlacesMapThumbnailAnnotationView *)self _hideCountLabel];
  uint64_t v4 = [(PXPlacesMapThumbnailAnnotationView *)self displayCompletion];

  if (v4) {
    [(PXPlacesMapThumbnailAnnotationView *)self setDisplayCompletion:0];
  }
}

- (void)setAnnotation:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MKAnnotationView *)self annotation];
  v11.receiver = self;
  v11.super_class = (Class)PXPlacesMapThumbnailAnnotationView;
  [(MKAnnotationView *)&v11 setAnnotation:v4];
  if ([v4 conformsToProtocol:&unk_1F048BF10])
  {
    uint64_t v6 = [v4 geotaggables];
    self->_geotaggablesCount = [v6 count];
  }
  id v7 = [(PXPlacesMapThumbnailAnnotationView *)self extendedTraitCollection];

  if (v7)
  {
    uint64_t v8 = [(PXPlacesMapThumbnailAnnotationView *)self thumbnailCurationDelegate];
    if (v8)
    {
      int v9 = 0;
    }
    else
    {
      id v10 = [(MKAnnotationView *)self image];
      int v9 = 0;
      if (v10 && v5) {
        int v9 = [v5 isEqual:v4];
      }
    }
    [(PXPlacesMapThumbnailAnnotationView *)self _reloadData:v9 ^ 1u];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXPlacesMapThumbnailAnnotationView;
  id v4 = a3;
  [(PXPlacesMapThumbnailAnnotationView *)&v7 traitCollectionDidChange:v4];
  objc_super v5 = [(PXPlacesMapThumbnailAnnotationView *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v6) {
    [(PXPlacesMapThumbnailAnnotationView *)self _updatePlaceholderImageIfNeeded];
  }
}

- (void)dealloc
{
  id v3 = [(PXPlacesMapThumbnailAnnotationView *)self extendedTraitObserver];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_super v5 = [(PXPlacesMapThumbnailAnnotationView *)self extendedTraitObserver];
    [v4 removeObserver:v5];
  }
  v6.receiver = self;
  v6.super_class = (Class)PXPlacesMapThumbnailAnnotationView;
  [(MKAnnotationView *)&v6 dealloc];
}

- (PXPlacesMapThumbnailAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4 extendedTraitCollection:(id)a5 imageCache:(id)a6 countLabelStyle:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v37.receiver = self;
  v37.super_class = (Class)PXPlacesMapThumbnailAnnotationView;
  id v16 = [(MKAnnotationView *)&v37 initWithAnnotation:v12 reuseIdentifier:v13];
  id v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_extendedTraitCollection, a5);
    objc_storeStrong((id *)&v17->_imageCache, a6);
    v17->_geotaggablesCount = 0;
    v17->_countLabelStyle = a7;
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
    countLabel = v17->_countLabel;
    v17->_countLabel = (UILabel *)v18;

    id v20 = _FontForCountLabelStyle(a7);
    [(UILabel *)v17->_countLabel setFont:v20];

    if (a7)
    {
      if (a7 == 1)
      {
        uint64_t v21 = 4;
      }
      else
      {
        id v22 = [MEMORY[0x1E4F28B00] currentHandler];
        id v23 = [NSString stringWithUTF8String:"NSTextAlignment _TextAlignmentForCountLabelStyle(PXPlacesMapCountLabelStyle)"];
        id v24 = [NSNumber numberWithInteger:a7];
        [v22 handleFailureInFunction:v23, @"PXPlacesMapThumbnailAnnotationView.m", 53, @"Unsupported style: %@", v24 file lineNumber description];

        uint64_t v21 = 0;
      }
    }
    else
    {
      uint64_t v21 = 1;
    }
    [(UILabel *)v17->_countLabel setTextAlignment:v21];
    id v25 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v17->_countLabel setTextColor:v25];

    [(UILabel *)v17->_countLabel setHidden:1];
    if (!a7)
    {
      id v26 = objc_alloc(MEMORY[0x1E4FB1838]);
      uint64_t v27 = objc_msgSend(v26, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      countLabelBackgroundImageView = v17->_countLabelBackgroundImageView;
      v17->_countLabelBackgroundImageView = (UIImageView *)v27;

      [(PXPlacesMapThumbnailAnnotationView *)v17 addSubview:v17->_countLabelBackgroundImageView];
    }
    [(PXPlacesMapThumbnailAnnotationView *)v17 addSubview:v17->_countLabel];
    objc_initWeak(&location, v17);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __124__PXPlacesMapThumbnailAnnotationView_initWithAnnotation_reuseIdentifier_extendedTraitCollection_imageCache_countLabelStyle___block_invoke;
    aBlock[3] = &unk_1E5DCFD58;
    objc_copyWeak(&v35, &location);
    v29 = _Block_copy(aBlock);
    v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v31 = [v30 addObserverForName:@"kPKExtendedTraitCollectionChangedNotification" object:0 queue:0 usingBlock:v29];
    id extendedTraitObserver = v17->_extendedTraitObserver;
    v17->_id extendedTraitObserver = (id)v31;

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __124__PXPlacesMapThumbnailAnnotationView_initWithAnnotation_reuseIdentifier_extendedTraitCollection_imageCache_countLabelStyle___block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 userInfo];
  id v3 = [v5 objectForKeyedSubscript:@"kPKExtendedTraitCollectionKey"];
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setExtendedTraitCollection:v3];
  }
}

+ (id)_thumbnailSelectionQueue
{
  if (_thumbnailSelectionQueue_onceToken != -1) {
    dispatch_once(&_thumbnailSelectionQueue_onceToken, &__block_literal_global_135);
  }
  id v2 = (void *)_thumbnailSelectionQueue_thumbnailSelectionQueue;
  return v2;
}

void __62__PXPlacesMapThumbnailAnnotationView__thumbnailSelectionQueue__block_invoke()
{
  uint64_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INTERACTIVE, 0);

  dispatch_queue_t v1 = dispatch_queue_create("PXPlacesMapThumbnailAnnotationView.thumbnailSelectionQueue", attr);
  id v2 = (void *)_thumbnailSelectionQueue_thumbnailSelectionQueue;
  _thumbnailSelectionQueue_thumbnailSelectionQueue = (uint64_t)v1;
}

+ (id)_thumbnailCreationOperationQueue
{
  if (_thumbnailCreationOperationQueue_token != -1) {
    dispatch_once(&_thumbnailCreationOperationQueue_token, &__block_literal_global_133);
  }
  id v2 = (void *)_thumbnailCreationOperationQueue;
  return v2;
}

uint64_t __70__PXPlacesMapThumbnailAnnotationView__thumbnailCreationOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  dispatch_queue_t v1 = (void *)_thumbnailCreationOperationQueue;
  _thumbnailCreationOperationQueue = (uint64_t)v0;

  [(id)_thumbnailCreationOperationQueue setMaxConcurrentOperationCount:4];
  id v2 = (void *)_thumbnailCreationOperationQueue;
  return [v2 setQualityOfService:25];
}

+ (id)_thumbnailFetchOperationQueue
{
  if (_thumbnailFetchOperationQueue_token != -1) {
    dispatch_once(&_thumbnailFetchOperationQueue_token, &__block_literal_global_130);
  }
  id v2 = (void *)_thumbnailFetchOperationQueue;
  return v2;
}

uint64_t __67__PXPlacesMapThumbnailAnnotationView__thumbnailFetchOperationQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  dispatch_queue_t v1 = (void *)_thumbnailFetchOperationQueue;
  _thumbnailFetchOperationQueue = (uint64_t)v0;

  [(id)_thumbnailFetchOperationQueue setMaxConcurrentOperationCount:4];
  id v2 = (void *)_thumbnailFetchOperationQueue;
  return [v2 setQualityOfService:17];
}

@end
@interface TPSImageAssetView
+ (BOOL)cacheImageAvailableForIdentifier:(id)a3;
+ (id)defaultBackgroundColor;
- (BOOL)aspectFillAsset;
- (BOOL)hideImageWhenNil;
- (BOOL)respectLoadingStatus;
- (BOOL)roundedCorner;
- (NSString)currentDisplayIdentifier;
- (NSString)currentImagePath;
- (TPSImageAssetView)init;
- (TPSImageAssetView)initWithCoder:(id)a3;
- (TPSImageAssetView)initWithDefaultBackgroundColor:(id)a3 noImageBackgroundColor:(id)a4;
- (TPSImageAssetView)initWithFrame:(CGRect)a3;
- (TPSImageAssetViewDelegate)delegate;
- (TPSURLSessionItem)imageURLSessionItem;
- (UIColor)defaultBackgroundColor;
- (UIColor)noImageBackgroundColor;
- (UIColor)overlayColor;
- (UIImage)image;
- (UIImageView)backgroundImageView;
- (UIImageView)imageView;
- (double)roundedCornerRadius;
- (unint64_t)status;
- (void)animateImageView:(BOOL)a3;
- (void)cancel;
- (void)commonInit;
- (void)fetchImageWithIdentifier:(id)a3 path:(id)a4;
- (void)layoutSubviews;
- (void)setAspectFillAsset:(BOOL)a3;
- (void)setBackgroundImageView:(id)a3;
- (void)setCurrentDisplayIdentifier:(id)a3;
- (void)setCurrentImagePath:(id)a3;
- (void)setDefaultBackgroundColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHideImageWhenNil:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageURLSessionItem:(id)a3;
- (void)setImageView:(id)a3;
- (void)setNoImageBackgroundColor:(id)a3;
- (void)setOverlayColor:(id)a3;
- (void)setRespectLoadingStatus:(BOOL)a3;
- (void)setRoundedCorner:(BOOL)a3;
- (void)setRoundedCornerRadius:(double)a3;
- (void)setStatus:(unint64_t)a3;
- (void)showHighlight:(BOOL)a3;
- (void)updateBackgroundColor;
@end

@implementation TPSImageAssetView

+ (id)defaultBackgroundColor
{
  return (id)[MEMORY[0x263F825C8] secondarySystemBackgroundColor];
}

+ (BOOL)cacheImageAvailableForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[TPSImageAssetController imageFromMemoryCacheForIdentifier:v4];
  BOOL v6 = v5 != 0;

  if (v4 && !v5)
  {
    v7 = [MEMORY[0x263F827E8] imageNamed:v4];
    if (!v7)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __54__TPSImageAssetView_cacheImageAvailableForIdentifier___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      if (cacheImageAvailableForIdentifier__predicate != -1) {
        dispatch_once(&cacheImageAvailableForIdentifier__predicate, block);
      }
      v7 = [MEMORY[0x263F827E8] imageNamed:v4 inBundle:cacheImageAvailableForIdentifier__gFrameworkBundle compatibleWithTraitCollection:0];
    }
    BOOL v6 = v7 != 0;
  }
  return v6;
}

uint64_t __54__TPSImageAssetView_cacheImageAvailableForIdentifier___block_invoke()
{
  cacheImageAvailableForIdentifier__gFrameworkBundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

- (void)commonInit
{
  self->_status = 0;
  self->_roundedCorner = 0;
  self->_roundedCornerRadius = 10.0;
  id obj = +[TPSImageAssetView defaultBackgroundColor];
  if (!self->_defaultBackgroundColor) {
    objc_storeStrong((id *)&self->_defaultBackgroundColor, obj);
  }
  noImageBackgroundColor = self->_noImageBackgroundColor;
  if (!noImageBackgroundColor)
  {
    objc_storeStrong((id *)&self->_noImageBackgroundColor, obj);
    noImageBackgroundColor = self->_noImageBackgroundColor;
  }
  [(TPSImageAssetView *)self setBackgroundColor:noImageBackgroundColor];
  if (!self->_imageView)
  {
    id v4 = objc_alloc(MEMORY[0x263F82828]);
    v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    imageView = self->_imageView;
    self->_imageView = v5;

    [(TPSImageAssetView *)self addSubview:self->_imageView];
    [(UIImageView *)self->_imageView setClipsToBounds:1];
    [(UIImageView *)self->_imageView setContentMode:1];
  }
}

- (TPSImageAssetView)initWithDefaultBackgroundColor:(id)a3 noImageBackgroundColor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TPSImageAssetView;
  v9 = [(TPSImageAssetView *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_defaultBackgroundColor, a3);
    objc_storeStrong((id *)&v10->_noImageBackgroundColor, a4);
    [(TPSImageAssetView *)v10 commonInit];
  }

  return v10;
}

- (TPSImageAssetView)init
{
  v5.receiver = self;
  v5.super_class = (Class)TPSImageAssetView;
  v2 = [(TPSImageAssetView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TPSImageAssetView *)v2 commonInit];
  }
  return v3;
}

- (TPSImageAssetView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSImageAssetView;
  v3 = -[TPSImageAssetView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(TPSImageAssetView *)v3 commonInit];
  }
  return v4;
}

- (TPSImageAssetView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSImageAssetView;
  v3 = [(TPSImageAssetView *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(TPSImageAssetView *)v3 commonInit];
  }
  return v4;
}

- (void)setAspectFillAsset:(BOOL)a3
{
  if (self->_aspectFillAsset != a3)
  {
    self->_aspectFillAsset = a3;
    if (a3) {
      uint64_t v3 = 2;
    }
    else {
      uint64_t v3 = 1;
    }
    [(UIImageView *)self->_imageView setContentMode:v3];
  }
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setRoundedCorner:(BOOL)a3
{
  if (self->_roundedCorner != a3)
  {
    self->_roundedCorner = a3;
    double roundedCornerRadius = 0.0;
    if (a3) {
      double roundedCornerRadius = self->_roundedCornerRadius;
    }
    [(TPSImageAssetView *)self _setContinuousCornerRadius:roundedCornerRadius];
    [(TPSImageAssetView *)self _continuousCornerRadius];
    double v6 = v5;
    id v7 = [(TPSImageAssetView *)self imageView];
    [v7 _setContinuousCornerRadius:v6];
  }
}

- (void)cancel
{
  uint64_t v3 = [MEMORY[0x263F7F638] defaultManager];
  [v3 cancelSessionItem:self->_imageURLSessionItem];

  imageURLSessionItem = self->_imageURLSessionItem;
  self->_imageURLSessionItem = 0;

  currentDisplayIdentifier = self->_currentDisplayIdentifier;
  self->_currentDisplayIdentifier = 0;
}

- (void)setImage:(id)a3
{
  id v6 = a3;
  id v4 = [(UIImageView *)self->_imageView image];

  if (v4 != v6)
  {
    [(UIImageView *)self->_imageView setImage:v6];
    if (self->_hideImageWhenNil)
    {
      double v5 = [(TPSImageAssetView *)self imageView];
      [v5 setHidden:v6 == 0];
    }
  }
  [(TPSImageAssetView *)self updateBackgroundColor];
}

- (void)setDefaultBackgroundColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_defaultBackgroundColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_defaultBackgroundColor, a3);
    [(TPSImageAssetView *)self updateBackgroundColor];
  }
}

- (void)setNoImageBackgroundColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_noImageBackgroundColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_noImageBackgroundColor, a3);
    [(TPSImageAssetView *)self updateBackgroundColor];
  }
}

- (void)updateBackgroundColor
{
  id v13 = [MEMORY[0x263F825C8] clearColor];
  BOOL respectLoadingStatus = self->_respectLoadingStatus;
  id v4 = [(UIImageView *)self->_imageView image];
  id v5 = v4;
  if (respectLoadingStatus)
  {

    unint64_t status = self->_status;
    if (v5)
    {
      if ((status | 4) != 4) {
        goto LABEL_12;
      }
      uint64_t v7 = 456;
    }
    else
    {
      if (status != 2) {
        goto LABEL_12;
      }
      uint64_t v7 = 464;
    }
    id v9 = *(id *)((char *)&self->super.super.super.isa + v7);
    v10 = v13;
  }
  else
  {
    id v8 = &OBJC_IVAR___TPSImageAssetView__defaultBackgroundColor;
    if (!v4) {
      id v8 = &OBJC_IVAR___TPSImageAssetView__noImageBackgroundColor;
    }
    id v9 = *(id *)((char *)&self->super.super.super.isa + *v8);

    v10 = v5;
  }

  id v13 = v9;
LABEL_12:
  v11 = [(TPSImageAssetView *)self backgroundColor];
  char v12 = [v11 isEqual:v13];

  if ((v12 & 1) == 0) {
    [(TPSImageAssetView *)self setBackgroundColor:v13];
  }
}

- (void)fetchImageWithIdentifier:(id)a3 path:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 length])
  {
    self->_unint64_t status = 2;
LABEL_8:
    [(TPSImageAssetView *)self setImage:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained imageAssetViewImageUpdated:self];

    goto LABEL_9;
  }
  p_currentDisplayIdentifier = (id *)&self->_currentDisplayIdentifier;
  if ([(NSString *)self->_currentDisplayIdentifier isEqualToString:v7]) {
    goto LABEL_9;
  }
  self->_unint64_t status = 1;
  id v10 = *p_currentDisplayIdentifier;
  id *p_currentDisplayIdentifier = 0;

  currentImagePath = self->_currentImagePath;
  self->_currentImagePath = 0;

  char v12 = [MEMORY[0x263F7F638] defaultManager];
  [v12 cancelSessionItem:self->_imageURLSessionItem];

  imageURLSessionItem = self->_imageURLSessionItem;
  self->_imageURLSessionItem = 0;

  [(TPSImageAssetView *)self setImage:0];
  if (!v8)
  {
    self->_unint64_t status = 2;
    goto LABEL_8;
  }
  v14 = +[TPSImageAssetController imageFromMemoryCacheForIdentifier:v7];
  objc_storeStrong((id *)&self->_currentDisplayIdentifier, a3);
  objc_storeStrong((id *)&self->_currentImagePath, a4);
  if (v14)
  {
    [(TPSImageAssetView *)self setImage:v14];
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    [v15 imageAssetViewImageUpdated:self];
  }
  else
  {
    v17 = [MEMORY[0x263F827E8] imageNamed:v7];
    if (!v17)
    {
      v18 = [v8 lastPathComponent];
      uint64_t v19 = [MEMORY[0x263F827E8] imageNamed:v18];
      if (v19)
      {
        v17 = (void *)v19;
      }
      else
      {
        v20 = [v18 componentsSeparatedByString:@"@"];
        v21 = [v20 firstObject];

        v17 = [MEMORY[0x263F827E8] imageNamed:v21];

        if (!v17)
        {
          objc_initWeak(&location, self);
          objc_initWeak(&from, *p_currentDisplayIdentifier);
          v23 = +[TPSImageAssetController dataCacheForIdentifier:v7];
          BOOL v24 = v23 != 0;

          int v25 = *MEMORY[0x263F085C0];
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __51__TPSImageAssetView_fetchImageWithIdentifier_path___block_invoke;
          v29[3] = &unk_2642B20F8;
          objc_copyWeak(&v31, &location);
          objc_copyWeak(&v32, &from);
          BOOL v33 = v24;
          id v30 = v8;
          LODWORD(v26) = v25;
          v27 = +[TPSImageAssetController formattedDataForPath:v30 identifier:v7 priority:v29 completionHandler:v26];
          v28 = self->_imageURLSessionItem;
          self->_imageURLSessionItem = v27;

          objc_destroyWeak(&v32);
          objc_destroyWeak(&v31);
          objc_destroyWeak(&from);
          objc_destroyWeak(&location);
          goto LABEL_9;
        }
      }
    }
    self->_unint64_t status = 4;
    [(TPSImageAssetView *)self setImage:v17];
    [(TPSImageAssetView *)self setStatus:4];
    id v22 = objc_loadWeakRetained((id *)&self->_delegate);
    [v22 imageAssetViewImageUpdated:self];
  }
LABEL_9:
}

void __51__TPSImageAssetView_fetchImageWithIdentifier_path___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, char a5, uint64_t a6, void *a7)
{
  id v10 = a3;
  id v11 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v13 = objc_loadWeakRetained((id *)(a1 + 48));
  v14 = [WeakRetained currentDisplayIdentifier];
  int v15 = [v13 isEqualToString:v14];

  if (v11)
  {
    if ([WeakRetained status] == 4)
    {
LABEL_13:
      v23 = [MEMORY[0x263F7F5F8] data];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        __51__TPSImageAssetView_fetchImageWithIdentifier_path___block_invoke_cold_1(a1, (uint64_t)v11, v23);
      }

      goto LABEL_16;
    }
    uint64_t v16 = 2;
  }
  else
  {
    v17 = [WeakRetained imageURLSessionItem];
    unsigned int v18 = v15 & ~[v17 isCancelled];

    if (v18 == 1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v10;
        [WeakRetained setStatus:4];
        [WeakRetained setImage:v19];
        v20 = [WeakRetained delegate];
        [v20 imageAssetViewImageUpdated:WeakRetained];

        BOOL v21 = (a5 & 1) == 0 && *(unsigned char *)(a1 + 56) == 0;
        [WeakRetained animateImageView:v21];
      }
      else
      {
        [WeakRetained setStatus:2];
        [WeakRetained setImage:0];
        BOOL v24 = [WeakRetained delegate];
        [v24 imageAssetViewImageUpdated:WeakRetained];

        [WeakRetained setCurrentDisplayIdentifier:0];
        [WeakRetained setCurrentImagePath:0];
      }
      goto LABEL_16;
    }
    if ([WeakRetained status] == 4) {
      goto LABEL_16;
    }
    uint64_t v16 = 3;
  }
  [WeakRetained setStatus:v16];
  if (v15)
  {
    [WeakRetained setImage:0];
    id v22 = [WeakRetained delegate];
    [v22 imageAssetViewImageUpdated:WeakRetained];
  }
  if (v11) {
    goto LABEL_13;
  }
LABEL_16:
  [WeakRetained setImageURLSessionItem:0];
}

- (void)animateImageView:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TPSImageAssetView *)self imageView];
  id v6 = v5;
  if (v3)
  {
    [v5 setAlpha:0.0];

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__TPSImageAssetView_animateImageView___block_invoke;
    v7[3] = &unk_2642B1F70;
    v7[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v7 animations:&__block_literal_global_1 completion:0.2];
  }
  else
  {
    [v5 setAlpha:1.0];
  }
}

void __38__TPSImageAssetView_animateImageView___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) imageView];
  [v1 setAlpha:1.0];
}

- (void)showHighlight:(BOOL)a3
{
  highlightView = self->_highlightView;
  if (a3)
  {
    if (!highlightView)
    {
      id v6 = objc_alloc(MEMORY[0x263F82E00]);
      [(TPSImageAssetView *)self bounds];
      id v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
      id v8 = self->_highlightView;
      self->_highlightView = v7;

      [(TPSImageAssetView *)self _continuousCornerRadius];
      -[UIView _setContinuousCornerRadius:](self->_highlightView, "_setContinuousCornerRadius:");
      id v9 = [MEMORY[0x263F825C8] colorWithWhite:0.31372549 alpha:0.25];
      [(UIView *)self->_highlightView setBackgroundColor:v9];

      id v10 = self->_highlightView;
      [(TPSImageAssetView *)self addSubview:v10];
    }
  }
  else
  {
    [(UIView *)highlightView removeFromSuperview];
    id v5 = self->_highlightView;
    self->_highlightView = 0;
  }
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)TPSImageAssetView;
  [(TPSImageAssetView *)&v11 layoutSubviews];
  [(TPSImageAssetView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  -[UIView setFrame:](self->_highlightView, "setFrame:", v4, v6, v8, v10);
}

- (BOOL)respectLoadingStatus
{
  return self->_respectLoadingStatus;
}

- (void)setRespectLoadingStatus:(BOOL)a3
{
  self->_BOOL respectLoadingStatus = a3;
}

- (BOOL)hideImageWhenNil
{
  return self->_hideImageWhenNil;
}

- (void)setHideImageWhenNil:(BOOL)a3
{
  self->_hideImageWhenNil = a3;
}

- (BOOL)roundedCorner
{
  return self->_roundedCorner;
}

- (BOOL)aspectFillAsset
{
  return self->_aspectFillAsset;
}

- (double)roundedCornerRadius
{
  return self->_roundedCornerRadius;
}

- (void)setRoundedCornerRadius:(double)a3
{
  self->_double roundedCornerRadius = a3;
}

- (TPSImageAssetViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TPSImageAssetViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)backgroundImageView
{
  return self->_backgroundImageView;
}

- (void)setBackgroundImageView:(id)a3
{
}

- (UIColor)defaultBackgroundColor
{
  return self->_defaultBackgroundColor;
}

- (UIColor)noImageBackgroundColor
{
  return self->_noImageBackgroundColor;
}

- (UIColor)overlayColor
{
  return self->_overlayColor;
}

- (void)setOverlayColor:(id)a3
{
}

- (NSString)currentImagePath
{
  return self->_currentImagePath;
}

- (void)setCurrentImagePath:(id)a3
{
}

- (NSString)currentDisplayIdentifier
{
  return self->_currentDisplayIdentifier;
}

- (void)setCurrentDisplayIdentifier:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_unint64_t status = a3;
}

- (TPSURLSessionItem)imageURLSessionItem
{
  return self->_imageURLSessionItem;
}

- (void)setImageURLSessionItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURLSessionItem, 0);
  objc_storeStrong((id *)&self->_currentDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_currentImagePath, 0);
  objc_storeStrong((id *)&self->_overlayColor, 0);
  objc_storeStrong((id *)&self->_noImageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_highlightView, 0);
}

void __51__TPSImageAssetView_fetchImageWithIdentifier_path___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_217984000, log, OS_LOG_TYPE_DEBUG, "Image asset path %@ fetch error: %@", (uint8_t *)&v4, 0x16u);
}

@end
@interface UGCARPPhotoCarouselViewModel
+ (double)preferredCellHeight;
- (BOOL)checked;
- (BOOL)enabled;
- (BOOL)isLoading;
- (BOOL)isSuggestedPhoto;
- (CGSize)imageSizeForCell;
- (NSString)_maps_diffableDataSourceIdentifier;
- (NSString)identifier;
- (NSURL)imageURL;
- (NSURL)url;
- (PHAsset)asset;
- (UGCARPPhotoCarouselViewModel)initWithImageManager:(id)a3;
- (UGCPhotoWithMetadata)photoWithMetadata;
- (double)timeoutInterval;
- (int)_loadPhotoFromAsset:(id)a3 shouldDegrade:(BOOL)a4 scale:(double)a5 progressHandler:(id)a6 completion:(id)a7;
- (void)_prepareImageThumbnailWithOriginalImage:(id)a3 targetSize:(CGSize)a4 scale:(double)a5 completion:(id)a6;
- (void)cancelLoadImageWithRequestID:(int)a3;
- (void)loadOriginalImageWithDisplayScale:(double)a3 progressHandler:(id)a4 completion:(id)a5;
- (void)loadThumbnailImageWithDisplayScale:(double)a3 completion:(id)a4;
- (void)setAsset:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setIsSuggestedPhoto:(BOOL)a3;
- (void)setPhotoWithMetadata:(id)a3;
@end

@implementation UGCARPPhotoCarouselViewModel

- (UGCARPPhotoCarouselViewModel)initWithImageManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UGCARPPhotoCarouselViewModel;
  v6 = [(UGCARPPhotoCarouselViewModel *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_imageManager, a3);
    v7->_enabled = 1;
  }

  return v7;
}

- (NSString)_maps_diffableDataSourceIdentifier
{
  v3 = [(UGCARPPhotoCarouselViewModel *)self identifier];
  v4 = [v3 stringByAppendingFormat:@"%d", self->_enabled];

  return (NSString *)v4;
}

- (NSURL)url
{
  return [(UGCARPPhotoCarouselViewModel *)self imageURL];
}

- (double)timeoutInterval
{
  return 30.0;
}

+ (double)preferredCellHeight
{
  return 220.0;
}

- (CGSize)imageSizeForCell
{
  photoWithMetadata = self->_photoWithMetadata;
  if (photoWithMetadata)
  {
    v4 = [(UGCPhotoWithMetadata *)photoWithMetadata image];
    [v4 size];
    double v6 = v5;
    v7 = [(UGCPhotoWithMetadata *)self->_photoWithMetadata image];
    [v7 size];
    double v9 = v6 / v8;

    double v10 = v9 * 220.0;
    if (v9 * 220.0 == 0.0)
    {
      v11 = sub_1003673EC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v16 = 134217984;
        double v17 = v9;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Image width of 0 where aspect ratio is %f", (uint8_t *)&v16, 0xCu);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else
  {
    asset = self->_asset;
    if (!asset)
    {
      double v10 = 220.0;
      goto LABEL_12;
    }
    [(PHAsset *)asset aspectRatio];
    double v14 = v13;
    double v10 = v13 * 220.0;
    if (v10 == 0.0)
    {
      v11 = sub_1003673EC();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v16 = 134217984;
        double v17 = v14;
        goto LABEL_9;
      }
LABEL_10:

      double v10 = 220.0;
    }
  }
LABEL_12:
  double v15 = 220.0;
  result.height = v15;
  result.width = v10;
  return result;
}

- (void)loadOriginalImageWithDisplayScale:(double)a3 progressHandler:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1003675F0;
  v18[3] = &unk_1012E6000;
  id v9 = a5;
  id v19 = v9;
  double v10 = objc_retainBlock(v18);
  v11 = v10;
  if (self->_photoWithMetadata)
  {
    v12 = (void (*)(void))v10[2];
  }
  else
  {
    asset = self->_asset;
    if (asset)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1003676B0;
      v16[3] = &unk_1012E6050;
      id v17 = v8;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1003677C0;
      v14[3] = &unk_1012E6078;
      id v15 = v11;
      [(UGCARPPhotoCarouselViewModel *)self _loadPhotoFromAsset:asset shouldDegrade:0 scale:v16 progressHandler:v14 completion:a3];

      goto LABEL_6;
    }
    v12 = (void (*)(void))v10[2];
  }
  v12();
LABEL_6:
}

- (void)cancelLoadImageWithRequestID:(int)a3
{
}

- (void)loadThumbnailImageWithDisplayScale:(double)a3 completion:(id)a4
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100367960;
  v15[3] = &unk_1012E60A0;
  id v6 = a4;
  id v16 = v6;
  v7 = objc_retainBlock(v15);
  photoWithMetadata = self->_photoWithMetadata;
  if (photoWithMetadata)
  {
    id v9 = [(UGCPhotoWithMetadata *)photoWithMetadata image];
    -[UGCARPPhotoCarouselViewModel _prepareImageThumbnailWithOriginalImage:targetSize:scale:completion:](self, "_prepareImageThumbnailWithOriginalImage:targetSize:scale:completion:", v9, v7, 220.0, 220.0, a3);
  }
  else
  {
    asset = self->_asset;
    if (asset)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100367A20;
      v11[3] = &unk_1012E60C8;
      v11[4] = self;
      int64x2_t v13 = vdupq_n_s64(0x406B800000000000uLL);
      double v14 = a3;
      v12 = v7;
      [(UGCARPPhotoCarouselViewModel *)self _loadPhotoFromAsset:asset shouldDegrade:1 scale:0 progressHandler:v11 completion:a3];
    }
    else
    {
      ((void (*)(void *, void))v7[2])(v7, 0);
    }
  }
}

- (int)_loadPhotoFromAsset:(id)a3 shouldDegrade:(BOOL)a4 scale:(double)a5 progressHandler:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = objc_opt_new();
  [v15 setNetworkAccessAllowed:1];
  if (v10)
  {
    [v15 setDeliveryMode:0];
    double v16 = a5 * 220.0;
    double v17 = v16;
  }
  else
  {
    [v15 setDeliveryMode:1];
    double v16 = (double)(unint64_t)[v12 pixelHeight];
    double v17 = (double)(unint64_t)[v12 pixelWidth];
  }
  [v15 setProgressHandler:v13];
  objc_initWeak(&location, self);
  imageManager = self->_imageManager;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100367C48;
  v22[3] = &unk_1012E60F0;
  objc_copyWeak(&v25, &location);
  id v19 = v12;
  id v23 = v19;
  id v20 = v14;
  id v24 = v20;
  LODWORD(imageManager) = -[PHCachingImageManager requestImageForAsset:targetSize:contentMode:options:resultHandler:](imageManager, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v19, 1, v15, v22, v16, v17);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return (int)imageManager;
}

- (void)_prepareImageThumbnailWithOriginalImage:(id)a3 targetSize:(CGSize)a4 scale:(double)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100367EDC;
  v12[3] = &unk_1012E6118;
  id v13 = a3;
  id v14 = a6;
  id v10 = v13;
  id v11 = v14;
  +[MapsUIUtilities resizeImageIfNeeded:toFrameSize:displayScale:completion:](MapsUIUtilities, "resizeImageIfNeeded:toFrameSize:displayScale:completion:", v10, v12, width, height, a5);
}

- (UGCPhotoWithMetadata)photoWithMetadata
{
  return self->_photoWithMetadata;
}

- (void)setPhotoWithMetadata:(id)a3
{
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (BOOL)checked
{
  return self->_checked;
}

- (void)setChecked:(BOOL)a3
{
  self->_checked = a3;
}

- (BOOL)isSuggestedPhoto
{
  return self->_isSuggestedPhoto;
}

- (void)setIsSuggestedPhoto:(BOOL)a3
{
  self->_isSuggestedPhoto = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_photoWithMetadata, 0);

  objc_storeStrong((id *)&self->_imageManager, 0);
}

@end
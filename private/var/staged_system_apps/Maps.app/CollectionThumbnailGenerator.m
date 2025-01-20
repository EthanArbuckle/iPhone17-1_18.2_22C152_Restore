@interface CollectionThumbnailGenerator
- (BOOL)hasFinishedLoading;
- (CollectionThumbnailGenerator)initWithPlaceCollection:(id)a3 size:(CGSize)a4;
- (UIImage)currentImage;
- (UIImage)placeholderImage;
- (id)thumbnailImage;
- (void)loadThumbnailIfNeededWithCompletion:(id)a3;
- (void)setCurrentImage:(id)a3;
- (void)setHasFinishedLoading:(BOOL)a3;
@end

@implementation CollectionThumbnailGenerator

- (CollectionThumbnailGenerator)initWithPlaceCollection:(id)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CollectionThumbnailGenerator;
  v9 = [(CollectionThumbnailGenerator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    v10->_size.CGFloat width = width;
    v10->_size.CGFloat height = height;
    v10->_hasFinishedLoading = 0;
    uint64_t v11 = +[UIImage imageNamed:@"NoImageGuideIcon"];
    placeholderImage = v10->_placeholderImage;
    v10->_placeholderImage = (UIImage *)v11;
  }
  return v10;
}

- (void)loadThumbnailIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  if (![(CollectionThumbnailGenerator *)self hasFinishedLoading])
  {
    v6 = [(GEOPlaceCollection *)self->_collection photos];
    v5 = [v6 _geo_firstPhotoOfAtLeastSize:self->_size.width, self->_size.height];

    if (v5)
    {
      v7 = +[MKAppImageManager sharedImageManager];
      id v8 = [v5 url];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100C21E60;
      v10[3] = &unk_10131B9E8;
      v10[4] = self;
      id v11 = v4;
      [v7 loadAppImageAtURL:v8 completionHandler:v10];
    }
    else
    {
      [(CollectionThumbnailGenerator *)self setHasFinishedLoading:1];
      if (v4)
      {
        v9 = [(CollectionThumbnailGenerator *)self thumbnailImage];
        (*((void (**)(id, void *, void))v4 + 2))(v4, v9, 0);
      }
    }
    goto LABEL_8;
  }
  if (v4)
  {
    v5 = [(CollectionThumbnailGenerator *)self thumbnailImage];
    (*((void (**)(id, void *, void))v4 + 2))(v4, v5, 0);
LABEL_8:
  }
}

- (id)thumbnailImage
{
  v3 = [(CollectionThumbnailGenerator *)self currentImage];
  if (!v3)
  {
    v3 = [(CollectionThumbnailGenerator *)self placeholderImage];
  }

  return v3;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (BOOL)hasFinishedLoading
{
  return self->_hasFinishedLoading;
}

- (void)setHasFinishedLoading:(BOOL)a3
{
  self->_hasFinishedLoading = a3;
}

- (UIImage)currentImage
{
  return self->_currentImage;
}

- (void)setCurrentImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentImage, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);

  objc_storeStrong((id *)&self->_collection, 0);
}

@end
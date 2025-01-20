@interface ICImageCollectionViewCell
+ (id)thumbnailCache;
- (ICImageCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAttachment:(id)a3;
- (void)updatePreviewImage;
@end

@implementation ICImageCollectionViewCell

- (id)accessibilityLabel
{
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"image" value:&stru_10063F3D8 table:0];

  v7 = [(ICBrowseAttachmentsBaseCell *)self itemNumberAccessibilityString];
  v5 = __ICAccessibilityStringForVariables();

  return v5;
}

- (id)accessibilityValue
{
  v3 = [(ICBrowseAttachmentsBaseCell *)self attachment];
  v4 = [v3 title];
  id v5 = [v4 length];

  v6 = [(ICBrowseAttachmentsBaseCell *)self attachment];
  v7 = v6;
  if (v5) {
    [v6 title];
  }
  else {
  v8 = [v6 modificationDateForSpeaking];
  }

  return v8;
}

+ (id)thumbnailCache
{
  if (qword_1006AA2C8 != -1) {
    dispatch_once(&qword_1006AA2C8, &stru_100629C00);
  }
  v2 = (void *)qword_1006AA2C0;

  return v2;
}

- (ICImageCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [objc_alloc((Class)UIImageView) initWithFrame:a3.origin.x, a3.origin.y, a3.size.width, a3.size.height];
  if (+[UIDevice ic_isVision]) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  [v8 setContentMode:v9];
  v12.receiver = self;
  v12.super_class = (Class)ICImageCollectionViewCell;
  v10 = -[ICImagesAndMoviesBaseCell initWithThumbnailView:frame:](&v12, "initWithThumbnailView:frame:", v8, x, y, width, height);

  return v10;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ICImageCollectionViewCell;
  [(ICImageCollectionViewCell *)&v3 layoutSubviews];
  [(ICImageCollectionViewCell *)self updatePreviewImage];
}

- (void)setAttachment:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICImageCollectionViewCell;
  id v4 = a3;
  [(ICImagesAndMoviesBaseCell *)&v5 setAttachment:v4];
  -[ICImageCollectionViewCell ic_annotateWithAttachment:](self, "ic_annotateWithAttachment:", v4, v5.receiver, v5.super_class);

  [(ICImageCollectionViewCell *)self updatePreviewImage];
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)ICImageCollectionViewCell;
  [(ICImagesAndMoviesBaseCell *)&v5 didMoveToWindow];
  objc_super v3 = [(ICImagesAndMoviesBaseCell *)self thumbnailView];
  id v4 = [v3 image];

  if (!v4) {
    [(ICImageCollectionViewCell *)self updatePreviewImage];
  }
}

- (void)updatePreviewImage
{
  objc_super v3 = [(ICImageCollectionViewCell *)self window];
  if (v3 && (v32 = v3, [(ICImageCollectionViewCell *)self frame], objc_super v3 = v32, v4 > 0.0))
  {
    [(ICImageCollectionViewCell *)self frame];
    double v6 = v5;

    if (v6 > 0.0)
    {
      objc_initWeak(&location, self);
      v7 = [(ICBrowseAttachmentsBaseCell *)self attachment];
      id v8 = [v7 identifier];
      id v9 = [v8 copy];

      v10 = [(ICBrowseAttachmentsBaseCell *)self attachment];
      v11 = [v10 imageCacheKey];

      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1000F44DC;
      v34[3] = &unk_100629C28;
      objc_copyWeak(&v36, &location);
      id v12 = v9;
      id v35 = v12;
      v13 = objc_retainBlock(v34);
      [(ICImageCollectionViewCell *)self frame];
      double v15 = v14;
      double v17 = v16;
      v18 = [(ICImageCollectionViewCell *)self window];
      v19 = [v18 screen];
      [v19 scale];
      double v21 = v20;

      v22 = [(ICImageCollectionViewCell *)self window];
      v23 = [v22 screen];
      [v23 scale];
      double v25 = v24;
      double v26 = v15 * fmax(v21, 1.0);

      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1000F4634;
      v33[3] = &unk_100629C48;
      double v27 = v17 * fmax(v25, 1.0);
      *(double *)&v33[4] = v26;
      *(double *)&v33[5] = v27;
      v28 = objc_retainBlock(v33);
      v29 = [(ICBrowseAttachmentsBaseCell *)self attachment];
      v30 = [(ICImageCollectionViewCell *)self ic_appearanceInfo];
      v31 = +[ICImageCollectionViewCell thumbnailCache];
      [v29 fetchThumbnailImageWithMinSize:v30 scale:v31 appearanceInfo:v11 cache:v28 cacheKey:v13 processingBlock:0 completionBlock:v26 cacheKey:v27 scale:1.0 aboutToLoadHandler:0];

      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)ICImageCollectionViewCell;
  [(ICBrowseAttachmentsBaseCell *)&v4 prepareForReuse];
  objc_super v3 = [(ICImagesAndMoviesBaseCell *)self thumbnailView];
  [v3 setImage:0];
}

@end
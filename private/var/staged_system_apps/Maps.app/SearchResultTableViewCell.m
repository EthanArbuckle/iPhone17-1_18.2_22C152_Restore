@interface SearchResultTableViewCell
+ (CGSize)photoSize;
+ (double)estimatedCellHeight;
- (CGSize)_imageSize;
- (SearchResultTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)horizontalSpacing;
- (double)leadingMargin;
- (double)trailingMargin;
- (int64_t)containerAlignment;
- (void)_updateSpacings;
- (void)cancelLoadingPhoto;
- (void)didUpdateMapItem;
- (void)didUpdatePublisherResult;
- (void)didUpdateRelatedSection;
- (void)getDefaultImage:(id)a3;
- (void)loadPhoto;
- (void)prepareForActionMenuPresentation;
- (void)prepareForReuse;
- (void)setDefaultImage;
- (void)setDisplaysAsChainResult:(BOOL)a3;
- (void)setMapsImage:(id)a3;
- (void)updateImageViewAlignmentAndSpacingIfNeeded;
- (void)updateTheme;
@end

@implementation SearchResultTableViewCell

+ (double)estimatedCellHeight
{
  return 100.0;
}

- (SearchResultTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)SearchResultTableViewCell;
  v4 = [(_SearchResultTableViewCell *)&v21 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(SearchResultTableViewCell *)v4 window];
    v7 = [v6 screen];
    v8 = v7;
    if (v7)
    {
      [v7 nativeScale];
      double v10 = v9;
    }
    else
    {
      v11 = +[UIScreen mainScreen];
      [v11 nativeScale];
      double v10 = v12;
    }
    v13 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    imageView = v5->_imageView;
    v5->_imageView = v13;

    [(UIImageView *)v5->_imageView setClipsToBounds:1];
    [(SearchResultTableViewCell *)v5 _imageSize];
    [(UIImageView *)v5->_imageView setMinimumLayoutSize:"setMinimumLayoutSize:"];
    [(SearchResultTableViewCell *)v5 _imageSize];
    [(UIImageView *)v5->_imageView setMaximumLayoutSize:"setMaximumLayoutSize:"];
    [(UIImageView *)v5->_imageView setAccessibilityIdentifier:@"ImageView"];
    if (sub_1000BBB44(v5) == 5)
    {
      -[UIImageView setCustomAlignmentRectInsets:](v5->_imageView, "setCustomAlignmentRectInsets:", -3.0, 0.0, 0.0, 0.0);
      [(NUIContainerStackView *)v5->super._containerStackView insertArrangedSubview:v5->_imageView atIndex:0];
    }
    else if (!v5->super._accessibilityEnabled)
    {
      [(UIImageView *)v5->_imageView _setContinuousCornerRadius:8.0];
      v15 = [(UIImageView *)v5->_imageView layer];
      [v15 setBorderWidth:1.0 / v10];

      v16 = +[UIColor tertiaryLabelColor];
      [(UIImageView *)v5->_imageView setTintColor:v16];

      -[UIImageView setCustomAlignmentRectInsets:](v5->_imageView, "setCustomAlignmentRectInsets:", -1.0, 0.0, 0.0, 0.0);
      [(NUIContainerStackView *)v5->super._containerStackView addArrangedSubview:v5->_imageView];
      [(SearchResultTableViewCell *)v5 leadingMargin];
      double v18 = v17;
      [(SearchResultTableViewCell *)v5 trailingMargin];
      -[NUIContainerStackView setLayoutMargins:](v5->super._containerStackView, "setLayoutMargins:", 15.0, v18, 0.0, v19);
    }
  }
  return v5;
}

- (void)_updateSpacings
{
  v7.receiver = self;
  v7.super_class = (Class)SearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v7 _updateSpacings];
  if (sub_1000BBB44(self) != 5)
  {
    v3 = [(NUIContainerStackView *)self->super._labelStackView arrangedSubviews];
    if ([v3 containsObject:self->super._secondLabelStackView])
    {
      v4 = (char *)[v3 indexOfObject:self->super._secondLabelStackView];
      if (v4 < (char *)[v3 count] - 1)
      {
        labelStackView = self->super._labelStackView;
        [(NUIContainerStackView *)labelStackView spacing];
        [(NUIContainerStackView *)labelStackView setCustomSpacing:self->super._secondLabelStackView afterView:v6 + 1.0];
      }
    }
  }
}

- (int64_t)containerAlignment
{
  if (sub_1000BBB44(self) == 5 && (id)[(_SearchResultTableViewCell *)self numberOfLines] == (id)1) {
    return 3;
  }
  else {
    return 1;
  }
}

- (void)updateImageViewAlignmentAndSpacingIfNeeded
{
  if (sub_1000BBB44(self) == 5)
  {
    if ((id)[(_SearchResultTableViewCell *)self numberOfLines] == (id)1)
    {
      double top = UIEdgeInsetsZero.top;
      double left = UIEdgeInsetsZero.left;
      imageView = self->_imageView;
      double bottom = UIEdgeInsetsZero.bottom;
      double right = UIEdgeInsetsZero.right;
    }
    else
    {
      imageView = self->_imageView;
      double top = -3.0;
      double left = 0.0;
      double bottom = 0.0;
      double right = 0.0;
    }
    -[UIImageView setCustomAlignmentRectInsets:](imageView, "setCustomAlignmentRectInsets:", top, left, bottom, right);
  }
}

- (void)setDisplaysAsChainResult:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v8 setDisplaysAsChainResult:a3];
  [(SearchResultTableViewCell *)self _imageSize];
  double v5 = v4;
  double v7 = v6;
  [(UIImageView *)self->_imageView setMinimumLayoutSize:"setMinimumLayoutSize:"];
  -[UIImageView setMaximumLayoutSize:](self->_imageView, "setMaximumLayoutSize:", v5, v7);
}

- (double)leadingMargin
{
  uint64_t v2 = sub_1000BBB44(self);
  double result = 16.0;
  if (v2 == 5) {
    return 0.0;
  }
  return result;
}

- (double)trailingMargin
{
  if (!self->super._accessibilityEnabled) {
    return 16.0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v3 trailingMargin];
  return result;
}

- (double)horizontalSpacing
{
  uint64_t v3 = sub_1000BBB44(self);
  double result = 8.0;
  if (v3 != 5)
  {
    if (self->super._accessibilityEnabled)
    {
      v5.receiver = self;
      v5.super_class = (Class)SearchResultTableViewCell;
      [(_SearchResultTableViewCell *)&v5 horizontalSpacing];
    }
    else
    {
      return 5.0;
    }
  }
  return result;
}

- (void)updateTheme
{
  v9.receiver = self;
  v9.super_class = (Class)SearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v9 updateTheme];
  if (sub_1000BBB44(self) != 5)
  {
    uint64_t v3 = [(SearchResultTableViewCell *)self theme];
    double v4 = [v3 imageBackgroundColor];
    [(UIImageView *)self->_imageView setBackgroundColor:v4];

    objc_super v5 = [(SearchResultTableViewCell *)self theme];
    id v6 = [v5 imageBorderColor];
    id v7 = [v6 CGColor];
    objc_super v8 = [(UIImageView *)self->_imageView layer];
    [v8 setBorderColor:v7];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)SearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v3 prepareForReuse];
  [(_SearchResultTableViewCell *)self setDebugString:0];
}

- (void)didUpdateMapItem
{
  v3.receiver = self;
  v3.super_class = (Class)SearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v3 didUpdateMapItem];
  [(SearchResultTableViewCell *)self cancelLoadingPhoto];
  ++self->_imageState;
  [(UIImageView *)self->_imageView setImage:0];
  [(SearchResultTableViewCell *)self loadPhoto];
}

- (void)didUpdatePublisherResult
{
  v3.receiver = self;
  v3.super_class = (Class)SearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v3 didUpdatePublisherResult];
  [(SearchResultTableViewCell *)self loadPhoto];
}

- (void)didUpdateRelatedSection
{
  v5.receiver = self;
  v5.super_class = (Class)SearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v5 didUpdateRelatedSection];
  objc_super v3 = [(_SearchResultTableViewCell *)self relatedSection];

  if (v3)
  {
    double v4 = +[UIImage imageNamed:@"Fallback-Guide"];
    [(SearchResultTableViewCell *)self setMapsImage:v4];
  }
}

- (void)loadPhoto
{
  [(UIImageView *)self->_imageView setHidden:0];
  int imageState = self->_imageState;
  if (sub_1000BBB44(self) == 5)
  {
    objc_initWeak(&location, self);
    double v4 = +[MapsUIImageCache sharedCache];
    objc_super v5 = [(_SearchResultTableViewCell *)self mapItem];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1009821FC;
    v18[3] = &unk_101312288;
    objc_copyWeak(&v19, &location);
    int v20 = imageState;
    [v4 getImageForMapItem:v5 completion:v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    id v6 = [(_SearchResultTableViewCell *)self mapItem];
    id v7 = [v6 _geoMapItem];
    objc_super v8 = [v7 _photos];
    [(id)objc_opt_class() photoSize];
    objc_super v9 = [v8 _geo_firstPhotoOfAtLeastSize:];

    double v10 = [v9 url];
    v11 = (NSURL *)[v10 copy];
    currentLoadingURL = self->_currentLoadingURL;
    self->_currentLoadingURL = v11;

    if (v9)
    {
      objc_initWeak(&location, self);
      v13 = +[MKAppImageManager sharedImageManager];
      v14 = [v9 url];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100982288;
      v15[3] = &unk_1013122B0;
      objc_copyWeak(&v16, &location);
      int v17 = imageState;
      [v13 loadAppImageAtURL:v14 completionHandler:v15];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      [(SearchResultTableViewCell *)self setDefaultImage];
    }
  }
}

- (void)setMapsImage:(id)a3
{
  imageView = self->_imageView;
  id v5 = a3;
  [(UIImageView *)imageView setContentMode:2];
  [(UIImageView *)self->_imageView setImage:v5];
}

- (void)setDefaultImage
{
  [(UIImageView *)self->_imageView setContentMode:1];
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100982468;
  v3[3] = &unk_1012E7298;
  objc_copyWeak(&v4, &location);
  [(SearchResultTableViewCell *)self getDefaultImage:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)getDefaultImage:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    uint64_t v5 = [(_SearchResultTableViewCell *)self searchCategory];
    if (!v5) {
      goto LABEL_5;
    }
    id v6 = (void *)v5;
    id v7 = +[BrowseManager sharedManager];
    objc_super v8 = [(_SearchResultTableViewCell *)self searchCategory];
    objc_super v9 = [v7 cellImageForCategory:v8];

    if (v9)
    {
      v4[2](v4, v9);
    }
    else
    {
LABEL_5:
      int imageState = self->_imageState;
      objc_super v9 = objc_opt_new();
      [v9 setSize:4];
      [v9 setTransparent:1];
      v11 = [(_SearchResultTableViewCell *)self mapItem];
      double v12 = [v11 _styleAttributes];
      [v9 setStyle:v12];

      objc_initWeak(&location, self);
      v13 = +[MapsUIImageCache sharedCache];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1009826C4;
      v14[3] = &unk_1013122D8;
      objc_copyWeak(&v16, &location);
      int v17 = imageState;
      v15 = v4;
      [v13 getImageForSpec:v9 completion:v14];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
  }
}

- (void)cancelLoadingPhoto
{
  if (self->_currentLoadingURL)
  {
    objc_super v3 = +[MKAppImageManager sharedImageManager];
    [v3 cancelLoadAppImageAtURL:self->_currentLoadingURL];

    currentLoadingURL = self->_currentLoadingURL;
    self->_currentLoadingURL = 0;

    imageView = self->_imageView;
    [(UIImageView *)imageView setImage:0];
  }
}

- (CGSize)_imageSize
{
  uint64_t v3 = sub_1000BBB44(self);
  double v4 = 24.0;
  if (v3 != 5)
  {
    unsigned int v5 = [(_SearchResultTableViewCell *)self displaysAsChainResult];
    double v4 = 64.0;
    if (v5) {
      double v4 = 50.0;
    }
  }
  double v6 = v4;
  result.height = v6;
  result.width = v4;
  return result;
}

+ (CGSize)photoSize
{
  if (qword_1016101F8 != -1) {
    dispatch_once(&qword_1016101F8, &stru_1013122F8);
  }
  double v2 = *(double *)&qword_1016101E8;
  double v3 = unk_1016101F0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)prepareForActionMenuPresentation
{
  v4.receiver = self;
  v4.super_class = (Class)SearchResultTableViewCell;
  [(_SearchResultTableViewCell *)&v4 prepareForActionMenuPresentation];
  [(UIImageView *)self->_imageView _setContinuousCornerRadius:8.0];
  double v3 = [(UIImageView *)self->_imageView layer];
  [v3 setMasksToBounds:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLoadingURL, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
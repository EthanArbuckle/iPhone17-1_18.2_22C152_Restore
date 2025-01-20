@interface ICImagesAndMoviesBaseCell
- (BOOL)accessibilityIgnoresInvertColors;
- (ICImagesAndMoviesBaseCell)initWithThumbnailView:(id)a3 frame:(CGRect)a4;
- (ICImagesAndMoviesScrollView)scrollView;
- (NSArray)ourConstraints;
- (UIView)thumbnailView;
- (double)aspectRatio;
- (id)collectionView;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (unint64_t)thumbnailLayout;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAspectRatio:(double)a3;
- (void)setAttachment:(id)a3;
- (void)setOurConstraints:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setThumbnailLayout:(unint64_t)a3;
- (void)setThumbnailView:(id)a3;
- (void)updateAspectRatio;
- (void)updateConstraints;
@end

@implementation ICImagesAndMoviesBaseCell

- (ICImagesAndMoviesBaseCell)initWithThumbnailView:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICImagesAndMoviesBaseCell;
  v10 = -[ICImagesAndMoviesBaseCell initWithFrame:](&v20, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(ICImagesAndMoviesBaseCell *)v10 setThumbnailView:v9];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9 setClipsToBounds:1];
    if (+[UIDevice ic_isVision])
    {
      v12 = [v9 layer];
      [v12 setCornerRadius:16.0];
    }
    else
    {
      id v13 = +[UIColor tertiaryLabelColor];
      id v14 = [v13 CGColor];
      v15 = [v9 layer];
      [v15 setBorderColor:v14];

      [(ICImagesAndMoviesBaseCell *)v11 ic_hairlineWidth];
      double v17 = v16;
      v12 = [v9 layer];
      [v12 setBorderWidth:v17];
    }

    v18 = [(ICImagesAndMoviesBaseCell *)v11 thumbnailView];
    [(ICImagesAndMoviesBaseCell *)v11 addSubview:v18];

    [(ICImagesAndMoviesBaseCell *)v11 needsUpdateConstraints];
  }

  return v11;
}

- (void)dealloc
{
  v3 = [(ICBrowseAttachmentsBaseCell *)self attachment];

  if (v3)
  {
    v4 = [(ICBrowseAttachmentsBaseCell *)self attachment];
    [v4 ic_removeObserver:self forKeyPath:@"sizeWidth" context:&off_100699748];

    v5 = [(ICBrowseAttachmentsBaseCell *)self attachment];
    [v5 ic_removeObserver:self forKeyPath:@"sizeHeight" context:&off_100699748];
  }
  v6.receiver = self;
  v6.super_class = (Class)ICImagesAndMoviesBaseCell;
  [(ICBrowseAttachmentsBaseCell *)&v6 dealloc];
}

- (void)didMoveToWindow
{
  if ((+[UIDevice ic_isVision] & 1) == 0)
  {
    [(ICImagesAndMoviesBaseCell *)self ic_hairlineWidth];
    double v4 = v3;
    id v6 = [(ICImagesAndMoviesBaseCell *)self thumbnailView];
    v5 = [v6 layer];
    [v5 setBorderWidth:v4];
  }
}

- (void)setThumbnailLayout:(unint64_t)a3
{
  if (self->_thumbnailLayout != a3)
  {
    self->_thumbnailLayout = a3;
    [(ICImagesAndMoviesBaseCell *)self setNeedsUpdateConstraints];
  }
}

- (void)setAttachment:(id)a3
{
  id v4 = a3;
  v5 = [(ICBrowseAttachmentsBaseCell *)self attachment];

  if (v5)
  {
    id v6 = [(ICBrowseAttachmentsBaseCell *)self attachment];
    [v6 ic_removeObserver:self forKeyPath:@"sizeWidth" context:&off_100699748];

    v7 = [(ICBrowseAttachmentsBaseCell *)self attachment];
    [v7 ic_removeObserver:self forKeyPath:@"sizeHeight" context:&off_100699748];
  }
  v11.receiver = self;
  v11.super_class = (Class)ICImagesAndMoviesBaseCell;
  [(ICBrowseAttachmentsBaseCell *)&v11 setAttachment:v4];
  v8 = [(ICBrowseAttachmentsBaseCell *)self attachment];

  if (v8)
  {
    id v9 = [(ICBrowseAttachmentsBaseCell *)self attachment];
    [v9 ic_addObserver:self forKeyPath:@"sizeWidth" context:&off_100699748];

    v10 = [(ICBrowseAttachmentsBaseCell *)self attachment];
    [v10 ic_addObserver:self forKeyPath:@"sizeHeight" context:&off_100699748];
  }
  [(ICImagesAndMoviesBaseCell *)self updateAspectRatio];
  [(ICImagesAndMoviesBaseCell *)self setNeedsUpdateConstraints];
}

- (void)updateAspectRatio
{
  double v3 = [(ICBrowseAttachmentsBaseCell *)self attachment];
  [v3 sizeWidth];
  double v4 = 1.0;
  if (v5 > 0.0)
  {
    id v6 = [(ICBrowseAttachmentsBaseCell *)self attachment];
    [v6 sizeHeight];
    double v8 = v7;

    if (v8 <= 0.0) {
      goto LABEL_5;
    }
    double v3 = [(ICBrowseAttachmentsBaseCell *)self attachment];
    [v3 sizeWidth];
    double v10 = v9;
    objc_super v11 = [(ICBrowseAttachmentsBaseCell *)self attachment];
    [v11 sizeHeight];
    double v4 = v10 / v12;
  }
LABEL_5:

  [(ICImagesAndMoviesBaseCell *)self setAspectRatio:v4];
}

- (void)setAspectRatio:(double)a3
{
  if (self->_aspectRatio != a3)
  {
    self->_aspectRatio = a3;
    if ([(ICImagesAndMoviesBaseCell *)self thumbnailLayout])
    {
      [(ICImagesAndMoviesBaseCell *)self setNeedsUpdateConstraints];
    }
  }
}

- (void)updateConstraints
{
  double v3 = [(ICImagesAndMoviesBaseCell *)self ourConstraints];
  +[NSLayoutConstraint deactivateConstraints:v3];

  double v4 = +[NSMutableArray arrayWithCapacity:4];
  if ([(ICImagesAndMoviesBaseCell *)self computedThumbnailLayout])
  {
    double v5 = [(ICImagesAndMoviesBaseCell *)self thumbnailView];
    id v6 = +[NSLayoutConstraint constraintWithItem:v5 attribute:9 relatedBy:0 toItem:self attribute:9 multiplier:1.0 constant:0.0];
    [v4 addObject:v6];

    double v7 = [(ICImagesAndMoviesBaseCell *)self thumbnailView];
    double v8 = +[NSLayoutConstraint constraintWithItem:v7 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
    [v4 addObject:v8];

    unint64_t v9 = [(ICImagesAndMoviesBaseCell *)self computedThumbnailLayout];
    [(ICImagesAndMoviesBaseCell *)self aspectRatio];
    if (v9 == 1) {
      BOOL v11 = v10 > 1.0;
    }
    else {
      BOOL v11 = v10 < 1.0;
    }
    double v12 = [(ICImagesAndMoviesBaseCell *)self thumbnailView];
    if (v11) {
      uint64_t v13 = 8;
    }
    else {
      uint64_t v13 = 7;
    }
    if (v11) {
      uint64_t v14 = 7;
    }
    else {
      uint64_t v14 = 8;
    }
    v15 = +[NSLayoutConstraint constraintWithItem:v12 attribute:v13 relatedBy:0 toItem:self attribute:v13 multiplier:1.0 constant:0.0];
    [v4 addObject:v15];

    double v16 = [(ICImagesAndMoviesBaseCell *)self thumbnailView];
    double v17 = +[NSLayoutConstraint constraintWithItem:v16 attribute:v14 relatedBy:-1 toItem:self attribute:v14 multiplier:1.0 constant:0.0];
    [v4 addObject:v17];

    v18 = [(ICImagesAndMoviesBaseCell *)self thumbnailView];
    v19 = [(ICImagesAndMoviesBaseCell *)self thumbnailView];
    [(ICImagesAndMoviesBaseCell *)self aspectRatio];
    objc_super v20 = +[NSLayoutConstraint ic_constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:](NSLayoutConstraint, "ic_constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v18, 7, 0, v19, 8);
    [v4 addObject:v20];
  }
  else
  {
    CFStringRef v25 = @"thumbnailView";
    v21 = [(ICImagesAndMoviesBaseCell *)self thumbnailView];
    v26 = v21;
    v18 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];

    v22 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[thumbnailView]|" options:0 metrics:0 views:v18];
    [v4 addObjectsFromArray:v22];

    v23 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[thumbnailView]|" options:0 metrics:0 views:v18];
    [v4 addObjectsFromArray:v23];
  }
  +[NSLayoutConstraint activateConstraints:v4];
  [(ICImagesAndMoviesBaseCell *)self setOurConstraints:v4];
  v24.receiver = self;
  v24.super_class = (Class)ICImagesAndMoviesBaseCell;
  [(ICImagesAndMoviesBaseCell *)&v24 updateConstraints];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  if ([(ICImagesAndMoviesBaseCell *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotes/Ironcade/iOS/Attachment Browser/ImageScroller/ICImagesAndMoviesBaseCell.m"])
  {
    unsigned __int8 v13 = [(ICImagesAndMoviesBaseCell *)self ic_shouldIgnoreObserveValue:v10 ofObject:v11 forKeyPath:v12];

    if (a6 == &off_100699748 && (v13 & 1) == 0)
    {
      [(ICImagesAndMoviesBaseCell *)self updateAspectRatio];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICImagesAndMoviesBaseCell;
    [(ICImagesAndMoviesBaseCell *)&v14 observeValueForKeyPath:v12 ofObject:v11 change:v10 context:a6];
  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  if ((id)[(ICImagesAndMoviesBaseCell *)self thumbnailLayout] == (id)1)
  {
    [v4 size];
    double v6 = v5;
    double v8 = v7;
    unint64_t v9 = [(ICBrowseAttachmentsBaseCell *)self attachment];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;

    if (v11 <= 0.0 || v13 <= 0.0)
    {
      objc_super v14 = [(ICBrowseAttachmentsBaseCell *)self attachment];
      v15 = [(ICImagesAndMoviesBaseCell *)self window];
      double v16 = [v15 screen];
      [v16 scale];
      v18 = [v14 attachmentPreviewImageWithMinSize:v6 scale:v8];

      [v18 width];
      double v11 = v19;
      [v18 height];
      double v13 = v20;
    }
    if (v11 > 0.0 && v13 > 0.0)
    {
      double v6 = v8 * v11 / v13;
      if (v6 > v8 + v8) {
        double v6 = v8 + v8;
      }
    }
    [v4 size];
    if (v21 != v6) {
      [v4 setSize:v6, v8];
    }
  }

  return v4;
}

- (id)collectionView
{
  v2 = [(ICImagesAndMoviesBaseCell *)self scrollView];
  double v3 = [v2 collectionView];

  return v3;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (UIView)thumbnailView
{
  return self->_thumbnailView;
}

- (void)setThumbnailView:(id)a3
{
}

- (unint64_t)thumbnailLayout
{
  return self->_thumbnailLayout;
}

- (ICImagesAndMoviesScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);

  return (ICImagesAndMoviesScrollView *)WeakRetained;
}

- (void)setScrollView:(id)a3
{
}

- (NSArray)ourConstraints
{
  return self->_ourConstraints;
}

- (void)setOurConstraints:(id)a3
{
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ourConstraints, 0);
  objc_destroyWeak((id *)&self->_scrollView);

  objc_storeStrong((id *)&self->_thumbnailView, 0);
}

@end
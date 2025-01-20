@interface BKExpandedImageContentViewController
+ (BOOL)supportsResource:(id)a3;
- (BKExpandedImageContentViewController)initWithResource:(id)a3;
- (BOOL)imageAnalysisInteraction:(id)a3 shouldHandleShareWithRanges:(id)a4 boundingRect:(CGRect)a5 selectedText:(id)a6 selectedAttributedText:(id)a7;
- (BOOL)showOriginal;
- (BOOL)showingFilteredImage;
- (UIImage)image;
- (UIImageView)imageView;
- (UIScrollView)imageScroller;
- (VKCImageAnalysisInteraction)analysisInteraction;
- (VKCImageAnalyzer)imageAnalyzer;
- (id)_prepareImageShowOriginal:(BOOL)a3;
- (id)contentView;
- (id)currentImage:(id)a3 withFilter:(BOOL)a4;
- (id)imageAnalysisInteraction:(id)a3 updateAttributedStringForCopy:(id)a4;
- (id)imageAnalysisInteraction:(id)a3 updateStringForCopy:(id)a4;
- (id)leftToolbarItems;
- (void)_invert:(id)a3;
- (void)dealloc;
- (void)releaseViews;
- (void)setAnalysisInteraction:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageAnalyzer:(id)a3;
- (void)setImageScroller:(id)a3;
- (void)setImageView:(id)a3;
- (void)setShowOriginal:(BOOL)a3;
- (void)setShowingFilteredImage:(BOOL)a3;
- (void)showInvertedImage;
@end

@implementation BKExpandedImageContentViewController

+ (BOOL)supportsResource:(id)a3
{
  v3 = [a3 resource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BKExpandedImageContentViewController)initWithResource:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKExpandedImageContentViewController;
  v5 = [(BKExpandedContentViewController *)&v10 initWithResource:v4];
  if (v5)
  {
    objc_opt_class();
    v6 = [v4 resource];
    uint64_t v7 = BUDynamicCast();
    image = v5->_image;
    v5->_image = (UIImage *)v7;

    v5->_showOriginal = 1;
  }

  return v5;
}

- (void)dealloc
{
  [(BKExpandedImageContentViewController *)self releaseViews];
  v3.receiver = self;
  v3.super_class = (Class)BKExpandedImageContentViewController;
  [(BKExpandedContentViewController *)&v3 dealloc];
}

- (void)releaseViews
{
  v5.receiver = self;
  v5.super_class = (Class)BKExpandedImageContentViewController;
  [(BKExpandedContentViewController *)&v5 releaseViews];
  objc_super v3 = [(BKExpandedImageContentViewController *)self imageScroller];
  [v3 setDelegate:0];

  [(BKExpandedImageContentViewController *)self setImageScroller:0];
  [(BKExpandedImageContentViewController *)self setImageView:0];
  id v4 = [(BKExpandedImageContentViewController *)self analysisInteraction];
  [v4 setDelegate:0];
}

- (id)leftToolbarItems
{
  if (self->_showingFilteredImage)
  {
    objc_super v3 = BookEPUBBundle();
    id v4 = [v3 localizedStringForKey:@"Invert" value:&stru_1DF0D8 table:0];

    id v5 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v4 style:0 target:self action:"_invert:"];
    id v8 = v5;
    v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_invert:(id)a3
{
  id v4 = [(BKExpandedImageContentViewController *)self _prepareImageShowOriginal:!self->_showOriginal];
  [(UIImageView *)self->_imageView setImage:v4];
}

- (void)showInvertedImage
{
  objc_super v3 = [(UIImage *)self->_image CGImage];
  if (v3)
  {
    if (+[BEImageFilter imageIsFilteringCandidate:v3])
    {
      self->_showingFilteredImage = 1;
      self->_showOriginal = 0;
    }
  }
}

- (id)_prepareImageShowOriginal:(BOOL)a3
{
  if (!self->_showingFilteredImage) {
    goto LABEL_10;
  }
  BOOL v4 = a3;
  uint64_t v5 = [(UIImageView *)self->_imageView image];
  v6 = (UIImage *)v5;
  if (self->_showOriginal == v4 && v5 != 0) {
    goto LABEL_11;
  }
  self->_showOriginal = v4;
  uint64_t v8 = [(BKExpandedImageContentViewController *)self currentImage:self->_image withFilter:!v4];
  if (v8)
  {
    v9 = (UIImage *)v8;

    v6 = v9;
    goto LABEL_11;
  }
  if (!v6) {
LABEL_10:
  }
    v6 = self->_image;
LABEL_11:

  return v6;
}

- (id)currentImage:(id)a3 withFilter:(BOOL)a4
{
  image = self->_image;
  if (a4)
  {
    uint64_t v5 = [(UIImage *)image CGImage];
    if (v5)
    {
      v6 = +[BEImageFilter invertedImage:v5];
      if (v6) {
        uint64_t v7 = (UIImage *)[objc_alloc((Class)UIImage) initWithCIImage:v6];
      }
      else {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = image;
  }

  return v7;
}

- (id)contentView
{
  objc_super v3 = [(BKExpandedImageContentViewController *)self imageScroller];

  if (!v3)
  {
    BOOL v4 = [_BKExpandedImageContentCenteringScrollView alloc];
    uint64_t v5 = [(BKExpandedImageContentViewController *)self view];
    [v5 bounds];
    v6 = -[_BKExpandedImageContentCenteringScrollView initWithFrame:](v4, "initWithFrame:");
    imageScroller = self->_imageScroller;
    self->_imageScroller = v6;

    [(UIScrollView *)self->_imageScroller setMaximumZoomScale:32.0];
    [(UIScrollView *)self->_imageScroller setDelegate:self];
    [(UIScrollView *)self->_imageScroller setBouncesZoom:1];
    [(UIScrollView *)self->_imageScroller setDecelerationRate:UIScrollViewDecelerationRateFast];
    [(UIScrollView *)self->_imageScroller setAutoresizingMask:18];
    uint64_t v8 = [(BKExpandedImageContentViewController *)self _prepareImageShowOriginal:self->_showOriginal];
    v9 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v8];
    imageView = self->_imageView;
    self->_imageView = v9;

    [(UIImageView *)self->_imageView setContentMode:1];
    [(UIImageView *)self->_imageView setAutoresizingMask:0];
    [(UIImageView *)self->_imageView setUserInteractionEnabled:1];
    id v11 = objc_alloc_init((Class)VKCImageAnalysisInteraction);
    [(BKExpandedImageContentViewController *)self setAnalysisInteraction:v11];

    v12 = [(BKExpandedImageContentViewController *)self analysisInteraction];
    [v12 setActiveInteractionTypes:9];

    v13 = [(BKExpandedImageContentViewController *)self analysisInteraction];
    [v13 setAutomaticallyShowVisualSearchResults:1];

    v14 = [(BKExpandedImageContentViewController *)self analysisInteraction];
    [v14 setActionInfoViewHidden:0];

    v15 = [(BKExpandedImageContentViewController *)self analysisInteraction];
    [v15 setAnalysisButtonRequiresVisibleContentGating:0];

    v16 = [(BKExpandedImageContentViewController *)self analysisInteraction];
    [v16 setDelegate:self];

    v17 = self->_imageView;
    v18 = [(BKExpandedImageContentViewController *)self analysisInteraction];
    [(UIImageView *)v17 addInteraction:v18];

    id v19 = objc_alloc_init((Class)VKCImageAnalyzer);
    [(BKExpandedImageContentViewController *)self setImageAnalyzer:v19];

    id v20 = [objc_alloc((Class)VKCImageAnalyzerRequest) initWithImage:self->_image requestType:-1];
    objc_initWeak(&location, self);
    v21 = [(BKExpandedImageContentViewController *)self imageAnalyzer];
    v30 = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472;
    v32 = sub_CA85C;
    v33 = &unk_1DD248;
    objc_copyWeak(&v34, &location);
    [v21 processRequest:v20 progressHandler:0 completionHandler:&v30];

    -[UIScrollView addSubview:](self->_imageScroller, "addSubview:", self->_imageView, v30, v31, v32, v33);
    v22 = [(BKExpandedImageContentViewController *)self imageScroller];
    [v22 minimumZoomScale];
    double v24 = v23;

    [(UIScrollView *)self->_imageScroller setMinimumZoomScale:fmin(v24, 1.0)];
    v25 = [(BKExpandedImageContentViewController *)self imageScroller];
    [v25 minimumZoomScale];
    double v27 = v26;

    [(UIScrollView *)self->_imageScroller setZoomScale:fmin(v27, 2.0)];
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  v28 = [(BKExpandedImageContentViewController *)self imageScroller];

  return v28;
}

- (id)imageAnalysisInteraction:(id)a3 updateStringForCopy:(id)a4
{
  id v5 = a4;
  v6 = [(BKExpandedContentViewController *)self delegate];
  uint64_t v7 = v5;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v6 expandedContentViewController:self stringForCopyFromString:v5];
  }

  return v7;
}

- (id)imageAnalysisInteraction:(id)a3 updateAttributedStringForCopy:(id)a4
{
  id v5 = a4;
  v6 = [(BKExpandedContentViewController *)self delegate];
  id v7 = v5;
  if (objc_opt_respondsToSelector())
  {
    id v8 = objc_alloc((Class)NSAttributedString);
    v9 = [v5 string];
    objc_super v10 = [v6 expandedContentViewController:self stringForCopyFromString:v9];
    id v7 = [v8 initWithString:v10];
  }

  return v7;
}

- (BOOL)imageAnalysisInteraction:(id)a3 shouldHandleShareWithRanges:(id)a4 boundingRect:(CGRect)a5 selectedText:(id)a6 selectedAttributedText:(id)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v12 = a6;
  v13 = [(BKExpandedContentViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v14 = [(BKExpandedImageContentViewController *)self imageView];
    v15 = [(BKExpandedImageContentViewController *)self view];
    [v14 convertRect:v15 toView:x, y, width, height];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    [v13 expandedContentViewController:self shareText:v12 sourceRect:v17, v19, v21, v23];
  }

  return 0;
}

- (UIScrollView)imageScroller
{
  return self->_imageScroller;
}

- (void)setImageScroller:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (BOOL)showOriginal
{
  return self->_showOriginal;
}

- (void)setShowOriginal:(BOOL)a3
{
  self->_showOriginal = a3;
}

- (BOOL)showingFilteredImage
{
  return self->_showingFilteredImage;
}

- (void)setShowingFilteredImage:(BOOL)a3
{
  self->_showingFilteredImage = a3;
}

- (VKCImageAnalysisInteraction)analysisInteraction
{
  return self->_analysisInteraction;
}

- (void)setAnalysisInteraction:(id)a3
{
}

- (VKCImageAnalyzer)imageAnalyzer
{
  return self->_imageAnalyzer;
}

- (void)setImageAnalyzer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
  objc_storeStrong((id *)&self->_analysisInteraction, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_imageScroller, 0);
}

@end
@interface BKCoverContentViewController2
- (BKActivityIndicatorOverlayView)activityIndicator;
- (BKCoverContentViewController2)init;
- (BOOL)contentNeedsFilter;
- (BOOL)isAnnotationVisible:(id)a3;
- (BOOL)isReusable;
- (BOOL)isTOCContent;
- (CGRect)cachedRectForAnnotation:(id)a3;
- (CGRect)cachedVisibleRectForAnnotation:(id)a3;
- (OS_dispatch_queue)dispatchQueue;
- (UIImageView)coverImage;
- (WKWebView)coverWebView;
- (id)_getURLToLoad;
- (id)currentLocation;
- (int64_t)ordinal;
- (void)_forceWebContentBackgroundColor;
- (void)loadViewUIImage;
- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4;
- (void)navigationHandler:(id)a3 didStartLoadOfURL:(id)a4;
- (void)navigationHandler:(id)a3 failedToLoadURL:(id)a4 error:(id)a5;
- (void)releaseViews;
- (void)setActivityIndicator:(id)a3;
- (void)setActivityIndicatorVisible:(BOOL)a3 animated:(BOOL)a4 afterDelay:(double)a5;
- (void)setCoverImage:(id)a3;
- (void)setCoverImage:(id)a3 isUndesirable:(BOOL)a4;
- (void)setCoverWebView:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setTheme:(id)a3;
- (void)startActivityIndicatorAfterDelay:(double)a3;
- (void)stopActivityIndicator:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BKCoverContentViewController2

- (BKCoverContentViewController2)init
{
  v10.receiver = self;
  v10.super_class = (Class)BKCoverContentViewController2;
  v2 = [(BKContentViewController *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->super._ordinal = [(BKCoverContentViewController2 *)v2 ordinal];
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.iBooks.BKContentCoverViewController2", v4);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = +[UITraitCollection bc_allAPITraits];
    id v8 = [(BKCoverContentViewController2 *)v3 registerForTraitChanges:v7 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v3;
}

- (void)releaseViews
{
  coverWebView = self->_coverWebView;
  self->_coverWebView = 0;

  [(BKCoverContentViewController2 *)self setCoverImage:0];
  [(BKCoverContentViewController2 *)self setActivityIndicator:0];
  v4.receiver = self;
  v4.super_class = (Class)BKCoverContentViewController2;
  [(BKContentViewController *)&v4 releaseViews];
}

- (BOOL)isReusable
{
  return 0;
}

- (BOOL)isTOCContent
{
  return 1;
}

- (BOOL)contentNeedsFilter
{
  v2 = [(BKCoverContentViewController2 *)self coverImage];

  return v2 == 0;
}

- (int64_t)ordinal
{
  return -102;
}

- (id)currentLocation
{
  v2 = [[BKLocation alloc] initWithOrdinal:-101];

  return v2;
}

- (BOOL)isAnnotationVisible:(id)a3
{
  return 0;
}

- (CGRect)cachedRectForAnnotation:(id)a3
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)cachedVisibleRectForAnnotation:(id)a3
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCoverImage:(id)a3 isUndesirable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    objc_super v10 = [(BKContentViewController *)self configuration];
    [v10 layoutSize];

    v9 = [(BKContentViewController *)self book];
    v11 = [v9 pageProgressionDirection];
    [v11 isEqualToString:AEHelperStringMetadataPageProgressionRightToLeftValue];

    v12 = [v9 bookLanguage];
    v13 = [v9 coverWritingModeString];
    [v13 imIsVerticalWritingMode];
    BKGenericBookCoverLayoutFromLanguageAndVerticality();

    v14 = +[UIScreen mainScreen];
    [v14 scale];

    CGSizeScale();
    v15 = [v9 genericCoverTemplate];
    int v16 = BKGenericBookCoverTemplateNameValid();

    v17 = [v9 shortBookTitle];
    v18 = [v9 bookAuthor];
    if (v16)
    {
      v19 = [v9 genericCoverTemplate];
      uint64_t ImageWithTemplate = BKGenericBookCoverCreateImageWithTemplate();
    }
    else
    {
      v19 = [v9 databaseKey];
      uint64_t ImageWithTemplate = BKGenericBookCoverCreateImageWithItemIDAndLayout();
    }
    v21 = (const void *)ImageWithTemplate;

    if (v21)
    {
      id v26 = +[UIImage imageWithCGImage:v21];
      CFRelease(v21);
      if (!v4) {
        goto LABEL_13;
      }
    }
    else
    {
      id v26 = 0;
      if (!v4)
      {
LABEL_13:

        goto LABEL_14;
      }
    }
    v22 = [(BKContentViewController *)self book];
    v23 = [v22 embeddedArtHrefRejected];

    if (!v23)
    {
      v24 = [(BKContentViewController *)self book];
      [v24 setEmbeddedArtHrefRejected:&__kCFBooleanTrue];
    }
    goto LABEL_13;
  }
  id v26 = v6;
  v7 = [(BKContentViewController *)self book];
  id v8 = [v7 embeddedArtHrefRejected];

  if (v8) {
    goto LABEL_15;
  }
  v9 = [(BKContentViewController *)self book];
  [v9 setEmbeddedArtHrefRejected:&__kCFBooleanFalse];
LABEL_14:

LABEL_15:
  v25 = [(BKCoverContentViewController2 *)self coverImage];
  [v25 setImage:v26];

  [(BKContentViewController *)self contentReady];
}

- (void)loadViewUIImage
{
  v3 = [(BKCoverContentViewController2 *)self coverImage];

  if (!v3)
  {
    id v4 = objc_alloc((Class)UIImageView);
    dispatch_queue_t v5 = [(BKCoverContentViewController2 *)self view];
    [v5 bounds];
    id v6 = [v4 initWithFrame:];
    [(BKCoverContentViewController2 *)self setCoverImage:v6];
  }
  v7 = +[UIColor clearColor];
  id v8 = [(BKCoverContentViewController2 *)self coverImage];
  [v8 setBackgroundColor:v7];

  v9 = [(BKCoverContentViewController2 *)self coverImage];
  [v9 setOpaque:0];

  objc_super v10 = [(BKCoverContentViewController2 *)self coverImage];
  [v10 setContentMode:1];

  v11 = [(BKCoverContentViewController2 *)self coverImage];
  [v11 setAutoresizingMask:18];

  v12 = [(BKCoverContentViewController2 *)self view];
  v13 = [(BKCoverContentViewController2 *)self coverImage];
  [v12 addSubview:v13];

  v14 = [(BKCoverContentViewController2 *)self _getURLToLoad];
  objc_initWeak(&location, self);
  dispatchQueue = self->_dispatchQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_3CBE0;
  v17[3] = &unk_1DB7B0;
  objc_copyWeak(&v20, &location);
  id v18 = v14;
  v19 = self;
  id v16 = v14;
  dispatch_async(dispatchQueue, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (id)_getURLToLoad
{
  v3 = [(BKContentViewController *)self book];
  id v4 = [v3 embeddedArtHrefMinusSubpath];

  dispatch_queue_t v5 = [(BKContentViewController *)self book];
  id v6 = [v5 baseURL];

  v7 = 0;
  if (v4 && v6)
  {
    id v8 = +[NSURL URLWithString:v4 relativeToURL:v6];
    v7 = BEURLHandleriBooksImgUrlFromiBooksURL();
  }

  return v7;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKCoverContentViewController2 *)self setActivityIndicatorVisible:0 animated:a3 afterDelay:0.0];
  v5.receiver = self;
  v5.super_class = (Class)BKCoverContentViewController2;
  [(BKContentViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidLoad
{
  v58.receiver = self;
  v58.super_class = (Class)BKCoverContentViewController2;
  [(BKContentViewController *)&v58 viewDidLoad];
  BOOL v3 = [(BKCoverContentViewController2 *)self _getURLToLoad];
  id v4 = [BKActivityIndicatorOverlayView alloc];
  objc_super v5 = [(BKCoverContentViewController2 *)self theme];
  id v6 = [v5 contentTextColor];
  v7 = [v6 colorWithAlphaComponent:0.7];
  id v8 = [(BKCoverContentViewController2 *)self theme];
  v9 = [v8 backgroundColorForTraitEnvironment:self];
  objc_super v10 = [(BKActivityIndicatorOverlayView *)v4 initWithBackgroundColor:v7 foregroundColor:v9];
  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v10;

  if (v3 && !BEDoesURLPointToAnImageFile())
  {
    v12 = [(BKContentViewController *)self configuration];
    [v12 layoutSize];
    double v14 = v13;

    v15 = [(BKContentViewController *)self book];
    id v16 = objc_alloc((Class)BEWebViewFactoryPaginationOptions);
    id v17 = [v15 obeyPageBreaks];
    id v18 = [(BKContentViewController *)self configuration];
    [v18 gutterWidth];
    id v55 = [v16 initWithMode:0 usePaginationLineGrid:0 respectPageBreaks:v17 isHorizontalScroll:0 contentLayoutSize:CGSizeZero.width gapBetweenPages:[v15 shouldAllowRemoteInspection] viewportWidth:CGSizeZero.height fixedLayoutSize:v19 pageLength:v14 fontSize:CGSizeZero.width developerExtrasEnabled:0.0];

    id v20 = objc_alloc((Class)BECFIUtilitiesJSOptions);
    v56 = v15;
    v21 = [v15 assetID];
    int64_t v22 = [(BKCoverContentViewController2 *)self ordinal];
    v23 = [v15 spineIndexInPackage];
    id v54 = [v20 initWithManifestId:0 assetId:v21 chapterIndex:v22 spineIndex:[v23 unsignedIntegerValue]];

    v24 = [(BKCoverContentViewController2 *)self view];
    [v24 bounds];
    double v26 = v25;
    v27 = [(BKCoverContentViewController2 *)self view];
    [v27 bounds];
    double v29 = v28;
    v30 = [(BKContentViewController *)self book];
    v31 = [v30 assetID];
    v32 = [(BKContentViewController *)self book];
    [v32 cacheItem];
    v33 = v57 = v3;
    +[BEWebViewFactory viewConfiguredForCoverContent:bookID:protocolCacheItem:paginationOptions:cfiOptions:](BEWebViewFactory, "viewConfiguredForCoverContent:bookID:protocolCacheItem:paginationOptions:cfiOptions:", v31, v33, v55, v54, 0.0, 0.0, v26, v29);
    v34 = (WKWebView *)objc_claimAutoreleasedReturnValue();
    coverWebView = self->_coverWebView;
    self->_coverWebView = v34;

    v36 = [(WKWebView *)self->_coverWebView be_navigationHandler];
    [v36 setDelegate:self];

    [(WKWebView *)self->_coverWebView setTranslatesAutoresizingMaskIntoConstraints:0];
    v37 = [(BKCoverContentViewController2 *)self view];
    [v37 addSubview:self->_coverWebView];
    v53 = [(WKWebView *)self->_coverWebView leftAnchor];
    v52 = [v37 leftAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v59[0] = v51;
    v50 = [(WKWebView *)self->_coverWebView rightAnchor];
    v49 = [v37 rightAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v59[1] = v48;
    v38 = [(WKWebView *)self->_coverWebView topAnchor];
    v39 = [v37 topAnchor];
    v40 = [v38 constraintEqualToAnchor:v39];
    v59[2] = v40;
    v41 = [(WKWebView *)self->_coverWebView bottomAnchor];
    v42 = [v37 bottomAnchor];
    v43 = [v41 constraintEqualToAnchor:v42];
    v59[3] = v43;
    v44 = +[NSArray arrayWithObjects:v59 count:4];
    +[NSLayoutConstraint activateConstraints:v44];

    BOOL v3 = v57;
    v45 = self->_coverWebView;
    v46 = +[NSURLRequest requestWithURL:v57];
    id v47 = [(WKWebView *)v45 loadRequest:v46];
  }
  else
  {
    [(BKCoverContentViewController2 *)self loadViewUIImage];
  }
}

- (void)_forceWebContentBackgroundColor
{
  BOOL v3 = [(BKCoverContentViewController2 *)self themePage];
  id v4 = [(BKCoverContentViewController2 *)self view];
  objc_super v5 = [v3 backgroundColorForTraitEnvironment:v4];
  [v5 bc_rgbaHexValue];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = +[NSString stringWithFormat:@"document.body.style.backgroundColor = \"#%@\"", v8];
  v7 = [(BKCoverContentViewController2 *)self coverWebView];
  [v7 evaluateJavaScript:v6 completionHandler:0];
}

- (void)setTheme:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKCoverContentViewController2;
  [(BKContentViewController *)&v4 setTheme:a3];
  [(BKCoverContentViewController2 *)self _forceWebContentBackgroundColor];
}

- (void)setActivityIndicatorVisible:(BOOL)a3 animated:(BOOL)a4 afterDelay:(double)a5
{
  BOOL v6 = a4;
  activityIndicator = self->_activityIndicator;
  if (a3)
  {
    id v9 = [(BKCoverContentViewController2 *)self view];
    [(BKActivityIndicatorOverlayView *)activityIndicator showIndicatorCenteredInView:v9 animated:v6 animationDelay:a5];
  }
  else
  {
    id v8 = self->_activityIndicator;
    -[BKActivityIndicatorOverlayView hideIndicatorAnimated:animationDelay:](v8, "hideIndicatorAnimated:animationDelay:", a4);
  }
}

- (void)startActivityIndicatorAfterDelay:(double)a3
{
}

- (void)stopActivityIndicator:(BOOL)a3
{
}

- (void)navigationHandler:(id)a3 didStartLoadOfURL:(id)a4
{
}

- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4
{
  -[BKCoverContentViewController2 stopActivityIndicator:](self, "stopActivityIndicator:", 1, a4);

  [(BKCoverContentViewController2 *)self _forceWebContentBackgroundColor];
}

- (void)navigationHandler:(id)a3 failedToLoadURL:(id)a4 error:(id)a5
{
}

- (UIImageView)coverImage
{
  return self->_coverImage;
}

- (void)setCoverImage:(id)a3
{
}

- (WKWebView)coverWebView
{
  return self->_coverWebView;
}

- (void)setCoverWebView:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BKActivityIndicatorOverlayView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_coverWebView, 0);

  objc_storeStrong((id *)&self->_coverImage, 0);
}

@end
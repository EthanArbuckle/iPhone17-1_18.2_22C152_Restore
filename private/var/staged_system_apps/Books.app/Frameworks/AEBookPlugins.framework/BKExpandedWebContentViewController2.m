@interface BKExpandedWebContentViewController2
+ (BOOL)supportsResource:(id)a3;
- (BEContentCleanupJSOptions)cleanupOptions;
- (BKExpandedWebContentViewController2)initWithResource:(id)a3;
- (BOOL)allowsRemoteInspection;
- (BOOL)imageFilteringEnabled;
- (BOOL)isLoadHTMLString;
- (BOOL)navigationHandler:(id)a3 handleInternalLoadRequest:(id)a4;
- (BOOL)showOriginal;
- (BOOL)wantsDoubleTapGestureRecognizer;
- (BOOL)wantsTapToHideToolbarGestureRecognizer;
- (NSString)content;
- (NSString)contentType;
- (NSURL)url;
- (WKWebView)webView;
- (double)_viewportWidth;
- (id)_stylesheetSet;
- (id)_titleForPage;
- (id)_urlToLoad;
- (id)contentView;
- (id)leftToolbarItems;
- (id)previewCssTemplate;
- (void)_applyImageFilter:(BOOL)a3;
- (void)_invert:(id)a3;
- (void)_prepareImageShowOriginal:(BOOL)a3;
- (void)_swapImageProtocols;
- (void)_updateContent;
- (void)_updateMetaViewportArguments;
- (void)handler:(id)a3 presentAlertController:(id)a4 completion:(id)a5;
- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4;
- (void)navigationHandler:(id)a3 didStartLoadOfURL:(id)a4;
- (void)navigationHandler:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5;
- (void)navigationHandler:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4;
- (void)navigationHandler:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)releaseViews;
- (void)setAllowsRemoteInspection:(BOOL)a3;
- (void)setCleanupOptions:(id)a3;
- (void)setContent:(id)a3;
- (void)setContentType:(id)a3;
- (void)setImageFilteringEnabled:(BOOL)a3;
- (void)setIsLoadHTMLString:(BOOL)a3;
- (void)setShowOriginal:(BOOL)a3;
- (void)setUrl:(id)a3;
- (void)setWebView:(id)a3;
- (void)showInvertedImage;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKExpandedWebContentViewController2

+ (BOOL)supportsResource:(id)a3
{
  v3 = [a3 resource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BKExpandedWebContentViewController2)initWithResource:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKExpandedWebContentViewController2;
  v5 = [(BKExpandedContentViewController *)&v12 initWithResource:v4];
  v6 = v5;
  if (v5)
  {
    v5->_showOriginal = 1;
    v7 = [v4 resource];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = v7;
      url = v6->_url;
      v6->_url = v8;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_7:

        goto LABEL_8;
      }
      objc_storeStrong((id *)&v6->_content, v7);
      uint64_t v10 = [v4 contentType];
      url = (NSURL *)v6->_contentType;
      v6->_contentType = (NSString *)v10;
    }

    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)BKExpandedWebContentViewController2;
  [(BKExpandedContentViewController *)&v3 viewDidLoad];
  [(BKExpandedWebContentViewController2 *)self setModalPresentationStyle:4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKExpandedWebContentViewController2;
  [(BKExpandedContentViewController *)&v6 viewDidAppear:a3];
  id v4 = [(BKExpandedWebContentViewController2 *)self webView];
  v5 = [v4 scrollView];
  [v5 flashScrollIndicators];

  [(BKExpandedWebContentViewController2 *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8 = [(BKExpandedWebContentViewController2 *)self view];
  [v8 setNeedsUpdateConstraints];

  v9.receiver = self;
  v9.super_class = (Class)BKExpandedWebContentViewController2;
  -[BKExpandedWebContentViewController2 viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
}

- (void)releaseViews
{
  v4.receiver = self;
  v4.super_class = (Class)BKExpandedWebContentViewController2;
  [(BKExpandedContentViewController *)&v4 releaseViews];
  objc_super v3 = [(BKExpandedWebContentViewController2 *)self webView];
  [v3 removeObserver:self forKeyPath:@"title" context:off_2299F0];

  [(BKExpandedWebContentViewController2 *)self setWebView:0];
}

- (BOOL)wantsDoubleTapGestureRecognizer
{
  return 0;
}

- (BOOL)wantsTapToHideToolbarGestureRecognizer
{
  return 0;
}

- (id)contentView
{
  webView = self->_webView;
  if (!webView)
  {
    objc_super v4 = [(BKExpandedContentViewController *)self resource];
    v5 = [(BKExpandedWebContentViewController2 *)self view];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    BOOL v14 = [(BKExpandedWebContentViewController2 *)self allowsRemoteInspection];
    v15 = [v4 bookID];
    v28 = v4;
    BOOL imageFilteringEnabled = self->_imageFilteringEnabled;
    v17 = [v4 cacheItem];
    v18 = [(BKExpandedWebContentViewController2 *)self cleanupOptions];
    v19 = [(BKExpandedWebContentViewController2 *)self _stylesheetSet];
    +[BEWebViewFactory viewConfiguredForPreview:enableDeveloperExtras:bookID:imageFilterMode:protocolCacheItem:cleanupOptions:stylesheetSet:](BEWebViewFactory, "viewConfiguredForPreview:enableDeveloperExtras:bookID:imageFilterMode:protocolCacheItem:cleanupOptions:stylesheetSet:", v14, v15, imageFilteringEnabled, v17, v18, v19, v7, v9, v11, v13);
    v20 = (WKWebView *)objc_claimAutoreleasedReturnValue();
    v21 = self->_webView;
    self->_webView = v20;

    [(WKWebView *)self->_webView setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = +[UIColor clearColor];
    [(WKWebView *)self->_webView setBackgroundColor:v22];

    [(WKWebView *)self->_webView setOpaque:0];
    v23 = [(WKWebView *)self->_webView be_navigationHandler];
    [v23 setDelegate:self];

    v24 = [(WKWebView *)self->_webView be_uiHandler];
    [v24 setDelegate:self];

    [(WKWebView *)self->_webView addObserver:self forKeyPath:@"title" options:0 context:off_2299F0];
    if (self->_imageFilteringEnabled) {
      [(BKExpandedWebContentViewController2 *)self _swapImageProtocols];
    }
    v25 = [(WKWebView *)self->_webView scrollView];
    [v25 _setShowsBackgroundShadow:0];
    [v25 setShowsHorizontalScrollIndicator:0];
    v26 = +[UIColor clearColor];
    [v25 setBackgroundColor:v26];

    [v25 setOpaque:0];
    [(BKExpandedWebContentViewController2 *)self _updateMetaViewportArguments];
    [(BKExpandedWebContentViewController2 *)self _updateContent];
    [(BKExpandedContentViewController *)self setInnerView:self->_webView];

    webView = self->_webView;
  }

  return webView;
}

- (void)_swapImageProtocols
{
  id v3 = [(BKExpandedWebContentViewController2 *)self webView];
  v2 = +[BEContentSupportJS javascriptForSwappingAllImages];
  [v3 evaluateJavaScript:v2 completionHandler:&stru_1DCB20];
}

- (id)leftToolbarItems
{
  if (self->_imageFilteringEnabled)
  {
    id v3 = BookEPUBBundle();
    objc_super v4 = [v3 localizedStringForKey:@"Invert" value:&stru_1DF0D8 table:0];

    id v5 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v4 style:0 target:self action:"_invert:"];
    id v8 = v5;
    double v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (void)_invert:(id)a3
{
}

- (void)showInvertedImage
{
  self->_BOOL imageFilteringEnabled = 1;
  self->_showOriginal = 0;
}

- (void)_prepareImageShowOriginal:(BOOL)a3
{
  if (self->_imageFilteringEnabled && self->_showOriginal != a3)
  {
    self->_showOriginal = a3;
    [(BKExpandedWebContentViewController2 *)self _applyImageFilter:!a3];
  }
}

- (void)_applyImageFilter:(BOOL)a3
{
  objc_super v4 = +[NSNumber numberWithUnsignedInteger:a3];
  id v5 = [v4 stringValue];
  id v7 = +[NSString stringWithFormat:@"__ibooks_image_filter.refetchVisibleImages(%@)", v5];

  double v6 = [(BKExpandedWebContentViewController2 *)self webView];
  [v6 evaluateJavaScript:v7 completionHandler:&stru_1DCB40];
}

- (BEContentCleanupJSOptions)cleanupOptions
{
  cleanupOptions = self->_cleanupOptions;
  if (!cleanupOptions)
  {
    objc_super v4 = +[BEContentCleanupJSOptions expandedContentOptions];
    id v5 = self->_cleanupOptions;
    self->_cleanupOptions = v4;

    cleanupOptions = self->_cleanupOptions;
  }

  return cleanupOptions;
}

- (id)previewCssTemplate
{
  uint64_t v4 = 0;
  +[AEMinimalTemplate templateWithString:error:](AEMinimalTemplate, "templateWithString:error:", @"{{if contentBackgroundColor}}\n:root, body {\n    background-color: {{.contentBackgroundColor.bc_rgbaString}} !important;\n}\n{{end contentBackgroundColor}}\n\n{{if contentColor}}\n\n:root * {\n    color: {{.contentColor.bc_rgbaString}} !important;\n}\n\n:root svg|text {\n    fill: {{.contentColor.bc_rgbaString}} !important;\n    stroke: none !important;\n}\n\n{{end contentColor}}\n\n* {\n    -webkit-user-select: none;\n    -webkit-touch-callout: none;\n}",
  v2 = &v4);

  return v2;
}

- (id)_stylesheetSet
{
  id v3 = [(BKExpandedWebContentViewController2 *)self theme];
  uint64_t v4 = [v3 backgroundColorForTraitEnvironment:self];

  id v5 = +[NSMutableDictionary dictionary];
  [v5 setObject:v4 forKey:@"contentBackgroundColor"];
  double v6 = [(BKExpandedWebContentViewController2 *)self theme];
  id v7 = [v6 contentTextColor];
  [v5 setObject:v7 forKey:@"contentColor"];

  id v8 = [(BKExpandedWebContentViewController2 *)self theme];
  double v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 shouldInvertContent]);
  [v5 setObject:v9 forKey:@"shouldInvertContent"];

  double v10 = [(BKExpandedWebContentViewController2 *)self previewCssTemplate];
  double v11 = [v10 evaluateWithData:v5 error:0];

  id v12 = objc_alloc((Class)BEWebViewFactoryStylesheetSet);
  if ([v11 length])
  {
    v16 = v11;
    double v13 = +[NSArray arrayWithObjects:&v16 count:1];
    id v14 = [v12 initWithAllFrameStylesheets:v13];
  }
  else
  {
    id v14 = [v12 initWithAllFrameStylesheets:&__NSArray0__struct];
  }

  return v14;
}

- (id)_urlToLoad
{
  v2 = [(BKExpandedWebContentViewController2 *)self url];
  id v3 = BEURLHandleriBooksImgUrlFromiBooksURL();

  return v3;
}

- (void)_updateContent
{
  id v14 = [(BKExpandedWebContentViewController2 *)self _titleForPage];
  -[BKExpandedContentViewController setPreviewTitle:](self, "setPreviewTitle:");
  id v3 = [(BKExpandedWebContentViewController2 *)self content];

  if (v3)
  {
    uint64_t v4 = [(BKExpandedWebContentViewController2 *)self content];
    id v5 = [v4 dataUsingEncoding:4];

    webView = self->_webView;
    id v7 = [(BKExpandedWebContentViewController2 *)self contentType];
    uint64_t v8 = BEUTF8StringEncodingName;
    double v9 = [(BKExpandedContentViewController *)self resource];
    double v10 = [v9 sourceURL];
    id v11 = [(WKWebView *)webView loadData:v5 MIMEType:v7 characterEncodingName:v8 baseURL:v10];
  }
  else
  {
    id v12 = self->_webView;
    id v5 = [(BKExpandedWebContentViewController2 *)self _urlToLoad];
    id v7 = +[NSURLRequest requestWithURL:v5];
    id v13 = [(WKWebView *)v12 loadRequest:v7];
  }
}

- (double)_viewportWidth
{
  v2 = [(BKExpandedContentViewController *)self resource];
  [v2 contentSize];
  if (v3 <= 0.0)
  {
    double v4 = 980.0;
  }
  else
  {
    double v4 = v3;
    [v2 zoomScale];
    if (v5 != 0.0)
    {
      [v2 zoomScale];
      double v4 = v4 * v6;
    }
  }

  return v4;
}

- (void)_updateMetaViewportArguments
{
  [(BKExpandedWebContentViewController2 *)self _viewportWidth];
  webView = self->_webView;
  v7[0] = @"width";
  double v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  double v5 = [v4 stringValue];
  v8[0] = v5;
  v8[1] = @"10";
  v7[1] = @"maximum-scale";
  v7[2] = @"minimum-scale";
  v7[3] = @"shrink-to-fit";
  v8[2] = @"0.35";
  v8[3] = @"yes";
  double v6 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  [(WKWebView *)webView _overrideViewportWithArguments:v6];
}

- (id)_titleForPage
{
  double v3 = [(WKWebView *)self->_webView title];
  if (![v3 length])
  {
    double v4 = [(BKExpandedContentViewController *)self resource];
    uint64_t v5 = [v4 title];

    double v3 = (void *)v5;
  }
  double v6 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v7 = [v3 stringByTrimmingCharactersInSet:v6];

  if (![v7 length])
  {
    uint64_t v8 = [(BKExpandedWebContentViewController2 *)self _urlToLoad];
    double v9 = [v8 lastPathComponent];

    if (![v9 length])
    {
      double v10 = [(BKExpandedContentViewController *)self resource];
      id v11 = [v10 sourceURL];
      uint64_t v12 = [v11 lastPathComponent];

      double v9 = (void *)v12;
    }
    id v13 = [v9 stringByDeletingPathExtension];

    id v7 = [v13 capitalizedString];
  }

  return v7;
}

- (void)navigationHandler:(id)a3 didStartLoadOfURL:(id)a4
{
}

- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4
{
  id v12 = [(BKExpandedContentViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v12 expandedContentViewDidFinishLoad:self];
  }
  [(BKExpandedWebContentViewController2 *)self _viewportWidth];
  double v6 = v5 * 0.95;
  id v7 = [(BKExpandedWebContentViewController2 *)self cleanupOptions];
  uint64_t v8 = +[BEContentCleanupJS updateScriptWithOptions:v7 pageLength:v6 gapBetweenPages:0.0];

  double v9 = [(BKExpandedWebContentViewController2 *)self webView];
  [v9 evaluateJavaScript:v8 completionHandler:&stru_1DCB60];

  double v10 = [(BKExpandedWebContentViewController2 *)self webView];
  id v11 = [v10 scrollView];
  [v11 flashScrollIndicators];

  [(BKExpandedContentViewController *)self stopActivityIndicator:1];
}

- (void)navigationHandler:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  double v9 = [(BKExpandedContentViewController *)self delegate];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_8A2BC;
  v11[3] = &unk_1DCB88;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 expandedContentViewController:self handleUserRequestForFrameToLoadExternalURL:v8 completion:v11];
}

- (void)navigationHandler:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [(BKExpandedContentViewController *)self delegate];
  [v8 expandedContentViewController:self handleExternalLoadRequest:v7 likelyUserInitiated:v5];
}

- (BOOL)navigationHandler:(id)a3 handleInternalLoadRequest:(id)a4
{
  BOOL v5 = [a4 absoluteURL:a3];
  double v6 = [(BKExpandedContentViewController *)self resource];
  id v7 = [v6 sourceURL];
  if (objc_msgSend(v5, "be_isEquivalentToURL:ignoringFragment:", v7, 1))
  {

    unsigned __int8 v8 = 1;
LABEL_5:

    goto LABEL_6;
  }
  double v9 = [(BKExpandedWebContentViewController2 *)self _urlToLoad];
  unsigned __int8 v8 = 1;
  unsigned __int8 v10 = [v5 be_isEquivalentToURL:v9 ignoringFragment:1];

  if ((v10 & 1) == 0)
  {
    double v6 = [(BKExpandedContentViewController *)self delegate];
    unsigned __int8 v8 = [v6 expandedContentViewController:self handleInternalLoadRequest:v5];
    goto LABEL_5;
  }
LABEL_6:

  return v8;
}

- (void)navigationHandler:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4
{
  id v5 = a4;
  id v6 = [(BKExpandedContentViewController *)self delegate];
  [v6 expandedContentViewController:self handleInternalLoadRequestForNewWindow:v5];
}

- (void)handler:(id)a3 presentAlertController:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(BKExpandedContentViewController *)self delegate];
  [v9 expandedContentViewController:self presentAlertController:v8 completion:v7];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_2299F0 == a6)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_8A75C;
    block[3] = &unk_1DC8D8;
    objc_copyWeak(&v8, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)BKExpandedWebContentViewController2;
    -[BKExpandedWebContentViewController2 observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (BOOL)allowsRemoteInspection
{
  return self->_allowsRemoteInspection;
}

- (void)setAllowsRemoteInspection:(BOOL)a3
{
  self->_allowsRemoteInspection = a3;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (BOOL)isLoadHTMLString
{
  return self->_isLoadHTMLString;
}

- (void)setIsLoadHTMLString:(BOOL)a3
{
  self->_isLoadHTMLString = a3;
}

- (void)setCleanupOptions:(id)a3
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

- (BOOL)imageFilteringEnabled
{
  return self->_imageFilteringEnabled;
}

- (void)setImageFilteringEnabled:(BOOL)a3
{
  self->_BOOL imageFilteringEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cleanupOptions, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_webView, 0);
}

@end
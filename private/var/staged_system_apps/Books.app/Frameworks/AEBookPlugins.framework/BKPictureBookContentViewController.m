@interface BKPictureBookContentViewController
- (BOOL)alreadyRevealed;
- (BOOL)didFinishLoading;
- (BOOL)didFinishRendering;
- (BOOL)isAnnotationVisible:(id)a3;
- (id)URLForLoadingDocument;
- (id)highlightViewContainerWK2;
- (id)predicateForOverlayCache;
- (id)stylesheetSet;
- (int64_t)totalPages;
- (void)_readyToShow;
- (void)_revealImmediateTimeout;
- (void)_sendContentInfoRequestToLoadMediaFrames;
- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4;
- (void)navigationHandlerFirstSignificantPaintCompleted:(id)a3;
- (void)setAlreadyRevealed:(BOOL)a3;
- (void)setDidFinishLoading:(BOOL)a3;
- (void)setDidFinishRendering:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKPictureBookContentViewController

- (void)viewDidLoad
{
  v3 = [(BKContentViewController *)self book];
  v49 = [(BKContentViewController *)self document];
  [v49 fixedLayoutSize];
  double v5 = v4;
  double v7 = v6;
  [v49 estimatedFixedLayoutViewFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v48 = [(BKPictureBookContentViewController *)self view];
  [v48 setFrame:v9, v11, v13, v15];
  v16 = +[UIColor whiteColor];
  [v48 setBackgroundColor:v16];

  v47 = +[AEBookInfoSnapshot aeBookInfoSnapshotFromBookInfo:v3 ordinal:[(BKContentViewController *)self ordinal]];
  v17 = [v3 bookLanguage];
  v18 = +[BEContentCleanupJSOptions fixedLayoutOptionsWithLanguage:v17];

  id v19 = objc_alloc((Class)BECFIUtilitiesJSOptions);
  v20 = [(BKContentViewController *)self document];
  v21 = [v20 manifestId];
  v22 = [v3 assetID];
  int64_t v23 = [(BKContentViewController *)self ordinal];
  v24 = [v3 spineIndexInPackage];
  id v25 = [v19 initWithManifestId:v21 assetId:v22 chapterIndex:v23 spineIndex:[v24 unsignedIntegerValue]];

  v26 = +[BEWebViewFactoryPaginationOptions paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:](BEWebViewFactoryPaginationOptions, "paginationOptionsForBookInfoSnapshot:withConfiguration:contentLayoutSize:", v47, 0, v5, v7);
  v27 = [v3 cacheItem];
  v28 = [(BKPictureBookContentViewController *)self stylesheetSet];
  +[BEWebViewFactory viewConfiguredForPictureBooks:fixedLayoutSize:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:](BEWebViewFactory, "viewConfiguredForPictureBooks:fixedLayoutSize:protocolCacheItem:paginationOptions:cleanupOptions:cfiOptions:stylesheetSet:", v27, v26, v18, v25, v28, v9, v11, v13, v15, v5, v7);
  v29 = (WKWebView *)objc_claimAutoreleasedReturnValue();
  webView2 = self->super._webView2;
  self->super._webView2 = v29;

  [(WKWebView *)self->super._webView2 setAutoresizingMask:18];
  [(WKWebView *)self->super._webView2 setOpaque:0];
  -[WKWebView setFrame:](self->super._webView2, "setFrame:", v9, v11, v13, v15);
  v31 = [(WKWebView *)self->super._webView2 be_navigationHandler];
  [v31 setDelegate:self];

  v32 = [(WKWebView *)self->super._webView2 be_uiHandler];
  [v32 setDelegate:self];

  v33 = [(WKWebView *)self->super._webView2 configuration];
  v34 = [v33 userContentController];
  [(BKHTMLContentViewController *)self registerScriptMessageHandlersWithUserContentController:v34];

  v35 = self->super._webView2;
  v36 = [(BKContentViewController *)self book];
  v37 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v36 isFixedLayout]);
  v38 = [(WKWebView *)v35 be_updateAXValueForMessage:v37];
  [(WKWebView *)v35 be_updateAXCurrentReadingStateWithMessage:@"BEWebProcessPluginBookLayoutParameterKey" forValue:v38];

  v39 = self->super._webView2;
  if ([(BKContentViewController *)self pageProgressionDirection] == 1) {
    v40 = &__kCFBooleanTrue;
  }
  else {
    v40 = &__kCFBooleanFalse;
  }
  v41 = [(WKWebView *)v39 be_updateAXValueForMessage:v40];
  [(WKWebView *)v39 be_updateAXCurrentReadingStateWithMessage:@"BEWebProcessPluginRTLParameterKey" forValue:v41];

  [v48 addSubview:self->super._webView2];
  v42 = [[BKWK2WebViewLoader alloc] initWithPaginationOptions:v26 ordinal:[(BKContentViewController *)self ordinal]];
  [(BKHTMLContentViewController *)self setLoader:v42];

  v43 = [(BKHTMLContentViewController *)self loader];
  v44 = [(BKHTMLContentViewController *)self webViewProxy];
  [v44 setLoader:v43];

  v45 = self->super._webView2;
  v46 = [(BKHTMLContentViewController *)self loader];
  [v46 setWebView:v45];

  v50.receiver = self;
  v50.super_class = (Class)BKPictureBookContentViewController;
  [(BKHTMLContentViewController *)&v50 viewDidLoad];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKPictureBookContentViewController;
  [(BKHTMLContentViewController *)&v5 viewWillDisappear:a3];
  double v4 = [(BKContentViewController *)self delegate];
  [v4 cancelPreloadForContent:self];
}

- (int64_t)totalPages
{
  return 1;
}

- (id)URLForLoadingDocument
{
  book = self->super.super._book;
  v3 = [(BKContentViewController *)self document];
  double v4 = [(AEBookInfo *)book urlForDocument:v3];

  objc_super v5 = BEURLHandleriBooksImgUrlFromiBooksURL();

  return v5;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)BKPictureBookContentViewController;
  id v7 = a4;
  -[BKHTMLContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_6E40;
  v8[3] = &unk_1DAA18;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (id)predicateForOverlayCache
{
  return +[NSPredicate predicateWithFormat:@"annotationType == %d", 2];
}

- (id)highlightViewContainerWK2
{
  return [(WKWebView *)self->super._webView2 _viewForFindUI];
}

- (id)stylesheetSet
{
  v2 = [(BKContentViewController *)self book];
  v3 = +[ContentViewStyleManager getPictureBookUserStyleSheetWithLegacyBook:](ContentViewStyleManager, "getPictureBookUserStyleSheetWithLegacyBook:", [v2 shouldDisableOptimizeSpeed] ^ 1);

  if (![v3 length]) {
    BCReportAssertionFailureWithMessage();
  }
  id v4 = objc_alloc((Class)BEWebViewFactoryStylesheetSet);
  double v8 = v3;
  objc_super v5 = +[NSArray arrayWithObjects:&v8 count:1];
  id v6 = [v4 initWithAllFrameStylesheets:v5];

  return v6;
}

- (BOOL)isAnnotationVisible:(id)a3
{
  id v4 = [a3 location];
  LOBYTE(self) = [(BKHTMLContentViewController *)self isLocationOnCurrentPage:v4];

  return (char)self;
}

- (void)_readyToShow
{
  if (![(BKPictureBookContentViewController *)self alreadyRevealed])
  {
    [(BKPictureBookContentViewController *)self setAlreadyRevealed:1];
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_revealImmediateTimeout" object:0];
    [(BKHTMLContentViewController *)self contentReady];
  }
}

- (void)navigationHandlerFirstSignificantPaintCompleted:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKPictureBookContentViewController;
  [(BKHTMLContentViewController *)&v4 navigationHandlerFirstSignificantPaintCompleted:a3];
  [(BKPictureBookContentViewController *)self setDidFinishRendering:1];
  if ([(BKPictureBookContentViewController *)self didFinishLoading]) {
    [(BKPictureBookContentViewController *)self _readyToShow];
  }
}

- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKPictureBookContentViewController;
  [(BKHTMLContentViewController *)&v14 navigationHandler:v6 didFinishLoadOfURL:v7];
  [(BKPictureBookContentViewController *)self setDidFinishLoading:1];
  objc_initWeak(&location, self);
  [(BKPictureBookContentViewController *)self performSelector:"_revealImmediateTimeout" withObject:0 afterDelay:2.0];
  double v8 = self->super._webView2;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_722C;
  v10[3] = &unk_1DAA80;
  objc_super v9 = v8;
  double v11 = v9;
  objc_copyWeak(&v12, &location);
  [(WKWebView *)v9 _doAfterNextStablePresentationUpdate:v10];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

- (void)_revealImmediateTimeout
{
  if (![(BKPictureBookContentViewController *)self alreadyRevealed])
  {
    [(BKPictureBookContentViewController *)self setAlreadyRevealed:1];
    v3 = _AEWKPictureBookLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)objc_super v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "Revealing even though we never got navigationHandlerFirstSignificantPaintCompleted", v4, 2u);
    }

    [(BKHTMLContentViewController *)self contentReady];
  }
}

- (void)_sendContentInfoRequestToLoadMediaFrames
{
  id v6 = [(BKPictureBookContentViewController *)self stylesheetSet];
  v3 = +[AEBookInfoSnapshot aeBookInfoSnapshotFromBookInfo:self->super.super._book ordinal:[(BKContentViewController *)self ordinal]];
  objc_super v4 = +[BKWK2LoaderContentInfoRequest contentInfoRequestWithLocation:0 bookSnapshot:v3 ordinal:[(BKContentViewController *)self ordinal] configuration:self->super.super._configuration stylesheetSet:v6 completion:&stru_1DAAC0];
  objc_super v5 = [(BKHTMLContentViewController *)self loader];
  [v5 enqueueContentInfoRequest:v4];
}

- (BOOL)didFinishLoading
{
  return self->_didFinishLoading;
}

- (void)setDidFinishLoading:(BOOL)a3
{
  self->_didFinishLoading = a3;
}

- (BOOL)didFinishRendering
{
  return self->_didFinishRendering;
}

- (void)setDidFinishRendering:(BOOL)a3
{
  self->_didFinishRendering = a3;
}

- (BOOL)alreadyRevealed
{
  return self->_alreadyRevealed;
}

- (void)setAlreadyRevealed:(BOOL)a3
{
  self->_alreadyRevealed = a3;
}

@end
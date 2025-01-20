@interface AEPictureBookRenderingCacheOperation2
+ (id)renderCacheWithOptions:(unint64_t)a3;
- (AEBookInfoSnapshot)bookInfoSnapshot;
- (AEPaginatedBookSnapshotWebViewBuilder)webViewBuilder;
- (AEPictureBookRenderingCacheOperation2)initWithOptions:(int64_t)a3;
- (AEPictureBookRenderingCacheOperation2)strongSelf;
- (AEPictureBookRenderingPiggyBack)piggyBack;
- (BOOL)didFinishLoading;
- (BOOL)didFinishRendering;
- (CGSize)snapshotSize;
- (NSDictionary)cfisForHrefs;
- (NSDictionary)textNodeCharacterCounts;
- (NSMutableSet)extraCompletions;
- (NSURL)url;
- (OS_dispatch_semaphore)dispatchSemaphore;
- (UIImage)image;
- (WKWebView)webView;
- (id)callbackInvocationWithImage:(id)a3;
- (id)generateImage:(CGSize)a3;
- (unint64_t)pageNumber;
- (unint64_t)snapshotRetryCount;
- (void)_releaseWebView;
- (void)_snapshotPathForKey:(id *)a3 name:(id *)a4;
- (void)_takeSnapshot;
- (void)_takeSnapshotWhenReady;
- (void)_takeSnapshotWithConfiguration:(id)a3 retryOnBlank:(BOOL)a4 completionHandler:(id)a5;
- (void)_timeoutWaitingForFirstPaint;
- (void)_updateSignal;
- (void)addExtraCompletion:(id)a3;
- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4;
- (void)navigationHandler:(id)a3 failedToLoadURL:(id)a4 error:(id)a5;
- (void)navigationHandlerFirstSignificantPaintCompleted:(id)a3;
- (void)setBookInfoSnapshot:(id)a3;
- (void)setCfisForHrefs:(id)a3;
- (void)setDidFinishLoading:(BOOL)a3;
- (void)setDidFinishRendering:(BOOL)a3;
- (void)setDispatchSemaphore:(id)a3;
- (void)setExtraCompletions:(id)a3;
- (void)setImage:(id)a3;
- (void)setPageNumber:(unint64_t)a3;
- (void)setPiggyBack:(id)a3;
- (void)setSnapshotRetryCount:(unint64_t)a3;
- (void)setSnapshotSize:(CGSize)a3;
- (void)setStrongSelf:(id)a3;
- (void)setTextNodeCharacterCounts:(id)a3;
- (void)setUrl:(id)a3;
- (void)setWebView:(id)a3;
- (void)setWebViewBuilder:(id)a3;
- (void)setupWebView;
@end

@implementation AEPictureBookRenderingCacheOperation2

+ (id)renderCacheWithOptions:(unint64_t)a3
{
  v3 = [[AEPictureBookRenderingCacheOperation2 alloc] initWithOptions:a3];

  return v3;
}

- (AEPictureBookRenderingCacheOperation2)initWithOptions:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AEPictureBookRenderingCacheOperation2;
  result = [(AEPictureBookRenderingCacheOperation2 *)&v4 initWithOptions:a3];
  if (result) {
    result->_extraCompletionsAccessLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (id)callbackInvocationWithImage:(id)a3
{
  return [(AEPictureBookRenderingCacheOperation2 *)self renderingCacheCallbackInvocationWithImage:a3 pageNumber:self->_pageNumber];
}

- (void)setupWebView
{
  if ([(AEPictureBookRenderingCacheOperation2 *)self isCancelled])
  {
    v34 = [(AEPictureBookRenderingCacheOperation2 *)self dispatchSemaphore];
    dispatch_semaphore_signal(v34);
  }
  else
  {
    unint64_t v3 = [(AEPictureBookRenderingCacheOperation2 *)self pageNumber];
    if (!self->_webView)
    {
      [(AEPictureBookRenderingCacheOperation2 *)self desiredSize];
      double width = v4;
      double height = v6;
      v8 = [(AEPictureBookRenderingCacheOperation2 *)self bookInfoSnapshot];
      [v8 fixedLayoutSize];
      double v10 = v9;
      double v12 = v11;

      if (width / v10 < BEWebViewMinimumZoomScale)
      {
        v41.size.double width = v10 * BEWebViewMinimumZoomScale;
        v41.size.double height = v12 * BEWebViewMinimumZoomScale;
        v41.origin.x = 0.0;
        v41.origin.y = 0.0;
        CGRect v42 = CGRectIntegral(v41);
        double width = v42.size.width;
        double height = v42.size.height;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewBuilder);
      v14 = [(AEPictureBookRenderingCacheOperation2 *)self bookInfoSnapshot];
      [WeakRetained webViewForSnapshotting:v14 size:CGSizeMake(width, height)];
      v15 = (WKWebView *)objc_claimAutoreleasedReturnValue();
      webView = self->_webView;
      self->_webView = v15;

      v17 = [(WKWebView *)self->_webView be_navigationHandler];
      [v17 setDelegate:self];
    }
    id v18 = objc_loadWeakRetained((id *)&self->_piggyBack);

    if (v18)
    {
      v19 = (void *)(v3 - 1);
      v20 = [(AEPictureBookRenderingCacheOperation2 *)self bookInfoSnapshot];
      v21 = [v20 spineIndexInPackage];
      v22 = +[BECFIUtilitiesJS textNodeCharacterCountsScriptForSpineIndex:documentOrdinal:](BECFIUtilitiesJS, "textNodeCharacterCountsScriptForSpineIndex:documentOrdinal:", [v21 integerValue], v19);

      v23 = [(AEPictureBookRenderingCacheOperation2 *)self piggyBack];
      v24 = [v23 navigationInfoHrefsForOrdinal:v19];
      v25 = +[BECFIUtilitiesJS cfisForHrefsScript:v24];

      objc_initWeak(&location, self);
      v26 = [(WKWebView *)self->_webView be_navigationHandler];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_E4CC0;
      v35[3] = &unk_1DD990;
      objc_copyWeak(v38, &location);
      v38[1] = v19;
      id v27 = v25;
      id v36 = v27;
      id v28 = v22;
      id v37 = v28;
      [v26 performAfterLoadCompleteOrFailure:v35];

      objc_destroyWeak(v38);
      objc_destroyWeak(&location);
    }
    v29 = [(AEPictureBookRenderingCacheOperation2 *)self webView];
    v30 = [(AEPictureBookRenderingCacheOperation2 *)self url];
    v31 = BEURLHandleriBooksImgUrlFromiBooksURL();
    v32 = +[NSURLRequest requestWithURL:v31];
    id v33 = [v29 loadRequest:v32];
  }
}

- (void)_snapshotPathForKey:(id *)a3 name:(id *)a4
{
  if (a3 && a4)
  {
    id v13 = [(AEPictureBookRenderingCacheOperation2 *)self storageKey];
    v7 = [v13 componentsSeparatedByString:@";"];
    v8 = [v7 objectAtIndex:1];
    *a3 = +[NSString stringWithFormat:@"snap_%@", v8];

    double v9 = [(WKWebView *)self->_webView URL];
    double v10 = [v9 lastPathComponent];
    double v11 = [v10 stringByDeletingPathExtension];

    *a4 = +[NSString stringWithFormat:@"%@/dump_%@_%@_%p", *a3, v11, v13, self->_webView];
  }
  else
  {
    double v12 = _AELog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Must supply pointers for folder and name", buf, 2u);
    }

    BUAssertionFailed();
  }
}

- (id)generateImage:(CGSize)a3
{
  if ([(AEPictureBookRenderingCacheOperation2 *)self isCancelled])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(AEPictureBookRenderingCacheOperation2 *)self url];

    if (v4)
    {
      dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
      [(AEPictureBookRenderingCacheOperation2 *)self setDispatchSemaphore:v5];

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_E53CC;
      block[3] = &unk_1DAB88;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      double v6 = [(AEPictureBookRenderingCacheOperation2 *)self dispatchSemaphore];
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_E53D4;
      v16[3] = &unk_1DAB88;
      v16[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);

      unsigned __int8 v7 = [(AEPictureBookRenderingCacheOperation2 *)self isCancelled];
      v8 = 0;
      if ((v7 & 1) == 0)
      {
        v8 = [(AEPictureBookRenderingCacheOperation2 *)self image];
      }
      double v10 = _NSConcreteStackBlock;
      uint64_t v11 = 3221225472;
      double v12 = sub_E53DC;
      id v13 = &unk_1DBF08;
      v14 = self;
      id v4 = v8;
      id v15 = v4;
      os_unfair_lock_lock(&self->_extraCompletionsAccessLock);
      sub_E53DC((uint64_t)&v10);
      os_unfair_lock_unlock(&self->_extraCompletionsAccessLock);
      -[AEPictureBookRenderingCacheOperation2 setImage:](self, "setImage:", 0, v10, v11);
    }
  }

  return v4;
}

- (void)navigationHandlerFirstSignificantPaintCompleted:(id)a3
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_timeoutWaitingForFirstPaint" object:0];
  if ([(AEPictureBookRenderingCacheOperation2 *)self isCancelled])
  {
    id v4 = [(AEPictureBookRenderingCacheOperation2 *)self dispatchSemaphore];
    dispatch_semaphore_signal(v4);
  }
  else
  {
    [(AEPictureBookRenderingCacheOperation2 *)self setDidFinishRendering:1];
    if ([(AEPictureBookRenderingCacheOperation2 *)self didFinishLoading])
    {
      [(AEPictureBookRenderingCacheOperation2 *)self _takeSnapshotWhenReady];
    }
  }
}

- (void)navigationHandler:(id)a3 didFinishLoadOfURL:(id)a4
{
  if ([(AEPictureBookRenderingCacheOperation2 *)self isCancelled])
  {
    [(AEPictureBookRenderingCacheOperation2 *)self _updateSignal];
  }
  else
  {
    [(AEPictureBookRenderingCacheOperation2 *)self setDidFinishLoading:1];
    if ([(AEPictureBookRenderingCacheOperation2 *)self didFinishRendering])
    {
      [(AEPictureBookRenderingCacheOperation2 *)self _takeSnapshotWhenReady];
    }
    else
    {
      [(AEPictureBookRenderingCacheOperation2 *)self performSelector:"_timeoutWaitingForFirstPaint" withObject:0 afterDelay:5.0];
    }
  }
}

- (void)_timeoutWaitingForFirstPaint
{
  unint64_t v3 = BCIMLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_138718(self, v3);
  }

  [(AEPictureBookRenderingCacheOperation2 *)self _updateSignal];
}

- (void)_takeSnapshotWhenReady
{
  webView = self->_webView;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_E57EC;
  v3[3] = &unk_1DAB88;
  v3[4] = self;
  [(WKWebView *)webView _doAfterNextPresentationUpdate:v3];
}

- (void)navigationHandler:(id)a3 failedToLoadURL:(id)a4 error:(id)a5
{
  dispatch_semaphore_t v5 = [(AEPictureBookRenderingCacheOperation2 *)self dispatchSemaphore];
  dispatch_semaphore_signal(v5);
}

- (void)_takeSnapshot
{
  unint64_t v3 = [(AEPictureBookRenderingCacheOperation2 *)self storageKey];

  if (v3)
  {
    objc_initWeak(&location, self);
    id v4 = [(AEPictureBookRenderingCacheOperation2 *)self dispatchSemaphore];
    id v5 = objc_alloc_init((Class)WKSnapshotConfiguration);
    double v6 = [(AEPictureBookRenderingCacheOperation2 *)self bookInfoSnapshot];
    unsigned int v7 = [v6 isFixedLayout];

    if (v7)
    {
      [(AEPictureBookRenderingCacheOperation2 *)self desiredSize];
      v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v5 setSnapshotWidth:v8];
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_E59E4;
    v10[3] = &unk_1DD9B8;
    objc_copyWeak(&v12, &location);
    id v9 = v4;
    id v11 = v9;
    [(AEPictureBookRenderingCacheOperation2 *)self _takeSnapshotWithConfiguration:v5 retryOnBlank:1 completionHandler:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    [(AEPictureBookRenderingCacheOperation2 *)self _updateSignal];
  }
}

- (void)_takeSnapshotWithConfiguration:(id)a3 retryOnBlank:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  double v10 = [(AEPictureBookRenderingCacheOperation2 *)self webView];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_E5B98;
  v13[3] = &unk_1DDA30;
  objc_copyWeak(&v16, &location);
  BOOL v17 = a4;
  id v11 = v8;
  id v14 = v11;
  id v12 = v9;
  id v15 = v12;
  [v10 takeSnapshotWithConfiguration:v11 completionHandler:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_releaseWebView
{
  unint64_t v3 = [(AEPictureBookRenderingCacheOperation2 *)self webView];

  if (v3)
  {
    id v4 = [(AEPictureBookRenderingCacheOperation2 *)self webView];
    id v5 = [v4 be_navigationHandler];
    [v5 setDelegate:0];

    double v6 = [(AEPictureBookRenderingCacheOperation2 *)self webView];
    [v6 stopLoading];

    [(AEPictureBookRenderingCacheOperation2 *)self setWebView:0];
  }
}

- (void)_updateSignal
{
  unint64_t v3 = [(AEPictureBookRenderingCacheOperation2 *)self piggyBack];
  id v4 = [(AEPictureBookRenderingCacheOperation2 *)self textNodeCharacterCounts];
  id v5 = [(AEPictureBookRenderingCacheOperation2 *)self cfisForHrefs];
  [v3 renderingCacheOperationCompleted:self textNodeCharacterCounts:v4 cfisForHrefs:v5];

  double v6 = [(AEPictureBookRenderingCacheOperation2 *)self dispatchSemaphore];
  dispatch_semaphore_signal(v6);
}

- (void)addExtraCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_E6054;
  v5[3] = &unk_1DBF08;
  p_extraCompletionsAccessLock = &self->_extraCompletionsAccessLock;
  v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  os_unfair_lock_lock(p_extraCompletionsAccessLock);
  sub_E6054((uint64_t)v5);
  os_unfair_lock_unlock(p_extraCompletionsAccessLock);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (void)setPageNumber:(unint64_t)a3
{
  self->_pageNumber = a3;
}

- (AEPictureBookRenderingPiggyBack)piggyBack
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_piggyBack);

  return (AEPictureBookRenderingPiggyBack *)WeakRetained;
}

- (void)setPiggyBack:(id)a3
{
}

- (AEBookInfoSnapshot)bookInfoSnapshot
{
  return self->_bookInfoSnapshot;
}

- (void)setBookInfoSnapshot:(id)a3
{
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (AEPaginatedBookSnapshotWebViewBuilder)webViewBuilder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewBuilder);

  return (AEPaginatedBookSnapshotWebViewBuilder *)WeakRetained;
}

- (void)setWebViewBuilder:(id)a3
{
}

- (CGSize)snapshotSize
{
  double width = self->_snapshotSize.width;
  double height = self->_snapshotSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSnapshotSize:(CGSize)a3
{
  self->_snapshotSize = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (OS_dispatch_semaphore)dispatchSemaphore
{
  return self->_dispatchSemaphore;
}

- (void)setDispatchSemaphore:(id)a3
{
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

- (unint64_t)snapshotRetryCount
{
  return self->_snapshotRetryCount;
}

- (void)setSnapshotRetryCount:(unint64_t)a3
{
  self->_snapshotRetryCount = a3;
}

- (AEPictureBookRenderingCacheOperation2)strongSelf
{
  return self->_strongSelf;
}

- (void)setStrongSelf:(id)a3
{
}

- (NSDictionary)textNodeCharacterCounts
{
  return self->_textNodeCharacterCounts;
}

- (void)setTextNodeCharacterCounts:(id)a3
{
}

- (NSDictionary)cfisForHrefs
{
  return self->_cfisForHrefs;
}

- (void)setCfisForHrefs:(id)a3
{
}

- (NSMutableSet)extraCompletions
{
  return self->_extraCompletions;
}

- (void)setExtraCompletions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraCompletions, 0);
  objc_storeStrong((id *)&self->_cfisForHrefs, 0);
  objc_storeStrong((id *)&self->_textNodeCharacterCounts, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_dispatchSemaphore, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_destroyWeak((id *)&self->_webViewBuilder);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_bookInfoSnapshot, 0);
  objc_destroyWeak((id *)&self->_piggyBack);

  objc_storeStrong((id *)&self->_url, 0);
}

@end
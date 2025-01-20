@interface BKTOCWebViewCellLoadQueue
- (BKTOCImageCache2)imageCache;
- (BKTOCWebViewCellLoadQueue)init;
- (BKTOCWebViewCellLoadRequest)currentRequest;
- (BOOL)isEmpty;
- (NSArray)queue;
- (NSMutableOrderedSet)requests;
- (WKWebView)webView;
- (id)dequeueRequest;
- (void)_measureContentAndSetFrame;
- (void)_notifyRequesterAndSendNextRequestOfPreferredHeight:(double)a3 error:(id)a4;
- (void)_sendNextRequest;
- (void)_snapshotCurrentContent;
- (void)enqueueRequest:(id)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setDefaultFrameAndPositionWebView;
- (void)setFrameAndPositionWebView:(CGRect)a3;
- (void)setImageCache:(id)a3;
- (void)setRequests:(id)a3;
- (void)setWebView:(id)a3;
- (void)webView:(id)a3 didCommitNavigation:(id)a4;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation BKTOCWebViewCellLoadQueue

- (BKTOCWebViewCellLoadQueue)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKTOCWebViewCellLoadQueue;
  v2 = [(BKTOCWebViewCellLoadQueue *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    requests = v2->_requests;
    v2->_requests = v3;
  }
  return v2;
}

- (NSArray)queue
{
  return (NSArray *)[(NSMutableOrderedSet *)self->_requests array];
}

- (void)enqueueRequest:(id)a3
{
  [(NSMutableOrderedSet *)self->_requests addObject:a3];

  [(BKTOCWebViewCellLoadQueue *)self _sendNextRequest];
}

- (id)dequeueRequest
{
  if ([(NSMutableOrderedSet *)self->_requests count])
  {
    v3 = [(NSMutableOrderedSet *)self->_requests lastObject];
    [(NSMutableOrderedSet *)self->_requests removeObjectAtIndex:(char *)[(NSMutableOrderedSet *)self->_requests count] - 1];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isEmpty
{
  return [(NSMutableOrderedSet *)self->_requests count] == 0;
}

- (void)setWebView:(id)a3
{
  p_webView = &self->_webView;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_webView, v6);
  [v6 setNavigationDelegate:self];

  [(BKTOCWebViewCellLoadQueue *)self _sendNextRequest];
}

- (void)setFrameAndPositionWebView:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  CGFloat v7 = -CGRectGetWidth(a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  [WeakRetained setFrame:v7, y, width, height];
}

- (void)setDefaultFrameAndPositionWebView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  [WeakRetained frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  -[BKTOCWebViewCellLoadQueue setFrameAndPositionWebView:](self, "setFrameAndPositionWebView:", v5, v7, v9, 54.0);
}

- (void)_sendNextRequest
{
  if (!self->_currentRequest)
  {
    p_webView = &self->_webView;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    if (WeakRetained)
    {
      double v5 = WeakRetained;
      unsigned __int8 v6 = [(BKTOCWebViewCellLoadQueue *)self isEmpty];

      if ((v6 & 1) == 0)
      {
        double v7 = [(BKTOCWebViewCellLoadQueue *)self dequeueRequest];
        currentRequest = self->_currentRequest;
        self->_currentRequest = v7;

        double v9 = self->_currentRequest;
        if (v9)
        {
          v10 = [(BKTOCWebViewCellLoadRequest *)v9 htmlContentString];
          id v15 = [v10 dataUsingEncoding:4];

          v11 = [(BKTOCWebViewCellLoadRequest *)self->_currentRequest baseURL];
          id v12 = objc_loadWeakRetained((id *)p_webView);
          id v13 = [v12 loadData:v15 MIMEType:BEXBEHTMLContentType characterEncodingName:BEUTF8StringEncodingName baseURL:v11];

          v14 = [(BKTOCWebViewCellLoadRequest *)self->_currentRequest requester];
          [v14 contentBeganLoadingForRequest:self->_currentRequest];
        }
      }
    }
  }
}

- (void)_measureContentAndSetFrame
{
  objc_initWeak(&location, self);
  double v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  double v7 = sub_3130C;
  double v8 = &unk_1DB660;
  objc_copyWeak(&v9, &location);
  v3 = objc_retainBlock(&v5);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  [WeakRetained evaluateJavaScript:@"let container = document.getElementById('content_container');if (!container) {    container = document.body;}const rect = container.getBoundingClientRect();JSON.stringify({width: rect.width, height: rect.height});"];
    v3,
    v5,
    v6,
    v7,
    v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_snapshotCurrentContent
{
  objc_initWeak(&location, self);
  double v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  double v7 = sub_31808;
  double v8 = &unk_1DB688;
  objc_copyWeak(&v9, &location);
  v3 = objc_retainBlock(&v5);
  double v4 = [(BKTOCWebViewCellLoadQueue *)self webView];
  [v4 be_takeSnapshotWithDefaultConfigurationCompletion:v3];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_notifyRequesterAndSendNextRequestOfPreferredHeight:(double)a3 error:(id)a4
{
  currentRequest = self->_currentRequest;
  id v7 = a4;
  double v8 = [(BKTOCWebViewCellLoadRequest *)currentRequest requester];
  [v8 contentFinishedLoadingForRequest:self->_currentRequest preferredHeight:v7 error:a3];

  id v9 = self->_currentRequest;
  self->_currentRequest = 0;

  [(BKTOCWebViewCellLoadQueue *)self _sendNextRequest];
}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
}

- (WKWebView)webView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);

  return (WKWebView *)WeakRetained;
}

- (BKTOCImageCache2)imageCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageCache);

  return (BKTOCImageCache2 *)WeakRetained;
}

- (void)setImageCache:(id)a3
{
}

- (NSMutableOrderedSet)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (BKTOCWebViewCellLoadRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_destroyWeak((id *)&self->_imageCache);

  objc_destroyWeak((id *)&self->_webView);
}

@end
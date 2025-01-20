@interface BENavigationHandler
- (BEDocumentExternalLoadApprovalCache)approvalCache;
- (BEExternalIframeJS)externalIframeJS;
- (BENavigationHandler)initWithMode:(unint64_t)a3;
- (BENavigationHandlerDelegate)delegate;
- (BOOL)_navigationIsUserInitiatedAndNotYetApproved:(id)a3;
- (BOOL)javascriptLoadComplete;
- (BOOL)reloadTimeoutActive;
- (BOOL)shouldWaitForJavascriptLoadComplete;
- (BOOL)webViewLoadComplete;
- (NSHashTable)_observers;
- (NSMutableArray)postLoadCompleteOrFailureWork;
- (NSString)bookID;
- (NSURL)mainFrameNavigationURL;
- (WKNavigationResponse)pendingMainFrameLoadURLResponse;
- (WKWebView)webView;
- (double)loadTimeout;
- (id)allObservers;
- (os_unfair_lock_s)accessLock;
- (unint64_t)maxReloadAttempts;
- (unint64_t)mode;
- (unint64_t)observerCount;
- (unint64_t)retryCount;
- (void)_cancelProvisionalLoadTimeout;
- (void)_cancelReloadTimeout;
- (void)_cancelTimeout;
- (void)_contentLoadTimeout;
- (void)_decidePolicyForFootnoteOrPreviewNavigationAction:(id)a3 shouldObserveProvisionalLoadTimeout:(BOOL *)a4 webView:(id)a5 decisionHandler:(id)a6;
- (void)_notifyLoadCompleteIfNecessary;
- (void)_notifyLoadFailureError:(id)a3 completion:(id)a4;
- (void)_provisionalLoadTimeout;
- (void)_reloadTimeout;
- (void)_startContentLoadTimeout;
- (void)_startProvisionalLoadTimeout;
- (void)_startReloadTimeout;
- (void)_webView:(id)a3 contentFailedToLoadWithReason:(unint64_t)a4;
- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4;
- (void)_webView:(id)a3 webContentProcessDidTerminateWithReason:(int64_t)a4;
- (void)addObserver:(id)a3;
- (void)attemptReload;
- (void)dealloc;
- (void)performAfterLoadCompleteOrFailure:(id)a3;
- (void)removeObserver:(id)a3;
- (void)requestCancelationOfCurrentNavigation;
- (void)setAccessLock:(os_unfair_lock_s)a3;
- (void)setApprovalCache:(id)a3;
- (void)setBookID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExternalIframeJS:(id)a3;
- (void)setJavascriptLoadComplete:(BOOL)a3;
- (void)setLoadTimeout:(double)a3;
- (void)setMainFrameNavigationURL:(id)a3;
- (void)setMaxReloadAttempts:(unint64_t)a3;
- (void)setObserverCount:(unint64_t)a3;
- (void)setPendingMainFrameLoadURLResponse:(id)a3;
- (void)setPostLoadCompleteOrFailureWork:(id)a3;
- (void)setReloadTimeoutActive:(BOOL)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setShouldWaitForJavascriptLoadComplete:(BOOL)a3;
- (void)setWebView:(id)a3;
- (void)setWebViewLoadComplete:(BOOL)a3;
- (void)set_observers:(id)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
@end

@implementation BENavigationHandler

- (BENavigationHandler)initWithMode:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BENavigationHandler;
  v4 = [(BENavigationHandler *)&v10 init];
  if (v4)
  {
    uint64_t v5 = +[BEDocumentExternalLoadApprovalCache sharedInstance];
    approvalCache = v4->_approvalCache;
    v4->_approvalCache = (BEDocumentExternalLoadApprovalCache *)v5;

    v4->_mode = a3;
    uint64_t v7 = +[NSHashTable weakObjectsHashTable];
    observers = v4->__observers;
    v4->__observers = (NSHashTable *)v7;

    v4->_accessLock._os_unfair_lock_opaque = 0;
    v4->_retryCount = 0;
    v4->_observerCount = 0;
    v4->_maxReloadAttempts = 3;
    v4->_loadTimeout = 10.0;
  }
  return v4;
}

- (void)dealloc
{
  [(BENavigationHandler *)self _cancelTimeout];
  v3.receiver = self;
  v3.super_class = (Class)BENavigationHandler;
  [(BENavigationHandler *)&v3 dealloc];
}

- (void)performAfterLoadCompleteOrFailure:(id)a3
{
  id v4 = a3;
  postLoadCompleteOrFailureWork = self->_postLoadCompleteOrFailureWork;
  id v10 = v4;
  if (!postLoadCompleteOrFailureWork)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uint64_t v7 = self->_postLoadCompleteOrFailureWork;
    self->_postLoadCompleteOrFailureWork = v6;

    id v4 = v10;
    postLoadCompleteOrFailureWork = self->_postLoadCompleteOrFailureWork;
  }
  id v8 = [v4 copy];
  id v9 = objc_retainBlock(v8);
  [(NSMutableArray *)postLoadCompleteOrFailureWork addObject:v9];
}

- (void)requestCancelationOfCurrentNavigation
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v3 = [(BENavigationHandler *)self allObservers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 navigationHandlerWillCancelCurrentNavigation:self];
        }
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)addObserver:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1EB54;
  v5[3] = &unk_3C04B8;
  p_accessLock = &self->_accessLock;
  v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  os_unfair_lock_lock(p_accessLock);
  sub_1EB54((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);
}

- (void)removeObserver:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1ECB4;
  v5[3] = &unk_3C04B8;
  p_accessLock = &self->_accessLock;
  v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  os_unfair_lock_lock(p_accessLock);
  sub_1ECB4((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);
}

- (id)allObservers
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_1EE4C;
  v15 = sub_1EE5C;
  id v16 = 0;
  p_accessLock = &self->_accessLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  uint64_t v7 = sub_1EE64;
  id v8 = &unk_3C0B58;
  long long v9 = self;
  long long v10 = &v11;
  objc_super v3 = v6;
  os_unfair_lock_lock(p_accessLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_accessLock);

  id v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v4;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (v4)
  {
    [(BENavigationHandler *)self addObserver:v4];
    p_delegate = &self->_delegate;
    id v6 = v8;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [(BENavigationHandler *)self removeObserver:WeakRetained];

    p_delegate = &self->_delegate;
    id v6 = 0;
  }
  objc_storeWeak((id *)p_delegate, v6);
}

- (void)_notifyLoadCompleteIfNecessary
{
  [(BENavigationHandler *)self _cancelTimeout];
  if (![(BENavigationHandler *)self webViewLoadComplete]) {
    return;
  }
  if ([(BENavigationHandler *)self shouldWaitForJavascriptLoadComplete])
  {
    objc_super v3 = [(WKNavigationResponse *)self->_pendingMainFrameLoadURLResponse response];
    id v4 = [v3 MIMEType];
    if ([v4 isEqualToString:@"application/xhtml+xml"])
    {

      goto LABEL_6;
    }
    unsigned int v5 = [v4 isEqualToString:@"text/html"];

    if (v5)
    {
LABEL_6:
      if (![(BENavigationHandler *)self javascriptLoadComplete]) {
        return;
      }
    }
  }
  id v6 = [(NSMutableArray *)self->_postLoadCompleteOrFailureWork firstObject];
  if (v6)
  {
    [(NSMutableArray *)self->_postLoadCompleteOrFailureWork removeObjectAtIndex:0];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1F3B4;
    v35[3] = &unk_3C0830;
    v36 = self;
    uint64_t v7 = (void (*)(void *, void, void *))v6[2];
    id v8 = v36;
    v7(v6, 0, v35);
    id v9 = v36;
  }
  else
  {
    id v8 = [(BENavigationHandler *)self webView];
    id v9 = [(BENavigationHandler *)self mainFrameNavigationURL];
    if (v9)
    {
      [(BENavigationHandler *)self setMainFrameNavigationURL:0];
      [(BENavigationHandler *)v8 setBe_hasPendingOperations:0];
      [(BENavigationHandler *)v8 setBe_hasCompletedLoad:1];
      [(BENavigationHandler *)v8 setBe_requiresReload:0];
      long long v10 = _BookEPUBLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        long long v12 = (BENavigationHandler *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        id v39 = v9;
        __int16 v40 = 2112;
        v41 = v12;
        __int16 v42 = 2048;
        v43 = v8;
        _os_log_impl(&def_7BFC0, v10, OS_LOG_TYPE_INFO, "Notifying delegate load of %@ in <%@:%p> is complete & JS has been executed", buf, 0x20u);
      }
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v13 = [(BENavigationHandler *)self allObservers];
      id v14 = [v13 countByEnumeratingWithState:&v27 objects:v37 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v28;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v18 navigationHandler:self didFinishLoadOfURL:v9];
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v27 objects:v37 count:16];
        }
        while (v15);
      }
    }
    else
    {
      v19 = _BookEPUBLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        *(_DWORD *)buf = 138412546;
        id v39 = v21;
        __int16 v40 = 2048;
        v41 = v8;
        _os_log_impl(&def_7BFC0, v19, OS_LOG_TYPE_ERROR, "Notifying delegate of missing URL in <%@:%p>", buf, 0x16u);
      }
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v13 = [(BENavigationHandler *)self allObservers];
      id v22 = [v13 countByEnumeratingWithState:&v31 objects:v44 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v32;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(void *)v32 != v24) {
              objc_enumerationMutation(v13);
            }
            v26 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
            if (objc_opt_respondsToSelector()) {
              [v26 navigationHandlerWebContentProcessFailedWithNoURL:v8];
            }
          }
          id v23 = [v13 countByEnumeratingWithState:&v31 objects:v44 count:16];
        }
        while (v23);
      }
    }
  }
}

- (void)_notifyLoadFailureError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(BENavigationHandler *)self _cancelTimeout];
  id v8 = [(NSMutableArray *)self->_postLoadCompleteOrFailureWork firstObject];
  if (v8)
  {
    [(NSMutableArray *)self->_postLoadCompleteOrFailureWork removeObjectAtIndex:0];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1F584;
    v13[3] = &unk_3C0B80;
    id v14 = self;
    id v15 = v6;
    id v16 = v7;
    id v9 = (void (*)(void *, id, void *))v8[2];
    long long v10 = v14;
    v9(v8, v15, v13);
  }
  else
  {
    uint64_t v11 = _BookEPUBLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&def_7BFC0, v11, OS_LOG_TYPE_ERROR, "Notifying delegate load Failure - %@", buf, 0xCu);
    }

    long long v12 = (BENavigationHandler *)objc_retainBlock(v7);
    long long v10 = v12;
    if (v12) {
      ((void (*)(BENavigationHandler *))v12->_delegate)(v12);
    }
  }
}

- (void)_startContentLoadTimeout
{
  [(BENavigationHandler *)self loadTimeout];

  -[BENavigationHandler performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_contentLoadTimeout", 0);
}

- (void)_cancelTimeout
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_contentLoadTimeout" object:0];
  if ([(BENavigationHandler *)self reloadTimeoutActive])
  {
    objc_super v3 = _BookEPUBLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&def_7BFC0, v3, OS_LOG_TYPE_ERROR, "Reload timeout active when canceling our timeout.  Also canceling reload timeout.", v4, 2u);
    }

    [(BENavigationHandler *)self _cancelReloadTimeout];
  }
}

- (void)_startReloadTimeout
{
  [(BENavigationHandler *)self performSelector:"_reloadTimeout" withObject:0 afterDelay:3.0];

  [(BENavigationHandler *)self setReloadTimeoutActive:1];
}

- (void)_cancelReloadTimeout
{
  [(BENavigationHandler *)self setReloadTimeoutActive:0];

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_reloadTimeout" object:0];
}

- (void)_startProvisionalLoadTimeout
{
}

- (void)_cancelProvisionalLoadTimeout
{
  [(BENavigationHandler *)self setReloadTimeoutActive:0];

  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_provisionalLoadTimeout" object:0];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = 0;
  if ((self->_mode & 0xFFFFFFFFFFFFFFFELL) == 2) {
    [(BENavigationHandler *)self _decidePolicyForFootnoteOrPreviewNavigationAction:v9 shouldObserveProvisionalLoadTimeout:&v11 webView:v8 decisionHandler:v10];
  }
  else {
    [(BENavigationHandler *)self _decidePolicyForContentNavigationAction:v9 shouldObserveProvisionalLoadTimeout:&v11 webView:v8 decisionHandler:v10];
  }
  if (v11) {
    [(BENavigationHandler *)self _startProvisionalLoadTimeout];
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  id v11 = a4;
  id v8 = a5;
  if ([v11 isForMainFrame]) {
    objc_storeStrong((id *)&self->_pendingMainFrameLoadURLResponse, a4);
  }
  id v9 = objc_retainBlock(v8);
  id v10 = v9;
  if (v9) {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  id v6 = a3;
  id v7 = [a4 _request];
  id v8 = [v7 URL];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v6 URL];
  }
  id v11 = v10;

  [(BENavigationHandler *)self setMainFrameNavigationURL:v11];
  [(BENavigationHandler *)self setWebViewLoadComplete:0];
  [(BENavigationHandler *)self setJavascriptLoadComplete:0];
  [(BENavigationHandler *)self setWebView:v6];
  [v6 setBe_hasPendingOperations:1];
  [v6 setBe_hasCompletedLoad:0];
  [(BENavigationHandler *)self _cancelReloadTimeout];
  [(BENavigationHandler *)self _cancelProvisionalLoadTimeout];
  [(BENavigationHandler *)self _startContentLoadTimeout];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v12 = [(BENavigationHandler *)self allObservers];
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v17 navigationHandler:self didStartLoadOfURL:v11];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(BENavigationHandler *)self _cancelProvisionalLoadTimeout];
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1FBC8;
  v13[3] = &unk_3C0BA8;
  objc_copyWeak(&v16, &location);
  void v13[4] = self;
  id v11 = v9;
  id v14 = v11;
  id v12 = v10;
  id v15 = v12;
  [(BENavigationHandler *)self _notifyLoadFailureError:v12 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  -[BENavigationHandler setRetryCount:](self, "setRetryCount:", 0, a4);
  [(BENavigationHandler *)self setWebViewLoadComplete:1];
  [(BENavigationHandler *)self _notifyLoadCompleteIfNecessary];
  pendingMainFrameLoadURLResponse = self->_pendingMainFrameLoadURLResponse;
  self->_pendingMainFrameLoadURLResponse = 0;
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [v9 _request];
  id v12 = [v11 URL];

  id v13 = _BookEPUBLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = [v8 be_identifier];
    *(_DWORD *)buf = 138544386;
    id v25 = v15;
    __int16 v26 = 2114;
    long long v27 = v16;
    __int16 v28 = 2160;
    uint64_t v29 = 1752392040;
    __int16 v30 = 2112;
    long long v31 = v12;
    __int16 v32 = 2114;
    id v33 = v10;
    _os_log_impl(&def_7BFC0, v13, OS_LOG_TYPE_ERROR, "<%{public}@ %{public}@> didFailNavigation url:%{mask.hash}@ error: %{public}@", buf, 0x34u);
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1FFD0;
  v19[3] = &unk_3C0BA8;
  objc_copyWeak(&v22, &location);
  v19[4] = self;
  id v17 = v12;
  id v20 = v17;
  id v18 = v10;
  id v21 = v18;
  [(BENavigationHandler *)self _notifyLoadFailureError:v18 completion:v19];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)_webView:(id)a3 webContentProcessDidTerminateWithReason:(int64_t)a4
{
  id v6 = a3;
  id v7 = [v6 URL];
  id v8 = _BookEPUBLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = [v6 be_identifier];
    id v10 = +[NSNumber numberWithInteger:a4];
    int v12 = 138544130;
    id v13 = v9;
    __int16 v14 = 2160;
    uint64_t v15 = 1752392040;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2114;
    long long v19 = v10;
    _os_log_impl(&def_7BFC0, v8, OS_LOG_TYPE_ERROR, "webView %{public}@ url: %{mask.hash}@ - webContentProcessDidTerminateWithReason: %{public}@", (uint8_t *)&v12, 0x2Au);
  }
  if ((unint64_t)(a4 - 1) >= 4) {
    int64_t v11 = 0;
  }
  else {
    int64_t v11 = a4;
  }
  [(BENavigationHandler *)self _webView:v6 contentFailedToLoadWithReason:v11];
}

- (void)_contentLoadTimeout
{
  objc_super v3 = [(BENavigationHandler *)self webView];
  id v4 = [v3 URL];
  unsigned int v5 = _BookEPUBLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = [v3 be_identifier];
    int v7 = 138543874;
    id v8 = v6;
    __int16 v9 = 2160;
    uint64_t v10 = 1752392040;
    __int16 v11 = 2112;
    int v12 = v4;
    _os_log_impl(&def_7BFC0, v5, OS_LOG_TYPE_ERROR, "webView: %{public}@ url: %{mask.hash}@ - _contentLoadTimeout", (uint8_t *)&v7, 0x20u);
  }
  [(BENavigationHandler *)self _webView:v3 contentFailedToLoadWithReason:32];
}

- (void)_reloadTimeout
{
  [(BENavigationHandler *)self setReloadTimeoutActive:0];
  objc_super v3 = [(BENavigationHandler *)self webView];
  if (v3)
  {
    id v4 = +[UIApplication sharedApplication];
    unsigned int v5 = (char *)[v4 applicationState];

    if (v5 == (unsigned char *)&def_7BFC0 + 2)
    {
      [v3 setBe_requiresReload:1];
      id v6 = _BookEPUBLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = [v3 be_identifier];
        int v11 = 138543362;
        int v12 = v7;
        _os_log_impl(&def_7BFC0, v6, OS_LOG_TYPE_DEFAULT, "webView: %{public}@ Received reloadTimeout, but we are backgrounded.  Ignoring.", (uint8_t *)&v11, 0xCu);
LABEL_13:
      }
    }
    else
    {
      id v6 = [v3 URL];
      id v8 = _BookEPUBLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        __int16 v9 = [v3 be_identifier];
        int v11 = 138543874;
        int v12 = v9;
        __int16 v13 = 2160;
        uint64_t v14 = 1752392040;
        __int16 v15 = 2112;
        __int16 v16 = v6;
        _os_log_impl(&def_7BFC0, v8, OS_LOG_TYPE_ERROR, "webView: %{public}@ url: %{mask.hash}@ - _reloadTimeout", (uint8_t *)&v11, 0x20u);
      }
      if (!v6)
      {
        int v7 = _BookEPUBLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = [v3 be_identifier];
          int v11 = 138543362;
          int v12 = v10;
          _os_log_impl(&def_7BFC0, v7, OS_LOG_TYPE_ERROR, "webView: %{public}@ Received reloadTimeout, but our webView has no url.  Ignoring.", (uint8_t *)&v11, 0xCu);
        }
        goto LABEL_13;
      }
      [(BENavigationHandler *)self _webView:v3 contentFailedToLoadWithReason:64];
    }
  }
  else
  {
    id v6 = _BookEPUBLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&def_7BFC0, v6, OS_LOG_TYPE_ERROR, "Received reloadTimeout, but our webView is gone.  Ignoring.", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)_provisionalLoadTimeout
{
  objc_super v3 = [(BENavigationHandler *)self webView];
  id v4 = [v3 URL];
  unsigned int v5 = _BookEPUBLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = [v3 be_identifier];
    int v7 = 138543874;
    id v8 = v6;
    __int16 v9 = 2160;
    uint64_t v10 = 1752392040;
    __int16 v11 = 2112;
    int v12 = v4;
    _os_log_impl(&def_7BFC0, v5, OS_LOG_TYPE_ERROR, "webView: %{public}@ url: %{mask.hash}@ - _provisionalLoadTimeout #LOADTIMEOUT!", (uint8_t *)&v7, 0x20u);
  }
  [(BENavigationHandler *)self _webView:v3 contentFailedToLoadWithReason:32];
}

- (void)attemptReload
{
  objc_super v3 = [(BENavigationHandler *)self webView];
  if (v3)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = [(BENavigationHandler *)self allObservers];
    id v5 = [v4 countByEnumeratingWithState:&v19 objects:v31 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          __int16 v9 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v8);
          if (objc_opt_respondsToSelector()) {
            [v9 navigationHandlerWebContentProcessAttemptingReload:self];
          }
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v19 objects:v31 count:16];
      }
      while (v6);
    }

    uint64_t v10 = [v3 reloadFromOrigin];
    uint64_t v11 = [v3 URL];
    int v12 = _BookEPUBLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = [v3 be_identifier];
      *(_DWORD *)buf = 138543874;
      uint64_t v24 = (uint64_t)v13;
      __int16 v25 = 2160;
      uint64_t v26 = 1752392040;
      __int16 v27 = 2112;
      unint64_t v28 = v11;
      _os_log_impl(&def_7BFC0, v12, OS_LOG_TYPE_DEFAULT, "webView: %{public}@ Attempting reload of url: %{mask.hash}@", buf, 0x20u);
    }
    if (v10 | v11)
    {
      [(BENavigationHandler *)self setRetryCount:(char *)[(BENavigationHandler *)self retryCount] + 1];
      uint64_t v14 = _BookEPUBLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v15 = [(BENavigationHandler *)self retryCount];
        unint64_t v16 = [(BENavigationHandler *)self maxReloadAttempts];
        *(_DWORD *)buf = 141558786;
        uint64_t v24 = 1752392040;
        __int16 v25 = 2112;
        uint64_t v26 = v11;
        __int16 v27 = 2048;
        unint64_t v28 = v15;
        __int16 v29 = 2048;
        unint64_t v30 = v16;
        _os_log_impl(&def_7BFC0, v14, OS_LOG_TYPE_DEFAULT, "Attempting reload of url: %{mask.hash}@ - %ld/%ldattempts", buf, 0x2Au);
      }

      objc_opt_class();
      id v17 = BUDynamicCast();
      __int16 v18 = [v17 be_updateAXValueForMessage:&__kCFBooleanTrue];
      [v17 be_updateAXCurrentReadingStateWithMessage:@"BEWebProcessPluginNeedsReloadParameterKey" forValue:v18];

      [v17 be_enableAX];
      [v17 setBe_requiresReload:0];
      [(BENavigationHandler *)self _startReloadTimeout];
    }
    else
    {
      id v17 = _BookEPUBLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = @"navigation";
        __int16 v25 = 2112;
        uint64_t v26 = @"url";
        _os_log_impl(&def_7BFC0, v17, OS_LOG_TYPE_ERROR, "Attempting reload, but we don't have %@ %@", buf, 0x16u);
      }
    }
  }
}

- (void)_webView:(id)a3 contentFailedToLoadWithReason:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 be_clearRegisteredFonts];
    CFStringRef v8 = @"Crash";
    switch(a4)
    {
      case 0uLL:
        CFStringRef v8 = @"Memory Limit";
        break;
      case 1uLL:
        CFStringRef v8 = @"CPU Limit";
        break;
      case 2uLL:
        CFStringRef v8 = @"Client Request";
        break;
      case 3uLL:
        break;
      case 4uLL:
        CFStringRef v8 = @"Exceeded Shared Process Crash Limit";
        break;
      default:
        if (a4 == 32)
        {
          CFStringRef v8 = @"Internal Timeout";
        }
        else if (a4 == 64)
        {
          CFStringRef v8 = @"Reload Timeout";
        }
        else
        {
          CFStringRef v8 = @"<Unhandled Case>";
        }
        break;
    }
    __int16 v9 = [v7 URL];
    uint64_t v10 = _BookEPUBLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = [v7 be_identifier];
      int v12 = +[NSNumber numberWithUnsignedInteger:a4];
      *(_DWORD *)buf = 138544386;
      v49 = v11;
      __int16 v50 = 2160;
      uint64_t v51 = 1752392040;
      __int16 v52 = 2112;
      v53 = v9;
      __int16 v54 = 2114;
      CFStringRef v55 = v8;
      __int16 v56 = 2114;
      v57 = v12;
      _os_log_impl(&def_7BFC0, v10, OS_LOG_TYPE_FAULT, "webView:%{public}@ url: %{mask.hash}@ - contentFailedToLoadWithReason: %{public}@(%{public}@)", buf, 0x34u);
    }
    if (v9)
    {
      unint64_t v13 = [(BENavigationHandler *)self retryCount];
      if (v13 >= [(BENavigationHandler *)self maxReloadAttempts])
      {
        [v7 setBe_requiresReload:1];
        NSErrorUserInfoKey v45 = NSDebugDescriptionErrorKey;
        CFStringRef v46 = v8;
        uint64_t v24 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        __int16 v25 = +[NSError errorWithDomain:WKErrorDomain code:a4 userInfo:v24];

        uint64_t v26 = _BookEPUBLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v27 = [v7 be_identifier];
          unint64_t v28 = +[NSNumber numberWithUnsignedInteger:a4];
          *(_DWORD *)buf = 138544386;
          v49 = v27;
          __int16 v50 = 2160;
          uint64_t v51 = 1752392040;
          __int16 v52 = 2112;
          v53 = v9;
          __int16 v54 = 2114;
          CFStringRef v55 = v8;
          __int16 v56 = 2114;
          v57 = v28;
          _os_log_impl(&def_7BFC0, v26, OS_LOG_TYPE_DEFAULT, "webView:%{public}@ Max reload attempts reached for url: %{mask.hash}@ reason: %{public}@(%{public}@).", buf, 0x34u);
        }
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        __int16 v29 = [(BENavigationHandler *)self allObservers];
        id v30 = [v29 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v30)
        {
          id v31 = v30;
          uint64_t v32 = *(void *)v37;
          do
          {
            for (i = 0; i != v31; i = (char *)i + 1)
            {
              if (*(void *)v37 != v32) {
                objc_enumerationMutation(v29);
              }
              long long v34 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              if (objc_opt_respondsToSelector()) {
                [v34 navigationHandlerWebContentLoadFailed:self reason:v25];
              }
            }
            id v31 = [v29 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v31);
        }

        [(BENavigationHandler *)self _notifyLoadFailureError:v25 completion:&stru_3C0BC8];
      }
      else
      {
        uint64_t v14 = +[UIApplication sharedApplication];
        unint64_t v15 = (char *)[v14 applicationState];

        if (v15 == (unsigned char *)&def_7BFC0 + 2)
        {
          unint64_t v16 = _BookEPUBLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = [v7 be_identifier];
            *(_DWORD *)buf = 138543362;
            v49 = v17;
            _os_log_impl(&def_7BFC0, v16, OS_LOG_TYPE_DEFAULT, "Application is in the background.  Marking reload required for webView:%{public}@", buf, 0xCu);
          }
          [v7 setBe_requiresReload:1];
        }
        else
        {
          [(BENavigationHandler *)self attemptReload];
        }
      }
    }
    else
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      __int16 v18 = [(BENavigationHandler *)self allObservers];
      id v19 = [v18 countByEnumeratingWithState:&v40 objects:v47 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v41;
        do
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(void *)v41 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
            if (objc_opt_respondsToSelector()) {
              [v23 navigationHandlerWebContentProcessFailedWithNoURL:v7];
            }
          }
          id v20 = [v18 countByEnumeratingWithState:&v40 objects:v47 count:16];
        }
        while (v20);
      }
    }
    pendingMainFrameLoadURLResponse = self->_pendingMainFrameLoadURLResponse;
    self->_pendingMainFrameLoadURLResponse = 0;
  }
  else
  {
    __int16 v9 = _BookEPUBLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&def_7BFC0, v9, OS_LOG_TYPE_ERROR, "Content failed to load but we did not capture an associated webView! This means we can't call reload and we're stuck with a failed webview. We won't attempt to reload", buf, 2u);
    }
  }
}

- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4
{
  __int16 v4 = a4;
  id v6 = a3;
  if ((v4 & 0x100) != 0)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v7 = [(BENavigationHandler *)self allObservers];
    id v13 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v7);
          }
          id v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v17 navigationHandlerFirstSignificantPaintCompleted:self];
          }
        }
        id v14 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v14);
    }
    goto LABEL_22;
  }
  if ((v4 & 0x40) != 0)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [(BENavigationHandler *)self allObservers];
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (j = 0; j != v9; j = (char *)j + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v18 + 1) + 8 * (void)j);
          if (objc_opt_respondsToSelector()) {
            [v12 navigationHandlerFirstPaintCompleted:self];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v9);
    }
LABEL_22:
  }
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v5 = [a4 name:a3];
  unsigned int v6 = [v5 isEqualToString:@"BENavigationHandlerJSLoadComplete"];

  if (v6)
  {
    [(BENavigationHandler *)self setJavascriptLoadComplete:1];
    [(BENavigationHandler *)self _notifyLoadCompleteIfNecessary];
  }
}

- (BOOL)_navigationIsUserInitiatedAndNotYetApproved:(id)a3
{
  id v4 = a3;
  if (-[BEDocumentExternalLoadApprovalCache didApproveLoadingExternalContentForBookID:](self->_approvalCache, "didApproveLoadingExternalContentForBookID:", self->_bookID)|| [v4 navigationType])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    unsigned __int8 v5 = [v4 _isUserInitiated];
  }

  return v5;
}

- (void)_decidePolicyForFootnoteOrPreviewNavigationAction:(id)a3 shouldObserveProvisionalLoadTimeout:(BOOL *)a4 webView:(id)a5 decisionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 request];
  uint64_t v14 = [v13 URL];
  uint64_t v15 = [(id)v14 absoluteURL];
  unint64_t v16 = [v15 standardizedURL];

  id v17 = [v16 fragment];
  LOBYTE(v14) = [v17 hasSuffix:@"__ibooks_ignore_load"];

  if (v14)
  {
    uint64_t v18 = 0;
    goto LABEL_31;
  }
  if (BEURLHandlerURLIsApprovedToLoad(v16))
  {
    uint64_t v18 = 1;
    goto LABEL_31;
  }
  long long v19 = [(BENavigationHandler *)self delegate];
  long long v20 = [v10 targetFrame];
  if (BEURLHandlerSchemeIsOkForBookToLoad(v16))
  {
    if (v20)
    {
      if ([v20 isMainFrame])
      {
        if (objc_opt_respondsToSelector())
        {
          unsigned int v21 = [v19 navigationHandler:self handleInternalLoadRequest:v16];
        }
        else if (objc_opt_respondsToSelector())
        {
          long long v23 = [v19 urlForNavigationHandler];
          unsigned int v21 = [v16 be_isEquivalentToURL:v23 ignoringFragment:1];
        }
        else
        {
          unsigned int v21 = 1;
        }
        if (a4) {
          *a4 = v21;
        }
        goto LABEL_30;
      }
      goto LABEL_27;
    }
    if (objc_opt_respondsToSelector()) {
      [v19 navigationHandler:self handleInternalLoadRequestForNewWindow:v16];
    }
LABEL_29:
    unsigned int v21 = 0;
    goto LABEL_30;
  }
  if (!v20 || [v20 isMainFrame])
  {
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v19, "navigationHandler:handleExternalLoadRequest:likelyUserInitiated:", self, v16, objc_msgSend(v10, "navigationType") == 0);
    }
    goto LABEL_29;
  }
  long long v22 = [(BEExternalIframeJS *)self->_externalIframeJS urlForExternalIframeAuthorization];
  if ([v16 isEqual:v22])
  {

    goto LABEL_21;
  }
  unsigned __int8 v24 = [(BENavigationHandler *)self _navigationIsUserInitiatedAndNotYetApproved:v10];

  if (v24)
  {
LABEL_21:
    if (objc_opt_respondsToSelector())
    {
      long long v25 = self->_approvalCache;
      uint64_t v26 = [(BEExternalIframeJS *)self->_externalIframeJS postApprovalToLoadScript];
      __int16 v27 = self->_bookID;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_2177C;
      v36[3] = &unk_3C0C70;
      long long v37 = v25;
      long long v38 = v27;
      id v39 = v11;
      id v40 = v26;
      id v28 = v26;
      __int16 v29 = v27;
      id v30 = v25;
      [v19 navigationHandler:self handleUserRequestForFrameToLoadExternalURL:v16 completion:v36];
    }
    goto LABEL_29;
  }
  if (![(BEDocumentExternalLoadApprovalCache *)self->_approvalCache didApproveLoadingExternalContentForBookID:self->_bookID])
  {
    id v31 = [(BEExternalIframeJS *)self->_externalIframeJS preApprovalToLoadScriptForURL:v16];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_219A0;
    v34[3] = &unk_3C0C98;
    id v35 = v16;
    [v11 evaluateJavaScript:v31 completionHandler:v34];

    goto LABEL_29;
  }
LABEL_27:
  unsigned int v21 = 1;
LABEL_30:

  uint64_t v18 = v21;
LABEL_31:
  id v32 = objc_retainBlock(v12);
  id v33 = v32;
  if (v32) {
    (*((void (**)(id, uint64_t))v32 + 2))(v32, v18);
  }
}

- (BENavigationHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BENavigationHandlerDelegate *)WeakRetained;
}

- (BOOL)shouldWaitForJavascriptLoadComplete
{
  return self->_shouldWaitForJavascriptLoadComplete;
}

- (void)setShouldWaitForJavascriptLoadComplete:(BOOL)a3
{
  self->_shouldWaitForJavascriptLoadComplete = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSString)bookID
{
  return self->_bookID;
}

- (void)setBookID:(id)a3
{
}

- (BEExternalIframeJS)externalIframeJS
{
  return self->_externalIframeJS;
}

- (void)setExternalIframeJS:(id)a3
{
}

- (unint64_t)maxReloadAttempts
{
  return self->_maxReloadAttempts;
}

- (void)setMaxReloadAttempts:(unint64_t)a3
{
  self->_maxReloadAttempts = a3;
}

- (double)loadTimeout
{
  return self->_loadTimeout;
}

- (void)setLoadTimeout:(double)a3
{
  self->_loadTimeout = a3;
}

- (NSMutableArray)postLoadCompleteOrFailureWork
{
  return self->_postLoadCompleteOrFailureWork;
}

- (void)setPostLoadCompleteOrFailureWork:(id)a3
{
}

- (BEDocumentExternalLoadApprovalCache)approvalCache
{
  return self->_approvalCache;
}

- (void)setApprovalCache:(id)a3
{
}

- (WKNavigationResponse)pendingMainFrameLoadURLResponse
{
  return self->_pendingMainFrameLoadURLResponse;
}

- (void)setPendingMainFrameLoadURLResponse:(id)a3
{
}

- (BOOL)javascriptLoadComplete
{
  return self->_javascriptLoadComplete;
}

- (void)setJavascriptLoadComplete:(BOOL)a3
{
  self->_javascriptLoadComplete = a3;
}

- (BOOL)webViewLoadComplete
{
  return self->_webViewLoadComplete;
}

- (void)setWebViewLoadComplete:(BOOL)a3
{
  self->_webViewLoadComplete = a3;
}

- (NSURL)mainFrameNavigationURL
{
  return self->_mainFrameNavigationURL;
}

- (void)setMainFrameNavigationURL:(id)a3
{
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (BOOL)reloadTimeoutActive
{
  return self->_reloadTimeoutActive;
}

- (void)setReloadTimeoutActive:(BOOL)a3
{
  self->_reloadTimeoutActive = a3;
}

- (unint64_t)observerCount
{
  return self->_observerCount;
}

- (void)setObserverCount:(unint64_t)a3
{
  self->_observerCount = a3;
}

- (NSHashTable)_observers
{
  return self->__observers;
}

- (void)set_observers:(id)a3
{
}

- (os_unfair_lock_s)accessLock
{
  return self->_accessLock;
}

- (void)setAccessLock:(os_unfair_lock_s)a3
{
  self->_accessLock = a3;
}

- (WKWebView)webView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);

  return (WKWebView *)WeakRetained;
}

- (void)setWebView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->__observers, 0);
  objc_storeStrong((id *)&self->_mainFrameNavigationURL, 0);
  objc_storeStrong((id *)&self->_pendingMainFrameLoadURLResponse, 0);
  objc_storeStrong((id *)&self->_approvalCache, 0);
  objc_storeStrong((id *)&self->_postLoadCompleteOrFailureWork, 0);
  objc_storeStrong((id *)&self->_externalIframeJS, 0);
  objc_storeStrong((id *)&self->_bookID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
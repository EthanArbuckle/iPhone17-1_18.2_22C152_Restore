@interface BEWKWebView
- (BEWKWebView)initWithCoder:(id)a3;
- (BEWKWebView)initWithFrame:(CGRect)a3 configuration:(id)a4;
- (BEWebProcessControllerProtocol)webProcessPluginProxy;
- (BOOL)attemptingFontRegistration;
- (BOOL)be_finishedInit;
- (BOOL)be_isFontRegistered:(id)a3;
- (BOOL)be_isLoadingSuspended;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (CGPoint)_initialContentOffsetForScrollView;
- (CGRect)_visibleContentRect;
- (NSDictionary)be_viewportArguments;
- (NSMutableArray)pendingFontRegistrationHandlers;
- (NSMutableSet)fontsAttemptingRegistration;
- (NSMutableSet)registeredFonts;
- (_BEWKWebViewPendingLoad)be_pendingRequest;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_processPluginProxy;
- (id)be_updateAXValueForMessage:(id)a3;
- (id)loadData:(id)a3 MIMEType:(id)a4 characterEncodingName:(id)a5 baseURL:(id)a6;
- (id)loadFileRequest:(id)a3 allowingReadAccessToURL:(id)a4;
- (id)loadFileURL:(id)a3 allowingReadAccessToURL:(id)a4;
- (id)loadHTMLString:(id)a3 baseURL:(id)a4;
- (id)loadRequest:(id)a3;
- (id)loadSimulatedRequest:(id)a3 withResponse:(id)a4 responseData:(id)a5;
- (id)loadSimulatedRequest:(id)a3 withResponseHTMLString:(id)a4;
- (int64_t)be_suspendCount;
- (unint64_t)be_imageFilterMode;
- (void)_be_forceInitialContentOffset;
- (void)_be_sendPendingLoad;
- (void)_layerTreeCommitComplete;
- (void)_registerFontFamily:(id)a3 completion:(id)a4;
- (void)be_clearRegisteredFonts;
- (void)be_configureFontWithStyleManager:(id)a3 completion:(id)a4;
- (void)be_containsProtectedContent;
- (void)be_enableAX;
- (void)be_processPendingFontRegistration;
- (void)be_resumeLoading;
- (void)be_suspendLoading;
- (void)be_updateAXCurrentReadingStateWithMessage:(id)a3 forValue:(id)a4;
- (void)buildMenuWithBuilder:(id)a3;
- (void)dealloc;
- (void)setAttemptingFontRegistration:(BOOL)a3;
- (void)setBe_imageFilterMode:(unint64_t)a3;
- (void)setBe_pendingRequest:(id)a3;
- (void)setBe_suspendCount:(int64_t)a3;
- (void)setFontsAttemptingRegistration:(id)a3;
- (void)setPendingFontRegistrationHandlers:(id)a3;
- (void)setRegisteredFonts:(id)a3;
- (void)setWebProcessPluginProxy:(id)a3;
@end

@implementation BEWKWebView

- (BEWKWebView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)BEWKWebView;
  v4 = -[BEWKWebView initWithFrame:configuration:](&v10, "initWithFrame:configuration:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = +[UIColor colorWithDynamicProvider:&stru_3C0570];
    [(BEWKWebView *)v4 _setInteractionTintColor:v5];

    v6 = objc_opt_new();
    [(BEWKWebView *)v4 setRegisteredFonts:v6];

    v7 = objc_opt_new();
    [(BEWKWebView *)v4 setFontsAttemptingRegistration:v7];

    v8 = objc_opt_new();
    [(BEWKWebView *)v4 setPendingFontRegistrationHandlers:v8];

    v4->_be_finishedInit = 1;
  }
  return v4;
}

- (BEWKWebView)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BEWKWebView;
  v3 = [(BEWKWebView *)&v8 initWithCoder:a3];
  if (v3)
  {
    v4 = +[UIColor colorWithDynamicProvider:&stru_3C0570];
    [(BEWKWebView *)v3 _setInteractionTintColor:v4];

    v5 = objc_opt_new();
    [(BEWKWebView *)v3 setRegisteredFonts:v5];

    v6 = objc_opt_new();
    [(BEWKWebView *)v3 setFontsAttemptingRegistration:v6];

    v3->_be_finishedInit = 1;
  }
  return v3;
}

- (void)dealloc
{
  v3 = _BookEPUBLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&def_7BFC0, v3, OS_LOG_TYPE_DEBUG, "Dealloc of #reuse webView:%@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)BEWKWebView;
  [(BEWKWebView *)&v4 dealloc];
}

- (BOOL)be_isLoadingSuspended
{
  return self->_be_suspendCount > 0;
}

- (void)be_suspendLoading
{
  [(BEWKWebView *)self _be_validateSuspendCount];
  int64_t be_suspendCount = self->_be_suspendCount;
  if (be_suspendCount >= 0x7FFFFFFFFFFFFFFDLL) {
    int64_t be_suspendCount = 0x7FFFFFFFFFFFFFFDLL;
  }
  self->_int64_t be_suspendCount = be_suspendCount + 1;
}

- (void)be_resumeLoading
{
  [(BEWKWebView *)self _be_validateSuspendCount];
  int64_t be_suspendCount = self->_be_suspendCount;
  if (be_suspendCount <= 1) {
    int64_t be_suspendCount = 1;
  }
  int64_t v4 = be_suspendCount - 1;
  self->_int64_t be_suspendCount = v4;
  if (!v4)
  {
    [(BEWKWebView *)self _be_sendPendingLoad];
  }
}

- (void)setBe_imageFilterMode:(unint64_t)a3
{
  self->_be_imageFilterMode = a3;
}

- (unint64_t)be_imageFilterMode
{
  return self->_be_imageFilterMode;
}

- (BOOL)be_isFontRegistered:(id)a3
{
  id v4 = a3;
  v5 = [(BEWKWebView *)self registeredFonts];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)be_clearRegisteredFonts
{
  v3 = _BookEPUBLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(BEWKWebView *)self be_identifier];
    int v6 = 138412546;
    v7 = v4;
    __int16 v8 = 2112;
    v9 = self;
    _os_log_impl(&def_7BFC0, v3, OS_LOG_TYPE_DEFAULT, "Clearing registered fonts for webView:%@ self:%@", (uint8_t *)&v6, 0x16u);
  }
  v5 = [(BEWKWebView *)self registeredFonts];
  [v5 removeAllObjects];
}

- (void)be_processPendingFontRegistration
{
  v3 = [(BEWKWebView *)self pendingFontRegistrationHandlers];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = [(BEWKWebView *)self pendingFontRegistrationHandlers];
    id v6 = [v5 copy];

    v7 = [(BEWKWebView *)self pendingFontRegistrationHandlers];
    [v7 removeAllObjects];

    if ([v6 count])
    {
      __int16 v8 = 0;
      do
      {
        v9 = [v6 objectAtIndex:v8];
        if (v8 >= (char *)[v6 count] - 1)
        {
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_CFB4;
          v11[3] = &unk_3C04B8;
          id v12 = v9;
          v13 = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
          objc_super v10 = (void (**)(void, void))v12;
        }
        else
        {
          objc_super v10 = [v9 fontRegistrationHandler];
          v10[2](v10, 2);
        }

        ++v8;
      }
      while (v8 < [v6 count]);
    }
  }
}

- (void)be_configureFontWithStyleManager:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (v6)
  {
    if ([(BEWKWebView *)self attemptingFontRegistration])
    {
      __int16 v8 = _BookEPUBLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [v6 font];
        *(_DWORD *)buf = 138543362;
        v17 = v9;
        _os_log_impl(&def_7BFC0, v8, OS_LOG_TYPE_DEFAULT, "Deferring #fontReg of #fontFamily '%{public}@'", buf, 0xCu);
      }
      objc_super v10 = objc_opt_new();
      [v10 setStyleManager:v6];
      [v10 setFontRegistrationHandler:v7];
      v11 = [(BEWKWebView *)self pendingFontRegistrationHandlers];
      [v11 addObject:v10];
    }
    else
    {
      id v12 = [v6 font];
      unsigned int v13 = [(BEWKWebView *)self be_isFontRegistered:v12];

      if (v13)
      {
        [(BEWKWebView *)self be_willAttemptFontRegistration];
        [(BEWKWebView *)self be_fontRegistrationCompleted:1];
        v7[2](v7, 1);
      }
      else
      {
        [(BEWKWebView *)self setAttemptingFontRegistration:1];
        [(BEWKWebView *)self be_willAttemptFontRegistration];
        [(BEWKWebView *)self _grantAccessToAssetServices];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_D2F8;
        v14[3] = &unk_3C04E0;
        v14[4] = self;
        v15 = v7;
        [(BEWKWebView *)self _registerFontFamily:v6 completion:v14];
      }
    }
  }
  else
  {
    [(BEWKWebView *)self be_willAttemptFontRegistration];
    [(BEWKWebView *)self be_fontRegistrationCompleted:0];
    v7[2](v7, 0);
  }
}

- (NSDictionary)be_viewportArguments
{
  return (NSDictionary *)&off_3DD7B8;
}

- (void)_be_sendPendingLoad
{
  v3 = [(_BEWKWebViewPendingLoad *)self->_be_pendingRequest data];

  id v4 = [(_BEWKWebViewPendingLoad *)self->_be_pendingRequest request];
  v5 = v4;
  if (v3)
  {
    id v6 = [(_BEWKWebViewPendingLoad *)self->_be_pendingRequest response];
    v7 = [(_BEWKWebViewPendingLoad *)self->_be_pendingRequest data];
    id v8 = [(BEWKWebView *)self loadSimulatedRequest:v5 response:v6 responseData:v7];
  }
  else
  {

    if (!v5) {
      goto LABEL_6;
    }
    v5 = [(_BEWKWebViewPendingLoad *)self->_be_pendingRequest request];
    id v9 = [(BEWKWebView *)self loadRequest:v5];
  }

LABEL_6:
  be_pendingRequest = self->_be_pendingRequest;
  self->_be_pendingRequest = 0;
}

- (void)_registerFontFamily:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  id v8 = [v6 font];
  id v9 = [(BEWKWebView *)self registeredFonts];
  unsigned int v10 = [v9 containsObject:v8];

  v11 = [(BEWKWebView *)self fontsAttemptingRegistration];
  unsigned __int8 v12 = [v11 containsObject:v8];

  if ([v8 length]) {
    char v13 = v10;
  }
  else {
    char v13 = 1;
  }
  if (v13 & 1) != 0 || (v12)
  {
    if (![v8 length])
    {
LABEL_21:
      v7[2](v7, 1);
      goto LABEL_22;
    }
    v15 = _BookEPUBLog();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v16)
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v8;
        v17 = "#FontFamily '%{public}@' already #fontReg";
LABEL_19:
        _os_log_impl(&def_7BFC0, v15, OS_LOG_TYPE_INFO, v17, (uint8_t *)&buf, 0xCu);
      }
    }
    else if (v16)
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v8;
      v17 = "#FontFamily '%{public}@' already attempting #fontReg";
      goto LABEL_19;
    }

    goto LABEL_21;
  }
  if ([v6 isFontPreregistered:v8])
  {
    v14 = [(BEWKWebView *)self registeredFonts];
    [v14 addObject:v8];

    [(BEWKWebView *)self be_fontFamilySuccessfullyRegistered:v8];
    v7[2](v7, 1);
  }
  else if ([v6 isFontAvailable:v8])
  {
    v18 = [(BEWKWebView *)self _processPluginProxy];
    if (v18)
    {
      v19 = [(BEWKWebView *)self fontsAttemptingRegistration];
      [v19 addObject:v8];

      v20 = _BookEPUBLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl(&def_7BFC0, v20, OS_LOG_TYPE_DEFAULT, "Attempting #fontReg of #fontFamily '%{public}@'", (uint8_t *)&buf, 0xCu);
      }

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v32 = 0x2020000000;
      char v33 = 0;
      objc_initWeak(&location, self);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_D928;
      v25[3] = &unk_3C0508;
      objc_copyWeak(&v29, &location);
      id v26 = v8;
      p_long long buf = &buf;
      v27 = v7;
      [v18 registerFontFamily:v26 completion:v25];

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v22 = _BookEPUBLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl(&def_7BFC0, v22, OS_LOG_TYPE_ERROR, "Failed to get process plugin/proxy! Unable to #fontReg fontFamily:%{public}@", (uint8_t *)&buf, 0xCu);
      }

      v23 = [(BEWKWebView *)self fontsAttemptingRegistration];
      [v23 addObject:v8];

      v24 = _BookEPUBLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl(&def_7BFC0, v24, OS_LOG_TYPE_FAULT, "Unable to access process plugin failure #fontReg #fontFamily '%{public}@'", (uint8_t *)&buf, 0xCu);
      }

      [(BEWKWebView *)self be_fontFamilyFailedToRegister:v8];
      v7[2](v7, 0);
    }
  }
  else
  {
    v21 = _BookEPUBLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&def_7BFC0, v21, OS_LOG_TYPE_DEFAULT, "Skipping #fontReg of #fontFamily '%{public}@' because it is not yet available", (uint8_t *)&buf, 0xCu);
    }

    [(BEWKWebView *)self be_fontFamilyFailedToRegister:v8];
    v7[2](v7, 0);
  }
LABEL_22:
}

- (void)be_containsProtectedContent
{
  id v2 = [(BEWKWebView *)self _processPluginProxy];
  [v2 processContainsProtectedContent];
}

- (void)be_enableAX
{
  id v4 = [(BEWKWebView *)self _processPluginProxy];
  v3 = [(BEWKWebView *)self be_identifier];
  [v4 enableAXWithIdentifier:v3];
}

- (void)be_updateAXCurrentReadingStateWithMessage:(id)a3 forValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BEWKWebView *)self _processPluginProxy];
  [v8 updateAXCurrentReadingStateWithMessage:v7 forValue:v6];
}

- (id)be_updateAXValueForMessage:(id)a3
{
  v8[0] = @"BEWebProcessPluginIdentifierParameterKey";
  id v4 = a3;
  v5 = [(BEWKWebView *)self be_identifier];
  v8[1] = @"BEWebProcessPluginMessageParameterKey";
  v9[0] = v5;
  v9[1] = v4;
  id v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (id)_processPluginProxy
{
  v3 = [(BEWKWebView *)self webProcessPluginProxy];

  if (!v3)
  {
    id v4 = [(BEWKWebView *)self _remoteObjectRegistry];
    v5 = +[_WKRemoteObjectInterface remoteObjectInterfaceWithProtocol:&OBJC_PROTOCOL___BEWebProcessControllerProtocol];
    id v6 = [v4 remoteObjectProxyWithInterface:v5];
    [(BEWKWebView *)self setWebProcessPluginProxy:v6];

    if (!v5
      || ([(BEWKWebView *)self webProcessPluginProxy],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          !v7))
    {
      id v8 = _BookEPUBLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&def_7BFC0, v8, OS_LOG_TYPE_ERROR, "Failed to get process plugin/proxy!", v11, 2u);
      }
    }
  }
  id v9 = [(BEWKWebView *)self webProcessPluginProxy];

  return v9;
}

- (CGPoint)_initialContentOffsetForScrollView
{
  v3 = [(BEWKWebView *)self be_requestedContentOffset];
  v10.receiver = self;
  v10.super_class = (Class)BEWKWebView;
  [(BEWKWebView *)&v10 _initialContentOffsetForScrollView];
  if (v3) {
    [v3 CGPointValue];
  }
  double v6 = v4;
  double v7 = v5;

  double v8 = v6;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)_layerTreeCommitComplete
{
  v3.receiver = self;
  v3.super_class = (Class)BEWKWebView;
  [(BEWKWebView *)&v3 _layerTreeCommitComplete];
  [(BEWKWebView *)self _be_forceInitialContentOffset];
}

- (void)_be_forceInitialContentOffset
{
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  double v7 = NSStringFromSelector(a3);
  if ([&off_3DD808 containsObject:v7])
  {
    v10.receiver = self;
    v10.super_class = (Class)BEWKWebView;
    BOOL v8 = [(BEWKWebView *)&v10 canPerformAction:a3 withSender:v6];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4 = a3;
  double y = CGPointZero.y;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = [(BEWKWebView *)self be_textInputChild];
  double v7 = [v6 interactions];
  BOOL v8 = [v7 reverseObjectEnumerator];

  double v9 = (char *)[v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v9)
  {
    objc_super v10 = v9;
    uint64_t v11 = *(void *)v35;
    double v12 = y;
    double x = CGPointZero.x;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_opt_class();
        v15 = BUDynamicCast();
        BOOL v16 = v15;
        if (v15)
        {
          [v15 locationInView:self];
          double v19 = v17;
          double v20 = v18;
          if (CGPointZero.x == v17 && y == v18)
          {
            double v12 = v18;
            double x = v17;
          }
          else
          {
            double v12 = 1.79769313e308;
            BOOL v22 = v17 == 1.79769313e308 && v18 == 1.79769313e308;
            double x = 1.79769313e308;
            if (!v22)
            {

              double v12 = v20;
              double x = v19;
              goto LABEL_21;
            }
          }
        }
      }
      objc_super v10 = (char *)[v8 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v10);
  }
  else
  {
    double v12 = y;
    double x = CGPointZero.x;
  }
LABEL_21:

  v23 = [(BEWKWebView *)self be_textInputChild];
  -[BEWKWebView convertPoint:toView:](self, "convertPoint:toView:", v23, x, v12);
  double v25 = v24;
  double v27 = v26;

  v28 = _BookEPUBLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(double *)char v33 = x;
    *(double *)&v33[1] = v12;
    id v29 = +[NSValue valueWithBytes:v33 objCType:"{CGPoint=dd}"];
    *(double *)uint64_t v32 = v25;
    *(double *)&v32[1] = v27;
    v30 = +[NSValue valueWithBytes:v32 objCType:"{CGPoint=dd}"];
    *(_DWORD *)long long buf = 138412546;
    v39 = v29;
    __int16 v40 = 2112;
    v41 = v30;
    _os_log_impl(&def_7BFC0, v28, OS_LOG_TYPE_INFO, "Building context menu at location - viewPoint:%@ contentPoint:%@", buf, 0x16u);
  }
  v31 = [(BEWKWebView *)self be_uiHandler];
  [v31 buildMenuWithBuilder:v4 inWebView:self atPoint:v25];
}

- (id)loadRequest:(id)a3
{
  id v4 = [a3 mutableCopy];
  [v4 setAttribution:1];
  if ([(BEWKWebView *)self be_isLoadingSuspended])
  {
    double v5 = +[_BEWKWebViewPendingLoad pendingLoadWithRequest:v4];
    be_pendingRequest = self->_be_pendingRequest;
    self->_be_pendingRequest = v5;

    double v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BEWKWebView;
    double v7 = [(BEWKWebView *)&v9 loadRequest:v4];
  }

  return v7;
}

- (id)loadFileURL:(id)a3 allowingReadAccessToURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[BEWKWebView loadFileURL:allowingReadAccessToURL:]");
  id v8 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (id)loadHTMLString:(id)a3 baseURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[BEWKWebView loadHTMLString:baseURL:]");
  id v8 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (id)loadData:(id)a3 MIMEType:(id)a4 characterEncodingName:(id)a5 baseURL:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_msgSend(objc_alloc((Class)NSURLResponse), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v10, v12, objc_msgSend(v13, "length"), v11);

  v15 = +[NSMutableURLRequest requestWithURL:v10];

  [v15 setAttribution:1];
  if ([(BEWKWebView *)self be_isLoadingSuspended])
  {
    BOOL v16 = +[_BEWKWebViewPendingLoad pendingLoadWithRequest:v15 response:v14 data:v13];

    be_pendingRequest = self->_be_pendingRequest;
    self->_be_pendingRequest = v16;

    double v18 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)BEWKWebView;
    double v18 = [(BEWKWebView *)&v20 loadSimulatedRequest:v15 response:v14 responseData:v13];
  }

  return v18;
}

- (id)loadSimulatedRequest:(id)a3 withResponse:(id)a4 responseData:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 mutableCopy];
  [v10 setAttribution:1];
  if ([(BEWKWebView *)self be_isLoadingSuspended])
  {
    id v11 = +[_BEWKWebViewPendingLoad pendingLoadWithRequest:v10 response:v9 data:v8];

    be_pendingRequest = self->_be_pendingRequest;
    self->_be_pendingRequest = v11;

    id v13 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)BEWKWebView;
    id v13 = [(BEWKWebView *)&v15 loadSimulatedRequest:v10 withResponse:v9 responseData:v8];
  }

  return v13;
}

- (id)loadFileRequest:(id)a3 allowingReadAccessToURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[BEWKWebView loadFileRequest:allowingReadAccessToURL:]");
  id v8 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (id)loadSimulatedRequest:(id)a3 withResponseHTMLString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[BEWKWebView loadSimulatedRequest:withResponseHTMLString:]");
  id v8 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (CGRect)_visibleContentRect
{
  v31.receiver = self;
  v31.super_class = (Class)BEWKWebView;
  [(BEWKWebView *)&v31 _visibleContentRect];
  double x = v3;
  double y = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(BEWKWebView *)self scrollView];
  [v11 contentSize];
  double v13 = v12;
  double v15 = v14;

  [(BEWKWebView *)self be_gutterLength];
  double v17 = v16;
  double v18 = (char *)[(BEWKWebView *)self _paginationMode];
  if ((unint64_t)(v18 - 3) < 2)
  {
    v34.origin.double x = x;
    v34.origin.double y = y;
    v34.size.width = v8;
    v34.size.height = v10;
    double Height = CGRectGetHeight(v34);
    v35.origin.double x = x;
    v35.origin.double y = y;
    v35.size.width = v8;
    v35.size.height = v10;
    CGFloat MinY = CGRectGetMinY(v35);
    double v24 = fmax(MinY - Height - v17, 0.0);
    if (MinY > 0.0) {
      double y = v24;
    }
    if (v17 + v17 + Height * 3.0 >= v15) {
      double v10 = v15;
    }
    else {
      double v10 = v17 + v17 + Height * 3.0;
    }
  }
  else if ((unint64_t)(v18 - 1) <= 1)
  {
    double v29 = v15;
    v32.origin.double x = x;
    v32.origin.double y = y;
    v32.size.width = v8;
    v32.size.height = v10;
    double Width = CGRectGetWidth(v32);
    double v20 = v17 + Width + v17 + Width;
    v33.origin.double x = x;
    v33.origin.double y = y;
    v33.size.width = v8;
    v33.size.height = v10;
    double MinX = CGRectGetMinX(v33);
    if ([(BEWKWebView *)self _paginationMode] == (char *)&def_7BFC0 + 1)
    {
      if (v13 <= v20)
      {
        double x = CGPointZero.x;
        double y = CGPointZero.y;
        double v10 = v29;
        double v8 = v13;
        goto LABEL_19;
      }
      double v21 = fmax(MinX - Width - v17, 0.0);
      if (MinX > 0.0) {
        double x = v21;
      }
    }
    else
    {
      if (v13 <= v20) {
        goto LABEL_19;
      }
      double x = MinX - Width - v17;
    }
    if (v17 + v17 + Width * 3.0 >= v13) {
      double v8 = v13;
    }
    else {
      double v8 = v17 + v17 + Width * 3.0;
    }
  }
LABEL_19:
  double v25 = x;
  double v26 = y;
  double v27 = v8;
  double v28 = v10;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions];
  double v9 = [(BEWKWebView *)self _accessibilityLeafDescendantsWithOptions:v8];

  UIAccessibilityPointForPoint();
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v9;
  id v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        double v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v19 accessibilityFrame];
        v29.double x = v11;
        v29.double y = v13;
        if (CGRectContainsPoint(v30, v29))
        {
          id v20 = v19;

          goto LABEL_11;
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  v22.receiver = self;
  v22.super_class = (Class)BEWKWebView;
  -[BEWKWebView _accessibilityHitTest:withEvent:](&v22, "_accessibilityHitTest:withEvent:", v7, x, y);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v20;
}

- (BOOL)be_finishedInit
{
  return self->_be_finishedInit;
}

- (_BEWKWebViewPendingLoad)be_pendingRequest
{
  return self->_be_pendingRequest;
}

- (void)setBe_pendingRequest:(id)a3
{
}

- (int64_t)be_suspendCount
{
  return self->_be_suspendCount;
}

- (void)setBe_suspendCount:(int64_t)a3
{
  self->_int64_t be_suspendCount = a3;
}

- (NSMutableSet)registeredFonts
{
  return self->_registeredFonts;
}

- (void)setRegisteredFonts:(id)a3
{
}

- (NSMutableSet)fontsAttemptingRegistration
{
  return self->_fontsAttemptingRegistration;
}

- (void)setFontsAttemptingRegistration:(id)a3
{
}

- (BOOL)attemptingFontRegistration
{
  return self->_attemptingFontRegistration;
}

- (void)setAttemptingFontRegistration:(BOOL)a3
{
  self->_attemptingFontRegistration = a3;
}

- (NSMutableArray)pendingFontRegistrationHandlers
{
  return self->_pendingFontRegistrationHandlers;
}

- (void)setPendingFontRegistrationHandlers:(id)a3
{
}

- (BEWebProcessControllerProtocol)webProcessPluginProxy
{
  return self->_webProcessPluginProxy;
}

- (void)setWebProcessPluginProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webProcessPluginProxy, 0);
  objc_storeStrong((id *)&self->_pendingFontRegistrationHandlers, 0);
  objc_storeStrong((id *)&self->_fontsAttemptingRegistration, 0);
  objc_storeStrong((id *)&self->_registeredFonts, 0);

  objc_storeStrong((id *)&self->_be_pendingRequest, 0);
}

@end
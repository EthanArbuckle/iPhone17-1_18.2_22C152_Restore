@interface WebPluginController
+ (BOOL)isPlugInView:(id)a3;
+ (void)addPlugInView:(id)a3;
- (BOOL)plugInsAreRunning;
- (BOOL)processingUserGesture;
- (WebPluginController)initWithDocumentView:(id)a3;
- (id)URLPolicyCheckReferrer;
- (id)_webPluginContainerCheckIfAllowedToLoadRequest:(id)a3 inFrame:(id)a4 resultObject:(id)a5 selector:(SEL)a6;
- (id)plugInViewWithArguments:(id)a3 fromPluginPackage:(id)a4;
- (id)superlayerForPluginView:(id)a3;
- (id)webFrame;
- (id)webView;
- (void)_cancelOutstandingChecks;
- (void)_webPluginContainerCancelCheckIfAllowedToLoadRequest:(id)a3;
- (void)addPlugin:(id)a3;
- (void)dealloc;
- (void)destroyAllPlugins;
- (void)destroyOnePlugin:(id)a3;
- (void)destroyPlugin:(id)a3;
- (void)pluginView:(id)a3 receivedData:(id)a4;
- (void)pluginView:(id)a3 receivedError:(id)a4;
- (void)pluginView:(id)a3 receivedResponse:(id)a4;
- (void)pluginViewFinishedLoading:(id)a3;
- (void)restorePluginsFromCache;
- (void)setDataSource:(id)a3;
- (void)startAllPlugins;
- (void)stopAllPlugins;
- (void)stopOnePlugin:(id)a3;
- (void)stopOnePluginForPageCache:(id)a3;
- (void)stopPluginsForPageCache;
- (void)webPlugInContainerDidHideFullScreenForView:(id)a3;
- (void)webPlugInContainerLoadRequest:(id)a3 inFrame:(id)a4;
- (void)webPlugInContainerShowStatus:(id)a3;
- (void)webPlugInContainerWillShowFullScreenForView:(id)a3;
@end

@implementation WebPluginController

- (id)plugInViewWithArguments:(id)a3 fromPluginPackage:(id)a4
{
  return 0;
}

+ (void)addPlugInView:(id)a3
{
  if (byte_1EB3A967C)
  {
    if (qword_1EB3A9690) {
      goto LABEL_5;
    }
  }
  else
  {
    qword_1EB3A9690 = 0;
    byte_1EB3A967C = 1;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v5 = (const void *)qword_1EB3A9690;
  qword_1EB3A9690 = (uint64_t)v4;
  if (v5) {
    CFRelease(v5);
  }
LABEL_5:
  if (a3)
  {
    v6 = (void *)qword_1EB3A9690;
    [v6 addObject:a3];
  }
}

+ (BOOL)isPlugInView:(id)a3
{
  if (byte_1EB3A967C == 1)
  {
    v3 = (void *)qword_1EB3A9690;
  }
  else
  {
    v3 = 0;
    qword_1EB3A9690 = 0;
    byte_1EB3A967C = 1;
  }
  return [v3 containsObject:a3];
}

- (WebPluginController)initWithDocumentView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WebPluginController;
  id v4 = [(WebPluginController *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_documentView = (WAKView *)a3;
    v4->_views = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->_checksInProgress = (NSMutableSet *)CFSetCreateMutable(0, 0, 0);
  }
  return v5;
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = (WebDataSource *)a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WebPluginController;
  [(WebPluginController *)&v3 dealloc];
}

- (BOOL)plugInsAreRunning
{
  uint64_t v3 = [(NSMutableArray *)self->_views count];
  BOOL v4 = !self->_started || v3 == 0;
  return !v4;
}

- (id)superlayerForPluginView:(id)a3
{
  BOOL v4 = [(WebPluginController *)self webFrame];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = *(void *)(v4[1] + 8);
  if (!v5) {
    return 0;
  }
  v6 = *(WebCore::LocalFrameView **)(v5 + 288);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = WebCore::LocalFrameView::graphicsLayerForPlatformWidget(v6, (WAKView *)a3);
  if (!v7) {
    return 0;
  }
  v8 = *(uint64_t (**)(void))(*(void *)v7 + 584);
  return (id)v8();
}

- (void)stopOnePlugin:(id)a3
{
  uint64_t v4 = objc_opt_respondsToSelector();
  if (v4)
  {
    if (!*MEMORY[0x1E4FB64D8]) {
      WebCore::commonVMSlow((WebCore *)v4);
    }
    MEMORY[0x1E4E43C20](v6);
    [a3 webPlugInStop];
  }
  else
  {
    uint64_t v5 = objc_opt_respondsToSelector();
    if ((v5 & 1) == 0) {
      return;
    }
    if (!*MEMORY[0x1E4FB64D8]) {
      WebCore::commonVMSlow((WebCore *)v5);
    }
    MEMORY[0x1E4E43C20](v6);
    [a3 pluginStop];
  }
  JSC::JSLock::DropAllLocks::~DropAllLocks((JSC::JSLock::DropAllLocks *)v6);
}

- (void)stopOnePluginForPageCache:(id)a3
{
  uint64_t v5 = objc_opt_respondsToSelector();
  if (v5)
  {
    if (!*MEMORY[0x1E4FB64D8]) {
      WebCore::commonVMSlow((WebCore *)v5);
    }
    MEMORY[0x1E4E43C20](v6);
    [a3 webPlugInStopForPageCache];
    JSC::JSLock::DropAllLocks::~DropAllLocks((JSC::JSLock::DropAllLocks *)v6);
  }
  else
  {
    [(WebPluginController *)self stopOnePlugin:a3];
  }
}

- (void)destroyOnePlugin:(id)a3
{
  uint64_t v4 = objc_opt_respondsToSelector();
  if (v4)
  {
    if (!*MEMORY[0x1E4FB64D8]) {
      WebCore::commonVMSlow((WebCore *)v4);
    }
    MEMORY[0x1E4E43C20](v6);
    [a3 webPlugInDestroy];
  }
  else
  {
    uint64_t v5 = objc_opt_respondsToSelector();
    if ((v5 & 1) == 0) {
      return;
    }
    if (!*MEMORY[0x1E4FB64D8]) {
      WebCore::commonVMSlow((WebCore *)v5);
    }
    MEMORY[0x1E4E43C20](v6);
    [a3 pluginDestroy];
  }
  JSC::JSLock::DropAllLocks::~DropAllLocks((JSC::JSLock::DropAllLocks *)v6);
}

- (void)startAllPlugins
{
  if (!self->_started)
  {
    [(NSMutableArray *)self->_views count];
    int v3 = [(NSMutableArray *)self->_views count];
    if (v3 >= 1)
    {
      uint64_t v4 = 0;
      uint64_t v5 = v3;
      v6 = (void *)MEMORY[0x1E4FB64D8];
      do
      {
        uint64_t v7 = (void *)[(NSMutableArray *)self->_views objectAtIndex:v4];
        uint64_t v8 = objc_opt_respondsToSelector();
        if (v8)
        {
          if (!*v6) {
            WebCore::commonVMSlow((WebCore *)v8);
          }
          MEMORY[0x1E4E43C20](v10);
          [v7 webPlugInStart];
        }
        else
        {
          uint64_t v9 = objc_opt_respondsToSelector();
          if ((v9 & 1) == 0) {
            goto LABEL_8;
          }
          if (!*v6) {
            WebCore::commonVMSlow((WebCore *)v9);
          }
          MEMORY[0x1E4E43C20](v10);
          [v7 pluginStart];
        }
        JSC::JSLock::DropAllLocks::~DropAllLocks((JSC::JSLock::DropAllLocks *)v10);
LABEL_8:
        ++v4;
      }
      while (v5 != v4);
    }
    self->_started = 1;
  }
}

- (void)stopAllPlugins
{
  if (self->_started)
  {
    [(NSMutableArray *)self->_views count];
    int v3 = [(NSMutableArray *)self->_views count];
    if (v3 >= 1)
    {
      uint64_t v4 = 0;
      uint64_t v5 = v3;
      do
        [(WebPluginController *)self stopOnePlugin:[(NSMutableArray *)self->_views objectAtIndex:v4++]];
      while (v5 != v4);
    }
    self->_started = 0;
  }
}

- (void)stopPluginsForPageCache
{
  if (self->_started)
  {
    uint64_t v3 = [(NSMutableArray *)self->_views count];
    if (v3)
    {
      uint64_t v4 = v3;
      for (uint64_t i = 0; i != v4; ++i)
        [(WebPluginController *)self stopOnePluginForPageCache:[(NSMutableArray *)self->_views objectAtIndex:i]];
    }
    self->_started = 0;
  }
}

- (void)restorePluginsFromCache
{
  id v3 = [(WAKView *)self->_documentView _webView];
  uint64_t v4 = [(NSMutableArray *)self->_views count];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      objc_msgSend((id)objc_msgSend(v3, "_UIKitDelegateForwarder"), "webView:willAddPlugInView:", v3, -[NSMutableArray objectAtIndex:](self->_views, "objectAtIndex:", i));
  }
}

- (void)addPlugin:(id)a3
{
  if (!self->_documentView || (-[NSMutableArray containsObject:](self->_views, "containsObject:") & 1) != 0) {
    return;
  }
  [(NSMutableArray *)self->_views addObject:a3];
  uint64_t v5 = objc_opt_respondsToSelector();
  if (v5)
  {
    if (!*MEMORY[0x1E4FB64D8]) {
      WebCore::commonVMSlow((WebCore *)v5);
    }
    MEMORY[0x1E4E43C20](v10);
    [a3 webPlugInInitialize];
  }
  else
  {
    uint64_t v6 = objc_opt_respondsToSelector();
    if ((v6 & 1) == 0) {
      goto LABEL_12;
    }
    if (!*MEMORY[0x1E4FB64D8]) {
      WebCore::commonVMSlow((WebCore *)v6);
    }
    MEMORY[0x1E4E43C20](v10);
    [a3 pluginInitialize];
  }
  JSC::JSLock::DropAllLocks::~DropAllLocks((JSC::JSLock::DropAllLocks *)v10);
LABEL_12:
  if (!self->_started) {
    return;
  }
  uint64_t v7 = objc_opt_respondsToSelector();
  if (v7)
  {
    if (!*MEMORY[0x1E4FB64D8]) {
      WebCore::commonVMSlow((WebCore *)v7);
    }
    MEMORY[0x1E4E43C20](v10);
    [a3 webPlugInStart];
  }
  else
  {
    uint64_t v8 = objc_opt_respondsToSelector();
    if ((v8 & 1) == 0) {
      goto LABEL_22;
    }
    if (!*MEMORY[0x1E4FB64D8]) {
      WebCore::commonVMSlow((WebCore *)v8);
    }
    MEMORY[0x1E4E43C20](v10);
    [a3 pluginStart];
  }
  JSC::JSLock::DropAllLocks::~DropAllLocks((JSC::JSLock::DropAllLocks *)v10);
LABEL_22:
  uint64_t v9 = objc_opt_respondsToSelector();
  if (v9)
  {
    if (!*MEMORY[0x1E4FB64D8]) {
      WebCore::commonVMSlow((WebCore *)v9);
    }
    MEMORY[0x1E4E43C20](v10);
    objc_msgSend(a3, "setContainingWindow:", -[WAKView window](self->_documentView, "window"));
    JSC::JSLock::DropAllLocks::~DropAllLocks((JSC::JSLock::DropAllLocks *)v10);
  }
}

- (void)destroyPlugin:(id)a3
{
  if (-[NSMutableArray containsObject:](self->_views, "containsObject:"))
  {
    if (self->_started) {
      [(WebPluginController *)self stopOnePlugin:a3];
    }
    [(WebPluginController *)self destroyOnePlugin:a3];
    if (byte_1EB3A967C == 1)
    {
      uint64_t v5 = (void *)qword_1EB3A9690;
    }
    else
    {
      uint64_t v5 = 0;
      qword_1EB3A9690 = 0;
      byte_1EB3A967C = 1;
    }
    [v5 removeObject:a3];
    views = self->_views;
    [(NSMutableArray *)views removeObject:a3];
  }
}

- (void)_webPluginContainerCancelCheckIfAllowedToLoadRequest:(id)a3
{
  [a3 cancel];
  checksInProgress = self->_checksInProgress;
  [(NSMutableSet *)checksInProgress removeObject:a3];
}

- (void)_cancelOutstandingChecks
{
  checksInProgress = self->_checksInProgress;
  if (checksInProgress)
  {
    CFSetApplyFunction((CFSetRef)checksInProgress, (CFSetApplierFunction)cancelOutstandingCheck, 0);

    self->_checksInProgress = 0;
  }
}

- (void)destroyAllPlugins
{
  [(WebPluginController *)self stopAllPlugins];
  [(NSMutableArray *)self->_views count];
  [(WebPluginController *)self _cancelOutstandingChecks];
  int v3 = [(NSMutableArray *)self->_views count];
  if (v3 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = v3;
    do
    {
      while (1)
      {
        uint64_t v6 = [(NSMutableArray *)self->_views objectAtIndex:v4];
        [(WebPluginController *)self destroyOnePlugin:v6];
        if (byte_1EB3A967C != 1) {
          break;
        }
        [(id)qword_1EB3A9690 removeObject:v6];
        if (v5 == ++v4) {
          goto LABEL_7;
        }
      }
      qword_1EB3A9690 = 0;
      byte_1EB3A967C = 1;
      [0 removeObject:v6];
      ++v4;
    }
    while (v5 != v4);
  }
LABEL_7:
  [(NSMutableArray *)self->_views makeObjectsPerformSelector:sel_removeFromSuperview];

  self->_views = 0;
  self->_documentView = 0;
}

- (BOOL)processingUserGesture
{
  return MEMORY[0x1F416FD18](0, a2);
}

- (id)_webPluginContainerCheckIfAllowedToLoadRequest:(id)a3 inFrame:(id)a4 resultObject:(id)a5 selector:(SEL)a6
{
  uint64_t v7 = +[WebPluginContainerCheck checkWithRequest:a3 target:a4 resultObject:a5 selector:a6 controller:self contextInfo:0];
  [(NSMutableSet *)self->_checksInProgress addObject:v7];
  [(WebPluginContainerCheck *)v7 start];
  return v7;
}

- (void)webPlugInContainerLoadRequest:(id)a3 inFrame:(id)a4
{
  if (!a3) {
    return;
  }
  if (!self->_documentView) {
    return;
  }
  uint64_t v6 = [(WebDataSource *)self->_dataSource webFrame];
  if (!v6) {
    return;
  }
  uint64_t v7 = v6;
  if (!a4) {
    a4 = @"_top";
  }
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "URL"), "_webkit_scriptIfJavaScriptURL");
  if (!v8)
  {
    m_ptr = v7->_private->coreFrame.m_ptr;
    MEMORY[0x1E4E45D10](v37, a3);
    uint64_t v36 = 0;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    *(_OWORD *)v17 = 0u;
    WebCore::SubstituteData::SubstituteData((WebCore::SubstituteData *)v17);
    MEMORY[0x1E4E46090](v38, m_ptr, v37, v17);
    WebCore::SubstituteData::~SubstituteData((WebCore::SubstituteData *)v17, v11);
    WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)v37, v12);
    WTF::AtomStringImpl::add((uint64_t *)v17, (WTF::AtomStringImpl *)a4, v13);
    v15 = v17[0];
    if (v17[0]) {
      *(_DWORD *)v17[0] += 2;
    }
    v16 = v39;
    v39 = v15;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2)
      {
        WTF::StringImpl::destroy(v16, v14);
        if (!v15)
        {
LABEL_23:
          char v40 = 1;
          WebCore::FrameLoader::load();
          MEMORY[0x1E4E460A0](v38);
          return;
        }
LABEL_20:
        if (*(_DWORD *)v15 == 2) {
          WTF::StringImpl::destroy(v15, v14);
        }
        else {
          *(_DWORD *)v15 -= 2;
        }
        goto LABEL_23;
      }
      *(_DWORD *)v16 -= 2;
    }
    if (!v15) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }
  uint64_t v9 = v8;
  if ([(WebFrame *)v7 findFrameNamed:a4] == v7)
  {
    [(WebFrame *)v7 _stringByEvaluatingJavaScriptFromString:v9];
  }
}

- (void)webPlugInContainerWillShowFullScreenForView:(id)a3
{
  id v4 = [(WebDataSource *)self->_dataSource _webView];
  uint64_t v5 = (void *)[v4 _UIKitDelegateForwarder];
  [v5 webView:v4 willShowFullScreenForPlugInView:a3];
}

- (void)webPlugInContainerDidHideFullScreenForView:(id)a3
{
  id v4 = [(WebDataSource *)self->_dataSource _webView];
  uint64_t v5 = (void *)[v4 _UIKitDelegateForwarder];
  [v5 webView:v4 didHideFullScreenForPlugInView:a3];
}

- (void)webPlugInContainerShowStatus:(id)a3
{
  if (a3) {
    int v3 = (__CFString *)a3;
  }
  else {
    int v3 = &stru_1F3C7DA90;
  }
  id v4 = [(WebDataSource *)self->_dataSource _webView];
  uint64_t v5 = (void *)[v4 _UIDelegateForwarder];
  [v5 webView:v4 setStatusText:v3];
}

- (id)webFrame
{
  return [(WebDataSource *)self->_dataSource webFrame];
}

- (id)webView
{
  id v2 = [(WebPluginController *)self webFrame];
  return (id)[v2 webView];
}

- (id)URLPolicyCheckReferrer
{
  id v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[WebPluginController webFrame](self, "webFrame"), "_dataSource"), "response"), "URL");
  return (id)objc_msgSend(v2, "_web_originalDataAsString");
}

- (void)pluginView:(id)a3 receivedResponse:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v7 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "_initWithPluginErrorCode:contentURL:pluginPageURL:pluginName:MIMEType:", 204, objc_msgSend(a4, "URL"), 0, 0, objc_msgSend(a4, "MIMEType"));
    dataSource = self->_dataSource;
    if (dataSource) {
      [(WebDataSource *)dataSource _documentLoader];
    }
    else {
      uint64_t v18 = 0;
    }
    MEMORY[0x1E4E451E0](&v14, v7);
    WebCore::DocumentLoader::cancelMainResourceLoad();
    CFTypeRef v10 = cf;
    CFTypeRef cf = 0;
    if (v10) {
      CFRelease(v10);
    }
    v11 = v16;
    v16 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
      {
        WTF::StringImpl::destroy(v11, v9);
        v12 = v15;
        v15 = 0;
        if (!v12) {
          goto LABEL_18;
        }
LABEL_16:
        if (*(_DWORD *)v12 == 2)
        {
          WTF::StringImpl::destroy(v12, v9);
          CFStringRef v13 = v14;
          v14 = 0;
          if (!v13) {
            goto LABEL_23;
          }
LABEL_21:
          if (*(_DWORD *)v13 == 2)
          {
            WTF::StringImpl::destroy(v13, v9);
            if (!v7) {
              return;
            }
LABEL_24:
            CFRelease(v7);
            return;
          }
          *(_DWORD *)v13 -= 2;
LABEL_23:
          if (!v7) {
            return;
          }
          goto LABEL_24;
        }
        *(_DWORD *)v12 -= 2;
LABEL_18:
        CFStringRef v13 = v14;
        v14 = 0;
        if (!v13) {
          goto LABEL_23;
        }
        goto LABEL_21;
      }
      *(_DWORD *)v11 -= 2;
    }
    v12 = v15;
    v15 = 0;
    if (!v12) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  [a3 webPlugInMainResourceDidReceiveResponse:a4];
}

- (void)pluginView:(id)a3 receivedData:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    [a3 webPlugInMainResourceDidReceiveData:a4];
  }
}

- (void)pluginView:(id)a3 receivedError:(id)a4
{
  if (objc_opt_respondsToSelector())
  {
    [a3 webPlugInMainResourceDidFailWithError:a4];
  }
}

- (void)pluginViewFinishedLoading:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    [a3 webPlugInMainResourceDidFinishLoading];
  }
}

@end
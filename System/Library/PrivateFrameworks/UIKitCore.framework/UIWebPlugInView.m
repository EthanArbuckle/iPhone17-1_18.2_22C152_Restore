@interface UIWebPlugInView
- (BOOL)isMapViewPlugIn;
- (BOOL)isParented;
- (BOOL)isParentedInLayer;
- (BOOL)isQuickTimePlugIn;
- (BOOL)isiAdPlugIn;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)willProvidePluginLayer;
- (UIWebPlugInView)initWithWebView:(id)a3 plugInView:(id)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)objectForWebScript;
- (id)plugInView;
- (id)pluginLayer;
- (void)_attachPluginLayerOnMainThread;
- (void)_connectPluginLayers;
- (void)_disconnectPluginLayers;
- (void)_reshapeOnMainThread;
- (void)_viewDidMoveToWindowOnMainThread;
- (void)attachPluginLayer;
- (void)dealloc;
- (void)detachPluginLayer;
- (void)drawRect:(CGRect)a3;
- (void)forwardInvocation:(id)a3;
- (void)invalidateGState;
- (void)layout;
- (void)mouseDown:(id)a3;
- (void)mouseUp:(id)a3;
- (void)reshape;
- (void)setFrame:(CGRect)a3;
- (void)setFrameSize:(CGSize)a3;
- (void)setIsMapViewPlugIn:(BOOL)a3;
- (void)setIsQuickTimePlugIn:(BOOL)a3;
- (void)setIsiAdPlugIn:(BOOL)a3;
- (void)setParentedInLayer:(BOOL)a3;
- (void)setWebView:(id)a3;
- (void)viewDidMoveToWindow;
- (void)webPlugInDestroy;
- (void)webPlugInInitialize;
- (void)webPlugInStart;
- (void)webPlugInStop;
@end

@implementation UIWebPlugInView

- (UIWebPlugInView)initWithWebView:(id)a3 plugInView:(id)a4
{
  v6 = -[UIWebPlugInView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_webView = (UIWebDocumentView *)a3;
    if (a4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7->_uiView = (UIView *)a4;
      if (objc_opt_respondsToSelector()) {
        [(UIView *)v7->_uiView performSelector:sel_setWAKView_ withObject:v7];
      }
      v7->_parentedInLayer = 0;
      memset(&context, 0, sizeof(context));
      context.info = v7->_uiView;
      v7->_mainRunLoopDrawObserver = CFRunLoopObserverCreate(0, 0xA0uLL, 0, 2500000, (CFRunLoopObserverCallBack)MainRunLoopDidDraw, &context);
    }
    else
    {
      NSLog(&cfstr_PlugInViewIsNo.isa, a4);

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  Main = CFRunLoopGetMain();
  CFRunLoopRemoveObserver(Main, self->_mainRunLoopDrawObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
  CFRelease(self->_mainRunLoopDrawObserver);
  int v4 = pthread_main_np();
  uiView = self->_uiView;
  if (v4 == 1) {

  }
  else {
    [(UIView *)uiView performSelectorOnMainThread:sel_release withObject:0 waitUntilDone:0];
  }

  v6.receiver = self;
  v6.super_class = (Class)UIWebPlugInView;
  [(UIWebPlugInView *)&v6 dealloc];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIWebPlugInView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)UIWebPlugInView;
  -[UIWebPlugInView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  v17.origin.double x = v9;
  v17.origin.double y = v11;
  v17.size.double width = v13;
  v17.size.double height = v15;
  v18.origin.double x = x;
  v18.origin.double y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  if (!CGRectEqualToRect(v17, v18)) {
    [(UIWebPlugInView *)self reshape];
  }
}

- (void)setFrameSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UIWebPlugInView *)self frame];
  double v7 = v6;
  double v9 = v8;
  v11.receiver = self;
  v11.super_class = (Class)UIWebPlugInView;
  -[UIWebPlugInView setFrameSize:](&v11, sel_setFrameSize_, width, height);
  if (v7 != width || v9 != height) {
    [(UIWebPlugInView *)self reshape];
  }
}

- (void)viewDidMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)UIWebPlugInView;
  [(UIWebPlugInView *)&v4 viewDidMoveToWindow];
  if (objc_opt_respondsToSelector()) {
    int v3 = [(UIView *)self->_uiView willEnterFullScreen];
  }
  else {
    int v3 = 0;
  }
  [(UIWebPlugInView *)self bounds];
  if (!CGRectIsEmpty(v5) || v3) {
    WebThreadRunOnMainThread();
  }
}

uint64_t __38__UIWebPlugInView_viewDidMoveToWindow__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _viewDidMoveToWindowOnMainThread];
}

- (void)invalidateGState
{
  v3.receiver = self;
  v3.super_class = (Class)UIWebPlugInView;
  [(UIWebPlugInView *)&v3 invalidateGState];
  [(UIWebPlugInView *)self reshape];
}

- (id)plugInView
{
  return self->_uiView;
}

- (BOOL)isParented
{
  return [(CALayer *)[(UIView *)self->_uiView layer] superlayer] != 0;
}

- (void)reshape
{
  if (WebThreadIsCurrent())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__UIWebPlugInView_reshape__block_invoke;
    block[3] = &unk_1E52DC580;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if ([(UIWebPlugInView *)self window])
  {
    if (![(UIWebPlugInView *)self isParented]) {
      [(UIWebPlugInView *)self viewDidMoveToWindow];
    }
  }
}

uint64_t __26__UIWebPlugInView_reshape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reshapeOnMainThread];
}

- (void)layout
{
  if (objc_opt_respondsToSelector())
  {
    uiView = self->_uiView;
    [(UIView *)uiView webPlugInLayout];
  }
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = (CGContext *)WKGetCurrentGraphicsContext();
  if (CGContextGetType() == 1)
  {
    CGContextSaveGState(v8);
    if (self->_parentedInLayer)
    {
      [(UIWebDocumentView *)self->_webView _documentScale];
      CGContextScaleCTM(v8, 1.0 / v9, 1.0 / v9);
    }
    if (objc_opt_respondsToSelector())
    {
      UIGraphicsPushContext(v8);
      -[UIView drawRectForPrinting:](self->_uiView, "drawRectForPrinting:", x, y, width, height);
      ContextStack = (int *)GetContextStack(0);
      PopContextFromStack(ContextStack);
    }
    else
    {
      objc_super v11 = [(UIView *)self->_uiView layer];
      double v12 = GetContextStack(0);
      if (*(int *)v12 < 1) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = v12[3 * (*(_DWORD *)v12 - 1) + 1];
      }
      [(CALayer *)v11 renderInContext:v13];
    }
    CGContextRestoreGState(v8);
  }
  if (objc_opt_respondsToSelector())
  {
    Main = CFRunLoopGetMain();
    mainRunLoopDrawObserver = self->_mainRunLoopDrawObserver;
    CFStringRef v16 = (const __CFString *)*MEMORY[0x1E4F1D410];
    CFRunLoopAddObserver(Main, mainRunLoopDrawObserver, v16);
  }
}

- (void)webPlugInInitialize
{
  if (objc_opt_respondsToSelector())
  {
    uiView = self->_uiView;
    [(UIView *)uiView webPlugInInitialize];
  }
}

- (void)webPlugInStart
{
  if (objc_opt_respondsToSelector())
  {
    uiView = self->_uiView;
    [(UIView *)uiView webPlugInStart];
  }
}

- (void)webPlugInStop
{
  if (objc_opt_respondsToSelector())
  {
    uiView = self->_uiView;
    [(UIView *)uiView webPlugInStop];
  }
}

- (void)webPlugInDestroy
{
  if (objc_opt_respondsToSelector())
  {
    uiView = self->_uiView;
    [(UIView *)uiView webPlugInDestroy];
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIWebPlugInView;
  if (-[UIWebPlugInView respondsToSelector:](&v5, sel_respondsToSelector_)) {
    char v3 = 1;
  }
  else {
    char v3 = objc_opt_respondsToSelector();
  }
  return v3 & 1;
}

- (void)forwardInvocation:(id)a3
{
  [a3 selector];
  if (objc_opt_respondsToSelector())
  {
    uiView = self->_uiView;
    [a3 invokeWithTarget:uiView];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIWebPlugInView;
    [(UIWebPlugInView *)&v6 forwardInvocation:a3];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result = (id)[(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  if (!result)
  {
    uiView = self->_uiView;
    return (id)[(UIView *)uiView methodSignatureForSelector:a3];
  }
  return result;
}

- (id)objectForWebScript
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  uiView = self->_uiView;
  return (id)[(UIView *)uiView objectForWebScript];
}

- (void)mouseDown:(id)a3
{
  id v3 = a3;
  [(id)WebThreadMakeNSInvocation() setArgument:&v3 atIndex:2];
  WebThreadCallDelegate();
}

- (void)mouseUp:(id)a3
{
  id v3 = a3;
  [(id)WebThreadMakeNSInvocation() setArgument:&v3 atIndex:2];
  WebThreadCallDelegate();
}

- (void)setWebView:(id)a3
{
  webView = self->_webView;
  if (webView != a3)
  {
    if (webView) {
      [(UIWebDocumentView *)webView didRemovePlugInView:self];
    }
    self->_webView = (UIWebDocumentView *)a3;
  }
}

- (BOOL)willProvidePluginLayer
{
  return self->_isQuickTimePlugIn || self->_isMapViewPlugIn || self->_isiAdPlugIn;
}

- (id)pluginLayer
{
  if ([(UIWebPlugInView *)self isParentedInLayer]) {
    return self->_hostingLayer;
  }
  else {
    return 0;
  }
}

- (void)_connectPluginLayers
{
  WebThreadLock();
  if (!self->_hostingLayer) {
    self->_hostingLayer = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  }
  [(CALayer *)[(UIView *)self->_webView layer] insertSublayer:self->_hostingLayer atIndex:0];
  if (objc_msgSend(-[UIWebDocumentView webView](self->_webView, "webView"), "_setMediaLayer:forPluginView:", self->_hostingLayer, self))
  {
    [(UIWebPlugInView *)self setParentedInLayer:1];
    id v3 = [(UIView *)self->_uiView layer];
    objc_super v4 = v3;
    [(CALayer *)self->_hostingLayer addSublayer:v3];

    [(UIWebDocumentView *)self->_webView _setSubviewCachesNeedUpdate:1];
    [(UIWebPlugInView *)self _reshapeOnMainThread];
  }
}

- (void)_disconnectPluginLayers
{
  if ([(UIWebPlugInView *)self isParentedInLayer])
  {
    WebThreadLock();
    id v3 = [(UIView *)self->_uiView layer];
    objc_super v4 = v3;
    objc_msgSend(-[UIWebDocumentView webView](self->_webView, "webView"), "_setMediaLayer:forPluginView:", 0, self);
    [(CALayer *)[(UIView *)self->_webView layer] addSublayer:v3];

    [(UIWebPlugInView *)self setParentedInLayer:0];
    [(UIWebPlugInView *)self _reshapeOnMainThread];
    webView = self->_webView;
    [(UIWebDocumentView *)webView _setSubviewCachesNeedUpdate:1];
  }
}

- (void)_attachPluginLayerOnMainThread
{
  if (![(UIWebPlugInView *)self isParentedInLayer]
    && self->_webView
    && (UIWebDocumentView *)[(UIView *)self->_uiView superview] == self->_webView)
  {
    [(UIWebPlugInView *)self _connectPluginLayers];
  }
}

- (void)attachPluginLayer
{
  if ([(UIWebPlugInView *)self willProvidePluginLayer])
  {
    if (WebThreadIsCurrent())
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__UIWebPlugInView_attachPluginLayer__block_invoke;
      block[3] = &unk_1E52DC580;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      [(UIWebPlugInView *)self _attachPluginLayerOnMainThread];
    }
  }
}

uint64_t __36__UIWebPlugInView_attachPluginLayer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _attachPluginLayerOnMainThread];
}

- (void)detachPluginLayer
{
  if ([(UIWebPlugInView *)self willProvidePluginLayer])
  {
    if (WebThreadIsCurrent())
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__UIWebPlugInView_detachPluginLayer__block_invoke;
      block[3] = &unk_1E52DC580;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      [(UIWebPlugInView *)self _detachPluginLayerOnMainThread];
    }
  }
}

uint64_t __36__UIWebPlugInView_detachPluginLayer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _detachPluginLayerOnMainThread];
}

- (BOOL)isParentedInLayer
{
  return self->_parentedInLayer;
}

- (void)setParentedInLayer:(BOOL)a3
{
  self->_parentedInLayer = a3;
}

- (BOOL)isQuickTimePlugIn
{
  return self->_isQuickTimePlugIn;
}

- (void)setIsQuickTimePlugIn:(BOOL)a3
{
  self->_isQuickTimePlugIn = a3;
}

- (BOOL)isMapViewPlugIn
{
  return self->_isMapViewPlugIn;
}

- (void)setIsMapViewPlugIn:(BOOL)a3
{
  self->_isMapViewPlugIn = a3;
}

- (BOOL)isiAdPlugIn
{
  return self->_isiAdPlugIn;
}

- (void)setIsiAdPlugIn:(BOOL)a3
{
  self->_isiAdPlugIn = a3;
}

- (void)_reshapeOnMainThread
{
  if (!self->_isFullScreen)
  {
    if (self->_parentedInLayer)
    {
      [(UIWebDocumentView *)self->_webView _documentScale];
      memset(&v9, 0, sizeof(v9));
      CGAffineTransformMakeScale(&v9, v3, v3);
      memset(&v8, 0, sizeof(v8));
      CGAffineTransform m = v9;
      CGAffineTransformInvert(&v8, &m);
      hostingLayer = self->_hostingLayer;
      CGAffineTransform m = v8;
      CATransform3DMakeAffineTransform(&v6, &m);
      [(CALayer *)hostingLayer setTransform:&v6];
      [(CALayer *)self->_hostingLayer bounds];
      CGAffineTransform m = v9;
      CGRect v12 = CGRectApplyAffineTransform(v11, &m);
      CGRect v13 = CGRectIntegral(v12);
      -[UIView setFrame:](self->_uiView, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
    }
    else
    {
      [(UIWebPlugInView *)self bounds];
      -[UIWebPlugInView convertRect:toView:](self, "convertRect:toView:", 0);
      CGRect v15 = CGRectIntegral(v14);
      uiView = self->_uiView;
      -[UIView setFrame:](uiView, "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
    }
  }
}

- (void)_viewDidMoveToWindowOnMainThread
{
  if ([(UIWebPlugInView *)self window])
  {
    [(UIView *)self->_webView addSubview:self->_uiView];
    [(UIWebPlugInView *)self _connectPluginLayers];
  }
  else
  {
    [(UIWebPlugInView *)self _disconnectPluginLayers];
    [(UIView *)self->_uiView removeFromSuperview];

    self->_hostingLayer = 0;
    [(UIWebDocumentView *)self->_webView didRemovePlugInView:self];
    self->_webView = 0;
  }
}

@end
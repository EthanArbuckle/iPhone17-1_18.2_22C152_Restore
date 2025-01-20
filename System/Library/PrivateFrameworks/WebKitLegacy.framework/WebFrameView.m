@interface WebFrameView
+ (BOOL)_canShowMIMETypeAsHTML:(id)a3;
+ (Class)_viewClassForMIMEType:(id)a3 allowingPlugins:(BOOL)a4;
+ (id)_viewTypesAllowImageTypeOmission:(BOOL)a3;
- (BOOL)_firstResponderIsFormControl;
- (BOOL)_hasScrollBars;
- (BOOL)_isFlippedDocument;
- (BOOL)_isVerticalDocument;
- (BOOL)_pageHorizontally:(BOOL)a3;
- (BOOL)_pageInBlockProgressionDirection:(BOOL)a3;
- (BOOL)_pageVertically:(BOOL)a3;
- (BOOL)_scrollHorizontallyBy:(float)a3;
- (BOOL)_scrollLineHorizontally:(BOOL)a3;
- (BOOL)_scrollLineVertically:(BOOL)a3;
- (BOOL)_scrollOverflowInDirection:(unsigned __int8)a3 granularity:(unsigned __int8)a4;
- (BOOL)_scrollToBeginningOfDocument;
- (BOOL)_scrollToEndOfDocument;
- (BOOL)_scrollVerticallyBy:(float)a3;
- (BOOL)acceptsFirstResponder;
- (BOOL)allowsScrolling;
- (BOOL)becomeFirstResponder;
- (BOOL)documentViewShouldHandlePrint;
- (BOOL)isOpaque;
- (BOOL)scrollView:(id)a3 shouldScrollToPoint:(CGPoint)a4;
- (CGRect)visibleRect;
- (Class)_customScrollViewClass;
- (Class)_viewClassForMIMEType:(id)a3;
- (NSView)documentView;
- (NakedPtr<WebCore::LocalFrame>)_web_frame;
- (WebFrame)webFrame;
- (WebFrameView)initWithFrame:(CGRect)a3;
- (float)_area;
- (float)_horizontalKeyboardScrollDistance;
- (float)_horizontalPageScrollDistance;
- (float)_verticalKeyboardScrollDistance;
- (float)_verticalPageScrollDistance;
- (id)_contentView;
- (id)_largestChildWithScrollBars;
- (id)_largestScrollableChild;
- (id)_makeDocumentViewForDataSource:(id)a3;
- (id)_scrollView;
- (id)_webView;
- (id)_webcore_effectiveFirstResponder;
- (void)_forwardMouseEvent:(id)a3;
- (void)_frameSizeChanged;
- (void)_goBack;
- (void)_goForward;
- (void)_install;
- (void)_setDocumentView:(id)a3;
- (void)_setWebFrame:(id)a3;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)frameSizeChanged;
- (void)keyDown:(id)a3;
- (void)printDocumentView;
- (void)scrollLineDown:(id)a3;
- (void)scrollLineUp:(id)a3;
- (void)scrollPageDown:(id)a3;
- (void)scrollPageUp:(id)a3;
- (void)scrollToBeginningOfDocument:(id)a3;
- (void)scrollToEndOfDocument:(id)a3;
- (void)setAllowsScrolling:(BOOL)allowsScrolling;
- (void)setFrameSize:(CGSize)a3;
- (void)setNextKeyView:(id)a3;
- (void)viewDidMoveToWindow;
@end

@implementation WebFrameView

- (float)_verticalKeyboardScrollDistance
{
  id v2 = [(WebFrameView *)self _scrollView];
  [v2 verticalLineScroll];
  return result;
}

- (NakedPtr<WebCore::LocalFrame>)_web_frame
{
  webFrame = self->_private->webFrame;
  if (webFrame) {
    webFrame = (WebFrame *)webFrame->_private->coreFrame.m_ptr;
  }
  *id v2 = webFrame;
  return (NakedPtr<WebCore::LocalFrame>)self;
}

- (id)_webView
{
  return [(WebFrame *)self->_private->webFrame webView];
}

- (void)_setDocumentView:(id)a3
{
  id v5 = [(WebFrameView *)self _scrollView];
  objc_msgSend(-[WebFrameView _webView](self, "_webView"), "page");
  *(unsigned char *)(*(void *)(v7 + 64) + 47) = 0;
  [v5 setDocumentView:a3];
  m_ptr = self->_private->webFrame->_private->coreFrame.m_ptr;
  if (m_ptr == *(LocalFrame **)(*(void *)(*((void *)m_ptr + 3) + 8) + 160)) {
    objc_msgSend((id)-[WebFrameView window](self, "window"), "makeFirstResponder:", -[WebFrameView documentView](self, "documentView"));
  }
}

- (id)_makeDocumentViewForDataSource:(id)a3
{
  uint64_t v5 = [a3 _responseMIMEType];
  if (v5) {
    v6 = (__CFString *)v5;
  }
  else {
    v6 = @"text/html";
  }
  uint64_t v7 = [(WebFrameView *)self _viewClassForMIMEType:v6];
  if (v7)
  {
    v8 = v7;
    uint64_t v9 = [a3 representation];
    if (v9 && (id v10 = (id)v9, (objc_class *)objc_opt_class() == v8)) {
      CFRetain(v10);
    }
    else {
      id v10 = objc_alloc_init(v8);
    }
  }
  else
  {
    id v10 = 0;
  }
  [(WebFrameView *)self _setDocumentView:v10];
  v11 = (void *)CFMakeCollectable(v10);
  return v11;
}

- (void)_setWebFrame:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = [(WebFrameView *)self documentView];
    if (objc_opt_respondsToSelector()) {
      [(NSView *)v5 performSelector:sel_close];
    }
  }
  self->_private->webFrame = (WebFrame *)a3;
  if (!self->_private->includedInWebKitStatistics)
  {
    if ([a3 _isIncludedInWebKitStatistics])
    {
      self->_private->includedInWebKitStatistics = 1;
      ++WebFrameViewCount;
    }
  }
}

- (id)_scrollView
{
  id v2 = self->_private;
  if (v2) {
    return v2->frameScrollView.m_ptr;
  }
  else {
    return 0;
  }
}

- (float)_verticalPageScrollDistance
{
  id v2 = (WebCore::Scrollbar *)objc_msgSend(-[WebFrameView _contentView](self, "_contentView"), "bounds");
  float v4 = v3;
  float result = v4 - (float)(int)WebCore::Scrollbar::maxOverlapBetweenPages(v2);
  if ((float)(v4 * 0.8) >= result) {
    return v4 * 0.8;
  }
  return result;
}

+ (id)_viewTypesAllowImageTypeOmission:(BOOL)a3
{
  if (byte_1EB3A967A == 1)
  {
    float v4 = (void *)qword_1EB3A9688;
    if (byte_1EB3A967B) {
      return v4;
    }
  }
  else
  {
    +[WebFrameView(WebInternal) _viewTypesAllowImageTypeOmission:]::$_6::operator()(&v10);
    float v4 = (void *)v10;
    qword_1EB3A9688 = v10;
    byte_1EB3A967A = 1;
    if (byte_1EB3A967B) {
      return v4;
    }
  }
  if (!a3)
  {
    uint64_t v5 = objc_opt_class();
    v6 = objc_msgSend(+[WebHTMLView supportedImageMIMETypes](WebHTMLView, "supportedImageMIMETypes"), "objectEnumerator");
    uint64_t v7 = [v6 nextObject];
    if (v7)
    {
      uint64_t v8 = v7;
      do
      {
        if (![v4 objectForKey:v8]) {
          [v4 setObject:v5 forKey:v8];
        }
        uint64_t v8 = [v6 nextObject];
      }
      while (v8);
    }
    byte_1EB3A967B = 1;
    return (id)qword_1EB3A9688;
  }
  return v4;
}

+ (BOOL)_canShowMIMETypeAsHTML:(id)a3
{
  double v3 = objc_msgSend((id)objc_msgSend(a1, "_viewTypesAllowImageTypeOmission:", 1), "_webkit_objectForMIMEType:", a3);
  uint64_t v4 = objc_opt_class();
  return [v3 isSubclassOfClass:v4];
}

+ (Class)_viewClassForMIMEType:(id)a3 allowingPlugins:(BOOL)a4
{
  uint64_t v5 = 0;
  if (+[WebView _viewClass:&v5 andRepresentationClass:0 forMIMEType:a3 allowingPlugins:a4])
  {
    return v5;
  }
  else
  {
    return 0;
  }
}

- (Class)_viewClassForMIMEType:(id)a3
{
  uint64_t v4 = (objc_class *)[(id)objc_opt_class() _viewClassForMIMEType:a3 allowingPlugins:0];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v4;
  }
  uint64_t v5 = [(WebFrameView *)self webFrame];
  return (Class)[(objc_class *)v4 _representationClassForWebFrame:v5];
}

- (void)_install
{
  id v2 = self->_private;
  m_ptr = v2->webFrame->_private->coreFrame.m_ptr;
  uint64_t v4 = (WebCore::Widget *)*((void *)m_ptr + 36);
  WebCore::Widget::setPlatformWidget(v4, (WAKView *)v2->frameScrollView.m_ptr);
  if (!WebCore::Frame::ownerRenderer((WebCore::Frame *)m_ptr)) {
    goto LABEL_7;
  }
  if (v4) {
    ++*((_DWORD *)v4 + 2);
  }
  WebCore::RenderWidget::setWidget();
  if (!v4) {
    goto LABEL_7;
  }
  if (*((_DWORD *)v4 + 2) != 1)
  {
    --*((_DWORD *)v4 + 2);
LABEL_7:
    WebCore::LocalFrameView::updateCanHaveScrollbars(v4);
    return;
  }
  (*(void (**)(WebCore::Widget *))(*(void *)v4 + 8))(v4);
  WebCore::LocalFrameView::updateCanHaveScrollbars(v4);
}

- (void)_frameSizeChanged
{
  if ([(WebView *)[[(WebFrameView *)self webFrame] webView] drawsBackground])
  {
    objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "setDrawsBackground:", 1);
  }
  if (self)
  {
    [(WebFrameView *)self _web_frame];
    if (v3)
    {
      if (*(void *)(v3 + 288)) {
        WebCore::LocalFrameView::availableContentSizeChanged();
      }
    }
  }
}

- (WebFrameView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v13.receiver = self;
  v13.super_class = (Class)WebFrameView;
  uint64_t v5 = -[WebFrameView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    if ((-[WebFrameView initWithFrame:]::didFirstTimeInitialization & 1) == 0) {
      -[WebFrameView initWithFrame:]::didFirstTimeInitialization = 1;
    }
    v5->_private = objc_alloc_init(WebFrameViewPrivate);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB61B0]), "initWithFrame:", 0.0, 0.0, width, height);
    uint64_t v7 = v6;
    uint64_t v8 = v5->_private;
    if (v6) {
      CFRetain(v6);
    }
    m_ptr = v8->frameScrollView.m_ptr;
    v8->frameScrollView.m_ptr = v7;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    [v7 setDelegate:v5];
    [v7 setDrawsBackground:0];
    [v7 setHasVerticalScroller:0];
    [v7 setHasHorizontalScroller:0];
    [v7 setAutoresizingMask:18];
    LODWORD(v10) = 1109393408;
    [v7 setLineScroll:v10];
    [(WebFrameView *)v5 addSubview:v7];
    v12.receiver = v5;
    v12.super_class = (Class)WebFrameView;
    [(WebFrameView *)&v12 setNextKeyView:v7];
    if (v7) {
      CFRelease(v7);
    }
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v3 = self->_private;
  if (v3 && v3->includedInWebKitStatistics) {
    --WebFrameViewCount;
  }

  self->_private = 0;
  v4.receiver = self;
  v4.super_class = (Class)WebFrameView;
  [(WebFrameView *)&v4 dealloc];
}

- (BOOL)scrollView:(id)a3 shouldScrollToPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(WebFrameView *)self _webView];
  uint64_t v8 = (void *)[v7 _UIKitDelegateForwarder];
  webFrame = self->_private->webFrame;
  return objc_msgSend(v8, "webView:shouldScrollToPoint:forFrame:", v7, webFrame, x, y);
}

- (WebFrame)webFrame
{
  id v2 = self->_private;
  if (v2) {
    return v2->webFrame;
  }
  else {
    return 0;
  }
}

- (void)setAllowsScrolling:(BOOL)allowsScrolling
{
  uint64_t v3 = [(WebFrameView *)self webFrame];
  if (v3)
  {
    m_ptr = v3->_private->coreFrame.m_ptr;
    if (m_ptr)
    {
      uint64_t v5 = (WebCore::LocalFrameView *)*((void *)m_ptr + 36);
      if (v5)
      {
        WebCore::LocalFrameView::setCanHaveScrollbars(v5);
      }
    }
  }
}

- (BOOL)allowsScrolling
{
  id v2 = [(WebFrameView *)self webFrame];
  BOOL result = !v2
        || (m_ptr = v2->_private->coreFrame.m_ptr) == 0
        || (uint64_t v4 = *((void *)m_ptr + 36)) == 0
        || (v6 = *(void *)(v4 + 64), uint64_t v5 = v4 + 64, (*(unsigned int (**)(uint64_t))(v6 + 144))(v5) != 1)
        || (*(unsigned int (**)(uint64_t))(*(void *)v5 + 152))(v5) != 1;
  return result;
}

- (NSView)documentView
{
  id v2 = [(WebFrameView *)self _scrollView];
  return (NSView *)[v2 documentView];
}

- (BOOL)acceptsFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  uint64_t v3 = (void *)[(WebFrameView *)self window];
  if ([v3 keyViewSelectionDirection] == 2)
  {
    uint64_t v4 = (WebFrameView *)[(WebFrameView *)self previousValidKeyView];
    if (v4)
    {
      uint64_t v5 = v4;
      if (v4 != self) {
        goto LABEL_8;
      }
    }
    uint64_t v6 = [(WebView *)[[(WebFrameView *)self webFrame] webView] previousValidKeyView];
LABEL_7:
    uint64_t v5 = v6;
LABEL_8:
    [v3 makeFirstResponder:v5];
    return 1;
  }
  if (objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "acceptsFirstResponder"))
  {
    uint64_t v6 = [(WebFrameView *)self _scrollView];
    goto LABEL_7;
  }
  return 1;
}

- (void)setNextKeyView:(id)a3
{
  if ([(WebFrameView *)self _scrollView])
  {
    id v5 = [(WebFrameView *)self _scrollView];
    [v5 setNextKeyView:a3];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WebFrameView;
    [(WebFrameView *)&v6 setNextKeyView:a3];
  }
}

- (BOOL)isOpaque
{
  id v2 = [(WebFrameView *)self _webView];
  return [v2 drawsBackground];
}

- (void)drawRect:(CGRect)a3
{
  if (![(WebFrameView *)self documentView]
    || ([(NSView *)[(WebFrameView *)self documentView] frame], v4 == 0.0)
    || [[(WebFrameView *)self webFrame] _isCommitting])
  {
    if (objc_msgSend(-[WebFrameView _webView](self, "_webView"), "drawsBackground"))
    {
      id v5 = (CGContext *)WKGetCurrentGraphicsContext();
      WebCore::cachedCGColor();
      CGContextSetFillColorWithColor(v5, color);
      if (color) {
        CFRelease(color);
      }
      WKRectFill();
    }
  }
}

- (CGRect)visibleRect
{
  if (self->_private)
  {
    if ([[(WebFrameView *)self webFrame] _getVisibleRect:&v17])
    {
      if (NSIsEmptyRect(v17)
        || (v15.receiver = self,
            v15.super_class = (Class)WebFrameView,
            [(WebFrameView *)&v15 visibleRect],
            CGFloat x = v19.origin.x,
            CGFloat y = v19.origin.y,
            CGFloat width = v19.size.width,
            CGFloat height = v19.size.height,
            NSIsEmptyRect(v19)))
      {
        CGFloat v7 = *MEMORY[0x1E4F28AD8];
        double v8 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
        double v9 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
        double v10 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
      }
      else
      {
        [(WebFrameView *)self frame];
        v20.origin.CGFloat x = v17.origin.x - v11;
        double v14 = v12 + v13;
        v20.size.CGFloat width = v17.size.width;
        v20.size.CGFloat height = v17.size.height;
        v20.origin.CGFloat y = v14 - (v17.origin.y + v17.size.height);
        v17.origin.CGFloat x = v20.origin.x;
        v17.origin.CGFloat y = v20.origin.y;
        v22.origin.CGFloat x = x;
        v22.origin.CGFloat y = y;
        v22.size.CGFloat width = width;
        v22.size.CGFloat height = height;
        *(NSRect *)&CGFloat v7 = NSIntersectionRect(v20, v22);
      }
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)WebFrameView;
      [(WebFrameView *)&v16 visibleRect];
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)WebFrameView;
    [(WebFrameView *)&v18 visibleRect];
  }
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (void)setFrameSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(WebFrameView *)self frame];
  v7.double width = width;
  v7.double height = height;
  if (!NSEqualSizes(v7, v8)) {
    [(WebFrameView *)self _frameSizeChanged];
  }
  v6.receiver = self;
  v6.super_class = (Class)WebFrameView;
  -[WebFrameView setFrameSize:](&v6, sel_setFrameSize_, width, height);
}

- (void)viewDidMoveToWindow
{
  if (self->_private
    && [(WebView *)[[(WebFrameView *)self webFrame] webView] drawsBackground])
  {
    objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "setDrawsBackground:", 1);
  }
  v3.receiver = self;
  v3.super_class = (Class)WebFrameView;
  [(WebFrameView *)&v3 viewDidMoveToWindow];
}

- (BOOL)_scrollOverflowInDirection:(unsigned __int8)a3 granularity:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  [(WebFrameView *)self documentView];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  NSSize v7 = [(WebFrameView *)self webFrame];
  if (!v7) {
    return 0;
  }
  m_ptr = v7->_private->coreFrame.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  uint64_t v9 = *((void *)m_ptr + 78);
  return MEMORY[0x1F416CD80](v9, v5, v4, 0);
}

- (BOOL)_isVerticalDocument
{
  if (!self) {
    return 1;
  }
  [(WebFrameView *)self _web_frame];
  if (!v7) {
    return 1;
  }
  uint64_t v2 = *(void *)(v7 + 296);
  if (!v2) {
    return 1;
  }
  uint64_t v3 = *(void *)(v2 + 1984);
  if (!v3) {
    return 1;
  }
  int v4 = *(_DWORD *)(v3 + 120) & 7;
  char v5 = 2;
  switch(v4)
  {
    case 1:
    case 2:
      goto LABEL_10;
    case 3:
    case 5:
      LOBYTE(v4) = 3;
      goto LABEL_10;
    case 4:
      goto LABEL_11;
    default:
      LOBYTE(v4) = 0;
LABEL_10:
      char v5 = v4;
LABEL_11:
      BOOL result = (v5 & 6) != 2;
      break;
  }
  return result;
}

- (BOOL)_isFlippedDocument
{
  if (self)
  {
    [(WebFrameView *)self _web_frame];
    if (v7 && (uint64_t v2 = *(void *)(v7 + 296)) != 0 && (v3 = *(void *)(v2 + 1984)) != 0)
    {
      int v4 = *(_DWORD *)(v3 + 120) & 7;
      int v5 = 2;
      switch(v4)
      {
        case 1:
        case 2:
          goto LABEL_9;
        case 3:
        case 5:
          int v4 = 3;
          goto LABEL_9;
        case 4:
          goto LABEL_10;
        default:
          int v4 = 0;
LABEL_9:
          int v5 = v4;
LABEL_10:
          LOBYTE(self) = (v5 & 0xFFFFFFFD) == 1;
          break;
      }
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }
  return (char)self;
}

- (BOOL)_scrollToBeginningOfDocument
{
  if ([(WebFrameView *)self _scrollOverflowInDirection:0 granularity:2])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    int v3 = [(WebFrameView *)self _isScrollable];
    if (v3)
    {
      objc_msgSend((id)objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "documentView"), "frame");
      double v5 = v4;
      double v7 = v6;
      objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "scrollOrigin");
      objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView", v5 + v8), "scrollOrigin");
      *(double *)&v11[1] = v7 + v9;
      LOBYTE(v3) = objc_msgSend(-[WebFrameView _contentView](self, "_contentView"), "_scrollTo:animate:", v11, 1);
    }
  }
  return v3;
}

- (BOOL)_scrollToEndOfDocument
{
  BOOL v3 = 1;
  if (![(WebFrameView *)self _scrollOverflowInDirection:1 granularity:2])
  {
    if ([(WebFrameView *)self _isScrollable])
    {
      objc_msgSend((id)objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "documentView"), "frame");
      double v5 = v4;
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      BOOL v12 = [(WebFrameView *)self _isVerticalDocument];
      BOOL v13 = [(WebFrameView *)self _isFlippedDocument];
      double v14 = -0.0;
      if (v12)
      {
        if (!v13) {
          double v14 = v11;
        }
        double v19 = v7 + v14;
        objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "scrollOrigin");
        double v18 = v5 + v15;
      }
      else
      {
        if (!v13) {
          double v14 = v9;
        }
        objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView", v5 + v14), "scrollOrigin");
        double v19 = v7 + v16;
      }
      return objc_msgSend(-[WebFrameView _contentView](self, "_contentView", *(void *)&v18, *(void *)&v19), "_scrollTo:animate:", &v18, 1);
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (void)scrollToBeginningOfDocument:(id)a3
{
  if (![(WebFrameView *)self _scrollToBeginningOfDocument])
  {
    id v5 = [(WebFrameView *)self _largestScrollableChild];
    if (!v5 || ([v5 _scrollToBeginningOfDocument] & 1) == 0)
    {
      id v6 = [(WAKResponder *)self nextResponder];
      [v6 tryToPerform:sel_scrollToBeginningOfDocument_ with:a3];
    }
  }
}

- (void)scrollToEndOfDocument:(id)a3
{
  if (![(WebFrameView *)self _scrollToEndOfDocument])
  {
    id v5 = [(WebFrameView *)self _largestScrollableChild];
    if (!v5 || ([v5 _scrollToEndOfDocument] & 1) == 0)
    {
      id v6 = [(WAKResponder *)self nextResponder];
      [v6 tryToPerform:sel_scrollToEndOfDocument_ with:a3];
    }
  }
}

- (void)_goBack
{
  id v2 = [(WebFrameView *)self _webView];
  [v2 goBack];
}

- (void)_goForward
{
  id v2 = [(WebFrameView *)self _webView];
  [v2 goForward];
}

- (BOOL)_scrollVerticallyBy:(float)a3
{
  objc_msgSend(-[WebFrameView _contentView](self, "_contentView"), "bounds");
  return objc_msgSend(-[WebFrameView _contentView](self, "_contentView", v6, v5 + a3), "_scrollTo:animate:", &v8, 1);
}

- (BOOL)_scrollHorizontallyBy:(float)a3
{
  objc_msgSend(-[WebFrameView _contentView](self, "_contentView"), "bounds");
  return objc_msgSend(-[WebFrameView _contentView](self, "_contentView", v5 + a3, v6), "_scrollTo:animate:", &v8, 1);
}

- (float)_horizontalKeyboardScrollDistance
{
  id v2 = [(WebFrameView *)self _scrollView];
  [v2 horizontalLineScroll];
  return result;
}

- (float)_horizontalPageScrollDistance
{
  id v2 = (WebCore::Scrollbar *)objc_msgSend(-[WebFrameView _contentView](self, "_contentView"), "bounds");
  float v4 = v3;
  float result = v4 - (float)(int)WebCore::Scrollbar::maxOverlapBetweenPages(v2);
  if ((float)(v4 * 0.8) >= result) {
    return v4 * 0.8;
  }
  return result;
}

- (BOOL)_pageVertically:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WebFrameView *)self _scrollOverflowInDirection:!a3 granularity:1])
  {
    return 1;
  }
  if ([(WebFrameView *)self _isScrollable])
  {
    [(WebFrameView *)self _verticalPageScrollDistance];
    if (v3) {
      *(float *)&double v6 = -*(float *)&v6;
    }
    return [(WebFrameView *)self _scrollVerticallyBy:v6];
  }
  else
  {
    id v7 = [(WebFrameView *)self _largestScrollableChild];
    return [v7 _pageVertically:v3];
  }
}

- (BOOL)_pageHorizontally:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 3;
  }
  if ([(WebFrameView *)self _scrollOverflowInDirection:v5 granularity:1]) {
    return 1;
  }
  if ([(WebFrameView *)self _isScrollable])
  {
    [(WebFrameView *)self _horizontalPageScrollDistance];
    if (v3) {
      *(float *)&double v7 = -*(float *)&v7;
    }
    return [(WebFrameView *)self _scrollHorizontallyBy:v7];
  }
  else
  {
    id v8 = [(WebFrameView *)self _largestScrollableChild];
    return [v8 _pageHorizontally:v3];
  }
}

- (BOOL)_pageInBlockProgressionDirection:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(WebFrameView *)self _isVerticalDocument];
  uint64_t v6 = [(WebFrameView *)self _isFlippedDocument] ^ v3;
  if (v5)
  {
    return [(WebFrameView *)self _pageVertically:v6];
  }
  else
  {
    return [(WebFrameView *)self _pageHorizontally:v6];
  }
}

- (BOOL)_scrollLineVertically:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WebFrameView *)self _scrollOverflowInDirection:!a3 granularity:0])
  {
    return 1;
  }
  if ([(WebFrameView *)self _isScrollable])
  {
    [(WebFrameView *)self _verticalKeyboardScrollDistance];
    if (v3) {
      *(float *)&double v6 = -*(float *)&v6;
    }
    return [(WebFrameView *)self _scrollVerticallyBy:v6];
  }
  else
  {
    id v7 = [(WebFrameView *)self _largestScrollableChild];
    return [v7 _scrollLineVertically:v3];
  }
}

- (BOOL)_scrollLineHorizontally:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 3;
  }
  if ([(WebFrameView *)self _scrollOverflowInDirection:v5 granularity:0]) {
    return 1;
  }
  if ([(WebFrameView *)self _isScrollable])
  {
    [(WebFrameView *)self _horizontalKeyboardScrollDistance];
    if (v3) {
      *(float *)&double v7 = -*(float *)&v7;
    }
    return [(WebFrameView *)self _scrollHorizontallyBy:v7];
  }
  else
  {
    id v8 = [(WebFrameView *)self _largestScrollableChild];
    return [v8 _scrollLineHorizontally:v3];
  }
}

- (void)scrollPageUp:(id)a3
{
  if (![(WebFrameView *)self _pageInBlockProgressionDirection:1])
  {
    id v5 = [(WAKResponder *)self nextResponder];
    [v5 tryToPerform:sel_scrollPageUp_ with:a3];
  }
}

- (void)scrollPageDown:(id)a3
{
  if (![(WebFrameView *)self _pageInBlockProgressionDirection:0])
  {
    id v5 = [(WAKResponder *)self nextResponder];
    [v5 tryToPerform:sel_scrollPageDown_ with:a3];
  }
}

- (void)scrollLineUp:(id)a3
{
  if (![(WebFrameView *)self _scrollLineVertically:1])
  {
    id v5 = [(WAKResponder *)self nextResponder];
    [v5 tryToPerform:sel_scrollLineUp_ with:a3];
  }
}

- (void)scrollLineDown:(id)a3
{
  if (![(WebFrameView *)self _scrollLineVertically:0])
  {
    id v5 = [(WAKResponder *)self nextResponder];
    [v5 tryToPerform:sel_scrollLineDown_ with:a3];
  }
}

- (BOOL)_firstResponderIsFormControl
{
  return 0;
}

- (void)_forwardMouseEvent:(id)a3
{
  id v5 = (void *)[(WebFrameView *)self superview];
  if ([v5 conformsToProtocol:&unk_1F3CAAD30])
  {
    id v6 = (id)objc_msgSend((id)objc_msgSend(v5, "_web_parentWebFrameView"), "_scrollView");
    id v7 = a3;
  }
  else
  {
    id v6 = [(WAKResponder *)self nextResponder];
    id v7 = a3;
  }
  [v6 handleEvent:v7];
}

- (void)keyDown:(id)a3
{
  id v5 = (void *)[a3 characters];
  int v6 = [a3 modifierFlags];
  if (!self)
  {
    BOOL v7 = 0;
    uint64_t v19 = 0;
    int v8 = [v5 length];
    if (v8 < 1) {
      goto LABEL_63;
    }
    goto LABEL_8;
  }
  [(WebFrameView *)self _web_frame];
  if (v19)
  {
    BOOL v7 = *(unsigned __int8 *)(*(void *)(*(void *)(*(void *)(*(void *)(v19 + 24) + 8) + 136) + 16) + 65) != 0;
    int v8 = [v5 length];
    if (v8 < 1) {
      goto LABEL_63;
    }
LABEL_8:
    uint64_t v9 = 0;
    int v17 = v6;
    int v10 = v6;
    uint64_t v11 = v6 & 0x60000;
    uint64_t v12 = v8;
    char v13 = 1;
    while (2)
    {
      int v14 = [v5 characterAtIndex:v9];
      switch(v14)
      {
        case 63232:
          if (v11) {
            goto LABEL_10;
          }
          if ((v10 & 0x100000) != 0) {
            goto LABEL_56;
          }
          if ((v10 & 0x80000) != 0) {
            goto LABEL_55;
          }
          [(WebFrameView *)self scrollLineUp:0];
          goto LABEL_57;
        case 63233:
          if (v11) {
            goto LABEL_10;
          }
          if ((v10 & 0x100000) != 0)
          {
LABEL_40:
            [(WebFrameView *)self scrollToEndOfDocument:0];
          }
          else
          {
            if ((v10 & 0x80000) != 0) {
              goto LABEL_51;
            }
            [(WebFrameView *)self scrollLineDown:0];
          }
          goto LABEL_57;
        case 63234:
          if (v11) {
            goto LABEL_10;
          }
          if ((v10 & 0x100000) != 0)
          {
            if (!v7) {
              goto LABEL_10;
            }
            goto LABEL_59;
          }
          if (![(WebFrameView *)self allowsScrolling]
            && ![(WebFrameView *)self _largestScrollableChild])
          {
            goto LABEL_10;
          }
          double v15 = self;
          uint64_t v16 = 1;
          if ((v10 & 0x80000) != 0) {
            goto LABEL_34;
          }
          goto LABEL_28;
        case 63235:
          if (v11) {
            goto LABEL_10;
          }
          if ((v10 & 0x100000) != 0)
          {
            if (!v7) {
              goto LABEL_10;
            }
            goto LABEL_61;
          }
          if (![(WebFrameView *)self allowsScrolling]
            && ![(WebFrameView *)self _largestScrollableChild])
          {
            goto LABEL_10;
          }
          double v15 = self;
          uint64_t v16 = 0;
          if ((v10 & 0x80000) != 0) {
LABEL_34:
          }
            [(WebFrameView *)v15 _pageHorizontally:v16];
          else {
LABEL_28:
          }
            [(WebFrameView *)v15 _scrollLineHorizontally:v16];
          goto LABEL_57;
        case 63236:
        case 63237:
        case 63238:
        case 63239:
        case 63240:
        case 63241:
        case 63242:
        case 63243:
        case 63244:
        case 63245:
        case 63246:
        case 63247:
        case 63248:
        case 63249:
        case 63250:
        case 63251:
        case 63252:
        case 63253:
        case 63254:
        case 63255:
        case 63256:
        case 63257:
        case 63258:
        case 63259:
        case 63260:
        case 63261:
        case 63262:
        case 63263:
        case 63264:
        case 63265:
        case 63266:
        case 63267:
        case 63268:
        case 63269:
        case 63270:
        case 63271:
        case 63272:
        case 63274:
          goto LABEL_11;
        case 63273:
          if (![(WebFrameView *)self allowsScrolling]
            && ![(WebFrameView *)self _largestScrollableChild])
          {
            goto LABEL_10;
          }
LABEL_56:
          [(WebFrameView *)self scrollToBeginningOfDocument:0];
          goto LABEL_57;
        case 63275:
          if ([(WebFrameView *)self allowsScrolling]
            || [(WebFrameView *)self _largestScrollableChild])
          {
            goto LABEL_40;
          }
          goto LABEL_10;
        case 63276:
          if (![(WebFrameView *)self allowsScrolling]
            && ![(WebFrameView *)self _largestScrollableChild])
          {
            goto LABEL_10;
          }
          goto LABEL_55;
        case 63277:
          if (![(WebFrameView *)self allowsScrolling]
            && ![(WebFrameView *)self _largestScrollableChild])
          {
            goto LABEL_10;
          }
          goto LABEL_51;
        default:
          if (v14 == 32)
          {
            if (![(WebFrameView *)self allowsScrolling]
              && ![(WebFrameView *)self _largestScrollableChild]
              || [(WebFrameView *)self _firstResponderIsFormControl])
            {
LABEL_10:
              char v13 = 1;
              goto LABEL_11;
            }
            if ((v17 & 0x20000) != 0) {
LABEL_55:
            }
              [(WebFrameView *)self scrollPageUp:0];
            else {
LABEL_51:
            }
              [(WebFrameView *)self scrollPageDown:0];
          }
          else
          {
            if (v14 != 127) {
              goto LABEL_11;
            }
            if (!v7
              || !objc_msgSend((id)objc_msgSend(-[WebFrameView _webView](self, "_webView"), "preferences"), "backspaceKeyNavigationEnabled"))
            {
              goto LABEL_10;
            }
            if ((v17 & 0x20000) != 0) {
LABEL_61:
            }
              [(WebFrameView *)self _goForward];
            else {
LABEL_59:
            }
              [(WebFrameView *)self _goBack];
          }
LABEL_57:
          char v13 = 0;
LABEL_11:
          if (v12 != ++v9) {
            continue;
          }
          if (v13) {
            goto LABEL_63;
          }
          return;
      }
    }
  }
  BOOL v7 = 0;
  int v8 = [v5 length];
  if (v8 >= 1) {
    goto LABEL_8;
  }
LABEL_63:
  v18.receiver = self;
  v18.super_class = (Class)WebFrameView;
  [(WAKResponder *)&v18 keyDown:a3];
}

- (id)_webcore_effectiveFirstResponder
{
  BOOL v3 = [(WebFrameView *)self documentView];
  if (v3)
  {
    return (id)[(NSView *)v3 _webcore_effectiveFirstResponder];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WebFrameView;
    return [(WebFrameView *)&v5 _webcore_effectiveFirstResponder];
  }
}

- (BOOL)documentViewShouldHandlePrint
{
  uint64_t v2 = objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "documentView");
  if (!v2) {
    return 0;
  }
  BOOL v3 = (void *)v2;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v3 documentViewShouldHandlePrint];
}

- (void)printDocumentView
{
  uint64_t v2 = objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "documentView");
  if (v2)
  {
    BOOL v3 = (void *)v2;
    if (objc_opt_respondsToSelector())
    {
      [v3 printDocumentView];
    }
  }
}

- (float)_area
{
  [(WebFrameView *)self frame];
  return v3 * v2;
}

- (id)_largestScrollableChild
{
  double v2 = [[(WebFrameView *)self webFrame] childFrames];
  if (![(NSArray *)v2 count]) {
    return 0;
  }
  unint64_t v3 = 0;
  float v4 = 0;
  unsigned int v5 = 1;
  do
  {
    int v6 = objc_msgSend(-[NSArray objectAtIndex:](v2, "objectAtIndex:", v3), "frameView");
    if (([v6 _isScrollable] & 1) == 0) {
      int v6 = (void *)[v6 _largestScrollableChild];
    }
    if (v6)
    {
      [v6 _area];
      if (v7 >= 1.0)
      {
        if (!v4 || (float v8 = v7, [v4 _area], v8 > v9)) {
          float v4 = v6;
        }
      }
    }
    unint64_t v3 = v5++;
  }
  while ([(NSArray *)v2 count] > v3);
  return v4;
}

- (BOOL)_hasScrollBars
{
  id v2 = [(WebFrameView *)self _scrollView];
  if ([v2 hasHorizontalScroller]) {
    return 1;
  }
  return [v2 hasVerticalScroller];
}

- (id)_largestChildWithScrollBars
{
  id v2 = [[(WebFrameView *)self webFrame] childFrames];
  if (![(NSArray *)v2 count]) {
    return 0;
  }
  unint64_t v3 = 0;
  float v4 = 0;
  unsigned int v5 = 1;
  do
  {
    int v6 = objc_msgSend(-[NSArray objectAtIndex:](v2, "objectAtIndex:", v3), "frameView");
    if (([v6 _hasScrollBars] & 1) == 0) {
      int v6 = (void *)[v6 _largestChildWithScrollBars];
    }
    if (v6)
    {
      [v6 _area];
      if (v7 >= 1.0)
      {
        if (!v4 || (float v8 = v7, [v4 _area], v8 > v9)) {
          float v4 = v6;
        }
      }
    }
    unint64_t v3 = v5++;
  }
  while ([(NSArray *)v2 count] > v3);
  return v4;
}

- (id)_contentView
{
  id v2 = [(WebFrameView *)self _scrollView];
  return (id)[v2 contentView];
}

- (Class)_customScrollViewClass
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    return 0;
  }
  return (Class)objc_opt_class();
}

- (void)frameSizeChanged
{
  if ((objc_msgSend(-[WebFrameView _webView](self, "_webView"), "_useFixedLayout") & 1) == 0) {
    [(WebFrameView *)self _frameSizeChanged];
  }
  v3.receiver = self;
  v3.super_class = (Class)WebFrameView;
  [(WebFrameView *)&v3 frameSizeChanged];
}

@end
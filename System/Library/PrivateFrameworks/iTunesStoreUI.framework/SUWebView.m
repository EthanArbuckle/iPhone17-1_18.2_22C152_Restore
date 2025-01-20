@interface SUWebView
- (BOOL)getStatusBarStyle:(int64_t *)a3;
- (BOOL)isScrollingEnabled;
- (BOOL)showsTopBackgroundShadow;
- (NSString)title;
- (SUWebView)initWithFrame:(CGRect)a3;
- (UIColor)topBackgroundColor;
- (id)windowScriptObject;
- (void)_setPinnedHeaderView:(id)a3 withTopInsetAdjustment:(double)a4;
- (void)beginSynchronousLayout;
- (void)endSynchronousLayout;
- (void)loadArchive:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setScrollingEnabled:(BOOL)a3;
- (void)setShowsTopBackgroundShadow:(BOOL)a3;
- (void)setTopBackgroundColor:(id)a3;
- (void)view:(id)a3 didSetFrame:(CGRect)a4 oldFrame:(CGRect)a5;
@end

@implementation SUWebView

- (SUWebView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUWebView;
  result = -[SUWebView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_originalShowsBackgroundShadow = -1;
  }
  return result;
}

- (void)beginSynchronousLayout
{
  int64_t synchronousLayoutCount = self->_synchronousLayoutCount;
  if (!synchronousLayoutCount)
  {
    [(SUWebView *)self _setDrawInWebThread:0];
    objc_super v4 = [(SUWebView *)self _browserView];
    [v4 setPaused:1];

    int64_t synchronousLayoutCount = self->_synchronousLayoutCount;
  }
  self->_int64_t synchronousLayoutCount = synchronousLayoutCount + 1;
}

- (void)endSynchronousLayout
{
  int64_t synchronousLayoutCount = self->_synchronousLayoutCount;
  BOOL v3 = synchronousLayoutCount == 1;
  BOOL v4 = synchronousLayoutCount < 1;
  int64_t v5 = synchronousLayoutCount - 1;
  if (!v4)
  {
    self->_int64_t synchronousLayoutCount = v5;
    if (v3)
    {
      v7 = [(SUWebView *)self _browserView];
      [v7 setPaused:0];

      v8 = [(SUWebView *)self _browserView];
      [v8 forceLayout];

      [(SUWebView *)self forceDisplayIfNeeded];
      [(SUWebView *)self _setDrawInWebThread:1];
    }
  }
}

- (BOOL)getStatusBarStyle:(int64_t *)a3
{
  WebThreadLock();
  int64_t v5 = [(SUWebView *)self _browserView];
  v6 = [v5 webView];
  v7 = [v6 mainFrame];
  v8 = [v7 DOMDocument];

  if (!v8) {
    goto LABEL_7;
  }
  v9 = [v8 getElementsByTagName:@"meta"];
  if (![v9 length])
  {
LABEL_6:

LABEL_7:
    BOOL v14 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  while (1)
  {
    v11 = [v9 item:v10];
    v12 = [v11 getAttribute:@"name"];
    uint64_t v13 = [v12 caseInsensitiveCompare:@"apple-mobile-web-app-status-bar-style"];

    if (!v13) {
      break;
    }

    uint64_t v10 = (v10 + 1);
    if (v10 >= [v9 length]) {
      goto LABEL_6;
    }
  }
  int64_t v16 = [MEMORY[0x263F1CBA0] webClipStatusBarStyleForWebDocumentView:v5];

  if (a3) {
    *a3 = v16;
  }
  BOOL v14 = 1;
LABEL_8:

  return v14;
}

- (void)loadArchive:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  WebThreadRun();
}

void __25__SUWebView_loadArchive___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _browserView];
  v2 = [v4 webView];
  id v3 = [v2 mainFrame];
  [v3 loadArchive:*(void *)(a1 + 40)];
}

- (BOOL)isScrollingEnabled
{
  return (*((unsigned char *)self + 456) & 1) == 0;
}

- (void)setScrollingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SUWebView *)self _scrollView];
  *((unsigned char *)self + 456) = *((unsigned char *)self + 456) & 0xFE | !v3;
  [v5 setScrollsToTop:v3];
  [v5 setScrollEnabled:v3];
}

- (NSString)title
{
  v2 = [(SUWebView *)self _browserView];
  BOOL v3 = [v2 webView];
  id v4 = [v3 mainFrameTitle];

  return (NSString *)v4;
}

- (id)windowScriptObject
{
  BOOL v3 = [(SUWebView *)self _browserView];
  id v4 = [v3 webView];
  id v5 = [v4 windowScriptObject];

  if ([(SUWebView *)self isLoading])
  {
    v6 = [v5 valueForKey:@"document"];
    v7 = [v6 valueForKey:@"body"];

    if (!v7)
    {
      v8 = [(SUWebView *)self _browserView];
      uint64_t v9 = [v8 loadsSynchronously];
      [v8 setLoadsSynchronously:1];
      [(SUWebView *)self loadHTMLString:@"<html><head></head><body></body></html>" baseURL:0];
      [v8 setLoadsSynchronously:v9];
    }
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v11 = [v5 valueForKey:@"document"];
    [v10 setObject:v11 forKey:@"document"];

    v12 = [v5 valueForKey:@"iTunes"];
    [v10 setObject:v12 forKey:@"iTunes"];

    uint64_t v13 = [[SUScriptDictionary alloc] initWithDictionary:v10];
  }
  else
  {
    uint64_t v13 = v5;
  }

  return v13;
}

- (void)_setPinnedHeaderView:(id)a3 withTopInsetAdjustment:(double)a4
{
  v7 = (UIView *)a3;
  p_pinnedHeaderView = &self->_pinnedHeaderView;
  if (self->_pinnedHeaderView != v7)
  {
    BOOL v14 = v7;
    uint64_t v9 = [(SUWebView *)self _scrollView];
    [(UIView *)*p_pinnedHeaderView removeFromSuperview];
    objc_storeStrong((id *)&self->_pinnedHeaderView, a3);
    if (*p_pinnedHeaderView)
    {
      [v9 bounds];
      double v11 = v10;
      [(UIView *)v14 frame];
      double v13 = v12;
      [(UIView *)*p_pinnedHeaderView setAutoresizingMask:2];
      -[UIView setFrame:](*p_pinnedHeaderView, "setFrame:", 0.0, a4, v11, v13);
      [v9 _addContentSubview:*p_pinnedHeaderView atBack:0];
    }
    self->_pinnedHeaderInsetAdjustment = a4;

    v7 = v14;
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v5 = a3;
  [v5 contentInset];
  double v7 = v6;
  [v5 contentOffset];
  double v10 = v9;
  originalBackgroundColor = self->_originalBackgroundColor;
  if (v8 >= -v7)
  {
    if (originalBackgroundColor)
    {
      -[SUWebView setBackgroundColor:](self, "setBackgroundColor:");
      int64_t v16 = self->_originalBackgroundColor;
      self->_originalBackgroundColor = 0;
    }
    int originalShowsBackgroundShadow = self->_originalShowsBackgroundShadow;
    if (originalShowsBackgroundShadow != 255)
    {
      [v5 _setShowsBackgroundShadow:originalShowsBackgroundShadow != 0];
      self->_int originalShowsBackgroundShadow = -1;
    }
    if (self->_isPinned)
    {
      [(UIView *)self->_pinnedHeaderView frame];
      -[UIView setFrame:](self->_pinnedHeaderView, "setFrame:");
      self->_isPinned = 0;
    }
  }
  else
  {
    double v12 = v8;
    if (!originalBackgroundColor && self->_topBackgroundColor)
    {
      double v13 = [MEMORY[0x263F1C550] systemBackgroundColor];
      BOOL v14 = self->_originalBackgroundColor;
      self->_originalBackgroundColor = v13;

      [(SUWebView *)self setBackgroundColor:self->_topBackgroundColor];
    }
    if (self->_showsTopBackgroundShadow && self->_originalShowsBackgroundShadow == 255)
    {
      self->_int originalShowsBackgroundShadow = [v5 _showsBackgroundShadow];
      [v5 _setShowsBackgroundShadow:self->_showsTopBackgroundShadow];
    }
    pinnedHeaderView = self->_pinnedHeaderView;
    if (pinnedHeaderView)
    {
      [(UIView *)pinnedHeaderView frame];
      -[UIView setFrame:](self->_pinnedHeaderView, "setFrame:", v10, v12 + v7 + self->_pinnedHeaderInsetAdjustment);
      self->_isPinned = 1;
    }
  }
  if ([MEMORY[0x263F1CBB0] instancesRespondToSelector:a2])
  {
    v18.receiver = self;
    v18.super_class = (Class)SUWebView;
    [(SUWebView *)&v18 scrollViewDidScroll:v5];
  }
}

- (void)view:(id)a3 didSetFrame:(CGRect)a4 oldFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.size.height;
  double v10 = a4.size.width;
  double v11 = a4.origin.y;
  double v12 = a4.origin.x;
  id v14 = a3;
  v15 = [(SUWebView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v15, "webView:documentViewDidSetFrame:", self, v12, v11, v10, v9);
  }
  v16.receiver = self;
  v16.super_class = (Class)SUWebView;
  -[SUWebView view:didSetFrame:oldFrame:](&v16, sel_view_didSetFrame_oldFrame_, v14, v12, v11, v10, v9, x, y, width, height);
}

- (BOOL)showsTopBackgroundShadow
{
  return self->_showsTopBackgroundShadow;
}

- (void)setShowsTopBackgroundShadow:(BOOL)a3
{
  self->_showsTopBackgroundShadow = a3;
}

- (UIColor)topBackgroundColor
{
  return self->_topBackgroundColor;
}

- (void)setTopBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBackgroundColor, 0);
  objc_storeStrong((id *)&self->_pinnedHeaderView, 0);

  objc_storeStrong((id *)&self->_originalBackgroundColor, 0);
}

@end
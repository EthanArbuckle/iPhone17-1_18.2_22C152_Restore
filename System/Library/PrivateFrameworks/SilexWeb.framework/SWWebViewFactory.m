@interface SWWebViewFactory
- (NSPointerArray)webViews;
- (SWWebViewFactory)init;
- (id)createWebViewWithWebViewConfiguration:(id)a3 scrollSettings:(id)a4;
- (void)assignRelatedWebViewToConfiguration:(id)a3;
@end

@implementation SWWebViewFactory

- (SWWebViewFactory)init
{
  v6.receiver = self;
  v6.super_class = (Class)SWWebViewFactory;
  v2 = [(SWWebViewFactory *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    webViews = v2->_webViews;
    v2->_webViews = (NSPointerArray *)v3;
  }
  return v2;
}

- (id)createWebViewWithWebViewConfiguration:(id)a3 scrollSettings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SWWebViewFactory *)self assignRelatedWebViewToConfiguration:v7];
  v8 = [SWWebView alloc];
  v9 = -[SWWebView initWithFrame:configuration:](v8, "initWithFrame:configuration:", v7, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));

  v10 = [(SWWebView *)v9 scrollView];
  objc_msgSend(v10, "setScrollsToTop:", objc_msgSend(v6, "scrollsToTop"));

  v11 = [MEMORY[0x263F1C550] clearColor];
  [(SWWebView *)v9 setBackgroundColor:v11];

  [(SWWebView *)v9 setOpaque:0];
  v12 = [(SWWebView *)v9 scrollView];
  v13 = [MEMORY[0x263F1C550] clearColor];
  [v12 setBackgroundColor:v13];

  v14 = [(SWWebView *)v9 scrollView];
  objc_msgSend(v14, "setScrollEnabled:", objc_msgSend(v6, "scrollEnabled"));

  v15 = [(SWWebView *)v9 scrollView];
  uint64_t v16 = [v6 showsVerticalScrollIndicator];

  [v15 setShowsVerticalScrollIndicator:v16];
  v17 = [(SWWebView *)v9 scrollView];
  [v17 setShowsHorizontalScrollIndicator:0];

  v18 = [(SWWebView *)v9 scrollView];
  [v18 setContentInsetAdjustmentBehavior:2];

  v19 = [(SWWebViewFactory *)self webViews];
  [v19 addPointer:v9];

  return v9;
}

- (void)assignRelatedWebViewToConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(SWWebViewFactory *)self webViews];
  id v6 = [v5 allObjects];
  id v7 = [v6 firstObject];

  [v4 _setRelatedWebView:v7];
}

- (NSPointerArray)webViews
{
  return self->_webViews;
}

- (void).cxx_destruct
{
}

@end
@interface SearchUIWebCardSectionView
- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5;
- (SearchUIWebCardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4;
- (WKWebView)webView;
- (double)contentHeight;
- (id)replaceSemanticColor:(id)a3 withColor:(id)a4 inString:(id)a5;
- (id)setupContentView;
- (void)didMoveToWindow;
- (void)setContentHeight:(double)a3;
- (void)setWebView:(id)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation SearchUIWebCardSectionView

- (SearchUIWebCardSectionView)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)SearchUIWebCardSectionView;
  v4 = [(SearchUICardSectionView *)&v21 initWithRowModel:a3 feedbackDelegate:a4];
  v5 = v4;
  if (v4)
  {
    [(SearchUIWebCardSectionView *)v4 setContentHeight:1.0];
    v6 = objc_opt_new();
    [v6 setSuppressesIncrementalRendering:1];
    [v6 _setDrawsBackground:0];
    v7 = objc_opt_new();
    [v6 _setCanShowWhileLocked:1];
    id v8 = objc_alloc(MEMORY[0x1E4F466A8]);
    objc_msgSend(NSString, "stringWithFormat:", @"window.onload=function() { %@ %@ %@ };",
      @"var SearchUIEntries = document.body.getElementsByTagName('d:entry'); if (SearchUIEntries.length > 0) { var SearchUIFirst = SearchUIEntries[0].children; if (SearchUIFirst.length > 0) { SearchUIFirst[0].style.marginBlockStart = '0px'}; };",
      @"var viewport = document.createElement(\"meta\"); viewport.name = \"viewport\"; viewport.content = \"width=device-width, initial-scale=1, user-scalable=no\"; document.head.appendChild(viewport);",
    v9 = @"window.webkit.messageHandlers.sizeNotification.postMessage({ scrollHeight:document.body.scrollHeight })");;
    v10 = (void *)[v8 initWithSource:v9 injectionTime:1 forMainFrameOnly:1];
    [v7 addUserScript:v10];

    id v11 = objc_alloc(MEMORY[0x1E4F466A8]);
    objc_msgSend(NSString, "stringWithFormat:", @"window.onresize=function() { %@ };",
    v12 = @"window.webkit.messageHandlers.sizeNotification.postMessage({ scrollHeight:document.body.scrollHeight })");;
    v13 = (void *)[v11 initWithSource:v12 injectionTime:1 forMainFrameOnly:1];
    [v7 addUserScript:v13];

    [v7 addScriptMessageHandler:v5 name:@"sizeNotification"];
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F467C0]), "initWithSource:forMainFrameOnly:", @"\nhtml { -webkit-text-size-adjust: none; text-size-adjust: none; }\n",
                    1);
    [v7 _addUserStyleSheet:v14];
    [v6 setUserContentController:v7];
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F466F0]), "initWithFrame:configuration:", v6, 0.0, 0.0, 0.0, 0.0);
    [v15 setNavigationDelegate:v5];
    [v15 setAllowsBackForwardNavigationGestures:0];
    [v15 setAllowsLinkPreview:0];
    [v15 setUserInteractionEnabled:0];
    v16 = [v15 scrollView];
    [v16 setBounces:0];

    v17 = [v15 scrollView];
    [v17 setScrollEnabled:0];

    v18 = [v15 scrollView];
    [v18 setZoomEnabled:0];

    [v6 setIgnoresViewportScaleLimits:1];
    [v15 setOpaque:0];
    [(SearchUIWebCardSectionView *)v5 setWebView:v15];
    v19 = [(SearchUICardSectionView *)v5 contentView];
    [v19 addArrangedSubview:v15];
  }
  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIWebCardSectionView;
  [(SearchUIWebCardSectionView *)&v9 traitCollectionDidChange:v4];
  v5 = [(SearchUIWebCardSectionView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(SearchUIWebCardSectionView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  v6 = [(SearchUIWebCardSectionView *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUIWebCardSectionView;
  [(SearchUIWebCardSectionView *)&v3 didMoveToWindow];
  [(SearchUIWebCardSectionView *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SearchUIWebCardSectionView;
  [(SearchUIWebCardSectionView *)&v25 tlk_updateForAppearance:v4];
  v5 = [(SearchUICardSectionView *)self rowModel];
  v6 = [v5 cardSection];
  uint64_t v7 = [v6 htmlString];

  uint64_t v8 = [v7 stringByAppendingString:@"<style>body{margin: 0px !important}</style>"];

  objc_super v9 = [v4 primaryColor];
  v10 = [(SearchUIWebCardSectionView *)self replaceSemanticColor:@"-apple-system-label" withColor:v9 inString:v8];

  id v11 = [(SearchUIWebCardSectionView *)self replaceSemanticColor:@"text" withColor:v9 inString:v10];

  v12 = [(SearchUIWebCardSectionView *)self replaceSemanticColor:@"CanvasText" withColor:v9 inString:v11];

  v13 = [(SearchUIWebCardSectionView *)self replaceSemanticColor:@"linkColor" withColor:v9 inString:v12];

  v14 = [v4 secondaryColor];
  v15 = [(SearchUIWebCardSectionView *)self replaceSemanticColor:@"-apple-system-secondary-label" withColor:v14 inString:v13];

  v16 = [v4 tertiaryColor];
  v17 = [(SearchUIWebCardSectionView *)self replaceSemanticColor:@"-apple-system-tertiary-label" withColor:v16 inString:v15];

  v18 = [v4 quaternaryColor];
  v19 = [(SearchUIWebCardSectionView *)self replaceSemanticColor:@"window" withColor:v18 inString:v17];

  if ([v4 isDark]) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  v20 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  objc_super v21 = [(SearchUIWebCardSectionView *)self replaceSemanticColor:@"-apple-system-text-background" withColor:v20 inString:v19];

  v22 = [(SearchUIWebCardSectionView *)self webView];
  id v23 = (id)[v22 loadHTMLString:v21 baseURL:0];

  v24 = [(SearchUIWebCardSectionView *)self webView];
  [v4 enableAppearanceForView:v24];
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  v5 = objc_msgSend(a4, "body", a3);
  v6 = [v5 valueForKey:@"scrollHeight"];
  [v6 floatValue];
  double v8 = v7;

  [(SearchUIWebCardSectionView *)self contentHeight];
  if (v9 != v8)
  {
    [(SearchUIWebCardSectionView *)self setContentHeight:v8];
    v10 = [(SearchUIWebCardSectionView *)self webView];
    [v10 invalidateIntrinsicContentSize];

    [(SearchUICardSectionView *)self didInvalidateSizeAnimate:0];
  }
}

- (id)replaceSemanticColor:(id)a3 withColor:(id)a4 inString:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  double v19 = 0.0;
  double v20 = 0.0;
  uint64_t v17 = 0;
  double v18 = 0.0;
  [a4 getRed:&v20 green:&v19 blue:&v18 alpha:&v17];
  double v9 = [NSString stringWithFormat:@"rgba(%d, %d, %d, %f)", (int)(v20 * 255.0), (int)(v19 * 255.0), (int)(v18 * 255.0), v17];
  if ([v7 hasPrefix:@"-apple-system-"])
  {
    v10 = [v8 stringByReplacingOccurrencesOfString:v7 withString:v9];
  }
  else
  {
    id v11 = [NSString stringWithFormat:@"color: %@", v9];
    v12 = [NSString stringWithFormat:@"color: %@", v7];
    v13 = [v8 stringByReplacingOccurrencesOfString:v12 withString:v11];

    v14 = [NSString stringWithFormat:@"color : %@", v7];
    v15 = [v13 stringByReplacingOccurrencesOfString:v14 withString:v11];

    id v8 = v15;
    v10 = v8;
  }

  return v10;
}

- (id)setupContentView
{
  objc_super v3 = objc_opt_new();
  objc_msgSend(v3, "setMaximumLayoutSize:", 2147483650.0, 2147483650.0);
  [v3 setDelegate:self];
  [v3 setLayoutMarginsRelativeArrangement:1];
  [MEMORY[0x1E4FAE1A0] defaultLayoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(SearchUIWebCardSectionView *)self webView];
  [v12 layoutMargins];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  objc_msgSend(v3, "setLayoutMargins:", v5 - v14, v7 - v16, v9 - v18, v11 - v20);
  return v3;
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  double width = a4.width;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v17 = [(SearchUIWebCardSectionView *)self webView];
    [v17 layoutMargins];
    double v19 = v18;
    double v21 = v20;

    [(SearchUIWebCardSectionView *)self contentHeight];
    double v23 = v19 + v22;
    if (v14 != width)
    {
      objc_msgSend(v8, "setFrame:", v10, v12, width, v16);
      [v8 invalidateIntrinsicContentSize];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __91__SearchUIWebCardSectionView_containerView_systemLayoutSizeFittingSize_forArrangedSubview___block_invoke;
      block[3] = &unk_1E6E72730;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    double v24 = v21 + v23;
  }
  else
  {
    double width = *MEMORY[0x1E4F4BED8];
    double v24 = *(double *)(MEMORY[0x1E4F4BED8] + 8);
  }

  double v25 = width;
  double v26 = v24;
  result.height = v26;
  result.double width = v25;
  return result;
}

uint64_t __91__SearchUIWebCardSectionView_containerView_systemLayoutSizeFittingSize_forArrangedSubview___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didInvalidateSizeAnimate:0];
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  [a3 invalidateIntrinsicContentSize];
  [(SearchUICardSectionView *)self didInvalidateSizeAnimate:0];
}

- (double)contentHeight
{
  return self->_contentHeight;
}

- (void)setContentHeight:(double)a3
{
  self->_contentHeight = a3;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface RUIHTMLHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSURL)baseURL;
- (RUIHTMLHeaderView)initWithAttributes:(id)a3;
- (RUIHeaderDelegate)delegate;
- (double)_topPadding;
- (double)headerHeightForWidth:(double)a3 inView:(id)a4;
- (double)webViewWidth;
- (double)webViewWidthForWidth:(double)a3;
- (id)quoteEncodedStringWithString:(id)a3;
- (void)layoutSubviews;
- (void)setBaseURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterStyleText:(id)a3 attributes:(id)a4;
- (void)setHTMLContent:(id)a3 toElementsMatchingQuery:(id)a4;
- (void)setSectionIsFirst:(BOOL)a3;
- (void)setText:(id)a3 attributes:(id)a4;
- (void)webContainerView:(id)a3 didClickLinkWithURL:(id)a4;
- (void)webContainerViewContentDidChange:(id)a3;
@end

@implementation RUIHTMLHeaderView

- (RUIHTMLHeaderView)initWithAttributes:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RUIHTMLHeaderView;
  return -[RUIHTMLHeaderView initWithFrame:](&v4, sel_initWithFrame_, a3, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (void)setText:(id)a3 attributes:(id)a4
{
  id v14 = a3;
  [(RUIWebContainerView *)self->_webContainerView removeFromSuperview];
  webContainerView = self->_webContainerView;
  self->_webContainerView = 0;

  if (v14)
  {
    v6 = [RUIWebContainerView alloc];
    v7 = [v14 dataUsingEncoding:4];
    v8 = [(RUIHTMLHeaderView *)self baseURL];
    v9 = [(RUIWebContainerView *)v6 initWithContent:v7 baseURL:v8];
    v10 = self->_webContainerView;
    self->_webContainerView = v9;

    [(RUIWebContainerView *)self->_webContainerView setDelegate:self];
    v11 = NSString;
    v12 = RemoteUIHeaderCSSTextColor();
    objc_msgSend(v11, "stringWithFormat:", @"body { color: %@; font: -apple-system-footnote; line-height: 1.2em; } html { -webkit-text-size-adjust: none; }",
    v13 = v12);

    [(RUIWebContainerView *)self->_webContainerView setUserStyleSheet:v13];
    [(RUIHTMLHeaderView *)self addSubview:self->_webContainerView];
  }
}

- (void)setFooterStyleText:(id)a3 attributes:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if (v18)
  {
    webContainerView = self->_webContainerView;
    if (webContainerView)
    {
      v8 = [v18 dataUsingEncoding:4];
      [(RUIWebContainerView *)webContainerView updateContent:v8];
    }
    else
    {
      v9 = [RUIWebContainerView alloc];
      v10 = [v18 dataUsingEncoding:4];
      v11 = [(RUIHTMLHeaderView *)self baseURL];
      v12 = [(RUIWebContainerView *)v9 initWithContent:v10 baseURL:v11];
      v13 = self->_webContainerView;
      self->_webContainerView = v12;

      [(RUIWebContainerView *)self->_webContainerView setDelegate:self];
      id v14 = self->_webContainerView;
      v15 = NSString;
      v16 = RemoteUIFooterCSSTextColor();
      objc_msgSend(v15, "stringWithFormat:", @"body { color: %@; font: -apple-system-footnote; } html { -webkit-text-size-adjust: none; }",
      v17 = v16);
      [(RUIWebContainerView *)v14 setUserStyleSheet:v17];

      [(RUIHTMLHeaderView *)self addSubview:self->_webContainerView];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[RUIHTMLHeaderView headerHeightForWidth:inView:](self, "headerHeightForWidth:inView:", 0, a3.width, a3.height);
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (double)headerHeightForWidth:(double)a3 inView:(id)a4
{
  webContainerView = self->_webContainerView;
  -[RUIHTMLHeaderView webViewWidthForWidth:](self, "webViewWidthForWidth:", a4, a3);
  -[RUIWebContainerView heightForWidth:](webContainerView, "heightForWidth:");
  double v7 = v6;
  [(RUIHTMLHeaderView *)self _topPadding];
  return v7 + v8 + 6.0;
}

- (void)setSectionIsFirst:(BOOL)a3
{
  if (self->_isFirstSection != a3)
  {
    self->_isFirstSection = a3;
    [(RUIHTMLHeaderView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)RUIHTMLHeaderView;
  [(RUIHTMLHeaderView *)&v8 layoutSubviews];
  [(RUIWebContainerView *)self->_webContainerView frame];
  [(RUIHTMLHeaderView *)self webViewWidth];
  double v4 = v3;
  -[RUIWebContainerView heightForWidth:](self->_webContainerView, "heightForWidth:");
  double v6 = v5;
  [(RUIHTMLHeaderView *)self _topPadding];
  -[RUIWebContainerView setFrame:](self->_webContainerView, "setFrame:", 10.0, v7, v4, v6);
}

- (double)_topPadding
{
  double result = 22.0;
  if (!self->_isFirstSection) {
    return 16.0;
  }
  return result;
}

- (id)quoteEncodedStringWithString:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  double v4 = v3;
  if (v3)
  {
    double v5 = (void *)MEMORY[0x263F08900];
    v12[0] = v3;
    double v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    double v7 = [v5 dataWithJSONObject:v6 options:0 error:0];

    if (v7)
    {
      objc_super v8 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
      v9 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"[] "];
      v10 = [v8 stringByTrimmingCharactersInSet:v9];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setHTMLContent:(id)a3 toElementsMatchingQuery:(id)a4
{
  id v6 = a4;
  id v11 = [(RUIHTMLHeaderView *)self quoteEncodedStringWithString:a3];
  double v7 = [(RUIHTMLHeaderView *)self quoteEncodedStringWithString:v6];

  objc_msgSend(NSString, "stringWithFormat:", @"(function(){ document.querySelectorAll(%@).forEach(function(element) {element.innerHTML = %@}); })()",
    v7,
  objc_super v8 = v11);
  v9 = [(RUIWebContainerView *)self->_webContainerView webView];
  id v10 = (id)[v9 stringByEvaluatingJavaScriptFromString:v8];

  [(RUIHTMLHeaderView *)self setNeedsLayout];
}

- (double)webViewWidthForWidth:(double)a3
{
  return a3 + -20.0;
}

- (double)webViewWidth
{
  [(RUIHTMLHeaderView *)self bounds];
  [(RUIHTMLHeaderView *)self webViewWidthForWidth:v3];
  return result;
}

- (void)webContainerViewContentDidChange:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 headerViewDidChange:self];
  }
}

- (void)webContainerView:(id)a3 didClickLinkWithURL:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained headerView:self activatedLinkWithURL:v6];
}

- (RUIHeaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIHeaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webContainerView, 0);
}

@end
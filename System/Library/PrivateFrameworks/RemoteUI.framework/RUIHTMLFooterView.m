@interface RUIHTMLFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSURL)baseURL;
- (RUIHTMLFooterView)initWithAttributes:(id)a3;
- (RUITableFooterDelegate)delegate;
- (double)footerHeightForWidth:(double)a3 inView:(id)a4;
- (void)layoutSubviews;
- (void)setBaseURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setText:(id)a3 attributes:(id)a4;
- (void)webContainerView:(id)a3 didClickLinkWithURL:(id)a4;
@end

@implementation RUIHTMLFooterView

- (RUIHTMLFooterView)initWithAttributes:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RUIHTMLFooterView;
  return -[RUIHTMLFooterView initWithFrame:](&v4, sel_initWithFrame_, a3, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (void)setText:(id)a3 attributes:(id)a4
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
      v11 = [(RUIHTMLFooterView *)self baseURL];
      v12 = [(RUIWebContainerView *)v9 initWithContent:v10 baseURL:v11];
      v13 = self->_webContainerView;
      self->_webContainerView = v12;

      [(RUIWebContainerView *)self->_webContainerView setDelegate:self];
      v14 = self->_webContainerView;
      v15 = NSString;
      v16 = RemoteUIFooterCSSTextColor();
      objc_msgSend(v15, "stringWithFormat:", @"body { color: %@; font: -apple-system-footnote; line-height: 1.2em; } * { -webkit-text-size-adjust: none; } ",
      v17 = v16);
      [(RUIWebContainerView *)v14 setUserStyleSheet:v17];

      [(RUIHTMLFooterView *)self addSubview:self->_webContainerView];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[RUIHTMLFooterView footerHeightForWidth:inView:](self, "footerHeightForWidth:inView:", self, a3.width, a3.height);
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)RUIHTMLFooterView;
  [(RUIHTMLFooterView *)&v8 layoutSubviews];
  [(RUIWebContainerView *)self->_webContainerView frame];
  double v4 = v3;
  [(RUIHTMLFooterView *)self bounds];
  double v6 = v5;
  [(RUIWebContainerView *)self->_webContainerView heightForWidth:v5];
  -[RUIWebContainerView setFrame:](self->_webContainerView, "setFrame:", v4, 8.0, v6, v7);
}

- (double)footerHeightForWidth:(double)a3 inView:(id)a4
{
  -[RUIWebContainerView heightForWidth:](self->_webContainerView, "heightForWidth:", a4, a3);
  return v4 + 10.0;
}

- (void)webContainerView:(id)a3 didClickLinkWithURL:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained footerView:self activatedLinkWithURL:v6];
}

- (RUITableFooterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUITableFooterDelegate *)WeakRetained;
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
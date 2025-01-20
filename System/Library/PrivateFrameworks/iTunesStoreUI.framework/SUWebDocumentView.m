@interface SUWebDocumentView
- (NSString)stylesheet;
- (SUWebDocumentView)initWithFrame:(CGRect)a3;
- (id)loadDelegate;
- (void)dealloc;
- (void)setHTMLFragment:(id)a3;
- (void)setLoadDelegate:(id)a3;
- (void)setPlaintextString:(id)a3;
- (void)setStylesheet:(id)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7;
- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4;
@end

@implementation SUWebDocumentView

- (SUWebDocumentView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUWebDocumentView;
  v3 = -[UIWebTiledView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = (int)*MEMORY[0x263F1CD98];
    [*(id *)((char *)&v3->super.super.super.super.super.isa + v5) setFrameLoadDelegate:v3];
    [*(id *)((char *)&v4->super.super.super.super.super.isa + v5) setPolicyDelegate:v4];
    [(SUWebDocumentView *)v4 setAutoresizes:1];
    [(UIWebTiledView *)v4 setTilingEnabled:0];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v3 = (int)*MEMORY[0x263F1CD98];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setFrameLoadDelegate:0];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setPolicyDelegate:0];

  self->_stylesheet = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUWebDocumentView;
  [(UIWebTiledView *)&v4 dealloc];
}

- (void)setPlaintextString:(id)a3
{
  if (a3) {
    objc_super v4 = (__CFString *)a3;
  }
  else {
    objc_super v4 = &stru_26DB8C5F8;
  }
  uint64_t v5 = SUCreateHTMLForPlainText(v4, (uint64_t)self->_stylesheet);
  [(SUWebDocumentView *)self loadHTMLString:v5 baseURL:0];
}

- (void)setHTMLFragment:(id)a3
{
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"<html>"];
  stylesheet = self->_stylesheet;
  id v8 = v5;
  if (stylesheet)
  {
    [v5 appendFormat:@"<head><style type=\"text/css\">%@</style></head>", stylesheet];
    uint64_t v5 = v8;
  }
  objc_super v7 = &stru_26DB8C5F8;
  if (a3) {
    objc_super v7 = (__CFString *)a3;
  }
  [v5 appendFormat:@"<body>%@</body></html>", v7];
  [(SUWebDocumentView *)self loadHTMLString:v8 baseURL:0];
}

- (void)webView:(id)a3 didFinishLoadForFrame:(id)a4
{
  if ((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F1CD98]), "mainFrame", a3) == a4)
  {
    id loadDelegate = self->_loadDelegate;
    [loadDelegate webViewDidFinishLoading:self];
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 request:(id)a5 frame:(id)a6 decisionListener:(id)a7
{
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKey:", *MEMORY[0x263F1FB18]), "integerValue"))
  {
    [a7 use];
  }
  else
  {
    [a7 ignore];
    uint64_t v9 = [a5 URL];
    id v10 = +[SUClientDispatch clientInterface];
    SUOpenExternalURL(v9, v10);
  }
}

- (id)loadDelegate
{
  return self->_loadDelegate;
}

- (void)setLoadDelegate:(id)a3
{
  self->_id loadDelegate = a3;
}

- (NSString)stylesheet
{
  return self->_stylesheet;
}

- (void)setStylesheet:(id)a3
{
}

@end
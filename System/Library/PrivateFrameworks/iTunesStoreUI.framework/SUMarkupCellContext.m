@interface SUMarkupCellContext
- (NSString)stylesheet;
- (double)webViewWidth;
- (id)webViewForMarkup:(id)a3;
- (void)dealloc;
- (void)setStylesheet:(id)a3;
- (void)setWebViewWidth:(double)a3;
- (void)webViewDidFinishLoading:(id)a3;
@end

@implementation SUMarkupCellContext

- (void)dealloc
{
  self->_stylesheet = 0;
  webViewCache = self->_webViewCache;
  if (webViewCache)
  {
    CFRelease(webViewCache);
    self->_webViewCache = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUMarkupCellContext;
  [(SUItemCellContext *)&v4 dealloc];
}

- (id)webViewForMarkup:(id)a3
{
  webViewCache = self->_webViewCache;
  if (!webViewCache)
  {
    webViewCache = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x263EFFF90]);
    self->_webViewCache = webViewCache;
  }
  Value = (SUWebDocumentView *)CFDictionaryGetValue(webViewCache, a3);
  if (!Value)
  {
    [(SUMarkupCellContext *)self webViewWidth];
    double v8 = v7;
    Value = -[SUWebDocumentView initWithFrame:]([SUWebDocumentView alloc], "initWithFrame:", 0.0, 0.0, v7, 1.0);
    -[SUWebDocumentView setViewportSize:forDocumentTypes:](Value, "setViewportSize:forDocumentTypes:", 0xFFFFFFLL, v8, *MEMORY[0x263F1D7D0]);
    [(SUWebDocumentView *)Value setDrawsBackground:0];
    [(SUWebDocumentView *)Value setIgnoresKeyEvents:1];
    [(SUWebDocumentView *)Value setIgnoresFocusingMouse:1];
    [(SUWebDocumentView *)Value setLoadDelegate:self];
    [(SUWebDocumentView *)Value setLoadsSynchronously:1];
    [(SUWebDocumentView *)Value setUserInteractionEnabled:0];
    CFDictionarySetValue(self->_webViewCache, a3, Value);
    self->_pendingWebViewLoads += 2;
    [(SUWebDocumentView *)Value setStylesheet:[(SUMarkupCellContext *)self stylesheet]];
    [(SUWebDocumentView *)Value setHTMLFragment:a3];
    [(SUWebDocumentView *)Value frame];
    double v10 = v9;
    double v12 = v11;
    [(SUWebDocumentView *)Value documentBounds];
    -[SUWebDocumentView setFrame:](Value, "setFrame:", v10, v12);
  }
  return Value;
}

- (void)webViewDidFinishLoading:(id)a3
{
  int64_t pendingWebViewLoads = self->_pendingWebViewLoads;
  BOOL v4 = pendingWebViewLoads == 1;
  BOOL v5 = pendingWebViewLoads < 1;
  int64_t v6 = pendingWebViewLoads - 1;
  if (!v5)
  {
    self->_int64_t pendingWebViewLoads = v6;
    if (v4)
    {
      double v7 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
      [v7 postNotificationName:@"SUMarkupCellContextLoadedAllWebViewsNotifications" object:0];
    }
  }
}

- (NSString)stylesheet
{
  return self->_stylesheet;
}

- (void)setStylesheet:(id)a3
{
}

- (double)webViewWidth
{
  return self->_webViewWidth;
}

- (void)setWebViewWidth:(double)a3
{
  self->_webViewWidth = a3;
}

@end
@interface SUMarkupCell
- (SUMarkupCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)dealloc;
- (void)setBackgroundColor:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation SUMarkupCell

- (SUMarkupCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SUMarkupCell;
  v4 = [(SUTableCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(SUTableCellContentView *)v4->super._configurationView removeFromSuperview];
  }
  return v5;
}

- (void)dealloc
{
  self->_webView = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUMarkupCell;
  [(SUTableCell *)&v3 dealloc];
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUMarkupCell;
  -[SUMarkupCell setBackgroundColor:](&v5, sel_setBackgroundColor_);
  [(SUWebDocumentView *)self->_webView setBackgroundColor:a3];
}

- (void)setConfiguration:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUMarkupCell.m", 40, @"Configuration for markup cell must be markup configuration");
  }
  v8.receiver = self;
  v8.super_class = (Class)SUMarkupCell;
  [(SUTableCell *)&v8 setConfiguration:a3];
  v6 = (SUWebDocumentView *)objc_msgSend((id)objc_msgSend(a3, "context"), "webViewForMarkup:", objc_msgSend((id)objc_msgSend(a3, "representedObject"), "humanReadableDescription"));
  webView = self->_webView;
  if (v6 != webView)
  {
    [(SUWebDocumentView *)webView removeFromSuperview];

    self->_webView = v6;
    [(SUWebDocumentView *)self->_webView setBackgroundColor:[(SUMarkupCell *)self backgroundColor]];
    if (self->_webView) {
      objc_msgSend((id)-[SUMarkupCell contentView](self, "contentView"), "addSubview:", self->_webView);
    }
  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SUMarkupCell;
  [(SUTableCell *)&v4 setHighlighted:0 animated:0];
}

@end
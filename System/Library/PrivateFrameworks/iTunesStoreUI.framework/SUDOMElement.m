@interface SUDOMElement
+ (CGRect)frameForDOMElement:(id)a3;
- (CGRect)_frame;
- (CGRect)frame;
- (DOMElement)element;
- (NSString)innerText;
- (SUDOMElement)initWithDOMElement:(id)a3;
- (UIImage)imageRepresentation;
- (UIWebView)webView;
- (id)newImageView;
- (id)newLabelForElementWithText:(id)a3;
- (void)dealloc;
- (void)setProperty:(id)a3 value:(id)a4;
- (void)setWebView:(id)a3;
@end

@implementation SUDOMElement

- (SUDOMElement)initWithDOMElement:(id)a3
{
  v4 = [(SUDOMElement *)self init];
  if (v4) {
    v4->_element = (DOMElement *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUDOMElement;
  [(SUDOMElement *)&v3 dealloc];
}

+ (CGRect)frameForDOMElement:(id)a3
{
  WebThreadLock();
  if (a3) {
    [a3 innerFrameQuad];
  }
  double v4 = (float)0.0;
  double v5 = v4;
  double v6 = (float)((float)0.0 - (float)0.0);
  double v7 = v6;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)frame
{
  webView = self->_webView;
  if (webView)
  {
    [(SUDOMElement *)self _frame];
    -[UIWebView convertRect:toView:](webView, "convertRect:toView:", 0);
  }
  else
  {
    double v3 = *MEMORY[0x263F001A8];
    double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UIImage)imageRepresentation
{
  if (!self->_image)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (WebThreadLock(),
          double v3 = (void *)[(DOMElement *)self->_element dataRepresentation:0],
          [v3 length]))
    {
      double v4 = (UIImage *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v3];
      self->_image = v4;
      if (v4) {
        return self->_image;
      }
    }
    else if (self->_image)
    {
      return self->_image;
    }
    webView = self->_webView;
    [(SUDOMElement *)self _frame];
    uint64_t v6 = -[UIWebView newSnapshotWithRect:](webView, "newSnapshotWithRect:");
    if (v6)
    {
      double v7 = (CGImage *)v6;
      self->_image = (UIImage *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v6];
      CGImageRelease(v7);
    }
  }
  return self->_image;
}

- (NSString)innerText
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  double v3 = [(DOMElement *)self->_element innerText];
  uint64_t v4 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];

  return [(NSString *)v3 stringByTrimmingCharactersInSet:v4];
}

- (id)newImageView
{
  double v3 = [(SUDOMElement *)self imageRepresentation];
  if (v3)
  {
    double v3 = (UIImage *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v3];
    [(SUDOMElement *)self frame];
    -[UIImage setFrame:](v3, "setFrame:");
  }
  return v3;
}

- (id)newLabelForElementWithText:(id)a3
{
  double v5 = objc_msgSend((id)-[DOMElement ownerDocument](self->_element, "ownerDocument"), "getComputedStyle:pseudoElement:", self->_element, &stru_26DB8C5F8);
  uint64_t v6 = [v5 getPropertyValue:@"font-family"];
  double v7 = (void *)[v5 getPropertyCSSValue:@"font-size"];
  float v8 = -1.0;
  if (objc_opt_respondsToSelector())
  {
    [v7 getFloatValue:5];
    float v8 = v9;
  }
  v10 = (void *)[v5 getPropertyCSSValue:@"color"];
  if (objc_opt_respondsToSelector()) {
    v11 = (void *)[v10 getRGBColorValue];
  }
  else {
    v11 = 0;
  }
  v12 = 0;
  if (v6)
  {
    if (v8 > 0.00000011921)
    {
      id v13 = objc_alloc(MEMORY[0x263F1C768]);
      [(SUDOMElement *)self frame];
      v12 = objc_msgSend(v13, "initWithFrame:");
      objc_msgSend(v12, "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "clearColor"));
      objc_msgSend(v12, "setFont:", objc_msgSend(MEMORY[0x263F1C658], "fontWithFamilyName:traits:size:", v6, 2, v8));
      [v12 setText:a3];
      uint64_t v14 = [v11 color];
      if (v14) {
        objc_msgSend(v12, "setTextColor:", objc_msgSend(MEMORY[0x263F1C550], "colorWithCGColor:", v14));
      }
    }
  }
  return v12;
}

- (void)setProperty:(id)a3 value:(id)a4
{
  WebThreadLock();
  [(DOMCSSStyleDeclaration *)[(DOMElement *)self->_element style] setProperty:a3 value:a4 priority:@"important"];
  double v7 = (void *)[(UIWebView *)self->_webView _browserView];

  [v7 forceLayout];
}

- (CGRect)_frame
{
  objc_msgSend((id)-[UIWebView _scrollView](self->_webView, "_scrollView"), "contentOffset");
  double v4 = v3;
  double v6 = v5;
  [(id)objc_opt_class() frameForDOMElement:self->_element];
  double v10 = v9 - v4;
  double v12 = v11 - v6;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v12;
  result.origin.x = v10;
  return result;
}

- (DOMElement)element
{
  return self->_element;
}

- (UIWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
}

@end
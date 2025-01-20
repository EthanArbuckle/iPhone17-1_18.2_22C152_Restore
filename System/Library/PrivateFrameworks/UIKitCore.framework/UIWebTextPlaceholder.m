@interface UIWebTextPlaceholder
+ (UIWebTextPlaceholder)placeholderWithWebDocumentView:(id)a3;
- (DOMElement)element;
- (id)rects;
- (void)dealloc;
- (void)setElement:(id)a3;
@end

@implementation UIWebTextPlaceholder

+ (UIWebTextPlaceholder)placeholderWithWebDocumentView:(id)a3
{
  v4 = objc_alloc_init((Class)a1);
  v4[7] = a3;
  return (UIWebTextPlaceholder *)v4;
}

- (void)dealloc
{
  self->_webDocumentView = 0;

  v3.receiver = self;
  v3.super_class = (Class)UIWebTextPlaceholder;
  [(UIWebTextPlaceholder *)&v3 dealloc];
}

- (id)rects
{
  v3[1] = *MEMORY[0x1E4F143B8];
  [(UIWebDocumentView *)self->_webDocumentView frameForDictationResultPlaceholder:self->_element];
  v3[0] = +[UISimpleSelectionRect rectWithCGRect:](UISimpleSelectionRect, "rectWithCGRect:");
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (DOMElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

@end
@interface UITextPlaceholder
- (CGRect)caretRectBeforeInsertion;
- (NSArray)rects;
- (UITextPlaceholder)init;
- (_UITextPlaceholderAttachment)attachment;
- (void)setAttachment:(id)a3;
- (void)setCaretRectBeforeInsertion:(CGRect)a3;
- (void)setRects:(id)a3;
@end

@implementation UITextPlaceholder

- (UITextPlaceholder)init
{
  v6.receiver = self;
  v6.super_class = (Class)UITextPlaceholder;
  v2 = [(UITextPlaceholder *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_UITextPlaceholderAttachment);
    attachment = v2->_attachment;
    v2->_attachment = v3;
  }
  return v2;
}

- (NSArray)rects
{
  return self->_rects;
}

- (void)setRects:(id)a3
{
}

- (CGRect)caretRectBeforeInsertion
{
  double x = self->_caretRectBeforeInsertion.origin.x;
  double y = self->_caretRectBeforeInsertion.origin.y;
  double width = self->_caretRectBeforeInsertion.size.width;
  double height = self->_caretRectBeforeInsertion.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCaretRectBeforeInsertion:(CGRect)a3
{
  self->_caretRectBeforeInsertion = a3;
}

- (_UITextPlaceholderAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_rects, 0);
}

@end
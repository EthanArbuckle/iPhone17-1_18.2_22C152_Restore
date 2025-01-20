@interface PFXReviewWidgetText2
- (BOOL)isTitle;
- (TSDInfoGeometry)textGeometry;
- (TSWPStorage)textStorage;
- (void)dealloc;
- (void)setIsTitle:(BOOL)a3;
- (void)setTextGeometry:(id)a3;
- (void)setTextStorage:(id)a3;
@end

@implementation PFXReviewWidgetText2

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXReviewWidgetText2;
  [(PFXReviewWidgetAnswer2 *)&v3 dealloc];
}

- (TSWPStorage)textStorage
{
  return self->_textStorage;
}

- (void)setTextStorage:(id)a3
{
}

- (TSDInfoGeometry)textGeometry
{
  return self->_textGeometry;
}

- (void)setTextGeometry:(id)a3
{
}

- (BOOL)isTitle
{
  return self->_isTitle;
}

- (void)setIsTitle:(BOOL)a3
{
  self->_isTitle = a3;
}

@end
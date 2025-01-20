@interface _TUIElementTextParagraphStylingObject
- (double)indentFirstLine;
- (double)indentLeading;
- (double)indentTrailing;
- (void)setIndentFirstLine:(double)a3;
- (void)setIndentLeading:(double)a3;
- (void)setIndentTrailing:(double)a3;
@end

@implementation _TUIElementTextParagraphStylingObject

- (double)indentFirstLine
{
  return self->_indentFirstLine;
}

- (void)setIndentFirstLine:(double)a3
{
  self->_indentFirstLine = a3;
}

- (double)indentLeading
{
  return self->_indentLeading;
}

- (void)setIndentLeading:(double)a3
{
  self->_indentLeading = a3;
}

- (double)indentTrailing
{
  return self->_indentTrailing;
}

- (void)setIndentTrailing:(double)a3
{
  self->_indentTrailing = a3;
}

@end
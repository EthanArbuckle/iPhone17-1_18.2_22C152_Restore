@interface _TUIElementTextLineStylingObject
- (BOOL)relativeToDropLines;
- (int64_t)lines;
- (void)setLines:(int64_t)a3;
- (void)setRelativeToDropLines:(BOOL)a3;
@end

@implementation _TUIElementTextLineStylingObject

- (int64_t)lines
{
  return self->_lines;
}

- (void)setLines:(int64_t)a3
{
  self->_lines = a3;
}

- (BOOL)relativeToDropLines
{
  return self->_relativeToDropLines;
}

- (void)setRelativeToDropLines:(BOOL)a3
{
  self->_relativeToDropLines = a3;
}

@end
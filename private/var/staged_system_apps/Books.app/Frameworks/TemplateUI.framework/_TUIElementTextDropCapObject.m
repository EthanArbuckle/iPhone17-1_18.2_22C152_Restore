@interface _TUIElementTextDropCapObject
- (UIColor)backgroundColor;
- (double)padding;
- (unint64_t)charCount;
- (unint64_t)lines;
- (unint64_t)raised;
- (void)ensureParagraphBoundaryWithBuilder:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCharCount:(unint64_t)a3;
- (void)setLines:(unint64_t)a3;
- (void)setPadding:(double)a3;
- (void)setRaised:(unint64_t)a3;
@end

@implementation _TUIElementTextDropCapObject

- (void)ensureParagraphBoundaryWithBuilder:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->_ensuredParagraphBoundary)
  {
    self->_ensuredParagraphBoundary = 1;
    v7 = v4;
    char v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if (v6)
    {
      [v7 ensureParagraphBoundary];
      v5 = v7;
    }
  }
}

- (unint64_t)charCount
{
  return self->_charCount;
}

- (void)setCharCount:(unint64_t)a3
{
  self->_charCount = a3;
}

- (unint64_t)lines
{
  return self->_lines;
}

- (void)setLines:(unint64_t)a3
{
  self->_lines = a3;
}

- (unint64_t)raised
{
  return self->_raised;
}

- (void)setRaised:(unint64_t)a3
{
  self->_raised = a3;
}

- (double)padding
{
  return self->_padding;
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
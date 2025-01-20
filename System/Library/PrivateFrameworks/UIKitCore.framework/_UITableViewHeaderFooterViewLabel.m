@interface _UITableViewHeaderFooterViewLabel
- (CGSize)patternPhase;
- (_UITableViewHeaderFooterViewLabel)init;
- (void)drawRect:(CGRect)a3;
- (void)setPatternPhase:(CGSize)a3;
@end

@implementation _UITableViewHeaderFooterViewLabel

- (_UITableViewHeaderFooterViewLabel)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UITableViewHeaderFooterViewLabel;
  result = [(UIView *)&v3 init];
  if (result) {
    result->_patternPhase = (CGSize)*MEMORY[0x1E4F1DB30];
  }
  return result;
}

- (CGSize)patternPhase
{
  double width = self->_patternPhase.width;
  double height = self->_patternPhase.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPatternPhase:(CGSize)a3
{
  if (self->_patternPhase.width != a3.width || self->_patternPhase.height != a3.height)
  {
    self->_patternPhase = a3;
    [(UILabel *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (self->_patternPhase.width != *MEMORY[0x1E4F1DB30]
    || self->_patternPhase.height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      v10 = 0;
    }
    else {
      v10 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    [(_UITableViewHeaderFooterViewLabel *)self patternPhase];
    CGContextSetPatternPhase(v10, v13);
    v11 = [(UIView *)self backgroundColor];
    [v11 set];

    UIRectFillUsingOperation(1, x, y, width, height);
  }
  v12.receiver = self;
  v12.super_class = (Class)_UITableViewHeaderFooterViewLabel;
  -[UILabel drawRect:](&v12, sel_drawRect_, x, y, width, height);
}

@end
@interface _UITextUnderlineRect
+ (id)underlineRectWithRect:(CGRect)a3 offset:(double)a4 transform:(CGAffineTransform *)a5;
- (CGAffineTransform)transform;
- (CGRect)fullRect;
- (CGRect)rect;
- (UIColor)underlineColor;
- (UITextRange)associatedTextRange;
- (_UITextUnderlineRect)init;
- (id)description;
- (int64_t)underlineType;
- (void)setAssociatedTextRange:(id)a3;
- (void)setRect:(CGRect)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setUnderlineColor:(id)a3;
- (void)setUnderlineType:(int64_t)a3;
@end

@implementation _UITextUnderlineRect

+ (id)underlineRectWithRect:(CGRect)a3 offset:(double)a4 transform:(CGAffineTransform *)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11 = objc_alloc_init(_UITextUnderlineRect);
  -[_UITextUnderlineRect setRect:](v11, "setRect:", x, y, width, height);
  [(UITextSelectionRect *)v11 setBaselineOffset:a4];
  long long v12 = *(_OWORD *)&a5->c;
  v14[0] = *(_OWORD *)&a5->a;
  v14[1] = v12;
  v14[2] = *(_OWORD *)&a5->tx;
  [(_UITextUnderlineRect *)v11 setTransform:v14];
  [(_UITextUnderlineRect *)v11 setUnderlineType:1];
  return v11;
}

- (_UITextUnderlineRect)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UITextUnderlineRect;
  result = [(_UITextUnderlineRect *)&v5 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F1DAB8];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&result->_transform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&result->_transform.c = v4;
    *(_OWORD *)&result->_transform.tdouble x = *(_OWORD *)(v3 + 32);
  }
  return result;
}

- (CGRect)fullRect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(_UITextUnderlineRect *)self rect];
  objc_super v5 = NSStringFromCGRect(v10);
  [(UITextSelectionRect *)self baselineOffset];
  v7 = [v3 stringWithFormat:@"<%@: %p rect = %@; offset = %0.2f>", v4, self, v5, v6];;

  return v7;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[2].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[2].c;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.tdouble x = v3;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (UIColor)underlineColor
{
  return self->_underlineColor;
}

- (void)setUnderlineColor:(id)a3
{
}

- (int64_t)underlineType
{
  return self->_underlineType;
}

- (void)setUnderlineType:(int64_t)a3
{
  self->_underlineType = a3;
}

- (UITextRange)associatedTextRange
{
  return self->_associatedTextRange;
}

- (void)setAssociatedTextRange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedTextRange, 0);
  objc_storeStrong((id *)&self->_underlineColor, 0);
}

@end
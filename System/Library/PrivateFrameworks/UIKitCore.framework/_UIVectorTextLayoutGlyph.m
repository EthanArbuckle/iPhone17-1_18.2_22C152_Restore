@interface _UIVectorTextLayoutGlyph
- (CGAffineTransform)pathTransform;
- (CGRect)rect;
- (UIBezierPath)path;
- (unsigned)glyph;
- (void)setGlyph:(unsigned __int16)a3;
- (void)setPath:(id)a3;
- (void)setPathTransform:(CGAffineTransform *)a3;
- (void)setRect:(CGRect)a3;
@end

@implementation _UIVectorTextLayoutGlyph

- (unsigned)glyph
{
  return self->_glyph;
}

- (void)setGlyph:(unsigned __int16)a3
{
  self->_glyph = a3;
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

- (UIBezierPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (CGAffineTransform)pathTransform
{
  long long v3 = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[1].ty;
  return self;
}

- (void)setPathTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_pathTransform.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_pathTransform.c = v4;
  *(_OWORD *)&self->_pathTransform.a = v3;
}

- (void).cxx_destruct
{
}

@end
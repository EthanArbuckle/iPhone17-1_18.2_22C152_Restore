@interface WKQuadObject
- (CGRect)boundingBox;
- (WKQuadObject)initWithQuad:(_WKQuad *)a3;
- (_WKQuad)quad;
@end

@implementation WKQuadObject

- (WKQuadObject)initWithQuad:(_WKQuad *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WKQuadObject;
  result = [(WKQuadObject *)&v8 init];
  if (result)
  {
    CGPoint p1 = a3->p1;
    CGPoint p2 = a3->p2;
    CGPoint p3 = a3->p3;
    result->_quad.p4 = a3->p4;
    result->_quad.CGPoint p3 = p3;
    result->_quad.CGPoint p2 = p2;
    result->_quad.CGPoint p1 = p1;
  }
  return result;
}

- (_WKQuad)quad
{
  CGPoint v3 = *(CGPoint *)&self->p2.y;
  retstr->CGPoint p1 = *(CGPoint *)&self->p1.y;
  retstr->CGPoint p2 = v3;
  CGPoint v4 = *(CGPoint *)&self->p4.y;
  retstr->CGPoint p3 = *(CGPoint *)&self->p3.y;
  retstr->p4 = v4;
  return self;
}

- (CGRect)boundingBox
{
  double x = self->_quad.p1.x;
  double y = self->_quad.p1.y;
  double v4 = self->_quad.p2.x;
  double v5 = self->_quad.p2.y;
  if (v4 >= x) {
    double v6 = self->_quad.p1.x;
  }
  else {
    double v6 = self->_quad.p2.x;
  }
  double v7 = self->_quad.p3.x;
  double v8 = self->_quad.p3.y;
  if (v7 < v6) {
    double v6 = self->_quad.p3.x;
  }
  double v9 = self->_quad.p4.x;
  double v10 = self->_quad.p4.y;
  if (v9 < v6) {
    double v6 = self->_quad.p4.x;
  }
  if (v5 >= y) {
    double v11 = self->_quad.p1.y;
  }
  else {
    double v11 = self->_quad.p2.y;
  }
  if (v8 < v11) {
    double v11 = self->_quad.p3.y;
  }
  if (v10 < v11) {
    double v11 = self->_quad.p4.y;
  }
  if (x < v4) {
    double x = self->_quad.p2.x;
  }
  if (x < v7) {
    double x = self->_quad.p3.x;
  }
  if (x < v9) {
    double x = self->_quad.p4.x;
  }
  if (y < v5) {
    double y = self->_quad.p2.y;
  }
  if (y < v8) {
    double y = self->_quad.p3.y;
  }
  float v12 = x;
  float v13 = v11;
  float v14 = v6;
  if (y >= v10) {
    double v15 = y;
  }
  else {
    double v15 = self->_quad.p4.y;
  }
  float v16 = v15;
  double v17 = v14;
  double v18 = v13;
  double v19 = (float)(v12 - v14);
  double v20 = (float)(v16 - v13);
  result.size.height = v20;
  result.size.width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

@end
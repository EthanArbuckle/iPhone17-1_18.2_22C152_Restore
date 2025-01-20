@interface TMLVector
+ (void)initializeJSContext:(id)a3;
- (CGVector)vector;
- (TMLVector)initWithVector:(CGVector)a3;
- (double)dx;
- (double)dy;
- (id)CGVectorValue;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation TMLVector

- (TMLVector)initWithVector:(CGVector)a3
{
  CGFloat dy = a3.dy;
  CGFloat dx = a3.dx;
  v6.receiver = self;
  v6.super_class = (Class)TMLVector;
  result = [(TMLVector *)&v6 init];
  if (result)
  {
    result->_vector.CGFloat dx = dx;
    result->_vector.CGFloat dy = dy;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, v7, a3);
  double dx = self->_vector.dx;
  double dy = self->_vector.dy;
  return (id)objc_msgSend_initWithVector_(v8, v9, dx, dy);
}

- (id)CGVectorValue
{
  return (id)objc_msgSend_value_withObjCType_(MEMORY[0x263F08D40], a2, v2, &self->_vector, "{CGVector=dd}");
}

+ (void)initializeJSContext:(id)a3
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_239892BDC;
  v9[3] = &unk_264DAF908;
  v9[4] = a1;
  id v3 = a3;
  v4 = (void *)MEMORY[0x23ECA7DD0](v9);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, v6, v4, @"vector");
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, v8, v4, @"CGVectorMake");
}

- (double)dx
{
  return self->_vector.dx;
}

- (double)dy
{
  return self->_vector.dy;
}

- (CGVector)vector
{
  double dx = self->_vector.dx;
  double dy = self->_vector.dy;
  result.double dy = dy;
  result.double dx = dx;
  return result;
}

@end
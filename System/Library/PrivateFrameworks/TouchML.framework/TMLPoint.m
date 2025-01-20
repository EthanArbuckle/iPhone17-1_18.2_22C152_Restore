@interface TMLPoint
+ (void)initializeJSContext:(id)a3;
- (CGPoint)point;
- (TMLPoint)initWithPoint:(CGPoint)a3;
- (double)x;
- (double)y;
- (id)CGPointValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation TMLPoint

- (TMLPoint)initWithPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)TMLPoint;
  result = [(TMLPoint *)&v6 init];
  if (result)
  {
    result->_point.CGFloat x = x;
    result->_point.CGFloat y = y;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, v7, a3);
  double x = self->_point.x;
  double y = self->_point.y;
  return (id)objc_msgSend_initWithPoint_(v8, v9, x, y);
}

- (id)CGPointValue
{
  return (id)objc_msgSend_valueWithCGPoint_(MEMORY[0x263F08D40], a2, self->_point.x, self->_point.y);
}

+ (void)initializeJSContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  double v7 = objc_msgSend_initWithPoint_(v5, v6, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, v9, v7, @"CGPointZero");

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = sub_23986EE24;
  v25[3] = &unk_264DAE4E8;
  v25[4] = a1;
  v10 = (void *)MEMORY[0x23ECA7DD0](v25);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v11, v12, v10, @"point");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v13, v14, v10, @"CGPointMake");

  objc_msgSend_setObject_forKeyedSubscript_(v4, v15, v16, &unk_26ECED2E8, @"CGPointEqualToPoint");
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_23986EED8;
  v24[3] = &unk_264DAE528;
  v24[4] = a1;
  v17 = (void *)MEMORY[0x23ECA7DD0](v24);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v18, v19, v17, @"CGPointApplyAffineTransform");

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_23986EFA8;
  v23[3] = &unk_264DAE548;
  v23[4] = a1;
  v20 = (void *)MEMORY[0x23ECA7DD0](v23);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v21, v22, v20, @"CGPointMakeWithDictionaryRepresentation");
}

- (double)x
{
  return self->_point.x;
}

- (double)y
{
  return self->_point.y;
}

- (id)description
{
  return NSStringFromCGPoint(self->_point);
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end
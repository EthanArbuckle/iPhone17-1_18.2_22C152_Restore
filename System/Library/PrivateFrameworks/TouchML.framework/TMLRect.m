@interface TMLRect
+ (void)initializeJSContext:(id)a3;
- (CGRect)rect;
- (TMLPoint)maxpoint;
- (TMLPoint)midpoint;
- (TMLPoint)minpoint;
- (TMLPoint)origin;
- (TMLRect)initWithRect:(CGRect)a3;
- (TMLSize)size;
- (double)height;
- (double)maxx;
- (double)maxy;
- (double)midx;
- (double)midy;
- (double)minx;
- (double)miny;
- (double)width;
- (double)x;
- (double)y;
- (id)CGRectValue;
- (id)applyAffineTransform:(id)a3;
- (id)applyScale:(double)a3;
- (id)atOrigin:(id)a3;
- (id)atOriginX:(double)a3 y:(double)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)inset:(double)a3 :(double)a4;
- (id)integral;
- (id)max:(double)a3 :(double)a4;
- (id)min:(double)a3 :(double)a4;
- (id)offset:(double)a3 :(double)a4;
- (id)originInset:(double)a3 :(double)a4;
- (id)withHeight:(double)a3;
- (id)withWidth:(double)a3;
@end

@implementation TMLRect

- (TMLRect)initWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)TMLRect;
  result = [(TMLRect *)&v8 init];
  if (result)
  {
    result->_rect.origin.CGFloat x = x;
    result->_rect.origin.CGFloat y = y;
    result->_rect.size.CGFloat width = width;
    result->_rect.size.CGFloat height = height;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  objc_super v8 = objc_msgSend_allocWithZone_(v5, v6, v7, a3);
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  return (id)objc_msgSend_initWithRect_(v8, v9, x, y, width, height);
}

- (id)CGRectValue
{
  return (id)objc_msgSend_valueWithCGRect_(MEMORY[0x263F08D40], a2, self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
}

+ (void)initializeJSContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  double v7 = objc_msgSend_initWithRect_(v5, v6, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, v9, v7, @"CGRectZero");

  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = sub_239833004;
  v35[3] = &unk_264DAB7A8;
  v35[4] = a1;
  v10 = (void *)MEMORY[0x23ECA7DD0](v35);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v11, v12, v10, @"rect");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v13, v14, v10, @"CGRectMake");

  objc_msgSend_setObject_forKeyedSubscript_(v4, v15, v16, &unk_26ECEBB58, @"CGRectEqualToRect");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v17, v18, &unk_26ECEBB78, @"CGRectIntersectsRect");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v19, v20, &unk_26ECEBB98, @"CGRectContainsRect");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v21, v22, &unk_26ECEBBB8, @"CGRectContainsPoint");
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_2398332FC;
  v34[3] = &unk_264DAB808;
  v34[4] = a1;
  v23 = (void *)MEMORY[0x23ECA7DD0](v34);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v24, v25, v23, @"CGRectIntersection");

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_2398333D8;
  v33[3] = &unk_264DAB828;
  v33[4] = a1;
  v26 = (void *)MEMORY[0x23ECA7DD0](v33);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v27, v28, v26, @"CGRectInset");

  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_23983347C;
  v32[3] = &unk_264DAB848;
  v32[4] = a1;
  v29 = (void *)MEMORY[0x23ECA7DD0](v32);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v30, v31, v29, @"toRect");
}

- (double)x
{
  return self->_rect.origin.x;
}

- (double)y
{
  return self->_rect.origin.y;
}

- (double)width
{
  return self->_rect.size.width;
}

- (double)height
{
  return self->_rect.size.height;
}

- (TMLPoint)origin
{
  v3 = [TMLPoint alloc];
  id v5 = objc_msgSend_initWithPoint_(v3, v4, self->_rect.origin.x, self->_rect.origin.y);
  return (TMLPoint *)v5;
}

- (TMLSize)size
{
  v3 = [TMLSize alloc];
  id v5 = objc_msgSend_initWithSize_(v3, v4, self->_rect.size.width, self->_rect.size.height);
  return (TMLSize *)v5;
}

- (id)inset:(double)a3 :(double)a4
{
  id v7 = objc_alloc((Class)objc_opt_class());
  CGRect v12 = CGRectInset(self->_rect, a3, a4);
  double v9 = objc_msgSend_initWithRect_(v7, v8, v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  return v9;
}

- (id)originInset:(double)a3 :(double)a4
{
  id v7 = objc_alloc((Class)objc_opt_class());
  double v9 = objc_msgSend_initWithRect_(v7, v8, self->_rect.origin.x + a3, self->_rect.origin.y + a4, self->_rect.size.width - a3, self->_rect.size.height - a4);
  return v9;
}

- (id)offset:(double)a3 :(double)a4
{
  id v7 = objc_alloc((Class)objc_opt_class());
  CGRect v12 = CGRectOffset(self->_rect, a3, a4);
  double v9 = objc_msgSend_initWithRect_(v7, v8, v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  return v9;
}

- (id)withWidth:(double)a3
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double height = self->_rect.size.height;
  id v7 = objc_alloc((Class)objc_opt_class());
  double v9 = objc_msgSend_initWithRect_(v7, v8, x, y, a3, height);
  return v9;
}

- (id)withHeight:(double)a3
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  id v7 = objc_alloc((Class)objc_opt_class());
  double v9 = objc_msgSend_initWithRect_(v7, v8, x, y, width, a3);
  return v9;
}

- (id)atOriginX:(double)a3 y:(double)a4
{
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  id v8 = objc_alloc((Class)objc_opt_class());
  v10 = objc_msgSend_initWithRect_(v8, v9, a3, a4, width, height);
  return v10;
}

- (id)atOrigin:(id)a3
{
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  objc_msgSend_point(a3, a2, v3);
  double v7 = v6;
  double v9 = v8;
  id v10 = objc_alloc((Class)objc_opt_class());
  CGRect v12 = objc_msgSend_initWithRect_(v10, v11, v7, v9, width, height);
  return v12;
}

- (double)minx
{
  return CGRectGetMinX(self->_rect);
}

- (double)midx
{
  return CGRectGetMidX(self->_rect);
}

- (double)maxx
{
  return CGRectGetMaxX(self->_rect);
}

- (double)miny
{
  return CGRectGetMinY(self->_rect);
}

- (double)midy
{
  return CGRectGetMidY(self->_rect);
}

- (double)maxy
{
  return CGRectGetMaxY(self->_rect);
}

- (TMLPoint)minpoint
{
  double v3 = [TMLPoint alloc];
  objc_msgSend_minx(self, v4, v5);
  double v7 = v6;
  objc_msgSend_miny(self, v8, v6);
  v11 = objc_msgSend_initWithPoint_(v3, v9, v7, v10);
  return (TMLPoint *)v11;
}

- (TMLPoint)midpoint
{
  double v3 = [TMLPoint alloc];
  objc_msgSend_midx(self, v4, v5);
  double v7 = v6;
  objc_msgSend_midy(self, v8, v6);
  v11 = objc_msgSend_initWithPoint_(v3, v9, v7, v10);
  return (TMLPoint *)v11;
}

- (TMLPoint)maxpoint
{
  double v3 = [TMLPoint alloc];
  objc_msgSend_maxx(self, v4, v5);
  double v7 = v6;
  objc_msgSend_maxy(self, v8, v6);
  v11 = objc_msgSend_initWithPoint_(v3, v9, v7, v10);
  return (TMLPoint *)v11;
}

- (id)applyAffineTransform:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc((Class)objc_opt_class());
  if (v4) {
    objc_msgSend_transform(v4, v5, v7);
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  CGRect v13 = CGRectApplyAffineTransform(self->_rect, &v11);
  double v9 = objc_msgSend_initWithRect_(v6, v8, v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);

  return v9;
}

- (id)integral
{
  id v3 = objc_alloc((Class)objc_opt_class());
  CGRect v8 = CGRectIntegral(self->_rect);
  double v5 = objc_msgSend_initWithRect_(v3, v4, v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
  return v5;
}

- (id)min:(double)a3 :(double)a4
{
  id v7 = objc_alloc((Class)objc_opt_class());
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  if (width <= a3) {
    double width = a3;
  }
  if (height <= a4) {
    double height = a4;
  }
  CGAffineTransform v11 = objc_msgSend_initWithRect_(v7, v8, self->_rect.origin.x, self->_rect.origin.y, width, height);
  return v11;
}

- (id)max:(double)a3 :(double)a4
{
  id v7 = objc_alloc((Class)objc_opt_class());
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  if (width >= a3) {
    double width = a3;
  }
  if (height >= a4) {
    double height = a4;
  }
  CGAffineTransform v11 = objc_msgSend_initWithRect_(v7, v8, self->_rect.origin.x, self->_rect.origin.y, width, height);
  return v11;
}

- (id)applyScale:(double)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  if (a3 <= 0.0) {
    id v7 = objc_msgSend_initWithRect_(v5, v6, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  else {
    id v7 = objc_msgSend_initWithRect_(v5, v6, self->_rect.origin.x * a3, self->_rect.origin.y * a3, self->_rect.size.width * a3, self->_rect.size.height * a3);
  }
  return v7;
}

- (id)description
{
  return NSStringFromCGRect(self->_rect);
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

@end
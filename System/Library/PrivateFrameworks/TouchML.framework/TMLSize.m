@interface TMLSize
+ (void)initializeJSContext:(id)a3;
- (CGSize)size;
- (TMLSize)initWithSize:(CGSize)a3;
- (double)height;
- (double)width;
- (id)CGSizeValue;
- (id)asRect;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extend:(double)a3 :(double)a4;
- (id)max:(double)a3 :(double)a4;
- (id)min:(double)a3 :(double)a4;
- (id)scale:(double)a3 :(double)a4;
@end

@implementation TMLSize

- (TMLSize)initWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)TMLSize;
  result = [(TMLSize *)&v6 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, v7, a3);
  double width = self->_size.width;
  double height = self->_size.height;
  return (id)objc_msgSend_initWithSize_(v8, v9, width, height);
}

- (id)CGSizeValue
{
  return (id)objc_msgSend_valueWithCGSize_(MEMORY[0x263F08D40], a2, self->_size.width, self->_size.height);
}

+ (void)initializeJSContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  double v7 = objc_msgSend_initWithSize_(v5, v6, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  objc_msgSend_setObject_forKeyedSubscript_(v4, v8, v9, v7, @"CGSizeZero");

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_239839F48;
  v17[3] = &unk_264DABE00;
  v17[4] = a1;
  v10 = (void *)MEMORY[0x23ECA7DD0](v17);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v11, v12, v10, @"size");
  objc_msgSend_setObject_forKeyedSubscript_(v4, v13, v14, v10, @"CGSizeMake");

  objc_msgSend_setObject_forKeyedSubscript_(v4, v15, v16, &unk_26ECEBC18, @"CGSizeEqualToSize");
}

- (double)width
{
  return self->_size.width;
}

- (double)height
{
  return self->_size.height;
}

- (id)extend:(double)a3 :(double)a4
{
  id v7 = objc_alloc((Class)objc_opt_class());
  double v9 = objc_msgSend_initWithSize_(v7, v8, self->_size.width + a3, self->_size.height + a4);
  return v9;
}

- (id)scale:(double)a3 :(double)a4
{
  id v7 = objc_alloc((Class)objc_opt_class());
  double v9 = objc_msgSend_initWithSize_(v7, v8, self->_size.width * a3, self->_size.height * a4);
  return v9;
}

- (id)asRect
{
  v3 = [TMLRect alloc];
  id v5 = objc_msgSend_initWithRect_(v3, v4, 0.0, 0.0, self->_size.width, self->_size.height);
  return v5;
}

- (id)min:(double)a3 :(double)a4
{
  id v7 = objc_alloc((Class)objc_opt_class());
  double width = self->_size.width;
  double height = self->_size.height;
  if (width <= a3) {
    double width = a3;
  }
  if (height <= a4) {
    double height = a4;
  }
  v11 = objc_msgSend_initWithSize_(v7, v8, width, height);
  return v11;
}

- (id)max:(double)a3 :(double)a4
{
  id v7 = objc_alloc((Class)objc_opt_class());
  double width = self->_size.width;
  double height = self->_size.height;
  if (width >= a3) {
    double width = a3;
  }
  if (height >= a4) {
    double height = a4;
  }
  v11 = objc_msgSend_initWithSize_(v7, v8, width, height);
  return v11;
}

- (id)description
{
  return NSStringFromCGSize(self->_size);
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end
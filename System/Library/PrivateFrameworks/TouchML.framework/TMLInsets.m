@interface TMLInsets
+ (void)initializeJSContext:(id)a3;
- (TMLInsets)initWithInsets:(UIEdgeInsets)a3;
- (UIEdgeInsets)UIEdgeInsets;
- (double)bottom;
- (double)left;
- (double)right;
- (double)top;
- (id)UIEdgeInsetsValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation TMLInsets

- (TMLInsets)initWithInsets:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  CGFloat top = a3.top;
  v8.receiver = self;
  v8.super_class = (Class)TMLInsets;
  result = [(TMLInsets *)&v8 init];
  if (result)
  {
    result->_insets.CGFloat top = top;
    result->_insets.CGFloat left = left;
    result->_insets.CGFloat bottom = bottom;
    result->_insets.CGFloat right = right;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  objc_super v8 = objc_msgSend_allocWithZone_(v5, v6, v7, a3);
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  return (id)objc_msgSend_initWithInsets_(v8, v9, top, left, bottom, right);
}

- (id)UIEdgeInsetsValue
{
  return (id)objc_msgSend_valueWithUIEdgeInsets_(MEMORY[0x263F08D40], a2, self->_insets.top, self->_insets.left, self->_insets.bottom, self->_insets.right);
}

- (UIEdgeInsets)UIEdgeInsets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

+ (void)initializeJSContext:(id)a3
{
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_239852918;
  v11[3] = &unk_264DAC638;
  v11[4] = a1;
  id v3 = a3;
  v4 = (void *)MEMORY[0x23ECA7DD0](v11);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v5, v6, v4, @"insets");
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, v8, v4, @"UIEdgeInsetsMake");

  objc_msgSend_setObject_forKeyedSubscript_(v3, v9, v10, &unk_26ECEBFB8, @"UIEdgeInsetsEqualToEdgeInsets");
}

- (double)top
{
  return self->_insets.top;
}

- (double)left
{
  return self->_insets.left;
}

- (double)bottom
{
  return self->_insets.bottom;
}

- (double)right
{
  return self->_insets.right;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TMLInsets;
  v4 = [(TMLInsets *)&v8 description];
  double v6 = objc_msgSend_stringWithFormat_(v3, v5, self->_insets.top, @"%@{top: %.2f, left: %.2f, bottom: %.2f, right: %.2f", v4, *(void *)&self->_insets.top, *(void *)&self->_insets.left, *(void *)&self->_insets.bottom, *(void *)&self->_insets.right);

  return v6;
}

@end
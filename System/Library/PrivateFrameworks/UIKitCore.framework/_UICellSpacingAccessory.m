@interface _UICellSpacingAccessory
+ (id)accessoryWithIdentifier:(id)a3 size:(CGSize)a4;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (CGSize)sizeThatFits:(CGSize)a3;
- (id)view;
@end

@implementation _UICellSpacingAccessory

+ (id)accessoryWithIdentifier:(id)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS____UICellSpacingAccessory;
  objc_msgSendSuper2(&v8, sel_accessoryWithIdentifier_, a3);
  v6 = (CGFloat *)objc_claimAutoreleasedReturnValue();
  v6[5] = width;
  v6[6] = height;
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (double *)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UICellSpacingAccessory;
  if ([(_UICellAccessory *)&v7 isEqual:v4]) {
    BOOL v5 = v4[6] == self->_size.height && v4[5] == self->_size.width;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)view
{
  view = self->super._view;
  if (!view)
  {
    v4 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, self->_size.width, self->_size.height);
    BOOL v5 = self->super._view;
    self->super._view = v4;

    view = self->super._view;
  }
  return view;
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
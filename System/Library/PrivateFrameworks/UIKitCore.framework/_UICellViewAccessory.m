@interface _UICellViewAccessory
+ (id)accessoryWithIdentifier:(id)a3 view:(id)a4 options:(int64_t)a5;
+ (id)accessoryWithIdentifier:(id)a3 view:(id)a4 options:(int64_t)a5 reservedLayoutWidth:(double)a6;
- (BOOL)alwaysNeedsLayout;
- (BOOL)isEqual:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (int64_t)options;
- (void)setOptions:(int64_t)a3;
- (void)setView:(id)a3;
@end

@implementation _UICellViewAccessory

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int64_t options = self->_options;
  if ((options & 2) != 0)
  {
    BOOL v12 = [(UIView *)self->super._view _wantsAutolayout];
    view = self->super._view;
    if (v12) {
      -[UIView systemLayoutSizeFittingSize:](view, "systemLayoutSizeFittingSize:", 0.0, height);
    }
    else {
      -[UIView sizeThatFits:](view, "sizeThatFits:", width, height);
    }
    if (v11 >= height) {
      double v11 = height;
    }
  }
  else
  {
    v7 = self->super._view;
    if (options)
    {
      -[UIView sizeThatFits:](v7, "sizeThatFits:", a3.width, a3.height);
    }
    else
    {
      [(UIView *)v7 frame];
      double v9 = v8;
      double v11 = v10;
    }
  }
  result.double height = v11;
  result.double width = v9;
  return result;
}

+ (id)accessoryWithIdentifier:(id)a3 view:(id)a4 options:(int64_t)a5 reservedLayoutWidth:(double)a6
{
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS____UICellViewAccessory;
  id v9 = a4;
  double v10 = objc_msgSendSuper2(&v12, sel_accessoryWithIdentifier_, a3);
  objc_msgSend(v10, "setView:", v9, v12.receiver, v12.super_class);

  [v10 setOptions:a5];
  [v10 setReservedLayoutWidth:a6];
  return v10;
}

- (void)setView:(id)a3
{
}

- (void)setOptions:(int64_t)a3
{
  self->_int64_t options = a3;
}

- (BOOL)alwaysNeedsLayout
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

+ (id)accessoryWithIdentifier:(id)a3 view:(id)a4 options:(int64_t)a5
{
  return (id)[a1 accessoryWithIdentifier:a3 view:a4 options:a5 reservedLayoutWidth:0.0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UICellViewAccessory;
  if ([(_UICellAccessory *)&v12 isEqual:v4])
  {
    if ((self->_options & 4) != 0)
    {
      view = self->super._view;
      v7 = [v4 view];
      double v8 = view;
      id v9 = v7;
      double v10 = v9;
      if (v8 == v9)
      {
        char v5 = 1;
      }
      else
      {
        char v5 = 0;
        if (v8 && v9) {
          char v5 = [(UIView *)v8 isEqual:v9];
        }
      }
    }
    else
    {
      char v5 = 1;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (int64_t)options
{
  return self->_options;
}

@end
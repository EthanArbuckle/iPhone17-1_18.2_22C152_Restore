@interface UITableViewRowAction
+ (UITableViewRowAction)rowActionWithStyle:(UITableViewRowActionStyle)style title:(NSString *)title handler:(void *)handler;
- (NSString)title;
- (UIColor)backgroundColor;
- (UITableViewRowActionStyle)style;
- (UIVisualEffect)backgroundEffect;
- (id)_button;
- (id)_handler;
- (id)_initWithStyle:(int64_t)a3 title:(id)a4 handler:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBackgroundColor:(UIColor *)backgroundColor;
- (void)setBackgroundEffect:(UIVisualEffect *)backgroundEffect;
- (void)setTitle:(NSString *)title;
@end

@implementation UITableViewRowAction

+ (UITableViewRowAction)rowActionWithStyle:(UITableViewRowActionStyle)style title:(NSString *)title handler:(void *)handler
{
  v8 = handler;
  v9 = title;
  v10 = (void *)[objc_alloc((Class)a1) _initWithStyle:style title:v9 handler:v8];

  return (UITableViewRowAction *)v10;
}

- (id)_initWithStyle:(int64_t)a3 title:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UITableViewRowAction;
  v10 = [(UITableViewRowAction *)&v19 init];
  v11 = v10;
  if (v10)
  {
    v10->_style = a3;
    if (a3 == 1)
    {
      uint64_t v12 = +[UIColor colorWithRed:0.780392157 green:0.780392157 blue:0.8 alpha:1.0];
    }
    else
    {
      if (a3)
      {
LABEL_7:
        uint64_t v14 = [v8 copy];
        title = v11->_title;
        v11->_title = (NSString *)v14;

        uint64_t v16 = [v9 copy];
        id handler = v11->_handler;
        v11->_id handler = (id)v16;

        goto LABEL_8;
      }
      uint64_t v12 = +[UIColor systemRedColor];
    }
    backgroundColor = v11->_backgroundColor;
    v11->_backgroundColor = (UIColor *)v12;

    goto LABEL_7;
  }
LABEL_8:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(id)objc_opt_class() rowActionWithStyle:self->_style title:self->_title handler:self->_handler];
  [v4 setBackgroundColor:self->_backgroundColor];
  return v4;
}

- (id)_button
{
  return 0;
}

- (UITableViewRowActionStyle)style
{
  return self->_style;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(NSString *)title
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
}

- (UIVisualEffect)backgroundEffect
{
  return self->_backgroundEffect;
}

- (void)setBackgroundEffect:(UIVisualEffect *)backgroundEffect
{
}

- (id)_handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundEffect, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
@interface SUUIJSColor
- (SUUIJSColor)initWithAppContext:(id)a3 color:(id)a4;
- (double)alpha;
- (id)description;
- (unint64_t)blue;
- (unint64_t)green;
- (unint64_t)red;
@end

@implementation SUUIJSColor

- (SUUIJSColor)initWithAppContext:(id)a3 color:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUUIJSColor;
  v7 = [(IKJSObject *)&v13 initWithAppContext:a3];
  v8 = v7;
  if (v6 && v7)
  {
    double v11 = 0.0;
    double v12 = 0.0;
    double v10 = 0.0;
    [v6 getRed:&v12 green:&v11 blue:&v10 alpha:&v7->_alpha];
    v8->_red = (unint64_t)(v12 * 255.0);
    v8->_green = (unint64_t)(v11 * 255.0);
    v8->_blue = (unint64_t)(v10 * 255.0);
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"rgba(%lu,%lu,%lu,%f)", self->_red, self->_green, self->_blue, *(void *)&self->_alpha);
}

- (unint64_t)red
{
  return self->_red;
}

- (unint64_t)green
{
  return self->_green;
}

- (unint64_t)blue
{
  return self->_blue;
}

- (double)alpha
{
  return self->_alpha;
}

@end
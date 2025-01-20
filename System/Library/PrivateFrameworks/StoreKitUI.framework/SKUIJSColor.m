@interface SKUIJSColor
- (SKUIJSColor)initWithAppContext:(id)a3 color:(id)a4;
- (double)alpha;
- (id)description;
- (unint64_t)blue;
- (unint64_t)green;
- (unint64_t)red;
@end

@implementation SKUIJSColor

- (SKUIJSColor)initWithAppContext:(id)a3 color:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIJSColor initWithAppContext:color:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIJSColor;
  v8 = [(IKJSObject *)&v14 initWithAppContext:v6];
  v9 = v8;
  if (v7 && v8)
  {
    double v12 = 0.0;
    double v13 = 0.0;
    double v11 = 0.0;
    [v7 getRed:&v13 green:&v12 blue:&v11 alpha:&v8->_alpha];
    v9->_red = (unint64_t)(v13 * 255.0);
    v9->_green = (unint64_t)(v12 * 255.0);
    v9->_blue = (unint64_t)(v11 * 255.0);
  }

  return v9;
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

- (void)initWithAppContext:color:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIJSColor initWithAppContext:color:]";
}

@end
@interface _UIShadowProperties
+ (id)propertiesFromView:(id)a3;
- (CGSize)offset;
- (UIColor)color;
- (_UIShadowProperties)init;
- (double)opacity;
- (double)radius;
- (void)applyToView:(id)a3;
- (void)scaleBy:(double)a3;
- (void)setColor:(id)a3;
- (void)setOffset:(CGSize)a3;
- (void)setOpacity:(double)a3;
- (void)setRadius:(double)a3;
@end

@implementation _UIShadowProperties

- (_UIShadowProperties)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIShadowProperties;
  v2 = [(_UIShadowProperties *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(_UIShadowProperties *)v2 setOpacity:0.0];
    v4 = +[UIColor blackColor];
    [(_UIShadowProperties *)v3 setColor:v4];

    -[_UIShadowProperties setOffset:](v3, "setOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [(_UIShadowProperties *)v3 setRadius:0.0];
  }
  return v3;
}

+ (id)propertiesFromView:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 layer];
  [v5 shadowOpacity];
  [v4 setOpacity:v6];

  v7 = [v3 layer];
  v8 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v7 shadowColor]);
  [v4 setColor:v8];

  v9 = [v3 layer];
  [v9 shadowOffset];
  objc_msgSend(v4, "setOffset:");

  v10 = [v3 layer];

  [v10 shadowRadius];
  objc_msgSend(v4, "setRadius:");

  return v4;
}

- (void)applyToView:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIShadowProperties *)self color];
  uint64_t v6 = [v5 CGColor];
  v7 = [v4 layer];
  [v7 setShadowColor:v6];

  [(_UIShadowProperties *)self offset];
  double v9 = v8;
  double v11 = v10;
  v12 = [v4 layer];
  objc_msgSend(v12, "setShadowOffset:", v9, v11);

  [(_UIShadowProperties *)self radius];
  double v14 = v13;
  v15 = [v4 layer];
  [v15 setShadowRadius:v14];

  [(_UIShadowProperties *)self opacity];
  *(float *)&double v14 = v16;
  id v18 = [v4 layer];

  LODWORD(v17) = LODWORD(v14);
  [v18 setShadowOpacity:v17];
}

- (void)scaleBy:(double)a3
{
  [(_UIShadowProperties *)self radius];
  [(_UIShadowProperties *)self setRadius:v5 * a3];
  [(_UIShadowProperties *)self offset];
  double v7 = v6 * a3;
  [(_UIShadowProperties *)self offset];
  double v9 = v8 * a3;
  -[_UIShadowProperties setOffset:](self, "setOffset:", v7, v9);
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (CGSize)offset
{
  double width = self->_offset.width;
  double height = self->_offset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setOffset:(CGSize)a3
{
  self->_offset = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (void).cxx_destruct
{
}

@end
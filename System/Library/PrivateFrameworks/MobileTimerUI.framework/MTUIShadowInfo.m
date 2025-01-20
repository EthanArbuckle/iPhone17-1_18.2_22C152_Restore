@interface MTUIShadowInfo
- (CGSize)offset;
- (MTUIShadowInfo)initWithColor:(id)a3 radius:(double)a4 offset:(CGSize)a5 scale:(double)a6;
- (UIColor)color;
- (double)radius;
- (double)scale;
- (void)setColor:(id)a3;
- (void)setOffset:(CGSize)a3;
- (void)setRadius:(double)a3;
- (void)setScale:(double)a3;
@end

@implementation MTUIShadowInfo

- (MTUIShadowInfo)initWithColor:(id)a3 radius:(double)a4 offset:(CGSize)a5 scale:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MTUIShadowInfo;
  v12 = [(MTUIShadowInfo *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(MTUIShadowInfo *)v12 setColor:v11];
    [(MTUIShadowInfo *)v13 setRadius:a4];
    -[MTUIShadowInfo setOffset:](v13, "setOffset:", width, height);
    [(MTUIShadowInfo *)v13 setScale:a6];
  }

  return v13;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
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

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void).cxx_destruct
{
}

@end
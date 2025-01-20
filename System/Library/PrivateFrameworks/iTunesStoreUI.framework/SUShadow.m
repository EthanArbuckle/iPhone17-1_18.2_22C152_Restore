@interface SUShadow
+ (BOOL)supportsSecureCoding;
- (CGSize)offset;
- (SUShadow)initWithCoder:(id)a3;
- (UIColor)color;
- (double)opacity;
- (double)radius;
- (id)copyWithZone:(_NSZone *)a3;
- (void)applyToLayer:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setColor:(id)a3;
- (void)setOffset:(CGSize)a3;
- (void)setOpacity:(double)a3;
- (void)setRadius:(double)a3;
@end

@implementation SUShadow

- (SUShadow)initWithCoder:(id)a3
{
  v4 = [(SUShadow *)self init];
  if (v4)
  {
    v4->_color = (UIColor *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
    [a3 decodeCGSizeForKey:@"offset"];
    v4->_offset.width = v5;
    v4->_offset.height = v6;
    [a3 decodeFloatForKey:@"opacity"];
    v4->_opacity = v7;
    [a3 decodeFloatForKey:@"radius"];
    v4->_radius = v8;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  self->_color = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUShadow;
  [(SUShadow *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 8) = self->_color;
  *(CGSize *)(v4 + 16) = self->_offset;
  *(double *)(v4 + 32) = self->_opacity;
  *(double *)(v4 + 40) = self->_radius;
  return (id)v4;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUShadow.m", 53, @"Only supports keyed archiving");
  }
  [a3 encodeObject:self->_color forKey:@"color"];
  objc_msgSend(a3, "encodeCGSize:forKey:", @"offset", self->_offset.width, self->_offset.height);
  double opacity = self->_opacity;
  *(float *)&double opacity = opacity;
  [a3 encodeFloat:@"opacity" forKey:opacity];
  double radius = self->_radius;
  *(float *)&double radius = radius;

  [a3 encodeFloat:@"radius" forKey:radius];
}

- (void)applyToLayer:(id)a3
{
  color = self->_color;
  if (color) {
    objc_msgSend(a3, "setShadowColor:", -[UIColor CGColor](color, "CGColor"));
  }
  objc_msgSend(a3, "setShadowOffset:", self->_offset.width, self->_offset.height);
  double v6 = fmax(self->_opacity, 0.0);
  if (v6 > 1.0) {
    double v6 = 1.0;
  }
  *(float *)&double v6 = v6;
  [a3 setShadowOpacity:v6];
  double v7 = fabs(self->_radius);

  [a3 setShadowRadius:v7];
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

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_double opacity = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_double radius = a3;
}

@end
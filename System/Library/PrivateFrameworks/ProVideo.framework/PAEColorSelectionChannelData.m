@interface PAEColorSelectionChannelData
+ (BOOL)supportsSecureCoding;
- (PAEColorSelectionChannelData)initWithCoder:(id)a3;
- (double)frame;
- (double)radius;
- (double)radiusScale;
- (double)x;
- (double)y;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)action;
- (int)mode;
- (int)state;
- (int)style;
- (int)timeScale;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(int)a3;
- (void)setFrame:(double)a3;
- (void)setMode:(int)a3;
- (void)setRadius:(double)a3;
- (void)setRadiusScale:(double)a3;
- (void)setState:(int)a3;
- (void)setStyle:(int)a3;
- (void)setTimeScale:(int)a3;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
@end

@implementation PAEColorSelectionChannelData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PAEColorSelectionChannelData)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PAEColorSelectionChannelData;
  v4 = [(PAEColorSelectionChannelData *)&v11 init];
  if (v4)
  {
    v4->_mode = [a3 decodeIntForKey:@"mode"];
    v4->_state = [a3 decodeIntForKey:@"state"];
    v4->_action = [a3 decodeIntForKey:@"action"];
    v4->_style = [a3 decodeIntForKey:@"style"];
    [a3 decodeDoubleForKey:@"x"];
    v4->_x = v5;
    [a3 decodeDoubleForKey:@"y"];
    v4->_y = v6;
    [a3 decodeDoubleForKey:@"radius"];
    v4->_radius = v7;
    [a3 decodeDoubleForKey:@"radiusScale"];
    v4->_radiusScale = v8;
    [a3 decodeDoubleForKey:@"frame"];
    v4->_frame = v9;
    v4->_timeScale = [a3 decodeIntForKey:@"timeScale"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t mode = self->_mode;
  if (mode) {
    [a3 encodeInt:mode forKey:@"mode"];
  }
  uint64_t state = self->_state;
  if (state)
  {
    [a3 encodeInt:state forKey:@"state"];
    int v7 = self->_state;
    if (v7)
    {
      if (v7 != 3)
      {
        uint64_t action = self->_action;
        if (action) {
          [a3 encodeInt:action forKey:@"action"];
        }
        if (self->_x != 0.0) {
          objc_msgSend(a3, "encodeDouble:forKey:", @"x");
        }
        if (self->_y != 0.0) {
          objc_msgSend(a3, "encodeDouble:forKey:", @"y");
        }
        if (self->_radius != 0.0) {
          objc_msgSend(a3, "encodeDouble:forKey:", @"radius");
        }
        if (self->_radiusScale != 0.0) {
          objc_msgSend(a3, "encodeDouble:forKey:", @"radiusScale");
        }
      }
    }
  }
  if (self->_frame != 0.0) {
    objc_msgSend(a3, "encodeDouble:forKey:", @"frame");
  }
  uint64_t timeScale = self->_timeScale;
  if (timeScale) {
    [a3 encodeInt:timeScale forKey:@"timeScale"];
  }
  if (self->_style)
  {
    objc_msgSend(a3, "encodeInt:forKey:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((_DWORD *)result + 2) = self->_mode;
    *((_DWORD *)result + 3) = self->_state;
    *((_DWORD *)result + 4) = self->_action;
    *((_DWORD *)result + 5) = self->_style;
    *((void *)result + 3) = *(void *)&self->_x;
    *((void *)result + 4) = *(void *)&self->_y;
    *((void *)result + 5) = *(void *)&self->_radius;
    *((void *)result + 6) = *(void *)&self->_radiusScale;
    *((void *)result + 7) = *(void *)&self->_frame;
    *((_DWORD *)result + 16) = self->_timeScale;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p> mode=%x, state=%x, action=%x, style=%x, x=%.3f, y=%.3f, radius=%.3f, radiusScale=%.3f, frame=%.3f, timeScale=%d", NSStringFromClass(v4), self, self->_mode, self->_state, self->_action, self->_style, *(void *)&self->_x, *(void *)&self->_y, *(void *)&self->_radius, *(void *)&self->_radiusScale, *(void *)&self->_frame, self->_timeScale];
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_uint64_t mode = a3;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_uint64_t state = a3;
}

- (int)action
{
  return self->_action;
}

- (void)setAction:(int)a3
{
  self->_uint64_t action = a3;
}

- (int)style
{
  return self->_style;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
}

- (double)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (double)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (double)radiusScale
{
  return self->_radiusScale;
}

- (void)setRadiusScale:(double)a3
{
  self->_radiusScale = a3;
}

- (double)frame
{
  return self->_frame;
}

- (void)setFrame:(double)a3
{
  self->_frame = a3;
}

- (int)timeScale
{
  return self->_timeScale;
}

- (void)setTimeScale:(int)a3
{
  self->_uint64_t timeScale = a3;
}

@end
@interface RCPEventScreen
+ (BOOL)supportsSecureCoding;
- (CGSize)pointSize;
- (NSString)displayUUID;
- (RCPEventScreen)initWithCoder:(id)a3;
- (double)scale;
- (id)description;
- (unsigned)displayID;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayID:(unsigned int)a3;
- (void)setDisplayUUID:(id)a3;
- (void)setPointSize:(CGSize)a3;
- (void)setScale:(double)a3;
@end

@implementation RCPEventScreen

- (void).cxx_destruct
{
}

- (double)scale
{
  return self->_scale;
}

- (CGSize)pointSize
{
  double width = self->_pointSize.width;
  double height = self->_pointSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void)setPointSize:(CGSize)a3
{
  self->_pointSize = a3;
}

- (void)setDisplayUUID:(id)a3
{
}

- (void)setDisplayID:(unsigned int)a3
{
  self->_displayID = a3;
}

- (id)description
{
  double scale = self->_scale;
  if (scale <= 0.0) {
    objc_msgSend(NSString, "stringWithFormat:", @"%g×%g", *(void *)&self->_pointSize.width, *(void *)&self->_pointSize.height, v5);
  }
  else {
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%g×%g∙%g", *(void *)&self->_pointSize.width, *(void *)&self->_pointSize.height, *(void *)&scale);
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  double scale = self->_scale;
  id v5 = a3;
  [v5 encodeDouble:@"scale" forKey:scale];
  [v5 encodeDouble:@"width" forKey:self->_pointSize.width];
  [v5 encodeDouble:@"height" forKey:self->_pointSize.height];
}

- (RCPEventScreen)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RCPEventScreen *)self init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"scale"];
    v5->_double scale = v6;
    [v4 decodeDoubleForKey:@"width"];
    v5->_pointSize.double width = v7;
    [v4 decodeDoubleForKey:@"height"];
    v5->_pointSize.double height = v8;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (unsigned)displayID
{
  return self->_displayID;
}

@end
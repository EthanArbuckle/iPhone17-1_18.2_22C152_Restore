@interface BKMousePointerRegion
- (BKMousePointerRegion)initWithPointSize:(CGSize)a3 cornerRadius:(double)a4 scale:(double)a5 displayUUID:(id)a6;
- (BOOL)isEqual:(id)a3;
- (CGSize)pointSize;
- (NSString)displayUUID;
- (double)cornerRadius;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation BKMousePointerRegion

- (void).cxx_destruct
{
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (CGSize)pointSize
{
  double width = self->_pointSize.width;
  double height = self->_pointSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  double cornerRadius = self->_cornerRadius;
  double scale = self->_scale;
  displayUUID = self->_displayUUID;
  double width = self->_pointSize.width;
  double height = self->_pointSize.height;

  return [v4 initWithPointSize:displayUUID, width, height, cornerRadius, scale];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKMousePointerRegion *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && BSSizeEqualToSize()
      && BSFloatEqualToFloat()
      && BSFloatEqualToFloat())
    {
      char v6 = BSEqualObjects();
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_displayUUID hash];
}

- (id)description
{
  return +[NSString stringWithFormat:@"pointSize:%g,%g cornerRadius:%g scale:%g display:%@", *(void *)&self->_pointSize.width, *(void *)&self->_pointSize.height, *(void *)&self->_cornerRadius, *(void *)&self->_scale, self->_displayUUID];
}

- (BKMousePointerRegion)initWithPointSize:(CGSize)a3 cornerRadius:(double)a4 scale:(double)a5 displayUUID:(id)a6
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BKMousePointerRegion;
  v12 = [(BKMousePointerRegion *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_pointSize.CGFloat width = width;
    v12->_pointSize.CGFloat height = height;
    v12->_double cornerRadius = a4;
    v12->_double scale = a5;
    v14 = (NSString *)[v11 copy];
    displayUUID = v13->_displayUUID;
    v13->_displayUUID = v14;
  }
  return v13;
}

@end
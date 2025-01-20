@interface BKDisplayAnnotationShapeContent
+ (id)contentWithSize:(CGSize)a3;
- (BOOL)isEqual:(id)a3;
- (CGSize)shapeSize;
- (NSString)description;
- (void)setShapeSize:(CGSize)a3;
@end

@implementation BKDisplayAnnotationShapeContent

+ (id)contentWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setShapeSize:width, height];

  return v5;
}

- (void)setShapeSize:(CGSize)a3
{
  self->_shapeSize = a3;
}

- (CGSize)shapeSize
{
  double width = self->_shapeSize.width;
  double height = self->_shapeSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v4 shapeSize];
    BOOL v7 = self->_shapeSize.height == v6 && self->_shapeSize.width == v5;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendSize:@"shapeSize" withName:self->_shapeSize.width, self->_shapeSize.height];
  double v5 = [v3 build];

  return (NSString *)v5;
}

@end
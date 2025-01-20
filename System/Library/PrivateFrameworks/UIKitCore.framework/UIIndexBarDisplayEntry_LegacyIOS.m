@interface UIIndexBarDisplayEntry_LegacyIOS
- (CGPoint)baselinePoint;
- (CGRect)bounds;
- (CGRect)typeBounds;
- (UIImage)image;
- (id)description;
- (id)line;
- (void)setBaselinePoint:(CGPoint)a3;
- (void)setBounds:(CGRect)a3;
- (void)setImage:(id)a3;
- (void)setLine:(id)a3;
- (void)setTypeBounds:(CGRect)a3;
@end

@implementation UIIndexBarDisplayEntry_LegacyIOS

- (void)setTypeBounds:(CGRect)a3
{
  self->_typeBounds = a3;
}

- (void)setLine:(id)a3
{
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_line, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (CGRect)typeBounds
{
  double x = self->_typeBounds.origin.x;
  double y = self->_typeBounds.origin.y;
  double width = self->_typeBounds.size.width;
  double height = self->_typeBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)line
{
  return self->_line;
}

- (UIImage)image
{
  return self->_image;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@: %p", v5, self];

  [(UIIndexBarDisplayEntry_LegacyIOS *)self bounds];
  v6 = NSStringFromCGRect(v12);
  [v3 appendFormat:@", bounds:%@", v6];

  [(UIIndexBarDisplayEntry_LegacyIOS *)self typeBounds];
  v7 = NSStringFromCGRect(v13);
  [v3 appendFormat:@", typeBounds:%@", v7];

  [(UIIndexBarDisplayEntry_LegacyIOS *)self baselinePoint];
  v8 = NSStringFromCGPoint(v11);
  [v3 appendFormat:@", baselinePoint:%@", v8];

  [v3 appendFormat:@">"];
  return v3;
}

- (void)setImage:(id)a3
{
}

- (CGPoint)baselinePoint
{
  double x = self->_baselinePoint.x;
  double y = self->_baselinePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBaselinePoint:(CGPoint)a3
{
  self->_baselinePoint = a3;
}

@end
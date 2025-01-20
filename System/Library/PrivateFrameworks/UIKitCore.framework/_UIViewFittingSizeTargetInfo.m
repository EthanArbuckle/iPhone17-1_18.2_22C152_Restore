@interface _UIViewFittingSizeTargetInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTargetInfo:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation _UIViewFittingSizeTargetInfo

- (BOOL)isEqualToTargetInfo:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  float horizontalPriority = self->_horizontalPriority;
  if (!a3)
  {
    if (horizontalPriority == 0.0)
    {
      double v4 = 0.0;
      double v5 = 0.0;
      if (self->_verticalPriority == 0.0) {
        return self->_targetSize.height == v4 && self->_targetSize.width == v5;
      }
    }
    return 0;
  }
  if (horizontalPriority != *((float *)a3 + 3) || self->_verticalPriority != *((float *)a3 + 4)) {
    return 0;
  }
  double v5 = *((double *)a3 + 3);
  double v4 = *((double *)a3 + 4);
  return self->_targetSize.height == v4 && self->_targetSize.width == v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [(_UIViewFittingSizeTargetInfo *)self isEqualToTargetInfo:a3];
}

- (unint64_t)hash
{
  return (unint64_t)self->_targetSize.width;
}

- (id)description
{
  v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  if (self)
  {
    CGFloat width = self->_targetSize.width;
    CGFloat height = self->_targetSize.height;
    double horizontalPriority = self->_horizontalPriority;
    double verticalPriority = self->_verticalPriority;
  }
  else
  {
    double horizontalPriority = 0.0;
    CGFloat width = 0.0;
    CGFloat height = 0.0;
    double verticalPriority = 0.0;
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; targetSize = (%g, %g); double horizontalPriority = %g; verticalPriority = %g >",
               v5,
               self,
               *(void *)&width,
               *(void *)&height,
               *(void *)&horizontalPriority,
               *(void *)&verticalPriority);
}

@end
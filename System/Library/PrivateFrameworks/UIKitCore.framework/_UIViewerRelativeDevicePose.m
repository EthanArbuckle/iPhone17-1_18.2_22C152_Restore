@interface _UIViewerRelativeDevicePose
- (BOOL)isEqual:(id)a3;
- (UIOffset)_acceleratedOutputForViewerOffset:(UIOffset)a3 accelerationBoostFactor:(CGPoint)a4;
- (UIOffset)viewerOffset;
- (_UIViewerRelativeDevicePose)initWithCoder:(id)a3;
- (double)planarRotationAngle;
- (id)_acceleratedOutputRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_reset;
- (void)_setAcceleration:(CGPoint)a3 fixingOutputForViewerOffset:(UIOffset)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setPlanarRotationAngle:(double)a3;
- (void)setViewerOffset:(UIOffset)a3;
@end

@implementation _UIViewerRelativeDevicePose

- (void).cxx_destruct
{
}

- (UIOffset)viewerOffset
{
  double horizontal = self->_viewerOffset.horizontal;
  double vertical = self->_viewerOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (void)setViewerOffset:(UIOffset)a3
{
  self->_viewerOffset = a3;
}

- (UIOffset)_acceleratedOutputForViewerOffset:(UIOffset)a3 accelerationBoostFactor:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  v8 = [(_UIViewerRelativeDevicePose *)self _acceleratedOutputRange];
  objc_msgSend(v8, "acceleratedOutputForViewerOffset:accelerationBoostFactor:", horizontal, vertical, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double vertical = v14;
  result.double horizontal = v13;
  return result;
}

- (void)_setAcceleration:(CGPoint)a3 fixingOutputForViewerOffset:(UIOffset)a4
{
  double vertical = a4.vertical;
  double horizontal = a4.horizontal;
  double y = a3.y;
  double x = a3.x;
  id v8 = [(_UIViewerRelativeDevicePose *)self _acceleratedOutputRange];
  objc_msgSend(v8, "setAcceleration:fixingOutputForViewerOffset:", x, y, horizontal, vertical);
}

- (id)_acceleratedOutputRange
{
  acceleratedOutputRange = self->_acceleratedOutputRange;
  if (!acceleratedOutputRange)
  {
    v4 = objc_alloc_init(_UIMotionEffectAcceleratedOutputRange);
    v5 = self->_acceleratedOutputRange;
    self->_acceleratedOutputRange = v4;

    acceleratedOutputRange = self->_acceleratedOutputRange;
  }
  return acceleratedOutputRange;
}

- (void)_reset
{
  -[_UIViewerRelativeDevicePose setViewerOffset:](self, "setViewerOffset:", 0.0, 0.0);
  id v3 = [(_UIViewerRelativeDevicePose *)self _acceleratedOutputRange];
  [v3 reset];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (double *)v4;
    v6 = v5;
    BOOL v7 = self->_viewerOffset.horizontal == v5[3] && self->_viewerOffset.vertical == v5[4];
    if (v7 && self->_planarRotationAngle == v5[2])
    {
      acceleratedOutputRange = self->_acceleratedOutputRange;
      if ((unint64_t)acceleratedOutputRange | *((void *)v6 + 1)) {
        char v9 = -[_UIMotionEffectAcceleratedOutputRange isEqual:](acceleratedOutputRange, "isEqual:");
      }
      else {
        char v9 = 1;
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v2 = (unint64_t)(floor(self->_planarRotationAngle * 100.0)
                        + (double)(31
                                 * (unint64_t)(floor(self->_viewerOffset.vertical * 100.0)
                                                    + (double)(31
                                                             * (unint64_t)(floor(self->_viewerOffset.horizontal* 100.0)+ 31.0)))));
  return [(_UIMotionEffectAcceleratedOutputRange *)self->_acceleratedOutputRange hash] - v2 + 32 * v2;
}

- (_UIViewerRelativeDevicePose)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIViewerRelativeDevicePose;
  v5 = [(_UIViewerRelativeDevicePose *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"UIViewerOffset"];
    [v6 UIOffsetValue];
    v5->_viewerOffset.double horizontal = v7;
    v5->_viewerOffset.double vertical = v8;

    [v4 decodeFloatForKey:@"UIPlanarRotationAngle"];
    v5->_planarRotationAngle = v9;
    uint64_t v10 = [v4 decodeObjectForKey:@"UIAcceleratedOutputRange"];
    acceleratedOutputRange = v5->_acceleratedOutputRange;
    v5->_acceleratedOutputRange = (_UIMotionEffectAcceleratedOutputRange *)v10;

    double v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29238];
  UIOffset viewerOffset = self->_viewerOffset;
  id v5 = a3;
  v6 = [v4 valueWithBytes:&viewerOffset objCType:"{UIOffset=dd}"];
  objc_msgSend(v5, "encodeObject:forKey:", v6, @"UIViewerOffset", viewerOffset);

  double planarRotationAngle = self->_planarRotationAngle;
  *(float *)&double planarRotationAngle = planarRotationAngle;
  [v5 encodeFloat:@"UIPlanarRotationAngle" forKey:planarRotationAngle];
  [v5 encodeObject:self->_acceleratedOutputRange forKey:@"UIAcceleratedOutputRange"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(_UIViewerRelativeDevicePose);
  v4->_UIOffset viewerOffset = self->_viewerOffset;
  v4->_double planarRotationAngle = self->_planarRotationAngle;
  uint64_t v5 = [(_UIMotionEffectAcceleratedOutputRange *)self->_acceleratedOutputRange copy];
  acceleratedOutputRange = v4->_acceleratedOutputRange;
  v4->_acceleratedOutputRange = (_UIMotionEffectAcceleratedOutputRange *)v5;

  return v4;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = NSStringFromUIOffset(self->_viewerOffset);
  CGFloat v7 = [v3 stringWithFormat:@"<%@: %p offset=%@ angle=%f>", v5, self, v6, *(void *)&self->_planarRotationAngle];

  return v7;
}

- (double)planarRotationAngle
{
  return self->_planarRotationAngle;
}

- (void)setPlanarRotationAngle:(double)a3
{
  self->_double planarRotationAngle = a3;
}

@end
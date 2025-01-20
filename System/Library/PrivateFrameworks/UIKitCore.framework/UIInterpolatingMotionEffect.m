@interface UIInterpolatingMotionEffect
- (NSString)keyPath;
- (UIInterpolatingMotionEffect)init;
- (UIInterpolatingMotionEffect)initWithCoder:(NSCoder *)coder;
- (UIInterpolatingMotionEffect)initWithKeyPath:(NSString *)keyPath type:(UIInterpolatingMotionEffectType)type;
- (UIInterpolatingMotionEffectType)type;
- (double)_horizontalAccelerationBoostFactor;
- (double)_verticalAccelerationBoostFactor;
- (id)_keyPathsAndRelativeValuesForPose:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)a3;
- (id)maximumRelativeValue;
- (id)minimumRelativeValue;
- (void)_setHorizontalAccelerationBoostFactor:(double)a3;
- (void)_setKeyPath:(id)a3;
- (void)_setType:(int64_t)a3;
- (void)_setVerticalAccelerationBoostFactor:(double)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMaximumRelativeValue:(id)maximumRelativeValue;
- (void)setMinimumRelativeValue:(id)minimumRelativeValue;
@end

@implementation UIInterpolatingMotionEffect

- (id)_keyPathsAndRelativeValuesForPose:(id)a3
{
  id v4 = a3;
  [v4 viewerOffset];
  objc_msgSend(v4, "_acceleratedOutputForViewerOffset:accelerationBoostFactor:");
  double v6 = v5;
  double v8 = v7;

  return -[UIInterpolatingMotionEffect keyPathsAndRelativeValuesForViewerOffset:](self, "keyPathsAndRelativeValuesForViewerOffset:", v6, v8);
}

- (id)keyPathsAndRelativeValuesForViewerOffset:(UIOffset)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id minimumRelativeValue = self->_minimumRelativeValue;
  if (minimumRelativeValue && self->_maximumRelativeValue && self->_keyPath)
  {
    int64_t type = self->_type;
    if (type)
    {
      a3.horizontal = a3.vertical;
      if (type != 1) {
        abort();
      }
    }
    CGFloat v6 = a3.horizontal * 0.5 + 0.5;
    *(float *)&CGFloat v6 = v6;
    double v7 = objc_msgSend(minimumRelativeValue, "CA_interpolateValue:byFraction:", v6);
    keyPath = self->_keyPath;
    v11[0] = v7;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&keyPath count:1];
  }
  else
  {
    double v8 = 0;
  }
  return v8;
}

- (UIInterpolatingMotionEffect)initWithKeyPath:(NSString *)keyPath type:(UIInterpolatingMotionEffectType)type
{
  CGFloat v6 = keyPath;
  v12.receiver = self;
  v12.super_class = (Class)UIInterpolatingMotionEffect;
  double v7 = [(UIMotionEffect *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [(NSString *)v6 copy];
    v9 = v7->_keyPath;
    v7->_keyPath = (NSString *)v8;

    v7->_int64_t type = type;
    v10 = v7;
  }

  return v7;
}

- (void)setMinimumRelativeValue:(id)minimumRelativeValue
{
}

- (void)setMaximumRelativeValue:(id)maximumRelativeValue
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_maximumRelativeValue, 0);
  objc_storeStrong(&self->_minimumRelativeValue, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

- (UIInterpolatingMotionEffect)init
{
  return [(UIInterpolatingMotionEffect *)self initWithKeyPath:&stru_1ED0E84C0 type:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(UIInterpolatingMotionEffect);
  objc_storeStrong((id *)&v4->_keyPath, self->_keyPath);
  objc_storeStrong(&v4->_minimumRelativeValue, self->_minimumRelativeValue);
  objc_storeStrong(&v4->_maximumRelativeValue, self->_maximumRelativeValue);
  v4->_int64_t type = self->_type;
  v4->_horizontalAccelerationBoostFactor = self->_horizontalAccelerationBoostFactor;
  v4->_verticalAccelerationBoostFactor = self->_verticalAccelerationBoostFactor;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  keyPath = self->_keyPath;
  id v5 = a3;
  [v5 encodeObject:keyPath forKey:@"_keyPath"];
  objc_msgSend(v5, "CA_encodeObject:forKey:conditional:", self->_minimumRelativeValue, @"_minimumRelativeValue", 0);
  objc_msgSend(v5, "CA_encodeObject:forKey:conditional:", self->_maximumRelativeValue, @"_maximumRelativeValue", 0);
  [v5 encodeInteger:self->_type forKey:@"_type"];
  [v5 encodeDouble:@"_horizontalAccelerationBoostFactor" forKey:self->_horizontalAccelerationBoostFactor];
  [v5 encodeDouble:@"_verticalAccelerationBoostFactor" forKey:self->_verticalAccelerationBoostFactor];
}

- (UIInterpolatingMotionEffect)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v16.receiver = self;
  v16.super_class = (Class)UIInterpolatingMotionEffect;
  id v5 = [(UIMotionEffect *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [(NSCoder *)v4 decodeObjectForKey:@"_keyPath"];
    keyPath = v5->_keyPath;
    v5->_keyPath = (NSString *)v6;

    uint64_t v8 = [(NSCoder *)v4 CA_decodeObjectForKey:@"_minimumRelativeValue"];
    id minimumRelativeValue = v5->_minimumRelativeValue;
    v5->_id minimumRelativeValue = (id)v8;

    uint64_t v10 = [(NSCoder *)v4 CA_decodeObjectForKey:@"_maximumRelativeValue"];
    id maximumRelativeValue = v5->_maximumRelativeValue;
    v5->_id maximumRelativeValue = (id)v10;

    v5->_int64_t type = [(NSCoder *)v4 decodeIntegerForKey:@"_type"];
    [(NSCoder *)v4 decodeDoubleForKey:@"_horizontalAccelerationBoostFactor"];
    v5->_horizontalAccelerationBoostFactor = v12;
    [(NSCoder *)v4 decodeDoubleForKey:@"_verticalAccelerationBoostFactor"];
    v5->_verticalAccelerationBoostFactor = v13;
    v14 = v5;
  }

  return v5;
}

- (id)description
{
  unint64_t type = self->_type;
  if (type >= 3)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UIMotionEffect.m" lineNumber:289 description:@"Unknown motion type"];

    id v4 = @"unknown";
  }
  else
  {
    id v4 = *(&off_1E52FF070 + type);
  }
  double v7 = NSString;
  uint64_t v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  uint64_t v10 = [v7 stringWithFormat:@"<%@: %p type=%@ key=%@ minimumRelativeValue=%@ maximumRelativeValue=%@>"], v9, self, v4, self->_keyPath, self->_minimumRelativeValue, self->_maximumRelativeValue);

  return v10;
}

- (double)_horizontalAccelerationBoostFactor
{
  return self->_horizontalAccelerationBoostFactor;
}

- (void)_setHorizontalAccelerationBoostFactor:(double)a3
{
  self->_horizontalAccelerationBoostFactor = a3;
}

- (double)_verticalAccelerationBoostFactor
{
  return self->_verticalAccelerationBoostFactor;
}

- (void)_setVerticalAccelerationBoostFactor:(double)a3
{
  self->_verticalAccelerationBoostFactor = a3;
}

- (void)_setKeyPath:(id)a3
{
  if (self->_keyPath != a3)
  {
    id v4 = (NSString *)[a3 copy];
    keyPath = self->_keyPath;
    self->_keyPath = v4;
  }
}

- (void)_setType:(int64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (UIInterpolatingMotionEffectType)type
{
  return self->_type;
}

- (id)minimumRelativeValue
{
  return self->_minimumRelativeValue;
}

- (id)maximumRelativeValue
{
  return self->_maximumRelativeValue;
}

@end
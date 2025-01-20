@interface CMStrideCalDataContainer
+ (BOOL)supportsSecureCoding;
- (CMStrideCalDataContainer)initWithCoder:(id)a3;
- (CMStrideCalDataContainer)initWithTrack:(id)a3 session:(int64_t)a4;
- (CalibrationTrack)track;
- (double)gradient;
- (id)description;
- (int64_t)gradientValidity;
- (int64_t)session;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setGradient:(double)a3;
@end

@implementation CMStrideCalDataContainer

- (CMStrideCalDataContainer)initWithTrack:(id)a3 session:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CMStrideCalDataContainer;
  v6 = [(CMStrideCalDataContainer *)&v8 init];
  if (v6)
  {
    v6->_track = (CalibrationTrack *)a3;
    v6->_session = a4;
    v6->_gradient = 0.0;
    v6->_gradientValidity = -1;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMStrideCalDataContainer)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CMStrideCalDataContainer;
  v4 = [(CMStrideCalDataContainer *)&v7 init];
  if (v4)
  {
    v4->_track = (CalibrationTrack *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCMStrideCalDataContainerKeyTrack"];
    v4->_session = (int64_t)[a3 decodeIntegerForKey:@"kCMStrideCalDataContainerKeySession"];
    [a3 decodeDoubleForKey:@"kCMStrideCalDataContainerKeyGradient"];
    v4->_gradient = v5;
    v4->_gradientValidity = (int64_t)[a3 decodeIntegerForKey:@"kCMStrideCalDataContainerKeyGradientValidity"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_track forKey:@"kCMStrideCalDataContainerKeyTrack"];
  [a3 encodeInteger:self->_session forKey:@"kCMStrideCalDataContainerKeySession"];
  [a3 encodeDouble:@"kCMStrideCalDataContainerKeyGradient" forKey:self->_gradient];
  int64_t gradientValidity = self->_gradientValidity;

  [a3 encodeInteger:gradientValidity forKey:@"kCMStrideCalDataContainerKeyGradientValidity"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMStrideCalDataContainer;
  [(CMStrideCalDataContainer *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  double v5 = [(CMStrideCalDataContainer *)self track];
  id v6 = +[CMWorkout workoutName:[(CMStrideCalDataContainer *)self session]];
  [(CMStrideCalDataContainer *)self gradient];
  return +[NSString stringWithFormat:@"%@,Track,%@,Session,%@,Gradient,%0.6f,GradientValid,%ld", v4, v5, v6, v7, [(CMStrideCalDataContainer *)self gradientValidity]];
}

- (void)setGradient:(double)a3
{
  self->_gradient = a3;
  self->_int64_t gradientValidity = fabs(a3) <= 2.0;
}

- (CalibrationTrack)track
{
  return self->_track;
}

- (int64_t)session
{
  return self->_session;
}

- (double)gradient
{
  return self->_gradient;
}

- (int64_t)gradientValidity
{
  return self->_gradientValidity;
}

@end
@interface SCRCGestureEvent
- (BOOL)isCancelEvent;
- (CGPoint)averageLocation;
- (CGPoint)balancedLocation;
- (CGPoint)magneticLocation;
- (CGRect)fingerFrame;
- (SCRCGestureEvent)initWithDeviceIdentifier:(unint64_t)a3;
- (double)time;
- (id)description;
- (id)fingerAtIndex:(unint64_t)a3;
- (id)fingerWithIdentifier:(unint64_t)a3;
- (id)fingerWithoutIdentifier:(unint64_t)a3;
- (id)fingers;
- (unint64_t)deviceIdentifier;
- (unint64_t)fingerCount;
- (void)addFingerWithIdentifier:(unint64_t)a3 location:(CGPoint)a4 pressure:(double)a5;
- (void)addStylusWithIdentifier:(unint64_t)a3 location:(CGPoint)a4 pressure:(double)a5 altitude:(double)a6 azimuth:(double)a7;
- (void)dealloc;
- (void)removeFingerWithIdentifier:(unint64_t)a3;
- (void)setTime:(double)a3;
@end

@implementation SCRCGestureEvent

- (SCRCGestureEvent)initWithDeviceIdentifier:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCRCGestureEvent;
  v4 = [(SCRCGestureEvent *)&v6 init];
  if (v4)
  {
    v4->_time = CFAbsoluteTimeGetCurrent();
    v4->_deviceIdentifier = a3;
  }
  return v4;
}

- (void)dealloc
{
  if (self->_fingerCount)
  {
    unint64_t v3 = 0;
    finger = self->_finger;
    do
    {
      v5 = finger[v3];
      finger[v3] = 0;

      ++v3;
    }
    while (v3 < self->_fingerCount);
  }
  v6.receiver = self;
  v6.super_class = (Class)SCRCGestureEvent;
  [(SCRCGestureEvent *)&v6 dealloc];
}

- (id)description
{
  unint64_t v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = objc_opt_class();
  [(SCRCGestureEvent *)self time];
  objc_super v6 = [v3 stringWithFormat:@"[%@:%p] time: %lf, device: %lu, %lu fingers", v4, self, v5, self->_deviceIdentifier, self->_fingerCount];
  if (self->_fingerCount)
  {
    unint64_t v7 = 0;
    do
      [v6 appendFormat:@"\n\t%@", self->_finger[v7++]];
    while (v7 < self->_fingerCount);
  }
  return v6;
}

- (unint64_t)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)addFingerWithIdentifier:(unint64_t)a3 location:(CGPoint)a4 pressure:(double)a5
{
  if (self->_fingerCount <= 7)
  {
    double y = a4.y;
    CGFloat v7 = a4.y + self->_averageLocation.y;
    self->_averageLocation.x = a4.x + self->_averageLocation.x;
    self->_averageLocation.double y = v7;
    v8 = -[SCRCGestureFinger initWithIdentifier:location:pressure:]([SCRCGestureFinger alloc], "initWithIdentifier:location:pressure:", a3, a4.x, y, a5);
    v9 = &self->super.isa + self->_fingerCount;
    Class v10 = v9[2];
    v9[2] = (Class)v8;

    ++self->_fingerCount;
  }
}

- (void)addStylusWithIdentifier:(unint64_t)a3 location:(CGPoint)a4 pressure:(double)a5 altitude:(double)a6 azimuth:(double)a7
{
  if (self->_fingerCount <= 7)
  {
    double y = a4.y;
    CGFloat v9 = a4.y + self->_averageLocation.y;
    self->_averageLocation.x = a4.x + self->_averageLocation.x;
    self->_averageLocation.double y = v9;
    Class v10 = -[SCRCGestureStylus initWithIdentifier:location:pressure:altitude:azimuth:]([SCRCGestureStylus alloc], "initWithIdentifier:location:pressure:altitude:azimuth:", a3, a4.x, y, a5, a6, a7);
    v11 = &self->super.isa + self->_fingerCount;
    Class v12 = v11[2];
    v11[2] = (Class)v10;

    ++self->_fingerCount;
  }
}

- (void)removeFingerWithIdentifier:(unint64_t)a3
{
  unint64_t fingerCount = self->_fingerCount;
  self->_averageLocation = (CGPoint)*MEMORY[0x263F00148];
  if (fingerCount)
  {
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    p_averageLocation = (float64x2_t *)&self->_averageLocation;
    finger = self->_finger;
    do
    {
      CGFloat v9 = finger[v6];
      Class v10 = v9;
      if (*(void *)&v10->f64[1] == a3)
      {
        --fingerCount;
        v11 = finger[v6];
        finger[v6] = 0;
      }
      else
      {
        objc_storeStrong((id *)&finger[v7], v9);
        float64x2_t *p_averageLocation = vaddq_f64(v10[1], *p_averageLocation);
        ++v7;
      }

      ++v6;
      unint64_t v12 = self->_fingerCount;
    }
    while (v6 < v12);
    while (v7 < v12)
    {
      v13 = finger[v7];
      finger[v7] = 0;

      ++v7;
      unint64_t v12 = self->_fingerCount;
    }
  }
  self->_unint64_t fingerCount = fingerCount;
}

- (unint64_t)fingerCount
{
  return self->_fingerCount;
}

- (id)fingerAtIndex:(unint64_t)a3
{
  return self->_finger[a3];
}

- (id)fingerWithIdentifier:(unint64_t)a3
{
  unint64_t fingerCount = self->_fingerCount;
  if (fingerCount)
  {
    finger = self->_finger;
    while ((*finger)->_identifier != a3)
    {
      ++finger;
      if (!--fingerCount) {
        goto LABEL_5;
      }
    }
    uint64_t v5 = *finger;
  }
  else
  {
LABEL_5:
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)fingerWithoutIdentifier:(unint64_t)a3
{
  unint64_t fingerCount = self->_fingerCount;
  if (fingerCount)
  {
    finger = self->_finger;
    while ((*finger)->_identifier == a3)
    {
      ++finger;
      if (!--fingerCount) {
        goto LABEL_5;
      }
    }
    uint64_t v5 = *finger;
  }
  else
  {
LABEL_5:
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)fingers
{
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  if (self->_fingerCount)
  {
    unint64_t v4 = 0;
    do
      [v3 addObject:self->_finger[v4++]];
    while (self->_fingerCount > v4);
  }
  uint64_t v5 = (void *)[v3 copy];

  return v5;
}

- (CGRect)fingerFrame
{
  unint64_t fingerCount = self->_fingerCount;
  if (fingerCount)
  {
    CGFloat x = self->_finger[0]->_location.x;
    double y = self->_finger[0]->_location.y;
    double v6 = 0.0;
    if (fingerCount == 1)
    {
      double v7 = 0.0;
    }
    else
    {
      uint64_t v8 = 3;
      double v7 = 0.0;
      do
      {
        v11.origin.CGFloat x = *(CGFloat *)(*((void *)&self->super.isa + v8) + 16);
        v11.origin.double y = *(CGFloat *)(*((void *)&self->super.isa + v8) + 24);
        v11.size.width = 0.0;
        v11.size.height = 0.0;
        *(CGRect *)&CGFloat x = CGRectUnion(*(CGRect *)&x, v11);
        unint64_t v9 = v8++ - 1;
      }
      while (v9 < self->_fingerCount);
    }
  }
  else
  {
    CGFloat x = *MEMORY[0x263F001A8];
    double y = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  result.size.height = v6;
  result.size.width = v7;
  result.origin.double y = y;
  result.origin.CGFloat x = x;
  return result;
}

- (CGPoint)averageLocation
{
  unint64_t fingerCount = self->_fingerCount;
  if (fingerCount)
  {
    double v3 = self->_averageLocation.x / (double)fingerCount;
    double v4 = self->_averageLocation.y / (double)fingerCount;
  }
  else
  {
    double v3 = *MEMORY[0x263F00148];
    double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  result.double y = v4;
  result.CGFloat x = v3;
  return result;
}

- (CGPoint)balancedLocation
{
  [(SCRCGestureEvent *)self fingerFrame];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGFloat MidX = CGRectGetMidX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v11);
  double v8 = MidX;
  result.CGFloat y = MidY;
  result.CGFloat x = v8;
  return result;
}

- (BOOL)isCancelEvent
{
  return 0;
}

- (CGPoint)magneticLocation
{
  [(SCRCGestureEvent *)self fingerFrame];
  double v4 = v3 + v3 / (1.0 - v2) * v2;
  double v7 = v6 + v6 / (1.0 - v5) * v5;
  result.CGFloat y = v7;
  result.CGFloat x = v4;
  return result;
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (void).cxx_destruct
{
  for (uint64_t i = 72; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
}

@end
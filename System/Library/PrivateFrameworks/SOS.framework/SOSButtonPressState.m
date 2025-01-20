@interface SOSButtonPressState
+ (BOOL)supportsSecureCoding;
- (BOOL)volumeDownPressed;
- (BOOL)volumeUpPressed;
- (SOSButtonPressState)initWithCoder:(id)a3;
- (SOSButtonPressState)initWithVolumeUpPressed:(BOOL)a3 Timestamp:(double)a4 VolumeDownPressed:(BOOL)a5 Timestamp:(double)a6 LockPressedTimestamp:(double)a7;
- (double)getButtonPressGap;
- (double)lockPressedMCTTimestamp;
- (double)volumeDownPressedMCTTimestamp;
- (double)volumeUpPressedMCTTimestamp;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SOSButtonPressState

- (SOSButtonPressState)initWithVolumeUpPressed:(BOOL)a3 Timestamp:(double)a4 VolumeDownPressed:(BOOL)a5 Timestamp:(double)a6 LockPressedTimestamp:(double)a7
{
  v13.receiver = self;
  v13.super_class = (Class)SOSButtonPressState;
  result = [(SOSButtonPressState *)&v13 init];
  if (result)
  {
    result->_volumeUpPressed = a3;
    result->_volumeDownPressed = a5;
    result->_volumeUpPressedMCTTimestamp = a4;
    result->_volumeDownPressedMCTTimestamp = a6;
    result->_lockPressedMCTTimestamp = a7;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL volumeUpPressed = self->_volumeUpPressed;
  id v5 = a3;
  [v5 encodeBool:volumeUpPressed forKey:@"volumeUpPressed"];
  [v5 encodeBool:self->_volumeDownPressed forKey:@"volumeDownPressed"];
  [v5 encodeDouble:@"volumeUpPressedMCTTimestamp" forKey:self->_volumeUpPressedMCTTimestamp];
  [v5 encodeDouble:@"volumeDownPressedMCTTimestamp" forKey:self->_volumeDownPressedMCTTimestamp];
  [v5 encodeDouble:@"lockPressedMCTTimestamp" forKey:self->_lockPressedMCTTimestamp];
}

- (SOSButtonPressState)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SOSButtonPressState;
  id v5 = [(SOSButtonPressState *)&v10 init];
  if (v5)
  {
    v5->_BOOL volumeUpPressed = [v4 decodeBoolForKey:@"volumeUpPressed"];
    v5->_volumeDownPressed = [v4 decodeBoolForKey:@"volumeDownPressed"];
    [v4 decodeDoubleForKey:@"volumeUpPressedMCTTimestamp"];
    v5->_volumeUpPressedMCTTimestamp = v6;
    [v4 decodeDoubleForKey:@"volumeDownPressedMCTTimestamp"];
    v5->_volumeDownPressedMCTTimestamp = v7;
    [v4 decodeDoubleForKey:@"lockPressedMCTTimestamp"];
    v5->_lockPressedMCTTimestamp = v8;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = [(SOSButtonPressState *)self volumeUpPressed];
  [(SOSButtonPressState *)self volumeUpPressedMCTTimestamp];
  uint64_t v6 = v5;
  BOOL v7 = [(SOSButtonPressState *)self volumeDownPressed];
  [(SOSButtonPressState *)self volumeDownPressedMCTTimestamp];
  uint64_t v9 = v8;
  [(SOSButtonPressState *)self lockPressedMCTTimestamp];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"SOSButtonPressState,volumeUpPressed,%d,volumeUpPressedMCTTimestamp,%f,volumeDownPressed,%d,volumeDownPressedMCTTimestamp,%f,lockPressedMCTTimestamp,%f", v4, v6, v7, v9, v10);
}

- (double)getButtonPressGap
{
  if ([(SOSButtonPressState *)self volumeUpPressed])
  {
    [(SOSButtonPressState *)self volumeUpPressedMCTTimestamp];
    BOOL v4 = v3 > 0.0;
  }
  else
  {
    BOOL v4 = 0;
  }
  if ([(SOSButtonPressState *)self volumeDownPressed])
  {
    [(SOSButtonPressState *)self volumeDownPressedMCTTimestamp];
    BOOL v6 = v5 > 0.0;
  }
  else
  {
    BOOL v6 = 0;
  }
  [(SOSButtonPressState *)self lockPressedMCTTimestamp];
  if (v7 <= 0.0 || !v4 && !v6) {
    return -1.0;
  }
  if (!v6)
  {
    [(SOSButtonPressState *)self lockPressedMCTTimestamp];
    double v14 = v13;
    [(SOSButtonPressState *)self volumeUpPressedMCTTimestamp];
    return vabdd_f64(v14, v15);
  }
  if (!v4)
  {
    [(SOSButtonPressState *)self lockPressedMCTTimestamp];
    double v14 = v16;
    [(SOSButtonPressState *)self volumeDownPressedMCTTimestamp];
    return vabdd_f64(v14, v15);
  }
  [(SOSButtonPressState *)self volumeUpPressedMCTTimestamp];
  double v9 = v8;
  [(SOSButtonPressState *)self volumeDownPressedMCTTimestamp];
  if (v9 <= v10) {
    [(SOSButtonPressState *)self volumeUpPressedMCTTimestamp];
  }
  else {
    [(SOSButtonPressState *)self volumeDownPressedMCTTimestamp];
  }
  double v17 = v11;
  [(SOSButtonPressState *)self lockPressedMCTTimestamp];
  return vabdd_f64(v18, v17);
}

- (BOOL)volumeUpPressed
{
  return self->_volumeUpPressed;
}

- (BOOL)volumeDownPressed
{
  return self->_volumeDownPressed;
}

- (double)volumeUpPressedMCTTimestamp
{
  return self->_volumeUpPressedMCTTimestamp;
}

- (double)volumeDownPressedMCTTimestamp
{
  return self->_volumeDownPressedMCTTimestamp;
}

- (double)lockPressedMCTTimestamp
{
  return self->_lockPressedMCTTimestamp;
}

@end
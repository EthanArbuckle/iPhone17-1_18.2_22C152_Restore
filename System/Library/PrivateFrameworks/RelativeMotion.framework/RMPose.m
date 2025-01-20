@interface RMPose
+ (BOOL)supportsSecureCoding;
- (RMAttitude)attitude;
- (RMPose)initWithCoder:(id)a3;
- (double)consumedAuxTimestamp;
- (double)machAbsTimestamp;
- (double)receivedAuxTimestamp;
- (id)_initWithAttitude:(id)a3 consumedAuxTimestamp:(double)a4 receivedAuxTimestamp:(double)a5 machAbsTimestamp:(double)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMachAbsTimestamp:(double)a3;
@end

@implementation RMPose

- (id)_initWithAttitude:(id)a3 consumedAuxTimestamp:(double)a4 receivedAuxTimestamp:(double)a5 machAbsTimestamp:(double)a6
{
  id v11 = a3;
  [v11 timestamp];
  v15.receiver = self;
  v15.super_class = (Class)RMPose;
  v12 = -[RMLogItem _initWithTimestamp:](&v15, sel__initWithTimestamp_);
  v13 = (double *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 2, a3);
    v13[3] = a4;
    v13[4] = a5;
    v13[5] = a6;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMPose)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RMPose;
  v5 = [(RMLogItem *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RMPoseEncodingKeyAttitude"];
    attitude = v5->_attitude;
    v5->_attitude = (RMAttitude *)v6;

    [v4 decodeDoubleForKey:@"RMPoseEncodingKeyConsumedAuxTimestamp"];
    v5->_consumedAuxTimestamp = v8;
    [v4 decodeDoubleForKey:@"RMPoseEncodingKeyReceivedAuxTimestamp"];
    v5->_receivedAuxTimestamp = v9;
    [v4 decodeDoubleForKey:@"RMPoseEncodingKeyMachAbsTimestamp"];
    v5->_machAbsTimestamp = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RMPose;
  id v4 = a3;
  [(RMLogItem *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_attitude, @"RMPoseEncodingKeyAttitude", v5.receiver, v5.super_class);
  [v4 encodeDouble:@"RMPoseEncodingKeyConsumedAuxTimestamp" forKey:self->_consumedAuxTimestamp];
  [v4 encodeDouble:@"RMPoseEncodingKeyReceivedAuxTimestamp" forKey:self->_receivedAuxTimestamp];
  [v4 encodeDouble:@"RMPoseEncodingKeyMachAbsTimestamp" forKey:self->_machAbsTimestamp];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(RMLogItem *)self timestamp];
  objc_super v5 = objc_msgSend(v4, "_initWithTimestamp:");
  if (v5)
  {
    uint64_t v6 = [(RMPose *)self attitude];
    v7 = (void *)v5[2];
    v5[2] = v6;

    [(RMPose *)self consumedAuxTimestamp];
    v5[3] = v8;
    [(RMPose *)self receivedAuxTimestamp];
    v5[4] = v9;
    [(RMPose *)self machAbsTimestamp];
    v5[5] = v10;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  [(RMAttitude *)self->_attitude quaternion];
  uint64_t v5 = v4;
  [(RMAttitude *)self->_attitude quaternion];
  uint64_t v7 = v6;
  [(RMAttitude *)self->_attitude quaternion];
  uint64_t v9 = v8;
  [(RMAttitude *)self->_attitude quaternion];
  uint64_t v11 = v10;
  double consumedAuxTimestamp = self->_consumedAuxTimestamp;
  double receivedAuxTimestamp = self->_receivedAuxTimestamp;
  double machAbsTimestamp = self->_machAbsTimestamp;
  [(RMLogItem *)self timestamp];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"RMPose,q.x,%f,q.y,%f,q.z,%f,q.w,%f,consumedAuxTimestamp,%f,receivedAuxTimestamp,%f,machAbsTimestamp,%f,timestamp,%f", v5, v7, v9, v11, *(void *)&consumedAuxTimestamp, *(void *)&receivedAuxTimestamp, *(void *)&machAbsTimestamp, v15);
}

- (RMAttitude)attitude
{
  return self->_attitude;
}

- (double)consumedAuxTimestamp
{
  return self->_consumedAuxTimestamp;
}

- (double)receivedAuxTimestamp
{
  return self->_receivedAuxTimestamp;
}

- (double)machAbsTimestamp
{
  return self->_machAbsTimestamp;
}

- (void)setMachAbsTimestamp:(double)a3
{
  self->_double machAbsTimestamp = a3;
}

- (void).cxx_destruct
{
}

@end
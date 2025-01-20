@interface MOEventMotionActivity
+ (BOOL)supportsSecureCoding;
+ (id)descriptionOfMotionType:(unint64_t)a3;
- (MOEventMotionActivity)initWithCoder:(id)a3;
- (NSNumber)motionDistance;
- (NSNumber)motionStepCount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)motionType;
- (void)encodeWithCoder:(id)a3;
- (void)setMotionDistance:(id)a3;
- (void)setMotionStepCount:(id)a3;
- (void)setMotionType:(unint64_t)a3;
@end

@implementation MOEventMotionActivity

+ (id)descriptionOfMotionType:(unint64_t)a3
{
  if (a3 > 6) {
    return @"Invalid";
  }
  else {
    return *(&off_1000A5120 + a3);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  motionStepCount = self->_motionStepCount;
  id v5 = a3;
  [v5 encodeObject:motionStepCount forKey:@"motionStepCount"];
  [v5 encodeInteger:self->_motionType forKey:@"motionType"];
  [(NSNumber *)self->_motionDistance doubleValue];
  objc_msgSend(v5, "encodeDouble:forKey:", @"motionDistance");
}

- (MOEventMotionActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MOEventMotionActivity;
  id v5 = [(MOEventMotionActivity *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"motionStepCount"];
    motionStepCount = v5->_motionStepCount;
    v5->_motionStepCount = (NSNumber *)v6;

    v5->_motionType = (int)[v4 decodeIntForKey:@"motionType"];
    [v4 decodeDoubleForKey:@"motionDistance"];
    uint64_t v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    motionDistance = v5->_motionDistance;
    v5->_motionDistance = (NSNumber *)v8;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MOEventMotionActivity);
  v4->_motionType = self->_motionType;
  objc_storeStrong((id *)&v4->_motionStepCount, self->_motionStepCount);
  return v4;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  id v4 = +[MOEventMotionActivity descriptionOfMotionType:[(MOEventMotionActivity *)self motionType]];
  id v5 = [v3 initWithFormat:@"motion type, %@", v4];

  return v5;
}

- (unint64_t)motionType
{
  return self->_motionType;
}

- (void)setMotionType:(unint64_t)a3
{
  self->_motionType = a3;
}

- (NSNumber)motionStepCount
{
  return self->_motionStepCount;
}

- (void)setMotionStepCount:(id)a3
{
}

- (NSNumber)motionDistance
{
  return self->_motionDistance;
}

- (void)setMotionDistance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionDistance, 0);
  objc_storeStrong((id *)&self->_motionStepCount, 0);
}

@end
@interface PRPose
+ (PRPose)poseWithTime:(double)a3 pose:(double)a4;
- (PRPose)initWithTime:(__n128)a3 pose:(__n128)a4;
- (__n128)pose;
- (double)timestamp;
@end

@implementation PRPose

- (PRPose)initWithTime:(__n128)a3 pose:(__n128)a4
{
  v12.receiver = a1;
  v12.super_class = (Class)PRPose;
  result = [(PRPose *)&v12 init];
  if (result)
  {
    result->_timestamp = a2;
    result[1] = (PRPose)a3;
    result[2] = (PRPose)a4;
    result[3] = (PRPose)a5;
    result[4] = (PRPose)a6;
  }
  return result;
}

+ (PRPose)poseWithTime:(double)a3 pose:(double)a4
{
  v5 = -[PRPose initWithTime:pose:]([PRPose alloc], "initWithTime:pose:", a1, a2, a3, a4, a5);
  return v5;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (__n128)pose
{
  return a1[1];
}

@end
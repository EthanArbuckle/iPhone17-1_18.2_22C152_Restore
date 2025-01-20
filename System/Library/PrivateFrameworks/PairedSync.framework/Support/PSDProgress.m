@interface PSDProgress
+ (BOOL)supportsSecureCoding;
- (PSDProgress)initWithCoder:(id)a3;
- (float)activityProgress;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)completedActivityCount;
- (unint64_t)totalActivityCount;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityProgress:(float)a3;
- (void)setCompletedActivityCount:(unint64_t)a3;
- (void)setTotalActivityCount:(unint64_t)a3;
@end

@implementation PSDProgress

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PSDProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PSDProgress;
  v5 = [(PSDProgress *)&v8 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"activityProgress"];
    v5->_activityProgress = v6;
    v5->_totalActivityCount = (unint64_t)[v4 decodeIntegerForKey:@"totalActivityCount"];
    v5->_completedActivityCount = (unint64_t)[v4 decodeIntegerForKey:@"completedActivityCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  float activityProgress = self->_activityProgress;
  id v6 = a3;
  *(float *)&double v5 = activityProgress;
  [v6 encodeFloat:@"activityProgress" forKey:v5];
  [v6 encodeInteger:self->_totalActivityCount forKey:@"totalActivityCount"];
  [v6 encodeInteger:self->_completedActivityCount forKey:@"completedActivityCount"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(PSDProgress *)self activityProgress];
  objc_msgSend(v4, "setActivityProgress:");
  objc_msgSend(v4, "setTotalActivityCount:", -[PSDProgress totalActivityCount](self, "totalActivityCount"));
  objc_msgSend(v4, "setCompletedActivityCount:", -[PSDProgress completedActivityCount](self, "completedActivityCount"));
  return v4;
}

- (float)activityProgress
{
  return self->_activityProgress;
}

- (void)setActivityProgress:(float)a3
{
  self->_float activityProgress = a3;
}

- (unint64_t)totalActivityCount
{
  return self->_totalActivityCount;
}

- (void)setTotalActivityCount:(unint64_t)a3
{
  self->_totalActivityCount = a3;
}

- (unint64_t)completedActivityCount
{
  return self->_completedActivityCount;
}

- (void)setCompletedActivityCount:(unint64_t)a3
{
  self->_completedActivityCount = a3;
}

@end
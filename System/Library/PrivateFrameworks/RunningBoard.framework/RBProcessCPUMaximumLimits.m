@interface RBProcessCPUMaximumLimits
- (BOOL)isEqual:(id)a3;
- (RBProcessCPUMaximumLimits)initWithPercentage:(unint64_t)a3 duration:(unint64_t)a4 violationPolicy:(unint64_t)a5;
- (id)description;
- (id)unionLimit:(id)a3;
- (unint64_t)duration;
- (unint64_t)hash;
- (unint64_t)percentage;
- (unint64_t)violationPolicy;
@end

@implementation RBProcessCPUMaximumLimits

- (RBProcessCPUMaximumLimits)initWithPercentage:(unint64_t)a3 duration:(unint64_t)a4 violationPolicy:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)RBProcessCPUMaximumLimits;
  result = [(RBProcessCPUMaximumLimits *)&v9 init];
  if (result)
  {
    result->_percentage = a3;
    result->_duration = a4;
    result->_violationPolicy = a5;
  }
  return result;
}

- (id)unionLimit:(id)a3
{
  v4 = (RBProcessCPUMaximumLimits *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self) {
    goto LABEL_5;
  }
  unint64_t percentage = self->_percentage;
  unint64_t duration = self->_duration;
  uint64_t v8 = [(RBProcessCPUMaximumLimits *)v4 duration];
  uint64_t v9 = [(RBProcessCPUMaximumLimits *)v5 percentage];
  unint64_t v10 = v9 * v8;
  unint64_t v11 = percentage * duration;
  unint64_t violationPolicy = self->_violationPolicy;
  unint64_t v13 = [(RBProcessCPUMaximumLimits *)v5 violationPolicy];
  if (v13 > violationPolicy || v10 < v11)
  {
    if (v13 <= violationPolicy) {
      unint64_t v15 = violationPolicy;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v10 >= v11)
    {
      uint64_t v9 = percentage;
      uint64_t v8 = duration;
    }
    v14 = [[RBProcessCPUMaximumLimits alloc] initWithPercentage:v9 duration:v8 violationPolicy:v15];
  }
  else
  {
LABEL_5:
    v14 = self;
  }
  v16 = v14;

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBProcessCPUMaximumLimits *)a3;
  v5 = v4;
  BOOL v7 = 1;
  if (self != v4)
  {
    if (!v4
      || (uint64_t v6 = objc_opt_class(), v6 == objc_opt_class())
      && (self->_percentage != v5->_percentage
       || self->_duration != v5->_duration
       || self->_violationPolicy != v5->_violationPolicy))
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v2 = 0xBF58476D1CE4E5B9 * (self->_percentage ^ (self->_percentage >> 30));
  unint64_t v3 = 0xBF58476D1CE4E5B9 * (self->_duration ^ (self->_duration >> 30));
  unint64_t v4 = self->_violationPolicy ^ (self->_violationPolicy >> 30);
  unint64_t v5 = 0x94D049BB133111EBLL * ((0xBF58476D1CE4E5B9 * v4) ^ ((0xBF58476D1CE4E5B9 * v4) >> 27));
  return (0x94D049BB133111EBLL * (v2 ^ (v2 >> 27))) ^ (((0x94D049BB133111EBLL * (v3 ^ (v3 >> 27))) ^ (0x94D049BB133111EBLL * (v2 ^ (v2 >> 27))) ^ v5) >> 31) ^ (0x94D049BB133111EBLL * (v3 ^ (v3 >> 27))) ^ v5;
}

- (id)description
{
  id v3 = [NSString alloc];
  unint64_t v4 = [(id)objc_opt_class() description];
  unint64_t percentage = self->_percentage;
  unint64_t duration = self->_duration;
  BOOL v7 = NSStringFromRBSCPUMaximumUsageViolationPolicy();
  uint64_t v8 = (void *)[v3 initWithFormat:@"<%@| percentage:%lu duration:%lu violationPolicy:%@>", v4, percentage, duration, v7];

  return v8;
}

- (unint64_t)percentage
{
  return self->_percentage;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (unint64_t)violationPolicy
{
  return self->_violationPolicy;
}

@end
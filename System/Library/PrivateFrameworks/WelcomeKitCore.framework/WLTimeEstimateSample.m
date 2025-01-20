@interface WLTimeEstimateSample
- (NSDate)startDate;
- (NSObject)associatedObject;
- (unint64_t)estimate;
- (unint64_t)threshold;
- (void)setAssociatedObject:(id)a3;
- (void)setEstimate:(unint64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setThreshold:(unint64_t)a3;
@end

@implementation WLTimeEstimateSample

- (unint64_t)estimate
{
  return self->_estimate;
}

- (void)setEstimate:(unint64_t)a3
{
  self->_estimate = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (unint64_t)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(unint64_t)a3
{
  self->_threshold = a3;
}

- (NSObject)associatedObject
{
  return self->_associatedObject;
}

- (void)setAssociatedObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedObject, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
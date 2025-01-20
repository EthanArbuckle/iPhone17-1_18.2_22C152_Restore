@interface CLMotionLoggerAdapter
- (BOOL)valid;
- (CLMotionLoggerAdapter)initWithMotionLogger:(void *)a3;
- (uint64_t)onWalkingSteadinessClassification:(uint64_t)a3;
- (void)didExitFence:(id)a3;
- (void)handleVLLocalizationResult:(id)a3 fromClient:(id)a4;
- (void)onBackgroundInertialOdometryState:(id)a3;
- (void)onLowConfidenceVisit:(id)a3;
- (void)onMobilityBoutMetrics:(BoutMetrics *)a3;
- (void)onVisit:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLMotionLoggerAdapter

- (CLMotionLoggerAdapter)initWithMotionLogger:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLMotionLoggerAdapter;
  result = [(CLMotionLoggerAdapter *)&v5 init];
  if (result)
  {
    result->_motionLogger = a3;
    result->_valid = 1;
  }
  else
  {
    MEMORY[0x10] = 0;
  }
  return result;
}

- (void)onLowConfidenceVisit:(id)a3
{
}

- (void)onVisit:(id)a3
{
}

- (void)onMobilityBoutMetrics:(BoutMetrics *)a3
{
}

- (uint64_t)onWalkingSteadinessClassification:(uint64_t)a3
{
  return sub_100C0D064(*(void *)(a1 + 8), a3);
}

- (void)handleVLLocalizationResult:(id)a3 fromClient:(id)a4
{
}

- (void)didExitFence:(id)a3
{
}

- (void)onBackgroundInertialOdometryState:(id)a3
{
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
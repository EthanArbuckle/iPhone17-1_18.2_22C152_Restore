@interface WLKFederatedPunchout
- (NSDate)matchTime;
- (id)expiry;
- (int64_t)failureReason;
- (unint64_t)ttl;
- (void)setFailureReason:(int64_t)a3;
- (void)setMatchTime:(id)a3;
- (void)setTtl:(unint64_t)a3;
@end

@implementation WLKFederatedPunchout

- (unint64_t)ttl
{
  v2 = objc_getAssociatedObject(self, WLKFederatedPunchoutReporterAdditionsKeyTTL);
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (void)setTtl:(unint64_t)a3
{
  v4 = WLKFederatedPunchoutReporterAdditionsKeyTTL;
  id v5 = +[NSNumber numberWithUnsignedInteger:a3];
  objc_setAssociatedObject(self, v4, v5, (void *)1);
}

- (NSDate)matchTime
{
  return (NSDate *)objc_getAssociatedObject(self, WLKFederatedPunchoutReporterAdditionsKeyMatchTime);
}

- (void)setMatchTime:(id)a3
{
}

- (int64_t)failureReason
{
  v2 = objc_getAssociatedObject(self, WLKFederatedPunchoutReporterAdditionsKeyFailureReason);
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (void)setFailureReason:(int64_t)a3
{
  v4 = WLKFederatedPunchoutReporterAdditionsKeyFailureReason;
  id v5 = +[NSNumber numberWithInteger:a3];
  objc_setAssociatedObject(self, v4, v5, (void *)1);
}

- (id)expiry
{
  id v3 = objc_alloc((Class)NSDate);
  double v4 = (double)[(WLKFederatedPunchout *)self ttl];
  id v5 = [(WLKFederatedPunchout *)self punchoutTime];
  id v6 = [v3 initWithTimeInterval:v5 sinceDate:v4];

  return v6;
}

@end
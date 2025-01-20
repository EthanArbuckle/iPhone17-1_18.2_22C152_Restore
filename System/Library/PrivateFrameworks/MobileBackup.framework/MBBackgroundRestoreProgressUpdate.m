@interface MBBackgroundRestoreProgressUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCellularPolicy;
- (BOOL)isOnInexpensiveCellular;
- (BOOL)isOnWiFi;
- (BOOL)isThermallyThrottled;
- (MBBackgroundRestoreProgressUpdate)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)estimatedSize;
- (void)encodeWithCoder:(id)a3;
- (void)setEstimatedSize:(unint64_t)a3;
- (void)setHasCellularPolicy:(BOOL)a3;
- (void)setIsOnInexpensiveCellular:(BOOL)a3;
- (void)setIsOnWiFi:(BOOL)a3;
- (void)setIsThermallyThrottled:(BOOL)a3;
@end

@implementation MBBackgroundRestoreProgressUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBBackgroundRestoreProgressUpdate)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBBackgroundRestoreProgressUpdate;
  v4 = [(MBBackgroundRestoreProgressUpdate *)&v6 init];
  if (v4)
  {
    v4->_isThermallyThrottled = [a3 decodeBoolForKey:@"isThermallyThrottled"];
    v4->_hasCellularPolicy = [a3 decodeBoolForKey:@"hasCellularPolicy"];
    v4->_estimatedSize = [a3 decodeInt64ForKey:@"estimatedSize"];
    v4->_isOnWiFi = [a3 decodeBoolForKey:@"isOnWiFi"];
    v4->_isOnInexpensiveCellular = [a3 decodeBoolForKey:@"isOnInExpensiveCellular"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeBool:self->_isThermallyThrottled forKey:@"isThermallyThrottled"];
  [a3 encodeBool:self->_hasCellularPolicy forKey:@"hasCellularPolicy"];
  [a3 encodeInt64:self->_estimatedSize forKey:@"estimatedSize"];
  [a3 encodeBool:self->_isOnWiFi forKey:@"isOnWiFi"];
  BOOL isOnInexpensiveCellular = self->_isOnInexpensiveCellular;
  [a3 encodeBool:isOnInexpensiveCellular forKey:@"isOnInExpensiveCellular"];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: isThermallyThrottled=%d, hasCellularPolicy=%d, estimatedSize=%llu isOnWifi=%d isOnInexpensiveCellular=%d>", objc_opt_class(), self->_isThermallyThrottled, self->_hasCellularPolicy, self->_estimatedSize, self->_isOnWiFi, self->_isOnInexpensiveCellular];
}

- (BOOL)isThermallyThrottled
{
  return self->_isThermallyThrottled;
}

- (void)setIsThermallyThrottled:(BOOL)a3
{
  self->_isThermallyThrottled = a3;
}

- (BOOL)hasCellularPolicy
{
  return self->_hasCellularPolicy;
}

- (void)setHasCellularPolicy:(BOOL)a3
{
  self->_hasCellularPolicy = a3;
}

- (BOOL)isOnWiFi
{
  return self->_isOnWiFi;
}

- (void)setIsOnWiFi:(BOOL)a3
{
  self->_isOnWiFi = a3;
}

- (BOOL)isOnInexpensiveCellular
{
  return self->_isOnInexpensiveCellular;
}

- (void)setIsOnInexpensiveCellular:(BOOL)a3
{
  self->_BOOL isOnInexpensiveCellular = a3;
}

- (unint64_t)estimatedSize
{
  return self->_estimatedSize;
}

- (void)setEstimatedSize:(unint64_t)a3
{
  self->_estimatedSize = a3;
}

@end
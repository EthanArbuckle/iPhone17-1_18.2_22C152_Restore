@interface SPSchedulerInformation
+ (BOOL)supportsSecureCoding;
- (SPSchedulerInformation)initWithCoder:(id)a3;
- (int64_t)advertisementCount;
- (int64_t)lowBatteryCount;
- (int64_t)priorityCount;
- (void)encodeWithCoder:(id)a3;
- (void)setAdvertisementCount:(int64_t)a3;
- (void)setLowBatteryCount:(int64_t)a3;
- (void)setPriorityCount:(int64_t)a3;
@end

@implementation SPSchedulerInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SPSchedulerInformation advertisementCount](self, "advertisementCount"), @"advertisementCount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SPSchedulerInformation priorityCount](self, "priorityCount"), @"priorityCount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SPSchedulerInformation lowBatteryCount](self, "lowBatteryCount"), @"lowBatteryCount");
}

- (SPSchedulerInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  -[SPSchedulerInformation setAdvertisementCount:](self, "setAdvertisementCount:", [v4 decodeIntegerForKey:@"advertisementCount"]);
  -[SPSchedulerInformation setPriorityCount:](self, "setPriorityCount:", [v4 decodeIntegerForKey:@"priorityCount"]);
  uint64_t v5 = [v4 decodeIntegerForKey:@"lowBatteryCount"];

  [(SPSchedulerInformation *)self setLowBatteryCount:v5];
  return self;
}

- (int64_t)advertisementCount
{
  return self->_advertisementCount;
}

- (void)setAdvertisementCount:(int64_t)a3
{
  self->_advertisementCount = a3;
}

- (int64_t)priorityCount
{
  return self->_priorityCount;
}

- (void)setPriorityCount:(int64_t)a3
{
  self->_priorityCount = a3;
}

- (int64_t)lowBatteryCount
{
  return self->_lowBatteryCount;
}

- (void)setLowBatteryCount:(int64_t)a3
{
  self->_lowBatteryCount = a3;
}

@end
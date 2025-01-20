@interface SXAnalyticsEvent
- (NSDate)endDate;
- (NSDate)startDate;
- (SXAnalyticsEvent)init;
- (id)description;
- (void)determineEndDate;
@end

@implementation SXAnalyticsEvent

- (SXAnalyticsEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXAnalyticsEvent;
  v2 = [(SXAnalyticsEvent *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    startDate = v2->_startDate;
    v2->_startDate = (NSDate *)v3;
  }
  return v2;
}

- (void)determineEndDate
{
  if (!self->_endDate)
  {
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    endDate = self->_endDate;
    self->_endDate = v3;
    MEMORY[0x270F9A758](v3, endDate);
  }
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  v4 = [(SXAnalyticsEvent *)self endDate];

  if (v4)
  {
    v5 = [(SXAnalyticsEvent *)self endDate];
    [v5 timeIntervalSinceReferenceDate];
    double v7 = v6;
    v8 = [(SXAnalyticsEvent *)self startDate];
    [v8 timeIntervalSinceReferenceDate];
    objc_msgSend(v3, "appendFormat:", @"; duration: %f", v7 - v9);
  }
  else
  {
    [v3 appendString:@"; duration: undetermined"];
  }
  [v3 appendString:@">"];
  return v3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
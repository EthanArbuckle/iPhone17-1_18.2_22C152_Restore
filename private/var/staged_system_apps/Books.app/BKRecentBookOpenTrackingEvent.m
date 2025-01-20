@interface BKRecentBookOpenTrackingEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventForStart:(BOOL)a3;
- (BKRecentBookOpenTrackingEvent)initWithCoder:(id)a3;
- (BKRecentBookOpenTrackingEvent)initWithStart:(BOOL)a3 date:(id)a4;
- (BOOL)isStart;
- (NSDate)timestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKRecentBookOpenTrackingEvent

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(BKRecentBookOpenTrackingEvent *)self timestamp];
  [v5 encodeObject:v4 forKey:@"timestamp"];

  [v5 encodeBool:[self isStart] forKey:@"isStart"];
}

- (BKRecentBookOpenTrackingEvent)initWithStart:(BOOL)a3 date:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BKRecentBookOpenTrackingEvent;
  v8 = [(BKRecentBookOpenTrackingEvent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_timestamp, a4);
    v9->_isStart = a3;
  }

  return v9;
}

+ (id)eventForStart:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [BKRecentBookOpenTrackingEvent alloc];
  id v5 = +[NSDate date];
  v6 = [(BKRecentBookOpenTrackingEvent *)v4 initWithStart:v3 date:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BKRecentBookOpenTrackingEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKRecentBookOpenTrackingEvent;
  id v5 = [(BKRecentBookOpenTrackingEvent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v6;

    v5->_isStart = [v4 decodeBoolForKey:@"isStart"];
  }

  return v5;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (void).cxx_destruct
{
}

@end
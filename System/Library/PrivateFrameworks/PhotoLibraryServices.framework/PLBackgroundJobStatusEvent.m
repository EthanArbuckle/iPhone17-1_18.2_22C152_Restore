@interface PLBackgroundJobStatusEvent
- (NSDate)eventTimestamp;
- (NSString)statusDump;
- (void)setEventTimestamp:(id)a3;
@end

@implementation PLBackgroundJobStatusEvent

- (void).cxx_destruct
{
}

- (void)setEventTimestamp:(id)a3
{
}

- (NSDate)eventTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)statusDump
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateStyle:1];
  [v3 setTimeStyle:2];
  v4 = NSString;
  v5 = [(PLBackgroundJobStatusEvent *)self eventTimestamp];
  v6 = [v3 stringFromDate:v5];
  v7 = [v4 stringWithFormat:@"%@", v6];

  return (NSString *)v7;
}

@end
@interface DKMLogEvent
+ (id)alloc;
- (BOOL)isSubmitted;
- (BOOL)shouldSubmit;
- (DKMLogEvent)init;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSError)error;
- (double)durationInMilliseconds;
- (void)setEndDate:(id)a3;
- (void)setError:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setSubmitted:(BOOL)a3;
- (void)submitAtDate:(id)a3;
@end

@implementation DKMLogEvent

+ (id)alloc
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___DKMLogEvent;
  return [super alloc];
}

- (DKMLogEvent)init
{
  v7.receiver = self;
  v7.super_class = (Class)DKMLogEvent;
  v2 = [(DKMLogEvent *)&v7 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_submitted = 0;
    uint64_t v4 = +[NSDate date];
    startDate = v3->_startDate;
    v3->_startDate = (NSDate *)v4;
  }
  return v3;
}

- (BOOL)shouldSubmit
{
  return 1;
}

- (void)submitAtDate:(id)a3
{
  id v7 = a3;
  [(DKMLogEvent *)self setSubmitted:1];
  uint64_t v4 = [(DKMLogEvent *)self startDate];
  id v5 = [v7 compare:v4];

  if (v5 == (id)-1)
  {
    v6 = [(DKMLogEvent *)self startDate];
    [(DKMLogEvent *)self setEndDate:v6];
  }
  else
  {
    [(DKMLogEvent *)self setEndDate:v7];
  }
}

- (double)durationInMilliseconds
{
  objc_super v3 = [(DKMLogEvent *)self endDate];
  uint64_t v4 = [(DKMLogEvent *)self startDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5 * 1000.0;

  return v6;
}

- (BOOL)isSubmitted
{
  return self->_submitted;
}

- (void)setSubmitted:(BOOL)a3
{
  self->_submitted = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError:(id)a3
{
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end
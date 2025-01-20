@interface ICSharedListeningConnectionReportEvent
- (ICSharedListeningConnectionReportEvent)initWithName:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSError)error;
- (NSMutableArray)subEvents;
- (NSString)name;
- (double)duration;
- (void)addSubEvent:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setError:(id)a3;
- (void)setName:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setSubEvents:(id)a3;
@end

@implementation ICSharedListeningConnectionReportEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subEvents, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setSubEvents:(id)a3
{
}

- (NSMutableArray)subEvents
{
  return self->_subEvents;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (double)duration
{
  v3 = [(ICSharedListeningConnectionReportEvent *)self endDate];
  v4 = [(ICSharedListeningConnectionReportEvent *)self startDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (void)addSubEvent:(id)a3
{
  id v4 = a3;
  double v5 = [(ICSharedListeningConnectionReportEvent *)self subEvents];

  if (!v5)
  {
    double v6 = objc_opt_new();
    [(ICSharedListeningConnectionReportEvent *)self setSubEvents:v6];
  }
  id v7 = [(ICSharedListeningConnectionReportEvent *)self subEvents];
  [v7 addObject:v4];
}

- (ICSharedListeningConnectionReportEvent)initWithName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICSharedListeningConnectionReportEvent;
  double v6 = [(ICSharedListeningConnectionReportEvent *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    startDate = v7->_startDate;
    v7->_startDate = (NSDate *)v8;
  }
  return v7;
}

@end
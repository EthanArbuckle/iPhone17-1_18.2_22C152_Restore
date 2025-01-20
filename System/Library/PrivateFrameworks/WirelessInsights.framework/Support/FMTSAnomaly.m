@interface FMTSAnomaly
- (BOOL)hasEnded;
- (FMTSAnomaly)initWithTime:(id)a3 timestamp:(unint64_t)a4 events:(id)a5;
- (NSArray)events;
- (NSDate)startTime;
- (id)description;
- (int)duration;
- (unint64_t)endTimestamp;
- (unint64_t)startTimestamp;
- (void)endAtTimestamp:(unint64_t)a3;
@end

@implementation FMTSAnomaly

- (FMTSAnomaly)initWithTime:(id)a3 timestamp:(unint64_t)a4 events:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)FMTSAnomaly;
  v11 = [(FMTSAnomaly *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_startTime, a3);
    v12->_startTimestamp = a4;
    v12->_endTimestamp = 0;
    v12->_hasEnded = 0;
    objc_storeStrong((id *)&v12->_events, a5);
    v13 = v12;
  }

  return v12;
}

- (void)endAtTimestamp:(unint64_t)a3
{
  self->_hasEnded = 1;
  self->_endTimestamp = a3;
}

- (int)duration
{
  LODWORD(v3) = [(FMTSAnomaly *)self hasEnded];
  if (v3)
  {
    unint64_t v4 = [(FMTSAnomaly *)self endTimestamp];
    return (v4 - [(FMTSAnomaly *)self startTimestamp]) / 0x3B9ACA00;
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = [(FMTSAnomaly *)self startTime];
  unint64_t v4 = [(FMTSAnomaly *)self startTimestamp];
  unint64_t v5 = [(FMTSAnomaly *)self endTimestamp];
  unsigned int v6 = [(FMTSAnomaly *)self hasEnded];
  uint64_t v7 = [(FMTSAnomaly *)self events];
  v8 = (void *)v7;
  CFStringRef v9 = @"NO";
  if (v6) {
    CFStringRef v9 = @"YES";
  }
  id v10 = +[NSString stringWithFormat:@"startTime %@, startTimestamp %llu, endTimestamp %llu, hasEnded %@, events %@", v3, v4, v5, v9, v7];

  return v10;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (unint64_t)endTimestamp
{
  return self->_endTimestamp;
}

- (BOOL)hasEnded
{
  return self->_hasEnded;
}

- (NSArray)events
{
  return self->_events;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);

  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
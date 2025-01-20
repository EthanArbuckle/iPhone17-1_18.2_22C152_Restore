@interface CMSLoggingSession
- (BOOL)sessionEnded;
- (CMSLogger)belongedLogger;
- (NSDictionary)metadata;
- (NSString)sessionType;
- (id)eventDurations;
- (id)eventOccurance;
- (id)initForType:(id)a3 withMetadata:(id)a4;
- (void)_endSession;
- (void)dealloc;
- (void)recordEvent:(id)a3;
- (void)recordEvent:(id)a3 occuredAt:(id)a4;
- (void)setBelongedLogger:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation CMSLoggingSession

- (id)initForType:(id)a3 withMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CMSLoggingSession;
  v8 = [(CMSLoggingSession *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    sessionType = v8->_sessionType;
    v8->_sessionType = v9;

    objc_storeStrong((id *)&v8->_metadata, a4);
    uint64_t v11 = objc_opt_new();
    events = v8->events;
    v8->events = (NSMutableArray *)v11;
  }
  return v8;
}

- (void)recordEvent:(id)a3 occuredAt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_sessionEnded)
  {
    NSLog(@"Error: CMSLoggerSession has ended already. %s", "-[CMSLoggingSession recordEvent:occuredAt:]");
  }
  else
  {
    v8 = +[CMSLogger _LoggingQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003347C;
    block[3] = &unk_10004E128;
    block[4] = self;
    id v9 = v6;
    id v11 = v9;
    id v12 = v7;
    dispatch_async(v8, block);

    if ([v9 isEqualToString:@"End"]) {
      [(CMSLoggingSession *)self _endSession];
    }
  }
}

- (void)recordEvent:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate date];
  [(CMSLoggingSession *)self recordEvent:v4 occuredAt:v5];
}

- (id)eventDurations
{
  v3 = objc_opt_new();
  if ((unint64_t)[(NSMutableArray *)self->events count] >= 2)
  {
    id v4 = [(NSMutableArray *)self->events firstObject];
    if ((unint64_t)[(NSMutableArray *)self->events count] < 2)
    {
      id v6 = v4;
    }
    else
    {
      unint64_t v5 = 1;
      do
      {
        id v6 = [(NSMutableArray *)self->events objectAtIndexedSubscript:v5];
        id v7 = [v4 eventType];
        v8 = [v6 eventType];
        id v9 = +[NSString stringWithFormat:@"%@-%@", v7, v8];

        v10 = [v6 timestamp];
        id v11 = [v4 timestamp];
        [v10 timeIntervalSinceDate:v11];
        double v13 = v12;

        objc_super v14 = [v3 objectForKeyedSubscript:v9];

        if (v14)
        {
          v15 = [v4 eventType];
          v16 = [v6 eventType];
          NSLog(@"Warning: CMSLogger currently only support every edge on the FSM only go though once. We have passed %@ -> %@ before. The newer measurement will be used right now %s", v15, v16, "-[CMSLoggingSession eventDurations]");
        }
        v17 = +[NSNumber numberWithDouble:v13];
        [v3 setObject:v17 forKeyedSubscript:v9];

        ++v5;
        id v4 = v6;
      }
      while ((unint64_t)[(NSMutableArray *)self->events count] > v5);
    }
  }

  return v3;
}

- (id)eventOccurance
{
  v3 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->events;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = [v9 eventType:v15];
        id v11 = [v3 objectForKeyedSubscript:v10];

        if (v11)
        {
          +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v11 unsignedIntegerValue] + 1);
          double v12 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          double v12 = &off_10004F988;
        }
        double v13 = [v9 eventType];
        [v3 setObject:v12 forKeyedSubscript:v13];
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_endSession
{
  if (self->_sessionEnded)
  {
    NSLog(@"Error: CMSLoggerSession %@ has ended already. %s", a2, self, "-[CMSLoggingSession _endSession]");
  }
  else
  {
    v3 = +[CMSLogger _LoggingQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100033A34;
    block[3] = &unk_10004CAC0;
    block[4] = self;
    dispatch_async(v3, block);

    self->_sessionEnded = 1;
  }
}

- (void)dealloc
{
  if (!self->_sessionEnded) {
    NSLog(@"Warning: CMSLoggerSession %@ has not been closed, so it wasn't added as part of the log. %s", a2, self, "-[CMSLoggingSession dealloc]");
  }
  v3.receiver = self;
  v3.super_class = (Class)CMSLoggingSession;
  [(CMSLoggingSession *)&v3 dealloc];
}

- (NSString)sessionType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMetadata:(id)a3
{
}

- (BOOL)sessionEnded
{
  return self->_sessionEnded;
}

- (CMSLogger)belongedLogger
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_belongedLogger);

  return (CMSLogger *)WeakRetained;
}

- (void)setBelongedLogger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_belongedLogger);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_sessionType, 0);

  objc_storeStrong((id *)&self->events, 0);
}

@end
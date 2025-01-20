@interface _DASCollectTelemetryActivityContext
- (BGSystemTask)task;
- (BOOL)wasDeferred;
- (NSDate)launchDataCollectionStartDate;
- (NSDate)prewarmingDataCollectionStartDate;
- (_DASCollectTelemetryActivityContext)init;
- (id)description;
- (void)setLaunchDataCollectionStartDate:(id)a3;
- (void)setPrewarmingDataCollectionStartDate:(id)a3;
- (void)setTask:(id)a3;
- (void)setWasDeferred:(BOOL)a3;
- (void)updateWithtask:(id)a3 prewarmingStartDate:(id)a4 launchStartDate:(id)a5;
@end

@implementation _DASCollectTelemetryActivityContext

- (_DASCollectTelemetryActivityContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)_DASCollectTelemetryActivityContext;
  v2 = [(_DASCollectTelemetryActivityContext *)&v8 init];
  v3 = v2;
  if (v2)
  {
    task = v2->_task;
    v2->_task = 0;

    prewarmingDataCollectionStartDate = v3->_prewarmingDataCollectionStartDate;
    v3->_prewarmingDataCollectionStartDate = 0;

    launchDataCollectionStartDate = v3->_launchDataCollectionStartDate;
    v3->_launchDataCollectionStartDate = 0;

    v3->_wasDeferred = 0;
  }
  return v3;
}

- (void)updateWithtask:(id)a3 prewarmingStartDate:(id)a4 launchStartDate:(id)a5
{
  objc_super v8 = (BGSystemTask *)a3;
  v9 = (NSDate *)a4;
  v10 = (NSDate *)a5;
  task = self->_task;
  self->_task = v8;
  v12 = v8;

  prewarmingDataCollectionStartDate = self->_prewarmingDataCollectionStartDate;
  self->_prewarmingDataCollectionStartDate = v9;
  v14 = v9;

  launchDataCollectionStartDate = self->_launchDataCollectionStartDate;
  self->_launchDataCollectionStartDate = v10;

  self->_wasDeferred = 0;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  if (self->_wasDeferred) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  return +[NSString stringWithFormat:@"<%@: %@, %@, %@, deferred: %@>", v3, *(_OWORD *)&self->_task, self->_launchDataCollectionStartDate, v4];
}

- (BGSystemTask)task
{
  return (BGSystemTask *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTask:(id)a3
{
}

- (NSDate)prewarmingDataCollectionStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPrewarmingDataCollectionStartDate:(id)a3
{
}

- (NSDate)launchDataCollectionStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLaunchDataCollectionStartDate:(id)a3
{
}

- (BOOL)wasDeferred
{
  return self->_wasDeferred;
}

- (void)setWasDeferred:(BOOL)a3
{
  self->_wasDeferred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchDataCollectionStartDate, 0);
  objc_storeStrong((id *)&self->_prewarmingDataCollectionStartDate, 0);

  objc_storeStrong((id *)&self->_task, 0);
}

@end
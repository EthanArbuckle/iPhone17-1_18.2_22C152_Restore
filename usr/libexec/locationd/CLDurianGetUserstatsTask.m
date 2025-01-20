@interface CLDurianGetUserstatsTask
- (BOOL)isComplete;
- (BOOL)lastFragmentReceived;
- (CLDurianGetUserstatsTask)initWithPersistence:(BOOL)a3;
- (NSMutableData)userStatsData;
- (void)appendUserStatsData:(id)a3;
- (void)dealloc;
- (void)setLastFragmentReceived:(BOOL)a3;
- (void)setUserStatsData:(id)a3;
@end

@implementation CLDurianGetUserstatsTask

- (CLDurianGetUserstatsTask)initWithPersistence:(BOOL)a3
{
  BOOL v6 = !a3;
  v5.receiver = self;
  v5.super_class = (Class)CLDurianGetUserstatsTask;
  v3 = [(CLDurianTask *)&v5 initWithCommand:+[CLDurianCommand commandWithOpcode:payload:](CLDurianCommand, "commandWithOpcode:payload:", 23, +[NSData dataWithBytes:&v6 length:1]) desiredLatency:-6 expectsResponse:1 completeOnPreemption:0 requiresMutex:0];
  if (v3)
  {
    v3->_userStatsData = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
    v3->_lastFragmentReceived = 0;
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianGetUserstatsTask;
  [(CLDurianTask *)&v3 dealloc];
}

- (BOOL)isComplete
{
  return self->_lastFragmentReceived;
}

- (void)appendUserStatsData:(id)a3
{
  if (*(char *)[a3 bytes] < 0) {
    self->_lastFragmentReceived = 1;
  }
  id v5 = [a3 subdataWithRange:1, [a3 length] - 1];
  userStatsData = self->_userStatsData;

  [(NSMutableData *)userStatsData appendData:v5];
}

- (NSMutableData)userStatsData
{
  return (NSMutableData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUserStatsData:(id)a3
{
}

- (BOOL)lastFragmentReceived
{
  return self->_lastFragmentReceived;
}

- (void)setLastFragmentReceived:(BOOL)a3
{
  self->_lastFragmentReceived = a3;
}

@end
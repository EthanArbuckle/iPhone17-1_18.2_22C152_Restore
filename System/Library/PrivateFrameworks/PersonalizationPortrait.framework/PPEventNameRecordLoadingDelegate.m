@interface PPEventNameRecordLoadingDelegate
- (PPEventNameRecordLoadingDelegate)initWithName:(id)a3;
- (id)description;
- (id)eventNameRecordsCompletion;
- (id)eventNameRecordsHandler;
- (id)eventNameRecordsSetup;
- (id)recentEventNameRecordsCompletion;
- (id)recentEventNameRecordsHandler;
- (id)recentEventNameRecordsSetup;
- (id)resetEventNameRecordData;
- (unsigned)recentRecordLoadingHandler:(id)a3;
- (unsigned)recentRecordLoadingSetup;
- (unsigned)recordLoadingHandler:(id)a3;
- (unsigned)recordLoadingSetup;
- (void)recentRecordLoadingCompletion;
- (void)recordLoadingCompletion;
- (void)resetRecordData;
- (void)setEventNameRecordsCompletion:(id)a3;
- (void)setEventNameRecordsHandler:(id)a3;
- (void)setEventNameRecordsSetup:(id)a3;
- (void)setRecentEventNameRecordsCompletion:(id)a3;
- (void)setRecentEventNameRecordsHandler:(id)a3;
- (void)setRecentEventNameRecordsSetup:(id)a3;
- (void)setResetEventNameRecordData:(id)a3;
@end

@implementation PPEventNameRecordLoadingDelegate

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resetEventNameRecordData, 0);
  objc_storeStrong(&self->_recentEventNameRecordsCompletion, 0);
  objc_storeStrong(&self->_recentEventNameRecordsHandler, 0);
  objc_storeStrong(&self->_recentEventNameRecordsSetup, 0);
  objc_storeStrong(&self->_eventNameRecordsCompletion, 0);
  objc_storeStrong(&self->_eventNameRecordsHandler, 0);
  objc_storeStrong(&self->_eventNameRecordsSetup, 0);
}

- (void)setResetEventNameRecordData:(id)a3
{
}

- (id)resetEventNameRecordData
{
  return self->_resetEventNameRecordData;
}

- (void)setRecentEventNameRecordsCompletion:(id)a3
{
}

- (id)recentEventNameRecordsCompletion
{
  return self->_recentEventNameRecordsCompletion;
}

- (void)setRecentEventNameRecordsHandler:(id)a3
{
}

- (id)recentEventNameRecordsHandler
{
  return self->_recentEventNameRecordsHandler;
}

- (void)setRecentEventNameRecordsSetup:(id)a3
{
}

- (id)recentEventNameRecordsSetup
{
  return self->_recentEventNameRecordsSetup;
}

- (void)setEventNameRecordsCompletion:(id)a3
{
}

- (id)eventNameRecordsCompletion
{
  return self->_eventNameRecordsCompletion;
}

- (void)setEventNameRecordsHandler:(id)a3
{
}

- (id)eventNameRecordsHandler
{
  return self->_eventNameRecordsHandler;
}

- (void)setEventNameRecordsSetup:(id)a3
{
}

- (id)eventNameRecordsSetup
{
  return self->_eventNameRecordsSetup;
}

- (void)resetRecordData
{
  resetEventNameRecordData = (void (**)(void))self->_resetEventNameRecordData;
  if (resetEventNameRecordData) {
    resetEventNameRecordData[2]();
  }
}

- (void)recentRecordLoadingCompletion
{
  recentEventNameRecordsCompletion = (void (**)(void))self->_recentEventNameRecordsCompletion;
  if (recentEventNameRecordsCompletion) {
    recentEventNameRecordsCompletion[2]();
  }
}

- (unsigned)recentRecordLoadingHandler:(id)a3
{
  recentEventNameRecordsHandler = (uint64_t (**)(id, id))self->_recentEventNameRecordsHandler;
  if (recentEventNameRecordsHandler) {
    LOBYTE(recentEventNameRecordsHandler) = recentEventNameRecordsHandler[2](recentEventNameRecordsHandler, a3);
  }
  return recentEventNameRecordsHandler;
}

- (unsigned)recentRecordLoadingSetup
{
  recentEventNameRecordsSetup = (uint64_t (**)(void))self->_recentEventNameRecordsSetup;
  if (recentEventNameRecordsSetup) {
    LOBYTE(recentEventNameRecordsSetup) = recentEventNameRecordsSetup[2]();
  }
  return recentEventNameRecordsSetup;
}

- (void)recordLoadingCompletion
{
  eventNameRecordsCompletion = (void (**)(void))self->_eventNameRecordsCompletion;
  if (eventNameRecordsCompletion) {
    eventNameRecordsCompletion[2]();
  }
}

- (unsigned)recordLoadingHandler:(id)a3
{
  eventNameRecordsHandler = (uint64_t (**)(id, id))self->_eventNameRecordsHandler;
  if (eventNameRecordsHandler) {
    LOBYTE(eventNameRecordsHandler) = eventNameRecordsHandler[2](eventNameRecordsHandler, a3);
  }
  return eventNameRecordsHandler;
}

- (unsigned)recordLoadingSetup
{
  eventNameRecordsSetup = (uint64_t (**)(void))self->_eventNameRecordsSetup;
  if (eventNameRecordsSetup) {
    LOBYTE(eventNameRecordsSetup) = eventNameRecordsSetup[2]();
  }
  return eventNameRecordsSetup;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PPEventNameRecordLoadingDelegate;
  v2 = [(PPRecordLoadingDelegate *)&v4 description];
  return v2;
}

- (PPEventNameRecordLoadingDelegate)initWithName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PPEventNameRecordLoadingDelegate;
  return [(PPRecordLoadingDelegate *)&v4 initWithName:a3];
}

@end
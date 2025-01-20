@interface PPNamedEntityRecordLoadingDelegate
- (PPNamedEntityRecordLoadingDelegate)initWithName:(id)a3;
- (id)description;
- (id)namedEntityRecordsCompletion;
- (id)namedEntityRecordsHandler;
- (id)namedEntityRecordsSetup;
- (id)recentNamedEntityRecordsCompletion;
- (id)recentNamedEntityRecordsHandler;
- (id)recentNamedEntityRecordsSetup;
- (id)resetNamedEntityRecordData;
- (unsigned)recentRecordLoadingHandler:(id)a3;
- (unsigned)recentRecordLoadingSetup;
- (unsigned)recordLoadingHandler:(id)a3;
- (unsigned)recordLoadingSetup;
- (void)recentRecordLoadingCompletion;
- (void)recordLoadingCompletion;
- (void)resetRecordData;
- (void)setNamedEntityRecordsCompletion:(id)a3;
- (void)setNamedEntityRecordsHandler:(id)a3;
- (void)setNamedEntityRecordsSetup:(id)a3;
- (void)setRecentNamedEntityRecordsCompletion:(id)a3;
- (void)setRecentNamedEntityRecordsHandler:(id)a3;
- (void)setRecentNamedEntityRecordsSetup:(id)a3;
- (void)setResetNamedEntityRecordData:(id)a3;
@end

@implementation PPNamedEntityRecordLoadingDelegate

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resetNamedEntityRecordData, 0);
  objc_storeStrong(&self->_recentNamedEntityRecordsCompletion, 0);
  objc_storeStrong(&self->_recentNamedEntityRecordsHandler, 0);
  objc_storeStrong(&self->_recentNamedEntityRecordsSetup, 0);
  objc_storeStrong(&self->_namedEntityRecordsCompletion, 0);
  objc_storeStrong(&self->_namedEntityRecordsHandler, 0);
  objc_storeStrong(&self->_namedEntityRecordsSetup, 0);
}

- (void)setResetNamedEntityRecordData:(id)a3
{
}

- (id)resetNamedEntityRecordData
{
  return self->_resetNamedEntityRecordData;
}

- (void)setRecentNamedEntityRecordsCompletion:(id)a3
{
}

- (id)recentNamedEntityRecordsCompletion
{
  return self->_recentNamedEntityRecordsCompletion;
}

- (void)setRecentNamedEntityRecordsHandler:(id)a3
{
}

- (id)recentNamedEntityRecordsHandler
{
  return self->_recentNamedEntityRecordsHandler;
}

- (void)setRecentNamedEntityRecordsSetup:(id)a3
{
}

- (id)recentNamedEntityRecordsSetup
{
  return self->_recentNamedEntityRecordsSetup;
}

- (void)setNamedEntityRecordsCompletion:(id)a3
{
}

- (id)namedEntityRecordsCompletion
{
  return self->_namedEntityRecordsCompletion;
}

- (void)setNamedEntityRecordsHandler:(id)a3
{
}

- (id)namedEntityRecordsHandler
{
  return self->_namedEntityRecordsHandler;
}

- (void)setNamedEntityRecordsSetup:(id)a3
{
}

- (id)namedEntityRecordsSetup
{
  return self->_namedEntityRecordsSetup;
}

- (void)resetRecordData
{
  resetNamedEntityRecordData = (void (**)(void))self->_resetNamedEntityRecordData;
  if (resetNamedEntityRecordData) {
    resetNamedEntityRecordData[2]();
  }
}

- (void)recentRecordLoadingCompletion
{
  recentNamedEntityRecordsCompletion = (void (**)(void))self->_recentNamedEntityRecordsCompletion;
  if (recentNamedEntityRecordsCompletion) {
    recentNamedEntityRecordsCompletion[2]();
  }
}

- (unsigned)recentRecordLoadingHandler:(id)a3
{
  recentNamedEntityRecordsHandler = (uint64_t (**)(id, id))self->_recentNamedEntityRecordsHandler;
  if (recentNamedEntityRecordsHandler) {
    LOBYTE(recentNamedEntityRecordsHandler) = recentNamedEntityRecordsHandler[2](recentNamedEntityRecordsHandler, a3);
  }
  return recentNamedEntityRecordsHandler;
}

- (unsigned)recentRecordLoadingSetup
{
  recentNamedEntityRecordsSetup = (uint64_t (**)(void))self->_recentNamedEntityRecordsSetup;
  if (recentNamedEntityRecordsSetup) {
    LOBYTE(recentNamedEntityRecordsSetup) = recentNamedEntityRecordsSetup[2]();
  }
  return recentNamedEntityRecordsSetup;
}

- (void)recordLoadingCompletion
{
  namedEntityRecordsCompletion = (void (**)(void))self->_namedEntityRecordsCompletion;
  if (namedEntityRecordsCompletion) {
    namedEntityRecordsCompletion[2]();
  }
}

- (unsigned)recordLoadingHandler:(id)a3
{
  namedEntityRecordsHandler = (uint64_t (**)(id, id))self->_namedEntityRecordsHandler;
  if (namedEntityRecordsHandler) {
    LOBYTE(namedEntityRecordsHandler) = namedEntityRecordsHandler[2](namedEntityRecordsHandler, a3);
  }
  return namedEntityRecordsHandler;
}

- (unsigned)recordLoadingSetup
{
  namedEntityRecordsSetup = (uint64_t (**)(void))self->_namedEntityRecordsSetup;
  if (namedEntityRecordsSetup) {
    LOBYTE(namedEntityRecordsSetup) = namedEntityRecordsSetup[2]();
  }
  return namedEntityRecordsSetup;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PPNamedEntityRecordLoadingDelegate;
  v2 = [(PPRecordLoadingDelegate *)&v4 description];
  return v2;
}

- (PPNamedEntityRecordLoadingDelegate)initWithName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PPNamedEntityRecordLoadingDelegate;
  return [(PPRecordLoadingDelegate *)&v4 initWithName:a3];
}

@end
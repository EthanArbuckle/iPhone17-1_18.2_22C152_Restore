@interface PPContactNameRecordLoadingDelegate
- (PPContactNameRecordLoadingDelegate)initWithName:(id)a3;
- (id)contactNameRecordsCompletion;
- (id)contactNameRecordsHandler;
- (id)contactNameRecordsSetup;
- (id)description;
- (id)recentContactNameRecordsCompletion;
- (id)recentContactNameRecordsHandler;
- (id)recentContactNameRecordsSetup;
- (id)resetContactNameRecordData;
- (unsigned)recentRecordLoadingHandler:(id)a3;
- (unsigned)recentRecordLoadingSetup;
- (unsigned)recordLoadingHandler:(id)a3;
- (unsigned)recordLoadingSetup;
- (void)recentRecordLoadingCompletion;
- (void)recordLoadingCompletion;
- (void)resetRecordData;
- (void)setContactNameRecordsCompletion:(id)a3;
- (void)setContactNameRecordsHandler:(id)a3;
- (void)setContactNameRecordsSetup:(id)a3;
- (void)setRecentContactNameRecordsCompletion:(id)a3;
- (void)setRecentContactNameRecordsHandler:(id)a3;
- (void)setRecentContactNameRecordsSetup:(id)a3;
- (void)setResetContactNameRecordData:(id)a3;
@end

@implementation PPContactNameRecordLoadingDelegate

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resetContactNameRecordData, 0);
  objc_storeStrong(&self->_recentContactNameRecordsCompletion, 0);
  objc_storeStrong(&self->_recentContactNameRecordsHandler, 0);
  objc_storeStrong(&self->_recentContactNameRecordsSetup, 0);
  objc_storeStrong(&self->_contactNameRecordsCompletion, 0);
  objc_storeStrong(&self->_contactNameRecordsHandler, 0);
  objc_storeStrong(&self->_contactNameRecordsSetup, 0);
}

- (void)setResetContactNameRecordData:(id)a3
{
}

- (id)resetContactNameRecordData
{
  return self->_resetContactNameRecordData;
}

- (void)setRecentContactNameRecordsCompletion:(id)a3
{
}

- (id)recentContactNameRecordsCompletion
{
  return self->_recentContactNameRecordsCompletion;
}

- (void)setRecentContactNameRecordsHandler:(id)a3
{
}

- (id)recentContactNameRecordsHandler
{
  return self->_recentContactNameRecordsHandler;
}

- (void)setRecentContactNameRecordsSetup:(id)a3
{
}

- (id)recentContactNameRecordsSetup
{
  return self->_recentContactNameRecordsSetup;
}

- (void)setContactNameRecordsCompletion:(id)a3
{
}

- (id)contactNameRecordsCompletion
{
  return self->_contactNameRecordsCompletion;
}

- (void)setContactNameRecordsHandler:(id)a3
{
}

- (id)contactNameRecordsHandler
{
  return self->_contactNameRecordsHandler;
}

- (void)setContactNameRecordsSetup:(id)a3
{
}

- (id)contactNameRecordsSetup
{
  return self->_contactNameRecordsSetup;
}

- (void)resetRecordData
{
  resetContactNameRecordData = (void (**)(void))self->_resetContactNameRecordData;
  if (resetContactNameRecordData) {
    resetContactNameRecordData[2]();
  }
}

- (void)recentRecordLoadingCompletion
{
  recentContactNameRecordsCompletion = (void (**)(void))self->_recentContactNameRecordsCompletion;
  if (recentContactNameRecordsCompletion) {
    recentContactNameRecordsCompletion[2]();
  }
}

- (unsigned)recentRecordLoadingHandler:(id)a3
{
  recentContactNameRecordsHandler = (uint64_t (**)(id, id))self->_recentContactNameRecordsHandler;
  if (recentContactNameRecordsHandler) {
    LOBYTE(recentContactNameRecordsHandler) = recentContactNameRecordsHandler[2](recentContactNameRecordsHandler, a3);
  }
  return recentContactNameRecordsHandler;
}

- (unsigned)recentRecordLoadingSetup
{
  recentContactNameRecordsSetup = (uint64_t (**)(void))self->_recentContactNameRecordsSetup;
  if (recentContactNameRecordsSetup) {
    LOBYTE(recentContactNameRecordsSetup) = recentContactNameRecordsSetup[2]();
  }
  return recentContactNameRecordsSetup;
}

- (void)recordLoadingCompletion
{
  contactNameRecordsCompletion = (void (**)(void))self->_contactNameRecordsCompletion;
  if (contactNameRecordsCompletion) {
    contactNameRecordsCompletion[2]();
  }
}

- (unsigned)recordLoadingHandler:(id)a3
{
  contactNameRecordsHandler = (uint64_t (**)(id, id))self->_contactNameRecordsHandler;
  if (contactNameRecordsHandler) {
    LOBYTE(contactNameRecordsHandler) = contactNameRecordsHandler[2](contactNameRecordsHandler, a3);
  }
  return contactNameRecordsHandler;
}

- (unsigned)recordLoadingSetup
{
  contactNameRecordsSetup = (uint64_t (**)(void))self->_contactNameRecordsSetup;
  if (contactNameRecordsSetup) {
    LOBYTE(contactNameRecordsSetup) = contactNameRecordsSetup[2]();
  }
  return contactNameRecordsSetup;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PPContactNameRecordLoadingDelegate;
  v2 = [(PPRecordLoadingDelegate *)&v4 description];
  return v2;
}

- (PPContactNameRecordLoadingDelegate)initWithName:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PPContactNameRecordLoadingDelegate;
  return [(PPRecordLoadingDelegate *)&v4 initWithName:a3];
}

@end
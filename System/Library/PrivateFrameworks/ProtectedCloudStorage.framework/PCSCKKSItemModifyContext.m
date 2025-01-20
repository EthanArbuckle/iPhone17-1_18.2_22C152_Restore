@interface PCSCKKSItemModifyContext
- (BOOL)forceSync;
- (BOOL)returnedExistingIdentity;
- (BOOL)roll;
- (BOOL)sync;
- (NSData)currentItemReference;
- (NSData)existingItemReference;
- (NSData)existingItemSHA1;
- (NSData)rollItemReference;
- (NSData)rollItemSHA1;
- (NSDate)server_NextRollDate;
- (NSString)dsid;
- (NSString)service;
- (OS_os_transaction)transaction;
- (PCSCKKSItemModifyContext)init;
- (PCSLockAssertion)lockAssertion;
- (PCSMTT)mtt;
- (_PCSIdentityData)currentIdentity;
- (_PCSIdentityData)rollIdentity;
- (_PCSIdentitySetData)set;
- (__PCSLogContext)log;
- (id)activityAssertion;
- (int)retryLeftCount;
- (int64_t)timeoutValue;
- (void)dealloc;
- (void)resetIdentities;
- (void)setActivityAssertion:(id)a3;
- (void)setCurrentIdentity:(_PCSIdentityData *)a3;
- (void)setCurrentIdentity:(_PCSIdentityData *)a3 persistentReference:(id)a4;
- (void)setCurrentItemReference:(id)a3;
- (void)setDsid:(id)a3;
- (void)setExistingItemReference:(id)a3;
- (void)setExistingItemSHA1:(id)a3;
- (void)setForceSync:(BOOL)a3;
- (void)setLockAssertion:(id)a3;
- (void)setLog:(__PCSLogContext *)a3;
- (void)setRetryLeftCount:(int)a3;
- (void)setReturnedExistingIdentity:(BOOL)a3;
- (void)setRoll:(BOOL)a3;
- (void)setRollIdentity:(_PCSIdentityData *)a3;
- (void)setRollItemReference:(id)a3;
- (void)setRollItemSHA1:(id)a3;
- (void)setServer_NextRollDate:(id)a3;
- (void)setService:(id)a3;
- (void)setSet:(_PCSIdentitySetData *)a3;
- (void)setSync:(BOOL)a3;
- (void)setTimeoutValue:(int64_t)a3;
- (void)setTransaction:(id)a3;
@end

@implementation PCSCKKSItemModifyContext

- (PCSCKKSItemModifyContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)PCSCKKSItemModifyContext;
  v2 = [(PCSCKKSItemModifyContext *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(PCSMTT);
    mtt = v2->_mtt;
    v2->_mtt = v3;

    uint64_t v5 = PCSCKKSItemContextTimeout;
    if (!PCSCKKSItemContextTimeout) {
      uint64_t v5 = 300;
    }
    v2->_timeoutValue = v5;
    v6 = v2;
  }

  return v2;
}

- (void)resetIdentities
{
  currentIdentity = self->_currentIdentity;
  if (currentIdentity)
  {
    self->_currentIdentity = 0;
    CFRelease(currentIdentity);
  }
  rollIdentity = self->_rollIdentity;
  if (rollIdentity)
  {
    self->_rollIdentity = 0;
    CFRelease(rollIdentity);
  }
  currentItemReference = self->_currentItemReference;
  self->_currentItemReference = 0;

  existingItemSHA1 = self->_existingItemSHA1;
  self->_existingItemSHA1 = 0;

  existingItemReference = self->_existingItemReference;
  self->_existingItemReference = 0;

  rollItemSHA1 = self->_rollItemSHA1;
  self->_rollItemSHA1 = 0;

  rollItemReference = self->_rollItemReference;
  self->_rollItemReference = 0;
}

- (void)setCurrentIdentity:(_PCSIdentityData *)a3 persistentReference:(id)a4
{
  v6 = (NSData *)a4;
  currentIdentity = self->_currentIdentity;
  if (currentIdentity)
  {
    self->_currentIdentity = 0;
    CFRelease(currentIdentity);
  }
  if (a3) {
    self->_currentIdentity = (_PCSIdentityData *)CFRetain(a3);
  }
  currentItemReference = self->_currentItemReference;
  self->_currentItemReference = v6;
}

- (void)dealloc
{
  [(PCSCKKSItemModifyContext *)self resetIdentities];
  log = self->_log;
  if (log) {
    CFRelease(log);
  }
  rollAttributes = self->_rollAttributes;
  if (rollAttributes) {
    CFRelease(rollAttributes);
  }
  v5.receiver = self;
  v5.super_class = (Class)PCSCKKSItemModifyContext;
  [(PCSCKKSItemModifyContext *)&v5 dealloc];
}

- (_PCSIdentitySetData)set
{
  return self->_set;
}

- (void)setSet:(_PCSIdentitySetData *)a3
{
  self->_set = a3;
}

- (__PCSLogContext)log
{
  return self->_log;
}

- (void)setLog:(__PCSLogContext *)a3
{
  self->_log = a3;
}

- (int64_t)timeoutValue
{
  return self->_timeoutValue;
}

- (void)setTimeoutValue:(int64_t)a3
{
  self->_timeoutValue = a3;
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDsid:(id)a3
{
}

- (NSString)service
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setService:(id)a3
{
}

- (_PCSIdentityData)currentIdentity
{
  return self->_currentIdentity;
}

- (void)setCurrentIdentity:(_PCSIdentityData *)a3
{
  self->_currentIdentity = a3;
}

- (NSData)currentItemReference
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCurrentItemReference:(id)a3
{
}

- (NSData)existingItemReference
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setExistingItemReference:(id)a3
{
}

- (NSData)existingItemSHA1
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void)setExistingItemSHA1:(id)a3
{
}

- (_PCSIdentityData)rollIdentity
{
  return self->_rollIdentity;
}

- (void)setRollIdentity:(_PCSIdentityData *)a3
{
  self->_rollIdentity = a3;
}

- (NSData)rollItemReference
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRollItemReference:(id)a3
{
}

- (NSData)rollItemSHA1
{
  return (NSData *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRollItemSHA1:(id)a3
{
}

- (NSDate)server_NextRollDate
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setServer_NextRollDate:(id)a3
{
}

- (BOOL)sync
{
  return self->_sync;
}

- (void)setSync:(BOOL)a3
{
  self->_sync = a3;
}

- (BOOL)forceSync
{
  return self->_forceSync;
}

- (void)setForceSync:(BOOL)a3
{
  self->_forceSync = a3;
}

- (BOOL)roll
{
  return self->_roll;
}

- (void)setRoll:(BOOL)a3
{
  self->_roll = a3;
}

- (int)retryLeftCount
{
  return self->_retryLeftCount;
}

- (void)setRetryLeftCount:(int)a3
{
  self->_retryLeftCount = a3;
}

- (PCSMTT)mtt
{
  return (PCSMTT *)objc_getProperty(self, a2, 128, 1);
}

- (BOOL)returnedExistingIdentity
{
  return self->_returnedExistingIdentity;
}

- (void)setReturnedExistingIdentity:(BOOL)a3
{
  self->_returnedExistingIdentity = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTransaction:(id)a3
{
}

- (PCSLockAssertion)lockAssertion
{
  return (PCSLockAssertion *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLockAssertion:(id)a3
{
}

- (id)activityAssertion
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setActivityAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activityAssertion, 0);
  objc_storeStrong((id *)&self->_lockAssertion, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_mtt, 0);
  objc_storeStrong((id *)&self->_server_NextRollDate, 0);
  objc_storeStrong((id *)&self->_rollItemSHA1, 0);
  objc_storeStrong((id *)&self->_rollItemReference, 0);
  objc_storeStrong((id *)&self->_existingItemSHA1, 0);
  objc_storeStrong((id *)&self->_existingItemReference, 0);
  objc_storeStrong((id *)&self->_currentItemReference, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

@end
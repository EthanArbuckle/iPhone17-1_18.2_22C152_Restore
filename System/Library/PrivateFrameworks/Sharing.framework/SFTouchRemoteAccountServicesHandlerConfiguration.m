@interface SFTouchRemoteAccountServicesHandlerConfiguration
- (BOOL)isHomeSharingSetupNeeded;
- (BOOL)isPrimaryAppleAccount;
- (BOOL)shouldActivateStoreAccount;
- (BOOL)shouldIgnoreStoreAccountConversion;
- (BOOL)shouldSuppressStoreSignInDialogs;
- (NSSet)supportedTRAccountServices;
- (OS_dispatch_queue)dispatchQueue;
- (SFTouchRemoteAccountServicesHandlerConfiguration)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIsHomeSharingSetupNeeded:(BOOL)a3;
- (void)setIsPrimaryAppleAccount:(BOOL)a3;
- (void)setShouldActivateStoreAccount:(BOOL)a3;
- (void)setShouldIgnoreStoreAccountConversion:(BOOL)a3;
- (void)setShouldSuppressStoreSignInDialogs:(BOOL)a3;
- (void)setSupportedTRAccountServices:(id)a3;
@end

@implementation SFTouchRemoteAccountServicesHandlerConfiguration

- (SFTouchRemoteAccountServicesHandlerConfiguration)init
{
  v9.receiver = self;
  v9.super_class = (Class)SFTouchRemoteAccountServicesHandlerConfiguration;
  v2 = [(SFTouchRemoteAccountServicesHandlerConfiguration *)&v9 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EFA0A058];
    supportedTRAccountServices = v3->_supportedTRAccountServices;
    v3->_supportedTRAccountServices = (NSSet *)v6;

    *(_DWORD *)&v3->_isPrimaryAppleAccount = 16842753;
    v3->_isHomeSharingSetupNeeded = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(SFTouchRemoteAccountServicesHandlerConfiguration);
  objc_storeStrong((id *)&v4->_dispatchQueue, self->_dispatchQueue);
  uint64_t v5 = [(NSSet *)self->_supportedTRAccountServices copy];
  supportedTRAccountServices = v4->_supportedTRAccountServices;
  v4->_supportedTRAccountServices = (NSSet *)v5;

  v4->_isPrimaryAppleAccount = self->_isPrimaryAppleAccount;
  v4->_shouldActivateStoreAccount = self->_shouldActivateStoreAccount;
  v4->_shouldSuppressStoreSignInDialogs = self->_shouldSuppressStoreSignInDialogs;
  v4->_shouldIgnoreStoreAccountConversion = self->_shouldIgnoreStoreAccountConversion;
  v4->_isHomeSharingSetupNeeded = self->_isHomeSharingSetupNeeded;
  return v4;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSSet)supportedTRAccountServices
{
  return self->_supportedTRAccountServices;
}

- (void)setSupportedTRAccountServices:(id)a3
{
}

- (BOOL)isPrimaryAppleAccount
{
  return self->_isPrimaryAppleAccount;
}

- (void)setIsPrimaryAppleAccount:(BOOL)a3
{
  self->_isPrimaryAppleAccount = a3;
}

- (BOOL)shouldActivateStoreAccount
{
  return self->_shouldActivateStoreAccount;
}

- (void)setShouldActivateStoreAccount:(BOOL)a3
{
  self->_shouldActivateStoreAccount = a3;
}

- (BOOL)shouldSuppressStoreSignInDialogs
{
  return self->_shouldSuppressStoreSignInDialogs;
}

- (void)setShouldSuppressStoreSignInDialogs:(BOOL)a3
{
  self->_shouldSuppressStoreSignInDialogs = a3;
}

- (BOOL)shouldIgnoreStoreAccountConversion
{
  return self->_shouldIgnoreStoreAccountConversion;
}

- (void)setShouldIgnoreStoreAccountConversion:(BOOL)a3
{
  self->_shouldIgnoreStoreAccountConversion = a3;
}

- (BOOL)isHomeSharingSetupNeeded
{
  return self->_isHomeSharingSetupNeeded;
}

- (void)setIsHomeSharingSetupNeeded:(BOOL)a3
{
  self->_isHomeSharingSetupNeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTRAccountServices, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
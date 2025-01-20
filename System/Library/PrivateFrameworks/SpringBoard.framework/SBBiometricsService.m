@interface SBBiometricsService
+ (id)sharedInstance;
- (SBBiometricsService)init;
- (void)systemServiceServer:(id)a3 client:(id)a4 fetchUnlockCredentialSet:(id)a5;
@end

@implementation SBBiometricsService

+ (id)sharedInstance
{
  if (sharedInstance___once_12 != -1) {
    dispatch_once(&sharedInstance___once_12, &__block_literal_global_422);
  }
  v2 = (void *)sharedInstance___instance_12;
  return v2;
}

uint64_t __37__SBBiometricsService_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBBiometricsService);
  v1 = (void *)sharedInstance___instance_12;
  sharedInstance___instance_12 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBBiometricsService)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBBiometricsService;
  v2 = [(SBBiometricsService *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FA7C68] sharedInstance];
    biometricResource = v2->_biometricResource;
    v2->_biometricResource = (SBUIBiometricResource *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.mesa.unlockCredential"];
    unlockCredentialAuthenticator = v2->_unlockCredentialAuthenticator;
    v2->_unlockCredentialAuthenticator = (FBServiceClientAuthenticator *)v5;

    v7 = +[SBSystemServiceServer sharedInstance];
    [v7 setBiometricsDelegate:v2];
  }
  return v2;
}

- (void)systemServiceServer:(id)a3 client:(id)a4 fetchUnlockCredentialSet:(id)a5
{
  v7 = (void (**)(id, void *))a5;
  if (v7)
  {
    v10 = v7;
    if ([(FBServiceClientAuthenticator *)self->_unlockCredentialAuthenticator authenticateClient:a4])
    {
      v8 = [(SBUIBiometricResource *)self->_biometricResource unlockCredentialSet];
      objc_super v9 = [v8 serializedCredentialSet];
    }
    else
    {
      objc_super v9 = 0;
    }
    v10[2](v10, v9);

    v7 = v10;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockCredentialAuthenticator, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
}

@end
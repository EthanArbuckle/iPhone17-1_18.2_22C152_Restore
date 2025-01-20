@interface SBSBiometricsService
- (void)_acquireBiometricAssertionOfType:(unsigned __int8)a3 assertionName:(id)a4 reason:(id)a5 completion:(id)a6;
- (void)acquireUnlockSuppressionAssertionForReason:(id)a3 completion:(id)a4;
- (void)acquireWalletPreArmSuppressionAssertionForReason:(id)a3 completion:(id)a4;
- (void)fetchUnlockCredentialSetWithCompletion:(id)a3;
@end

@implementation SBSBiometricsService

- (void)_acquireBiometricAssertionOfType:(unsigned __int8)a3 assertionName:(id)a4 reason:(id)a5 completion:(id)a6
{
  uint64_t v8 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  v11 = (void (**)(id, SBSAssertion *))a6;
  id v12 = objc_alloc_init(MEMORY[0x1E4F4F768]);
  if ([v12 isUsable])
  {
    memset(v19, 0, 512);
    v13 = NSString;
    v14 = [MEMORY[0x1E4F29128] UUID];
    v15 = [v14 UUIDString];
    v16 = [v13 stringWithFormat:@"%@-%@", v15, v10];

    if ([v16 getCString:v19 maxLength:1024 encoding:4]
      && (uint64_t v17 = SBSSpringBoardServerPort(),
          !SBAddBiometricAssertion(v17, v19, [v12 port], v8)))
    {
      v18 = [[SBSAssertion alloc] initWithAssertionName:v9 reason:v16 receiveRight:v12];
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }
  v11[2](v11, v18);
}

- (void)acquireWalletPreArmSuppressionAssertionForReason:(id)a3 completion:(id)a4
{
}

- (void)fetchUnlockCredentialSetWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(SBSAbstractFacilityService *)self callbackQueue];
    v6 = [(SBSAbstractSystemService *)self client];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__SBSBiometricsService_fetchUnlockCredentialSetWithCompletion___block_invoke;
    v8[3] = &unk_1E566B598;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    [v6 fetchUnlockCredentialSetWithCompletion:v8];
  }
}

void __63__SBSBiometricsService_fetchUnlockCredentialSetWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__SBSBiometricsService_fetchUnlockCredentialSetWithCompletion___block_invoke_2;
  v7[3] = &unk_1E566B4B0;
  id v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __63__SBSBiometricsService_fetchUnlockCredentialSetWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)acquireUnlockSuppressionAssertionForReason:(id)a3 completion:(id)a4
{
}

@end
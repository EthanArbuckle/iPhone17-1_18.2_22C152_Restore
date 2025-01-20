@interface SBXXAddBiometricAssertion
@end

@implementation SBXXAddBiometricAssertion

void ___SBXXAddBiometricAssertion_block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48) == 1)
  {
    id v5 = +[SBWalletPreArmController sharedInstance];
    uint64_t v2 = [v5 acquireSuppressPreArmAssertionOfType:2 forReason:*(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  else
  {
    if (*(unsigned char *)(a1 + 48)) {
      return;
    }
    id v5 = +[SBLockScreenManager sharedInstance];
    [v5 _setMesaUnlockingDisabled:1 forReason:*(void *)(a1 + 32)];
  }
}

void ___SBXXAddBiometricAssertion_block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___SBXXAddBiometricAssertion_block_invoke_3;
  block[3] = &unk_1E6AF8D68;
  char v7 = *(unsigned char *)(a1 + 48);
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void ___SBXXAddBiometricAssertion_block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48) == 1)
  {
    id v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v2 invalidate];
  }
  else if (!*(unsigned char *)(a1 + 48))
  {
    id v3 = +[SBLockScreenManager sharedInstance];
    [v3 _setMesaUnlockingDisabled:0 forReason:*(void *)(a1 + 32)];
  }
}

@end
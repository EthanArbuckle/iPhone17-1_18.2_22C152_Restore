@interface PXErrorRecoveryDelegate
+ (id)sharedErrorRecoveryDelegate;
- (void)_didPresentErrorWithRecovery:(BOOL)a3 contextInfo:(void *)a4;
@end

@implementation PXErrorRecoveryDelegate

- (void)_didPresentErrorWithRecovery:(BOOL)a3 contextInfo:(void *)a4
{
  if (a4)
  {
    v5 = a4;
    self = (PXErrorRecoveryDelegate *)(*((uint64_t (**)(void *, BOOL))a4 + 2))(a4, a3);
    a4 = v5;
    uint64_t v4 = vars8;
  }
  MEMORY[0x1F4181870](self, a2, a3, a4);
}

+ (id)sharedErrorRecoveryDelegate
{
  if (sharedErrorRecoveryDelegate_onceToken != -1) {
    dispatch_once(&sharedErrorRecoveryDelegate_onceToken, &__block_literal_global_103637);
  }
  v2 = (void *)sharedErrorRecoveryDelegate_sharedErrorRecoveryDelegate;
  return v2;
}

void __54__PXErrorRecoveryDelegate_sharedErrorRecoveryDelegate__block_invoke()
{
  v0 = objc_alloc_init(PXErrorRecoveryDelegate);
  v1 = (void *)sharedErrorRecoveryDelegate_sharedErrorRecoveryDelegate;
  sharedErrorRecoveryDelegate_sharedErrorRecoveryDelegate = (uint64_t)v0;
}

@end
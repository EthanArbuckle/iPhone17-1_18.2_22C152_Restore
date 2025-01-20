@interface GetPrimaryAppleAccountAttributes
@end

@implementation GetPrimaryAppleAccountAttributes

void ___GetPrimaryAppleAccountAttributes_block_invoke_2(uint64_t a1)
{
  if (_MergedGlobals_261 && *(unsigned char *)(a1 + 40))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v2();
  }
  else
  {
    v3 = +[PKAppleAccountManager sharedInstance];
    id v4 = [v3 appleAccountInformation];

    _MergedGlobals_261 = v4 != 0;
    byte_1EB4032F9 = [v4 isManagedAppleAccount];
    byte_1EB4032FA = [v4 isWalletEnabledOnManagedAppleAccount];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void ___GetPrimaryAppleAccountAttributes_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.passkitcore.wallet.visibility", 0);
  v1 = (void *)qword_1EB403318;
  qword_1EB403318 = (uint64_t)v0;
}

@end
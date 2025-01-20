@interface SBLegacyRemoteAlertContentHostViewController
@end

@implementation SBLegacyRemoteAlertContentHostViewController

uint64_t __88___SBLegacyRemoteAlertContentHostViewController__getPreferredContentSizeWithReplyBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:");
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

@end
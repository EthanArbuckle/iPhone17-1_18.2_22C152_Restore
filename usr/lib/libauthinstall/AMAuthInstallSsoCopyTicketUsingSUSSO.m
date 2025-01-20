@interface AMAuthInstallSsoCopyTicketUsingSUSSO
@end

@implementation AMAuthInstallSsoCopyTicketUsingSUSSO

CFTypeRef ___AMAuthInstallSsoCopyTicketUsingSUSSO_block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = _AMAuthInstallSsoSUSSOCopyToken(a1[7], *(void *)(a1[5] + 8) + 24);
  SafeRetain(*(CFTypeRef *)(*(void *)(a1[4] + 8) + 24));
  CFTypeRef result = SafeRetain(*(CFTypeRef *)(*(void *)(a1[5] + 8) + 24));
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  return result;
}

@end
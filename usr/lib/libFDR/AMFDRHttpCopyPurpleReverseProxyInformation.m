@interface AMFDRHttpCopyPurpleReverseProxyInformation
@end

@implementation AMFDRHttpCopyPurpleReverseProxyInformation

intptr_t ___AMFDRHttpCopyPurpleReverseProxyInformation_block_invoke(intptr_t result, int a2)
{
  if (a2 != 3)
  {
    if (a2 != 1) {
      return result;
    }
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(result + 40));
}

@end
@interface MFHasAccountsEntitlement
@end

@implementation MFHasAccountsEntitlement

__SecTask *__MFHasAccountsEntitlement_block_invoke()
{
  result = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (result)
  {
    v1 = result;
    CFDictionaryRef v2 = SecTaskCopyValuesForEntitlements(result, (CFArrayRef)&unk_1F26754F0, 0);
    v3 = (id)CFMakeCollectable(v2);
    CFRelease(v1);
    result = (__SecTask *)[v3 count];
    MFHasAccountsEntitlement___hasAccountsEntitlement = result != 0;
  }
  return result;
}

@end
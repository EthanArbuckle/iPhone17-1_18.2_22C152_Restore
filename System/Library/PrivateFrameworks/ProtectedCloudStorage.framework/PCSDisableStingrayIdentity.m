@interface PCSDisableStingrayIdentity
@end

@implementation PCSDisableStingrayIdentity

intptr_t ____PCSDisableStingrayIdentity_block_invoke(void *a1, uint64_t a2)
{
  if (a2)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a2;
    CFRetain(*(CFTypeRef *)(*(void *)(a1[5] + 8) + 24));
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  v3 = a1[4];
  return dispatch_semaphore_signal(v3);
}

@end
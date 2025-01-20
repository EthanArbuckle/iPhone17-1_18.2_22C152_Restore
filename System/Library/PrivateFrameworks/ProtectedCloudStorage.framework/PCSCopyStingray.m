@interface PCSCopyStingray
@end

@implementation PCSCopyStingray

intptr_t ____PCSCopyStingray_block_invoke(void *a1, CFTypeRef cf, uint64_t a3)
{
  if (a3)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
    CFRetain(*(CFTypeRef *)(*(void *)(a1[5] + 8) + 24));
  }
  else if (cf)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = CFRetain(cf);
  }
  else
  {
    _PCSError((const void **)(*(void *)(a1[5] + 8) + 24), 44, @"SecureBackup didn't return identity nor error");
  }
  v4 = a1[4];
  return dispatch_semaphore_signal(v4);
}

@end
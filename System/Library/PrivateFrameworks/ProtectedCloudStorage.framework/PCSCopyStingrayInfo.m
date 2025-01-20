@interface PCSCopyStingrayInfo
@end

@implementation PCSCopyStingrayInfo

intptr_t ____PCSCopyStingrayInfo_block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
    uint64_t v4 = a1[5];
  }
  else
  {
    if (!a2) {
      goto LABEL_6;
    }
    *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
    uint64_t v4 = a1[6];
  }
  CFRetain(*(CFTypeRef *)(*(void *)(v4 + 8) + 24));
LABEL_6:
  v5 = a1[4];
  return dispatch_semaphore_signal(v5);
}

@end
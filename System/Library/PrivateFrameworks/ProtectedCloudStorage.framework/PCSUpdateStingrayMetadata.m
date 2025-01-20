@interface PCSUpdateStingrayMetadata
@end

@implementation PCSUpdateStingrayMetadata

intptr_t ____PCSUpdateStingrayMetadata_block_invoke(void *a1, CFTypeRef cf)
{
  if (cf) {
    *(void *)(*(void *)(a1[5] + 8) + 24) = CFRetain(cf);
  }
  else {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  v3 = a1[4];
  return dispatch_semaphore_signal(v3);
}

@end
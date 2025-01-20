@interface UISearchTokenAttachmentViewProvider
@end

@implementation UISearchTokenAttachmentViewProvider

uint64_t __66___UISearchTokenAttachmentViewProvider_isLastAttachmentBeforeText__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [a2 characterAtIndex:0];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result != 65532;
  *a5 = 1;
  return result;
}

@end
@interface UIDocumentSetEditingDisabled
@end

@implementation UIDocumentSetEditingDisabled

uint64_t ___UIDocumentSetEditingDisabled_block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 disableEditing];
  }
  else {
    [v3 enableEditing];
  }
  v4 = *(void **)(a1 + 32);
  return [v4 _sendStateChangedNotification];
}

@end
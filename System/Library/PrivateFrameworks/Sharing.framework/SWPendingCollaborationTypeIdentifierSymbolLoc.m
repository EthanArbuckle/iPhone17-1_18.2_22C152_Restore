@interface SWPendingCollaborationTypeIdentifierSymbolLoc
@end

@implementation SWPendingCollaborationTypeIdentifierSymbolLoc

void *__get_SWPendingCollaborationTypeIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)SharedWithYouCoreLibrary();
  result = dlsym(v2, "_SWPendingCollaborationTypeIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_SWPendingCollaborationTypeIdentifierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end
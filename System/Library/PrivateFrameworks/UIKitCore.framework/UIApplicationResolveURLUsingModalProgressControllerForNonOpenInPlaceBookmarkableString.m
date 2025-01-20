@interface UIApplicationResolveURLUsingModalProgressControllerForNonOpenInPlaceBookmarkableString
@end

@implementation UIApplicationResolveURLUsingModalProgressControllerForNonOpenInPlaceBookmarkableString

uint64_t ___UIApplicationResolveURLUsingModalProgressControllerForNonOpenInPlaceBookmarkableString_block_invoke(uint64_t a1, char a2)
{
  [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  if ((a2 & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  v4 = *(void **)(a1 + 40);
  return objc_msgSend(v4, "ui_scheduleForCleanup");
}

@end
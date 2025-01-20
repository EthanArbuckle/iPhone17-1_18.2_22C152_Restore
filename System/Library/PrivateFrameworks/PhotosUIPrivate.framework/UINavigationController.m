@interface UINavigationController
@end

@implementation UINavigationController

BOOL __84__UINavigationController_PhotosUI__pu_popToViewControllerIfAllowed_animated_forced___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v3 prepareForDismissingForced:*(unsigned __int8 *)(a1 + 48)] & 1) == 0
    && !*(unsigned char *)(a1 + 48))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    BOOL v4 = *(void *)(a1 + 32) != (void)v3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

@end
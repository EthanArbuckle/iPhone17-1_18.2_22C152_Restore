@interface UIApplicationResolveURLForOpenInPlaceBookmarkableString
@end

@implementation UIApplicationResolveURLForOpenInPlaceBookmarkableString

void ___UIApplicationResolveURLForOpenInPlaceBookmarkableString_block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    v3 = *(void (**)(void))(a1[6] + 16);
    v3();
  }
  else
  {
    NSLog(&cfstr_ErrorResolving.isa, a3, a1[4], a1[5]);
  }
}

@end
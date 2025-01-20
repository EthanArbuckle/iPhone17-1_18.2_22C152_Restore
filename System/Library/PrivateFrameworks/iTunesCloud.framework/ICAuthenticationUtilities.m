@interface ICAuthenticationUtilities
+ (AKAppleIDSession)sharedAuthKitSession;
@end

@implementation ICAuthenticationUtilities

+ (AKAppleIDSession)sharedAuthKitSession
{
  if (sharedAuthKitSession_sOnceToken != -1) {
    dispatch_once(&sharedAuthKitSession_sOnceToken, &__block_literal_global_782);
  }
  v2 = (void *)sharedAuthKitSession_sSharedAuthKitSession;

  return (AKAppleIDSession *)v2;
}

uint64_t __49__ICAuthenticationUtilities_sharedAuthKitSession__block_invoke()
{
  sharedAuthKitSession_sSharedAuthKitSession = (uint64_t)objc_alloc_init(MEMORY[0x1E4F4EF78]);

  return MEMORY[0x1F41817F8]();
}

@end
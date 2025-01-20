@interface SBActiveRemoteTransientOverlayViewProviderRegistry
@end

@implementation SBActiveRemoteTransientOverlayViewProviderRegistry

void __69___SBActiveRemoteTransientOverlayViewProviderRegistry_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_SBActiveRemoteTransientOverlayViewProviderRegistry);
  v1 = (void *)sharedInstance___registry;
  sharedInstance___registry = (uint64_t)v0;
}

@end
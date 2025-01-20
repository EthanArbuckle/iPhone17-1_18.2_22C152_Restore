@interface SBActiveRemoteTransientOverlayViewProviderAdapter
@end

@implementation SBActiveRemoteTransientOverlayViewProviderAdapter

void __118___SBActiveRemoteTransientOverlayViewProviderAdapter_presentRemoteTransientOverlayViewController_presentationRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (uint64_t)(*MEMORY[0x1E4F43CF8] + 5.0);
  id v3 = a2;
  [v3 setLevel:v2];
  [v3 setFillsDisplayBounds:1];
  [v3 setLayoutRole:4];
}

@end
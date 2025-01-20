@interface TVVisualEffectView
@end

@implementation TVVisualEffectView

uint64_t __43___TVVisualEffectView_hostViewDisablements__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
  uint64_t v1 = hostViewDisablements_hostViewDisablements;
  hostViewDisablements_hostViewDisablements = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end
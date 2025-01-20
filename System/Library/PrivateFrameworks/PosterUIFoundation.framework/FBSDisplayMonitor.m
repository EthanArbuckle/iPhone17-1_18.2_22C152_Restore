@interface FBSDisplayMonitor
@end

@implementation FBSDisplayMonitor

uint64_t __65__FBSDisplayMonitor_PosterUIFoundation__pui_sharedDisplayMonitor__block_invoke()
{
  pui_sharedDisplayMonitor_displayMonitor = (uint64_t)objc_alloc_init(MEMORY[0x263F3F750]);
  return MEMORY[0x270F9A758]();
}

@end
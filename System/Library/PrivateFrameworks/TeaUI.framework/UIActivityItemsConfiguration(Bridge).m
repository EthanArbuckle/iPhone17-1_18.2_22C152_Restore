@interface UIActivityItemsConfiguration(Bridge)
- (uint64_t)initTSWithActivityItemSources:()Bridge;
- (void)ts_setExcludedActivityTypes:()Bridge;
@end

@implementation UIActivityItemsConfiguration(Bridge)

- (uint64_t)initTSWithActivityItemSources:()Bridge
{
  if (!a3) {
    a3 = MEMORY[0x1E4F1CBF0];
  }
  return [a1 _initWithActivityItemSources:a3];
}

- (void)ts_setExcludedActivityTypes:()Bridge
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [a1 _setExcludedActivityTypes:v4];
  }
}

@end
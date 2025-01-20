@interface UIEventHIDIgnoresDragEvents
@end

@implementation UIEventHIDIgnoresDragEvents

uint64_t ___UIEventHIDIgnoresDragEvents_block_invoke()
{
  uint64_t result = [(id)objc_opt_class() _isUIKitSystemProcess];
  if (result) {
    uint64_t result = _UIApplicationProcessIsDruid();
  }
  _MergedGlobals_1210 = result;
  return result;
}

@end
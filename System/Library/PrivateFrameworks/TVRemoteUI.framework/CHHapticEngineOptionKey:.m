@interface CHHapticEngineOptionKey:
- (uint64_t)Any;
@end

@implementation CHHapticEngineOptionKey:

- (uint64_t)Any
{
  return swift_release();
}

@end
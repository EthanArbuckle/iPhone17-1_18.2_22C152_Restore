@interface UVPreviewSceneSettings(InterruptionPolicy)
- (uint64_t)copyResettingInterruptionPolicy;
@end

@implementation UVPreviewSceneSettings(InterruptionPolicy)

- (uint64_t)copyResettingInterruptionPolicy
{
  v1 = (void *)[a1 mutableCopy];
  [v1 setInterruptionPolicy:1];
  uint64_t v2 = [v1 copy];

  return v2;
}

@end
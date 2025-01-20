@interface CHSControlDescriptor(PREditingSceneViewController)
- (uint64_t)pr_configurationType;
@end

@implementation CHSControlDescriptor(PREditingSceneViewController)

- (uint64_t)pr_configurationType
{
  return 1;
}

@end
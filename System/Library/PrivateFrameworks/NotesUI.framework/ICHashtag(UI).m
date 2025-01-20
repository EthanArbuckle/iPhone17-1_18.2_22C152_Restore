@interface ICHashtag(UI)
- (uint64_t)removeUsage;
@end

@implementation ICHashtag(UI)

- (uint64_t)removeUsage
{
  [MEMORY[0x1E4F83380] removeUsageOfHashtag:a1];
  v2 = (void *)MEMORY[0x1E4F83418];
  return [v2 removeUsageOfHashtag:a1];
}

@end
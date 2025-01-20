@interface NTHeadline(Placeholder)
- (BOOL)isHiddenFromAutoFavorites;
- (NSArray)topicIDs;
@end

@implementation NTHeadline(Placeholder)

- (BOOL)isHiddenFromAutoFavorites
{
  return 0;
}

- (NSArray)topicIDs
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

@end
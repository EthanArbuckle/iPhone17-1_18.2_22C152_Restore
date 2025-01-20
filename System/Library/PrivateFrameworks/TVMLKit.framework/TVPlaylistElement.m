@interface TVPlaylistElement
- (NSArray)videos;
@end

@implementation TVPlaylistElement

- (NSArray)videos
{
  v2 = [(TVViewElement *)self childViewElements];
  v3 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_13];
  v4 = [v2 filteredArrayUsingPredicate:v3];

  v5 = (void *)[v4 copy];
  return (NSArray *)v5;
}

uint64_t __27__TVPlaylistElement_videos__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
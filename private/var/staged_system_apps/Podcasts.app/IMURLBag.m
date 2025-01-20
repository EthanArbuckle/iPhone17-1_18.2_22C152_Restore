@interface IMURLBag
- (int64_t)audioLimit;
- (int64_t)videoLimit;
@end

@implementation IMURLBag

- (int64_t)videoLimit
{
  return (int64_t)[(IMURLBag *)self downloadLimitVideoPodcast];
}

- (int64_t)audioLimit
{
  return (int64_t)[(IMURLBag *)self downloadLimitPodcast];
}

@end
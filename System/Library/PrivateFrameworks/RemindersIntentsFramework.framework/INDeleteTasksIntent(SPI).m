@interface INDeleteTasksIntent(SPI)
- (uint64_t)rem_all;
@end

@implementation INDeleteTasksIntent(SPI)

- (uint64_t)rem_all
{
  v1 = [a1 all];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end
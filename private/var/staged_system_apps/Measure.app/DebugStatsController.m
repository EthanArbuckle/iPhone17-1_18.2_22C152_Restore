@interface DebugStatsController
- (void)tick;
@end

@implementation DebugStatsController

- (void)tick
{
  uint64_t v2 = *(void *)self->tickCount;
  BOOL v3 = __OFADD__(v2, 1);
  uint64_t v4 = v2 + 1;
  if (v3) {
    __break(1u);
  }
  else {
    *(void *)self->tickCount = v4;
  }
}

@end
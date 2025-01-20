@interface TSCachePreFlushTask
- (TSCachePreFlushTask)init;
- (void)dealloc;
- (void)finish;
@end

@implementation TSCachePreFlushTask

- (void)dealloc
{
  v2 = self;
  CachePreFlushTask.__deallocating_deinit();
}

- (void).cxx_destruct
{
}

- (void)finish
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___TSCachePreFlushTask_block);
  v3 = *(void (**)(uint64_t))((char *)&self->super.isa + OBJC_IVAR___TSCachePreFlushTask_block);
  v4 = self;
  if (v3)
  {
    uint64_t v5 = sub_1DEABEEE0((uint64_t)v3);
    v3(v5);
    sub_1DEABEEF0((uint64_t)v3);
    uint64_t v6 = *v2;
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t *v2 = 0;
  v2[1] = 0;
  sub_1DEABEEF0(v6);
}

- (TSCachePreFlushTask)init
{
  result = (TSCachePreFlushTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
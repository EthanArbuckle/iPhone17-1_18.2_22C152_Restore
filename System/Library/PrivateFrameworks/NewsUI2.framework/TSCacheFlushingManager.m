@interface TSCacheFlushingManager
- (TSCacheFlushingManager)init;
- (id)createPreFlushTask;
- (void)addPreFlushTask:(id)a3;
- (void)enableFlushing;
@end

@implementation TSCacheFlushingManager

- (id)createPreFlushTask
{
  v2 = self;
  id v3 = CacheFlushingManager.createPreFlushTask()();

  return v3;
}

- (void)addPreFlushTask:(id)a3
{
  v4 = _Block_copy(a3);
  v5 = *(NSObject **)((char *)&self->super.isa + OBJC_IVAR___TSCacheFlushingManager_preFlushGroup);
  v6 = self;
  dispatch_group_enter(v5);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v10[4] = sub_1DEADA758;
  v10[5] = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 1107296256;
  v10[2] = sub_1DE9744A8;
  v10[3] = &block_descriptor_24_3;
  v8 = _Block_copy(v10);
  v9 = (void (*)(void *, void *))v4[2];
  swift_retain_n();
  v9(v4, v8);
  _Block_release(v8);
  swift_release_n();
  swift_release();
  _Block_release(v4);
}

- (void)enableFlushing
{
  v2 = self;
  _s7NewsUI220CacheFlushingManagerC06enableD0yyF_0();
}

- (TSCacheFlushingManager)init
{
  result = (TSCacheFlushingManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___TSCacheFlushingManager_storageLevelProvider);

  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSCacheFlushingManager_updateQueue);
}

@end
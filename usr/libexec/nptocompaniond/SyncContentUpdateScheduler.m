@interface SyncContentUpdateScheduler
- (_TtC14nptocompaniond26SyncContentUpdateScheduler)init;
- (void)powerSourceInfoHasExternalPowerSourceConnectedDidChange:(id)a3;
@end

@implementation SyncContentUpdateScheduler

- (_TtC14nptocompaniond26SyncContentUpdateScheduler)init
{
  result = (_TtC14nptocompaniond26SyncContentUpdateScheduler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000B3D4((uint64_t)self + OBJC_IVAR____TtC14nptocompaniond26SyncContentUpdateScheduler_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14nptocompaniond26SyncContentUpdateScheduler_preferenceAccessor));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14nptocompaniond26SyncContentUpdateScheduler_updateQueue));
  swift_unknownObjectRelease();
  sub_10000BD30((uint64_t)self + OBJC_IVAR____TtC14nptocompaniond26SyncContentUpdateScheduler_appLastOpenDatePreferenceObserver, (uint64_t *)&unk_1000A0BC0);

  swift_release();
}

- (void)powerSourceInfoHasExternalPowerSourceConnectedDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000B3FC(v4);
}

@end
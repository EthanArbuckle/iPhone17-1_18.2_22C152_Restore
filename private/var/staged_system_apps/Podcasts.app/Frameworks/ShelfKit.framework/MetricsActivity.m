@interface MetricsActivity
+ (_TtC8ShelfKit15MetricsActivity)shared;
- (NSString)pageContext;
- (NSString)playContext;
- (NSString)stopContext;
- (NSString)stopType;
- (_TtC8ShelfKit15MetricsActivity)init;
- (void)clearStopInfo;
- (void)dealloc;
- (void)setInitiator:(unint64_t)a3;
- (void)setPlayReason:(unint64_t)a3;
- (void)setStopReason:(unint64_t)a3;
@end

@implementation MetricsActivity

- (void)dealloc
{
  v2 = self;
  MetricsActivity.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

+ (_TtC8ShelfKit15MetricsActivity)shared
{
  if (qword_4A8E40 != -1) {
    swift_once();
  }
  v2 = (void *)qword_4B5050;

  return (_TtC8ShelfKit15MetricsActivity *)v2;
}

- (NSString)pageContext
{
  v2 = self;
  sub_3D4650();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_3D7D10();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setPlayReason:(unint64_t)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit15MetricsActivity_state);
  uint64_t v4 = v3 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v3 + 16);
  NSString v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  v6 = self;
  os_unfair_lock_lock(v5);
  sub_196C84(v4);
  os_unfair_lock_unlock(v5);
}

- (void)setInitiator:(unint64_t)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit15MetricsActivity_state);
  uint64_t v4 = v3 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v3 + 16);
  NSString v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  v6 = self;
  os_unfair_lock_lock(v5);
  sub_196C9C(v4);
  os_unfair_lock_unlock(v5);
}

- (NSString)playContext
{
  v2 = self;
  MetricsActivity.playContext.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_3D7D10();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setStopReason:(unint64_t)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit15MetricsActivity_state);
  uint64_t v4 = v3 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v3 + 16);
  NSString v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(void *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  v6 = self;
  os_unfair_lock_lock(v5);
  sub_196CB4(v4);
  os_unfair_lock_unlock(v5);
}

- (NSString)stopContext
{
  uint64_t v3 = type metadata accessor for MetricsActivity.State(0);
  __chkstk_darwin(v3);
  NSString v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_3D54C0();
  char v7 = v5[*(int *)(v3 + 40) + 8];
  sub_19602C((uint64_t)v5, type metadata accessor for MetricsActivity.State);
  if (v7)
  {

    NSString v8 = 0;
  }
  else
  {
    id v9 = (id)NSPersistentStringFromMTStopReason();
    sub_3D7D50();

    NSString v8 = sub_3D7D10();
    swift_bridgeObjectRelease();
  }

  return (NSString *)v8;
}

- (NSString)stopType
{
  uint64_t v3 = type metadata accessor for MetricsActivity.State(0);
  __chkstk_darwin(v3);
  NSString v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_3D54C0();
  char v7 = v5[*(int *)(v3 + 32) + 8];
  sub_19602C((uint64_t)v5, type metadata accessor for MetricsActivity.State);
  if (v7)
  {

    NSString v8 = 0;
  }
  else
  {
    id v9 = (id)NSPersistentStringFromMTPlaybackAdjustmentInitiator();
    sub_3D7D50();

    NSString v8 = sub_3D7D10();
    swift_bridgeObjectRelease();
  }

  return (NSString *)v8;
}

- (void)clearStopInfo
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit15MetricsActivity_state);
  uint64_t v3 = v2 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v2 + 16);
  uint64_t v4 = (os_unfair_lock_s *)(v2 + ((*(unsigned int *)(*(void *)v2 + 48) + 3) & 0x1FFFFFFFCLL));
  NSString v5 = self;
  os_unfair_lock_lock(v4);
  sub_195108(v3);
  os_unfair_lock_unlock(v4);
}

- (_TtC8ShelfKit15MetricsActivity)init
{
  result = (_TtC8ShelfKit15MetricsActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
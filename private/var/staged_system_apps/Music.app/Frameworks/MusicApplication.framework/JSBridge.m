@interface JSBridge
- (_TtC11MusicJSCore8JSBridge)init;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
@end

@implementation JSBridge

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  sub_173E4(0, (unint64_t *)&qword_DC0F50);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  v6 = self;
  id v7 = a3;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_9ABA40, v5);
  swift_release();
}

- (_TtC11MusicJSCore8JSBridge)init
{
  return (_TtC11MusicJSCore8JSBridge *)JSBridge.init()();
}

- (void).cxx_destruct
{
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore8JSBridge_initializationDate, (uint64_t *)&unk_DD8B70);
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore8JSBridge____lazy_storage___bootSignpost, &qword_DFC6A8);
  swift_release();
  swift_release();
  sub_9AA8EC(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons), *(void **)&self->thread[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons], *(void **)&self->provider[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 8], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 16], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 24], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 32], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 40], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 48], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 56], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 64], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 72], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 80], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 88]);
  swift_release();
  sub_9A85E8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11MusicJSCore8JSBridge_state), *(void *)&self->thread[OBJC_IVAR____TtC11MusicJSCore8JSBridge_state], *(void *)&self->provider[OBJC_IVAR____TtC11MusicJSCore8JSBridge_state]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end
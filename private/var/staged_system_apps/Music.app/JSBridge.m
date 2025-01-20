@interface JSBridge
- (_TtC11MusicJSCore8JSBridge)init;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
@end

@implementation JSBridge

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  sub_100057778(0, &qword_10109C1F0);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  v6 = self;
  id v7 = a3;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_100C67C64, v5);
  swift_release();
}

- (_TtC11MusicJSCore8JSBridge)init
{
  return (_TtC11MusicJSCore8JSBridge *)JSBridge.init()();
}

- (void).cxx_destruct
{
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore8JSBridge_initializationDate, &qword_1010A9820);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore8JSBridge____lazy_storage___bootSignpost, &qword_1010BA540);
  swift_release();
  swift_release();
  sub_100C66A70(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons), *(void **)&self->thread[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons], *(void **)&self->provider[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 8], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 16], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 24], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 32], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 40], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 48], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 56], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 64], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 72], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 80], *(void **)&self->singletons[OBJC_IVAR____TtC11MusicJSCore8JSBridge_singletons + 88]);
  swift_release();
  sub_100C64778(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11MusicJSCore8JSBridge_state), *(void *)&self->thread[OBJC_IVAR____TtC11MusicJSCore8JSBridge_state], *(void *)&self->provider[OBJC_IVAR____TtC11MusicJSCore8JSBridge_state]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end
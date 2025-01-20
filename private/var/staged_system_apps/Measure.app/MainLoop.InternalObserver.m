@interface MainLoop.InternalObserver
- (_TtCC7Measure8MainLoopP33_3089E251FF26A255EE4B430BFB36566C16InternalObserver)init;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)session:(id)a3 willRunWithConfiguration:(id)a4;
@end

@implementation MainLoop.InternalObserver

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_100102684(a4);
}

- (void)session:(id)a3 willRunWithConfiguration:(id)a4
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v11 = (id)Strong;
    id v8 = a3;
    id v9 = a4;
    v10 = self;
    sub_10010068C();
  }
}

- (_TtCC7Measure8MainLoopP33_3089E251FF26A255EE4B430BFB36566C16InternalObserver)init
{
  swift_unknownObjectWeakInit();
  uint64_t v3 = OBJC_IVAR____TtCC7Measure8MainLoopP33_3089E251FF26A255EE4B430BFB36566C16InternalObserver__resetEvent;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v5 = sub_100012894((uint64_t *)&unk_1004CB298);
  uint64_t v6 = qword_1004C2E30;
  v7 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_1004F8630;
  id v9 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 272);
  swift_retain();
  *(Class *)((char *)&v7->super.isa + v3) = (Class)v9(KeyPath, v8);

  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for MainLoop.InternalObserver();
  return [(MainLoop.InternalObserver *)&v11 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_release();
}

@end
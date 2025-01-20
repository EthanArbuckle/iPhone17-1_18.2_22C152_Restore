@interface UnifiedMessages.Coordinator
- (_TtCE5MusicO9MusicCore15UnifiedMessages11Coordinator)init;
- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6;
- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
@end

@implementation UnifiedMessages.Coordinator

- (_TtCE5MusicO9MusicCore15UnifiedMessages11Coordinator)init
{
  return (_TtCE5MusicO9MusicCore15UnifiedMessages11Coordinator *)sub_100195CEC();
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v9 = sub_100063814(&qword_10109BA40);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  uint64_t v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v11, 1, 1, v15);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = self;
  v16[5] = v12;
  v16[6] = v14;
  v16[7] = a4;
  id v17 = a4;
  v18 = self;
  id v19 = v17;
  id v20 = a3;
  swift_bridgeObjectRetain();
  sub_1000666FC((uint64_t)v11, (uint64_t)&unk_10109C448, (uint64_t)v16);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE5MusicO9MusicCore15UnifiedMessages11Coordinator_engagement));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE5MusicO9MusicCore15UnifiedMessages11Coordinator_userDefaults));
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtCE5MusicO9MusicCore15UnifiedMessages11Coordinator__inlineBubbleTipRequests;
  uint64_t v4 = sub_100063814((uint64_t *)&unk_10109C450);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end
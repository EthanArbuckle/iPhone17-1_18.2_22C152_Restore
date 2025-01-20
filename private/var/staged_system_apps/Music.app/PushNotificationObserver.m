@interface PushNotificationObserver
- (_TtC9MusicCore24PushNotificationObserver)init;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
@end

@implementation PushNotificationObserver

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  if (a4)
  {
    id v5 = a3;
    swift_retain();
    id v6 = a4;
    uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v9 = v8;

    sub_10007A5C4(v7, v9);
    swift_release();
  }
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  uint64_t v9 = sub_100063814(&qword_1010C0040);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v13;
    if (a5)
    {
LABEL_3:
      uint64_t v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v15 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v11, 1, 1, v15);
      v16 = (void *)swift_allocObject();
      v16[2] = 0;
      v16[3] = 0;
      v16[4] = self;
      v16[5] = v12;
      v16[6] = a4;
      v16[7] = v14;
      swift_bridgeObjectRetain();
      swift_retain_n();
      id v17 = a3;
      swift_bridgeObjectRetain();
      sub_100066A68((uint64_t)v11, (uint64_t)&unk_1010C2390, (uint64_t)v16);
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();

      return;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (a5) {
      goto LABEL_3;
    }
  }
  __break(1u);
}

- (_TtC9MusicCore24PushNotificationObserver)init
{
  swift_defaultActor_initialize();
  swift_retain();
  *(void *)self->registeredHandlers = sub_1008F6E44((uint64_t)_swiftEmptyArrayStorage);
  *(_OWORD *)self->connection = 0u;
  *(_OWORD *)&self->connection[16] = 0u;
  *(void *)&self->pushConfiguration[8] = 0;
  swift_release();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PushNotificationObserver();
  return [(PushNotificationObserver *)&v4 init];
}

@end
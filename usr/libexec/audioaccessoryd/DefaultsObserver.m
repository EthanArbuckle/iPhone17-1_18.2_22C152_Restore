@interface DefaultsObserver
- (_TtC15audioaccessoryd16DefaultsObserver)init;
- (_TtC15audioaccessoryd16DefaultsObserver)initWithKeys:(id)a3 defaults:(id)a4 notificationBlock:(id)a5;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)start;
- (void)stop;
@end

@implementation DefaultsObserver

- (_TtC15audioaccessoryd16DefaultsObserver)initWithKeys:(id)a3 defaults:(id)a4 notificationBlock:(id)a5
{
  v7 = _Block_copy(a5);
  v8 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = swift_allocObject();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd16DefaultsObserver_monitoredKeys) = v8;
  *(void *)(v9 + 16) = v7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioaccessoryd16DefaultsObserver_defaults) = (Class)a4;
  v10 = (void (**)())((char *)self + OBJC_IVAR____TtC15audioaccessoryd16DefaultsObserver_notify);
  *v10 = sub_1001398A0;
  v10[1] = (void (*)())v9;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for DefaultsObserver();
  id v11 = a4;
  return [(DefaultsObserver *)&v13 init];
}

- (void)dealloc
{
  v2 = self;
  DefaultsObserver.stop()();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for DefaultsObserver();
  [(DefaultsObserver *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)start
{
  v2 = self;
  DefaultsObserver.start()();
}

- (void)stop
{
  v2 = self;
  DefaultsObserver.stop()();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
    if (a4)
    {
LABEL_3:
      swift_unknownObjectRetain();
      id v12 = a5;
      objc_super v13 = self;
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
      if (a5) {
        goto LABEL_4;
      }
LABEL_8:
      if (v11) {
        goto LABEL_5;
      }
LABEL_9:

      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
  }
  memset(v17, 0, sizeof(v17));
  id v15 = a5;
  v16 = self;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_100139810();
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (!v11) {
    goto LABEL_9;
  }
LABEL_5:
  v14 = *(void (**)(uint64_t, uint64_t))((char *)&self->super.isa
                                                + OBJC_IVAR____TtC15audioaccessoryd16DefaultsObserver_notify);
  swift_retain();
  v14(v9, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
LABEL_10:
  sub_1000C1244((uint64_t)v17);
}

- (_TtC15audioaccessoryd16DefaultsObserver)init
{
  result = (_TtC15audioaccessoryd16DefaultsObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
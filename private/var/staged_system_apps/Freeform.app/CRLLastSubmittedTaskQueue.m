@interface CRLLastSubmittedTaskQueue
+ (_TtC8Freeform25CRLLastSubmittedTaskQueue)taskQueueWithQoSAsBackgroundWithLabel:(id)a3;
- (OS_dispatch_queue)queue;
- (_TtC8Freeform25CRLLastSubmittedTaskQueue)init;
- (_TtC8Freeform25CRLLastSubmittedTaskQueue)initWithLabel:(id)a3;
- (void)performAsync:(id)a3;
@end

@implementation CRLLastSubmittedTaskQueue

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC8Freeform25CRLLastSubmittedTaskQueue_queue));
}

- (_TtC8Freeform25CRLLastSubmittedTaskQueue)initWithLabel:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v4 - 8, v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  static DispatchQoS.userInitiated.getter();
  id v11 = objc_allocWithZone(ObjectType);
  v12 = (_TtC8Freeform25CRLLastSubmittedTaskQueue *)CRLLastSubmittedTaskQueue.init(label:qos:)(v8, v10, (uint64_t)v7);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v12;
}

- (void)performAsync:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_10077EAE0((uint64_t)sub_1005E2108, v5);

  swift_release();

  swift_release();
}

+ (_TtC8Freeform25CRLLastSubmittedTaskQueue)taskQueueWithQoSAsBackgroundWithLabel:(id)a3
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  uint64_t v4 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v4 - 8, v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  swift_bridgeObjectRetain();
  static DispatchQoS.background.getter();
  id v11 = objc_allocWithZone(ObjCClassMetadata);
  id v12 = CRLLastSubmittedTaskQueue.init(label:qos:)(v8, v10, (uint64_t)v7);
  swift_bridgeObjectRelease();

  return (_TtC8Freeform25CRLLastSubmittedTaskQueue *)v12;
}

- (_TtC8Freeform25CRLLastSubmittedTaskQueue)init
{
  result = (_TtC8Freeform25CRLLastSubmittedTaskQueue *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
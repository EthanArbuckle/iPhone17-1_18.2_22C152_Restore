@interface RDAccountPersonIDSaltObserver
+ (NSError)AccountAbsentError;
+ (NSError)InitiallyNilError;
+ (NSError)InvalidValueError;
+ (NSError)NilValueError;
- (NSString)description;
- (NSString)propertyName;
- (NSUUID)uuid;
- (OS_dispatch_queue)callbackQueue;
- (RDAccountPersonIDSaltObserver)init;
- (RDAccountPersonIDSaltObserver)initWithAccountObjectID:(id)a3 accountType:(int64_t)a4 initialSaltValue:(id)a5 callbackQueue:(id)a6 successHandler:(id)a7 errorHandler:(id)a8;
- (_TtP7remindd20ObservingAccountInfo_)account;
- (void)dealloc;
- (void)notify:(id)a3;
- (void)setPropertyName:(id)a3;
@end

@implementation RDAccountPersonIDSaltObserver

- (NSUUID)uuid
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (_TtP7remindd20ObservingAccountInfo_)account
{
  NSUUID v2 = (void *)swift_unknownObjectRetain();

  return (_TtP7remindd20ObservingAccountInfo_ *)v2;
}

- (OS_dispatch_queue)callbackQueue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR___RDAccountPersonIDSaltObserver_callbackQueue));
}

+ (NSError)InitiallyNilError
{
  return (NSError *)sub_1001D4C38((uint64_t)a1, (uint64_t)a2, &qword_100907920, (void **)&qword_100942590);
}

+ (NSError)NilValueError
{
  return (NSError *)sub_1001D4C38((uint64_t)a1, (uint64_t)a2, &qword_100907928, (void **)&qword_100942598);
}

+ (NSError)InvalidValueError
{
  return (NSError *)sub_1001D4C38((uint64_t)a1, (uint64_t)a2, &qword_100907930, (void **)&qword_1009425A0);
}

+ (NSError)AccountAbsentError
{
  return (NSError *)sub_1001D4C38((uint64_t)a1, (uint64_t)a2, &qword_100907938, (void **)&qword_1009425A8);
}

- (RDAccountPersonIDSaltObserver)initWithAccountObjectID:(id)a3 accountType:(int64_t)a4 initialSaltValue:(id)a5 callbackQueue:(id)a6 successHandler:(id)a7 errorHandler:(id)a8
{
  v13 = _Block_copy(a7);
  v14 = _Block_copy(a8);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  id v17 = a3;
  id v18 = a5;
  return (RDAccountPersonIDSaltObserver *)sub_10058D148(v17, (char *)a4, a5, a6, (uint64_t)sub_100243D7C, v15, sub_10058F150, v16);
}

- (NSString)propertyName
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setPropertyName:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___RDAccountPersonIDSaltObserver_propertyName);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (void)notify:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_10058E22C((uint64_t)v6);

  sub_1000966BC((uint64_t)v6, &qword_100908190);
}

- (NSString)description
{
  NSString v2 = self;
  sub_10058E528();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  char v6 = 1;
  uint64_t v4 = self;
  CurrentValueSubject.send(completion:)();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(RDAccountPersonIDSaltObserver *)&v5 dealloc];
}

- (void).cxx_destruct
{
  NSString v3 = (char *)self + OBJC_IVAR___RDAccountPersonIDSaltObserver_uuid;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (RDAccountPersonIDSaltObserver)init
{
  result = (RDAccountPersonIDSaltObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
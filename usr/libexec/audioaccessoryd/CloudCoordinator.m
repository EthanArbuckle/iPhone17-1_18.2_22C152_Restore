@interface CloudCoordinator
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isMemberOfClass:(Class)a3;
- (BOOL)isProxy;
- (BOOL)respondsToSelector:(SEL)a3;
- (Class)superclass;
- (NSString)cloudContainerIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (OS_dispatch_queue)pushDelegateQueue;
- (_TtC15audioaccessoryd16CloudCoordinator)self;
- (id)performSelector:(SEL)a3;
- (id)performSelector:(SEL)a3 withObject:(id)a4;
- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5;
- (int64_t)hash;
- (void)accountDidChange:(id)a3;
- (void)didReceiveWithMessage:(id)a3;
- (void)didReceiveWithPublicToken:(id)a3;
- (void)didReceiveWithToken:(id)a3 forTopic:(id)a4 identifier:(id)a5;
- (void)onIdentityUpdateNotification;
- (void)setPushDelegateQueue:(id)a3;
@end

@implementation CloudCoordinator

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    swift_retain();
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_1000C1244((uint64_t)v4);
  return 0;
}

- (int64_t)hash
{
  id v2 = [(id)swift_retain() cloudContainerIdentifier];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  int64_t v3 = String.hashValue.getter();
  swift_release();
  swift_bridgeObjectRelease();
  return v3;
}

- (Class)superclass
{
  uint64_t v2 = type metadata accessor for CloudCoordinator();

  return (Class)_swift_getObjCClassFromMetadata(v2);
}

- (_TtC15audioaccessoryd16CloudCoordinator)self
{
  uint64_t v2 = (void *)swift_retain();

  return (_TtC15audioaccessoryd16CloudCoordinator *)v2;
}

- (id)performSelector:(SEL)a3
{
  id v3 = [(id)swift_retain() cloudContainerIdentifier];
  swift_release();
  return v3;
}

- (id)performSelector:(SEL)a3 withObject:(id)a4
{
  if (a4)
  {
    swift_retain();
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
    swift_retain();
  }
  v5 = [(CloudCoordinator *)self cloudContainerIdentifier];
  swift_release();
  sub_1000C1244((uint64_t)&v7);
  return v5;
}

- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  if (!a4)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    swift_unknownObjectRetain();
    swift_retain();
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    long long v9 = 0u;
    long long v10 = 0u;
    goto LABEL_6;
  }
  swift_unknownObjectRetain();
  swift_retain();
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
LABEL_6:
  long long v7 = [(CloudCoordinator *)self cloudContainerIdentifier];
  swift_release();
  sub_1000C1244((uint64_t)&v9);
  sub_1000C1244((uint64_t)&v11);
  return v7;
}

- (BOOL)isProxy
{
  return 0;
}

- (BOOL)isKindOfClass:(Class)a3
{
  return 0;
}

- (BOOL)isMemberOfClass:(Class)a3
{
  return 0;
}

- (BOOL)conformsToProtocol:(id)a3
{
  return 0;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return 0;
}

- (NSString)description
{
  swift_retain();
  sub_100107E48();
  swift_release();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)debugDescription
{
  swift_retain();
  sub_100107E48();
  swift_release();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (OS_dispatch_queue)pushDelegateQueue
{
  swift_retain();
  NSString v2 = sub_1001080EC();
  swift_release();

  return (OS_dispatch_queue *)v2;
}

- (void)setPushDelegateQueue:(id)a3
{
  id v3 = *(void **)self->$__lazy_storage_$_pushDelegateQueue;
  *(void *)self->$__lazy_storage_$_pushDelegateQueue = a3;
  id v4 = a3;

  sub_100129F80(v3);
}

- (void)onIdentityUpdateNotification
{
  swift_retain();
  sub_10011463C();

  swift_release();
}

- (void)accountDidChange:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  sub_100116E64();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (NSString)cloudContainerIdentifier
{
  type metadata accessor for CloudCoordinatorConfiguration();
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)didReceiveWithPublicToken:(id)a3
{
  id v3 = a3;
  swift_retain();
  uint64_t v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;

  static os_log_type_t.default.getter();
  if (qword_100261938 != -1) {
    swift_once();
  }
  sub_1000AA024((uint64_t *)&unk_100262110);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1001CFDB0;
  uint64_t v8 = Data.hexString.getter(v4, v6);
  uint64_t v10 = v9;
  *(void *)(v7 + 56) = &type metadata for String;
  *(void *)(v7 + 64) = sub_1000AA5E0();
  *(void *)(v7 + 32) = v8;
  *(void *)(v7 + 40) = v10;
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();
  sub_1000AA8F0(v4, v6);

  swift_release();
}

- (void)didReceiveWithToken:(id)a3 forTopic:(id)a4 identifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  swift_retain();
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;

  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;

  sub_100129060(v10, v12, v13, v15, v16, v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000AA8F0(v10, v12);

  swift_release();
}

- (void)didReceiveWithMessage:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1001220D4(v3);

  swift_release();
}

@end
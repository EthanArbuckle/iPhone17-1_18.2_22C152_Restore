@interface GKLRUDequeNode
- (NSObject)key;
- (_TtC14GameDaemonCoreP33_99CD75528634227EFA44F2FA82BB26BA14GKLRUDequeNode)initWithKey:(id)a3 value:(id)a4;
- (id)value;
- (void)setValue:(id)a3;
@end

@implementation GKLRUDequeNode

- (NSObject)key
{
  v2.isa = AnyHashable._bridgeToObjectiveC()().isa;

  return v2.isa;
}

- (id)value
{
  value = self->value;
  swift_beginAccess();
  sub_1000074E0((uint64_t)value, (uint64_t)v5);
  sub_100165918(v5, v5[3]);
  v3 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_100016C38((uint64_t)v5);

  return v3;
}

- (void)setValue:(id)a3
{
  swift_unknownObjectRetain();
  swift_retain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  swift_beginAccess();
  sub_100016C38((uint64_t)self->value);
  sub_1000074D0(&v4, self->value);
  swift_endAccess();
  swift_release();
}

- (_TtC14GameDaemonCoreP33_99CD75528634227EFA44F2FA82BB26BA14GKLRUDequeNode)initWithKey:(id)a3 value:(id)a4
{
  static AnyHashable._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC14GameDaemonCoreP33_99CD75528634227EFA44F2FA82BB26BA14GKLRUDequeNode *)sub_10016459C((uint64_t)v6, &v5);
}

@end
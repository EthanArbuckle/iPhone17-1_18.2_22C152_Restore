@interface CRLUIPropertyNotifier
- (_TtC8Freeform21CRLUIPropertyNotifier)init;
- (_TtC8Freeform21CRLUIPropertyNotifier)initWithParent:(id)a3;
@end

@implementation CRLUIPropertyNotifier

- (_TtC8Freeform21CRLUIPropertyNotifier)initWithParent:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLUIPropertyNotifier_propertyStateUpdateCount) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v5 = OBJC_IVAR____TtC8Freeform21CRLUIPropertyNotifier_subscribers;
  *(Class *)((char *)&self->super.isa + v5) = (Class)sub_100A465E8(_swiftEmptyArrayStorage, &qword_1016890A0);
  swift_unknownObjectWeakAssign();
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(CRLUIPropertyNotifier *)&v7 init];
}

- (_TtC8Freeform21CRLUIPropertyNotifier)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLUIPropertyNotifier_propertyStateUpdateCount) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v3 = OBJC_IVAR____TtC8Freeform21CRLUIPropertyNotifier_subscribers;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_100A465E8(_swiftEmptyArrayStorage, &qword_1016890A0);

  result = (_TtC8Freeform21CRLUIPropertyNotifier *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

@end
@interface DOCNodeObserver
- (DOCNode)node;
- (_TtC5Files15DOCNodeObserver)init;
- (_TtC5Files15DOCNodeObserver)initWithObservedNode:(id)a3 source:(id)a4 enableDeepObserving:(BOOL)a5;
- (id)addDidFinishGatheringSubscriber:(id)a3;
- (id)addSubscriber:(id)a3;
- (void)dealloc;
- (void)removeSubscriber:(id)a3;
- (void)setNode:(id)a3;
@end

@implementation DOCNodeObserver

- (DOCNode)node
{
  v2 = (void *)swift_unknownObjectRetain();

  return (DOCNode *)v2;
}

- (void)setNode:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files15DOCNodeObserver_node) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (_TtC5Files15DOCNodeObserver)initWithObservedNode:(id)a3 source:(id)a4 enableDeepObserving:(BOOL)a5
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v9 = a4;

  return (_TtC5Files15DOCNodeObserver *)sub_10050E01C(a3, a4, a5, (char *)self);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_10019E3AC();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(DOCNodeObserver *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC5Files15DOCNodeObserver)init
{
  result = (_TtC5Files15DOCNodeObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)addSubscriber:(id)a3
{
  return sub_10050C6F8(self, (int)a2, a3, (uint64_t)&unk_1006B46E0, (uint64_t)sub_100292E70, (uint64_t (*)(uint64_t, uint64_t))sub_10050C218);
}

- (id)addDidFinishGatheringSubscriber:(id)a3
{
  return sub_10050C6F8(self, (int)a2, a3, (uint64_t)&unk_1006B46B8, (uint64_t)sub_10050E86C, (uint64_t (*)(uint64_t, uint64_t))sub_10050C0D4);
}

- (void)removeSubscriber:(id)a3
{
  swift_beginAccess();
  objc_super v5 = (_TtC5Files15DOCNodeObserver *)a3;
  v6 = self;
  unint64_t v7 = swift_bridgeObjectRetain();
  unint64_t v8 = sub_10050E2E4(v7, (uint64_t)v5);
  char v10 = v9;
  swift_bridgeObjectRelease();
  if ((v10 & 1) == 0)
  {
    swift_beginAccess();
    uint64_t v11 = sub_100050628(v8);
    swift_endAccess();

    objc_super v5 = v6;
    v6 = (_TtC5Files15DOCNodeObserver *)v11;
  }
}

@end
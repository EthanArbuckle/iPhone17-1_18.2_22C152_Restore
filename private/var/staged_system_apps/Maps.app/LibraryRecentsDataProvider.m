@interface LibraryRecentsDataProvider
- (NSArray)storeSubscriptionTypes;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
@end

@implementation LibraryRecentsDataProvider

- (NSArray)storeSubscriptionTypes
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1000FF33C(&qword_1015CD300);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  sub_1000FF33C(&qword_1015CD300);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_beginAccess();
  *(void *)self->storeSubscriptionTypes = v4;
  swift_retain();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)storeDidChangeWithTypes:(id)a3
{
  uint64_t v4 = *(void *)self->_TtCs12_SwiftObject_opaque;
  uint64_t v5 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = self;
  v9[5] = v4;
  swift_retain_n();
  sub_100042AF4((uint64_t)v7, (uint64_t)&unk_1015DA7B0, (uint64_t)v9);
  swift_release();
  swift_release();
}

@end
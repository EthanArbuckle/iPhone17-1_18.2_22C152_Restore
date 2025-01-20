@interface HomeListCompositionalLayout
- (_TtC4Maps27HomeListCompositionalLayout)initWithCoder:(id)a3;
- (_TtC4Maps27HomeListCompositionalLayout)initWithSection:(id)a3;
- (_TtC4Maps27HomeListCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4;
- (_TtC4Maps27HomeListCompositionalLayout)initWithSectionProvider:(id)a3;
- (_TtC4Maps27HomeListCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)finalLayoutAttributesForDisappearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
@end

@implementation HomeListCompositionalLayout

- (_TtC4Maps27HomeListCompositionalLayout)initWithSectionProvider:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  aBlock[4] = sub_1000805B4;
  aBlock[5] = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100080538;
  aBlock[3] = &unk_1012DA608;
  v6 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for HomeListCompositionalLayout();
  v7 = [(HomeListCompositionalLayout *)&v9 initWithSectionProvider:v6];
  swift_release();
  _Block_release(v6);
  return v7;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  id v9 = sub_100148CC8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v9;
}

- (id)finalLayoutAttributesForDisappearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = self;
  id v10 = sub_100148ECC();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v10;
}

- (_TtC4Maps27HomeListCompositionalLayout)initWithSection:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomeListCompositionalLayout();
  return [(HomeListCompositionalLayout *)&v5 initWithSection:a3];
}

- (_TtC4Maps27HomeListCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HomeListCompositionalLayout();
  return [(HomeListCompositionalLayout *)&v7 initWithSection:a3 configuration:a4];
}

- (_TtC4Maps27HomeListCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  uint64_t v6 = _Block_copy(a3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  aBlock[4] = sub_1000804F8;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100080538;
  aBlock[3] = &unk_1012DA5B8;
  v8 = _Block_copy(aBlock);
  id v9 = a4;
  swift_retain();
  swift_release();
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for HomeListCompositionalLayout();
  id v10 = [(HomeListCompositionalLayout *)&v12 initWithSectionProvider:v8 configuration:v9];
  swift_release();

  _Block_release(v8);
  return v10;
}

- (_TtC4Maps27HomeListCompositionalLayout)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomeListCompositionalLayout();
  return [(HomeListCompositionalLayout *)&v5 initWithCoder:a3];
}

@end
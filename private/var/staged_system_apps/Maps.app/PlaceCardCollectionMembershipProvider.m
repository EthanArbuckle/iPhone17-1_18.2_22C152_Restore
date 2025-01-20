@interface PlaceCardCollectionMembershipProvider
- (MKMapItem)mapItem;
- (NSArray)containingCollections;
- (_TtC4Maps37PlaceCardCollectionMembershipProvider)init;
- (_TtP4Maps45PlaceCardCollectionMembershipProviderDelegate_)delegate;
- (id)containingCollectionWithIdentifer:(id)a3;
- (void)collectionHandlerContentUpdated:(id)a3;
- (void)collectionManager:(id)a3 contentDidChange:(id)a4;
- (void)dealloc;
- (void)setContainingCollections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMapItem:(id)a3;
@end

@implementation PlaceCardCollectionMembershipProvider

- (MKMapItem)mapItem
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_mapItem);
  swift_beginAccess();
  return (MKMapItem *)*v2;
}

- (void)setMapItem:(id)a3
{
  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_mapItem);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  id v9 = [self sharedManager];
  id v10 = [v9 currentCollections];

  sub_100100830(0, (unint64_t *)&qword_1015D9240);
  unint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  sub_100257590(v11);
  swift_bridgeObjectRelease();
}

- (_TtP4Maps45PlaceCardCollectionMembershipProviderDelegate_)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP4Maps45PlaceCardCollectionMembershipProviderDelegate_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)containingCollections
{
  swift_beginAccess();
  sub_100100830(0, (unint64_t *)&qword_1015D9240);
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setContainingCollections:(id)a3
{
  sub_100100830(0, (unint64_t *)&qword_1015D9240);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_containingCollections);
  swift_beginAccess();
  uint64_t *v5 = v4;
  v6 = self;
  swift_bridgeObjectRelease();
  sub_100257D70();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = self;
  v5 = self;
  id v6 = [v4 sharedManager];
  [v6 removeObserver:v5];

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(PlaceCardCollectionMembershipProvider *)&v7 dealloc];
}

- (void).cxx_destruct
{
  sub_100123CE4((uint64_t)self + OBJC_IVAR____TtC4Maps37PlaceCardCollectionMembershipProvider_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC4Maps37PlaceCardCollectionMembershipProvider)init
{
  return (_TtC4Maps37PlaceCardCollectionMembershipProvider *)sub_10025828C();
}

- (id)containingCollectionWithIdentifer:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  swift_beginAccess();
  objc_super v7 = self;
  unint64_t v8 = swift_bridgeObjectRetain();
  id v9 = sub_100258954(v8, v4, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v9;
}

- (void)collectionManager:(id)a3 contentDidChange:(id)a4
{
  sub_100100830(0, (unint64_t *)&qword_1015D9240);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  unint64_t v8 = self;
  sub_100257590(v6);

  swift_bridgeObjectRelease();
}

- (void)collectionHandlerContentUpdated:(id)a3
{
  uint64_t v4 = (CollectionHandler *)a3;
  uint64_t v5 = self;
  PlaceCardCollectionMembershipProvider.collectionHandlerContentUpdated(_:)(v4);
}

@end
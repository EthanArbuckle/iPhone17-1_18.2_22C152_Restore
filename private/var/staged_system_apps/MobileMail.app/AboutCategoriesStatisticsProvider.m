@interface AboutCategoriesStatisticsProvider
- (_TtC10MobileMail33AboutCategoriesStatisticsProvider)init;
- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 changedItemIDs:(id)a4;
- (void)collection:(id)a3 deletedItemIDs:(id)a4;
- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5;
@end

@implementation AboutCategoriesStatisticsProvider

- (_TtC10MobileMail33AboutCategoriesStatisticsProvider)init
{
  return (_TtC10MobileMail33AboutCategoriesStatisticsProvider *)sub_100239B6C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail33AboutCategoriesStatisticsProvider_daemonInterface));
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  swift_unknownObjectRetain();
  id v6 = a4;
  swift_unknownObjectRetain();
  v7 = self;
  sub_10001C210(&qword_100692EA0);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100239D28();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  swift_unknownObjectRetain();
  id v6 = a4;
  swift_unknownObjectRetain();
  v7 = self;
  sub_10001C210(&qword_100692EA0);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100239D28();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
  swift_unknownObjectRetain();
  id v6 = a4;
  swift_unknownObjectRetain();
  v7 = self;
  sub_10001C210(&qword_100692EA0);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100239D28();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5
{
  swift_unknownObjectRetain();
  id v6 = a4;
  swift_unknownObjectRetain();
  v7 = self;
  sub_10001C210(&qword_100692EA0);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100239D28();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = a4;
  id v6 = self;
  sub_10001C210(&qword_100692EA0);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10023A004();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = a4;
  id v6 = self;
  sub_10001C210(&qword_100692EA0);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10023A004();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v6 = self;
  sub_100239D28();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
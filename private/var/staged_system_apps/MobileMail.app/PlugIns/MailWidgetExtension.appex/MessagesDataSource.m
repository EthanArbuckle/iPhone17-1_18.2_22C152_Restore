@interface MessagesDataSource
- (_TtC19MailWidgetExtension18MessagesDataSource)init;
- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 changedItemIDs:(id)a4;
- (void)collection:(id)a3 deletedItemIDs:(id)a4;
- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5;
- (void)collectionDidFinishInitialLoad:(id)a3;
@end

@implementation MessagesDataSource

- (_TtC19MailWidgetExtension18MessagesDataSource)init
{
  return (_TtC19MailWidgetExtension18MessagesDataSource *)sub_100058814();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19MailWidgetExtension18MessagesDataSource_messageRepository));
  sub_1000137A8((id *)((char *)&self->super.isa + OBJC_IVAR____TtC19MailWidgetExtension18MessagesDataSource_messageList));
  sub_10001F4C8();
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  swift_unknownObjectRetain();
  id v6 = a4;
  swift_unknownObjectRetain();
  v7 = self;
  sub_100009334(&qword_1000A42E0);
  uint64_t v8 = sub_10008A190();
  sub_100058B3C((uint64_t)a3, v8, (uint64_t)a5);
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
  sub_100009334(&qword_1000A42E0);
  uint64_t v8 = sub_10008A190();
  sub_10005A000((uint64_t)a3, v8, (uint64_t)a5);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_10005B08C(a3);

  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
  swift_unknownObjectRetain();
  id v6 = a4;
  swift_unknownObjectRetain();
  v7 = self;
  sub_100009334(&qword_1000A42E0);
  sub_10008A190();
  sub_10005C91C();
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
  sub_100009334(&qword_1000A42E0);
  sub_10008A190();
  sub_10005C91C();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = a4;
  id v6 = self;
  sub_100009334(&qword_1000A42E0);
  sub_10008A190();
  sub_10005CAA0();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = a4;
  id v6 = self;
  sub_100009334(&qword_1000A42E0);
  sub_10008A190();
  sub_10005CAA0();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v6 = self;
  sub_10005C91C();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
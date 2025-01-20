@interface MFMailboxFrecencyController
- (MFMailboxFrecencyController)init;
- (MFMailboxFrecencyController)initWithDatabase:(id)a3;
- (id)sortedArrayOfMailboxes:(id)a3;
- (id)sortedArrayOfMailboxesForAccount:(id)a3;
- (void)recordEventWithMailboxIDs:(id)a3;
- (void)testRecordFrecencyEventsForAllMailboxes;
- (void)testResetFrecencyForAllMailboxes;
- (void)test_tearDown;
@end

@implementation MFMailboxFrecencyController

- (void).cxx_destruct
{
}

- (MFMailboxFrecencyController)initWithDatabase:(id)a3
{
  swift_getObjectType();
  id v3 = a3;
  return (MFMailboxFrecencyController *)sub_1A8326EB4(a3);
}

- (id)sortedArrayOfMailboxes:(id)a3
{
  swift_getObjectType();
  id v4 = a3;
  v5 = self;
  sub_1A81DC0F0();
  uint64_t v7 = sub_1A8A76C68();
  sub_1A8327498(v7);
  swift_bridgeObjectRelease();

  v10 = (void *)sub_1A8A76C58();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)sortedArrayOfMailboxesForAccount:(id)a3
{
  swift_getObjectType();
  id v4 = a3;
  v5 = self;
  sub_1A83279E0(a3);

  sub_1A81DC0F0();
  id v9 = (id)sub_1A8A76C58();
  swift_bridgeObjectRelease();
  return v9;
}

- (void)recordEventWithMailboxIDs:(id)a3
{
  swift_getObjectType();
  id v4 = a3;
  v5 = self;
  sub_1A80C678C();
  uint64_t v6 = sub_1A8A76C68();
  sub_1A8327C34(v6);
  swift_bridgeObjectRelease();
}

- (void)testRecordFrecencyEventsForAllMailboxes
{
  swift_getObjectType();
  id v3 = self;
  sub_1A8328134();
}

- (void)testResetFrecencyForAllMailboxes
{
  swift_getObjectType();
  id v3 = self;
  sub_1A8328458();
}

- (void)test_tearDown
{
  swift_getObjectType();
  id v3 = self;
  sub_1A8328744();
}

- (MFMailboxFrecencyController)init
{
  return (MFMailboxFrecencyController *)MFMailboxFrecencyController.init()();
}

@end
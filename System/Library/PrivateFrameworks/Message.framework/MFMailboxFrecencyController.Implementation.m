@interface MFMailboxFrecencyController.Implementation
- (id)sortedArrayOfMailboxes:(id)a3;
- (id)sortedArrayOfMailboxesForAccount:(id)a3;
- (void)recordEventWithMailboxIDs:(id)a3;
@end

@implementation MFMailboxFrecencyController.Implementation

- (id)sortedArrayOfMailboxes:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1A81DC0F0();
  uint64_t v5 = sub_1A8A76C68();
  sub_1A8327530(v5);
  swift_bridgeObjectRelease();

  swift_release();
  v7 = (void *)sub_1A8A76C58();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)sortedArrayOfMailboxesForAccount:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1A83295B8(a3);
  swift_release();

  sub_1A81DC0F0();
  id v6 = (id)sub_1A8A76C58();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)recordEventWithMailboxIDs:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1A80C678C();
  uint64_t v4 = sub_1A8A76C68();
  sub_1A83297BC(v4);
  swift_bridgeObjectRelease();

  swift_release();
}

@end
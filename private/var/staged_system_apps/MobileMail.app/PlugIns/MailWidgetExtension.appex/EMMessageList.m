@interface EMMessageList
- (void)displayMessagesFromThreadsWithItemIDs:(id)a3 completion:(id)a4;
@end

@implementation EMMessageList

- (void)displayMessagesFromThreadsWithItemIDs:(id)a3 completion:(id)a4
{
  sub_100009334((uint64_t *)&unk_1000A35E0);
  id v5 = a3;
  v8 = _Block_copy(a4);
  v6 = self;
  sub_100009334(&qword_1000A42E0);
  uint64_t v10 = sub_10008A190();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  sub_1000157C0(v10, (uint64_t)sub_1000165E8, v9);
  swift_release();
  swift_bridgeObjectRelease();
}

@end
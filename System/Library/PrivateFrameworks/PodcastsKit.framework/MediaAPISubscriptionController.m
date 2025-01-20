@interface MediaAPISubscriptionController
- (void)subscribeToFeedUrl:(id)a3 completion:(id)a4;
- (void)subscribeToStoreId:(id)a3 completion:(id)a4;
- (void)subscribeToStoreId:(id)a3 siriContext:(id)a4 completion:(id)a5;
@end

@implementation MediaAPISubscriptionController

- (void)subscribeToStoreId:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = a3;
  swift_retain();
  sub_23F0B8668(v7, 0, (uint64_t)sub_23F0B97AC, v6);

  swift_release();
  swift_release();
}

- (void)subscribeToStoreId:(id)a3 siriContext:(id)a4 completion:(id)a5
{
  id v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  id v9 = a3;
  id v10 = a4;
  swift_retain();
  sub_23F0B8668(v9, (uint64_t)a4, (uint64_t)sub_23F0B965C, v8);

  swift_release();
  swift_release();
}

- (void)subscribeToFeedUrl:(id)a3 completion:(id)a4
{
  uint64_t v5 = sub_23F0BF470();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = _Block_copy(a4);
  sub_23F0BF450();
  id v10 = (void (*)(void *, uint64_t))v9[2];
  swift_retain();
  v10(v9, 4);
  _Block_release(v9);
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end
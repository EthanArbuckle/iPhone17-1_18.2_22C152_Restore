@interface MediaRemoteSubscriptionController
- (_TtC11PodcastsKit33MediaRemoteSubscriptionController)init;
- (void)subscribeToFeedUrl:(id)a3 completion:(id)a4;
- (void)subscribeToStoreId:(id)a3 completion:(id)a4;
- (void)subscribeToStoreId:(id)a3 siriContext:(id)a4 completion:(id)a5;
@end

@implementation MediaRemoteSubscriptionController

- (_TtC11PodcastsKit33MediaRemoteSubscriptionController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MediaRemoteSubscriptionController();
  return [(MediaRemoteSubscriptionController *)&v3 init];
}

- (void)subscribeToStoreId:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_23F0B43C8((uint64_t)v8, 0, (uint64_t)sub_23F0B4BB8, v7);

  swift_release();
}

- (void)subscribeToStoreId:(id)a3 siriContext:(id)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_23F0B43C8((uint64_t)v10, (char *)a4, (uint64_t)sub_23F0B4BB8, v9);

  swift_release();
}

- (void)subscribeToFeedUrl:(id)a3 completion:(id)a4
{
  uint64_t v6 = sub_23F0BF470();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = _Block_copy(a4);
  sub_23F0BF450();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = self;
  sub_23F0B478C((uint64_t)v9, (uint64_t)sub_23F0B41F8, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
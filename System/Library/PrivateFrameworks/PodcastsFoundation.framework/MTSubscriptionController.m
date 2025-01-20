@interface MTSubscriptionController
+ (MTSubscriptionController)sharedInstance;
+ (NSString)subscriptionControllerErrorDomain;
+ (int64_t)alreadySubscribedErrorCode;
- (MTSubscriptionController)init;
- (void)podcastExistsInStoreWithFeedUrl:(id)a3 completion:(id)a4;
- (void)subscribeToShowWithPodcastStoreId:(id)a3 account:(id)a4 completion:(id)a5;
@end

@implementation MTSubscriptionController

+ (MTSubscriptionController)sharedInstance
{
  if (qword_1E99EFE50 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E99F0B40;
  return (MTSubscriptionController *)v2;
}

+ (int64_t)alreadySubscribedErrorCode
{
  return -1001;
}

+ (NSString)subscriptionControllerErrorDomain
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

- (void)subscribeToShowWithPodcastStoreId:(id)a3 account:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_1ACE761B8();
  uint64_t v10 = v9;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v7;
  id v12 = a4;
  v13 = self;
  sub_1ACA3427C(v8, v10, a4, (uint64_t)sub_1ACA3A598, v11);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)podcastExistsInStoreWithFeedUrl:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_1ACE761B8();
  unint64_t v8 = v7;
  _Block_copy(v5);
  uint64_t v9 = self;
  sub_1ACA398B4(v6, v8, (uint64_t)v9, (void (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (MTSubscriptionController)init
{
  uint64_t v3 = OBJC_IVAR___MTSubscriptionController_requestController;
  id v4 = objc_allocWithZone((Class)type metadata accessor for MediaRequestController());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for SubscriptionController();
  return [(MTSubscriptionController *)&v7 init];
}

- (void).cxx_destruct
{
}

@end
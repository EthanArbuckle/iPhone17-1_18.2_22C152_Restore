@interface HomeKitManager
- (_TtC50SiriUserFeedbackLearningUniversalSuggestionsPlugin14HomeKitManager)init;
- (void)homeManagerDidUpdateHomes:(id)a3;
@end

@implementation HomeKitManager

- (_TtC50SiriUserFeedbackLearningUniversalSuggestionsPlugin14HomeKitManager)init
{
  *(void *)&self->homeManager[OBJC_IVAR____TtC50SiriUserFeedbackLearningUniversalSuggestionsPlugin14HomeKitManager_homeManagerDelegate] = 0;
  swift_unknownObjectWeakInit();
  id v3 = objc_allocWithZone((Class)HMHomeManagerConfiguration);
  v4 = self;
  id v5 = [v3 initWithOptions:34397 cachePolicy:0];
  v6 = (objc_class *)[objc_allocWithZone((Class)HMHomeManager) initWithConfiguration:v5];

  *(Class *)((char *)&v4->super.isa
           + OBJC_IVAR____TtC50SiriUserFeedbackLearningUniversalSuggestionsPlugin14HomeKitManager_homeManager) = v6;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for HomeKitManager();
  return [(HomeKitManager *)&v8 init];
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100044064();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC50SiriUserFeedbackLearningUniversalSuggestionsPlugin14HomeKitManager_homeManager));
  id v3 = (char *)self
     + OBJC_IVAR____TtC50SiriUserFeedbackLearningUniversalSuggestionsPlugin14HomeKitManager_homeManagerDelegate;
  sub_100044468((uint64_t)v3);
}

@end
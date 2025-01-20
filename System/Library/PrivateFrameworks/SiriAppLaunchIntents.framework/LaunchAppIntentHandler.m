@interface LaunchAppIntentHandler
- (_TtC20SiriAppLaunchIntents22LaunchAppIntentHandler)init;
- (void)confirmLaunchApp:(LaunchAppIntent *)a3 completion:(id)a4;
- (void)handleLaunchApp:(LaunchAppIntent *)a3 completion:(id)a4;
- (void)resolveApplicationForLaunchApp:(LaunchAppIntent *)a3 withCompletion:(id)a4;
@end

@implementation LaunchAppIntentHandler

- (_TtC20SiriAppLaunchIntents22LaunchAppIntentHandler)init
{
  return (_TtC20SiriAppLaunchIntents22LaunchAppIntentHandler *)LaunchAppIntentHandler.init()();
}

- (void)resolveApplicationForLaunchApp:(LaunchAppIntent *)a3 withCompletion:(id)a4
{
}

- (void)confirmLaunchApp:(LaunchAppIntent *)a3 completion:(id)a4
{
}

- (void)handleLaunchApp:(LaunchAppIntent *)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_appsSearcher);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_installedApps);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_carPlaySupportProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_offloadedAppInstaller);
  v3 = (char *)self + OBJC_IVAR____TtC20SiriAppLaunchIntents22LaunchAppIntentHandler_featureFlags;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end
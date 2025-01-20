@interface PrecipitationNotificationsManager
- (_TtC11WeatherCore33PrecipitationNotificationsManager)init;
@end

@implementation PrecipitationNotificationsManager

- (_TtC11WeatherCore33PrecipitationNotificationsManager)init
{
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherCore33PrecipitationNotificationsManager_policyHandler);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherCore33PrecipitationNotificationsManager_notificationContentFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherCore33PrecipitationNotificationsManager_notificationDeliveryScheduler);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherCore33PrecipitationNotificationsManager_notificationFetchScheduler);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherCore33PrecipitationNotificationsManager_notificationSubscriptionManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherCore33PrecipitationNotificationsManager_notificationConfigurationProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC11WeatherCore33PrecipitationNotificationsManager_notificationAuthorizationStatusProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherCore33PrecipitationNotificationsManager_locationManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherCore33PrecipitationNotificationsManager_locationComparator);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11WeatherCore33PrecipitationNotificationsManager_operationQueue));
  swift_release();
}

@end
@interface RemoteNotificationsProperties.Availability.ManagedConfigurationObserver
- (_TtCCC21UserNotificationsCore29RemoteNotificationsProperties12AvailabilityP33_4AD97FADDCB7378298ADDAABCB61570928ManagedConfigurationObserver)init;
- (void)profileConnectionDidReceiveDefaultsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4;
- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation RemoteNotificationsProperties.Availability.ManagedConfigurationObserver

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5 = a3;
  v6 = self;
  sub_260978060();
}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5 = a3;
  v6 = self;
  sub_260978060();
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5 = a3;
  v6 = self;
  sub_260978060();
}

- (void)profileConnectionDidReceiveDefaultsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5 = a3;
  v6 = self;
  sub_260978060();
}

- (_TtCCC21UserNotificationsCore29RemoteNotificationsProperties12AvailabilityP33_4AD97FADDCB7378298ADDAABCB61570928ManagedConfigurationObserver)init
{
  result = (_TtCCC21UserNotificationsCore29RemoteNotificationsProperties12AvailabilityP33_4AD97FADDCB7378298ADDAABCB61570928ManagedConfigurationObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
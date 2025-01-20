@interface AppsSettingsListViewModel
- (_TtC13InstalledApps25AppsSettingsListViewModel)init;
- (void)dealloc;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation AppsSettingsListViewModel

- (_TtC13InstalledApps25AppsSettingsListViewModel)init
{
  return (_TtC13InstalledApps25AppsSettingsListViewModel *)sub_1F564();
}

- (void)dealloc
{
  v2 = self;
  sub_202FC();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel____lazy_storage___hiddenAppsSettingsListViewModel));
  sub_8218((uint64_t)self + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_appendSettingsNavigationPath, &qword_3D520);
  sub_8218((uint64_t)self + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_clearSettingsNavigationPath, &qword_3D840);
  sub_9B0C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__currentSelection), *(void *)&self->appsSettingsListScrollToItemSubject[OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel__currentSelection]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel____lazy_storage___homeKitVisibilityArbitrator));
  swift_bridgeObjectRelease();
  sub_8218((uint64_t)self + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel_pendingURL, &qword_3D440);
  v3 = (char *)self + OBJC_IVAR____TtC13InstalledApps25AppsSettingsListViewModel___observationRegistrar;
  uint64_t v4 = sub_2EDC0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
}

@end
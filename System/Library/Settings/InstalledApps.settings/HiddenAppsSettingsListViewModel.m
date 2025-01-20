@interface HiddenAppsSettingsListViewModel
- (_TtC13InstalledApps31HiddenAppsSettingsListViewModel)init;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)dealloc;
@end

@implementation HiddenAppsSettingsListViewModel

- (_TtC13InstalledApps31HiddenAppsSettingsListViewModel)init
{
  return (_TtC13InstalledApps31HiddenAppsSettingsListViewModel *)sub_88C4();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13InstalledApps31HiddenAppsSettingsListViewModel_subscription);
  v5 = self;
  if (v4) {
    [v4 invalidate];
  }
  v6.receiver = self;
  v6.super_class = ObjectType;
  [(HiddenAppsSettingsListViewModel *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_9B0C(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC13InstalledApps31HiddenAppsSettingsListViewModel__currentSelection), *(void *)&self->_currentSelection[OBJC_IVAR____TtC13InstalledApps31HiddenAppsSettingsListViewModel__currentSelection]);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC13InstalledApps31HiddenAppsSettingsListViewModel___observationRegistrar;
  uint64_t v4 = sub_2EDC0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  uint64_t v5 = sub_5250(&qword_3D040);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectRetain();
  v8 = self;
  sub_2F650();
  uint64_t v9 = sub_2F670();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 0, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v8;
  v11 = v8;
  sub_93C0((uint64_t)v7, (uint64_t)&unk_3D050, (uint64_t)v10);
  swift_release();
  sub_97E4((uint64_t)v7);
  swift_unknownObjectRelease();
}

@end
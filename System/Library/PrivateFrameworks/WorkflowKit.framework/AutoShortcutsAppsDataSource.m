@interface AutoShortcutsAppsDataSource
- (_TtC11WorkflowKit27AutoShortcutsAppsDataSource)init;
- (void)appShortcutsChanged;
@end

@implementation AutoShortcutsAppsDataSource

- (void)appShortcutsChanged
{
  v2 = self;
  sub_1C817B568();
}

- (_TtC11WorkflowKit27AutoShortcutsAppsDataSource)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11WorkflowKit27AutoShortcutsAppsDataSource__autoShortcutApps;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6A2CE0);
  OUTLINED_FUNCTION_21_3();
  (*(void (**)(char *))(v4 + 8))(v3);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11WorkflowKit27AutoShortcutsAppsDataSource_appShortcutDataSource));
  swift_release();
  swift_bridgeObjectRelease();
}

@end
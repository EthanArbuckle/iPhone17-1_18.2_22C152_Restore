@interface NavigationAlertsOnlyOverrideSynchronizationTask
+ (int64_t)creationPreference;
- (_TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask)init;
- (_TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask)initWithPlatformController:(id)a3 userDefaults:(id)a4 audioPreferences:(id)a5;
- (void)applicationWillTerminate;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
@end

@implementation NavigationAlertsOnlyOverrideSynchronizationTask

- (_TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask)initWithPlatformController:(id)a3 userDefaults:(id)a4 audioPreferences:(id)a5
{
  return (_TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask *)sub_10005C188(a3, a4, a5);
}

+ (int64_t)creationPreference
{
  return 1;
}

- (void)dealloc
{
  v2 = self;
  sub_100146F88();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask_userDefaults));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask_audioPreferences));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask_initialGuidanceConfiguration);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = v11;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v18, 0, sizeof(v18));
    id v16 = a5;
    v17 = self;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  v12 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v13 = a5;
  v14 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_100148C30();
  v15 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

LABEL_8:
  sub_10014744C(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1001189D4((uint64_t)v18);
}

- (void)applicationWillTerminate
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v4 = (void *)Strong;
    v6 = self;
    id v5 = [v4 currentNavigationSession];

    if (v5)
    {

      sub_100147EA0();
    }
  }
}

- (_TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask)init
{
  result = (_TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  if (a5 && (self, (uint64_t v7 = swift_dynamicCastObjCClass()) != 0))
  {
    v8 = (void *)v7;
    id v9 = a3;
    swift_unknownObjectRetain();
    uint64_t v10 = self;
    swift_unknownObjectRetain();
    sub_100148360(v8);
  }
  else
  {
    if (!a4) {
      return;
    }
    self;
    if (!swift_dynamicCastObjCClass()) {
      return;
    }
    id v11 = a3;
    swift_unknownObjectRetain();
    v12 = self;
    swift_unknownObjectRetain();
    sub_100147EA0();
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
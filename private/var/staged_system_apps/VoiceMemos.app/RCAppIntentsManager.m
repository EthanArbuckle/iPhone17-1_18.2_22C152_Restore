@interface RCAppIntentsManager
+ (uint64_t)registerDependencies;
+ (void)setupIntentSceneConfiguratorWithWindowScene:(id)a3;
- (_TtC10VoiceMemos19RCAppIntentsManager)init;
@end

@implementation RCAppIntentsManager

+ (void)setupIntentSceneConfiguratorWithWindowScene:(id)a3
{
  type metadata accessor for AppManager();
  sub_100035058();
  id v4 = a3;
  static AppManager.sceneConfigurator.setter();
}

+ (uint64_t)registerDependencies
{
  type metadata accessor for AppDependencyManager();
  static AppDependencyManager.shared.getter();
  AnyHashable.init<A>(_:)();
  AppDependencyManager.add<A>(key:dependency:)();
  sub_100013030((uint64_t)v1);
  AnyHashable.init<A>(_:)();
  sub_100028654(&qword_100267F98);
  AppDependencyManager.add<A>(key:dependency:)();
  sub_100013030((uint64_t)v1);
  AnyHashable.init<A>(_:)();
  sub_100028654(&qword_100267FA8);
  AppDependencyManager.add<A>(key:dependency:)();
  swift_release();
  return sub_100013030((uint64_t)v1);
}

- (_TtC10VoiceMemos19RCAppIntentsManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RCAppIntentsManager();
  return [(RCAppIntentsManager *)&v3 init];
}

@end
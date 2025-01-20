@interface ICRecentlyDeletedMathNotesActivity
- (ICRecentlyDeletedMathNotesActivity)init;
- (ICRecentlyDeletedMathNotesActivity)initWithPerformActivity:(id)a3;
- (ICRecentlyDeletedMathNotesActivity)initWithViewControllerManager:(id)a3;
- (ICViewControllerManager)viewControllerManager;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (id)menuWithCompletion:(id)a3;
- (void)performActivityWithCompletion:(id)a3;
- (void)setViewControllerManager:(id)a3;
@end

@implementation ICRecentlyDeletedMathNotesActivity

- (ICRecentlyDeletedMathNotesActivity)initWithViewControllerManager:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(ICRecentlyDeletedMathNotesActivity *)&v6 init];
}

- (ICViewControllerManager)viewControllerManager
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (ICViewControllerManager *)Strong;
}

- (void)setViewControllerManager:(id)a3
{
}

- (NSString)activityTitle
{
  v3 = self;
  v4 = self;
  id v5 = [v3 mainBundle];
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [v5 localizedStringForKey:v6 value:0 table:0];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

- (UIImage)activityImage
{
  v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [self systemImageNamed:v3];

  return (UIImage *)v4;
}

- (NSString)activityType
{
  v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();

  return (NSString *)v3;
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    id v5 = (void (*)(uint64_t, uint64_t, uint64_t))sub_1002A5318;
  }
  else
  {
    id v5 = 0;
  }
  NSString v6 = self;
  sub_100494060(v5);
  sub_10002E70C((uint64_t)v5);
}

- (id)menuWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    id v7 = sub_100262970;
  }
  else
  {
    id v7 = 0;
    uint64_t v6 = 0;
  }
  NSString v8 = self;
  id v9 = sub_100493C74(v7, v6);
  sub_10002E70C((uint64_t)v7);

  return v9;
}

- (ICRecentlyDeletedMathNotesActivity)initWithPerformActivity:(id)a3
{
  _Block_copy(a3);
  result = (ICRecentlyDeletedMathNotesActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (ICRecentlyDeletedMathNotesActivity)init
{
  result = (ICRecentlyDeletedMathNotesActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
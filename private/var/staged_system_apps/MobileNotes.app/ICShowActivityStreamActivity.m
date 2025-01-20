@interface ICShowActivityStreamActivity
- (ICCloudSyncingObject)object;
- (ICShowActivityStreamActivity)init;
- (ICShowActivityStreamActivity)initWithObject:(id)a3;
- (ICShowActivityStreamActivity)initWithPerformActivity:(id)a3;
- (ICViewControllerManager)viewControllerManager;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (void)performActivityWithCompletion:(id)a3;
- (void)setViewControllerManager:(id)a3;
@end

@implementation ICShowActivityStreamActivity

- (ICCloudSyncingObject)object
{
  return (ICCloudSyncingObject *)*(id *)&self->ICActivity_opaque[OBJC_IVAR___ICShowActivityStreamActivity_object];
}

- (ICShowActivityStreamActivity)initWithObject:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *(void *)&self->ICActivity_opaque[OBJC_IVAR___ICShowActivityStreamActivity_object] = a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(ICShowActivityStreamActivity *)&v8 init];
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
  v2 = self;
  sub_1003DDC34();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
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
    NSString v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = (void (*)(uint64_t, uint64_t, uint64_t))sub_100262970;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  objc_super v8 = self;
  sub_1003DDF58(v7, v6);
  sub_10002E70C((uint64_t)v7);
}

- (ICShowActivityStreamActivity)initWithPerformActivity:(id)a3
{
  _Block_copy(a3);
  result = (ICShowActivityStreamActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (ICShowActivityStreamActivity)init
{
  result = (ICShowActivityStreamActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
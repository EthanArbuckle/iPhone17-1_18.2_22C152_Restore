@interface ICEditSmartFolderActivity
- (ICEditSmartFolderActivity)init;
- (ICEditSmartFolderActivity)initWithPerformActivity:(id)a3;
- (ICEditSmartFolderActivity)initWithSmartFolder:(id)a3 presentingViewController:(id)a4;
- (ICFolder)smartFolder;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (UIViewController)presentingViewController;
- (void)performActivityWithCompletion:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICEditSmartFolderActivity

- (UIViewController)presentingViewController
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIViewController *)Strong;
}

- (void)setPresentingViewController:(id)a3
{
}

- (ICFolder)smartFolder
{
  return (ICFolder *)*(id *)&self->ICActivity_opaque[OBJC_IVAR___ICEditSmartFolderActivity_smartFolder];
}

- (ICEditSmartFolderActivity)initWithSmartFolder:(id)a3 presentingViewController:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *(void *)&self->ICActivity_opaque[OBJC_IVAR___ICEditSmartFolderActivity_smartFolder] = a3;
  swift_unknownObjectWeakAssign();
  v9.receiver = self;
  v9.super_class = ObjectType;
  id v7 = a3;
  return [(ICEditSmartFolderActivity *)&v9 init];
}

- (UIImage)activityImage
{
  v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [self systemImageNamed:v3];

  return (UIImage *)v4;
}

- (NSString)activityTitle
{
  sub_1004969B8();
  if (v2)
  {
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)activityType
{
  uint64_t v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();

  return (NSString *)v3;
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    v5 = sub_100496C78;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  sub_100496A94();
  sub_10002E70C((uint64_t)v5);
}

- (ICEditSmartFolderActivity)initWithPerformActivity:(id)a3
{
  _Block_copy(a3);
  result = (ICEditSmartFolderActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (ICEditSmartFolderActivity)init
{
  result = (ICEditSmartFolderActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  NSString v3 = *(void **)&self->ICActivity_opaque[OBJC_IVAR___ICEditSmartFolderActivity_smartFolder];
}

@end
@interface TTRITemplateSharingRouter.CopyiCloudLinkActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (_TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C822CopyiCloudLinkActivity)init;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation TTRITemplateSharingRouter.CopyiCloudLinkActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (NSString)activityType
{
  uint64_t v2 = qword_100785378;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  v4 = (NSString *)(id)qword_1007936E8;

  return v4;
}

- (NSString)activityTitle
{
  static TTRLocalizableStrings.Templates.copyIcloudLink.getter();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (UIImage)activityImage
{
  sub_1000368FC(0, (unint64_t *)&unk_10078AC70);
  v3 = self;
  v4 = (void *)static UIImage.ttr_systemSymbolImage(named:)();

  return (UIImage *)v4;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  BOOL v6 = sub_10025286C(v4);

  swift_bridgeObjectRelease();
  return v6;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_100251F28(v4);

  swift_bridgeObjectRelease();
}

- (void)performActivity
{
  NSString v2 = self;
  sub_1002520EC();
}

- (_TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C822CopyiCloudLinkActivity)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = (char *)self
     + OBJC_IVAR____TtCC9Reminders25TTRITemplateSharingRouterP33_B88B83D8B282D69A84EFFB48896895C822CopyiCloudLinkActivity_urlToBeCopiedToPasteboard;
  uint64_t v5 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(TTRITemplateSharingRouter.CopyiCloudLinkActivity *)&v7 init];
}

- (void).cxx_destruct
{
}

@end
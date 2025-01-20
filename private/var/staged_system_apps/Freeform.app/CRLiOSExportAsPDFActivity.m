@interface CRLiOSExportAsPDFActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (_TtC8Freeform25CRLiOSExportAsPDFActivity)init;
- (void)performActivity;
@end

@implementation CRLiOSExportAsPDFActivity

- (NSString)activityType
{
  uint64_t v2 = qword_10166F330;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  v4 = (NSString *)(id)qword_101684090;

  return v4;
}

- (NSString)activityTitle
{
  v3 = self;
  v4 = self;
  id v5 = [v3 mainBundle];
  NSString v6 = String._bridgeToObjectiveC()();
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [v5 localizedStringForKey:v6 value:v7 table:0];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v9;
}

- (UIImage)activityImage
{
  return (UIImage *)0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  uint64_t v2 = self;
  sub_100864ABC();
}

+ (int64_t)activityCategory
{
  return 0;
}

- (_TtC8Freeform25CRLiOSExportAsPDFActivity)init
{
  result = (_TtC8Freeform25CRLiOSExportAsPDFActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform25CRLiOSExportAsPDFActivity_sourceView);
}

@end
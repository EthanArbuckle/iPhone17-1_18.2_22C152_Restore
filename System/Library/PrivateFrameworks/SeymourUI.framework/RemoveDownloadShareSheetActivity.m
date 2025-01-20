@interface RemoveDownloadShareSheetActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (_TtC9SeymourUI32RemoveDownloadShareSheetActivity)init;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation RemoveDownloadShareSheetActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (NSString)activityType
{
  uint64_t v2 = qword_268A0CCE8;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  v4 = (NSString *)(id)qword_268A47F80;

  return v4;
}

- (NSString)activityTitle
{
  type metadata accessor for SeymourLocalizationBundle();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_23A7F6298();

  v7 = (void *)sub_23A7FF948();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (UIImage)activityImage
{
  uint64_t v2 = self;
  v3 = (void *)sub_23A7FF948();
  id v4 = objc_msgSend(self, sel_systemImageNamed_, v3);

  return (UIImage *)v4;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v4 = sub_23A7FFC78();
  v5 = self;
  char v6 = sub_239CAF5E4(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v4 = sub_23A7FFC78();
  v5 = self;
  sub_23A70ECEC(v4);

  swift_bridgeObjectRelease();
}

- (void)performActivity
{
  uint64_t v2 = self;
  sub_23A70EE34();
}

- (_TtC9SeymourUI32RemoveDownloadShareSheetActivity)init
{
  result = (_TtC9SeymourUI32RemoveDownloadShareSheetActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI32RemoveDownloadShareSheetActivity_assetClient);

  swift_bridgeObjectRelease();
}

@end
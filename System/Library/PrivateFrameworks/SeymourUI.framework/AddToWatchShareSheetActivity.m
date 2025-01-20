@interface AddToWatchShareSheetActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (_TtC9SeymourUI28AddToWatchShareSheetActivity)init;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation AddToWatchShareSheetActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (NSString)activityType
{
  uint64_t v2 = qword_268A0CCC8;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  v4 = (NSString *)(id)qword_268A47F60;

  return v4;
}

- (NSString)activityTitle
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC9SeymourUI28AddToWatchShareSheetActivity_storefrontLocalizer), *(uint64_t *)((char *)&self->super._activitySettingsImageLoader+ OBJC_IVAR____TtC9SeymourUI28AddToWatchShareSheetActivity_storefrontLocalizer));
  v3 = self;
  sub_23A7FC228();

  v4 = (void *)sub_23A7FF948();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (UIImage)activityImage
{
  uint64_t v2 = self;
  v3 = (void *)sub_23A7FF948();
  id v4 = objc_msgSend(self, sel_smm_systemImageNamed_, v3);

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
  sub_239CAF128(v4);

  swift_bridgeObjectRelease();
}

- (void)performActivity
{
  uint64_t v2 = self;
  sub_239CAF270();
}

- (_TtC9SeymourUI28AddToWatchShareSheetActivity)init
{
  result = (_TtC9SeymourUI28AddToWatchShareSheetActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28AddToWatchShareSheetActivity_assetClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28AddToWatchShareSheetActivity_storefrontLocalizer);

  swift_bridgeObjectRelease();
}

@end
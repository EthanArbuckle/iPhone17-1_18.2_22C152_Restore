@interface RemoveFromWatchShareSheetActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (_TtC9SeymourUI33RemoveFromWatchShareSheetActivity)init;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation RemoveFromWatchShareSheetActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (NSString)activityType
{
  uint64_t v2 = qword_268A0CCF0;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  v4 = (NSString *)(id)qword_268A47F88;

  return v4;
}

- (NSString)activityTitle
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC9SeymourUI33RemoveFromWatchShareSheetActivity_storefrontLocalizer), *(uint64_t *)((char *)&self->super._activitySettingsImageLoader+ OBJC_IVAR____TtC9SeymourUI33RemoveFromWatchShareSheetActivity_storefrontLocalizer));
  v3 = self;
  sub_23A7FC228();

  v4 = (void *)sub_23A7FF948();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (UIImage)activityImage
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_configurationWithScale_, 3);
  v6 = (void *)sub_23A7FF948();
  v7 = (_TtC9SeymourUI33RemoveFromWatchShareSheetActivity *)objc_msgSend(self, sel_systemImageNamed_, v6);

  if (v7)
  {
    id v8 = [(RemoveFromWatchShareSheetActivity *)v7 imageWithConfiguration:v5];

    v4 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return (UIImage *)v8;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v4 = sub_23A7FFC78();
  id v5 = self;
  char v6 = sub_239CAF5E4(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v4 = sub_23A7FFC78();
  id v5 = self;
  sub_23A34B4C8(v4);

  swift_bridgeObjectRelease();
}

- (void)performActivity
{
  uint64_t v2 = self;
  sub_23A34B610();
}

- (_TtC9SeymourUI33RemoveFromWatchShareSheetActivity)init
{
  result = (_TtC9SeymourUI33RemoveFromWatchShareSheetActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33RemoveFromWatchShareSheetActivity_assetClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33RemoveFromWatchShareSheetActivity_storefrontLocalizer);

  swift_bridgeObjectRelease();
}

@end
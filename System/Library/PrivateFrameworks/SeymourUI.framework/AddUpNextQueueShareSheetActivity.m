@interface AddUpNextQueueShareSheetActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (_TtC9SeymourUI32AddUpNextQueueShareSheetActivity)init;
- (void)performActivity;
@end

@implementation AddUpNextQueueShareSheetActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (NSString)activityType
{
  uint64_t v2 = qword_268A0CCD0;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  v4 = (NSString *)(id)qword_268A47F68;

  return v4;
}

- (NSString)activityTitle
{
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_23A7FF948();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
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
  char v6 = sub_23A6CB2F0(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)performActivity
{
  uint64_t v2 = self;
  sub_23A6C87B8();
}

- (_TtC9SeymourUI32AddUpNextQueueShareSheetActivity)init
{
  result = (_TtC9SeymourUI32AddUpNextQueueShareSheetActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI32AddUpNextQueueShareSheetActivity_upNextQueueClient);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI32AddUpNextQueueShareSheetActivity_workoutDetail;
  uint64_t v4 = sub_23A7F92C8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end
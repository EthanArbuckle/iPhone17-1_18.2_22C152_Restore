@interface RemoveUpNextQueueShareSheetActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (_TtC9SeymourUI35RemoveUpNextQueueShareSheetActivity)init;
- (void)performActivity;
@end

@implementation RemoveUpNextQueueShareSheetActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (NSString)activityType
{
  uint64_t v2 = qword_268A0CCF8;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  v4 = (NSString *)(id)qword_268A47F90;

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
  sub_23A7A04EC();
}

- (_TtC9SeymourUI35RemoveUpNextQueueShareSheetActivity)init
{
  result = (_TtC9SeymourUI35RemoveUpNextQueueShareSheetActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI35RemoveUpNextQueueShareSheetActivity_upNextQueueClient);

  swift_bridgeObjectRelease();
}

@end
@interface ContextActionActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (_TtC8Podcasts21ContextActionActivity)init;
- (id)_systemImageName;
- (void)performActivity;
@end

@implementation ContextActionActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (NSString)activityType
{
  v2 = self;
  v3 = (void *)sub_1001F2BDC();

  return (NSString *)v3;
}

- (NSString)activityTitle
{
  uint64_t v3 = *(void *)&self->contextActionItem[OBJC_IVAR____TtC8Podcasts21ContextActionActivity_contextActionItem];
  uint64_t ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);

  swift_unknownObjectRelease();
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (UIImage)activityImage
{
  uint64_t v3 = *(void *)&self->contextActionItem[OBJC_IVAR____TtC8Podcasts21ContextActionActivity_contextActionItem];
  uint64_t ObjectType = swift_getObjectType();
  v5 = self;
  swift_unknownObjectRetain();
  id v6 = sub_1002672F0(ObjectType, v3);

  swift_unknownObjectRelease();

  return (UIImage *)v6;
}

- (id)_systemImageName
{
  uint64_t v3 = *(void *)&self->contextActionItem[OBJC_IVAR____TtC8Podcasts21ContextActionActivity_contextActionItem];
  uint64_t ObjectType = swift_getObjectType();
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 32);
  id v6 = self;
  swift_unknownObjectRetain();
  v5(ObjectType, v3);
  uint64_t v8 = v7;

  swift_unknownObjectRelease();
  if (v8)
  {
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }

  return v9;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC8Podcasts21ContextActionActivity_performHandler);
  v4 = self;
  uint64_t v3 = swift_retain();
  v2(v3);
  swift_release();
  [(ContextActionActivity *)v4 activityDidFinish:1];
}

- (_TtC8Podcasts21ContextActionActivity)init
{
  result = (_TtC8Podcasts21ContextActionActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_release();
}

@end
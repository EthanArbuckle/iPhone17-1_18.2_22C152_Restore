@interface ShareModelStoryActivity
+ (int64_t)activityCategory;
- (BOOL)_managesOwnPresentation;
- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (_TtC5Music23ShareModelStoryActivity)init;
- (id)_bundleIdentifierForActivityImageCreation;
@end

@implementation ShareModelStoryActivity

+ (int64_t)activityCategory
{
  return 1;
}

- (NSString)activityType
{
  v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();

  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)activityTitle
{
  sub_1003C95E8();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (id)_bundleIdentifierForActivityImageCreation
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v2;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  NSString v3 = self;
  char v4 = sub_1004C0254();

  return v4 & 1;
}

- (BOOL)_managesOwnPresentation
{
  return 1;
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  if (v7)
  {
    *(void *)(swift_allocObject() + 16) = v7;
    v7 = sub_100224CC4;
  }
  id v8 = a3;
  v9 = self;
  char v10 = sub_1004C0398();
  sub_10006ADFC((uint64_t)v7);

  return v10 & 1;
}

- (_TtC5Music23ShareModelStoryActivity)init
{
  result = (_TtC5Music23ShareModelStoryActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music23ShareModelStoryActivity_musicItem, (uint64_t *)&unk_10109BFE0);
  swift_bridgeObjectRelease();

  sub_1000E0890((uint64_t)self + OBJC_IVAR____TtC5Music23ShareModelStoryActivity_presentationSource);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music23ShareModelStoryActivity_metricsReporter, &qword_1010ABB58);
}

@end
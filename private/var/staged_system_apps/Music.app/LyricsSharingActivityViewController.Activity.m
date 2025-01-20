@interface LyricsSharingActivityViewController.Activity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (_TtCC5Music35LyricsSharingActivityViewController8Activity)init;
- (void)performActivity;
@end

@implementation LyricsSharingActivityViewController.Activity

- (NSString)activityTitle
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)activityType
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtCC5Music35LyricsSharingActivityViewController8Activity__activityType));
}

- (UIImage)activityImage
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                            + OBJC_IVAR____TtCC5Music35LyricsSharingActivityViewController8Activity_image));
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  NSString v2 = *(void (**)(uint64_t))((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtCC5Music35LyricsSharingActivityViewController8Activity_performBlock);
  v4 = self;
  uint64_t v3 = swift_retain();
  v2(v3);
  swift_release();
  [(LyricsSharingActivityViewController.Activity *)v4 activityDidFinish:1];
}

- (_TtCC5Music35LyricsSharingActivityViewController8Activity)init
{
  result = (_TtCC5Music35LyricsSharingActivityViewController8Activity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC5Music35LyricsSharingActivityViewController8Activity_image));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC5Music35LyricsSharingActivityViewController8Activity__activityType));

  swift_release();
}

@end
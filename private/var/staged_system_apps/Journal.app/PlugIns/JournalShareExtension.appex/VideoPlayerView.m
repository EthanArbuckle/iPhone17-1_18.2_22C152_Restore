@interface VideoPlayerView
+ (Class)layerClass;
- (CGRect)bounds;
- (CGRect)frame;
- (_TtC21JournalShareExtensionP33_44A2318C1FD87471E26356171ABDC08C15VideoPlayerView)initWithCoder:(id)a3;
- (_TtC21JournalShareExtensionP33_44A2318C1FD87471E26356171ABDC08C15VideoPlayerView)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation VideoPlayerView

+ (Class)layerClass
{
  sub_10001CB98(0, &qword_10015A008);

  return (Class)swift_getObjCClassFromMetadata();
}

- (CGRect)bounds
{
  sub_100023E08(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for VideoPlayerView, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (CGRect)frame
{
  sub_100023E08(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for VideoPlayerView, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
}

- (_TtC21JournalShareExtensionP33_44A2318C1FD87471E26356171ABDC08C15VideoPlayerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for VideoPlayerView();
  return -[VideoPlayerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC21JournalShareExtensionP33_44A2318C1FD87471E26356171ABDC08C15VideoPlayerView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VideoPlayerView();
  return [(VideoPlayerView *)&v5 initWithCoder:a3];
}

@end
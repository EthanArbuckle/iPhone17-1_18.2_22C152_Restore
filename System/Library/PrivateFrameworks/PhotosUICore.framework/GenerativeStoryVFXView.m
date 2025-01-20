@interface GenerativeStoryVFXView
- (_TtC12PhotosUICore22GenerativeStoryVFXView)initWithCoder:(id)a3;
- (_TtC12PhotosUICore22GenerativeStoryVFXView)initWithFrame:(CGRect)a3;
- (_TtC12PhotosUICore22GenerativeStoryVFXView)initWithFrame:(CGRect)a3 options:(id)a4;
@end

@implementation GenerativeStoryVFXView

- (_TtC12PhotosUICore22GenerativeStoryVFXView)initWithCoder:(id)a3
{
  return (_TtC12PhotosUICore22GenerativeStoryVFXView *)sub_1A9DAC238(a3);
}

- (_TtC12PhotosUICore22GenerativeStoryVFXView)initWithFrame:(CGRect)a3 options:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4) {
    uint64_t v8 = sub_1AB23A4DC();
  }
  else {
    uint64_t v8 = 0;
  }
  return (_TtC12PhotosUICore22GenerativeStoryVFXView *)sub_1A9DAC38C(v8, x, y, width, height);
}

- (_TtC12PhotosUICore22GenerativeStoryVFXView)initWithFrame:(CGRect)a3
{
  result = (_TtC12PhotosUICore22GenerativeStoryVFXView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC12PhotosUICore22GenerativeStoryVFXView_logger;
  uint64_t v3 = sub_1AB23576C();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_release();
}

@end
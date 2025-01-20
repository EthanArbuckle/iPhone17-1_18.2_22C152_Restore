@interface MediaAssetView
- (CGRect)bounds;
- (CGRect)frame;
- (_TtC7Journal14MediaAssetView)initWithCoder:(id)a3;
- (_TtC7Journal14MediaAssetView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation MediaAssetView

- (_TtC7Journal14MediaAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal14MediaAssetView *)sub_1001EC3D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal14MediaAssetView)initWithCoder:(id)a3
{
  return (_TtC7Journal14MediaAssetView *)sub_1001EC550(a3);
}

- (CGRect)frame
{
  sub_1001ECEAC(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
}

- (CGRect)bounds
{
  sub_1001ECEAC(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (void)dealloc
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC7Journal14MediaAssetView_playbackStateObserver);
  if (v3)
  {
    double v4 = self;
    double v5 = self;
    swift_unknownObjectRetain();
    id v6 = [v4 defaultCenter];
    [v6 removeObserver:v3];
    swift_unknownObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MediaAssetView();
  [(MediaAssetView *)&v8 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal14MediaAssetView_assetImageView));
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal14MediaAssetView_delegate);
  swift_unknownObjectRelease();

  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal14MediaAssetView_latestImageRequestID, &qword_100800950);
}

@end
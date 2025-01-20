@interface PhotoAssetView
- (CGRect)bounds;
- (CGRect)frame;
- (_TtC7Journal14PhotoAssetView)initWithCoder:(id)a3;
- (_TtC7Journal14PhotoAssetView)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation PhotoAssetView

- (_TtC7Journal14PhotoAssetView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC7Journal14PhotoAssetView_assetImageView;
  id v9 = objc_allocWithZone((Class)UIImageView);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)[v9 init];
  *(Class *)((char *)&v10->super.super.super.super.isa + OBJC_IVAR____TtC7Journal14PhotoAssetView_photoAsset) = 0;
  v11 = (char *)v10 + OBJC_IVAR____TtC7Journal14PhotoAssetView_latestImageRequestID;
  uint64_t v12 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);

  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for PhotoAssetView();
  v13 = -[JournalAssetView initWithFrame:](&v15, "initWithFrame:", x, y, width, height);
  sub_10015FC78();

  return v13;
}

- (_TtC7Journal14PhotoAssetView)initWithCoder:(id)a3
{
  return (_TtC7Journal14PhotoAssetView *)sub_10015FB48(a3);
}

- (CGRect)frame
{
  sub_10015FE3C(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
}

- (CGRect)bounds
{
  sub_10015FE3C(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal14PhotoAssetView_assetImageView));

  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal14PhotoAssetView_latestImageRequestID, &qword_100800950);
}

@end
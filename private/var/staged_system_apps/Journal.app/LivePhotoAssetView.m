@interface LivePhotoAssetView
- (CGRect)bounds;
- (CGRect)frame;
- (_TtC7Journal18LivePhotoAssetView)initWithCoder:(id)a3;
- (_TtC7Journal18LivePhotoAssetView)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation LivePhotoAssetView

- (_TtC7Journal18LivePhotoAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal18LivePhotoAssetView *)sub_10050B52C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal18LivePhotoAssetView)initWithCoder:(id)a3
{
  return (_TtC7Journal18LivePhotoAssetView *)sub_10050B69C(a3);
}

- (CGRect)frame
{
  sub_10050C17C(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_10050C244((SEL *)&selRef_setFrame_, x, y, width, height);
}

- (CGRect)bounds
{
  sub_10050C17C(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_10050C244((SEL *)&selRef_setBounds_, x, y, width, height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18LivePhotoAssetView_thumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18LivePhotoAssetView_livePhotoSymbolView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18LivePhotoAssetView_livePhotoView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18LivePhotoAssetView_livePhotoAsset));
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal18LivePhotoAssetView_latestImageRequestID, &qword_100800950);
}

@end
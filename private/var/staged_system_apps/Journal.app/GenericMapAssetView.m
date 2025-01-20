@interface GenericMapAssetView
- (CGRect)bounds;
- (CGRect)frame;
- (_TtC7Journal19GenericMapAssetView)initWithCoder:(id)a3;
- (_TtC7Journal19GenericMapAssetView)initWithFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)userInterfaceStyleChanged;
@end

@implementation GenericMapAssetView

- (_TtC7Journal19GenericMapAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal19GenericMapAssetView *)sub_1004E3CE0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal19GenericMapAssetView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004E5494();
}

- (CGRect)frame
{
  sub_1004E4068(self, (uint64_t)a2, (SEL *)&selRef_frame);
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
  sub_1004E4068(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal19GenericMapAssetView_mkMapView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal19GenericMapAssetView_mapThumbnailView));
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal19GenericMapAssetView_delegate);
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal19GenericMapAssetView_mapAsset);
}

- (void)userInterfaceStyleChanged
{
  double v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Journal19GenericMapAssetView_mapThumbnailView);
  double v3 = self;
  [v2 setImage:0];
  sub_1004E3194();
}

@end
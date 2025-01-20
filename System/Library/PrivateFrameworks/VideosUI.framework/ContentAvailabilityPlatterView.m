@interface ContentAvailabilityPlatterView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI30ContentAvailabilityPlatterView)initWithCoder:(id)a3;
- (_TtC8VideosUI30ContentAvailabilityPlatterView)initWithFrame:(CGRect)a3;
@end

@implementation ContentAvailabilityPlatterView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  nullsub_1(0, a2);
  result.height = v5;
  result.width = v4;
  return result;
}

- (_TtC8VideosUI30ContentAvailabilityPlatterView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI30ContentAvailabilityPlatterView *)sub_1E3342B0C();
}

- (_TtC8VideosUI30ContentAvailabilityPlatterView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI30ContentAvailabilityPlatterView *)sub_1E3342BDC(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI30ContentAvailabilityPlatterView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI30ContentAvailabilityPlatterView_textLabel));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI30ContentAvailabilityPlatterView_vibrantEffectView);
}

@end
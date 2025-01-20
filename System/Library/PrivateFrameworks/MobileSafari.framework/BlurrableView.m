@interface BlurrableView
- (_TtC12MobileSafari13BlurrableView)initWithCoder:(id)a3;
- (_TtC12MobileSafari13BlurrableView)initWithFrame:(CGRect)a3;
@end

@implementation BlurrableView

- (_TtC12MobileSafari13BlurrableView)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileSafari13BlurrableView *)sub_18C3D824C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12MobileSafari13BlurrableView)initWithCoder:(id)a3
{
  return (_TtC12MobileSafari13BlurrableView *)sub_18C5F33B0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari13BlurrableView____lazy_storage___blurRadius));
}

@end
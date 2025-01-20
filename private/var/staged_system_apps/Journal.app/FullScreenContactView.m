@interface FullScreenContactView
- (_TtC7Journal21FullScreenContactView)initWithCoder:(id)a3;
- (_TtC7Journal21FullScreenContactView)initWithFrame:(CGRect)a3;
@end

@implementation FullScreenContactView

- (_TtC7Journal21FullScreenContactView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal21FullScreenContactView *)sub_100248448(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal21FullScreenContactView)initWithCoder:(id)a3
{
  return (_TtC7Journal21FullScreenContactView *)sub_10024856C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal21FullScreenContactView_contactAsset));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal21FullScreenContactView_contactAssetView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal21FullScreenContactView_backgroundView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal21FullScreenContactView_dropShadowView);
}

@end
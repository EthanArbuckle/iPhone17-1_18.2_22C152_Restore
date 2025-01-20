@interface CardView
- (_TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F8CardView)initWithCoder:(id)a3;
- (_TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F8CardView)initWithFrame:(CGRect)a3;
- (void)didTapFrom:(id)a3;
@end

@implementation CardView

- (_TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F8CardView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F8CardView *)sub_1003AD990(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F8CardView)initWithCoder:(id)a3
{
  return (_TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F8CardView *)sub_1003ADAC0(a3);
}

- (void)didTapFrom:(id)a3
{
  id v4 = a3;
  v7 = self;
  if ([v4 state] == (id)3)
  {
    v5 = *(void (**)(uint64_t))((char *)&v7->super.super.super.isa
                                        + OBJC_IVAR____TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F8CardView_tapAction);
    if (v5)
    {
      uint64_t v6 = swift_retain();
      v5(v6);
      sub_10006012C((uint64_t)v5);
    }
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F8CardView_tintView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F8CardView_view));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStoreP33_4C12C965B12FCBBF31BE3A1652C8D11F8CardView_tapAction);

  sub_10006012C(v3);
}

@end
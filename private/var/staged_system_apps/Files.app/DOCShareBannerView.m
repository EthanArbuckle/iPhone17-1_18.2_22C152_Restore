@interface DOCShareBannerView
- (_TtC5Files18DOCShareBannerView)init;
- (_TtC5Files18DOCShareBannerView)initWithCoder:(id)a3;
- (_TtC5Files18DOCShareBannerView)initWithFrame:(CGRect)a3;
@end

@implementation DOCShareBannerView

- (_TtC5Files18DOCShareBannerView)init
{
  return (_TtC5Files18DOCShareBannerView *)sub_10048D260();
}

- (_TtC5Files18DOCShareBannerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10048DEA8();
}

- (_TtC5Files18DOCShareBannerView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Files18DOCShareBannerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000A7258(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5Files18DOCShareBannerView_optionsButtonHandler));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files18DOCShareBannerView____lazy_storage___optionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files18DOCShareBannerView____lazy_storage___topSeparator));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Files18DOCShareBannerView____lazy_storage___bottomSeparator);
}

@end
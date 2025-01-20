@interface FooterButtonReusableView
- (_TtC16MusicApplication24FooterButtonReusableView)initWithCoder:(id)a3;
- (_TtC16MusicApplication24FooterButtonReusableView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation FooterButtonReusableView

- (_TtC16MusicApplication24FooterButtonReusableView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication24FooterButtonReusableView *)sub_356B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication24FooterButtonReusableView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication24FooterButtonReusableView_title);
  void *v4 = 0;
  v4[1] = 0xE000000000000000;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication24FooterButtonReusableView_selectionHandler);
  void *v5 = 0;
  v5[1] = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication24FooterButtonReusableView_buttonAlignment) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication24FooterButtonReusableView____lazy_storage___button) = 0;
  id v6 = a3;

  result = (_TtC16MusicApplication24FooterButtonReusableView *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_35B5C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication24FooterButtonReusableView_selectionHandler));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication24FooterButtonReusableView____lazy_storage___button);
}

@end
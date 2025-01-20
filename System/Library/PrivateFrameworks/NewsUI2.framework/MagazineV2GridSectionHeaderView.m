@interface MagazineV2GridSectionHeaderView
- (_TtC7NewsUI231MagazineV2GridSectionHeaderView)initWithCoder:(id)a3;
- (_TtC7NewsUI231MagazineV2GridSectionHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation MagazineV2GridSectionHeaderView

- (_TtC7NewsUI231MagazineV2GridSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI231MagazineV2GridSectionHeaderView *)sub_1DF48ED1C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI231MagazineV2GridSectionHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DF48F12C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231MagazineV2GridSectionHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231MagazineV2GridSectionHeaderView_sortByButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI231MagazineV2GridSectionHeaderView_detailLabel);
}

@end
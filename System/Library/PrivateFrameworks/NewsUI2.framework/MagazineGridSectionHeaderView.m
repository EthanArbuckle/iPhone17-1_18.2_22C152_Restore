@interface MagazineGridSectionHeaderView
- (_TtC7NewsUI229MagazineGridSectionHeaderView)initWithCoder:(id)a3;
- (_TtC7NewsUI229MagazineGridSectionHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation MagazineGridSectionHeaderView

- (_TtC7NewsUI229MagazineGridSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI229MagazineGridSectionHeaderView *)sub_1DF5901D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI229MagazineGridSectionHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DF5905A8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI229MagazineGridSectionHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI229MagazineGridSectionHeaderView_sortByButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI229MagazineGridSectionHeaderView_detailLabel);
}

@end
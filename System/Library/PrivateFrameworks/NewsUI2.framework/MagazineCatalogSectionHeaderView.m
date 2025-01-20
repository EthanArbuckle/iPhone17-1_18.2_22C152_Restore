@interface MagazineCatalogSectionHeaderView
- (_TtC7NewsUI232MagazineCatalogSectionHeaderView)initWithCoder:(id)a3;
- (_TtC7NewsUI232MagazineCatalogSectionHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation MagazineCatalogSectionHeaderView

- (_TtC7NewsUI232MagazineCatalogSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI232MagazineCatalogSectionHeaderView *)sub_1DF6775C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI232MagazineCatalogSectionHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DF677A80();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI232MagazineCatalogSectionHeaderView_showingPrefixLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI232MagazineCatalogSectionHeaderView_selectCategoryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI232MagazineCatalogSectionHeaderView_onSelectCategoryButtonTap));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI232MagazineCatalogSectionHeaderView_sortByButton);
}

@end
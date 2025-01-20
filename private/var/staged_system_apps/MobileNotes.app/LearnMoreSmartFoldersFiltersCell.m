@interface LearnMoreSmartFoldersFiltersCell
- (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersCell)initWithCoder:(id)a3;
- (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersCell)initWithFrame:(CGRect)a3;
@end

@implementation LearnMoreSmartFoldersFiltersCell

- (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersCell)initWithFrame:(CGRect)a3
{
  return (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersCell *)sub_1001BCEDC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersCell)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersCell *)sub_1001BD1D0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32LearnMoreSmartFoldersFiltersCell_font));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32LearnMoreSmartFoldersFiltersCell____lazy_storage___imageView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes32LearnMoreSmartFoldersFiltersCell____lazy_storage___textLabel);
}

@end
@interface LearnMoreSmartFoldersFiltersView
- (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersView)initWithCoder:(id)a3;
- (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersView)initWithFrame:(CGRect)a3;
@end

@implementation LearnMoreSmartFoldersFiltersView

- (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32LearnMoreSmartFoldersFiltersView_heightConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32LearnMoreSmartFoldersFiltersView____lazy_storage___collectionView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32LearnMoreSmartFoldersFiltersView_diffableDataSource) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[LearnMoreSmartFoldersFiltersView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  sub_1004A6D18();

  return v9;
}

- (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersView)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersView *)sub_1004A70E4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32LearnMoreSmartFoldersFiltersView_heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes32LearnMoreSmartFoldersFiltersView____lazy_storage___collectionView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes32LearnMoreSmartFoldersFiltersView_diffableDataSource);
}

@end
@interface FMSideBarViewController
- (_TtC6FindMy23FMSideBarViewController)initWithCoder:(id)a3;
- (_TtC6FindMy23FMSideBarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)indexChangedWithSender:(id)a3;
- (void)indexNotChangedWithSender:(id)a3;
- (void)viewDidLoad;
@end

@implementation FMSideBarViewController

- (_TtC6FindMy23FMSideBarViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10026570C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100263D50();
}

- (void)indexChangedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100264B80(v4);
}

- (void)indexNotChangedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100264E6C(v4);
}

- (_TtC6FindMy23FMSideBarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy23FMSideBarViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy23FMSideBarViewController_contentDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy23FMSideBarViewController_sideBarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy23FMSideBarViewController_segmentedControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy23FMSideBarViewController_topConstraint));
  swift_release();

  swift_release();
}

@end
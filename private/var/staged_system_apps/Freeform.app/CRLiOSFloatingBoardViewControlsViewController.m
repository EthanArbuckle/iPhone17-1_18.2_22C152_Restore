@interface CRLiOSFloatingBoardViewControlsViewController
- (_TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController)initWithCoder:(id)a3;
- (_TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation CRLiOSFloatingBoardViewControlsViewController

- (_TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1009A72A8();
}

- (void)loadView
{
  v2 = self;
  id v3 = sub_1009A4AAC();
  [(CRLiOSFloatingBoardViewControlsViewController *)v2 setView:v3];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1009A6344();
}

- (_TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController_stackViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController_stackViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController____lazy_storage___gridButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController____lazy_storage___connectorButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController____lazy_storage___separator);
}

@end
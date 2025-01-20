@interface ToolbarHostingViewController
- (_TtC5Books28ToolbarHostingViewController)initWithCoder:(id)a3;
- (_TtC5Books28ToolbarHostingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation ToolbarHostingViewController

- (_TtC5Books28ToolbarHostingViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC5Books28ToolbarHostingViewController_toolbarHeightPublisher;
  sub_100058D18(&qword_100B23728);
  swift_allocObject();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1007F77E0();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Books28ToolbarHostingViewController_cancellables) = (Class)&_swiftEmptySetSingleton;

  result = (_TtC5Books28ToolbarHostingViewController *)sub_1007FF260();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1006E5514();
}

- (_TtC5Books28ToolbarHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Books28ToolbarHostingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Books28ToolbarHostingViewController_rootViewController));
  swift_release();

  swift_bridgeObjectRelease();
}

@end
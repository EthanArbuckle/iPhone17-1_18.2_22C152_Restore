@interface TVPreviewPlayerViewController
- (_TtC9SeymourUI29TVPreviewPlayerViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI29TVPreviewPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVPreviewPlayerViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (_TtC9SeymourUI29TVPreviewPlayerViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9SeymourUI29TVPreviewPlayerViewController_playerViewController;
  id v6 = objc_allocWithZone(MEMORY[0x263EFA9C8]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC9SeymourUI29TVPreviewPlayerViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A79D5C0();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVPreviewPlayerViewController();
  id v4 = v5.receiver;
  [(TVPreviewPlayerViewController *)&v5 viewDidAppear:v3];
  sub_23A2BA5F8();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  sub_23A79D85C(v3);
}

- (_TtC9SeymourUI29TVPreviewPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI29TVPreviewPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI29TVPreviewPlayerViewController_dataProvider));
  swift_unknownObjectRelease();
  BOOL v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI29TVPreviewPlayerViewController_metricPage;
  uint64_t v4 = sub_23A7F6C38();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_super v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI29TVPreviewPlayerViewController_playerViewController);
}

@end
@interface PreviewPlayerViewController
- (_TtC9SeymourUI27PreviewPlayerViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI27PreviewPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9SeymourUI27PreviewPlayerViewController)initWithPlayerLayerView:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PreviewPlayerViewController

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (_TtC9SeymourUI27PreviewPlayerViewController)initWithCoder:(id)a3
{
  result = (_TtC9SeymourUI27PreviewPlayerViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for PreviewPlayerViewController();
  [(PreviewPlayerViewController *)&v2 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PreviewPlayerViewController();
  id v4 = v5.receiver;
  [(PreviewPlayerViewController *)&v5 viewDidAppear:v3];
  sub_23A2BA5F8();
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_23A40AD24(a3);
}

- (_TtC9SeymourUI27PreviewPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI27PreviewPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI27PreviewPlayerViewController)initWithPlayerLayerView:(id)a3
{
  id v3 = a3;
  result = (_TtC9SeymourUI27PreviewPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI27PreviewPlayerViewController_dataProvider));
  swift_unknownObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI27PreviewPlayerViewController_metricPage;
  uint64_t v4 = sub_23A7F6C38();
  objc_super v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end
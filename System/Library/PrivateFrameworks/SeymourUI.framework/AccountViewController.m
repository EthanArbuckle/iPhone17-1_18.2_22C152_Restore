@interface AccountViewController
- (CGSize)preferredContentSize;
- (_TtC9SeymourUI21AccountViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI21AccountViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)doneButtonTapped:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AccountViewController

- (CGSize)preferredContentSize
{
  v2 = self;
  uint64_t v3 = sub_23A7FB668();
  if (v3 == sub_23A7FB668())
  {

    uint64_t v4 = 0x4082400000000000;
    uint64_t v5 = 0x4082200000000000;
  }
  else
  {
    v10.receiver = v2;
    v10.super_class = (Class)type metadata accessor for AccountViewController();
    [(AccountViewController *)&v10 preferredContentSize];
    uint64_t v5 = v6;
    uint64_t v4 = v7;
  }
  double v8 = *(double *)&v5;
  double v9 = *(double *)&v4;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AccountViewController();
  -[AccountViewController setPreferredContentSize:](&v5, sel_setPreferredContentSize_, width, height);
}

- (_TtC9SeymourUI21AccountViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21AccountViewController_visibility) = 1;
  id v4 = a3;

  CGSize result = (_TtC9SeymourUI21AccountViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A1F2B08();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_23A1F2EEC(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AccountViewController();
  id v4 = v5.receiver;
  [(AccountViewController *)&v5 viewDidAppear:v3];
  sub_23A1F417C();
  sub_23A7FC148();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_23A1F3680(a3);
}

- (void)doneButtonTapped:(id)a3
{
}

- (_TtC9SeymourUI21AccountViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC9SeymourUI21AccountViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  BOOL v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI21AccountViewController_metricPage;
  uint64_t v4 = sub_23A7F6C38();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21AccountViewController_pageNavigator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21AccountViewController_storefrontLocalizer);
}

@end
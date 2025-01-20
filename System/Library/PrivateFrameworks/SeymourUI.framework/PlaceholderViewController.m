@interface PlaceholderViewController
- (_TtC9SeymourUI25PlaceholderViewController)init;
- (_TtC9SeymourUI25PlaceholderViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI25PlaceholderViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation PlaceholderViewController

- (_TtC9SeymourUI25PlaceholderViewController)init
{
  uint64_t v3 = OBJC_IVAR____TtC9SeymourUI25PlaceholderViewController_activityIndicator;
  id v4 = objc_allocWithZone(MEMORY[0x263F823E8]);
  v5 = self;
  id v6 = objc_msgSend(v4, sel_initWithActivityIndicatorStyle_, 101);
  objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)v6;

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for PlaceholderViewController();
  v7 = [(PlaceholderViewController *)&v9 initWithNibName:0 bundle:0];
  objc_msgSend(*(id *)((char *)&v7->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI25PlaceholderViewController_activityIndicator), sel_setHidesWhenStopped_, 1);
  return v7;
}

- (_TtC9SeymourUI25PlaceholderViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9SeymourUI25PlaceholderViewController_activityIndicator;
  id v6 = objc_allocWithZone(MEMORY[0x263F823E8]);
  id v7 = a3;
  id v8 = objc_msgSend(v6, sel_initWithActivityIndicatorStyle_, 101);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v8;

  result = (_TtC9SeymourUI25PlaceholderViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A692390();
}

- (_TtC9SeymourUI25PlaceholderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI25PlaceholderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25PlaceholderViewController_activityIndicator));
}

@end
@interface TVPlaylistViewController
- (_TtC9SeymourUI24TVPlaylistViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI24TVPlaylistViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation TVPlaylistViewController

- (void)viewDidLoad
{
  v2 = self;
  TVPlaylistViewController.viewDidLoad()();
}

- (_TtC9SeymourUI24TVPlaylistViewController)initWithCoder:(id)a3
{
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI24TVPlaylistViewController_layout) = xmmword_23A824AF0;
  id v4 = a3;

  result = (_TtC9SeymourUI24TVPlaylistViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI24TVPlaylistViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI24TVPlaylistViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24TVPlaylistViewController_listViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24TVPlaylistViewController_focusedWorkoutController));

  swift_release();
}

@end
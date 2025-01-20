@interface MiniPlayerViewController
- (_TtC9SeymourUI24MiniPlayerViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI24MiniPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation MiniPlayerViewController

- (_TtC9SeymourUI24MiniPlayerViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI24MiniPlayerViewController_contentOverlayView) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI24MiniPlayerViewController_isPictureInPictureActive) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI24MiniPlayerViewController_settingsPopoverSourceView) = 0;
  id v5 = a3;

  result = (_TtC9SeymourUI24MiniPlayerViewController *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A1E62E8();
}

- (_TtC9SeymourUI24MiniPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI24MiniPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI24MiniPlayerViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24MiniPlayerViewController_contentOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI24MiniPlayerViewController_settingsPopoverSourceView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI24MiniPlayerViewController_miniPlayerView);
}

@end
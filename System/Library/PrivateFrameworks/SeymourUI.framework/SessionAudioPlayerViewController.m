@interface SessionAudioPlayerViewController
- (NSArray)keyCommands;
- (_TtC9SeymourUI32SessionAudioPlayerViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI32SessionAudioPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
@end

@implementation SessionAudioPlayerViewController

- (NSArray)keyCommands
{
  return (NSArray *)0;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_239F5C490();
}

- (_TtC9SeymourUI32SessionAudioPlayerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239F5D248();
}

- (void)updateViewConstraints
{
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SessionAudioPlayerViewController();
  id v4 = v9.receiver;
  id v5 = a3;
  [(SessionAudioPlayerViewController *)&v9 traitCollectionDidChange:v5];
  if (v5)
  {
    id v6 = v5;
    id v7 = objc_msgSend(v4, sel_traitCollection, v9.receiver, v9.super_class);
    sub_239C24FF0(0, &qword_268A139D0);
    char v8 = sub_23A8005A8();

    if ((v8 & 1) == 0) {
      sub_239F5C834();
    }

    id v4 = v6;
  }
  else
  {
    sub_239F5C834();
  }
}

- (void)viewSafeAreaInsetsDidChange
{
}

- (_TtC9SeymourUI32SessionAudioPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI32SessionAudioPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI32SessionAudioPlayerViewController_delegate);
  objc_release(*(id *)((char *)&self->super._toolbarItems
                     + OBJC_IVAR____TtC9SeymourUI32SessionAudioPlayerViewController_currentLayoutEnvironment));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionAudioPlayerViewController_contentOverlayView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionAudioPlayerViewController_settingsPopoverSourceView));
  swift_unknownObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI32SessionAudioPlayerViewController_playerView);
}

@end
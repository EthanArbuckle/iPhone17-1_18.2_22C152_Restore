@interface SessionVideoPlayerViewController
- (NSArray)keyCommands;
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI32SessionVideoPlayerViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI32SessionVideoPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapMediaPlayerViewWithTapGestureRecognizer:(id)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SessionVideoPlayerViewController

- (NSArray)keyCommands
{
  return (NSArray *)0;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  sub_23A53F3A4();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v3 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (_TtC9SeymourUI32SessionVideoPlayerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A542704();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A53FC1C();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SessionVideoPlayerViewController();
  v4 = (char *)v8.receiver;
  [(SessionVideoPlayerViewController *)&v8 viewWillAppear:v3];
  uint64_t v5 = *(void *)&v4[OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_presenter];
  if (MEMORY[0x23ECB8640](v5 + 16))
  {
    uint64_t v6 = *(void *)(v5 + 24);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v6 + 200))(ObjectType, v6);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SessionVideoPlayerViewController();
  v4 = (char *)v8.receiver;
  [(SessionVideoPlayerViewController *)&v8 viewWillDisappear:v3];
  uint64_t v5 = *(void *)&v4[OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_presenter];
  if (MEMORY[0x23ECB8640](v5 + 16))
  {
    uint64_t v6 = *(void *)(v5 + 24);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v6 + 208))(ObjectType, v6);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SessionVideoPlayerViewController();
  id v2 = v3.receiver;
  [(SessionVideoPlayerViewController *)&v3 viewSafeAreaInsetsDidChange];
  sub_23A540070();
}

- (_TtC9SeymourUI32SessionVideoPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI32SessionVideoPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_airplayAndSettingsControlsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_settingsControlItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_gymKitResumeMachineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_settingsPopoverSourceView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_playbackViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController_videoBoundsObserver));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI32SessionVideoPlayerViewController__requiresLinearPlayback;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF5F7F0);
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)didTapMediaPlayerViewWithTapGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_239CF8C8C();
}

@end
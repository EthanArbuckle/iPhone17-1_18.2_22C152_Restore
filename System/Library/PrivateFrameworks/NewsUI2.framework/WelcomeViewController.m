@interface WelcomeViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5;
- (NSArray)keyCommands;
- (_TtC7NewsUI221WelcomeViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI221WelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapContinueButton;
- (void)showPrivacyText;
- (void)updateStyling;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation WelcomeViewController

- (_TtC7NewsUI221WelcomeViewController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI221WelcomeViewController_keyFrame);
  void *v4 = 0;
  v4[1] = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI221WelcomeViewController_startedFirstAnimation) = 0;
  id v5 = a3;

  result = (_TtC7NewsUI221WelcomeViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void)showPrivacyText
{
  v2 = self;
  sub_1DFBDA2C8();
}

- (_TtC7NewsUI221WelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI221WelcomeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI221WelcomeViewController_colorStyler);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI221WelcomeViewController_viewProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI221WelcomeViewController_viewAnimator);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI221WelcomeViewController_sceneStateManager);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI221WelcomeViewController_keyFrame);
  unint64_t v4 = *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC7NewsUI221WelcomeViewController_keyFrame);
  sub_1DFBDBB94(v3, v4);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DFBDA530();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DFBDA6C0();
}

- (void)viewDidAppear:(BOOL)a3
{
  unint64_t v4 = self;
  sub_1DFBDA874(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  unint64_t v4 = self;
  sub_1DFBDAD38(a3);
}

- (NSArray)keyCommands
{
  if (sub_1DFBDBC60())
  {
    sub_1DE919914(0, (unint64_t *)&unk_1EBABAAB0);
    v2 = (void *)sub_1DFDFE200();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)didTapContinueButton
{
  uint64_t v3 = *(void *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC7NewsUI221WelcomeViewController_eventHandler);
  uint64_t ObjectType = swift_getObjectType();
  id v5 = *(void (**)(uint64_t, uint64_t))(v3 + 48);
  v6 = self;
  v5(ObjectType, v3);
}

- (void)updateStyling
{
  v2 = self;
  sub_1DFBDB550();
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  uint64_t v7 = sub_1DFDE7220();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DFDE7190();
  id v11 = a3;
  v12 = self;
  sub_1DFBDA2C8();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return 0;
}

@end
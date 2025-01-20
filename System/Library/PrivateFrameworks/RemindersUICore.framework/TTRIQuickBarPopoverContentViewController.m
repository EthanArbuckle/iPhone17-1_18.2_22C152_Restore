@interface TTRIQuickBarPopoverContentViewController
- (_TtC15RemindersUICore40TTRIQuickBarPopoverContentViewController)initWithCoder:(id)a3;
- (_TtC15RemindersUICore40TTRIQuickBarPopoverContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TTRIQuickBarPopoverContentViewController

- (_TtC15RemindersUICore40TTRIQuickBarPopoverContentViewController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC15RemindersUICore40TTRIQuickBarPopoverContentViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore40TTRIQuickBarPopoverContentViewController_keyboardWillHideObserver) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore40TTRIQuickBarPopoverContentViewController_quickPickView) = 0;
  uint64_t v5 = OBJC_IVAR____TtC15RemindersUICore40TTRIQuickBarPopoverContentViewController_dateIconGenerator;
  type metadata accessor for TTRIDateIconGenerator();
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)swift_allocObject();
  id v6 = a3;

  result = (_TtC15RemindersUICore40TTRIQuickBarPopoverContentViewController *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_1B9349D7C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B934A144();
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = v6.receiver;
  [(TTRIQuickBarPopoverContentViewController *)&v6 viewDidAppear:v3];
  LODWORD(v3) = *MEMORY[0x1E4FB24B0];
  id v5 = objc_msgSend(v4, sel_view, v6.receiver, v6.super_class);
  UIAccessibilityPostNotification(v3, v5);
}

- (_TtC15RemindersUICore40TTRIQuickBarPopoverContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15RemindersUICore40TTRIQuickBarPopoverContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore40TTRIQuickBarPopoverContentViewController_delegate);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRIQuickBarPopoverContentViewController_quickPickView));

  swift_release();
}

@end
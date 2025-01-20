@interface EKReminderEditViewController
- (BOOL)canManagePresentationStyle;
- (BOOL)hasUnsavedChanges;
- (BOOL)ignoreUnsavedChanges;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)wantsManagement;
- (BOOL)willPresentDialogOnSave;
- (EKCalendar)calendarToMakeVisibleOnSave;
- (EKEvent)event;
- (EKEventOrIntegrationEditViewDelegate)internalEditViewDelegate;
- (_TtC9MobileCal28EKReminderEditViewController)initWithCoder:(id)a3;
- (_TtC9MobileCal28EKReminderEditViewController)initWithModel:(id)a3;
- (_TtC9MobileCal28EKReminderEditViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC9MobileCal28EKReminderEditViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9MobileCal28EKReminderEditViewController)initWithRootViewController:(id)a3;
- (void)cancelEditing;
- (void)completeAndSaveWithContinueBlock:(id)a3;
- (void)configureAppearanceForSplitDayView;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)refreshStartAndEndDates;
- (void)setEvent:(id)a3;
- (void)setIgnoreUnsavedChanges:(BOOL)a3;
- (void)setInternalEditViewDelegate:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EKReminderEditViewController

- (_TtC9MobileCal28EKReminderEditViewController)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_currentModule;
  uint64_t v6 = type metadata accessor for RemindersInCalendarUtilities.ReminderEditingModule();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_event) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_ignoreUnsavedChanges) = 0;
  id v7 = a3;

  result = (_TtC9MobileCal28EKReminderEditViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC9MobileCal28EKReminderEditViewController)initWithModel:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_currentModule;
  uint64_t v6 = type metadata accessor for RemindersInCalendarUtilities.ReminderEditingModule();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_event) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_ignoreUnsavedChanges) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_model) = (Class)a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for EKReminderEditViewController();
  id v7 = a3;
  return [(EKReminderEditViewController *)&v9 initWithNibName:0 bundle:0];
}

- (EKEventOrIntegrationEditViewDelegate)internalEditViewDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (EKEventOrIntegrationEditViewDelegate *)Strong;
}

- (void)setInternalEditViewDelegate:(id)a3
{
}

- (EKEvent)event
{
  return (EKEvent *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_event));
}

- (void)setEvent:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_event);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_event) = (Class)a3;
  id v6 = a3;
  v5 = self;

  sub_100143694();
}

- (void)refreshStartAndEndDates
{
  v2 = self;
  sub_100144310();
}

- (void)configureAppearanceForSplitDayView
{
  id v3 = objc_allocWithZone((Class)UINavigationBarAppearance);
  v4 = self;
  id v5 = [v3 init];
  [v5 configureWithOpaqueBackground];
  id v6 = [(EKReminderEditViewController *)v4 navigationBar];
  [v6 setScrollEdgeAppearance:v5];
}

- (BOOL)hasUnsavedChanges
{
  v2 = self;
  char v3 = sub_100144774();

  return v3 & 1;
}

- (BOOL)willPresentDialogOnSave
{
  v2 = self;
  char v3 = sub_100144970();

  return v3 & 1;
}

- (void)completeAndSaveWithContinueBlock:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    id v7 = sub_100146D98;
  }
  else
  {
    id v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_100144B78((void (*)(uint64_t))v7, (void (*)(uint64_t))v6);
  sub_10013C36C((uint64_t)v7);
}

- (BOOL)ignoreUnsavedChanges
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_ignoreUnsavedChanges);
}

- (void)setIgnoreUnsavedChanges:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_ignoreUnsavedChanges) = a3;
}

- (void)cancelEditing
{
  uint64_t v3 = sub_100013AAC(&qword_100216230);
  __chkstk_darwin(v3 - 8);
  id v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor();
  id v7 = self;
  uint64_t v8 = static MainActor.shared.getter();
  objc_super v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  sub_10000B0D8((uint64_t)v5, (uint64_t)&unk_100216288, (uint64_t)v9);

  swift_release();
}

- (EKCalendar)calendarToMakeVisibleOnSave
{
  id v2 = [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_model) reminderCalendar];

  return (EKCalendar *)v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for EKReminderEditViewController();
  id v4 = v9.receiver;
  [(EKReminderEditViewController *)&v9 viewWillAppear:v3];
  id v5 = [v4 presentationController];
  id v6 = [v5 delegate];
  swift_unknownObjectRelease();

  if (!v6)
  {
    id v7 = [v4 presentationController];
    if (v7)
    {
      id v8 = v7;
      [v7 setDelegate:v4];

      id v4 = v8;
    }
  }
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  uint64_t v5 = sub_100013AAC(&qword_100216230);
  __chkstk_darwin(v5 - 8);
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  type metadata accessor for MainActor();
  objc_super v9 = self;
  id v10 = a3;
  uint64_t v11 = static MainActor.shared.getter();
  v12 = (void *)swift_allocObject();
  v12[2] = v11;
  v12[3] = &protocol witness table for MainActor;
  v12[4] = v9;
  sub_10000B0D8((uint64_t)v7, (uint64_t)&unk_100216278, (uint64_t)v12);

  swift_release();
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_100146180();

  return self & 1;
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (_TtC9MobileCal28EKReminderEditViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC9MobileCal28EKReminderEditViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9MobileCal28EKReminderEditViewController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC9MobileCal28EKReminderEditViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9MobileCal28EKReminderEditViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9MobileCal28EKReminderEditViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000245E8((uint64_t)self + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_currentModule, &qword_100216248);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_model));
  sub_10013CA44((uint64_t)self + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_internalEditViewDelegate);
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_event);
}

@end
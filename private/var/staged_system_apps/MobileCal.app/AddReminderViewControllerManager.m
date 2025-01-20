@interface AddReminderViewControllerManager
- (AddItemViewControllerManagerDelegate)addItemViewControllerManagerDelegate;
- (BOOL)canDismiss;
- (BOOL)hasUnsavedChanges;
- (BOOL)ignoreUnsavedChanges;
- (BOOL)willPresentDialogOnSave;
- (EKCalendar)calendarToMakeVisibleOnSave;
- (NSString)newItemBackButtonTitle;
- (NSString)newItemTitle;
- (UIViewController)viewController;
- (_TtC9MobileCal32AddReminderViewControllerManager)init;
- (_TtC9MobileCal32AddReminderViewControllerManager)initWithModel:(id)a3;
- (id)confirmDismissAlertController;
- (id)createViewController:(id)a3;
- (void)cancelEditing;
- (void)completeAndSaveWithContinueBlock:(id)a3;
- (void)presentationControllerDidDismiss;
- (void)requestReminderSheet:(id)a3;
- (void)setAddItemViewControllerManagerDelegate:(id)a3;
- (void)setIgnoreUnsavedChanges:(BOOL)a3;
- (void)updateStateFromUI:(id)a3;
- (void)updateUIFromState:(id)a3;
@end

@implementation AddReminderViewControllerManager

- (AddItemViewControllerManagerDelegate)addItemViewControllerManagerDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (AddItemViewControllerManagerDelegate *)Strong;
}

- (void)setAddItemViewControllerManagerDelegate:(id)a3
{
}

- (_TtC9MobileCal32AddReminderViewControllerManager)initWithModel:(id)a3
{
  id v3 = a3;
  sub_10013BB80(v3);
  v5 = v4;

  return v5;
}

- (NSString)newItemTitle
{
  uint64_t v3 = type metadata accessor for LocalizedStringResource.BundleDescription();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Locale();
  __chkstk_darwin();
  type metadata accessor for String.LocalizationValue();
  __chkstk_darwin();
  type metadata accessor for LocalizedStringResource();
  __chkstk_darwin();
  v7 = self;
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)();
  String.init(localized:)();

  v8 = (NSString *)String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v8;
}

- (NSString)newItemBackButtonTitle
{
  uint64_t v3 = type metadata accessor for LocalizedStringResource.BundleDescription();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Locale();
  __chkstk_darwin();
  type metadata accessor for String.LocalizationValue();
  __chkstk_darwin();
  type metadata accessor for LocalizedStringResource();
  __chkstk_darwin();
  v7 = self;
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)();
  String.init(localized:)();

  v8 = (NSString *)String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v8;
}

- (EKCalendar)calendarToMakeVisibleOnSave
{
  id v2 = [*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC9MobileCal32AddReminderViewControllerManager_model) reminderCalendar];

  return (EKCalendar *)v2;
}

- (id)createViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  v6 = (void *)sub_100135D28(v4);

  return v6;
}

- (UIViewController)viewController
{
  id v2 = self;
  uint64_t v3 = (void *)sub_100137284();

  return (UIViewController *)v3;
}

- (void)updateUIFromState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100137434(v4);
}

- (void)updateStateFromUI:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001378F8(v4);
}

- (BOOL)canDismiss
{
  id v2 = self;
  char v3 = sub_1001389C0();

  return v3 & 1;
}

- (id)confirmDismissAlertController
{
  id v2 = self;
  id v3 = sub_100138CD0();

  return v3;
}

- (void)presentationControllerDidDismiss
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v4 = (void *)Strong;
    uint64_t v5 = self;
    [v4 addItemViewControllerManager:v5 didCompleteWithAction:0];

    swift_unknownObjectRelease();
  }
}

- (BOOL)hasUnsavedChanges
{
  id v2 = self;
  char v3 = sub_100139630();

  return v3 & 1;
}

- (BOOL)willPresentDialogOnSave
{
  id v2 = self;
  char v3 = sub_100139834();

  return v3 & 1;
}

- (void)completeAndSaveWithContinueBlock:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_10013CA3C;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_100139A44((void (*)(uint64_t))v7, (void (*)(uint64_t))v6);
  sub_10013C36C((uint64_t)v7);
}

- (BOOL)ignoreUnsavedChanges
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC9MobileCal32AddReminderViewControllerManager_ignoreUnsavedChanges);
}

- (void)setIgnoreUnsavedChanges:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC9MobileCal32AddReminderViewControllerManager_ignoreUnsavedChanges) = a3;
}

- (void)cancelEditing
{
  id v2 = self;
  sub_10013A2E8();
}

- (void)requestReminderSheet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10013C00C(v4);
}

- (_TtC9MobileCal32AddReminderViewControllerManager)init
{
  result = (_TtC9MobileCal32AddReminderViewControllerManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9MobileCal32AddReminderViewControllerManager_undoManager));

  sub_1000245E8((uint64_t)self + OBJC_IVAR____TtC9MobileCal32AddReminderViewControllerManager_creationModule, (uint64_t *)&unk_100215E40);
  sub_1000245E8((uint64_t)self + OBJC_IVAR____TtC9MobileCal32AddReminderViewControllerManager_initialDateComponents, (uint64_t *)&unk_100216260);
  char v3 = (char *)self + OBJC_IVAR____TtC9MobileCal32AddReminderViewControllerManager_addItemViewControllerManagerDelegate;

  sub_10013CA44((uint64_t)v3);
}

@end
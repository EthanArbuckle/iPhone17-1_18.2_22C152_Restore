@interface TTRIShowRemindersViewController
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (NSArray)preferredFocusEnvironments;
- (_TtC9Reminders31TTRIShowRemindersViewController)initWithCoder:(id)a3;
- (_TtC9Reminders31TTRIShowRemindersViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)addStructuredHashtagForSelectedReminderAction:(id)a3;
- (void)collapseAllItemsAction:(id)a3;
- (void)collapseReminderSubtasksAlternativeShortcutAction:(id)a3;
- (void)collapseReminderSubtasksWithArrowKeyAction:(id)a3;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)deleteReminderAction:(id)a3;
- (void)endEditingReminderAction:(id)a3;
- (void)expandAllItemsAction:(id)a3;
- (void)expandReminderSubtasksAlternativeShortcutAction:(id)a3;
- (void)expandReminderSubtasksWithArrowKeyAction:(id)a3;
- (void)indentSelectedReminderAction:(id)a3;
- (void)keyboardDidHideNotificationWithNotification:(id)a3;
- (void)keyboardDidShowNotificationWithNotification:(id)a3;
- (void)keyboardWillChangeFrameNotificationWithNotification:(id)a3;
- (void)keyboardWillHideNotificationWithNotification:(id)a3;
- (void)keyboardWillShowNotificationWithNotification:(id)a3;
- (void)newReminderAction:(id)a3;
- (void)newSectionAction:(id)a3;
- (void)newSectionWithSelectionAction:(id)a3;
- (void)outdentSelectedReminderAction:(id)a3;
- (void)paste:(id)a3;
- (void)postponeAllOverdueToTodayAction:(id)a3;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)printListAction:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setReminderDueDateToNextWeekAction:(id)a3;
- (void)setReminderDueDateToNoneAction:(id)a3;
- (void)setReminderDueDateToTodayAction:(id)a3;
- (void)setReminderDueDateToTomorrowAction:(id)a3;
- (void)setReminderDueDateToWeekendAction:(id)a3;
- (void)showReminderInfoAction:(id)a3;
- (void)startEditingReminderAction:(id)a3;
- (void)toggleFlaggedForSelectedReminderAction:(id)a3;
- (void)toggleReminderCompletionStateAction:(id)a3;
- (void)toggleShowCompletedAction:(id)a3;
- (void)ttr_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)updateUserActivityState:(id)a3;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willAddDeactivationReasonWithNotification:(id)a3;
@end

@implementation TTRIShowRemindersViewController

- (_TtC9Reminders31TTRIShowRemindersViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100347AA8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100339794();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_10033B918();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10033C13C(0, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10033C4DC(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10033C860(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_10033CF58(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  [(TTRIShowRemindersViewController *)&v7 viewDidDisappear:v3];
  uint64_t v5 = *(void *)&v4[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter + 8];
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v5 + 376))(ObjectType, v5);
}

- (void)updateUserActivityState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10033D468(v4);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  v8 = self;
  if ([(TTRIShowRemindersViewController *)v8 isEditing] == v5)
  {
  }
  else
  {
    UIViewController.endFirstResponderEditing()();
    v9.receiver = v8;
    v9.super_class = ObjectType;
    [(TTRIShowRemindersViewController *)&v9 setEditing:v5 animated:v4];
    [*(id *)&v8->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_contentViewController] setEditing:v5 animated:v4];
    sub_10033C13C(1, 1);
    sub_10033D6DC();
  }
}

- (NSArray)preferredFocusEnvironments
{
  sub_10003B754((uint64_t *)&unk_1007894B0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10066D470;
  BOOL v4 = *(void **)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_contentViewController];
  *(void *)(v3 + 32) = v4;
  specialized Array._endMutation()();
  id v5 = v4;
  sub_10003B754((uint64_t *)&unk_10079A080);
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v6.super.isa;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    NSArray v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    objc_super v7 = self;
  }
  char v8 = sub_10033DA04((uint64_t)a3, (uint64_t)v10);

  sub_10003B6F8((uint64_t)v10, &qword_100788D60);
  return v8 & 1;
}

- (void)cut:(id)a3
{
}

- (void)copy:(id)a3
{
}

- (void)paste:(id)a3
{
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100340370(v4);
}

- (void)ttr_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100347CBC();
}

- (void)endEditingReminderAction:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  uint64_t v6 = *(void *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v6 + 368))(ObjectType, v6);

  sub_10003B6F8((uint64_t)v8, &qword_100788D60);
}

- (void)collapseReminderSubtasksWithArrowKeyAction:(id)a3
{
}

- (void)expandReminderSubtasksWithArrowKeyAction:(id)a3
{
}

- (void)collapseReminderSubtasksAlternativeShortcutAction:(id)a3
{
}

- (void)expandReminderSubtasksAlternativeShortcutAction:(id)a3
{
}

- (void)deleteReminderAction:(id)a3
{
  uint64_t v5 = sub_10003B754((uint64_t *)&unk_100788DC0);
  __chkstk_darwin(v5 - 8);
  objc_super v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TTRRemindersListViewModel.Item();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v12 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    v13 = self;
  }
  sub_10033FC48((uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_10003B6F8((uint64_t)v7, (uint64_t *)&unk_100788DC0);
  }
  else
  {
    sub_1003470E8((uint64_t)v7, (uint64_t)v11, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.Item);
    uint64_t v14 = *(void *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, Reminders::TTRReminderIDsWithMatchingHashtagsProvider (__swiftcall *)(Swift::OpaquePointer), void, uint64_t, uint64_t))(v14 + 80))(v11, TTRReminderIDsWithMatchingHashtagsProvider.init(reminders:), 0, ObjectType, v14);
    sub_1003475DC((uint64_t)v11, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.Item);
  }

  sub_10003B6F8((uint64_t)v16, &qword_100788D60);
}

- (void)newReminderAction:(id)a3
{
}

- (void)startEditingReminderAction:(id)a3
{
}

- (void)expandAllItemsAction:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
    uint64_t v5 = self;
  }
  uint64_t v6 = *(void *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 448))(ObjectType, v6);
  uint64_t v9 = *(void **)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_contentViewController];
  uint64_t v10 = *(void *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_contentViewController];
  uint64_t v11 = swift_getObjectType();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 200);
  id v13 = v9;
  v12(v8, v11, v10);

  swift_bridgeObjectRelease();
  sub_10003B6F8((uint64_t)v14, &qword_100788D60);
}

- (void)collapseAllItemsAction:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
    uint64_t v5 = self;
  }
  uint64_t v6 = *(void *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 448))(ObjectType, v6);
  uint64_t v9 = *(void **)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_contentViewController];
  uint64_t v10 = *(void *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_contentViewController];
  uint64_t v11 = swift_getObjectType();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 208);
  id v13 = v9;
  v12(v8, v11, v10);

  swift_bridgeObjectRelease();
  sub_10003B6F8((uint64_t)v14, &qword_100788D60);
}

- (void)showReminderInfoAction:(id)a3
{
}

- (void)toggleReminderCompletionStateAction:(id)a3
{
}

- (void)indentSelectedReminderAction:(id)a3
{
}

- (void)outdentSelectedReminderAction:(id)a3
{
}

- (void)toggleFlaggedForSelectedReminderAction:(id)a3
{
}

- (void)addStructuredHashtagForSelectedReminderAction:(id)a3
{
  uint64_t v5 = sub_10003B754((uint64_t *)&unk_100788DC0);
  __chkstk_darwin(v5 - 8);
  objc_super v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TTRRemindersListViewModel.Item();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v12 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    id v13 = self;
  }
  sub_10033FC48((uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_10003B6F8((uint64_t)v7, (uint64_t *)&unk_100788DC0);
  }
  else
  {
    sub_1003470E8((uint64_t)v7, (uint64_t)v11, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.Item);
    uint64_t v14 = *(void *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 176))(v11, ObjectType, v14);
    sub_1003475DC((uint64_t)v11, (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.Item);
  }

  sub_10003B6F8((uint64_t)v16, &qword_100788D60);
}

- (void)setReminderDueDateToTodayAction:(id)a3
{
}

- (void)setReminderDueDateToTomorrowAction:(id)a3
{
}

- (void)setReminderDueDateToWeekendAction:(id)a3
{
}

- (void)setReminderDueDateToNextWeekAction:(id)a3
{
}

- (void)setReminderDueDateToNoneAction:(id)a3
{
}

- (void)postponeAllOverdueToTodayAction:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  uint64_t v6 = *(void *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 640))(1, ObjectType, v6);

  sub_10003B6F8((uint64_t)v8, &qword_100788D60);
}

- (void)printListAction:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  uint64_t v6 = *(void *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v6 + 792))(ObjectType, v6);

  sub_10003B6F8((uint64_t)v8, &qword_100788D60);
}

- (void)toggleShowCompletedAction:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    uint64_t v5 = self;
  }
  uint64_t v6 = *(void *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = (uint64_t *)TTRITipKitSignalContext.RemindersList.keyboardShortcut.unsafeMutableAddressor();
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 808);
  swift_bridgeObjectRetain();
  v11(v9, v10, ObjectType, v6);

  swift_bridgeObjectRelease();
  sub_10003B6F8((uint64_t)v12, &qword_100788D60);
}

- (void)newSectionAction:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  uint64_t v6 = *(void *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v6 + 856))(ObjectType, v6);

  sub_10003B6F8((uint64_t)v8, &qword_100788D60);
}

- (void)newSectionWithSelectionAction:(id)a3
{
}

- (void)willAddDeactivationReasonWithNotification:(id)a3
{
}

- (void)keyboardWillShowNotificationWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  objc_super v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_10033C6F4(1u);
  sub_100344754();
  sub_10033C13C(0, 1);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)keyboardDidShowNotificationWithNotification:(id)a3
{
}

- (void)keyboardWillHideNotificationWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  objc_super v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_10033C6F4(3u);
  double v9 = *(double *)&v8->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_keyboardHeight];
  *(void *)&v8->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_keyboardHeight] = 0;
  sub_100343B64(v9);
  sub_10033C13C(0, 1);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)keyboardDidHideNotificationWithNotification:(id)a3
{
}

- (void)keyboardWillChangeFrameNotificationWithNotification:(id)a3
{
}

- (BOOL)accessibilityPerformMagicTap
{
  v2 = self;
  sub_100343DDC();
  char v3 = sub_100107C8C();

  swift_release();
  return v3 & 1;
}

- (_TtC9Reminders31TTRIShowRemindersViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9Reminders31TTRIShowRemindersViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_10006566C(*(void *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_navigationItemOptions], *(void *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_navigationItemOptions]);
  sub_1003475DC((uint64_t)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_listInfo], (uint64_t (*)(void))&type metadata accessor for TTRRemindersListViewModel.ListInfo);
  sub_10034780C((uint64_t)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_internalDeferredItemUpdates]);
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10003B6F8((uint64_t)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_swHighlightToShowInNavBar], &qword_100791C80);
  sub_10003B6F8((uint64_t)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_cellTitleItemGainingFocus_forKeyboardAvoidance], (uint64_t *)&unk_100788DC0);
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  void (*v13)(void *__return_ptr, uint64_t, uint64_t);
  _TtC9Reminders31TTRIShowRemindersViewController *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  id v21;
  void v22[3];
  uint64_t v23;

  uint64_t v5 = sub_10003B754(&qword_100799F20);
  __chkstk_darwin(v5 - 8);
  objc_super v7 = (char *)&v22[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TTRTemplatePublicLinkData();
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v22[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  uint64_t ObjectType = swift_getObjectType();
  id v13 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v11 + 728);
  v21 = a3;
  uint64_t v14 = self;
  v13(v22, ObjectType, v11);
  if (v23)
  {
    v15 = *(void *)(*sub_100038D28(v22, v23)
                    + OBJC_IVAR____TtC9Reminders25TTRIShowTemplatePresenter_dataModelSource
                    + 8);
    v16 = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v16, v15);
    v17 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v7, 1, 1, v17);
    TTRTemplatePublicLinkData.init(template:now:)();
    v18 = *(void *)&v10[*(int *)(v8 + 20)];
    v19 = (*(void *)TTRTemplatePublicLinkData.Capabilities.updateLink.unsafeMutableAddressor() & ~v18) != 0;
    sub_1003475DC((uint64_t)v10, (uint64_t (*)(void))&type metadata accessor for TTRTemplatePublicLinkData);
    sub_100038CD8((uint64_t)v22);
  }
  else
  {
    sub_10003B6F8((uint64_t)v22, (uint64_t *)&unk_10079BB18);
    v19 = 1;
  }

  return v19;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  void (*v10)(void *__return_ptr, uint64_t, uint64_t);
  id v11;
  _TtC9Reminders31TTRIShowRemindersViewController *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void v18[3];
  uint64_t v19;

  uint64_t v5 = sub_10003B754(&qword_10079AF90);
  __chkstk_darwin(v5 - 8);
  objc_super v7 = (char *)&v18[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v10 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v8 + 728);
  uint64_t v11 = a3;
  v12 = self;
  v10(v18, ObjectType, v8);
  if (v19)
  {
    id v13 = *sub_100038D28(v18, v19);
    uint64_t v14 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v7, 1, 1, v14);
    type metadata accessor for MainActor();
    swift_retain();
    v15 = static MainActor.shared.getter();
    v16 = (void *)swift_allocObject();
    _OWORD v16[2] = v15;
    v16[3] = &protocol witness table for MainActor;
    v16[4] = v13;
    sub_1000286A4((uint64_t)v7, (uint64_t)&unk_10079BB28, (uint64_t)v16);
    swift_release();
    sub_100038CD8((uint64_t)v18);
  }
  else
  {
    sub_10003B6F8((uint64_t)v18, (uint64_t *)&unk_10079BB18);
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  void (*v7)(void *__return_ptr, uint64_t, uint64_t);
  id v8;
  _TtC9Reminders31TTRIShowRemindersViewController *v9;
  void v10[3];
  uint64_t v11;

  uint64_t v5 = *(void *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  uint64_t ObjectType = swift_getObjectType();
  objc_super v7 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v5 + 728);
  uint64_t v8 = a3;
  uint64_t v9 = self;
  v7(v10, ObjectType, v5);
  if (v11)
  {
    sub_100038D28(v10, v11);
    sub_10017E918();
    sub_100038CD8((uint64_t)v10);
  }
  else
  {
    sub_10003B6F8((uint64_t)v10, (uint64_t *)&unk_10079BB18);
  }
}

@end
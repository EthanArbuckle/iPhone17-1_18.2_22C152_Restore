@interface TTRIReminderLocationPickerViewController
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (MKMapView)mapView;
- (NSLayoutConstraint)contentViewMinHeightConstraint;
- (UIBarButtonItem)doneButton;
- (UISegmentedControl)alarmProximitySegmentedControl;
- (UITableView)tableView;
- (UIView)bottomControlsContainerView;
- (UIView)contentView;
- (UIView)mapAndDragRadiusContainerView;
- (_TtC15RemindersUICore40TTRIReminderLocationPickerViewController)initWithCoder:(id)a3;
- (_TtC15RemindersUICore40TTRIReminderLocationPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)alarmProximitySegmentedControlDidChange:(id)a3;
- (void)dealloc;
- (void)didTapCancel:(id)a3;
- (void)didTapDone:(id)a3;
- (void)mapDragRadiusView:(id)a3 didUpdateRegion:(id)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)setAlarmProximitySegmentedControl:(id)a3;
- (void)setBottomControlsContainerView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewMinHeightConstraint:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setMapAndDragRadiusContainerView:(id)a3;
- (void)setMapView:(id)a3;
- (void)setTableView:(id)a3;
- (void)stopHoldingCurrentContentViewHeight;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation TTRIReminderLocationPickerViewController

- (_TtC15RemindersUICore40TTRIReminderLocationPickerViewController)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore40TTRIReminderLocationPickerViewController *)sub_1B93F3E5C(a3);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_keyboardHideDeferredHandlingTimer);
  v5 = self;
  if (v4) {
    objc_msgSend(v4, sel_invalidate);
  }
  v6.receiver = self;
  v6.super_class = ObjectType;
  [(TTRIReminderLocationPickerViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_contentViewMinHeightConstraint));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_searchBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_mapDragRadiusView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_dragViewCircleColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_dragViewHandleColor));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_keyboardHideDeferredHandlingTimer));

  swift_unknownObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B93F4320();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1B93F4A40(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1B93F5C34(a3);
}

- (void)willMoveToParentViewController:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9AD960);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17.receiver = self;
  v17.super_class = ObjectType;
  v9 = self;
  id v10 = a3;
  [(TTRIReminderLocationPickerViewController *)&v17 willMoveToParentViewController:v10];
  if (v10)
  {
  }
  else
  {
    uint64_t v11 = *(uint64_t *)((char *)&v9->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_presenter);
    if (qword_1E9EFA5A0 != -1) {
      swift_once();
    }
    uint64_t v12 = sub_1B996D300();
    __swift_project_value_buffer(v12, (uint64_t)qword_1E9F00570);
    sub_1B90C4268(MEMORY[0x1E4FBC860]);
    sub_1B984E260();
    swift_bridgeObjectRelease();
    uint64_t v13 = sub_1B996F0D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
    sub_1B996F080();
    swift_retain();
    uint64_t v14 = sub_1B996F070();
    uint64_t v15 = swift_allocObject();
    uint64_t v16 = MEMORY[0x1E4FBCFD8];
    *(void *)(v15 + 16) = v14;
    *(void *)(v15 + 24) = v16;
    *(void *)(v15 + 32) = v11;
    *(unsigned char *)(v15 + 40) = 0;
    sub_1B91147FC((uint64_t)v8, (uint64_t)&unk_1E9F008D0, v15);

    swift_release();
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  [(TTRIReminderLocationPickerViewController *)&v6 viewWillDisappear:v3];
  v5 = *(void **)&v4[OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_searchBar];
  if (v5)
  {
    objc_msgSend(v5, sel_resignFirstResponder, v6.receiver, v6.super_class);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(TTRIReminderLocationPickerViewController *)&v3 viewDidLayoutSubviews];
  sub_1B93F6384(0, 0.0);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_viewModel))[2];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B996AD50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996ACB0();
  id v10 = a3;
  uint64_t v11 = self;
  uint64_t v12 = (void *)sub_1B93F664C((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1B996AD50();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996ACB0();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_1B93F96FC(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B996AD50();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B996ACB0();
  id v10 = a3;
  uint64_t v11 = self;
  sub_1B93F6A94(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6 = sub_1B996E9F0();
  unint64_t v8 = v7;
  id v9 = a3;
  id v10 = self;
  sub_1B93EB19C(v6, v8);

  swift_bridgeObjectRelease();
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B93F99C8();
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v7 = (id)MEMORY[0x1BA9DB180]((char *)self+ OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_bottomControlsContainerView, a2);
  if (v7)
  {
    id v5 = a3;
    uint64_t v6 = self;
    objc_msgSend(v7, sel_setAccessibilityElementsHidden_, 0);
  }
  else
  {
    __break(1u);
  }
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  sub_1B93F9ACC();
  unint64_t v8 = v7;

  swift_unknownObjectRelease();

  return v8;
}

- (void)mapView:(id)a3 regionWillChangeAnimated:(BOOL)a4
{
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
}

- (void)mapDragRadiusView:(id)a3 didUpdateRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = self;
  sub_1B93EC290(v7);
}

- (UIView)contentView
{
  id v2 = (void *)MEMORY[0x1BA9DB180]((char *)self + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_contentView, a2);

  return (UIView *)v2;
}

- (void)setContentView:(id)a3
{
}

- (NSLayoutConstraint)contentViewMinHeightConstraint
{
  return (NSLayoutConstraint *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                       + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_contentViewMinHeightConstraint));
}

- (void)setContentViewMinHeightConstraint:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_contentViewMinHeightConstraint);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_contentViewMinHeightConstraint) = (Class)a3;
  id v3 = a3;
}

- (UITableView)tableView
{
  id v2 = (void *)MEMORY[0x1BA9DB180]((char *)self + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_tableView, a2);

  return (UITableView *)v2;
}

- (void)setTableView:(id)a3
{
}

- (UIView)bottomControlsContainerView
{
  id v2 = (void *)MEMORY[0x1BA9DB180]((char *)self+ OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_bottomControlsContainerView, a2);

  return (UIView *)v2;
}

- (void)setBottomControlsContainerView:(id)a3
{
}

- (UIView)mapAndDragRadiusContainerView
{
  id v2 = (void *)MEMORY[0x1BA9DB180]((char *)self+ OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_mapAndDragRadiusContainerView, a2);

  return (UIView *)v2;
}

- (void)setMapAndDragRadiusContainerView:(id)a3
{
}

- (MKMapView)mapView
{
  id v2 = (void *)MEMORY[0x1BA9DB180]((char *)self + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_mapView, a2);

  return (MKMapView *)v2;
}

- (void)setMapView:(id)a3
{
}

- (UISegmentedControl)alarmProximitySegmentedControl
{
  id v2 = (void *)MEMORY[0x1BA9DB180]((char *)self+ OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_alarmProximitySegmentedControl, a2);

  return (UISegmentedControl *)v2;
}

- (void)setAlarmProximitySegmentedControl:(id)a3
{
}

- (UIBarButtonItem)doneButton
{
  id v2 = (void *)MEMORY[0x1BA9DB180]((char *)self + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_doneButton, a2);

  return (UIBarButtonItem *)v2;
}

- (void)setDoneButton:(id)a3
{
}

- (void)didTapCancel:(id)a3
{
}

- (void)didTapDone:(id)a3
{
}

- (void)alarmProximitySegmentedControlDidChange:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1B9970200();
  swift_unknownObjectRelease();
  sub_1B93F73D8();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (void)stopHoldingCurrentContentViewHeight
{
  id v2 = self;
  sub_1B93F7D68();
}

- (_TtC15RemindersUICore40TTRIReminderLocationPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15RemindersUICore40TTRIReminderLocationPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  char v6 = sub_1B93EC58C();

  return (v6 & 1) == 0;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9AD960);
  MEMORY[0x1F4188790](v5 - 8);
  id v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC15RemindersUICore40TTRIReminderLocationPickerViewController_presenter);
  uint64_t v9 = qword_1E9EFA5A0;
  id v10 = a3;
  uint64_t v11 = self;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1B996D300();
  __swift_project_value_buffer(v12, (uint64_t)qword_1E9F00570);
  sub_1B90C4268(MEMORY[0x1E4FBC860]);
  sub_1B984E260();
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_1B996F0D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 1, 1, v13);
  sub_1B996F080();
  swift_retain();
  uint64_t v14 = sub_1B996F070();
  uint64_t v15 = swift_allocObject();
  uint64_t v16 = MEMORY[0x1E4FBCFD8];
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v16;
  *(void *)(v15 + 32) = v8;
  *(unsigned char *)(v15 + 40) = 1;
  sub_1B91147FC((uint64_t)v7, (uint64_t)&unk_1E9F008A8, v15);

  swift_release();
}

@end
@interface QuickScheduleOverrideViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (_TtC13SleepHealthUI35QuickScheduleOverrideViewController)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI35QuickScheduleOverrideViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC13SleepHealthUI35QuickScheduleOverrideViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)cancelButtonPressed;
- (void)handleAppWillResignActive;
- (void)handleSignificantTimeChange;
- (void)saveButtonPressed;
- (void)scheduleOccurrenceAlarmVolumeEditingDidEnd:(id)a3;
- (void)sleepScheduleComponentsEditViewEditingDidChange:(id)a3;
- (void)sleepScheduleComponentsEditViewEditingDidEnd:(id)a3;
- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tonePickerViewController:(id)a3 didDismissVibrationPickerViewController:(id)a4;
- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4;
- (void)tonePickerViewController:(id)a3 willPresentVibrationPickerViewController:(id)a4;
- (void)vibrationPickerViewController:(id)a3 selectedVibrationWithIdentifier:(id)a4;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation QuickScheduleOverrideViewController

- (_TtC13SleepHealthUI35QuickScheduleOverrideViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD8BD9A4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD8B4854();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for QuickScheduleOverrideViewController();
  id v4 = v5.receiver;
  [(QuickScheduleOverrideViewController *)&v5 viewWillDisappear:v3];
  sub_1AD98B9F4();
}

- (void)handleAppWillResignActive
{
  v2 = self;
  sub_1AD8B67B0();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1AD9DCF10();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8, v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9DCEE0();
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  sub_1AD8B6AAC(v14);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AD9DCF10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9DCEE0();
  id v11 = a3;
  v12 = self;
  sub_1AD8BDAE0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AD9DCF10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9DCEE0();
  id v11 = a3;
  v12 = self;
  sub_1AD8BDCD8();
  LOBYTE(self) = v13;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return self & 1;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = sub_1AD8B72F4(v6, a4);

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = sub_1AD8BE0A4(a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  double v8 = sub_1AD8BE2FC(a4);

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  double v8 = sub_1AD8BE564(a4);

  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_dataSource);
  if (!v4) {
    return 10.0;
  }
  id v7 = a3;
  double v8 = self;
  id v9 = v4;
  sub_1AD8BDE78(a4);
  uint64_t v11 = v10;

  if (v11)
  {
    swift_bridgeObjectRelease();
    if (qword_1E9A48F40 != -1) {
      swift_once();
    }
    double v12 = *(double *)&qword_1E9A4C468;
  }
  else
  {
    double v12 = 10.0;
  }

  return v12;
}

- (_TtC13SleepHealthUI35QuickScheduleOverrideViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC13SleepHealthUI35QuickScheduleOverrideViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13SleepHealthUI35QuickScheduleOverrideViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC13SleepHealthUI35QuickScheduleOverrideViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_sleepScheduleProvider);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1AD843DF4((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_delegate);
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_dataSource);
}

- (void)handleSignificantTimeChange
{
  v2 = self;
  sub_1AD8B7FDC();
}

- (void)saveButtonPressed
{
  v2 = self;
  sub_1AD8B8394();
}

- (void)cancelButtonPressed
{
  BOOL v3 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_delegate;
  uint64_t v4 = MEMORY[0x1B3E6D270]((char *)self + OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_delegate, a2);
  if (v4)
  {
    objc_super v5 = (void *)v4;
    uint64_t v6 = *((void *)v3 + 1);
    id v7 = self;
    sub_1AD8BAAD0(v5, v6, (uint64_t)v7);
    *((void *)v3 + 1) = 0;
    swift_unknownObjectWeakAssign();

    swift_unknownObjectRelease();
  }
}

- (void)sleepScheduleComponentsEditViewEditingDidChange:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1AD8BAB64((uint64_t)v4);
}

- (void)sleepScheduleComponentsEditViewEditingDidEnd:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1AD8BAF3C((uint64_t)v4);
}

- (void)scheduleOccurrenceAlarmVolumeEditingDidEnd:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1AD8BBB38(v4);
}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  id v7 = a3;
  double v8 = self;
  sub_1AD8BBDE4((uint64_t)a3, a4);
}

- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4
{
}

- (void)tonePickerViewController:(id)a3 willPresentVibrationPickerViewController:(id)a4
{
  if (a4)
  {
    uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_vibrationPickerStyleProvider);
    id v7 = a3;
    id v9 = self;
    id v8 = a4;
    objc_msgSend(v8, sel_setStyleProvider_, v6);
    objc_msgSend(v8, sel_setShowsEditButtonInNavigationBar_, 1);
    objc_msgSend(v8, sel_setDelegate_, v9);
  }
  else
  {
    __break(1u);
  }
}

- (void)tonePickerViewController:(id)a3 didDismissVibrationPickerViewController:(id)a4
{
  if (a4) {
    objc_msgSend(a4, sel_setDelegate_, self);
  }
  else {
    __break(1u);
  }
}

- (void)vibrationPickerViewController:(id)a3 selectedVibrationWithIdentifier:(id)a4
{
}

@end
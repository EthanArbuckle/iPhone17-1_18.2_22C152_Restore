@interface ScheduleOccurrenceViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)cancelButtonPressed;
- (void)handleAppWillResignActive;
- (void)handleLocaleDidChange;
- (void)handleSignificantTimeChange;
- (void)restoreUserActivityState:(id)a3;
- (void)saveButtonPressed;
- (void)scheduleDayPickerDidChange:(id)a3;
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

@implementation ScheduleOccurrenceViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD839394();
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1AD83B5E0(a3);
}

- (void)handleAppWillResignActive
{
  v2 = self;
  sub_1AD83B9E4();
}

- (void)restoreUserActivityState:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AD83BBC8((uint64_t)v4);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AD9DCF10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9DCEE0();
  id v11 = a3;
  v12 = self;
  sub_1AD841E0C();
  LOBYTE(self) = v13;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return self & 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AD9DCF10();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD9DCEE0();
  id v11 = a3;
  v12 = self;
  sub_1AD83BE3C(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
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
  uint64_t v15 = self;
  sub_1AD841F1C(v14);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = sub_1AD83C704(v6, a4);

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = sub_1AD842318(a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  double v8 = sub_1AD8424F0(a4);

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  double v8 = sub_1AD8426BC(a4);

  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  double v8 = sub_1AD842888(a4);

  return v8;
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
  sub_1AD843EC0((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI32ScheduleOccurrenceViewController_sleepScheduleProvider, &qword_1E9A491D0, (uint64_t)&unk_1E9A491D8, (uint64_t)&protocol descriptor for SleepScheduleProviding);
  sub_1AD843DF4((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI32ScheduleOccurrenceViewController_delegate);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC13SleepHealthUI32ScheduleOccurrenceViewController_dataSource);
}

- (void)handleSignificantTimeChange
{
  v2 = self;
  sub_1AD83D118("[%{public}s] Significant time changed");
}

- (void)handleLocaleDidChange
{
  v2 = self;
  sub_1AD83D308();
}

- (void)cancelButtonPressed
{
  v2 = self;
  sub_1AD83D59C();
}

- (void)sleepScheduleComponentsEditViewEditingDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  ScheduleOccurrenceViewController.sleepScheduleComponentsEditViewEditingDidChange(_:)((uint64_t)v4);
}

- (void)sleepScheduleComponentsEditViewEditingDidEnd:(id)a3
{
  id v4 = a3;
  v5 = self;
  ScheduleOccurrenceViewController.sleepScheduleComponentsEditViewEditingDidEnd(_:)((uint64_t)v4);
}

- (void)scheduleDayPickerDidChange:(id)a3
{
  v5 = (char *)a3 + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_model;
  swift_beginAccess();
  uint64_t v6 = *((void *)v5 + 2);
  id v7 = a3;
  double v8 = self;
  ScheduleOccurrenceEditModel.weekdays.setter(v6);
}

- (void)scheduleOccurrenceAlarmVolumeEditingDidEnd:(id)a3
{
  id v4 = (UISlider *)a3;
  v5 = self;
  ScheduleOccurrenceViewController.scheduleOccurrenceAlarmVolumeEditingDidEnd(_:)(v4);
}

- (void)switchCellValueChanged:(id)a3 value:(BOOL)a4
{
  if (a3)
  {
    type metadata accessor for ScheduleOccurrenceAlarmEnabledTableViewCell();
    if (swift_dynamicCastClass())
    {
      self;
      id v6 = a3;
      ScheduleOccurrenceEditModel.alarmEnabled.setter(a4);
      sub_1AD98B9F4();
    }
    else
    {
      type metadata accessor for ScheduleOccurrenceAlarmSnoozeTableViewCell();
      if (!swift_dynamicCastClass()) {
        return;
      }
      id v7 = self;
      id v8 = a3;
      ScheduleOccurrenceEditModel.allowsSnooze.setter(a4);
    }
  }
}

- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4
{
}

- (void)tonePickerViewController:(id)a3 willPresentVibrationPickerViewController:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    id v8 = self;
    id v7 = a4;
    objc_msgSend(v7, sel_setShowsEditButtonInNavigationBar_, 1);
    objc_msgSend(v7, sel_setDelegate_, v8);
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

- (void)saveButtonPressed
{
  v2 = self;
  ScheduleOccurrenceViewController.saveButtonPressed()();
}

@end
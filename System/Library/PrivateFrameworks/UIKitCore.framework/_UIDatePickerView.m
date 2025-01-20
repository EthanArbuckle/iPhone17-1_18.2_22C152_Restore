@interface _UIDatePickerView
- (BOOL)_allowsZeroTimeInterval;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth;
- (BOOL)_isTimeIntervalMode;
- (BOOL)_shouldInstallTimeInputLabelForDatePickerMode:(int64_t)a3;
- (BOOL)_showingDate;
- (BOOL)_updateDateOrTime;
- (BOOL)_updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:(int64_t)a3;
- (BOOL)_usesBlackChrome;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)hasDefaultSize;
- (BOOL)highlightsToday;
- (BOOL)passthroughInteractionEnabled;
- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5;
- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3;
- (BOOL)staggerTimeIntervals;
- (BOOL)timeLabel:(id)a3 didReceiveText:(id)a4;
- (BOOL)timeLabelCanBecomeFirstResponder:(id)a3;
- (BOOL)timeLabelShouldSuppressSoftwareKeyboard:(id)a3;
- (BOOL)wheelsTimeLabelShouldReceiveInteraction:(id)a3;
- (CGRect)_currentTimeInputLabelFrame;
- (UIDatePicker)datePicker;
- (UIEdgeInsets)appliedInsetsToEdgeOfContent;
- (UIFont)_hrMinFont;
- (_UIControlEventsGestureRecognizer)controlEventsGestureRecognizer;
- (_UIDatePickerDataModel)data;
- (_UIDatePickerNumericKeyboardViewController)numericKeyboardViewController;
- (_UIDatePickerView)initWithFrame:(CGRect)a3;
- (_UIDatePickerWheelsTimeLabel)timeInputLabel;
- (double)_tableRowHeight;
- (double)contentWidth;
- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4;
- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4;
- (double)timeInterval;
- (id)_componentsSelectedAfterEnforcingValidityOfComponents:(id)a3 withLastManipulatedComponent:(int64_t)a4;
- (id)_contentViewForSizingLabelForPositioningInComponent:(int64_t)a3;
- (id)_currentTimeFormat;
- (id)_existingLabelForCalendarUnit:(unint64_t)a3;
- (id)_hoursStringForHour:(int64_t)a3;
- (id)_labelForCalendarUnit:(unint64_t)a3 createIfNecessary:(BOOL)a4;
- (id)_labelTextForCalendarUnit:(unint64_t)a3;
- (id)_makeNewCalendarUnitLabel;
- (id)_minutesStringForHour:(int64_t)a3 minutes:(int64_t)a4;
- (id)_selectedTextForCalendarUnit:(unint64_t)a3;
- (id)_viewForSelectedRowInComponent:(int64_t)a3;
- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6;
- (int)_selectedHourForColumn:(int)a3;
- (int)_selectedMinuteForColumn:(int)a3;
- (int64_t)_amPmValue;
- (int64_t)_selectionBarRowInComponent:(int64_t)a3;
- (int64_t)datePickerMode;
- (int64_t)datePickerStyle;
- (int64_t)keyboardTypeForTimeLabel:(id)a3;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (unint64_t)_permittedArrowDirectionForKeyboardPopover;
- (void)_disableCustomKeyboardIfNecessary;
- (void)_dismissManualKeyboard;
- (void)_doneLoadingDateOrTime;
- (void)_enableCustomKeyboardIfNecessary;
- (void)_fadeLabelForCalendarUnit:(unint64_t)a3 toText:(id)a4 animated:(BOOL)a5;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_hardwareKeyboardAvailabilityChanged:(id)a3;
- (void)_hidePickerViewSelectionBarForTimeInputLabel:(BOOL)a3;
- (void)_installTimeInputLabelIfNeeded;
- (void)_loadDateAnimated:(BOOL)a3;
- (void)_positionLabel:(id)a3 forCalendarUnit:(unint64_t)a4 relativeTo:(id)a5 order:(int64_t)a6;
- (void)_removeUnitLabels;
- (void)_selectRow:(int64_t)a3 inComponent:(int64_t)a4 animated:(BOOL)a5 notify:(BOOL)a6;
- (void)_setAllowsZeroTimeInterval:(BOOL)a3;
- (void)_setHidesLabels:(BOOL)a3;
- (void)_setLabel:(id)a3 forCalendarUnit:(unint64_t)a4 animated:(BOOL)a5;
- (void)_setMode:(id)a3;
- (void)_setTextColor:(id)a3;
- (void)_setUsesBlackChrome:(BOOL)a3;
- (void)_uninstallTimeInputLabelIfNeeded;
- (void)_updateDateForNewDateRange;
- (void)_updateEnabledCellsIncludingWMDCells:(BOOL)a3;
- (void)_updateLabelColors;
- (void)_updateLabels:(BOOL)a3;
- (void)_updateLocaleTimeZoneOrCalendar;
- (void)_updateTextColorForCalendarUnitLabel:(id)a3;
- (void)_updateTimeInputLabelConfiguration;
- (void)_updateTimeInputLabelPosition;
- (void)_updateWheelsForUpdatedTextInputWithForcedUpdate:(BOOL)a3;
- (void)_updateWheelsLabelForCurrentDateComponents;
- (void)controlEventsGestureRecognizer:(id)a3 recognizedControlEvent:(unint64_t)a4 withEvent:(id)a5;
- (void)dealloc;
- (void)didChangeDateFrom:(id)a3 animated:(BOOL)a4;
- (void)didChangeMinuteInterval;
- (void)didChangeMode;
- (void)didChangeRoundsToMinuteInterval;
- (void)didChangeToday;
- (void)layoutSubviews;
- (void)pickerTableView:(id)a3 didChangeSelectionBarRowFrom:(int64_t)a4 to:(int64_t)a5;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setData:(id)a3;
- (void)setDatePicker:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlightsToday:(BOOL)a3;
- (void)setPassthroughInteractionEnabled:(BOOL)a3;
- (void)setTimeInterval:(double)a3;
- (void)timeLabel:(id)a3 didUpdateText:(id)a4;
- (void)timeLabelDidBecomeFirstResponder:(id)a3;
- (void)timeLabelDidBeginEditing:(id)a3;
- (void)timeLabelDidEndEditing:(id)a3;
- (void)timeLabelDidFailToBecomeFirstResponder:(id)a3;
- (void)timeLabelDidResignFirstResponder:(id)a3;
- (void)timeLabelWillBecomeFirstResponder:(id)a3;
- (void)wheelsTimeLabel:(id)a3 didChangeVisibility:(BOOL)a4;
- (void)willMoveToSuperview:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIDatePickerView

- (_UIDatePickerView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)_UIDatePickerView;
  v3 = -[UIPickerView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->super._pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&v3->super._pickerViewFlags & 0xFFFFF5FF | 0x200);
    *(_WORD *)&v3->_datePickerFlags |= 4u;
    id WeakRetained = objc_loadWeakRetained((id *)&v3->_datePicker);
    if ([WeakRetained _selectionBarIgnoresInset]) {
      int v6 = 0x20000;
    }
    else {
      int v6 = 0;
    }
    v4->super._pickerViewFlags = ($76755D4DEA27573399A7BF6CD45D6B19)(*(_DWORD *)&v4->super._pickerViewFlags & 0xFFFDFFFF | v6);

    uint64_t v7 = +[_UIDatePickerMode _datePickerModeWithMode:2 datePickerView:v4];
    mode = v4->_mode;
    v4->_mode = (_UIDatePickerMode *)v7;

    v4->_expectedAMPM = -1;
    v15.receiver = v4;
    v15.super_class = (Class)_UIDatePickerView;
    [(UIPickerView *)&v15 setDelegate:v4];
    v14.receiver = v4;
    v14.super_class = (Class)_UIDatePickerView;
    [(UIPickerView *)&v14 setDataSource:v4];
    v9 = +[UIDevice currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 addObserver:v4 selector:sel__hardwareKeyboardAvailabilityChanged_ name:@"_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification" object:0];
    }
    [(_UIDatePickerView *)v4 _updateTimeInputLabelConfiguration];
    v12 = v4;
  }

  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIDatePickerView;
  [(UIPickerView *)&v4 dealloc];
}

- (void)willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerView;
  -[UIView willMoveToWindow:](&v6, sel_willMoveToWindow_);
  if (!a3)
  {
    [(_UIDatePickerView *)self _disableCustomKeyboardIfNecessary];
    v5 = [(_UIDatePickerView *)self timeInputLabel];
    [v5 resignFirstResponder];
  }
}

- (void)willMoveToSuperview:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerView;
  -[UIView willMoveToSuperview:](&v6, sel_willMoveToSuperview_);
  if (!a3)
  {
    [(_UIDatePickerView *)self _disableCustomKeyboardIfNecessary];
    v5 = [(_UIDatePickerView *)self timeInputLabel];
    [v5 resignFirstResponder];
  }
}

- (void)_enableCustomKeyboardIfNecessary
{
  __int16 datePickerFlags = (__int16)self->_datePickerFlags;
  if ((datePickerFlags & 0x40) == 0)
  {
    *(_WORD *)&self->___int16 datePickerFlags = datePickerFlags | 0x40;
    id v5 = [(UIView *)self _window];
    v3 = [v5 windowScene];
    objc_super v4 = [v3 keyboardSceneDelegate];
    [v4 setAutomaticAppearanceEnabled:0];
  }
}

- (void)_disableCustomKeyboardIfNecessary
{
  __int16 datePickerFlags = (__int16)self->_datePickerFlags;
  if ((datePickerFlags & 0x40) != 0)
  {
    *(_WORD *)&self->___int16 datePickerFlags = datePickerFlags & 0xFFBF;
    id v5 = [(UIView *)self _window];
    v3 = [v5 windowScene];
    objc_super v4 = [v3 keyboardSceneDelegate];
    [v4 setAutomaticAppearanceEnabled:1];
  }
}

- (void)didChangeToday
{
  [(_UIDatePickerMode *)self->_mode setTodayDateComponents:0];
  [(UIPickerView *)self reloadAllPickerPieces];
  [(_UIDatePickerView *)self _updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:0x7FFFFFFFFFFFFFFFLL];
}

- (double)_tableRowHeight
{
  [(_UIDatePickerMode *)self->_mode rowHeight];
  return result;
}

- (void)_doneLoadingDateOrTime
{
  *(_WORD *)&self->_datePickerFlags &= ~2u;
  [(_UIDatePickerView *)self _updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:0x7FFFFFFFFFFFFFFFLL];
}

- (BOOL)_showingDate
{
  return [(_UIDatePickerMode *)self->_mode datePickerMode] == 2
      || [(_UIDatePickerMode *)self->_mode datePickerMode] == 1;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return 1;
}

- (int64_t)datePickerStyle
{
  return 1;
}

- (void)setData:(id)a3
{
  id v50 = a3;
  id v5 = self->_data;
  objc_storeStrong((id *)&self->_data, a3);
  int64_t v6 = [(_UIDatePickerMode *)self->_mode datePickerMode];
  if (v6 != [v50 datePickerMode]) {
    [(_UIDatePickerView *)self didChangeMode];
  }
  uint64_t v7 = [(_UIDatePickerDataModel *)v5 effectiveLocale];
  v8 = [v50 effectiveLocale];
  id v9 = v7;
  id v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {
  }
  else
  {
    if (v9) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    v13 = v10;
    id v14 = v9;
    if (v12) {
      goto LABEL_27;
    }
    int v15 = [v9 isEqual:v10];

    if (!v15) {
      goto LABEL_28;
    }
  }
  objc_super v16 = [(_UIDatePickerDataModel *)v5 timeZone];
  v17 = [v50 timeZone];
  id v14 = v16;
  id v18 = v17;
  v13 = v18;
  if (v14 == v18)
  {
  }
  else
  {
    if (v14) {
      BOOL v19 = v18 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    v20 = v18;
    id v21 = v14;
    if (v19) {
      goto LABEL_26;
    }
    int v22 = [v14 isEqual:v18];

    if (!v22) {
      goto LABEL_27;
    }
  }
  v23 = [(_UIDatePickerDataModel *)v5 effectiveCalendar];
  v24 = [v50 effectiveCalendar];
  id v21 = v23;
  id v25 = v24;
  if (v21 == v25)
  {

    goto LABEL_30;
  }
  v20 = v25;
  if (!v21 || !v25)
  {

LABEL_26:
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  char v49 = [v21 isEqual:v25];

  if ((v49 & 1) == 0) {
LABEL_29:
  }
    [(_UIDatePickerView *)self _updateLocaleTimeZoneOrCalendar];
LABEL_30:
  uint64_t v26 = [(_UIDatePickerDataModel *)v5 date];
  if (!v26) {
    goto LABEL_40;
  }
  v27 = (void *)v26;
  v28 = [(_UIDatePickerDataModel *)v5 date];
  v29 = [v50 date];
  id v30 = v28;
  id v31 = v29;
  if (v30 == v31)
  {

LABEL_39:
    goto LABEL_40;
  }
  v32 = v31;
  if (!v30 || !v31)
  {

    goto LABEL_38;
  }
  char v33 = [v30 isEqual:v31];

  if ((v33 & 1) == 0)
  {
LABEL_38:
    v27 = [(_UIDatePickerDataModel *)v5 date];
    [(_UIDatePickerView *)self didChangeDateFrom:v27 animated:0];
    goto LABEL_39;
  }
LABEL_40:
  v34 = [(_UIDatePickerDataModel *)v5 minimumDate];
  v35 = [v50 minimumDate];
  id v36 = v34;
  id v37 = v35;
  v38 = v37;
  if (v36 == v37)
  {
  }
  else
  {
    v39 = v37;
    id v40 = v36;
    if (!v36) {
      goto LABEL_53;
    }
    v39 = v37;
    id v40 = v36;
    if (!v37) {
      goto LABEL_53;
    }
    int v41 = [v36 isEqual:v37];

    if (!v41) {
      goto LABEL_54;
    }
  }
  v42 = [(_UIDatePickerDataModel *)v5 maximumDate];
  v43 = [v50 maximumDate];
  id v40 = v42;
  id v44 = v43;
  if (v40 == v44)
  {

    goto LABEL_56;
  }
  v39 = v44;
  if (!v40 || !v44)
  {

LABEL_53:
LABEL_54:

    goto LABEL_55;
  }
  char v45 = [v40 isEqual:v44];

  if ((v45 & 1) == 0) {
LABEL_55:
  }
    [(_UIDatePickerView *)self _updateDateForNewDateRange];
LABEL_56:
  int64_t v46 = [(_UIDatePickerMode *)self->_mode minuteInterval];
  if (v46 != [v50 minuteInterval]) {
    [(_UIDatePickerView *)self didChangeMinuteInterval];
  }
  timeInputLabel = self->_timeInputLabel;
  if (timeInputLabel)
  {
    BOOL v48 = [(_UIDatePickerCalendarTimeLabel *)timeInputLabel roundsToMinuteInterval];
    if (v48 != [(_UIDatePickerDataModel *)self->_data roundsToMinuteInterval]) {
      [(_UIDatePickerView *)self didChangeRoundsToMinuteInterval];
    }
  }
}

- (void)_updateLocaleTimeZoneOrCalendar
{
  [(_UIDatePickerMode *)self->_mode noteCalendarChanged];
  [(_UIDatePickerMode *)self->_mode updateDateForNewDateRange];
  [(_UIDatePickerView *)self _removeUnitLabels];
  [(UIPickerView *)self reloadAllPickerPieces];
  [(_UIDatePickerView *)self didChangeDateFrom:0 animated:0];
  v3 = [(_UIDatePickerView *)self timeInputLabel];

  if (v3)
  {
    id v5 = [(_UIDatePickerView *)self _currentTimeFormat];
    objc_super v4 = [(_UIDatePickerView *)self timeInputLabel];
    [v4 setTimeFormat:v5];
  }
}

- (void)didChangeDateFrom:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  self->_expectedAMPM = -1;
  id v15 = v6;
  if ((*(unsigned char *)&self->_datePickerFlags & 2) != 0)
  {
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__doneLoadingDateOrTime object:0];
    id v6 = v15;
  }
  if (v6 && [(_UIDatePickerMode *)self->_mode datePickerMode] == 2)
  {
    uint64_t v7 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
    v8 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
    id v9 = [v7 components:16 fromDate:v15 toDate:v8 options:0];

    uint64_t v10 = [v9 day];
    if (v10 >= 0) {
      unint64_t v11 = v10;
    }
    else {
      unint64_t v11 = -v10;
    }

    if (v4) {
      __int16 v12 = 2;
    }
    else {
      __int16 v12 = 0;
    }
    __int16 v13 = *(_WORD *)&self->_datePickerFlags & 0xFFFD;
    *(_WORD *)&self->___int16 datePickerFlags = v13 | v12;
    if (v11 >= 0x78)
    {
      *(_WORD *)&self->___int16 datePickerFlags = v13;
      [(UIPickerView *)self reloadAllComponents];
    }
  }
  else
  {
    if (v4) {
      __int16 v14 = 2;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)&self->___int16 datePickerFlags = *(_WORD *)&self->_datePickerFlags & 0xFFFD | v14;
  }
  [(_UIDatePickerView *)self _loadDateAnimated:v4];
  if ((*(_WORD *)&self->_datePickerFlags & 2) != 0)
  {
    [(UIPickerView *)self scrollAnimationDuration];
    -[_UIDatePickerView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__doneLoadingDateOrTime, 0);
    [(_UIDatePickerView *)self _updateEnabledCellsIncludingWMDCells:0];
  }
  else
  {
    [(_UIDatePickerView *)self _updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:0x7FFFFFFFFFFFFFFFLL];
  }
}

- (void)_updateDateForNewDateRange
{
  [(_UIDatePickerMode *)self->_mode updateDateForNewDateRange];
  [(_UIDatePickerView *)self _updateEnabledCellsIncludingWMDCells:1];
  [(_UIDatePickerView *)self _updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:0x7FFFFFFFFFFFFFFFLL];
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return [(_UIDatePickerMode *)self->_mode numberOfComponents];
}

- (BOOL)_isTimeIntervalMode
{
  return [(_UIDatePickerMode *)self->_mode isTimeIntervalMode];
}

- (void)_setMode:(id)a3
{
  id v10 = a3;
  id v5 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
  p_mode = &self->_mode;
  int64_t v7 = [(_UIDatePickerMode *)self->_mode displayedCalendarUnits];
  if ((v7 & [v10 displayedCalendarUnits] & 0xFFFFFFFFFFFEFFFFLL) == 0)
  {

    id v5 = 0;
  }
  double v8 = 0.0;
  if ([(_UIDatePickerMode *)*p_mode isTimeIntervalMode])
  {

    [(_UIDatePickerView *)self timeInterval];
    double v8 = v9;
    id v5 = 0;
  }
  objc_storeStrong((id *)p_mode, a3);
  [(_UIDatePickerMode *)*p_mode setMinuteInterval:[(_UIDatePickerDataModel *)self->_data minuteInterval]];
  *(_WORD *)&self->___int16 datePickerFlags = *(_WORD *)&self->_datePickerFlags & 0xFFFE | ([(_UIDatePickerDataModel *)self->_data minuteInterval] > 1);
  [(_UIDatePickerCalendarTimeLabel *)self->_timeInputLabel setMinuteInterval:[(_UIDatePickerDataModel *)self->_data minuteInterval]];
  [(_UIDatePickerMode *)*p_mode updateDateForNewDateRange];
  [(UIPickerView *)self reloadAllPickerPieces];
  if ([(_UIDatePickerMode *)*p_mode isTimeIntervalMode])
  {
    [(_UIDatePickerView *)self setTimeInterval:v8];
  }
  else
  {
    [(_UIDatePickerDataModel *)self->_data setDate:v5];
    [(_UIDatePickerView *)self didChangeDateFrom:0 animated:0];
  }
  [(_UIDatePickerView *)self _updateTimeInputLabelConfiguration];
}

- (void)didChangeMode
{
  int64_t v3 = [(_UIDatePickerDataModel *)self->_data datePickerMode];
  if (v3 != [(_UIDatePickerMode *)self->_mode datePickerMode])
  {
    if ([(_UIDatePickerMode *)self->_mode isTimeIntervalMode]) {
      [(_UIDatePickerView *)self _removeUnitLabels];
    }
    id v4 = +[_UIDatePickerMode _datePickerModeWithMode:[(_UIDatePickerDataModel *)self->_data datePickerMode] datePickerView:self];
    -[_UIDatePickerDataModel setDatePickerMode:](self->_data, "setDatePickerMode:", [v4 datePickerMode]);
    [(_UIDatePickerView *)self _setMode:v4];
  }
}

- (void)didChangeMinuteInterval
{
  int64_t v3 = [(_UIDatePickerDataModel *)self->_data minuteInterval];
  [(_UIDatePickerMode *)self->_mode setMinuteInterval:v3];
  *(_WORD *)&self->___int16 datePickerFlags = *(_WORD *)&self->_datePickerFlags & 0xFFFE | (v3 > 1);
  [(_UIDatePickerCalendarTimeLabel *)self->_timeInputLabel setMinuteInterval:v3];
  if ((*(unsigned char *)&self->super._pickerViewFlags & 1) == 0) {
    [(UIPickerView *)self reloadAllComponents];
  }
  [(_UIDatePickerView *)self _loadDateAnimated:0];
  [(_UIDatePickerView *)self _updateWheelsLabelForCurrentDateComponents];
}

- (void)didChangeRoundsToMinuteInterval
{
  [(_UIDatePickerCalendarTimeLabel *)self->_timeInputLabel setRoundsToMinuteInterval:[(_UIDatePickerDataModel *)self->_data roundsToMinuteInterval]];
  [(_UIDatePickerView *)self _loadDateAnimated:0];
  [(_UIDatePickerView *)self _updateWheelsLabelForCurrentDateComponents];
}

- (void)pickerTableView:(id)a3 didChangeSelectionBarRowFrom:(int64_t)a4 to:(int64_t)a5
{
  id v27 = a3;
  int64_t v8 = [(_UIDatePickerMode *)self->_mode componentForCalendarUnit:32];
  if (![(_UIDatePickerMode *)self->_mode is24Hour])
  {
    BOOL v9 = [(_UIDatePickerMode *)self->_mode isTimeIntervalMode];
    if (a5 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0x7FFFFFFFFFFFFFFFLL && !v9 && v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v11 = [(UIPickerView *)self tableViewForColumn:v8];

      if (v11 == v27)
      {
        int64_t v12 = [(_UIDatePickerMode *)self->_mode hourForRow:a4];
        int64_t v13 = [(_UIDatePickerMode *)self->_mode hourForRow:a5];
        BOOL v14 = v12 == 11 && v13 == 12;
        if (v14 || (v12 == 12 ? (BOOL v15 = v13 == 11) : (BOOL v15 = 0), v15))
        {
          self->_expectedAMPM = [(_UIDatePickerView *)self _amPmValue] == 0;
          int64_t v16 = [(_UIDatePickerMode *)self->_mode componentForCalendarUnit:0x10000];
          [(_UIDatePickerView *)self _selectRow:self->_expectedAMPM inComponent:v16 animated:1 notify:0];
          [(_UIDatePickerMode *)self->_mode updateSelectedDateComponentsWithNewValueInComponent:v16];
        }
      }
    }
  }
  if (self->_timeInputLabel && (*(_WORD *)&self->_datePickerFlags & 0x10) == 0)
  {
    v17 = [(_UIDatePickerView *)self timeInputLabel];
    if (([v17 wheelsActive] & 1) == 0)
    {
      id v18 = self;
      uint64_t v19 = [(UIPickerView *)v18 numberOfComponents];
      if (v19 >= 1)
      {
        uint64_t v20 = v19;
        id v21 = [(UIPickerView *)v18 tableViewForColumn:0];
        if ([v21 isDragging] & 1) != 0 || (objc_msgSend(v21, "isDecelerating"))
        {

LABEL_26:
          [(_UIDatePickerWheelsTimeLabel *)self->_timeInputLabel beginEditingWheels];
          goto LABEL_35;
        }
        uint64_t v22 = 1;
        while (1)
        {
          uint64_t v23 = v22;

          if (v20 == v23) {
            break;
          }
          id v21 = [(UIPickerView *)v18 tableViewForColumn:v23];
          if (([v21 isDragging] & 1) == 0)
          {
            char v24 = [v21 isDecelerating];
            uint64_t v22 = v23 + 1;
            if ((v24 & 1) == 0) {
              continue;
            }
          }

          if (v20 > v23) {
            goto LABEL_26;
          }
          goto LABEL_35;
        }
      }
    }
LABEL_35:
    if ([(_UIDatePickerMode *)self->_mode componentForCalendarUnit:32] != 0x7FFFFFFFFFFFFFFFLL
      && ([(UIPickerView *)self tableViewForColumn:[(_UIDatePickerMode *)self->_mode componentForCalendarUnit:32]], id v25 = (id)objc_claimAutoreleasedReturnValue(), v25, v25 == v27))
    {
      [(_UIDatePickerWheelsTimeLabel *)self->_timeInputLabel updateHoursFromDatePicker:[(_UIDatePickerMode *)self->_mode valueForRow:a5 inCalendarUnit:32] wheelsChanged:1];
    }
    else if ([(_UIDatePickerMode *)self->_mode componentForCalendarUnit:64] != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v26 = [(UIPickerView *)self tableViewForColumn:[(_UIDatePickerMode *)self->_mode componentForCalendarUnit:64]];

      if (v26 == v27) {
        [(_UIDatePickerWheelsTimeLabel *)self->_timeInputLabel updateMinutesFromDatePicker:[(_UIDatePickerMode *)self->_mode valueForRow:a5 inCalendarUnit:64] wheelsChanged:1];
      }
    }
  }
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return [(_UIDatePickerMode *)self->_mode numberOfRowsInComponent:a4];
}

- (void)_loadDateAnimated:(BOOL)a3
{
  int64_t loadingDate = self->_loadingDate;
  if (loadingDate <= 0)
  {
    BOOL v4 = a3;
    self->_int64_t loadingDate = loadingDate + 1;
    mode = self->_mode;
    int64_t v7 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
    [(_UIDatePickerMode *)mode loadDate:v7 animated:v4];

    --self->_loadingDate;
  }
}

- (void)_selectRow:(int64_t)a3 inComponent:(int64_t)a4 animated:(BOOL)a5 notify:(BOOL)a6
{
  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerView;
  [(UIPickerView *)&v7 _selectRow:a3 inComponent:a4 animated:a5 notify:a6];
  if (!self->_loadingDate) {
    [(_UIDatePickerView *)self _updateEnabledCellsIncludingWMDCells:1];
  }
}

- (int)_selectedHourForColumn:(int)a3
{
  return [(_UIDatePickerMode *)self->_mode hourForRow:[(UIPickerView *)self selectedRowInComponent:a3]];
}

- (int)_selectedMinuteForColumn:(int)a3
{
  return [(_UIDatePickerMode *)self->_mode minuteForRow:[(UIPickerView *)self selectedRowInComponent:a3]];
}

- (id)_componentsSelectedAfterEnforcingValidityOfComponents:(id)a3 withLastManipulatedComponent:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(_UIDatePickerMode *)self->_mode areValidDateComponents:v6 comparingUnits:[(_UIDatePickerMode *)self->_mode displayedCalendarUnits]];
  id v8 = v6;
  BOOL v9 = v8;
  if (!v7)
  {
    BOOL v9 = [(_UIDatePickerMode *)self->_mode dateComponentsByRestrictingSelectedComponents:v8 withLastManipulatedColumn:a4];
  }
  return v9;
}

- (BOOL)_updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:(int64_t)a3
{
  if ((*(_WORD *)&self->_datePickerFlags & 2) != 0) {
    return 0;
  }
  id v5 = [(_UIDatePickerMode *)self->_mode selectedDateComponents];
  id v6 = [(_UIDatePickerView *)self _componentsSelectedAfterEnforcingValidityOfComponents:v5 withLastManipulatedComponent:a3];
  BOOL v7 = [(_UIDatePickerDataModel *)self->_data lastSelectedDateComponents];
  uint64_t v8 = [v7 era];

  uint64_t v9 = _UIDatePickerCompareDateComponents(v5, v6, [(_UIDatePickerMode *)self->_mode displayedCalendarUnits]);
  BOOL v10 = v9 != 0;
  if (v9)
  {
    [(_UIDatePickerDataModel *)self->_data setDate:0];
    id v11 = (void *)[v6 copy];
    [(_UIDatePickerDataModel *)self->_data setLastSelectedDateComponents:v11];

    [(_UIDatePickerView *)self _loadDateAnimated:1];
  }
  else
  {
    int64_t v12 = (void *)[v6 copy];
    [(_UIDatePickerDataModel *)self->_data setLastSelectedDateComponents:v12];
  }
  [(_UIDatePickerView *)self _updateEnabledCellsIncludingWMDCells:1];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v8 != [v6 era])
  {
    int64_t v13 = [(_UIDatePickerMode *)self->_mode componentForCalendarUnit:4];
    if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
      [(UIPickerView *)self reloadComponent:v13];
    }
  }

  return v10;
}

- (void)_updateLabels:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIDatePickerMode *)self->_mode isTimeIntervalMode])
  {
    uint64_t v5 = [(_UIDatePickerView *)self _selectedHourForColumn:0];
    id v7 = [(_UIDatePickerView *)self _hoursStringForHour:v5];
    [(_UIDatePickerView *)self _fadeLabelForCalendarUnit:32 toText:v7 animated:v3];
    id v6 = [(_UIDatePickerView *)self _minutesStringForHour:v5 minutes:[(_UIDatePickerView *)self _selectedMinuteForColumn:1]];
    [(_UIDatePickerView *)self _fadeLabelForCalendarUnit:64 toText:v6 animated:v3];
  }
}

- (void)_updateLabelColors
{
  if ([(_UIDatePickerMode *)self->_mode isTimeIntervalMode])
  {
    BOOL v3 = [(_UIDatePickerView *)self _labelForCalendarUnit:32 createIfNecessary:0];
    [(_UIDatePickerView *)self _updateTextColorForCalendarUnitLabel:v3];

    BOOL v4 = [(_UIDatePickerView *)self _labelForCalendarUnit:64 createIfNecessary:0];
    [(_UIDatePickerView *)self _updateTextColorForCalendarUnitLabel:v4];
  }
  mode = self->_mode;
  [(_UIDatePickerMode *)mode invalidateTodayTextColor];
}

- (void)_removeUnitLabels
{
  [(UIView *)self->_hourLabel removeFromSuperview];
  hourLabel = self->_hourLabel;
  self->_hourLabel = 0;

  [(UIView *)self->_minuteLabel removeFromSuperview];
  minuteLabel = self->_minuteLabel;
  self->_minuteLabel = 0;
}

- (void)_setTextColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDatePickerView;
  [(UIPickerView *)&v4 _setTextColor:a3];
  [(_UIDatePickerView *)self _updateLabelColors];
}

- (id)_labelForCalendarUnit:(unint64_t)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(_UIDatePickerMode *)self->_mode isTimeIntervalMode]) {
    goto LABEL_9;
  }
  if (a3 == 64)
  {
    p_minuteLabel = &self->_minuteLabel;
    minuteLabel = self->_minuteLabel;
    if (minuteLabel) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = !v4;
    }
    if (v14) {
      goto LABEL_16;
    }
    BOOL v10 = [(_UIDatePickerView *)self _minutesStringForHour:0 minutes:0];
    id v11 = self;
    uint64_t v12 = 64;
    goto LABEL_15;
  }
  if (a3 != 32)
  {
LABEL_9:
    int64_t v13 = 0;
    goto LABEL_17;
  }
  p_minuteLabel = &self->_hourLabel;
  minuteLabel = self->_hourLabel;
  if (minuteLabel) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !v4;
  }
  if (v9) {
    goto LABEL_16;
  }
  BOOL v10 = [(_UIDatePickerView *)self _hoursStringForHour:0];
  id v11 = self;
  uint64_t v12 = 32;
LABEL_15:
  [(_UIDatePickerView *)v11 _fadeLabelForCalendarUnit:v12 toText:v10 animated:0];

  minuteLabel = *p_minuteLabel;
LABEL_16:
  int64_t v13 = minuteLabel;
LABEL_17:
  return v13;
}

- (void)_setLabel:(id)a3 forCalendarUnit:(unint64_t)a4 animated:(BOOL)a5
{
  id v11 = a3;
  if ([(_UIDatePickerMode *)self->_mode isTimeIntervalMode])
  {
    if (a4 == 64)
    {
      uint64_t v9 = 576;
    }
    else
    {
      if (a4 != 32) {
        goto LABEL_10;
      }
      uint64_t v9 = 568;
    }
    BOOL v10 = (id *)((char *)&self->super.super.super.super.isa + v9);
    if (*v10 != v11)
    {
      if (!a5) {
        [*v10 removeFromSuperview];
      }
      objc_storeStrong(v10, a3);
    }
  }
LABEL_10:
}

- (void)_positionLabel:(id)a3 forCalendarUnit:(unint64_t)a4 relativeTo:(id)a5 order:(int64_t)a6
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  [v10 sizeToFit];
  [v10 frame];
  double v13 = v12;
  double v15 = v14;
  if (v11)
  {
    [v11 frame];
    double v17 = v16;
    double v19 = v18;
    if ([(UIView *)self _shouldReverseLayoutDirection])
    {
      [v11 frame];
      double v17 = v17 + v20 - v13;
    }
    if (v10 != v11) {
      [(UIView *)self _addSubview:v10 positioned:a6 relativeTo:v11];
    }
  }
  else
  {
    int64_t v21 = [(_UIDatePickerMode *)self->_mode componentForCalendarUnit:a4];
    uint64_t v22 = [(UIPickerView *)self tableViewForColumn:v21];
    [(UIPickerView *)self _effectiveTableViewFrameForColumn:v21];
    id v23 = objc_alloc_init((Class)off_1E52D2E48);
    [v23 setWantsBaselineOffset:1];
    id v24 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v38 = *(void *)off_1E52D2040;
    id v25 = [(_UIDatePickerMode *)self->_mode fontForCalendarUnit:a4];
    v39[0] = v25;
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    id v27 = (void *)[v24 initWithString:@"00" attributes:v26];

    objc_msgSend(v27, "boundingRectWithSize:options:context:", 1, v23, 1.79769313e308, 1.79769313e308);
    v28 = [(_UIDatePickerView *)self _contentViewForSizingLabelForPositioningInComponent:[(_UIDatePickerMode *)self->_mode componentForCalendarUnit:a4]];
    v29 = [v28 titleLabel];
    [(UIView *)self bounds];
    double v31 = v30;
    [v22 rowHeight];
    double v33 = v32;
    [(UIView *)self bounds];
    objc_msgSend(v28, "setFrame:", 0.0, round(v35 + (v34 - v33) * 0.5), v31, v33);
    [v28 layoutIfNeeded];
    [v29 size];
    [v29 _baselineOffsetFromBottom];
    [v10 _baselineOffsetFromBottom];
    [(UIView *)self _shouldReverseLayoutDirection];
    UIRoundToViewScale(v10);
    double v17 = v36;
    UIRoundToViewScale(v10);
    double v19 = v37;
    [(UIView *)self _addSubview:v10 positioned:a6 relativeTo:v22];
  }
  objc_msgSend(v10, "setFrame:", v17, v19, v13, v15);
}

- (id)_contentViewForSizingLabelForPositioningInComponent:(int64_t)a3
{
  return [(_UIDatePickerMode *)self->_mode viewForRow:0 inComponent:a3 reusingView:0];
}

- (id)_makeNewCalendarUnitLabel
{
  BOOL v3 = [UILabel alloc];
  BOOL v4 = -[UILabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v5 = [(_UIDatePickerView *)self _hrMinFont];
  [(UILabel *)v4 setFont:v5];

  [(_UIDatePickerView *)self _updateTextColorForCalendarUnitLabel:v4];
  id v6 = [(_UIDatePickerView *)self shadowColor];
  [(UILabel *)v4 setShadowColor:v6];

  [(UIView *)v4 setBackgroundColor:0];
  [(UIView *)v4 setOpaque:0];
  id v7 = [(_UIDatePickerView *)self shadowColor];
  [(UILabel *)v4 setShadowColor:v7];

  -[UILabel setShadowOffset:](v4, "setShadowOffset:", 0.0, 1.0);
  return v4;
}

- (void)_updateTextColorForCalendarUnitLabel:(id)a3
{
  id v4 = a3;
  id v5 = [(UIPickerView *)self _textColor];
  [v4 setTextColor:v5];
}

- (void)_fadeLabelForCalendarUnit:(unint64_t)a3 toText:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [(_UIDatePickerView *)self _labelForCalendarUnit:a3 createIfNecessary:0];
  id v10 = [v9 text];
  char v11 = [v10 isEqualToString:v8];

  id v12 = v9;
  if ((v11 & 1) == 0)
  {
    if (v5)
    {
      double v13 = [(_UIDatePickerView *)self _makeNewCalendarUnitLabel];

      [v13 setText:v8];
      [(_UIDatePickerView *)self _positionLabel:v13 forCalendarUnit:a3 relativeTo:v9 order:-3];
      [(UIView *)self _addSubview:v13 positioned:-3 relativeTo:v9];
      [v13 setAlpha:0.0];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __63___UIDatePickerView__fadeLabelForCalendarUnit_toText_animated___block_invoke;
      v19[3] = &unk_1E52D9F70;
      id v20 = v9;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __63___UIDatePickerView__fadeLabelForCalendarUnit_toText_animated___block_invoke_2;
      v17[3] = &unk_1E52DC3A0;
      id v18 = v20;
      +[UIView animateWithDuration:0x10000 delay:v19 options:v17 animations:0.2 completion:0.0];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __63___UIDatePickerView__fadeLabelForCalendarUnit_toText_animated___block_invoke_3;
      v15[3] = &unk_1E52D9F70;
      id v12 = v13;
      id v16 = v12;
      +[UIView animateWithDuration:0x20000 delay:v15 options:0 animations:0.2 completion:0.0];
    }
    else
    {
      id v12 = v9;
      if (!v9)
      {
        id v12 = [(_UIDatePickerView *)self _makeNewCalendarUnitLabel];
      }
      [v12 setText:v8];
      [(_UIDatePickerView *)self _positionLabel:v12 forCalendarUnit:a3 relativeTo:v9 order:-3];
    }
  }
  double v14 = [(UIPickerView *)self tableViewForColumn:[(_UIDatePickerMode *)self->_mode componentForCalendarUnit:a3]];
  [(UIView *)self _addSubview:v12 positioned:-2 relativeTo:v14];
  [(_UIDatePickerView *)self _setLabel:v12 forCalendarUnit:a3 animated:v5];
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  -[_UIDatePickerDataModel setDate:](self->_data, "setDate:", 0, a4);
  BOOL v7 = [(_UIDatePickerMode *)self->_mode hasSelectedDateComponents];
  id v21 = [(_UIDatePickerMode *)self->_mode selectedDateComponents];
  [(_UIDatePickerMode *)self->_mode updateSelectedDateComponentsWithNewValueInComponent:a5];
  if (v7)
  {
    id v8 = [(_UIDatePickerMode *)self->_mode selectedDateComponents];
    int v9 = [v21 isEqual:v8] ^ 1;
  }
  else
  {
    int v9 = 1;
  }
  id v10 = self;
  uint64_t v11 = [(UIPickerView *)v10 numberOfComponents];
  if (v11 >= 1)
  {
    uint64_t v12 = v11;
    double v13 = [(UIPickerView *)v10 tableViewForColumn:0];
    if ([v13 isDragging] & 1) != 0 || (objc_msgSend(v13, "isDecelerating"))
    {

LABEL_19:
      goto LABEL_21;
    }
    uint64_t v14 = 1;
    while (1)
    {
      uint64_t v15 = v14;

      if (v12 == v15) {
        break;
      }
      double v13 = [(UIPickerView *)v10 tableViewForColumn:v15];
      if (([v13 isDragging] & 1) == 0)
      {
        char v16 = [v13 isDecelerating];
        uint64_t v14 = v15 + 1;
        if ((v16 & 1) == 0) {
          continue;
        }
      }

      if (v12 <= v15) {
        goto LABEL_15;
      }
      goto LABEL_21;
    }
  }

LABEL_15:
  int v17 = [(_UIDatePickerView *)v10 _updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:a5] | v9;
  [(_UIDatePickerView *)v10 _updateLabels:1];
  if (v17 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v10->_datePicker);
    [WeakRetained _emitValueChanged];
  }
  double v19 = [(_UIDatePickerView *)v10 timeInputLabel];
  int v20 = [v19 wheelsActive];

  if (v20)
  {
    id v10 = [(_UIDatePickerView *)v10 timeInputLabel];
    [(_UIDatePickerView *)v10 endEditingWheels];
    goto LABEL_19;
  }
  [(_UIDatePickerView *)v10 _updateWheelsLabelForCurrentDateComponents];
LABEL_21:
}

- (void)scrollViewWillBeginDragging:(id)a3
{
}

- (void)_updateEnabledCellsIncludingWMDCells:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(UIPickerView *)self numberOfComponents];
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v5;
    do
    {
      unint64_t v8 = [(_UIDatePickerMode *)self->_mode calendarUnitForComponent:v6];
      uint64_t v9 = [(UIPickerView *)self visibleRowsForColumn:v6];
      if (v10)
      {
        uint64_t v11 = v9 + v10;
        if (v9 + v10 > (unint64_t)(int)v9)
        {
          uint64_t v12 = (int)v9;
          int v13 = v8 != 536 || v3;
          do
          {
            uint64_t v14 = [(UIPickerView *)self viewForRow:v12 forComponent:v6];
            if (v14) {
              int v15 = v13;
            }
            else {
              int v15 = 0;
            }
            if (v15 == 1) {
              [(_UIDatePickerMode *)self->_mode updateEnabledStateOfViewForRow:v12 inComponent:v6];
            }

            ++v12;
          }
          while (v11 != v12);
        }
      }
      ++v6;
    }
    while (v6 != v7);
  }
}

- (void)setTimeInterval:(double)a3
{
  unint64_t v4 = vcvtmd_s64_f64(fmin(fmax(a3, 0.0), 86400.0));
  int v5 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [v5 components:30 fromDate:v6];

  [v9 setHour:v4 / 0xE10];
  [v9 setMinute:v4 % 0xE10 / 0x3C];
  uint64_t v7 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  unint64_t v8 = [v7 dateFromComponents:v9];
  [(_UIDatePickerDataModel *)self->_data setDate:v8];

  [(_UIDatePickerView *)self didChangeDateFrom:0 animated:0];
}

- (double)timeInterval
{
  v2 = [(_UIDatePickerDataModel *)self->_data lastSelectedDateComponents];
  uint64_t v3 = 60 * [v2 minute];
  uint64_t v4 = v3 + 3600 * [v2 hour];
  double v5 = (double)(unint64_t)(v4 + [v2 second]);

  return v5;
}

- (double)contentWidth
{
  uint64_t v3 = [(UIView *)self traitCollection];
  uint64_t v4 = +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", [v3 userInterfaceIdiom]);

  [(_UIDatePickerMode *)self->_mode totalComponentWidth];
  double v6 = v5;
  [v4 pickerHorizontalEdgeInset];
  double v8 = v6 + v7 + v7;
  [(UIView *)self bounds];
  if (v8 >= v9) {
    double v8 = v9;
  }

  return v8;
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  [(_UIDatePickerMode *)self->_mode rowHeight];
  return result;
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  double v6 = [(UIView *)self traitCollection];
  double v7 = +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", [v6 userInterfaceIdiom]);

  [v7 pickerHorizontalEdgeInset];
  double v9 = v8;
  [(UIPickerView *)self _selectionBarSideInset];
  double v11 = v9 + v10;
  [(UIView *)self bounds];
  double v13 = v12 - (v11 + v11);
  if (v13 < 0.0) {
    double v13 = 1.79769313e308;
  }
  [(_UIDatePickerMode *)self->_mode widthForComponent:a4 maxWidth:v13];
  double v15 = v14;

  return v15;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  double v8 = [(_UIDatePickerMode *)self->_mode viewForRow:a4 inComponent:a5 reusingView:a6];
  if ([(_UIDatePickerMode *)self->_mode isTimeIntervalMode])
  {
    unint64_t v9 = [(_UIDatePickerMode *)self->_mode calendarUnitForComponent:a5];
    if (v9 == 64 || v9 == 32)
    {
      double v10 = [(_UIDatePickerView *)self _labelForCalendarUnit:v9 createIfNecessary:1];
      [v10 frame];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v19 = [(UIPickerView *)self tableViewForColumn:a5];
      -[UIView convertRect:toView:](self, "convertRect:toView:", v19, v12, v14, v16, v18);
      double v21 = v20;

      [v8 setTitleLabelMaxX:fabs(v21 + -3.0)];
    }
  }
  return v8;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  v14.origin.double x = v8;
  v14.origin.double y = v9;
  v14.size.double width = v10;
  v14.size.double height = v11;
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIDatePickerView;
    -[UIPickerView setFrame:](&v12, sel_setFrame_, x, y, width, height);
    [(_UIDatePickerView *)self _removeUnitLabels];
    [(UIPickerView *)self setNeedsLayout];
    [(_UIDatePickerMode *)self->_mode resetComponentWidths];
    [(_UIDatePickerView *)self _updateTimeInputLabelPosition];
  }
}

- (void)layoutSubviews
{
  $76755D4DEA27573399A7BF6CD45D6B19 pickerViewFlags = self->super._pickerViewFlags;
  v9.receiver = self;
  v9.super_class = (Class)_UIDatePickerView;
  [(UIPickerView *)&v9 layoutSubviews];
  if ((*(unsigned char *)&pickerViewFlags & 1) != 0 && !self->_loadingDate) {
    [(_UIDatePickerView *)self _loadDateAnimated:0];
  }
  if ([(_UIDatePickerMode *)self->_mode isTimeIntervalMode])
  {
    uint64_t v4 = [(UIPickerView *)self numberOfComponents];
    if (v4 >= 1)
    {
      uint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        double v7 = [(UIPickerView *)self tableViewForColumn:i];
        CGFloat v8 = v7;
        if (*(unsigned char *)&pickerViewFlags) {
          [v7 reloadData];
        }
      }
    }
  }
  [(_UIDatePickerView *)self _updateLabels:0];
  [(_UIDatePickerView *)self _updateTimeInputLabelPosition];
}

- (void)_setHidesLabels:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(UIPickerView *)self numberOfComponents];
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v5;
    do
    {
      CGFloat v8 = [(UIPickerView *)self tableViewForColumn:v6];
      [v8 setHidden:v3];

      ++v6;
    }
    while (v7 != v6);
  }
  [(UIView *)self->_hourLabel setHidden:v3];
  minuteLabel = self->_minuteLabel;
  [(UIView *)minuteLabel setHidden:v3];
}

- (void)_setUsesBlackChrome:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 datePickerFlags = *(_WORD *)&self->_datePickerFlags & 0xFFF7 | v3;
  [(UIPickerView *)self setNeedsLayout];
}

- (BOOL)_usesBlackChrome
{
  return (*(_WORD *)&self->_datePickerFlags >> 3) & 1;
}

- (void)_setAllowsZeroTimeInterval:(BOOL)a3
{
  self->_allowsZeroTimeInterval = a3;
  if ([(_UIDatePickerMode *)self->_mode isTimeIntervalMode])
  {
    [(UIPickerView *)self reloadAllComponents];
  }
}

- (BOOL)_allowsZeroTimeInterval
{
  return self->_allowsZeroTimeInterval;
}

- (id)_viewForSelectedRowInComponent:(int64_t)a3
{
  NSInteger v5 = -[UIPickerView selectedRowInComponent:](self, "selectedRowInComponent:");
  if (v5 < 0)
  {
    uint64_t v7 = 0;
  }
  else
  {
    NSInteger v6 = v5;
    uint64_t v7 = [(UIPickerView *)self viewForRow:v5 forComponent:a3];
    if (!v7)
    {
      [(_UIDatePickerView *)self didChangeDateFrom:0 animated:0];
      uint64_t v7 = [(UIPickerView *)self viewForRow:v6 forComponent:a3];
    }
  }
  return v7;
}

- (void)_updateTimeInputLabelPosition
{
  int64_t v3 = [(_UIDatePickerMode *)self->_mode componentForCalendarUnit:32];
  int64_t v4 = [(_UIDatePickerMode *)self->_mode componentForCalendarUnit:64];
  [(UIPickerView *)self _selectionBarSideInset];
  if (self->_timeInputLabel) {
    BOOL v6 = v3 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6 && v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v8 = v5;
    [(UIPickerView *)self _effectiveTableViewFrameForColumn:v3];
    double v10 = v9 - v8;
    [(_UIDatePickerView *)self pickerView:self widthForComponent:v3];
    uint64_t v12 = v11;
    int64_t v13 = [(_UIDatePickerMode *)self->_mode titleAlignmentForCalendarUnit:32];
    [(UIPickerView *)self _effectiveTableViewFrameForColumn:v4];
    double v15 = v14 - v8;
    [(_UIDatePickerView *)self pickerView:self widthForComponent:v4];
    uint64_t v17 = v16;
    int64_t v18 = [(_UIDatePickerMode *)self->_mode titleAlignmentForCalendarUnit:64];
    [(UIView *)self addSubview:self->_timeInputLabel];
    [(_UIDatePickerView *)self _currentTimeInputLabelFrame];
    -[UIView setFrame:](self->_timeInputLabel, "setFrame:");
    [(UIView *)self center];
    -[UIView setCenter:](self->_timeInputLabel, "setCenter:");
    timeInputLabel = self->_timeInputLabel;
    *(double *)double v21 = v10;
    v21[1] = v12;
    v21[2] = v13;
    *(double *)double v20 = v15;
    v20[1] = v17;
    v20[2] = v18;
    [(_UIDatePickerWheelsTimeLabel *)timeInputLabel configureLabelsForHour:v21 minute:v20];
    [(_UIDatePickerView *)self _hidePickerViewSelectionBarForTimeInputLabel:[(UIView *)self->_timeInputLabel isFirstResponder]];
  }
}

- (void)_hidePickerViewSelectionBarForTimeInputLabel:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIDatePickerMode *)self->_mode componentForCalendarUnit:32] != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v5 = [(UIPickerView *)self tableViewForColumn:[(_UIDatePickerMode *)self->_mode componentForCalendarUnit:32]];
    [v5 setHidden:v3];
  }
  if ([(_UIDatePickerMode *)self->_mode componentForCalendarUnit:64] != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v6 = [(UIPickerView *)self tableViewForColumn:[(_UIDatePickerMode *)self->_mode componentForCalendarUnit:64]];
    [v6 setHidden:v3];
  }
  if (v3) {
    __int16 v7 = 128;
  }
  else {
    __int16 v7 = 0;
  }
  *(_WORD *)&self->___int16 datePickerFlags = *(_WORD *)&self->_datePickerFlags & 0xFF7F | v7;
}

- (void)_updateTimeInputLabelConfiguration
{
  if ([(_UIDatePickerView *)self _shouldInstallTimeInputLabelForDatePickerMode:[(_UIDatePickerMode *)self->_mode datePickerMode]])
  {
    [(_UIDatePickerView *)self _installTimeInputLabelIfNeeded];
  }
  else
  {
    [(_UIDatePickerView *)self _uninstallTimeInputLabelIfNeeded];
  }
}

- (BOOL)_shouldInstallTimeInputLabelForDatePickerMode:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (id)_currentTimeFormat
{
  BOOL v3 = [(_UIDatePickerDataModel *)self->_data formattingCalendar];
  int64_t v4 = [(_UIDatePickerDataModel *)self->_data effectiveLocale];
  double v5 = +[_UIDatePickerCalendarTimeFormat formatWithCalendar:v3 locale:v4 followsSystemHourCycle:[(_UIDatePickerDataModel *)self->_data followsSystemHourCycle]];

  return v5;
}

- (CGRect)_currentTimeInputLabelFrame
{
  [(UIView *)self bounds];
  double Width = CGRectGetWidth(v9);
  [(UIPickerView *)self _selectionBarSideInset];
  double v5 = Width - (v4 + v4);
  double v6 = 32.0;
  double v7 = 0.0;
  double v8 = 0.0;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (void)_installTimeInputLabelIfNeeded
{
  if (self->_timeInputLabel)
  {
    [(_UIDatePickerView *)self _updateTimeInputLabelPosition];
  }
  else
  {
    BOOL v3 = [_UIDatePickerWheelsTimeLabel alloc];
    double v4 = [(_UIDatePickerView *)self _currentTimeFormat];
    double v5 = [(_UIDatePickerWheelsTimeLabel *)v3 initWithTimeFormat:v4 minuteInterval:[(_UIDatePickerDataModel *)self->_data minuteInterval]];

    [(_UIDatePickerWheelsTimeLabel *)v5 setWheelsDelegate:self];
    data = self->_data;
    if (data) {
      [(_UIDatePickerCalendarTimeLabel *)v5 setRoundsToMinuteInterval:[(_UIDatePickerDataModel *)data roundsToMinuteInterval]];
    }
    double v7 = [(UIPickerView *)self _style];
    double v8 = [(UIView *)self traitCollection];
    CGRect v9 = [v7 centerCellDigitFontWithTraitCollection:v8];
    [(_UIDatePickerWheelsTimeLabel *)v5 setFont:v9];

    [(_UIDatePickerCalendarTimeLabel *)v5 setDelegate:self];
    [(_UIDatePickerView *)self _currentTimeInputLabelFrame];
    -[UIView setFrame:](v5, "setFrame:");
    [(UIView *)v5 setAutoresizingMask:42];
    [(UIView *)self center];
    -[UIView setCenter:](v5, "setCenter:");
    double v10 = [(_UIDatePickerWheelsTimeLabel *)v5 controlEventsGestureRecognizer];
    [v10 setDelegate:self];

    uint64_t v11 = [(_UIDatePickerWheelsTimeLabel *)v5 controlEventsGestureRecognizer];
    [(UIView *)self addGestureRecognizer:v11];

    uint64_t v12 = (_UIControlEventsGestureRecognizer *)objc_opt_new();
    [(_UIControlEventsGestureRecognizer *)v12 setControlEventsDelegate:self];
    [(UIGestureRecognizer *)v12 setDelegate:self];
    [(UIView *)self addGestureRecognizer:v12];
    controlEventsGestureRecognizer = self->_controlEventsGestureRecognizer;
    self->_controlEventsGestureRecognizer = v12;
    double v14 = v12;

    id v16 = [(_UIDatePickerMode *)self->_mode selectedDateComponents];
    -[_UIDatePickerWheelsTimeLabel updateHoursFromDatePicker:wheelsChanged:](v5, "updateHoursFromDatePicker:wheelsChanged:", [v16 hour], 0);
    -[_UIDatePickerWheelsTimeLabel updateMinutesFromDatePicker:wheelsChanged:](v5, "updateMinutesFromDatePicker:wheelsChanged:", [v16 minute], 0);
    timeInputLabel = self->_timeInputLabel;
    self->_timeInputLabel = v5;

    [(_UIDatePickerView *)self _updateTimeInputLabelPosition];
  }
}

- (void)_uninstallTimeInputLabelIfNeeded
{
  BOOL v3 = [(_UIDatePickerView *)self timeInputLabel];

  if (v3)
  {
    double v4 = [(_UIDatePickerView *)self timeInputLabel];
    double v5 = [v4 controlEventsGestureRecognizer];
    [(UIView *)self removeGestureRecognizer:v5];

    double v6 = [(_UIDatePickerView *)self timeInputLabel];
    [v6 removeFromSuperview];

    timeInputLabel = self->_timeInputLabel;
    self->_timeInputLabel = 0;
  }
  double v8 = [(_UIDatePickerView *)self controlEventsGestureRecognizer];

  if (v8)
  {
    CGRect v9 = [(_UIDatePickerView *)self controlEventsGestureRecognizer];
    [(UIView *)self removeGestureRecognizer:v9];

    controlEventsGestureRecognizer = self->_controlEventsGestureRecognizer;
    self->_controlEventsGestureRecognizer = 0;
  }
  [(_UIDatePickerView *)self setPassthroughInteractionEnabled:0];
}

- (void)controlEventsGestureRecognizer:(id)a3 recognizedControlEvent:(unint64_t)a4 withEvent:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  if ((uint64_t)a4 <= 127)
  {
    if (a4 == 1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
      double v10 = [WeakRetained _overlayPresentation];
      uint64_t v11 = v10;
      uint64_t v12 = 1;
      goto LABEL_9;
    }
    if (a4 != 64) {
      goto LABEL_10;
    }
LABEL_7:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
    double v10 = [WeakRetained _overlayPresentation];
    uint64_t v11 = v10;
    uint64_t v12 = 0;
LABEL_9:
    [v10 setDefersAutomaticKeyboardAvoidanceAdjustments:v12];

    goto LABEL_10;
  }
  if (a4 == 128 || a4 == 256) {
    goto LABEL_7;
  }
LABEL_10:
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  double v6 = [(_UIDatePickerView *)self controlEventsGestureRecognizer];
  char v7 = [v5 isEqual:v6];

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UIDatePickerView *)self timeInputLabel];
  CGRect v9 = [v8 controlEventsGestureRecognizer];
  int v10 = [v6 isEqual:v9];

  if (v10 && [(UIPickerView *)self numberOfComponents] >= 1)
  {
    NSInteger v11 = 0;
    do
    {
      uint64_t v12 = [(UIPickerView *)self tableViewForColumn:v11];
      id v13 = [v12 panGestureRecognizer];

      BOOL v14 = v13 == v7;
      if (v13 == v7) {
        break;
      }
      ++v11;
    }
    while ([(UIPickerView *)self numberOfComponents] > v11);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v5 = a4;
  id v6 = [(_UIDatePickerView *)self timeInputLabel];
  id v7 = [(_UIDatePickerView *)self timeInputLabel];
  [v5 locationInView:v7];
  int v8 = objc_msgSend(v6, "pointInside:withEvent:", 0);

  __int16 datePickerFlags = (__int16)self->_datePickerFlags;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v10 = datePickerFlags & 0x100;
    NSInteger v11 = [v5 view];
    objc_opt_class();
    int v12 = objc_opt_isKindOfClass() & (v8 | (v10 >> 8));
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = self;
  uint64_t v9 = [(UIPickerView *)v8 numberOfComponents];
  if (v9 >= 1)
  {
    uint64_t v10 = v9;
    NSInteger v11 = [(UIPickerView *)v8 tableViewForColumn:0];
    if ([v11 isDragging] & 1) != 0 || (objc_msgSend(v11, "isDecelerating"))
    {

      char v12 = 0;
      goto LABEL_14;
    }
    uint64_t v13 = 1;
    while (1)
    {
      uint64_t v14 = v13;

      if (v10 == v14) {
        break;
      }
      NSInteger v11 = [(UIPickerView *)v8 tableViewForColumn:v14];
      if (([v11 isDragging] & 1) == 0)
      {
        char v15 = [v11 isDecelerating];
        uint64_t v13 = v14 + 1;
        if ((v15 & 1) == 0) {
          continue;
        }
      }

      if (v10 <= v14) {
        goto LABEL_12;
      }
      char v12 = 0;
      goto LABEL_16;
    }
  }

LABEL_12:
  id v16 = [(_UIDatePickerView *)v8 timeInputLabel];
  uint64_t v17 = [v16 controlEventsGestureRecognizer];
  int v18 = [v6 isEqual:v17];

  if (!v18)
  {
    char v12 = 1;
    goto LABEL_16;
  }
  double v19 = [(_UIDatePickerView *)v8 timeInputLabel];
  [v7 locationInView:v19];
  double v21 = v20;
  double v23 = v22;

  int v8 = [(_UIDatePickerView *)v8 timeInputLabel];
  char v12 = -[UIView pointInside:withEvent:](v8, "pointInside:withEvent:", 0, v21, v23);
LABEL_14:

LABEL_16:
  return v12;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDatePickerView *)self timeInputLabel];
  id v6 = [v5 controlEventsGestureRecognizer];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    id v9 = [(_UIDatePickerView *)self timeInputLabel];
    int v8 = [v9 controlEventsGestureRecognizer];
    [v8 gestureRecognizerFailed];
  }
}

- (void)_updateWheelsForUpdatedTextInputWithForcedUpdate:(BOOL)a3
{
  BOOL v39 = a3;
  id v40 = self;
  uint64_t v3 = [(UIPickerView *)v40 numberOfComponents];
  id v4 = v40;
  if (v3 < 1) {
    goto LABEL_10;
  }
  uint64_t v5 = v3;
  id v6 = [(UIPickerView *)v40 tableViewForColumn:0];
  if (([v6 isDragging] & 1) == 0 && (objc_msgSend(v6, "isDecelerating") & 1) == 0)
  {
    uint64_t v7 = 1;
    while (1)
    {
      uint64_t v8 = v7;

      id v4 = v40;
      if (v5 == v8) {
        break;
      }
      id v6 = [(UIPickerView *)v40 tableViewForColumn:v8];
      if (([v6 isDragging] & 1) == 0)
      {
        char v9 = [v6 isDecelerating];
        uint64_t v7 = v8 + 1;
        if ((v9 & 1) == 0) {
          continue;
        }
      }

      if (v5 <= v8) {
        goto LABEL_11;
      }
      return;
    }
LABEL_10:

LABEL_11:
    uint64_t v10 = v40->_timeInputLabel;
    NSInteger v11 = [(_UIDatePickerCalendarTimeLabel *)v10 timeFormat];
    char v12 = [v11 hourFormatter];
    uint64_t v13 = [(_UIDatePickerCalendarTimeLabel *)v10 hourText];
    uint64_t v14 = [v12 numberFromString:v13];
    uint64_t v15 = [v14 integerValue];

    id v16 = [(_UIDatePickerCalendarTimeLabel *)v10 timeFormat];
    uint64_t v17 = [v16 minuteFormatter];
    int v18 = [(_UIDatePickerCalendarTimeLabel *)v10 minuteText];
    double v19 = [v17 numberFromString:v18];
    uint64_t v20 = [v19 integerValue];

    id v6 = [(_UIDatePickerDataModel *)v40->_data effectiveDate];
    double v21 = [(_UIDatePickerMode *)v40->_mode selectedDateComponents];
    uint64_t Value = _UIDateComponentsGetValue(v21, 0x10000);
    double v23 = (void *)[v21 copy];
    [v23 setHour:v15];
    if (v39
      || [(_UIDatePickerMode *)v40->_mode areValidDateComponents:v23 comparingUnits:-193])
    {
      [v21 setHour:v15];
    }
    if (v39 || (unint64_t)v20 <= 0x3B)
    {
      if ([(_UIDatePickerDataModel *)v40->_data roundsToMinuteInterval])
      {
        double v24 = (double)[(_UIDatePickerDataModel *)v40->_data minuteInterval];
        uint64_t v20 = (uint64_t)(floor((double)v20 / v24) * v24);
      }
      [v21 setMinute:v20];
    }
    if (![(_UIDatePickerMode *)v40->_mode is24Hour]) {
      _UIDateComponentsSetValue(v21, 0x10000, Value);
    }
    id v25 = [(_UIDatePickerDataModel *)v40->_data effectiveCalendar];
    id v26 = [v25 dateFromComponents:v21];
    [(_UIDatePickerDataModel *)v40->_data setDate:v26];

    id WeakRetained = v40;
    uint64_t v28 = [(UIPickerView *)WeakRetained numberOfComponents];
    if (v28 >= 1)
    {
      uint64_t v29 = v28;
      double v30 = [(UIPickerView *)WeakRetained tableViewForColumn:0];
      double v31 = [v30 panGestureRecognizer];

      uint64_t v32 = [v31 state];
      if (v32)
      {
LABEL_34:

        goto LABEL_35;
      }
      uint64_t v33 = 1;
      while (v29 != v33)
      {
        double v34 = [(UIPickerView *)WeakRetained tableViewForColumn:v33];
        double v35 = [v34 panGestureRecognizer];

        uint64_t v36 = [v35 state];
        ++v33;
        if (v36)
        {

          if (v29 <= v33 - 1) {
            goto LABEL_29;
          }
          goto LABEL_35;
        }
      }
    }

LABEL_29:
    double v37 = [(_UIDatePickerDataModel *)v40->_data effectiveDate];
    char v38 = [v37 isEqual:v6];

    if (v39)
    {
      if ((v38 & 1) == 0)
      {
        [(_UIDatePickerView *)WeakRetained didChangeDateFrom:v6 animated:1];
LABEL_33:
        id WeakRetained = (_UIDatePickerView *)objc_loadWeakRetained((id *)&WeakRetained->_datePicker);
        [(_UIDatePickerView *)WeakRetained _emitValueChanged];
        goto LABEL_34;
      }
    }
    else
    {
      *(_WORD *)&WeakRetained->_datePickerFlags |= 0x110u;
      [(_UIDatePickerView *)WeakRetained didChangeDateFrom:v6 animated:1];
      *(_WORD *)&WeakRetained->_datePickerFlags &= ~0x10u;
      if ((v38 & 1) == 0) {
        goto LABEL_33;
      }
    }
LABEL_35:

    id v40 = (_UIDatePickerView *)v10;
  }
}

- (BOOL)timeLabel:(id)a3 didReceiveText:(id)a4
{
  return 0;
}

- (void)timeLabel:(id)a3 didUpdateText:(id)a4
{
}

- (int64_t)keyboardTypeForTimeLabel:(id)a3
{
  uint64_t v3 = +[UIDevice currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 127;
  }
  else {
    return 4;
  }
}

- (BOOL)timeLabelShouldSuppressSoftwareKeyboard:(id)a3
{
  uint64_t v3 = +[UIDevice currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  return (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (BOOL)timeLabelCanBecomeFirstResponder:(id)a3
{
  return (*(_WORD *)&self->_datePickerFlags & 0x200) == 0;
}

- (void)timeLabelWillBecomeFirstResponder:(id)a3
{
  id v8 = a3;
  uint64_t v4 = +[UIDevice currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v6 = +[UIDevice currentDevice];
    if ([v6 _isHardwareKeyboardAvailable])
    {

      goto LABEL_9;
    }
    if ([v8 isFirstResponder])
    {
      uint64_t v7 = [(UIViewController *)self->_numericKeyboardViewController presentingViewController];

      if (v7) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    [(_UIDatePickerView *)self _enableCustomKeyboardIfNecessary];
    *(_WORD *)&self->_datePickerFlags |= 0x20u;
  }
LABEL_9:
}

- (unint64_t)_permittedArrowDirectionForKeyboardPopover
{
  uint64_t v3 = [(_UIDatePickerView *)self timeInputLabel];
  uint64_t v4 = [v3 window];

  uint64_t v5 = [(_UIDatePickerView *)self timeInputLabel];
  id v6 = [(_UIDatePickerView *)self timeInputLabel];
  [v6 combinedTextRectFromLabels];
  objc_msgSend(v5, "convertRect:toView:", v4);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v20.origin.double x = v8;
  v20.origin.double y = v10;
  v20.size.double width = v12;
  v20.size.double height = v14;
  double MinX = CGRectGetMinX(v20);
  v21.origin.double x = v8;
  v21.origin.double y = v10;
  v21.size.double width = v12;
  v21.size.double height = v14;
  double MaxX = CGRectGetMaxX(v21);
  [v4 bounds];
  if (MaxX >= CGRectGetMaxX(v22) + -320.0 && MinX <= 320.0) {
    unint64_t v18 = 15;
  }
  else {
    unint64_t v18 = 12;
  }

  return v18;
}

- (void)timeLabelDidBecomeFirstResponder:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(_WORD *)&self->_datePickerFlags & 0x20) != 0)
  {
    numericKeyboardViewController = self->_numericKeyboardViewController;
    if (numericKeyboardViewController)
    {
      id v6 = [(UIViewController *)numericKeyboardViewController popoverPresentationController];
      [v6 setSourceView:v4];
      [v4 combinedTextRectFromLabels];
      objc_msgSend(v6, "setSourceRect:");
      objc_msgSend(v6, "setPermittedArrowDirections:", -[_UIDatePickerView _permittedArrowDirectionForKeyboardPopover](self, "_permittedArrowDirectionForKeyboardPopover"));
    }
    else
    {
      double v7 = (_UIDatePickerNumericKeyboardViewController *)objc_opt_new();
      CGFloat v8 = self->_numericKeyboardViewController;
      self->_numericKeyboardViewController = v7;

      id v6 = [(UIViewController *)self->_numericKeyboardViewController popoverPresentationController];
      [v6 setSourceView:v4];
      [v4 combinedTextRectFromLabels];
      objc_msgSend(v6, "setSourceRect:");
      v13[0] = v4;
      double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      [v6 setPassthroughViews:v9];

      [v6 _setShouldPreserveFirstResponder:0];
      [v6 _setAdaptivityEnabled:0];
      objc_msgSend(v6, "setPopoverLayoutMargins:", 2.22044605e-16, 2.22044605e-16, 2.22044605e-16, 2.22044605e-16);
      objc_msgSend(v6, "setPermittedArrowDirections:", -[_UIDatePickerView _permittedArrowDirectionForKeyboardPopover](self, "_permittedArrowDirectionForKeyboardPopover"));
      [v6 setDelegate:self];
      CGFloat v10 = [(UIView *)self _viewControllerForAncestor];
      *(_WORD *)&self->_datePickerFlags |= 0x200u;
      double v11 = self->_numericKeyboardViewController;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __54___UIDatePickerView_timeLabelDidBecomeFirstResponder___block_invoke;
      v12[3] = &unk_1E52D9F70;
      v12[4] = self;
      [v10 presentViewController:v11 animated:1 completion:v12];
    }
    *(_WORD *)&self->_datePickerFlags &= ~0x20u;
  }
}

- (void)timeLabelDidFailToBecomeFirstResponder:(id)a3
{
  *(_WORD *)&self->_datePickerFlags &= ~0x20u;
}

- (void)timeLabelDidResignFirstResponder:(id)a3
{
  if ((*(_WORD *)&self->_datePickerFlags & 0x20) == 0) {
    [(_UIDatePickerView *)self _dismissManualKeyboard];
  }
}

- (void)timeLabelDidBeginEditing:(id)a3
{
  [(_UIDatePickerView *)self setPassthroughInteractionEnabled:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  [WeakRetained _emitBeginEditing];
}

- (void)timeLabelDidEndEditing:(id)a3
{
  [(_UIDatePickerView *)self setPassthroughInteractionEnabled:0];
  [(_UIDatePickerView *)self _updateWheelsForUpdatedTextInputWithForcedUpdate:1];
  *(_WORD *)&self->_datePickerFlags &= ~0x100u;
  [(_UIDatePickerView *)self _updateWheelsLabelForCurrentDateComponents];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  [WeakRetained _emitEndEditing];
}

- (void)_updateWheelsLabelForCurrentDateComponents
{
  timeInputLabel = self->_timeInputLabel;
  id v4 = [(_UIDatePickerMode *)self->_mode selectedDateComponents];
  -[_UIDatePickerWheelsTimeLabel updateHoursFromDatePicker:wheelsChanged:](timeInputLabel, "updateHoursFromDatePicker:wheelsChanged:", [v4 hour], 0);

  uint64_t v5 = self->_timeInputLabel;
  id v6 = [(_UIDatePickerMode *)self->_mode selectedDateComponents];
  -[_UIDatePickerWheelsTimeLabel updateMinutesFromDatePicker:wheelsChanged:](v5, "updateMinutesFromDatePicker:wheelsChanged:", [v6 minute], 0);
}

- (BOOL)wheelsTimeLabelShouldReceiveInteraction:(id)a3
{
  uint64_t v3 = self;
  uint64_t v4 = [(UIPickerView *)v3 numberOfComponents];
  if (v4 >= 1)
  {
    uint64_t v5 = v4;
    id v6 = [(UIPickerView *)v3 tableViewForColumn:0];
    if ([v6 isDragging] & 1) != 0 || (objc_msgSend(v6, "isDecelerating"))
    {

      return 0;
    }
    uint64_t v8 = 1;
    while (1)
    {
      uint64_t v9 = v8;

      if (v5 == v9) {
        break;
      }
      id v6 = [(UIPickerView *)v3 tableViewForColumn:v9];
      if (([v6 isDragging] & 1) == 0)
      {
        char v10 = [v6 isDecelerating];
        uint64_t v8 = v9 + 1;
        if ((v10 & 1) == 0) {
          continue;
        }
      }

      if (v5 > v9) {
        return 0;
      }
      return (*(_WORD *)&v3->_datePickerFlags & 0x200) == 0;
    }
  }

  return (*(_WORD *)&v3->_datePickerFlags & 0x200) == 0;
}

- (void)wheelsTimeLabel:(id)a3 didChangeVisibility:(BOOL)a4
{
}

- (BOOL)passthroughInteractionEnabled
{
  return self->_passthroughInteraction != 0;
}

- (void)setPassthroughInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  passthroughInteraction = self->_passthroughInteraction;
  if (v3)
  {
    if (!passthroughInteraction && [(UIView *)self _isInAWindow])
    {
      id v6 = (_UIPassthroughScrollInteraction *)objc_opt_new();
      double v7 = self->_passthroughInteraction;
      self->_passthroughInteraction = v6;

      [(_UIPassthroughScrollInteraction *)self->_passthroughInteraction setDelegate:self];
      [(_UIPassthroughScrollInteraction *)self->_passthroughInteraction setEatsTouches:0];
      uint64_t v8 = self->_passthroughInteraction;
      [(UIView *)self addInteraction:v8];
    }
  }
  else if (passthroughInteraction)
  {
    -[UIView removeInteraction:](self, "removeInteraction:");
    uint64_t v9 = self->_passthroughInteraction;
    self->_passthroughInteraction = 0;
  }
}

- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  uint64_t v9 = [(UIViewController *)self->_numericKeyboardViewController presentingViewController];
  if (v9)
  {
    BOOL v10 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
    CGFloat v12 = [WeakRetained _overlayPresentation];
    if (v12)
    {
      BOOL v10 = 0;
    }
    else
    {
      double v13 = [(_UIDatePickerView *)self timeInputLabel];
      CGFloat v14 = [(_UIDatePickerView *)self timeInputLabel];
      objc_msgSend(v14, "convertPoint:fromView:", self, x, y);
      uint64_t v15 = objc_msgSend(v13, "hitTest:withEvent:", v8);
      BOOL v10 = v15 == 0;
    }
  }

  return v10;
}

- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3
{
  BOOL v3 = [(_UIDatePickerView *)self timeInputLabel];
  char v4 = [v3 processTapOutside];

  return v4;
}

- (void)_hardwareKeyboardAvailabilityChanged:(id)a3
{
  char v4 = [(_UIDatePickerView *)self timeInputLabel];
  int v5 = [v4 isFirstResponder];

  id v6 = +[UIDevice currentDevice];
  int v7 = [v6 _isHardwareKeyboardAvailable];

  if (v7) {
    [(_UIDatePickerView *)self _dismissManualKeyboard];
  }
  if (v5)
  {
    id v8 = [(_UIDatePickerView *)self timeInputLabel];
    [v8 becomeFirstResponder];
  }
}

- (void)_dismissManualKeyboard
{
  BOOL v3 = [(_UIDatePickerView *)self numericKeyboardViewController];

  if (v3)
  {
    *(_WORD *)&self->_datePickerFlags |= 0x200u;
    char v4 = [(_UIDatePickerView *)self numericKeyboardViewController];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43___UIDatePickerView__dismissManualKeyboard__block_invoke;
    v9[3] = &unk_1E52D9F70;
    v9[4] = self;
    [v4 dismissViewControllerAnimated:1 completion:v9];

    int v5 = [(_UIDatePickerView *)self numericKeyboardViewController];
    id v6 = [v5 presentationController];
    int v7 = [v6 sourceView];

    if ([v7 isFirstResponder]) {
      [v7 resignFirstResponder];
    }
    [(_UIDatePickerView *)self _disableCustomKeyboardIfNecessary];
    numericKeyboardViewController = self->_numericKeyboardViewController;
    self->_numericKeyboardViewController = 0;
  }
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id v12 = a3;
  int v7 = [(_UIDatePickerView *)self timeInputLabel];
  [v7 combinedTextRectFromLabels];
  a4->origin.double x = v8;
  a4->origin.double y = v9;
  a4->size.double width = v10;
  a4->size.double height = v11;

  objc_msgSend(v12, "setPermittedArrowDirections:", -[_UIDatePickerView _permittedArrowDirectionForKeyboardPopover](self, "_permittedArrowDirectionForKeyboardPopover"));
}

- (void)presentationControllerWillDismiss:(id)a3
{
  char v4 = [a3 sourceView];
  [v4 resignFirstResponder];

  *(_WORD *)&self->_datePickerFlags |= 0x200u;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  *(_WORD *)&self->_datePickerFlags &= ~0x200u;
}

- (BOOL)staggerTimeIntervals
{
  return *(_WORD *)&self->_datePickerFlags & 1;
}

- (BOOL)highlightsToday
{
  return (*(_WORD *)&self->_datePickerFlags >> 2) & 1;
}

- (void)setHighlightsToday:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 datePickerFlags = *(_WORD *)&self->_datePickerFlags & 0xFFFB | v3;
}

- (id)_selectedTextForCalendarUnit:(unint64_t)a3
{
  int64_t v4 = [(_UIDatePickerMode *)self->_mode componentForCalendarUnit:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v5 = 0;
  }
  else
  {
    id v6 = [(_UIDatePickerView *)self _viewForSelectedRowInComponent:v4];
    if (v6
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int v7 = [v6 titleLabel];
      int v5 = [v7 text];
    }
    else
    {
      int v5 = 0;
    }
  }
  return v5;
}

- (id)_labelTextForCalendarUnit:(unint64_t)a3
{
  if ([(_UIDatePickerMode *)self->_mode isTimeIntervalMode])
  {
    int v5 = [(_UIDatePickerView *)self _labelForCalendarUnit:a3 createIfNecessary:0];
    id v6 = [v5 text];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)_existingLabelForCalendarUnit:(unint64_t)a3
{
  return [(_UIDatePickerView *)self _labelForCalendarUnit:a3 createIfNecessary:0];
}

- (int64_t)_amPmValue
{
  if ([(_UIDatePickerMode *)self->_mode isTimeIntervalMode]) {
    return 0;
  }
  int64_t result = self->_expectedAMPM;
  if (result == -1)
  {
    int64_t v4 = [(_UIDatePickerMode *)self->_mode componentForCalendarUnit:0x10000];
    return [(UIPickerView *)self selectedRowInComponent:v4];
  }
  return result;
}

- (BOOL)_updateDateOrTime
{
  [(_UIDatePickerMode *)self->_mode resetSelectedDateComponentsWithValuesUnderSelectionBars];
  return [(_UIDatePickerView *)self _updatedLastSelectedComponentsByValidatingSelectedDateWithLastManipulatedComponent:0x7FFFFFFFFFFFFFFFLL];
}

- (BOOL)hasDefaultSize
{
  return 1;
}

- (UIEdgeInsets)appliedInsetsToEdgeOfContent
{
  __int16 v3 = [(UIPickerView *)self _style];
  [v3 paddingAroundWheels];
  double v5 = v4;

  [(UIPickerView *)self _selectionBarSideInset];
  double v7 = v5 + v6;
  [(UIPickerView *)self _selectionBarSideInset];
  double v9 = v8;
  double v10 = 0.0;
  double v11 = 0.0;
  double v12 = v7;
  result.right = v9;
  result.bottom = v11;
  result.left = v12;
  result.top = v10;
  return result;
}

- (int64_t)_selectionBarRowInComponent:(int64_t)a3
{
  __int16 v3 = [(UIPickerView *)self tableViewForColumn:a3];
  int64_t v4 = [v3 selectionBarRow];

  return v4;
}

- (id)_minutesStringForHour:(int64_t)a3 minutes:(int64_t)a4
{
  double v5 = [(_UIDatePickerDataModel *)self->_data effectiveLocale];
  double v6 = [v5 localeIdentifier];

  double v7 = @"min[plural]";
  if (a4 == 1) {
    double v7 = @"min[singular]";
  }
  if (a4) {
    double v8 = v7;
  }
  else {
    double v8 = @"min[zero]";
  }
  double v9 = _UILocalizedStringWithDefaultValueInLanguage(v8, v6, @"min");

  return v9;
}

- (id)_hoursStringForHour:(int64_t)a3
{
  int64_t v4 = [(_UIDatePickerDataModel *)self->_data effectiveLocale];
  double v5 = [v4 localeIdentifier];

  if (a3 == 1)
  {
    double v6 = @"hour[singular]";
    double v7 = @"hour";
  }
  else
  {
    if (a3) {
      double v6 = @"hour[plural]";
    }
    else {
      double v6 = @"hour[zero]";
    }
    double v7 = @"hours";
  }
  double v8 = _UILocalizedStringWithDefaultValueInLanguage(v6, v5, v7);

  return v8;
}

- (UIFont)_hrMinFont
{
  v2 = (void *)_hrMinFont___defaultHrMinFont;
  if (!_hrMinFont___defaultHrMinFont)
  {
    uint64_t v3 = [off_1E52D39B8 boldSystemFontOfSize:17.0];
    int64_t v4 = (void *)_hrMinFont___defaultHrMinFont;
    _hrMinFont___defaultHrMinFont = v3;

    v2 = (void *)_hrMinFont___defaultHrMinFont;
  }
  return (UIFont *)v2;
}

- (int64_t)datePickerMode
{
  return [(_UIDatePickerDataModel *)self->_data datePickerMode];
}

- (UIDatePicker)datePicker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  return (UIDatePicker *)WeakRetained;
}

- (void)setDatePicker:(id)a3
{
}

- (_UIDatePickerDataModel)data
{
  return self->_data;
}

- (_UIDatePickerNumericKeyboardViewController)numericKeyboardViewController
{
  return self->_numericKeyboardViewController;
}

- (_UIDatePickerWheelsTimeLabel)timeInputLabel
{
  return self->_timeInputLabel;
}

- (_UIControlEventsGestureRecognizer)controlEventsGestureRecognizer
{
  return self->_controlEventsGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlEventsGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_timeInputLabel, 0);
  objc_storeStrong((id *)&self->_numericKeyboardViewController, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_datePicker);
  objc_storeStrong((id *)&self->_passthroughInteraction, 0);
  objc_storeStrong((id *)&self->_minuteLabel, 0);
  objc_storeStrong((id *)&self->_hourLabel, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

@end
@interface PKPassShareScheduleSectionController
- (BOOL)isDisabled;
- (BOOL)shouldHighlightItem:(id)a3;
- (BOOL)showTimeLimitHeader;
- (PKPassShareScheduleSectionController)initWithConfiguration:(id)a3 possibleTimeConfiguration:(id)a4 isEditable:(BOOL)a5 isDisabled:(BOOL)a6 delegate:(id)a7;
- (PKPassShareTimeConfiguration)configuration;
- (id)_formattedDate:(id)a3;
- (id)cellRegistrationForItem:(id)a3;
- (id)decorateCell:(id)a3 forScheduleRowItem:(id)a4;
- (id)headerAttributedStringForIdentifier:(id)a3;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_updateRowsIfNecessary;
- (void)decorateDayPicker:(id)a3 forScheduleRowItem:(id)a4;
- (void)didSelectItem:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setIsDisabled:(BOOL)a3;
- (void)setShowTimeLimitHeader:(BOOL)a3;
- (void)timePickerValueDidChange:(id)a3;
- (void)toggleValueChanged:(id)a3;
- (void)weekdaySelector:(id)a3 didUpdateSelectedWeekdays:(id)a4;
@end

@implementation PKPassShareScheduleSectionController

- (PKPassShareScheduleSectionController)initWithConfiguration:(id)a3 possibleTimeConfiguration:(id)a4 isEditable:(BOOL)a5 isDisabled:(BOOL)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PKPassShareScheduleSectionController;
  v16 = [(PKPassShareSectionController *)&v21 initWithIdentifiers:MEMORY[0x1E4F1CBF0]];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_configuration, a3);
    objc_storeStrong((id *)&v17->_possibleTimeConfiguration, a4);
    v17->_isEditable = a5;
    v17->_isDisabled = a6;
    objc_storeStrong((id *)&v17->_delegate, a7);
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tags = v17->_tags;
    v17->_tags = v18;

    [(PKPassShareScheduleSectionController *)v17 _updateRowsIfNecessary];
  }

  return v17;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);

  [(PKPassShareScheduleSectionController *)self _updateRowsIfNecessary];
}

- (void)setIsDisabled:(BOOL)a3
{
  if (self->_isDisabled != a3)
  {
    self->_isDisabled = a3;
    [(PKPassShareScheduleSectionController *)self _updateRowsIfNecessary];
  }
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  int v5 = [v4 hasDayPicker];
  v6 = (void *)MEMORY[0x1E4FB1578];
  if (v5)
  {
    uint64_t v7 = objc_opt_class();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__PKPassShareScheduleSectionController_cellRegistrationForItem___block_invoke;
    v15[3] = &unk_1E59D56A0;
    v8 = &v16;
    objc_copyWeak(&v16, &location);
    uint64_t v9 = [v6 registrationWithCellClass:v7 configurationHandler:v15];
  }
  else
  {
    uint64_t v10 = objc_opt_class();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__PKPassShareScheduleSectionController_cellRegistrationForItem___block_invoke_2;
    v13[3] = &unk_1E59CBB38;
    v8 = &v14;
    objc_copyWeak(&v14, &location);
    uint64_t v9 = [v6 registrationWithCellClass:v10 configurationHandler:v13];
  }
  v11 = (void *)v9;
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

  return v11;
}

void __64__PKPassShareScheduleSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained decorateDayPicker:v8 forScheduleRowItem:v6];
  }
}

void __64__PKPassShareScheduleSectionController_cellRegistrationForItem___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = (id)[WeakRetained decorateCell:v9 forScheduleRowItem:v6];
  }
}

- (void)decorateDayPicker:(id)a3 forScheduleRowItem:(id)a4
{
  id v5 = a3;
  [v5 setUserInteractionEnabled:1];
  id v6 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v5 setBackgroundColor:v6];

  [v5 setDelegate:self];
  uint64_t v7 = [(PKPassShareTimeConfiguration *)self->_configuration schedules];
  id v12 = [v7 firstObject];

  id v8 = [(PKPassShareTimeConfiguration *)self->_possibleTimeConfiguration schedules];
  id v9 = [v8 firstObject];

  uint64_t v10 = [v12 daysOfWeek];
  v11 = [v9 daysOfWeek];
  [v5 setSelectedDays:v10 possibleDays:v11];
}

- (id)decorateCell:(id)a3 forScheduleRowItem:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 configuration];
  id v9 = [v7 title];
  [v8 setText:v9];

  uint64_t v10 = [v7 value];
  [v8 setSecondaryText:v10];

  v11 = [v7 icon];
  if (v11)
  {
    [v8 setImage:v11];
    id v12 = [v8 imageProperties];
    [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  else
  {
    id v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"number.circle.fill" withConfiguration:0];
    [v8 setImage:v13];

    id v12 = [v8 imageProperties];
    [MEMORY[0x1E4FB1618] clearColor];
  id v14 = };
  [v12 setTintColor:v14];

  objc_msgSend(v8, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 8.0);
  [v6 setContentConfiguration:v8];
  uint64_t v15 = [v7 userInteractionEnabled];
  if ([v7 hasToggle])
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    objc_msgSend(v16, "setOn:", objc_msgSend(v7, "isOn"));
    v17 = NSNumber;
    v18 = [v7 title];
    v19 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "hash"));

    objc_msgSend(v16, "setTag:", objc_msgSend(v19, "unsignedIntegerValue"));
    [(NSMutableDictionary *)self->_tags setObject:v7 forKeyedSubscript:v19];
    [v16 addTarget:self action:sel_toggleValueChanged_ forControlEvents:4096];
    [v16 setEnabled:v15];
    v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v16 placement:1];
    [v20 setMaintainsFixedSize:1];
    v32[0] = v20;
    objc_super v21 = (void *)MEMORY[0x1E4F1C978];
    v22 = (void **)v32;
LABEL_8:
    v28 = [v21 arrayWithObjects:v22 count:1];
    [v6 setAccessories:v28];

LABEL_12:
    goto LABEL_13;
  }
  if ([v7 hasTimePicker])
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4FB16B0]);
    [v16 setDatePickerMode:0];
    [v16 setPreferredDatePickerStyle:3];
    v23 = [v7 date];
    [v16 setDate:v23];

    v24 = [v7 minimumDate];
    [v16 setMinimumDate:v24];

    v25 = [v7 maximumDate];
    [v16 setMaximumDate:v25];

    [v16 setMinuteInterval:60];
    [v16 setRoundsToMinuteInterval:1];
    [v16 setEnabled:v15];
    v26 = NSNumber;
    v27 = [v7 title];
    v19 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "hash"));

    objc_msgSend(v16, "setTag:", objc_msgSend(v19, "unsignedIntegerValue"));
    [(NSMutableDictionary *)self->_tags setObject:v7 forKeyedSubscript:v19];
    [v16 addTarget:self action:sel_timePickerValueDidChange_ forControlEvents:4096];
    v20 = +[PKDatePickerCellAccessory accessoryWithDatePicker:v16];
    v31 = v20;
    objc_super v21 = (void *)MEMORY[0x1E4F1C978];
    v22 = &v31;
    goto LABEL_8;
  }
  if ((v15 & 1) != 0 || [v7 isSelectable])
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4FB1518]);
    id v30 = v16;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    [v6 setAccessories:v19];
    goto LABEL_12;
  }
LABEL_13:
  [v6 setConfigurationUpdateHandler:&__block_literal_global_109];
  [v6 setUserInteractionEnabled:!self->_isDisabled];

  return v8;
}

void __72__PKPassShareScheduleSectionController_decorateCell_forScheduleRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v4 = (void *)MEMORY[0x1E4FB1498];
  id v5 = a2;
  id v6 = [v4 listGroupedCellConfiguration];
  if ([v9 isHighlighted] & 1) != 0 || (objc_msgSend(v9, "isSelected"))
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
  id v8 = (void *)v7;
  [v6 setBackgroundColor:v7];

  [v5 setBackgroundConfiguration:v6];
}

- (void)timePickerValueDidChange:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  tags = self->_tags;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "tag"));
  uint64_t v7 = [(NSMutableDictionary *)tags objectForKeyedSubscript:v6];

  id v8 = [(PKPassShareTimeConfiguration *)self->_configuration schedules];
  id v9 = [v8 firstObject];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F848D0] emptySchedule];
  }
  id v12 = v11;

  uint64_t v13 = [v12 hoursOfDay];
  id v14 = (void *)v13;
  uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
  if (v13) {
    uint64_t v15 = (void *)v13;
  }
  id v16 = v15;

  v48 = v4;
  v17 = [v4 date];
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v19 = [v7 identifier];
  v46 = v16;
  v47 = v7;
  if (v19 == @"StartHourRow"
    || (v20 = v19) != 0
    && (int v21 = [(__CFString *)v19 isEqualToString:@"StartHourRow"],
        v20,
        v20,
        v21))
  {
    v22 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v23 = (__CFString *)([v22 component:32 fromDate:v17] + 1);

    v24 = [v16 lastObject];
    uint64_t v25 = [v24 integerValue];

    goto LABEL_16;
  }
  v26 = [v7 identifier];
  if (v26 != @"EndHourRow")
  {
    v23 = v26;
    if (v26)
    {
      int v27 = [(__CFString *)v26 isEqualToString:@"EndHourRow"];

      if (v27) {
        goto LABEL_13;
      }
      v23 = 0;
    }
    uint64_t v25 = 0;
    goto LABEL_20;
  }
LABEL_13:
  v28 = [v16 firstObject];
  v23 = (__CFString *)[v28 integerValue];

  v29 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v30 = [v29 component:32 fromDate:v17];

  if (v30) {
    uint64_t v25 = v30;
  }
  else {
    uint64_t v25 = 24;
  }
LABEL_16:
  if ((uint64_t)v23 > v25)
  {
    v31 = [v7 date];
    v32 = v48;
    [v48 setDate:v31 animated:1];

    goto LABEL_26;
  }
LABEL_20:
  v33 = v23;
  do
  {
    v34 = [NSNumber numberWithInteger:v33];
    [v18 addObject:v34];

    v33 = (__CFString *)((char *)v33 + 1);
  }
  while ((__CFString *)(v25 + 1) != v33);
  [v12 setHoursOfDay:v18];
  v35 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = [NSNumber numberWithInteger:v23];
    v37 = [NSNumber numberWithInteger:v25];
    *(_DWORD *)buf = 138412802;
    v51 = v36;
    __int16 v52 = 2112;
    v53 = v37;
    __int16 v54 = 2112;
    id v55 = v18;
    _os_log_impl(&dword_19F450000, v35, OS_LOG_TYPE_DEFAULT, "TimeConfiguration: Updated startHour: %@ endHour: %@. New Hours: %@", buf, 0x20u);
  }
  configuration = self->_configuration;
  v49 = v12;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  [(PKPassShareTimeConfiguration *)configuration setSchedules:v39];

  [(PKPassShareScheduleSectionControllerDelegate *)self->_delegate timeConfigurationDidChange:self->_configuration];
  v40 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v41 = [v40 component:64 fromDate:v17];

  v32 = v48;
  if (v41 >= 1)
  {
    v42 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v43 = [v42 components:96 fromDate:v17];

    [v43 setMinute:0];
    v44 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v45 = [v44 dateFromComponents:v43];
    [v48 setDate:v45 animated:1];
  }
LABEL_26:
}

- (void)toggleValueChanged:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  tags = self->_tags;
  id v5 = NSNumber;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "tag"));
  id v8 = [(NSMutableDictionary *)tags objectForKeyedSubscript:v7];

  objc_msgSend(v8, "setIsOn:", objc_msgSend(v6, "isOn"));
  int v9 = [v6 isOn];

  uint64_t v10 = [v8 identifier];
  if (v10 == @"DaysOfWeekRow"
    || (id v11 = v10) != 0
    && (int v12 = [(__CFString *)v10 isEqualToString:@"DaysOfWeekRow"],
        v11,
        v11,
        v12))
  {
    p_configuration = &self->_configuration;
    id v14 = [(PKPassShareTimeConfiguration *)self->_configuration schedules];
    uint64_t v15 = [v14 firstObject];

    if (!v9)
    {
      [v15 setDaysOfWeek:0];
      goto LABEL_18;
    }
    if (!v15)
    {
      uint64_t v15 = [MEMORY[0x1E4F848D0] emptySchedule];
    }
    [v15 setDaysOfWeek:MEMORY[0x1E4F1CBF0]];
    id v16 = *p_configuration;
    v25[0] = v15;
    v17 = (void *)MEMORY[0x1E4F1C978];
    id v18 = (void **)v25;
LABEL_15:
    v23 = [v17 arrayWithObjects:v18 count:1];
    [(PKPassShareTimeConfiguration *)v16 setSchedules:v23];

LABEL_18:
    [(PKPassShareScheduleSectionControllerDelegate *)self->_delegate timeConfigurationDidChange:*p_configuration];

    goto LABEL_19;
  }
  v19 = [v8 identifier];
  if (v19 == @"HoursOfDayRow"
    || (v20 = v19) != 0
    && (int v21 = [(__CFString *)v19 isEqualToString:@"HoursOfDayRow"],
        v20,
        v20,
        v21))
  {
    p_configuration = &self->_configuration;
    v22 = [(PKPassShareTimeConfiguration *)self->_configuration schedules];
    uint64_t v15 = [v22 firstObject];

    if (!v9)
    {
      [v15 setHoursOfDay:0];
      goto LABEL_18;
    }
    if (!v15)
    {
      uint64_t v15 = [MEMORY[0x1E4F848D0] emptySchedule];
    }
    [v15 setHoursOfDay:&unk_1EF2BA038];
    id v16 = *p_configuration;
    v24 = v15;
    v17 = (void *)MEMORY[0x1E4F1C978];
    id v18 = &v24;
    goto LABEL_15;
  }
LABEL_19:
  [(PKPassShareScheduleSectionController *)self _updateRowsIfNecessary];
  [(PKPassShareScheduleSectionControllerDelegate *)self->_delegate reloadDataAnimated:1];
}

- (void)didSelectItem:(id)a3
{
  id v12 = a3;
  int v4 = [v12 isSelectable];
  id v5 = v12;
  if (v4)
  {
    id v6 = [v12 identifier];
    uint64_t v7 = v6;
    if (v6 != @"StartDateRow")
    {
      if (!v6)
      {
LABEL_6:

        id v5 = v12;
        goto LABEL_7;
      }
      int v8 = [(__CFString *)v6 isEqualToString:@"StartDateRow"];

      if (!v8)
      {
        int v9 = v7;
        if (v9 == @"EndDateRow"
          || (uint64_t v10 = v9,
              int v11 = [(__CFString *)v9 isEqualToString:@"EndDateRow"],
              v10,
              v11))
        {
          [(PKPassShareScheduleSectionControllerDelegate *)self->_delegate didSelectEditEndDate];
        }
        goto LABEL_6;
      }
    }
    [(PKPassShareScheduleSectionControllerDelegate *)self->_delegate didSelectEditStartDate];
    goto LABEL_6;
  }
LABEL_7:
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return [a3 isSelectable];
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  if (PKEqualObjects())
  {
    uint64_t v7 = &OBJC_IVAR___PKPassShareScheduleSectionController__dayRowItems;
  }
  else
  {
    if (!PKEqualObjects()) {
      goto LABEL_6;
    }
    uint64_t v7 = &OBJC_IVAR___PKPassShareScheduleSectionController__dateRowItems;
  }
  [v6 appendItems:*(Class *)((char *)&self->super.super.super.isa + *v7)];
LABEL_6:

  return v6;
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_showTimeLimitHeader) {
    goto LABEL_10;
  }
  id v5 = [(PKPaymentSetupListSectionController *)self identifiers];
  id v6 = [v5 firstObject];
  id v7 = v4;
  int v8 = v7;
  if (v6 == v7)
  {

    goto LABEL_8;
  }
  if (v7 && v6)
  {
    char v9 = [v6 isEqualToString:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_8:
    uint64_t v10 = PKLocalizedShareableCredentialString(&cfstr_ShareSchedules_3.isa);
    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    v17[0] = *MEMORY[0x1E4FB06F8];
    id v12 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB27B8], 2, 0);
    v18[0] = v12;
    v17[1] = *MEMORY[0x1E4FB0700];
    uint64_t v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v18[1] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    uint64_t v15 = (void *)[v11 initWithString:v10 attributes:v14];

    goto LABEL_11;
  }

LABEL_10:
  uint64_t v15 = 0;
LABEL_11:

  return v15;
}

- (void)_updateRowsIfNecessary
{
  v80[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PKPassShareTimeConfiguration *)self->_possibleTimeConfiguration support];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v5 = 0x1E4FB1000uLL;
  if (v3 > 1
    || !self->_isEditable
    && ([(PKPassShareTimeConfiguration *)self->_configuration schedules],
        v59 = objc_claimAutoreleasedReturnValue(),
        v59,
        v59))
  {
    unint64_t v68 = v3;
    id v69 = v4;
    [v4 addObject:@"DayModifierSection"];
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = [PKPassShareScheduleRowItem alloc];
    int v8 = PKLocalizedShareableCredentialString(&cfstr_ShareScheduleD_0.isa);
    char v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"calendar"];
    uint64_t v10 = [(PKPassShareScheduleRowItem *)v7 initWithTitle:v8 icon:v9];

    [(PKPassShareScheduleRowItem *)v10 setIdentifier:@"DaysOfWeekRow"];
    [(PKPassShareScheduleRowItem *)v10 setSelectable:0];
    id v11 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
    [(PKPassShareScheduleRowItem *)v10 setConfiguration:v11];

    [(PKPassShareScheduleRowItem *)v10 setHasToggle:1];
    [(PKPassShareScheduleRowItem *)v10 setUserInteractionEnabled:self->_isEditable];
    [(NSMutableArray *)v6 addObject:v10];
    id v12 = [(PKPassShareTimeConfiguration *)self->_configuration schedules];
    uint64_t v13 = [v12 firstObject];

    v66 = [v13 daysOfWeek];
    if (v66 && !self->_isDisabled)
    {
      [(PKPassShareScheduleRowItem *)v10 setIsOn:1];
      id v14 = [[PKPassShareScheduleRowItem alloc] initWithTitle:0 icon:0];
      [(PKPassShareScheduleRowItem *)v14 setIdentifier:@"DaysSelectionRow"];
      [(PKPassShareScheduleRowItem *)v14 setHasDayPicker:1];
      [(PKPassShareScheduleRowItem *)v14 setUserInteractionEnabled:self->_isEditable];
      [(NSMutableArray *)v6 addObject:v14];
    }
    uint64_t v15 = [PKPassShareScheduleRowItem alloc];
    id v16 = PKLocalizedShareableCredentialString(&cfstr_ShareScheduleT.isa);
    v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"clock.fill"];
    id v18 = [(PKPassShareScheduleRowItem *)v15 initWithTitle:v16 icon:v17];

    [(PKPassShareScheduleRowItem *)v18 setIdentifier:@"HoursOfDayRow"];
    [(PKPassShareScheduleRowItem *)v18 setSelectable:0];
    v19 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
    [(PKPassShareScheduleRowItem *)v18 setConfiguration:v19];

    [(PKPassShareScheduleRowItem *)v18 setHasToggle:1];
    [(PKPassShareScheduleRowItem *)v18 setUserInteractionEnabled:self->_isEditable];
    v70 = v6;
    [(NSMutableArray *)v6 addObject:v18];
    v67 = v13;
    v20 = [v13 hoursOfDay];
    int v21 = [(PKPassShareTimeConfiguration *)self->_possibleTimeConfiguration schedules];
    v22 = [v21 firstObject];
    v23 = [v22 hoursOfDay];

    if (v20 && !self->_isDisabled)
    {
      [(PKPassShareScheduleRowItem *)v18 setIsOn:1];
      v24 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint64_t v25 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      v26 = [MEMORY[0x1E4F1C9C8] now];
      int v27 = [v25 components:96 fromDate:v26];

      [v27 setMinute:0];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __62__PKPassShareScheduleSectionController__updateRowsIfNecessary__block_invoke;
      aBlock[3] = &unk_1E59D56C8;
      id v78 = v27;
      id v79 = v24;
      id v28 = v24;
      id v65 = v27;
      v29 = (void (**)(void))_Block_copy(aBlock);
      uint64_t v30 = [v23 firstObject];
      uint64_t v31 = [v30 integerValue];

      v32 = 0;
      if ([v23 count] && v31 != 1)
      {
        v32 = v29[2](v29);
      }
      v33 = [v23 lastObject];
      uint64_t v34 = [v33 integerValue];

      v35 = 0;
      if ([v23 count] && v34 != 24)
      {
        v35 = ((void (*)(void (**)(void), uint64_t))v29[2])(v29, v34);
      }
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __62__PKPassShareScheduleSectionController__updateRowsIfNecessary__block_invoke_2;
      v71[3] = &unk_1E59D56F0;
      id v72 = v32;
      id v73 = v35;
      id v76 = v29;
      v74 = self;
      v75 = v70;
      id v64 = v35;
      id v63 = v32;
      v62 = v29;
      v36 = (void (**)(void *, void *, __CFString *, uint64_t))_Block_copy(v71);
      v37 = PKLocalizedShareableCredentialString(&cfstr_ShareScheduleS.isa);
      v38 = [v20 firstObject];
      v36[2](v36, v37, @"StartHourRow", [v38 integerValue] - 1);

      v39 = PKLocalizedShareableCredentialString(&cfstr_ShareScheduleE.isa);
      v40 = [v20 lastObject];
      v36[2](v36, v39, @"EndHourRow", [v40 integerValue]);
    }
    dayRowItems = self->_dayRowItems;
    self->_dayRowItems = v70;

    unint64_t v3 = v68;
    id v4 = v69;
    unint64_t v5 = 0x1E4FB1000;
  }
  if (!v3)
  {
    if (self->_isEditable) {
      goto LABEL_19;
    }
    v60 = [(PKPassShareTimeConfiguration *)self->_configuration startDate];
    if (v60)
    {
    }
    else
    {
      v61 = [(PKPassShareTimeConfiguration *)self->_configuration expirationDate];

      if (!v61) {
        goto LABEL_19;
      }
    }
  }
  [v4 addObject:@"DateModifierSection"];
  unint64_t v42 = v5;
  v43 = [PKPassShareScheduleRowItem alloc];
  v44 = PKLocalizedShareableCredentialString(&cfstr_ShareScheduleS_0.isa);
  v45 = [(PKPassShareScheduleRowItem *)v43 initWithTitle:v44 icon:0];

  [(PKPassShareScheduleRowItem *)v45 setIdentifier:@"StartDateRow"];
  [(PKPassShareScheduleRowItem *)v45 setSelectable:self->_isEditable];
  [(PKPassShareScheduleRowItem *)v45 setUserInteractionEnabled:self->_isEditable];
  v46 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  [(PKPassShareScheduleRowItem *)v45 setConfiguration:v46];

  v47 = [(PKPassShareTimeConfiguration *)self->_configuration startDate];
  v48 = [(PKPassShareScheduleSectionController *)self _formattedDate:v47];
  [(PKPassShareScheduleRowItem *)v45 setValue:v48];

  v49 = [*(id *)(v5 + 2072) systemImageNamed:@"calendar"];
  [(PKPassShareScheduleRowItem *)v45 setIcon:v49];

  v50 = [PKPassShareScheduleRowItem alloc];
  v51 = PKLocalizedShareableCredentialString(&cfstr_ShareScheduleE_0.isa);
  __int16 v52 = [(PKPassShareScheduleRowItem *)v50 initWithTitle:v51 icon:0];

  [(PKPassShareScheduleRowItem *)v52 setIdentifier:@"EndDateRow"];
  [(PKPassShareScheduleRowItem *)v52 setSelectable:self->_isEditable];
  [(PKPassShareScheduleRowItem *)v52 setUserInteractionEnabled:self->_isEditable];
  v53 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  [(PKPassShareScheduleRowItem *)v52 setConfiguration:v53];

  __int16 v54 = [(PKPassShareTimeConfiguration *)self->_configuration expirationDate];
  id v55 = [(PKPassShareScheduleSectionController *)self _formattedDate:v54];
  [(PKPassShareScheduleRowItem *)v52 setValue:v55];

  uint64_t v56 = [*(id *)(v42 + 2072) systemImageNamed:@"calendar"];
  [(PKPassShareScheduleRowItem *)v52 setIcon:v56];

  v80[0] = v45;
  v80[1] = v52;
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
  dateRowItems = self->_dateRowItems;
  self->_dateRowItems = v57;

LABEL_19:
  [(PKPaymentSetupListSectionController *)self setIdentifiers:v4];
}

uint64_t __62__PKPassShareScheduleSectionController__updateRowsIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setHour:a2];
  uint64_t v4 = *(void *)(a1 + 32);
  unint64_t v3 = *(void **)(a1 + 40);

  return [v3 dateFromComponents:v4];
}

void __62__PKPassShareScheduleSectionController__updateRowsIfNecessary__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  char v9 = [[PKPassShareScheduleRowItem alloc] initWithTitle:v6 icon:0];

  [(PKPassShareScheduleRowItem *)v9 setIdentifier:v5];
  [(PKPassShareScheduleRowItem *)v9 setSelectable:0];
  id v7 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  [(PKPassShareScheduleRowItem *)v9 setConfiguration:v7];

  [(PKPassShareScheduleRowItem *)v9 setHasTimePicker:1];
  int v8 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  [(PKPassShareScheduleRowItem *)v9 setDate:v8];

  [(PKPassShareScheduleRowItem *)v9 setMinimumDate:*(void *)(a1 + 32)];
  [(PKPassShareScheduleRowItem *)v9 setMaximumDate:*(void *)(a1 + 40)];
  [(PKPassShareScheduleRowItem *)v9 setUserInteractionEnabled:*(unsigned __int8 *)(*(void *)(a1 + 48) + 104)];
  [*(id *)(a1 + 56) addObject:v9];
}

- (id)_formattedDate:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v7 = @"SHARE_SCHEDULE_DATE_NEVER";
    goto LABEL_5;
  }
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int v6 = [v5 isDateInToday:v4];

  if (v6)
  {
    id v7 = @"SHARE_SCHEDULE_DATE_TODAY";
LABEL_5:
    uint64_t v8 = PKLocalizedShareableCredentialString(&v7->isa);
    goto LABEL_9;
  }
  formatter = self->_formatter;
  if (!formatter)
  {
    uint64_t v10 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v11 = self->_formatter;
    self->_formatter = v10;

    [(NSDateFormatter *)self->_formatter setLocalizedDateFormatFromTemplate:@"E, d MMM, yyyy"];
    formatter = self->_formatter;
  }
  uint64_t v8 = [(NSDateFormatter *)formatter stringFromDate:v4];
LABEL_9:
  id v12 = (void *)v8;

  return v12;
}

- (void)weekdaySelector:(id)a3 didUpdateSelectedWeekdays:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  configuration = self->_configuration;
  id v6 = a4;
  id v7 = [(PKPassShareTimeConfiguration *)configuration schedules];
  uint64_t v8 = [v7 firstObject];
  char v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F848D0] emptySchedule];
  }
  id v11 = v10;

  [v11 setDaysOfWeek:v6];
  id v12 = self->_configuration;
  v14[0] = v11;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [(PKPassShareTimeConfiguration *)v12 setSchedules:v13];

  [(PKPassShareScheduleSectionControllerDelegate *)self->_delegate timeConfigurationDidChange:self->_configuration];
}

- (PKPassShareTimeConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (BOOL)showTimeLimitHeader
{
  return self->_showTimeLimitHeader;
}

- (void)setShowTimeLimitHeader:(BOOL)a3
{
  self->_showTimeLimitHeader = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_possibleTimeConfiguration, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_dateRowItems, 0);

  objc_storeStrong((id *)&self->_dayRowItems, 0);
}

@end
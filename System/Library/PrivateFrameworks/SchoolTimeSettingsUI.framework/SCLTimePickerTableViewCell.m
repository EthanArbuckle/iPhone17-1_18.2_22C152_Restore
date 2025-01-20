@interface SCLTimePickerTableViewCell
- (NSCalendar)calendar;
- (NSDate)selectedDate;
- (NSDateInterval)constraintInterval;
- (SCLTimePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (SCLTimePickerTableViewCellDelegate)delegate;
- (UIDatePicker)datePicker;
- (void)_updateConstraintModeWithInterval:(id)a3 selectedDate:(id)a4;
- (void)datePickerDidChangeDate:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setConstraintInterval:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedDate:(id)a3;
@end

@implementation SCLTimePickerTableViewCell

- (SCLTimePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v31[3] = *MEMORY[0x263EF8340];
  v30.receiver = self;
  v30.super_class = (Class)SCLTimePickerTableViewCell;
  v4 = [(SCLTimePickerTableViewCell *)&v30 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v4->_constraintMode = 0;
    id v6 = objc_alloc(MEMORY[0x263F1C5B0]);
    v7 = [(SCLTimePickerTableViewCell *)v5 contentView];
    [v7 frame];
    uint64_t v8 = objc_msgSend(v6, "initWithFrame:");
    datePicker = v5->_datePicker;
    v5->_datePicker = (UIDatePicker *)v8;

    [(UIDatePicker *)v5->_datePicker setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIDatePicker *)v5->_datePicker setDatePickerMode:0];
    [(UIDatePicker *)v5->_datePicker setPreferredDatePickerStyle:1];
    [(UIDatePicker *)v5->_datePicker addTarget:v5 action:sel_datePickerDidChangeDate_ forControlEvents:4096];
    v10 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    dateFormatter = v5->_dateFormatter;
    v5->_dateFormatter = v10;

    [(NSDateFormatter *)v5->_dateFormatter setTimeStyle:1];
    [(NSDateFormatter *)v5->_dateFormatter setDateStyle:1];
    v12 = (NSDateIntervalFormatter *)objc_alloc_init(MEMORY[0x263F087A8]);
    intervalFormatter = v5->_intervalFormatter;
    v5->_intervalFormatter = v12;

    [(NSDateIntervalFormatter *)v5->_intervalFormatter setTimeStyle:1];
    [(NSDateIntervalFormatter *)v5->_intervalFormatter setDateStyle:1];
    [(UIDatePicker *)v5->_datePicker sizeToFit];
    v14 = [(SCLTimePickerTableViewCell *)v5 contentView];
    [v14 addSubview:v5->_datePicker];

    v15 = [(UIDatePicker *)v5->_datePicker topAnchor];
    v16 = [(SCLTimePickerTableViewCell *)v5 contentView];
    v17 = [v16 topAnchor];
    v18 = [v15 constraintEqualToAnchor:v17];

    v19 = [(UIDatePicker *)v5->_datePicker bottomAnchor];
    v20 = [(SCLTimePickerTableViewCell *)v5 contentView];
    v21 = [v20 bottomAnchor];
    v22 = [v19 constraintEqualToAnchor:v21];

    v23 = [(UIDatePicker *)v5->_datePicker centerXAnchor];
    v24 = [(SCLTimePickerTableViewCell *)v5 contentView];
    v25 = [v24 centerXAnchor];
    v26 = [v23 constraintEqualToAnchor:v25];

    v27 = (void *)MEMORY[0x263F08938];
    v31[0] = v18;
    v31[1] = v22;
    v31[2] = v26;
    v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:3];
    [v27 activateConstraints:v28];
  }
  return v5;
}

- (void)setCalendar:(id)a3
{
  datePicker = self->_datePicker;
  id v7 = a3;
  [(UIDatePicker *)datePicker setCalendar:v7];
  v5 = self->_datePicker;
  id v6 = [v7 timeZone];
  [(UIDatePicker *)v5 setTimeZone:v6];

  [(NSDateIntervalFormatter *)self->_intervalFormatter setCalendar:v7];
  [(NSDateFormatter *)self->_dateFormatter setCalendar:v7];
}

- (NSCalendar)calendar
{
  return [(UIDatePicker *)self->_datePicker calendar];
}

- (void)setConstraintInterval:(id)a3
{
  id v4 = a3;
  v5 = (NSDateInterval *)[v4 copy];
  constraintInterval = self->_constraintInterval;
  self->_constraintInterval = v5;

  id v7 = [(UIDatePicker *)self->_datePicker date];
  [(SCLTimePickerTableViewCell *)self _updateConstraintModeWithInterval:v4 selectedDate:v7];
}

- (void)setSelectedDate:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SCLTimePickerTableViewCell *)self datePicker];
  id v6 = [v5 date];
  int v7 = [v4 isEqualToDate:v6];

  uint64_t v8 = scl_framework_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v4];
    int v10 = 138412546;
    v11 = v9;
    __int16 v12 = 1024;
    int v13 = v7 ^ 1;
    _os_log_impl(&dword_22F0CF000, v8, OS_LOG_TYPE_INFO, "Set Selected Date: %@; shouldSet=%{BOOL}d",
      (uint8_t *)&v10,
      0x12u);
  }
  if ((v7 & 1) == 0) {
    [(UIDatePicker *)self->_datePicker setDate:v4];
  }
}

- (NSDate)selectedDate
{
  return [(UIDatePicker *)self->_datePicker date];
}

- (void)datePickerDidChangeDate:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 date];
  id v6 = scl_framework_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v5];
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_constraintMode];
    *(_DWORD *)buf = 138412546;
    v39 = v7;
    __int16 v40 = 2112;
    uint64_t v41 = (uint64_t)v8;
    _os_log_impl(&dword_22F0CF000, v6, OS_LOG_TYPE_INFO, "Did pick date: %@; constraintMode = %@", buf, 0x16u);
  }
  if (self->_constraintMode == 2 && ![(NSDateInterval *)self->_constraintInterval containsDate:v5])
  {
    v9 = [(SCLTimePickerTableViewCell *)self calendar];
    int v10 = [v9 components:96 fromDate:v5];
    if ([v10 hour] || objc_msgSend(v10, "minute"))
    {
      v11 = [(NSDateInterval *)self->_constraintInterval startDate];
      __int16 v12 = [v9 components:33022 fromDate:v11];

      id v13 = [v12 copy];
      objc_msgSend(v13, "setHour:", objc_msgSend(v10, "hour"));
      objc_msgSend(v13, "setMinute:", objc_msgSend(v10, "minute"));
      uint64_t v14 = [v9 dateFromComponents:v13];

      if ([(NSDateInterval *)self->_constraintInterval containsDate:v14])
      {
        v15 = scl_framework_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v36 = v12;
          v35 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v14];
          dateFormatter = self->_dateFormatter;
          uint64_t v17 = [v4 date];
          v18 = dateFormatter;
          v19 = (void *)v17;
          uint64_t v20 = -[NSDateFormatter stringFromDate:](v18, "stringFromDate:");
          *(_DWORD *)buf = 138412546;
          v39 = v35;
          __int16 v40 = 2112;
          uint64_t v41 = v20;
          v21 = (void *)v20;
          _os_log_impl(&dword_22F0CF000, v15, OS_LOG_TYPE_INFO, "Normalizing back to date %@ from %@", buf, 0x16u);

          __int16 v12 = v36;
        }

        [v4 setDate:v14 animated:0];
      }
      else
      {
        uint64_t v22 = [v10 hour];
        uint64_t v23 = [v10 minute] + 60 * v22;
        uint64_t v24 = [v12 hour];
        v37 = v12;
        uint64_t v25 = [v12 minute] - v23 + 60 * v24;
        if (v25 < 0) {
          uint64_t v25 = -v25;
        }
        constraintInterval = self->_constraintInterval;
        if (v25 <= v23) {
          [(NSDateInterval *)constraintInterval startDate];
        }
        else {
        uint64_t v27 = [(NSDateInterval *)constraintInterval endDate];
        }

        v28 = scl_framework_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          [(NSDateFormatter *)self->_dateFormatter stringFromDate:v27];
          v29 = uint64_t v34 = v27;
          objc_super v30 = self->_dateFormatter;
          v31 = [v4 date];
          v32 = [(NSDateFormatter *)v30 stringFromDate:v31];
          *(_DWORD *)buf = 138412546;
          v39 = v29;
          __int16 v40 = 2112;
          uint64_t v41 = (uint64_t)v32;
          _os_log_impl(&dword_22F0CF000, v28, OS_LOG_TYPE_INFO, "Date %@ falls outside of constraint interval. Setting to %@", buf, 0x16u);

          uint64_t v27 = v34;
        }

        [v4 setDate:v27 animated:1];
        uint64_t v14 = (void *)v27;
        __int16 v12 = v37;
      }

      v5 = v14;
    }
    else
    {
      __int16 v12 = scl_framework_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F0CF000, v12, OS_LOG_TYPE_INFO, "Picked midnight", buf, 2u);
      }
    }
  }
  [(SCLTimePickerTableViewCell *)self _updateConstraintModeWithInterval:self->_constraintInterval selectedDate:v5];
  v33 = [(SCLTimePickerTableViewCell *)self delegate];
  [v33 timePickerCell:self didUpdateDate:v5];
}

- (void)_updateConstraintModeWithInterval:(id)a3 selectedDate:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [(SCLTimePickerTableViewCell *)self calendar];
    v9 = scl_framework_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = [(NSDateIntervalFormatter *)self->_intervalFormatter stringFromDateInterval:v6];
      v11 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v7];
      int v20 = 138412546;
      v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = v11;
      _os_log_impl(&dword_22F0CF000, v9, OS_LOG_TYPE_INFO, "Update constraint with interval %@; selected date %@",
        (uint8_t *)&v20,
        0x16u);
    }
    __int16 v12 = [v6 endDate];
    id v13 = [v8 components:96 fromDate:v12];

    if ([v13 hour] || objc_msgSend(v13, "minute"))
    {
      self->_constraintMode = 1;
      datePicker = self->_datePicker;
      v15 = [v6 startDate];
      [(UIDatePicker *)datePicker setMinimumDate:v15];

      v16 = self->_datePicker;
      uint64_t v17 = [v6 endDate];
      [(UIDatePicker *)v16 setMaximumDate:v17];

      v18 = scl_framework_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = [(NSDateIntervalFormatter *)self->_intervalFormatter stringFromDateInterval:v6];
        int v20 = 138412290;
        v21 = v19;
        _os_log_impl(&dword_22F0CF000, v18, OS_LOG_TYPE_INFO, "Setting constraint mode to picker: %@", (uint8_t *)&v20, 0xCu);
      }
    }
    else
    {
      self->_constraintMode = 2;
      [(UIDatePicker *)self->_datePicker setMinimumDate:0];
      [(UIDatePicker *)self->_datePicker setMaximumDate:0];
      v18 = scl_framework_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_22F0CF000, v18, OS_LOG_TYPE_INFO, "Setting constraint mode to manual workaround", (uint8_t *)&v20, 2u);
      }
    }
  }
  else
  {
    self->_constraintMode = 0;
    [(UIDatePicker *)self->_datePicker setMinimumDate:0];
    [(UIDatePicker *)self->_datePicker setMaximumDate:0];
    uint64_t v8 = scl_framework_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_22F0CF000, v8, OS_LOG_TYPE_INFO, "Setting constraint mode to  none", (uint8_t *)&v20, 2u);
    }
  }
}

- (UIDatePicker)datePicker
{
  return (UIDatePicker *)objc_getProperty(self, a2, 1040, 1);
}

- (NSDateInterval)constraintInterval
{
  return self->_constraintInterval;
}

- (SCLTimePickerTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SCLTimePickerTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_constraintInterval, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_intervalFormatter, 0);

  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end
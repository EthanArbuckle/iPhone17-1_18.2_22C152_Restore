@interface UICalendarSelectionSingleDate
- (BOOL)_selectionFollowsMonthSelection;
- (BOOL)canSelectDate:(id)a3;
- (BOOL)shouldDeselectDate:(id)a3;
- (NSDateComponents)selectedDate;
- (UICalendarSelectionSingleDate)initWithDelegate:(id)delegate;
- (id)delegate;
- (void)_sendDelegateForSelectedDateChange;
- (void)didChangeAvailableDateRange:(id)a3;
- (void)didChangeCalendar:(id)a3;
- (void)didChangeVisibleMonth:(id)a3;
- (void)didDeselectDate:(id)a3;
- (void)didMoveToCalendarView;
- (void)didSelectDate:(id)a3;
- (void)selectAllDatesAnimated:(BOOL)a3;
- (void)setSelectedDate:(NSDateComponents *)selectedDate;
- (void)setSelectedDate:(NSDateComponents *)selectedDate animated:(BOOL)animated;
- (void)set_selectionFollowsMonthSelection:(BOOL)a3;
- (void)willMoveToCalendarView:(id)a3;
@end

@implementation UICalendarSelectionSingleDate

- (UICalendarSelectionSingleDate)initWithDelegate:(id)delegate
{
  id v4 = delegate;
  v9.receiver = self;
  v9.super_class = (Class)UICalendarSelectionSingleDate;
  v5 = [(UICalendarSelection *)&v9 _init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(v5 + 3, v4);
    *((unsigned char *)v6 + 16) = (_BYTE)v6[2] & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v7 = 2;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)v6 + 16) = (_BYTE)v6[2] & 0xFD | v7;
  }

  return (UICalendarSelectionSingleDate *)v6;
}

- (void)setSelectedDate:(NSDateComponents *)selectedDate
{
}

- (void)setSelectedDate:(NSDateComponents *)selectedDate animated:(BOOL)animated
{
  BOOL v4 = animated;
  v25[1] = *MEMORY[0x1E4F143B8];
  char v7 = selectedDate;
  v8 = self->_selectedDate;
  objc_super v9 = v7;
  v10 = v9;
  if (v8 == v9)
  {

    goto LABEL_7;
  }
  if (!v9 || !v8)
  {

    if (!v10) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  int v11 = [(NSDateComponents *)v8 isEqual:v9];

  if (v11)
  {
LABEL_7:
    [(UICalendarSelectionSingleDate *)self selectAllDatesAnimated:v4];
    goto LABEL_18;
  }
LABEL_9:
  v12 = v10;
  if ([(NSDateComponents *)v12 year] == 0x7FFFFFFFFFFFFFFFLL
    || [(NSDateComponents *)v12 month] == 0x7FFFFFFFFFFFFFFFLL)
  {
  }
  else
  {
    uint64_t v14 = [(NSDateComponents *)v12 day];

    if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_14;
    }
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"UICalendarSelectionSingleDate.m", 50, @"dateComponents (%@) is invalid. It requires at least [.year, .month, .day]", v12 object file lineNumber description];

LABEL_14:
  if (self->_selectedDate)
  {
    v15 = [(UICalendarSelection *)self view];
    v25[0] = self->_selectedDate;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [v15 _deselectDates:v16 animated:v4];
  }
  v17 = [(UICalendarSelection *)self view];
  v18 = [v17 calendar];
  _UICalendarSanitizeWithCalendar(v10, v18);
  v19 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  v20 = self->_selectedDate;
  self->_selectedDate = v19;

  if (self->_selectedDate)
  {
    v21 = [(UICalendarSelection *)self view];
    v24 = self->_selectedDate;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    [v21 _selectDates:v22 animated:v4];

    v23 = [(UICalendarSelection *)self view];
    [v23 setVisibleDateComponents:self->_selectedDate animated:v4];
  }
LABEL_18:
}

- (void)willMoveToCalendarView:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(UICalendarSelection *)self view];

  if (v5 != v4)
  {
    if (self->_selectedDate)
    {
      v6 = [(UICalendarSelection *)self view];
      v8[0] = self->_selectedDate;
      char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
      [v6 _deselectDates:v7 animated:0];
    }
  }
}

- (void)didMoveToCalendarView
{
  v3 = [(UICalendarSelection *)self view];
  [v3 setAllowsMultipleSelection:1];

  id v4 = [(UICalendarSelectionSingleDate *)self selectedDate];
  id v5 = [(UICalendarSelection *)self view];
  v6 = [v5 calendar];
  _UICalendarSanitizeWithCalendar(v4, v6);
  char v7 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  selectedDate = self->_selectedDate;
  self->_selectedDate = v7;

  [(UICalendarSelectionSingleDate *)self selectAllDatesAnimated:0];
  if (self->_selectedDate)
  {
    id v9 = [(UICalendarSelection *)self view];
    [v9 setVisibleDateComponents:self->_selectedDate animated:0];
  }
}

- (void)didChangeCalendar:(id)a3
{
  id v4 = a3;
  id v7 = [(UICalendarSelectionSingleDate *)self selectedDate];
  _UICalendarSanitizeWithCalendar(v7, v4);
  id v5 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();

  selectedDate = self->_selectedDate;
  self->_selectedDate = v5;
}

- (void)didChangeAvailableDateRange:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (self->_selectedDate)
  {
    id v4 = a3;
    id v5 = [(UICalendarSelectionSingleDate *)self selectedDate];
    uint64_t v6 = [(UICalendarSelection *)self view];
    id v7 = [(id)v6 calendar];
    v8 = [v7 dateFromComponents:v5];

    LOBYTE(v6) = [v4 containsDate:v8];
    if ((v6 & 1) == 0)
    {
      id v9 = [(UICalendarSelection *)self view];
      v12[0] = v5;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      [v9 _deselectDates:v10 animated:0];

      selectedDate = self->_selectedDate;
      self->_selectedDate = 0;
    }
  }
}

- (void)didChangeVisibleMonth:(id)a3
{
  id v21 = a3;
  if (self->_selectedDate
    && [(UICalendarSelectionSingleDate *)self _selectionFollowsMonthSelection])
  {
    id v4 = [(UICalendarSelection *)self view];
    id v5 = [v4 _dataModel];
    uint64_t v6 = [v5 effectiveCalendar];

    id v7 = [_UIDatePickerCalendarMonth alloc];
    v8 = [v6 dateFromComponents:v21];
    id v9 = [(_UIDatePickerCalendarDateComponent *)v7 initWithDate:v8 calendar:v6];

    v10 = [_UIDatePickerCalendarDay alloc];
    int v11 = [(NSDateComponents *)self->_selectedDate date];
    v12 = [(_UIDatePickerCalendarDay *)v10 initWithDate:v11 calendar:v6];

    v13 = [(_UIDatePickerCalendarMonth *)v9 dayMatchingOrdinalDay:v12];
    uint64_t v14 = [(UICalendarSelection *)self view];
    v15 = [v14 _dataModel];
    v16 = [v15 availableDateRange];

    if ((objc_msgSend(v16, "_ui_containsDay:", v13) & 1) == 0)
    {
      v17 = [v13 date];
      v18 = objc_msgSend(v16, "_ui_dateInRangeForDate:", v17);

      v19 = [[_UIDatePickerCalendarDay alloc] initWithDate:v18 calendar:v6];
      v13 = v19;
    }
    v20 = [v13 components];
    [(UICalendarSelectionSingleDate *)self setSelectedDate:v20];
    [(UICalendarSelectionSingleDate *)self didSelectDate:v20];
  }
}

- (BOOL)canSelectDate:(id)a3
{
  if ((*(unsigned char *)&self->_delegateImplements & 1) == 0) {
    return 1;
  }
  id v4 = self;
  id v5 = a3;
  uint64_t v6 = [(UICalendarSelectionSingleDate *)v4 delegate];
  LOBYTE(v4) = [v6 dateSelection:v4 canSelectDate:v5];

  return (char)v4;
}

- (void)didSelectDate:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = (NSDateComponents *)a3;
  id v5 = [(UICalendarSelectionSingleDate *)self selectedDate];

  if (v5)
  {
    uint64_t v6 = [(UICalendarSelection *)self view];
    v9[0] = self->_selectedDate;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v6 _deselectDates:v7 animated:0];
  }
  selectedDate = self->_selectedDate;
  self->_selectedDate = v4;

  [(UICalendarSelectionSingleDate *)self _sendDelegateForSelectedDateChange];
}

- (BOOL)shouldDeselectDate:(id)a3
{
  if ((*(unsigned char *)&self->_delegateImplements & 1) == 0) {
    return 0;
  }
  id v4 = self;
  id v5 = [(UICalendarSelectionSingleDate *)self delegate];
  LOBYTE(v4) = [v5 dateSelection:v4 canSelectDate:0];

  return (char)v4;
}

- (void)didDeselectDate:(id)a3
{
  selectedDate = self->_selectedDate;
  self->_selectedDate = 0;

  [(UICalendarSelectionSingleDate *)self _sendDelegateForSelectedDateChange];
}

- (void)selectAllDatesAnimated:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (self->_selectedDate)
  {
    BOOL v3 = a3;
    id v5 = [(UICalendarSelection *)self view];
    v7[0] = self->_selectedDate;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [v5 _selectDates:v6 animated:v3];
  }
}

- (void)_sendDelegateForSelectedDateChange
{
  if ((*(unsigned char *)&self->_delegateImplements & 2) != 0)
  {
    id v3 = [(UICalendarSelectionSingleDate *)self delegate];
    [v3 dateSelection:self didSelectDate:self->_selectedDate];
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (NSDateComponents)selectedDate
{
  return self->_selectedDate;
}

- (BOOL)_selectionFollowsMonthSelection
{
  return self->__selectionFollowsMonthSelection;
}

- (void)set_selectionFollowsMonthSelection:(BOOL)a3
{
  self->__selectionFollowsMonthSelection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedDate, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
@interface _UICalendarRangeSelection
- (BOOL)canSelectDate:(id)a3;
- (BOOL)shouldDeselectDate:(id)a3;
- (_UICalendarDateRange)dateRange;
- (_UICalendarRangeSelection)init;
- (_UICalendarRangeSelection)initWithDelegate:(id)a3;
- (_UICalendarRangeSelectionDelegate)delegate;
- (id)_sanitizedDateRange:(id)a3 calendar:(id)a4;
- (void)_deselectDatesInRange:(id)a3 animated:(BOOL)a4;
- (void)didChangeAvailableDateRange:(id)a3;
- (void)didChangeCalendar:(id)a3;
- (void)didDeselectDate:(id)a3;
- (void)didMoveToCalendarView;
- (void)didSelectDate:(id)a3;
- (void)selectAllDatesAnimated:(BOOL)a3;
- (void)setDateRange:(id)a3;
- (void)setDateRange:(id)a3 animated:(BOOL)a4;
- (void)willMoveToCalendarView:(id)a3;
@end

@implementation _UICalendarRangeSelection

- (_UICalendarRangeSelection)init
{
  return [(_UICalendarRangeSelection *)self initWithDelegate:0];
}

- (_UICalendarRangeSelection)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UICalendarRangeSelection;
  v5 = [(UICalendarSelection *)&v11 _init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(v5 + 5, v4);
    *((unsigned char *)v6 + 16) = (_BYTE)v6[2] & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v7 = 2;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)v6 + 16) = (_BYTE)v6[2] & 0xFD | v7;
    if (objc_opt_respondsToSelector()) {
      char v8 = 4;
    }
    else {
      char v8 = 0;
    }
    *((unsigned char *)v6 + 16) = (_BYTE)v6[2] & 0xFB | v8;
    if (objc_opt_respondsToSelector()) {
      char v9 = 8;
    }
    else {
      char v9 = 0;
    }
    *((unsigned char *)v6 + 16) = (_BYTE)v6[2] & 0xF7 | v9;
  }

  return (_UICalendarRangeSelection *)v6;
}

- (void)setDateRange:(id)a3
{
}

- (void)setDateRange:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v30 = a3;
  v6 = [(UICalendarSelection *)self view];

  if (v6)
  {
    dateRange = self->_dateRange;
    char v8 = [(UICalendarSelection *)self view];
    char v9 = [v8 calendar];
    uint64_t v10 = [(_UICalendarDateRange *)dateRange allDatesInRangeForCalendar:v9];
    objc_super v11 = (void *)v10;
    v12 = (void *)MEMORY[0x1E4F1CBF0];
    if (v10) {
      v12 = (void *)v10;
    }
    v13 = v12;

    v14 = [MEMORY[0x1E4F1CA80] setWithArray:v13];
    v15 = [(UICalendarSelection *)self view];
    v16 = [v15 calendar];
    v17 = [(_UICalendarRangeSelection *)self _sanitizedDateRange:v30 calendar:v16];

    v18 = [(UICalendarSelection *)self view];
    v19 = [v18 calendar];
    uint64_t v20 = [v17 allDatesInRangeForCalendar:v19];
    v21 = (void *)v20;
    v22 = (void *)MEMORY[0x1E4F1CBF0];
    if (v20) {
      v22 = (void *)v20;
    }
    id v23 = v22;

    v24 = [MEMORY[0x1E4F1CAD0] setWithArray:v23];
    [v14 minusSet:v24];

    v25 = [(UICalendarSelection *)self view];
    v26 = [v14 allObjects];
    [v25 _deselectDates:v26 animated:v4];

    objc_storeStrong((id *)&self->_dateRange, v17);
    pendingStartDate = self->_pendingStartDate;
    self->_pendingStartDate = 0;

    v28 = [(UICalendarSelection *)self view];
    [v28 _selectDates:v23 animated:v4];

    id v30 = v17;
  }
  else
  {
    v14 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v29 = [(_UICalendarRangeSelection *)self _sanitizedDateRange:v30 calendar:v14];
    v13 = self->_dateRange;
    self->_dateRange = v29;
  }
}

- (void)willMoveToCalendarView:(id)a3
{
}

- (void)didMoveToCalendarView
{
  v3 = [(UICalendarSelection *)self view];
  if (v3)
  {
    dateRange = self->_dateRange;

    if (dateRange)
    {
      v5 = self->_dateRange;
      v6 = [(UICalendarSelection *)self view];
      char v7 = [v6 calendar];
      char v8 = [(_UICalendarRangeSelection *)self _sanitizedDateRange:v5 calendar:v7];
      char v9 = self->_dateRange;
      self->_dateRange = v8;
    }
  }
  uint64_t v10 = [(UICalendarSelection *)self view];
  [v10 setAllowsMultipleSelection:1];

  [(_UICalendarRangeSelection *)self selectAllDatesAnimated:0];
}

- (id)_sanitizedDateRange:(id)a3 calendar:(id)a4
{
  BOOL v4 = (_UICalendarDateRange *)a3;
  if (a3)
  {
    id v5 = a4;
    v6 = v4;
    char v7 = [(_UICalendarDateRange *)v6 startDate];
    char v8 = _UICalendarSanitizeWithCalendar(v7, v5);

    char v9 = [(_UICalendarDateRange *)v6 endDate];

    uint64_t v10 = _UICalendarSanitizeWithCalendar(v9, v5);

    BOOL v4 = [[_UICalendarDateRange alloc] initWithStartDate:v8 endDate:v10];
  }
  return v4;
}

- (BOOL)canSelectDate:(id)a3
{
  if ((*(unsigned char *)&self->_delegateImplements & 1) == 0) {
    return 1;
  }
  BOOL v4 = self;
  id v5 = a3;
  v6 = [(_UICalendarRangeSelection *)v4 delegate];
  LOBYTE(v4) = [v6 _calendarSelection:v4 canSelectDate:v5];

  return (char)v4;
}

- (BOOL)shouldDeselectDate:(id)a3
{
  return 1;
}

- (void)didSelectDate:(id)a3
{
  p_pendingStartDate = &self->_pendingStartDate;
  id v27 = a3;
  if (*p_pendingStartDate)
  {
    v6 = [(UICalendarSelection *)self view];
    char v7 = [v6 calendar];
    char v8 = [v7 dateFromComponents:*p_pendingStartDate];

    char v9 = [(UICalendarSelection *)self view];
    uint64_t v10 = [v9 calendar];
    objc_super v11 = [v10 dateFromComponents:v27];

    v12 = (NSDateComponents *)v27;
    uint64_t v13 = [v8 compare:v11];
    v14 = [_UICalendarDateRange alloc];
    if (v13 == 1)
    {
      v15 = [(_UICalendarDateRange *)v14 initWithStartDate:v12 endDate:*p_pendingStartDate];
      dateRange = self->_dateRange;
      self->_dateRange = v15;

      v17 = *p_pendingStartDate;
      *p_pendingStartDate = 0;

      v18 = *p_pendingStartDate;
      [(_UICalendarRangeSelection *)self selectAllDatesAnimated:0];
      if (v12 && (*(unsigned char *)&self->_delegateImplements & 2) != 0)
      {
        v19 = [(_UICalendarRangeSelection *)self delegate];
        [v19 _calendarRangeSelection:self didBeginSelectionWithDate:v12];
      }
    }
    else
    {
      v21 = [(_UICalendarDateRange *)v14 initWithStartDate:*p_pendingStartDate endDate:v12];
      v22 = self->_dateRange;
      self->_dateRange = v21;

      id v23 = *p_pendingStartDate;
      *p_pendingStartDate = 0;

      [(_UICalendarRangeSelection *)self selectAllDatesAnimated:0];
      v18 = v12;
      v12 = 0;
    }
    char delegateImplements = (char)self->_delegateImplements;
    if ((delegateImplements & 4) != 0)
    {
      v25 = [(_UICalendarRangeSelection *)self delegate];
      [v25 _calendarRangeSelection:self didEndSelectionWithDate:v18];

      char delegateImplements = (char)self->_delegateImplements;
    }
    if ((delegateImplements & 8) != 0)
    {
      v26 = [(_UICalendarRangeSelection *)self delegate];
      [v26 _calendarRangeSelection:self didSelectDateRange:self->_dateRange];
    }
  }
  else
  {
    [(_UICalendarRangeSelection *)self _deselectDatesInRange:self->_dateRange animated:0];
    uint64_t v20 = self->_dateRange;
    self->_dateRange = 0;

    objc_storeStrong((id *)&self->_pendingStartDate, a3);
    [(_UICalendarRangeSelection *)self selectAllDatesAnimated:0];
    if ((*(unsigned char *)&self->_delegateImplements & 2) == 0) {
      goto LABEL_15;
    }
    char v8 = [(_UICalendarRangeSelection *)self delegate];
    [v8 _calendarRangeSelection:self didBeginSelectionWithDate:v27];
  }

LABEL_15:
}

- (void)didDeselectDate:(id)a3
{
  id v15 = a3;
  p_pendingStartDate = &self->_pendingStartDate;
  pendingStartDate = self->_pendingStartDate;
  if (pendingStartDate)
  {
    char v7 = pendingStartDate;
    char v8 = [[_UICalendarDateRange alloc] initWithStartDate:v7 endDate:v7];
    dateRange = self->_dateRange;
    self->_dateRange = v8;

    uint64_t v10 = *p_pendingStartDate;
    *p_pendingStartDate = 0;

    [(_UICalendarRangeSelection *)self selectAllDatesAnimated:0];
    char delegateImplements = (char)self->_delegateImplements;
    if ((delegateImplements & 4) != 0)
    {
      v12 = [(_UICalendarRangeSelection *)self delegate];
      [v12 _calendarRangeSelection:self didEndSelectionWithDate:v7];

      char delegateImplements = (char)self->_delegateImplements;
    }
    if ((delegateImplements & 8) != 0)
    {
      uint64_t v13 = [(_UICalendarRangeSelection *)self delegate];
      [v13 _calendarRangeSelection:self didSelectDateRange:self->_dateRange];
    }
  }
  else
  {
    [(_UICalendarRangeSelection *)self _deselectDatesInRange:self->_dateRange animated:0];
    v14 = self->_dateRange;
    self->_dateRange = 0;

    objc_storeStrong((id *)&self->_pendingStartDate, a3);
    [(_UICalendarRangeSelection *)self selectAllDatesAnimated:0];
    if ((*(unsigned char *)&self->_delegateImplements & 2) == 0) {
      goto LABEL_9;
    }
    char v7 = [(_UICalendarRangeSelection *)self delegate];
    [(NSDateComponents *)v7 _calendarRangeSelection:self didBeginSelectionWithDate:v15];
  }

LABEL_9:
}

- (void)selectAllDatesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UICalendarSelection *)self view];

  if (v5)
  {
    id v11 = (id)objc_opt_new();
    dateRange = self->_dateRange;
    if (dateRange)
    {
      char v7 = [(UICalendarSelection *)self view];
      char v8 = [v7 calendar];
      char v9 = [(_UICalendarDateRange *)dateRange allDatesInRangeForCalendar:v8];
      [v11 addObjectsFromArray:v9];
    }
    if (self->_pendingStartDate) {
      objc_msgSend(v11, "addObject:");
    }
    uint64_t v10 = [(UICalendarSelection *)self view];
    [v10 _selectDates:v11 animated:v3];
  }
}

- (void)didChangeCalendar:(id)a3
{
  BOOL v4 = [(_UICalendarRangeSelection *)self _sanitizedDateRange:self->_dateRange calendar:a3];
  dateRange = self->_dateRange;
  self->_dateRange = v4;
}

- (void)didChangeAvailableDateRange:(id)a3
{
  id v4 = a3;
  if (self->_dateRange)
  {
    id v37 = v4;
    id v5 = [(UICalendarSelection *)self view];
    v6 = [v5 calendar];

    char v7 = [(_UICalendarDateRange *)self->_dateRange startDate];
    char v8 = [v7 date];
    char v9 = [v37 startDate];
    uint64_t v10 = [v8 compare:v9];

    if (v10 == -1)
    {
      id v11 = [(UICalendarSelection *)self view];
      v12 = [v11 calendar];
      uint64_t v13 = [v37 startDate];
      v14 = [v12 components:1048606 fromDate:v13];

      id v15 = [_UICalendarDateRange alloc];
      v16 = [(_UICalendarDateRange *)self->_dateRange startDate];
      v17 = [(_UICalendarDateRange *)v15 initWithStartDate:v16 endDate:v14];

      [(_UICalendarRangeSelection *)self _deselectDatesInRange:v17 animated:0];
      v18 = [_UICalendarDateRange alloc];
      v19 = [(_UICalendarDateRange *)self->_dateRange endDate];
      uint64_t v20 = [(_UICalendarDateRange *)v18 initWithStartDate:v14 endDate:v19];
      dateRange = self->_dateRange;
      self->_dateRange = v20;
    }
    v22 = [(_UICalendarDateRange *)self->_dateRange startDate];
    id v23 = [v22 date];
    v24 = [v37 endDate];
    uint64_t v25 = [v23 compare:v24];

    if (v25 == 1)
    {
      v26 = [(UICalendarSelection *)self view];
      id v27 = [v26 calendar];
      v28 = [v37 endDate];
      v29 = [v27 components:1048606 fromDate:v28];

      id v30 = [_UICalendarDateRange alloc];
      v31 = [(_UICalendarDateRange *)self->_dateRange endDate];
      v32 = [(_UICalendarDateRange *)v30 initWithStartDate:v29 endDate:v31];

      [(_UICalendarRangeSelection *)self _deselectDatesInRange:v32 animated:0];
      v33 = [_UICalendarDateRange alloc];
      v34 = [(_UICalendarDateRange *)self->_dateRange startDate];
      v35 = [(_UICalendarDateRange *)v33 initWithStartDate:v34 endDate:v29];
      v36 = self->_dateRange;
      self->_dateRange = v35;
    }
    id v4 = v37;
  }
}

- (void)_deselectDatesInRange:(id)a3 animated:(BOOL)a4
{
  id v10 = a3;
  id v5 = [(UICalendarSelection *)self view];

  if (v10 && v5)
  {
    v6 = [(UICalendarSelection *)self view];
    char v7 = [v6 calendar];
    char v8 = [v10 allDatesInRangeForCalendar:v7];

    char v9 = [(UICalendarSelection *)self view];
    [v9 _deselectDates:v8 animated:0];
  }
}

- (_UICalendarDateRange)dateRange
{
  return self->_dateRange;
}

- (_UICalendarRangeSelectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UICalendarRangeSelectionDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateRange, 0);
  objc_storeStrong((id *)&self->_pendingStartDate, 0);
}

@end
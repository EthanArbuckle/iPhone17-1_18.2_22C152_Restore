@interface UICalendarSelectionWeekOfYear
- (BOOL)canSelectDate:(id)a3;
- (BOOL)renderOverhangDays;
- (BOOL)shouldDeselectDate:(id)a3;
- (NSDateComponents)selectedWeekOfYear;
- (UICalendarSelectionWeekOfYear)initWithDelegate:(id)a3;
- (UICalendarSelectionWeekOfYearDelegate)delegate;
- (id)_dateComponentsForWeekOfYear:(id)a3;
- (id)_weekOfYearComponentsForDateComponents:(id)a3;
- (unint64_t)roundedEdgeForDate:(id)a3;
- (void)_sendDelegateForSelectedDateChange;
- (void)didChangeAvailableDateRange:(id)a3;
- (void)didChangeCalendar:(id)a3;
- (void)didDeselectDate:(id)a3;
- (void)didMoveToCalendarView;
- (void)didSelectDate:(id)a3;
- (void)selectAllDatesAnimated:(BOOL)a3;
- (void)setSelectedWeekOfYear:(id)a3;
- (void)setSelectedWeekOfYear:(id)a3 animated:(BOOL)a4;
- (void)willMoveToCalendarView:(id)a3;
@end

@implementation UICalendarSelectionWeekOfYear

- (UICalendarSelectionWeekOfYear)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UICalendarSelectionWeekOfYear;
  v5 = [(UICalendarSelection *)&v9 _init];
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
  }

  return (UICalendarSelectionWeekOfYear *)v6;
}

- (void)setSelectedWeekOfYear:(id)a3
{
}

- (void)setSelectedWeekOfYear:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  p_selectedWeekOfYear = &self->_selectedWeekOfYear;
  v8 = self->_selectedWeekOfYear;
  objc_super v9 = (NSDateComponents *)v6;
  v21 = v9;
  if (v8 == v9)
  {

    goto LABEL_7;
  }
  if (v9 && v8)
  {
    int v10 = [(NSDateComponents *)v8 isEqual:v9];

    if (!v10) {
      goto LABEL_9;
    }
LABEL_7:
    [(UICalendarSelectionWeekOfYear *)self selectAllDatesAnimated:v4];
    goto LABEL_14;
  }

LABEL_9:
  if (*p_selectedWeekOfYear)
  {
    v11 = -[UICalendarSelectionWeekOfYear _dateComponentsForWeekOfYear:](self, "_dateComponentsForWeekOfYear:");
    v12 = [(UICalendarSelection *)self view];
    [v12 _deselectDates:v11 animated:v4];
  }
  v13 = [(UICalendarSelectionWeekOfYear *)self _weekOfYearComponentsForDateComponents:v21];
  v14 = [(UICalendarSelection *)self view];
  v15 = [v14 calendar];
  v16 = _UICalendarSanitizeWithCalendar(v13, v15);

  objc_storeStrong((id *)&self->_selectedWeekOfYear, v16);
  v17 = [(UICalendarSelectionWeekOfYear *)self _dateComponentsForWeekOfYear:v16];
  dateComponentsForWeekOfYear = self->_dateComponentsForWeekOfYear;
  self->_dateComponentsForWeekOfYear = v17;

  if (self->_dateComponentsForWeekOfYear)
  {
    v19 = [(UICalendarSelection *)self view];
    [v19 _selectDates:self->_dateComponentsForWeekOfYear animated:v4];

    v20 = [(UICalendarSelection *)self view];
    [v20 setVisibleDateComponents:*p_selectedWeekOfYear animated:v4];
  }
LABEL_14:
}

- (void)willMoveToCalendarView:(id)a3
{
  id v4 = a3;
  id v5 = [(UICalendarSelection *)self view];

  if (v5 != v4 && self->_dateComponentsForWeekOfYear)
  {
    id v6 = [(UICalendarSelection *)self view];
    [v6 _deselectDates:self->_dateComponentsForWeekOfYear animated:0];
  }
}

- (void)didMoveToCalendarView
{
  v3 = [(UICalendarSelection *)self view];
  [v3 setAllowsMultipleSelection:1];

  id v4 = [(UICalendarSelectionWeekOfYear *)self selectedWeekOfYear];
  id v5 = [(UICalendarSelection *)self view];
  id v6 = [v5 calendar];
  _UICalendarSanitizeWithCalendar(v4, v6);
  char v7 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  selectedWeekOfYear = self->_selectedWeekOfYear;
  self->_selectedWeekOfYear = v7;

  [(UICalendarSelectionWeekOfYear *)self selectAllDatesAnimated:0];
  if (self->_selectedWeekOfYear)
  {
    id v9 = [(UICalendarSelection *)self view];
    [v9 setVisibleDateComponents:self->_selectedWeekOfYear animated:0];
  }
}

- (void)didChangeCalendar:(id)a3
{
  _UICalendarSanitizeWithCalendar(self->_selectedWeekOfYear, a3);
  id v4 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  selectedWeekOfYear = self->_selectedWeekOfYear;
  self->_selectedWeekOfYear = v4;
}

- (void)didChangeAvailableDateRange:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (self->_selectedWeekOfYear)
  {
    id v4 = a3;
    id v5 = [(UICalendarSelectionWeekOfYear *)self selectedWeekOfYear];
    uint64_t v6 = [(UICalendarSelection *)self view];
    char v7 = [(id)v6 calendar];
    v8 = [v7 dateFromComponents:v5];

    LOBYTE(v6) = [v4 containsDate:v8];
    if ((v6 & 1) == 0)
    {
      id v9 = [(UICalendarSelection *)self view];
      v12[0] = v5;
      int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      [v9 _deselectDates:v10 animated:0];

      selectedWeekOfYear = self->_selectedWeekOfYear;
      self->_selectedWeekOfYear = 0;
    }
  }
}

- (BOOL)canSelectDate:(id)a3
{
  id v4 = [(UICalendarSelectionWeekOfYear *)self _weekOfYearComponentsForDateComponents:a3];
  if (*(unsigned char *)&self->_delegateImplements)
  {
    uint64_t v6 = [(UICalendarSelectionWeekOfYear *)self delegate];
    char v5 = [v6 weekOfYearSelection:self canSelectWeekOfYear:v4];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (void)didSelectDate:(id)a3
{
  id v10 = a3;
  if (self->_dateComponentsForWeekOfYear)
  {
    id v4 = [(UICalendarSelection *)self view];
    [v4 _deselectDates:self->_dateComponentsForWeekOfYear animated:0];
  }
  char v5 = [(UICalendarSelectionWeekOfYear *)self _weekOfYearComponentsForDateComponents:v10];
  selectedWeekOfYear = self->_selectedWeekOfYear;
  self->_selectedWeekOfYear = v5;
  char v7 = v5;

  v8 = [(UICalendarSelectionWeekOfYear *)self _dateComponentsForWeekOfYear:v7];
  dateComponentsForWeekOfYear = self->_dateComponentsForWeekOfYear;
  self->_dateComponentsForWeekOfYear = v8;

  [(UICalendarSelectionWeekOfYear *)self selectAllDatesAnimated:0];
  [(UICalendarSelectionWeekOfYear *)self _sendDelegateForSelectedDateChange];
}

- (BOOL)shouldDeselectDate:(id)a3
{
  if ((*(unsigned char *)&self->_delegateImplements & 1) == 0) {
    return 0;
  }
  id v4 = self;
  char v5 = [(UICalendarSelectionWeekOfYear *)self delegate];
  LOBYTE(v4) = [v5 weekOfYearSelection:v4 canSelectWeekOfYear:0];

  return (char)v4;
}

- (void)didDeselectDate:(id)a3
{
  selectedWeekOfYear = self->_selectedWeekOfYear;
  self->_selectedWeekOfYear = 0;

  [(UICalendarSelectionWeekOfYear *)self _sendDelegateForSelectedDateChange];
}

- (void)selectAllDatesAnimated:(BOOL)a3
{
  if (self->_dateComponentsForWeekOfYear)
  {
    BOOL v3 = a3;
    id v5 = [(UICalendarSelection *)self view];
    [v5 _selectDates:self->_dateComponentsForWeekOfYear animated:v3];
  }
}

- (BOOL)renderOverhangDays
{
  return 1;
}

- (unint64_t)roundedEdgeForDate:(id)a3
{
  id v4 = a3;
  dateComponentsForWeekOfYear = self->_dateComponentsForWeekOfYear;
  if (dateComponentsForWeekOfYear && [(NSArray *)dateComponentsForWeekOfYear count] != 1)
  {
    char v7 = [v4 date];
    v8 = [(NSArray *)self->_dateComponentsForWeekOfYear firstObject];
    id v9 = [v8 date];

    id v10 = [(NSArray *)self->_dateComponentsForWeekOfYear lastObject];
    v11 = [v10 date];

    if ([v9 isEqual:v7])
    {
      unint64_t v6 = 1;
    }
    else if ([v11 isEqual:v7])
    {
      unint64_t v6 = 2;
    }
    else
    {
      unint64_t v6 = 0;
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UICalendarSelectionWeekOfYear;
    unint64_t v6 = [(UICalendarSelection *)&v13 roundedEdgeForDate:v4];
  }

  return v6;
}

- (void)_sendDelegateForSelectedDateChange
{
  if ((*(unsigned char *)&self->_delegateImplements & 2) != 0)
  {
    id v3 = [(UICalendarSelectionWeekOfYear *)self delegate];
    [v3 weekOfYearSelection:self didSelectWeekOfYear:self->_selectedWeekOfYear];
  }
}

- (id)_weekOfYearComponentsForDateComponents:(id)a3
{
  id v4 = a3;
  id v5 = [(UICalendarSelection *)self view];
  unint64_t v6 = [v5 calendar];
  char v7 = [v6 dateFromComponents:v4];

  v8 = [(UICalendarSelection *)self view];
  id v9 = [v8 calendar];
  id v10 = [v9 components:1073154 fromDate:v7];

  return v10;
}

- (id)_dateComponentsForWeekOfYear:(id)a3
{
  id v5 = [(UICalendarSelectionWeekOfYear *)self _weekOfYearComponentsForDateComponents:a3];
  if ([v5 weekOfYear] == 0x7FFFFFFFFFFFFFFFLL)
  {
  }
  else
  {
    uint64_t v6 = [v5 yearForWeekOfYear];

    if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"UICalendarSelectionWeekOfYear.m", 205, @"Week of year components (%@) must include [.weekOfYear, .yearForWeekOfYear]", v5 object file lineNumber description];

LABEL_3:
  char v7 = [(UICalendarSelection *)self view];
  v8 = [v7 calendar];

  id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v10 = [v8 weekdaySymbols];
  v11 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

  v12 = [v8 dateFromComponents:v5];
  objc_super v13 = [v8 dateByAddingUnit:0x2000 value:1 toDate:v12 options:0];
  id v14 = v12;
  v15 = v14;
  if ([v14 compare:v13] == -1)
  {
    v16 = v14;
    do
    {
      v17 = [v8 components:1048606 fromDate:v16];
      [v11 addObject:v17];
      v15 = [v8 dateByAddingUnit:16 value:1 toDate:v16 options:0];

      v16 = v15;
    }
    while ([v15 compare:v13] == -1);
  }

  return v11;
}

- (NSDateComponents)selectedWeekOfYear
{
  return self->_selectedWeekOfYear;
}

- (UICalendarSelectionWeekOfYearDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UICalendarSelectionWeekOfYearDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedWeekOfYear, 0);
  objc_storeStrong((id *)&self->_dateComponentsForWeekOfYear, 0);
}

@end
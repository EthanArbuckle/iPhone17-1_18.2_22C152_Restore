@interface UICalendarSelectionMultiDate
- (BOOL)canSelectDate:(id)a3;
- (BOOL)highlightsToday;
- (BOOL)shouldDeselectDate:(id)a3;
- (NSArray)selectedDates;
- (UICalendarSelectionMultiDate)init;
- (UICalendarSelectionMultiDate)initWithDelegate:(id)delegate;
- (id)_removeSelectedDatesSatisfyingPredicate:(id)a3;
- (id)_sanitizeDateComponents:(id)a3 calendar:(id)a4;
- (id)delegate;
- (void)didChangeAvailableDateRange:(id)a3;
- (void)didChangeCalendar:(id)a3;
- (void)didDeselectDate:(id)a3;
- (void)didMoveToCalendarView;
- (void)didSelectDate:(id)a3;
- (void)selectAllDatesAnimated:(BOOL)a3;
- (void)setSelectedDates:(NSArray *)selectedDates;
- (void)setSelectedDates:(NSArray *)selectedDates animated:(BOOL)animated;
- (void)willMoveToCalendarView:(id)a3;
@end

@implementation UICalendarSelectionMultiDate

- (UICalendarSelectionMultiDate)init
{
  return [(UICalendarSelectionMultiDate *)self initWithDelegate:0];
}

- (UICalendarSelectionMultiDate)initWithDelegate:(id)delegate
{
  id v4 = delegate;
  v13.receiver = self;
  v13.super_class = (Class)UICalendarSelectionMultiDate;
  v5 = [(UICalendarSelection *)&v13 _init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(v5 + 4, v4);
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    id v8 = v6[2];
    v6[2] = (id)v7;

    *((unsigned char *)v6 + 24) = (_BYTE)v6[3] & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v9 = 2;
    }
    else {
      char v9 = 0;
    }
    *((unsigned char *)v6 + 24) = (_BYTE)v6[3] & 0xFD | v9;
    if (objc_opt_respondsToSelector()) {
      char v10 = 4;
    }
    else {
      char v10 = 0;
    }
    *((unsigned char *)v6 + 24) = (_BYTE)v6[3] & 0xFB | v10;
    if (objc_opt_respondsToSelector()) {
      char v11 = 8;
    }
    else {
      char v11 = 0;
    }
    *((unsigned char *)v6 + 24) = (_BYTE)v6[3] & 0xF7 | v11;
  }

  return (UICalendarSelectionMultiDate *)v6;
}

- (NSArray)selectedDates
{
  v2 = (void *)[(NSMutableArray *)self->_selectedDates copy];
  return (NSArray *)v2;
}

- (void)setSelectedDates:(NSArray *)selectedDates
{
}

- (void)setSelectedDates:(NSArray *)selectedDates animated:(BOOL)animated
{
  BOOL v4 = animated;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = selectedDates;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v21 + 1) + 8 * v11);
        if ([v12 year] == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v12, "month") == 0x7FFFFFFFFFFFFFFFLL)
        {
        }
        else
        {
          uint64_t v13 = [v12 day];

          if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_9;
          }
        }
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2, self, @"UICalendarSelectionMultiDate.m", 57, @"dateComponents (%@) is invalid. It requires at least [.year, .month, .day].", v12 object file lineNumber description];

LABEL_9:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v15 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v9 = v15;
    }
    while (v15);
  }
  v16 = [(UICalendarSelection *)self view];
  [v16 _deselectDates:self->_selectedDates animated:v4];

  v17 = [(UICalendarSelection *)self view];
  v18 = [v17 calendar];
  v19 = [(UICalendarSelectionMultiDate *)self _sanitizeDateComponents:v7 calendar:v18];
  v20 = self->_selectedDates;
  self->_selectedDates = v19;

  [(UICalendarSelectionMultiDate *)self selectAllDatesAnimated:v4];
}

- (void)willMoveToCalendarView:(id)a3
{
  id v4 = [(UICalendarSelection *)self view];
  [v4 _deselectDates:self->_selectedDates animated:0];
}

- (void)didMoveToCalendarView
{
  selectedDates = self->_selectedDates;
  id v4 = [(UICalendarSelection *)self view];
  v5 = [v4 calendar];
  v6 = [(UICalendarSelectionMultiDate *)self _sanitizeDateComponents:selectedDates calendar:v5];
  uint64_t v7 = self->_selectedDates;
  self->_selectedDates = v6;

  uint64_t v8 = [(UICalendarSelection *)self view];
  [v8 setAllowsMultipleSelection:1];

  [(UICalendarSelectionMultiDate *)self selectAllDatesAnimated:0];
}

- (BOOL)canSelectDate:(id)a3
{
  if ((*(unsigned char *)&self->_delegateImplements & 1) == 0) {
    return 1;
  }
  id v4 = self;
  id v5 = a3;
  v6 = [(UICalendarSelectionMultiDate *)v4 delegate];
  LOBYTE(v4) = [v6 multiDateSelection:v4 canSelectDate:v5];

  return (char)v4;
}

- (BOOL)shouldDeselectDate:(id)a3
{
  if ((*(unsigned char *)&self->_delegateImplements & 2) == 0) {
    return 1;
  }
  id v4 = self;
  id v5 = a3;
  v6 = [(UICalendarSelectionMultiDate *)v4 delegate];
  LOBYTE(v4) = [v6 multiDateSelection:v4 canDeselectDate:v5];

  return (char)v4;
}

- (void)didSelectDate:(id)a3
{
  id v5 = a3;
  -[NSMutableArray addObject:](self->_selectedDates, "addObject:");
  if ((*(unsigned char *)&self->_delegateImplements & 4) != 0)
  {
    id v4 = [(UICalendarSelectionMultiDate *)self delegate];
    [v4 multiDateSelection:self didSelectDate:v5];
  }
}

- (void)didDeselectDate:(id)a3
{
  id v5 = a3;
  -[NSMutableArray removeObject:](self->_selectedDates, "removeObject:");
  if ((*(unsigned char *)&self->_delegateImplements & 8) != 0)
  {
    id v4 = [(UICalendarSelectionMultiDate *)self delegate];
    [v4 multiDateSelection:self didDeselectDate:v5];
  }
}

- (void)selectAllDatesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UICalendarSelection *)self view];
  [v5 _selectDates:self->_selectedDates animated:v3];
}

- (void)didChangeCalendar:(id)a3
{
  id v4 = [(UICalendarSelectionMultiDate *)self _sanitizeDateComponents:self->_selectedDates calendar:a3];
  selectedDates = self->_selectedDates;
  self->_selectedDates = v4;
}

- (void)didChangeAvailableDateRange:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_selectedDates count])
  {
    id v5 = [(UICalendarSelection *)self view];
    v6 = [v5 calendar];

    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __60__UICalendarSelectionMultiDate_didChangeAvailableDateRange___block_invoke;
    uint64_t v13 = &unk_1E530B170;
    id v14 = v6;
    id v15 = v4;
    id v7 = v6;
    uint64_t v8 = [(UICalendarSelectionMultiDate *)self _removeSelectedDatesSatisfyingPredicate:&v10];
    uint64_t v9 = [(UICalendarSelection *)self view];
    [v9 _deselectDates:v8 animated:0];
  }
}

uint64_t __60__UICalendarSelectionMultiDate_didChangeAvailableDateRange___block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = [*(id *)(a1 + 32) dateFromComponents:a2];
  uint64_t v4 = [*(id *)(a1 + 40) containsDate:v3] ^ 1;

  return v4;
}

- (BOOL)highlightsToday
{
  return 0;
}

- (id)_sanitizeDateComponents:(id)a3 calendar:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v19 = __65__UICalendarSelectionMultiDate__sanitizeDateComponents_calendar___block_invoke;
    v20 = &unk_1E530B198;
    id v21 = v6;
    id v8 = v5;
    uint64_t v9 = v18;
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = v19((uint64_t)v9, *(void **)(*((void *)&v22 + 1) + 8 * i));
          if (v16) {
            [v10 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }
  }
  else
  {
    uint64_t v10 = (void *)[v5 mutableCopy];
  }

  return v10;
}

id __65__UICalendarSelectionMultiDate__sanitizeDateComponents_calendar___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  if (v3)
  {
    id v5 = (void *)[v3 copy];
    id v6 = [v5 calendar];

    if (!v6) {
      [v5 setCalendar:v4];
    }
    if (v4)
    {
      id v7 = [v5 calendar];
      char v8 = [v7 isEqual:v4];

      if ((v8 & 1) == 0)
      {
        uint64_t v9 = [v5 calendar];
        uint64_t v10 = [v9 dateFromComponents:v5];

        if (!v10)
        {
          uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDateComponents * _Nullable _UICalendarSanitizeWithCalendar(NSDateComponents * _Nonnull __strong, NSCalendar * _Nonnull __strong)");
          [v13 handleFailureInFunction:v14 file:@"_UICalendarViewHelper.h" lineNumber:92 description:@"Date components yielded an invalid NSDate"];
        }
        uint64_t v11 = [v4 components:1048606 fromDate:v10];

        id v5 = (void *)v11;
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_removeSelectedDatesSatisfyingPredicate:(id)a3
{
  id v4 = (unsigned int (**)(id, void *))a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [(NSMutableArray *)self->_selectedDates count];
  if (v6 - 1 >= 0)
  {
    uint64_t v7 = v6;
    do
    {
      char v8 = [(NSMutableArray *)self->_selectedDates objectAtIndex:--v7];
      if (v4[2](v4, v8))
      {
        [v5 addObject:v8];
        [(NSMutableArray *)self->_selectedDates removeObjectAtIndex:v7];
      }
    }
    while (v7 > 0);
  }

  return v5;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedDates, 0);
}

@end
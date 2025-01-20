@interface TTRIRecurrenceWeekdayChooserController
- (NSArray)daysOfTheWeek;
- (NSMutableArray)cells;
- (TTRIRecurrenceWeekdayChooserController)initWithDate:(id)a3;
- (double)heightForRow:(int64_t)a3;
- (id)_calStringForDayOfWeek:(int)a3;
- (id)cellForRow:(int64_t)a3;
- (int)_dayMask;
- (int64_t)frequency;
- (int64_t)numberOfRows;
- (void)_setCell:(id)a3 selected:(BOOL)a4;
- (void)rowTapped:(int64_t)a3;
- (void)setCells:(id)a3;
- (void)setDaysOfTheWeek:(id)a3;
- (void)updateFromRecurrenceRule:(id)a3;
- (void)updateRecurrenceRuleBuilder:(id)a3;
@end

@implementation TTRIRecurrenceWeekdayChooserController

- (TTRIRecurrenceWeekdayChooserController)initWithDate:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)TTRIRecurrenceWeekdayChooserController;
  v3 = [(TTRIRecurrenceChooserController *)&v15 initWithDate:a3];
  v4 = v3;
  if (v3)
  {
    [(TTRIRecurrenceWeekdayChooserController *)v3 setDaysOfTheWeek:MEMORY[0x1E4F1CBF0]];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:7];
    selectedRows = v4->_selectedRows;
    v4->_selectedRows = (NSMutableArray *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:7];
    cells = v4->_cells;
    v4->_cells = (NSMutableArray *)v7;

    uint64_t v9 = 0;
    v10 = 0;
    do
    {
      v11 = v10;
      v10 = [[TTRICustomRecurrenceTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];

      v12 = [(TTRIRecurrenceWeekdayChooserController *)v4 _calStringForDayOfWeek:v9];
      v13 = [(TTRICustomRecurrenceTableViewCell *)v10 textLabel];
      [v13 setText:v12];

      [(NSMutableArray *)v4->_cells addObject:v10];
      ++v9;
    }
    while (v9 != 7);
  }
  return v4;
}

- (void)setDaysOfTheWeek:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (NSArray *)a3;
  if (self->_daysOfTheWeek != v5)
  {
    objc_storeStrong((id *)&self->_daysOfTheWeek, a3);
    [(NSMutableArray *)self->_selectedRows removeAllObjects];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v6 = v5;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          selectedRows = self->_selectedRows;
          v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dayOfTheWeek", (void)v13) - 1);
          [(NSMutableArray *)selectedRows addObject:v12];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (int64_t)frequency
{
  return 1;
}

- (int64_t)numberOfRows
{
  return 7;
}

- (double)heightForRow:(int64_t)a3
{
  return *MEMORY[0x1E4FB2F28];
}

- (id)cellForRow:(int64_t)a3
{
  uint64_t v5 = -[NSMutableArray objectAtIndexedSubscript:](self->_cells, "objectAtIndexedSubscript:");
  selectedRows = self->_selectedRows;
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  [(TTRIRecurrenceWeekdayChooserController *)self _setCell:v5 selected:[(NSMutableArray *)selectedRows containsObject:v7]];

  return v5;
}

- (void)rowTapped:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  selectedRows = self->_selectedRows;
  v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  int v7 = [(NSMutableArray *)selectedRows containsObject:v6];

  if ([(NSMutableArray *)self->_selectedRows count] != 1 || (v7 & 1) == 0)
  {
    uint64_t v8 = self->_selectedRows;
    uint64_t v9 = [NSNumber numberWithInteger:a3];
    if (v7) {
      [(NSMutableArray *)v8 removeObject:v9];
    }
    else {
      [(NSMutableArray *)v8 addObject:v9];
    }

    v10 = [(TTRIRecurrenceWeekdayChooserController *)self cellForRow:a3];
    [(TTRIRecurrenceWeekdayChooserController *)self _setCell:v10 selected:v7 ^ 1u];

    v11 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v12 = self->_selectedRows;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = objc_msgSend(MEMORY[0x1E4F94BC8], "dayOfWeek:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "integerValue", (void)v18) + 1);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }

    [(TTRIRecurrenceWeekdayChooserController *)self setDaysOfTheWeek:v11];
    [(TTRIRecurrenceChooserController *)self notifyDelegate];
  }
}

- (void)updateRecurrenceRuleBuilder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setDays:", -[TTRIRecurrenceWeekdayChooserController _dayMask](self, "_dayMask"));
}

- (void)updateFromRecurrenceRule:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 daysOfTheWeek];

  if (v5)
  {
    v6 = [v4 daysOfTheWeek];
    [(TTRIRecurrenceWeekdayChooserController *)self setDaysOfTheWeek:v6];
  }
  else
  {
    v6 = [(TTRIRecurrenceChooserController *)self startDateComponents:512];
    int v7 = objc_msgSend(MEMORY[0x1E4F94BC8], "dayOfWeek:", objc_msgSend(v6, "weekday"));
    v9[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [(TTRIRecurrenceWeekdayChooserController *)self setDaysOfTheWeek:v8];
  }
}

- (void)_setCell:(id)a3 selected:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 0;
  }
  [a3 setAccessoryType:v5];
}

- (int)_dayMask
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(TTRIRecurrenceWeekdayChooserController *)self daysOfTheWeek];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= +[TTRIRecurrenceChooserController dayFromNumber:](TTRIRecurrenceChooserController, "dayFromNumber:", [*(id *)(*((void *)&v9 + 1) + 8 * i) dayOfTheWeek]);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)_calStringForDayOfWeek:(int)a3
{
  return (id)MEMORY[0x1F410F990](*(void *)&a3, a2);
}

- (NSMutableArray)cells
{
  return self->_cells;
}

- (void)setCells:(id)a3
{
}

- (NSArray)daysOfTheWeek
{
  return self->_daysOfTheWeek;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daysOfTheWeek, 0);
  objc_storeStrong((id *)&self->_cells, 0);

  objc_storeStrong((id *)&self->_selectedRows, 0);
}

@end
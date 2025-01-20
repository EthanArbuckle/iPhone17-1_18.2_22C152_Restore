@interface TTRIRecurrenceMonthDayChooserController
- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence;
- (TTRIRecurrenceMonthDayChooserController)initWithDate:(id)a3;
- (id)cellLabels;
- (id)daysOfTheMonth;
- (int64_t)frequency;
- (int64_t)gridViewType;
- (void)prepareForDisplay;
- (void)refreshCells;
- (void)selectCell:(id)a3 atIndex:(int64_t)a4;
- (void)setDaysOfTheMonth:(id)a3;
- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3;
- (void)updateFromRecurrenceRule:(id)a3;
- (void)updateRecurrenceRuleBuilder:(id)a3;
@end

@implementation TTRIRecurrenceMonthDayChooserController

- (TTRIRecurrenceMonthDayChooserController)initWithDate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TTRIRecurrenceMonthDayChooserController;
  v3 = [(TTRIRecurrenceChooserController *)&v7 initWithDate:a3];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    daysOfTheMonthSet = v3->_daysOfTheMonthSet;
    v3->_daysOfTheMonthSet = (NSMutableSet *)v4;
  }
  return v3;
}

- (int64_t)frequency
{
  return 2;
}

- (id)daysOfTheMonth
{
  v2 = [(NSMutableSet *)self->_daysOfTheMonthSet allObjects];
  v3 = [v2 sortedArrayUsingSelector:sel_compare_];

  return v3;
}

- (void)setDaysOfTheMonth:(id)a3
{
  id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  uint64_t v4 = (NSMutableSet *)[v6 mutableCopy];
  daysOfTheMonthSet = self->_daysOfTheMonthSet;
  self->_daysOfTheMonthSet = v4;
}

- (void)updateRecurrenceRuleBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [(TTRIRecurrenceMonthDayChooserController *)self daysOfTheMonth];
  [v4 setDayNumbers:v5];
}

- (void)updateFromRecurrenceRule:(id)a3
{
  id v6 = a3;
  id v4 = [v6 daysOfTheMonth];

  if (v4)
  {
    id v5 = [v6 daysOfTheMonth];
    [(TTRIRecurrenceMonthDayChooserController *)self setDaysOfTheMonth:v5];

    [(TTRIRecurrenceMonthDayChooserController *)self refreshCells];
  }
}

- (id)cellLabels
{
  if (cellLabels_onceToken_0 != -1) {
    dispatch_once(&cellLabels_onceToken_0, &__block_literal_global_5);
  }
  v2 = (void *)cellLabels___cellLabels_0;

  return v2;
}

void __53__TTRIRecurrenceMonthDayChooserController_cellLabels__block_invoke()
{
  v0 = objc_opt_new();
  for (uint64_t i = 1; i != 32; ++i)
  {
    v2 = CUIKLocalizedStringForInteger();
    [v0 addObject:v2];
  }
  v3 = (void *)cellLabels___cellLabels_0;
  cellLabels___cellLabels_0 = (uint64_t)v0;
}

- (int64_t)gridViewType
{
  return 1;
}

- (void)prepareForDisplay
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (![(NSMutableSet *)self->_daysOfTheMonthSet count])
  {
    v3 = [(TTRIRecurrenceChooserController *)self startDateComponents:16];
    id v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "day"));
    v6[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [(TTRIRecurrenceMonthDayChooserController *)self setDaysOfTheMonth:v5];
  }
}

- (void)refreshCells
{
  id v8 = [(TTRIRecurrenceGridChooserController *)self allCells];
  if ([v8 count])
  {
    unint64_t v3 = 0;
    do
    {
      id v4 = [v8 objectAtIndexedSubscript:v3];
      daysOfTheMonthSet = self->_daysOfTheMonthSet;
      id v6 = [NSNumber numberWithInteger:++v3];
      uint64_t v7 = [(NSMutableSet *)daysOfTheMonthSet containsObject:v6];

      [v4 setSelected:v7];
    }
    while (v3 < [v8 count]);
  }
}

- (void)selectCell:(id)a3 atIndex:(int64_t)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (-[NSMutableSet count](self->_daysOfTheMonthSet, "count") != 1 || ([v6 selected] & 1) == 0)
  {
    objc_msgSend(v6, "setSelected:", objc_msgSend(v6, "selected") ^ 1);
    uint64_t v7 = [NSNumber numberWithInteger:a4 + 1];
    if ([v6 selected]
      && [(TTRIRecurrenceMonthDayChooserController *)self prohibitsMultipleDaysInMonthlyRecurrence])
    {
      v11[0] = v7;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      [(TTRIRecurrenceMonthDayChooserController *)self setDaysOfTheMonth:v8];

      [(TTRIRecurrenceMonthDayChooserController *)self refreshCells];
    }
    else
    {
      int v9 = [v6 selected];
      daysOfTheMonthSet = self->_daysOfTheMonthSet;
      if (v9) {
        [(NSMutableSet *)daysOfTheMonthSet addObject:v7];
      }
      else {
        [(NSMutableSet *)daysOfTheMonthSet removeObject:v7];
      }
    }
    [(TTRIRecurrenceChooserController *)self notifyDelegate];
  }
}

- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (self->_prohibitsMultipleDaysInMonthlyRecurrence != a3)
  {
    self->_prohibitsMultipleDaysInMonthlyRecurrence = a3;
    if (a3)
    {
      id v4 = [(TTRIRecurrenceMonthDayChooserController *)self daysOfTheMonth];
      uint64_t v5 = [v4 count];

      if (v5)
      {
        id v6 = [(TTRIRecurrenceMonthDayChooserController *)self daysOfTheMonth];
        uint64_t v7 = [v6 firstObject];
        v9[0] = v7;
        id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
        [(TTRIRecurrenceMonthDayChooserController *)self setDaysOfTheMonth:v8];

        [(TTRIRecurrenceMonthDayChooserController *)self refreshCells];
      }
    }
  }
}

- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence
{
  return self->_prohibitsMultipleDaysInMonthlyRecurrence;
}

- (void).cxx_destruct
{
}

@end
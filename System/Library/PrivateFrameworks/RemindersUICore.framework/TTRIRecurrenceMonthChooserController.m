@interface TTRIRecurrenceMonthChooserController
- (BOOL)prohibitsMultipleMonthsInYearlyRecurrence;
- (NSArray)monthsOfTheYear;
- (TTRIRecurrenceMonthChooserController)initWithDate:(id)a3;
- (id)cellAccessibilityLabels;
- (id)cellLabels;
- (id)tableViewCell;
- (int64_t)frequency;
- (int64_t)gridViewType;
- (void)prepareForDisplay;
- (void)refreshCells;
- (void)selectCell:(id)a3 atIndex:(int64_t)a4;
- (void)setMonthsOfTheYear:(id)a3;
- (void)setProhibitsMultipleMonthsInYearlyRecurrence:(BOOL)a3;
- (void)updateFromRecurrenceRule:(id)a3;
- (void)updateRecurrenceRuleBuilder:(id)a3;
@end

@implementation TTRIRecurrenceMonthChooserController

- (TTRIRecurrenceMonthChooserController)initWithDate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TTRIRecurrenceMonthChooserController;
  v3 = [(TTRIRecurrenceChooserController *)&v7 initWithDate:a3];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    monthsOfTheYearSet = v3->_monthsOfTheYearSet;
    v3->_monthsOfTheYearSet = (NSMutableSet *)v4;
  }
  return v3;
}

- (NSArray)monthsOfTheYear
{
  v2 = [(NSMutableSet *)self->_monthsOfTheYearSet allObjects];
  v3 = [v2 sortedArrayUsingSelector:sel_compare_];

  return (NSArray *)v3;
}

- (void)setMonthsOfTheYear:(id)a3
{
  id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  uint64_t v4 = (NSMutableSet *)[v6 mutableCopy];
  monthsOfTheYearSet = self->_monthsOfTheYearSet;
  self->_monthsOfTheYearSet = v4;
}

- (int64_t)frequency
{
  return 3;
}

- (void)updateRecurrenceRuleBuilder:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(TTRIRecurrenceMonthChooserController *)self monthsOfTheYear];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    [v7 setFrequency:3];
    id v6 = [(TTRIRecurrenceMonthChooserController *)self monthsOfTheYear];
    [v7 setMonthNumbers:v6];
  }
}

- (void)updateFromRecurrenceRule:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 monthsOfTheYear];

  if (v4)
  {
    uint64_t v5 = [v6 monthsOfTheYear];
    [(TTRIRecurrenceMonthChooserController *)self setMonthsOfTheYear:v5];

    [(TTRIRecurrenceMonthChooserController *)self refreshCells];
  }
}

- (id)tableViewCell
{
  v4.receiver = self;
  v4.super_class = (Class)TTRIRecurrenceMonthChooserController;
  v2 = [(TTRIRecurrenceGridChooserController *)&v4 tableViewCell];
  [v2 setDrawsTopDivider:1];

  return v2;
}

- (id)cellLabels
{
  if (cellLabels_onceToken != -1) {
    dispatch_once(&cellLabels_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)cellLabels___cellLabels;

  return v2;
}

void __50__TTRIRecurrenceMonthChooserController_cellLabels__block_invoke()
{
  v0 = objc_opt_new();
  for (int i = 1; i != 13; ++i)
  {
    uint64_t v2 = CUIKStringAbbreviationForMonth();
    v3 = (void *)v2;
    if (v2) {
      objc_super v4 = (__CFString *)v2;
    }
    else {
      objc_super v4 = &stru_1F130F620;
    }
    [v0 addObject:v4];
  }
  uint64_t v5 = (void *)cellLabels___cellLabels;
  cellLabels___cellLabels = (uint64_t)v0;
}

- (id)cellAccessibilityLabels
{
  if (cellAccessibilityLabels_onceToken != -1) {
    dispatch_once(&cellAccessibilityLabels_onceToken, &__block_literal_global_18);
  }
  uint64_t v2 = (void *)cellAccessibilityLabels___cellAccessibilityLabels;

  return v2;
}

void __63__TTRIRecurrenceMonthChooserController_cellAccessibilityLabels__block_invoke()
{
  v0 = objc_opt_new();
  for (int i = 1; i != 13; ++i)
  {
    uint64_t v2 = CUIKStringForMonthNumber();
    v3 = (void *)v2;
    if (v2) {
      objc_super v4 = (__CFString *)v2;
    }
    else {
      objc_super v4 = &stru_1F130F620;
    }
    [v0 addObject:v4];
  }
  uint64_t v5 = (void *)cellAccessibilityLabels___cellAccessibilityLabels;
  cellAccessibilityLabels___cellAccessibilityLabels = (uint64_t)v0;
}

- (int64_t)gridViewType
{
  return 0;
}

- (void)prepareForDisplay
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [(TTRIRecurrenceMonthChooserController *)self monthsOfTheYear];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    uint64_t v5 = [(TTRIRecurrenceChooserController *)self startDateComponents:8];
    id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "month"));
    v8[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [(TTRIRecurrenceMonthChooserController *)self setMonthsOfTheYear:v7];
  }
}

- (void)refreshCells
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(TTRIRecurrenceGridChooserController *)self allCells];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = [v3 indexOfObject:v8];
        monthsOfTheYearSet = self->_monthsOfTheYearSet;
        v11 = [NSNumber numberWithInteger:v9 + 1];
        uint64_t v12 = [(NSMutableSet *)monthsOfTheYearSet containsObject:v11];

        [v8 setSelected:v12];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)selectCell:(id)a3 atIndex:(int64_t)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (-[NSMutableSet count](self->_monthsOfTheYearSet, "count") != 1 || ([v6 selected] & 1) == 0)
  {
    objc_msgSend(v6, "setSelected:", objc_msgSend(v6, "selected") ^ 1);
    id v7 = [NSNumber numberWithInteger:a4 + 1];
    if ([v6 selected]
      && [(TTRIRecurrenceMonthChooserController *)self prohibitsMultipleMonthsInYearlyRecurrence])
    {
      v11[0] = v7;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
      [(TTRIRecurrenceMonthChooserController *)self setMonthsOfTheYear:v8];

      [(TTRIRecurrenceMonthChooserController *)self refreshCells];
    }
    else
    {
      int v9 = [v6 selected];
      monthsOfTheYearSet = self->_monthsOfTheYearSet;
      if (v9) {
        [(NSMutableSet *)monthsOfTheYearSet addObject:v7];
      }
      else {
        [(NSMutableSet *)monthsOfTheYearSet removeObject:v7];
      }
    }
    [(TTRIRecurrenceChooserController *)self notifyDelegate];
  }
}

- (void)setProhibitsMultipleMonthsInYearlyRecurrence:(BOOL)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (self->_prohibitsMultipleMonthsInYearlyRecurrence != a3)
  {
    self->_prohibitsMultipleMonthsInYearlyRecurrence = a3;
    if (a3)
    {
      uint64_t v4 = [(TTRIRecurrenceMonthChooserController *)self monthsOfTheYear];
      uint64_t v5 = [v4 count];

      if (v5)
      {
        id v6 = [(TTRIRecurrenceMonthChooserController *)self monthsOfTheYear];
        id v7 = [v6 firstObject];
        v9[0] = v7;
        v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
        [(TTRIRecurrenceMonthChooserController *)self setMonthsOfTheYear:v8];

        [(TTRIRecurrenceMonthChooserController *)self refreshCells];
      }
    }
  }
}

- (BOOL)prohibitsMultipleMonthsInYearlyRecurrence
{
  return self->_prohibitsMultipleMonthsInYearlyRecurrence;
}

- (void).cxx_destruct
{
}

@end
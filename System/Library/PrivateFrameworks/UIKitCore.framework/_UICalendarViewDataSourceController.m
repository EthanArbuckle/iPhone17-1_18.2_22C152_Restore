@interface _UICalendarViewDataSourceController
- (_UICalendarViewDataSourceController)initWithCalendar:(id)a3 dataSource:(id)a4;
- (id)_loadedDays;
- (id)_loadedMonths;
- (int64_t)cleanupDataSourceWithScrollPositionIfNecessary:(id)a3;
- (int64_t)prepareDataSourceWithScrollPositionIfNecessary:(id)a3;
- (void)_reloadDataSourceWithScrollPosition:(id)a3;
@end

@implementation _UICalendarViewDataSourceController

- (_UICalendarViewDataSourceController)initWithCalendar:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_UICalendarViewDataSourceController;
  v9 = [(_UICalendarViewDataSourceController *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_calendar, a3);
    objc_storeStrong((id *)&v10->_dataSource, a4);
    v11 = [[_UIDatePickerCalendarMonthSet alloc] initWithCalendar:v7 rangeLength:7];
    loadedMonthSet = v10->_loadedMonthSet;
    v10->_loadedMonthSet = v11;

    v13 = [[_UIDatePickerCalendarDaySet alloc] initWithCalendar:v7];
    loadedDaySet = v10->_loadedDaySet;
    v10->_loadedDaySet = v13;
  }
  return v10;
}

- (void)_reloadDataSourceWithScrollPosition:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(_UIDatePickerCalendarMonthSet *)self->_loadedMonthSet reloadWithMonthsAroundMonth:a3];
  loadedDaySet = self->_loadedDaySet;
  v5 = [(_UIDatePickerCalendarMonthSet *)self->_loadedMonthSet loadedMonths];
  [(_UIDatePickerCalendarDaySet *)loadedDaySet cleanupDaysKeepingDaysForMonths:v5];

  v6 = objc_opt_new();
  id v7 = [(_UIDatePickerCalendarMonthSet *)self->_loadedMonthSet loadedMonths];
  [v6 appendSectionsWithIdentifiers:v7];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [(_UIDatePickerCalendarMonthSet *)self->_loadedMonthSet loadedMonths];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v14 = [(_UIDatePickerCalendarDaySet *)self->_loadedDaySet daysForMonth:v13 includingOverlapDays:1];
        [v6 appendItemsWithIdentifiers:v14 intoSectionWithIdentifier:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshotUsingReloadData:v6];
}

- (int64_t)cleanupDataSourceWithScrollPositionIfNecessary:(id)a3
{
  loadedMonthSet = self->_loadedMonthSet;
  id v6 = a3;
  uint64_t v7 = [(_UIDatePickerCalendarMonthSet *)loadedMonthSet indexOfMonth:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"_UICalendarViewDataSourceController.m" lineNumber:69 description:@"Cleaning up the data source around a month that is not loaded."];
  }
  [(_UICalendarViewDataSourceController *)self _reloadDataSourceWithScrollPosition:v6];
  unint64_t v8 = [(_UIDatePickerCalendarMonthSet *)self->_loadedMonthSet indexOfMonth:v6];

  return v8 - v7;
}

- (int64_t)prepareDataSourceWithScrollPositionIfNecessary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  int64_t v22 = 0;
  [(_UIDatePickerCalendarMonthSet *)self->_loadedMonthSet insertMonthsAroundMonth:a3 loadedIndexRange:&v21];
  if (!v22) {
    return 0;
  }
  v4 = [(UICollectionViewDiffableDataSource *)self->_dataSource snapshot];
  v5 = [(_UIDatePickerCalendarMonthSet *)self->_loadedMonthSet loadedMonths];
  id v6 = objc_msgSend(v5, "subarrayWithRange:", v21, v22);
  if (v21)
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:v21 - 1];
    [v4 insertSectionsWithIdentifiers:v6 afterSectionWithIdentifier:v7];
  }
  else
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:v22];
    [v4 insertSectionsWithIdentifiers:v6 beforeSectionWithIdentifier:v7];
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        long long v15 = -[_UIDatePickerCalendarDaySet daysForMonth:includingOverlapDays:](self->_loadedDaySet, "daysForMonth:includingOverlapDays:", v14, 1, (void)v17);
        [v4 appendItemsWithIdentifiers:v15 intoSectionWithIdentifier:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v11);
  }

  [(UICollectionViewDiffableDataSource *)self->_dataSource applySnapshotUsingReloadData:v4];
  if (v21) {
    int64_t v8 = 0;
  }
  else {
    int64_t v8 = v22;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedDaySet, 0);
  objc_storeStrong((id *)&self->_loadedMonthSet, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

- (id)_loadedMonths
{
  return [(_UIDatePickerCalendarMonthSet *)self->_loadedMonthSet loadedMonths];
}

- (id)_loadedDays
{
  return [(_UIDatePickerCalendarDaySet *)self->_loadedDaySet loadedDays];
}

@end
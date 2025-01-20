@interface _UIDatePickerCalendarDaySet
- (_UIDatePickerCalendarDaySet)initWithCalendar:(id)a3;
- (id)_createDaysForMonth:(id)a3;
- (id)_partialDaysForMonth:(id)a3 atBeginningOfMonth:(BOOL)a4 count:(unint64_t)a5;
- (id)daysForMonth:(id)a3 includingOverlapDays:(BOOL)a4;
- (id)loadedDays;
- (void)cleanupDaysKeepingDaysForMonths:(id)a3;
@end

@implementation _UIDatePickerCalendarDaySet

- (_UIDatePickerCalendarDaySet)initWithCalendar:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIDatePickerCalendarDaySet;
  v6 = [(_UIDatePickerCalendarDaySet *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_calendar, a3);
    uint64_t v8 = objc_opt_new();
    loadedDays = v7->_loadedDays;
    v7->_loadedDays = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (id)_createDaysForMonth:(id)a3
{
  id v5 = a3;
  v6 = self->_calendar;
  v7 = [v5 date];
  id v27 = 0;
  double v28 = 0.0;
  BOOL v8 = [(NSCalendar *)v6 rangeOfUnit:8 startDate:&v27 interval:&v28 forDate:v7];
  id v9 = v27;
  if (!v8)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"_UIDatePickerCalendarDaySet.m", 54, @"Unable to find calendar range for date %@", v7 object file lineNumber description];
  }
  SEL v25 = a2;
  v26 = self;
  v10 = [v9 dateByAddingTimeInterval:v28];
  objc_super v11 = objc_opt_new();
  v12 = objc_opt_new();
  [v12 setDay:0];
  id v13 = v9;
  v14 = v13;
  if (v13)
  {
    v15 = v13;
    do
    {
      if ([v15 compare:v10] != -1) {
        break;
      }
      v16 = [v5 dayWithDate:v15 assignedMonth:0];
      [v11 addObject:v16];
      objc_msgSend(v12, "setDay:", objc_msgSend(v12, "day") + 1);
      uint64_t v17 = [(NSCalendar *)v6 dateByAddingComponents:v12 toDate:v14 options:0];

      v15 = (void *)v17;
    }
    while (v17);
  }
  uint64_t v18 = [v11 count];
  v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
  uint64_t v20 = [v19 count];

  if (v18 != v20)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:v25, v26, @"_UIDatePickerCalendarDaySet.m", 71, @"Invalid date calculation. Duplicate days found in days for month %@.", v5 object file lineNumber description];
  }
  v21 = (void *)[v11 copy];

  return v21;
}

- (id)_partialDaysForMonth:(id)a3 atBeginningOfMonth:(BOOL)a4 count:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [(_UIDatePickerCalendarDaySet *)self daysForMonth:v8 includingOverlapDays:0];
  unint64_t v10 = [v9 count];
  if (a4)
  {
    if (v10 < a5)
    {
      do
      {
        objc_super v11 = v9;
        v12 = v8;
        id v8 = [v8 nextMonth];

        id v13 = [(_UIDatePickerCalendarDaySet *)self daysForMonth:v8 includingOverlapDays:0];
        id v9 = [v11 arrayByAddingObjectsFromArray:v13];
      }
      while ([v9 count] < a5);
    }
    unint64_t v14 = 0;
  }
  else
  {
    if (v10 >= a5)
    {
      uint64_t v17 = v9;
      uint64_t v15 = (uint64_t)v8;
    }
    else
    {
      do
      {
        uint64_t v15 = [v8 previousMonth];

        v16 = [(_UIDatePickerCalendarDaySet *)self daysForMonth:v15 includingOverlapDays:0];
        uint64_t v17 = [v16 arrayByAddingObjectsFromArray:v9];

        id v8 = (id)v15;
        id v9 = v17;
      }
      while ([v17 count] < a5);
    }
    unint64_t v14 = [v17 count] - a5;
    id v9 = v17;
    id v8 = (id)v15;
  }
  uint64_t v18 = objc_msgSend(v9, "subarrayWithRange:", v14, a5);

  return v18;
}

- (id)daysForMonth:(id)a3 includingOverlapDays:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v8 = [(NSMutableDictionary *)self->_loadedDays objectForKeyedSubscript:v7];
  if (v8)
  {
    if (!v4) {
      goto LABEL_18;
    }
  }
  else
  {
    id v8 = [(_UIDatePickerCalendarDaySet *)self _createDaysForMonth:v7];
    [(NSMutableDictionary *)self->_loadedDays setObject:v8 forKeyedSubscript:v7];
    if (!v4) {
      goto LABEL_18;
    }
  }
  uint64_t v9 = [v8 firstObject];
  unint64_t v10 = [(id)v9 date];

  calendar = self->_calendar;
  id v50 = 0;
  LOBYTE(v9) = [(NSCalendar *)calendar rangeOfUnit:4096 startDate:&v50 interval:0 forDate:v10];
  id v12 = v50;
  if ((v9 & 1) == 0)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"_UIDatePickerCalendarDaySet.m", 139, @"Unable to find the beginning of the week for date %@.", v10 object file lineNumber description];
  }
  v47 = v10;
  uint64_t v13 = _UIDatePickerNumberOfDaysBetweenDates(self->_calendar, (uint64_t)v12, v10);
  if (v13 < 1)
  {
    v16 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v14 = v13;
    uint64_t v15 = [v7 previousMonth];
    v16 = [(_UIDatePickerCalendarDaySet *)self _partialDaysForMonth:v15 atBeginningOfMonth:0 count:v14];
  }
  uint64_t v17 = [v8 lastObject];
  uint64_t v18 = [(id)v17 date];

  id v48 = 0;
  double v49 = 0.0;
  LOBYTE(v17) = [(NSCalendar *)self->_calendar rangeOfUnit:4096 startDate:&v48 interval:&v49 forDate:v18];
  id v19 = v48;
  if ((v17 & 1) == 0)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"_UIDatePickerCalendarDaySet.m", 147, @"Unable to find the beginning of the week for date %@.", v18 object file lineNumber description];
  }
  uint64_t v20 = [v19 dateByAddingTimeInterval:v49 + -1.0];
  v45 = (void *)v18;
  uint64_t v21 = _UIDatePickerNumberOfDaysBetweenDates(self->_calendar, v18, v20);
  SEL v43 = a2;
  v44 = v19;
  v46 = v12;
  if (v21 < 1)
  {
    v24 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v22 = v21;
    v23 = [v7 nextMonth];
    v24 = [(_UIDatePickerCalendarDaySet *)self _partialDaysForMonth:v23 atBeginningOfMonth:1 count:v22];
  }
  SEL v25 = _daysAssignedToMonth(v16, v7);
  v26 = _daysAssignedToMonth(v24, v7);
  v34 = _joinedArrayFromArrays((uint64_t)v26, v27, v28, v29, v30, v31, v32, v33, (uint64_t)v25);

  unint64_t v35 = [v34 count];
  [(NSCalendar *)self->_calendar weekdaySymbols];
  v37 = v36 = v16;
  unint64_t v38 = v35 % [v37 count];

  if (v38)
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:v43 object:self file:@"_UIDatePickerCalendarDaySet.m" lineNumber:156 description:@"Invalid calculation: number of calculated days is not dividable by the number of days in a week."];
  }
  id v8 = v34;
LABEL_18:

  return v8;
}

- (void)cleanupDaysKeepingDaysForMonths:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  loadedDays = self->_loadedDays;
  id v6 = v4;
  id v7 = loadedDays;
  id v8 = (NSMutableDictionary *)objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
        uint64_t v15 = -[NSMutableDictionary objectForKey:](v7, "objectForKey:", v14, (void)v17);
        if (v15) {
          [(NSMutableDictionary *)v8 setObject:v15 forKey:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  v16 = self->_loadedDays;
  self->_loadedDays = v8;
}

- (id)loadedDays
{
  v2 = (void *)[(NSMutableDictionary *)self->_loadedDays copy];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedDays, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
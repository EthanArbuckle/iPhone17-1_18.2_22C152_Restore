@interface TransitSchedulesDepartureInfoProvider
+ (Class)cellClass;
- (BOOL)allowsCellSelection;
- (GEOTransitDepartureSequence)departureSequence;
- (GEOTransitLine)transitLine;
- (NSArray)identifiers;
- (NSDate)date;
- (NSString)frequencyString;
- (NSString)operatingHours;
- (NSTimeZone)timeZone;
- (TransitSchedulesDepartureInfoProvider)initWithTransitLine:(id)a3 timeZone:(id)a4 referenceDate:(id)a5;
- (TransitSchedulesDepartureInfoProviderDelegate)delegate;
- (id)_operatingHoursDescriptionFromDepartureSequence;
- (id)_operatingHoursDescriptionFromTransitLine;
- (id)_operatingHoursStringForTimeRanges:(id)a3;
- (void)_invalidateFrequencyString;
- (void)_invalidateOperatingHours;
- (void)configureCell:(id)a3 forIndexPath:(id)a4 withIdentifier:(id)a5;
- (void)setDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDepartureSequence:(id)a3;
- (void)setTransitLine:(id)a3;
@end

@implementation TransitSchedulesDepartureInfoProvider

- (TransitSchedulesDepartureInfoProvider)initWithTransitLine:(id)a3 timeZone:(id)a4 referenceDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TransitSchedulesDepartureInfoProvider;
  v12 = [(TransitSchedulesDepartureInfoProvider *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_transitLine, a3);
    objc_storeStrong((id *)&v13->_timeZone, a4);
    objc_storeStrong((id *)&v13->_date, a5);
  }

  return v13;
}

- (NSArray)identifiers
{
  v3 = +[NSMutableArray array];
  v4 = [(TransitSchedulesDepartureInfoProvider *)self frequencyString];
  id v5 = [v4 length];

  if (v5) {
    [v3 addObject:@"DepartureInfoSectionCellFrequencyIdentifier"];
  }
  v6 = [(TransitSchedulesDepartureInfoProvider *)self operatingHours];
  id v7 = [v6 length];

  if (v7) {
    [v3 addObject:@"DepartureInfoSectionCellOperatingHoursIdentifier"];
  }

  return (NSArray *)v3;
}

+ (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3 forIndexPath:(id)a4 withIdentifier:(id)a5
{
  id v18 = a3;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;

    if (!v10) {
      goto LABEL_12;
    }
    id v11 = v18;
    if ([v10 isEqualToString:@"DepartureInfoSectionCellFrequencyIdentifier"])
    {
      v12 = +[NSBundle mainBundle];
      v13 = [v12 localizedStringForKey:@"[Transit Schedules] Frequency" value:@"localized string not found" table:0];
      [v11 setTitle:v13];

      uint64_t v14 = [(TransitSchedulesDepartureInfoProvider *)self frequencyString];
    }
    else
    {
      if (![v10 isEqualToString:@"DepartureInfoSectionCellOperatingHoursIdentifier"])
      {
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
      objc_super v15 = +[NSBundle mainBundle];
      v16 = [v15 localizedStringForKey:@"[Transit Schedules] Operating Hours" value:@"localized string not found" table:0];
      [v11 setTitle:v16];

      uint64_t v14 = [(TransitSchedulesDepartureInfoProvider *)self operatingHours];
    }
    v17 = (void *)v14;
    [v11 setContent:v14];

    goto LABEL_11;
  }
LABEL_13:
}

- (BOOL)allowsCellSelection
{
  return 0;
}

- (void)setTransitLine:(id)a3
{
  id v7 = a3;
  id v5 = [(GEOTransitLine *)self->_transitLine muid];
  if (v5 != [v7 muid])
  {
    objc_storeStrong((id *)&self->_transitLine, a3);
    [(TransitSchedulesDepartureInfoProvider *)self _invalidateOperatingHours];
    v6 = [(TransitSchedulesDepartureInfoProvider *)self delegate];
    [v6 updatedDepartureInfoProvider:self];
  }
}

- (void)setDepartureSequence:(id)a3
{
  id v6 = a3;
  if ((-[GEOTransitDepartureSequence isEqual:](self->_departureSequence, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_departureSequence, a3);
    [(TransitSchedulesDepartureInfoProvider *)self _invalidateOperatingHours];
    [(TransitSchedulesDepartureInfoProvider *)self _invalidateFrequencyString];
    id v5 = [(TransitSchedulesDepartureInfoProvider *)self delegate];
    [v5 updatedDepartureInfoProvider:self];
  }
}

- (void)_invalidateFrequencyString
{
  frequencyString = self->_frequencyString;
  self->_frequencyString = 0;
}

- (NSString)frequencyString
{
  frequencyString = self->_frequencyString;
  if (!frequencyString)
  {
    frequencyString = self->_departureSequence;
    if (frequencyString)
    {
      v4 = [frequencyString frequencyToDescribeAtDate:self->_date];
      id v5 = [(GEOTransitDepartureSequence *)self->_departureSequence firstDepartureValidForDate:self->_date];

      if (!v5 && v4)
      {
        id v6 = +[NSString _navigation_formattedDescriptionForFrequency:v4];
        id v7 = self->_frequencyString;
        self->_frequencyString = v6;
      }
      frequencyString = self->_frequencyString;
    }
  }

  return (NSString *)frequencyString;
}

- (void)_invalidateOperatingHours
{
  operatingHours = self->_operatingHours;
  self->_operatingHours = 0;
}

- (NSString)operatingHours
{
  p_operatingHours = &self->_operatingHours;
  if (self->_operatingHours)
  {
LABEL_2:
    v3 = *p_operatingHours;
    goto LABEL_3;
  }
  if (!self->_departureSequence)
  {
LABEL_10:
    if (self->_transitLine)
    {
      id v9 = [(TransitSchedulesDepartureInfoProvider *)self _operatingHoursDescriptionFromTransitLine];
      if ([v9 length]) {
        objc_storeStrong((id *)p_operatingHours, v9);
      }
    }
    goto LABEL_2;
  }
  id v6 = [(TransitSchedulesDepartureInfoProvider *)self _operatingHoursDescriptionFromDepartureSequence];
  if (![v6 length])
  {

    goto LABEL_10;
  }
  id v7 = *p_operatingHours;
  *p_operatingHours = (NSString *)v6;
  id v8 = v6;

  v3 = *p_operatingHours;
LABEL_3:

  return v3;
}

- (id)_operatingHoursStringForTimeRanges:(id)a3
{
  id v4 = a3;
  if (qword_1016107E0 != -1) {
    dispatch_once(&qword_1016107E0, &stru_101316FE0);
  }
  [(id)qword_1016107D8 setTimeZone:self->_timeZone];
  id v5 = [v4 firstObject];
  id v6 = v5;
  if (v5)
  {
    id v7 = (void *)qword_1016107D8;
    id v8 = [v5 startDate];
    id v9 = [v7 stringFromDate:v8];

    id v10 = (void *)qword_1016107D8;
    id v11 = [v6 endDate];
    v12 = [v10 stringFromDate:v11];

    v13 = +[NSBundle mainBundle];
    uint64_t v14 = [v13 localizedStringForKey:@"[Transit Schedule] Operating hours with separator" value:@"localized string not found" table:0];

    objc_super v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v9, v12);
  }
  else
  {
    objc_super v15 = 0;
  }

  return v15;
}

- (id)_operatingHoursDescriptionFromTransitLine
{
  v3 = [(GEOTransitLine *)self->_transitLine operatingHours];
  if ([(GEOTransitLine *)self->_transitLine departureTimeDisplayStyle] == (id)3
    && [v3 count])
  {
    id v4 = [(TransitSchedulesDepartureInfoProvider *)self _operatingHoursStringForTimeRanges:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_operatingHoursDescriptionFromDepartureSequence
{
  v3 = [(GEOTransitDepartureSequence *)self->_departureSequence operatingHoursForDate:self->_date inTimeZone:self->_timeZone];
  id v4 = [(TransitSchedulesDepartureInfoProvider *)self _operatingHoursStringForTimeRanges:v3];

  return v4;
}

- (TransitSchedulesDepartureInfoProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TransitSchedulesDepartureInfoProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GEOTransitLine)transitLine
{
  return self->_transitLine;
}

- (GEOTransitDepartureSequence)departureSequence
{
  return self->_departureSequence;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_departureSequence, 0);
  objc_storeStrong((id *)&self->_transitLine, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_operatingHours, 0);

  objc_storeStrong((id *)&self->_frequencyString, 0);
}

@end
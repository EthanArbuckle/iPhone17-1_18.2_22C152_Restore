@interface SingleDaySummary
- (CGRect)frameForEventID:(id)a3;
- (CompactMonthWeekViewDelegate)weekDelegate;
- (NSArray)inputEventData;
- (NSArray)processedEventData;
- (NSCalendar)calendar;
- (NSDate)date;
- (SingleDaySummary)init;
- (double)_actualEventsWidth;
- (double)_totalEventsWidth;
- (double)totalEventUnits;
- (id)dataForEventID:(id)a3;
- (unint64_t)backGroundCornerMaskforEventID:(id)a3;
- (void)_processEventData;
- (void)drawRect:(CGRect)a3;
- (void)setCalendar:(id)a3;
- (void)setData:(id)a3 date:(id)a4 calendar:(id)a5 delegate:(id)a6;
- (void)setDate:(id)a3;
- (void)setInputEventData:(id)a3;
- (void)setProcessedEventData:(id)a3;
- (void)setTotalEventUnits:(double)a3;
- (void)setWeekDelegate:(id)a3;
@end

@implementation SingleDaySummary

- (SingleDaySummary)init
{
  v5.receiver = self;
  v5.super_class = (Class)SingleDaySummary;
  v2 = [(SingleDaySummary *)&v5 init];
  if (v2)
  {
    v3 = +[UIColor clearColor];
    [(SingleDaySummary *)v2 setBackgroundColor:v3];
  }
  return v2;
}

- (void)setData:(id)a3 date:(id)a4 calendar:(id)a5 delegate:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  [(SingleDaySummary *)self setInputEventData:a3];
  [(SingleDaySummary *)self setCalendar:v11];
  v13 = [v11 startOfDayForDate:v12];

  [(SingleDaySummary *)self setDate:v13];
  [(SingleDaySummary *)self setWeekDelegate:v10];

  [(SingleDaySummary *)self _processEventData];

  [(SingleDaySummary *)self setNeedsDisplay];
}

- (void)_processEventData
{
  id v3 = objc_alloc((Class)CalPreferences);
  id v34 = [v3 initWithDomain:kPreferenceDomain];
  v4 = [(SingleDaySummary *)self inputEventData];
  objc_super v5 = +[NSMutableArray arrayWithArray:v4];

  v35 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (!v7) {
    goto LABEL_13;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v38;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v38 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      id v12 = [(SingleDaySummary *)self date];
      v13 = [(SingleDaySummary *)self calendar];
      v14 = [v13 timeZone];
      v15 = +[EKCalendarDate calendarDateWithDate:v12 timeZone:v14];

      v16 = [v15 calendarDateForDay];
      v17 = [v16 date];
      [v17 timeIntervalSinceReferenceDate];
      double v19 = v18;

      v20 = [v15 calendarDateForEndOfDay];
      v21 = [v20 date];
      [v21 timeIntervalSinceReferenceDate];
      double v23 = v22;

      v24 = [v11 startDate];
      [v24 timeIntervalSinceReferenceDate];
      if (v25 > v23)
      {

LABEL_10:
        [v35 addObject:v11];
        goto LABEL_11;
      }
      v26 = [v11 endDate];
      [v26 timeIntervalSinceReferenceDate];
      double v28 = v27;

      if (v28 < v19) {
        goto LABEL_10;
      }
LABEL_11:
    }
    id v8 = [v6 countByEnumeratingWithState:&v37 objects:v41 count:16];
  }
  while (v8);
LABEL_13:

  [v6 removeObjectsInArray:v35];
  if ([v34 getBooleanPreference:kCompactMonthSortSummaryWithTime defaultValue:1])
  {
    v29 = &stru_1001D4C10;
  }
  else
  {
    v29 = (Block_layout *)v36;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1000CAD98;
    v36[3] = &unk_1001D4C30;
    v36[4] = 0x3FC5604180000000;
  }
  [v6 sortUsingComparator:v29];
  [(SingleDaySummary *)self frame];
  if (v30 <= 0.01 || (unint64_t)[v6 count] < 0x13)
  {
    v31 = v6;
  }
  else
  {
    v31 = +[NSMutableArray arrayWithCapacity:18];
    for (uint64_t j = 0; j != 18; ++j)
    {
      v33 = [v6 objectAtIndex:j];
      [v31 addObject:v33];
    }
  }
  -[SingleDaySummary setTotalEventUnits:](self, "setTotalEventUnits:", (double)(unint64_t)[v31 count]);
  [(SingleDaySummary *)self setProcessedEventData:v31];
}

- (id)dataForEventID:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v5 = [(SingleDaySummary *)self processedEventData];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 eventIdentifier];
        unsigned __int8 v11 = [v4 isEqualToString:v10];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (CGRect)frameForEventID:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SingleDaySummary *)self processedEventData];
  id v6 = [v5 count];

  unint64_t v7 = 0;
  if (v6)
  {
    do
    {
      id v8 = [(SingleDaySummary *)self processedEventData];
      uint64_t v9 = [v8 objectAtIndex:v7];

      id v10 = [v9 eventIdentifier];
      unsigned __int8 v11 = [v10 isEqualToString:v4];

      if (v11) {
        break;
      }
      ++v7;
      id v12 = [(SingleDaySummary *)self processedEventData];
      id v13 = [v12 count];
    }
    while (v7 < (unint64_t)v13);
  }
  [(SingleDaySummary *)self _actualEventsWidth];
  [(SingleDaySummary *)self frame];
  CalFloorToScreenScale();
  double v15 = v14;
  [(SingleDaySummary *)self frame];
  double v17 = v16;
  [(SingleDaySummary *)self totalEventUnits];
  [(SingleDaySummary *)self _totalEventsWidth];
  CalCeilToScreenScale();
  double v19 = v18;
  double v20 = v15 + (double)v7 * v18;

  double v21 = 0.0;
  double v22 = v20;
  double v23 = v19;
  double v24 = v17;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v21;
  result.origin.x = v22;
  return result;
}

- (unint64_t)backGroundCornerMaskforEventID:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SingleDaySummary *)self processedEventData];
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    while (1)
    {
      id v8 = [(SingleDaySummary *)self processedEventData];
      uint64_t v9 = [v8 objectAtIndex:v7];

      id v10 = [v9 eventIdentifier];
      unsigned int v11 = [v10 isEqualToString:v4];

      if (v11) {
        break;
      }

      ++v7;
      id v12 = [(SingleDaySummary *)self processedEventData];
      id v13 = (char *)[v12 count];

      if (v7 >= v13) {
        goto LABEL_5;
      }
    }
    if (v7) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = 5;
    }
    double v16 = [(SingleDaySummary *)self processedEventData];
    double v17 = (char *)[v16 count] - 1;

    if (v17 == v7) {
      unint64_t v14 = v15 | 0xA;
    }
    else {
      unint64_t v14 = v15;
    }
  }
  else
  {
LABEL_5:
    unint64_t v14 = 0;
  }

  return v14;
}

- (double)_totalEventsWidth
{
  [(SingleDaySummary *)self frame];
  double v4 = v3;
  [(SingleDaySummary *)self totalEventUnits];
  double v6 = 36.0;
  if (v5 * 6.0 < 36.0)
  {
    [(SingleDaySummary *)self totalEventUnits];
    double v6 = 6.0;
    if (v7 >= 1.0)
    {
      [(SingleDaySummary *)self totalEventUnits];
      double v6 = v8 * 6.0;
    }
  }
  uint64_t v9 = [(SingleDaySummary *)self weekDelegate];
  [v9 monthWeekScale];
  double v11 = v10;

  if (v11 <= 1.0) {
    return v6;
  }
  +[CompactMonthWeekView narrowScale];
  return v6 + (v4 * 0.9 - v6) * ((v11 + -1.0) / (v12 + -1.0));
}

- (double)_actualEventsWidth
{
  double v3 = [(SingleDaySummary *)self processedEventData];
  double v4 = (double)(unint64_t)[v3 count];
  [(SingleDaySummary *)self _totalEventsWidth];
  [(SingleDaySummary *)self totalEventUnits];
  CalFloorToScreenScale();
  double v6 = v5 * v4;

  return v6;
}

- (void)drawRect:(CGRect)a3
{
  double v4 = [(SingleDaySummary *)self backgroundColor];
  [v4 setFill];

  [(SingleDaySummary *)self bounds];
  UIRectFill(v35);
  id v5 = objc_alloc((Class)CalPreferences);
  id v33 = [v5 initWithDomain:kPreferenceDomain];
  unsigned int v6 = [v33 getBooleanPreference:kCompactMonthShowEventsSummaryDividers defaultValue:0];
  [(SingleDaySummary *)self frame];
  if (v7 > 10.0)
  {
    [(SingleDaySummary *)self frame];
    if (v8 >= 0.1)
    {
      uint64_t v9 = [(SingleDaySummary *)self processedEventData];
      if ([v9 count])
      {
        [(SingleDaySummary *)self totalEventUnits];
        double v11 = v10;

        if (v11 == 0.0) {
          goto LABEL_15;
        }
        [(SingleDaySummary *)self _actualEventsWidth];
        double v13 = v12;
        [(SingleDaySummary *)self frame];
        CalFloorToScreenScale();
        double v15 = v14;
        [(SingleDaySummary *)self frame];
        double v17 = v16;
        [(SingleDaySummary *)self totalEventUnits];
        [(SingleDaySummary *)self _totalEventsWidth];
        CalCeilToScreenScale();
        double v19 = v18;
        uint64_t v9 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v15, 0.0, v13, v17, v17 * 0.5);
        [v9 addClip];
        double v20 = [(SingleDaySummary *)self processedEventData];
        id v21 = [v20 count];

        if (v21)
        {
          double v22 = 0;
          do
          {
            double v23 = [(SingleDaySummary *)self processedEventData];
            double v24 = [v23 objectAtIndex:v22];

            if (([v24 animating] & 1) == 0)
            {
              double v25 = 0.0;
              if (v6)
              {
                v26 = [(SingleDaySummary *)self processedEventData];
                if (v22 < (char *)[v26 count] - 1)
                {
                  CalOnePixelInPoints();
                  double v25 = v27;
                }
              }
              double v28 = [v24 color];
              v29 = [(SingleDaySummary *)self traitCollection];
              [v29 userInterfaceStyle];
              double v30 = CUIKSummaryColorForColor();

              [v30 setFill];
              v36.size.width = v19 - v25;
              v36.origin.y = 0.0;
              v36.origin.x = v15;
              v36.size.height = v17;
              UIRectFill(v36);
            }
            double v15 = v19 + v15;

            ++v22;
            v31 = [(SingleDaySummary *)self processedEventData];
            v32 = (char *)[v31 count];
          }
          while (v22 < v32);
        }
      }
    }
  }
LABEL_15:
}

- (NSArray)processedEventData
{
  return self->_processedEventData;
}

- (void)setProcessedEventData:(id)a3
{
}

- (NSArray)inputEventData
{
  return self->_inputEventData;
}

- (void)setInputEventData:(id)a3
{
}

- (double)totalEventUnits
{
  return self->_totalEventUnits;
}

- (void)setTotalEventUnits:(double)a3
{
  self->_totalEventUnits = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (CompactMonthWeekViewDelegate)weekDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weekDelegate);

  return (CompactMonthWeekViewDelegate *)WeakRetained;
}

- (void)setWeekDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weekDelegate);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_inputEventData, 0);

  objc_storeStrong((id *)&self->_processedEventData, 0);
}

@end
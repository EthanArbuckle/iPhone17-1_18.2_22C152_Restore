@interface EventSummaryData
+ (id)eventSummaryDataFromEKEvent:(id)a3;
- (BOOL)animating;
- (BOOL)isAllDay;
- (EventSummaryData)init;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)eventIdentifier;
- (UIColor)color;
- (double)duration;
- (double)normalizedEnd;
- (double)normalizedStart;
- (double)startTime;
- (double)units;
- (void)setAnimating:(BOOL)a3;
- (void)setColor:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEndDate:(id)a3;
- (void)setEventIdentifier:(id)a3;
- (void)setIsAllDay:(BOOL)a3;
- (void)setNormalizedEnd:(double)a3;
- (void)setNormalizedStart:(double)a3;
- (void)setStartDate:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setUnits:(double)a3;
@end

@implementation EventSummaryData

- (EventSummaryData)init
{
  v8.receiver = self;
  v8.super_class = (Class)EventSummaryData;
  result = [(EventSummaryData *)&v8 init];
  if (result)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&result->_normalizedStart = _Q0;
  }
  return result;
}

+ (id)eventSummaryDataFromEKEvent:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = objc_opt_new();
    v5 = [v3 startDate];
    [v4 setStartDate:v5];

    v6 = [v3 endDate];
    [v4 setEndDate:v6];

    if ([v3 isAllDay])
    {
      [v4 setIsAllDay:1];
    }
    else
    {
      v7 = +[NSTimeZone calendarTimeZone];
      objc_super v8 = +[NSCalendar CalGregorianCalendarForTimeZone:v7];
      [v4 setIsAllDay:[v3 isMultiDayTimedEventInCalendar:v8]];
    }
    if ([v3 isIntegrationEvent])
    {
      v9 = CUIKIntegrationEventBackgroundColor();
      [v4 setColor:v9];
    }
    else
    {
      v9 = [v3 calendar];
      v10 = [v9 displayColor];
      [v4 setColor:v10];
    }
    v11 = [v3 eventOccurrenceID];
    [v4 setEventIdentifier:v11];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (void)setIsAllDay:(BOOL)a3
{
  self->_isAllDay = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (double)units
{
  return self->_units;
}

- (void)setUnits:(double)a3
{
  self->_units = a3;
}

- (double)normalizedStart
{
  return self->_normalizedStart;
}

- (void)setNormalizedStart:(double)a3
{
  self->_normalizedStart = a3;
}

- (double)normalizedEnd
{
  return self->_normalizedEnd;
}

- (void)setNormalizedEnd:(double)a3
{
  self->_normalizedEnd = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
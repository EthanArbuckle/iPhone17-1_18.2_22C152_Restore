@interface TransitSchedulesDepartureBaseViewCell
- (NSDate)referenceDate;
- (NSDateComponentsFormatter)timeFormatter;
- (NSDateFormatter)dateFormatter;
- (NSTimeZone)timeZone;
- (id)emphasizedLowFrequencyDepartureDateForDeparture:(id)a3;
- (id)timeStringForDeparture:(id)a3;
- (int64_t)effectiveLiveStatusForDeparture:(id)a3;
- (unint64_t)timeDisplayStyle;
- (void)setReferenceDate:(id)a3;
- (void)setTimeDisplayStyle:(unint64_t)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation TransitSchedulesDepartureBaseViewCell

- (void)setTimeZone:(id)a3
{
  id v6 = a3;
  if ((-[NSTimeZone isEqual:](self->_timeZone, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_timeZone, a3);
    v5 = [(TransitSchedulesDepartureBaseViewCell *)self dateFormatter];
    [v5 setTimeZone:v6];
  }
}

- (NSDateFormatter)dateFormatter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007CC218;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  if (qword_10160F970 != -1) {
    dispatch_once(&qword_10160F970, block);
  }
  return (NSDateFormatter *)(id)qword_10160F968;
}

- (NSDateComponentsFormatter)timeFormatter
{
  if (qword_10160F980 != -1) {
    dispatch_once(&qword_10160F980, &stru_1012F90D0);
  }
  v2 = (void *)qword_10160F978;

  return (NSDateComponentsFormatter *)v2;
}

- (id)emphasizedLowFrequencyDepartureDateForDeparture:(id)a3
{
  id v4 = a3;
  v5 = (char *)[v4 liveStatus];
  if ((unint64_t)(v5 - 1) < 4)
  {
    uint64_t v6 = [v4 liveDepartureDate];
LABEL_6:
    v3 = (void *)v6;
    goto LABEL_7;
  }
  if (!v5 || v5 == (char *)5)
  {
    uint64_t v6 = [v4 scheduledDepartureDate];
    goto LABEL_6;
  }
LABEL_7:

  return v3;
}

- (id)timeStringForDeparture:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TransitSchedulesDepartureBaseViewCell *)self timeDisplayStyle];
  if (v5 == 2 || v5 == 4)
  {
    if ([v4 isPastDeparture])
    {
      uint64_t v6 = [v4 departureDate];
    }
    else
    {
      v7 = [v4 scheduledDepartureDate];
      v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v9 = [v4 liveDepartureDate];
      }
      uint64_t v6 = v9;
    }
LABEL_12:
    v15 = [(TransitSchedulesDepartureBaseViewCell *)self timeZone];
    uint64_t v16 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:v6 inTimeZone:v15 canIncludeDate:0 showTimeZone:0 useShortFormat:0];
    goto LABEL_13;
  }
  uint64_t v6 = [v4 departureDate];
  uint64_t v10 = [v4 liveStatus] == 0;
  v11 = [(TransitSchedulesDepartureBaseViewCell *)self referenceDate];
  LOBYTE(v10) = [v4 isPastDepartureRelativeToDate:v11 usingGracePeriod:v10];

  if (v10) {
    goto LABEL_12;
  }
  v12 = [(TransitSchedulesDepartureBaseViewCell *)self referenceDate];
  [v6 timeIntervalSinceDate:v12];
  double v14 = v13;

  if (GEOTransitDepartureIsImminentDepartureTimeInterval())
  {
    v15 = +[NSBundle mainBundle];
    uint64_t v16 = [v15 localizedStringForKey:@"Now" value:@"localized string not found" table:0];
    goto LABEL_13;
  }
  GEOTransitDepartureNearFuturePeriod();
  if (v14 > v19) {
    goto LABEL_12;
  }
  v15 = [(TransitSchedulesDepartureBaseViewCell *)self timeFormatter];
  uint64_t v16 = [v15 stringFromTimeInterval:v14];
LABEL_13:
  v17 = (void *)v16;

  return v17;
}

- (int64_t)effectiveLiveStatusForDeparture:(id)a3
{
  id v4 = [a3 liveStatus];
  if ((id)[(TransitSchedulesDepartureBaseViewCell *)self timeDisplayStyle] == (id)1 && v4 == (id)3) {
    return 2;
  }
  else {
    return (int64_t)v4;
  }
}

- (unint64_t)timeDisplayStyle
{
  return self->_timeDisplayStyle;
}

- (void)setTimeDisplayStyle:(unint64_t)a3
{
  self->_timeDisplayStyle = a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void)setReferenceDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);

  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end
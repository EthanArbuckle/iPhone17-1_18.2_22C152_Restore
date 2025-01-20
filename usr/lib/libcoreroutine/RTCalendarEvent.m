@interface RTCalendarEvent
+ (id)eventAvailabilityToString:(int64_t)a3;
+ (id)participantStatusToString:(unint64_t)a3;
- (BOOL)isAllDay;
- (NSData)locationMapItemHandle;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)eventIdentifier;
- (NSString)locationTitle;
- (RTCalendarEvent)init;
- (RTCalendarEvent)initWithEventIdentifier:(id)a3 allDay:(BOOL)a4 startDate:(id)a5 endDate:(id)a6 participantStatus:(unint64_t)a7 availability:(int64_t)a8 location:(id)a9 locationTitle:(id)a10 locationMapItemHandle:(id)a11;
- (RTLocation)location;
- (id)description;
- (int64_t)availability;
- (unint64_t)participantStatus;
@end

@implementation RTCalendarEvent

+ (id)participantStatusToString:(unint64_t)a3
{
  if (a3 > 7) {
    return @"Unhandled";
  }
  else {
    return off_1E6B92818[a3];
  }
}

+ (id)eventAvailabilityToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Not Supported";
  }
  else {
    return off_1E6B92858[a3];
  }
}

- (RTCalendarEvent)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithEventIdentifier_allDay_startDate_endDate_participantStatus_availability_location_locationTitle_locationMapItemHandle_);
}

- (RTCalendarEvent)initWithEventIdentifier:(id)a3 allDay:(BOOL)a4 startDate:(id)a5 endDate:(id)a6 participantStatus:(unint64_t)a7 availability:(int64_t)a8 location:(id)a9 locationTitle:(id)a10 locationMapItemHandle:(id)a11
{
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  v37.receiver = self;
  v37.super_class = (Class)RTCalendarEvent;
  v23 = [(RTCalendarEvent *)&v37 init];
  if (v23)
  {
    uint64_t v24 = [v17 copy];
    eventIdentifier = v23->_eventIdentifier;
    v23->_eventIdentifier = (NSString *)v24;

    v23->_allDay = a4;
    uint64_t v26 = [v18 copy];
    startDate = v23->_startDate;
    v23->_startDate = (NSDate *)v26;

    uint64_t v28 = [v19 copy];
    endDate = v23->_endDate;
    v23->_endDate = (NSDate *)v28;

    v23->_participantStatus = a7;
    v23->_availability = a8;
    uint64_t v30 = [v20 copy];
    location = v23->_location;
    v23->_location = (RTLocation *)v30;

    uint64_t v32 = [v21 copy];
    locationTitle = v23->_locationTitle;
    v23->_locationTitle = (NSString *)v32;

    uint64_t v34 = [v22 copy];
    locationMapItemHandle = v23->_locationMapItemHandle;
    v23->_locationMapItemHandle = (NSData *)v34;
  }
  return v23;
}

- (id)description
{
  v3 = NSString;
  if (self->_allDay) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  eventIdentifier = self->_eventIdentifier;
  v6 = [(NSDate *)self->_startDate stringFromDate];
  v7 = [(NSDate *)self->_endDate stringFromDate];
  v8 = [(id)objc_opt_class() participantStatusToString:self->_participantStatus];
  uint64_t v9 = [(id)objc_opt_class() eventAvailabilityToString:self->_availability];
  v10 = (void *)v9;
  if (self->_location) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  if (self->_locationTitle) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  if (self->_locationMapItemHandle) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  v14 = [v3 stringWithFormat:@"eventIdentifier, %@, allDay, %@, startDate, %@, endDate, %@, particpantStatus, %@, availability, %@, location, %@, locationTitle, %@, locationMapItemHandle, %@", eventIdentifier, v4, v6, v7, v8, v9, v11, v12, v13];

  return v14;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (BOOL)isAllDay
{
  return self->_allDay;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (unint64_t)participantStatus
{
  return self->_participantStatus;
}

- (int64_t)availability
{
  return self->_availability;
}

- (RTLocation)location
{
  return self->_location;
}

- (NSString)locationTitle
{
  return self->_locationTitle;
}

- (NSData)locationMapItemHandle
{
  return self->_locationMapItemHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationMapItemHandle, 0);
  objc_storeStrong((id *)&self->_locationTitle, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

@end
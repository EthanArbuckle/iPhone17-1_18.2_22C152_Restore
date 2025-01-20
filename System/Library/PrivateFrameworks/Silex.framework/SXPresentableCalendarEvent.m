@interface SXPresentableCalendarEvent
- (BOOL)allDay;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)location;
- (NSString)title;
- (NSTimeZone)timeZone;
- (NSURL)URL;
- (SXFormattedText)notes;
- (SXPresentableCalendarEvent)initWithStartDate:(id)a3;
- (void)setAllDay:(BOOL)a3;
- (void)setEndDate:(id)a3;
- (void)setLocation:(id)a3;
- (void)setNotes:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setTitle:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation SXPresentableCalendarEvent

- (SXPresentableCalendarEvent)initWithStartDate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXPresentableCalendarEvent;
  v6 = [(SXPresentableCalendarEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_startDate, a3);
  }

  return v7;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (void)setAllDay:(BOOL)a3
{
  self->_allDay = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (SXFormattedText)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
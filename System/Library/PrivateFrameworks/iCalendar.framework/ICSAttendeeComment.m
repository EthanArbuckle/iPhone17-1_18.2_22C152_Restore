@interface ICSAttendeeComment
- (BOOL)shouldObscureParameter:(id)a3;
- (BOOL)shouldObscureValue;
- (ICSAttendeeComment)initWithComment:(id)a3;
- (ICSDateValue)x_calendarserver_dtstamp;
- (NSString)x_calendarserver_attendee_ref;
- (void)setComment:(id)a3;
- (void)setX_calendarserver_attendee_ref:(id)a3;
- (void)setX_calendarserver_dtstamp:(id)a3;
@end

@implementation ICSAttendeeComment

- (ICSAttendeeComment)initWithComment:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSAttendeeComment;
  return [(ICSProperty *)&v4 initWithValue:a3 type:5007];
}

- (void)setComment:(id)a3
{
}

- (void)setX_calendarserver_attendee_ref:(id)a3
{
}

- (NSString)x_calendarserver_attendee_ref
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"X-CALENDARSERVER-ATTENDEE-REF"];
}

- (void)setX_calendarserver_dtstamp:(id)a3
{
}

- (ICSDateValue)x_calendarserver_dtstamp
{
  return (ICSDateValue *)[(ICSProperty *)self parameterValueForName:@"X-CALENDARSERVER-DTSTAMP"];
}

- (BOOL)shouldObscureParameter:(id)a3
{
  return [a3 isEqualToString:@"X-CALENDARSERVER-ATTENDEE-REF"];
}

- (BOOL)shouldObscureValue
{
  return 1;
}

@end
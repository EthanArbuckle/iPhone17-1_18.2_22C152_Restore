@interface ShowEventDetailsTest
- (id)_romanNumeralFromInt:(int)a3;
- (id)createTestEvent:(id)a3 numAttendees:(int64_t)a4;
- (void)cleanUp;
@end

@implementation ShowEventDetailsTest

- (id)createTestEvent:(id)a3 numAttendees:(int64_t)a4
{
  id v6 = a3;
  v7 = [(ApplicationTest *)self model];
  v8 = [v7 eventStore];

  v9 = +[EKEvent eventWithEventStore:v8];
  v25 = v8;
  v10 = [v8 defaultCalendarForNewEvents];
  [v9 setCalendar:v10];

  [v9 setTitle:v6];
  v11 = +[NSDate date];
  [v9 setStartDate:v11];

  v12 = +[NSDate dateWithTimeIntervalSinceNow:3600.0];
  v26 = v9;
  [v9 setEndDate:v12];

  if (a4 >= 1)
  {
    uint64_t v13 = 0;
    do
    {
      uint64_t v14 = v13 + 1;
      [(ShowEventDetailsTest *)self _romanNumeralFromInt:v13 + 1];
      int64_t v15 = a4;
      v17 = v16 = self;
      v18 = +[NSString stringWithFormat:@"Reinbach %@", v17];

      v19 = +[NSString stringWithFormat:@"%@ %@", @"Schloteheim", v18];
      v20 = +[NSString stringWithFormat:@"test_email_address_%d@dev.null.notreal", v13];
      v21 = +[NSString stringWithFormat:@"555-555-5%d", v13 + 100];
      v22 = +[EKAttendee participantWithName:v19 emailAddress:v20 phoneNumber:v21 url:0];
      [v22 setFirstName:@"Schloteheim"];
      [v22 setLastName:v18];
      [v26 addAttendee:v22];

      self = v16;
      a4 = v15;

      uint64_t v13 = v14;
    }
    while (v15 != v14);
  }
  id v27 = 0;
  [v25 saveEvent:v26 span:0 error:&v27];
  id v23 = v27;
  objc_storeStrong((id *)&self->_event, v26);

  return v26;
}

- (id)_romanNumeralFromInt:(int)a3
{
  if ((a3 - 1000) > 0xFFFFFC18)
  {
    v5 = +[NSArray arrayWithObjects:@"I", @"II", @"III", @"IV", @"V", @"VI", @"VII", @"VIII", @"IX", 0];
    id v6 = +[NSArray arrayWithObjects:@"X", @"XX", @"XXX", @"XL", @"L", @"LX", @"LXX", @"LXXX", @"XC", 0];
    v7 = +[NSArray arrayWithObjects:@"C", @"CC", @"CCC", @"CD", @"D", @"DC", @"DCC", @"DCCC", @"CM", 0];
    unsigned int v8 = 10 * ((unsigned __int16)a3 / 0xAu);
    unsigned int v9 = (unsigned __int16)a3 - v8;
    unsigned int v10 = v8 % 0x64;
    signed int v11 = a3 + 100 * (v8 / 0x64) - (unsigned __int16)a3;
    id v4 = objc_alloc_init((Class)NSMutableString);
    if (v11 >= 100)
    {
      v12 = [v7 objectAtIndex:(unsigned __int16)v11 / 0x64u - 1];
      [v4 appendString:v12];
    }
    if (v10 >= 0xA)
    {
      uint64_t v13 = [v6 objectAtIndex:(((429496730 * (unint64_t)v10) >> 32) - 1)];
      [v4 appendString:v13];
    }
    if (v9)
    {
      uint64_t v14 = [v5 objectAtIndex:v9 - 1];
      [v4 appendString:v14];
    }
  }
  else
  {
    id v4 = +[NSString stringWithFormat:@"%i", *(void *)&a3];
  }

  return v4;
}

- (void)cleanUp
{
  if (self->_event)
  {
    id v4 = [(ApplicationTest *)self model];
    v3 = [v4 eventStore];
    [v3 removeEvent:self->_event span:0 error:0];
  }
}

- (void).cxx_destruct
{
}

@end
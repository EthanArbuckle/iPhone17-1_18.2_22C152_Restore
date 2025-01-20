@interface MapsDropCalendarEventReader
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (ICSCalendar)calendar;
- (NSData)data;
- (NSString)typeIdentifier;
@end

@implementation MapsDropCalendarEventReader

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  return (NSArray *)&off_1013AD8F0;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (([v10 isEqualToString:@"com.apple.reminders.ics"] & 1) == 0
    && ![v10 isEqualToString:@"com.apple.calendar.ics"])
  {
    if (a5)
    {
      +[NSError errorWithDomain:NSCocoaErrorDomain code:3328 userInfo:0];
      id v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  id v18 = 0;
  id v11 = [objc_alloc((Class)ICSDocument) initWithData:v9 options:0 error:&v18];
  id v12 = v18;
  v13 = v12;
  if (!v11)
  {
    if (a5) {
      *a5 = v12;
    }

LABEL_12:
    id v14 = 0;
    goto LABEL_13;
  }
  id v14 = objc_alloc_init((Class)objc_opt_class());
  if (a1)
  {
    uint64_t v15 = [v11 calendar];
    v16 = (void *)*((void *)v14 + 2);
    *((void *)v14 + 2) = v15;

    objc_storeStrong((id *)v14 + 1, a3);
    objc_storeStrong((id *)v14 + 3, a4);
  }

LABEL_13:

  return v14;
}

- (NSData)data
{
  return self->_data;
}

- (ICSCalendar)calendar
{
  return self->_calendar;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_calendar, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end
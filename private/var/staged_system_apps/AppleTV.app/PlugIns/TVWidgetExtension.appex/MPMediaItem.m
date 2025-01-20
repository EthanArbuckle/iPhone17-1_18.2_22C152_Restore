@interface MPMediaItem
- (BOOL)tvun_isExpired;
- (id)tvun_expirationDate;
- (id)tvun_expirationString;
@end

@implementation MPMediaItem

- (id)tvun_expirationDate
{
  v3 = [(MPMediaItem *)self valueForProperty:MPMediaItemPropertyRentalPlaybackStartTime];
  if ([v3 isEqualToNumber:&off_100124D18])
  {
    v4 = 0;
  }
  else
  {
    [v3 doubleValue];
    v4 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  uint64_t v5 = [(MPMediaItem *)self valueForProperty:MPMediaItemPropertyRentalPlaybackDuration];
  v6 = (void *)v5;
  id v7 = 0;
  if (v4 && v5)
  {
    if (([v3 isEqualToNumber:&off_100124D18] & 1) != 0
      || ([v6 isEqualToNumber:&off_100124D18] & 1) != 0)
    {
      id v7 = 0;
    }
    else
    {
      id v8 = objc_alloc((Class)NSDate);
      [v6 doubleValue];
      id v7 = [v8 initWithTimeInterval:v4];
    }
  }
  v9 = [(MPMediaItem *)self valueForProperty:MPMediaItemPropertyRentalStartTime];
  if ([v9 isEqualToNumber:&off_100124D18])
  {
    v10 = 0;
  }
  else
  {
    [v9 doubleValue];
    v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }
  uint64_t v11 = [(MPMediaItem *)self valueForProperty:MPMediaItemPropertyRentalDuration];
  v12 = (void *)v11;
  if (v9) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  BOOL v14 = v13 || v10 == 0;
  if (v14
    || ([v9 isEqualToNumber:&off_100124D18] & 1) != 0
    || [v12 isEqualToNumber:&off_100124D18])
  {
    v15 = 0;
    v16 = 0;
    if (!v7) {
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  id v19 = objc_alloc((Class)NSDate);
  [v12 doubleValue];
  id v20 = [v19 initWithTimeInterval:v10];
  v15 = v20;
  if (v7 && v20)
  {
    id v17 = [v7 earlierDate:v20];
    goto LABEL_24;
  }
  if (v7)
  {
LABEL_23:
    id v17 = v7;
LABEL_24:
    v16 = v17;
    goto LABEL_25;
  }
  if (v20)
  {
    id v17 = v20;
    v15 = v17;
    goto LABEL_24;
  }
  v16 = 0;
LABEL_25:

  return v16;
}

- (BOOL)tvun_isExpired
{
  v2 = [(MPMediaItem *)self tvun_expirationDate];
  if (v2)
  {
    v3 = +[NSDate date];
    BOOL v4 = [v2 compare:v3] != (id)1;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (id)tvun_expirationString
{
  v2 = [(MPMediaItem *)self tvun_expirationDate];
  id v3 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  BOOL v4 = +[NSDate date];
  uint64_t v5 = [v3 components:112 fromDate:v4 toDate:v2 options:0];

  uint64_t v6 = (uint64_t)[v5 day];
  uint64_t v7 = (uint64_t)[v5 hour];
  uint64_t v8 = (uint64_t)[v5 minute];
  if (v6 >= 2)
  {
    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"COUNT_DAYS" value:&stru_100124688 table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v6);
    v15 = LABEL_14:;

    goto LABEL_15;
  }
  if (v6 == 1 || v7 >= 1)
  {
    uint64_t v12 = v7 + 24 * v6;
    BOOL v13 = +[NSBundle mainBundle];
    v9 = v13;
    CFStringRef v14 = @"COUNT_HOURS";
LABEL_13:
    v10 = [v13 localizedStringForKey:v14 value:&stru_100124688 table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v12);
    goto LABEL_14;
  }
  if ((v8 & 0x8000000000000000) == 0)
  {
    if (v8 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v8;
    }
    BOOL v13 = +[NSBundle mainBundle];
    v9 = v13;
    CFStringRef v14 = @"COUNT_MINUTES";
    goto LABEL_13;
  }
  v15 = 0;
LABEL_15:

  return v15;
}

@end
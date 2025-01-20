@interface SCLHistoryGroupKey
- (BOOL)isEqual:(id)a3;
- (NSCalendar)calendar;
- (NSDate)referenceDate;
- (SCLHistoryGroupKey)initWithCalendar:(id)a3 referenceDate:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation SCLHistoryGroupKey

- (SCLHistoryGroupKey)initWithCalendar:(id)a3 referenceDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SCLHistoryGroupKey;
  v9 = [(SCLHistoryGroupKey *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_calendar, a3);
    objc_storeStrong((id *)&v10->_referenceDate, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SCLHistoryGroupKey *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(SCLHistoryGroupKey *)v4 calendar];
      v6 = [(SCLHistoryGroupKey *)self calendar];
      if ([v5 isEqual:v6])
      {
        id v7 = [(SCLHistoryGroupKey *)v4 referenceDate];
        id v8 = [(SCLHistoryGroupKey *)self referenceDate];
        char v9 = [v7 isEqual:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(SCLHistoryGroupKey *)self calendar];
  uint64_t v4 = [v3 hash];
  v5 = [(SCLHistoryGroupKey *)self referenceDate];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(NSCalendar *)self->_calendar calendarIdentifier];
  id v7 = [(NSCalendar *)self->_calendar timeZone];
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p; %@; %@; referenceDate=%@>",
    v5,
    self,
    v6,
    v7,
  id v8 = self->_referenceDate);

  return v8;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
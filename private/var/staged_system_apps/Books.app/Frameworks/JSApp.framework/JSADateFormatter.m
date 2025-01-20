@interface JSADateFormatter
+ (id)stringFromDate:(id)a3 dateFormat:(id)a4;
+ (id)stringFromDate:(id)a3 dateStyle:(unint64_t)a4 timeStyle:(unint64_t)a5;
+ (id)stringFromDateValue:(id)a3 dateFormatValue:(id)a4;
+ (id)stringFromDateValue:(id)a3 dateStyleValue:(id)a4 timeStyleValue:(id)a5;
@end

@implementation JSADateFormatter

+ (id)stringFromDateValue:(id)a3 dateStyleValue:(id)a4 timeStyleValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isDate])
  {
    v11 = [v8 toDate];
    if (v11)
    {
      if ([v9 isString])
      {
        v12 = [v9 toString];
      }
      else
      {
        v12 = 0;
      }
      if ([v10 isString])
      {
        v14 = [v10 toString];
      }
      else
      {
        v14 = 0;
      }
      uint64_t v15 = sub_66D0((uint64_t)a1, v12);
      v13 = [a1 stringFromDate:v11 dateStyle:v15 timeStyle:sub_66D0((uint64_t)a1, v14)];

      goto LABEL_12;
    }
  }
  else
  {
    v11 = 0;
  }
  v13 = 0;
LABEL_12:

  return v13;
}

+ (id)stringFromDateValue:(id)a3 dateFormatValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isDate])
  {
    id v8 = [v6 toDate];
    if (v8)
    {
      if ([v7 isString])
      {
        id v9 = [v7 toString];
      }
      else
      {
        id v9 = 0;
      }
      id v10 = [a1 stringFromDate:v8 dateFormat:v9];

      goto LABEL_9;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

+ (id)stringFromDate:(id)a3 dateStyle:(unint64_t)a4 timeStyle:(unint64_t)a5
{
  id v7 = a3;
  if (qword_CE2A8 != -1) {
    dispatch_once(&qword_CE2A8, &stru_B2150);
  }
  id v8 = (id)qword_CE2A0;
  objc_sync_enter(v8);
  [(id)qword_CE2A0 setDateStyle:a4];
  [(id)qword_CE2A0 setTimeStyle:a5];
  id v9 = [(id)qword_CE2A0 stringFromDate:v7];
  objc_sync_exit(v8);

  return v9;
}

+ (id)stringFromDate:(id)a3 dateFormat:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_CE2B8 != -1) {
    dispatch_once(&qword_CE2B8, &stru_B2170);
  }
  id v7 = (id)qword_CE2B0;
  objc_sync_enter(v7);
  id v8 = [(id)qword_CE2B0 calendar];
  NSCalendarIdentifier v9 = [v8 calendarIdentifier];
  NSCalendarIdentifier v10 = v9;
  if (v9 == NSCalendarIdentifierGregorian)
  {
  }
  else
  {
    unsigned int v11 = [v6 containsString:@"y"];

    if (!v11) {
      goto LABEL_8;
    }
    [v6 stringByAppendingString:@"G"];
    id v8 = v6;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_8:
  [(id)qword_CE2B0 setLocalizedDateFormatFromTemplate:v6];
  v12 = [(id)qword_CE2B0 stringFromDate:v5];
  objc_sync_exit(v7);

  return v12;
}

@end
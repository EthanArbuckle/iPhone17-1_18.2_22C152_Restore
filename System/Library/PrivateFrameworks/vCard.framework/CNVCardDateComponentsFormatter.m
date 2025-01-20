@interface CNVCardDateComponentsFormatter
+ (id)dateComponentsFromALTBDAYString:(id)a3;
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (id)altBDAYStringFromDateComponents:(id)a3;
- (id)compactYearMonthDayDateFormatter;
- (id)compactYearMonthDayDateHourMinuteSecondZFormatter;
- (id)dateComponentsFromALTBDAYString:(id)a3;
- (id)dateComponentsFromString:(id)a3;
- (id)gregorianCalendar;
- (id)monthDayDateFormatter;
- (id)monthDayStringFromDateComponents:(id)a3;
- (id)stringForComponentValue:(int64_t)a3 format:(id)a4;
- (id)stringForObjectValue:(id)a3;
- (id)stringFromDateComponents:(id)a3;
- (id)yearMonthDayDateFormatter;
- (id)yearMonthDayDateHourMinuteSecondZFormatter;
- (id)yearMonthDayStringFromDateComponents:(id)a3;
@end

@implementation CNVCardDateComponentsFormatter

- (id)stringFromDateComponents:(id)a3
{
  if (a3)
  {
    v4 = -[CNVCardDateComponentsFormatter stringForObjectValue:](self, "stringForObjectValue:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)gregorianCalendar
{
  gregorianCalendar = self->_gregorianCalendar;
  if (!gregorianCalendar)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    v5 = (NSCalendar *)[v4 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    v6 = self->_gregorianCalendar;
    self->_gregorianCalendar = v5;

    gregorianCalendar = self->_gregorianCalendar;
  }
  return gregorianCalendar;
}

- (id)monthDayDateFormatter
{
  monthDayDateFormatter = self->_monthDayDateFormatter;
  if (!monthDayDateFormatter)
  {
    id v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    v5 = self->_monthDayDateFormatter;
    self->_monthDayDateFormatter = v4;

    v6 = [(CNVCardDateComponentsFormatter *)self gregorianCalendar];
    [(NSDateFormatter *)self->_monthDayDateFormatter setCalendar:v6];

    [(NSDateFormatter *)self->_monthDayDateFormatter setDateFormat:@"--MM-dd"];
    v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:-1.25138736e10];
    [(NSDateFormatter *)self->_monthDayDateFormatter setDefaultDate:v7];

    v8 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSDateFormatter *)self->_monthDayDateFormatter setLocale:v8];

    monthDayDateFormatter = self->_monthDayDateFormatter;
  }
  return monthDayDateFormatter;
}

- (id)yearMonthDayDateHourMinuteSecondZFormatter
{
  yearMonthDayDateHourMinuteSecondZFormatter = self->_yearMonthDayDateHourMinuteSecondZFormatter;
  if (!yearMonthDayDateHourMinuteSecondZFormatter)
  {
    id v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    v5 = self->_yearMonthDayDateHourMinuteSecondZFormatter;
    self->_yearMonthDayDateHourMinuteSecondZFormatter = v4;

    v6 = [(CNVCardDateComponentsFormatter *)self gregorianCalendar];
    [(NSDateFormatter *)self->_yearMonthDayDateHourMinuteSecondZFormatter setCalendar:v6];

    [(NSDateFormatter *)self->_yearMonthDayDateHourMinuteSecondZFormatter setDateFormat:@"y-MM-dd'T'HH:mm:ss'Z'"];
    v7 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSDateFormatter *)self->_yearMonthDayDateHourMinuteSecondZFormatter setLocale:v7];

    yearMonthDayDateHourMinuteSecondZFormatter = self->_yearMonthDayDateHourMinuteSecondZFormatter;
  }
  return yearMonthDayDateHourMinuteSecondZFormatter;
}

- (id)yearMonthDayDateFormatter
{
  yearMonthDayDateFormatter = self->_yearMonthDayDateFormatter;
  if (!yearMonthDayDateFormatter)
  {
    id v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    v5 = self->_yearMonthDayDateFormatter;
    self->_yearMonthDayDateFormatter = v4;

    v6 = [(CNVCardDateComponentsFormatter *)self gregorianCalendar];
    [(NSDateFormatter *)self->_yearMonthDayDateFormatter setCalendar:v6];

    [(NSDateFormatter *)self->_yearMonthDayDateFormatter setDateFormat:@"y-MM-dd"];
    v7 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSDateFormatter *)self->_yearMonthDayDateFormatter setLocale:v7];

    yearMonthDayDateFormatter = self->_yearMonthDayDateFormatter;
  }
  return yearMonthDayDateFormatter;
}

- (id)compactYearMonthDayDateFormatter
{
  compactYearMonthDayDateFormatter = self->_compactYearMonthDayDateFormatter;
  if (!compactYearMonthDayDateFormatter)
  {
    id v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    v5 = self->_compactYearMonthDayDateFormatter;
    self->_compactYearMonthDayDateFormatter = v4;

    v6 = [(CNVCardDateComponentsFormatter *)self gregorianCalendar];
    [(NSDateFormatter *)self->_compactYearMonthDayDateFormatter setCalendar:v6];

    [(NSDateFormatter *)self->_compactYearMonthDayDateFormatter setDateFormat:@"yyyyMMdd"];
    v7 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSDateFormatter *)self->_compactYearMonthDayDateFormatter setLocale:v7];

    compactYearMonthDayDateFormatter = self->_compactYearMonthDayDateFormatter;
  }
  return compactYearMonthDayDateFormatter;
}

- (id)compactYearMonthDayDateHourMinuteSecondZFormatter
{
  compactYearMonthDayDateHourMinuteSecondZFormatter = self->_compactYearMonthDayDateHourMinuteSecondZFormatter;
  if (!compactYearMonthDayDateHourMinuteSecondZFormatter)
  {
    id v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    v5 = self->_compactYearMonthDayDateHourMinuteSecondZFormatter;
    self->_compactYearMonthDayDateHourMinuteSecondZFormatter = v4;

    v6 = [(CNVCardDateComponentsFormatter *)self gregorianCalendar];
    [(NSDateFormatter *)self->_compactYearMonthDayDateHourMinuteSecondZFormatter setCalendar:v6];

    [(NSDateFormatter *)self->_compactYearMonthDayDateHourMinuteSecondZFormatter setDateFormat:@"yyyyMMdd'T'HHmmss'Z'"];
    v7 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSDateFormatter *)self->_compactYearMonthDayDateHourMinuteSecondZFormatter setLocale:v7];

    compactYearMonthDayDateHourMinuteSecondZFormatter = self->_compactYearMonthDayDateHourMinuteSecondZFormatter;
  }
  return compactYearMonthDayDateHourMinuteSecondZFormatter;
}

- (id)dateComponentsFromString:(id)a3
{
  if (a3)
  {
    v8 = 0;
    BOOL v4 = [(CNVCardDateComponentsFormatter *)self getObjectValue:&v8 forString:a3 errorDescription:0];
    v5 = v8;
    if (!v4) {
      v5 = 0;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)monthDayStringFromDateComponents:(id)a3
{
  id v3 = a3;
  if ([v3 month] == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v3, "day") == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = objc_msgSend(NSString, "stringWithFormat:", @"%04ld-%02ld-%02ld", 1604, objc_msgSend(v3, "month"), objc_msgSend(v3, "day"));
  }

  return v4;
}

- (id)yearMonthDayStringFromDateComponents:(id)a3
{
  id v3 = a3;
  if ([v3 year] == 0x7FFFFFFFFFFFFFFFLL
    || [v3 month] == 0x7FFFFFFFFFFFFFFFLL
    || [v3 day] == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = objc_msgSend(NSString, "stringWithFormat:", @"%04ld-%02ld-%02ld", objc_msgSend(v3, "year"), objc_msgSend(v3, "month"), objc_msgSend(v3, "day"));
  }

  return v4;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(CNVCardDateComponentsFormatter *)self yearMonthDayStringFromDateComponents:v4];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      v8 = [(CNVCardDateComponentsFormatter *)self monthDayStringFromDateComponents:v4];
      id v7 = v8;
      if (v8) {
        id v9 = v8;
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  id v8 = a4;
  if (![v8 length])
  {
    LOBYTE(v16) = 0;
    goto LABEL_16;
  }
  [(CNVCardDateComponentsFormatter *)self yearMonthDayDateFormatter];
  v46 = id v51 = 0;
  int v9 = [v46 getObjectValue:&v51 forString:v8 errorDescription:a5];
  v10 = 0;
  if (v9)
  {
    gregorianCalendar = self->_gregorianCalendar;
    id v12 = v51;
    v10 = [(NSCalendar *)gregorianCalendar components:28 fromDate:v12];
    [v10 setCalendar:self->_gregorianCalendar];
  }
  v13 = [(CNVCardDateComponentsFormatter *)self yearMonthDayDateHourMinuteSecondZFormatter];
  v14 = v13;
  if (v9)
  {
    v15 = [(CNVCardDateComponentsFormatter *)self compactYearMonthDayDateFormatter];
LABEL_10:
    v23 = [(CNVCardDateComponentsFormatter *)self compactYearMonthDayDateHourMinuteSecondZFormatter];
LABEL_11:
    v24 = [(CNVCardDateComponentsFormatter *)self monthDayDateFormatter];
    goto LABEL_12;
  }
  id v50 = 0;
  int v17 = [v13 getObjectValue:&v50 forString:v8 errorDescription:a5];
  char v18 = v17;
  if (v17)
  {
    v19 = self->_gregorianCalendar;
    id v20 = v50;
    v21 = [(NSCalendar *)v19 components:28 fromDate:v20];

    [v21 setCalendar:self->_gregorianCalendar];
    v10 = v21;
  }
  v22 = [(CNVCardDateComponentsFormatter *)self compactYearMonthDayDateFormatter];
  v15 = v22;
  if (v18) {
    goto LABEL_10;
  }
  id v49 = 0;
  int v26 = [v22 getObjectValue:&v49 forString:v8 errorDescription:a5];
  char v27 = v26;
  if (v26)
  {
    v28 = self->_gregorianCalendar;
    v42 = v14;
    id v29 = v49;
    v30 = [(NSCalendar *)v28 components:28 fromDate:v29];

    [v30 setCalendar:self->_gregorianCalendar];
    v14 = v42;
    v10 = v30;
  }
  v31 = [(CNVCardDateComponentsFormatter *)self compactYearMonthDayDateHourMinuteSecondZFormatter];
  v23 = v31;
  if (v27) {
    goto LABEL_11;
  }
  id v48 = 0;
  int v32 = [v31 getObjectValue:&v48 forString:v8 errorDescription:a5];
  char v33 = v32;
  if (v32)
  {
    LODWORD(v40) = v32;
    v43 = v14;
    v34 = self->_gregorianCalendar;
    id v35 = v48;
    v36 = [(NSCalendar *)v34 components:28 fromDate:v35];

    char v33 = v40;
    [v36 setCalendar:self->_gregorianCalendar];

    v10 = v36;
    v14 = v43;
  }
  v37 = [(CNVCardDateComponentsFormatter *)self monthDayDateFormatter];
  v24 = v37;
  if ((v33 & 1) == 0)
  {
    id v47 = 0;
    int v16 = [v37 getObjectValue:&v47 forString:v8 errorDescription:a5];
    if (v16)
    {
      v44 = self->_gregorianCalendar;
      id v41 = v47;
      [(NSCalendar *)v44 components:24 fromDate:v41];
      v45 = a3;
      v39 = v38 = v14;

      [v39 setCalendar:self->_gregorianCalendar];
      v10 = v39;
      v14 = v38;
      a3 = v45;
    }
    goto LABEL_13;
  }
LABEL_12:
  LOBYTE(v16) = 1;
LABEL_13:
  if (a3) {
    *a3 = v10;
  }

LABEL_16:
  return v16;
}

+ (id)dateComponentsFromALTBDAYString:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  id v6 = [v5 dateComponentsFromALTBDAYString:v4];

  return v6;
}

- (id)dateComponentsFromALTBDAYString:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = +[CNVCardDateScanner scannerWithString:v4];

  objc_msgSend(v5, "setEra:", objc_msgSend(v6, "scanCalendarUnit:", 2));
  objc_msgSend(v5, "setYear:", objc_msgSend(v6, "scanCalendarUnit:", 4));
  objc_msgSend(v5, "setMonth:", objc_msgSend(v6, "scanCalendarUnit:", 8));
  objc_msgSend(v5, "setLeapMonth:", objc_msgSend(v6, "scanLeapMarker"));
  objc_msgSend(v5, "setDay:", objc_msgSend(v6, "scanCalendarUnit:", 16));
  if ([v5 day] == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v5, "month") == 0x7FFFFFFFFFFFFFFFLL) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
}

- (id)altBDAYStringFromDateComponents:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28E78] string];
  id v6 = -[CNVCardDateComponentsFormatter stringForComponentValue:format:](self, "stringForComponentValue:format:", [v4 era], @"%04li");
  [v5 appendString:v6];

  id v7 = -[CNVCardDateComponentsFormatter stringForComponentValue:format:](self, "stringForComponentValue:format:", [v4 year], @"%04li");
  [v5 appendString:v7];

  id v8 = -[CNVCardDateComponentsFormatter stringForComponentValue:format:](self, "stringForComponentValue:format:", [v4 month], @"%02li");
  [v5 appendString:v8];

  if ([v4 isLeapMonth]) {
    [v5 appendString:@"L"];
  }
  int v9 = -[CNVCardDateComponentsFormatter stringForComponentValue:format:](self, "stringForComponentValue:format:", [v4 day], @"%02li");
  [v5 appendString:v9];

  return v5;
}

- (id)stringForComponentValue:(int64_t)a3 format:(id)a4
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = @"-";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", a4, a3);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yearMonthDayDateHourMinuteSecondZFormatter, 0);
  objc_storeStrong((id *)&self->_yearMonthDayDateFormatter, 0);
  objc_storeStrong((id *)&self->_monthDayDateFormatter, 0);
  objc_storeStrong((id *)&self->_compactYearMonthDayDateHourMinuteSecondZFormatter, 0);
  objc_storeStrong((id *)&self->_compactYearMonthDayDateFormatter, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
}

@end
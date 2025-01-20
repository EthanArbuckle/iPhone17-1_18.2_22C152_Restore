@interface TTRNLTextStructuredEventRecurrentEvent
- (BOOL)isAllDay;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDateComponents)endDateComponents;
- (NSDateComponents)frequencyComponents;
- (NSDateComponents)startDateComponents;
- (NSDictionary)frequency;
- (TTRNLTextStructuredEventRecurrentEvent)initWithRange:(_NSRange)a3 startDate:(id)a4 endDate:(id)a5 isAllDay:(BOOL)a6 frequency:(id)a7;
- (TTRNLTextStructuredEventRecurrentEvent)initWithRange:(_NSRange)a3 startDate:(id)a4 endDate:(id)a5 isAllDay:(BOOL)a6 startComponents:(id)a7 endComponents:(id)a8 frequencyComponents:(id)a9;
- (_NSRange)range;
- (id)description;
- (int64_t)dayFrequency;
- (int64_t)frequencyForKey:(id)a3;
- (int64_t)hourFrequency;
- (int64_t)monthFrequency;
- (int64_t)weekDay;
- (int64_t)weekOfMonthFrequency;
- (int64_t)weekOfYear;
- (int64_t)weekdayEnd;
- (int64_t)weekdayOrdinal;
- (int64_t)weekdayStart;
- (int64_t)yearFrequency;
- (void)setEndDate:(id)a3;
- (void)setEndDateComponents:(id)a3;
- (void)setFrequency:(id)a3;
- (void)setFrequencyComponents:(id)a3;
- (void)setIsAllDay:(BOOL)a3;
- (void)setRange:(_NSRange)a3;
- (void)setStartDate:(id)a3;
- (void)setStartDateComponents:(id)a3;
@end

@implementation TTRNLTextStructuredEventRecurrentEvent

- (TTRNLTextStructuredEventRecurrentEvent)initWithRange:(_NSRange)a3 startDate:(id)a4 endDate:(id)a5 isAllDay:(BOOL)a6 frequency:(id)a7
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)TTRNLTextStructuredEventRecurrentEvent;
  v17 = [(TTRNLTextStructuredEventRecurrentEvent *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_range.NSUInteger location = location;
    v17->_range.NSUInteger length = length;
    objc_storeStrong((id *)&v17->_startDate, a4);
    objc_storeStrong((id *)&v18->_endDate, a5);
    v18->_isAllDay = a6;
    objc_storeStrong((id *)&v18->_frequency, a7);
  }

  return v18;
}

- (TTRNLTextStructuredEventRecurrentEvent)initWithRange:(_NSRange)a3 startDate:(id)a4 endDate:(id)a5 isAllDay:(BOOL)a6 startComponents:(id)a7 endComponents:(id)a8 frequencyComponents:(id)a9
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v23 = a4;
  id v22 = a5;
  id v21 = a7;
  id v15 = a8;
  id v16 = a9;
  v24.receiver = self;
  v24.super_class = (Class)TTRNLTextStructuredEventRecurrentEvent;
  v17 = [(TTRNLTextStructuredEventRecurrentEvent *)&v24 init];
  v18 = v17;
  if (v17)
  {
    v17->_range.NSUInteger location = location;
    v17->_range.NSUInteger length = length;
    objc_storeStrong((id *)&v17->_startDate, a4);
    objc_storeStrong((id *)&v18->_endDate, a5);
    v18->_isAllDay = a6;
    objc_storeStrong((id *)&v18->_startDateComponents, a7);
    objc_storeStrong((id *)&v18->_endDateComponents, a8);
    objc_storeStrong((id *)&v18->_frequencyComponents, a9);
  }

  return v18;
}

- (int64_t)hourFrequency
{
  if (self->_frequencyComponents) {
    return [(NSDateComponents *)self->_frequencyComponents hour];
  }
  else {
    return [(TTRNLTextStructuredEventRecurrentEvent *)self frequencyForKey:*MEMORY[0x1E4F79BE0]];
  }
}

- (int64_t)dayFrequency
{
  if (self->_frequencyComponents) {
    return [(NSDateComponents *)self->_frequencyComponents day];
  }
  else {
    return [(TTRNLTextStructuredEventRecurrentEvent *)self frequencyForKey:*MEMORY[0x1E4F79BD8]];
  }
}

- (int64_t)monthFrequency
{
  if (self->_frequencyComponents) {
    return [(NSDateComponents *)self->_frequencyComponents month];
  }
  else {
    return [(TTRNLTextStructuredEventRecurrentEvent *)self frequencyForKey:*MEMORY[0x1E4F79BE8]];
  }
}

- (int64_t)weekOfMonthFrequency
{
  if (self->_frequencyComponents) {
    return [(NSDateComponents *)self->_frequencyComponents weekOfMonth];
  }
  else {
    return [(TTRNLTextStructuredEventRecurrentEvent *)self frequencyForKey:*MEMORY[0x1E4F79BF0]];
  }
}

- (int64_t)weekDay
{
  if (self->_startDateComponents) {
    return [(NSDateComponents *)self->_startDateComponents weekday];
  }
  else {
    return [(TTRNLTextStructuredEventRecurrentEvent *)self frequencyForKey:*MEMORY[0x1E4F79C08]];
  }
}

- (int64_t)weekdayOrdinal
{
  if (self->_startDateComponents) {
    return [(NSDateComponents *)self->_startDateComponents weekdayOrdinal];
  }
  else {
    return [(TTRNLTextStructuredEventRecurrentEvent *)self frequencyForKey:*MEMORY[0x1E4F79C10]];
  }
}

- (int64_t)weekdayStart
{
  if (self->_startDateComponents) {
    return [(NSDateComponents *)self->_startDateComponents weekday];
  }
  else {
    return [(TTRNLTextStructuredEventRecurrentEvent *)self frequencyForKey:*MEMORY[0x1E4F79C18]];
  }
}

- (int64_t)weekdayEnd
{
  if (self->_endDateComponents) {
    return [(NSDateComponents *)self->_endDateComponents weekday];
  }
  else {
    return [(TTRNLTextStructuredEventRecurrentEvent *)self frequencyForKey:*MEMORY[0x1E4F79C00]];
  }
}

- (int64_t)weekOfYear
{
  if (self->_frequencyComponents) {
    return [(NSDateComponents *)self->_frequencyComponents weekOfYear];
  }
  else {
    return [(TTRNLTextStructuredEventRecurrentEvent *)self frequencyForKey:*MEMORY[0x1E4F79BF8]];
  }
}

- (int64_t)yearFrequency
{
  if (self->_frequencyComponents) {
    return [(NSDateComponents *)self->_frequencyComponents year];
  }
  else {
    return [(TTRNLTextStructuredEventRecurrentEvent *)self frequencyForKey:*MEMORY[0x1E4F79C20]];
  }
}

- (int64_t)frequencyForKey:(id)a3
{
  id v4 = a3;
  v5 = [(TTRNLTextStructuredEventRecurrentEvent *)self frequency];
  v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (int64_t v7 = [v6 integerValue], v7 <= 0)) {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:20];
  id v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v38.NSUInteger location = [(TTRNLTextStructuredEventRecurrentEvent *)self range];
  int64_t v7 = NSStringFromRange(v38);
  v8 = [v4 stringWithFormat:@"<%@ range=%@", v6, v7];
  [v3 addObject:v8];

  v9 = [(TTRNLTextStructuredEventRecurrentEvent *)self startDate];

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E4F28C10];
    v11 = [(TTRNLTextStructuredEventRecurrentEvent *)self startDate];
    v12 = [v10 localizedStringFromDate:v11 dateStyle:1 timeStyle:1];

    v13 = [NSString stringWithFormat:@"start=\"%@\"", v12];
    [v3 addObject:v13];
  }
  id v14 = [(TTRNLTextStructuredEventRecurrentEvent *)self endDate];

  if (v14)
  {
    id v15 = (void *)MEMORY[0x1E4F28C10];
    id v16 = [(TTRNLTextStructuredEventRecurrentEvent *)self endDate];
    v17 = [v15 localizedStringFromDate:v16 dateStyle:1 timeStyle:1];

    v18 = [NSString stringWithFormat:@"end=\"%@\"", v17];
    [v3 addObject:v18];
  }
  v19 = [(TTRNLTextStructuredEventRecurrentEvent *)self startDate];
  if (v19)
  {
  }
  else
  {
    objc_super v20 = [(TTRNLTextStructuredEventRecurrentEvent *)self endDate];

    if (!v20) {
      goto LABEL_9;
    }
  }
  id v21 = NSString;
  id v22 = objc_msgSend(NSNumber, "numberWithBool:", -[TTRNLTextStructuredEventRecurrentEvent isAllDay](self, "isAllDay"));
  id v23 = [v21 stringWithFormat:@"isAllDay=%@", v22];
  [v3 addObject:v23];

LABEL_9:
  if ([(TTRNLTextStructuredEventRecurrentEvent *)self hourFrequency] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v24 = objc_msgSend(NSString, "stringWithFormat:", @"hourFrequency=%ld", -[TTRNLTextStructuredEventRecurrentEvent hourFrequency](self, "hourFrequency"));
    [v3 addObject:v24];
  }
  if ([(TTRNLTextStructuredEventRecurrentEvent *)self dayFrequency] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v25 = objc_msgSend(NSString, "stringWithFormat:", @"dayFrequency=%ld", -[TTRNLTextStructuredEventRecurrentEvent dayFrequency](self, "dayFrequency"));
    [v3 addObject:v25];
  }
  if ([(TTRNLTextStructuredEventRecurrentEvent *)self monthFrequency] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v26 = objc_msgSend(NSString, "stringWithFormat:", @"monthFrequency=%ld", -[TTRNLTextStructuredEventRecurrentEvent monthFrequency](self, "monthFrequency"));
    [v3 addObject:v26];
  }
  if ([(TTRNLTextStructuredEventRecurrentEvent *)self weekOfMonthFrequency] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v27 = objc_msgSend(NSString, "stringWithFormat:", @"weekOfMonthFrequency=%ld", -[TTRNLTextStructuredEventRecurrentEvent weekOfMonthFrequency](self, "weekOfMonthFrequency"));
    [v3 addObject:v27];
  }
  if ([(TTRNLTextStructuredEventRecurrentEvent *)self weekDay] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v28 = objc_msgSend(NSString, "stringWithFormat:", @"weekDay=%ld", -[TTRNLTextStructuredEventRecurrentEvent weekDay](self, "weekDay"));
    [v3 addObject:v28];
  }
  if ([(TTRNLTextStructuredEventRecurrentEvent *)self weekOfYear] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v29 = objc_msgSend(NSString, "stringWithFormat:", @"weekOfYear=%ld", -[TTRNLTextStructuredEventRecurrentEvent weekOfYear](self, "weekOfYear"));
    [v3 addObject:v29];
  }
  if ([(TTRNLTextStructuredEventRecurrentEvent *)self weekdayOrdinal] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v30 = objc_msgSend(NSString, "stringWithFormat:", @"weekdayOrdinal=%ld", -[TTRNLTextStructuredEventRecurrentEvent weekdayOrdinal](self, "weekdayOrdinal"));
    [v3 addObject:v30];
  }
  if ([(TTRNLTextStructuredEventRecurrentEvent *)self weekdayStart] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v31 = objc_msgSend(NSString, "stringWithFormat:", @"weekdayStart=%ld", -[TTRNLTextStructuredEventRecurrentEvent weekdayStart](self, "weekdayStart"));
    [v3 addObject:v31];
  }
  if ([(TTRNLTextStructuredEventRecurrentEvent *)self weekdayEnd] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v32 = objc_msgSend(NSString, "stringWithFormat:", @"weekdayEnd=%ld", -[TTRNLTextStructuredEventRecurrentEvent weekdayEnd](self, "weekdayEnd"));
    [v3 addObject:v32];
  }
  if ([(TTRNLTextStructuredEventRecurrentEvent *)self yearFrequency] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v33 = objc_msgSend(NSString, "stringWithFormat:", @"yearFrequency=%ld", -[TTRNLTextStructuredEventRecurrentEvent yearFrequency](self, "yearFrequency"));
    [v3 addObject:v33];
  }
  v34 = [v3 componentsJoinedByString:@", "];
  v35 = [v34 stringByAppendingString:@">"];

  return v35;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (void)setIsAllDay:(BOOL)a3
{
  self->_isAllDay = a3;
}

- (NSDictionary)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(id)a3
{
}

- (NSDateComponents)startDateComponents
{
  return self->_startDateComponents;
}

- (void)setStartDateComponents:(id)a3
{
}

- (NSDateComponents)endDateComponents
{
  return self->_endDateComponents;
}

- (void)setEndDateComponents:(id)a3
{
}

- (NSDateComponents)frequencyComponents
{
  return self->_frequencyComponents;
}

- (void)setFrequencyComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequencyComponents, 0);
  objc_storeStrong((id *)&self->_endDateComponents, 0);
  objc_storeStrong((id *)&self->_startDateComponents, 0);
  objc_storeStrong((id *)&self->_frequency, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
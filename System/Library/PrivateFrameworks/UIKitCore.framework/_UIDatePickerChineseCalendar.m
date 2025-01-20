@interface _UIDatePickerChineseCalendar
+ (id)cyclicalFromRelated:(id)a3;
+ (id)relatedFromCyclical:(id)a3;
- (NSCalendar)realCalendar;
- (_NSRange)maximumRangeOfUnit:(unint64_t)a3;
- (_NSRange)rangeOfUnit:(unint64_t)a3 inUnit:(unint64_t)a4 forDate:(id)a5;
- (_UIDatePickerChineseCalendar)initWithCalendar:(id)a3;
- (id)calendarIdentifier;
- (id)components:(unint64_t)a3 fromDate:(id)a4;
- (id)components:(unint64_t)a3 fromDate:(id)a4 toDate:(id)a5 options:(unint64_t)a6;
- (id)dateByAddingComponents:(id)a3 toDate:(id)a4 options:(unint64_t)a5;
- (id)dateFromComponents:(id)a3;
- (void)setRealCalendar:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation _UIDatePickerChineseCalendar

+ (id)relatedFromCyclical:(id)a3
{
  if ([a3 year] != 0x7FFFFFFFFFFFFFFFLL || (id v4 = a3, objc_msgSend(a3, "month") != 0x7FFFFFFFFFFFFFFFLL)) {
    id v4 = (id)[a3 copy];
  }
  if ([a3 year] != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 setEra:1];
    uint64_t v5 = [a3 era];
    uint64_t v6 = [a3 year] + 60 * v5;
    if (v6 == 112)
    {
LABEL_10:
      uint64_t v9 = 1604;
    }
    else
    {
      unint64_t v7 = 0;
      while (v7 != 11)
      {
        uint64_t v8 = chineseLeapMonthExtendedYears[v7++ + 2];
        if (v8 == v6 - 61)
        {
          if (v7 < 0xC) {
            goto LABEL_10;
          }
          break;
        }
      }
      uint64_t v9 = v6 - 2697;
    }
    [v4 setYear:v9];
  }
  if ([a3 month] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "setMonth:", 2 * objc_msgSend(a3, "month") - (objc_msgSend(a3, "isLeapMonth") ^ 1));
    [v4 setLeapMonth:0];
  }
  return v4;
}

+ (id)cyclicalFromRelated:(id)a3
{
  uint64_t v6 = [a3 month];
  uint64_t v7 = v6;
  uint64_t v8 = v6 - 1;
  if (v6 < 1) {
    uint64_t v8 = v6;
  }
  uint64_t v9 = (v8 >> 1) + 1;
  uint64_t v10 = [a3 year];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL || (id v11 = a3, v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    id v11 = (id)[a3 copy];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL && v10 == 1604)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"_UIDatePickerChineseCalendar.m", 82, @"Chinese calendar yearless date without month");
    }
    else
    {
      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_12;
      }
      if (v10 != 1604)
      {
        uint64_t v12 = v10 + 2636;
        goto LABEL_11;
      }
    }
    uint64_t v12 = chineseLeapMonthExtendedYears[v9];
LABEL_11:
    uint64_t v13 = v12 % 60;
    [v11 setEra:v12 / 60 + 1];
    [v11 setYear:v13 + 1];
  }
LABEL_12:
  if ([a3 month] != 0x7FFFFFFFFFFFFFFFLL)
  {
    [v11 setMonth:v9];
    [v11 setLeapMonth:(v7 & 1) == 0];
  }
  return v11;
}

- (_UIDatePickerChineseCalendar)initWithCalendar:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerChineseCalendar;
  -[_UIDatePickerChineseCalendar initWithCalendarIdentifier:](&v6, sel_initWithCalendarIdentifier_, [a3 calendarIdentifier]);
  if (self) {
    [(_UIDatePickerChineseCalendar *)self setRealCalendar:a3];
  }
  return self;
}

- (id)dateFromComponents:(id)a3
{
  realCalendar = self->_realCalendar;
  uint64_t v4 = [(id)objc_opt_class() cyclicalFromRelated:a3];
  return [(NSCalendar *)realCalendar dateFromComponents:v4];
}

- (id)components:(unint64_t)a3 fromDate:(id)a4 toDate:(id)a5 options:(unint64_t)a6
{
  objc_super v6 = [(NSCalendar *)self->_realCalendar components:a3 fromDate:a4 toDate:a5 options:a6];
  if ([(NSDateComponents *)v6 year] != 0x7FFFFFFFFFFFFFFFLL
    && [(NSDateComponents *)v6 era] != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSDateComponents *)v6 setYear:[(NSDateComponents *)v6 year] + 60 * [(NSDateComponents *)v6 era]];
    [(NSDateComponents *)v6 setEra:0];
  }
  return v6;
}

- (id)components:(unint64_t)a3 fromDate:(id)a4
{
  unint64_t v6 = (a3 >> 1) & 2;
  if ((a3 & 8) != 0) {
    unint64_t v6 = 6;
  }
  unint64_t v7 = v6 | a3;
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = [(NSCalendar *)self->_realCalendar components:v7 fromDate:a4];
  return (id)[v8 relatedFromCyclical:v9];
}

- (void)setTimeZone:(id)a3
{
}

- (_NSRange)maximumRangeOfUnit:(unint64_t)a3
{
  if (a3 == 2) {
    goto LABEL_4;
  }
  if (a3 != 8)
  {
    if (a3 != 4)
    {
      realCalendar = self->_realCalendar;
      goto LABEL_7;
    }
LABEL_4:
    realCalendar = (NSCalendar *)[MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
LABEL_7:
    NSUInteger v5 = [(NSCalendar *)realCalendar maximumRangeOfUnit:a3];
    goto LABEL_8;
  }
  NSUInteger v5 = [(NSCalendar *)self->_realCalendar maximumRangeOfUnit:8];
  NSUInteger v7 = 2 * v6;
LABEL_8:
  result.length = v7;
  result.location = v5;
  return result;
}

- (id)calendarIdentifier
{
  return [(NSCalendar *)self->_realCalendar calendarIdentifier];
}

- (id)dateByAddingComponents:(id)a3 toDate:(id)a4 options:(unint64_t)a5
{
  return [(NSCalendar *)self->_realCalendar dateByAddingComponents:a3 toDate:a4 options:a5];
}

- (_NSRange)rangeOfUnit:(unint64_t)a3 inUnit:(unint64_t)a4 forDate:(id)a5
{
  if (a3 == 4 && a4 == 2)
  {
    realCalendar = (NSCalendar *)[MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    a3 = 4;
    a4 = 2;
LABEL_7:
    NSUInteger v7 = [(NSCalendar *)realCalendar rangeOfUnit:a3 inUnit:a4 forDate:a5];
    goto LABEL_8;
  }
  realCalendar = self->_realCalendar;
  if (a3 != 8 || a4 != 4) {
    goto LABEL_7;
  }
  NSUInteger v7 = [(NSCalendar *)realCalendar rangeOfUnit:8 inUnit:4 forDate:a5];
  NSUInteger v9 = 2 * v8;
LABEL_8:
  result.length = v9;
  result.location = v7;
  return result;
}

- (NSCalendar)realCalendar
{
  return self->_realCalendar;
}

- (void)setRealCalendar:(id)a3
{
}

@end
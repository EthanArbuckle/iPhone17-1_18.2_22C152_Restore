@interface EKAllDayOccurrenceBlock
- (EKAllDayOccurrenceBlock)initWithEventIndex:(unint64_t)a3 calendarOrder:(unint64_t)a4 dayRange:(_NSRange)a5;
- (EKDayOccurrenceView)occurrenceView;
- (id)description;
- (id)lengthForSorting;
- (unint64_t)calendarOrder;
- (unint64_t)eventIndex;
- (unint64_t)gapBetweenBlock:(id)a3;
- (unint64_t)length;
- (unint64_t)rangeEnd;
- (unint64_t)rangeStart;
- (void)setOccurrenceView:(id)a3;
@end

@implementation EKAllDayOccurrenceBlock

- (EKAllDayOccurrenceBlock)initWithEventIndex:(unint64_t)a3 calendarOrder:(unint64_t)a4 dayRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v10.receiver = self;
  v10.super_class = (Class)EKAllDayOccurrenceBlock;
  result = [(EKAllDayOccurrenceBlock *)&v10 init];
  if (result)
  {
    result->_eventIndex = a3;
    result->_dayRange.NSUInteger location = location;
    result->_dayRange.NSUInteger length = length;
    result->_calendarOrder = a4;
  }
  return result;
}

- (id)lengthForSorting
{
  unint64_t v2 = [(EKAllDayOccurrenceBlock *)self length];

  return +[NSNumber numberWithUnsignedInteger:v2];
}

- (unint64_t)length
{
  return self->_dayRange.length;
}

- (unint64_t)rangeStart
{
  return self->_dayRange.location;
}

- (unint64_t)rangeEnd
{
  return self->_dayRange.location + self->_dayRange.length - 1;
}

- (unint64_t)gapBetweenBlock:(id)a3
{
  v4 = (EKAllDayOccurrenceBlock *)a3;
  unint64_t v5 = [(EKAllDayOccurrenceBlock *)self rangeStart];
  if (v5 <= [(EKAllDayOccurrenceBlock *)v4 rangeEnd])
  {
    unint64_t v7 = [(EKAllDayOccurrenceBlock *)v4 rangeStart];
    unint64_t v8 = [(EKAllDayOccurrenceBlock *)self rangeEnd];
    v6 = v4;
    if (v7 <= v8)
    {
      unint64_t v10 = -1;
      goto LABEL_6;
    }
  }
  else
  {
    v6 = self;
    self = v4;
  }
  v9 = [(EKAllDayOccurrenceBlock *)v6 rangeStart];
  unint64_t v10 = v9 - (unsigned char *)[(EKAllDayOccurrenceBlock *)self rangeEnd];
LABEL_6:

  return v10;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(EKAllDayOccurrenceBlock *)self occurrenceView];
  unint64_t v5 = [v4 occurrence];
  v6 = [v5 title];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; [%@] eventIndex = %ld; rangeStart= %lu; rangeEnd = %lu; calendarOrder = %lu>",
    v3,
    self,
    v6,
    [(EKAllDayOccurrenceBlock *)self eventIndex],
    [(EKAllDayOccurrenceBlock *)self rangeStart],
    [(EKAllDayOccurrenceBlock *)self rangeEnd],
  unint64_t v7 = [(EKAllDayOccurrenceBlock *)self calendarOrder]);

  return v7;
}

- (unint64_t)eventIndex
{
  return self->_eventIndex;
}

- (unint64_t)calendarOrder
{
  return self->_calendarOrder;
}

- (EKDayOccurrenceView)occurrenceView
{
  return self->_occurrenceView;
}

- (void)setOccurrenceView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
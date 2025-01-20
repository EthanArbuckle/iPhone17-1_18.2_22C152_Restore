@interface DayRangeCacheKey
- (BOOL)isEqual:(id)a3;
- (DayRangeCacheKey)initWithOccurrenceStart:(id)a3 occurrenceEnd:(id)a4 rangeBoundStart:(id)a5 rangeBoundEnd:(id)a6;
- (EKCalendarDate)occurrenceEnd;
- (EKCalendarDate)occurrenceStart;
- (EKCalendarDate)rangeBoundEnd;
- (EKCalendarDate)rangeBoundStart;
- (unint64_t)hash;
@end

@implementation DayRangeCacheKey

- (DayRangeCacheKey)initWithOccurrenceStart:(id)a3 occurrenceEnd:(id)a4 rangeBoundStart:(id)a5 rangeBoundEnd:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)DayRangeCacheKey;
  v15 = [(DayRangeCacheKey *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_occurrenceStart, a3);
    objc_storeStrong((id *)&v16->_occurrenceEnd, a4);
    objc_storeStrong((id *)&v16->_rangeBoundStart, a5);
    objc_storeStrong((id *)&v16->_rangeBoundEnd, a6);
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DayRangeCacheKey *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v14 = 1;
  }
  else
  {
    v6 = v4;
    v7 = [(DayRangeCacheKey *)self rangeBoundStart];
    v8 = [(DayRangeCacheKey *)v6 rangeBoundStart];
    if ([v7 isEqual:v8])
    {
      v9 = [(DayRangeCacheKey *)self rangeBoundEnd];
      v10 = [(DayRangeCacheKey *)v6 rangeBoundEnd];
      if ([v9 isEqual:v10])
      {
        id v11 = [(DayRangeCacheKey *)self occurrenceStart];
        id v12 = [(DayRangeCacheKey *)v6 occurrenceStart];
        if ([v11 isEqual:v12])
        {
          v16 = [(DayRangeCacheKey *)self occurrenceEnd];
          id v13 = [(DayRangeCacheKey *)v6 occurrenceEnd];
          unsigned __int8 v14 = [v16 isEqual:v13];
        }
        else
        {
          unsigned __int8 v14 = 0;
        }
      }
      else
      {
        unsigned __int8 v14 = 0;
      }
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
  return v14;
}

- (unint64_t)hash
{
  v3 = [(DayRangeCacheKey *)self rangeBoundStart];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = [(DayRangeCacheKey *)self rangeBoundEnd];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  v7 = [(DayRangeCacheKey *)self occurrenceStart];
  unint64_t v8 = (unint64_t)[v7 hash];
  v9 = [(DayRangeCacheKey *)self occurrenceEnd];
  unint64_t v10 = v6 ^ v8 ^ (unint64_t)[v9 hash];

  return v10;
}

- (EKCalendarDate)occurrenceStart
{
  return self->_occurrenceStart;
}

- (EKCalendarDate)occurrenceEnd
{
  return self->_occurrenceEnd;
}

- (EKCalendarDate)rangeBoundStart
{
  return self->_rangeBoundStart;
}

- (EKCalendarDate)rangeBoundEnd
{
  return self->_rangeBoundEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeBoundEnd, 0);
  objc_storeStrong((id *)&self->_rangeBoundStart, 0);
  objc_storeStrong((id *)&self->_occurrenceEnd, 0);

  objc_storeStrong((id *)&self->_occurrenceStart, 0);
}

@end
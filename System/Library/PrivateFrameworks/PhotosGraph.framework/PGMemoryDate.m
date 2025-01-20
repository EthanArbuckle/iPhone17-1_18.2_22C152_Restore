@interface PGMemoryDate
- (PGMemoryDate)initWithLocalDate:(id)a3;
- (id)universalDateInTimeZone:(id)a3;
@end

@implementation PGMemoryDate

- (id)universalDateInTimeZone:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setEra:self->_era];
  [v6 setYear:self->_year];
  [v6 setMonth:self->_month];
  [v6 setDay:self->_day];
  [v6 setHour:2];
  v7 = [MEMORY[0x1E4F76C68] dateFromComponents:v6 inTimeZone:0];
  v8 = [MEMORY[0x1E4F76C68] universalDateFromLocalDate:v7 inTimeZone:v5];

  return v8;
}

- (PGMemoryDate)initWithLocalDate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGMemoryDate;
  id v5 = [(PGMemoryDate *)&v8 init];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F76C68] components:30 fromDate:v4];
    v5->_era = [v6 era];
    v5->_year = [v6 year];
    v5->_month = [v6 month];
    v5->_day = [v6 day];
  }
  return v5;
}

@end
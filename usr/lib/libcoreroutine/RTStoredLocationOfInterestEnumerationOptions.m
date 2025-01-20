@interface RTStoredLocationOfInterestEnumerationOptions
- (BOOL)ascendingVisitEntryDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)singleVisit;
- (NSDateInterval)dateInterval;
- (RTStoredLocationOfInterestEnumerationOptions)init;
- (RTStoredLocationOfInterestEnumerationOptions)initWithAscendingVisitEntryDate:(BOOL)a3 batchSize:(unint64_t)a4 dateInterval:(id)a5 singleVisit:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)batchSize;
- (unint64_t)hash;
@end

@implementation RTStoredLocationOfInterestEnumerationOptions

- (RTStoredLocationOfInterestEnumerationOptions)init
{
  id v3 = objc_alloc(MEMORY[0x1E4F28C18]);
  v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v6 = (void *)[v3 initWithStartDate:v4 endDate:v5];

  v7 = [(RTStoredLocationOfInterestEnumerationOptions *)self initWithAscendingVisitEntryDate:1 batchSize:0 dateInterval:v6 singleVisit:0];
  return v7;
}

- (RTStoredLocationOfInterestEnumerationOptions)initWithAscendingVisitEntryDate:(BOOL)a3 batchSize:(unint64_t)a4 dateInterval:(id)a5 singleVisit:(BOOL)a6
{
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)RTStoredLocationOfInterestEnumerationOptions;
  v11 = [(RTStoredLocationOfInterestEnumerationOptions *)&v20 init];
  v12 = v11;
  if (v11)
  {
    v11->_ascendingVisitEntryDate = a3;
    if (v10)
    {
      v13 = (NSDateInterval *)v10;
      dateInterval = v12->_dateInterval;
      v12->_dateInterval = v13;
    }
    else
    {
      id v15 = objc_alloc(MEMORY[0x1E4F28C18]);
      dateInterval = [MEMORY[0x1E4F1C9C8] distantPast];
      v16 = [MEMORY[0x1E4F1C9C8] distantFuture];
      uint64_t v17 = [v15 initWithStartDate:dateInterval endDate:v16];
      v18 = v12->_dateInterval;
      v12->_dateInterval = (NSDateInterval *)v17;
    }
    v12->_batchSize = a4;
    v12->_singleVisit = a6;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RTStoredLocationOfInterestEnumerationOptions *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int v6 = [(RTStoredLocationOfInterestEnumerationOptions *)self ascendingVisitEntryDate];
      int v7 = [(RTStoredLocationOfInterestEnumerationOptions *)v5 ascendingVisitEntryDate];
      unint64_t v8 = [(RTStoredLocationOfInterestEnumerationOptions *)self batchSize];
      uint64_t v9 = [(RTStoredLocationOfInterestEnumerationOptions *)v5 batchSize];
      id v10 = [(RTStoredLocationOfInterestEnumerationOptions *)self dateInterval];
      v11 = [(RTStoredLocationOfInterestEnumerationOptions *)v5 dateInterval];
      int v12 = [v10 isEqualToDateInterval:v11];

      BOOL v13 = [(RTStoredLocationOfInterestEnumerationOptions *)self singleVisit];
      BOOL v14 = v12 & (v13 ^ [(RTStoredLocationOfInterestEnumerationOptions *)v5 singleVisit] ^ 1);
      if (v8 != v9) {
        LOBYTE(v14) = 0;
      }
      BOOL v15 = v6 == v7 && v14;
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  id v3 = [NSNumber numberWithBool:self->_ascendingVisitEntryDate];
  uint64_t v4 = [v3 hash];
  v5 = [NSNumber numberWithUnsignedInteger:self->_batchSize];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(NSDateInterval *)self->_dateInterval hash];
  unint64_t v8 = [NSNumber numberWithBool:self->_singleVisit];
  unint64_t v9 = v6 ^ v7 ^ [v8 hash];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL ascendingVisitEntryDate = self->_ascendingVisitEntryDate;
  unint64_t batchSize = self->_batchSize;
  dateInterval = self->_dateInterval;
  BOOL singleVisit = self->_singleVisit;

  return (id)[v4 initWithAscendingVisitEntryDate:ascendingVisitEntryDate batchSize:batchSize dateInterval:dateInterval singleVisit:singleVisit];
}

- (BOOL)ascendingVisitEntryDate
{
  return self->_ascendingVisitEntryDate;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (BOOL)singleVisit
{
  return self->_singleVisit;
}

- (void).cxx_destruct
{
}

@end
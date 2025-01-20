@interface PKPassRelevantDate
+ (BOOL)supportsSecureCoding;
+ (id)findDateFromDates:(id)a3 option:(unint64_t)a4;
- (BOOL)_isEqualToRelevancyDate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSDate)effectiveEndDate;
- (NSDate)effectiveStartDate;
- (NSDateInterval)interval;
- (PKPassRelevantDate)initWithCoder:(id)a3;
- (PKPassRelevantDate)initWithDictionary:(id)a3;
- (PKPassRelevantDate)initWithEffectiveStartDate:(id)a3 effectiveEndDate:(id)a4;
- (PKPassRelevantDate)initWithRelevantDate:(id)a3;
- (PKPassRelevantDate)relevantDateWithPriority:(unint64_t)a3;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)earliestDate;
- (id)latestDate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
@end

@implementation PKPassRelevantDate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_interval, 0);
}

- (void)encodeWithCoder:(id)a3
{
  interval = self->_interval;
  id v5 = a3;
  [v5 encodeObject:interval forKey:@"relevantInterval"];
  [v5 encodeObject:self->_date forKey:@"date"];
}

- (PKPassRelevantDate)initWithRelevantDate:(id)a3
{
  result = (PKPassRelevantDate *)a3;
  if (result)
  {
    v6 = result;
    v10.receiver = self;
    v10.super_class = (Class)PKPassRelevantDate;
    v7 = [(PKPassRelevantDate *)&v10 init];
    v8 = v7;
    if (v7)
    {
      interval = v7->_interval;
      v7->_interval = 0;

      objc_storeStrong((id *)&v8->_date, a3);
    }

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (PKPassRelevantDate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassRelevantDate;
  id v5 = [(PKPassRelevantDate *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relevantInterval"];
    interval = v5->_interval;
    v5->_interval = (NSDateInterval *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)findDateFromDates:(id)a3 option:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        objc_super v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        switch(a4)
        {
          case 0uLL:
            uint64_t v12 = 0;
            goto LABEL_11;
          case 1uLL:
            uint64_t v12 = 1;
LABEL_11:
            id v13 = [v11 relevantDateWithPriority:v12];
            if (!v8) {
              goto LABEL_17;
            }
            v14 = [v8 earlierDate:v13];
            break;
          case 2uLL:
            id v13 = [v11 relevantDateWithPriority:0];
            if (!v8) {
              goto LABEL_17;
            }
            v14 = [v8 laterDate:v13];
            break;
          case 3uLL:
            id v13 = [v11 relevantDateWithPriority:1];
            if (!v8) {
              goto LABEL_17;
            }
            v17 = [v8 laterDate:v13];
            int v18 = [v17 isEqualToDate:v13];

            if (v18) {
              goto LABEL_17;
            }
            goto LABEL_18;
          default:
            continue;
        }
        v15 = v14;
        char v16 = [v14 isEqualToDate:v13];

        if (v16)
        {
LABEL_17:
          id v13 = v13;

          uint64_t v8 = v13;
        }
LABEL_18:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (PKPassRelevantDate)initWithEffectiveStartDate:(id)a3 effectiveEndDate:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 || (uint64_t v8 = v7) == 0) {
    __break(1u);
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v6 endDate:v7];
  objc_super v10 = v9;
  if (!v9) {
    goto LABEL_8;
  }
  [v9 duration];
  if (v11 > 86400.0)
  {
    uint64_t v12 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      long long v22 = v8;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Dropping relevancy interval with start date: %@ end date: %@", buf, 0x16u);
    }

LABEL_8:
    id v13 = 0;
    goto LABEL_12;
  }
  v18.receiver = self;
  v18.super_class = (Class)PKPassRelevantDate;
  v14 = [(PKPassRelevantDate *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_interval, v10);
    date = v15->_date;
    v15->_date = 0;
  }
  self = v15;
  id v13 = self;
LABEL_12:

  return v13;
}

- (PKPassRelevantDate)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 PKDateForKey:@"startDate"];
  id v6 = [v4 PKDateForKey:@"endDate"];
  id v7 = [v4 PKDateForKey:@"date"];

  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (!v7)
    {
      objc_super v10 = 0;
      goto LABEL_10;
    }
    uint64_t v9 = [(PKPassRelevantDate *)self initWithRelevantDate:v7];
  }
  else
  {
    uint64_t v9 = [(PKPassRelevantDate *)self initWithEffectiveStartDate:v5 effectiveEndDate:v6];
  }
  self = v9;
  objc_super v10 = self;
LABEL_10:

  return v10;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassRelevantDate;
  return [(PKPassRelevantDate *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[PKPassRelevantDate allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_interval, self->_interval);
  objc_storeStrong((id *)&v4->_date, self->_date);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPassRelevantDate *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPassRelevantDate *)self _isEqualToRelevancyDate:v5];

  return v6;
}

- (unint64_t)hash
{
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_date];
  [v3 safelyAddObject:self->_interval];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)_isEqualToRelevancyDate:(id)a3
{
  id v4 = a3;
  date = self->_date;
  BOOL v6 = [v4 date];
  if ([(NSDate *)date isEqualToDate:v6])
  {
    interval = self->_interval;
    BOOL v8 = [v4 interval];
    BOOL v9 = [(NSDateInterval *)interval isEqualToDateInterval:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSDate)effectiveStartDate
{
  return [(NSDateInterval *)self->_interval startDate];
}

- (NSDate)effectiveEndDate
{
  return [(NSDateInterval *)self->_interval endDate];
}

- (id)earliestDate
{
  date = [(PKPassRelevantDate *)self effectiveStartDate];
  id v4 = date;
  if (!date) {
    date = self->_date;
  }
  id v5 = date;

  return v5;
}

- (id)latestDate
{
  date = [(PKPassRelevantDate *)self effectiveEndDate];
  id v4 = date;
  if (!date) {
    date = self->_date;
  }
  id v5 = date;

  return v5;
}

- (PKPassRelevantDate)relevantDateWithPriority:(unint64_t)a3
{
  if (a3 == 1)
  {
    objc_super v3 = [(PKPassRelevantDate *)self latestDate];
  }
  else if (a3)
  {
    objc_super v3 = 0;
  }
  else
  {
    objc_super v3 = [(PKPassRelevantDate *)self earliestDate];
  }
  return (PKPassRelevantDate *)v3;
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

@end
@interface STGenericIntentDateRange
+ (BOOL)supportsSecureCoding;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)name;
- (STGenericIntentDateRange)initWithCoder:(id)a3;
- (STGenericIntentDateRange)initWithStartDate:(id)a3 endDate:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
@end

@implementation STGenericIntentDateRange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (STGenericIntentDateRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STGenericIntentDateRange;
  v5 = [(STGenericIntentDateRange *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"_name"];
  [v5 encodeObject:self->_startDate forKey:@"_startDate"];
  [v5 encodeObject:self->_endDate forKey:@"_endDate"];
}

- (STGenericIntentDateRange)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 compare:v8] == 1)
  {
    v9 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)STGenericIntentDateRange;
    uint64_t v10 = [(STGenericIntentDateRange *)&v18 init];
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_startDate, a3);
      if (v8 && ![v7 isEqualToDate:v8])
      {
        v16 = (NSDate *)v8;
        endDate = v11->_endDate;
        v11->_endDate = v16;
      }
      else
      {
        v12 = (void *)MEMORY[0x263EFF910];
        [(NSDate *)v11->_startDate timeIntervalSince1970];
        endDate = objc_msgSend(v12, "dateWithTimeIntervalSince1970:");
        uint64_t v14 = [endDate dateByAddingTimeInterval:86400.0];
        v15 = v11->_endDate;
        v11->_endDate = (NSDate *)v14;
      }
    }
    self = v11;
    v9 = self;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
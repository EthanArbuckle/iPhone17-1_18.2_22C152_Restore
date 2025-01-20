@interface PKDiscoveryRelevantDateRange
+ (BOOL)supportsSecureCoding;
- (BOOL)isExpiredForDate:(id)a3;
- (BOOL)isValidForTime:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (PKDiscoveryRelevantDateRange)initWithCoder:(id)a3;
- (PKDiscoveryRelevantDateRange)initWithDictionary:(id)a3;
- (PKDiscoveryRelevantDateRange)initWithStartDate:(id)a3 endDate:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation PKDiscoveryRelevantDateRange

- (PKDiscoveryRelevantDateRange)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDiscoveryRelevantDateRange;
  v5 = [(PKDiscoveryRelevantDateRange *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKDateForKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 PKDateForKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;
  }
  return v5;
}

- (PKDiscoveryRelevantDateRange)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKDiscoveryRelevantDateRange;
  v9 = [(PKDiscoveryRelevantDateRange *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
    objc_storeStrong((id *)&v10->_endDate, a4);
  }

  return v10;
}

- (BOOL)isValidForTime:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_startDate) {
    BOOL v6 = (unint64_t)objc_msgSend(v4, "compare:") < 2;
  }
  else {
    BOOL v6 = 1;
  }
  if (self->_endDate && (unint64_t)(objc_msgSend(v5, "compare:") + 1) >= 2) {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isExpiredForDate:(id)a3
{
  endDate = self->_endDate;
  if (endDate) {
    LOBYTE(endDate) = [(NSDate *)endDate compare:a3] == NSOrderedAscending;
  }
  return (char)endDate;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [v5 encodeObject:startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
}

- (PKDiscoveryRelevantDateRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDiscoveryRelevantDateRange;
  id v5 = [(PKDiscoveryRelevantDateRange *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSDate *)self->_startDate copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSDate *)self->_endDate copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(PKDiscoveryRelevantDateRange *)self startDate];
  [v3 appendFormat:@"%@: '%@'; ", @"startDate", v4];

  id v5 = [(PKDiscoveryRelevantDateRange *)self endDate];
  [v3 appendFormat:@"%@: '%@'; ", @"endDate", v5];

  [v3 appendFormat:@">"];
  uint64_t v6 = (void *)[v3 copy];

  return v6;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
@interface SMSessionMonitorStateEnumerationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)ascending;
- (BOOL)sortByStateStartDate;
- (NSDateInterval)dateInterval;
- (SMSessionMonitorStateEnumerationOptions)init;
- (SMSessionMonitorStateEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 sortByStateStartDate:(BOOL)a5 ascending:(BOOL)a6 dateInterval:(id)a7;
- (SMSessionMonitorStateEnumerationOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)fetchLimit;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMSessionMonitorStateEnumerationOptions

- (SMSessionMonitorStateEnumerationOptions)init
{
  return [(SMSessionMonitorStateEnumerationOptions *)self initWithBatchSize:0 fetchLimit:0 sortByStateStartDate:0 ascending:0 dateInterval:0];
}

- (SMSessionMonitorStateEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 sortByStateStartDate:(BOOL)a5 ascending:(BOOL)a6 dateInterval:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)SMSessionMonitorStateEnumerationOptions;
  v14 = [(SMSessionMonitorStateEnumerationOptions *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_batchSize = a3;
    v14->_fetchLimit = a4;
    v14->_sortByStateStartDate = a5;
    v14->_ascending = a6;
    objc_storeStrong((id *)&v14->_dateInterval, a7);
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t batchSize = self->_batchSize;
  unint64_t fetchLimit = self->_fetchLimit;
  BOOL sortByStateStartDate = self->_sortByStateStartDate;
  BOOL ascending = self->_ascending;
  dateInterval = self->_dateInterval;

  return (id)[v4 initWithBatchSize:batchSize fetchLimit:fetchLimit sortByStateStartDate:sortByStateStartDate ascending:ascending dateInterval:dateInterval];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t batchSize = self->_batchSize;
  id v5 = a3;
  [v5 encodeInteger:batchSize forKey:@"batchSize"];
  [v5 encodeInteger:self->_fetchLimit forKey:@"fetchLimit"];
  [v5 encodeBool:self->_sortByStateStartDate forKey:@"sortByStateStartDate"];
  [v5 encodeBool:self->_ascending forKey:@"ascending"];
  [v5 encodeObject:self->_dateInterval forKey:@"dateInterval"];
}

- (SMSessionMonitorStateEnumerationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"batchSize"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"fetchLimit"];
  uint64_t v7 = [v4 decodeBoolForKey:@"sortByStateStartDate"];
  uint64_t v8 = [v4 decodeBoolForKey:@"ascending"];
  v9 = [v4 decodeObjectForKey:@"dateInterval"];

  v10 = [(SMSessionMonitorStateEnumerationOptions *)self initWithBatchSize:v5 fetchLimit:v6 sortByStateStartDate:v7 ascending:v8 dateInterval:v9];
  return v10;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (BOOL)sortByStateStartDate
{
  return self->_sortByStateStartDate;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void).cxx_destruct
{
}

@end
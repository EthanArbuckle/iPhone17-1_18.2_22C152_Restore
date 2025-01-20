@interface SMTriggerDestinationStateEnumerationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)ascending;
- (BOOL)sortByStateStartDate;
- (NSDateInterval)dateInterval;
- (NSUUID)sessionIdentifier;
- (SMTriggerDestinationStateEnumerationOptions)init;
- (SMTriggerDestinationStateEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 sortByStateStartDate:(BOOL)a5 ascending:(BOOL)a6 dateInterval:(id)a7 sessionIdentifier:(id)a8;
- (SMTriggerDestinationStateEnumerationOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)fetchLimit;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMTriggerDestinationStateEnumerationOptions

- (SMTriggerDestinationStateEnumerationOptions)init
{
  return [(SMTriggerDestinationStateEnumerationOptions *)self initWithBatchSize:0 fetchLimit:0 sortByStateStartDate:0 ascending:0 dateInterval:0 sessionIdentifier:0];
}

- (SMTriggerDestinationStateEnumerationOptions)initWithBatchSize:(unint64_t)a3 fetchLimit:(unint64_t)a4 sortByStateStartDate:(BOOL)a5 ascending:(BOOL)a6 dateInterval:(id)a7 sessionIdentifier:(id)a8
{
  id v15 = a7;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)SMTriggerDestinationStateEnumerationOptions;
  v17 = [(SMTriggerDestinationStateEnumerationOptions *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_batchSize = a3;
    v17->_fetchLimit = a4;
    v17->_sortByStateStartDate = a5;
    v17->_ascending = a6;
    objc_storeStrong((id *)&v17->_dateInterval, a7);
    objc_storeStrong((id *)&v18->_sessionIdentifier, a8);
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t batchSize = self->_batchSize;
  unint64_t fetchLimit = self->_fetchLimit;
  BOOL sortByStateStartDate = self->_sortByStateStartDate;
  BOOL ascending = self->_ascending;
  dateInterval = self->_dateInterval;
  sessionIdentifier = self->_sessionIdentifier;

  return (id)[v4 initWithBatchSize:batchSize fetchLimit:fetchLimit sortByStateStartDate:sortByStateStartDate ascending:ascending dateInterval:dateInterval sessionIdentifier:sessionIdentifier];
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
  [v5 encodeObject:self->_sessionIdentifier forKey:@"sessionIdentifier"];
}

- (SMTriggerDestinationStateEnumerationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"batchSize"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"fetchLimit"];
  uint64_t v7 = [v4 decodeBoolForKey:@"sortByStateStartDate"];
  uint64_t v8 = [v4 decodeBoolForKey:@"ascending"];
  v9 = [v4 decodeObjectForKey:@"dateInterval"];
  v10 = [v4 decodeObjectForKey:@"sessionIdentifier"];

  v11 = [(SMTriggerDestinationStateEnumerationOptions *)self initWithBatchSize:v5 fetchLimit:v6 sortByStateStartDate:v7 ascending:v8 dateInterval:v9 sessionIdentifier:v10];
  return v11;
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

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);

  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
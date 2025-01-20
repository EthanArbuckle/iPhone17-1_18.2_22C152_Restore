@interface RTWorkoutDistanceEnumerationOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)ascending;
- (Class)enumeratedType;
- (RTWorkoutDistanceEnumerationOptions)initWithBatchSize:(unint64_t)a3 ascending:(BOOL)a4;
- (RTWorkoutDistanceEnumerationOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)batchSize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTWorkoutDistanceEnumerationOptions

- (RTWorkoutDistanceEnumerationOptions)initWithBatchSize:(unint64_t)a3 ascending:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RTWorkoutDistanceEnumerationOptions;
  result = [(RTWorkoutDistanceEnumerationOptions *)&v7 init];
  if (result)
  {
    result->_ascending = a4;
    result->_batchSize = a3;
  }
  return result;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (Class)enumeratedType
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t batchSize = self->_batchSize;
  BOOL ascending = self->_ascending;

  return (id)[v4 initWithBatchSize:batchSize ascending:ascending];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL ascending = self->_ascending;
  id v5 = a3;
  [v5 encodeBool:ascending forKey:@"ascending"];
  [v5 encodeInteger:self->_batchSize forKey:@"batchSize"];
}

- (RTWorkoutDistanceEnumerationOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"ascending"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"batchSize"];

  return [(RTWorkoutDistanceEnumerationOptions *)self initWithBatchSize:v6 ascending:v5];
}

- (id)description
{
  if (self->_ascending) {
    v2 = @"YES";
  }
  else {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"ascending, %@, batchSize, %lu", v2, self->_batchSize];
}

- (BOOL)ascending
{
  return self->_ascending;
}

@end
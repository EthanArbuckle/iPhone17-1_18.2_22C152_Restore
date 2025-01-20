@interface SPOrphanedRecordsResult
+ (BOOL)supportsSecureCoding;
- (NSArray)recordsInfo;
- (SPOrphanedRecordsResult)initWithCoder:(id)a3;
- (SPOrphanedRecordsResult)initWithRecordsInfo:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRecordsInfo:(id)a3;
@end

@implementation SPOrphanedRecordsResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPOrphanedRecordsResult)initWithRecordsInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPOrphanedRecordsResult;
  v6 = [(SPOrphanedRecordsResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_recordsInfo, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPOrphanedRecordsResult alloc];
  id v5 = [(SPOrphanedRecordsResult *)self recordsInfo];
  v6 = [(SPOrphanedRecordsResult *)v4 initWithRecordsInfo:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (SPOrphanedRecordsResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"recordsInfo"];

  recordsInfo = self->_recordsInfo;
  self->_recordsInfo = v5;

  return self;
}

- (NSArray)recordsInfo
{
  return self->_recordsInfo;
}

- (void)setRecordsInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
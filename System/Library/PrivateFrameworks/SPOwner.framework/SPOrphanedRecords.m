@interface SPOrphanedRecords
+ (BOOL)supportsSecureCoding;
- (NSArray)records;
- (NSString)recordType;
- (SPOrphanedRecords)initWithCoder:(id)a3;
- (SPOrphanedRecords)initWithRecordType:(id)a3 records:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRecordType:(id)a3;
- (void)setRecords:(id)a3;
@end

@implementation SPOrphanedRecords

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPOrphanedRecords)initWithRecordType:(id)a3 records:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPOrphanedRecords;
  v9 = [(SPOrphanedRecords *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordType, a3);
    objc_storeStrong((id *)&v10->_records, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPOrphanedRecords alloc];
  v5 = [(SPOrphanedRecords *)self recordType];
  v6 = [(SPOrphanedRecords *)self records];
  id v7 = [(SPOrphanedRecords *)v4 initWithRecordType:v5 records:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  recordType = self->_recordType;
  id v5 = a3;
  [v5 encodeObject:recordType forKey:@"recordType"];
  [v5 encodeObject:self->_records forKey:@"records"];
}

- (SPOrphanedRecords)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordType"];
  recordType = self->_recordType;
  self->_recordType = v5;

  id v7 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"records"];

  records = self->_records;
  self->_records = v7;

  return self;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(id)a3
{
}

- (NSArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);

  objc_storeStrong((id *)&self->_recordType, 0);
}

@end
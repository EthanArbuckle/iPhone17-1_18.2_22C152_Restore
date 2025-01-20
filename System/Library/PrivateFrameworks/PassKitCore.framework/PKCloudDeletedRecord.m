@interface PKCloudDeletedRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeletedRecord:(id)a3;
- (BOOL)isPass;
- (BOOL)isPassCatalog;
- (BOOL)isRemoteAsset;
- (CKRecordID)recordID;
- (NSString)recordName;
- (NSString)recordType;
- (PKCloudDeletedRecord)initWithCoder:(id)a3;
- (PKCloudDeletedRecord)initWithRecordID:(id)a3 recordType:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKCloudDeletedRecord

- (PKCloudDeletedRecord)initWithRecordID:(id)a3 recordType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKCloudDeletedRecord;
  v9 = [(PKCloudDeletedRecord *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordID, a3);
    objc_storeStrong((id *)&v10->_recordType, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudDeletedRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKCloudDeletedRecord;
  v5 = [(PKCloudDeletedRecord *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordID"];
    recordID = v5->_recordID;
    v5->_recordID = (CKRecordID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordType"];
    recordType = v5->_recordType;
    v5->_recordType = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  recordID = self->_recordID;
  id v5 = a3;
  [v5 encodeObject:recordID forKey:@"recordID"];
  [v5 encodeObject:self->_recordType forKey:@"recordType"];
}

- (NSString)recordName
{
  v2 = [(PKCloudDeletedRecord *)self recordID];
  v3 = [v2 recordName];

  return (NSString *)v3;
}

- (BOOL)isPass
{
  v2 = [(PKCloudDeletedRecord *)self recordType];
  v3 = @"Pass";
  id v4 = v3;
  if (v2 == v3)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = 0;
    if (v2 && v3) {
      char v5 = [(__CFString *)v2 isEqualToString:v3];
    }
  }

  return v5;
}

- (BOOL)isPassCatalog
{
  v2 = [(PKCloudDeletedRecord *)self recordType];
  v3 = @"PassCatalog";
  id v4 = v3;
  if (v2 == v3)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = 0;
    if (v2 && v3) {
      char v5 = [(__CFString *)v2 isEqualToString:v3];
    }
  }

  return v5;
}

- (BOOL)isRemoteAsset
{
  v2 = [(PKCloudDeletedRecord *)self recordType];
  v3 = @"RemoteAsset";
  id v4 = v3;
  if (v2 == v3)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = 0;
    if (v2 && v3) {
      char v5 = [(__CFString *)v2 isEqualToString:v3];
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKCloudDeletedRecord *)a3;
  char v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKCloudDeletedRecord *)self isEqualToDeletedRecord:v5];

  return v6;
}

- (BOOL)isEqualToDeletedRecord:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  recordID = self->_recordID;
  BOOL v6 = (CKRecordID *)v4[1];
  if (recordID) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[CKRecordID isEqual:](recordID, "isEqual:")) {
      goto LABEL_11;
    }
LABEL_8:
    char v8 = 0;
    goto LABEL_9;
  }
  if (recordID != v6) {
    goto LABEL_8;
  }
LABEL_11:
  recordType = self->_recordType;
  objc_super v11 = (NSString *)v4[2];
  if (recordType && v11) {
    char v8 = -[NSString isEqual:](recordType, "isEqual:");
  }
  else {
    char v8 = recordType == v11;
  }
LABEL_9:

  return v8;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_recordID];
  [v3 safelyAddObject:self->_recordType];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendString:@"----------------------------\n"];
  [v3 appendFormat:@"recordID:\n%@\n", self->_recordID];
  [v3 appendFormat:@"recordType:\"%@\"\n", self->_recordType];
  [v3 appendString:@"----------------------------\n"];
  return v3;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (NSString)recordType
{
  return self->_recordType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end
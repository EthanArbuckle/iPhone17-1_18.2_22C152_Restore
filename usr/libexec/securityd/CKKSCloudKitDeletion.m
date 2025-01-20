@interface CKKSCloudKitDeletion
- (CKKSCloudKitDeletion)initWithRecordID:(id)a3 recordType:(id)a4;
- (CKRecordID)recordID;
- (NSString)recordType;
- (void)setRecordID:(id)a3;
- (void)setRecordType:(id)a3;
@end

@implementation CKKSCloudKitDeletion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordType, 0);

  objc_storeStrong((id *)&self->_recordID, 0);
}

- (void)setRecordType:(id)a3
{
}

- (NSString)recordType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRecordID:(id)a3
{
}

- (CKRecordID)recordID
{
  return (CKRecordID *)objc_getProperty(self, a2, 8, 1);
}

- (CKKSCloudKitDeletion)initWithRecordID:(id)a3 recordType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKKSCloudKitDeletion;
  v9 = [(CKKSCloudKitDeletion *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordID, a3);
    objc_storeStrong((id *)&v10->_recordType, a4);
  }

  return v10;
}

@end
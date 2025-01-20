@interface BRCShareDeleteInfo
- (BOOL)isEqual:(id)a3;
- (BRCShareDeleteInfo)initWithShareID:(id)a3 emptyRecord:(id)a4;
- (CKRecord)emptyRecord;
- (CKRecordID)shareID;
- (unint64_t)hash;
@end

@implementation BRCShareDeleteInfo

- (BRCShareDeleteInfo)initWithShareID:(id)a3 emptyRecord:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRCShareDeleteInfo;
  v9 = [(BRCShareDeleteInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_shareID, a3);
    objc_storeStrong((id *)&v10->_emptyRecord, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  return [(CKRecordID *)self->_shareID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    shareID = self->_shareID;
    v6 = [v4 shareID];
    char v7 = [(CKRecordID *)shareID isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (CKRecordID)shareID
{
  return self->_shareID;
}

- (CKRecord)emptyRecord
{
  return self->_emptyRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyRecord, 0);
  objc_storeStrong((id *)&self->_shareID, 0);
}

@end
@interface CKKSCKRecordHolder
- (BOOL)matchesCKRecord:(id)a3;
- (CKKSCKRecordHolder)initWithCKRecord:(id)a3 contextID:(id)a4;
- (CKKSCKRecordHolder)initWithCKRecordType:(id)a3 encodedCKRecord:(id)a4 contextID:(id)a5 zoneID:(id)a6;
- (CKRecord)storedCKRecord;
- (CKRecordZoneID)zoneID;
- (NSData)encodedCKRecord;
- (NSString)ckRecordType;
- (NSString)contextID;
- (id)CKRecordName;
- (id)CKRecordWithZoneID:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)updateCKRecord:(id)a3 zoneID:(id)a4;
- (void)setCkRecordType:(id)a3;
- (void)setEncodedCKRecord:(id)a3;
- (void)setFromCKRecord:(id)a3;
- (void)setStoredCKRecord:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKKSCKRecordHolder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckRecordType, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_storedCKRecord, 0);

  objc_storeStrong((id *)&self->_encodedCKRecord, 0);
}

- (void)setCkRecordType:(id)a3
{
}

- (NSString)ckRecordType
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setZoneID:(id)a3
{
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKKSCKRecordHolder;
  v4 = [(CKKSSQLDatabaseObject *)&v10 copyWithZone:a3];
  objc_storeStrong(v4 + 4, self->_contextID);
  objc_storeStrong(v4 + 5, self->_zoneID);
  objc_storeStrong(v4 + 6, self->_ckRecordType);
  id v5 = [(NSData *)self->_encodedCKRecord copy];
  id v6 = v4[2];
  v4[2] = v5;

  id v7 = [self->_storedCKRecord copy];
  id v8 = v4[3];
  v4[3] = v7;

  return v4;
}

- (BOOL)matchesCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = NSStringFromSelector(a2);
  id v8 = +[NSString stringWithFormat:@"%@ must override %@", v6, v7];
  id v9 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v8 userInfo:0];

  objc_exception_throw(v9);
}

- (void)setFromCKRecord:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = NSStringFromSelector(a2);
  id v8 = +[NSString stringWithFormat:@"%@ must override %@", v6, v7];
  id v9 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v8 userInfo:0];

  objc_exception_throw(v9);
}

- (id)updateCKRecord:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  objc_super v10 = NSStringFromSelector(a2);
  v11 = +[NSString stringWithFormat:@"%@ must override %@", v9, v10];
  id v12 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v11 userInfo:0];

  objc_exception_throw(v12);
}

- (id)CKRecordName
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = NSStringFromSelector(a2);
  id v6 = +[NSString stringWithFormat:@"%@ must override %@", v4, v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)CKRecordWithZoneID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)CKRecordID);
  id v6 = [(CKKSCKRecordHolder *)self CKRecordName];
  id v7 = [v5 initWithRecordName:v6 zoneID:v4];

  id v8 = [(CKKSCKRecordHolder *)self encodedCKRecord];

  if (v8)
  {
    id v9 = [(CKKSCKRecordHolder *)self storedCKRecord];
  }
  else
  {
    id v10 = objc_alloc((Class)CKRecord);
    v11 = [(CKKSCKRecordHolder *)self ckRecordType];
    id v9 = [v10 initWithRecordType:v11 recordID:v7];
  }
  id v12 = [v9 copy];
  id v13 = [(CKKSCKRecordHolder *)self updateCKRecord:v9 zoneID:v4];
  if (([v9 isEqual:v12] & 1) == 0) {
    [(CKKSCKRecordHolder *)self setStoredCKRecord:v9];
  }

  return v9;
}

- (void)setEncodedCKRecord:(id)a3
{
  objc_storeStrong((id *)&self->_encodedCKRecord, a3);
  id v6 = a3;
  storedCKRecord = self->_storedCKRecord;
  self->_storedCKRecord = 0;
}

- (NSData)encodedCKRecord
{
  return self->_encodedCKRecord;
}

- (void)setStoredCKRecord:(id)a3
{
  id v4 = a3;
  id v16 = v4;
  if (v4)
  {
    id v5 = [v4 recordID];
    id v6 = [v5 zoneID];
    [(CKKSCKRecordHolder *)self setZoneID:v6];

    id v7 = [v16 recordType];
    [(CKKSCKRecordHolder *)self setCkRecordType:v7];

    id v9 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v16 encodeWithCoder:v9];
    id v10 = [v9 encodedData];
    encodedCKRecord = self->_encodedCKRecord;
    self->_encodedCKRecord = v10;

    id v12 = (CKRecord *)[v16 copy];
    storedCKRecord = self->_storedCKRecord;
    self->_storedCKRecord = v12;
  }
  else
  {
    v14 = self->_encodedCKRecord;
    self->_encodedCKRecord = 0;

    v15 = self->_storedCKRecord;
    self->_storedCKRecord = 0;
  }
}

- (CKRecord)storedCKRecord
{
  storedCKRecord = self->_storedCKRecord;
  if (storedCKRecord)
  {
    id v4 = [storedCKRecord copy];
  }
  else if (self->_encodedCKRecord)
  {
    id v6 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:self->_encodedCKRecord error:0];
    id v7 = (CKRecord *)[objc_alloc((Class)CKRecord) initWithCoder:v6];
    [v6 finishDecoding];
    if (v7)
    {
      id v8 = [(CKRecord *)v7 recordID];
      id v9 = [v8 zoneID];
      id v10 = [(CKKSCKRecordHolder *)self zoneID];
      unsigned __int8 v11 = [v9 isEqual:v10];

      if ((v11 & 1) == 0)
      {
        id v12 = [(CKKSCKRecordHolder *)self zoneID];
        id v13 = [v12 zoneName];
        v14 = sub_1000CD884(@"ckks", v13);

        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = [(CKKSCKRecordHolder *)self zoneID];
          id v16 = [(CKRecord *)v7 recordID];
          v17 = [v16 zoneID];
          int v21 = 138412546;
          v22 = v15;
          __int16 v23 = 2112;
          v24 = v17;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "mismatching zone ids in a single record: %@ and %@", (uint8_t *)&v21, 0x16u);
        }
      }
    }
    v18 = self->_storedCKRecord;
    self->_storedCKRecord = v7;
    v19 = v7;

    id v4 = [(CKRecord *)v19 copy];
  }
  else
  {
    id v4 = 0;
  }

  return (CKRecord *)v4;
}

- (CKKSCKRecordHolder)initWithCKRecordType:(id)a3 encodedCKRecord:(id)a4 contextID:(id)a5 zoneID:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CKKSCKRecordHolder;
  v15 = [(CKKSCKRecordHolder *)&v19 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_contextID, a5);
    objc_storeStrong((id *)&v16->_zoneID, a6);
    objc_storeStrong((id *)&v16->_ckRecordType, a3);
    objc_storeStrong((id *)&v16->_encodedCKRecord, a4);
    storedCKRecord = v16->_storedCKRecord;
    v16->_storedCKRecord = 0;
  }
  return v16;
}

- (CKKSCKRecordHolder)initWithCKRecord:(id)a3 contextID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKKSCKRecordHolder;
  id v8 = [(CKKSCKRecordHolder *)&v13 init];
  if (v8)
  {
    id v9 = [v6 recordID];
    uint64_t v10 = [v9 zoneID];
    zoneID = v8->_zoneID;
    v8->_zoneID = (CKRecordZoneID *)v10;

    objc_storeStrong((id *)&v8->_contextID, a4);
    [(CKKSCKRecordHolder *)v8 setFromCKRecord:v6];
  }

  return v8;
}

@end
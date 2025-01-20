@interface TRISizedCKRecordID
+ (id)recordIDWithRecordId:(id)a3 downloadSize:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecordID:(id)a3;
- (CKRecordID)recordId;
- (TRISizedCKRecordID)initWithRecordId:(id)a3 downloadSize:(unint64_t)a4;
- (id)copyWithReplacementDownloadSize:(unint64_t)a3;
- (id)copyWithReplacementRecordId:(id)a3;
- (id)description;
- (unint64_t)downloadSize;
- (unint64_t)hash;
@end

@implementation TRISizedCKRecordID

- (TRISizedCKRecordID)initWithRecordId:(id)a3 downloadSize:(unint64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIServerTupleTypes.m", 2876, @"Invalid parameter not satisfying: %@", @"recordId != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)TRISizedCKRecordID;
  v9 = [(TRISizedCKRecordID *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordId, a3);
    v10->_downloadSize = a4;
  }

  return v10;
}

+ (id)recordIDWithRecordId:(id)a3 downloadSize:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithRecordId:v6 downloadSize:a4];

  return v7;
}

- (id)copyWithReplacementRecordId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRecordId:v4 downloadSize:self->_downloadSize];

  return v5;
}

- (id)copyWithReplacementDownloadSize:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  recordId = self->_recordId;
  return (id)[v5 initWithRecordId:recordId downloadSize:a3];
}

- (BOOL)isEqualToRecordID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  int v6 = self->_recordId != 0;
  v7 = [v4 recordId];
  int v8 = v7 == 0;

  if (v6 == v8
    || (recordId = self->_recordId) != 0
    && ([v5 recordId],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [(CKRecordID *)recordId isEqual:v10],
        v10,
        !v11))
  {
LABEL_6:
    BOOL v13 = 0;
  }
  else
  {
    unint64_t downloadSize = self->_downloadSize;
    BOOL v13 = downloadSize == [v5 downloadSize];
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRISizedCKRecordID *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRISizedCKRecordID *)self isEqualToRecordID:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(CKRecordID *)self->_recordId hash];
  return self->_downloadSize - v3 + 32 * v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  recordId = self->_recordId;
  id v5 = [NSNumber numberWithUnsignedLongLong:self->_downloadSize];
  BOOL v6 = (void *)[v3 initWithFormat:@"<TRISizedCKRecordID | recordId:%@ downloadSize:%@>", recordId, v5];

  return v6;
}

- (CKRecordID)recordId
{
  return self->_recordId;
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (void).cxx_destruct
{
}

@end
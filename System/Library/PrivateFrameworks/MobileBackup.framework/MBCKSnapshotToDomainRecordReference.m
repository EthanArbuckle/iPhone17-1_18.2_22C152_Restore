@interface MBCKSnapshotToDomainRecordReference
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToReference:(id)a3;
- (MBCKSnapshotToDomainRecordReference)initWithBaseRecordID:(id)a3 pageCount:(unint64_t)a4 checksum:(int64_t)a5;
- (NSString)baseRecordID;
- (id)description;
- (int64_t)checksum;
- (unint64_t)pageCount;
@end

@implementation MBCKSnapshotToDomainRecordReference

- (MBCKSnapshotToDomainRecordReference)initWithBaseRecordID:(id)a3 pageCount:(unint64_t)a4 checksum:(int64_t)a5
{
  id v9 = a3;
  if (!v9) {
    __assert_rtn("-[MBCKSnapshotToDomainRecordReference initWithBaseRecordID:pageCount:checksum:]", "MBCKSnapshotToDomainRecordReference.m", 14, "baseRecordID");
  }
  if (!a4) {
    __assert_rtn("-[MBCKSnapshotToDomainRecordReference initWithBaseRecordID:pageCount:checksum:]", "MBCKSnapshotToDomainRecordReference.m", 15, "pageCount > 0");
  }
  v10 = v9;
  v14.receiver = self;
  v14.super_class = (Class)MBCKSnapshotToDomainRecordReference;
  v11 = [(MBCKSnapshotToDomainRecordReference *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_baseRecordID, a3);
    v12->_pageCount = a4;
    v12->_checksum = a5;
  }

  return v12;
}

- (BOOL)isEqualToReference:(id)a3
{
  id v4 = a3;
  v5 = [(MBCKSnapshotToDomainRecordReference *)self baseRecordID];
  v6 = [v4 baseRecordID];
  if ([v5 isEqualToString:v6]
    && (id v7 = -[MBCKSnapshotToDomainRecordReference pageCount](self, "pageCount"), v7 == [v4 pageCount]))
  {
    id v8 = [(MBCKSnapshotToDomainRecordReference *)self checksum];
    BOOL v9 = v8 == [v4 checksum];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(MBCKSnapshotToDomainRecordReference *)self isEqualToReference:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  Name = class_getName(v3);
  BOOL v5 = [(MBCKSnapshotToDomainRecordReference *)self baseRecordID];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%s: %p; baseRecordID:%@ pc:%llu cs:0x%llx>",
    Name,
    self,
    v5,
    [(MBCKSnapshotToDomainRecordReference *)self pageCount],
  v6 = [(MBCKSnapshotToDomainRecordReference *)self checksum]);

  return v6;
}

- (NSString)baseRecordID
{
  return self->_baseRecordID;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (int64_t)checksum
{
  return self->_checksum;
}

- (void).cxx_destruct
{
}

@end
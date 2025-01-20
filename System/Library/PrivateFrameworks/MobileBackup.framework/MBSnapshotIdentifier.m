@interface MBSnapshotIdentifier
+ (BOOL)supportsSecureCoding;
- (MBSnapshotIdentifier)initWithBackupUDID:(id)a3 snapshotID:(unint64_t)a4;
- (MBSnapshotIdentifier)initWithBackupUUID:(id)a3 snapshotUUID:(id)a4;
- (MBSnapshotIdentifier)initWithCoder:(id)a3;
- (NSString)backupUDID;
- (NSString)backupUUID;
- (NSString)snapshotUUID;
- (id)description;
- (unint64_t)snapshotID;
- (void)encodeWithCoder:(id)a3;
- (void)setBackupUDID:(id)a3;
- (void)setSnapshotID:(unint64_t)a3;
@end

@implementation MBSnapshotIdentifier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  backupUUID = self->_backupUUID;
  id v5 = a3;
  [v5 encodeObject:backupUUID forKey:@"backupUUID"];
  [v5 encodeObject:self->_snapshotUUID forKey:@"snapshotUUID"];
  [v5 encodeObject:self->_backupUDID forKey:@"backupUDID"];
  [v5 encodeInteger:self->_snapshotID forKey:@"snapshotID"];
}

- (MBSnapshotIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MBSnapshotIdentifier;
  id v5 = [(MBSnapshotIdentifier *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backupUUID"];
    backupUUID = v5->_backupUUID;
    v5->_backupUUID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"snapshotUUID"];
    snapshotUUID = v5->_snapshotUUID;
    v5->_snapshotUUID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backupUDID"];
    backupUDID = v5->_backupUDID;
    v5->_backupUDID = (NSString *)v10;

    v5->_snapshotID = [v4 decodeIntegerForKey:@"snapshotID"];
  }

  return v5;
}

- (MBSnapshotIdentifier)initWithBackupUDID:(id)a3 snapshotID:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MBSnapshotIdentifier;
  uint64_t v8 = [(MBSnapshotIdentifier *)&v13 init];
  v9 = v8;
  if (v8)
  {
    backupUUID = v8->_backupUUID;
    v8->_backupUUID = 0;

    snapshotUUID = v9->_snapshotUUID;
    v9->_snapshotUUID = 0;

    objc_storeStrong((id *)&v9->_backupUDID, a3);
    v9->_snapshotID = a4;
  }

  return v9;
}

- (MBSnapshotIdentifier)initWithBackupUUID:(id)a3 snapshotUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MBSnapshotIdentifier;
  v9 = [(MBSnapshotIdentifier *)&v13 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backupUUID, a3);
    objc_storeStrong((id *)&v10->_snapshotUUID, a4);
    backupUDID = v10->_backupUDID;
    v10->_backupUDID = 0;

    v10->_snapshotID = 0;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%s: %p; backupUUID=%@, snapshotUUID=%@, backupUDID=%@, snapshotID=%lu>",
               class_getName(v4),
               self,
               self->_backupUUID,
               self->_snapshotUUID,
               self->_backupUDID,
               self->_snapshotID);
}

- (NSString)backupUUID
{
  return self->_backupUUID;
}

- (NSString)snapshotUUID
{
  return self->_snapshotUUID;
}

- (NSString)backupUDID
{
  return self->_backupUDID;
}

- (void)setBackupUDID:(id)a3
{
}

- (unint64_t)snapshotID
{
  return self->_snapshotID;
}

- (void)setSnapshotID:(unint64_t)a3
{
  self->_snapshotID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupUDID, 0);
  objc_storeStrong((id *)&self->_snapshotUUID, 0);
  objc_storeStrong((id *)&self->_backupUUID, 0);
}

@end
@interface SKAPFSSnapshotDisk
- (NSString)apfsUUID;
- (NSString)snapshotName;
- (id)dictionaryRepresentation;
- (id)innerDescriptionWithPrivateData:(BOOL)a3;
- (id)minimalDictionaryRepresentation;
- (int64_t)sealStatus;
- (void)setApfsUUID:(id)a3;
- (void)setSealStatus:(int64_t)a3;
- (void)setSnapshotName:(id)a3;
- (void)updateWithDictionary:(id)a3;
@end

@implementation SKAPFSSnapshotDisk

- (NSString)apfsUUID
{
  return self->_apfsUUID;
}

- (void)setApfsUUID:(id)a3
{
}

- (void)updateWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v9.receiver = v5;
  v9.super_class = (Class)SKAPFSSnapshotDisk;
  [(SKAPFSDisk *)&v9 updateWithDictionary:v4];
  v6 = [v4 objectForKey:@"snapshotName"];
  [(SKAPFSSnapshotDisk *)v5 setSnapshotName:v6];

  v7 = [v4 objectForKey:@"snapshotSealStatus"];
  -[SKAPFSSnapshotDisk setSealStatus:](v5, "setSealStatus:", [v7 integerValue]);

  v8 = [v4 objectForKey:@"apfsUUID"];
  [(SKAPFSSnapshotDisk *)v5 setApfsUUID:v8];

  objc_sync_exit(v5);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  v10.receiver = v2;
  v10.super_class = (Class)SKAPFSSnapshotDisk;
  v3 = [(SKAPFSDisk *)&v10 dictionaryRepresentation];
  id v4 = [(SKAPFSSnapshotDisk *)v2 snapshotName];

  if (v4)
  {
    v5 = [(SKAPFSSnapshotDisk *)v2 snapshotName];
    [v3 setObject:v5 forKeyedSubscript:@"snapshotName"];
  }
  if ([(SKAPFSSnapshotDisk *)v2 sealStatus])
  {
    v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[SKAPFSSnapshotDisk sealStatus](v2, "sealStatus"));
    [v3 setObject:v6 forKeyedSubscript:@"snapshotSealStatus"];
  }
  v7 = [(SKAPFSSnapshotDisk *)v2 apfsUUID];

  if (v7)
  {
    v8 = [(SKAPFSSnapshotDisk *)v2 apfsUUID];
    [v3 setObject:v8 forKeyedSubscript:@"apfsUUID"];
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)minimalDictionaryRepresentation
{
  v2 = self;
  objc_sync_enter(v2);
  v10.receiver = v2;
  v10.super_class = (Class)SKAPFSSnapshotDisk;
  v3 = [(SKAPFSDisk *)&v10 minimalDictionaryRepresentation];
  id v4 = [(SKAPFSSnapshotDisk *)v2 snapshotName];

  if (v4)
  {
    v5 = [(SKAPFSSnapshotDisk *)v2 snapshotName];
    [v3 setObject:v5 forKeyedSubscript:@"snapshotName"];
  }
  if ([(SKAPFSSnapshotDisk *)v2 sealStatus])
  {
    v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[SKAPFSSnapshotDisk sealStatus](v2, "sealStatus"));
    [v3 setObject:v6 forKeyedSubscript:@"snapshotSealStatus"];
  }
  v7 = [(SKAPFSSnapshotDisk *)v2 apfsUUID];

  if (v7)
  {
    v8 = [(SKAPFSSnapshotDisk *)v2 apfsUUID];
    [v3 setObject:v8 forKeyedSubscript:@"apfsUUID"];
  }
  objc_sync_exit(v2);

  return v3;
}

- (id)innerDescriptionWithPrivateData:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)SKAPFSSnapshotDisk;
  v6 = -[SKAPFSDisk innerDescriptionWithPrivateData:](&v13, sel_innerDescriptionWithPrivateData_);
  if (v3)
  {
    v7 = [(SKAPFSSnapshotDisk *)self snapshotName];
  }
  else
  {
    v7 = @"<private>";
  }
  uint64_t v8 = [(SKAPFSSnapshotDisk *)self snapshotUUID];
  objc_super v9 = (void *)v8;
  objc_super v10 = @"--";
  if (v8) {
    objc_super v10 = (__CFString *)v8;
  }
  v11 = [v5 stringWithFormat:@"%@, Snapshot Name: %@, Snapshot UUID: %@", v6, v7, v10];

  if (v3) {

  }
  return v11;
}

- (NSString)snapshotName
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSnapshotName:(id)a3
{
}

- (int64_t)sealStatus
{
  return self->_sealStatus;
}

- (void)setSealStatus:(int64_t)a3
{
  self->_sealStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotName, 0);

  objc_storeStrong((id *)&self->_apfsUUID, 0);
}

@end
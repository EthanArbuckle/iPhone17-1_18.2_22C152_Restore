@interface PSYDeviceSyncStateEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCompletedInitialOrMigrationSync;
- (BOOL)hasCompletedInitialSync;
- (BOOL)hasCompletedSync;
- (BOOL)isEqual:(id)a3;
- (NSUUID)pairingID;
- (PSYDeviceSyncStateEntry)initWithCoder:(id)a3;
- (PSYDeviceSyncStateEntry)initWithPairingID:(id)a3 syncState:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)initialSyncState;
- (unsigned)migrationIndex;
- (unsigned)syncSwitchIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setInitialSyncState:(unint64_t)a3;
- (void)setMigrationIndex:(unsigned int)a3;
- (void)setPairingID:(id)a3;
- (void)setSyncSwitchIndex:(unsigned int)a3;
@end

@implementation PSYDeviceSyncStateEntry

- (PSYDeviceSyncStateEntry)initWithPairingID:(id)a3 syncState:(unint64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PSYDeviceSyncStateEntry;
  v8 = [(PSYDeviceSyncStateEntry *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pairingID, a3);
    v9->_initialSyncState = a4;
    v10 = +[PSYRegistrySingleton registry];
    v11 = [v10 deviceForPairingID:v7];

    if (!v11)
    {

      v12 = 0;
      goto LABEL_6;
    }
    v9->_syncSwitchIndex = [v10 lastSyncSwitchIndex];
    v9->_migrationIndex = [v10 migrationCountForPairingID:v7];
  }
  v12 = v9;
LABEL_6:

  return v12;
}

- (BOOL)hasCompletedInitialSync
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = psy_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = psy_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = NSStringFromPSYDeviceSyncState(self->_initialSyncState);
      int v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_2179FA000, v5, OS_LOG_TYPE_DEFAULT, "NRPDR has completed initial sync %@", (uint8_t *)&v8, 0xCu);
    }
  }
  return self->_initialSyncState == 3;
}

- (BOOL)hasCompletedInitialOrMigrationSync
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = +[PSYRegistrySingleton registry];
  BOOL v4 = [v3 deviceForPairingID:self->_pairingID];
  v5 = [v4 valueForProperty:*MEMORY[0x263F5BB08]];
  int v6 = [v5 integerValue];

  BOOL v7 = self->_initialSyncState == 3 && self->_migrationIndex == v6;
  int v8 = psy_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = psy_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = NSStringFromPSYDeviceSyncState(self->_initialSyncState);
      unsigned int migrationIndex = self->_migrationIndex;
      v13 = @"NO";
      int v15 = 138413058;
      v16 = v11;
      if (v7) {
        v13 = @"YES";
      }
      __int16 v17 = 1024;
      unsigned int v18 = migrationIndex;
      __int16 v19 = 1024;
      int v20 = v6;
      __int16 v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_2179FA000, v10, OS_LOG_TYPE_DEFAULT, "NRPDR initial sync state %@;           migration index: %d;           nr migration index: %d           hasComple"
        "tedInitialOrMigrationSync %@;",
        (uint8_t *)&v15,
        0x22u);
    }
  }

  return v7;
}

- (BOOL)hasCompletedSync
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = +[PSYRegistrySingleton registry];
  BOOL v4 = psy_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    int v6 = psy_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = [(NSUUID *)self->_pairingID UUIDString];
      uint64_t v8 = [v3 switchIndex];
      uint64_t syncSwitchIndex = self->_syncSwitchIndex;
      int v13 = 138412802;
      objc_super v14 = v7;
      __int16 v15 = 2048;
      uint64_t v16 = v8;
      __int16 v17 = 2048;
      uint64_t v18 = syncSwitchIndex;
      _os_log_impl(&dword_2179FA000, v6, OS_LOG_TYPE_DEFAULT, "NRPDR %@ syncSwitchIndex: %ld prefs switchIndex: %ld", (uint8_t *)&v13, 0x20u);
    }
  }
  if ([(PSYDeviceSyncStateEntry *)self hasCompletedInitialOrMigrationSync])
  {
    uint64_t v10 = self->_syncSwitchIndex;
    BOOL v11 = [v3 switchIndex] == v10;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  pairingID = self->_pairingID;
  id v5 = a3;
  [v5 encodeObject:pairingID forKey:@"pairingID"];
  [v5 encodeInteger:self->_initialSyncState forKey:@"syncState"];
  [v5 encodeInt32:self->_syncSwitchIndex forKey:@"syncSwitchIndex"];
  [v5 encodeInt32:self->_migrationIndex forKey:@"migrationIndex"];
}

- (PSYDeviceSyncStateEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSYDeviceSyncStateEntry;
  id v5 = [(PSYDeviceSyncStateEntry *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingID"];
    pairingID = v5->_pairingID;
    v5->_pairingID = (NSUUID *)v6;

    v5->_initialSyncState = [v4 decodeIntegerForKey:@"syncState"];
    v5->_uint64_t syncSwitchIndex = [v4 decodeInt32ForKey:@"syncSwitchIndex"];
    v5->_unsigned int migrationIndex = [v4 decodeInt32ForKey:@"migrationIndex"];
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(NSUUID *)self->_pairingID UUIDString];
  BOOL v7 = NSStringFromPSYDeviceSyncState(self->_initialSyncState);
  uint64_t syncSwitchIndex = self->_syncSwitchIndex;
  uint64_t migrationIndex = self->_migrationIndex;
  BOOL v10 = [(PSYDeviceSyncStateEntry *)self hasCompletedSync];
  BOOL v11 = @"Not Completed";
  if (v10) {
    BOOL v11 = @"Completed";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p; pairingID=%@ initialSyncState=%@ syncSwitchIndex=%lu migrationIndex=%lu syncState=%@>",
    v5,
    self,
    v6,
    v7,
    syncSwitchIndex,
    migrationIndex,
  v12 = v11);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PSYDeviceSyncStateEntry *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  if (v4 == self)
  {
    BOOL v6 = 1;
    goto LABEL_13;
  }
  if (v4)
  {
    id v5 = v4;
    BOOL v6 = [(NSUUID *)self->_pairingID isEqual:v5->_pairingID]
      && self->_initialSyncState == v5->_initialSyncState
      && self->_syncSwitchIndex == v5->_syncSwitchIndex
      && self->_migrationIndex == v5->_migrationIndex;
  }
  else
  {
LABEL_9:
    BOOL v6 = 0;
  }
LABEL_13:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_pairingID hash];
  unint64_t v4 = self->_initialSyncState - v3 + 32 * v3;
  uint64_t v5 = self->_syncSwitchIndex - v4 + 32 * v4;
  return self->_migrationIndex - v5 + 32 * v5 + 923521;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 16), self->_pairingID);
  *(void *)(v4 + 24) = self->_initialSyncState;
  *(_DWORD *)(v4 + 8) = self->_syncSwitchIndex;
  *(_DWORD *)(v4 + 12) = self->_migrationIndex;
  return (id)v4;
}

- (NSUUID)pairingID
{
  return self->_pairingID;
}

- (void)setPairingID:(id)a3
{
}

- (unint64_t)initialSyncState
{
  return self->_initialSyncState;
}

- (void)setInitialSyncState:(unint64_t)a3
{
  self->_initialSyncState = a3;
}

- (unsigned)syncSwitchIndex
{
  return self->_syncSwitchIndex;
}

- (void)setSyncSwitchIndex:(unsigned int)a3
{
  self->_uint64_t syncSwitchIndex = a3;
}

- (unsigned)migrationIndex
{
  return self->_migrationIndex;
}

- (void)setMigrationIndex:(unsigned int)a3
{
  self->_uint64_t migrationIndex = a3;
}

- (void).cxx_destruct
{
}

@end
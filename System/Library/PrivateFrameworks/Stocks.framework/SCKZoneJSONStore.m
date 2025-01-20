@interface SCKZoneJSONStore
- (CKServerChangeToken)serverChangeToken;
- (NSArray)pendingCommands;
- (NSArray)serverRecords;
- (NSDate)lastDirtyDate;
- (NSDate)lastSyncDate;
- (NSString)zoneName;
- (SCKZoneJSONStore)initWithZoneName:(id)a3 serverRecords:(id)a4 lastSyncDate:(id)a5 lastDirtyDate:(id)a6 serverChangeToken:(id)a7 pendingCommands:(id)a8;
- (void)addPendingCommands:(id)a3;
- (void)applyServerRecordsDiff:(id)a3;
- (void)clearPendingCommandsUpToCount:(unint64_t)a3;
- (void)setLastDirtyDate:(id)a3;
- (void)setLastSyncDate:(id)a3;
- (void)setPendingCommands:(id)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setServerRecords:(id)a3;
- (void)setZoneName:(id)a3;
@end

@implementation SCKZoneJSONStore

- (SCKZoneJSONStore)initWithZoneName:(id)a3 serverRecords:(id)a4 lastSyncDate:(id)a5 lastDirtyDate:(id)a6 serverChangeToken:(id)a7 pendingCommands:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v26 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v27.receiver = self;
  v27.super_class = (Class)SCKZoneJSONStore;
  v19 = [(SCKZoneJSONStore *)&v27 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    zoneName = v19->_zoneName;
    v19->_zoneName = (NSString *)v20;

    v22 = (void *)MEMORY[0x263EFFA68];
    if (v15) {
      v23 = v15;
    }
    else {
      v23 = (void *)MEMORY[0x263EFFA68];
    }
    objc_storeStrong((id *)&v19->_serverRecords, v23);
    objc_storeStrong((id *)&v19->_lastSyncDate, a5);
    objc_storeStrong((id *)&v19->_lastDirtyDate, a6);
    objc_storeStrong((id *)&v19->_serverChangeToken, a7);
    if (v18) {
      v24 = v18;
    }
    else {
      v24 = v22;
    }
    objc_storeStrong((id *)&v19->_pendingCommands, v24);
  }

  return v19;
}

- (void)applyServerRecordsDiff:(id)a3
{
  id v4 = a3;
  id v7 = [(SCKZoneJSONStore *)self serverRecords];
  v5 = [v4 applyToRecords:v7];

  serverRecords = self->_serverRecords;
  self->_serverRecords = v5;
}

- (void)addPendingCommands:(id)a3
{
  id v4 = [(NSArray *)self->_pendingCommands arrayByAddingObjectsFromArray:a3];
  pendingCommands = self->_pendingCommands;
  self->_pendingCommands = v4;

  MEMORY[0x270F9A758](v4, pendingCommands);
}

- (void)clearPendingCommandsUpToCount:(unint64_t)a3
{
  -[NSArray subarrayWithRange:](self->_pendingCommands, "subarrayWithRange:", a3, [(NSArray *)self->_pendingCommands count] - a3);
  id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  pendingCommands = self->_pendingCommands;
  self->_pendingCommands = v4;

  MEMORY[0x270F9A758](v4, pendingCommands);
}

- (NSArray)serverRecords
{
  return self->_serverRecords;
}

- (void)setServerRecords:(id)a3
{
}

- (NSArray)pendingCommands
{
  return self->_pendingCommands;
}

- (void)setPendingCommands:(id)a3
{
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (void)setLastSyncDate:(id)a3
{
}

- (NSDate)lastDirtyDate
{
  return self->_lastDirtyDate;
}

- (void)setLastDirtyDate:(id)a3
{
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
{
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_lastDirtyDate, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
  objc_storeStrong((id *)&self->_pendingCommands, 0);

  objc_storeStrong((id *)&self->_serverRecords, 0);
}

@end
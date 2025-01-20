@interface SCWZoneJSONStore
- (CKServerChangeToken)serverChangeToken;
- (NSArray)pendingCommands;
- (NSArray)serverRecords;
- (NSDate)lastDirtyDate;
- (NSDate)lastSyncDate;
- (SCWZoneJSONStore)initWithZoneSchema:(id)a3 serverRecords:(id)a4 lastSyncDate:(id)a5 lastDirtyDate:(id)a6 serverChangeToken:(id)a7 pendingCommands:(id)a8;
- (SCWZoneSchema)zoneSchema;
- (void)addPendingCommands:(id)a3;
- (void)applyServerRecordsDiff:(id)a3;
- (void)clearPendingCommandsUpToCount:(unint64_t)a3;
- (void)setLastDirtyDate:(id)a3;
- (void)setLastSyncDate:(id)a3;
- (void)setPendingCommands:(id)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setServerRecords:(id)a3;
@end

@implementation SCWZoneJSONStore

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (NSDate)lastDirtyDate
{
  return self->_lastDirtyDate;
}

- (NSArray)serverRecords
{
  return self->_serverRecords;
}

- (NSArray)pendingCommands
{
  return self->_pendingCommands;
}

- (SCWZoneJSONStore)initWithZoneSchema:(id)a3 serverRecords:(id)a4 lastSyncDate:(id)a5 lastDirtyDate:(id)a6 serverChangeToken:(id)a7 pendingCommands:(id)a8
{
  id v26 = a3;
  id v15 = a4;
  id v25 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v27.receiver = self;
  v27.super_class = (Class)SCWZoneJSONStore;
  v19 = [(SCWZoneJSONStore *)&v27 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_zoneSchema, a3);
    v21 = (void *)MEMORY[0x1E4F1CBF0];
    if (v15) {
      v22 = v15;
    }
    else {
      v22 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v20->_serverRecords, v22);
    objc_storeStrong((id *)&v20->_lastSyncDate, a5);
    objc_storeStrong((id *)&v20->_lastDirtyDate, a6);
    objc_storeStrong((id *)&v20->_serverChangeToken, a7);
    if (v18) {
      v23 = v18;
    }
    else {
      v23 = v21;
    }
    objc_storeStrong((id *)&v20->_pendingCommands, v23);
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneSchema, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_lastDirtyDate, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
  objc_storeStrong((id *)&self->_pendingCommands, 0);

  objc_storeStrong((id *)&self->_serverRecords, 0);
}

- (void)applyServerRecordsDiff:(id)a3
{
  id v4 = a3;
  id v7 = [(SCWZoneJSONStore *)self serverRecords];
  v5 = [v4 applyToRecords:v7];

  serverRecords = self->_serverRecords;
  self->_serverRecords = v5;
}

- (void)addPendingCommands:(id)a3
{
  self->_pendingCommands = [(NSArray *)self->_pendingCommands arrayByAddingObjectsFromArray:a3];

  MEMORY[0x1F41817F8]();
}

- (void)clearPendingCommandsUpToCount:(unint64_t)a3
{
  -[NSArray subarrayWithRange:](self->_pendingCommands, "subarrayWithRange:", a3, [(NSArray *)self->_pendingCommands count] - a3);
  self->_pendingCommands = (NSArray *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (void)setServerRecords:(id)a3
{
}

- (void)setPendingCommands:(id)a3
{
}

- (void)setLastSyncDate:(id)a3
{
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

- (SCWZoneSchema)zoneSchema
{
  return self->_zoneSchema;
}

@end
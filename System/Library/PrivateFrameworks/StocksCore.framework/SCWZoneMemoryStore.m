@interface SCWZoneMemoryStore
- (CKServerChangeToken)serverChangeToken;
- (NSArray)pendingCommands;
- (NSArray)serverRecords;
- (NSDate)lastDirtyDate;
- (NSDate)lastSyncDate;
- (SCWZoneMemoryStore)init;
- (void)addPendingCommands:(id)a3;
- (void)applyServerRecordsDiff:(id)a3;
- (void)clearPendingCommandsUpToCount:(unint64_t)a3;
- (void)setLastDirtyDate:(id)a3;
- (void)setLastSyncDate:(id)a3;
- (void)setPendingCommands:(id)a3;
- (void)setServerChangeToken:(id)a3;
- (void)setServerRecords:(id)a3;
@end

@implementation SCWZoneMemoryStore

- (SCWZoneMemoryStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)SCWZoneMemoryStore;
  v2 = [(SCWZoneMemoryStore *)&v8 init];
  v3 = v2;
  if (v2)
  {
    serverRecords = v2->_serverRecords;
    v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_serverRecords = (NSArray *)MEMORY[0x1E4F1CBF0];

    pendingCommands = v3->_pendingCommands;
    v3->_pendingCommands = v5;
  }
  return v3;
}

- (void)applyServerRecordsDiff:(id)a3
{
  id v4 = a3;
  id v7 = [(SCWZoneMemoryStore *)self serverRecords];
  v5 = [v4 applyToRecords:v7];

  serverRecords = self->_serverRecords;
  self->_serverRecords = v5;
}

- (void)addPendingCommands:(id)a3
{
  id v4 = a3;
  id v7 = [(SCWZoneMemoryStore *)self pendingCommands];
  v5 = [v7 arrayByAddingObjectsFromArray:v4];

  pendingCommands = self->_pendingCommands;
  self->_pendingCommands = v5;
}

- (void)clearPendingCommandsUpToCount:(unint64_t)a3
{
  -[NSArray subarrayWithRange:](self->_pendingCommands, "subarrayWithRange:", a3, [(NSArray *)self->_pendingCommands count] - a3);
  self->_pendingCommands = (NSArray *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCommands, 0);
  objc_storeStrong((id *)&self->_serverRecords, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_lastDirtyDate, 0);

  objc_storeStrong((id *)&self->_lastSyncDate, 0);
}

@end
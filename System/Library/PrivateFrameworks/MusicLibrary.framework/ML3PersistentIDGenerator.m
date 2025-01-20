@interface ML3PersistentIDGenerator
- (ML3PersistentIDGenerator)initWithDatabaseConnection:(id)a3 tableName:(id)a4;
- (int64_t)nextPersistentID;
- (void)_calculateNewRun;
@end

@implementation ML3PersistentIDGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextUsedPersistentIdSQL, 0);
  objc_storeStrong((id *)&self->_validateStartingPersistentIdSQL, 0);
  objc_storeStrong((id *)&self->_tableName, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)_calculateNewRun
{
  v30[1] = *MEMORY[0x1E4F143B8];
  do
  {
    uint64_t v3 = arc4random();
    self->_int64_t currentPersistentID = (arc4random() >> 1) | (unint64_t)(v3 << 31);
    connection = self->_connection;
    validateStartingPersistentIdSQL = self->_validateStartingPersistentIdSQL;
    v6 = objc_msgSend(NSNumber, "numberWithLongLong:");
    v30[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    v8 = [(ML3DatabaseConnection *)connection executeQuery:validateStartingPersistentIdSQL withParameters:v7];

    uint64_t v9 = [v8 int64ValueForFirstRowAndColumn];
    int64_t currentPersistentID = self->_currentPersistentID;
    if (v9 == currentPersistentID) {
      int64_t currentPersistentID = 0;
    }
    self->_int64_t currentPersistentID = currentPersistentID;

    int64_t v11 = self->_currentPersistentID;
  }
  while (!v11 || v11 == 0x7FFFFFFFFFFFFFFFLL);
  v12 = self->_connection;
  nextUsedPersistentIdSQL = self->_nextUsedPersistentIdSQL;
  v14 = objc_msgSend(NSNumber, "numberWithLongLong:");
  v29 = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  v16 = [(ML3DatabaseConnection *)v12 executeQuery:nextUsedPersistentIdSQL withParameters:v15];

  uint64_t v17 = [v16 int64ValueForFirstRowAndColumn];
  int64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  if (v17) {
    int64_t v18 = v17;
  }
  self->_int64_t nextUsedPersistentID = v18;
  v19 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    tableName = self->_tableName;
    int64_t v21 = self->_currentPersistentID;
    int64_t nextUsedPersistentID = self->_nextUsedPersistentID;
    int v23 = 138543874;
    v24 = tableName;
    __int16 v25 = 2048;
    int64_t v26 = v21;
    __int16 v27 = 2048;
    int64_t v28 = nextUsedPersistentID;
    _os_log_impl(&dword_1B022D000, v19, OS_LOG_TYPE_DEFAULT, "Calculated new run starting for table '%{public}@' at %lli until %lli", (uint8_t *)&v23, 0x20u);
  }
}

- (int64_t)nextPersistentID
{
  int64_t result = self->_currentPersistentID;
  if (!result || result == self->_nextUsedPersistentID)
  {
    [(ML3PersistentIDGenerator *)self _calculateNewRun];
    int64_t result = self->_currentPersistentID;
  }
  self->_int64_t currentPersistentID = result + 1;
  return result;
}

- (ML3PersistentIDGenerator)initWithDatabaseConnection:(id)a3 tableName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ML3PersistentIDGenerator;
  uint64_t v9 = [(ML3PersistentIDGenerator *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_tableName, a4);
    uint64_t v11 = [NSString stringWithFormat:@"SELECT ROWID FROM %@ WHERE ROWID = ?", v8];
    validateStartingPersistentIdSQL = v10->_validateStartingPersistentIdSQL;
    v10->_validateStartingPersistentIdSQL = (NSString *)v11;

    uint64_t v13 = [NSString stringWithFormat:@"SELECT ROWID FROM %@ WHERE ROWID > ? LIMIT 1", v8];
    nextUsedPersistentIdSQL = v10->_nextUsedPersistentIdSQL;
    v10->_nextUsedPersistentIdSQL = (NSString *)v13;
  }
  return v10;
}

@end
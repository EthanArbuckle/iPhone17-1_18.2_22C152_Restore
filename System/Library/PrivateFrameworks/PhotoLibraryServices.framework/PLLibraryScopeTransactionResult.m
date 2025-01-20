@interface PLLibraryScopeTransactionResult
- (NSArray)assetObjectIDs;
- (NSArray)detectedFaceObjectIDs;
- (NSPersistentHistoryToken)lastProcessedCoreDataToken;
- (PLLibraryScopeTransactionResult)initWithToken:(id)a3 assetObjectIDs:(id)a4 detectedFaceObjectIDs:(id)a5;
@end

@implementation PLLibraryScopeTransactionResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedFaceObjectIDs, 0);
  objc_storeStrong((id *)&self->_assetObjectIDs, 0);
  objc_storeStrong((id *)&self->_lastProcessedCoreDataToken, 0);
}

- (NSArray)detectedFaceObjectIDs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)assetObjectIDs
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSPersistentHistoryToken)lastProcessedCoreDataToken
{
  return (NSPersistentHistoryToken *)objc_getProperty(self, a2, 8, 1);
}

- (PLLibraryScopeTransactionResult)initWithToken:(id)a3 assetObjectIDs:(id)a4 detectedFaceObjectIDs:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PLLibraryScopeTransactionResult;
  v12 = [(PLLibraryScopeTransactionResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_lastProcessedCoreDataToken, a3);
    objc_storeStrong((id *)&v13->_assetObjectIDs, a4);
    objc_storeStrong((id *)&v13->_detectedFaceObjectIDs, a5);
  }

  return v13;
}

@end
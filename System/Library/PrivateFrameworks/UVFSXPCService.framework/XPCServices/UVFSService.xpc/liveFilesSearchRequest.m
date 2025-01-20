@interface liveFilesSearchRequest
- (BOOL)aborted;
- (LiveFSVolumeSearchResultConnector)resultsHandler;
- (NSDictionary)searchCriteria;
- (NSString)searchToken;
- (NSString)startLocation;
- (int)abortSearch;
- (int)replentishCredits:(int)a3;
- (int)startSearch;
- (liveFilesSearchRequest)initWithVolume:(id)a3 withStartLocation:(id)a4 withSearchToken:(id)a5 withSearchCriteria:(id)a6 withProxy:(id)a7 andWithCallerID:(unint64_t)a8;
- (unint64_t)callerID;
- (unint64_t)searchLIClientID;
- (userFSVolume)targetVolume;
- (void)invalidateConnections;
- (void)setAborted:(BOOL)a3;
- (void)setCallerID:(unint64_t)a3;
- (void)setResultsHandler:(id)a3;
- (void)setSearchCriteria:(id)a3;
- (void)setSearchLIClientID:(unint64_t)a3;
- (void)setSearchToken:(id)a3;
- (void)setStartLocation:(id)a3;
- (void)setTargetVolume:(id)a3;
@end

@implementation liveFilesSearchRequest

- (liveFilesSearchRequest)initWithVolume:(id)a3 withStartLocation:(id)a4 withSearchToken:(id)a5 withSearchCriteria:(id)a6 withProxy:(id)a7 andWithCallerID:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v25 = a6;
  id v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)liveFilesSearchRequest;
  v18 = [(liveFilesSearchRequest *)&v27 init];
  if (v18)
  {
    id v23 = v15;
    id v26 = 0;
    id v19 = [v14 newConnectionIDOrError:&v26];
    id v22 = v26;
    v18->_searchLIClientID = (unint64_t)v19;
    v20 = userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100026748((uint64_t *)&v18->_searchLIClientID, v20);
    }
    if (v18->_searchLIClientID)
    {
      v18->_callerID = a8;
      objc_storeStrong((id *)&v18->_targetVolume, a3);
      objc_storeStrong((id *)&v18->_startLocation, a4);
      objc_storeStrong((id *)&v18->_searchToken, a5);
      objc_storeStrong((id *)&v18->_searchCriteria, a6);
      objc_storeStrong((id *)&v18->_resultsHandler, a7);
      v18->_aborted = 0;
    }
    else
    {

      v18 = 0;
    }
    id v15 = v23;
  }
  return v18;
}

- (int)startSearch
{
  v3 = [(userFSVolume *)self->_targetVolume searchGroup];
  dispatch_group_enter(v3);

  v4 = [(userFSVolume *)self->_targetVolume SearchRequests];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001C6B8;
  block[3] = &unk_100038668;
  block[4] = self;
  dispatch_async(v4, block);

  return 0;
}

- (int)abortSearch
{
  self->_aborted = 1;
  return 0;
}

- (void)invalidateConnections
{
  v3 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000267C4((uint64_t)self, v3);
  }
  [(userFSVolume *)self->_targetVolume invalidateFileNodesForConnection:self->_searchLIClientID];
  [(userFSVolume *)self->_targetVolume releaseConnectionAllocation:self->_searchLIClientID];
}

- (int)replentishCredits:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  resultsHandler = self->_resultsHandler;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001C8EC;
  v9[3] = &unk_100038CC0;
  v11 = &v12;
  v7 = v5;
  v10 = v7;
  [(LiveFSVolumeSearchResultConnector *)resultsHandler replenishCredits:v3 reply:v9];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  LODWORD(v3) = *((_DWORD *)v13 + 6);

  _Block_object_dispose(&v12, 8);
  return v3;
}

- (unint64_t)searchLIClientID
{
  return self->_searchLIClientID;
}

- (void)setSearchLIClientID:(unint64_t)a3
{
  self->_searchLIClientID = a3;
}

- (unint64_t)callerID
{
  return self->_callerID;
}

- (void)setCallerID:(unint64_t)a3
{
  self->_callerID = a3;
}

- (userFSVolume)targetVolume
{
  return (userFSVolume *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTargetVolume:(id)a3
{
}

- (NSString)startLocation
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStartLocation:(id)a3
{
}

- (NSString)searchToken
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSearchToken:(id)a3
{
}

- (NSDictionary)searchCriteria
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSearchCriteria:(id)a3
{
}

- (LiveFSVolumeSearchResultConnector)resultsHandler
{
  return (LiveFSVolumeSearchResultConnector *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResultsHandler:(id)a3
{
}

- (BOOL)aborted
{
  return self->_aborted;
}

- (void)setAborted:(BOOL)a3
{
  self->_aborted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_searchCriteria, 0);
  objc_storeStrong((id *)&self->_searchToken, 0);
  objc_storeStrong((id *)&self->_startLocation, 0);

  objc_storeStrong((id *)&self->_targetVolume, 0);
}

@end
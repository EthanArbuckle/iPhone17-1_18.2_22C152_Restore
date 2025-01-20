@interface WiFiColocatedNetworkManager
- (CWFScanResult)joinedNetwork;
- (NSArray)colocatedNetworks;
- (WiFiColocatedNetworkManager)init;
- (WiFiColocatedNetworkManager)initWithNetwork:(id)a3 colocatedNetworks:(id)a4;
- (id)_reduceNumberOfCandidatesTo:(unint64_t)a3 on:(unsigned int)a4;
- (id)retrieveNextCandidate;
- (unint64_t)numberOfCandidates;
- (void)_reduceNetworks;
- (void)setColocatedNetworks:(id)a3;
- (void)setJoinedNetwork:(id)a3;
@end

@implementation WiFiColocatedNetworkManager

- (WiFiColocatedNetworkManager)init
{
  +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, @"-[WiFiColocatedNetworkManager init] unavailable", 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (WiFiColocatedNetworkManager)initWithNetwork:(id)a3 colocatedNetworks:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WiFiColocatedNetworkManager;
  v9 = [(WiFiColocatedNetworkManager *)&v13 init];
  v10 = v9;
  if (v9)
  {
    [(WiFiColocatedNetworkManager *)v9 setColocatedNetworks:v7];
    [(WiFiColocatedNetworkManager *)v10 setJoinedNetwork:v6];
    [(WiFiColocatedNetworkManager *)v10 _reduceNetworks];
  }
  v11 = v10;

  return v11;
}

- (unint64_t)numberOfCandidates
{
  return [(NSArray *)self->_colocatedNetworks count];
}

- (id)retrieveNextCandidate
{
  v3 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithArray:self->_colocatedNetworks];
  v4 = [(NSArray *)v3 lastObject];
  [(NSArray *)v3 removeLastObject];
  colocatedNetworks = self->_colocatedNetworks;
  self->_colocatedNetworks = v3;

  return v4;
}

- (id)_reduceNumberOfCandidatesTo:(unint64_t)a3 on:(unsigned int)a4
{
  id v6 = [(CWFScanResult *)self->_joinedNetwork channel];
  unsigned int v7 = [v6 band];

  if (v7 == 3 || (_os_feature_enabled_impl() & 1) != 0)
  {
    v8 = objc_alloc_init((Class)NSMutableArray);
    v9 = [(CWFScanResult *)self->_joinedNetwork channel];
    unsigned int v10 = [v9 band];

    if (v10 != a4)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v11 = self->_colocatedNetworks;
      id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v27;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            v18 = [v16 channel];
            unsigned int v19 = [v18 band];

            if (v19 == a4)
            {
              [v8 addObject:v16];
              if ([v8 count] == (id)a3)
              {
                goto LABEL_15;
              }
            }
          }
          id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
    if ([v8 count]) {
      v20 = v8;
    }
    else {
      v20 = 0;
    }
    v21 = v20;
  }
  else
  {
    v23 = CWFGetOSLog();
    if (v23)
    {
      v8 = CWFGetOSLog();
    }
    else
    {
      v8 = &_os_log_default;
      id v24 = &_os_log_default;
    }

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v30 = 0;
      _os_log_send_and_compose_impl();
    }
    v21 = 0;
  }

  return v21;
}

- (void)_reduceNetworks
{
  id v15 = [(WiFiColocatedNetworkManager *)self _reduceNumberOfCandidatesTo:1 on:1];
  v3 = [(WiFiColocatedNetworkManager *)self _reduceNumberOfCandidatesTo:1 on:2];
  v4 = [(WiFiColocatedNetworkManager *)self _reduceNumberOfCandidatesTo:1 on:3];
  v5 = [(CWFScanResult *)self->_joinedNetwork channel];
  unsigned int v6 = [v5 is2GHz];

  if (v6)
  {
    if (v3)
    {
      unsigned int v7 = v3;
LABEL_6:
      unsigned int v10 = v4;
LABEL_10:
      id v11 = [v7 arrayByAddingObjectsFromArray:v10];
      goto LABEL_11;
    }
LABEL_7:
    id v11 = v4;
    goto LABEL_11;
  }
  v8 = [(CWFScanResult *)self->_joinedNetwork channel];
  unsigned int v9 = [v8 is5GHz];

  if (v9)
  {
    unsigned int v7 = v15;
    if (v15) {
      goto LABEL_6;
    }
    goto LABEL_7;
  }
  unsigned int v7 = v15;
  if (v15)
  {
    unsigned int v10 = v3;
    goto LABEL_10;
  }
  id v11 = v3;
LABEL_11:
  id v12 = v11;
  id v13 = (NSArray *)[v11 copy];
  colocatedNetworks = self->_colocatedNetworks;
  self->_colocatedNetworks = v13;
}

- (CWFScanResult)joinedNetwork
{
  return (CWFScanResult *)objc_getProperty(self, a2, 8, 1);
}

- (void)setJoinedNetwork:(id)a3
{
}

- (NSArray)colocatedNetworks
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setColocatedNetworks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colocatedNetworks, 0);

  objc_storeStrong((id *)&self->_joinedNetwork, 0);
}

@end
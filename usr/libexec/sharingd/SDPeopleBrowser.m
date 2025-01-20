@interface SDPeopleBrowser
- (NSArray)people;
- (NSDictionary)options;
- (NSString)bundleID;
- (NSString)sessionID;
- (SDPeopleBrowser)init;
- (SDPeopleBrowserDiffableDelegate)diffableDelegate;
- (SDXPCHelperConnection)helperConnection;
- (SFAirDropNode)currentTopNode;
- (void)dealloc;
- (void)networkBrowser:(id)a3 nodesChangedForParent:(__SFNode *)a4 protocol:(id)a5 error:(int)a6;
- (void)setBundleID:(id)a3;
- (void)setDiffableDelegate:(id)a3;
- (void)setHelperConnection:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSessionID:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDPeopleBrowser

- (SDPeopleBrowser)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDPeopleBrowser;
  v2 = [(SDPeopleBrowser *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    nodes = v2->_nodes;
    v2->_nodes = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)dealloc
{
  [(SDPeopleBrowser *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)SDPeopleBrowser;
  [(SDPeopleBrowser *)&v3 dealloc];
}

- (void)start
{
  if (self->_networkBrowser)
  {
    uint64_t v2 = daemon_log();
    if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR)) {
      sub_100069448((os_log_t)v2);
    }
  }
  else
  {
    uint64_t v4 = kSFBrowserKindAirDrop;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100068A24;
    v24[3] = &unk_1008CB370;
    v24[4] = sub_1000D8224(kSFBrowserKindAirDrop);
    uint64_t v2 = objc_retainBlock(v24);
    uint64_t v5 = SFNodeCreate();
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100068A34;
    v23[3] = &unk_1008CB370;
    v23[4] = v5;
    objc_super v6 = objc_retainBlock(v23);
    SFNodeAddKind();
    SFNodeAddKind();
    SFNodeAddDomain();
    if (v5) {
      SFNodeAddKind();
    }
    v7 = [[SDNetworkBrowser alloc] initWithKind:v4 rootNode:v5];
    networkBrowser = self->_networkBrowser;
    self->_networkBrowser = v7;

    v9 = [(SDPeopleBrowser *)self helperConnection];
    [(SDNetworkBrowser *)self->_networkBrowser setHelperConnection:v9];

    v10 = [(SDPeopleBrowser *)self bundleID];
    [(SDNetworkBrowser *)self->_networkBrowser setBundleID:v10];

    [(SDNetworkBrowser *)self->_networkBrowser setDelegate:self];
    v11 = [(SDPeopleBrowser *)self options];
    [(SDNetworkBrowser *)self->_networkBrowser setOptions:v11];

    v12 = self->_networkBrowser;
    v13 = [(SDPeopleBrowser *)self sessionID];
    [(SDNetworkBrowser *)v12 openNode:v5 forProtocol:v13 flags:0];

    v14 = [(SDPeopleBrowser *)self sessionID];
    v15 = +[NSString stringWithFormat:@"SDPeopleBrowser for session %@", v14];

    v16 = [(SDPeopleBrowser *)self helperConnection];

    if (v16)
    {
      v17 = daemon_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        sub_100069404(v17);
      }

      v18 = [(SDPeopleBrowser *)self helperConnection];
      [v18 invalidate];
    }
    v19 = [[SDXPCHelperConnection alloc] initWithQueue:0];
    [(SDPeopleBrowser *)self setHelperConnection:v19];

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100068A44;
    v22[3] = &unk_1008CA4B8;
    v22[4] = v15;
    v20 = [(SDPeopleBrowser *)self helperConnection];
    [v20 setInvalidationHandler:v22];

    v21 = [(SDPeopleBrowser *)self helperConnection];
    [v21 activate];

    ((void (*)(void *))v6[2])(v6);
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
}

- (void)stop
{
  [(SDNetworkBrowser *)self->_networkBrowser invalidate];
  networkBrowser = self->_networkBrowser;
  self->_networkBrowser = 0;

  uint64_t v4 = [(SDPeopleBrowser *)self helperConnection];
  [v4 invalidate];

  [(SDPeopleBrowser *)self setHelperConnection:0];
}

- (void)networkBrowser:(id)a3 nodesChangedForParent:(__SFNode *)a4 protocol:(id)a5 error:(int)a6
{
  id v8 = a3;
  v9 = magic_head_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100069508(v9);
  }

  v10 = objc_opt_new();
  v11 = [v8 childrenForNode:a4];
  people = self->_people;
  v49 = v8;
  if (people) {
    v13 = people;
  }
  else {
    v13 = (NSArray *)objc_opt_new();
  }
  v50 = v13;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v11;
  id v14 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v64;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v64 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v63 + 1) + 8 * i);
        v19 = (void *)SFNodeCopyRealName();
        v20 = [v19 lowercaseString];

        v21 = [(NSMutableDictionary *)self->_nodes objectForKeyedSubscript:v20];
        if (v21)
        {
          v22 = v21;
          [v21 updateWithSFNode:v18];
        }
        else
        {
          v22 = +[SFAirDropNode nodeWithSFNode:v18];
          v23 = [v22 transportBundleID];

          if (!v23) {
            [v22 setTransportBundleID:UIActivityTypeAirDrop];
          }
          [(NSMutableDictionary *)self->_nodes setObject:v22 forKeyedSubscript:v20];
        }
        [v10 addObject:v22];
      }
      id v15 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
    }
    while (v15);
  }

  v53 = +[NSMutableArray array];
  v48 = +[NSMutableArray array];
  v24 = +[NSMutableArray array];
  v52 = +[NSMutableArray array];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v25 = v50;
  id v26 = [(NSArray *)v25 countByEnumeratingWithState:&v59 objects:v72 count:16];
  v51 = v24;
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v60;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v60 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v59 + 1) + 8 * (void)j);
        if ([v10 containsObject:v30])
        {
          [v53 addObject:v30];
        }
        else
        {
          [v24 addObject:v30];
          v31 = [v30 contactIdentifier];
          if (v31) {
            [v52 addObject:v31];
          }

          v32 = magic_head_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = [v30 displayName];
            v34 = [v30 nodeIdentifier];
            *(_DWORD *)buf = 138412546;
            v69 = v33;
            __int16 v70 = 2112;
            v71 = v34;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Removing person \"%@\" (%@)", buf, 0x16u);

            v24 = v51;
          }
        }
      }
      id v27 = [(NSArray *)v25 countByEnumeratingWithState:&v59 objects:v72 count:16];
    }
    while (v27);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v35 = v10;
  id v36 = [v35 countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v56;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(void *)v56 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v40 = *(void *)(*((void *)&v55 + 1) + 8 * (void)k);
        if (![(NSArray *)v25 containsObject:v40]) {
          [v48 addObject:v40];
        }
      }
      id v37 = [v35 countByEnumeratingWithState:&v55 objects:v67 count:16];
    }
    while (v37);
  }

  v41 = [v53 arrayByAddingObjectsFromArray:v48];
  v42 = [v41 sortedArrayUsingComparator:&stru_1008CB3B0];
  v43 = +[NSPredicate predicateWithBlock:&stru_1008CB3F0];
  v44 = [v42 filteredArrayUsingPredicate:v43];

  v45 = self->_people;
  self->_people = v44;
  v46 = v44;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_diffableDelegate);
  [WeakRetained browser:self didUpdatePeople:self->_people deletedContactIdentifiers:v52];
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (SFAirDropNode)currentTopNode
{
  return self->_currentTopNode;
}

- (NSArray)people
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (SDPeopleBrowserDiffableDelegate)diffableDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_diffableDelegate);

  return (SDPeopleBrowserDiffableDelegate *)WeakRetained;
}

- (void)setDiffableDelegate:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (SDXPCHelperConnection)helperConnection
{
  return self->_helperConnection;
}

- (void)setHelperConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helperConnection, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_diffableDelegate);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_currentTopNode, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_nodes, 0);

  objc_storeStrong((id *)&self->_networkBrowser, 0);
}

@end
@interface GKChallengeService
+ (Class)interfaceClass;
+ (unint64_t)requiredEntitlements;
- (id)_filterChallenges:(id)a3 compatibleWithBundleID:(id)a4;
- (void)_determineCompatibleGamesForChallenges:(id)a3 dispatchGroup:(id)a4;
- (void)_updateGamesForChallenges:(id)a3 dispatchGroup:(id)a4;
- (void)_updatePlayersForChallenges:(id)a3 dispatchGroup:(id)a4;
- (void)abortChallenges:(id)a3 handler:(id)a4;
- (void)fetchChallengesForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5;
- (void)getChallengeDetailsForChallengeIDs:(id)a3 handler:(id)a4;
- (void)getChallengeDetailsForChallengeIDs:(id)a3 receiverID:(id)a4 clientBundleID:(id)a5 handler:(id)a6;
- (void)getChallengeDetailsForChallengeIDs:(id)a3 receiverID:(id)a4 handler:(id)a5;
- (void)getChallengesForGameDescriptor:(id)a3 handler:(id)a4;
- (void)issueChallenge:(id)a3 toPlayers:(id)a4 handler:(id)a5;
- (void)loadChallengesForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5;
@end

@implementation GKChallengeService

+ (unint64_t)requiredEntitlements
{
  return 64;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class();
}

- (void)_updatePlayersForChallenges:(id)a3 dispatchGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 count];
  if (v8)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100082B2C;
    v14[3] = &unk_1002D7AB8;
    id v9 = [objc_alloc((Class)NSMutableSet) initWithCapacity:2 * (void)v8];
    id v15 = v9;
    [v6 enumerateObjectsUsingBlock:v14];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100082BDC;
    v11[3] = &unk_1002D3980;
    v11[4] = self;
    id v12 = v9;
    id v13 = v6;
    id v10 = v9;
    [v7 perform:v11];
  }
}

- (id)_filterChallenges:(id)a3 compatibleWithBundleID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100082F4C;
    v11[3] = &unk_1002D7AE0;
    id v12 = v6;
    id v8 = +[NSPredicate predicateWithBlock:v11];
    uint64_t v9 = [v5 filteredArrayUsingPredicate:v8];

    id v5 = (id)v9;
  }

  return v5;
}

- (void)_determineCompatibleGamesForChallenges:(id)a3 dispatchGroup:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v33 = v6;
    id v7 = [objc_alloc((Class)NSMutableSet) initWithCapacity:objc_msgSend(v5, "count")];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v34 = v5;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v46;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v46 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          v14 = [v13 bundleID];
          [v7 addObject:v14];

          id v15 = [v13 compatibleBundleIDs];
          v16 = [v15 array];
          [v7 addObjectsFromArray:v16];
        }
        id v10 = [v8 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v10);
    }
    v32 = v7;

    v17 = +[GKApplicationWorkspace defaultWorkspace];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = v8;
    id v18 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v42;
      do
      {
        v21 = 0;
        id v35 = v19;
        do
        {
          if (*(void *)v42 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v21);
          v24 = [v22 bundleID];
          unsigned __int8 v25 = [v17 applicationIsInstalled:v24];

          if ((v25 & 1) == 0)
          {
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            v26 = [v22 compatibleBundleIDs];
            id v27 = [v26 countByEnumeratingWithState:&v37 objects:v49 count:16];
            if (v27)
            {
              id v28 = v27;
              uint64_t v29 = *(void *)v38;
              while (2)
              {
                for (j = 0; j != v28; j = (char *)j + 1)
                {
                  if (*(void *)v38 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  uint64_t v31 = *(void *)(*((void *)&v37 + 1) + 8 * (void)j);
                  if ([v17 applicationIsInstalled:v31])
                  {
                    [v22 setBundleID:v31];
                    goto LABEL_25;
                  }
                }
                id v28 = [v26 countByEnumeratingWithState:&v37 objects:v49 count:16];
                if (v28) {
                  continue;
                }
                break;
              }
            }
LABEL_25:

            id v19 = v35;
          }
          v21 = (char *)v21 + 1;
        }
        while (v21 != v19);
        id v19 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v19);
    }

    id v6 = v33;
    id v5 = v34;
  }
}

- (void)_updateGamesForChallenges:(id)a3 dispatchGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    [v6 _gkDistinctValuesForKeyPath:@"bundleID"];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000833D0;
    v9[3] = &unk_1002D3980;
    v9[4] = self;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = v6;
    id v8 = v10;
    [v7 perform:v9];
  }
}

- (void)fetchChallengesForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000836CC;
  v8[3] = &unk_1002D3C38;
  id v9 = a4;
  id v10 = a5;
  id v6 = v10;
  id v7 = v9;
  [v7 performBlock:v8];
}

- (void)loadChallengesForGameDescriptor:(id)a3 context:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(GKService *)self clientProxy];
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKChallengeService.m", 204, "-[GKChallengeService loadChallengesForGameDescriptor:context:handler:]");
  id v11 = +[GKCacheTransactionGroup transactionGroupWithName:v10 context:v7 client:v9];

  id v12 = [(GKService *)self clientProxy];
  id v13 = [v12 replyQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100083AE0;
  v21[3] = &unk_1002D48B0;
  v21[4] = self;
  id v14 = v11;
  id v22 = v14;
  id v15 = v7;
  id v23 = v15;
  id v16 = v9;
  id v24 = v16;
  [v14 performOnQueue:v13 block:v21];

  if (v8)
  {
    v17 = [v16 replyQueue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100083EB0;
    v18[3] = &unk_1002D3930;
    id v20 = v8;
    id v19 = v14;
    [v19 notifyOnQueue:v17 block:v18];
  }
}

- (void)getChallengesForGameDescriptor:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(GKService *)self clientProxy];
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKChallengeService.m", 250, "-[GKChallengeService getChallengesForGameDescriptor:handler:]");
  id v10 = [(GKService *)self transactionGroupWithName:v9];

  id v11 = [(GKService *)self clientProxy];
  id v12 = [v11 replyQueue];

  if (!v6)
  {
    id v13 = [(GKService *)self clientProxy];
    id v6 = [v13 gameDescriptor];
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000841A4;
  v25[3] = &unk_1002D48B0;
  id v14 = v10;
  id v26 = v14;
  id v27 = self;
  id v15 = v6;
  id v28 = v15;
  id v16 = v12;
  id v29 = v16;
  [v14 performOnQueue:v16 block:v25];
  if (v7)
  {
    v17 = [(GKService *)self clientProxy];
    id v18 = [v17 replyQueue];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100084A98;
    v19[3] = &unk_1002D39A8;
    id v20 = v14;
    v21 = self;
    id v22 = v15;
    id v23 = v8;
    id v24 = v7;
    [v20 notifyOnQueue:v18 block:v19];
  }
}

- (void)getChallengeDetailsForChallengeIDs:(id)a3 handler:(id)a4
{
}

- (void)getChallengeDetailsForChallengeIDs:(id)a3 receiverID:(id)a4 handler:(id)a5
{
}

- (void)getChallengeDetailsForChallengeIDs:(id)a3 receiverID:(id)a4 clientBundleID:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKChallengeService.m", 345, "-[GKChallengeService getChallengeDetailsForChallengeIDs:receiverID:clientBundleID:handler:]");
  id v15 = [(GKService *)self transactionGroupWithName:v14];

  id v16 = [(GKService *)self clientProxy];
  v17 = [v16 replyQueue];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10008511C;
  v31[3] = &unk_1002D48B0;
  id v18 = v15;
  id v32 = v18;
  id v33 = v10;
  id v34 = self;
  id v35 = v11;
  id v19 = v11;
  id v20 = v10;
  [v18 performOnQueue:v17 block:v31];

  v21 = [(GKService *)self clientProxy];
  id v22 = [v21 replyQueue];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100086190;
  v26[3] = &unk_1002D39F8;
  id v27 = v18;
  id v28 = self;
  id v29 = v12;
  id v30 = v13;
  id v23 = v13;
  id v24 = v12;
  id v25 = v18;
  [v25 notifyOnQueue:v22 block:v26];
}

- (void)issueChallenge:(id)a3 toPlayers:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v9 count]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      id v16 = 0;
      do
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [v8 serverRepresentationForReceivingPlayer:*(void *)(*((void *)&v29 + 1) + 8 * (void)v16)];
        [v11 addObject:v17];

        id v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v14);
  }

  id v18 = [GKChallengeNetworkRequest alloc];
  id v19 = [(GKService *)self clientProxy];
  id v20 = [v19 bundleIdentifier];
  v21 = [(GKChallengeNetworkRequest *)v18 initWithChallenges:v11 bundleID:v20];

  id v22 = +[GKNetworkRequestManager commonNetworkRequestManager];
  id v23 = [(GKService *)self clientProxy];
  [v22 writeToNetwork:v21 clientProxy:v23 handler:0];

  if (v10)
  {
    id v24 = [(GKService *)self clientProxy];
    id v25 = [v24 replyQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100086948;
    block[3] = &unk_1002D3A20;
    id v28 = v10;
    dispatch_async(v25, block);
  }
  id v26 = +[GKReporter reporter];
  [v26 reportEvent:GKReporterDomainChallenge type:GKReporterChallengeIssue];
}

- (void)abortChallenges:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKChallengeService.m", 538, "-[GKChallengeService abortChallenges:handler:]");
  id v9 = [(GKService *)self transactionGroupWithName:v8];

  id v10 = [(GKService *)self clientProxy];
  id v11 = [v10 replyQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100086B68;
  v19[3] = &unk_1002D3980;
  id v12 = v6;
  id v20 = v12;
  id v13 = v9;
  id v21 = v13;
  id v22 = self;
  [v13 performOnQueue:v11 block:v19];

  if (v7)
  {
    id v14 = [(GKService *)self clientProxy];
    uint64_t v15 = [v14 replyQueue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100087148;
    v17[3] = &unk_1002D3930;
    v17[4] = self;
    id v18 = v7;
    [v13 notifyOnQueue:v15 block:v17];
  }
  id v16 = +[GKReporter reporter];
  [v16 reportEvent:GKReporterDomainChallenge type:GKReporterChallengeAbort];
}

@end
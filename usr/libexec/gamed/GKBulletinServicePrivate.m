@interface GKBulletinServicePrivate
+ (Class)interfaceClass;
+ (unint64_t)requiredEntitlements;
- (void)clearBulletinsForReceivedChallenges:(id)a3;
- (void)clearBulletinsForTurnBasedTurn:(id)a3 exchangeID:(id)a4;
- (void)fetchBadgeCountsForBundleID:(id)a3 handler:(id)a4;
- (void)fetchMessageImageForBundleID:(id)a3 handler:(id)a4;
- (void)markAllBadgesAsViewedForType:(unint64_t)a3;
@end

@implementation GKBulletinServicePrivate

+ (unint64_t)requiredEntitlements
{
  return 0x10000;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class();
}

- (void)markAllBadgesAsViewedForType:(unint64_t)a3
{
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKBulletinService.m", 63, "-[GKBulletinServicePrivate markAllBadgesAsViewedForType:]");
  v6 = [(GKService *)self transactionGroupWithName:v5];

  v7 = [v6 context];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100022DAC;
  v9[3] = &unk_1002D3F20;
  v11 = self;
  unint64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  [v7 performBlockAndWait:v9];
}

- (void)fetchBadgeCountsForBundleID:(id)a3 handler:(id)a4
{
  if (a4)
  {
    v5 = (void (**)(id, void *, void))a4;
    id v6 = a3;
    v7 = +[GKBadgeController sharedController];
    id v8 = [v7 badgeCountForBundleID:v6 badgeType:1];
    id v9 = [v7 badgeCountForBundleID:v6 badgeType:0];
    id v10 = [v7 badgeCountForBundleID:v6 badgeType:2];

    v15[0] = &off_1002F1EF8;
    v11 = +[NSNumber numberWithUnsignedInteger:v9];
    v16[0] = v11;
    v15[1] = &off_1002F1F10;
    unint64_t v12 = +[NSNumber numberWithUnsignedInteger:v8];
    v16[1] = v12;
    v15[2] = &off_1002F1F28;
    v13 = +[NSNumber numberWithUnsignedInteger:v10];
    v16[2] = v13;
    v14 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
    v5[2](v5, v14, 0);
  }
}

- (void)clearBulletinsForReceivedChallenges:(id)a3
{
  id v3 = a3;
  v4 = +[GKBulletinController sharedController];
  v5 = [v4 getBulletinsOfType:objc_opt_class()];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [v5 objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * (void)v9)];
        v11 = [v10 challenge];
        unint64_t v12 = [v11 challengeID];
        unsigned int v13 = [v3 containsObject:v12];

        if (v13) {
          [v4 withdrawBulletin:v10];
        }

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)clearBulletinsForTurnBasedTurn:(id)a3 exchangeID:(id)a4
{
  id v4 = a3;
  v5 = +[GKBulletinController sharedController];
  id v6 = [v5 getBulletinsOfType:objc_opt_class()];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [v6 objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * (void)v10)];
        unint64_t v12 = [v11 matchID];
        unsigned int v13 = [v4 isEqualToString:v12];

        if (v13) {
          [v5 withdrawBulletin:v11];
        }

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)fetchMessageImageForBundleID:(id)a3 handler:(id)a4
{
  v11 = (void (**)(id, void *))a4;
  id v5 = a3;
  id v6 = +[GKApplicationWorkspace defaultWorkspace];
  id v7 = [v6 applicationProxyForBundleID:v5];

  id v8 = [v7 bundle];
  uint64_t v9 = [v8 _gkPathForMessageImage];
  id v10 = +[NSData dataWithContentsOfFile:v9];
  if (v11) {
    v11[2](v11, v10);
  }
}

@end
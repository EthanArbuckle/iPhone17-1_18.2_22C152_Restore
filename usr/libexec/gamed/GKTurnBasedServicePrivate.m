@interface GKTurnBasedServicePrivate
+ (Class)interfaceClass;
+ (unint64_t)requiredEntitlements;
- (void)getTurnBasedBadgeCountWithHandler:(id)a3;
- (void)showMatch:(id)a3;
@end

@implementation GKTurnBasedServicePrivate

+ (unint64_t)requiredEntitlements
{
  return 0x1000000;
}

+ (Class)interfaceClass
{
  return (Class)objc_opt_class();
}

- (void)getTurnBasedBadgeCountWithHandler:(id)a3
{
  id v4 = a3;
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKTurnBasedService.m", 1689, "-[GKTurnBasedServicePrivate getTurnBasedBadgeCountWithHandler:]");
  v6 = [(GKService *)self transactionGroupWithName:v5];

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  v7 = [v6 context];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000AC990;
  v21[3] = &unk_1002D8980;
  v21[4] = self;
  id v8 = v6;
  id v22 = v8;
  v23 = v29;
  v24 = &v25;
  [v7 performBlockAndWait:v21];

  if (*((unsigned char *)v26 + 24))
  {
    [v8 objectForKeyedSubscript:@"game"];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000ACAD0;
    v17[3] = &unk_1002D63B8;
    v17[4] = self;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = v9;
    id v19 = v8;
    v20 = v29;
    [v19 perform:v17];
  }
  if (v4)
  {
    v10 = [(GKService *)self clientProxy];
    v11 = [v10 replyQueue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000ACD7C;
    v12[3] = &unk_1002D89F8;
    id v15 = v4;
    v16 = v29;
    id v13 = v8;
    v14 = self;
    [v13 notifyOnQueue:v11 block:v12];
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);
}

- (void)showMatch:(id)a3
{
  id v27 = a3;
  uint64_t v3 = [v27 matchID];
  if (v3)
  {
    id v4 = (GKTurnBasedMultiplayerBulletin *)v3;
    uint64_t v5 = [v27 bundleID];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [v27 bundleVersion];

      if (!v7) {
        goto LABEL_9;
      }
      id v4 = objc_alloc_init(GKTurnBasedMultiplayerBulletin);
      id v8 = [v27 bundleID];
      id v9 = [v27 bundleVersion];
      v10 = [v27 shortBundleVersion];
      v11 = [v27 game];
      v12 = [v11 adamID];
      id v13 = +[GKGameDescriptor gameDescriptorWithBundleID:v8 bundleVersion:v9 shortBundleVersion:v10 adamID:v12];

      [(GKBulletin *)v4 setGameDescriptor:v13];
      v14 = [v27 matchID];
      [(GKTurnBasedMultiplayerBulletin *)v4 setMatchID:v14];

      [(GKBulletin *)v4 setPushCommand:81];
      id v15 = [v27 bundleVersion];
      v16 = [(GKBulletin *)v4 gameDescriptor];
      [v16 setBundleVersion:v15];

      v17 = [v27 shortBundleVersion];
      id v18 = [(GKBulletin *)v4 gameDescriptor];
      [v18 setShortBundleVersion:v17];

      id v19 = +[GKBulletinController sharedController];
      v20 = [v19 acceptedInviteManager];

      [v20 addTurnBasedEvent:v4];
      v21 = [v27 bundleID];
      unsigned int v22 = GKGetApplicationStateForBundleID(v21);

      if (v22 == 8
        || ([v27 bundleID],
            v23 = objc_claimAutoreleasedReturnValue(),
            GKLaunchApplicationWithIdentifier(v23, 0),
            v23,
            v22 >= 4))
      {
        v24 = [v27 bundleID];
        uint64_t v25 = +[GKClientProxy clientForBundleID:v24];

        [v25 fetchTurnBasedData];
      }
      v26 = +[GKReporter reporter];
      [v26 reportEvent:GKReporterDomainTurnBased type:GKReporterTurnBasedShowMatch];
    }
  }
LABEL_9:
}

@end
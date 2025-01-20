@interface NTPBNotificationItem(FCNotificationItem)
- (__CFString)channelID;
- (id)articleID;
- (id)description;
- (id)initWithRecord:()FCNotificationItem feedItem:source:algoID:;
- (void)initWithIdentifier:()FCNotificationItem canonicalID:clusterID:notabilityScores:suppressIfFollowingTagIDs:targetMinNewsVersion:targetDeviceTypes:feedItem:source:algoID:;
@end

@implementation NTPBNotificationItem(FCNotificationItem)

- (void)initWithIdentifier:()FCNotificationItem canonicalID:clusterID:notabilityScores:suppressIfFollowingTagIDs:targetMinNewsVersion:targetDeviceTypes:feedItem:source:algoID:
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a10;
  id v23 = a12;
  v24 = (void *)[a1 init];
  v25 = v24;
  if (v24)
  {
    [v24 setIdentifier:v17];
    if (v18) {
      id v26 = v18;
    }
    else {
      id v26 = v17;
    }
    [v25 setCanonicalID:v26];
    [v25 setClusterID:v19];
    [v25 setNotabilityScores:v20];
    [v25 setSuppressIfFollowingTagIDs:v21];
    [v25 setTargetMinNewsVersion:a8];
    [v25 setTargetDeviceTypes:a9];
    [v25 setFeedItem:v22];
    [v25 setSource:a11];
    [v25 setAlgoID:v23];
  }

  return v25;
}

- (id)initWithRecord:()FCNotificationItem feedItem:source:algoID:
{
  id v8 = a3;
  id v27 = a4;
  id v9 = a6;
  v25 = [v8 base];
  id v26 = [v25 identifier];
  v10 = [v8 notificationID];
  v11 = [v8 clusterID];
  v12 = v11;
  if (!v11)
  {
    v12 = [v27 clusterID];
  }
  v13 = [v8 notabilityScores];
  v14 = v13;
  if (!v13) {
    v14 = objc_opt_new();
  }
  v15 = [v8 suppressIfFollowingTagIDs];
  v16 = v15;
  if (!v15) {
    v16 = objc_opt_new();
  }
  uint64_t v17 = [v8 targetMinNewsVersion];
  LODWORD(v22) = a5;
  LODWORD(v21) = [v8 targetDeviceTypes];
  id v18 = (void *)[a1 initWithIdentifier:v26 canonicalID:v10 clusterID:v12 notabilityScores:v14 suppressIfFollowingTagIDs:v16 targetMinNewsVersion:v17 targetDeviceTypes:v21 feedItem:v27 source:v22 algoID:v9];

  id v19 = v18;
  if (!v15) {

  }
  if (!v13) {
  if (!v11)
  }

  return v19;
}

- (id)description
{
  v2 = [[FCDescription alloc] initWithObject:a1];
  v3 = [a1 identifier];
  [(FCDescription *)v2 addField:@"identifier" value:v3];

  v4 = [a1 canonicalID];
  [(FCDescription *)v2 addField:@"canonicalID" value:v4];

  v5 = [a1 articleID];
  [(FCDescription *)v2 addField:@"articleID" value:v5];

  v6 = [(FCDescription *)v2 descriptionString];

  return v6;
}

- (id)articleID
{
  v1 = [a1 feedItem];
  v2 = [v1 articleID];

  return v2;
}

- (__CFString)channelID
{
  v1 = [a1 feedItem];
  v2 = [v1 sourceChannelID];
  v3 = v2;
  if (!v2) {
    v2 = &stru_1EF8299B8;
  }
  v4 = v2;

  return v4;
}

@end
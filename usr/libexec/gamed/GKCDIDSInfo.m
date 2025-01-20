@interface GKCDIDSInfo
+ (id)_gkObjectsMatchingContactAssociationIDs:(id)a3 withContext:(id)a4;
+ (id)_gkObjectsMatchingHandles:(id)a3 withContext:(id)a4;
+ (id)fetchRequest;
- (BOOL)isExpiredForSettings:(id)a3;
- (int)cohortFromIDSConsent:(int)a3;
- (void)_gkUpdateEntryWithHandle:(id)a3 contactAssociationID:(id)a4 supportsFriendingViaPush:(id)a5 supportsMessageTransportV2:(id)a6 cohort:(int)a7;
- (void)_gkUpdateEntryWithHandle:(id)a3 idsInfoResult:(id)a4;
@end

@implementation GKCDIDSInfo

- (BOOL)isExpiredForSettings:(id)a3
{
  id v4 = a3;
  v5 = [(GKCDIDSInfo *)self cohort];

  if (v5)
  {
    v6 = [(GKCDIDSInfo *)self cohort];
    id v7 = [v6 intValue];

    [v4 expirationTimeForCohort:v7];
    double v9 = v8;
    v10 = +[NSDate date];
    v11 = [(GKCDIDSInfo *)self timeStamp];
    [v10 timeIntervalSinceDate:v11];
    BOOL v13 = v12 > v9;
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

- (void)_gkUpdateEntryWithHandle:(id)a3 idsInfoResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v8, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    double v9 = +[NSThread callStackSymbols];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKCDIDSInfo(GKAdditions) _gkUpdateEntryWithHandle:idsInfoResult:]", v9);
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCDIDSInfo+GKAdditions.m"];
    id v12 = [v11 lastPathComponent];
    BOOL v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v10, "-[GKCDIDSInfo(GKAdditions) _gkUpdateEntryWithHandle:idsInfoResult:]", [v12 UTF8String], 72);

    +[NSException raise:@"GameKit Exception", @"%@", v13 format];
  }

  v14 = [v7 gameCenterData];
  v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 supportsFriendingViaPush]);
  v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 supportsMessageTransportV2]);
  id v17 = [v7 status];
  if (v17 == (id)2) {
    goto LABEL_6;
  }
  if (v17 == (id)1)
  {
    v18 = [v14 contactsSharingState];
    if (v18)
    {
      v19 = [v14 contactsSharingState];
      uint64_t v20 = (uint64_t)[v19 intValue];
    }
    else
    {
      uint64_t v20 = 0xFFFFFFFFLL;
    }
    uint64_t v25 = [(GKCDIDSInfo *)self cohortFromIDSConsent:v20];
    v26 = [v14 contactsAssociationID];
    [(GKCDIDSInfo *)self _gkUpdateEntryWithHandle:v6 contactAssociationID:v26 supportsFriendingViaPush:v15 supportsMessageTransportV2:v16 cohort:v25];

    goto LABEL_19;
  }
  if (!v17)
  {
LABEL_6:
    v18 = [v14 contactsAssociationID];
    [(GKCDIDSInfo *)self _gkUpdateEntryWithHandle:v6 contactAssociationID:v18 supportsFriendingViaPush:v15 supportsMessageTransportV2:v16 cohort:0];
LABEL_19:

    goto LABEL_20;
  }
  if (!os_log_GKGeneral) {
    id v21 = (id)GKOSLoggers();
  }
  v22 = os_log_GKError;
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
    sub_100133170(v22);
  }
  if (!os_log_GKGeneral) {
    id v23 = (id)GKOSLoggers();
  }
  v24 = (void *)os_log_GKContacts;
  if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
    sub_1001330D4(v24, v7);
  }
LABEL_20:
}

- (int)cohortFromIDSConsent:(int)a3
{
  if ((a3 + 1) < 3) {
    return dword_10024F320[a3 + 1];
  }
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  v5 = os_log_GKError;
  int result = os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_1001331B4(v5);
    return 0;
  }
  return result;
}

- (void)_gkUpdateEntryWithHandle:(id)a3 contactAssociationID:(id)a4 supportsFriendingViaPush:(id)a5 supportsMessageTransportV2:(id)a6 cohort:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v24 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = dispatch_get_current_queue();
  if (dispatch_queue_get_specific(v15, @"com.apple.gamed.cachequeue") != @"com.apple.gamed.cachequeue")
  {
    unsigned int v23 = v7;
    v16 = +[NSThread callStackSymbols];
    id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s not invoked on managed object context queue at %@", "-[GKCDIDSInfo(GKAdditions) _gkUpdateEntryWithHandle:contactAssociationID:supportsFriendingViaPush:supportsMessageTransportV2:cohort:]", v16);
    v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCDIDSInfo+GKAdditions.m"];
    id v19 = [v18 lastPathComponent];
    uint64_t v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]", v17, "-[GKCDIDSInfo(GKAdditions) _gkUpdateEntryWithHandle:contactAssociationID:supportsFriendingViaPush:supportsMessageTransportV2:cohort:]", [v19 UTF8String], 136);

    +[NSException raise:@"GameKit Exception", @"%@", v20 format];
    uint64_t v7 = v23;
  }

  if ([v24 length])
  {
    [(GKCDIDSInfo *)self setHandle:v24];
    [(GKCDIDSInfo *)self setContactAssociationID:v12];
    id v21 = +[NSDate date];
    [(GKCDIDSInfo *)self setTimeStamp:v21];

    v22 = +[NSNumber numberWithInt:v7];
    [(GKCDIDSInfo *)self setCohort:v22];

    [(GKCDIDSInfo *)self setSupportsFriendingViaPush:v13];
    [(GKCDIDSInfo *)self setSupportsMessageTransportV2:v14];
  }
}

+ (id)_gkObjectsMatchingHandles:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[NSPredicate predicateWithFormat:@"handle IN %@", a3];
  double v8 = [a1 _gkObjectsMatchingPredicate:v7 withContext:v6];

  return v8;
}

+ (id)_gkObjectsMatchingContactAssociationIDs:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[NSPredicate predicateWithFormat:@"contactAssociationID in %@", a3];
  double v8 = [a1 _gkObjectsMatchingPredicate:v7 withContext:v6];

  return v8;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"IDSInfo"];
}

@end
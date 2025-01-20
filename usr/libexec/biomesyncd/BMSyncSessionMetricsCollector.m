@interface BMSyncSessionMetricsCollector
- (BMSyncSessionMetricsCollector)initWithDatabase:(id)a3;
- (id)sessionContext;
- (void)recordAtomMergeResult:(unint64_t)a3 inStream:(id)a4 ownerSite:(id)a5 originatingSite:(id)a6 eventCreatedAt:(double)a7 sessionContext:(id)a8;
- (void)recordMessageToDeviceIdentifier:(id)a3 reachable:(BOOL)a4 bytes:(unint64_t)a5 isReciprocal:(BOOL)a6 sessionContext:(id)a7;
- (void)recordSessionEnd:(id)a3 lastSyncDate:(id)a4;
- (void)recordSessionStart:(id)a3 transport:(unint64_t)a4 reason:(unint64_t)a5 isReciprocal:(BOOL)a6;
@end

@implementation BMSyncSessionMetricsCollector

- (BMSyncSessionMetricsCollector)initWithDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMSyncSessionMetricsCollector;
  v6 = [(BMSyncSessionMetricsCollector *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    v7->_atomMergeResultsRecorded = 0;
  }

  return v7;
}

- (id)sessionContext
{
  v2 = objc_opt_new();
  v3 = +[NSUUID UUID];
  v4 = [v3 UUIDString];
  [v2 setSessionID:v4];

  [v2 setMessageID:0];

  return v2;
}

- (void)recordSessionStart:(id)a3 transport:(unint64_t)a4 reason:(unint64_t)a5 isReciprocal:(BOOL)a6
{
}

- (void)recordSessionEnd:(id)a3 lastSyncDate:(id)a4
{
  id v10 = a3;
  if (a4)
  {
    id v6 = a4;
    v7 = objc_opt_new();
    [v7 timeIntervalSinceDate:v6];
    double v9 = v8;
  }
  else
  {
    double v9 = -1.0;
  }
  [(BMSyncDatabase *)self->_database recordSessionEnd:v10 timeSincePreviousSync:v9];
}

- (void)recordMessageToDeviceIdentifier:(id)a3 reachable:(BOOL)a4 bytes:(unint64_t)a5 isReciprocal:(BOOL)a6 sessionContext:(id)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a7;
  v14 = v13;
  if (v13)
  {
    [v13 setMessageID:((char *)[v13 messageID] + 1)];
    id v15 = [v14 messageID];
    database = self->_database;
    v17 = [v14 sessionID];
    [(BMSyncDatabase *)database recordMessageToDeviceIdentifier:v12 sessionID:v17 messageID:v15 reachable:v10 bytes:a5 isReciprocal:v8];
  }
  else
  {
    v18 = __biome_log_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000442DC(v18);
    }
  }
}

- (void)recordAtomMergeResult:(unint64_t)a3 inStream:(id)a4 ownerSite:(id)a5 originatingSite:(id)a6 eventCreatedAt:(double)a7 sessionContext:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (!v17)
  {
    v19 = __biome_log_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000442DC(v19);
    }
    goto LABEL_11;
  }
  unint64_t atomMergeResultsRecorded = self->_atomMergeResultsRecorded;
  if (!atomMergeResultsRecorded) {
    unint64_t atomMergeResultsRecorded = [(BMSyncDatabase *)self->_database countAtomMergeResultRecords];
  }
  self->_unint64_t atomMergeResultsRecorded = atomMergeResultsRecorded + 1;
  if (atomMergeResultsRecorded >= 0x186A1)
  {
    v19 = __biome_log_for_category();
    *(void *)buf = 0;
    v27 = buf;
    uint64_t v28 = 0x2020000000;
    char v29 = 16;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000786C;
    block[3] = &unk_10006CAC0;
    block[4] = buf;
    if (qword_1000802A8 != -1) {
      dispatch_once(&qword_1000802A8, block);
    }
    os_log_type_t v20 = v27[24];
    _Block_object_dispose(buf, 8);
    if (os_log_type_enabled(v19, v20))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "exceeded limit for recording atom merge results", buf, 2u);
    }
LABEL_11:

    goto LABEL_16;
  }
  database = self->_database;
  uint64_t v22 = [v17 sessionID];
  v23 = (void *)v22;
  if (v22) {
    CFStringRef v24 = (const __CFString *)v22;
  }
  else {
    CFStringRef v24 = @"no session ID";
  }
  -[BMSyncDatabase recordAtomMergeResult:inStream:sessionID:messageID:ownerSite:originatingSite:eventCreatedAt:](database, "recordAtomMergeResult:inStream:sessionID:messageID:ownerSite:originatingSite:eventCreatedAt:", a3, v14, v24, [v17 messageID], v15, v16, a7);

LABEL_16:
}

- (void).cxx_destruct
{
}

@end
@interface FCCurrentIssuesChecker
- (FCCurrentIssuesChecker)init;
- (FCCurrentIssuesChecker)initWithContext:(id)a3 subscriptionController:(id)a4 issueReadingHistory:(id)a5 bundleSubscriptionProvider:(id)a6;
- (id)_promiseBundleChannelIDs;
- (id)_promiseCurrentIssuesFromChannelIDs:(void *)a3 withChainingData:(uint64_t)a4 qualityOfService:;
- (id)demoFollowedChannelIDs;
- (id)sortIssues:(void *)a3 basedOnTagIDs:;
- (void)fetchUsersCurrentIssuesWithCompletion:(id)a3;
- (void)fetchUsersFollowedIssuesWithQualityOfService:(int64_t)a3 completion:(id)a4;
@end

@implementation FCCurrentIssuesChecker

- (FCCurrentIssuesChecker)initWithContext:(id)a3 subscriptionController:(id)a4 issueReadingHistory:(id)a5 bundleSubscriptionProvider:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FCCurrentIssuesChecker;
  v15 = [(FCCurrentIssuesChecker *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    objc_storeStrong((id *)&v16->_subscriptionController, a4);
    objc_storeStrong((id *)&v16->_issueReadingHistory, a5);
    objc_storeStrong((id *)&v16->_bundleSubscriptionProvider, a6);
  }

  return v16;
}

- (FCCurrentIssuesChecker)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCCurrentIssuesChecker init]";
    __int16 v9 = 2080;
    v10 = "FCCurrentIssuesChecker.m";
    __int16 v11 = 1024;
    int v12 = 60;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCCurrentIssuesChecker init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)fetchUsersCurrentIssuesWithCompletion:(id)a3
{
  id v4 = a3;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke;
  v25[3] = &unk_1E5B4E758;
  v25[4] = self;
  v17 = [MEMORY[0x1E4F81BF0] firstly:v25];
  v5 = zalgo();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_2;
  v24[3] = &unk_1E5B572D0;
  v24[4] = self;
  id v6 = [v17 thenOn:v5 then:v24];
  v7 = zalgo();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_14;
  v23[3] = &unk_1E5B572F8;
  v23[4] = self;
  v8 = [v6 thenOn:v7 then:v23];
  __int16 v9 = zalgo();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_16;
  v22[3] = &unk_1E5B572F8;
  v22[4] = self;
  v10 = [v8 thenOn:v9 then:v22];
  __int16 v11 = zalgo();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_19;
  v20[3] = &unk_1E5B57320;
  v20[4] = self;
  id v12 = v4;
  id v21 = v12;
  __int16 v13 = [v10 thenOn:v11 then:v20];
  id v14 = zalgo();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_22;
  v18[3] = &unk_1E5B4EF68;
  id v19 = v12;
  id v15 = v12;
  id v16 = (id)[v13 errorOn:v14 error:v18];
}

id __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke(uint64_t a1)
{
  return -[FCCurrentIssuesChecker _promiseBundleChannelIDs](*(void **)(a1 + 32));
}

- (id)_promiseBundleChannelIDs
{
  if (a1)
  {
    v2 = a1;
    id v3 = objc_alloc(MEMORY[0x1E4F81BF0]);
    var38[0] = MEMORY[0x1E4F143A8];
    var38[1] = 3221225472;
    var38[2] = __50__FCCurrentIssuesChecker__promiseBundleChannelIDs__block_invoke;
    var38[3] = &unk_1E5B4EEF0;
    var38[4] = v2;
    a1 = (void *)[v3 initWithResolver:var38];
    uint64_t v1 = var38[8];
  }
  return a1;
}

id __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(FCCurrentIssuesPromiseChainingData);
  v5 = objc_alloc_init(FCCurrentIssuesCheckerResult);
  if (v4) {
    objc_storeStrong((id *)&v4->_partialResult, v5);
  }
  -[FCHandlePushNotificationResult setRecordZoneIDs:]((uint64_t)v4, v3);

  id v6 = (void *)FCCurrentIssuesCheckerLog;
  if (os_log_type_enabled((os_log_t)FCCurrentIssuesCheckerLog, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      bundleChannelIDs = v4->_bundleChannelIDs;
    }
    else {
      bundleChannelIDs = 0;
    }
    v8 = bundleChannelIDs;
    __int16 v9 = v6;
    LODWORD(v15) = 134217984;
    *(void *)((char *)&v15 + 4) = [(NSOrderedSet *)v8 count];
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "Found %lu bundle channels", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  __int16 v11 = v4;
  if (v10)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F81BF0]);
    *(void *)&long long v15 = MEMORY[0x1E4F143A8];
    *((void *)&v15 + 1) = 3221225472;
    id v16 = __101__FCCurrentIssuesChecker__promiseFollowedAndAutofavoriteChannelIDsWithChainingData_qualityOfService___block_invoke;
    v17 = &unk_1E5B573C0;
    uint64_t v18 = v10;
    uint64_t v20 = 17;
    id v19 = v11;
    __int16 v13 = (void *)[v12 initWithResolver:&v15];
  }
  else
  {
    __int16 v13 = 0;
  }

  return v13;
}

id __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)FCCurrentIssuesCheckerLog;
  if (os_log_type_enabled((os_log_t)FCCurrentIssuesCheckerLog, OS_LOG_TYPE_DEFAULT))
  {
    if (v3) {
      v5 = (void *)*((void *)v3 + 3);
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
    v7 = v4;
    uint64_t v8 = [v6 count];
    if (v3) {
      __int16 v9 = (void *)*((void *)v3 + 4);
    }
    else {
      __int16 v9 = 0;
    }
    id v10 = v9;
    int v16 = 134218240;
    uint64_t v17 = v8;
    __int16 v18 = 2048;
    uint64_t v19 = [v10 count];
    _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_DEFAULT, "Found %lu followed channels and %lu autofavorite tags", (uint8_t *)&v16, 0x16u);
  }
  if (v3)
  {
    id v11 = *((id *)v3 + 3);
    uint64_t v12 = *((void *)v3 + 4);
  }
  else
  {
    id v11 = 0;
    uint64_t v12 = 0;
  }
  __int16 v13 = [v11 arrayByAddingObjectsFromArray:v12];

  id v14 = -[FCCurrentIssuesChecker _promiseCurrentIssuesFromChannelIDs:withChainingData:qualityOfService:](*(void *)(a1 + 32), v13, v3, 17);

  return v14;
}

- (id)_promiseCurrentIssuesFromChannelIDs:(void *)a3 withChainingData:(uint64_t)a4 qualityOfService:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F81BF0]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __96__FCCurrentIssuesChecker__promiseCurrentIssuesFromChannelIDs_withChainingData_qualityOfService___block_invoke;
    v12[3] = &unk_1E5B57410;
    id v13 = v8;
    id v14 = v7;
    uint64_t v15 = a1;
    uint64_t v16 = a4;
    id v10 = (void *)[v9 initWithResolver:v12];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

id __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v3 = (id *)v3[4];
    id v5 = v4[1];
  }
  else
  {
    id v5 = 0;
  }
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_2_17;
  v54[3] = &unk_1E5B50328;
  id v6 = v3;
  v55 = v6;
  id v7 = objc_msgSend(v5, "fc_arrayOfObjectsFailingTest:", v54);
  if (v4) {
    id v8 = v4[1];
  }
  else {
    id v8 = 0;
  }
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_3;
  v52[3] = &unk_1E5B50328;
  id v9 = v6;
  v53 = v9;
  id v10 = objc_msgSend(v8, "fc_arrayOfObjectsPassingTest:", v52);
  -[FCCurrentIssuesChecker demoFollowedChannelIDs](*(void *)(a1 + 32));
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 count];

  if (v12)
  {
    id v13 = *(void **)(a1 + 32);
    if (v4) {
      id v14 = v4[3];
    }
    else {
      id v14 = 0;
    }
    id v11 = v14;
    uint64_t v15 = -[FCCurrentIssuesChecker sortIssues:basedOnTagIDs:](v13, v7, v11);
    if (v4) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v15 = v7;
    if (v4)
    {
LABEL_9:
      id v16 = v4[5];
      goto LABEL_10;
    }
  }
  id v16 = 0;
LABEL_10:
  [v16 setFollowedIssues:v15];
  if (v12)
  {

    uint64_t v17 = -[FCCurrentIssuesChecker sortIssues:basedOnTagIDs:](*(void **)(a1 + 32), v10, v9);
    if (v4)
    {
LABEL_12:
      id v18 = v4[5];
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v17 = v10;
    if (v4) {
      goto LABEL_12;
    }
  }
  id v18 = 0;
LABEL_13:
  [v18 setAutoFavoriteIssues:v17];
  if (v12) {

  }
  uint64_t v19 = (id)FCCurrentIssuesCheckerLog;
  v51 = v9;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = v7;
    if (v4) {
      id v21 = v4[5];
    }
    else {
      id v21 = 0;
    }
    uint64_t v50 = a1;
    id v22 = v21;
    v23 = [v22 autoFavoriteIssues];
    uint64_t v24 = [v23 count];
    v25 = v10;
    if (v4) {
      id v26 = v4[5];
    }
    else {
      id v26 = 0;
    }
    id v27 = v26;
    v28 = [v27 autoFavoriteIssues];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v24;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v28;
    _os_log_impl(&dword_1A460D000, v19, OS_LOG_TYPE_DEFAULT, "Found %lu auto favorited issues: %@", buf, 0x16u);

    id v7 = v20;
    id v10 = v25;
    a1 = v50;
    id v9 = v51;
  }

  v29 = (id)FCCurrentIssuesCheckerLog;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = v7;
    if (v4) {
      id v31 = v4[5];
    }
    else {
      id v31 = 0;
    }
    uint64_t v32 = a1;
    id v33 = v31;
    v34 = [v33 followedIssues];
    uint64_t v35 = [v34 count];
    v36 = v10;
    if (v4) {
      id v37 = v4[5];
    }
    else {
      id v37 = 0;
    }
    id v38 = v37;
    v39 = [v38 followedIssues];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v35;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v39;
    _os_log_impl(&dword_1A460D000, v29, OS_LOG_TYPE_DEFAULT, "Found %lu followed issues: %@", buf, 0x16u);

    id v7 = v30;
    id v9 = v51;
    id v10 = v36;
    a1 = v32;
  }

  uint64_t v40 = *(void *)(a1 + 32);
  if (v4) {
    id v41 = v4[5];
  }
  else {
    id v41 = 0;
  }
  id v42 = v41;
  id v43 = [v42 followedIssues];
  v44 = v4;
  if (v40)
  {
    if (!v43 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v48 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issues");
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[FCCurrentIssuesChecker _promiseFilterUnreadIssuesWithFromIssues:withChainingdata:]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "FCCurrentIssuesChecker.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v57) = 311;
      WORD2(v57) = 2114;
      *(void *)((char *)&v57 + 6) = v48;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (!v4)
      {
LABEL_33:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v49 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "data");
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "-[FCCurrentIssuesChecker _promiseFilterUnreadIssuesWithFromIssues:withChainingdata:]";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "FCCurrentIssuesChecker.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v57) = 312;
          WORD2(v57) = 2114;
          *(void *)((char *)&v57 + 6) = v49;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
      }
    }
    else if (!v4)
    {
      goto LABEL_33;
    }
    id v45 = objc_alloc(MEMORY[0x1E4F81BF0]);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __84__FCCurrentIssuesChecker__promiseFilterUnreadIssuesWithFromIssues_withChainingdata___block_invoke;
    *(void *)&long long v57 = &unk_1E5B507A0;
    *((void *)&v57 + 1) = v40;
    id v58 = v43;
    v59 = v44;
    v46 = (void *)[v45 initWithResolver:buf];

    goto LABEL_36;
  }
  v46 = 0;
LABEL_36:

  return v46;
}

uint64_t __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_2_17(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 sourceChannel];
  id v4 = [v3 identifier];
  uint64_t v5 = [v2 containsObject:v4];

  return v5;
}

uint64_t __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 sourceChannel];
  id v4 = [v3 identifier];
  uint64_t v5 = [v2 containsObject:v4];

  return v5;
}

- (id)demoFollowedChannelIDs
{
  if (a1)
  {
    uint64_t v1 = NewsCoreUserDefaults();
    v2 = [v1 stringForKey:@"news.demo.followed_channels"];

    id v3 = [v2 componentsSeparatedByString:@","];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)sortIssues:(void *)a3 basedOnTagIDs:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    if (v5 && v6)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __51__FCCurrentIssuesChecker_sortIssues_basedOnTagIDs___block_invoke_2;
      v10[3] = &unk_1E5B4DDA8;
      id v11 = v5;
      a1 = objc_msgSend(v7, "fc_arrayByTransformingWithBlock:", v10);
      id v8 = v11;
    }
    else
    {
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      id v14 = __51__FCCurrentIssuesChecker_sortIssues_basedOnTagIDs___block_invoke;
      uint64_t v15 = &unk_1E5B505B0;
      id v16 = v5;
      id v8 = v16;
      a1 = v8;
    }
  }
  return a1;
}

uint64_t __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3[1];
    id v3 = (id *)v4[5];
  }
  else
  {
    id v5 = 0;
  }
  [v3 setUnreadFollowedIssues:v5];

  id v6 = (void *)FCCurrentIssuesCheckerLog;
  uint64_t v48 = a1;
  if (os_log_type_enabled((os_log_t)FCCurrentIssuesCheckerLog, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      id v7 = v4[5];
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;
    id v9 = v6;
    id v10 = [v8 unreadFollowedIssues];
    uint64_t v11 = [v10 count];
    if (v4) {
      id v12 = v4[5];
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;
    id v14 = [v13 unreadFollowedIssues];
    *(_DWORD *)buf = 134218242;
    uint64_t v52 = v11;
    __int16 v53 = 2112;
    v54 = v14;
    _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "Found %lu unread issues: %@", buf, 0x16u);

    a1 = v48;
  }
  if (v4) {
    id v15 = v4[5];
  }
  else {
    id v15 = 0;
  }
  id v16 = v15;
  uint64_t v17 = [v16 unreadFollowedIssues];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_20;
  v50[3] = &unk_1E5B50328;
  uint64_t v18 = *(void *)(a1 + 32);

  v50[4] = v18;
  uint64_t v19 = objc_msgSend(v17, "fc_arrayOfObjectsPassingTest:", v50);

  if (v4) {
    id v20 = v4[5];
  }
  else {
    id v20 = 0;
  }
  [v20 setUnbadgedIssues:v19];
  id v21 = (void *)FCCurrentIssuesCheckerLog;
  if (os_log_type_enabled((os_log_t)FCCurrentIssuesCheckerLog, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      id v22 = v4[5];
    }
    else {
      id v22 = 0;
    }
    id v23 = v22;
    uint64_t v24 = v21;
    v25 = [v23 unbadgedIssues];
    uint64_t v26 = [v25 count];
    if (v4) {
      id v27 = v4[5];
    }
    else {
      id v27 = 0;
    }
    id v28 = v27;
    v29 = [v28 unbadgedIssues];
    *(_DWORD *)buf = 134218242;
    uint64_t v52 = v26;
    __int16 v53 = 2112;
    v54 = v29;
    _os_log_impl(&dword_1A460D000, v24, OS_LOG_TYPE_DEFAULT, "Found %lu unbadged issues: %@", buf, 0x16u);

    a1 = v48;
  }
  if (v4) {
    id v30 = v4[5];
  }
  else {
    id v30 = 0;
  }
  id v31 = v30;
  uint64_t v32 = [v31 unreadFollowedIssues];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_21;
  v49[3] = &unk_1E5B50328;
  uint64_t v33 = *(void *)(a1 + 32);

  v49[4] = v33;
  v34 = objc_msgSend(v32, "fc_arrayOfObjectsPassingTest:", v49);

  if (v4) {
    id v35 = v4[5];
  }
  else {
    id v35 = 0;
  }
  [v35 setSeenIssues:v34];
  v36 = (void *)FCCurrentIssuesCheckerLog;
  if (os_log_type_enabled((os_log_t)FCCurrentIssuesCheckerLog, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      id v37 = v4[5];
    }
    else {
      id v37 = 0;
    }
    id v38 = v37;
    v39 = v36;
    uint64_t v40 = [v38 seenIssues];
    uint64_t v41 = [v40 count];
    if (v4) {
      id v42 = v4[5];
    }
    else {
      id v42 = 0;
    }
    id v43 = v42;
    v44 = [v43 seenIssues];
    *(_DWORD *)buf = 134218242;
    uint64_t v52 = v41;
    __int16 v53 = 2112;
    v54 = v44;
    _os_log_impl(&dword_1A460D000, v39, OS_LOG_TYPE_DEFAULT, "Found %lu seen issues: %@", buf, 0x16u);

    a1 = v48;
  }
  uint64_t v45 = *(void *)(a1 + 40);
  if (v45)
  {
    if (v4) {
      id v46 = v4[5];
    }
    else {
      id v46 = 0;
    }
    (*(void (**)(uint64_t, id))(v45 + 16))(v45, v46);
  }

  return 0;
}

uint64_t __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_20(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    id v3 = (void *)v3[3];
  }
  id v4 = v3;
  id v5 = [a2 identifier];
  int v6 = [v4 hasIssueWithIDBeenBadged:v5];

  return v6 ^ 1u;
}

uint64_t __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    id v3 = (void *)v3[3];
  }
  id v4 = v3;
  id v5 = [a2 identifier];
  uint64_t v6 = [v4 hasIssueWithIDBeenSeen:v5];

  return v6;
}

void __64__FCCurrentIssuesChecker_fetchUsersCurrentIssuesWithCompletion___block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = FCCurrentIssuesCheckerLog;
  if (os_log_type_enabled((os_log_t)FCCurrentIssuesCheckerLog, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_error_impl(&dword_1A460D000, v4, OS_LOG_TYPE_ERROR, "Failed to check for current issues with error: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  id v5 = objc_alloc_init(FCCurrentIssuesCheckerResult);
  [(FCCurrentIssuesCheckerResult *)v5 setError:v3];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, FCCurrentIssuesCheckerResult *))(v6 + 16))(v6, v5);
  }
}

- (void)fetchUsersFollowedIssuesWithQualityOfService:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __82__FCCurrentIssuesChecker_fetchUsersFollowedIssuesWithQualityOfService_completion___block_invoke;
  v21[3] = &unk_1E5B4E758;
  v21[4] = self;
  int v7 = [MEMORY[0x1E4F81BF0] firstly:v21];
  id v8 = zalgo();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __82__FCCurrentIssuesChecker_fetchUsersFollowedIssuesWithQualityOfService_completion___block_invoke_2;
  v20[3] = &unk_1E5B57348;
  v20[4] = self;
  void v20[5] = a3;
  uint64_t v9 = [v7 thenOn:v8 then:v20];
  id v10 = zalgo();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__FCCurrentIssuesChecker_fetchUsersFollowedIssuesWithQualityOfService_completion___block_invoke_3;
  v18[3] = &unk_1E5B57370;
  id v11 = v6;
  id v19 = v11;
  id v12 = [v9 thenOn:v10 then:v18];
  id v13 = zalgo();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__FCCurrentIssuesChecker_fetchUsersFollowedIssuesWithQualityOfService_completion___block_invoke_4;
  v16[3] = &unk_1E5B4EF68;
  id v17 = v11;
  id v14 = v11;
  id v15 = (id)[v12 errorOn:v13 error:v16];
}

id __82__FCCurrentIssuesChecker_fetchUsersFollowedIssuesWithQualityOfService_completion___block_invoke(uint64_t a1)
{
  return -[FCCurrentIssuesChecker _promiseBundleChannelIDs](*(void **)(a1 + 32));
}

id __82__FCCurrentIssuesChecker_fetchUsersFollowedIssuesWithQualityOfService_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(FCCurrentIssuesPromiseChainingData);
  -[FCHandlePushNotificationResult setRecordZoneIDs:]((uint64_t)v4, v3);

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    id v6 = *(void **)(v5 + 16);
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  id v8 = [v7 subscribedTagIDs];
  uint64_t v9 = -[FCCurrentIssuesChecker _promiseCurrentIssuesFromChannelIDs:withChainingData:qualityOfService:](v5, v8, v4, *(void *)(a1 + 40));

  return v9;
}

uint64_t __82__FCCurrentIssuesChecker_fetchUsersFollowedIssuesWithQualityOfService_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    if (v3) {
      uint64_t v5 = v3[1];
    }
    else {
      uint64_t v5 = 0;
    }
    (*(void (**)(uint64_t, uint64_t, void))(v4 + 16))(v4, v5, 0);
  }

  return 0;
}

void __82__FCCurrentIssuesChecker_fetchUsersFollowedIssuesWithQualityOfService_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = FCCurrentIssuesCheckerLog;
  if (os_log_type_enabled((os_log_t)FCCurrentIssuesCheckerLog, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_error_impl(&dword_1A460D000, v4, OS_LOG_TYPE_ERROR, "Failed to check for current issues with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

id __51__FCCurrentIssuesChecker_sortIssues_basedOnTagIDs___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __51__FCCurrentIssuesChecker_sortIssues_basedOnTagIDs___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = (id)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "sourceChannel", (void)v13);
        id v10 = [v9 identifier];
        char v11 = [v10 isEqualToString:v3];

        if (v11)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

void __50__FCCurrentIssuesChecker__promiseBundleChannelIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    uint64_t v8 = *(void **)(v7 + 32);
  }
  else {
    uint64_t v8 = 0;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__FCCurrentIssuesChecker__promiseBundleChannelIDs__block_invoke_2;
  v11[3] = &unk_1E5B4E150;
  v11[4] = v7;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 prepareForUseWithCompletion:v11];
}

void __50__FCCurrentIssuesChecker__promiseBundleChannelIDs__block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    id v3 = *(void **)(v2 + 32);
  }
  else {
    id v3 = 0;
  }
  id v4 = [v3 bundleSubscription];
  id v6 = [v4 bundleChannelIDs];

  if ([v6 count])
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 8, @"Could not get the list of bundle channelIDs.");
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __101__FCCurrentIssuesChecker__promiseFollowedAndAutofavoriteChannelIDsWithChainingData_qualityOfService___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)a1[4];
  if (v7) {
    uint64_t v7 = (void *)v7[2];
  }
  uint64_t v8 = a1[6];
  id v9 = v7;
  id v10 = FCDispatchQueueForQualityOfService(v8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __101__FCCurrentIssuesChecker__promiseFollowedAndAutofavoriteChannelIDsWithChainingData_qualityOfService___block_invoke_2;
  v14[3] = &unk_1E5B57398;
  char v11 = (void *)a1[5];
  v14[4] = a1[4];
  id v15 = v11;
  id v16 = v5;
  id v17 = v6;
  id v12 = v6;
  id v13 = v5;
  [v9 fetchSubscribedTagsWithCallbackQueue:v10 preferCache:0 completion:v14];
}

void __101__FCCurrentIssuesChecker__promiseFollowedAndAutofavoriteChannelIDsWithChainingData_qualityOfService___block_invoke_2(uint64_t *a1, void *a2, uint64_t a3)
{
  id v14 = a2;
  if (a3)
  {
    id v5 = *(void (**)(void))(a1[7] + 16);
  }
  else
  {
    id v6 = -[FCCurrentIssuesChecker demoFollowedChannelIDs](a1[4]);
    uint64_t v7 = [v6 count];

    if (v7) {
      -[FCCurrentIssuesChecker demoFollowedChannelIDs](a1[4]);
    }
    else {
    uint64_t v8 = objc_msgSend(v14, "fc_arrayByTransformingWithBlock:", &__block_literal_global_117);
    }
    uint64_t v9 = a1[5];
    if (v9) {
      objc_storeStrong((id *)(v9 + 24), v8);
    }

    id v10 = (void *)a1[4];
    if (v10) {
      id v10 = (void *)v10[2];
    }
    char v11 = v10;
    id v12 = [v11 autoFavoriteTagIDs];
    uint64_t v13 = a1[5];
    if (v13) {
      objc_storeStrong((id *)(v13 + 32), v12);
    }

    id v5 = *(void (**)(void))(a1[6] + 16);
  }
  v5();
}

id __101__FCCurrentIssuesChecker__promiseFollowedAndAutofavoriteChannelIDsWithChainingData_qualityOfService___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 asChannel];
  id v3 = [v2 identifier];

  return v3;
}

void __96__FCCurrentIssuesChecker__promiseCurrentIssuesFromChannelIDs_withChainingData_qualityOfService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7) {
    uint64_t v7 = (void *)v7[2];
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void **)(a1 + 40);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __96__FCCurrentIssuesChecker__promiseCurrentIssuesFromChannelIDs_withChainingData_qualityOfService___block_invoke_2;
  v27[3] = &unk_1E5B4DBB0;
  id v10 = v8;
  id v28 = v10;
  char v11 = objc_msgSend(v9, "fc_arrayOfObjectsPassingTest:", v27);
  if (v11)
  {
    id v12 = [FCChannelIssuesFetchOperation alloc];
    uint64_t v13 = *(void *)(a1 + 48);
    if (v13) {
      uint64_t v14 = *(void *)(v13 + 8);
    }
    else {
      uint64_t v14 = 0;
    }
    id v15 = [(FCChannelIssuesFetchOperation *)v12 initWithContext:v14 channelIDs:v11 issueSet:0];
    [(FCOperation *)v15 setQualityOfService:*(void *)(a1 + 56)];
    uint64_t v16 = *(void *)(a1 + 56);
    if (v16 == 9)
    {
      uint64_t v17 = -1;
    }
    else if (v16 == 33 || (uint64_t v17 = 0, v16 == 25))
    {
      uint64_t v17 = 1;
    }
    [(FCOperation *)v15 setRelativePriority:v17];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __96__FCCurrentIssuesChecker__promiseCurrentIssuesFromChannelIDs_withChainingData_qualityOfService___block_invoke_4;
    v18[3] = &unk_1E5B551A0;
    id v19 = *(id *)(a1 + 32);
    id v20 = v5;
    id v21 = v6;
    [(FCChannelIssuesFetchOperation *)v15 setFetchCompletionHandler:v18];
    [(FCOperation *)v15 start];
  }
  else
  {
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __96__FCCurrentIssuesChecker__promiseCurrentIssuesFromChannelIDs_withChainingData_qualityOfService___block_invoke_3;
    v25 = &unk_1E5B4CA88;
    uint64_t v26 = (FCChannelIssuesFetchOperation *)v6;
    ((void (*)(FCChannelIssuesFetchOperation *, void))v26->super.super._iop.__nextOp)(v26, 0);
    id v15 = v26;
  }
}

uint64_t __96__FCCurrentIssuesChecker__promiseCurrentIssuesFromChannelIDs_withChainingData_qualityOfService___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __96__FCCurrentIssuesChecker__promiseCurrentIssuesFromChannelIDs_withChainingData_qualityOfService___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96__FCCurrentIssuesChecker__promiseCurrentIssuesFromChannelIDs_withChainingData_qualityOfService___block_invoke_4(uint64_t *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __96__FCCurrentIssuesChecker__promiseCurrentIssuesFromChannelIDs_withChainingData_qualityOfService___block_invoke_5;
    v8[3] = &unk_1E5B573E8;
    id v9 = v6;
    id v7 = v6;
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
    -[FCPurchaseController setPurchasesDiscoveredTagIDs:](a1[4], v7);
    (*(void (**)(void))(a1[5] + 16))();
  }
}

uint64_t __96__FCCurrentIssuesChecker__promiseCurrentIssuesFromChannelIDs_withChainingData_qualityOfService___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

void __84__FCCurrentIssuesChecker__promiseFilterUnreadIssuesWithFromIssues_withChainingdata___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v4 = (void *)v4[3];
  }
  id v5 = v4;
  id v6 = dispatch_get_global_queue(17, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__FCCurrentIssuesChecker__promiseFilterUnreadIssuesWithFromIssues_withChainingdata___block_invoke_2;
  v10[3] = &unk_1E5B57438;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = *(id *)(a1 + 48);
  id v14 = v3;
  id v9 = v3;
  [v5 syncWithCallbackQueue:v6 completion:v10];
}

void __84__FCCurrentIssuesChecker__promiseFilterUnreadIssuesWithFromIssues_withChainingdata___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v4;
      _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Failed to fetch our issue reading history; Unable to determine unread state, error=%{public}@",
        buf,
        0xCu);
    }
    -[FCPurchaseController setPurchasesDiscoveredTagIDs:](*(void *)(a1 + 48), *(void **)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __84__FCCurrentIssuesChecker__promiseFilterUnreadIssuesWithFromIssues_withChainingdata___block_invoke_3;
    v8[3] = &unk_1E5B50328;
    id v6 = *(void **)(a1 + 32);
    void v8[4] = *(void *)(a1 + 40);
    id v7 = objc_msgSend(v6, "fc_arrayOfObjectsPassingTest:", v8);
    -[FCPurchaseController setPurchasesDiscoveredTagIDs:](*(void *)(a1 + 48), v7);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __84__FCCurrentIssuesChecker__promiseFilterUnreadIssuesWithFromIssues_withChainingdata___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3) {
    id v3 = (void *)v3[3];
  }
  id v4 = v3;
  id v5 = [a2 identifier];
  int v6 = [v4 hasIssueWithIDBeenVisited:v5];

  return v6 ^ 1u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_issueReadingHistory, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
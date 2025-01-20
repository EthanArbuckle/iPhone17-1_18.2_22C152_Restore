@interface CKKSControlCLI
- (CKKSControl)control;
- (CKKSControlCLI)initWithCKKSControl:(id)a3;
- (id)fetchPerformanceCounters;
- (id)fetchStatus:(id)a3;
- (id)parseJSON:(Class)a3 name:(id)a4 json:(id)a5;
- (int)deleteSEZone:(id)a3;
- (int)fetchSEView:(id)a3 json:(BOOL)a4;
- (int)modifySEZone:(id)a3 tlkShareJsonStrings:(id)a4 deletetlkShareJsonStrings:(id)a5;
- (int)proposeSETLK:(id)a3 tlkJson:(id)a4 oldTlkJson:(id)a5 tlkShareJsonStrings:(id)a6;
- (int)toggleHavoc;
- (int64_t)ckmetric;
- (int64_t)fetch:(id)a3;
- (int64_t)push:(id)a3;
- (int64_t)resetCloudKit:(id)a3;
- (int64_t)resetLocal:(id)a3;
- (int64_t)resync:(id)a3;
- (void)printHumanReadableStatus:(id)a3 shortenOutput:(BOOL)a4;
- (void)setControl:(id)a3;
@end

@implementation CKKSControlCLI

- (void).cxx_destruct
{
}

- (void)setControl:(id)a3
{
}

- (CKKSControl)control
{
  return (CKKSControl *)objc_getProperty(self, a2, 8, 1);
}

- (int)toggleHavoc
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 1;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = [(CKKSControlCLI *)self control];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000400C;
  v9[3] = &unk_10000C420;
  v11 = &v12;
  v5 = v3;
  v10 = v5;
  [v4 toggleHavoc:v9];

  dispatch_time_t v6 = dispatch_time(0, 65000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    puts("\n\nError: timed out waiting for response");
    int v7 = -1;
  }
  else
  {
    int v7 = *((_DWORD *)v13 + 6);
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (int)deleteSEZone:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 1;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  dispatch_time_t v6 = [(CKKSControlCLI *)self control];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004258;
  v13[3] = &unk_10000C380;
  int v15 = &v16;
  int v7 = v5;
  uint64_t v14 = v7;
  [v6 deleteSEView:v4 reply:v13];

  dispatch_time_t v8 = dispatch_time(0, 150000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    puts("\n\nError: timed out waiting for response");
    v9 = secLogObjForScope();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Timed out waiting for deleteSEZone response", v12, 2u);
    }

    int v10 = -1;
  }
  else
  {
    int v10 = *((_DWORD *)v17 + 6);
  }

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (int)modifySEZone:(id)a3 tlkShareJsonStrings:(id)a4 deletetlkShareJsonStrings:(id)a5
{
  id v26 = a3;
  id v8 = a4;
  id v27 = a5;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = 1;
  v9 = +[NSMutableArray array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v38;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = [(CKKSControlCLI *)self parseJSON:objc_opt_class() name:@"TLK Share" json:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        if (!v14)
        {
          int v24 = 1;
          int v15 = v10;
          goto LABEL_26;
        }
        [v9 addObject:v14];
      }
      id v11 = [v10 countByEnumeratingWithState:&v37 objects:v46 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  int v15 = +[NSMutableArray array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obj = v27;
  id v16 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v34;
    while (2)
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(obj);
        }
        int v19 = [(CKKSControlCLI *)self parseJSON:objc_opt_class() name:@"TLK Share" json:*(void *)(*((void *)&v33 + 1) + 8 * (void)j)];
        if (!v19)
        {
          int v24 = 1;
          goto LABEL_25;
        }
        [v15 addObject:v19];
      }
      id v16 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
  v21 = [(CKKSControlCLI *)self control];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100004704;
  v30[3] = &unk_10000C380;
  v32 = &v41;
  obj = v20;
  v31 = obj;
  [v21 modifyTLKSharesForSEView:v26 adding:v9 deleting:v15 reply:v30];

  dispatch_time_t v22 = dispatch_time(0, 150000000000);
  if (dispatch_semaphore_wait(obj, v22))
  {
    puts("\n\nError: timed out waiting for response");
    v23 = secLogObjForScope();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Timed out waiting for modifySEZone response", buf, 2u);
    }

    int v24 = -1;
  }
  else
  {
    int v24 = *((_DWORD *)v42 + 6);
  }

LABEL_25:
LABEL_26:

  _Block_object_dispose(&v41, 8);
  return v24;
}

- (int)fetchSEView:(id)a3 json:(BOOL)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  dispatch_semaphore_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 1;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = [(CKKSControlCLI *)self control];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000493C;
  v15[3] = &unk_10000C3F8;
  BOOL v18 = a4;
  uint64_t v17 = &v19;
  v9 = v7;
  id v16 = v9;
  [v8 fetchSEViewKeyHierarchy:v6 reply:v15];

  dispatch_time_t v10 = dispatch_time(0, 150000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    puts("\n\nError: timed out waiting for response");
    id v11 = secLogObjForScope();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Timed out waiting for fetchSEView response", v14, 2u);
    }

    int v12 = -1;
  }
  else
  {
    int v12 = *((_DWORD *)v20 + 6);
  }

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (int)proposeSETLK:(id)a3 tlkJson:(id)a4 oldTlkJson:(id)a5 tlkShareJsonStrings:(id)a6
{
  id v25 = a3;
  id v10 = a4;
  id v27 = a5;
  id v26 = a6;
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x2020000000;
  int v39 = 1;
  id v11 = [(CKKSControlCLI *)self parseJSON:objc_opt_class() name:@"TLK" json:v10];
  if (!v11) {
    goto LABEL_4;
  }
  if (v27)
  {
    int v24 = [(CKKSControlCLI *)self parseJSON:objc_opt_class() name:@"old TLK" json:v27];
    if (!v24)
    {
LABEL_4:
      int v12 = 1;
      goto LABEL_22;
    }
  }
  else
  {
    int v24 = 0;
  }
  v13 = +[NSMutableArray array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v14 = v26;
  id v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v33;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v14);
        }
        BOOL v18 = [(CKKSControlCLI *)self parseJSON:objc_opt_class() name:@"TLKShare" json:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        if (!v18)
        {
          int v12 = 1;
          goto LABEL_21;
        }
        [v13 addObject:v18];
      }
      id v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v20 = [(CKKSControlCLI *)self control];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100005838;
  v29[3] = &unk_10000C380;
  v31 = &v36;
  uint64_t v14 = v19;
  v30 = v14;
  [v20 proposeTLKForSEView:v25 proposedTLK:v11 wrappedOldTLK:0 tlkShares:v13 reply:v29];

  dispatch_time_t v21 = dispatch_time(0, 150000000000);
  if (dispatch_semaphore_wait(v14, v21))
  {
    puts("\n\nError: timed out waiting for response");
    int v22 = secLogObjForScope();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Timed out waiting for proposeSETLK response", buf, 2u);
    }

    int v12 = -1;
  }
  else
  {
    int v12 = *((_DWORD *)v37 + 6);
  }

LABEL_21:
LABEL_22:

  _Block_object_dispose(&v36, 8);
  return v12;
}

- (id)parseJSON:(Class)a3 name:(id)a4 json:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [v8 dataUsingEncoding:4];
  id v21 = 0;
  id v10 = +[NSJSONSerialization JSONObjectWithData:v9 options:0 error:&v21];
  id v11 = v21;

  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    id v20 = 0;
    id v15 = [(objc_class *)a3 parseFromJSONDict:v10 error:&v20];
    id v11 = v20;
    if (v15)
    {
      id v14 = v15;
      uint64_t v16 = v14;
      goto LABEL_10;
    }
    uint64_t v17 = (const char *)[v7 UTF8String];
    id v18 = [v11 description];
    printf("Unable to parse %s from JSON: %s\n", v17, (const char *)[v18 UTF8String]);

    printf("JSON: %s\n", (const char *)[v8 UTF8String]);
    id v14 = 0;
  }
  else
  {
    v13 = (const char *)[v7 UTF8String];
    id v14 = [v11 description];
    printf("Unable to parse %s as JSON: %s\n", v13, (const char *)[v14 UTF8String]);
  }
  uint64_t v16 = 0;
LABEL_10:

  return v16;
}

- (int64_t)ckmetric
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(CKKSControlCLI *)self control];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005BFC;
  v11[3] = &unk_10000C380;
  v13 = &v14;
  dispatch_semaphore_t v5 = v3;
  BOOL v12 = v5;
  [v4 rpcCKMetric:@"testMetric" attributes:&off_10000CD68 reply:v11];

  dispatch_time_t v6 = dispatch_time(0, 65000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    puts("\n\nError: timed out waiting for response");
    id v7 = secLogObjForScope();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Timed out waiting for ckmetric response", v10, 2u);
    }

    int64_t v8 = -1;
  }
  else
  {
    int64_t v8 = v15[3];
  }

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (int64_t)push:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  dispatch_time_t v6 = [(CKKSControlCLI *)self control];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005E4C;
  v13[3] = &unk_10000C380;
  id v15 = &v16;
  id v7 = v5;
  uint64_t v14 = v7;
  [v6 rpcPushOutgoingChanges:v4 reply:v13];

  dispatch_time_t v8 = dispatch_time(0, 150000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    puts("\n\nError: timed out waiting for response");
    v9 = secLogObjForScope();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Timed out waiting for push response", v12, 2u);
    }

    int64_t v10 = -1;
  }
  else
  {
    int64_t v10 = v17[3];
  }

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (int64_t)fetch:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  dispatch_time_t v6 = [(CKKSControlCLI *)self control];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000609C;
  v13[3] = &unk_10000C380;
  id v15 = &v16;
  id v7 = v5;
  uint64_t v14 = v7;
  [v6 rpcFetchAndProcessChanges:v4 reply:v13];

  dispatch_time_t v8 = dispatch_time(0, 150000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    puts("\n\nError: timed out waiting for response");
    v9 = secLogObjForScope();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Timed out waiting for fetch response", v12, 2u);
    }

    int64_t v10 = -1;
  }
  else
  {
    int64_t v10 = v17[3];
  }

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (void)printHumanReadableStatus:(id)a3 shortenOutput:(BOOL)a4
{
  id v6 = a3;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  dispatch_time_t v8 = [(CKKSControlCLI *)self control];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000629C;
  v13[3] = &unk_10000C3D0;
  BOOL v15 = a4;
  v9 = v7;
  uint64_t v14 = v9;
  [v8 rpcStatus:v6 reply:v13];

  dispatch_time_t v10 = dispatch_time(0, 45000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    puts("\n\nError: timed out waiting for response");
    id v11 = secLogObjForScope();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Timed out waiting for status response", v12, 2u);
    }
  }
}

- (id)fetchStatus:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v7 = [(CKKSControlCLI *)self control];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100007E30;
  v16[3] = &unk_10000C3A8;
  id v8 = v5;
  id v17 = v8;
  v9 = v6;
  uint64_t v18 = v9;
  [v7 rpcStatus:v4 reply:v16];

  dispatch_time_t v10 = dispatch_time(0, 45000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    [v8 setObject:@"timed out" forKeyedSubscript:@"error"];
    id v11 = secLogObjForScope();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Timed out waiting for status response", (uint8_t *)v15, 2u);
    }
  }
  BOOL v12 = v18;
  id v13 = v8;

  return v13;
}

- (int64_t)resync:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  if (v4)
  {
    id v6 = [v4 description];
    printf("Beginning resync for %s...\n", (const char *)[v6 UTF8String]);
  }
  else
  {
    printf("Beginning resync for %s...\n", "all zones");
  }
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = [(CKKSControlCLI *)self control];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000081B8;
  v15[3] = &unk_10000C380;
  id v17 = &v18;
  v9 = v7;
  uint64_t v16 = v9;
  [v8 rpcResync:v5 reply:v15];

  dispatch_time_t v10 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    puts("\n\nError: timed out waiting for response");
    id v11 = secLogObjForScope();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Timed out waiting for resync response", buf, 2u);
    }

    int64_t v12 = -1;
  }
  else
  {
    int64_t v12 = v19[3];
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (int64_t)resetCloudKit:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  if (v4)
  {
    id v6 = [v4 description];
    printf("Beginning CloudKit reset for %s...\n", (const char *)[v6 UTF8String]);
  }
  else
  {
    printf("Beginning CloudKit reset for %s...\n", "all CKKS-managed zones");
  }
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = [(CKKSControlCLI *)self control];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008438;
  v15[3] = &unk_10000C380;
  id v17 = &v18;
  v9 = v7;
  uint64_t v16 = v9;
  [v8 rpcResetCloudKit:v5 reason:@"ckksctl" reply:v15];

  dispatch_time_t v10 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    puts("\n\nError: timed out waiting for response");
    id v11 = secLogObjForScope();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Timed out waiting for reset-cloudkit response", buf, 2u);
    }

    int64_t v12 = -1;
  }
  else
  {
    int64_t v12 = v19[3];
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (int64_t)resetLocal:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  if (v4)
  {
    id v6 = [v4 description];
    printf("Beginning local reset for %s...\n", (const char *)[v6 UTF8String]);
  }
  else
  {
    printf("Beginning local reset for %s...\n", "all zones");
  }
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  id v8 = [(CKKSControlCLI *)self control];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000086B0;
  v15[3] = &unk_10000C380;
  id v17 = &v18;
  v9 = v7;
  uint64_t v16 = v9;
  [v8 rpcResetLocal:v5 reply:v15];

  dispatch_time_t v10 = dispatch_time(0, 180000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    puts("\n\nError: timed out waiting for response");
    id v11 = secLogObjForScope();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Timed out waiting for reset-local response", buf, 2u);
    }

    int64_t v12 = -1;
  }
  else
  {
    int64_t v12 = v19[3];
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (id)fetchPerformanceCounters
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = [(CKKSControlCLI *)self control];
  int64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_100008864;
  BOOL v15 = &unk_10000C358;
  id v6 = v3;
  id v16 = v6;
  dispatch_semaphore_t v7 = v4;
  id v17 = v7;
  [v5 rpcPerformanceCounters:&v12];

  dispatch_time_t v8 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v7, v8)) {
    [v6 setObject:@"timed out waiting for response" forKeyedSubscript:@"error" v12, v13, v14, v15, v16];
  }
  v9 = v17;
  id v10 = v6;

  return v10;
}

- (CKKSControlCLI)initWithCKKSControl:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSControlCLI;
  id v6 = [(CKKSControlCLI *)&v9 init];
  dispatch_semaphore_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_control, a3);
  }

  return v7;
}

@end
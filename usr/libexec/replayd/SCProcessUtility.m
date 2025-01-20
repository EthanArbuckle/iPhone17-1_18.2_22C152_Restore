@interface SCProcessUtility
+ (BOOL)isProcessRunning:(int)a3;
+ (BOOL)isResponsibleProcessEntitledForAuditToken:(id *)a3 entitlement:(id)a4;
+ (BOOL)isValidProcessId:(int)a3;
+ (id)applicationProcessIdListForProcessId:(int)a3 hostProcessIdentifier:(int *)a4;
+ (id)getHostedPidsForPid:(int)a3;
+ (id)hostApplicationWithAuditToken:(id *)a3 bundleID:(id)a4;
+ (id)listAllRunningProcesses:(id)a3;
+ (id)listOfProcessesMatchingSameParentPid:(int)a3 withProcessList:(id)a4;
+ (int)avcdProcessId;
+ (int)parentProcessIdForProcessId:(int)a3;
@end

@implementation SCProcessUtility

+ (id)hostApplicationWithAuditToken:(id *)a3 bundleID:(id)a4
{
  id v4 = a4;

  return v4;
}

+ (id)applicationProcessIdListForProcessId:(int)a3 hostProcessIdentifier:(int *)a4
{
  uint64_t v4 = *(void *)&a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v36 = "+[SCProcessUtility applicationProcessIdListForProcessId:hostProcessIdentifier:]";
    __int16 v37 = 1024;
    int v38 = 57;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  p_info = RPExtensionHostContext.info;
  v6 = +[SCProcessUtility listAllRunningProcesses:0];
  v7 = +[NSNumber numberWithInt:v4];
  id v34 = 0;
  v8 = +[RBSProcessHandle handleForIdentifier:v7 error:&v34];
  id v9 = v34;
  v10 = [v8 hostProcess];
  id v11 = [v10 pid];

  unsigned int v12 = +[SCProcessUtility isValidProcessId:v11];
  if (v12)
  {
    id v32 = v9;
    v13 = v6;
    v14 = +[SCProcessUtility getHostedPidsForPid:v4];
    id v15 = [v14 mutableCopy];

    v16 = +[NSNumber numberWithInt:v11];
    [v15 addObject:v16];
    id v17 = 0;
    int v18 = 0;
    LODWORD(v19) = v11;
  }
  else
  {
    uint64_t v19 = +[SCProcessUtility parentProcessIdForProcessId:v4];
    if (!+[SCProcessUtility isValidProcessId:v19])
    {
      id v17 = 0;
      id v15 = 0;
      int v21 = 0;
      goto LABEL_10;
    }
    id v32 = v9;
    v13 = v6;
    v20 = +[SCProcessUtility listOfProcessesMatchingSameParentPid:v19 withProcessList:v6];
    id v17 = [v20 mutableCopy];

    v16 = +[NSNumber numberWithInt:v19];
    [v17 addObject:v16];
    id v15 = 0;
    int v18 = v19;
  }
  int v21 = v12 ^ 1;

  id v9 = v32;
  *a4 = v19;
  LODWORD(v19) = v18;
  v6 = v13;
  p_info = (__objc2_class_ro **)(RPExtensionHostContext + 32);
LABEL_10:
  if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    v36 = "+[SCProcessUtility applicationProcessIdListForProcessId:hostProcessIdentifier:]";
    __int16 v37 = 1024;
    int v38 = 84;
    __int16 v39 = 1024;
    int v40 = v4;
    __int16 v41 = 1024;
    *(_DWORD *)v42 = v11;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v19;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d processId=%d hostPid=%d parentPid=%d", buf, 0x24u);
  }
  if (((v12 | v21) & 1) == 0 && [p_info + 31 isValidProcessId:v4])
  {
    v22 = [p_info + 31 getHostedPidsForPid:v4];
    id v23 = [v22 mutableCopy];

    v24 = [p_info + 31 listOfProcessesMatchingSameParentPid:v4 withProcessList:v6];
    id v25 = [v24 mutableCopy];

    v26 = +[NSNumber numberWithInt:v4];
    [v25 addObject:v26];

    *a4 = v4;
    id v17 = v25;
    id v15 = v23;
  }
  v27 = [v17 arrayByAddingObjectsFromArray:v15];
  id v28 = [v27 mutableCopy];

  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v36 = "+[SCProcessUtility applicationProcessIdListForProcessId:hostProcessIdentifier:]";
    __int16 v37 = 1024;
    int v38 = 95;
    __int16 v39 = 1024;
    int v40 = v4;
    __int16 v41 = 2112;
    *(void *)v42 = v28;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d processId=%d has relatedPids=%@", buf, 0x22u);
  }
  v29 = +[NSSet setWithArray:v28];
  v30 = [v29 allObjects];

  return v30;
}

+ (id)getHostedPidsForPid:(int)a3
{
  return +[NSMutableArray array];
}

+ (int)parentProcessIdForProcessId:(int)a3
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 136446466;
    *(void *)((char *)buf + 4) = "+[SCProcessUtility parentProcessIdForProcessId:]";
    WORD6(buf[0]) = 1024;
    *(_DWORD *)((char *)buf + 14) = 117;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)buf, 0x12u);
  }
  memset(buf, 0, 512);
  size_t v8 = 648;
  *(void *)id v17 = 0xE00000001;
  int v18 = 1;
  int v19 = a3;
  int v4 = sysctl(v17, 4u, buf, &v8, 0, 0);
  if (v8) {
    BOOL v5 = v4 < 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    int v6 = 0;
  }
  else {
    int v6 = v21;
  }
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v9 = 136446978;
    v10 = "+[SCProcessUtility parentProcessIdForProcessId:]";
    __int16 v11 = 1024;
    int v12 = 126;
    __int16 v13 = 1024;
    int v14 = v6;
    __int16 v15 = 1024;
    int v16 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d parentPid=%d for processId=%d", v9, 0x1Eu);
  }
  return v6;
}

+ (id)listOfProcessesMatchingSameParentPid:(int)a3 withProcessList:(id)a4
{
  id v5 = a4;
  if (!v5)
  {
    id v5 = +[SCProcessUtility listAllRunningProcesses:0];
  }
  int v6 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([SCProcessUtility parentProcessIdForProcessId:v12] == a3) [v6 addObject:v12]; {
      }
        }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)listAllRunningProcesses:(id)a3
{
  id v3 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "+[SCProcessUtility listAllRunningProcesses:]";
    __int16 v21 = 1024;
    int v22 = 144;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  p_info = RPExtensionHostContext.info;
  if (!dword_100099DB8)
  {
    *(void *)buf = 4;
    *(void *)v29 = 0x800000001;
    if (sysctl(v29, 2u, &dword_100099DB8, (size_t *)buf, 0, 0) == -1) {
      dword_100099DB8 = 4096;
    }
  }
  id v5 = +[NSMutableArray array];
  int v28 = 0;
  *(void *)v27 = 0xE00000001;
  size_t size = 0;
  if (sysctl(v27, 3u, 0, &size, 0, 0) < 0) {
    goto LABEL_25;
  }
  int v6 = (unsigned int *)malloc_type_malloc(size, 0x102955D9uLL);
  if (!v6) {
    goto LABEL_25;
  }
  id v7 = v6;
  if (sysctl(v27, 3u, v6, &size, 0, 0) < 0)
  {
    free(v7);
    goto LABEL_25;
  }
  int v18 = v7;
  if ((int)((int)size / 0x288uLL) < 1) {
    goto LABEL_21;
  }
  uint64_t v8 = ((int)size / 0x288uLL);
  id v9 = v7 + 10;
  while (1)
  {
    uint64_t v10 = *v9;
    if (v10) {
      break;
    }
LABEL_20:
    v9 += 162;
    if (!--v8) {
      goto LABEL_21;
    }
  }
  *(void *)buf = *((int *)p_info + 878);
  __int16 v11 = (char *)malloc_type_malloc(size, 0x6AC7A04DuLL);
  *(void *)id v25 = 0x3100000001;
  int v26 = v10;
  if (sysctl(v25, 3u, v11, (size_t *)buf, 0, 0))
  {
LABEL_19:
    free(v11);
    goto LABEL_20;
  }
  if (!v3)
  {
    long long v15 = +[NSNumber numberWithInt:v10];
    [v5 addObject:v15];
    goto LABEL_18;
  }
  int v12 = p_info;
  __int16 v13 = +[NSString stringWithCString:v11 + 4 encoding:4];
  long long v14 = [v13 lastPathComponent];
  long long v15 = [v14 stringByDeletingPathExtension];

  if (![v15 isEqualToString:v3])
  {
    p_info = v12;
LABEL_18:

    goto LABEL_19;
  }
  long long v17 = +[NSNumber numberWithInt:v10];
  [v5 addObject:v17];

  free(v11);
LABEL_21:
  free(v18);
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    *(void *)&uint8_t buf[4] = "+[SCProcessUtility listAllRunningProcesses:]";
    __int16 v21 = 1024;
    int v22 = 190;
    __int16 v23 = 2048;
    v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d process list obtained process=%p", buf, 0x1Cu);
  }
LABEL_25:

  return v5;
}

+ (int)avcdProcessId
{
  v2 = +[SCProcessUtility listAllRunningProcesses:@"avconferenced"];
  if ([v2 count])
  {
    id v3 = [v2 firstObject];
    int v4 = [v3 unsignedIntValue];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (BOOL)isValidProcessId:(int)a3
{
  return a3 > 1;
}

+ (BOOL)isResponsibleProcessEntitledForAuditToken:(id *)a3 entitlement:(id)a4
{
  return 0;
}

+ (BOOL)isProcessRunning:(int)a3
{
  id v3 = +[NSNumber numberWithInt:*(void *)&a3];
  uint64_t v8 = 0;
  int v4 = +[RBSProcessHandle handleForIdentifier:v3 error:&v8];

  if (v4)
  {
    id v5 = [v4 currentState];
    unsigned __int8 v6 = [v5 isRunning];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

@end
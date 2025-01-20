@interface MAAsset(SUS)
- (BOOL)isDownloading;
- (BOOL)isDownloadingOrInstalled;
- (BOOL)isInstalled;
- (id)isEmergencyUpdate;
- (uint64_t)cancelDownload;
- (uint64_t)cancelDownloadIfNecessary;
- (uint64_t)purge;
- (void)cleanupAsset;
@end

@implementation MAAsset(SUS)

- (BOOL)isDownloadingOrInstalled
{
  return (unint64_t)([a1 state] - 2) < 3;
}

- (BOOL)isDownloading
{
  return [a1 state] == 4;
}

- (BOOL)isInstalled
{
  return ([a1 state] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (id)isEmergencyUpdate
{
  id result = +[SUUtility currentProductBuild];
  if (result)
  {
    id v3 = result;
    id result = +[SUUtility currentProductVersion];
    if (result)
    {
      id v4 = result;
      id result = (id)[a1 attributes];
      if (result)
      {
        v5 = objc_msgSend((id)objc_msgSend(a1, "attributes"), "safeObjectForKey:ofClass:", @"LastEmergencyBuild", objc_opt_class());
        v6 = objc_msgSend((id)objc_msgSend(a1, "attributes"), "safeObjectForKey:ofClass:", @"LastEmergencyOSVersion", objc_opt_class());
        id result = 0;
        if (v5)
        {
          if (v6)
          {
            if ([v6 compare:v4 options:64] == -1) {
              return 0;
            }
            else {
              return (id)([v5 compare:v3 options:64] != -1);
            }
          }
        }
      }
    }
  }
  return result;
}

- (uint64_t)cancelDownloadIfNecessary
{
  uint64_t result = [a1 isDownloading];
  if (result)
  {
    return [a1 cancelDownload:&__block_literal_global_394];
  }
  return result;
}

- (void)cleanupAsset
{
  v2 = +[SUUtility taskQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__MAAsset_SUS__cleanupAsset__block_invoke;
  block[3] = &unk_26447CCB0;
  block[4] = a1;
  dispatch_async(v2, block);
}

- (uint64_t)cancelDownload
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__MAAsset_SUS__cancelDownload__block_invoke;
  v6[3] = &unk_26447CD20;
  v6[4] = v2;
  v6[5] = &v7;
  [a1 cancelDownload:v6];
  dispatch_time_t v3 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v2, v3);
  dispatch_release(v2);
  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (uint64_t)purge
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v2 = dispatch_semaphore_create(0);
  if ([a1 isInstalled])
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = (uint64_t)__21__MAAsset_SUS__purge__block_invoke;
    v13[3] = (uint64_t)&unk_26447CD20;
    v13[4] = (uint64_t)v2;
    v13[5] = (uint64_t)&v14;
    [a1 purge:v13];
    dispatch_time_t v10 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v2, v10);
  }
  else
  {
    SULogInfo(@"Failed to purge. Asset not installed", v3, v4, v5, v6, v7, v8, v9, v13[0]);
  }
  dispatch_release(v2);
  uint64_t v11 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v11;
}

@end
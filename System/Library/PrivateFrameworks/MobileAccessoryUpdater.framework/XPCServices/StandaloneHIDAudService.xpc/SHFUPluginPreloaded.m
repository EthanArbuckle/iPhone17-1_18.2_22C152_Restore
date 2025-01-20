@interface SHFUPluginPreloaded
- (SHFUPluginPreloaded)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6 deviceProperties:(id)a7;
- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4;
@end

@implementation SHFUPluginPreloaded

- (SHFUPluginPreloaded)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6 deviceProperties:(id)a7
{
  v8.receiver = self;
  v8.super_class = (Class)SHFUPluginPreloaded;
  return [(SHFUPlugin *)&v8 initWithDeviceClass:a3 delegate:a4 info:a5 options:a6 deviceProperties:a7];
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
  id v6 = a3;
  v7 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100018154((uint64_t)v6, a4, v7);
  }

  id v40 = 0;
  objc_super v8 = [(SHFUPlugin *)self getPreloadedFWVersions:&v40];
  id v9 = v40;
  [(SHFUPlugin *)self setLatestFirmwareVersions:v8];

  if (v9)
  {
    id v10 = 0;
LABEL_6:
    uint64_t v18 = 0;
    goto LABEL_7;
  }
  v11 = [(SHFUPlugin *)self delegate];
  v12 = [(SHFUPlugin *)self batteryCheckDevice];
  id v13 = [v12 BOOLValue];
  v14 = [(SHFUPlugin *)self logHandle];
  v15 = [(SHFUPlugin *)self options];
  v16 = [v15 objectForKeyedSubscript:@"IOMatchLaunchServiceID"];
  v17 = [(SHFUPlugin *)self errorDomain];
  id v39 = 0;
  id v10 = +[SHFUDevice getDevices:v11 hasPowerSource:v13 logHandle:v14 registryEntryID:v16 errorDomain:v17 error:&v39];
  id v9 = v39;

  if (v9) {
    goto LABEL_6;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = v10;
  id v24 = [v10 countByEnumeratingWithState:&v35 objects:v53 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v36;
    while (2)
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(v10);
        }
        v28 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ([(SHFUPlugin *)self deviceNeedsUpdate:v28])
        {
          id v9 = 0;
          uint64_t v18 = 1;
          goto LABEL_28;
        }
        v29 = [(SHFUPlugin *)self latestFirmwareVersions];
        unsigned __int8 v30 = [v28 hardwareVersionSupportedBy:v29];

        if ((v30 & 1) == 0)
        {
          v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Device has HW revision ID %u which does not match FW files", [v28 hardwareVersion]);
          id v32 = objc_alloc((Class)NSError);
          v33 = [(SHFUPlugin *)self errorDomain];
          NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
          v52 = v31;
          v34 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
          id v9 = [v32 initWithDomain:v33 code:44 userInfo:v34];

          uint64_t v18 = 0;
          goto LABEL_28;
        }
      }
      id v25 = [v10 countByEnumeratingWithState:&v35 objects:v53 count:16];
      uint64_t v18 = 0;
      id v9 = 0;
      if (v25) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v18 = 0;
    id v9 = 0;
  }
LABEL_28:

LABEL_7:
  v19 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = [(SHFUPlugin *)self targetDevice];
    *(_DWORD *)buf = 138413314;
    v42 = v20;
    __int16 v43 = 1024;
    BOOL v44 = v9 == 0;
    __int16 v45 = 1024;
    int v46 = v18;
    __int16 v47 = 1024;
    int v48 = 0;
    __int16 v49 = 2112;
    id v50 = v9;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "findFirmware: target device %@ successful %d updateAvailable %d needsDownload %d error %@", buf, 0x28u);
  }
  v21 = [(SHFUPlugin *)self delegate];
  v22 = [(SHFUPlugin *)self pluginInfo];
  if (v9) {
    char v23 = 0;
  }
  else {
    char v23 = v18;
  }
  [v21 didFind:v9 == 0 info:v22 updateAvailable:v18 needsDownload:0 error:v9];

  if ((v23 & 1) == 0)
  {
    [(SHFUPlugin *)self setError:v9];
    [(SHFUPlugin *)self setTransaction:0];
    [(SHFUPlugin *)self setSerialQueue:0];
  }
}

@end
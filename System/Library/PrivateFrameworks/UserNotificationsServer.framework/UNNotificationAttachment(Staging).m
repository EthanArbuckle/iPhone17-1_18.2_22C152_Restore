@interface UNNotificationAttachment(Staging)
+ (id)_systemDirectoryURL;
+ (uint64_t)stagingActionForFileHandle:()Staging fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:servicingBundleIdentifier:error:;
@end

@implementation UNNotificationAttachment(Staging)

+ (id)_systemDirectoryURL
{
  if (_systemDirectoryURL_onceToken != -1) {
    dispatch_once(&_systemDirectoryURL_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)_systemDirectoryURL___systemDirectoryURL;
  return v0;
}

+ (uint64_t)stagingActionForFileHandle:()Staging fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:servicingBundleIdentifier:error:
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v11 = a3;
  unint64_t v12 = a4;
  unint64_t v13 = a5;
  v14 = a6;
  v15 = objc_msgSend(v11, "unc_secureFileURL");
  if (v12 | v13)
  {
    v18 = [MEMORY[0x263F08850] defaultManager];
    if (v12)
    {
      objc_msgSend((id)v12, "uns_clientBundleProxy");
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v19 = (id)v13;
    }
    v20 = v19;
    v21 = [v19 bundleURL];
    if (v15)
    {
      uint64_t v62 = 2;
      [v18 getRelationship:&v62 ofDirectoryAtURL:v21 toItemAtURL:v15 error:0];
      if (!v62) {
        goto LABEL_35;
      }
      uint64_t v22 = [v20 dataContainerURL];
      if (v22)
      {
        v23 = (void *)v22;
        *(void *)buf = 2;
        [v18 getRelationship:buf ofDirectoryAtURL:v22 toItemAtURL:v15 error:0];
        if (*(void *)buf)
        {
          v48 = a7;
          v49 = v23;
          os_log_t log = v14;
          v53 = v21;
          v24 = [v20 groupContainerURLs];
          v25 = [v24 allValues];

          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v26 = v25;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v56 objects:v63 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v57;
            while (2)
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v57 != v29) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v31 = *(void *)(*((void *)&v56 + 1) + 8 * i);
                *(void *)&long long v60 = 2;
                [v18 getRelationship:&v60 ofDirectoryAtURL:v31 toItemAtURL:v15 error:0];
                if (!(void)v60)
                {

                  uint64_t v17 = 1;
                  v14 = log;
                  v21 = v53;
                  goto LABEL_43;
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v56 objects:v63 count:16];
              if (v28) {
                continue;
              }
              break;
            }
          }

          v21 = v53;
          if (v48)
          {
            objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNErrorCode:userInfo:", 100, 0);
            void *v48 = (id)objc_claimAutoreleasedReturnValue();
          }

          uint64_t v17 = 0;
          v14 = log;
          goto LABEL_43;
        }

        goto LABEL_35;
      }
      long long v60 = 0u;
      long long v61 = 0u;
      v32 = objc_msgSend((id)v12, "uns_clientAuditToken");
      v33 = v32;
      if (v32)
      {
        [v32 realToken];
      }
      else
      {
        long long v60 = 0u;
        long long v61 = 0u;
      }

      if (v12)
      {
        [v11 fileDescriptor];
        *(_OWORD *)buf = v60;
        *(_OWORD *)&buf[16] = v61;
        if (!sandbox_check_by_audit_token())
        {
LABEL_35:
          uint64_t v17 = 1;
LABEL_43:

          goto LABEL_44;
        }
      }
      if (v13)
      {
        [(id)v12 processIdentifier];
        uint64_t v34 = BSBundlePathForPID();
        v35 = (void *)v34;
        v36 = @"<unknown executable>";
        if (v34) {
          v36 = (__CFString *)v34;
        }
        v37 = v36;

        v38 = (void *)*MEMORY[0x263F1DFF8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_FAULT))
        {
          v39 = v38;
          [v15 absoluteString];
          v40 = v54 = v21;
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v54;
          *(_WORD *)&buf[22] = 2114;
          *(void *)&buf[24] = v40;
          _os_log_fault_impl(&dword_22289A000, v39, OS_LOG_TYPE_FAULT, "[System Notification Source] Copying not moving attachment to prevent notification service extension from effectively deleting this file it doesn't have access to. Connection process '%{public}@', Posting of behalf of notification source: '%{public}@', Attachment: '%{public}@'", buf, 0x20u);

          v21 = v54;
        }
      }
      else
      {
        v55 = v21;
        v41 = [MEMORY[0x263F08D68] currentConnection];
        [v41 processIdentifier];
        uint64_t v42 = BSBundlePathForPID();
        v43 = (void *)v42;
        v44 = @"<unknown executable>";
        if (v42) {
          v44 = (__CFString *)v42;
        }
        v37 = v44;

        v45 = (void *)*MEMORY[0x263F1DFF8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_FAULT))
        {
          loga = v45;
          v50 = [v20 bundleIdentifier];
          v47 = [v15 absoluteString];
          *(_DWORD *)buf = 138544130;
          *(void *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v50;
          *(_WORD *)&buf[22] = 2114;
          *(void *)&buf[24] = v47;
          __int16 v65 = 2114;
          v66 = v14;
          _os_log_fault_impl(&dword_22289A000, loga, OS_LOG_TYPE_FAULT, "[Notification Service Extension] Copying not moving attachment to prevent system process from effectively deleting this file it doesn't have access to. Push notification service connection '%{public}@'. Notification service extension for bundle: '%{public}@', Attachment: '%{public}@', Effective Notifications Bundle ID: '%{public}@'", buf, 0x2Au);
        }
        v21 = v55;
      }
    }
    uint64_t v17 = 0;
    goto LABEL_43;
  }
  v16 = (void *)*MEMORY[0x263F1DFF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_FAULT)) {
    +[UNNotificationAttachment(Staging) stagingActionForFileHandle:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:servicingBundleIdentifier:error:](v16, v15);
  }
  uint64_t v17 = 0;
LABEL_44:

  return v17;
}

+ (void)stagingActionForFileHandle:()Staging fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:servicingBundleIdentifier:error:.cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  v4 = [a2 absoluteString];
  int v5 = 138543362;
  v6 = v4;
  _os_log_fault_impl(&dword_22289A000, v3, OS_LOG_TYPE_FAULT, "Cannot stage attachment. Must provide either a connection or proxy, and not both. Attachment: '%{public}@'", (uint8_t *)&v5, 0xCu);
}

@end
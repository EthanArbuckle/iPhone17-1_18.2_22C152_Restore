@interface OSATasking
+ (BOOL)preference:(id)a3 alreadySetInInstructions:(id)a4;
+ (BOOL)shouldApplyPreference:(id)a3;
+ (id)applyTasking:(id)a3 taskId:(id)a4 fromBlob:(id)a5;
+ (id)getAvailableTaskingRoutings;
+ (id)getDefaultTasking;
+ (id)getInstalledTaskIds;
+ (id)normalizeInstructions:(id)a3;
+ (id)proxyTasking:(id)a3 taskId:(id)a4 usingConfig:(id)a5 fromBlob:(id)a6;
+ (id)selectConfigFromBlob:(id)a3 withError:(id *)a4;
+ (void)checkTaskingRelevance;
+ (void)setCRKeyToRandomValue;
@end

@implementation OSATasking

+ (id)proxyTasking:(id)a3 taskId:(id)a4 usingConfig:(id)a5 fromBlob:(id)a6
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = (__CFString *)a4;
  id v11 = a5;
  id v12 = a6;
  int v13 = [v12 length] != 0;
  if (v13 != [(__CFString *)v10 isEqualToString:@"-1"])
  {
    if ([v12 length])
    {
      if (v12)
      {
        int v14 = 0;
LABEL_9:
        if ([v9 isEqualToString:@"ca1"])
        {
          id v17 = v12;
          id v34 = 0;
          v44[0] = @"taskingID";
          v18 = v10;
          if ((v14 & 1) == 0) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }
        id v35 = 0;
        id v17 = [MEMORY[0x1E4F28F98] propertyListWithData:v12 options:0 format:0 error:&v35];
        id v19 = v35;
        v20 = v19;
        if (v17) {
          int v21 = 1;
        }
        else {
          int v21 = v14;
        }
        if (v21 == 1)
        {
          id v34 = v19;
          v44[0] = @"taskingID";
          v18 = v10;
          if (!v14) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v37 = v20;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Tasking blob was not encodable: %@", buf, 0xCu);
        }
        v22 = +[OSASystemConfiguration sharedInstance];
        int v23 = [v22 appleInternal];

        if (v23)
        {
          v24 = NSString;
          id v17 = [v11 identifier];
          v25 = [v24 stringWithFormat:@"/tmp/bad_%@_%@.blob", v17, v9];
          [v12 writeToFile:v25 atomically:1];
          v15 = (void *)MEMORY[0x1E4F1CC08];
LABEL_30:

LABEL_33:
          goto LABEL_34;
        }
LABEL_32:
        v15 = (void *)MEMORY[0x1E4F1CC08];
        goto LABEL_33;
      }
    }
    else
    {
      int v16 = [(__CFString *)v10 isEqualToString:@"-1"];
      int v14 = v16;
      if (v12) {
        goto LABEL_9;
      }
      if (v16)
      {
        id v17 = 0;
        id v34 = 0;
        v44[0] = @"taskingID";
        LOBYTE(v14) = 1;
LABEL_24:
        v18 = @"-1";
LABEL_25:
        v45[0] = v18;
        v44[1] = @"proxyingDeviceTimeAtReceipt";
        v26 = NSNumber;
        v27 = [MEMORY[0x1E4F1C9C8] date];
        [v27 timeIntervalSinceReferenceDate];
        v28 = objc_msgSend(v26, "numberWithDouble:");
        v45[1] = v28;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
        v25 = (void *)[v29 mutableCopy];

        if ((v14 & 1) == 0) {
          [v25 setObject:v17 forKeyedSubscript:@"payload"];
        }
        v30 = [v11 logPath];
        v31 = [NSString stringWithFormat:@"tasking.%@.proxy", v9];
        v32 = [v30 stringByAppendingPathComponent:v31];

        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v37 = v32;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "saving proxy tasking as %@", buf, 0xCu);
        }
        [v25 writeToFile:v32 atomically:1];
        v42[0] = @"action";
        v42[1] = @"taskId";
        v43[0] = @"staged";
        v43[1] = v10;
        v42[2] = @"blob";
        v43[2] = v32;
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:3];

        v20 = v34;
        goto LABEL_30;
      }
    }
    v20 = 0;
    goto LABEL_32;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v37 = v9;
    __int16 v38 = 2112;
    v39 = v10;
    __int16 v40 = 2048;
    uint64_t v41 = [v12 length];
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "proxy %@ taskId %@ with rawblob (%lu bytes) is inconsistent", buf, 0x20u);
  }
  v15 = (void *)MEMORY[0x1E4F1CC08];
LABEL_34:

  return v15;
}

+ (id)applyTasking:(id)a3 taskId:(id)a4 fromBlob:(id)a5
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v96 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x3032000000;
  v113 = __Block_byref_object_copy_;
  v114 = __Block_byref_object_dispose_;
  id v115 = (id)MEMORY[0x1E4F1CC08];
  id v95 = v8;
  uint64_t v9 = [v8 length];
  v94 = v7;
  if ((v9 != 0) != [v7 isEqualToString:@"-1"])
  {
    if ([v95 length]) {
      int v93 = 0;
    }
    else {
      int v93 = [v7 isEqualToString:@"-1"];
    }
    int v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [v95 length];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v96;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v146) = v16;
      WORD2(v146) = 1024;
      *(_DWORD *)((char *)&v146 + 6) = v93;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "applyTasking routing %@ id %@ length %d; untasked %d",
        buf,
        0x22u);
    }

    if ([v96 isEqualToString:@"da3"])
    {
      id v17 = (void *)MEMORY[0x1E4F1CBF0];
      if (v93)
      {
        v18 = 0;
        id v19 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        id v109 = 0;
        id v19 = selectConfigFromBlob((uint64_t)v95, &v109);
        id v29 = v109;
        v18 = v29;
        if (!v19)
        {
          if (v29)
          {
            v137 = @"error";
            v59 = [v29 localizedDescription];
            v138 = v59;
            uint64_t v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
            v61 = (void *)v111[5];
            v111[5] = v60;
          }
          else
          {
            v18 = (void *)v111[5];
            v111[5] = (uint64_t)&unk_1EFE25978;
          }
LABEL_31:

          goto LABEL_85;
        }
      }
      uint64_t v30 = +[OSATasking getDefaultTasking];
      if (v30) {
        v31 = (void *)v30;
      }
      else {
        v31 = v17;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        +[OSATasking applyTasking:taskId:fromBlob:]((uint64_t)v31, v32, v33);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        +[OSATasking applyTasking:taskId:fromBlob:]((uint64_t)v19, v34, v35);
      }
      v36 = [v31 arrayByAddingObjectsFromArray:v19];
      id v37 = +[OSATasking normalizeInstructions:v36];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        +[OSATasking applyTasking:taskId:fromBlob:]((uint64_t)v37, v38, v39);
      }
      v140[0] = v7;
      v139[0] = @"TaskingID";
      v139[1] = @"TaskingOS";
      __int16 v40 = +[OSASystemConfiguration sharedInstance];
      uint64_t v41 = [v40 buildVersion];
      v139[2] = @"TaskingPayload";
      v140[1] = v41;
      v140[2] = v37;
      v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v140 forKeys:v139 count:3];

      v105[0] = MEMORY[0x1E4F143A8];
      v105[1] = 3221225472;
      v105[2] = __43__OSATasking_applyTasking_taskId_fromBlob___block_invoke;
      v105[3] = &unk_1E5D1F938;
      id v43 = v42;
      id v106 = v43;
      v108 = &v110;
      id v107 = v94;
      __43__OSATasking_applyTasking_taskId_fromBlob___block_invoke(v105);

      goto LABEL_31;
    }
    if ([v96 isEqualToString:@"ca1"])
    {
      *(void *)&long long v117 = 0;
      *((void *)&v117 + 1) = &v117;
      *(void *)&long long v118 = 0x2020000000;
      BYTE8(v118) = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      *(void *)&long long v146 = __Block_byref_object_copy_;
      *((void *)&v146 + 1) = __Block_byref_object_dispose_;
      id v147 = 0;
      v20 = +[OSASystemConfiguration sharedInstance];
      int v21 = [v20 pathCATasking];
      v22 = [v21 stringByAppendingPathComponent:@"taskedConfig.json"];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v141 = 138543362;
        v142 = v22;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "The location of the CA taskedConfig is %{public}@", v141, 0xCu);
      }
      if (v22)
      {
        if (v93)
        {
          int v23 = [MEMORY[0x1E4F28CB8] defaultManager];
          int v24 = [v23 fileExistsAtPath:v22];

          if (v24)
          {
            v25 = [MEMORY[0x1E4F28CB8] defaultManager];
            uint64_t v26 = *(void *)&buf[8];
            id obj = *(id *)(*(void *)&buf[8] + 40);
            char v27 = [v25 removeItemAtPath:v22 error:&obj];
            objc_storeStrong((id *)(v26 + 40), obj);
            *(unsigned char *)(*((void *)&v117 + 1) + 24) = v27;

            v28 = v22;
            v22 = @"untasked";
          }
          else
          {
            v135[0] = @"action";
            v135[1] = @"taskId";
            v136[0] = @"n/a";
            v136[1] = v94;
            uint64_t v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v136 forKeys:v135 count:2];
            v28 = (__CFString *)v111[5];
            v111[5] = v65;
          }
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v141 = 138412290;
            v142 = v22;
            _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "saving ca1 tasking as %@", v141, 0xCu);
          }
          v99[0] = MEMORY[0x1E4F143A8];
          v99[1] = 3221225472;
          v99[2] = __43__OSATasking_applyTasking_taskId_fromBlob___block_invoke_101;
          v99[3] = &unk_1E5D1F960;
          v102 = &v117;
          v100 = (__CFString *)v95;
          v22 = v22;
          v101 = v22;
          v103 = buf;
          __43__OSATasking_applyTasking_taskId_fromBlob___block_invoke_101(v99);

          v28 = v100;
        }
      }
      if (*(unsigned char *)(*((void *)&v117 + 1) + 24))
      {
        v133[0] = @"action";
        v133[1] = @"taskId";
        v134[0] = @"saved";
        v134[1] = v94;
        v133[2] = @"blob";
        v134[2] = v22;
        uint64_t v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v134 forKeys:v133 count:3];
        v67 = (void *)v111[5];
        v111[5] = v66;

        v131[0] = @"TaskingID";
        v131[1] = @"savedAs";
        v132[0] = v94;
        v132[1] = v22;
        v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v132 forKeys:v131 count:2];
        v69 = +[OSASystemConfiguration sharedInstance];
        [v69 setPrefsKey:@"CATaskingID" value:v68 forDomain:@"com.apple.OTACrashCopier" withSync:1];

        AnalyticsNotifyTaskingAvailable();
      }
      else
      {
        if (v111[5]) {
          goto LABEL_65;
        }
        v129 = @"error";
        uint64_t v70 = *(void *)(*(void *)&buf[8] + 40);
        if (v70)
        {
          v68 = [*(id *)(*(void *)&buf[8] + 40) localizedDescription];
        }
        else
        {
          v68 = @"unknown failure to apply ca1 tasking";
        }
        v130 = v68;
        uint64_t v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v130 forKeys:&v129 count:1];
        v87 = (void *)v111[5];
        v111[5] = v86;

        if (!v70) {
          goto LABEL_65;
        }
      }

LABEL_65:
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v117, 8);
      goto LABEL_85;
    }
    if (![v96 isEqualToString:@"awd"]) {
      __assert_rtn("+[OSATasking applyTasking:taskId:fromBlob:]", "OSATasking.m", 409, "0 && \"Unsupported routing used in tasking\"");
    }
    if (v93)
    {
      v89 = 0;
      v90 = 0;
    }
    else
    {
      id v98 = 0;
      uint64_t v44 = selectConfigFromBlob((uint64_t)v95, &v98);
      id v45 = v98;
      v89 = (void *)v44;
      if (!v44)
      {
        if (v45)
        {
          v121 = @"error";
          v91 = v45;
          v62 = [v45 localizedDescription];
          v122 = v62;
          uint64_t v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v122 forKeys:&v121 count:1];
          v64 = (void *)v111[5];
          v111[5] = v63;

          goto LABEL_85;
        }
        v90 = (void *)v111[5];
        v111[5] = (uint64_t)&unk_1EFE259F0;
        goto LABEL_84;
      }
      v90 = v45;
    }
    v46 = +[OSASystemConfiguration sharedInstance];
    v47 = [v46 pathAWDTasking];
    v48 = [v47 stringByAppendingPathComponent:v96];
    v92 = [v48 stringByAppendingPathExtension:@"plist"];

    if (!v92) {
      goto LABEL_77;
    }
    v88 = v92;
    v49 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithContentsOfFile:");
    if (isConfigValid(v49))
    {
      v50 = [MEMORY[0x1E4F83920] sharedClient];
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      id v97 = v49;
      uint64_t v51 = [v97 countByEnumeratingWithState:&v117 objects:buf count:16];
      if (v51)
      {
        uint64_t v52 = *(void *)v118;
        char v53 = 1;
        do
        {
          for (uint64_t i = 0; i != v51; ++i)
          {
            if (*(void *)v118 != v52) {
              objc_enumerationMutation(v97);
            }
            v55 = *(void **)(*((void *)&v117 + 1) + 8 * i);
            v56 = [v55 objectForKey:@"Key"];
            v57 = [v55 objectForKey:@"User"];
            v58 = [v55 objectForKey:@"Domain"];
            if (([v50 deletePreference:v56 forUser:v57 inDomain:v58] & 1) == 0)
            {
              char v53 = 0;
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v141 = 138412546;
                v142 = v58;
                __int16 v143 = 2112;
                id v144 = v56;
                _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Could not delete preference for domain,key: %@, %@", v141, 0x16u);
                char v53 = 0;
              }
            }
          }
          uint64_t v51 = [v97 countByEnumeratingWithState:&v117 objects:buf count:16];
        }
        while (v51);

        if ((v53 & 1) == 0)
        {

LABEL_77:
          v74 = v111;
          v75 = (void *)v111[5];
          v76 = &unk_1EFE259C8;
          goto LABEL_78;
        }
      }
      else
      {

        char v53 = 1;
      }
      v71 = [MEMORY[0x1E4F28CB8] defaultManager];
      if ([v71 fileExistsAtPath:v88])
      {
        id v116 = 0;
        char v72 = [v71 removeItemAtPath:v88 error:&v116];
        id v73 = v116;
        if ((v72 & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v141 = 138412546;
            v142 = v88;
            __int16 v143 = 2112;
            id v144 = v73;
            _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Couldn't delete file for awd task at %@: %@", v141, 0x16u);
          }
          char v53 = 0;
        }
      }
      else
      {
        id v73 = 0;
      }

      if ((v53 & 1) == 0) {
        goto LABEL_77;
      }
    }
    else
    {
    }
    if (v93)
    {
      v127[0] = @"action";
      v127[1] = @"taskId";
      v128[0] = @"n/a";
      v128[1] = v94;
      uint64_t v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v128 forKeys:v127 count:2];
      v75 = (void *)v111[5];
      v111[5] = v77;
      goto LABEL_83;
    }
    if (installAwdTasking(v89, v88))
    {
      v125[0] = @"action";
      v125[1] = @"taskId";
      v126[0] = @"installed";
      v126[1] = v94;
      v125[2] = @"blob";
      v126[2] = v88;
      uint64_t v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v126 forKeys:v125 count:3];
      v79 = (void *)v111[5];
      v111[5] = v78;

      v123[0] = @"TaskingID";
      v123[1] = @"TaskingOS";
      v124[0] = v94;
      v80 = +[OSASystemConfiguration sharedInstance];
      v81 = [v80 buildVersion];
      v124[1] = v81;
      v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v124 forKeys:v123 count:2];

      v82 = +[OSASystemConfiguration sharedInstance];
      [v82 setPrefsKey:@"AWDTaskingID" value:v75 forDomain:@"com.apple.OTACrashCopier" withSync:1];

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"logging tasks have changed", 0, 0, 0);
      goto LABEL_83;
    }
    v74 = v111;
    v75 = (void *)v111[5];
    v76 = &unk_1EFE259A0;
LABEL_78:
    v74[5] = (uint64_t)v76;
LABEL_83:

LABEL_84:
    goto LABEL_85;
  }
  v10 = (void *)v111[5];
  v111[5] = (uint64_t)&unk_1EFE25A18;

  id v11 = MEMORY[0x1E4F14500];
  id v12 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v95 length];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v96;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&long long v146 = v13;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@ taskId %@ with rawblob (%lu bytes) is inconsistent", buf, 0x20u);
  }

LABEL_85:
  id v84 = (id)v111[5];
  _Block_object_dispose(&v110, 8);

  return v84;
}

void __43__OSATasking_applyTasking_taskId_fromBlob___block_invoke(void *a1)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v2 = +[OSASystemConfiguration sharedInstance];
  int v3 = [v2 setPrefsKey:@"ScheduledTasking" value:a1[4] forDomain:@"com.apple.OTACrashCopier" withSync:1];

  if (v3)
  {
    v14[0] = @"action";
    v14[1] = @"taskId";
    uint64_t v4 = a1[5];
    v15[0] = @"scheduled";
    v15[1] = v4;
    v14[2] = @"blob";
    v5 = [NSString stringWithFormat:@"defaults://%@/%@", @"com.apple.OTACrashCopier", @"ScheduledTasking"];
    v15[2] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
    uint64_t v7 = *(void *)(a1[6] + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = MEMORY[0x1E4F14500];
    v10 = "Saved da3 tasking for deferred installation";
  }
  else
  {
    uint64_t v11 = *(void *)(a1[6] + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = &unk_1EFE25950;

    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = MEMORY[0x1E4F14500];
    v10 = "deferring da3 task failed";
  }
  _os_log_impl(&dword_1A7C6D000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
}

void __43__OSATasking_applyTasking_taskId_fromBlob___block_invoke_101(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v2 writeToFile:v3 options:1 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

+ (void)checkTaskingRelevance
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = +[OSASystemConfiguration sharedInstance];
  uint64_t v3 = [v2 getPrefsKey:@"ScheduledTasking" forDomain:@"com.apple.OTACrashCopier" withOptions:0];

  uint64_t v4 = [v3 objectForKeyedSubscript:@"TaskingOS"];
  char v5 = +[OSASystemConfiguration sharedInstance];
  uint64_t v6 = [v5 buildVersion];
  char v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = +[OSASystemConfiguration sharedInstance];
      uint64_t v9 = [v8 buildVersion];
      int v11 = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      int v14 = v9;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "removing outdated da tasking (and restoring hotship) %@ -> %@", (uint8_t *)&v11, 0x16u);
    }
    id v10 = +[OSATasking applyTasking:@"da3" taskId:@"-1" fromBlob:0];
  }
}

+ (id)getInstalledTaskIds
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = +[OSASystemConfiguration sharedInstance];
  uint64_t v4 = [v3 getPrefsKey:@"ScheduledTasking" forDomain:@"com.apple.OTACrashCopier" withOptions:0];

  if (v4)
  {
    char v5 = [v4 objectForKeyedSubscript:@"TaskingID"];
    [v2 setObject:v5 forKeyedSubscript:@"da3"];
  }
  else
  {
    [v2 setObject:@"-1" forKeyedSubscript:@"da3"];
  }
  uint64_t v6 = +[OSASystemConfiguration sharedInstance];
  char v7 = [v6 getPrefsKey:@"AWDTaskingID" forDomain:@"com.apple.OTACrashCopier" withOptions:0];

  if (v7)
  {
    id v8 = [v7 objectForKeyedSubscript:@"TaskingID"];
    [v2 setObject:v8 forKeyedSubscript:@"awd"];
  }
  else
  {
    [v2 setObject:@"-1" forKeyedSubscript:@"awd"];
  }
  uint64_t v9 = +[OSASystemConfiguration sharedInstance];
  id v10 = [v9 getPrefsKey:@"CATaskingID" forDomain:@"com.apple.OTACrashCopier" withOptions:0];

  if (v10)
  {
    int v11 = [v10 objectForKeyedSubscript:@"TaskingID"];
    [v2 setObject:v11 forKeyedSubscript:@"ca1"];
  }
  else
  {
    [v2 setObject:@"-1" forKeyedSubscript:@"ca1"];
  }

  return v2;
}

+ (id)getAvailableTaskingRoutings
{
  return &unk_1EFE25DD8;
}

+ (BOOL)shouldApplyPreference:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"Sample"];
  if (!v3) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v3 count] != 2) {
    goto LABEL_6;
  }
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  unint64_t v5 = [v4 unsignedIntegerValue];

  uint64_t v6 = [v3 objectAtIndexedSubscript:1];
  unint64_t v7 = [v6 unsignedIntegerValue];

  if (!v7) {
    goto LABEL_15;
  }
  if (v7 == 1)
  {
LABEL_6:
    BOOL v8 = 1;
    goto LABEL_7;
  }
  if (v5 >= v7)
  {
LABEL_15:
    BOOL v8 = 0;
    goto LABEL_7;
  }
  uLong v10 = crc32(0, 0, 0);
  uLong v11 = crc32(v10, (const Bytef *)samplingKeyCString, 8u);
  unint64_t v12 = 0xFFFFFFFF / v7 * v5;
  BOOL v14 = v11 >= v12;
  unint64_t v13 = v11 - v12;
  BOOL v14 = !v14 || v13 >= 0xFFFFFFFF / v7;
  BOOL v8 = !v14;
LABEL_7:

  return v8;
}

+ (id)getDefaultTasking
{
  v2 = +[OSASystemConfiguration sharedInstance];
  if ([v2 appleInternal])
  {
    uint64_t v3 = @"/AppleInternal/Library/OSAnalytics/defaultTasking.plist";
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v3 = [v4 pathForResource:@"defaultTasking" ofType:@"plist"];
  }
  unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithContentsOfFile:v3];

  return v5;
}

+ (id)normalizeInstructions:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[OSASystemConfiguration sharedInstance];
  uint64_t v5 = [v4 crashReporterKey];
  uint64_t v6 = (void *)samplingKey;
  samplingKey = v5;

  if ([(id)samplingKey hasPrefix:@"baadbaadbaaadbaaaadbaadbaadbaaadbaaaad"])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      +[OSATasking normalizeInstructions:]();
    }
    +[OSATasking setCRKeyToRandomValue];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "samplingKey is good", buf, 2u);
    }
    samplingKeyCString = [(id)samplingKey UTF8String];
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v16 = v3;
  BOOL v8 = [v3 reverseObjectEnumerator];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    unint64_t v12 = MEMORY[0x1E4F14500];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (+[OSATasking shouldApplyPreference:v14])
        {
          if (+[OSATasking preference:v14 alreadySetInInstructions:v7])
          {
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
              +[OSATasking normalizeInstructions:&v24];
            }
          }
          else
          {
            [v7 insertObject:v14 atIndex:0];
          }
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          +[OSATasking normalizeInstructions:&v22];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (BOOL)preference:(id)a3 alreadySetInInstructions:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v23 = *(void *)v25;
    id v20 = v6;
    id v21 = v5;
    do
    {
      uint64_t v10 = 0;
      uint64_t v22 = v8;
      do
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
        unint64_t v12 = objc_msgSend(v5, "objectForKeyedSubscript:", @"User", v20, v21);
        unint64_t v13 = [v11 objectForKeyedSubscript:@"User"];
        if ([v12 isEqualToString:v13])
        {
          uint64_t v14 = [v5 objectForKeyedSubscript:@"Domain"];
          uint64_t v15 = [v11 objectForKeyedSubscript:@"Domain"];
          if ([v14 isEqualToString:v15])
          {
            int v16 = [v5 objectForKeyedSubscript:@"Key"];
            long long v17 = [v11 objectForKeyedSubscript:@"Key"];
            char v18 = [v16 isEqualToString:v17];

            id v6 = v20;
            id v5 = v21;
          }
          else
          {
            char v18 = 0;
          }

          uint64_t v8 = v22;
        }
        else
        {
          char v18 = 0;
        }

        v9 |= v18;
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

+ (id)selectConfigFromBlob:(id)a3 withError:(id *)a4
{
  return selectConfigFromBlob((uint64_t)a3, a4);
}

+ (void)setCRKeyToRandomValue
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  id v3 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v4 = [v3 UUIDString];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = [v2 stringWithFormat:@"%@%@", v4, v5];

  *(void *)md = 0;
  uint64_t v11 = 0;
  int v12 = 0;
  id v7 = v6;
  CC_SHA1((const void *)[v7 UTF8String], objc_msgSend(v7, "length"), md);
  objc_msgSend(NSString, "stringWithFormat:", @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", md[0], md[1], md[2], md[3], md[4], md[5], md[6], md[7], v11, BYTE1(v11), BYTE2(v11), BYTE3(v11), BYTE4(v11), BYTE5(v11), BYTE6(v11), HIBYTE(v11),
    v12,
    BYTE1(v12),
    BYTE2(v12),
  uint64_t v8 = HIBYTE(v12));
  char v9 = (void *)samplingKey;
  samplingKey = v8;

  samplingKeyCString = [(id)samplingKey UTF8String];
}

+ (void)applyTasking:(uint64_t)a1 taskId:(uint64_t)a2 fromBlob:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138543362;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A7C6D000, MEMORY[0x1E4F14500], a3, "After normalization, combinedConfig is %{public}@", (uint8_t *)&v3);
}

+ (void)applyTasking:(uint64_t)a1 taskId:(uint64_t)a2 fromBlob:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138543362;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A7C6D000, MEMORY[0x1E4F14500], a3, "task_config is %{public}@", (uint8_t *)&v3);
}

+ (void)applyTasking:(uint64_t)a1 taskId:(uint64_t)a2 fromBlob:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138543362;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A7C6D000, MEMORY[0x1E4F14500], a3, "defaultConfig is %{public}@", (uint8_t *)&v3);
}

+ (void)normalizeInstructions:(void *)a3 .cold.1(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_0(&dword_1A7C6D000, MEMORY[0x1E4F14500], (uint64_t)a3, "Not applying %@ as it has already been set", a1);
}

+ (void)normalizeInstructions:(void *)a3 .cold.2(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_0(&dword_1A7C6D000, MEMORY[0x1E4F14500], (uint64_t)a3, "Not applying %@ as it is sampled and this device isn't IN", a1);
}

+ (void)normalizeInstructions:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 138543362;
  uint64_t v1 = samplingKey;
  _os_log_fault_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "samplingKey [randomizing due to failure] was %{public}@", (uint8_t *)&v0, 0xCu);
}

@end
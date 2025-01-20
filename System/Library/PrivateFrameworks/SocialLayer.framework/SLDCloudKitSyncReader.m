@interface SLDCloudKitSyncReader
+ (id)sharedInstance;
- (BOOL)_validateRecordIDString:(id)a3;
- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4;
- (id)_fetchAttributionInternal:(id)a3;
- (id)_syncDirectory;
- (id)_syncDirectoryForWriter:(id)a3;
- (id)apps;
- (id)fetchAttribution:(id)a3;
- (id)getHighlightsForApplicationIdentifier:(id)a3;
- (id)getHighlightsInternalForApplicationIdentifier:(id)a3;
- (id)getSyncableHighlightsForApplicationIdentifier:(id)a3;
- (id)recordForDevice:(id)a3 fileName:(id)a4;
- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4;
- (void)accountStatusChanged;
- (void)addApplicationIdentifier:(id)a3;
- (void)addApplicationIdentifierInternal:(id)a3;
- (void)deleteFromDevice:(id)a3 fileName:(id)a4 overrideRetained:(BOOL)a5;
- (void)garbageCollect;
- (void)garbageCollectNow;
- (void)initializeState;
- (void)invalidateApps;
- (void)invalidateAppsInternal;
- (void)notifyChangeCallback;
- (void)reset;
- (void)setChangeCallback:(id)a3;
- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4;
- (void)syncEngine:(id)a3 didFetchRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4;
- (void)syncEngine:(id)a3 failedToFetchChangesForRecordZoneID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5;
- (void)updateServerAppsIfNecessary;
@end

@implementation SLDCloudKitSyncReader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_596 != -1) {
    dispatch_once(&sharedInstance_onceToken_596, &__block_literal_global_599);
  }
  v2 = (void *)sharedInstance_sharedInstance_597;
  return v2;
}

void __39__SLDCloudKitSyncReader_sharedInstance__block_invoke()
{
  id v3 = (id)objc_opt_new();
  v0 = [MEMORY[0x1E4F19EC8] containerWithIdentifier:@"com.apple.SocialLayer"];
  [v3 setContainer:v0];

  [v3 setName:@"ckreader"];
  v1 = [(SLDCloudKitSyncBase *)[SLDCloudKitSyncReader alloc] initWithConfiguration:v3];
  v2 = (void *)sharedInstance_sharedInstance_597;
  sharedInstance_sharedInstance_597 = (uint64_t)v1;
}

- (void)initializeState
{
  v3.receiver = self;
  v3.super_class = (Class)SLDCloudKitSyncReader;
  [(SLDCloudKitSyncBase *)&v3 initializeState];
  *(&self->super._saltLocked + 1) = 0;
  [(SLDCloudKitSyncReader *)self updateServerAppsIfNecessary];
}

- (void)reset
{
  objc_super v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [(SLDCloudKitSyncReader *)self _syncDirectory];
  [v3 removeItemAtURL:v4 error:0];

  v5.receiver = self;
  v5.super_class = (Class)SLDCloudKitSyncReader;
  [(SLDCloudKitSyncBase *)&v5 reset];
}

- (void)accountStatusChanged
{
  v4.receiver = self;
  v4.super_class = (Class)SLDCloudKitSyncReader;
  [(SLDCloudKitSyncBase *)&v4 accountStatusChanged];
  objc_super v3 = [(SLDCloudKitSyncBase *)self persistence];
  [v3 setObject:0 forKeyedSubscript:@"appListLastUploaded"];

  [(SLDCloudKitSyncReader *)self updateServerAppsIfNecessary];
}

- (void)invalidateAppsInternal
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "#SLDCK invalidateApps...", v2, v3, v4, v5, v6);
}

- (id)apps
{
  uint64_t v3 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(SLDCloudKitSyncBase *)self persistence];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"appListOnServer"];

  return v5;
}

- (BOOL)_validateRecordIDString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v4 = 0;
    while (2)
    {
      switch([v3 characterAtIndex:v4])
      {
        case '!':
        case '+':
        case '-':
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
        case '=':
        case 'A':
        case 'B':
        case 'C':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'I':
        case 'J':
        case 'K':
        case 'L':
        case 'M':
        case 'N':
        case 'O':
        case 'P':
        case 'Q':
        case 'R':
        case 'S':
        case 'T':
        case 'U':
        case 'V':
        case 'W':
        case 'X':
        case 'Y':
        case 'Z':
        case '_':
        case 'a':
        case 'b':
        case 'c':
        case 'd':
        case 'e':
        case 'f':
        case 'g':
        case 'h':
        case 'i':
        case 'j':
        case 'k':
        case 'l':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'q':
        case 'r':
        case 's':
        case 't':
        case 'u':
        case 'v':
        case 'w':
        case 'x':
        case 'y':
        case 'z':
          if (++v4 >= (unint64_t)[v3 length]) {
            goto LABEL_5;
          }
          continue;
        default:
          v7 = SLDaemonLogHandle();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            -[SLDCloudKitSyncReader _validateRecordIDString:](v3, v4);
          }

          BOOL v5 = 0;
          break;
      }
      break;
    }
  }
  else
  {
LABEL_5:
    BOOL v5 = 1;
  }

  return v5;
}

- (id)_syncDirectory
{
  id v3 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v3);

  if (SLDStorageDirectory_onceToken != -1) {
    dispatch_once(&SLDStorageDirectory_onceToken, &__block_literal_global_681);
  }
  id v4 = (id)SLDStorageDirectory_dirURL;
  BOOL v5 = [(SLDCloudKitSyncBase *)self configuration];
  uint8_t v6 = [v5 name];
  v7 = [v4 URLByAppendingPathComponent:v6 isDirectory:1];

  return v7;
}

- (id)_syncDirectoryForWriter:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([v4 hasPrefix:@"writer!"]
    && [(SLDCloudKitSyncReader *)self _validateRecordIDString:v4])
  {
    uint8_t v6 = [(SLDCloudKitSyncReader *)self _syncDirectory];
    v7 = [v6 URLByAppendingPathComponent:v4 isDirectory:1];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)addApplicationIdentifierInternal:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v5);

  uint8_t v6 = SLDaemonLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SLDCloudKitSyncReader addApplicationIdentifierInternal:]();
  }

  v7 = [(SLDCloudKitSyncBase *)self persistence];
  v8 = [v7 objectForKeyedSubscript:@"appIDToTimestamp"];
  v9 = v8;
  if (!v8) {
    v8 = (void *)MEMORY[0x1E4F1CC08];
  }
  v10 = (void *)[v8 mutableCopy];

  v11 = (void *)MEMORY[0x1E4F28ED0];
  v12 = [MEMORY[0x1E4F1C9C8] date];
  [v12 timeIntervalSinceReferenceDate];
  v13 = objc_msgSend(v11, "numberWithDouble:");
  [v10 setObject:v13 forKeyedSubscript:v4];

  v14 = [(SLDCloudKitSyncBase *)self persistence];
  [v14 setObject:v10 forKeyedSubscript:@"appIDToTimestamp"];

  [(SLDCloudKitSyncReader *)self updateServerAppsIfNecessary];
}

- (void)updateServerAppsIfNecessary
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "#SLDCK new app list %@", v2, v3, v4, v5, v6);
}

- (void)garbageCollect
{
  uint64_t v3 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v3);

  if (!*(&self->super._saltLocked + 1))
  {
    *(&self->super._saltLocked + 1) = 1;
    objc_initWeak(&location, self);
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    uint64_t v5 = [(SLDCloudKitSyncBase *)self queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__SLDCloudKitSyncReader_garbageCollect__block_invoke;
    v6[3] = &unk_1E58A85E0;
    objc_copyWeak(&v7, &location);
    dispatch_after(v4, v5, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __39__SLDCloudKitSyncReader_garbageCollect__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[58] = 0;
    uint64_t v2 = WeakRetained;
    [WeakRetained garbageCollectNow];
    WeakRetained = v2;
  }
}

- (void)garbageCollectNow
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "#SLDCK garbage collect", v2, v3, v4, v5, v6);
}

- (id)recordForDevice:(id)a3 fileName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v8);

  if ([(SLDCloudKitSyncReader *)self _validateRecordIDString:v6]
    && [(SLDCloudKitSyncReader *)self _validateRecordIDString:v7])
  {
    v9 = [(SLDCloudKitSyncReader *)self _syncDirectoryForWriter:v6];
    v10 = [v9 URLByAppendingPathComponent:v7];
    if (v10)
    {
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v10 options:1 error:0];
      if (v11)
      {
        v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:0];
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)deleteFromDevice:(id)a3 fileName:(id)a4 overrideRetained:(BOOL)a5
{
  BOOL v5 = a5;
  id v38 = a3;
  id v8 = a4;
  v9 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v9);

  if ([(SLDCloudKitSyncReader *)self _validateRecordIDString:v38]
    && [(SLDCloudKitSyncReader *)self _validateRecordIDString:v8])
  {
    v10 = [(SLDCloudKitSyncBase *)self persistence];
    v11 = [v10 objectForKeyedSubscript:@"files"];
    v12 = (void *)[v11 mutableCopy];

    if (!v12)
    {
LABEL_24:

      goto LABEL_25;
    }
    v13 = [v12 objectForKeyedSubscript:v38];
    v14 = (void *)[v13 mutableCopy];

    if (!v14
      || ([v14 objectForKeyedSubscript:v8],
          v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          !v15))
    {
LABEL_23:

      goto LABEL_24;
    }
    v16 = [(SLDCloudKitSyncBase *)self persistence];
    v17 = [v16 objectForKeyedSubscript:@"retainUntilExpirationFiles"];
    v18 = (void *)[v17 mutableCopy];

    if (v18)
    {
      v19 = [v18 objectForKeyedSubscript:v38];
      int v20 = [v19 containsObject:v8];

      if (v20)
      {
        if (!v5)
        {
LABEL_22:

          goto LABEL_23;
        }
        v21 = [v18 objectForKeyedSubscript:v38];
        v22 = (void *)[v21 mutableCopy];

        [v22 removeObject:v8];
        if ([v22 count]) {
          v23 = v22;
        }
        else {
          v23 = 0;
        }
        [v18 setObject:v23 forKeyedSubscript:v38];
        v24 = [(SLDCloudKitSyncBase *)self persistence];
        [v24 setObject:v18 forKeyedSubscript:@"retainUntilExpirationFiles"];
      }
    }
    [v14 setObject:0 forKeyedSubscript:v8];
    if ([v14 count]) {
      v25 = v14;
    }
    else {
      v25 = 0;
    }
    [v12 setObject:v25 forKeyedSubscript:v38];
    v26 = [(SLDCloudKitSyncBase *)self persistence];
    [v26 setObject:v12 forKeyedSubscript:@"files"];

    v27 = [(SLDCloudKitSyncBase *)self persistence];
    v28 = [v27 objectForKeyedSubscript:@"rankings"];
    v29 = (void *)[v28 mutableCopy];

    v30 = [v29 objectForKeyedSubscript:v38];
    v31 = (void *)[v30 mutableCopy];

    v32 = [v31 objectForKeyedSubscript:v8];

    if (v32)
    {
      [v31 setObject:0 forKeyedSubscript:v8];
      if ([v31 count]) {
        v33 = v31;
      }
      else {
        v33 = 0;
      }
      [v29 setObject:v33 forKeyedSubscript:v38];
      v34 = [(SLDCloudKitSyncBase *)self persistence];
      [v34 setObject:v29 forKeyedSubscript:@"rankings"];
    }
    v35 = [(SLDCloudKitSyncReader *)self _syncDirectoryForWriter:v38];
    v36 = [v35 URLByAppendingPathComponent:v8];

    v37 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v37 removeItemAtURL:v36 error:0];

    [(SLDCloudKitSyncReader *)self notifyChangeCallback];
    goto LABEL_22;
  }
LABEL_25:
}

- (id)_fetchAttributionInternal:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x19F3918C0]();
  id v7 = [v4 componentsSeparatedByString:@"/"];
  if ([v7 count] != 2)
  {
    v9 = 0;
    goto LABEL_33;
  }
  id v8 = [v7 objectAtIndexedSubscript:0];
  v9 = 0;
  if ([v8 hasPrefix:@"writer!"])
  {
    v10 = [v7 objectAtIndexedSubscript:1];
    if (![v10 hasPrefix:@"attribution!"])
    {
      v9 = 0;
LABEL_31:

      goto LABEL_32;
    }
    v11 = [(SLDCloudKitSyncReader *)self recordForDevice:v8 fileName:v10];
    if (!v11)
    {
      v9 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v54 = v10;
    v65 = v8;
    id v12 = objc_alloc(MEMORY[0x1E4F89F38]);
    v13 = [v11 encryptedValues];
    v14 = [v13 objectForKeyedSubscript:@"handle"];
    v15 = [v11 encryptedValues];
    v16 = [v15 objectForKeyedSubscript:@"displayName"];
    v67 = (void *)[v12 initWithHandle:v14 displayName:v16];

    v17 = [v11 encryptedValues];
    v18 = [v17 objectForKeyedSubscript:@"groupPhoto"];

    v53 = v6;
    if (v18
      && ([v11 encryptedValues],
          v19 = objc_claimAutoreleasedReturnValue(),
          [v19 objectForKeyedSubscript:@"groupPhoto"],
          int v20 = objc_claimAutoreleasedReturnValue(),
          BOOL v21 = [(SLDCloudKitSyncReader *)self _validateRecordIDString:v20],
          v20,
          v19,
          v21))
    {
      v22 = [(SLDCloudKitSyncReader *)self _syncDirectoryForWriter:v65];
      v23 = [v11 encryptedValues];
      v24 = [v23 objectForKeyedSubscript:@"groupPhoto"];
      uint64_t v68 = [v22 URLByAppendingPathComponent:v24];
    }
    else
    {
      uint64_t v68 = 0;
    }
    id v25 = objc_alloc(MEMORY[0x1E4F89F18]);
    v63 = [v11 encryptedValues];
    v26 = [v63 objectForKeyedSubscript:@"identifier"];
    v62 = [v11 encryptedValues];
    v58 = [v62 objectForKeyedSubscript:@"sourceAppDisplayName"];
    v61 = [v11 encryptedValues];
    v57 = [v61 objectForKeyedSubscript:@"groupDisplayName"];
    v27 = (void *)MEMORY[0x1E4F1C9C8];
    v60 = [v11 encryptedValues];
    v59 = [v60 objectForKeyedSubscript:@"timestamp"];
    [v59 doubleValue];
    v55 = objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
    v56 = [v11 encryptedValues];
    v28 = [v56 objectForKeyedSubscript:@"starred"];
    char v29 = [v28 BOOLValue];
    v66 = v11;
    v30 = [v11 encryptedValues];
    v31 = [v30 objectForKeyedSubscript:@"fromMe"];
    BYTE1(v51) = [v31 BOOLValue];
    LOBYTE(v51) = v29;
    v32 = objc_msgSend(v25, "initWithIdentifier:sourceAppDisplayName:conversationIdentifier:groupPhotoPath:groupDisplayName:relatedPeople:sender:timestamp:collaborationMetadata:starred:fromMe:", v26, v58, @"c", v68, v57, MEMORY[0x1E4F1CBF0], v67, v55, 0, v51);

    v33 = (void *)v68;
    if (!v32)
    {
      v9 = 0;
      id v8 = v65;
      id v6 = v53;
      v10 = v54;
      v11 = v66;
LABEL_29:

      goto LABEL_30;
    }
    v69[0] = 0;
    v9 = [[SLAttribution alloc] initWithPortraitAttribution:v32 error:v69];
    id v64 = v69[0];
    v52 = v32;
    if (v9)
    {
      v34 = [v66 encryptedValues];
      v35 = [v34 objectForKeyedSubscript:@"shortDisplayName"];

      id v8 = v65;
      v10 = v54;
      if (v35)
      {
        v36 = [v66 encryptedValues];
        v37 = [v36 objectForKeyedSubscript:@"shortDisplayName"];
        id v38 = [(SLAttribution *)v9 sender];
        [v38 setShortDisplayName:v37];
      }
      v39 = [v66 encryptedValues];
      v40 = [v39 objectForKeyedSubscript:@"contactPhoto"];

      v11 = v66;
      id v6 = v53;
      if (!v40) {
        goto LABEL_28;
      }
      v41 = [v66 encryptedValues];
      v42 = [v41 objectForKeyedSubscript:@"contactPhoto"];
      BOOL v43 = [(SLDCloudKitSyncReader *)self _validateRecordIDString:v42];

      v11 = v66;
      if (!v43) {
        goto LABEL_28;
      }
      v44 = [(SLDCloudKitSyncReader *)self _syncDirectoryForWriter:v65];
      v45 = [v66 encryptedValues];
      v46 = [v45 objectForKeyedSubscript:@"contactPhoto"];
      v47 = [v44 URLByAppendingPathComponent:v46];

      if (v47)
      {
        v48 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v47 options:8 error:0];
        if (v48)
        {
          v49 = [(SLAttribution *)v9 sender];
          [v49 setThumbnailImageData:v48];
        }
      }
      v11 = v66;
    }
    else
    {
      v47 = SLDaemonLogHandle();
      id v8 = v65;
      v10 = v54;
      v11 = v66;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT)) {
        -[SLDCloudKitSyncReader _fetchAttributionInternal:]();
      }
      id v6 = v53;
    }

LABEL_28:
    v33 = (void *)v68;
    v32 = v52;
    goto LABEL_29;
  }
LABEL_32:

LABEL_33:

  return v9;
}

- (id)getHighlightsInternalForApplicationIdentifier:(id)a3
{
  uint64_t v196 = *MEMORY[0x1E4F143B8];
  id v143 = a3;
  id v4 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v4);

  BOOL v5 = [(SLDCloudKitSyncBase *)self persistence];
  id v6 = [v5 objectForKeyedSubscript:@"rankings"];

  id v7 = [(SLDCloudKitSyncBase *)self persistence];
  id v8 = [v7 objectForKeyedSubscript:@"files"];

  id v126 = 0;
  v122 = v6;
  if (v6 && v8)
  {
    v151 = objc_opt_new();
    id v126 = (id)objc_opt_new();
    long long v175 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    long long v178 = 0u;
    obuint64_t j = v6;
    uint64_t v130 = [obj countByEnumeratingWithState:&v175 objects:v195 count:16];
    if (v130)
    {
      uint64_t v129 = *(void *)v176;
      v148 = self;
      v128 = v8;
      do
      {
        for (uint64_t i = 0; i != v130; ++i)
        {
          if (*(void *)v176 != v129) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v175 + 1) + 8 * i);
          v11 = [obj objectForKeyedSubscript:v10];
          v153 = [v8 objectForKeyedSubscript:v10];
          if (v153)
          {
            uint64_t v132 = i;
            long long v173 = 0u;
            long long v174 = 0u;
            long long v171 = 0u;
            long long v172 = 0u;
            id v12 = v11;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v171 objects:v194 count:16];
            if (!v13)
            {
              id v15 = v12;
LABEL_101:

              uint64_t i = v132;
              goto LABEL_102;
            }
            uint64_t v14 = v13;
            id v15 = 0;
            uint64_t v16 = *(void *)v172;
            v145 = v11;
            uint64_t v146 = *(void *)v172;
            uint64_t v152 = v10;
            do
            {
              uint64_t v17 = 0;
              uint64_t v149 = v14;
              do
              {
                if (*(void *)v172 != v16) {
                  objc_enumerationMutation(v12);
                }
                v18 = *(void **)(*((void *)&v171 + 1) + 8 * v17);
                v19 = [v153 objectForKeyedSubscript:v18];
                int v20 = [v153 objectForKeyedSubscript:v15];
                uint64_t v21 = [v20 compare:v19];

                if (v21 == 1)
                {
                  uint64_t v22 = v152;
                }
                else
                {
                  id v23 = v15;
                  long long v169 = 0u;
                  long long v170 = 0u;
                  long long v167 = 0u;
                  long long v168 = 0u;
                  id v24 = v12;
                  id v25 = [v12 objectForKeyedSubscript:v18];
                  uint64_t v26 = [v25 countByEnumeratingWithState:&v167 objects:v193 count:16];
                  if (v26)
                  {
                    uint64_t v27 = v26;
                    uint64_t v28 = *(void *)v168;
                    while (2)
                    {
                      for (uint64_t j = 0; j != v27; ++j)
                      {
                        if (*(void *)v168 != v28) {
                          objc_enumerationMutation(v25);
                        }
                        v30 = [v153 objectForKeyedSubscript:*(void *)(*((void *)&v167 + 1) + 8 * j)];

                        if (!v30)
                        {
                          id v15 = v23;
                          goto LABEL_26;
                        }
                      }
                      uint64_t v27 = [v25 countByEnumeratingWithState:&v167 objects:v193 count:16];
                      if (v27) {
                        continue;
                      }
                      break;
                    }
                  }

                  id v15 = v18;
                  id v25 = v23;
LABEL_26:

                  v11 = v145;
                  uint64_t v16 = v146;
                  uint64_t v22 = v152;
                  id v12 = v24;
                  uint64_t v14 = v149;
                }

                ++v17;
              }
              while (v17 != v14);
              uint64_t v14 = [v12 countByEnumeratingWithState:&v171 objects:v194 count:16];
            }
            while (v14);

            id v8 = v128;
            uint64_t i = v132;
            if (v15)
            {
              id v31 = objc_alloc(MEMORY[0x1E4F1C9C8]);
              v32 = [v153 objectForKeyedSubscript:v15];
              [v32 doubleValue];
              v33 = objc_msgSend(v31, "initWithTimeIntervalSinceReferenceDate:");

              [v33 timeIntervalSinceNow];
              if (v34 >= -2592000.0)
              {
                [v33 timeIntervalSinceNow];
                if (v35 <= 86400.0)
                {
                  v36 = [(SLDCloudKitSyncReader *)v148 recordForDevice:v22 fileName:v15];
                  if (v36)
                  {
                    v127 = v33;
                    v37 = v36;
                    id v38 = [(SLDCloudKitSyncBase *)v148 persistence];
                    v39 = [v38 objectForKeyedSubscript:@"retainUntilExpirationFiles"];
                    v40 = v39;
                    if (!v39) {
                      v39 = (void *)MEMORY[0x1E4F1CC08];
                    }
                    v41 = (void *)[v39 mutableCopy];

                    v42 = objc_opt_new();
                    uint64_t v43 = [v41 objectForKeyedSubscript:v22];
                    v44 = (void *)v43;
                    if (v43) {
                      uint64_t v45 = v43;
                    }
                    else {
                      uint64_t v45 = MEMORY[0x1E4F1CBF0];
                    }
                    [v42 addObjectsFromArray:v45];

                    long long v165 = 0u;
                    long long v166 = 0u;
                    long long v163 = 0u;
                    long long v164 = 0u;
                    id v125 = v37;
                    v46 = [v37 encryptedValues];
                    v47 = [v46 objectForKeyedSubscript:@"recordIDs"];

                    uint64_t v48 = [v47 countByEnumeratingWithState:&v163 objects:v192 count:16];
                    if (v48)
                    {
                      uint64_t v49 = v48;
                      uint64_t v50 = *(void *)v164;
                      do
                      {
                        for (uint64_t k = 0; k != v49; ++k)
                        {
                          if (*(void *)v164 != v50) {
                            objc_enumerationMutation(v47);
                          }
                          [v42 addObject:*(void *)(*((void *)&v163 + 1) + 8 * k)];
                        }
                        uint64_t v49 = [v47 countByEnumeratingWithState:&v163 objects:v192 count:16];
                      }
                      while (v49);
                    }

                    v123 = v42;
                    if ([v42 count])
                    {
                      v52 = [v42 allObjects];
                      [v41 setObject:v52 forKeyedSubscript:v22];
                    }
                    else
                    {
                      [v41 setObject:0 forKeyedSubscript:v22];
                    }
                    v53 = v148;
                    v54 = [(SLDCloudKitSyncBase *)v148 persistence];
                    v124 = v41;
                    [v54 setObject:v41 forKeyedSubscript:@"retainUntilExpirationFiles"];

                    long long v161 = 0u;
                    long long v162 = 0u;
                    long long v159 = 0u;
                    long long v160 = 0u;
                    v55 = [v125 encryptedValues];
                    v56 = [v55 objectForKeyedSubscript:@"highlights"];

                    id v139 = v56;
                    uint64_t v144 = [v56 countByEnumeratingWithState:&v159 objects:v191 count:16];
                    if (v144)
                    {
                      uint64_t v57 = *(void *)v160;
                      id v134 = v15;
                      uint64_t v135 = *(void *)v160;
                      do
                      {
                        for (uint64_t m = 0; m != v144; ++m)
                        {
                          if (*(void *)v160 != v57) {
                            objc_enumerationMutation(v139);
                          }
                          uint64_t v59 = *(void *)(*((void *)&v159 + 1) + 8 * m);
                          v60 = (void *)MEMORY[0x19F3918C0]();
                          uint64_t v141 = v59;
                          v61 = [(SLDCloudKitSyncReader *)v53 recordForDevice:v22 fileName:v59];
                          v62 = v61;
                          if (v61)
                          {
                            if (!v143) {
                              goto LABEL_57;
                            }
                            v63 = [v61 encryptedValues];
                            [v63 objectForKeyedSubscript:@"applicationIdentifier"];
                            id v64 = v62;
                            v65 = v60;
                            v67 = uint64_t v66 = m;

                            LODWORD(v63) = [v67 isEqual:v143];
                            uint64_t m = v66;
                            v60 = v65;
                            v62 = v64;
                            if (v63)
                            {
LABEL_57:
                              uint64_t v140 = m;
                              uint64_t v68 = [v62 encryptedValues];
                              v69 = [v68 objectForKeyedSubscript:@"entity"];
                              v70 = [(SLDCloudKitSyncReader *)v53 recordForDevice:v22 fileName:v69];

                              if (!v70) {
                                goto LABEL_95;
                              }
                              v71 = [v70 encryptedValues];
                              uint64_t v72 = [v71 objectForKeyedSubscript:@"identifier"];

                              v150 = (void *)v72;
                              if (!v72)
                              {
                                v147 = SLDaemonLogHandle();
                                if (os_log_type_enabled(v147, OS_LOG_TYPE_FAULT)) {
                                  [(SLDCloudKitSyncReader *)&v189 getHighlightsInternalForApplicationIdentifier:&v190];
                                }
                                goto LABEL_94;
                              }
                              v136 = v70;
                              v137 = v60;
                              id v73 = objc_alloc(MEMORY[0x1E4F1CA48]);
                              v74 = [v62 encryptedValues];
                              [v74 objectForKeyedSubscript:@"attributions"];
                              v76 = v75 = v62;
                              v147 = objc_msgSend(v73, "initWithCapacity:", objc_msgSend(v76, "count"));

                              long long v157 = 0u;
                              long long v158 = 0u;
                              long long v155 = 0u;
                              long long v156 = 0u;
                              v138 = v75;
                              v77 = [v75 encryptedValues];
                              v78 = [v77 objectForKeyedSubscript:@"attributions"];

                              uint64_t v79 = [v78 countByEnumeratingWithState:&v155 objects:v188 count:16];
                              if (v79)
                              {
                                uint64_t v80 = v79;
                                uint64_t v81 = *(void *)v156;
                                do
                                {
                                  for (uint64_t n = 0; n != v80; ++n)
                                  {
                                    if (*(void *)v156 != v81) {
                                      objc_enumerationMutation(v78);
                                    }
                                    uint64_t v83 = *(void *)(*((void *)&v155 + 1) + 8 * n);
                                    v84 = (void *)MEMORY[0x19F3918C0]();
                                    v187[0] = v22;
                                    v187[1] = v83;
                                    v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:v187 count:2];
                                    v86 = [v85 componentsJoinedByString:@"/"];

                                    v87 = [(SLDCloudKitSyncReader *)v53 _fetchAttributionInternal:v86];
                                    v88 = v87;
                                    if (v87)
                                    {
                                      v89 = [v87 sender];
                                      v90 = [v89 handle];

                                      if (v90)
                                      {
                                        v186[0] = v150;
                                        v186[1] = v90;
                                        v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:v186 count:2];
                                        v92 = [v91 componentsJoinedByString:@"\n"];

                                        if (([v151 containsObject:v92] & 1) == 0)
                                        {
                                          [v151 addObject:v92];
                                          [v147 addObject:v86];
                                        }

                                        v53 = v148;
                                      }

                                      uint64_t v22 = v152;
                                    }
                                  }
                                  uint64_t v80 = [v78 countByEnumeratingWithState:&v155 objects:v188 count:16];
                                }
                                while (v80);
                              }

                              v93 = SLDaemonLogHandle();
                              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
                              {
                                v181[0] = v22;
                                v181[1] = v141;
                                v120 = [MEMORY[0x1E4F1C978] arrayWithObjects:v181 count:2];
                                *(_DWORD *)buf = 138412546;
                                v183 = v120;
                                __int16 v184 = 2112;
                                v185 = v147;
                                _os_log_debug_impl(&dword_19BE17000, v93, OS_LOG_TYPE_DEBUG, "#SLDCK %@ device scoped attributions: %@", buf, 0x16u);
                              }
                              v11 = v145;
                              id v15 = v134;
                              uint64_t v57 = v135;
                              v60 = v137;
                              v62 = v138;
                              v70 = v136;
                              if (![v147 count])
                              {
                                v53 = v148;
                                goto LABEL_94;
                              }
                              v94 = [v136 objectForKeyedSubscript:@"version"];
                              unint64_t v95 = [v94 unsignedIntegerValue];

                              if (v95 <= 1)
                              {
                                v107 = [v136 encryptedValues];
                                v108 = [v107 objectForKeyedSubscript:@"supplementaryData"];
                                v109 = (void *)MEMORY[0x1E4F1CC08];
                                if (!v108) {
                                  v109 = 0;
                                }
                                id v103 = v109;

                                v53 = v148;
                                if (!v103) {
                                  goto LABEL_89;
                                }
                              }
                              else
                              {
                                v96 = (void *)MEMORY[0x1E4F28DC0];
                                v97 = (void *)MEMORY[0x1E4F1CAD0];
                                uint64_t v98 = objc_opt_class();
                                uint64_t v99 = objc_opt_class();
                                v100 = objc_msgSend(v97, "setWithObjects:", v98, v99, objc_opt_class(), 0);
                                v101 = [v136 encryptedValues];
                                v102 = [v101 objectForKeyedSubscript:@"supplementaryData"];
                                id v154 = 0;
                                id v103 = [v96 unarchivedObjectOfClasses:v100 fromData:v102 error:&v154];
                                v104 = v154;

                                if (v104)
                                {
                                  v105 = SLDaemonLogHandle();
                                  v53 = v148;
                                  uint64_t v22 = v152;
                                  if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT))
                                  {
                                    v106 = [v136 objectForKeyedSubscript:@"version"];
                                    *(_DWORD *)buf = 138412546;
                                    v183 = v106;
                                    __int16 v184 = 2112;
                                    v185 = v104;
                                    _os_log_fault_impl(&dword_19BE17000, v105, OS_LOG_TYPE_FAULT, "#SLDCK unable to decode supplementary data from record with version %@: %@", buf, 0x16u);

                                    v53 = v148;
                                  }
LABEL_87:

LABEL_92:
                                  v62 = v138;
LABEL_93:

                                  uint64_t v57 = v135;
LABEL_94:

LABEL_95:
                                  uint64_t m = v140;
                                  goto LABEL_96;
                                }
                                v53 = v148;
                                uint64_t v22 = v152;
                                v62 = v138;
                                if (!v103)
                                {
LABEL_89:
                                  v104 = SLDaemonLogHandle();
                                  if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT)) {
                                    [(SLDCloudKitSyncReader *)&v179 getHighlightsInternalForApplicationIdentifier:&v180];
                                  }
                                  id v103 = 0;
                                  goto LABEL_92;
                                }
                              }
                              if (SLDValidateSupplementaryData(v103))
                              {
                                v110 = v62;
                                id v111 = objc_alloc(MEMORY[0x1E4F89F28]);
                                v112 = (void *)MEMORY[0x1E4F1CB10];
                                v142 = [v136 encryptedValues];
                                v131 = [v142 objectForKeyedSubscript:@"resourceURL"];
                                v113 = [v112 URLWithString:v131];
                                v114 = (void *)MEMORY[0x1E4F1C9C8];
                                v115 = [v110 encryptedValues];
                                v116 = [v115 objectForKeyedSubscript:@"timestamp"];
                                [v116 doubleValue];
                                v117 = objc_msgSend(v114, "dateWithTimeIntervalSinceReferenceDate:");
                                v118 = [v110 encryptedValues];
                                v119 = [v118 objectForKeyedSubscript:@"score"];
                                v104 = [v111 initWithIdentifier:v150 resourceURL:v113 timestamp:v117 attributionIdentifiers:v147 supplementaryData:v103 score:v119];

                                v70 = v136;
                                v53 = v148;

                                uint64_t v22 = v152;
                                v60 = v137;

                                v105 = [objc_alloc(MEMORY[0x1E4F89F68]) initWithHighlight:v104 rankingDate:v127 originatingDeviceId:v152];
                                [v126 addObject:v105];
                                goto LABEL_87;
                              }
                              goto LABEL_93;
                            }
                          }
LABEL_96:
                        }
                        uint64_t v144 = [v139 countByEnumeratingWithState:&v159 objects:v191 count:16];
                      }
                      while (v144);
                    }

                    v33 = v127;
                    v36 = v125;
                  }
                }
              }

              id v8 = v128;
              goto LABEL_101;
            }
          }
LABEL_102:
        }
        uint64_t v130 = [obj countByEnumeratingWithState:&v175 objects:v195 count:16];
      }
      while (v130);
    }
  }
  return v126;
}

- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4
{
  id v4 = a4;
  BOOL v5 = SLDaemonLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SLDCloudKitSyncReader syncEngine:didSaveRecordZone:](v4);
  }
}

- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = SLDaemonLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[SLDCloudKitSyncReader syncEngine:failedToSaveRecordZone:error:]();
  }
}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__12;
  uint64_t v22 = __Block_byref_object_dispose__12;
  id v23 = 0;
  id v8 = [(SLDCloudKitSyncBase *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__SLDCloudKitSyncReader_syncEngine_recordToSaveForRecordID___block_invoke;
  v13[3] = &unk_1E58A9E70;
  id v14 = v6;
  id v15 = self;
  id v16 = v7;
  uint64_t v17 = &v18;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __60__SLDCloudKitSyncReader_syncEngine_recordToSaveForRecordID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) syncEngine];

  if (v2 == v3)
  {
    id v4 = [*(id *)(a1 + 48) zoneID];
    BOOL v5 = [v4 zoneName];
    int v6 = [@"readers" isEqual:v5];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 40) persistence];
      id v8 = [v7 objectForKeyedSubscript:@"myAppsRecordID"];
      id v9 = [*(id *)(a1 + 48) recordName];
      char v10 = [v8 isEqual:v9];

      if (v10)
      {
        uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"reader" recordID:*(void *)(a1 + 48)];
        uint64_t v13 = *(void *)(a1 + 56);
        uint64_t v12 = a1 + 56;
        uint64_t v14 = *(void *)(v13 + 8);
        id v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v11;

        [*(id *)(v12 - 16) addMetadataToRecord:*(void *)(*(void *)(*(void *)v12 + 8) + 40)];
        id v16 = [*(id *)(v12 - 16) apps];
        uint64_t v17 = [*(id *)(*(void *)(*(void *)v12 + 8) + 40) encryptedValues];
        [v17 setObject:v16 forKeyedSubscript:@"applicationIdentifiers"];

        uint64_t v18 = SLDaemonLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          __60__SLDCloudKitSyncReader_syncEngine_recordToSaveForRecordID___block_invoke_cold_1();
        }
      }
      else
      {
        uint64_t v18 = SLDaemonLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          __60__SLDCloudKitSyncReader_syncEngine_recordToSaveForRecordID___block_invoke_cold_2();
        }
      }
    }
  }
}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  id v4 = a4;
  BOOL v5 = SLDaemonLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SLDCloudKitSyncReader syncEngine:didSaveRecord:](v4);
  }
}

- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SLDCloudKitSyncBase *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__SLDCloudKitSyncReader_syncEngine_failedToSaveRecord_error___block_invoke;
  v15[3] = &unk_1E58A9E48;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(v11, v15);
}

void __61__SLDCloudKitSyncReader_syncEngine_failedToSaveRecord_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) syncEngine];

  if (v2 == v3)
  {
    id v4 = [*(id *)(a1 + 48) recordID];
    BOOL v5 = [v4 zoneID];
    int v6 = [v5 zoneName];
    char v7 = [@"readers" isEqual:v6];

    id v8 = SLDaemonLogHandle();
    id v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __61__SLDCloudKitSyncReader_syncEngine_failedToSaveRecord_error___block_invoke_cold_1();
      }

      id v10 = [*(id *)(a1 + 40) persistence];
      uint64_t v11 = [v10 objectForKeyedSubscript:@"myAppsRecordID"];
      id v12 = [*(id *)(a1 + 48) recordID];
      id v13 = [v12 recordName];
      int v14 = [v11 isEqual:v13];

      if (v14)
      {
        id v15 = [*(id *)(a1 + 40) persistence];
        [v15 setObject:0 forKeyedSubscript:@"appListLastUploaded"];

        id v16 = [*(id *)(a1 + 40) persistence];
        [v16 setObject:0 forKeyedSubscript:@"appListOnServer"];

        [*(id *)(a1 + 40) checkForAccountChanges];
      }
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        __61__SLDCloudKitSyncReader_syncEngine_failedToSaveRecord_error___block_invoke_cold_2();
      }
    }
  }
}

- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4
{
  id v4 = a4;
  BOOL v5 = SLDaemonLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SLDCloudKitSyncReader syncEngine:didDeleteRecordWithID:]();
  }
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  id v6 = a4;
  char v7 = [(SLDCloudKitSyncBase *)self queue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__SLDCloudKitSyncReader_syncEngine_recordWithIDWasDeleted_recordType___block_invoke;
  v9[3] = &unk_1E58A8680;
  id v10 = v6;
  uint64_t v11 = self;
  id v8 = v6;
  dispatch_sync(v7, v9);
}

void __70__SLDCloudKitSyncReader_syncEngine_recordWithIDWasDeleted_recordType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) zoneID];
  id v4 = [v2 zoneName];

  uint64_t v3 = [*(id *)(a1 + 32) recordName];
  [*(id *)(a1 + 40) deleteFromDevice:v4 fileName:v3 overrideRetained:0];
  [*(id *)(a1 + 40) garbageCollect];
}

- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v8 = [(SLDCloudKitSyncBase *)self queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__SLDCloudKitSyncReader_syncEngine_shouldFetchChangesForZoneID___block_invoke;
  v12[3] = &unk_1E58A9E98;
  id v13 = v6;
  int v14 = self;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v7) = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return (char)v7;
}

void __64__SLDCloudKitSyncReader_syncEngine_shouldFetchChangesForZoneID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) syncEngine];

  if (v2 == v3)
  {
    BOOL v5 = [*(id *)(a1 + 48) zoneName];
    char v6 = [v5 hasPrefix:@"writer!"];

    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    if (v6)
    {
      *(unsigned char *)(v4 + 24) = 1;
      return;
    }
  }
  else
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  }
  *(unsigned char *)(v4 + 24) = 0;
}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SLDCloudKitSyncBase *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke;
  block[3] = &unk_1E58A9C70;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) syncEngine];

  if (v2 == v3)
  {
    uint64_t v4 = (id *)(a1 + 48);
    if (([*(id *)(a1 + 40) recordSupportsOurVersion:*(void *)(a1 + 48)] & 1) == 0)
    {
      id v9 = SLDaemonLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_13(a1 + 48);
      }
      goto LABEL_55;
    }
    BOOL v5 = [*v4 recordID];
    id v6 = [v5 zoneID];
    id v7 = [v6 zoneName];
    char v8 = [v7 hasPrefix:@"writer!"];

    id v9 = SLDaemonLogHandle();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if ((v8 & 1) == 0)
    {
      if (v10) {
        __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_12((id *)(a1 + 48));
      }
      goto LABEL_55;
    }
    if (v10) {
      __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_11(a1 + 48);
    }

    uint64_t v11 = *(void **)(a1 + 40);
    id v12 = [*(id *)(a1 + 48) recordID];
    id v13 = [v12 zoneID];
    id v14 = [v13 zoneName];
    LODWORD(v11) = [v11 _validateRecordIDString:v14];

    if (v11)
    {
      id v15 = *(void **)(a1 + 40);
      id v16 = [*(id *)(a1 + 48) recordID];
      uint64_t v17 = [v16 recordName];
      LODWORD(v15) = [v15 _validateRecordIDString:v17];

      if (v15)
      {
        id v18 = *(void **)(a1 + 40);
        uint64_t v19 = [*(id *)(a1 + 48) recordID];
        char v20 = [v19 zoneID];
        uint64_t v21 = [v20 zoneName];
        id v9 = [v18 _syncDirectoryForWriter:v21];

        if (!v9)
        {
          uint64_t v26 = SLDaemonLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_1();
          }
          goto LABEL_54;
        }
        uint64_t v22 = [*(id *)(a1 + 40) persistence];
        id v23 = [v22 objectForKeyedSubscript:@"files"];
        id v24 = v23;
        id v25 = (void *)MEMORY[0x1E4F1CC08];
        if (!v23) {
          id v23 = (void *)MEMORY[0x1E4F1CC08];
        }
        uint64_t v26 = [v23 mutableCopy];

        uint64_t v27 = [*(id *)(a1 + 48) recordID];
        uint64_t v28 = [v27 zoneID];
        char v29 = [v28 zoneName];
        v30 = [v26 objectForKeyedSubscript:v29];
        id v31 = v30;
        if (!v30) {
          v30 = v25;
        }
        v32 = (void *)[v30 mutableCopy];

        v33 = [*(id *)(a1 + 48) recordID];
        double v34 = [v33 recordName];
        double v35 = [v32 objectForKeyedSubscript:v34];

        if (v35)
        {
          v36 = SLDaemonLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
            __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_10();
          }
          goto LABEL_53;
        }
        v37 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v86 = 0;
        uint64_t v38 = [v37 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v86];
        v36 = v86;

        if ((v38 & 1) == 0)
        {
          uint64_t v68 = SLDaemonLogHandle();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
            __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_9();
          }
          goto LABEL_52;
        }
        v39 = [*v4 objectForKeyedSubscript:@"recordTimestamp"];
        v40 = [*v4 recordID];
        v41 = [v40 recordName];
        [v32 setObject:v39 forKeyedSubscript:v41];

        v42 = [*v4 recordType];
        LODWORD(v40) = [@"index" isEqual:v42];

        if (v40)
        {
          v82 = v36;
          uint64_t v43 = v25;
          v44 = SLDaemonLogHandle();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
            __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_8();
          }

          uint64_t v45 = [*(id *)(a1 + 40) persistence];
          v46 = [v45 objectForKeyedSubscript:@"rankings"];
          v47 = v46;
          if (!v46) {
            v46 = v43;
          }
          uint64_t v80 = (void *)[v46 mutableCopy];

          uint64_t v48 = [*(id *)(a1 + 48) recordID];
          uint64_t v49 = [v48 zoneID];
          uint64_t v50 = [v49 zoneName];
          uint64_t v51 = [v80 objectForKeyedSubscript:v50];
          v52 = v51;
          if (!v51) {
            uint64_t v51 = (void *)MEMORY[0x1E4F1CC08];
          }
          v53 = objc_msgSend(v51, "mutableCopy", v80);

          v54 = [*(id *)(a1 + 48) encryptedValues];
          v55 = [v54 objectForKeyedSubscript:@"recordIDs"];
          v56 = [*(id *)(a1 + 48) recordID];
          uint64_t v57 = [v56 recordName];
          [v53 setObject:v55 forKeyedSubscript:v57];

          v58 = [*(id *)(a1 + 48) recordID];
          uint64_t v59 = [v58 zoneID];
          v60 = [v59 zoneName];
          [v81 setObject:v53 forKeyedSubscript:v60];

          v61 = [*(id *)(a1 + 40) persistence];
          [v61 setObject:v81 forKeyedSubscript:@"rankings"];

          v36 = v82;
        }
        v62 = [*(id *)(a1 + 48) recordID];
        v63 = [v62 zoneID];
        id v64 = [v63 zoneName];
        [v26 setObject:v32 forKeyedSubscript:v64];

        v65 = [*(id *)(a1 + 40) persistence];
        [v65 setObject:v26 forKeyedSubscript:@"files"];

        uint64_t v66 = [*(id *)(a1 + 48) recordID];
        v67 = [v66 recordName];
        uint64_t v68 = [v9 URLByAppendingPathComponent:v67];

        v69 = SLDaemonLogHandle();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG)) {
          __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_7();
        }

        v70 = [*v4 recordType];
        int v71 = [@"image" isEqual:v70];

        uint64_t v72 = SLDaemonLogHandle();
        BOOL v73 = os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG);
        if (v71)
        {
          if (v73) {
            __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_3();
          }

          v74 = [*v4 encryptedValues];
          id v75 = [v74 objectForKeyedSubscript:@"compressed"];

          id v85 = 0;
          [v75 writeToURL:v68 options:0 error:&v85];
          id v76 = v85;
          if (!v76) {
            goto LABEL_51;
          }
          v77 = SLDaemonLogHandle();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
            __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_2();
          }
        }
        else
        {
          if (v73) {
            __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_6();
          }

          id v78 = *v4;
          id v84 = 0;
          id v76 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v78 requiringSecureCoding:1 error:&v84];
          id v75 = v84;
          if (v76)
          {
            id v83 = 0;
            [v76 writeToURL:v68 options:0 error:&v83];
            v77 = v83;
            if (v77)
            {
              uint64_t v79 = SLDaemonLogHandle();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
                __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_5();
              }
            }
          }
          else
          {
            v77 = SLDaemonLogHandle();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
              __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_4();
            }
          }
        }

LABEL_51:
        [*(id *)(a1 + 40) garbageCollect];
LABEL_52:

LABEL_53:
LABEL_54:

LABEL_55:
      }
    }
  }
}

- (void)notifyChangeCallback
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "#SLDCK notifyChangeCallback", v2, v3, v4, v5, v6);
}

void __45__SLDCloudKitSyncReader_notifyChangeCallback__block_invoke(uint64_t a1)
{
  WeakRetained = (const void **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 72) = 0;
    uint64_t v3 = _Block_copy(WeakRetained[8]);
    uint64_t v4 = SLDaemonLogHandle();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_INFO, "#SLDCK invoking change callback", buf, 2u);
      }

      uint64_t v4 = dispatch_get_global_queue(-2, 0);
      dispatch_async(v4, v3);
    }
    else if (v5)
    {
      v6[0] = 0;
      _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_INFO, "#SLDCK not invoking change callback because it's nil", (uint8_t *)v6, 2u);
    }
  }
}

- (void)syncEngine:(id)a3 failedToFetchChangesForRecordZoneID:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(SLDCloudKitSyncBase *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__SLDCloudKitSyncReader_syncEngine_failedToFetchChangesForRecordZoneID_error___block_invoke;
  v15[3] = &unk_1E58A9E48;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(v11, v15);
}

void __78__SLDCloudKitSyncReader_syncEngine_failedToFetchChangesForRecordZoneID_error___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) syncEngine];

  if (v2 == v3)
  {
    uint64_t v4 = SLDaemonLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v6 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_DEFAULT, "#SLDCK Failed to fetch changes for zone %@: %@", buf, 0x16u);
    }

    id v7 = [*(id *)(a1 + 56) domain];
    if ([v7 isEqual:*MEMORY[0x1E4F19C40]])
    {
    }
    else
    {
      id v8 = [*(id *)(a1 + 56) domain];
      int v9 = [v8 isEqual:*MEMORY[0x1E4F19CA0]];

      if (!v9) {
        return;
      }
    }
    if ([*(id *)(a1 + 56) code] == 112)
    {
      id v10 = [*(id *)(a1 + 48) zoneName];
      char v11 = [@"readers" isEqual:v10];

      if ((v11 & 1) == 0)
      {
        id v12 = SLDaemonLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          __78__SLDCloudKitSyncReader_syncEngine_failedToFetchChangesForRecordZoneID_error___block_invoke_cold_1();
        }

        id v13 = [*(id *)(a1 + 40) syncEngine];
        uint64_t v15 = *(void *)(a1 + 48);
        id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
        [v13 addRecordZonesToSave:0 recordZoneIDsToDelete:v14];
      }
    }
  }
}

- (void)invalidateApps
{
  uint64_t v3 = [(SLDCloudKitSyncBase *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__SLDCloudKitSyncReader_invalidateApps__block_invoke;
  block[3] = &unk_1E58A8720;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __39__SLDCloudKitSyncReader_invalidateApps__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateAppsInternal];
}

- (void)addApplicationIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLDCloudKitSyncBase *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SLDCloudKitSyncReader_addApplicationIdentifier___block_invoke;
  v7[3] = &unk_1E58A8680;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __50__SLDCloudKitSyncReader_addApplicationIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addApplicationIdentifierInternal:*(void *)(a1 + 40)];
}

- (id)getHighlightsForApplicationIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__12;
  id v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  uint64_t v5 = [(SLDCloudKitSyncBase *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SLDCloudKitSyncReader_getHighlightsForApplicationIdentifier___block_invoke;
  block[3] = &unk_1E58A90D8;
  void block[4] = self;
  id v10 = v4;
  char v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __63__SLDCloudKitSyncReader_getHighlightsForApplicationIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(a1 + 32) getHighlightsInternalForApplicationIdentifier:*(void *)(a1 + 40)];
  uint64_t v2 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        int v9 = [v8 originatingDeviceId];
        id v10 = [v2 objectForKeyedSubscript:v9];

        if (!v10)
        {
          id v10 = objc_opt_new();
          char v11 = [v8 originatingDeviceId];
          [v2 setObject:v10 forKeyedSubscript:v11];
        }
        uint64_t v12 = [SLHighlight alloc];
        id v13 = [v8 highlight];
        id v20 = 0;
        uint64_t v14 = [(SLHighlight *)v12 initWithPortraitHighlight:v13 error:&v20];
        id v15 = v20;

        if (v14)
        {
          [v10 addObject:v14];
        }
        else
        {
          id v16 = SLDaemonLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v26 = v15;
            _os_log_fault_impl(&dword_19BE17000, v16, OS_LOG_TYPE_FAULT, "couldn't convert portrait highlight to sl highlight: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v5);
  }

  uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
  __int16 v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v2;
}

- (id)getSyncableHighlightsForApplicationIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__12;
  id v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  uint64_t v5 = [(SLDCloudKitSyncBase *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__SLDCloudKitSyncReader_getSyncableHighlightsForApplicationIdentifier___block_invoke;
  block[3] = &unk_1E58A9EC0;
  id v10 = v4;
  char v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __71__SLDCloudKitSyncReader_getSyncableHighlightsForApplicationIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) getHighlightsInternalForApplicationIdentifier:*(void *)(a1 + 40)];
  id v4 = (id)v2;
  if (v2) {
    id v3 = (void *)v2;
  }
  else {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v3);
}

- (id)fetchAttribution:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__12;
  id v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  uint64_t v5 = [(SLDCloudKitSyncBase *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SLDCloudKitSyncReader_fetchAttribution___block_invoke;
  block[3] = &unk_1E58A9EC0;
  id v10 = v4;
  char v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __42__SLDCloudKitSyncReader_fetchAttribution___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _fetchAttributionInternal:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setChangeCallback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLDCloudKitSyncBase *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__SLDCloudKitSyncReader_setChangeCallback___block_invoke;
  v7[3] = &unk_1E58A9088;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __43__SLDCloudKitSyncReader_setChangeCallback___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 64);
  *(void *)(v3 + 64) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void).cxx_destruct
{
}

- (void)_validateRecordIDString:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(a1, "substringWithRange:", a2, 1);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_0(&dword_19BE17000, v3, v4, "#SLDCK rejecting record id string %@ due to character %@", v5, v6, v7, v8, 2u);
}

- (void)addApplicationIdentifierInternal:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "#SLDCK adding app identifier %@", v2, v3, v4, v5, v6);
}

- (void)_fetchAttributionInternal:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_19BE17000, v0, OS_LOG_TYPE_FAULT, "#SLDCK cannot make SLAttribution for %@: %@", v1, 0x16u);
}

- (void)getHighlightsInternalForApplicationIdentifier:(void *)a3 .cold.1(_DWORD *a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 objectForKeyedSubscript:@"version"];
  *a1 = 138412290;
  *a3 = v5;
  OUTLINED_FUNCTION_11(&dword_19BE17000, v6, v7, "#SLDCK nil identifier in record written by version %@");
}

- (void)getHighlightsInternalForApplicationIdentifier:(void *)a3 .cold.2(_DWORD *a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 objectForKeyedSubscript:@"version"];
  *a1 = 138412290;
  *a3 = v5;
  OUTLINED_FUNCTION_11(&dword_19BE17000, v6, v7, "#SLDCK nil supplementary data in record written by version %@");
}

- (void)syncEngine:(void *)a1 didSaveRecordZone:.cold.1(void *a1)
{
  uint64_t v1 = [a1 zoneID];
  uint64_t v2 = [v1 zoneName];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_19BE17000, v3, v4, "#SLDCK did save record zone %@", v5, v6, v7, v8, v9);
}

- (void)syncEngine:failedToSaveRecordZone:error:.cold.1()
{
  OUTLINED_FUNCTION_17();
  uint64_t v1 = [v0 zoneID];
  uint64_t v2 = [v1 zoneName];
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_0(&dword_19BE17000, v3, v4, "#SLDCK failed to save record zone %@, error: %@", v5, v6, v7, v8, v9);
}

void __60__SLDCloudKitSyncReader_syncEngine_recordToSaveForRecordID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_19BE17000, v0, v1, "#SLDCK giving sync engine contents for record id %@: %@");
}

void __60__SLDCloudKitSyncReader_syncEngine_recordToSaveForRecordID___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "#SLDCK returning nil for recordToSaveForRecordID for unknown id %@", v2, v3, v4, v5, v6);
}

- (void)syncEngine:(void *)a1 didSaveRecord:.cold.1(void *a1)
{
  uint64_t v1 = [a1 recordID];
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_1(&dword_19BE17000, v2, v3, "#SLDCK did save record id %@: %@", v4, v5, v6, v7, v8);
}

void __61__SLDCloudKitSyncReader_syncEngine_failedToSaveRecord_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_17();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_10(v0) recordID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_19BE17000, v2, v3, "#SLDCK error saving apps list record id %@, error: %@", v4, v5, v6, v7, v8);
}

void __61__SLDCloudKitSyncReader_syncEngine_failedToSaveRecord_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_2();
  _os_log_fault_impl(&dword_19BE17000, v0, OS_LOG_TYPE_FAULT, "#SLDCK why were we trying to save a record into the readers zone? %@", v1, 0xCu);
}

- (void)syncEngine:didDeleteRecordWithID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "#SLDCK did delete record id %@", v2, v3, v4, v5, v6);
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "#SLDCK failed to get sync directory URL", v2, v3, v4, v5, v6);
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_14(&dword_19BE17000, v0, (uint64_t)v0, "#SLDCK error writing image to %@: %@", v1);
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "#SLDCK will serialize %@ as a raw image", v2, v3, v4, v5, v6);
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_17();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_10(v0) recordID];
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_0(&dword_19BE17000, v2, v3, "#SLDCK failed to archive ckrecord %@: %@", v4, v5, v6, v7, v8);
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_5()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_14(&dword_19BE17000, v0, (uint64_t)v0, "#SLDCK failed to write ckrecord archive to %@: %@", v1);
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "#SLDCK will serialize %@ as a ckrecord", v2, v3, v4, v5, v6);
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "#SLDCK will write to %@", v2, v3, v4, v5, v6);
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_8()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "#SLDCK writing new index", v2, v3, v4, v5, v6);
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_9()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_14(&dword_19BE17000, v0, (uint64_t)v0, "#SLDCK couldn't make writer dir for %@ due to error %@", v1);
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_10()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "#SLDCK already have record on disk %@", v2, v3, v4, v5, v6);
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_11(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_10(a1) recordID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_19BE17000, v2, v3, "#SLDCK got record %@", v4, v5, v6, v7, v8);
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_12(id *a1)
{
  uint64_t v2 = [(id)OUTLINED_FUNCTION_10((uint64_t)a1) recordID];
  uint64_t v3 = [*a1 recordID];
  uint64_t v4 = [v3 zoneID];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_1(&dword_19BE17000, v5, v6, "#SLDCK rejecting record %@ due to unsupported zone %@", v7, v8, v9, v10, 2u);
}

void __51__SLDCloudKitSyncReader_syncEngine_didFetchRecord___block_invoke_cold_13(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_10(a1) recordID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_19BE17000, v2, v3, "#SLDCK rejecting record %@ due to unsupported version", v4, v5, v6, v7, v8);
}

void __78__SLDCloudKitSyncReader_syncEngine_failedToFetchChangesForRecordZoneID_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "#SLDCK Deleting %@ zone due to missing manatee identity", v2, v3, v4, v5, v6);
}

@end
@interface SLDCloudKitSyncWriter
+ (id)sharedInstance;
- (BOOL)_didHandleSyncError:(id)a3 retryBlock:(id)a4;
- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4;
- (id)_idForRecordIDString:(id)a3;
- (id)_recordIDsFromStrings:(id)a3;
- (id)recordIDStringOfSavedIDString:(id)a3;
- (id)recordZoneID;
- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4;
- (unint64_t)_batchNumberOfRecordIDString:(id)a3;
- (unint64_t)versionOfSavedIDString:(id)a3;
- (void)_savedRecord:(id)a3;
- (void)accountStatusChanged;
- (void)checkForAppChanges;
- (void)checkForAppChangesNow;
- (void)dealloc;
- (void)fetchAndProcessFreshHighlights;
- (void)handleMetadataSizeBecomingEligibleForSync;
- (void)initializeState;
- (void)invalidateHighlights;
- (void)invalidateHighlightsInternal;
- (void)nextTask;
- (void)reset;
- (void)syncEngine:(id)a3 didFetchRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4;
- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToFetchChangesForRecordZoneID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5;
@end

@implementation SLDCloudKitSyncWriter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

void __39__SLDCloudKitSyncWriter_sharedInstance__block_invoke()
{
  id v3 = (id)objc_opt_new();
  v0 = [MEMORY[0x1E4F19EC8] containerWithIdentifier:@"com.apple.SocialLayer"];
  [v3 setContainer:v0];

  [v3 setName:@"ckwriter"];
  v1 = [(SLDCloudKitSyncBase *)[SLDCloudKitSyncWriter alloc] initWithConfiguration:v3];
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;
}

- (void)initializeState
{
  v6.receiver = self;
  v6.super_class = (Class)SLDCloudKitSyncWriter;
  [(SLDCloudKitSyncBase *)&v6 initializeState];
  *(&self->super._saltLocked + 1) = 0;
  *(&self->super._saltLocked + 2) = 0;
  id v3 = *(void **)&self->_freshHighlightsGenerated;
  *(void *)&self->_freshHighlightsGenerated = 0;

  [(SLDCloudKitSyncWriter *)self checkForAppChangesNow];
  v4 = [(SLDCloudKitSyncBase *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SLDCloudKitSyncWriter_initializeState__block_invoke;
  block[3] = &unk_1E58A8720;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __40__SLDCloudKitSyncWriter_initializeState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) nextTask];
}

- (unint64_t)versionOfSavedIDString:(id)a3
{
  id v4 = a3;
  v5 = [(SLDCloudKitSyncBase *)self persistence];
  objc_super v6 = [v5 objectForKeyedSubscript:@"savedIDs"];

  if (v6)
  {
    v7 = [v6 objectForKeyedSubscript:v4];
    v8 = v7;
    if (v7)
    {
      v9 = [v7 objectAtIndexedSubscript:0];
      unint64_t v10 = [v9 unsignedIntegerValue];
    }
    else
    {
      unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (id)recordIDStringOfSavedIDString:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SLDCloudKitSyncBase *)self persistence];
  objc_super v6 = [v5 objectForKeyedSubscript:@"savedIDs"];

  if (v6)
  {
    v7 = [v6 objectForKeyedSubscript:v4];
    v8 = v7;
    if (v7)
    {
      v14[0] = v4;
      v9 = [v7 objectAtIndexedSubscript:1];
      unint64_t v10 = [v9 stringValue];
      v14[1] = v10;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
      v12 = [v11 componentsJoinedByString:@"!"];
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

- (unint64_t)_batchNumberOfRecordIDString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"!" options:6];
  objc_super v6 = [v3 substringFromIndex:v4 + v5];

  unint64_t v7 = [v6 longLongValue];
  return v7;
}

- (id)_idForRecordIDString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "rangeOfString:options:", @"!", 6));

  return v4;
}

- (void)fetchAndProcessFreshHighlights
{
  v2 = self;
  uint64_t v188 = *MEMORY[0x1E4F143B8];
  id v3 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v3);

  v105 = (void *)os_transaction_create();
  uint64_t v4 = SLDaemonLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_INFO, "#SLDCK beginning fetchAndProcessFreshHighlights", buf, 2u);
  }

  uint64_t v5 = objc_opt_new();
  objc_super v6 = *(void **)&v2->_freshHighlightsGenerated;
  *(void *)&v2->_freshHighlightsGenerated = v5;

  unint64_t v7 = [(SLDCloudKitSyncBase *)v2 persistence];
  v8 = [v7 objectForKeyedSubscript:@"savedIDs"];

  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v175 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v175 objects:v187 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v176;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v176 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [(SLDCloudKitSyncWriter *)v2 recordIDStringOfSavedIDString:*(void *)(*((void *)&v175 + 1) + 8 * i)];
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v175 objects:v187 count:16];
    }
    while (v12);
  }
  v104 = v10;

  v16 = objc_opt_new();
  v17 = objc_opt_new();
  v18 = objc_opt_new();
  v19 = objc_opt_new();
  uint64_t v20 = [(SLDCloudKitSyncBase *)v2 getIncrementedBatchNumber];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke;
  aBlock[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8l;
  aBlock[4] = v20;
  v21 = _Block_copy(aBlock);
  v173[0] = MEMORY[0x1E4F143A8];
  v173[1] = 3221225472;
  v173[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_2;
  v173[3] = &unk_1E58A9CB8;
  v173[4] = v2;
  v22 = _Block_copy(v173);
  v171[0] = MEMORY[0x1E4F143A8];
  v171[1] = 3221225472;
  v171[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_3;
  v171[3] = &unk_1E58A9CE0;
  v171[4] = v2;
  id v23 = v16;
  id v172 = v23;
  v24 = _Block_copy(v171);
  v167[0] = MEMORY[0x1E4F143A8];
  v167[1] = 3221225472;
  v167[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_4;
  v167[3] = &unk_1E58A9D08;
  v167[4] = v2;
  id v95 = v9;
  id v168 = v95;
  id v110 = v23;
  id v169 = v110;
  id v25 = v21;
  id v170 = v25;
  v26 = _Block_copy(v167);
  v160[0] = MEMORY[0x1E4F143A8];
  v160[1] = 3221225472;
  v160[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_5;
  v160[3] = &unk_1E58A9D30;
  id v103 = v17;
  id v161 = v103;
  v162 = v2;
  id v27 = v26;
  id v163 = v27;
  id v28 = v25;
  id v164 = v28;
  id v29 = v22;
  id v165 = v29;
  id v30 = v24;
  id v166 = v30;
  v31 = _Block_copy(v160);
  v158[0] = MEMORY[0x1E4F143A8];
  v158[1] = 3221225472;
  v158[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_6;
  v158[3] = &unk_1E58A9D58;
  id v100 = v31;
  id v159 = v100;
  v32 = _Block_copy(v158);
  v149[0] = MEMORY[0x1E4F143A8];
  v149[1] = 3221225472;
  v149[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_7;
  v149[3] = &unk_1E58A9DA8;
  id v99 = v32;
  id v153 = v99;
  id v102 = v18;
  id v150 = v102;
  id v101 = v19;
  id v151 = v101;
  v152 = v2;
  id v33 = v27;
  id v154 = v33;
  id v34 = v28;
  id v155 = v34;
  id v35 = v29;
  id v156 = v35;
  id v36 = v30;
  id v157 = v36;
  v37 = _Block_copy(v149);
  v144[0] = MEMORY[0x1E4F143A8];
  v144[1] = 3221225472;
  v144[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_3_477;
  v144[3] = &unk_1E58A9DD0;
  v144[4] = v2;
  id v38 = v33;
  id v145 = v38;
  id v39 = v34;
  id v146 = v39;
  id v40 = v35;
  id v147 = v40;
  id v41 = v36;
  id v148 = v41;
  v42 = _Block_copy(v144);
  v43 = objc_opt_new();
  v135[0] = MEMORY[0x1E4F143A8];
  v135[1] = 3221225472;
  v135[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_490;
  v135[3] = &unk_1E58A9DF8;
  id v97 = v42;
  id v138 = v97;
  id v96 = v43;
  id v136 = v96;
  id v98 = v37;
  id v139 = v98;
  v137 = v2;
  id v109 = v38;
  id v140 = v109;
  id v108 = v39;
  id v141 = v108;
  id v107 = v40;
  id v142 = v107;
  id v106 = v41;
  id v143 = v106;
  v44 = (void (**)(void *, void, id))_Block_copy(v135);
  v45 = objc_opt_new();
  v46 = [(SLDCloudKitSyncBase *)v2 persistence];
  v47 = [v46 objectForKeyedSubscript:@"lastKnownApps"];

  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  obuint64_t j = v47;
  uint64_t v48 = [obj countByEnumeratingWithState:&v131 objects:v186 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v132;
    uint64_t v111 = *MEMORY[0x1E4F8A1A0];
    uint64_t v112 = *(void *)v132;
    v113 = v2;
    do
    {
      uint64_t v51 = 0;
      uint64_t v114 = v49;
      do
      {
        if (*(void *)v132 != v50) {
          objc_enumerationMutation(obj);
        }
        v52 = *(__CFString **)(*((void *)&v131 + 1) + 8 * v51);
        context = (void *)MEMORY[0x19F3918C0]();
        if ([&unk_1EEC28118 containsObject:v52])
        {
          v53 = objc_opt_new();
          v54 = v52;
          v118 = v54;
          if ([@"com.apple.TVWatchList" isEqual:v54])
          {

            v118 = @"com.apple.tv";
          }
          uint64_t v117 = v51;
          v55 = SLDaemonLogHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v183 = v118;
            __int16 v184 = 2112;
            v185 = v54;
            _os_log_debug_impl(&dword_19BE17000, v55, OS_LOG_TYPE_DEBUG, "#SLDCK Asking Portrait for %@ highlights (requested app identifier: %@)", buf, 0x16u);
          }

          v56 = objc_opt_new();
          id v130 = 0;
          v128[0] = MEMORY[0x1E4F143A8];
          v128[1] = 3221225472;
          v128[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_522;
          v128[3] = &unk_1E58A9E20;
          id v57 = v53;
          id v129 = v57;
          [v56 iterRankedHighlightsWithLimit:100 client:v118 variant:v111 error:&v130 block:v128];
          id v116 = v130;

          long long v126 = 0u;
          long long v127 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          v58 = v57;
          uint64_t v59 = [v58 countByEnumeratingWithState:&v124 objects:v181 count:16];
          if (v59)
          {
            uint64_t v60 = v59;
            uint64_t v61 = *(void *)v125;
            do
            {
              for (uint64_t j = 0; j != v60; ++j)
              {
                if (*(void *)v125 != v61) {
                  objc_enumerationMutation(v58);
                }
                uint64_t v63 = *(void *)(*((void *)&v124 + 1) + 8 * j);
                v64 = (void *)MEMORY[0x19F3918C0]();
                v65 = v44[2](v44, v63, v54);
                if (v65) {
                  [v45 addObject:v65];
                }
              }
              uint64_t v60 = [v58 countByEnumeratingWithState:&v124 objects:v181 count:16];
            }
            while (v60);
          }

          uint64_t v50 = v112;
          v2 = v113;
          uint64_t v49 = v114;
          uint64_t v51 = v117;
        }
        else
        {
          v58 = SLDaemonLogHandle();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v183 = v52;
            __int16 v184 = 2112;
            v185 = (__CFString *)&unk_1EEC28118;
            _os_log_error_impl(&dword_19BE17000, v58, OS_LOG_TYPE_ERROR, "#SLDCK Ignoring sync request for app identifier not in allowlist: %@ (allowed: %@)", buf, 0x16u);
          }
        }

        ++v51;
      }
      while (v51 != v49);
      uint64_t v49 = [obj countByEnumeratingWithState:&v131 objects:v186 count:16];
    }
    while (v49);
  }

  v66 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
  v180 = v66;
  v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v180 count:1];
  v68 = [v110 sortedArrayUsingDescriptors:v67];

  v69 = [v45 arrayByAddingObjectsFromArray:v68];
  v70 = [v69 componentsJoinedByString:@"\n"];
  v71 = [(SLDCloudKitSyncBase *)v2 idStringForType:@"index" uniqueString:v70];

  v72 = (*((void (**)(id, void *))v109 + 2))(v109, v71);
  if (!v72)
  {
    v72 = (*((void (**)(id, void *))v108 + 2))(v108, v71);
    id v73 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    v74 = [(SLDCloudKitSyncWriter *)v2 recordZoneID];
    v75 = (void *)[v73 initWithRecordType:@"index" zoneID:v74];

    v76 = (*((void (**)(id, void *))v107 + 2))(v107, v72);
    [v75 setRecordID:v76];

    v77 = [v75 encryptedValues];
    [v77 setObject:v68 forKeyedSubscript:@"recordIDs"];

    v78 = [v75 encryptedValues];
    [v78 setObject:v45 forKeyedSubscript:@"highlights"];

    (*((void (**)(id, void *))v106 + 2))(v106, v75);
  }

  v79 = [(SLDCloudKitSyncBase *)v2 persistence];
  v80 = [v79 objectForKeyedSubscript:@"savedIDs"];
  v81 = v80;
  if (!v80) {
    v80 = (void *)MEMORY[0x1E4F1CC08];
  }
  v82 = (void *)[v80 mutableCopy];

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v83 = v95;
  uint64_t v84 = [v83 countByEnumeratingWithState:&v120 objects:v179 count:16];
  if (v84)
  {
    uint64_t v85 = v84;
    uint64_t v86 = *(void *)v121;
    do
    {
      for (uint64_t k = 0; k != v85; ++k)
      {
        if (*(void *)v121 != v86) {
          objc_enumerationMutation(v83);
        }
        v88 = [(SLDCloudKitSyncWriter *)v2 _idForRecordIDString:*(void *)(*((void *)&v120 + 1) + 8 * k)];
        [v82 setObject:0 forKeyedSubscript:v88];
      }
      uint64_t v85 = [v83 countByEnumeratingWithState:&v120 objects:v179 count:16];
    }
    while (v85);
  }

  v89 = [(SLDCloudKitSyncBase *)v2 persistence];
  [v89 setObject:v82 forKeyedSubscript:@"savedIDs"];

  v90 = [(SLDCloudKitSyncBase *)v2 syncEngine];
  v91 = [*(id *)&v2->_freshHighlightsGenerated allKeys];
  v92 = [(SLDCloudKitSyncWriter *)v2 _recordIDsFromStrings:v91];
  v93 = [v83 allObjects];
  v94 = [(SLDCloudKitSyncWriter *)v2 _recordIDsFromStrings:v93];
  [v90 addRecordIDsToSave:v92 recordIDsToDelete:v94];

  *(&v2->super._saltLocked + 1) = 1;
  [(SLDCloudKitSyncWriter *)v2 nextTask];
}

id __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  uint64_t v5 = (void *)[[v3 alloc] initWithFormat:@"%@!%tu", v4, *(void *)(a1 + 32)];

  return v5;
}

id __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1A2F8];
  id v4 = a2;
  id v5 = [v3 alloc];
  objc_super v6 = [*(id *)(a1 + 32) recordZoneID];
  unint64_t v7 = (void *)[v5 initWithRecordName:v4 zoneID:v6];

  return v7;
}

void __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addMetadataToRecord:v4];
  id v5 = *(void **)(a1 + 40);
  objc_super v6 = [v4 recordID];
  unint64_t v7 = [v6 recordName];
  [v5 addObject:v7];

  v8 = *(void **)(*(void *)(a1 + 32) + 64);
  id v10 = [v4 recordID];
  v9 = [v10 recordName];
  [v8 setObject:v4 forKeyedSubscript:v9];
}

id __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if ([v3 versionOfSavedIDString:v4] == 7)
  {
    id v5 = [*(id *)(a1 + 32) recordIDStringOfSavedIDString:v4];

    [*(id *)(a1 + 40) removeObject:v5];
    [*(id *)(a1 + 48) addObject:v5];
  }
  else
  {
    id v5 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

    id v6 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:v5];

    if (!v6) {
      goto LABEL_5;
    }
  }
  id v6 = v5;
  id v5 = v6;
LABEL_5:

  return v6;
}

id __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    memset(&c, 0, sizeof(c));
    CC_SHA256_Init(&c);
    id v4 = v3;
    CC_SHA256_Update(&c, (const void *)[v4 bytes], objc_msgSend(v4, "length"));
    CC_SHA256_Final(v38, &c);
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v38 length:16];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (v6)
  {
    id v7 = v6;
    goto LABEL_22;
  }
  v8 = CGImageSourceCreateWithData((CFDataRef)v3, 0);
  if (v8)
  {
    v9 = v8;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v8, 0, 0);
    CFRelease(v9);
    if (ImageAtIndex)
    {
      double Width = (double)CGImageGetWidth(ImageAtIndex);
      double Height = (double)CGImageGetHeight(ImageAtIndex);
      if (Width * Height <= 16384.0)
      {
        Image = CGImageRetain(ImageAtIndex);
      }
      else
      {
        double v13 = Width / Height;
        double v14 = sqrt(16384.0 / v13);
        double v15 = fmax(round(v13 * v14), 1.0);
        double v16 = fmax(round(v14), 1.0);
        RGB = (CGColorSpace *)CGColorSpaceGetRGB();
        v18 = CGBitmapContextCreate(0, (unint64_t)v15, (unint64_t)v16, 8uLL, 0, RGB, 1u);
        if (!v18)
        {
          CFRelease(ImageAtIndex);
          goto LABEL_21;
        }
        v19 = v18;
        CGContextSetInterpolationQuality(v18, kCGInterpolationHigh);
        v42.origin.x = 0.0;
        v42.origin.y = 0.0;
        v42.size.width = v15;
        v42.size.height = v16;
        CGContextDrawImage(v19, v42, ImageAtIndex);
        Image = CGBitmapContextCreateImage(v19);
        CFRelease(v19);
      }
      CGImageRelease(ImageAtIndex);
      if (Image)
      {
        v21 = (__CFData *)objc_opt_new();
        CGImageDestinationRef v22 = CGImageDestinationCreateWithData(v21, @"public.jpeg", 1uLL, 0);
        if (v22)
        {
          id v23 = v22;
          *(void *)id v38 = *MEMORY[0x1E4F2F430];
          v24 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", 0.8, *(void *)v38);
          *(void *)c.count = v24;
          CFDictionaryRef v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&c forKeys:v38 count:1];
          CGImageDestinationAddImage(v23, Image, v25);

          CFRelease(Image);
          BOOL v26 = CGImageDestinationFinalize(v23);
          CFRelease(v23);
          if (v26)
          {
            id v27 = (void *)[(__CFData *)v21 copy];

            if (v27)
            {
              id v28 = [*(id *)(a1 + 40) idStringForType:@"image" uniqueData:v27];
              uint64_t v29 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
              if (v29)
              {
                id v30 = (void *)v29;
                [*(id *)(a1 + 32) setObject:v29 forKeyedSubscript:v5];
                id v7 = v30;
              }
              else
              {
                v32 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
                id v33 = objc_alloc(MEMORY[0x1E4F1A2D8]);
                id v34 = [*(id *)(a1 + 40) recordZoneID];
                id v35 = (void *)[v33 initWithRecordType:@"image" zoneID:v34];

                id v36 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
                [v35 setRecordID:v36];

                v37 = [v35 encryptedValues];
                [v37 setObject:v27 forKeyedSubscript:@"compressed"];

                [*(id *)(a1 + 32) setObject:v32 forKeyedSubscript:v5];
                (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
                id v7 = v32;
              }
              goto LABEL_22;
            }
            goto LABEL_21;
          }
        }
        else
        {
          CGImageRelease(Image);
        }
      }
    }
  }
LABEL_21:
  id v7 = 0;
LABEL_22:

  return v7;
}

id __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  v9 = a4;
  if (v7)
  {
    id v10 = [v8 objectForKeyedSubscript:v7];
    if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
      char v12 = [v11 isEqual:v10];

      if (v12)
      {
        id v13 = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_6_cold_1();
        }
        id v13 = v10;
      }
    }
    else
    {
      double v14 = (void *)MEMORY[0x19F3918C0]();
      double v15 = v9[2](v9);
      if (v15)
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          [v8 setObject:v13 forKeyedSubscript:v7];
        }
        else
        {
          v17 = [MEMORY[0x1E4F1CA98] null];
          [v8 setObject:v17 forKeyedSubscript:v7];
        }
      }
      else
      {
        double v16 = [MEMORY[0x1E4F1CA98] null];
        [v8 setObject:v16 forKeyedSubscript:v7];

        id v13 = 0;
      }
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

id __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_7(void *a1, void *a2)
{
  v82[9] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [SLPerson alloc];
  id v5 = [v3 sender];
  id v81 = 0;
  id v6 = [(SLPerson *)v4 initWithPortraitPerson:v5 error:&v81];
  id v7 = v81;

  if (v7)
  {
    id v8 = SLDaemonLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_7_cold_1();
    }
    id v9 = 0;
  }
  else
  {
    id v10 = [(SLPerson *)v6 contact];
    uint64_t v11 = a1[7];
    char v12 = [v10 identifier];
    uint64_t v13 = a1[4];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_427;
    v79[3] = &unk_1E58A9D80;
    v76 = v10;
    v80 = v76;
    uint64_t v14 = (*(void (**)(uint64_t, void *, uint64_t, void *))(v11 + 16))(v11, v12, v13, v79);

    uint64_t v15 = a1[7];
    uint64_t v16 = [v3 groupPhotoPath];
    v17 = v3;
    v18 = (void *)v16;
    uint64_t v19 = a1[5];
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_2_429;
    v77[3] = &unk_1E58A9D80;
    v74 = v17;
    id v20 = v17;
    id v78 = v20;
    (*(void (**)(uint64_t, void *, uint64_t, void *))(v15 + 16))(v15, v18, v19, v77);
    v21 = id v73 = a1;

    uint64_t v22 = [v20 identifier];
    id v23 = (void *)v22;
    if (v22) {
      v24 = (__CFString *)v22;
    }
    else {
      v24 = &stru_1EEC19158;
    }
    v82[0] = v24;
    uint64_t v25 = [v20 sourceAppDisplayName];
    BOOL v26 = (void *)v25;
    if (v25) {
      id v27 = (__CFString *)v25;
    }
    else {
      id v27 = &stru_1EEC19158;
    }
    v82[1] = v27;
    if ([v20 isStarred]) {
      id v28 = @"1";
    }
    else {
      id v28 = @"0";
    }
    v82[2] = v28;
    if ([v20 isFromMe]) {
      uint64_t v29 = @"1";
    }
    else {
      uint64_t v29 = @"0";
    }
    v82[3] = v29;
    uint64_t v30 = [(SLPerson *)v6 handle];
    v31 = (void *)v30;
    if (v30) {
      v32 = (__CFString *)v30;
    }
    else {
      v32 = &stru_1EEC19158;
    }
    v82[4] = v32;
    uint64_t v33 = [(SLPerson *)v6 displayName];
    id v34 = (void *)v33;
    if (v33) {
      id v35 = (__CFString *)v33;
    }
    else {
      id v35 = &stru_1EEC19158;
    }
    v82[5] = v35;
    uint64_t v36 = [(SLPerson *)v6 shortDisplayName];
    v37 = (void *)v36;
    if (v36) {
      id v38 = (__CFString *)v36;
    }
    else {
      id v38 = &stru_1EEC19158;
    }
    v75 = (void *)v14;
    if (v14) {
      id v39 = (__CFString *)v14;
    }
    else {
      id v39 = &stru_1EEC19158;
    }
    uint64_t v40 = (void *)v21;
    v82[6] = v38;
    v82[7] = v39;
    if (v21) {
      id v41 = (__CFString *)v21;
    }
    else {
      id v41 = &stru_1EEC19158;
    }
    v82[8] = v41;
    CGRect v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:9];

    v43 = (void *)v73[6];
    v44 = [v42 componentsJoinedByString:@"\n"];
    v45 = [v43 idStringForType:@"attribution" uniqueString:v44];

    v46 = (*(void (**)(void))(v73[8] + 16))();
    if (v46)
    {
      id v9 = v46;
    }
    else
    {
      v72 = (*(void (**)(void))(v73[9] + 16))();
      id v47 = objc_alloc(MEMORY[0x1E4F1A2D8]);
      uint64_t v48 = [(id)v73[6] recordZoneID];
      uint64_t v49 = (void *)[v47 initWithRecordType:@"attribution" zoneID:v48];

      uint64_t v50 = (*(void (**)(void))(v73[10] + 16))();
      [v49 setRecordID:v50];

      uint64_t v51 = [v20 identifier];
      v52 = [v49 encryptedValues];
      [v52 setObject:v51 forKeyedSubscript:@"identifier"];

      v53 = [v20 sourceAppDisplayName];
      v54 = [v49 encryptedValues];
      [v54 setObject:v53 forKeyedSubscript:@"sourceAppDisplayName"];

      v55 = (void *)MEMORY[0x1E4F28ED0];
      v56 = [v20 timestamp];
      [v56 timeIntervalSinceReferenceDate];
      id v57 = objc_msgSend(v55, "numberWithDouble:");
      v58 = [v49 encryptedValues];
      [v58 setObject:v57 forKeyedSubscript:@"timestamp"];

      uint64_t v59 = [(SLPerson *)v6 handle];
      uint64_t v60 = [v49 encryptedValues];
      [v60 setObject:v59 forKeyedSubscript:@"handle"];

      uint64_t v61 = [(SLPerson *)v6 displayName];
      v62 = [v49 encryptedValues];
      [v62 setObject:v61 forKeyedSubscript:@"displayName"];

      uint64_t v63 = [(SLPerson *)v6 shortDisplayName];
      v64 = [v49 encryptedValues];
      [v64 setObject:v63 forKeyedSubscript:@"shortDisplayName"];

      v65 = [v49 encryptedValues];
      [v65 setObject:v75 forKeyedSubscript:@"contactPhoto"];

      v66 = [v49 encryptedValues];
      [v66 setObject:v21 forKeyedSubscript:@"groupPhoto"];

      v67 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v20, "isStarred"));
      v68 = [v49 encryptedValues];
      [v68 setObject:v67 forKeyedSubscript:@"starred"];

      v69 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v20, "isFromMe"));
      v70 = [v49 encryptedValues];
      [v70 setObject:v69 forKeyedSubscript:@"fromMe"];

      (*(void (**)(void))(v73[11] + 16))();
      id v9 = v72;
    }
    id v8 = v76;
    id v7 = 0;
    id v3 = v74;
  }

  return v9;
}

uint64_t __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_427(uint64_t a1)
{
  return [*(id *)(a1 + 32) thumbnailImageData];
}

id __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_2_429(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F1C9B8];
  v2 = [*(id *)(a1 + 32) groupPhotoPath];
  id v3 = [v1 dataWithContentsOfURL:v2 options:1 error:0];

  return v3;
}

id __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_3_477(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 identifier];
  id v6 = [v5 dataUsingEncoding:4];
  id v7 = [v4 idStringForType:@"entity" uniqueData:v6];

  id v8 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v8)
  {
    id v9 = v8;
    id v10 = v9;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = objc_alloc(MEMORY[0x1E4F1A2D8]);
    char v12 = [*(id *)(a1 + 32) recordZoneID];
    uint64_t v13 = (void *)[v11 initWithRecordType:@"entity" zoneID:v12];

    uint64_t v14 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [v13 setRecordID:v14];

    uint64_t v15 = [v3 identifier];
    uint64_t v16 = [v13 encryptedValues];
    [v16 setObject:v15 forKeyedSubscript:@"identifier"];

    v17 = [v3 resourceURL];
    v18 = [v17 absoluteString];
    uint64_t v19 = [v13 encryptedValues];
    [v19 setObject:v18 forKeyedSubscript:@"resourceURL"];

    id v20 = [v3 supplementaryData];
    LODWORD(v18) = SLDValidateSupplementaryData(v20);

    if (v18)
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F28DB0];
      uint64_t v22 = [v3 supplementaryData];
      id v28 = 0;
      id v23 = [v21 archivedDataWithRootObject:v22 requiringSecureCoding:1 error:&v28];
      id v24 = v28;

      if (v24)
      {
        uint64_t v25 = SLDaemonLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
          __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_3_477_cold_1();
        }

        id v10 = 0;
      }
      else
      {
        BOOL v26 = [v13 encryptedValues];
        [v26 setObject:v23 forKeyedSubscript:@"supplementaryData"];

        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        id v10 = v9;
      }
    }
    else
    {
      id v10 = 0;
    }
  }
  return v10;
}

id __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_490(uint64_t a1, void *a2, void *a3)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (v7)
  {
    id v53 = v7;
    id v55 = v6;
    id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v9 = [v5 attributionIdentifiers];
    id v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v54 = v5;
    id v11 = [v5 attributionIdentifiers];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v58 objects:v67 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v59;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v59 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v58 + 1) + 8 * v15);
          v17 = *(void **)(a1 + 32);
          id v57 = 0;
          v18 = [v17 attributionForIdentifier:v16 error:&v57];
          id v19 = v57;
          if (v19)
          {
            id v20 = SLDaemonLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v64 = v16;
              __int16 v65 = 2112;
              id v66 = v19;
              _os_log_fault_impl(&dword_19BE17000, v20, OS_LOG_TYPE_FAULT, "#SLDCK portrait store couldn't retrieve attribution %@ (err: %@)", buf, 0x16u);
            }
LABEL_10:

            goto LABEL_11;
          }
          if (v18)
          {
            id v20 = (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
            if (v20) {
              [v10 addObject:v20];
            }
            goto LABEL_10;
          }
LABEL_11:

          ++v15;
        }
        while (v13 != v15);
        uint64_t v21 = [v11 countByEnumeratingWithState:&v58 objects:v67 count:16];
        uint64_t v13 = v21;
      }
      while (v21);
    }

    uint64_t v22 = [v54 timestamp];
    [v22 timeIntervalSinceReferenceDate];
    double v24 = v23;

    uint64_t v25 = [v54 score];
    BOOL v26 = objc_opt_new();
    [v26 setUsesSignificantDigits:1];
    [v26 setMaximumSignificantDigits:14];
    [v26 setMinimumSignificantDigits:14];
    if (v25) {
      id v27 = v25;
    }
    else {
      id v27 = &unk_1EEC280E8;
    }
    uint64_t v28 = [v26 stringFromNumber:v27];
    v62[0] = v53;
    v62[1] = v55;
    uint64_t v29 = [MEMORY[0x1E4F28ED0] numberWithDouble:v24];
    uint64_t v30 = [v29 stringValue];
    v62[2] = v30;
    v62[3] = v28;
    v56 = (void *)v28;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:4];
    v32 = [v10 sortedArrayUsingSelector:sel_compare_];
    uint64_t v33 = [v31 arrayByAddingObjectsFromArray:v32];

    id v34 = *(void **)(a1 + 40);
    id v35 = [v33 componentsJoinedByString:@"\n"];
    uint64_t v36 = [v34 idStringForType:@"highlight" uniqueString:v35];

    v37 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    if (v37)
    {
      id v38 = v37;
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      id v39 = v52 = v33;
      id v40 = objc_alloc(MEMORY[0x1E4F1A2D8]);
      id v41 = [*(id *)(a1 + 40) recordZoneID];
      CGRect v42 = (void *)[v40 initWithRecordType:@"highlight" zoneID:v41];

      v43 = (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
      [v42 setRecordID:v43];

      v44 = [v42 encryptedValues];
      [v44 setObject:v53 forKeyedSubscript:@"entity"];

      v45 = [MEMORY[0x1E4F28ED0] numberWithDouble:v24];
      v46 = [v42 encryptedValues];
      [v46 setObject:v45 forKeyedSubscript:@"timestamp"];

      id v47 = [v42 encryptedValues];
      [v47 setObject:v10 forKeyedSubscript:@"attributions"];

      uint64_t v48 = [v42 encryptedValues];
      [v48 setObject:v55 forKeyedSubscript:@"applicationIdentifier"];

      uint64_t v49 = [v42 encryptedValues];
      [v49 setObject:v25 forKeyedSubscript:@"score"];

      (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
      id v50 = v39;
      uint64_t v33 = v52;
      id v38 = v50;
    }
    id v5 = v54;
    id v6 = v55;
    id v7 = v53;
  }
  else
  {
    id v38 = 0;
  }

  return v38;
}

uint64_t __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_522(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)_recordIDsFromStrings:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([v4 count])
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    id v7 = [(SLDCloudKitSyncWriter *)self recordZoneID];
    if (v7)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = v4;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v20 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            id v14 = objc_alloc(MEMORY[0x1E4F1A2F8]);
            uint64_t v15 = objc_msgSend(v14, "initWithRecordName:zoneID:", v13, v7, (void)v19);
            [v6 addObject:v15];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v10);
      }

      id v16 = v6;
    }
    else
    {
      v17 = SLDaemonLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        -[SLDCloudKitSyncWriter _recordIDsFromStrings:]();
      }

      id v16 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v16 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

- (id)recordZoneID
{
  id v3 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SLDCloudKitSyncBase *)self persistence];
  id v5 = [v4 objectForKeyedSubscript:@"recordZoneID"];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1A320]);
    id v7 = (void *)[v6 initWithZoneName:v5 ownerName:*MEMORY[0x1E4F19C08]];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)reset
{
  id v3 = SLDaemonLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_DEFAULT, "#SLDCK RESET RESET RESET!", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)SLDCloudKitSyncWriter;
  [(SLDCloudKitSyncBase *)&v4 reset];
  [(SLDCloudKitSyncWriter *)self nextTask];
}

- (void)accountStatusChanged
{
  v3.receiver = self;
  v3.super_class = (Class)SLDCloudKitSyncWriter;
  [(SLDCloudKitSyncBase *)&v3 accountStatusChanged];
  [(SLDCloudKitSyncWriter *)self nextTask];
}

- (void)handleMetadataSizeBecomingEligibleForSync
{
  v5.receiver = self;
  v5.super_class = (Class)SLDCloudKitSyncWriter;
  [(SLDCloudKitSyncBase *)&v5 handleMetadataSizeBecomingEligibleForSync];
  objc_super v3 = SLDaemonLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_19BE17000, v3, OS_LOG_TYPE_DEFAULT, "#SLDCK nextTask: sync engine metadata should be small enough now", v4, 2u);
  }

  [(SLDCloudKitSyncWriter *)self nextTask];
}

- (void)nextTask
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "#SLDCK nextTask: do nothing due to no account available", v2, v3, v4, v5, v6);
}

- (void)checkForAppChanges
{
  uint64_t v3 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v3);

  if (!*(&self->super._saltLocked + 2))
  {
    *(&self->super._saltLocked + 2) = 1;
    objc_initWeak(&location, self);
    dispatch_time_t v4 = dispatch_time(0, 10000000000);
    uint64_t v5 = [(SLDCloudKitSyncBase *)self queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__SLDCloudKitSyncWriter_checkForAppChanges__block_invoke;
    v6[3] = &unk_1E58A85E0;
    objc_copyWeak(&v7, &location);
    dispatch_after(v4, v5, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __43__SLDCloudKitSyncWriter_checkForAppChanges__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[59])
  {
    WeakRetained[59] = 0;
    uint64_t v2 = WeakRetained;
    [WeakRetained checkForAppChangesNow];
    WeakRetained = v2;
  }
}

- (void)checkForAppChangesNow
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v3);

  dispatch_time_t v4 = [(SLDCloudKitSyncBase *)self persistence];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"readers"];

  uint8_t v6 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = objc_msgSend(v5, "allValues", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 addObjectsFromArray:*(void *)(*((void *)&v22 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v31 count:16];
    }
    while (v9);
  }

  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"self" ascending:1];
  uint64_t v30 = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  id v14 = [v6 sortedArrayUsingDescriptors:v13];

  uint64_t v15 = [(SLDCloudKitSyncBase *)self persistence];
  id v16 = [v15 objectForKeyedSubscript:@"lastKnownApps"];
  char v17 = [v16 isEqual:v14];

  if ((v17 & 1) == 0)
  {
    v18 = SLDaemonLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = [(SLDCloudKitSyncBase *)self persistence];
      long long v20 = [v19 objectForKeyedSubscript:@"lastKnownApps"];
      *(_DWORD *)buf = 138412546;
      id v27 = v20;
      __int16 v28 = 2112;
      uint64_t v29 = v14;
      _os_log_impl(&dword_19BE17000, v18, OS_LOG_TYPE_DEFAULT, "#SLDCK app list changed (prev %@, now %@)", buf, 0x16u);
    }
    long long v21 = [(SLDCloudKitSyncBase *)self persistence];
    [v21 setObject:v14 forKeyedSubscript:@"lastKnownApps"];

    [(SLDCloudKitSyncWriter *)self invalidateHighlightsInternal];
  }
}

- (void)invalidateHighlightsInternal
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "#SLDCK highlights invalidated", v2, v3, v4, v5, v6);
}

uint64_t __53__SLDCloudKitSyncWriter_invalidateHighlightsInternal__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) nextTask];
}

- (BOOL)_didHandleSyncError:(id)a3 retryBlock:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  uint64_t v8 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [v6 domain];
  if ([v9 isEqual:*MEMORY[0x1E4F19C40]])
  {
  }
  else
  {
    uint64_t v10 = [v6 domain];
    int v11 = [v10 isEqual:*MEMORY[0x1E4F19CA0]];

    if (!v11)
    {
      char v17 = [v6 domain];
      int v18 = [v17 isEqual:*MEMORY[0x1E4F281F8]];

      if (!v18 || ([v6 code] | 2) != 0x1003 || !v7) {
        goto LABEL_24;
      }
      long long v19 = SLDaemonLogHandle();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  uint64_t v12 = [v6 code];
  if (v12 != 18)
  {
    if (v12 != 34)
    {
      if (v12 == 112)
      {
        uint64_t v13 = SLDaemonLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[SLDCloudKitSyncWriter _didHandleSyncError:retryBlock:]();
        }

        id v14 = [(SLDCloudKitSyncWriter *)self recordZoneID];
        [(SLDCloudKitSyncWriter *)self reset];
        if (v14)
        {
          uint64_t v15 = [(SLDCloudKitSyncBase *)self syncEngine];
          v23[0] = v14;
          id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
          [v15 addRecordZonesToSave:0 recordZoneIDsToDelete:v16];
        }
        [(SLDCloudKitSyncWriter *)self nextTask];

        goto LABEL_23;
      }
LABEL_24:
      BOOL v21 = 0;
      goto LABEL_25;
    }
    if (!v7) {
      goto LABEL_24;
    }
    long long v19 = SLDaemonLogHandle();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_21;
    }
LABEL_20:
    -[SLDCloudKitSyncWriter _didHandleSyncError:retryBlock:]();
LABEL_21:

    v7[2](v7);
    goto LABEL_22;
  }
  long long v20 = [(SLDCloudKitSyncBase *)self persistence];
  [v20 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"incompatibleVersion"];

LABEL_22:
  [(SLDCloudKitSyncWriter *)self nextTask];
LABEL_23:
  BOOL v21 = 1;
LABEL_25:

  return v21;
}

- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SLDCloudKitSyncBase *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__SLDCloudKitSyncWriter_syncEngine_didSaveRecordZone___block_invoke;
  block[3] = &unk_1E58A9C70;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __54__SLDCloudKitSyncWriter_syncEngine_didSaveRecordZone___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) syncEngine];

  if (v3 == v4)
  {
    uint64_t v5 = [*(id *)(a1 + 40) persistence];
    id v6 = [v5 objectForKeyedSubscript:@"recordZoneID"];
    uint64_t v8 = *(void **)(a1 + 48);
    uint64_t v7 = a1 + 48;
    id v9 = [v8 zoneID];
    id v10 = [v9 zoneName];
    char v11 = [v6 isEqual:v10];

    if (v11)
    {
      id v12 = [*v2 persistence];
      uint64_t v13 = [v12 objectForKeyedSubscript:@"recordZoneIDSaved"];
      char v14 = [v13 BOOLValue];

      if ((v14 & 1) == 0)
      {
        uint64_t v15 = SLDaemonLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          __54__SLDCloudKitSyncWriter_syncEngine_didSaveRecordZone___block_invoke_cold_1();
        }

        id v16 = [*v2 persistence];
        [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"recordZoneIDSaved"];

        [*v2 nextTask];
      }
    }
    else
    {
      char v17 = SLDaemonLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        __54__SLDCloudKitSyncWriter_syncEngine_didSaveRecordZone___block_invoke_cold_2(v7, v2, v17);
      }
    }
  }
}

- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = [(SLDCloudKitSyncBase *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecordZone_error___block_invoke;
  v15[3] = &unk_1E58A9E48;
  id v16 = v8;
  char v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(v11, v15);
}

void __65__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecordZone_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) syncEngine];

  if (v2 == v3)
  {
    uint64_t v4 = [*(id *)(a1 + 40) persistence];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"recordZoneIDSaved"];
    char v6 = [v5 BOOLValue];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [*(id *)(a1 + 40) persistence];
      id v8 = [v7 objectForKeyedSubscript:@"recordZoneID"];
      id v9 = [*(id *)(a1 + 48) zoneID];
      id v10 = [v9 zoneName];
      int v11 = [v8 isEqual:v10];

      if (v11)
      {
        id v12 = SLDaemonLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          __65__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecordZone_error___block_invoke_cold_1();
        }

        id v13 = *(void **)(a1 + 40);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __65__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecordZone_error___block_invoke_556;
        v20[3] = &unk_1E58A8680;
        v20[4] = v13;
        uint64_t v14 = *(void *)(a1 + 56);
        id v21 = *(id *)(a1 + 48);
        if (([v13 _didHandleSyncError:v14 retryBlock:v20] & 1) == 0)
        {
          uint64_t v15 = (void *)*MEMORY[0x1E4F19C40];
          id v16 = [*(id *)(a1 + 56) domain];
          LODWORD(v15) = [v15 isEqual:v16];

          if (v15 && ((uint64_t v17 = [*(id *)(a1 + 56) code], v17 == 32) || v17 == 9))
          {
            id v18 = *(void **)(a1 + 40);
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __65__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecordZone_error___block_invoke_2;
            v19[3] = &unk_1E58A8720;
            v19[4] = v18;
            [v18 checkForAccountChangesNowWithCompletion:v19];
          }
          else
          {
            [*(id *)(a1 + 40) nextTask];
          }
        }
      }
    }
  }
}

void __65__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecordZone_error___block_invoke_556(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) syncEngine];
  v4[0] = *(void *)(a1 + 40);
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 addRecordZonesToSave:v3 recordZoneIDsToDelete:0];
}

uint64_t __65__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecordZone_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v2);

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 nextTask];
}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__12;
  long long v22 = __Block_byref_object_dispose__12;
  id v23 = 0;
  id v8 = [(SLDCloudKitSyncBase *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__SLDCloudKitSyncWriter_syncEngine_recordToSaveForRecordID___block_invoke;
  v13[3] = &unk_1E58A9E70;
  id v14 = v6;
  uint64_t v15 = self;
  id v16 = v7;
  uint64_t v17 = &v18;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __60__SLDCloudKitSyncWriter_syncEngine_recordToSaveForRecordID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) syncEngine];

  if (v2 == v3)
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 64);
    if (v4)
    {
      id v6 = *(void **)(a1 + 48);
      uint64_t v5 = a1 + 48;
      id v7 = [v6 recordName];
      uint64_t v8 = [v4 objectForKeyedSubscript:v7];
      uint64_t v9 = *(void *)(*(void *)(v5 + 8) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      uint64_t v11 = *(void *)(*(void *)(*(void *)(v5 + 8) + 8) + 40);
      id v12 = SLDaemonLogHandle();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v11)
      {
        if (v13) {
          __60__SLDCloudKitSyncWriter_syncEngine_recordToSaveForRecordID___block_invoke_cold_3();
        }
      }
      else if (v13)
      {
        __60__SLDCloudKitSyncWriter_syncEngine_recordToSaveForRecordID___block_invoke_cold_2();
      }
    }
    else
    {
      id v12 = SLDaemonLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __60__SLDCloudKitSyncWriter_syncEngine_recordToSaveForRecordID___block_invoke_cold_1();
      }
    }
  }
}

- (void)_savedRecord:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SLDCloudKitSyncBase *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 recordID];
  id v7 = [v6 recordName];

  uint64_t v8 = SLDaemonLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SLDCloudKitSyncWriter _savedRecord:].cold.4(v4);
  }

  uint64_t v9 = [*(id *)&self->_freshHighlightsGenerated objectForKeyedSubscript:v7];

  if (v9)
  {
    [*(id *)&self->_freshHighlightsGenerated setObject:0 forKeyedSubscript:v7];
    id v10 = [(SLDCloudKitSyncBase *)self persistence];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"savedIDs"];
    id v12 = v11;
    if (!v11) {
      uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
    }
    BOOL v13 = (void *)[v11 mutableCopy];

    unint64_t v14 = [(SLDCloudKitSyncWriter *)self _batchNumberOfRecordIDString:v7];
    uint64_t v15 = [v4 objectForKeyedSubscript:@"version"];
    id v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", v14, v15);
    v26[1] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    uint64_t v18 = [(SLDCloudKitSyncWriter *)self _idForRecordIDString:v7];
    [v13 setObject:v17 forKeyedSubscript:v18];

    id v19 = [(SLDCloudKitSyncBase *)self persistence];
    [v19 setObject:v13 forKeyedSubscript:@"savedIDs"];

    uint64_t v20 = SLDaemonLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[SLDCloudKitSyncWriter _savedRecord:](v4);
    }

    [(SLDCloudKitSyncWriter *)self nextTask];
  }
  else
  {
    id v21 = [(SLDCloudKitSyncWriter *)self recordIDStringOfSavedIDString:v7];
    BOOL v13 = v21;
    if (v21 && ([v21 isEqual:v7] & 1) != 0)
    {
      long long v22 = SLDaemonLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[SLDCloudKitSyncWriter _savedRecord:](v4);
      }
    }
    else
    {
      id v23 = SLDaemonLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[SLDCloudKitSyncWriter _savedRecord:](v4);
      }

      long long v22 = [(SLDCloudKitSyncBase *)self syncEngine];
      long long v24 = [v4 recordID];
      v27[0] = v24;
      long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      [v22 addRecordIDsToSave:MEMORY[0x1E4F1CBF0] recordIDsToDelete:v25];
    }
  }
}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SLDCloudKitSyncBase *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__SLDCloudKitSyncWriter_syncEngine_didSaveRecord___block_invoke;
  block[3] = &unk_1E58A9C70;
  id v12 = v6;
  BOOL v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __50__SLDCloudKitSyncWriter_syncEngine_didSaveRecord___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) syncEngine];

  if (v2 == v3)
  {
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    [v4 _savedRecord:v5];
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
  v15[2] = __61__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecord_error___block_invoke;
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

void __61__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecord_error___block_invoke(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) syncEngine];

  if (v2 == v3)
  {
    id v4 = [*(id *)(a1 + 48) recordID];
    uint64_t v5 = [v4 zoneID];
    id v6 = [v5 zoneName];
    id v7 = [*(id *)(a1 + 40) persistence];
    id v8 = [v7 objectForKeyedSubscript:@"recordZoneID"];
    char v9 = [v6 isEqual:v8];

    id v10 = SLDaemonLogHandle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      if (v11) {
        __61__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecord_error___block_invoke_cold_1(a1 + 48);
      }

      id v12 = *(void **)(a1 + 40);
      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      BOOL v26 = __61__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecord_error___block_invoke_557;
      id v27 = &unk_1E58A8680;
      __int16 v28 = v12;
      uint64_t v13 = *(void *)(a1 + 56);
      id v29 = *(id *)(a1 + 48);
      if ([v12 _didHandleSyncError:v13 retryBlock:&v24]) {
        goto LABEL_22;
      }
      id v14 = (void *)*MEMORY[0x1E4F19C40];
      uint64_t v15 = objc_msgSend(*(id *)(a1 + 56), "domain", v24, v25, v26, v27, v28);
      LODWORD(v14) = [v14 isEqual:v15];

      if (v14)
      {
        uint64_t v16 = [*(id *)(a1 + 56) code];
        if (v16 <= 25)
        {
          if (v16 != 9)
          {
            if (v16 == 14) {
              [*(id *)(a1 + 40) _savedRecord:*(void *)(a1 + 48)];
            }
            goto LABEL_21;
          }
          goto LABEL_19;
        }
        if (v16 != 26 && v16 != 28)
        {
          if (v16 != 32) {
            goto LABEL_21;
          }
LABEL_19:
          [*(id *)(a1 + 40) checkForAccountChanges];
          uint64_t v17 = *(void **)(*(void *)(a1 + 40) + 64);
          id v18 = [*(id *)(a1 + 48) recordID];
          id v19 = [v18 recordName];
          uint64_t v20 = [v17 objectForKeyedSubscript:v19];

          if (v20)
          {
            id v21 = [*(id *)(a1 + 40) syncEngine];
            long long v22 = [*(id *)(a1 + 48) recordID];
            v30[0] = v22;
            id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
            [v21 addRecordIDsToSave:v23 recordIDsToDelete:0];
          }
          goto LABEL_21;
        }
        [*(id *)(a1 + 40) reset];
      }
LABEL_21:
      [*(id *)(a1 + 40) nextTask];
LABEL_22:

      return;
    }
    if (v11) {
      __61__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecord_error___block_invoke_cold_2(a1 + 48);
    }
  }
}

void __61__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecord_error___block_invoke_557(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v1)
  {
    uint64_t v3 = [*(id *)(a1 + 40) recordID];
    id v4 = [v3 recordName];
    uint64_t v5 = [v1 objectForKeyedSubscript:v4];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) syncEngine];
      id v7 = [*(id *)(a1 + 40) recordID];
      v9[0] = v7;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      [v6 addRecordIDsToSave:v8 recordIDsToDelete:0];
    }
  }
}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(SLDCloudKitSyncBase *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__SLDCloudKitSyncWriter_syncEngine_failedToDeleteRecordWithID_error___block_invoke;
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

void __69__SLDCloudKitSyncWriter_syncEngine_failedToDeleteRecordWithID_error___block_invoke(uint64_t a1)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) syncEngine];

  if (v2 == v3)
  {
    id v4 = [*(id *)(a1 + 48) zoneID];
    uint64_t v5 = [v4 zoneName];
    id v6 = [*(id *)(a1 + 40) persistence];
    id v7 = [v6 objectForKeyedSubscript:@"recordZoneID"];
    int v8 = [v5 isEqual:v7];

    if (v8)
    {
      id v9 = SLDaemonLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __69__SLDCloudKitSyncWriter_syncEngine_failedToDeleteRecordWithID_error___block_invoke_cold_1();
      }

      id v10 = *(void **)(a1 + 40);
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      uint64_t v24 = __69__SLDCloudKitSyncWriter_syncEngine_failedToDeleteRecordWithID_error___block_invoke_558;
      uint64_t v25 = &unk_1E58A8680;
      BOOL v26 = v10;
      uint64_t v11 = *(void *)(a1 + 56);
      id v27 = *(id *)(a1 + 48);
      if ([v10 _didHandleSyncError:v11 retryBlock:&v22]) {
        goto LABEL_17;
      }
      id v12 = objc_msgSend(*(id *)(a1 + 56), "domain", v22, v23, v24, v25, v26);
      int v13 = [v12 isEqual:*MEMORY[0x1E4F19C40]];

      if (v13)
      {
        uint64_t v14 = [*(id *)(a1 + 56) code];
        if (v14 <= 27)
        {
          if (v14 != 9)
          {
            if (v14 != 26) {
              goto LABEL_16;
            }
LABEL_13:
            uint64_t v15 = [*(id *)(a1 + 48) zoneID];
            id v16 = [v15 zoneName];
            uint64_t v17 = [*(id *)(a1 + 40) persistence];
            id v18 = [v17 objectForKeyedSubscript:@"recordZoneID"];
            int v19 = [v16 isEqual:v18];

            if (v19) {
              [*(id *)(a1 + 40) reset];
            }
            goto LABEL_16;
          }
          goto LABEL_15;
        }
        if (v14 == 32)
        {
LABEL_15:
          [*(id *)(a1 + 40) checkForAccountChanges];
          uint64_t v20 = [*(id *)(a1 + 40) syncEngine];
          v28[0] = *(void *)(a1 + 48);
          id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
          [v20 addRecordIDsToSave:0 recordIDsToDelete:v21];

          goto LABEL_16;
        }
        if (v14 == 28) {
          goto LABEL_13;
        }
      }
LABEL_16:
      [*(id *)(a1 + 40) nextTask];
LABEL_17:
    }
  }
}

void __69__SLDCloudKitSyncWriter_syncEngine_failedToDeleteRecordWithID_error___block_invoke_558(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) syncEngine];
  v4[0] = *(void *)(a1 + 40);
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 addRecordIDsToSave:0 recordIDsToDelete:v3];
}

- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  int v8 = [(SLDCloudKitSyncBase *)self queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__SLDCloudKitSyncWriter_syncEngine_shouldFetchChangesForZoneID___block_invoke;
  v12[3] = &unk_1E58A9E98;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v7) = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return (char)v7;
}

void __64__SLDCloudKitSyncWriter_syncEngine_shouldFetchChangesForZoneID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) syncEngine];

  if (v2 == v3)
  {
    uint64_t v5 = [*(id *)(a1 + 48) zoneName];
    int v6 = [@"readers" isEqual:v5];

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
  int v8 = [(SLDCloudKitSyncBase *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SLDCloudKitSyncWriter_syncEngine_didFetchRecord___block_invoke;
  block[3] = &unk_1E58A9C70;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __51__SLDCloudKitSyncWriter_syncEngine_didFetchRecord___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) syncEngine];

  if (v2 == v3)
  {
    uint64_t v4 = SLDaemonLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 48) recordID];
      int v22 = 138412290;
      uint64_t v23 = v5;
      _os_log_impl(&dword_19BE17000, v4, OS_LOG_TYPE_DEFAULT, "#SLDCK fetched %@", (uint8_t *)&v22, 0xCu);
    }
    id v6 = [*(id *)(a1 + 48) recordID];
    id v7 = [v6 zoneID];
    int v8 = [v7 zoneName];
    int v9 = [@"readers" isEqual:v8];

    if (v9)
    {
      if ([*(id *)(a1 + 40) recordSupportsOurVersion:*(void *)(a1 + 48)])
      {
        id v10 = [*(id *)(a1 + 48) recordType];
        int v11 = [@"reader" isEqual:v10];

        if (v11)
        {
          id v12 = [*(id *)(a1 + 40) persistence];
          id v13 = [v12 objectForKeyedSubscript:@"readers"];
          id v14 = v13;
          if (!v13) {
            id v13 = (void *)MEMORY[0x1E4F1CC08];
          }
          id v15 = (void *)[v13 mutableCopy];

          id v16 = [*(id *)(a1 + 48) encryptedValues];
          uint64_t v17 = [v16 objectForKeyedSubscript:@"applicationIdentifiers"];
          id v18 = [*(id *)(a1 + 48) recordID];
          uint64_t v19 = [v18 recordName];
          [v15 setObject:v17 forKeyedSubscript:v19];

          char v20 = SLDaemonLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            __51__SLDCloudKitSyncWriter_syncEngine_didFetchRecord___block_invoke_cold_1((id *)(a1 + 48));
          }

          id v21 = [*(id *)(a1 + 40) persistence];
          [v21 setObject:v15 forKeyedSubscript:@"readers"];

          [*(id *)(a1 + 40) checkForAppChanges];
        }
      }
    }
  }
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(SLDCloudKitSyncBase *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__SLDCloudKitSyncWriter_syncEngine_recordWithIDWasDeleted_recordType___block_invoke;
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

void __70__SLDCloudKitSyncWriter_syncEngine_recordWithIDWasDeleted_recordType___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) syncEngine];

  if (v2 == v3)
  {
    id v13 = [*(id *)(a1 + 48) zoneID];
    uint64_t v4 = [v13 zoneName];
    if ([@"readers" isEqual:v4])
    {
      int v5 = [@"reader" isEqual:*(void *)(a1 + 56)];

      if (v5)
      {
        id v6 = SLDaemonLogHandle();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          __70__SLDCloudKitSyncWriter_syncEngine_recordWithIDWasDeleted_recordType___block_invoke_cold_1();
        }

        id v7 = [*(id *)(a1 + 40) persistence];
        id v8 = [v7 objectForKeyedSubscript:@"readers"];
        id v9 = v8;
        if (!v8) {
          id v8 = (void *)MEMORY[0x1E4F1CC08];
        }
        id v10 = (void *)[v8 mutableCopy];

        int v11 = [*(id *)(a1 + 48) recordName];
        [v10 setObject:0 forKeyedSubscript:v11];

        id v12 = [*(id *)(a1 + 40) persistence];
        [v12 setObject:v10 forKeyedSubscript:@"readers"];

        [*(id *)(a1 + 40) checkForAppChanges];
      }
    }
    else
    {
    }
  }
}

- (void)syncEngine:(id)a3 failedToFetchChangesForRecordZoneID:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(SLDCloudKitSyncBase *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__SLDCloudKitSyncWriter_syncEngine_failedToFetchChangesForRecordZoneID_error___block_invoke;
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

void __78__SLDCloudKitSyncWriter_syncEngine_failedToFetchChangesForRecordZoneID_error___block_invoke(uint64_t a1)
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
      int v11 = [@"readers" isEqual:v10];

      if (v11)
      {
        id v12 = SLDaemonLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          __78__SLDCloudKitSyncWriter_syncEngine_failedToFetchChangesForRecordZoneID_error___block_invoke_cold_1();
        }

        id v13 = [*(id *)(a1 + 40) syncEngine];
        uint64_t v15 = *(void *)(a1 + 48);
        id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
        [v13 addRecordZonesToSave:0 recordZoneIDsToDelete:v14];
      }
    }
  }
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_19BE17000, v0, OS_LOG_TYPE_FAULT, "#SLDCK Dellocating while writes are pending! This should never happen!", v1, 2u);
}

- (void)invalidateHighlights
{
  uint64_t v3 = [(SLDCloudKitSyncBase *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__SLDCloudKitSyncWriter_invalidateHighlights__block_invoke;
  block[3] = &unk_1E58A8720;
  void block[4] = self;
  dispatch_sync(v3, block);
}

void __45__SLDCloudKitSyncWriter_invalidateHighlights__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[9];
  if (v3)
  {
    dispatch_suspend(v3);
  }
  else
  {
    objc_initWeak(&location, v2);
    uint64_t v4 = [*(id *)(a1 + 32) queue];
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v4);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 72);
    *(void *)(v6 + 72) = v5;

    id v8 = (void *)os_transaction_create();
    int v9 = *(NSObject **)(*(void *)(a1 + 32) + 72);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __45__SLDCloudKitSyncWriter_invalidateHighlights__block_invoke_2;
    handler[3] = &unk_1E58A9788;
    id v14 = v8;
    id v10 = v8;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v9, handler);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
  int v11 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  dispatch_time_t v12 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 72));
}

void __45__SLDCloudKitSyncWriter_invalidateHighlights__block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_source_cancel(WeakRetained[9]);
    dispatch_source_t v3 = WeakRetained[9];
    WeakRetained[9] = 0;

    [(dispatch_source_t *)WeakRetained invalidateHighlightsInternal];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsToUpload, 0);
  objc_storeStrong((id *)&self->_freshHighlightsGenerated, 0);
}

void __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_6_cold_1()
{
}

void __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_7_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "#SLDCK failed to make SLPerson from Portrait person (err: %@)", v2, v3, v4, v5, v6);
}

void __55__SLDCloudKitSyncWriter_fetchAndProcessFreshHighlights__block_invoke_3_477_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_19BE17000, v0, OS_LOG_TYPE_FAULT, "#SLDCK error encoding supplementaryData: %@", v1, 0xCu);
}

- (void)_recordIDsFromStrings:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_19BE17000, v0, OS_LOG_TYPE_FAULT, "#SLDCK recordIDFromStrings returning empty array because we don't have a record zone yet", v1, 2u);
}

- (void)_didHandleSyncError:retryBlock:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "#SLDCK missing manatee identity, resetting and then deleting the condemned zone", v2, v3, v4, v5, v6);
}

- (void)_didHandleSyncError:retryBlock:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "#SLDCK retrying for error %@", v2, v3, v4, v5, v6);
}

void __54__SLDCloudKitSyncWriter_syncEngine_didSaveRecordZone___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "#SLDCK record zone saved", v2, v3, v4, v5, v6);
}

void __54__SLDCloudKitSyncWriter_syncEngine_didSaveRecordZone___block_invoke_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5 = [(id)OUTLINED_FUNCTION_10(a1) zoneID];
  uint8_t v6 = [v5 zoneName];
  id v7 = [*a2 persistence];
  id v8 = [v7 objectForKeyedSubscript:@"recordZoneID"];
  int v10 = 138412546;
  int v11 = v6;
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_14(&dword_19BE17000, a3, v9, "#SLDCK unexpected record zone saved (was %@, expected %@)", (uint8_t *)&v10);
}

void __65__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecordZone_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "#SLDCK error when trying to save record zone: %@", v2, v3, v4, v5, v6);
}

void __60__SLDCloudKitSyncWriter_syncEngine_recordToSaveForRecordID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "#SLDCK sync engine wants %@ but we don't have any record contents available, returnin nil", v2, v3, v4, v5, v6);
}

void __60__SLDCloudKitSyncWriter_syncEngine_recordToSaveForRecordID___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "#SLDCK sync engine wants contents of %@ but we no longer need to upload it. returning nil.", v2, v3, v4, v5, v6);
}

void __60__SLDCloudKitSyncWriter_syncEngine_recordToSaveForRecordID___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "#SLDCK providing contents of %@ to sync engine for upload", v2, v3, v4, v5, v6);
}

- (void)_savedRecord:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 recordID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_19BE17000, v2, v3, "#SLDCK deleting record %@ that was just uploaded as it is no longer needed", v4, v5, v6, v7, v8);
}

- (void)_savedRecord:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 recordID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_19BE17000, v2, v3, "#SLDCK ignoring double-notification of upload for %@", v4, v5, v6, v7, v8);
}

- (void)_savedRecord:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 recordID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_19BE17000, v2, v3, "#SLDCK updated persistence state for uploaded record %@", v4, v5, v6, v7, v8);
}

- (void)_savedRecord:(void *)a1 .cold.4(void *a1)
{
  uint64_t v1 = [a1 recordID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_19BE17000, v2, v3, "#SLDCK sync engine saved record %@ to server", v4, v5, v6, v7, v8);
}

void __61__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecord_error___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_10(a1) recordID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_19BE17000, v2, v3, "#SLDCK error saving record %@", v4, v5, v6, v7, v8);
}

void __61__SLDCloudKitSyncWriter_syncEngine_failedToSaveRecord_error___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_10(a1) recordID];
  uint64_t v2 = [v1 zoneID];
  uint64_t v3 = [v2 zoneName];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_19BE17000, v4, v5, "#SLDCK ignoring failed record uploaded in unexpected zone %@", v6, v7, v8, v9, v10);
}

void __69__SLDCloudKitSyncWriter_syncEngine_failedToDeleteRecordWithID_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "#SLDCK error deleting record %@", v2, v3, v4, v5, v6);
}

void __51__SLDCloudKitSyncWriter_syncEngine_didFetchRecord___block_invoke_cold_1(id *a1)
{
  uint64_t v2 = [(id)OUTLINED_FUNCTION_10((uint64_t)a1) recordID];
  uint64_t v3 = [*a1 encryptedValues];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"applicationIdentifiers"];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_1(&dword_19BE17000, v5, v6, "#SLDCK reader record %@ has application identifiers %@", v7, v8, v9, v10, 2u);
}

void __70__SLDCloudKitSyncWriter_syncEngine_recordWithIDWasDeleted_recordType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_15(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5(&dword_19BE17000, v0, v1, "#SLDCK reader record %@ was deleted", v2, v3, v4, v5, v6);
}

void __78__SLDCloudKitSyncWriter_syncEngine_failedToFetchChangesForRecordZoneID_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "#SLDCK Deleting readers zone due to missing manatee identity", v2, v3, v4, v5, v6);
}

@end
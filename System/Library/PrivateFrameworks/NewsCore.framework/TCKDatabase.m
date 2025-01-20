@interface TCKDatabase
- (CKRecord)secureSentinelRecord;
- (CKRecord)sentinelRecord;
- (NSMutableArray)tDeletedRecordIDs;
- (NSMutableArray)tDeletedZoneIDs;
- (NSMutableArray)tFetchedChangedRecordZoneNames;
- (NSMutableArray)tFetchedRecords;
- (NSMutableArray)tQueriedRecordTypes;
- (NSMutableArray)tQueriedRecordZonesNames;
- (NSMutableArray)tQueriedRecords;
- (NSMutableArray)tSavedRecords;
- (NSMutableArray)tSavedSubscriptions;
- (NSMutableArray)tSavedZones;
- (NSMutableDictionary)recordsByID;
- (NSMutableSet)tSavedRecordIDs;
- (TCKDatabase)init;
- (id)recordIDsInZoneName:(id)a3;
- (id)recordWithID:(id)a3;
- (id)tFetchDatabaseChangesHandler;
- (id)tFetchRecordZoneChangesOperationHandler;
- (id)tFetchRecordsHandler;
- (id)tFetchZoneChangesHandler;
- (id)tFetchZonesHandler;
- (id)tModifyRecordsHandler;
- (id)tModifyRecordsOperationHandler;
- (id)tModifyZonesHandler;
- (id)tQueryHandler;
- (void)addOperation:(id)a3;
- (void)addRecord:(id)a3;
- (void)setTDeletedRecordIDs:(id)a3;
- (void)setTDeletedZoneIDs:(id)a3;
- (void)setTFetchDatabaseChangesHandler:(id)a3;
- (void)setTFetchRecordZoneChangesOperationHandler:(id)a3;
- (void)setTFetchRecordsHandler:(id)a3;
- (void)setTFetchZoneChangesHandler:(id)a3;
- (void)setTFetchZonesHandler:(id)a3;
- (void)setTFetchedChangedRecordZoneNames:(id)a3;
- (void)setTFetchedRecords:(id)a3;
- (void)setTModifyRecordsHandler:(id)a3;
- (void)setTModifyRecordsOperationHandler:(id)a3;
- (void)setTModifyZonesHandler:(id)a3;
- (void)setTQueriedRecordTypes:(id)a3;
- (void)setTQueriedRecordZonesNames:(id)a3;
- (void)setTQueriedRecords:(id)a3;
- (void)setTQueryHandler:(id)a3;
- (void)setTSavedRecordIDs:(id)a3;
- (void)setTSavedRecords:(id)a3;
- (void)setTSavedSubscriptions:(id)a3;
- (void)setTSavedZones:(id)a3;
@end

@implementation TCKDatabase

- (TCKDatabase)init
{
  v6.receiver = self;
  v6.super_class = (Class)TCKDatabase;
  v2 = [(TCKDatabase *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    recordsByID = v2->_recordsByID;
    v2->_recordsByID = v3;
  }
  return v2;
}

- (void)addOperation:(id)a3
{
  uint64_t v290 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v198 = v6;
  v206 = self;
  id v193 = v4;
  if (!v6) {
    goto LABEL_18;
  }
  v7 = v6;
  v8 = [(TCKDatabase *)self tSavedRecords];

  if (!v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(TCKDatabase *)self setTSavedRecords:v9];
  }
  v10 = [(TCKDatabase *)self tSavedRecordIDs];

  if (!v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(TCKDatabase *)self setTSavedRecordIDs:v11];
  }
  v12 = [(TCKDatabase *)self tDeletedRecordIDs];

  if (!v12)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(TCKDatabase *)self setTDeletedRecordIDs:v13];
  }
  v14 = [(TCKDatabase *)self tSavedRecords];
  v15 = [(TCKDatabase *)self tSavedRecordIDs];
  v16 = [(TCKDatabase *)self tDeletedRecordIDs];
  v17 = [v7 modifyRecordsCompletionBlock];
  v266[0] = MEMORY[0x1E4F143A8];
  v266[1] = 3221225472;
  v266[2] = __28__TCKDatabase_addOperation___block_invoke;
  v266[3] = &unk_1E5B587E0;
  id v196 = v14;
  id v267 = v196;
  id v194 = v15;
  id v268 = v194;
  id v191 = v16;
  id v269 = v191;
  id v190 = v17;
  id v270 = v190;
  [v7 setModifyRecordsCompletionBlock:v266];
  v18 = [(TCKDatabase *)self tModifyRecordsOperationHandler];

  if (v18)
  {
    v19 = [(TCKDatabase *)self tModifyRecordsOperationHandler];
    ((void (**)(void, void *))v19)[2](v19, v7);
LABEL_15:
    id v4 = v193;
    goto LABEL_16;
  }
  v20 = [(TCKDatabase *)self tModifyRecordsHandler];

  if (v20)
  {
    v21 = [(TCKDatabase *)self tModifyRecordsHandler];
    v22 = [v7 recordsToSave];
    v23 = [v7 recordIDsToDelete];
    v264[0] = MEMORY[0x1E4F143A8];
    v264[1] = 3221225472;
    v264[2] = __28__TCKDatabase_addOperation___block_invoke_2;
    v264[3] = &unk_1E5B4EA68;
    id v265 = v7;
    ((void (**)(void, void *, void *, void *))v21)[2](v21, v22, v23, v264);

    v19 = (void (**)(void, void))v265;
    goto LABEL_15;
  }
  long long v262 = 0u;
  long long v263 = 0u;
  long long v260 = 0u;
  long long v261 = 0u;
  obuint64_t j = [v7 recordsToSave];
  uint64_t v106 = [obj countByEnumeratingWithState:&v260 objects:v289 count:16];
  if (v106)
  {
    uint64_t v107 = v106;
    uint64_t v108 = *(void *)v261;
    uint64_t v199 = *(void *)v261;
    do
    {
      uint64_t v109 = 0;
      uint64_t v200 = v107;
      do
      {
        if (*(void *)v261 != v108) {
          objc_enumerationMutation(obj);
        }
        v110 = *(void **)(*((void *)&v260 + 1) + 8 * v109);
        uint64_t v111 = [v7 savePolicy];
        recordsByID = self->_recordsByID;
        v113 = [v110 recordID];
        if (v111 == 1)
        {
          v114 = [(NSMutableDictionary *)recordsByID objectForKeyedSubscript:v113];

          if (v114)
          {
            uint64_t v205 = v109;
            long long v258 = 0u;
            long long v259 = 0u;
            long long v256 = 0u;
            long long v257 = 0u;
            v115 = [v110 encryptedValueStore];
            v116 = [v115 changedKeys];

            uint64_t v117 = [v116 countByEnumeratingWithState:&v256 objects:v288 count:16];
            if (v117)
            {
              uint64_t v118 = v117;
              uint64_t v119 = *(void *)v257;
              do
              {
                for (uint64_t i = 0; i != v118; ++i)
                {
                  if (*(void *)v257 != v119) {
                    objc_enumerationMutation(v116);
                  }
                  uint64_t v121 = *(void *)(*((void *)&v256 + 1) + 8 * i);
                  v122 = [v110 encryptedValueStore];
                  v123 = [v122 objectForKeyedSubscript:v121];
                  v124 = [v114 encryptedValueStore];
                  [v124 setObject:v123 forKeyedSubscript:v121];
                }
                uint64_t v118 = [v116 countByEnumeratingWithState:&v256 objects:v288 count:16];
              }
              while (v118);
            }

            long long v254 = 0u;
            long long v255 = 0u;
            long long v252 = 0u;
            long long v253 = 0u;
            v125 = [v110 valueStore];
            v126 = [v125 changedKeys];

            uint64_t v127 = [v126 countByEnumeratingWithState:&v252 objects:v287 count:16];
            if (v127)
            {
              uint64_t v128 = v127;
              uint64_t v129 = *(void *)v253;
              do
              {
                for (uint64_t j = 0; j != v128; ++j)
                {
                  if (*(void *)v253 != v129) {
                    objc_enumerationMutation(v126);
                  }
                  uint64_t v131 = *(void *)(*((void *)&v252 + 1) + 8 * j);
                  v132 = [v110 valueStore];
                  v133 = [v132 objectForKeyedSubscript:v131];
                  v134 = [v114 valueStore];
                  [v134 setObject:v133 forKeyedSubscript:v131];
                }
                uint64_t v128 = [v126 countByEnumeratingWithState:&v252 objects:v287 count:16];
              }
              while (v128);
            }
            v7 = v198;
            uint64_t v108 = v199;
            uint64_t v109 = v205;
            self = v206;
            uint64_t v107 = v200;
          }
          else
          {
            v135 = self->_recordsByID;
            v126 = [v110 recordID];
            [(NSMutableDictionary *)v135 setObject:v110 forKeyedSubscript:v126];
          }
        }
        else
        {
          [(NSMutableDictionary *)recordsByID setObject:v110 forKeyedSubscript:v113];
          v114 = v113;
        }

        ++v109;
      }
      while (v109 != v107);
      uint64_t v107 = [obj countByEnumeratingWithState:&v260 objects:v289 count:16];
    }
    while (v107);
  }

  long long v250 = 0u;
  long long v251 = 0u;
  long long v248 = 0u;
  long long v249 = 0u;
  v136 = [v7 recordIDsToDelete];
  uint64_t v137 = [v136 countByEnumeratingWithState:&v248 objects:v286 count:16];
  if (v137)
  {
    uint64_t v138 = v137;
    uint64_t v139 = *(void *)v249;
    do
    {
      for (uint64_t k = 0; k != v138; ++k)
      {
        if (*(void *)v249 != v139) {
          objc_enumerationMutation(v136);
        }
        [(NSMutableDictionary *)self->_recordsByID setObject:0 forKeyedSubscript:*(void *)(*((void *)&v248 + 1) + 8 * k)];
      }
      uint64_t v138 = [v136 countByEnumeratingWithState:&v248 objects:v286 count:16];
    }
    while (v138);
  }

  v141 = [v7 perRecordCompletionBlock];

  if (v141)
  {
    long long v246 = 0u;
    long long v247 = 0u;
    long long v244 = 0u;
    long long v245 = 0u;
    v142 = [v7 recordsToSave];
    uint64_t v143 = [v142 countByEnumeratingWithState:&v244 objects:v285 count:16];
    if (v143)
    {
      uint64_t v144 = v143;
      uint64_t v145 = *(void *)v245;
      do
      {
        for (uint64_t m = 0; m != v144; ++m)
        {
          if (*(void *)v245 != v145) {
            objc_enumerationMutation(v142);
          }
          uint64_t v147 = *(void *)(*((void *)&v244 + 1) + 8 * m);
          v148 = [v7 perRecordCompletionBlock];
          v148[2](v148, v147, 0);
        }
        uint64_t v144 = [v142 countByEnumeratingWithState:&v244 objects:v285 count:16];
      }
      while (v144);
    }

    self = v206;
  }
  v149 = [v7 modifyRecordsCompletionBlock];
  v150 = [v7 recordsToSave];
  v151 = [v7 recordIDsToDelete];
  ((void (**)(void, void *, void *, void))v149)[2](v149, v150, v151, 0);

  v152 = [v7 completionBlock];

  id v4 = v193;
  if (!v152) {
    goto LABEL_17;
  }
  v19 = [v7 completionBlock];
  ((void (*)(void))v19[2])();
LABEL_16:

LABEL_17:
LABEL_18:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v24 = v4;
  }
  else {
    v24 = 0;
  }
  id v25 = v24;
  if (v25)
  {
    v26 = [(TCKDatabase *)self tSavedZones];

    if (!v26)
    {
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(TCKDatabase *)self setTSavedZones:v27];
    }
    v28 = [(TCKDatabase *)self tDeletedZoneIDs];

    if (!v28)
    {
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(TCKDatabase *)self setTDeletedZoneIDs:v29];
    }
    v30 = [(TCKDatabase *)self tSavedZones];
    id v31 = objc_alloc(MEMORY[0x1E4F1C978]);
    v32 = [v25 recordZonesToSave];
    v33 = (void *)[v31 initWithArray:v32 copyItems:1];
    [v30 addObjectsFromArray:v33];

    v34 = [(TCKDatabase *)v206 tDeletedZoneIDs];
    self = v206;
    id v35 = objc_alloc(MEMORY[0x1E4F1C978]);
    v36 = [v25 recordZoneIDsToDelete];
    v37 = (void *)[v35 initWithArray:v36 copyItems:1];
    [v34 addObjectsFromArray:v37];

    v38 = [(TCKDatabase *)v206 tModifyZonesHandler];

    if (v38)
    {
      v39 = [(TCKDatabase *)v206 tModifyZonesHandler];
      v40 = [v25 recordZonesToSave];
      v41 = [v25 recordZoneIDsToDelete];
      v242[0] = MEMORY[0x1E4F143A8];
      v242[1] = 3221225472;
      v242[2] = __28__TCKDatabase_addOperation___block_invoke_3;
      v242[3] = &unk_1E5B4EA68;
      id v243 = v25;
      ((void (**)(void, void *, void *, void *))v39)[2](v39, v40, v41, v242);

      v42 = (void (**)(void, void, void, void))v243;
    }
    else
    {
      id v43 = v4;
      long long v240 = 0u;
      long long v241 = 0u;
      long long v238 = 0u;
      long long v239 = 0u;
      v44 = [v25 recordZoneIDsToDelete];
      uint64_t v45 = [v44 countByEnumeratingWithState:&v238 objects:v284 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v239;
        do
        {
          for (uint64_t n = 0; n != v46; ++n)
          {
            if (*(void *)v239 != v47) {
              objc_enumerationMutation(v44);
            }
            uint64_t v49 = *(void *)(*((void *)&v238 + 1) + 8 * n);
            v50 = v206->_recordsByID;
            v237[0] = MEMORY[0x1E4F143A8];
            v237[1] = 3221225472;
            v237[2] = __28__TCKDatabase_addOperation___block_invoke_4;
            v237[3] = &unk_1E5B58808;
            v237[4] = v49;
            [(NSMutableDictionary *)v50 fc_removeObjectsForKeysPassingTest:v237];
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v238 objects:v284 count:16];
        }
        while (v46);
      }

      v42 = [v25 modifyRecordZonesCompletionBlock];
      v51 = [v25 recordZonesToSave];
      v52 = [v25 recordZoneIDsToDelete];
      ((void (**)(void, void *, void *, void))v42)[2](v42, v51, v52, 0);

      id v4 = v43;
      self = v206;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v53 = v4;
  }
  else {
    v53 = 0;
  }
  id v54 = v53;
  if (v54)
  {
    v55 = [(TCKDatabase *)self tFetchZonesHandler];
    v56 = [v54 recordZoneIDs];
    v235[0] = MEMORY[0x1E4F143A8];
    v235[1] = 3221225472;
    v235[2] = __28__TCKDatabase_addOperation___block_invoke_5;
    v235[3] = &unk_1E5B4E3F0;
    id v236 = v54;
    ((void (**)(void, void *, void *))v55)[2](v55, v56, v235);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v57 = v4;
  }
  else {
    v57 = 0;
  }
  id v58 = v57;
  v59 = v58;
  v204 = v58;
  if (v58)
  {
    if ([v58 isCancelled])
    {
      v60 = [v59 fetchRecordsCompletionBlock];
      v61 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F19C40] code:20 userInfo:0];
      ((void (**)(void, void, void *))v60)[2](v60, 0, v61);

      v59 = v204;
    }
    else
    {
      v62 = [(TCKDatabase *)self tFetchedRecords];

      if (!v62)
      {
        id v63 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [(TCKDatabase *)self setTFetchedRecords:v63];
      }
      v64 = [(TCKDatabase *)self tFetchRecordsHandler];

      if (v64)
      {
        v65 = [(TCKDatabase *)self tFetchRecordsHandler];
        v66 = [v59 recordIDs];
        v233[0] = MEMORY[0x1E4F143A8];
        v233[1] = 3221225472;
        v233[2] = __28__TCKDatabase_addOperation___block_invoke_6;
        v233[3] = &unk_1E5B55760;
        v233[4] = self;
        id v234 = v204;
        ((void (**)(void, void *, void *))v65)[2](v65, v66, v233);

        v59 = v204;
      }
      else
      {
        id v67 = v54;
        v68 = self;
        id v69 = v4;
        v70 = v68->_recordsByID;
        v71 = [v59 recordIDs];
        v72 = [(NSMutableDictionary *)v70 fc_subdictionaryForKeys:v71];

        v59 = v204;
        long long v231 = 0u;
        long long v232 = 0u;
        long long v229 = 0u;
        long long v230 = 0u;
        id v73 = v72;
        uint64_t v74 = [v73 countByEnumeratingWithState:&v229 objects:v283 count:16];
        if (v74)
        {
          uint64_t v75 = v74;
          uint64_t v76 = *(void *)v230;
          do
          {
            for (uint64_t ii = 0; ii != v75; ++ii)
            {
              if (*(void *)v230 != v76) {
                objc_enumerationMutation(v73);
              }
              uint64_t v78 = *(void *)(*((void *)&v229 + 1) + 8 * ii);
              v79 = [v59 perRecordCompletionBlock];

              if (v79)
              {
                v80 = [v59 perRecordCompletionBlock];
                v81 = [v73 objectForKeyedSubscript:v78];
                ((void (**)(void, void *, uint64_t, void))v80)[2](v80, v81, v78, 0);

                v59 = v204;
              }
            }
            uint64_t v75 = [v73 countByEnumeratingWithState:&v229 objects:v283 count:16];
          }
          while (v75);
        }

        v82 = [v59 fetchRecordsCompletionBlock];
        ((void (**)(void, id, void))v82)[2](v82, v73, 0);

        id v4 = v69;
        self = v206;
        id v54 = v67;
      }
    }
  }
  objc_opt_class();
  v195 = v25;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v192 = v54;
    id v83 = v4;
    v84 = [(TCKDatabase *)self tFetchedChangedRecordZoneNames];

    if (!v84)
    {
      id v85 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(TCKDatabase *)self setTFetchedChangedRecordZoneNames:v85];
    }
    long long v227 = 0u;
    long long v228 = 0u;
    long long v225 = 0u;
    long long v226 = 0u;
    v86 = [v83 recordZoneIDs];
    uint64_t v87 = [v86 countByEnumeratingWithState:&v225 objects:v282 count:16];
    if (v87)
    {
      uint64_t v88 = v87;
      uint64_t v89 = *(void *)v226;
      do
      {
        for (uint64_t jj = 0; jj != v88; ++jj)
        {
          if (*(void *)v226 != v89) {
            objc_enumerationMutation(v86);
          }
          v91 = *(void **)(*((void *)&v225 + 1) + 8 * jj);
          v92 = [(TCKDatabase *)v206 tFetchedChangedRecordZoneNames];
          v93 = [v91 zoneName];
          [v92 addObject:v93];
        }
        uint64_t v88 = [v86 countByEnumeratingWithState:&v225 objects:v282 count:16];
      }
      while (v88);
    }

    self = v206;
    v94 = [(TCKDatabase *)v206 tFetchRecordZoneChangesOperationHandler];

    if (v94)
    {
      v95 = [(TCKDatabase *)v206 tFetchRecordZoneChangesOperationHandler];
      v96 = (void (*)(void))v95[2];
    }
    else
    {
      v97 = [(TCKDatabase *)v206 tFetchZoneChangesHandler];

      if (v97)
      {
        long long v223 = 0uLL;
        long long v224 = 0uLL;
        long long v221 = 0uLL;
        long long v222 = 0uLL;
        v98 = [v83 recordZoneIDs];
        uint64_t v99 = [v98 countByEnumeratingWithState:&v221 objects:v281 count:16];
        if (v99)
        {
          uint64_t v100 = v99;
          uint64_t v101 = *(void *)v222;
          do
          {
            for (uint64_t kk = 0; kk != v100; ++kk)
            {
              if (*(void *)v222 != v101) {
                objc_enumerationMutation(v98);
              }
              uint64_t v103 = *(void *)(*((void *)&v221 + 1) + 8 * kk);
              v104 = [(TCKDatabase *)v206 tFetchZoneChangesHandler];

              if (v104)
              {
                v105 = [(TCKDatabase *)v206 tFetchZoneChangesHandler];
                v218[0] = MEMORY[0x1E4F143A8];
                v218[1] = 3221225472;
                v218[2] = __28__TCKDatabase_addOperation___block_invoke_7;
                v218[3] = &unk_1E5B4E6E8;
                id v219 = v83;
                uint64_t v220 = v103;
                ((void (**)(void, uint64_t, void *))v105)[2](v105, v103, v218);
              }
            }
            uint64_t v100 = [v98 countByEnumeratingWithState:&v221 objects:v281 count:16];
          }
          while (v100);
        }
      }
      else
      {
        long long v216 = 0uLL;
        long long v217 = 0uLL;
        long long v214 = 0uLL;
        long long v215 = 0uLL;
        id v197 = [v83 recordZoneIDs];
        id obja = (id)[v197 countByEnumeratingWithState:&v214 objects:v280 count:16];
        if (obja)
        {
          uint64_t v201 = *(void *)v215;
          do
          {
            for (muint64_t m = 0; mm != obja; muint64_t m = (char *)mm + 1)
            {
              if (*(void *)v215 != v201) {
                objc_enumerationMutation(v197);
              }
              uint64_t v154 = *(void *)(*((void *)&v214 + 1) + 8 * (void)mm);
              v155 = v206->_recordsByID;
              v213[0] = MEMORY[0x1E4F143A8];
              v213[1] = 3221225472;
              v213[2] = __28__TCKDatabase_addOperation___block_invoke_8;
              v213[3] = &unk_1E5B58830;
              v213[4] = v154;
              v156 = [(NSMutableDictionary *)v155 keysOfEntriesPassingTest:v213];
              long long v209 = 0u;
              long long v210 = 0u;
              long long v211 = 0u;
              long long v212 = 0u;
              id v157 = v156;
              uint64_t v158 = [v157 countByEnumeratingWithState:&v209 objects:v279 count:16];
              if (v158)
              {
                uint64_t v159 = v158;
                uint64_t v160 = *(void *)v210;
                do
                {
                  for (nuint64_t n = 0; nn != v159; ++nn)
                  {
                    if (*(void *)v210 != v160) {
                      objc_enumerationMutation(v157);
                    }
                    uint64_t v162 = *(void *)(*((void *)&v209 + 1) + 8 * nn);
                    v163 = [v83 recordChangedBlock];

                    if (v163)
                    {
                      v164 = [v83 recordChangedBlock];
                      v165 = [(NSMutableDictionary *)v206->_recordsByID objectForKeyedSubscript:v162];
                      ((void (**)(void, void *))v164)[2](v164, v165);
                    }
                  }
                  uint64_t v159 = [v157 countByEnumeratingWithState:&v209 objects:v279 count:16];
                }
                while (v159);
              }

              v166 = [v83 recordZoneFetchCompletionBlock];

              if (v166)
              {
                v167 = [v83 recordZoneFetchCompletionBlock];
                v168 = objc_opt_new();
                ((void (**)(void, uint64_t, void, void *, void, void))v167)[2](v167, v154, 0, v168, 0, 0);
              }
            }
            id obja = (id)[v197 countByEnumeratingWithState:&v214 objects:v280 count:16];
          }
          while (obja);
        }
      }
      v169 = [v83 fetchRecordZoneChangesCompletionBlock];

      if (!v169)
      {
        id v54 = v192;
        id v4 = v193;
        v59 = v204;
        goto LABEL_154;
      }
      v95 = [v83 fetchRecordZoneChangesCompletionBlock];
      v96 = (void (*)(void))v95[2];
    }
    v96();
    id v4 = v193;
    v59 = v204;

    id v54 = v192;
  }
  else
  {
    id v83 = 0;
  }
LABEL_154:
  objc_opt_class();
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v170 = v4;
    v171 = [(TCKDatabase *)self tFetchDatabaseChangesHandler];

    if (v171)
    {
      v172 = [(TCKDatabase *)self tFetchDatabaseChangesHandler];
      v207[0] = MEMORY[0x1E4F143A8];
      v207[1] = 3221225472;
      v207[2] = __28__TCKDatabase_addOperation___block_invoke_9;
      v207[3] = &unk_1E5B4EA68;
      id v208 = v170;
      ((void (**)(void, void *))v172)[2](v172, v207);
    }
    objc_opt_class();
  }
  else
  {
    objc_opt_class();
    id v170 = 0;
    if (!v4) {
      goto LABEL_164;
    }
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_164:
    objc_opt_class();
    id v173 = 0;
    if (!v4) {
      goto LABEL_171;
    }
    goto LABEL_165;
  }
  id v173 = v4;
  v174 = [v173 fetchSubscriptionCompletionBlock];

  if (v174)
  {
    v175 = [v173 fetchSubscriptionCompletionBlock];
    v176 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F19C40] code:11 userInfo:0];
    ((void (**)(void, void, void *))v175)[2](v175, 0, v176);

    v59 = v204;
  }
  objc_opt_class();
LABEL_165:
  if (objc_opt_isKindOfClass())
  {
    id v177 = v4;
    v178 = [(TCKDatabase *)self tSavedSubscriptions];

    if (!v178)
    {
      v179 = [MEMORY[0x1E4F1CA48] array];
      [(TCKDatabase *)self setTSavedSubscriptions:v179];
    }
    v180 = [(TCKDatabase *)self tSavedSubscriptions];
    v181 = [v177 subscriptionsToSave];
    [v180 addObjectsFromArray:v181];

    v182 = [v177 modifySubscriptionsCompletionBlock];

    if (v182)
    {
      v183 = [v177 modifySubscriptionsCompletionBlock];
      v184 = [v177 subscriptionsToSave];
      v185 = [v177 subscriptionIDsToDelete];
      ((void (**)(void, void *, void *, void))v183)[2](v183, v184, v185, 0);
    }
    objc_opt_class();
    v59 = v204;
    goto LABEL_172;
  }
LABEL_171:
  objc_opt_class();
  id v177 = 0;
  if (!v4)
  {
LABEL_176:
    id v186 = 0;
    goto LABEL_177;
  }
LABEL_172:
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_176;
  }
  id v186 = v4;
  v187 = MEMORY[0x1E4F14500];
  id v188 = MEMORY[0x1E4F14500];
  if (os_log_type_enabled(v187, OS_LOG_TYPE_ERROR))
  {
    id v189 = (id)[[NSString alloc] initWithFormat:@"CKQueryOperation is not supported"];
    *(_DWORD *)buf = 136315906;
    v272 = "-[TCKDatabase addOperation:]";
    __int16 v273 = 2080;
    v274 = "TCKDatabase.m";
    __int16 v275 = 1024;
    int v276 = 299;
    __int16 v277 = 2114;
    id v278 = v189;
    v59 = v204;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_177:
}

void __28__TCKDatabase_addOperation___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v16 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)a1[4];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v16 copyItems:1];
  [v9 addObjectsFromArray:v10];

  id v11 = (void *)a1[5];
  v12 = [v16 valueForKeyPath:@"recordID"];
  [v11 addObjectsFromArray:v12];

  id v13 = (void *)a1[6];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v7 copyItems:1];
  [v13 addObjectsFromArray:v14];

  uint64_t v15 = a1[7];
  if (v15) {
    (*(void (**)(uint64_t, id, id, id))(v15 + 16))(v15, v16, v7, v8);
  }
}

void __28__TCKDatabase_addOperation___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
        uint64_t v15 = [*(id *)(a1 + 32) perRecordCompletionBlock];

        if (v15)
        {
          id v16 = [*(id *)(a1 + 32) perRecordCompletionBlock];
          v16[2](v16, v14, 0);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
  v17 = [*(id *)(a1 + 32) modifyRecordsCompletionBlock];

  if (v17)
  {
    v18 = [*(id *)(a1 + 32) modifyRecordsCompletionBlock];
    ((void (**)(void, id, id, id))v18)[2](v18, v7, v8, v9);
  }
}

void __28__TCKDatabase_addOperation___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = [v6 modifyRecordZonesCompletionBlock];
  v10[2](v10, v9, v8, v7);
}

uint64_t __28__TCKDatabase_addOperation___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = [a2 zoneID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __28__TCKDatabase_addOperation___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 fetchRecordZonesCompletionBlock];
  v7[2](v7, v6, v5);
}

void __28__TCKDatabase_addOperation___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) tFetchedRecords];
  id v8 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v9 = [v5 allValues];
  uint64_t v10 = (void *)[v8 initWithArray:v9 copyItems:1];
  [v7 addObjectsFromArray:v10];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * v15);
        v17 = objc_msgSend(*(id *)(a1 + 40), "perRecordCompletionBlock", (void)v21);

        if (v17)
        {
          v18 = [*(id *)(a1 + 40) perRecordCompletionBlock];
          long long v19 = [v11 objectForKeyedSubscript:v16];
          ((void (**)(void, void *, uint64_t, id))v18)[2](v18, v19, v16, v6);
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  long long v20 = [*(id *)(a1 + 40) fetchRecordsCompletionBlock];
  ((void (**)(void, id, id))v20)[2](v20, v11, v6);
}

void __28__TCKDatabase_addOperation___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8 * v13);
        uint64_t v15 = [*(id *)(a1 + 32) recordChangedBlock];

        if (v15)
        {
          uint64_t v16 = [*(id *)(a1 + 32) recordChangedBlock];
          v16[2](v16, v14);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v11);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = v8;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v30;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * v21);
        long long v23 = objc_msgSend(*(id *)(a1 + 32), "recordWithIDWasDeletedBlock", (void)v29);

        if (v23)
        {
          long long v24 = [*(id *)(a1 + 32) recordWithIDWasDeletedBlock];
          ((void (**)(void, uint64_t, __CFString *))v24)[2](v24, v22, @"UNKNOWN_RECORD_TYPE");
        }
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v19);
  }

  id v25 = [*(id *)(a1 + 32) recordZoneFetchCompletionBlock];

  if (v25)
  {
    uint64_t v26 = [*(id *)(a1 + 32) recordZoneFetchCompletionBlock];
    uint64_t v27 = *(void *)(a1 + 40);
    v28 = objc_opt_new();
    ((void (**)(void, uint64_t, void, void *, BOOL, id))v26)[2](v26, v27, 0, v28, v9 != 0, v9);
  }
}

uint64_t __28__TCKDatabase_addOperation___block_invoke_8(uint64_t a1, void *a2)
{
  v3 = [a2 zoneID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __28__TCKDatabase_addOperation___block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * v13);
        uint64_t v15 = [*(id *)(a1 + 32) recordZoneWithIDChangedBlock];

        if (v15)
        {
          uint64_t v16 = [*(id *)(a1 + 32) recordZoneWithIDChangedBlock];
          v16[2](v16, v14);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v11);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = v8;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v27 + 1) + 8 * v21);
        long long v23 = objc_msgSend(*(id *)(a1 + 32), "recordZoneWithIDWasDeletedBlock", (void)v27);

        if (v23)
        {
          long long v24 = [*(id *)(a1 + 32) recordZoneWithIDWasDeletedBlock];
          v24[2](v24, v22);
        }
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v19);
  }

  id v25 = [*(id *)(a1 + 32) fetchDatabaseChangesCompletionBlock];

  if (v25)
  {
    uint64_t v26 = [*(id *)(a1 + 32) fetchDatabaseChangesCompletionBlock];
    ((void (**)(void, void, void, id))v26)[2](v26, 0, 0, v9);
  }
}

- (void)addRecord:(id)a3
{
  recordsByID = self->_recordsByID;
  id v4 = a3;
  id v5 = [v4 recordID];
  [(NSMutableDictionary *)recordsByID setObject:v4 forKeyedSubscript:v5];
}

- (id)recordIDsInZoneName:(id)a3
{
  id v4 = a3;
  recordsByID = self->_recordsByID;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__TCKDatabase_recordIDsInZoneName___block_invoke;
  v9[3] = &unk_1E5B58830;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSMutableDictionary *)recordsByID keysOfEntriesPassingTest:v9];

  return v7;
}

uint64_t __35__TCKDatabase_recordIDsInZoneName___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 zoneID];
  id v4 = [v3 zoneName];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

- (id)recordWithID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_recordsByID objectForKeyedSubscript:a3];
}

- (CKRecord)sentinelRecord
{
  v3 = +[CKRecordID fc_staticSentinelRecordID]();
  id v4 = [(TCKDatabase *)self recordWithID:v3];

  return (CKRecord *)v4;
}

- (CKRecord)secureSentinelRecord
{
  v3 = +[CKRecordID fc_staticSecureSentinelRecordID]();
  id v4 = [(TCKDatabase *)self recordWithID:v3];

  return (CKRecord *)v4;
}

- (NSMutableArray)tQueriedRecordTypes
{
  return self->_tQueriedRecordTypes;
}

- (void)setTQueriedRecordTypes:(id)a3
{
}

- (NSMutableArray)tQueriedRecordZonesNames
{
  return self->_tQueriedRecordZonesNames;
}

- (void)setTQueriedRecordZonesNames:(id)a3
{
}

- (NSMutableArray)tFetchedRecords
{
  return self->_tFetchedRecords;
}

- (void)setTFetchedRecords:(id)a3
{
}

- (NSMutableArray)tFetchedChangedRecordZoneNames
{
  return self->_tFetchedChangedRecordZoneNames;
}

- (void)setTFetchedChangedRecordZoneNames:(id)a3
{
}

- (NSMutableArray)tQueriedRecords
{
  return self->_tQueriedRecords;
}

- (void)setTQueriedRecords:(id)a3
{
}

- (NSMutableArray)tSavedRecords
{
  return self->_tSavedRecords;
}

- (void)setTSavedRecords:(id)a3
{
}

- (NSMutableSet)tSavedRecordIDs
{
  return self->_tSavedRecordIDs;
}

- (void)setTSavedRecordIDs:(id)a3
{
}

- (NSMutableArray)tSavedZones
{
  return self->_tSavedZones;
}

- (void)setTSavedZones:(id)a3
{
}

- (NSMutableArray)tDeletedZoneIDs
{
  return self->_tDeletedZoneIDs;
}

- (void)setTDeletedZoneIDs:(id)a3
{
}

- (NSMutableArray)tDeletedRecordIDs
{
  return self->_tDeletedRecordIDs;
}

- (void)setTDeletedRecordIDs:(id)a3
{
}

- (NSMutableArray)tSavedSubscriptions
{
  return self->_tSavedSubscriptions;
}

- (void)setTSavedSubscriptions:(id)a3
{
}

- (id)tQueryHandler
{
  return self->_tQueryHandler;
}

- (void)setTQueryHandler:(id)a3
{
}

- (id)tFetchRecordsHandler
{
  return self->_tFetchRecordsHandler;
}

- (void)setTFetchRecordsHandler:(id)a3
{
}

- (id)tModifyRecordsOperationHandler
{
  return self->_tModifyRecordsOperationHandler;
}

- (void)setTModifyRecordsOperationHandler:(id)a3
{
}

- (id)tModifyRecordsHandler
{
  return self->_tModifyRecordsHandler;
}

- (void)setTModifyRecordsHandler:(id)a3
{
}

- (id)tFetchZonesHandler
{
  return self->_tFetchZonesHandler;
}

- (void)setTFetchZonesHandler:(id)a3
{
}

- (id)tModifyZonesHandler
{
  return self->_tModifyZonesHandler;
}

- (void)setTModifyZonesHandler:(id)a3
{
}

- (id)tFetchZoneChangesHandler
{
  return self->_tFetchZoneChangesHandler;
}

- (void)setTFetchZoneChangesHandler:(id)a3
{
}

- (id)tFetchRecordZoneChangesOperationHandler
{
  return self->_tFetchRecordZoneChangesOperationHandler;
}

- (void)setTFetchRecordZoneChangesOperationHandler:(id)a3
{
}

- (id)tFetchDatabaseChangesHandler
{
  return self->_tFetchDatabaseChangesHandler;
}

- (void)setTFetchDatabaseChangesHandler:(id)a3
{
}

- (NSMutableDictionary)recordsByID
{
  return self->_recordsByID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsByID, 0);
  objc_storeStrong(&self->_tFetchDatabaseChangesHandler, 0);
  objc_storeStrong(&self->_tFetchRecordZoneChangesOperationHandler, 0);
  objc_storeStrong(&self->_tFetchZoneChangesHandler, 0);
  objc_storeStrong(&self->_tModifyZonesHandler, 0);
  objc_storeStrong(&self->_tFetchZonesHandler, 0);
  objc_storeStrong(&self->_tModifyRecordsHandler, 0);
  objc_storeStrong(&self->_tModifyRecordsOperationHandler, 0);
  objc_storeStrong(&self->_tFetchRecordsHandler, 0);
  objc_storeStrong(&self->_tQueryHandler, 0);
  objc_storeStrong((id *)&self->_tSavedSubscriptions, 0);
  objc_storeStrong((id *)&self->_tDeletedRecordIDs, 0);
  objc_storeStrong((id *)&self->_tDeletedZoneIDs, 0);
  objc_storeStrong((id *)&self->_tSavedZones, 0);
  objc_storeStrong((id *)&self->_tSavedRecordIDs, 0);
  objc_storeStrong((id *)&self->_tSavedRecords, 0);
  objc_storeStrong((id *)&self->_tQueriedRecords, 0);
  objc_storeStrong((id *)&self->_tFetchedChangedRecordZoneNames, 0);
  objc_storeStrong((id *)&self->_tFetchedRecords, 0);
  objc_storeStrong((id *)&self->_tQueriedRecordZonesNames, 0);
  objc_storeStrong((id *)&self->_tQueriedRecordTypes, 0);
}

@end
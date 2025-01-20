@interface SCKStubContainer
- (BOOL)accountInfoSupportsDeviceToDeviceEncryption;
- (NSArray)databaseChangesOperationChangedZoneIDs;
- (NSArray)modifyRecordsSavedRecords;
- (NSArray)modifySubscriptionsSavedSubscriptions;
- (NSArray)modifyZonesSavedZones;
- (NSMutableDictionary)zoneContentsByZoneID;
- (SCKStubContainer)init;
- (id)_errorForErrorMode:(int64_t)a3;
- (id)_errorForErrorMode:(int64_t)a3 itemIDs:(id)a4;
- (id)contentsOfZone:(id)a3;
- (id)contentsOfZone:(id)a3 withType:(id)a4;
- (id)recordWithName:(id)a3 inZone:(id)a4;
- (id)willFinishZoneChanges;
- (id)willModifyRecords;
- (int64_t)_ckErrorCodeForErrorMode:(int64_t)a3;
- (int64_t)accountInfoErrorMode;
- (int64_t)modifyRecordsErrorMode;
- (int64_t)modifyZonesErrorMode;
- (int64_t)zoneChangesErrorMode;
- (unint64_t)databaseChangesOperationCount;
- (unint64_t)modifyRecordsOperationCount;
- (unint64_t)modifySubscriptionsOperationCount;
- (unint64_t)modifyZonesOperationCount;
- (unint64_t)zoneChangesOperationCount;
- (void)accountInfoWithCompletionHandler:(id)a3;
- (void)addDatabaseOperation:(id)a3;
- (void)setAccountInfoErrorMode:(int64_t)a3;
- (void)setAccountInfoSupportsDeviceToDeviceEncryption:(BOOL)a3;
- (void)setContentsOfZone:(id)a3 toRecords:(id)a4;
- (void)setDatabaseChangesOperationChangedZoneIDs:(id)a3;
- (void)setModifyRecordsErrorMode:(int64_t)a3;
- (void)setModifyZonesErrorMode:(int64_t)a3;
- (void)setWillFinishZoneChanges:(id)a3;
- (void)setWillModifyRecords:(id)a3;
- (void)setZoneChangesErrorMode:(int64_t)a3;
- (void)setZoneContentsByZoneID:(id)a3;
@end

@implementation SCKStubContainer

- (SCKStubContainer)init
{
  v12.receiver = self;
  v12.super_class = (Class)SCKStubContainer;
  v2 = [(SCKStubContainer *)&v12 init];
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    modifyZonesSavedZones = v2->_modifyZonesSavedZones;
    v2->_modifyZonesSavedZones = v3;

    v5 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    modifyRecordsSavedRecords = v2->_modifyRecordsSavedRecords;
    v2->_modifyRecordsSavedRecords = v5;

    v7 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    modifySubscriptionsSavedSubscriptions = v2->_modifySubscriptionsSavedSubscriptions;
    v2->_modifySubscriptionsSavedSubscriptions = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    zoneContentsByZoneID = v2->_zoneContentsByZoneID;
    v2->_zoneContentsByZoneID = v9;

    v2->_accountInfoSupportsDeviceToDeviceEncryption = 1;
  }
  return v2;
}

- (void)setContentsOfZone:(id)a3 toRecords:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263EFF9A0] dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "recordID", (void)v19);
        [v8 setObject:v14 forKeyedSubscript:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  id v16 = objc_alloc(MEMORY[0x263EFD808]);
  v17 = (void *)[v16 initWithZoneName:v6 ownerName:*MEMORY[0x263EFD488]];
  v18 = [(SCKStubContainer *)self zoneContentsByZoneID];
  [v18 setObject:v8 forKeyedSubscript:v17];
}

- (id)contentsOfZone:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263EFD808];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = (void *)[v6 initWithZoneName:v5 ownerName:*MEMORY[0x263EFD488]];

  v8 = [(SCKStubContainer *)self zoneContentsByZoneID];
  id v9 = [v8 objectForKeyedSubscript:v7];
  uint64_t v10 = [v9 allValues];

  return v10;
}

- (id)contentsOfZone:(id)a3 withType:(id)a4
{
  id v6 = a4;
  id v7 = [(SCKStubContainer *)self contentsOfZone:a3];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__SCKStubContainer_contentsOfZone_withType___block_invoke;
  v12[3] = &unk_26467D1B8;
  id v13 = v6;
  id v8 = v6;
  id v9 = [v7 indexesOfObjectsPassingTest:v12];
  uint64_t v10 = [v7 objectsAtIndexes:v9];

  return v10;
}

uint64_t __44__SCKStubContainer_contentsOfZone_withType___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 recordType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)recordWithName:(id)a3 inZone:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263EFD808];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  uint64_t v10 = (void *)[v9 initWithZoneName:v7 ownerName:*MEMORY[0x263EFD488]];

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v8 zoneID:v10];
  uint64_t v12 = [(SCKStubContainer *)self zoneContentsByZoneID];
  id v13 = [v12 objectForKeyedSubscript:v10];
  v14 = [v13 objectForKeyedSubscript:v11];

  return v14;
}

- (void)addDatabaseOperation:(id)a3
{
  uint64_t v221 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v168 = self;
  if (v6 == objc_opt_class())
  {
    id v157 = v5;
    id v14 = v5;
    ++self->_modifyZonesOperationCount;
    if ([(SCKStubContainer *)self modifyZonesErrorMode])
    {
      v15 = [(SCKStubContainer *)self _errorForErrorMode:[(SCKStubContainer *)self modifyZonesErrorMode]];
      id v16 = [v14 modifyRecordZonesCompletionBlock];

      if (!v16)
      {
LABEL_44:

LABEL_45:
LABEL_133:
        id v5 = v157;
        goto LABEL_134;
      }
      v17 = [v14 modifyRecordZonesCompletionBlock];
      v17[2](v17, 0, 0, v15);
    }
    else
    {
      v41 = [(SCKStubContainer *)self modifyZonesSavedZones];
      v42 = [v14 recordZonesToSave];
      v43 = [v41 arrayByAddingObjectsFromArray:v42];
      modifyZonesSavedZones = self->_modifyZonesSavedZones;
      self->_modifyZonesSavedZones = v43;

      long long v208 = 0u;
      long long v209 = 0u;
      long long v206 = 0u;
      long long v207 = 0u;
      v45 = [v14 recordZonesToSave];
      uint64_t v46 = [v45 countByEnumeratingWithState:&v206 objects:v220 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v207;
        do
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v207 != v48) {
              objc_enumerationMutation(v45);
            }
            v50 = *(void **)(*((void *)&v206 + 1) + 8 * i);
            v51 = [(SCKStubContainer *)self zoneContentsByZoneID];
            v52 = [v50 zoneID];
            v53 = [v51 objectForKeyedSubscript:v52];

            if (!v53)
            {
              v54 = [MEMORY[0x263EFF9A0] dictionary];
              v55 = [(SCKStubContainer *)self zoneContentsByZoneID];
              v56 = [v50 zoneID];
              [v55 setObject:v54 forKeyedSubscript:v56];
            }
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v206 objects:v220 count:16];
        }
        while (v47);
      }

      v57 = [v14 modifyRecordZonesCompletionBlock];

      if (!v57) {
        goto LABEL_45;
      }
      v15 = [v14 modifyRecordZonesCompletionBlock];
      v17 = [v14 recordZonesToSave];
      v58 = [v14 recordZoneIDsToDelete];
      ((void (**)(void, void, void *, void))v15)[2](v15, v17, v58, 0);
    }
    goto LABEL_44;
  }
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    id v18 = v5;
    ++self->_zoneChangesOperationCount;
    if ([(SCKStubContainer *)self zoneChangesErrorMode])
    {
      int64_t v19 = [(SCKStubContainer *)self zoneChangesErrorMode];
      long long v20 = [v18 recordZoneIDs];
      long long v21 = [(SCKStubContainer *)self _errorForErrorMode:v19 itemIDs:v20];

      if ([v21 code] == 2)
      {
        id v22 = v5;
        long long v204 = 0u;
        long long v205 = 0u;
        long long v202 = 0u;
        long long v203 = 0u;
        v23 = [v18 recordZoneIDs];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v202 objects:v219 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v203;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v203 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void *)(*((void *)&v202 + 1) + 8 * j);
              v29 = [v18 recordZoneFetchCompletionBlock];

              if (v29)
              {
                v30 = [v18 recordZoneFetchCompletionBlock];
                ((void (**)(void, uint64_t, void, void, void, void *))v30)[2](v30, v28, 0, 0, 0, v21);
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v202 objects:v219 count:16];
          }
          while (v25);
        }

        id v5 = v22;
      }
      v31 = [(SCKStubContainer *)self willFinishZoneChanges];

      if (v31)
      {
        v32 = [(SCKStubContainer *)self willFinishZoneChanges];
        v32[2]();
      }
      v33 = [v18 fetchRecordZoneChangesCompletionBlock];

      if (v33)
      {
        v34 = [v18 fetchRecordZoneChangesCompletionBlock];
        ((void (**)(void, void *))v34)[2](v34, v21);
        goto LABEL_116;
      }
      goto LABEL_117;
    }
    id v158 = v5;
    long long v21 = [MEMORY[0x263EFF980] array];
    long long v198 = 0u;
    long long v199 = 0u;
    long long v200 = 0u;
    long long v201 = 0u;
    obuint64_t j = [v18 recordZoneIDs];
    uint64_t v164 = [obj countByEnumeratingWithState:&v198 objects:v218 count:16];
    if (!v164) {
      goto LABEL_73;
    }
    v160 = v21;
    id v162 = *(id *)v199;
    while (1)
    {
      for (uint64_t k = 0; k != v164; ++k)
      {
        if (*(id *)v199 != v162) {
          objc_enumerationMutation(obj);
        }
        uint64_t v69 = *(void *)(*((void *)&v198 + 1) + 8 * k);
        v70 = [(SCKStubContainer *)self zoneContentsByZoneID];
        v71 = [v70 objectForKeyedSubscript:v69];

        if (!v71)
        {
          [v21 addObject:v69];
          v83 = [(SCKStubContainer *)self _errorForErrorMode:2];
          v87 = [v18 recordZoneFetchCompletionBlock];

          if (!v87) {
            goto LABEL_71;
          }
          v86 = [v18 recordZoneFetchCompletionBlock];
          ((void (**)(void, uint64_t, void, void, void, void *))v86)[2](v86, v69, 0, 0, 0, v83);
          goto LABEL_69;
        }
        id v72 = objc_alloc(MEMORY[0x263EFD838]);
        v73 = [MEMORY[0x263EFF8F8] data];
        uint64_t v166 = [v72 initWithData:v73];

        long long v196 = 0u;
        long long v197 = 0u;
        long long v194 = 0u;
        long long v195 = 0u;
        v74 = [v71 allValues];
        uint64_t v75 = [v74 countByEnumeratingWithState:&v194 objects:v217 count:16];
        if (v75)
        {
          uint64_t v76 = v75;
          uint64_t v77 = *(void *)v195;
          do
          {
            for (uint64_t m = 0; m != v76; ++m)
            {
              if (*(void *)v195 != v77) {
                objc_enumerationMutation(v74);
              }
              uint64_t v79 = *(void *)(*((void *)&v194 + 1) + 8 * m);
              v80 = [v18 recordChangedBlock];

              if (v80)
              {
                v81 = [v18 recordChangedBlock];
                v81[2](v81, v79);
              }
            }
            uint64_t v76 = [v74 countByEnumeratingWithState:&v194 objects:v217 count:16];
          }
          while (v76);
        }

        v82 = [v18 recordZoneChangeTokensUpdatedBlock];

        v83 = (void *)v166;
        if (v82)
        {
          v84 = [v18 recordZoneChangeTokensUpdatedBlock];
          v84[2](v84, v69, v166, 0);
        }
        v85 = [v18 recordZoneFetchCompletionBlock];

        long long v21 = v160;
        if (v85)
        {
          v86 = [v18 recordZoneFetchCompletionBlock];
          v86[2](v86, v69, v166, 0, 0, 0);
          self = v168;
LABEL_69:

          goto LABEL_71;
        }
        self = v168;
LABEL_71:
      }
      uint64_t v164 = [obj countByEnumeratingWithState:&v198 objects:v218 count:16];
      if (!v164)
      {
LABEL_73:

        if ([v21 count])
        {
          v34 = [(SCKStubContainer *)self _errorForErrorMode:2 itemIDs:v21];
        }
        else
        {
          v34 = 0;
        }
        v137 = [(SCKStubContainer *)self willFinishZoneChanges];

        if (v137)
        {
          v138 = [(SCKStubContainer *)self willFinishZoneChanges];
          v138[2]();
        }
        v139 = [v18 fetchRecordZoneChangesCompletionBlock];

        id v5 = v158;
        if (v139)
        {
          v140 = [v18 fetchRecordZoneChangesCompletionBlock];
          v140[2](v140, v34);
        }
LABEL_116:

LABEL_117:
LABEL_118:

        goto LABEL_134;
      }
    }
  }
  uint64_t v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    v35 = [(SCKStubContainer *)self willModifyRecords];

    if (v35)
    {
      v36 = [(SCKStubContainer *)self willModifyRecords];
      v36[2]();
    }
    id v157 = v5;
    id v37 = v5;
    ++self->_modifyRecordsOperationCount;
    if ([(SCKStubContainer *)self modifyRecordsErrorMode])
    {
      v38 = [(SCKStubContainer *)self _errorForErrorMode:[(SCKStubContainer *)self modifyRecordsErrorMode]];
      v39 = [v37 modifyRecordsCompletionBlock];

      if (v39)
      {
        v40 = [v37 modifyRecordsCompletionBlock];
        ((void (**)(void, void, void, void *))v40)[2](v40, 0, 0, v38);
      }
    }
    else
    {
      v165 = [MEMORY[0x263EFF9C0] set];
      v167 = [MEMORY[0x263EFF9A0] dictionary];
      v102 = [MEMORY[0x263EFF9A0] dictionary];
      long long v190 = 0u;
      long long v191 = 0u;
      long long v192 = 0u;
      long long v193 = 0u;
      v161 = v37;
      id v163 = [v37 recordsToSave];
      uint64_t v103 = [v163 countByEnumeratingWithState:&v190 objects:v216 count:16];
      if (v103)
      {
        uint64_t v104 = v103;
        uint64_t v105 = *(void *)v191;
        do
        {
          for (uint64_t n = 0; n != v104; ++n)
          {
            if (*(void *)v191 != v105) {
              objc_enumerationMutation(v163);
            }
            v107 = *(void **)(*((void *)&v190 + 1) + 8 * n);
            v108 = [v107 recordID];
            v109 = [v108 zoneID];
            v110 = [v167 objectForKeyedSubscript:v109];

            if (v110)
            {
              v111 = [v110 arrayByAddingObject:v107];
            }
            else
            {
              v215 = v107;
              v111 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v215 count:1];
            }
            v112 = [v107 recordID];
            v113 = [v112 zoneID];
            [v167 setObject:v111 forKeyedSubscript:v113];

            v114 = [(SCKStubContainer *)v168 zoneContentsByZoneID];
            v115 = [v107 recordID];
            v116 = [v115 zoneID];
            v117 = [v114 objectForKeyedSubscript:v116];

            if (!v117)
            {
              v118 = [v107 recordID];
              v119 = [v118 zoneID];
              [v165 addObject:v119];
            }
          }
          uint64_t v104 = [v163 countByEnumeratingWithState:&v190 objects:v216 count:16];
        }
        while (v104);
      }

      long long v188 = 0u;
      long long v189 = 0u;
      long long v186 = 0u;
      long long v187 = 0u;
      v120 = [v161 recordIDsToDelete];
      uint64_t v121 = [v120 countByEnumeratingWithState:&v186 objects:v214 count:16];
      if (v121)
      {
        uint64_t v122 = v121;
        uint64_t v123 = *(void *)v187;
        do
        {
          for (iuint64_t i = 0; ii != v122; ++ii)
          {
            if (*(void *)v187 != v123) {
              objc_enumerationMutation(v120);
            }
            v125 = *(void **)(*((void *)&v186 + 1) + 8 * ii);
            v126 = [v125 zoneID];
            v127 = [v102 objectForKeyedSubscript:v126];

            if (v127)
            {
              v128 = [v127 arrayByAddingObject:v125];
            }
            else
            {
              v213 = v125;
              v128 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v213 count:1];
            }
            v129 = [v125 zoneID];
            [v102 setObject:v128 forKeyedSubscript:v129];

            v130 = [(SCKStubContainer *)v168 zoneContentsByZoneID];
            v131 = [v125 zoneID];
            v132 = [v130 objectForKeyedSubscript:v131];

            if (!v132)
            {
              v133 = [v125 zoneID];
              [v165 addObject:v133];
            }
          }
          uint64_t v122 = [v120 countByEnumeratingWithState:&v186 objects:v214 count:16];
        }
        while (v122);
      }

      if ([v165 count])
      {
        v134 = [v165 allObjects];
        v135 = v168;
        v136 = [(SCKStubContainer *)v168 _errorForErrorMode:2 itemIDs:v134];
      }
      else
      {
        v136 = 0;
        v135 = v168;
      }
      v141 = [MEMORY[0x263EFF9A0] dictionary];
      v182[0] = MEMORY[0x263EF8330];
      v182[1] = 3221225472;
      v182[2] = __41__SCKStubContainer_addDatabaseOperation___block_invoke;
      v182[3] = &unk_26467E5D8;
      id v142 = v165;
      id v183 = v142;
      v184 = v135;
      id v143 = v141;
      id v185 = v143;
      [v167 enumerateKeysAndObjectsUsingBlock:v182];
      id v37 = v161;
      if (!v136)
      {
        if ([v143 count])
        {
          v144 = (void *)MEMORY[0x263F087E8];
          uint64_t v145 = *MEMORY[0x263EFD498];
          uint64_t v211 = *MEMORY[0x263EFD4C8];
          id v212 = v143;
          v146 = [NSDictionary dictionaryWithObjects:&v212 forKeys:&v211 count:1];
          v136 = [v144 errorWithDomain:v145 code:2 userInfo:v146];

          v135 = v168;
        }
        else
        {
          v136 = 0;
        }
      }
      if ([v143 count] && objc_msgSend(v161, "atomic"))
      {
        v147 = [v161 modifyRecordsCompletionBlock];

        if (v147)
        {
          v148 = [v161 modifyRecordsCompletionBlock];
          ((void (**)(void, void, void, void *))v148)[2](v148, 0, 0, v136);
        }
      }
      else
      {
        v149 = [MEMORY[0x263EFF980] array];
        v177[0] = MEMORY[0x263EF8330];
        v177[1] = 3221225472;
        v177[2] = __41__SCKStubContainer_addDatabaseOperation___block_invoke_2;
        v177[3] = &unk_26467E600;
        id v150 = v142;
        id v178 = v150;
        v179 = v135;
        id v180 = v143;
        v151 = v135;
        id v152 = v149;
        id v181 = v152;
        [v167 enumerateKeysAndObjectsUsingBlock:v177];
        id v37 = v161;
        v153 = [MEMORY[0x263EFF980] array];
        v173[0] = MEMORY[0x263EF8330];
        v173[1] = 3221225472;
        v173[2] = __41__SCKStubContainer_addDatabaseOperation___block_invoke_3;
        v173[3] = &unk_26467E5D8;
        id v174 = v150;
        v175 = v151;
        id v154 = v153;
        id v176 = v154;
        [v102 enumerateKeysAndObjectsUsingBlock:v173];
        v155 = [v161 modifyRecordsCompletionBlock];

        if (v155)
        {
          v156 = [v161 modifyRecordsCompletionBlock];
          ((void (**)(void, id, id, void *))v156)[2](v156, v152, v154, v136);
        }
      }
    }
    goto LABEL_133;
  }
  uint64_t v9 = objc_opt_class();
  if (v9 == objc_opt_class())
  {
    id v18 = v5;
    ++self->_modifySubscriptionsOperationCount;
    v59 = [(SCKStubContainer *)self modifySubscriptionsSavedSubscriptions];
    v60 = [v18 subscriptionsToSave];
    v61 = [v59 arrayByAddingObjectsFromArray:v60];
    modifySubscriptionsSavedSubscriptions = self->_modifySubscriptionsSavedSubscriptions;
    self->_modifySubscriptionsSavedSubscriptions = v61;

    v63 = [v18 modifySubscriptionsCompletionBlock];

    if (v63)
    {
      v64 = [v18 modifySubscriptionsCompletionBlock];
      [v18 subscriptionsToSave];
      v66 = id v65 = v5;
      v67 = [v18 subscriptionIDsToDelete];
      ((void (**)(void, void *, void *, void))v64)[2](v64, v66, v67, 0);

      id v5 = v65;
    }
    goto LABEL_118;
  }
  uint64_t v10 = objc_opt_class();
  if (v10 == objc_opt_class())
  {
    id v88 = v5;
    id v89 = v5;
    ++self->_databaseChangesOperationCount;
    long long v169 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    v90 = [(SCKStubContainer *)self databaseChangesOperationChangedZoneIDs];
    uint64_t v91 = [v90 countByEnumeratingWithState:&v169 objects:v210 count:16];
    if (v91)
    {
      uint64_t v92 = v91;
      uint64_t v93 = *(void *)v170;
      do
      {
        for (juint64_t j = 0; jj != v92; ++jj)
        {
          if (*(void *)v170 != v93) {
            objc_enumerationMutation(v90);
          }
          uint64_t v95 = *(void *)(*((void *)&v169 + 1) + 8 * jj);
          v96 = [v89 recordZoneWithIDChangedBlock];
          v96[2](v96, v95);
        }
        uint64_t v92 = [v90 countByEnumeratingWithState:&v169 objects:v210 count:16];
      }
      while (v92);
    }

    id v97 = objc_alloc(MEMORY[0x263EFD838]);
    v98 = [MEMORY[0x263EFF8F8] data];
    v99 = (void *)[v97 initWithData:v98];

    v100 = [v89 fetchDatabaseChangesCompletionBlock];

    if (v100)
    {
      v101 = [v89 fetchDatabaseChangesCompletionBlock];
      ((void (**)(void, void *, void, void))v101)[2](v101, v99, 0, 0);
    }
    id v5 = v88;
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, self, @"SCKStubContainer.m", 312, @"unknown operation class %@", v13 object file lineNumber description];
  }
LABEL_134:
}

void __41__SCKStubContainer_addDatabaseOperation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) containsObject:v5] & 1) == 0)
  {
    uint64_t v29 = a1;
    uint64_t v7 = [*(id *)(a1 + 40) zoneContentsByZoneID];
    id v25 = v5;
    v31 = [v7 objectForKeyedSubscript:v5];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v24 = v6;
    obuint64_t j = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (!v8) {
      goto LABEL_15;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    uint64_t v28 = *MEMORY[0x263EFD4F0];
    uint64_t v27 = *MEMORY[0x263EFD4F8];
    uint64_t v26 = *MEMORY[0x263EFD498];
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "recordID", v24);
        id v14 = [v31 objectForKeyedSubscript:v13];

        if (v14)
        {
          v15 = [v12 recordChangeTag];
          uint64_t v16 = [v14 recordChangeTag];
          if (v15 == (void *)v16)
          {
            long long v21 = v15;
          }
          else
          {
            v17 = (void *)v16;
            id v18 = [v12 recordChangeTag];
            int64_t v19 = [v14 recordChangeTag];
            char v20 = [v18 isEqualToString:v19];

            if (v20) {
              goto LABEL_13;
            }
            v36[0] = v28;
            v36[1] = v27;
            v37[0] = v12;
            v37[1] = v14;
            long long v21 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
            v15 = [MEMORY[0x263F087E8] errorWithDomain:v26 code:14 userInfo:v21];
            id v22 = *(void **)(v29 + 48);
            v23 = [v12 recordID];
            [v22 setObject:v15 forKey:v23];
          }
        }
LABEL_13:
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (!v9)
      {
LABEL_15:

        id v6 = v24;
        id v5 = v25;
        break;
      }
    }
  }
}

void __41__SCKStubContainer_addDatabaseOperation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) containsObject:v5] & 1) == 0)
  {
    uint64_t v7 = [*(id *)(a1 + 40) zoneContentsByZoneID];
    uint64_t v8 = [v7 objectForKeyedSubscript:v5];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v23 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v15 = *(void **)(a1 + 48);
          uint64_t v16 = [v14 recordID];
          v17 = [v15 objectForKeyedSubscript:v16];

          if (!v17)
          {
            id v18 = [v14 recordID];
            [v8 setObject:v14 forKeyedSubscript:v18];

            [*(id *)(a1 + 56) addObject:v14];
            int64_t v19 = [*(id *)(a1 + 40) modifyRecordsSavedRecords];
            uint64_t v20 = [v19 arrayByAddingObject:v14];
            uint64_t v21 = *(void *)(a1 + 40);
            id v22 = *(void **)(v21 + 88);
            *(void *)(v21 + 88) = v20;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }

    id v6 = v23;
  }
}

void __41__SCKStubContainer_addDatabaseOperation___block_invoke_3(id *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (([a1[4] containsObject:v5] & 1) == 0)
  {
    uint64_t v7 = [a1[5] zoneContentsByZoneID];
    uint64_t v8 = [v7 objectForKeyedSubscript:v5];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          objc_msgSend(v8, "removeObjectForKey:", v14, (void)v15);
          [a1[6] addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)accountInfoWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  if ([(SCKStubContainer *)self accountInfoErrorMode])
  {
    id v5 = [(SCKStubContainer *)self _errorForErrorMode:[(SCKStubContainer *)self accountInfoErrorMode]];
    v4[2](v4, 0, v5);
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFD5C0]);
    [v5 setAccountStatus:1];
    [v5 setAccountPartition:1];
    [v5 setHasValidCredentials:1];
    [v5 setHasEncryptionIdentity:1];
    objc_msgSend(v5, "setSupportsDeviceToDeviceEncryption:", -[SCKStubContainer accountInfoSupportsDeviceToDeviceEncryption](self, "accountInfoSupportsDeviceToDeviceEncryption"));
    ((void (**)(id, id, id))v4)[2](v4, v5, 0);
  }
}

- (id)_errorForErrorMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    id v6 = 0;
  }
  else
  {
    int64_t v5 = [(SCKStubContainer *)self _ckErrorCodeForErrorMode:v3];
    id v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFD498] code:v5 userInfo:0];
  }
  return v6;
}

- (id)_errorForErrorMode:(int64_t)a3 itemIDs:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      int64_t v19 = [(SCKStubContainer *)self _ckErrorCodeForErrorMode:1];
      long long v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFD498] code:v19 userInfo:0];
    }
    else
    {
      long long v18 = 0;
    }
  }
  else
  {
    int64_t v7 = [(SCKStubContainer *)self _ckErrorCodeForErrorMode:a3];
    uint64_t v8 = *MEMORY[0x263EFD498];
    id v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFD498] code:v7 userInfo:0];
    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v13);
    }

    long long v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263EFD4C8];
    long long v26 = v10;
    long long v17 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    long long v18 = [v16 errorWithDomain:v8 code:2 userInfo:v17];
  }

  return v18;
}

- (int64_t)_ckErrorCodeForErrorMode:(int64_t)a3
{
  if (a3 == 3) {
    return 21;
  }
  if (a3 == 2) {
    return 26;
  }
  if (a3) {
    return 4;
  }
  int64_t v5 = [MEMORY[0x263F08690] currentHandler];
  [v5 handleFailureInMethod:a2 object:self file:@"SCKStubContainer.m" lineNumber:393 description:@"can't convert no error to a ck error code"];

  return 1;
}

- (int64_t)modifyZonesErrorMode
{
  return self->_modifyZonesErrorMode;
}

- (void)setModifyZonesErrorMode:(int64_t)a3
{
  self->_modifyZonesErrorMode = a3;
}

- (unint64_t)modifyZonesOperationCount
{
  return self->_modifyZonesOperationCount;
}

- (NSArray)modifyZonesSavedZones
{
  return self->_modifyZonesSavedZones;
}

- (int64_t)zoneChangesErrorMode
{
  return self->_zoneChangesErrorMode;
}

- (void)setZoneChangesErrorMode:(int64_t)a3
{
  self->_zoneChangesErrorMode = a3;
}

- (id)willFinishZoneChanges
{
  return self->_willFinishZoneChanges;
}

- (void)setWillFinishZoneChanges:(id)a3
{
}

- (unint64_t)zoneChangesOperationCount
{
  return self->_zoneChangesOperationCount;
}

- (int64_t)modifyRecordsErrorMode
{
  return self->_modifyRecordsErrorMode;
}

- (void)setModifyRecordsErrorMode:(int64_t)a3
{
  self->_modifyRecordsErrorMode = a3;
}

- (id)willModifyRecords
{
  return self->_willModifyRecords;
}

- (void)setWillModifyRecords:(id)a3
{
}

- (unint64_t)modifyRecordsOperationCount
{
  return self->_modifyRecordsOperationCount;
}

- (NSArray)modifyRecordsSavedRecords
{
  return self->_modifyRecordsSavedRecords;
}

- (unint64_t)modifySubscriptionsOperationCount
{
  return self->_modifySubscriptionsOperationCount;
}

- (NSArray)modifySubscriptionsSavedSubscriptions
{
  return self->_modifySubscriptionsSavedSubscriptions;
}

- (unint64_t)databaseChangesOperationCount
{
  return self->_databaseChangesOperationCount;
}

- (NSArray)databaseChangesOperationChangedZoneIDs
{
  return self->_databaseChangesOperationChangedZoneIDs;
}

- (void)setDatabaseChangesOperationChangedZoneIDs:(id)a3
{
}

- (BOOL)accountInfoSupportsDeviceToDeviceEncryption
{
  return self->_accountInfoSupportsDeviceToDeviceEncryption;
}

- (void)setAccountInfoSupportsDeviceToDeviceEncryption:(BOOL)a3
{
  self->_accountInfoSupportsDeviceToDeviceEncryptiouint64_t n = a3;
}

- (int64_t)accountInfoErrorMode
{
  return self->_accountInfoErrorMode;
}

- (void)setAccountInfoErrorMode:(int64_t)a3
{
  self->_accountInfoErrorMode = a3;
}

- (NSMutableDictionary)zoneContentsByZoneID
{
  return self->_zoneContentsByZoneID;
}

- (void)setZoneContentsByZoneID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneContentsByZoneID, 0);
  objc_storeStrong((id *)&self->_databaseChangesOperationChangedZoneIDs, 0);
  objc_storeStrong((id *)&self->_modifySubscriptionsSavedSubscriptions, 0);
  objc_storeStrong((id *)&self->_modifyRecordsSavedRecords, 0);
  objc_storeStrong(&self->_willModifyRecords, 0);
  objc_storeStrong(&self->_willFinishZoneChanges, 0);

  objc_storeStrong((id *)&self->_modifyZonesSavedZones, 0);
}

@end
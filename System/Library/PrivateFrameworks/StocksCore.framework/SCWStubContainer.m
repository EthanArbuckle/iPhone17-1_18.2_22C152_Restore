@interface SCWStubContainer
- (BOOL)accountInfoSupportsDeviceToDeviceEncryption;
- (NSArray)databaseChangesOperationChangedZoneIDs;
- (NSArray)modifyRecordsSavedRecords;
- (NSArray)modifySubscriptionsSavedSubscriptions;
- (NSArray)modifyZonesSavedZones;
- (NSMutableDictionary)zoneContentsByZoneID;
- (SCWStubContainer)init;
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

@implementation SCWStubContainer

- (SCWStubContainer)init
{
  v12.receiver = self;
  v12.super_class = (Class)SCWStubContainer;
  v2 = [(SCWStubContainer *)&v12 init];
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    modifyZonesSavedZones = v2->_modifyZonesSavedZones;
    v2->_modifyZonesSavedZones = v3;

    v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    modifyRecordsSavedRecords = v2->_modifyRecordsSavedRecords;
    v2->_modifyRecordsSavedRecords = v5;

    v7 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    modifySubscriptionsSavedSubscriptions = v2->_modifySubscriptionsSavedSubscriptions;
    v2->_modifySubscriptionsSavedSubscriptions = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    zoneContentsByZoneID = v2->_zoneContentsByZoneID;
    v2->_zoneContentsByZoneID = v9;

    v2->_accountInfoSupportsDeviceToDeviceEncryption = 1;
  }
  return v2;
}

- (void)setContentsOfZone:(id)a3 toRecords:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
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

  id v16 = objc_alloc(MEMORY[0x1E4F1A320]);
  v17 = (void *)[v16 initWithZoneName:v6 ownerName:*MEMORY[0x1E4F19C08]];
  v18 = [(SCWStubContainer *)self zoneContentsByZoneID];
  [v18 setObject:v8 forKeyedSubscript:v17];
}

- (id)contentsOfZone:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1A320];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = (void *)[v6 initWithZoneName:v5 ownerName:*MEMORY[0x1E4F19C08]];

  v8 = [(SCWStubContainer *)self zoneContentsByZoneID];
  id v9 = [v8 objectForKeyedSubscript:v7];
  uint64_t v10 = [v9 allValues];

  return v10;
}

- (id)contentsOfZone:(id)a3 withType:(id)a4
{
  id v6 = a4;
  id v7 = [(SCWStubContainer *)self contentsOfZone:a3];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__SCWStubContainer_contentsOfZone_withType___block_invoke;
  v12[3] = &unk_1E5FA4370;
  id v13 = v6;
  id v8 = v6;
  id v9 = [v7 indexesOfObjectsPassingTest:v12];
  uint64_t v10 = [v7 objectsAtIndexes:v9];

  return v10;
}

uint64_t __44__SCWStubContainer_contentsOfZone_withType___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 recordType];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)recordWithName:(id)a3 inZone:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1A320];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  uint64_t v10 = (void *)[v9 initWithZoneName:v7 ownerName:*MEMORY[0x1E4F19C08]];

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v8 zoneID:v10];
  uint64_t v12 = [(SCWStubContainer *)self zoneContentsByZoneID];
  id v13 = [v12 objectForKeyedSubscript:v10];
  v14 = [v13 objectForKeyedSubscript:v11];

  return v14;
}

- (void)addDatabaseOperation:(id)a3
{
  uint64_t v217 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v164 = self;
  if (v5 == objc_opt_class())
  {
    id v153 = v4;
    id v24 = v4;
    ++self->_modifyZonesOperationCount;
    if ([(SCWStubContainer *)self modifyZonesErrorMode])
    {
      v25 = [(SCWStubContainer *)self _errorForErrorMode:[(SCWStubContainer *)self modifyZonesErrorMode]];
      v26 = [v24 modifyRecordZonesCompletionBlock];

      if (!v26)
      {
LABEL_53:

LABEL_54:
LABEL_132:
        id v4 = v153;
        goto LABEL_133;
      }
      v27 = [v24 modifyRecordZonesCompletionBlock];
      v27[2](v27, 0, 0, v25);
    }
    else
    {
      v51 = [(SCWStubContainer *)self modifyZonesSavedZones];
      v52 = [v24 recordZonesToSave];
      v53 = [v51 arrayByAddingObjectsFromArray:v52];
      modifyZonesSavedZones = self->_modifyZonesSavedZones;
      self->_modifyZonesSavedZones = v53;

      long long v204 = 0u;
      long long v205 = 0u;
      long long v202 = 0u;
      long long v203 = 0u;
      v55 = [v24 recordZonesToSave];
      uint64_t v56 = [v55 countByEnumeratingWithState:&v202 objects:v216 count:16];
      if (v56)
      {
        uint64_t v57 = v56;
        uint64_t v58 = *(void *)v203;
        do
        {
          for (uint64_t i = 0; i != v57; ++i)
          {
            if (*(void *)v203 != v58) {
              objc_enumerationMutation(v55);
            }
            v60 = *(void **)(*((void *)&v202 + 1) + 8 * i);
            v61 = [(SCWStubContainer *)self zoneContentsByZoneID];
            v62 = [v60 zoneID];
            v63 = [v61 objectForKeyedSubscript:v62];

            if (!v63)
            {
              v64 = [MEMORY[0x1E4F1CA60] dictionary];
              v65 = [(SCWStubContainer *)self zoneContentsByZoneID];
              v66 = [v60 zoneID];
              [v65 setObject:v64 forKeyedSubscript:v66];
            }
          }
          uint64_t v57 = [v55 countByEnumeratingWithState:&v202 objects:v216 count:16];
        }
        while (v57);
      }

      v67 = [v24 modifyRecordZonesCompletionBlock];

      if (!v67) {
        goto LABEL_54;
      }
      v25 = [v24 modifyRecordZonesCompletionBlock];
      v27 = [v24 recordZonesToSave];
      v68 = [v24 recordZoneIDsToDelete];
      ((void (**)(void, void, void *, void))v25)[2](v25, v27, v68, 0);
    }
    goto LABEL_53;
  }
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    id v28 = v4;
    ++self->_zoneChangesOperationCount;
    if ([(SCWStubContainer *)self zoneChangesErrorMode])
    {
      int64_t v29 = [(SCWStubContainer *)self zoneChangesErrorMode];
      v30 = [v28 recordZoneIDs];
      v31 = [(SCWStubContainer *)self _errorForErrorMode:v29 itemIDs:v30];

      if ([v31 code] == 2)
      {
        id v32 = v4;
        long long v200 = 0u;
        long long v201 = 0u;
        long long v198 = 0u;
        long long v199 = 0u;
        v33 = [v28 recordZoneIDs];
        uint64_t v34 = [v33 countByEnumeratingWithState:&v198 objects:v215 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v199;
          do
          {
            for (uint64_t j = 0; j != v35; ++j)
            {
              if (*(void *)v199 != v36) {
                objc_enumerationMutation(v33);
              }
              uint64_t v38 = *(void *)(*((void *)&v198 + 1) + 8 * j);
              v39 = [v28 recordZoneFetchCompletionBlock];

              if (v39)
              {
                v40 = [v28 recordZoneFetchCompletionBlock];
                ((void (**)(void, uint64_t, void, void, void, void *))v40)[2](v40, v38, 0, 0, 0, v31);
              }
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v198 objects:v215 count:16];
          }
          while (v35);
        }

        id v4 = v32;
      }
      v41 = [(SCWStubContainer *)self willFinishZoneChanges];

      if (v41)
      {
        v42 = [(SCWStubContainer *)self willFinishZoneChanges];
        v42[2]();
      }
      v43 = [v28 fetchRecordZoneChangesCompletionBlock];

      if (v43)
      {
        v44 = [v28 fetchRecordZoneChangesCompletionBlock];
        ((void (**)(void, void *))v44)[2](v44, v31);
        goto LABEL_115;
      }
      goto LABEL_116;
    }
    id v154 = v4;
    v31 = [MEMORY[0x1E4F1CA48] array];
    long long v194 = 0u;
    long long v195 = 0u;
    long long v196 = 0u;
    long long v197 = 0u;
    obuint64_t j = [v28 recordZoneIDs];
    uint64_t v160 = [obj countByEnumeratingWithState:&v194 objects:v214 count:16];
    if (!v160) {
      goto LABEL_82;
    }
    v156 = v31;
    id v158 = *(id *)v195;
    while (1)
    {
      for (uint64_t k = 0; k != v160; ++k)
      {
        if (*(id *)v195 != v158) {
          objc_enumerationMutation(obj);
        }
        uint64_t v79 = *(void *)(*((void *)&v194 + 1) + 8 * k);
        v80 = [(SCWStubContainer *)self zoneContentsByZoneID];
        v81 = [v80 objectForKeyedSubscript:v79];

        if (!v81)
        {
          [v31 addObject:v79];
          v93 = [(SCWStubContainer *)self _errorForErrorMode:2];
          v97 = [v28 recordZoneFetchCompletionBlock];

          if (!v97) {
            goto LABEL_80;
          }
          v96 = [v28 recordZoneFetchCompletionBlock];
          ((void (**)(void, uint64_t, void, void, void, void *))v96)[2](v96, v79, 0, 0, 0, v93);
          goto LABEL_78;
        }
        id v82 = objc_alloc(MEMORY[0x1E4F1A388]);
        v83 = [MEMORY[0x1E4F1C9B8] data];
        uint64_t v162 = [v82 initWithData:v83];

        long long v192 = 0u;
        long long v193 = 0u;
        long long v190 = 0u;
        long long v191 = 0u;
        v84 = [v81 allValues];
        uint64_t v85 = [v84 countByEnumeratingWithState:&v190 objects:v213 count:16];
        if (v85)
        {
          uint64_t v86 = v85;
          uint64_t v87 = *(void *)v191;
          do
          {
            for (uint64_t m = 0; m != v86; ++m)
            {
              if (*(void *)v191 != v87) {
                objc_enumerationMutation(v84);
              }
              uint64_t v89 = *(void *)(*((void *)&v190 + 1) + 8 * m);
              v90 = [v28 recordChangedBlock];

              if (v90)
              {
                v91 = [v28 recordChangedBlock];
                v91[2](v91, v89);
              }
            }
            uint64_t v86 = [v84 countByEnumeratingWithState:&v190 objects:v213 count:16];
          }
          while (v86);
        }

        v92 = [v28 recordZoneChangeTokensUpdatedBlock];

        v93 = (void *)v162;
        if (v92)
        {
          v94 = [v28 recordZoneChangeTokensUpdatedBlock];
          v94[2](v94, v79, v162, 0);
        }
        v95 = [v28 recordZoneFetchCompletionBlock];

        v31 = v156;
        if (v95)
        {
          v96 = [v28 recordZoneFetchCompletionBlock];
          v96[2](v96, v79, v162, 0, 0, 0);
          self = v164;
LABEL_78:

          goto LABEL_80;
        }
        self = v164;
LABEL_80:
      }
      uint64_t v160 = [obj countByEnumeratingWithState:&v194 objects:v214 count:16];
      if (!v160)
      {
LABEL_82:

        if ([v31 count])
        {
          v44 = [(SCWStubContainer *)self _errorForErrorMode:2 itemIDs:v31];
        }
        else
        {
          v44 = 0;
        }
        v133 = [(SCWStubContainer *)self willFinishZoneChanges];

        if (v133)
        {
          v134 = [(SCWStubContainer *)self willFinishZoneChanges];
          v134[2]();
        }
        v135 = [v28 fetchRecordZoneChangesCompletionBlock];

        id v4 = v154;
        if (v135)
        {
          v136 = [v28 fetchRecordZoneChangesCompletionBlock];
          v136[2](v136, v44);
        }
LABEL_115:

LABEL_116:
LABEL_117:

        goto LABEL_133;
      }
    }
  }
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    v45 = [(SCWStubContainer *)self willModifyRecords];

    if (v45)
    {
      v46 = [(SCWStubContainer *)self willModifyRecords];
      v46[2]();
    }
    id v153 = v4;
    id v47 = v4;
    ++self->_modifyRecordsOperationCount;
    if ([(SCWStubContainer *)self modifyRecordsErrorMode])
    {
      v48 = [(SCWStubContainer *)self _errorForErrorMode:[(SCWStubContainer *)self modifyRecordsErrorMode]];
      v49 = [v47 modifyRecordsCompletionBlock];

      if (v49)
      {
        v50 = [v47 modifyRecordsCompletionBlock];
        ((void (**)(void, void, void, void *))v50)[2](v50, 0, 0, v48);
      }
    }
    else
    {
      v161 = [MEMORY[0x1E4F1CA80] set];
      v163 = [MEMORY[0x1E4F1CA60] dictionary];
      v98 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v186 = 0u;
      long long v187 = 0u;
      long long v188 = 0u;
      long long v189 = 0u;
      v157 = v47;
      id v159 = [v47 recordsToSave];
      uint64_t v99 = [v159 countByEnumeratingWithState:&v186 objects:v212 count:16];
      if (v99)
      {
        uint64_t v100 = v99;
        uint64_t v101 = *(void *)v187;
        do
        {
          for (uint64_t n = 0; n != v100; ++n)
          {
            if (*(void *)v187 != v101) {
              objc_enumerationMutation(v159);
            }
            v103 = *(void **)(*((void *)&v186 + 1) + 8 * n);
            v104 = [v103 recordID];
            v105 = [v104 zoneID];
            v106 = [v163 objectForKeyedSubscript:v105];

            if (v106)
            {
              v107 = [v106 arrayByAddingObject:v103];
            }
            else
            {
              v211 = v103;
              v107 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v211 count:1];
            }
            v108 = [v103 recordID];
            v109 = [v108 zoneID];
            [v163 setObject:v107 forKeyedSubscript:v109];

            v110 = [(SCWStubContainer *)v164 zoneContentsByZoneID];
            v111 = [v103 recordID];
            v112 = [v111 zoneID];
            v113 = [v110 objectForKeyedSubscript:v112];

            if (!v113)
            {
              v114 = [v103 recordID];
              v115 = [v114 zoneID];
              [v161 addObject:v115];
            }
          }
          uint64_t v100 = [v159 countByEnumeratingWithState:&v186 objects:v212 count:16];
        }
        while (v100);
      }

      long long v184 = 0u;
      long long v185 = 0u;
      long long v182 = 0u;
      long long v183 = 0u;
      v116 = [v157 recordIDsToDelete];
      uint64_t v117 = [v116 countByEnumeratingWithState:&v182 objects:v210 count:16];
      if (v117)
      {
        uint64_t v118 = v117;
        uint64_t v119 = *(void *)v183;
        do
        {
          for (iuint64_t i = 0; ii != v118; ++ii)
          {
            if (*(void *)v183 != v119) {
              objc_enumerationMutation(v116);
            }
            v121 = *(void **)(*((void *)&v182 + 1) + 8 * ii);
            v122 = [v121 zoneID];
            v123 = [v98 objectForKeyedSubscript:v122];

            if (v123)
            {
              v124 = [v123 arrayByAddingObject:v121];
            }
            else
            {
              v209 = v121;
              v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v209 count:1];
            }
            v125 = [v121 zoneID];
            [v98 setObject:v124 forKeyedSubscript:v125];

            v126 = [(SCWStubContainer *)v164 zoneContentsByZoneID];
            v127 = [v121 zoneID];
            v128 = [v126 objectForKeyedSubscript:v127];

            if (!v128)
            {
              v129 = [v121 zoneID];
              [v161 addObject:v129];
            }
          }
          uint64_t v118 = [v116 countByEnumeratingWithState:&v182 objects:v210 count:16];
        }
        while (v118);
      }

      if ([v161 count])
      {
        v130 = [v161 allObjects];
        v131 = v164;
        v132 = [(SCWStubContainer *)v164 _errorForErrorMode:2 itemIDs:v130];
      }
      else
      {
        v132 = 0;
        v131 = v164;
      }
      v137 = [MEMORY[0x1E4F1CA60] dictionary];
      v178[0] = MEMORY[0x1E4F143A8];
      v178[1] = 3221225472;
      v178[2] = __41__SCWStubContainer_addDatabaseOperation___block_invoke;
      v178[3] = &unk_1E5FA4398;
      id v138 = v161;
      id v179 = v138;
      v180 = v131;
      id v139 = v137;
      id v181 = v139;
      [v163 enumerateKeysAndObjectsUsingBlock:v178];
      id v47 = v157;
      if (!v132)
      {
        if ([v139 count])
        {
          v140 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v141 = *MEMORY[0x1E4F19C40];
          uint64_t v207 = *MEMORY[0x1E4F19CD8];
          id v208 = v139;
          v142 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v208 forKeys:&v207 count:1];
          v132 = [v140 errorWithDomain:v141 code:2 userInfo:v142];

          v131 = v164;
        }
        else
        {
          v132 = 0;
        }
      }
      if ([v139 count] && objc_msgSend(v157, "atomic"))
      {
        v143 = [v157 modifyRecordsCompletionBlock];

        if (v143)
        {
          v144 = [v157 modifyRecordsCompletionBlock];
          ((void (**)(void, void, void, void *))v144)[2](v144, 0, 0, v132);
        }
      }
      else
      {
        v145 = [MEMORY[0x1E4F1CA48] array];
        v173[0] = MEMORY[0x1E4F143A8];
        v173[1] = 3221225472;
        v173[2] = __41__SCWStubContainer_addDatabaseOperation___block_invoke_2;
        v173[3] = &unk_1E5FA43C0;
        id v146 = v138;
        id v174 = v146;
        v175 = v131;
        id v176 = v139;
        v147 = v131;
        id v148 = v145;
        id v177 = v148;
        [v163 enumerateKeysAndObjectsUsingBlock:v173];
        id v47 = v157;
        v149 = [MEMORY[0x1E4F1CA48] array];
        v169[0] = MEMORY[0x1E4F143A8];
        v169[1] = 3221225472;
        v169[2] = __41__SCWStubContainer_addDatabaseOperation___block_invoke_3;
        v169[3] = &unk_1E5FA4398;
        id v170 = v146;
        v171 = v147;
        id v150 = v149;
        id v172 = v150;
        [v98 enumerateKeysAndObjectsUsingBlock:v169];
        v151 = [v157 modifyRecordsCompletionBlock];

        if (v151)
        {
          v152 = [v157 modifyRecordsCompletionBlock];
          ((void (**)(void, id, id, void *))v152)[2](v152, v148, v150, v132);
        }
      }
    }
    goto LABEL_132;
  }
  uint64_t v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    id v28 = v4;
    ++self->_modifySubscriptionsOperationCount;
    v69 = [(SCWStubContainer *)self modifySubscriptionsSavedSubscriptions];
    v70 = [v28 subscriptionsToSave];
    v71 = [v69 arrayByAddingObjectsFromArray:v70];
    modifySubscriptionsSavedSubscriptions = self->_modifySubscriptionsSavedSubscriptions;
    self->_modifySubscriptionsSavedSubscriptions = v71;

    v73 = [v28 modifySubscriptionsCompletionBlock];

    if (v73)
    {
      v74 = [v28 modifySubscriptionsCompletionBlock];
      [v28 subscriptionsToSave];
      v76 = id v75 = v4;
      v77 = [v28 subscriptionIDsToDelete];
      ((void (**)(void, void *, void *, void))v74)[2](v74, v76, v77, 0);

      id v4 = v75;
    }
    goto LABEL_117;
  }
  uint64_t v9 = objc_opt_class();
  if (v9 == objc_opt_class())
  {
    id v10 = v4;
    id v11 = v4;
    ++self->_databaseChangesOperationCount;
    long long v165 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    uint64_t v12 = [(SCWStubContainer *)self databaseChangesOperationChangedZoneIDs];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v165 objects:v206 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v166;
      do
      {
        for (uint64_t jj = 0; jj != v14; ++jj)
        {
          if (*(void *)v166 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v165 + 1) + 8 * jj);
          v18 = [v11 recordZoneWithIDChangedBlock];
          v18[2](v18, v17);
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v165 objects:v206 count:16];
      }
      while (v14);
    }

    id v19 = objc_alloc(MEMORY[0x1E4F1A388]);
    long long v20 = [MEMORY[0x1E4F1C9B8] data];
    long long v21 = (void *)[v19 initWithData:v20];

    long long v22 = [v11 fetchDatabaseChangesCompletionBlock];

    if (v22)
    {
      v23 = [v11 fetchDatabaseChangesCompletionBlock];
      ((void (**)(void, void *, void, void))v23)[2](v23, v21, 0, 0);
    }
    id v4 = v10;
  }
LABEL_133:
}

void __41__SCWStubContainer_addDatabaseOperation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
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
    uint64_t v28 = *MEMORY[0x1E4F19D08];
    uint64_t v27 = *MEMORY[0x1E4F19D10];
    uint64_t v26 = *MEMORY[0x1E4F19C40];
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "recordID", v24);
        uint64_t v14 = [v31 objectForKeyedSubscript:v13];

        if (v14)
        {
          uint64_t v15 = [v12 recordChangeTag];
          uint64_t v16 = [v14 recordChangeTag];
          if (v15 == (void *)v16)
          {
            long long v21 = v15;
          }
          else
          {
            uint64_t v17 = (void *)v16;
            v18 = [v12 recordChangeTag];
            id v19 = [v14 recordChangeTag];
            char v20 = [v18 isEqualToString:v19];

            if (v20) {
              goto LABEL_13;
            }
            v36[0] = v28;
            v36[1] = v27;
            v37[0] = v12;
            v37[1] = v14;
            long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
            uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:v26 code:14 userInfo:v21];
            long long v22 = *(void **)(v29 + 48);
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

void __41__SCWStubContainer_addDatabaseOperation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
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
          uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v15 = *(void **)(a1 + 48);
          uint64_t v16 = [v14 recordID];
          uint64_t v17 = [v15 objectForKeyedSubscript:v16];

          if (!v17)
          {
            v18 = [v14 recordID];
            [v8 setObject:v14 forKeyedSubscript:v18];

            [*(id *)(a1 + 56) addObject:v14];
            id v19 = [*(id *)(a1 + 40) modifyRecordsSavedRecords];
            uint64_t v20 = [v19 arrayByAddingObject:v14];
            uint64_t v21 = *(void *)(a1 + 40);
            long long v22 = *(void **)(v21 + 88);
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

void __41__SCWStubContainer_addDatabaseOperation___block_invoke_3(id *a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
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
  id v4 = (void (**)(id, void, id))a3;
  if ([(SCWStubContainer *)self accountInfoErrorMode])
  {
    id v5 = [(SCWStubContainer *)self _errorForErrorMode:[(SCWStubContainer *)self accountInfoErrorMode]];
    v4[2](v4, 0, v5);
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F19E20]);
    [v5 setAccountStatus:1];
    [v5 setAccountPartition:1];
    [v5 setHasValidCredentials:1];
    [v5 setHasEncryptionIdentity:1];
    objc_msgSend(v5, "setSupportsDeviceToDeviceEncryption:", -[SCWStubContainer accountInfoSupportsDeviceToDeviceEncryption](self, "accountInfoSupportsDeviceToDeviceEncryption"));
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
    int64_t v5 = [(SCWStubContainer *)self _ckErrorCodeForErrorMode:v3];
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F19C40] code:v5 userInfo:0];
  }
  return v6;
}

- (id)_errorForErrorMode:(int64_t)a3 itemIDs:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ((unint64_t)(a3 - 2) >= 2)
  {
    if (a3 == 1)
    {
      int64_t v19 = [(SCWStubContainer *)self _ckErrorCodeForErrorMode:1];
      long long v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F19C40] code:v19 userInfo:0];
    }
    else
    {
      long long v18 = 0;
    }
  }
  else
  {
    int64_t v7 = [(SCWStubContainer *)self _ckErrorCodeForErrorMode:a3];
    uint64_t v8 = *MEMORY[0x1E4F19C40];
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F19C40] code:v7 userInfo:0];
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
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

    long long v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F19CD8];
    long long v26 = v10;
    long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    long long v18 = [v16 errorWithDomain:v8 code:2 userInfo:v17];
  }

  return v18;
}

- (int64_t)_ckErrorCodeForErrorMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 1;
  }
  else {
    return qword_1AFFD0500[a3 - 1];
  }
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
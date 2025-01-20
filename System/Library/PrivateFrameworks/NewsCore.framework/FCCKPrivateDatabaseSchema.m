@interface FCCKPrivateDatabaseSchema
+ (FCCKPrivateDatabaseSchema)databaseSchemaWithZones:(void *)a3 records:(void *)a4 recordTypeVersionMapping:(void *)a5 recordNameVersionMapping:;
- (FCCKPrivateDatabaseSchema)init;
- (FCCKRecordTypeMapping)mappingFromRecordType:(void *)a3 inZoneName:(uint64_t)a4 toVersion:;
- (FCCKRecordZoneIDMapping)mappingFromRecord:(uint64_t)a3 toVersion:;
- (FCCKRecordZoneIDMapping)mappingFromRecordZoneName:(uint64_t)a3 toVersion:;
- (id)mappingFromRecordID:(uint64_t)a3 toVersion:;
- (id)mappingFromRecordType:(void *)a3 inZoneID:(uint64_t)a4 toVersion:;
- (id)mappingFromRecordZoneID:(uint64_t)a3 toVersion:;
- (id)recordNamesInDefaultZoneChangedFromVersion:(uint64_t)a3 toVersion:;
- (id)schemaForZoneWithName:(id *)a1;
- (id)zoneNamesWithChangesFromVersion:(uint64_t)a3 toVersion:;
- (void)enumerateZoneSchemasForVersion:(void *)a3 withBlock:;
- (void)enumerateZoneSchemasWithBlock:(uint64_t)a1;
- (void)schemaForZoneContainingRecordID:(void *)a1;
@end

@implementation FCCKPrivateDatabaseSchema

uint64_t __113__FCCKPrivateDatabaseSchema_initWithZoneSchemas_recordSchemas_recordTypeVersionMapping_recordNameVersionMapping___block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  if (v2) {
    v4 = *(void **)(v2 + 16);
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  v6 = [v3 first];

  uint64_t v7 = [v5 isEqualToString:v6];
  return v7;
}

uint64_t __113__FCCKPrivateDatabaseSchema_initWithZoneSchemas_recordSchemas_recordTypeVersionMapping_recordNameVersionMapping___block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  if (v2) {
    v4 = *(void **)(v2 + 16);
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  v6 = [v3 second];

  uint64_t v7 = [v5 isEqualToString:v6];
  return v7;
}

uint64_t __113__FCCKPrivateDatabaseSchema_initWithZoneSchemas_recordSchemas_recordTypeVersionMapping_recordNameVersionMapping___block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4) {
    v4 = (void *)v4[2];
  }
  id v5 = v4;
  v6 = [v3 first];
  if ([v5 isEqualToString:v6])
  {
    uint64_t v7 = *(void **)(a1 + 40);
    v8 = [v3 second];
    uint64_t v9 = [v7 isEqualToString:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __113__FCCKPrivateDatabaseSchema_initWithZoneSchemas_recordSchemas_recordTypeVersionMapping_recordNameVersionMapping___block_invoke(uint64_t a1, void *a2)
{
  return [a2 first];
}

+ (FCCKPrivateDatabaseSchema)databaseSchemaWithZones:(void *)a3 records:(void *)a4 recordTypeVersionMapping:(void *)a5 recordNameVersionMapping:
{
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  self;
  v13 = [FCCKPrivateDatabaseSchema alloc];
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  if (v13)
  {
    v146.receiver = v13;
    v146.super_class = (Class)FCCKPrivateDatabaseSchema;
    v18 = (FCCKPrivateDatabaseSchema *)objc_msgSendSuper2(&v146, sel_init);
    if (v18)
    {
      v19 = a5;
      v104 = v18;
      v105 = v16;
      id v99 = v17;
      v112 = [MEMORY[0x1E4F1CA80] set];
      v103 = [MEMORY[0x1E4F1CA80] set];
      id v107 = [MEMORY[0x1E4F1CA60] dictionary];
      id v106 = [MEMORY[0x1E4F1CA48] array];
      [MEMORY[0x1E4F1CA60] dictionary];
      v102 = id v101 = v14;
      long long v142 = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      long long v145 = 0u;
      id obj = v14;
      uint64_t v20 = [obj countByEnumeratingWithState:&v142 objects:v174 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v143;
        uint64_t v23 = *MEMORY[0x1E4F19D88];
        do
        {
          uint64_t v24 = 0;
          do
          {
            if (*(void *)v143 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v25 = *(void *)(*((void *)&v142 + 1) + 8 * v24);
            if (v25) {
              v26 = *(void **)(v25 + 16);
            }
            else {
              v26 = 0;
            }
            id v27 = v26;
            int v28 = [v27 isEqualToString:v23];

            if (v28)
            {
              [v106 addObject:v25];
            }
            else
            {
              if (v25) {
                v29 = *(void **)(v25 + 16);
              }
              else {
                v29 = 0;
              }
              id v30 = v29;
              [v107 setObject:v25 forKeyedSubscript:v30];
            }
            if (v25) {
              v31 = *(void **)(v25 + 16);
            }
            else {
              v31 = 0;
            }
            id v32 = v31;
            [v112 addObject:v32];

            ++v24;
          }
          while (v21 != v24);
          uint64_t v33 = [obj countByEnumeratingWithState:&v142 objects:v174 count:16];
          uint64_t v21 = v33;
        }
        while (v33);
      }

      long long v140 = 0u;
      long long v141 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      id v109 = v15;
      uint64_t v34 = [v109 countByEnumeratingWithState:&v138 objects:v173 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v139;
        do
        {
          uint64_t v37 = 0;
          do
          {
            if (*(void *)v139 != v36) {
              objc_enumerationMutation(v109);
            }
            uint64_t v38 = *(void *)(*((void *)&v138 + 1) + 8 * v37);
            if (v38)
            {
              id v39 = *(id *)(v38 + 16);
              [v102 setObject:v38 forKeyedSubscript:v39];

              v40 = *(void **)(v38 + 16);
            }
            else
            {
              [v102 setObject:0 forKeyedSubscript:0];
              v40 = 0;
            }
            id v41 = v40;
            [v103 addObject:v41];

            ++v37;
          }
          while (v35 != v37);
          uint64_t v42 = [v109 countByEnumeratingWithState:&v138 objects:v173 count:16];
          uint64_t v35 = v42;
        }
        while (v42);
      }
      id v100 = v15;

      uint64_t v43 = [v105 mappingByTransformingValuesWithBlock:&__block_literal_global_142];
      zoneNameVersionMapping = v104->_zoneNameVersionMapping;
      v104->_zoneNameVersionMapping = (FCCKPrivateDatabaseVersionMapping *)v43;

      p_recordTypeVersionMapping = (id *)&v104->_recordTypeVersionMapping;
      objc_storeStrong((id *)&v104->_recordTypeVersionMapping, a4);
      objc_storeStrong((id *)&v104->_recordNameVersionMapping, v19);
      objc_storeStrong((id *)&v104->_zoneSchemasByName, v107);
      objc_storeStrong((id *)&v104->_defaultZoneSchemas, v106);
      objc_storeStrong((id *)&v104->_recordSchemasByType, v102);
      uint64_t v45 = 0;
      uint64_t v46 = *MEMORY[0x1E4F19D88];
      do
      {
        long long v136 = 0u;
        long long v137 = 0u;
        long long v134 = 0u;
        long long v135 = 0u;
        uint64_t v110 = v45;
        objc_msgSend(*p_recordTypeVersionMapping, "allValuesForVersion:");
        id v117 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v47 = [v117 countByEnumeratingWithState:&v134 objects:v172 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v135;
          do
          {
            for (uint64_t i = 0; i != v48; ++i)
            {
              if (*(void *)v135 != v49) {
                objc_enumerationMutation(v117);
              }
              v51 = *(void **)(*((void *)&v134 + 1) + 8 * i);
              v52 = [v51 first];
              if ([v52 isEqualToString:v46])
              {
              }
              else
              {
                zoneSchemasByName = v104->_zoneSchemasByName;
                v54 = [v51 first];
                v55 = [(NSDictionary *)zoneSchemasByName objectForKey:v54];

                if (!v55 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                {
                  id v62 = [NSString alloc];
                  v63 = [v51 first];
                  v64 = (void *)[v62 initWithFormat:@"missing zone name in schema: %@", v63];
                  *(_DWORD *)buf = 136315906;
                  v165 = "-[FCCKPrivateDatabaseSchema initWithZoneSchemas:recordSchemas:recordTypeVersionMapping:recordNa"
                         "meVersionMapping:]";
                  __int16 v166 = 2080;
                  v167 = "FCCKPrivateDatabaseSchema.m";
                  __int16 v168 = 1024;
                  int v169 = 91;
                  __int16 v170 = 2114;
                  v171 = v64;
                  _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
                }
              }
              recordSchemasByType = v104->_recordSchemasByType;
              v57 = [v51 second];
              v58 = [(NSDictionary *)recordSchemasByType objectForKey:v57];

              if (!v58 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                id v59 = [NSString alloc];
                v60 = [v51 second];
                v61 = (void *)[v59 initWithFormat:@"missing record type in schema: %@", v60];
                *(_DWORD *)buf = 136315906;
                v165 = "-[FCCKPrivateDatabaseSchema initWithZoneSchemas:recordSchemas:recordTypeVersionMapping:recordName"
                       "VersionMapping:]";
                __int16 v166 = 2080;
                v167 = "FCCKPrivateDatabaseSchema.m";
                __int16 v168 = 1024;
                int v169 = 92;
                __int16 v170 = 2114;
                v171 = v61;
                _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
              }
            }
            uint64_t v48 = [v117 countByEnumeratingWithState:&v134 objects:v172 count:16];
          }
          while (v48);
        }

        uint64_t v45 = v110 + 1;
      }
      while (v110 != 3);
      long long v132 = 0u;
      long long v133 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      id v108 = obj;
      id obja = (id)[v108 countByEnumeratingWithState:&v130 objects:buf count:16];
      if (obja)
      {
        uint64_t v111 = *(void *)v131;
        do
        {
          uint64_t v65 = 0;
          do
          {
            if (*(void *)v131 != v111) {
              objc_enumerationMutation(v108);
            }
            uint64_t v66 = *(void *)(*((void *)&v130 + 1) + 8 * v65);
            id v67 = *p_recordTypeVersionMapping;
            v129[0] = MEMORY[0x1E4F143A8];
            v129[1] = 3221225472;
            v129[2] = __113__FCCKPrivateDatabaseSchema_initWithZoneSchemas_recordSchemas_recordTypeVersionMapping_recordNameVersionMapping___block_invoke_17;
            v129[3] = &unk_1E5B59450;
            v129[4] = v66;
            if (([v67 containsValuePassingTest:v129] & 1) == 0
              && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              id v80 = [NSString alloc];
              if (v66) {
                v81 = *(void **)(v66 + 16);
              }
              else {
                v81 = 0;
              }
              id v82 = v81;
              v83 = (void *)[v80 initWithFormat:@"missing zone name in version mapping: %@", v82];
              *(_DWORD *)v155 = 136315906;
              v156 = "-[FCCKPrivateDatabaseSchema initWithZoneSchemas:recordSchemas:recordTypeVersionMapping:recordNameVersionMapping:]";
              __int16 v157 = 2080;
              v158 = "FCCKPrivateDatabaseSchema.m";
              __int16 v159 = 1024;
              int v160 = 99;
              __int16 v161 = 2114;
              v162 = v83;
              _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v155, 0x26u);
            }
            long long v125 = 0u;
            long long v126 = 0u;
            long long v127 = 0u;
            long long v128 = 0u;
            uint64_t v116 = v65;
            if (v66) {
              v68 = *(void **)(v66 + 32);
            }
            else {
              v68 = 0;
            }
            id v69 = v68;
            uint64_t v70 = [v69 countByEnumeratingWithState:&v125 objects:v163 count:16];
            if (v70)
            {
              uint64_t v71 = v70;
              uint64_t v72 = *(void *)v126;
              do
              {
                uint64_t v73 = 0;
                do
                {
                  if (*(void *)v126 != v72) {
                    objc_enumerationMutation(v69);
                  }
                  uint64_t v74 = *(void *)(*((void *)&v125 + 1) + 8 * v73);
                  recordNameVersionMapping = v104->_recordNameVersionMapping;
                  v124[0] = MEMORY[0x1E4F143A8];
                  v124[1] = 3221225472;
                  v124[2] = __113__FCCKPrivateDatabaseSchema_initWithZoneSchemas_recordSchemas_recordTypeVersionMapping_recordNameVersionMapping___block_invoke_22;
                  v124[3] = &unk_1E5B59478;
                  v124[4] = v66;
                  v124[5] = v74;
                  if (![(FCCKPrivateDatabaseVersionMapping *)recordNameVersionMapping containsValuePassingTest:v124]&& os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                  {
                    id v118 = [NSString alloc];
                    if (v66) {
                      v76 = *(void **)(v66 + 16);
                    }
                    else {
                      v76 = 0;
                    }
                    id v77 = v76;
                    v78 = (void *)[v118 initWithFormat:@"missing static record in name mapping: %@:%@", v77, v74];
                    *(_DWORD *)v155 = 136315906;
                    v156 = "-[FCCKPrivateDatabaseSchema initWithZoneSchemas:recordSchemas:recordTypeVersionMapping:record"
                           "NameVersionMapping:]";
                    __int16 v157 = 2080;
                    v158 = "FCCKPrivateDatabaseSchema.m";
                    __int16 v159 = 1024;
                    int v160 = 104;
                    __int16 v161 = 2114;
                    v162 = v78;
                    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v155, 0x26u);
                  }
                  ++v73;
                }
                while (v71 != v73);
                uint64_t v79 = [v69 countByEnumeratingWithState:&v125 objects:v163 count:16];
                uint64_t v71 = v79;
              }
              while (v79);
            }

            uint64_t v65 = v116 + 1;
          }
          while ((id)(v116 + 1) != obja);
          uint64_t v84 = [v108 countByEnumeratingWithState:&v130 objects:buf count:16];
          id obja = (id)v84;
        }
        while (v84);
      }

      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      id v85 = v109;
      uint64_t v86 = [v85 countByEnumeratingWithState:&v120 objects:v155 count:16];
      if (v86)
      {
        uint64_t v87 = v86;
        uint64_t v88 = *(void *)v121;
        v89 = MEMORY[0x1E4F14500];
        do
        {
          uint64_t v90 = 0;
          do
          {
            if (*(void *)v121 != v88) {
              objc_enumerationMutation(v85);
            }
            uint64_t v91 = *(void *)(*((void *)&v120 + 1) + 8 * v90);
            id v92 = *p_recordTypeVersionMapping;
            v119[0] = MEMORY[0x1E4F143A8];
            v119[1] = 3221225472;
            v119[2] = __113__FCCKPrivateDatabaseSchema_initWithZoneSchemas_recordSchemas_recordTypeVersionMapping_recordNameVersionMapping___block_invoke_26;
            v119[3] = &unk_1E5B59450;
            v119[4] = v91;
            if (([v92 containsValuePassingTest:v119] & 1) == 0
              && os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
            {
              id v93 = [NSString alloc];
              if (v91) {
                v94 = *(void **)(v91 + 16);
              }
              else {
                v94 = 0;
              }
              id v95 = v94;
              v96 = (void *)[v93 initWithFormat:@"missing record type in version mapping: %@", v95];
              *(_DWORD *)v147 = 136315906;
              v148 = "-[FCCKPrivateDatabaseSchema initWithZoneSchemas:recordSchemas:recordTypeVersionMapping:recordNameVersionMapping:]";
              __int16 v149 = 2080;
              v150 = "FCCKPrivateDatabaseSchema.m";
              __int16 v151 = 1024;
              int v152 = 111;
              __int16 v153 = 2114;
              v154 = v96;
              _os_log_error_impl(&dword_1A460D000, v89, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v147, 0x26u);
            }
            ++v90;
          }
          while (v87 != v90);
          uint64_t v97 = [v85 countByEnumeratingWithState:&v120 objects:v155 count:16];
          uint64_t v87 = v97;
        }
        while (v97);
      }

      id v15 = v100;
      id v14 = v101;
      v13 = v104;
      id v16 = v105;
      id v17 = v99;
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (FCCKPrivateDatabaseSchema)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCCKPrivateDatabaseSchema init]";
    __int16 v9 = 2080;
    id v10 = "FCCKPrivateDatabaseSchema.m";
    __int16 v11 = 1024;
    int v12 = 40;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCCKPrivateDatabaseSchema init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCCKRecordZoneIDMapping)mappingFromRecord:(uint64_t)a3 toVersion:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a2;
    id v6 = [v5 recordID];
    uint64_t v7 = -[FCCKPrivateDatabaseSchema mappingFromRecordID:toVersion:]((uint64_t)v3, v6, a3);

    v8 = [v5 recordType];
    __int16 v9 = [v5 recordID];

    id v10 = [v9 zoneID];
    __int16 v11 = -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneID:toVersion:](v3, v8, v10, a3);

    int v12 = [FCCKRecordMapping alloc];
    __int16 v13 = [v7 fromZoneSchema];
    id v14 = [v7 toZoneSchema];
    uint64_t v15 = [v11 fromRecordSchema];
    id v16 = [v11 toRecordSchema];
    id v3 = [(FCCKRecordMapping *)v12 initWithFromZoneSchema:v13 toZoneSchema:v14 fromRecordSchema:v15 toRecordSchema:v16 recordIDMapping:v7];
  }
  return v3;
}

- (id)mappingFromRecordID:(uint64_t)a3 toVersion:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    uint64_t v7 = [v5 zoneID];
    v8 = [v7 zoneName];
    __int16 v9 = [v6 recordName];
    id v10 = +[FCPair pairWithFirst:v8 second:v9];

    __int16 v11 = [*(id *)(a1 + 24) mapValue:v10 toVersion:a3];
    int v12 = [v11 second];
    __int16 v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v6 recordName];
    }
    uint64_t v15 = v14;

    id v16 = [v6 zoneID];
    id v17 = [v16 zoneName];
    int v18 = [v17 isEqualToString:*MEMORY[0x1E4F19D88]];

    if (v18)
    {
      v19 = *(void **)(a1 + 40);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __59__FCCKPrivateDatabaseSchema_mappingFromRecordID_toVersion___block_invoke;
      v43[3] = &unk_1E5B594A0;
      id v20 = v6;
      id v44 = v20;
      uint64_t v21 = objc_msgSend(v19, "fc_firstObjectPassingTest:", v43);
      uint64_t v22 = *(void **)(a1 + 40);
      uint64_t v38 = MEMORY[0x1E4F143A8];
      uint64_t v39 = 3221225472;
      v40 = __59__FCCKPrivateDatabaseSchema_mappingFromRecordID_toVersion___block_invoke_2;
      id v41 = &unk_1E5B594A0;
      id v23 = v15;
      id v42 = v23;
      uint64_t v24 = objc_msgSend(v22, "fc_firstObjectPassingTest:", &v38);
      uint64_t v25 = [FCCKRecordIDMapping alloc];
      v26 = objc_msgSend(v20, "recordName", v38, v39, v40, v41);
      a1 = [(FCCKRecordIDMapping *)v25 initWithFromZoneSchema:v21 toZoneSchema:v24 fromRecordName:v26 toRecordName:v23];
    }
    else
    {
      id v27 = [v6 zoneID];
      int v28 = [v27 zoneName];
      v29 = -[FCCKPrivateDatabaseSchema schemaForZoneWithName:]((id *)a1, v28);

      id v30 = *(void **)(a1 + 8);
      v31 = [v6 zoneID];
      id v32 = [v31 zoneName];
      uint64_t v33 = [v30 mapValue:v32 toVersion:a3];

      uint64_t v34 = -[FCCKPrivateDatabaseSchema schemaForZoneWithName:]((id *)a1, v33);
      uint64_t v35 = [FCCKRecordIDMapping alloc];
      uint64_t v36 = [v6 recordName];
      a1 = [(FCCKRecordIDMapping *)v35 initWithFromZoneSchema:v29 toZoneSchema:v34 fromRecordName:v36 toRecordName:v15];
    }
  }

  return (id)a1;
}

- (id)mappingFromRecordType:(void *)a3 inZoneID:(uint64_t)a4 toVersion:
{
  if (a1)
  {
    id v7 = a2;
    v8 = [a3 zoneName];
    __int16 v9 = -[FCCKPrivateDatabaseSchema mappingFromRecordType:inZoneName:toVersion:](a1, v7, v8, a4);
  }
  else
  {
    __int16 v9 = 0;
  }
  return v9;
}

uint64_t __59__FCCKPrivateDatabaseSchema_mappingFromRecordID_toVersion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 recordName];
  if (v3) {
    uint64_t v5 = [v3[4] containsObject:v4];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __59__FCCKPrivateDatabaseSchema_mappingFromRecordID_toVersion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a2 + 32) containsObject:*(void *)(a1 + 32)];
  }
  else {
    return 0;
  }
}

- (id)schemaForZoneWithName:(id *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if ([v3 isEqualToString:*MEMORY[0x1E4F19D88]]
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v6 = (void *)[[NSString alloc] initWithFormat:@"to get the schema for the default zone, use schemaForZoneContainingRecordID:"];
      int v7 = 136315906;
      v8 = "-[FCCKPrivateDatabaseSchema schemaForZoneWithName:]";
      __int16 v9 = 2080;
      id v10 = "FCCKPrivateDatabaseSchema.m";
      __int16 v11 = 1024;
      int v12 = 218;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v7, 0x26u);
    }
    a1 = [a1[4] objectForKeyedSubscript:v4];
  }

  return a1;
}

- (id)mappingFromRecordZoneID:(uint64_t)a3 toVersion:
{
  if (a1)
  {
    uint64_t v5 = [a2 zoneName];
    id v6 = -[FCCKPrivateDatabaseSchema mappingFromRecordZoneName:toVersion:](a1, v5, a3);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (FCCKRecordZoneIDMapping)mappingFromRecordZoneName:(uint64_t)a3 toVersion:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a2;
    id v6 = -[FCCKPrivateDatabaseSchema schemaForZoneWithName:]((id *)&v3->super.isa, v5);
    int v7 = [(FCCKZoneSchema *)v3->_fromZoneSchema mapValue:v5 toVersion:a3];

    v8 = -[FCCKPrivateDatabaseSchema schemaForZoneWithName:]((id *)&v3->super.isa, v7);
    id v3 = [[FCCKRecordZoneIDMapping alloc] initWithFromZoneSchema:v6 toZoneSchema:v8];
  }
  return v3;
}

- (FCCKRecordTypeMapping)mappingFromRecordType:(void *)a3 inZoneName:(uint64_t)a4 toVersion:
{
  id v7 = a3;
  if (a1)
  {
    Class isa = a1[2].super.isa;
    id v9 = a2;
    id v10 = [(objc_class *)isa objectForKeyedSubscript:v9];
    __int16 v11 = +[FCPair pairWithFirst:v7 second:v9];

    int v12 = [(FCCKZoneSchema *)a1->_toZoneSchema mapValue:v11 toVersion:a4];
    Class v13 = a1[2].super.isa;
    id v14 = [v12 second];
    uint64_t v15 = [(objc_class *)v13 objectForKeyedSubscript:v14];

    if ([v7 isEqualToString:*MEMORY[0x1E4F19D88]])
    {
      id v16 = [FCCKRecordZoneIDMapping alloc];
      id v17 = [(FCCKZoneSchema *)a1[1]._toZoneSchema firstObject];
      int v18 = [(FCCKZoneSchema *)a1[1]._toZoneSchema firstObject];
      v19 = [(FCCKRecordZoneIDMapping *)v16 initWithFromZoneSchema:v17 toZoneSchema:v18];
    }
    else
    {
      -[FCCKPrivateDatabaseSchema mappingFromRecordZoneName:toVersion:](a1, v7, a4);
      v19 = (FCCKRecordZoneIDMapping *)objc_claimAutoreleasedReturnValue();
    }
    id v20 = [FCCKRecordTypeMapping alloc];
    uint64_t v21 = [(FCCKRecordZoneIDMapping *)v19 fromZoneSchema];
    uint64_t v22 = [(FCCKRecordZoneIDMapping *)v19 toZoneSchema];
    id v23 = [(FCCKRecordTypeMapping *)v20 initWithFromZoneSchema:v21 toZoneSchema:v22 fromRecordSchema:v10 toRecordSchema:v15];
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

- (void)schemaForZoneContainingRecordID:(void *)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      Class v13 = (void *)[[NSString alloc] initWithFormat:@"can't resolve the default zone without a record ID"];
      *(_DWORD *)buf = 136315906;
      id v17 = "-[FCCKPrivateDatabaseSchema schemaForZoneContainingRecordID:]";
      __int16 v18 = 2080;
      v19 = "FCCKPrivateDatabaseSchema.m";
      __int16 v20 = 1024;
      int v21 = 231;
      __int16 v22 = 2114;
      id v23 = v13;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    id v5 = [v4 zoneID];
    id v6 = [v5 zoneName];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F19D88]];

    if (v7)
    {
      v8 = (void *)a1[5];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __61__FCCKPrivateDatabaseSchema_schemaForZoneContainingRecordID___block_invoke;
      v14[3] = &unk_1E5B594A0;
      id v15 = v4;
      a1 = objc_msgSend(v8, "fc_firstObjectPassingTest:", v14);
      id v9 = v15;
    }
    else
    {
      id v10 = (void *)a1[4];
      id v9 = [v4 zoneID];
      __int16 v11 = [v9 zoneName];
      a1 = [v10 objectForKeyedSubscript:v11];
    }
  }

  return a1;
}

uint64_t __61__FCCKPrivateDatabaseSchema_schemaForZoneContainingRecordID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 recordName];
  if (v3) {
    uint64_t v5 = [v3[4] containsObject:v4];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)enumerateZoneSchemasForVersion:(void *)a3 withBlock:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(void, void))v5;
  if (a1 && v5)
  {
    int v7 = [a1[1] allValuesForVersion:a2];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
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
          int v12 = [a1[4] objectForKeyedSubscript:*(void *)(*((void *)&v22 + 1) + 8 * v11)];
          if (v12) {
            ((void (**)(void, void *))v6)[2](v6, v12);
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v9);
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = a1[5];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          v6[2](v6, *(void *)(*((void *)&v18 + 1) + 8 * v17++));
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v15);
    }
  }
}

- (void)enumerateZoneSchemasWithBlock:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void (**)(void, void))v3;
  if (a1 && v3)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = [*(id *)(a1 + 32) allValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          v4[2](v4, *(void *)(*((void *)&v19 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v7);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          v4[2](v4, *(void *)(*((void *)&v15 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v12);
    }
  }
}

- (id)zoneNamesWithChangesFromVersion:(uint64_t)a3 toVersion:
{
  if (a1)
  {
    var38[0] = MEMORY[0x1E4F143A8];
    var38[1] = 3221225472;
    var38[2] = __71__FCCKPrivateDatabaseSchema_zoneNamesWithChangesFromVersion_toVersion___block_invoke;
    var38[3] = &unk_1E5B594C8;
    var38[4] = a1;
    var38[5] = a2;
    var38[6] = a3;
    a1 = objc_msgSend(MEMORY[0x1E4F1CAD0], "fc_set:", var38);
    uint64_t v3 = var38[8];
  }
  return a1;
}

void __71__FCCKPrivateDatabaseSchema_zoneNamesWithChangesFromVersion_toVersion___block_invoke(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1[4] + 16), "allValuesModifiedFromVersion:toVersion:", a1[5], a1[6], 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) first];
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)recordNamesInDefaultZoneChangedFromVersion:(uint64_t)a3 toVersion:
{
  if (a1)
  {
    var38[0] = MEMORY[0x1E4F143A8];
    var38[1] = 3221225472;
    var38[2] = __82__FCCKPrivateDatabaseSchema_recordNamesInDefaultZoneChangedFromVersion_toVersion___block_invoke;
    var38[3] = &unk_1E5B594C8;
    var38[4] = a1;
    var38[5] = a2;
    var38[6] = a3;
    a1 = objc_msgSend(MEMORY[0x1E4F1CAD0], "fc_set:", var38);
    uint64_t v3 = var38[8];
  }
  return a1;
}

void __82__FCCKPrivateDatabaseSchema_recordNamesInDefaultZoneChangedFromVersion_toVersion___block_invoke(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = objc_msgSend(*(id *)(a1[4] + 24), "allValuesModifiedFromVersion:toVersion:", a1[5], a1[6], 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = *MEMORY[0x1E4F19D88];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = [v10 first];
        int v12 = [v11 isEqualToString:v8];

        if (v12)
        {
          long long v13 = [v10 second];
          [v3 addObject:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordSchemasByType, 0);
  objc_storeStrong((id *)&self->_defaultZoneSchemas, 0);
  objc_storeStrong((id *)&self->_zoneSchemasByName, 0);
  objc_storeStrong((id *)&self->_recordNameVersionMapping, 0);
  objc_storeStrong((id *)&self->_recordTypeVersionMapping, 0);
  objc_storeStrong((id *)&self->_zoneNameVersionMapping, 0);
}

@end
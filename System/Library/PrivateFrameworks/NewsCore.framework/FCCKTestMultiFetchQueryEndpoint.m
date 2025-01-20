@interface FCCKTestMultiFetchQueryEndpoint
- (id)_collectRecordIDsFromRecords:(id)a3 linkKeysByRecordType:(id)a4;
- (id)_collectRecordsWithRecords:(id)a3 recordIDs:(id)a4 linkKeysByRecordType:(id)a5 visitedRecordIDs:(id)a6 missingRecordIDs:(id)a7;
- (void)handleQueryOperation:(id)a3 withRecords:(id)a4 droppedFeeds:(id)a5;
@end

@implementation FCCKTestMultiFetchQueryEndpoint

- (void)handleQueryOperation:(id)a3 withRecords:(id)a4 droppedFeeds:(id)a5
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v78 = a5;
  v10 = [v8 query];
  objc_opt_class();
  v77 = v10;
  v11 = [v10 predicate];
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  id v79 = v9;
  v76 = v13;
  if (v13 && [v13 compoundPredicateType] == 1) {
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v38 = (void *)[[NSString alloc] initWithFormat:@"unexpected feed query predicate type"];
    *(_DWORD *)buf = 136315906;
    v111 = "-[FCCKTestMultiFetchQueryEndpoint handleQueryOperation:withRecords:droppedFeeds:]";
    __int16 v112 = 2080;
    v113 = "FCCKTestContentDatabase.m";
    __int16 v114 = 1024;
    int v115 = 1237;
    __int16 v116 = 2114;
    v117 = v38;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v13) {
      goto LABEL_10;
    }
  }
  else if (v13)
  {
LABEL_10:
    v72 = self;
    id v74 = v8;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    v14 = [v13 subpredicates];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v102 objects:v109 count:16];
    if (!v15)
    {
      v81 = 0;
      obuint64_t j = 0;
      v17 = 0;
      goto LABEL_33;
    }
    uint64_t v16 = v15;
    v81 = 0;
    obuint64_t j = 0;
    v17 = 0;
    uint64_t v18 = *(void *)v103;
    while (1)
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v103 != v18) {
          objc_enumerationMutation(v14);
        }
        v20 = *(void **)(*((void *)&v102 + 1) + 8 * v19);
        objc_opt_class();
        if (!v20 || (objc_opt_isKindOfClass() & 1) == 0)
        {
          id v21 = 0;
          goto LABEL_22;
        }
        id v21 = v20;
        if ([v21 predicateOperatorType] != 99) {
          goto LABEL_22;
        }
        v22 = [v21 rightExpression];
        if ([v22 expressionType] == 3)
        {
          v23 = [v22 keyPath];
          int v24 = [v23 isEqualToString:@"recordIDs"];

          if (v24)
          {
            v25 = [v21 leftExpression];
            uint64_t v26 = [v25 constantValue];
            v27 = v17;
            v17 = (void *)v26;
LABEL_28:

            goto LABEL_29;
          }
          v28 = [v22 keyPath];
          int v29 = [v28 isEqualToString:@"recordTypes"];

          if (v29)
          {
            v25 = [v21 leftExpression];
            uint64_t v30 = [v25 constantValue];
            v27 = obj;
            obuint64_t j = (id)v30;
            goto LABEL_28;
          }
          v31 = [v22 keyPath];
          int v32 = [v31 isEqualToString:@"fetchFields"];

          if (v32)
          {
            v25 = [v21 leftExpression];
            uint64_t v33 = [v25 constantValue];
            v27 = v81;
            v81 = (void *)v33;
            goto LABEL_28;
          }
        }
LABEL_29:

LABEL_22:
        ++v19;
      }
      while (v16 != v19);
      uint64_t v34 = [v14 countByEnumeratingWithState:&v102 objects:v109 count:16];
      uint64_t v16 = v34;
      if (!v34)
      {
LABEL_33:

        self = v72;
        id v8 = v74;
        id v9 = v79;
        v35 = v17;
        v36 = v81;
        v37 = obj;
        goto LABEL_36;
      }
    }
  }
  v36 = 0;
  v37 = 0;
  v35 = 0;
LABEL_36:
  v39 = (void *)MEMORY[0x1E4F1C9E8];
  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __81__FCCKTestMultiFetchQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke;
  v99[3] = &unk_1E5B4CDC0;
  id v40 = v37;
  id v100 = v40;
  id v83 = v36;
  id v101 = v83;
  uint64_t v41 = objc_msgSend(v39, "fc_dictionary:", v99);
  uint64_t v42 = [MEMORY[0x1E4F1CA80] set];
  v43 = [MEMORY[0x1E4F1CA80] set];
  v80 = (void *)v42;
  v82 = (void *)v41;
  v44 = [(FCCKTestMultiFetchQueryEndpoint *)self _collectRecordsWithRecords:v9 recordIDs:v35 linkKeysByRecordType:v41 visitedRecordIDs:v43 missingRecordIDs:v42];

  v45 = [v8 desiredKeys];

  if (v45)
  {
    id v73 = v40;
    v75 = v35;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    v71 = v44;
    id obja = v44;
    uint64_t v46 = [obja countByEnumeratingWithState:&v95 objects:v108 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v86 = *(void *)v96;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v96 != v86) {
            objc_enumerationMutation(obja);
          }
          v49 = *(void **)(*((void *)&v95 + 1) + 8 * i);
          v50 = (void *)MEMORY[0x1E4F1CAD0];
          id v51 = v8;
          v52 = objc_msgSend(v8, "desiredKeys", v71);
          v53 = [v50 setWithArray:v52];

          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          v54 = [v49 changedKeys];
          uint64_t v55 = [v54 countByEnumeratingWithState:&v91 objects:v107 count:16];
          if (v55)
          {
            uint64_t v56 = v55;
            uint64_t v57 = *(void *)v92;
            do
            {
              for (uint64_t j = 0; j != v56; ++j)
              {
                if (*(void *)v92 != v57) {
                  objc_enumerationMutation(v54);
                }
                uint64_t v59 = *(void *)(*((void *)&v91 + 1) + 8 * j);
                if (([v53 containsObject:v59] & 1) == 0) {
                  [v49 setObject:0 forKeyedSubscript:v59];
                }
              }
              uint64_t v56 = [v54 countByEnumeratingWithState:&v91 objects:v107 count:16];
            }
            while (v56);
          }

          id v8 = v51;
        }
        uint64_t v47 = [obja countByEnumeratingWithState:&v95 objects:v108 count:16];
      }
      while (v47);
    }

    id v9 = v79;
    id v40 = v73;
    v35 = v75;
    v44 = v71;
  }
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v60 = v44;
  uint64_t v61 = [v60 countByEnumeratingWithState:&v87 objects:v106 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v88;
    do
    {
      for (uint64_t k = 0; k != v62; ++k)
      {
        if (*(void *)v88 != v63) {
          objc_enumerationMutation(v60);
        }
        uint64_t v65 = *(void *)(*((void *)&v87 + 1) + 8 * k);
        objc_msgSend(v8, "recordFetchedBlock", v71);
        v66 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        v66[2](v66, v65);
      }
      uint64_t v62 = [v60 countByEnumeratingWithState:&v87 objects:v106 count:16];
    }
    while (v62);
  }

  v67 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"Results"];
  v68 = [v80 allObjects];
  [v67 setObject:v68 forKeyedSubscript:@"notFound"];

  v69 = [v8 recordFetchedBlock];
  ((void (**)(void, void *))v69)[2](v69, v67);

  v70 = [v8 queryCompletionBlock];
  v70[2](v70, 0, 0);
}

void __81__FCCKTestMultiFetchQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__FCCKTestMultiFetchQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_2;
  v7[3] = &unk_1E5B57F38;
  id v8 = v3;
  id v6 = v3;
  objc_msgSend(v5, "fc_enumerateSideBySideWithArray:reverse:block:", v4, 0, v7);
}

void __81__FCCKTestMultiFetchQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v5 length])
  {
    id v6 = [v5 componentsSeparatedByString:@","];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
}

- (id)_collectRecordsWithRecords:(id)a3 recordIDs:(id)a4 linkKeysByRecordType:(id)a5 visitedRecordIDs:(id)a6 missingRecordIDs:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v12 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "records");
    *(_DWORD *)buf = 136315906;
    uint64_t v30 = "-[FCCKTestMultiFetchQueryEndpoint _collectRecordsWithRecords:recordIDs:linkKeysByRecordType:visitedRecordIDs:m"
          "issingRecordIDs:]";
    __int16 v31 = 2080;
    int v32 = "FCCKTestContentDatabase.m";
    __int16 v33 = 1024;
    int v34 = 1324;
    __int16 v35 = 2114;
    v36 = v26;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v13) {
      goto LABEL_6;
    }
  }
  else if (v13)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "recordIDs");
    *(_DWORD *)buf = 136315906;
    uint64_t v30 = "-[FCCKTestMultiFetchQueryEndpoint _collectRecordsWithRecords:recordIDs:linkKeysByRecordType:visitedRecordIDs:m"
          "issingRecordIDs:]";
    __int16 v31 = 2080;
    int v32 = "FCCKTestContentDatabase.m";
    __int16 v33 = 1024;
    int v34 = 1325;
    __int16 v35 = 2114;
    v36 = v27;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "linkKeysByRecordType");
    *(_DWORD *)buf = 136315906;
    uint64_t v30 = "-[FCCKTestMultiFetchQueryEndpoint _collectRecordsWithRecords:recordIDs:linkKeysByRecordType:visitedRecordIDs:m"
          "issingRecordIDs:]";
    __int16 v31 = 2080;
    int v32 = "FCCKTestContentDatabase.m";
    __int16 v33 = 1024;
    int v34 = 1326;
    __int16 v35 = 2114;
    v36 = v28;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  [v16 addObjectsFromArray:v13];
  v17 = FCLookupRecordByNames(v12, v13);
  uint64_t v18 = objc_msgSend(v17, "fc_arrayByTransformingWithBlock:", &__block_literal_global_124);
  objc_msgSend(v16, "fc_removeObjectsFromArray:", v18);

  uint64_t v19 = [(FCCKTestMultiFetchQueryEndpoint *)self _collectRecordIDsFromRecords:v17 linkKeysByRecordType:v14];
  v20 = [v15 allObjects];
  id v21 = objc_msgSend(v19, "fc_arrayByRemovingObjectsInArray:", v20);

  if ([v21 count])
  {
    [v15 addObjectsFromArray:v21];
    v22 = [(FCCKTestMultiFetchQueryEndpoint *)self _collectRecordsWithRecords:v12 recordIDs:v21 linkKeysByRecordType:v14 visitedRecordIDs:v15 missingRecordIDs:v16];
    id v23 = [v17 arrayByAddingObjectsFromArray:v22];
  }
  else
  {
    id v23 = v17;
  }
  id v24 = v23;

  return v24;
}

id __127__FCCKTestMultiFetchQueryEndpoint__collectRecordsWithRecords_recordIDs_linkKeysByRecordType_visitedRecordIDs_missingRecordIDs___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 recordID];
  id v3 = [v2 recordName];

  return v3;
}

- (id)_collectRecordIDsFromRecords:(id)a3 linkKeysByRecordType:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "records");
    *(_DWORD *)buf = 136315906;
    uint64_t v18 = "-[FCCKTestMultiFetchQueryEndpoint _collectRecordIDsFromRecords:linkKeysByRecordType:]";
    __int16 v19 = 2080;
    v20 = "FCCKTestContentDatabase.m";
    __int16 v21 = 1024;
    int v22 = 1358;
    __int16 v23 = 2114;
    id v24 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6) {
      goto LABEL_6;
    }
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "linkKeysByRecordType");
    *(_DWORD *)buf = 136315906;
    uint64_t v18 = "-[FCCKTestMultiFetchQueryEndpoint _collectRecordIDsFromRecords:linkKeysByRecordType:]";
    __int16 v19 = 2080;
    v20 = "FCCKTestContentDatabase.m";
    __int16 v21 = 1024;
    int v22 = 1359;
    __int16 v23 = 2114;
    id v24 = v13;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  id v7 = (void *)MEMORY[0x1E4F1C978];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__FCCKTestMultiFetchQueryEndpoint__collectRecordIDsFromRecords_linkKeysByRecordType___block_invoke;
  v14[3] = &unk_1E5B501A0;
  id v15 = v5;
  id v16 = v6;
  id v8 = v6;
  id v9 = v5;
  v10 = objc_msgSend(v7, "fc_array:", v14);

  return v10;
}

void __85__FCCKTestMultiFetchQueryEndpoint__collectRecordIDsFromRecords_linkKeysByRecordType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v26 = a2;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v23 = a1;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v24 = [obj countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v24)
  {
    unint64_t v3 = 0x1E4F29000uLL;
    unint64_t v4 = 0x1E4F1A000uLL;
    uint64_t v22 = *(void *)v32;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v5;
        id v6 = *(void **)(*((void *)&v31 + 1) + 8 * v5);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v7 = *(void **)(v23 + 40);
        id v8 = [v6 recordType];
        id v9 = [v7 objectForKeyedSubscript:v8];

        uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v43 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v28 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = [v6 valueForKey:*(void *)(*((void *)&v27 + 1) + 8 * i)];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v26 addObject:v14];
                goto LABEL_24;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v14 recordID];
                unint64_t v15 = v3;
                v17 = unint64_t v16 = v4;
                uint64_t v18 = [v17 recordName];
                [v26 addObject:v18];

                unint64_t v4 = v16;
                unint64_t v3 = v15;
                goto LABEL_24;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (objc_msgSend(v14, "fc_containsObjectPassingTest:", &__block_literal_global_244))
                {
                  if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                    goto LABEL_24;
                  }
                  __int16 v19 = (void *)[objc_alloc(*(Class *)(v3 + 24)) initWithFormat:@"not yet supported"];
                  *(_DWORD *)buf = 136315906;
                  v36 = "-[FCCKTestMultiFetchQueryEndpoint _collectRecordIDsFromRecords:linkKeysByRecordType:]_block_invoke";
                  __int16 v37 = 2080;
                  v38 = "FCCKTestContentDatabase.m";
                  __int16 v39 = 1024;
                  int v40 = 1388;
                  __int16 v41 = 2114;
                  uint64_t v42 = v19;
                  v20 = MEMORY[0x1E4F14500];
                  goto LABEL_22;
                }
                [v26 addObjectsFromArray:v14];
              }
              else if (v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                __int16 v19 = (void *)[objc_alloc(*(Class *)(v3 + 24)) initWithFormat:@"not yet supported"];
                *(_DWORD *)buf = 136315906;
                v36 = "-[FCCKTestMultiFetchQueryEndpoint _collectRecordIDsFromRecords:linkKeysByRecordType:]_block_invoke";
                __int16 v37 = 2080;
                v38 = "FCCKTestContentDatabase.m";
                __int16 v39 = 1024;
                int v40 = 1393;
                __int16 v41 = 2114;
                uint64_t v42 = v19;
                v20 = MEMORY[0x1E4F14500];
LABEL_22:
                _os_log_error_impl(&dword_1A460D000, v20, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
              }
LABEL_24:
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v43 count:16];
          }
          while (v11);
        }

        uint64_t v5 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v24);
  }
}

BOOL __85__FCCKTestMultiFetchQueryEndpoint__collectRecordIDsFromRecords_linkKeysByRecordType___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

@end
@interface REMChangeSet
+ (BOOL)supportsSecureCoding;
+ (id)errorChangeSetWithError:(id)a3;
- (BOOL)_filterAndFlattenAndConsolidateChanges;
- (BOOL)applyFilterByTransactionAuthors:(id)a3 isExclusion:(BOOL)a4;
- (BOOL)consolidateAndFilterChangesWithTransactionAuthors:(id)a3 isExclusion:(BOOL)a4;
- (BOOL)enumerateChanges:(int64_t)a3 forModelsOfClass:(Class)a4 withBlock:(id)a5;
- (BOOL)filterByTransactionAuthorsIsExclusion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTruncated;
- (NSArray)deletes;
- (NSArray)filterByTransactionAuthorStrings;
- (NSArray)filteredTransactions;
- (NSArray)inserts;
- (NSArray)transactions;
- (NSArray)updates;
- (NSError)error;
- (REMChangeSet)initWithChangeTransactions:(id)a3;
- (REMChangeSet)initWithCoder:(id)a3;
- (REMChangeSet)initWithError:(id)a3;
- (id)description;
- (id)lastChangeTokenForAccountID:(id)a3;
- (void)_filterAndFlattenAndConsolidateChanges;
- (void)encodeWithCoder:(id)a3;
- (void)setDeletes:(id)a3;
- (void)setError:(id)a3;
- (void)setFilterByTransactionAuthorStrings:(id)a3;
- (void)setFilterByTransactionAuthorsIsExclusion:(BOOL)a3;
- (void)setFilteredTransactions:(id)a3;
- (void)setInserts:(id)a3;
- (void)setIsTruncated:(BOOL)a3;
- (void)setUpdates:(id)a3;
@end

@implementation REMChangeSet

+ (id)errorChangeSetWithError:(id)a3
{
  id v3 = a3;
  v4 = [[REMChangeSet alloc] initWithError:v3];

  return v4;
}

- (REMChangeSet)initWithError:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REMChangeSet;
  v6 = [(REMChangeSet *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    transactions = v7->_transactions;
    v7->_transactions = (NSArray *)MEMORY[0x1E4F1CBF0];

    v7->_isTruncated = [v5 code] == 4;
  }

  return v7;
}

- (REMChangeSet)initWithChangeTransactions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMChangeSet;
  v6 = [(REMChangeSet *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transactions, a3);
  }

  return v7;
}

- (id)description
{
  v12 = NSString;
  NSUInteger v11 = [(NSArray *)self->_transactions count];
  v13 = [(NSArray *)self->_transactions firstObject];
  id v3 = [v13 changes];
  v4 = [v3 firstObject];
  uint64_t v10 = [v4 changeID];
  id v5 = [(NSArray *)self->_transactions lastObject];
  v6 = [v5 changes];
  v7 = [v6 lastObject];
  objc_msgSend(v12, "stringWithFormat:", @"REMChangeSet<%p>: {raw-txn-count=%lu, chg-ids-from=%lld, chg-ids-to=%lld}; {filtered-txn-count=%lu, cnsld-inserts=%lu, cnsld-updates=%lu, #cnsld-deletes=%lu}; {error=%@}",
    self,
    v11,
    v10,
    [v7 changeID],
    [(NSArray *)self->_filteredTransactions count],
    [(NSArray *)self->_inserts count],
    [(NSArray *)self->_updates count],
    [(NSArray *)self->_deletes count],
  v8 = self->_error);

  return v8;
}

- (BOOL)consolidateAndFilterChangesWithTransactionAuthors:(id)a3 isExclusion:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![(REMChangeSet *)self isTruncated])
  {
    v7 = [(REMChangeSet *)self error];

    if (!v7)
    {
      uint64_t v10 = [(REMChangeSet *)self filteredTransactions];
      if (v10)
      {
        NSUInteger v11 = (void *)v10;
        uint64_t v12 = [(REMChangeSet *)self filterByTransactionAuthorStrings];
        if ((id)v12 == v6)
        {
          BOOL v16 = [(REMChangeSet *)self filterByTransactionAuthorsIsExclusion];

          if (v16 == v4) {
            goto LABEL_16;
          }
        }
        else
        {
          v13 = (void *)v12;
          v14 = [(REMChangeSet *)self filterByTransactionAuthorStrings];
          if ([v14 isEqual:v6])
          {
            BOOL v15 = [(REMChangeSet *)self filterByTransactionAuthorsIsExclusion];

            if (v15 == v4) {
              goto LABEL_16;
            }
          }
          else
          {
          }
        }
      }
      [(REMChangeSet *)self setFilterByTransactionAuthorStrings:v6];
      [(REMChangeSet *)self setFilterByTransactionAuthorsIsExclusion:v4];
      v17 = +[REMLog changeTracking];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        int v20 = 134218498;
        v21 = self;
        __int16 v22 = 1024;
        BOOL v23 = v4;
        __int16 v24 = 2114;
        id v25 = v6;
        _os_log_debug_impl(&dword_1B9AA2000, v17, OS_LOG_TYPE_DEBUG, "REMChangeSet applyFilterByTransactionAuthors: {self=%p, exclude=%d, authors=%{public}@}", (uint8_t *)&v20, 0x1Cu);
      }

      if (![(REMChangeSet *)self _filterAndFlattenAndConsolidateChanges])
      {
        if (!self->_error)
        {
          v18 = [MEMORY[0x1E4F28C58] errorWithREMChangeErrorCode:5];
          error = self->_error;
          self->_error = v18;
        }
        goto LABEL_3;
      }
LABEL_16:
      BOOL v8 = 1;
      goto LABEL_4;
    }
  }
LABEL_3:
  BOOL v8 = 0;
LABEL_4:

  return v8;
}

- (BOOL)applyFilterByTransactionAuthors:(id)a3 isExclusion:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    if (v6) {
      [MEMORY[0x1E4F1CA80] setWithArray:v6];
    }
    else {
    v7 = [MEMORY[0x1E4F1CA80] set];
    }
    BOOL v8 = [(REMChangeSet *)self filterByTransactionAuthorStrings];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      uint64_t v10 = [(REMChangeSet *)self filterByTransactionAuthorStrings];
      [v7 addObjectsFromArray:v10];
    }
    uint64_t v11 = [v7 allObjects];

    id v6 = (id)v11;
  }
  BOOL v12 = [(REMChangeSet *)self consolidateAndFilterChangesWithTransactionAuthors:v6 isExclusion:v4];

  return v12;
}

- (BOOL)_filterAndFlattenAndConsolidateChanges
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F1C000uLL;
  BOOL v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v91 = [MEMORY[0x1E4F1CA80] set];
  v90 = [MEMORY[0x1E4F1CA80] set];
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v89 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  v7 = [(REMChangeSet *)self transactions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v112 objects:v127 count:16];
  v92 = v4;
  v95 = v5;
  v87 = self;
  v88 = v6;
  if (!v8)
  {

    [(REMChangeSet *)self setFilteredTransactions:v6];
    goto LABEL_55;
  }
  uint64_t v10 = v8;
  int v11 = 0;
  uint64_t v12 = *(void *)v113;
  *(void *)&long long v9 = 138412290;
  long long v82 = v9;
  uint64_t v85 = *(void *)v113;
  v86 = v7;
  do
  {
    uint64_t v13 = 0;
    id obj = (id)v10;
    do
    {
      if (*(void *)v113 != v12) {
        objc_enumerationMutation(v7);
      }
      v14 = *(void **)(*((void *)&v112 + 1) + 8 * v13);
      context = (void *)MEMORY[0x1BA9DB950]();
      v98 = v14;
      BOOL v15 = [v14 accountID];

      if (!v15)
      {
        v36 = [MEMORY[0x1E4F28C58] errorWithREMChangeErrorCode:6];
        [(REMChangeSet *)self setError:v36];

        v37 = +[REMLog changeTracking];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
          -[REMChangeSet _filterAndFlattenAndConsolidateChanges]();
        }

        [(REMChangeSet *)self setFilteredTransactions:v6];
        BOOL v4 = v92;
        goto LABEL_51;
      }
      BOOL v16 = [(REMChangeSet *)self filterByTransactionAuthorStrings];

      if (v16)
      {
        id v17 = [v98 author];
        if ([(REMChangeSet *)self filterByTransactionAuthorsIsExclusion])
        {
          if (v17)
          {
            v18 = [(REMChangeSet *)self filterByTransactionAuthorStrings];
            char v19 = [v18 containsObject:v17];

            if (v19) {
              goto LABEL_44;
            }
          }
        }
        else
        {
          if (!v17) {
            goto LABEL_44;
          }
          int v20 = [(REMChangeSet *)self filterByTransactionAuthorStrings];
          int v21 = [v20 containsObject:v17];

          if (!v21) {
            goto LABEL_44;
          }
        }
      }
      objc_msgSend(v6, "addObject:", v98, v82);
      __int16 v22 = [v98 changes];
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id v17 = v22;
      uint64_t v23 = [v17 countByEnumeratingWithState:&v108 objects:v126 count:16];
      if (!v23)
      {
        self = v87;
        id v6 = v88;
        goto LABEL_43;
      }
      uint64_t v24 = v23;
      int v84 = v11;
      uint64_t v25 = *(void *)v109;
      while (2)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v109 != v25) {
            objc_enumerationMutation(v17);
          }
          v27 = *(REMChangeSet **)(*((void *)&v108 + 1) + 8 * i);
          v28 = [(REMChangeSet *)v27 transaction];

          if (!v28)
          {
            v35 = os_log_create("com.apple.reminderkit", "default");
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v82;
              v123 = v27;
              _os_log_debug_impl(&dword_1B9AA2000, v35, OS_LOG_TYPE_DEBUG, "Trying to populate flattened changes with a change that lost back pointer to its transaction %@.", buf, 0xCu);
            }

            int v11 = 1;
            self = v87;
            id v6 = v88;
            uint64_t v12 = v85;
            v7 = v86;
            uint64_t v10 = (uint64_t)obj;
            goto LABEL_43;
          }
          v29 = [(REMChangeSet *)v27 changedObjectID];

          if (v29)
          {
            v30 = [(REMChangeSet *)v27 changedObjectID];
            if ([(REMChangeSet *)v27 changeType] == 1)
            {
              v31 = [v92 objectForKeyedSubscript:v30];
              v32 = v31;
              if (v31)
              {
                [v31 addObject:v27];
              }
              else
              {
                v34 = [MEMORY[0x1E4F1CA48] arrayWithObject:v27];
                [v92 setObject:v34 forKey:v30];
              }
LABEL_35:

              goto LABEL_36;
            }
            if ([(REMChangeSet *)v27 changeType])
            {
              if ([(REMChangeSet *)v27 changeType] != 2)
              {
                v32 = +[REMLog changeTracking];
                if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
                  [(REMChangeSet *)v120 _filterAndFlattenAndConsolidateChanges];
                }
                goto LABEL_35;
              }
              [v90 addObject:v30];
              v33 = v89;
            }
            else
            {
              [v91 addObject:v30];
              v33 = v95;
            }
            [v33 setObject:v27 forKey:v30];
            goto LABEL_36;
          }
          v30 = +[REMLog changeTracking];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v123 = v27;
            __int16 v124 = 2112;
            v125 = v98;
            _os_log_error_impl(&dword_1B9AA2000, v30, OS_LOG_TYPE_ERROR, "chg.changedObjectID is nil! {chg: %@, txn: %@}", buf, 0x16u);
          }
LABEL_36:
        }
        uint64_t v24 = [v17 countByEnumeratingWithState:&v108 objects:v126 count:16];
        if (v24) {
          continue;
        }
        break;
      }
      self = v87;
      id v6 = v88;
      uint64_t v12 = v85;
      v7 = v86;
      uint64_t v10 = (uint64_t)obj;
      int v11 = v84;
LABEL_43:

LABEL_44:
      ++v13;
      id v5 = v95;
    }
    while (v13 != v10);
    uint64_t v10 = [v7 countByEnumeratingWithState:&v112 objects:v127 count:16];
  }
  while (v10);

  [(REMChangeSet *)self setFilteredTransactions:v6];
  BOOL v4 = v92;
  unint64_t v3 = 0x1E4F1C000;
  if ((v11 & 1) == 0)
  {
LABEL_55:
    v40 = objc_msgSend(*(id *)(v3 + 2656), "dictionary", v82);
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    v41 = [v4 allValues];
    uint64_t v42 = [v41 countByEnumeratingWithState:&v104 objects:v119 count:16];
    v99 = v40;
    if (!v42) {
      goto LABEL_74;
    }
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v105;
    while (1)
    {
      uint64_t v45 = 0;
      do
      {
        if (*(void *)v105 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = *(void **)(*((void *)&v104 + 1) + 8 * v45);
        v47 = (void *)MEMORY[0x1BA9DB950]();
        if ((unint64_t)[v46 count] < 2)
        {
          v49 = [v46 objectAtIndexedSubscript:0];
          v50 = [(REMChangeSet *)v49 changedObjectID];
          if (v50) {
            goto LABEL_64;
          }
          v52 = +[REMLog changeTracking];
          if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v123 = v49;
            v53 = v52;
            v54 = "rem_log_fault_if (!changedObjectID) -- Nil update change objectID {ups[0]: %@}";
            goto LABEL_72;
          }
        }
        else
        {
          [v46 sortUsingComparator:&__block_literal_global_14];
          v48 = [v46 objectAtIndexedSubscript:0];
          v49 = (REMChangeSet *)[v48 copyForCoalescing];

          v50 = [(REMChangeSet *)v49 changedObjectID];
          if (v50)
          {
            v51 = objc_msgSend(v46, "subarrayWithRange:", 1, objc_msgSend(v46, "count") - 1);
            [(REMChangeSet *)v49 setCoalescedChanges:v51];

            [(REMChangeSet *)v49 setIsCoalesced:1];
            v40 = v99;
LABEL_64:
            [v40 setObject:v49 forKey:v50];
            goto LABEL_65;
          }
          v52 = +[REMLog changeTracking];
          v40 = v99;
          if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v123 = v49;
            v53 = v52;
            v54 = "rem_log_fault_if (!changedObjectID) -- Nil coalesced.changeObjectID {coalesced: %@}";
LABEL_72:
            _os_log_fault_impl(&dword_1B9AA2000, v53, OS_LOG_TYPE_FAULT, v54, buf, 0xCu);
          }
        }

LABEL_65:
        ++v45;
      }
      while (v43 != v45);
      uint64_t v55 = [v41 countByEnumeratingWithState:&v104 objects:v119 count:16];
      uint64_t v43 = v55;
      if (!v55)
      {
LABEL_74:

        long long v102 = 0u;
        long long v103 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        id obja = v91;
        uint64_t v56 = [obja countByEnumeratingWithState:&v100 objects:v118 count:16];
        v57 = v95;
        if (v56)
        {
          uint64_t v58 = v56;
          uint64_t contexta = *(void *)v101;
          do
          {
            uint64_t v59 = 0;
            do
            {
              if (*(void *)v101 != contexta) {
                objc_enumerationMutation(obja);
              }
              v60 = *(REMChangeSet **)(*((void *)&v100 + 1) + 8 * v59);
              v61 = (void *)MEMORY[0x1BA9DB950]();
              v62 = [v40 objectForKeyedSubscript:v60];
              if (v62)
              {
                v63 = [v57 objectForKeyedSubscript:v60];
                if (!v63)
                {
                  v68 = +[REMLog changeTracking];
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v123 = v60;
                    _os_log_fault_impl(&dword_1B9AA2000, v68, OS_LOG_TYPE_FAULT, "rem_log_fault_if (!ins) -- Nil change for insertedID {insertedID: %{public}@}", buf, 0xCu);
                  }
                }
                v64 = (void *)[v63 copyForCoalescing];
                [v64 setIsCoalesced:1];
                v65 = [v62 coalescedChanges];
                if (v65)
                {
                  v117 = v62;
                  v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v117 count:1];
                  v67 = [v66 arrayByAddingObjectsFromArray:v65];
                  [v64 setCoalescedChanges:v67];

                  v57 = v95;
                }
                else
                {
                  v116 = v62;
                  v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
                  [v64 setCoalescedChanges:v66];
                }

                [v57 setObject:v64 forKey:v60];
                v40 = v99;
                [v99 removeObjectForKey:v60];
              }
              ++v59;
            }
            while (v58 != v59);
            uint64_t v69 = [obja countByEnumeratingWithState:&v100 objects:v118 count:16];
            uint64_t v58 = v69;
          }
          while (v69);
        }

        v70 = [v90 allObjects];
        [v40 removeObjectsForKeys:v70];

        v71 = [v40 allValues];
        [v71 sortedArrayUsingComparator:&__block_literal_global_14];
        v73 = v72 = v57;
        [(REMChangeSet *)v87 setUpdates:v73];

        v74 = [v90 allObjects];
        [v72 removeObjectsForKeys:v74];

        v75 = [obja allObjects];
        [v89 removeObjectsForKeys:v75];

        v76 = [v72 allValues];
        v77 = [v76 sortedArrayUsingComparator:&__block_literal_global_14];
        [(REMChangeSet *)v87 setInserts:v77];

        v78 = [v89 allValues];
        v79 = [v78 sortedArrayUsingComparator:&__block_literal_global_14];
        [(REMChangeSet *)v87 setDeletes:v79];

        v80 = +[REMLog changeTracking];
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v123 = v87;
          _os_log_impl(&dword_1B9AA2000, v80, OS_LOG_TYPE_INFO, "REMChangeSet _filterAndFlattenAndConsolidateChanges was successful. ChangeSet: %@", buf, 0xCu);
        }

        BOOL v39 = 1;
        BOOL v4 = v92;
        id v5 = v95;
        id v6 = v88;
        goto LABEL_94;
      }
    }
  }
LABEL_51:
  v38 = +[REMLog changeTracking];
  v99 = v38;
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = v83;
    v123 = self;
    _os_log_impl(&dword_1B9AA2000, v38, OS_LOG_TYPE_INFO, "REMChangeSet _filterAndFlattenAndConsolidateChanges failed. ChangeSet: %@", buf, 0xCu);
  }
  BOOL v39 = 0;
LABEL_94:

  return v39;
}

uint64_t __54__REMChangeSet__filterAndFlattenAndConsolidateChanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 transaction];
  v7 = [v6 timestamp];

  uint64_t v8 = [v5 transaction];
  long long v9 = [v8 timestamp];

  uint64_t v10 = [v7 compare:v9];
  if (!v10)
  {
    uint64_t v11 = [v4 changeID];
    uint64_t v12 = [v5 changeID];
    if (v11 < v12) {
      uint64_t v10 = -1;
    }
    else {
      uint64_t v10 = v11 > v12;
    }
  }

  return v10;
}

- (BOOL)enumerateChanges:(int64_t)a3 forModelsOfClass:(Class)a4 withBlock:(id)a5
{
  char v6 = a3;
  id v8 = a5;
  if (v8)
  {
    if (![(REMChangeSet *)self isTruncated])
    {
      long long v9 = [(REMChangeSet *)self error];

      if (!v9)
      {
        if (!a4)
        {
          v14 = &__block_literal_global_17;
LABEL_11:
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __60__REMChangeSet_enumerateChanges_forModelsOfClass_withBlock___block_invoke_2;
          v20[3] = &unk_1E61DD180;
          id v21 = v14;
          id v22 = v8;
          BOOL v15 = v14;
          BOOL v16 = (void (**)(void, void, void))MEMORY[0x1BA9DBBC0](v20);
          if (v6)
          {
            v18 = [(REMChangeSet *)self inserts];
            ((void (**)(void, void *, void))v16)[2](v16, v18, 0);

            if ((v6 & 2) == 0)
            {
LABEL_13:
              if ((v6 & 4) == 0)
              {
LABEL_15:

                BOOL v10 = 1;
LABEL_22:

                goto LABEL_5;
              }
LABEL_14:
              id v17 = [(REMChangeSet *)self deletes];
              ((void (**)(void, void *, uint64_t))v16)[2](v16, v17, 2);

              goto LABEL_15;
            }
          }
          else if ((v6 & 2) == 0)
          {
            goto LABEL_13;
          }
          char v19 = [(REMChangeSet *)self updates];
          ((void (**)(void, void *, uint64_t))v16)[2](v16, v19, 1);

          if ((v6 & 4) == 0) {
            goto LABEL_15;
          }
          goto LABEL_14;
        }
        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = [(objc_class *)a4 performSelector:sel_cdEntityName];
          if (v12)
          {
LABEL_9:
            v23[0] = MEMORY[0x1E4F143A8];
            v23[1] = 3221225472;
            v23[2] = __60__REMChangeSet_enumerateChanges_forModelsOfClass_withBlock___block_invoke;
            v23[3] = &unk_1E61DD138;
            id v24 = v12;
            id v13 = v12;
            v14 = (void *)MEMORY[0x1BA9DBBC0](v23);

            goto LABEL_11;
          }
        }
        else if (objc_opt_respondsToSelector())
        {
          if (((unsigned int (*)(Class, char *))[(objc_class *)a4 methodForSelector:sel_conformsToREMChangeTrackingIdentifiable])(a4, sel_conformsToREMChangeTrackingIdentifiable))
          {
            uint64_t v12 = NSStringFromClass(a4);
            if (v12) {
              goto LABEL_9;
            }
          }
        }
        BOOL v15 = +[REMLog changeTracking];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          -[REMChangeSet enumerateChanges:forModelsOfClass:withBlock:]();
        }
        BOOL v10 = 0;
        goto LABEL_22;
      }
    }
  }
  BOOL v10 = 0;
LABEL_5:

  return v10;
}

uint64_t __60__REMChangeSet_enumerateChanges_forModelsOfClass_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 changedObjectID];
  id v5 = [v4 entityName];

  if (v5)
  {
    uint64_t v6 = [v5 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    v7 = +[REMLog changeTracking];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__REMChangeSet_enumerateChanges_forModelsOfClass_withBlock___block_invoke_cold_1();
    }

    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __60__REMChangeSet_enumerateChanges_forModelsOfClass_withBlock___block_invoke_15()
{
  return 1;
}

void __60__REMChangeSet_enumerateChanges_forModelsOfClass_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (void *)MEMORY[0x1BA9DB950](v4);
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32))) {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v5 = v4;
    }
    while (v4);
  }
}

- (id)lastChangeTokenForAccountID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(REMChangeSet *)self isTruncated]
    || ([(REMChangeSet *)self error], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    uint64_t v6 = +[REMLog changeTracking];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(REMChangeSet *)(uint64_t)v4 lastChangeTokenForAccountID:v6];
    }
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v9 = [(REMChangeSet *)self transactions];
    uint64_t v6 = [v9 reverseObjectEnumerator];

    uint64_t v10 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v6);
          }
          uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          BOOL v15 = [v14 accountID];
          if ([v4 isEqual:v15])
          {
            uint64_t v7 = [v14 token];

            goto LABEL_6;
          }
        }
        uint64_t v11 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    uint64_t v6 = +[REMLog changeTracking];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = [(REMChangeSet *)self transactions];
      *(_DWORD *)buf = 138543618;
      id v22 = v4;
      __int16 v23 = 2112;
      id v24 = v16;
      _os_log_impl(&dword_1B9AA2000, v6, OS_LOG_TYPE_DEFAULT, "REMChangeset does not contain token for accountID (this is not an error). Returning nil {accountID: %{public}@, transactions: %@}", buf, 0x16u);
    }
  }
  uint64_t v7 = 0;
LABEL_6:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(REMChangeSet *)self error];
  [v4 encodeObject:v5 forKey:@"error"];

  id v6 = [(REMChangeSet *)self transactions];
  [v4 encodeObject:v6 forKey:@"transactions"];
}

- (REMChangeSet)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  long long v9 = [v4 decodeObjectOfClasses:v8 forKey:@"transactions"];

  if (v5)
  {
    if ([v9 count])
    {
      uint64_t v14 = +[REMLog changeTracking];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[REMChangeSet initWithCoder:]();
      }
    }
    uint64_t v10 = [(REMChangeSet *)self initWithError:v5];
  }
  else
  {
    uint64_t v11 = +[REMLog changeTracking];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      BOOL v16 = self;
      _os_log_impl(&dword_1B9AA2000, v11, OS_LOG_TYPE_INFO, "REMChangeSet initWithCoder: {self=%p}", buf, 0xCu);
    }

    uint64_t v10 = [(REMChangeSet *)self initWithChangeTransactions:v9];
  }
  uint64_t v12 = v10;

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)transactions
{
  return self->_transactions;
}

- (NSArray)inserts
{
  return self->_inserts;
}

- (void)setInserts:(id)a3
{
}

- (NSArray)updates
{
  return self->_updates;
}

- (void)setUpdates:(id)a3
{
}

- (NSArray)deletes
{
  return self->_deletes;
}

- (void)setDeletes:(id)a3
{
}

- (BOOL)isTruncated
{
  return self->_isTruncated;
}

- (void)setIsTruncated:(BOOL)a3
{
  self->_isTruncated = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSArray)filterByTransactionAuthorStrings
{
  return self->_filterByTransactionAuthorStrings;
}

- (void)setFilterByTransactionAuthorStrings:(id)a3
{
}

- (BOOL)filterByTransactionAuthorsIsExclusion
{
  return self->_filterByTransactionAuthorsIsExclusion;
}

- (void)setFilterByTransactionAuthorsIsExclusion:(BOOL)a3
{
  self->_filterByTransactionAuthorsIsExclusion = a3;
}

- (NSArray)filteredTransactions
{
  return self->_filteredTransactions;
}

- (void)setFilteredTransactions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredTransactions, 0);
  objc_storeStrong((id *)&self->_filterByTransactionAuthorStrings, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_inserts, 0);

  objc_storeStrong((id *)&self->_transactions, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMChangeSet *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [(REMChangeSet *)self transactions];
      uint64_t v8 = [(REMChangeSet *)v6 transactions];
      if (v7 == (void *)v8)
      {
        char v12 = 1;
        long long v9 = v7;
      }
      else
      {
        long long v9 = (void *)v8;
        uint64_t v10 = [(REMChangeSet *)self transactions];
        uint64_t v11 = [(REMChangeSet *)v6 transactions];
        char v12 = [v10 isEqual:v11];
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (void)_filterAndFlattenAndConsolidateChanges
{
  uint64_t v7 = [a2 changeType];
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_fault_impl(&dword_1B9AA2000, a4, OS_LOG_TYPE_FAULT, "Unknown persistent history change type. {changeType: %lu}", a1, 0xCu);
}

- (void)enumerateChanges:forModelsOfClass:withBlock:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_FAULT, "Requested change tracking for unsupported class {klass: %{public}@}", v1, 0xCu);
}

void __60__REMChangeSet_enumerateChanges_forModelsOfClass_withBlock___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_ERROR, "Missing changeEntityName {change: %@}", v1, 0xCu);
}

- (void)lastChangeTokenForAccountID:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = [a2 error];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a2, "isTruncated"));
  uint64_t v8 = [a2 transactions];
  int v9 = 138544130;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  char v12 = v6;
  __int16 v13 = 2114;
  uint64_t v14 = v7;
  __int16 v15 = 2112;
  BOOL v16 = v8;
  _os_log_error_impl(&dword_1B9AA2000, a3, OS_LOG_TYPE_ERROR, "REMChangeSet is in error or truncated. Returning nil token for account {accountID: %{public}@, error: %@, isTruncated: %{public}@, transactions: %@}", (uint8_t *)&v9, 0x2Au);
}

- (void)initWithCoder:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_1B9AA2000, v1, OS_LOG_TYPE_FAULT, "rem_log_fault_if (transactions.count != 0) -- Attempt to decode an error change set with non-empty transaction list. {error: %@, transaction: %@}", v2, 0x16u);
}

@end
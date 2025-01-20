@interface NoteResurrectionMergePolicy
+ (id)sharedNoteResurrectionMergePolicy;
- (BOOL)accountExists:(id)a3;
- (BOOL)resolveConflicts:(id)a3 error:(id *)a4;
- (id)localStoreForNote:(id)a3;
- (id)snapshotFromRecord:(id)a3;
@end

@implementation NoteResurrectionMergePolicy

+ (id)sharedNoteResurrectionMergePolicy
{
  v2 = (void *)sharedNoteResurrectionMergePolicy_sharedMergePolicy;
  if (!sharedNoteResurrectionMergePolicy_sharedMergePolicy)
  {
    v3 = [(NSMergePolicy *)[NoteResurrectionMergePolicy alloc] initWithMergeType:2];
    v4 = (void *)sharedNoteResurrectionMergePolicy_sharedMergePolicy;
    sharedNoteResurrectionMergePolicy_sharedMergePolicy = (uint64_t)v3;

    v2 = (void *)sharedNoteResurrectionMergePolicy_sharedMergePolicy;
  }
  return v2;
}

- (id)localStoreForNote:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C110]);
  v5 = [v3 managedObjectContext];
  v6 = [v5 persistentStoreCoordinator];
  [v4 setPersistentStoreCoordinator:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  v8 = [MEMORY[0x1E4F1C0A8] entityForName:@"Account" inManagedObjectContext:v4];
  [v7 setEntity:v8];
  v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"accountIdentifier == %@", @"local://local/account"];
  [v7 setPredicate:v9];
  id v20 = 0;
  v10 = [v4 executeFetchRequest:v7 error:&v20];
  id v11 = v20;
  v12 = v11;
  if (v11)
  {
    v13 = [v11 userInfo];
    NSLog(&cfstr_ErrorGettingDe.isa, v12, v13);
  }
  v14 = [v10 lastObject];
  v15 = [v14 defaultStore];
  v16 = [v15 objectID];

  v17 = [v3 managedObjectContext];
  v18 = [v17 objectWithID:v16];

  return v18;
}

- (BOOL)accountExists:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C110];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [v4 managedObjectContext];
  id v7 = [v6 persistentStoreCoordinator];
  [v5 setPersistentStoreCoordinator:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  v9 = [MEMORY[0x1E4F1C0A8] entityForName:@"Account" inManagedObjectContext:v5];
  [v8 setEntity:v9];
  v10 = (void *)MEMORY[0x1E4F28F60];
  id v11 = [v4 accountIdentifier];

  v12 = [v10 predicateWithFormat:@"accountIdentifier == %@", v11];

  [v8 setPredicate:v12];
  uint64_t v15 = 0;
  v13 = [v5 executeFetchRequest:v8 error:&v15];
  LOBYTE(v11) = [v13 count] == 1;

  return (char)v11;
}

- (id)snapshotFromRecord:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectSnapshot];
  if (v4) {
    [v3 objectSnapshot];
  }
  else {
  id v5 = [v3 cachedSnapshot];
  }

  return v5;
}

- (BOOL)resolveConflicts:(id)a3 error:(id *)a4
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v90 = self;
  v129.receiver = self;
  v129.super_class = (Class)NoteResurrectionMergePolicy;
  unsigned int v7 = [(NSMergePolicy *)&v129 resolveConflicts:v6 error:a4];
  BOOL v8 = v7;
  if (!v7) {
    goto LABEL_98;
  }
  char v85 = v7;
  id v93 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v95 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v100 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v99 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v86 = v6;
  obuint64_t j = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v125 objects:v135 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v103 = 0;
    v104 = 0;
    v94 = 0;
    v98 = 0;
    id v11 = 0;
    v12 = 0;
    uint64_t v13 = *(void *)v126;
    uint64_t v91 = *(void *)v126;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v126 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v125 + 1) + 8 * i);
        v16 = [v15 sourceObject];
        v17 = [v16 entity];
        if (!v104)
        {
          uint64_t v18 = [v16 managedObjectContext];
          uint64_t v101 = [MEMORY[0x1E4F1C0A8] entityForName:@"Note" inManagedObjectContext:v18];

          uint64_t v19 = [MEMORY[0x1E4F1C0A8] entityForName:@"NoteBody" inManagedObjectContext:v18];

          uint64_t v20 = [MEMORY[0x1E4F1C0A8] entityForName:@"NoteChange" inManagedObjectContext:v18];

          uint64_t v21 = [MEMORY[0x1E4F1C0A8] entityForName:@"Store" inManagedObjectContext:v18];

          v104 = (void *)v18;
          uint64_t v22 = [MEMORY[0x1E4F1C0A8] entityForName:@"Account" inManagedObjectContext:v18];

          v94 = (void *)v22;
          uint64_t v13 = v91;
          v98 = (void *)v21;
          v103 = (void *)v20;
          id v11 = (void *)v19;
          v12 = (void *)v101;
        }
        if (![v15 newVersionNumber])
        {
          if ([v17 isEqual:v12])
          {
            v23 = [v16 objectID];
            [v93 setObject:v16 forKey:v23];
          }
          else if ([v17 isEqual:v11])
          {
            v23 = [(NoteResurrectionMergePolicy *)v90 snapshotFromRecord:v15];
            v24 = [v23 objectForKey:@"owner"];
            [v95 setObject:v16 forKey:v24];
          }
          else
          {
            if ([v17 isEqual:v98])
            {
              v23 = [v16 objectID];
              v25 = v100;
            }
            else
            {
              if (![v17 isEqual:v94]) {
                goto LABEL_20;
              }
              v23 = [v16 objectID];
              v25 = v99;
            }
            [v25 addObject:v23];
          }
        }
LABEL_20:
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v125 objects:v135 count:16];
      if (!v10) {
        goto LABEL_24;
      }
    }
  }
  v103 = 0;
  v104 = 0;
  v94 = 0;
  v98 = 0;
  id v11 = 0;
  v12 = 0;
LABEL_24:

  v26 = v95;
  v27 = v104;
  if (![v93 count]
    && ![v95 count]
    && ![v100 count]
    && ![v99 count])
  {
    goto LABEL_97;
  }
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v89 = [v104 insertedObjects];
  uint64_t v28 = [v89 countByEnumeratingWithState:&v121 objects:v134 count:16];
  v88 = v11;
  id obja = v12;
  if (!v28) {
    goto LABEL_53;
  }
  uint64_t v29 = v28;
  uint64_t v30 = *(void *)v122;
  uint64_t v87 = *(void *)v122;
  do
  {
    for (uint64_t j = 0; j != v29; ++j)
    {
      if (*(void *)v122 != v30) {
        objc_enumerationMutation(v89);
      }
      v32 = *(void **)(*((void *)&v121 + 1) + 8 * j);
      v33 = [v32 entity];
      int v34 = [v33 isEqual:v12];
      if (v34)
      {
        v102 = v33;
        id v35 = v32;
        goto LABEL_37;
      }
      if ([v33 isEqual:v11])
      {
        v102 = v33;
        id v35 = [v32 owner];
LABEL_37:
        id v36 = v35;
        v37 = [v35 store];
        v38 = [v37 objectID];
        if ([v100 containsObject:v38])
        {

          goto LABEL_40;
        }
        v39 = [v36 store];
        v40 = [v39 account];
        [v40 objectID];
        v42 = uint64_t v41 = v29;
        int v92 = [v99 containsObject:v42];

        uint64_t v29 = v41;
        id v11 = v88;

        uint64_t v30 = v87;
        if (v92)
        {
LABEL_40:
          v43 = [v36 objectID];
          v26 = v95;
          if (v34) {
            v44 = v93;
          }
          else {
            v44 = v95;
          }
          [v44 setObject:v32 forKey:v43];
        }
        else
        {
          v26 = v95;
        }
        v12 = obja;
        v33 = v102;
        goto LABEL_50;
      }
      if (![v33 isEqual:v98]) {
        goto LABEL_51;
      }
      v45 = v33;
      id v36 = v32;
      v46 = [v36 account];
      v47 = [v46 objectID];
      int v48 = [v99 containsObject:v47];

      if (v48)
      {
        v49 = [v36 objectID];
        [v100 addObject:v49];

        [v104 deleteObject:v36];
      }
      v12 = obja;
      v33 = v45;
      id v11 = v88;
LABEL_50:

      v27 = v104;
LABEL_51:
    }
    uint64_t v29 = [v89 countByEnumeratingWithState:&v121 objects:v134 count:16];
  }
  while (v29);
LABEL_53:

  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v50 = v93;
  uint64_t v51 = [v50 countByEnumeratingWithState:&v117 objects:v133 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    v53 = 0;
    uint64_t v54 = *(void *)v118;
    do
    {
      for (uint64_t k = 0; k != v52; ++k)
      {
        if (*(void *)v118 != v54) {
          objc_enumerationMutation(v50);
        }
        uint64_t v56 = *(void *)(*((void *)&v117 + 1) + 8 * k);
        v57 = [v50 objectForKey:v56];
        v58 = [v26 objectForKey:v56];
        if (v58)
        {
          [v27 _forceInsertionForObject:v57];
          [v27 _forceInsertionForObject:v58];
          if (!v53)
          {
            v53 = [(NoteResurrectionMergePolicy *)v90 localStoreForNote:v57];
          }
          [v57 setStore:v53];
        }
        else
        {
          [v27 deleteObject:v57];
        }
        [v26 removeObjectForKey:v56];
      }
      uint64_t v52 = [v50 countByEnumeratingWithState:&v117 objects:v133 count:16];
    }
    while (v52);
  }
  else
  {
    v53 = 0;
  }

  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v59 = v26;
  uint64_t v60 = [v59 countByEnumeratingWithState:&v113 objects:v132 count:16];
  if (v60)
  {
    uint64_t v61 = v60;
    uint64_t v62 = *(void *)v114;
    do
    {
      for (uint64_t m = 0; m != v61; ++m)
      {
        if (*(void *)v114 != v62) {
          objc_enumerationMutation(v59);
        }
        v64 = [v59 objectForKey:*(void *)(*((void *)&v113 + 1) + 8 * m)];
        [v27 deleteObject:v64];
      }
      uint64_t v61 = [v59 countByEnumeratingWithState:&v113 objects:v132 count:16];
    }
    while (v61);
  }

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  v65 = [v27 insertedObjects];
  uint64_t v66 = [v65 countByEnumeratingWithState:&v109 objects:v131 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v110;
    do
    {
      for (uint64_t n = 0; n != v67; ++n)
      {
        if (*(void *)v110 != v68) {
          objc_enumerationMutation(v65);
        }
        v70 = *(void **)(*((void *)&v109 + 1) + 8 * n);
        v71 = [v70 entity];
        if ([v71 isEqual:v103])
        {
          v72 = [v70 store];
          v73 = [v72 objectID];
          int v74 = [v100 containsObject:v73];

          if (v74) {
            [v104 deleteObject:v70];
          }
        }
      }
      uint64_t v67 = [v65 countByEnumeratingWithState:&v109 objects:v131 count:16];
    }
    while (v67);
  }

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v75 = v100;
  uint64_t v76 = [v75 countByEnumeratingWithState:&v105 objects:v130 count:16];
  v26 = v95;
  v27 = v104;
  if (v76)
  {
    uint64_t v77 = v76;
    uint64_t v78 = *(void *)v106;
    do
    {
      for (iuint64_t i = 0; ii != v77; ++ii)
      {
        if (*(void *)v106 != v78) {
          objc_enumerationMutation(v75);
        }
        v80 = [v104 objectWithID:*(void *)(*((void *)&v105 + 1) + 8 * ii)];
        v81 = [v80 account];

        if (v81)
        {
          v82 = [v81 objectID];
          if ([v99 containsObject:v82])
          {
          }
          else
          {
            BOOL v83 = [(NoteResurrectionMergePolicy *)v90 accountExists:v81];

            if (!v83) {
              [v104 deleteObject:v81];
            }
          }
        }
      }
      uint64_t v77 = [v75 countByEnumeratingWithState:&v105 objects:v130 count:16];
    }
    while (v77);
  }

  id v11 = v88;
  v12 = obja;
LABEL_97:

  id v6 = v86;
  BOOL v8 = v85;
LABEL_98:

  return v8;
}

@end
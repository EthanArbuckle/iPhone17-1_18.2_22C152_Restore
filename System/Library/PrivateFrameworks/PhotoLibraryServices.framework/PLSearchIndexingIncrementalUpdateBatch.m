@interface PLSearchIndexingIncrementalUpdateBatch
- (BOOL)_flagsAreAmbiguous;
- (BOOL)_flagsAreIncompatible;
- (BOOL)hasDonations;
- (NSArray)coalescedWorkItems;
- (NSArray)eligibleManagedObjects;
- (NSArray)identifiersRequiringAdditionalWork;
- (NSArray)ineligibleIdentifiers;
- (NSDictionary)partialUpdateMasks;
- (NSError)error;
- (PLSearchIndexingIncrementalUpdateBatch)initWithWorkItems:(id)a3 flags:(int64_t)a4;
- (id)_descriptionForSearchableIdentifiers:(id)a3 ineligibleIdentifiers:(id)a4 entity:(unint64_t)a5;
- (unint64_t)_inLibraryPerform_searchableEntityForAmbiguousIdentifier:(id)a3 library:(id)a4;
- (unint64_t)targetEntity;
- (void)_inPerformBlock_coalesceWithLibrary:(id)a3;
- (void)_inPerformBlock_removeWorkItemsNotMatchingOriginalFlags;
- (void)_inPerformTransaction_processAmbiguousEntityJobsWithFlags:(int64_t)a3 library:(id)a4;
- (void)inPerformBlock_prepareDonationsWithLibrary:(id)a3;
- (void)inPerformTransaction_cleanUpWithSuccess:(BOOL)a3 library:(id)a4;
@end

@implementation PLSearchIndexingIncrementalUpdateBatch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersRequiringAdditionalWork, 0);
  objc_storeStrong((id *)&self->_coalescedWorkItems, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_ineligibleIdentifiers, 0);
  objc_storeStrong((id *)&self->_partialUpdateMasks, 0);
  objc_storeStrong((id *)&self->_eligibleManagedObjects, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_normalizedWorkItemsByIdentifiers, 0);
  objc_storeStrong((id *)&self->_possibleEntities, 0);
  objc_storeStrong((id *)&self->_workItems, 0);
}

- (NSArray)identifiersRequiringAdditionalWork
{
  return self->_identifiersRequiringAdditionalWork;
}

- (NSArray)coalescedWorkItems
{
  return self->_coalescedWorkItems;
}

- (NSError)error
{
  return self->_error;
}

- (NSArray)ineligibleIdentifiers
{
  return self->_ineligibleIdentifiers;
}

- (NSDictionary)partialUpdateMasks
{
  return self->_partialUpdateMasks;
}

- (NSArray)eligibleManagedObjects
{
  return self->_eligibleManagedObjects;
}

- (void)_inPerformTransaction_processAmbiguousEntityJobsWithFlags:(int64_t)a3 library:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  NSUInteger v29 = [(NSArray *)self->_workItems count];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obj = self->_workItems;
  uint64_t v33 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v33)
  {
    v34 = 0;
    uint64_t v32 = *(void *)v36;
    v30 = self;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v36 != v32) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v9 = [v8 identifier];
        unint64_t v10 = [(PLSearchIndexingIncrementalUpdateBatch *)self _inLibraryPerform_searchableEntityForAmbiguousIdentifier:v9 library:v6];

        if (v10 > 8) {
          uint64_t v11 = 3;
        }
        else {
          uint64_t v11 = qword_19BA9EBD8[v10];
        }
        int64_t v12 = v11 & a3;
        v13 = PLSearchBackendIndexingEngineGetLog();
        v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v15 = PLBackgroundJobWorkerSearchJobFlagsDescription(a3);
            PLBackgroundJobWorkerSearchJobFlagsDescription(v12);
            v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v17 = @"invalid";
            if (v10 <= 8) {
              v17 = off_1E586EAE8[v10];
            }
            v18 = v17;
            v19 = [v8 identifier];
            *(_DWORD *)buf = 138413058;
            v40 = v15;
            __int16 v41 = 2112;
            v42 = v16;
            __int16 v43 = 2112;
            v44 = v18;
            __int16 v45 = 2112;
            v46 = v19;
            _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "Converting ambiguous job with flags: %@ to new job with flags: %@, entity: %@, identifier: %@", buf, 0x2Au);

            self = v30;
          }

          v20 = [v8 identifier];
          v21 = [v6 managedObjectContext];
          v14 = +[PLBackgroundJobWorkItem insertSearchIndexWorkItemIfNeededWithIdentifier:v20 flags:v12 managedObjectContext:v21];

          -[NSObject setJobType:](v14, "setJobType:", [v8 jobType]);
          ++v34;
        }
        else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v22 = PLBackgroundJobWorkerSearchJobFlagsDescription(a3);
          v23 = @"invalid";
          if (v10 <= 8) {
            v23 = off_1E586EAE8[v10];
          }
          v24 = v23;
          v25 = [v8 identifier];
          *(_DWORD *)buf = 138543874;
          v40 = v22;
          __int16 v41 = 2114;
          v42 = v24;
          __int16 v43 = 2114;
          v44 = v25;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Incompatible job flags: %{public}@ for entity: %{public}@ with identifier: %{public}@, job will be a no op", buf, 0x20u);

          self = v30;
        }

        v26 = [v6 managedObjectContext];
        [v26 deleteObject:v8];
      }
      uint64_t v33 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v33);
  }
  else
  {
    v34 = 0;
  }

  v27 = PLSearchBackendIndexingEngineGetLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    PLBackgroundJobWorkerSearchJobFlagsDescription(a3);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v40 = v34;
    __int16 v41 = 2048;
    v42 = (__CFString *)v29;
    __int16 v43 = 2114;
    v44 = v28;
    _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "Converted %lu out of %lu ambiguous jobs with flags: %{public}@ to resolvable jobs", buf, 0x20u);
  }
}

- (unint64_t)_inLibraryPerform_searchableEntityForAmbiguousIdentifier:(id)a3 library:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = +[PLManagedAsset assetWithUUID:v5 inLibrary:v6];
  if (v7)
  {
    unint64_t v8 = 1;
  }
  else
  {
    v9 = +[PLGenericAlbum albumWithUUID:v5 inLibrary:v6];
    if (v9)
    {
      unint64_t v8 = 3;
    }
    else
    {
      v16[0] = v5;
      unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      uint64_t v11 = [v6 managedObjectContext];
      int64_t v12 = +[PLSearchIndexManager fetchHighlightsWithUUIDs:v10 managedObjectContext:v11 error:0];
      v13 = [v12 firstObject];

      if (v13)
      {
        unint64_t v8 = 4;
      }
      else
      {
        v14 = +[PLMemory memoryWithUUID:v5 inPhotoLibrary:v6];
        if (v14) {
          unint64_t v8 = 5;
        }
        else {
          unint64_t v8 = 0;
        }
      }
    }
  }
  return v8;
}

- (id)_descriptionForSearchableIdentifiers:(id)a3 ineligibleIdentifiers:(id)a4 entity:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v10 = [v7 count];
  if (a5 > 8) {
    uint64_t v11 = @"invalid";
  }
  else {
    uint64_t v11 = off_1E586EAE8[a5];
  }
  int64_t v12 = v11;
  [v9 appendFormat:@"%tu %@ searchable objects", v10, v12];

  if ([v7 count] && (unint64_t)objc_msgSend(v7, "count") <= 9)
  {
    v13 = [v7 componentsJoinedByString:@", "];
    [v9 appendFormat:@" (%@)", v13];
  }
  [v9 appendFormat:@", %tu ineligible identifiers to remove", objc_msgSend(v8, "count")];
  if ([v8 count] && (unint64_t)objc_msgSend(v8, "count") <= 9)
  {
    v14 = [v8 componentsJoinedByString:@", "];
    [v9 appendFormat:@" (%@)", v14];
  }
  return v9;
}

- (void)inPerformTransaction_cleanUpWithSuccess:(BOOL)a3 library:(id)a4
{
  uint64_t v189 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v124 = self;
  if (a3)
  {
    if (![(PLSearchIndexingIncrementalUpdateBatch *)self _flagsAreAmbiguous]
      && ![(PLSearchIndexingIncrementalUpdateBatch *)self _flagsAreIncompatible])
    {
      switch([(PLSearchIndexingIncrementalUpdateBatch *)self targetEntity])
      {
        case 0uLL:
          long long v139 = 0u;
          long long v140 = 0u;
          long long v137 = 0u;
          long long v138 = 0u;
          id v7 = self->_identifiers;
          uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v137 objects:v178 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v138;
            do
            {
              for (uint64_t i = 0; i != v9; ++i)
              {
                if (*(void *)v138 != v10) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v12 = *(void *)(*((void *)&v137 + 1) + 8 * i);
                v13 = [(NSMutableDictionary *)v124->_normalizedWorkItemsByIdentifiers objectForKeyedSubscript:v12];
                if (([v13 jobFlags] & 1) == 0)
                {
                  uint64_t v14 = [v13 jobFlags];
                  v15 = [v6 managedObjectContext];
                  v16 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:v12 flags:v14 managedObjectContext:v15];

                  v17 = [v13 timestamp];
                  [v16 setTimestamp:v17];

                  objc_msgSend(v16, "setJobType:", objc_msgSend(v13, "jobType"));
                }
              }
              uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v137 objects:v178 count:16];
            }
            while (v9);
          }

          goto LABEL_97;
        case 2uLL:
          v52 = [(NSMutableSet *)self->_identifiers allObjects];
          v53 = [v6 managedObjectContext];
          v167[0] = MEMORY[0x1E4F143A8];
          v167[1] = 3221225472;
          v167[2] = __90__PLSearchIndexingIncrementalUpdateBatch_inPerformTransaction_cleanUpWithSuccess_library___block_invoke;
          v167[3] = &unk_1E586F2B8;
          v167[4] = self;
          id v168 = v6;
          +[PLPerson enumerateAssetUUIDsForSearchIndexingWithDetectedFaceUUIDs:v52 managedObjectContext:v53 assetUUIDHandler:v167];

          __int16 v43 = v168;
          goto LABEL_30;
        case 6uLL:
          long long v165 = 0u;
          long long v166 = 0u;
          long long v163 = 0u;
          long long v164 = 0u;
          v126 = self->_identifiers;
          uint64_t v54 = [(NSMutableSet *)v126 countByEnumeratingWithState:&v163 objects:v186 count:16];
          if (v54)
          {
            uint64_t v55 = v54;
            id obja = *(id *)v164;
            do
            {
              for (uint64_t j = 0; j != v55; ++j)
              {
                if (*(id *)v164 != obja) {
                  objc_enumerationMutation(v126);
                }
                uint64_t v57 = *(void *)(*((void *)&v163 + 1) + 8 * j);
                v58 = [(NSMutableDictionary *)self->_normalizedWorkItemsByIdentifiers objectForKeyedSubscript:v57];
                v59 = [v6 managedObjectContext];
                v60 = [v6 libraryServicesManager];
                uint64_t v61 = [v60 wellKnownPhotoLibraryIdentifier];
                v160[0] = MEMORY[0x1E4F143A8];
                v160[1] = 3221225472;
                v160[2] = __90__PLSearchIndexingIncrementalUpdateBatch_inPerformTransaction_cleanUpWithSuccess_library___block_invoke_2;
                v160[3] = &unk_1E586FC78;
                id v161 = v6;
                id v162 = v58;
                id v62 = v58;
                uint64_t v63 = v61;
                self = v124;
                +[PLPerson enumerateAssetUUIDsForSearchIndexingWithPersonUUID:v57 managedObjectContext:v59 libraryIdentifier:v63 assetUUIDHandler:v160];
              }
              uint64_t v55 = [(NSMutableSet *)v126 countByEnumeratingWithState:&v163 objects:v186 count:16];
            }
            while (v55);
          }
          __int16 v43 = v126;
          goto LABEL_30;
        case 7uLL:
          long long v158 = 0u;
          long long v159 = 0u;
          long long v156 = 0u;
          long long v157 = 0u;
          v64 = self->_identifiers;
          uint64_t v65 = [(NSMutableSet *)v64 countByEnumeratingWithState:&v156 objects:v185 count:16];
          if (!v65) {
            goto LABEL_88;
          }
          uint64_t v67 = v65;
          uint64_t v68 = *(void *)v157;
          v69 = off_1E585F000;
          *(void *)&long long v66 = 138543362;
          long long v116 = v66;
          v117 = v64;
          uint64_t v118 = *(void *)v157;
          v125 = v6;
          break;
        case 8uLL:
          long long v146 = 0u;
          long long v147 = 0u;
          long long v144 = 0u;
          long long v145 = 0u;
          v128 = self->_identifiers;
          uint64_t v107 = [(NSMutableSet *)v128 countByEnumeratingWithState:&v144 objects:v179 count:16];
          if (v107)
          {
            uint64_t v108 = v107;
            id objc = *(id *)v145;
            do
            {
              for (uint64_t k = 0; k != v108; ++k)
              {
                if (*(id *)v145 != objc) {
                  objc_enumerationMutation(v128);
                }
                uint64_t v110 = *(void *)(*((void *)&v144 + 1) + 8 * k);
                v111 = [(NSMutableDictionary *)v124->_normalizedWorkItemsByIdentifiers objectForKeyedSubscript:v110];
                v112 = [v6 managedObjectContext];
                v113 = [v6 libraryServicesManager];
                uint64_t v114 = [v113 wellKnownPhotoLibraryIdentifier];
                v141[0] = MEMORY[0x1E4F143A8];
                v141[1] = 3221225472;
                v141[2] = __90__PLSearchIndexingIncrementalUpdateBatch_inPerformTransaction_cleanUpWithSuccess_library___block_invoke_67;
                v141[3] = &unk_1E586FC78;
                id v142 = v6;
                id v143 = v111;
                id v115 = v111;
                +[PLMoment enumerateAssetUUIDsForSearchIndexingWithMomentUUID:v110 managedObjectContext:v112 libraryIdentifier:v114 assetUUIDHandler:v141];
              }
              uint64_t v108 = [(NSMutableSet *)v128 countByEnumeratingWithState:&v144 objects:v179 count:16];
            }
            while (v108);
          }

LABEL_97:
          self = v124;
          goto LABEL_31;
        default:
          goto LABEL_31;
      }
      while (1)
      {
        uint64_t v70 = 0;
        uint64_t v119 = v67;
        do
        {
          if (*(void *)v157 != v68) {
            objc_enumerationMutation(v64);
          }
          v71 = *(void **)(*((void *)&v156 + 1) + 8 * v70);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_normalizedWorkItemsByIdentifiers, "objectForKeyedSubscript:", v71, v116);
          id v127 = (id)objc_claimAutoreleasedReturnValue();
          if (([v127 jobFlags] & 0x400) != 0)
          {
            v72 = [(__objc2_class *)v69[257] fetchSearchEntityWithEncodedIdentifierString:v71 inLibrary:v6];
            id objb = v72;
            if (![v72 isSuccess])
            {
              v95 = PLSearchBackendIndexingEngineGetLog();
              if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
              {
                v96 = [v72 error];
                *(_DWORD *)buf = 138412546;
                v182 = v71;
                __int16 v183 = 2112;
                v184 = v96;
                _os_log_impl(&dword_19B3C7000, v95, OS_LOG_TYPE_ERROR, "Failed to fetch search entity with identifier: %@, error: %@", buf, 0x16u);

                v72 = objb;
              }
              goto LABEL_84;
            }
            v73 = [v72 result];
            uint64_t v74 = [v73 count];

            v72 = objb;
            if (v74)
            {
              v75 = [objb result];
              v76 = [v75 firstObject];
              id v155 = 0;
              v77 = [v76 fetchAllMomentsWithError:&v155];
              v123 = v155;

              v78 = v77;
              if (v77)
              {
                if ([v77 count])
                {
                  uint64_t v120 = v70;
                  long long v153 = 0u;
                  long long v154 = 0u;
                  long long v151 = 0u;
                  long long v152 = 0u;
                  v79 = v77;
                  uint64_t v80 = [v79 countByEnumeratingWithState:&v151 objects:v180 count:16];
                  v72 = objb;
                  v81 = v79;
                  if (v80)
                  {
                    uint64_t v82 = v80;
                    v121 = v77;
                    uint64_t v83 = *(void *)v152;
                    do
                    {
                      for (uint64_t m = 0; m != v82; ++m)
                      {
                        if (*(void *)v152 != v83) {
                          objc_enumerationMutation(v79);
                        }
                        v85 = *(void **)(*((void *)&v151 + 1) + 8 * m);
                        v86 = PLSearchBackendIndexingEngineGetLog();
                        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                        {
                          v87 = [v85 uuid];
                          v88 = [objb result];
                          v89 = [v88 firstObject];
                          v90 = [v89 uuid];
                          *(_DWORD *)buf = 138543618;
                          v182 = v87;
                          __int16 v183 = 2114;
                          v184 = v90;
                          _os_log_impl(&dword_19B3C7000, v86, OS_LOG_TYPE_DEFAULT, "Fanning out to moment %{public}@ for search entity %{public}@", buf, 0x16u);
                        }
                        v91 = [v85 uuid];
                        v92 = [v125 managedObjectContext];
                        v93 = [v125 libraryServicesManager];
                        uint64_t v94 = [v93 wellKnownPhotoLibraryIdentifier];
                        v148[0] = MEMORY[0x1E4F143A8];
                        v148[1] = 3221225472;
                        v148[2] = __90__PLSearchIndexingIncrementalUpdateBatch_inPerformTransaction_cleanUpWithSuccess_library___block_invoke_66;
                        v148[3] = &unk_1E586FC78;
                        id v149 = v125;
                        id v150 = v127;
                        +[PLMoment enumerateAssetUUIDsForSearchIndexingWithMomentUUID:v91 managedObjectContext:v92 libraryIdentifier:v94 assetUUIDHandler:v148];

                        v72 = objb;
                        v79 = v81;
                      }
                      uint64_t v82 = [v81 countByEnumeratingWithState:&v151 objects:v180 count:16];
                    }
                    while (v82);
                    self = v124;
                    v64 = v117;
                    uint64_t v68 = v118;
                    uint64_t v67 = v119;
                    uint64_t v70 = v120;
                    v69 = off_1E585F000;
                    v95 = v123;
LABEL_76:
                    v78 = v121;
LABEL_83:

LABEL_84:
                    goto LABEL_85;
                  }
                  v69 = off_1E585F000;
                }
                else
                {
                  v102 = PLSearchBackendIndexingEngineGetLog();
                  v72 = objb;
                  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
                  {
                    [objb result];
                    v103 = v122 = v78;
                    v104 = [v103 firstObject];
                    [v104 uuid];
                    v106 = uint64_t v105 = v70;
                    *(_DWORD *)buf = v116;
                    v182 = v106;
                    v81 = v102;
                    _os_log_impl(&dword_19B3C7000, v102, OS_LOG_TYPE_DEFAULT, "Found 0 moments for search entity with uuid %{public}@, will not index any assets", buf, 0xCu);

                    uint64_t v70 = v105;
                    v72 = objb;
                    v69 = off_1E585F000;

                    uint64_t v68 = v118;
                    uint64_t v67 = v119;

                    v78 = v122;
                    v95 = v123;
                    goto LABEL_83;
                  }
                  v81 = v102;
                }
              }
              else
              {
                v97 = PLBackendGetLog();
                if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
                {
                  [objb result];
                  v98 = v121 = 0;
                  v99 = [v98 firstObject];
                  [v99 uuid];
                  v101 = uint64_t v100 = v70;
                  *(_DWORD *)buf = 138543618;
                  v182 = v101;
                  __int16 v183 = 2112;
                  v95 = v123;
                  v184 = v123;
                  v81 = v97;
                  _os_log_impl(&dword_19B3C7000, v97, OS_LOG_TYPE_ERROR, "Fetch failed for all moment associated with search entity %{public}@ error: %@", buf, 0x16u);

                  uint64_t v70 = v100;
                  v72 = objb;
                  v69 = off_1E585F000;

                  uint64_t v68 = v118;
                  uint64_t v67 = v119;

                  goto LABEL_76;
                }
                v81 = v97;
                v72 = objb;
              }
              v95 = v123;
              goto LABEL_83;
            }
LABEL_85:

            id v6 = v125;
          }

          ++v70;
        }
        while (v70 != v67);
        uint64_t v67 = [(NSMutableSet *)v64 countByEnumeratingWithState:&v156 objects:v185 count:16];
        if (!v67)
        {
LABEL_88:

          break;
        }
      }
    }
  }
  else
  {
    long long v175 = 0u;
    long long v176 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    v18 = self->_ineligibleIdentifiers;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v173 objects:v188 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v174;
      do
      {
        for (uint64_t n = 0; n != v20; ++n)
        {
          if (*(void *)v174 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v173 + 1) + 8 * n);
          v24 = [v6 managedObjectContext];
          v25 = +[PLBackgroundJobWorkItem insertBackgroundJobWorkItemWithIdentifier:v23 jobType:3 jobFlags:1 inManagedObjectContext:v24];

          v26 = [(NSMutableDictionary *)self->_normalizedWorkItemsByIdentifiers objectForKeyedSubscript:v23];
          v27 = [v26 timestamp];
          [v25 setTimestamp:v27];

          v28 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:60.0];
          [v25 setDelayUntilDate:v28];
        }
        uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v173 objects:v188 count:16];
      }
      while (v20);
    }

    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    obuint64_t j = self->_eligibleManagedObjects;
    uint64_t v29 = [(NSArray *)obj countByEnumeratingWithState:&v169 objects:v187 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v170;
      do
      {
        for (iuint64_t i = 0; ii != v30; ++ii)
        {
          if (*(void *)v170 != v31) {
            objc_enumerationMutation(obj);
          }
          normalizedWorkItemsByIdentifiers = self->_normalizedWorkItemsByIdentifiers;
          id v34 = *(id *)(*((void *)&v169 + 1) + 8 * ii);
          long long v35 = [v34 searchIdentifier];
          long long v36 = [(NSMutableDictionary *)normalizedWorkItemsByIdentifiers objectForKeyedSubscript:v35];

          long long v37 = [v34 searchIdentifier];
          uint64_t v38 = [v36 jobFlags];
          v39 = [v6 managedObjectContext];

          v40 = +[PLBackgroundJobWorkItem insertBackgroundJobWorkItemWithIdentifier:v37 jobType:3 jobFlags:v38 inManagedObjectContext:v39];

          self = v124;
          __int16 v41 = [v36 timestamp];
          [v40 setTimestamp:v41];

          v42 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:300.0];
          [v40 setDelayUntilDate:v42];
        }
        uint64_t v30 = [(NSArray *)obj countByEnumeratingWithState:&v169 objects:v187 count:16];
      }
      while (v30);
    }
    __int16 v43 = obj;
LABEL_30:
  }
LABEL_31:
  if ([(PLSearchIndexingIncrementalUpdateBatch *)self _flagsAreAmbiguous])
  {
    v44 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_DEFAULT, "Search indexing job flags map to mutliple entities, replacing with unambiguous jobs", buf, 2u);
    }

    [(PLSearchIndexingIncrementalUpdateBatch *)self _inPerformTransaction_processAmbiguousEntityJobsWithFlags:self->_originalFlags library:v6];
  }
  __int16 v45 = self->_coalescedWorkItems;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  uint64_t v46 = [(NSArray *)v45 countByEnumeratingWithState:&v133 objects:v177 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v134;
    do
    {
      for (uint64_t jj = 0; jj != v47; ++jj)
      {
        if (*(void *)v134 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v50 = *(void *)(*((void *)&v133 + 1) + 8 * jj);
        v51 = [v6 managedObjectContext];
        [v51 deleteObject:v50];
      }
      uint64_t v47 = [(NSArray *)v45 countByEnumeratingWithState:&v133 objects:v177 count:16];
    }
    while (v47);
  }
}

void __90__PLSearchIndexingIncrementalUpdateBatch_inPerformTransaction_cleanUpWithSuccess_library___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 32);
  id v6 = a2;
  id v10 = [v5 objectForKeyedSubscript:a3];
  id v7 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v8 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:v6 flags:4 managedObjectContext:v7];

  uint64_t v9 = [v10 timestamp];
  [v8 setTimestamp:v9];

  objc_msgSend(v8, "setJobType:", objc_msgSend(v10, "jobType"));
}

void __90__PLSearchIndexingIncrementalUpdateBatch_inPerformTransaction_cleanUpWithSuccess_library___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 managedObjectContext];
  id v7 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:v4 flags:4 managedObjectContext:v5];

  id v6 = [*(id *)(a1 + 40) timestamp];
  [v7 setTimestamp:v6];

  objc_msgSend(v7, "setJobType:", objc_msgSend(*(id *)(a1 + 40), "jobType"));
}

void __90__PLSearchIndexingIncrementalUpdateBatch_inPerformTransaction_cleanUpWithSuccess_library___block_invoke_66(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 managedObjectContext];
  id v7 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:v4 flags:4 managedObjectContext:v5];

  id v6 = [*(id *)(a1 + 40) timestamp];
  [v7 setTimestamp:v6];

  objc_msgSend(v7, "setJobType:", objc_msgSend(*(id *)(a1 + 40), "jobType"));
}

void __90__PLSearchIndexingIncrementalUpdateBatch_inPerformTransaction_cleanUpWithSuccess_library___block_invoke_67(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 managedObjectContext];
  id v7 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:v4 flags:4 managedObjectContext:v5];

  id v6 = [*(id *)(a1 + 40) timestamp];
  [v7 setTimestamp:v6];

  objc_msgSend(v7, "setJobType:", objc_msgSend(*(id *)(a1 + 40), "jobType"));
}

- (void)inPerformBlock_prepareDonationsWithLibrary:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PLSearchIndexingIncrementalUpdateBatch *)self _inPerformBlock_removeWorkItemsNotMatchingOriginalFlags];
  [(PLSearchIndexingIncrementalUpdateBatch *)self _inPerformBlock_coalesceWithLibrary:v4];
  if (![(PLSearchIndexingIncrementalUpdateBatch *)self _flagsAreAmbiguous]
    && ![(PLSearchIndexingIncrementalUpdateBatch *)self _flagsAreIncompatible])
  {
    id v74 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = 0;
    v73 = self;
    switch([(PLSearchIndexingIncrementalUpdateBatch *)self targetEntity])
    {
      case 0uLL:
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        id v6 = self->_identifiers;
        uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v81 objects:v96 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v82;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v82 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v81 + 1) + 8 * i);
              uint64_t v12 = [(NSMutableDictionary *)self->_normalizedWorkItemsByIdentifiers objectForKeyedSubscript:v11];
              if ([v12 jobFlags]) {
                [v74 addObject:v11];
              }
            }
            uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v81 objects:v96 count:16];
          }
          while (v8);
        }

        id v5 = [MEMORY[0x1E4F8B9B8] successWithResult:MEMORY[0x1E4F1CBF0]];
        break;
      case 1uLL:
        v13 = [(NSMutableSet *)self->_identifiers allObjects];
        uint64_t v14 = [v4 managedObjectContext];
        uint64_t v15 = +[PLManagedAsset fetchAssetsWithUUIDs:v13 managedObjectContext:v14];
        goto LABEL_18;
      case 3uLL:
        v13 = [(NSMutableSet *)self->_identifiers allObjects];
        uint64_t v14 = [v4 managedObjectContext];
        uint64_t v15 = +[PLGenericAlbum fetchAlbumsWithUUIDs:v13 managedObjectContext:v14];
        goto LABEL_18;
      case 4uLL:
        v13 = [(NSMutableSet *)self->_identifiers allObjects];
        uint64_t v14 = [v4 managedObjectContext];
        uint64_t v15 = +[PLPhotosHighlight fetchHighlightsWithUUIDs:v13 managedObjectContext:v14];
        goto LABEL_18;
      case 5uLL:
        v13 = [(NSMutableSet *)self->_identifiers allObjects];
        uint64_t v14 = [v4 managedObjectContext];
        uint64_t v15 = +[PLMemory fetchMemoriesWithUUIDs:v13 managedObjectContext:v14];
LABEL_18:
        id v5 = (void *)v15;

        break;
      case 7uLL:
        id v75 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        v16 = self->_identifiers;
        uint64_t v17 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v85 objects:v97 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v86;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v86 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = +[PLSearchEntity fetchSearchEntityWithEncodedIdentifierString:*(void *)(*((void *)&v85 + 1) + 8 * j) inLibrary:v4];
              if ([v21 isSuccess])
              {
                v22 = [v21 result];
                uint64_t v23 = [v22 count];

                if (v23)
                {
                  v24 = [v21 result];
                  v25 = [v24 firstObject];
                  [v25 sourceNode];
                  v27 = id v26 = v4;
                  [v75 addObject:v27];

                  id v4 = v26;
                }
              }
            }
            uint64_t v18 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v85 objects:v97 count:16];
          }
          while (v18);
        }

        id v5 = [MEMORY[0x1E4F8B9B8] successWithResult:v75];

        self = v73;
        break;
      default:
        break;
    }
    if ([v5 isSuccess])
    {
      id v71 = v4;
      error = (NSError *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v70 = v5;
      uint64_t v31 = [v5 result];
      id v32 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v33 = v31;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v77 objects:v95 count:16];
      id v72 = v33;
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v76 = *(void *)v78;
        do
        {
          for (uint64_t k = 0; k != v35; ++k)
          {
            if (*(void *)v78 != v76) {
              objc_enumerationMutation(v33);
            }
            long long v37 = *(void **)(*((void *)&v77 + 1) + 8 * k);
            uint64_t v38 = [v37 searchIdentifier];
            [v32 addObject:v38];

            if ([v37 isEligibleForSearchIndexing])
            {
              id v39 = v37;
              [(NSError *)error addObject:v39];
              v40 = [v39 searchIdentifier];
              [v29 addObject:v40];

              if ([(PLSearchIndexingIncrementalUpdateBatch *)self targetEntity] == 1)
              {
                normalizedWorkItemsByIdentifiers = self->_normalizedWorkItemsByIdentifiers;
                v42 = [v39 searchIdentifier];
                [(NSMutableDictionary *)normalizedWorkItemsByIdentifiers objectForKeyedSubscript:v42];
                id v43 = v32;
                id v44 = v30;
                id v45 = v29;
                v47 = uint64_t v46 = error;
                unint64_t v48 = [v47 jobFlags];
                if ((v48 & 2) != 0) {
                  uint64_t v49 = 3;
                }
                else {
                  uint64_t v49 = (v48 >> 2) & 2 | ((v48 & 0x14) != 0);
                }

                error = v46;
                id v29 = v45;
                id v30 = v44;
                id v32 = v43;
                id v33 = v72;
              }
              else
              {
                uint64_t v49 = 0;
              }
              uint64_t v50 = [NSNumber numberWithLongLong:v49];
              v51 = [v39 objectID];
              [v30 setObject:v50 forKeyedSubscript:v51];

              self = v73;
            }
            else
            {
              id v39 = [v37 searchIdentifier];
              [v74 addObject:v39];
            }
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v77 objects:v95 count:16];
        }
        while (v35);
      }

      if ([(PLSearchIndexingIncrementalUpdateBatch *)self targetEntity])
      {
        v52 = (void *)[(NSMutableSet *)self->_identifiers mutableCopy];
        [v52 minusSet:v32];
        v53 = [v52 allObjects];
        [v74 addObjectsFromArray:v53];

        self = v73;
      }
      uint64_t v54 = PLSearchBackendIndexingEngineGetLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v55 = [(PLSearchIndexingIncrementalUpdateBatch *)self _descriptionForSearchableIdentifiers:v29 ineligibleIdentifiers:v74 entity:[(PLSearchIndexingIncrementalUpdateBatch *)self targetEntity]];
        *(_DWORD *)buf = 138543362;
        v90 = v55;
        _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_DEFAULT, "Coalesced batch of %{public}@", buf, 0xCu);
      }
      v56 = PLSearchBackendIndexingEngineGetLog();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      {
        unint64_t v57 = [(PLSearchIndexingIncrementalUpdateBatch *)self targetEntity];
        v58 = error;
        if (v57 > 8) {
          v59 = @"invalid";
        }
        else {
          v59 = off_1E586EAE8[v57];
        }
        uint64_t v61 = v59;
        id v62 = [v29 componentsJoinedByString:@", "];
        uint64_t v63 = [v74 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138412802;
        v90 = v61;
        __int16 v91 = 2112;
        v92 = v62;
        __int16 v93 = 2112;
        uint64_t v94 = v63;
        _os_log_impl(&dword_19B3C7000, v56, OS_LOG_TYPE_DEBUG, "Searchable object entity: %@, identifiers: %@, ineligible identifiers: %@", buf, 0x20u);

        error = v58;
        id v33 = v72;
        self = v73;
      }

      v64 = (NSArray *)[(NSError *)error copy];
      eligibleManagedObjects = self->_eligibleManagedObjects;
      self->_eligibleManagedObjects = v64;

      long long v66 = (NSArray *)[v74 copy];
      ineligibleIdentifiers = self->_ineligibleIdentifiers;
      self->_ineligibleIdentifiers = v66;

      uint64_t v68 = (NSDictionary *)[v30 copy];
      partialUpdateMasks = self->_partialUpdateMasks;
      self->_partialUpdateMasks = v68;

      id v5 = v70;
      id v4 = v71;
    }
    else
    {
      if (![v5 isFailure])
      {
LABEL_60:

        goto LABEL_61;
      }
      v60 = [v5 error];
      error = self->_error;
      self->_error = v60;
    }

    goto LABEL_60;
  }
LABEL_61:
}

- (void)_inPerformBlock_coalesceWithLibrary:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  if (![(PLSearchIndexingIncrementalUpdateBatch *)self _flagsAreIncompatible]
    && ![(PLSearchIndexingIncrementalUpdateBatch *)self _flagsAreAmbiguous])
  {
    id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    obuint64_t j = self->_workItems;
    uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v65 objects:v74 count:16];
    if (!v4) {
      goto LABEL_49;
    }
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v66;
    *(void *)&long long v5 = 134218242;
    long long v49 = v5;
    uint64_t v52 = *(void *)v66;
    uint64_t v50 = self;
    while (1)
    {
      uint64_t v8 = 0;
      uint64_t v54 = v6;
      do
      {
        if (*(void *)v66 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v65 + 1) + 8 * v8);
        identifiers = self->_identifiers;
        uint64_t v11 = objc_msgSend(v9, "identifier", v49);
        LOBYTE(identifiers) = [(NSMutableSet *)identifiers containsObject:v11];

        if ((identifiers & 1) == 0)
        {
          uint64_t v12 = [v9 identifier];
          v13 = [v55 managedObjectContext];
          id v64 = 0;
          uint64_t v14 = +[PLBackgroundJobWorkItem workItemsSortedByTimestampWithIdentifier:v12 jobTypes:&unk_1EEBF20D8 inManagedObjectContext:v13 error:&v64];
          id v58 = v64;

          if (v14)
          {
            __int16 v15 = [v9 jobType];
            v59 = v14;
            uint64_t v57 = v8;
            if ((unint64_t)[v14 count] < 2)
            {
              uint64_t v34 = [v9 jobFlags];
              goto LABEL_44;
            }
            v16 = PLSearchBackendIndexingEngineGetLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              uint64_t v17 = [v14 count];
              uint64_t v18 = [v9 identifier];
              *(_DWORD *)buf = v49;
              uint64_t v71 = v17;
              __int16 v72 = 2114;
              id v73 = v18;
              _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_INFO, "Coalescing %ld work items for identifier: %{public}@", buf, 0x16u);
            }
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            id v19 = v14;
            uint64_t v20 = [v19 countByEnumeratingWithState:&v60 objects:v69 count:16];
            if (!v20)
            {

              uint64_t v34 = 0;
              goto LABEL_44;
            }
            uint64_t v21 = v20;
            v51 = v9;
            BOOL v22 = 0;
            uint64_t v23 = 0;
            uint64_t v24 = *(void *)v61;
            while (1)
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v61 != v24) {
                  objc_enumerationMutation(v19);
                }
                id v26 = *(void **)(*((void *)&v60 + 1) + 8 * i);
                v23 |= [v26 jobFlags];
                char v27 = [v26 jobFlags];
                BOOL v28 = (v27 & 2) == 0;
                if ((v27 & 2) != 0)
                {
                  v23 &= ~1uLL;
                  id v29 = PLSearchBackendIndexingEngineGetLog();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)buf = 0;
                    id v30 = v29;
                    uint64_t v31 = "Coalesced an insertion into index";
                    goto LABEL_25;
                  }
                }
                else
                {
                  if (([v26 jobFlags] & 1) == 0) {
                    goto LABEL_27;
                  }
                  v23 &= ~2uLL;
                  id v29 = PLSearchBackendIndexingEngineGetLog();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)buf = 0;
                    id v30 = v29;
                    uint64_t v31 = "Coalesced a removal from index";
LABEL_25:
                    _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEBUG, v31, buf, 2u);
                  }
                }

                BOOL v22 = v28;
LABEL_27:
                if ([v26 jobType] == 1)
                {
                  __int16 v15 = 1;
                }
                else
                {
                  int v32 = [v26 jobType];
                  if (v15 == 3 && v32 == 2) {
                    __int16 v15 = 2;
                  }
                }
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v60 objects:v69 count:16];
              if (!v21)
              {

                if (v22) {
                  uint64_t v34 = 1;
                }
                else {
                  uint64_t v34 = v23;
                }
                self = v50;
                uint64_t v9 = v51;
LABEL_44:
                [v53 addObjectsFromArray:v59];
                long long v37 = [PLSearchIndexingNormalizedWorkItem alloc];
                uint64_t v38 = [v9 identifier];
                unint64_t v39 = [(PLSearchIndexingIncrementalUpdateBatch *)self targetEntity];
                v40 = [v59 lastObject];
                [v40 timestamp];
                v42 = __int16 v41 = v9;
                uint64_t v35 = [(PLSearchIndexingNormalizedWorkItem *)v37 initWithIdentifier:v38 jobType:v15 jobFlags:v34 entityToIndex:v39 timestamp:v42];

                normalizedWorkItemsByIdentifiers = self->_normalizedWorkItemsByIdentifiers;
                id v44 = [v41 identifier];
                [(NSMutableDictionary *)normalizedWorkItemsByIdentifiers setObject:v35 forKeyedSubscript:v44];

                id v45 = self->_identifiers;
                uint64_t v46 = [v41 identifier];
                uint64_t v14 = v59;
                [(NSMutableSet *)v45 addObject:v46];

                uint64_t v7 = v52;
                uint64_t v6 = v54;
                uint64_t v8 = v57;
LABEL_45:
                long long v36 = v58;
                goto LABEL_46;
              }
            }
          }
          uint64_t v35 = PLSearchBackendIndexingEngineGetLog();
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            goto LABEL_45;
          }
          *(_DWORD *)buf = 138543618;
          uint64_t v71 = (uint64_t)v9;
          __int16 v72 = 2112;
          long long v36 = v58;
          id v73 = v58;
          _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "Failed to fetch work items for coalescing, skipping item %{public}@, error: %@", buf, 0x16u);
LABEL_46:
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v65 objects:v74 count:16];
      if (!v6)
      {
LABEL_49:

        uint64_t v47 = (NSArray *)[v53 copy];
        coalescedWorkItems = self->_coalescedWorkItems;
        self->_coalescedWorkItems = v47;

        goto LABEL_50;
      }
    }
  }
  objc_storeStrong((id *)&self->_coalescedWorkItems, self->_workItems);
LABEL_50:
}

- (void)_inPerformBlock_removeWorkItemsNotMatchingOriginalFlags
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = self->_workItems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v10 = PLBackgroundJobSearchIndexingEntitiesFromJobFlags(objc_msgSend(v9, "jobFlags", (void)v21));
        BOOL v11 = [(PLSearchIndexingIncrementalUpdateBatch *)self _flagsAreAmbiguous];
        unint64_t v12 = [v10 count];
        if (v11)
        {
          if (v12 > 1) {
            goto LABEL_13;
          }
        }
        else
        {
          if (v12 == 1)
          {
            v13 = [v10 firstObject];
            uint64_t v14 = [v13 unsignedIntegerValue];
          }
          else
          {
            uint64_t v14 = 0;
          }
          if ([(PLSearchIndexingIncrementalUpdateBatch *)self targetEntity] == v14) {
LABEL_13:
          }
            [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v6);
  }

  uint64_t v15 = [v3 count];
  if (v15 != [(NSArray *)self->_workItems count])
  {
    v16 = PLSearchBackendIndexingEngineGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      NSUInteger v17 = [(NSArray *)self->_workItems count];
      uint64_t v18 = [v3 count];
      *(_DWORD *)buf = 134217984;
      NSUInteger v26 = v17 - v18;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Search indexing batch initialized with work items that don't match the batch job flags, %lu items have been removed and will be processed in a future batch", buf, 0xCu);
    }

    id v19 = (NSArray *)[v3 copy];
    workItems = self->_workItems;
    self->_workItems = v19;
  }
}

- (BOOL)_flagsAreAmbiguous
{
  return [(NSArray *)self->_possibleEntities count] > 1;
}

- (BOOL)_flagsAreIncompatible
{
  return ![(NSArray *)self->_possibleEntities count] && self->_originalFlags != 1;
}

- (unint64_t)targetEntity
{
  if ([(NSArray *)self->_possibleEntities count] != 1) {
    return 0;
  }
  id v3 = [(NSArray *)self->_possibleEntities firstObject];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (BOOL)hasDonations
{
  id v3 = [(PLSearchIndexingIncrementalUpdateBatch *)self eligibleManagedObjects];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(PLSearchIndexingIncrementalUpdateBatch *)self ineligibleIdentifiers];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (PLSearchIndexingIncrementalUpdateBatch)initWithWorkItems:(id)a3 flags:(int64_t)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLSearchIndexingIncrementalUpdateBatch;
  uint64_t v8 = [(PLSearchIndexingIncrementalUpdateBatch *)&v17 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_workItems, a3);
    v9->_originalFlags = a4;
    uint64_t v10 = PLBackgroundJobSearchIndexingEntitiesFromJobFlags(a4);
    possibleEntities = v9->_possibleEntities;
    v9->_possibleEntities = (NSArray *)v10;

    unint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    normalizedWorkItemsByIdentifiers = v9->_normalizedWorkItemsByIdentifiers;
    v9->_normalizedWorkItemsByIdentifiers = v12;

    uint64_t v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    identifiers = v9->_identifiers;
    v9->_identifiers = v14;
  }
  return v9;
}

@end
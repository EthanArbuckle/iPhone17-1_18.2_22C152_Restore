@interface PLScopedSearchUtilities
+ (BOOL)groupDuplicateOrSynonymExistsForGroup:(id)a3 inGroups:(id)a4;
+ (BOOL)shouldUseExactMatchResultsForGroups:(id)a3;
+ (__CFArray)_sortCFArrayOfPSIIdentifiers:(__CFArray *)a3;
+ (id)UUIDsFromSearchIndexIds:(__CFArray *)a3 searchIndexIdsToUUIDs:(id)a4 searchResultType:(unint64_t)a5 delegate:(id)a6;
+ (id)_UUIDsForGroup:(id)a3 searchResultsType:(unint64_t)a4 delegate:(id)a5;
+ (id)filterArrayOfGroupsArraysForEqualMatchType:(id)a3 searchTokens:(id)a4;
+ (id)generateFruitfulMatchedGroupsFromAllMatchedGroups:(id)a3 queryMatchedScopedAssetUUIDs:(id)a4 queryMatchedScopedCollectionUUIDs:(id)a5 searchResultTypes:(unint64_t)a6 delegate:(id)a7;
+ (id)groupDictionariesFromArrayOfGroupsArrays:(id)a3;
+ (id)removeGroupsWithNonExactMatchTextFromGroups:(id)a3 searchText:(id)a4;
+ (id)removeSynonymsOfOtherGroupsInGroups:(id)a3;
+ (void)_recursivelyIntersectGroups:(id)a3 searchResultTypes:(unint64_t)a4 query:(id)a5 groupArrayIndex:(unint64_t)a6 iterationCount:(unint64_t)a7 iterationIdIntersections:(__CFArray *)a8 finalIdIntersections:(__CFArray *)a9 finalExactMatchIdIntersections:(__CFArray *)a10 iterationGroups:(id *)a11 finalGroups:(id)a12 allMatchedGroups:(id)a13;
+ (void)intersectGroups:(id)a3 searchResultTypes:(unint64_t)a4 shouldGenerateCompletionCandidates:(BOOL)a5 query:(id)a6 completion:(id)a7;
+ (void)intersectSortedArray:(const __CFArray *)a3 withOtherSortedArray:(__CFArray *)a4 intersectionLimit:(unint64_t)a5;
+ (void)searchIndexIdsFromUUIDs:(id)a3 searchResultTypes:(unint64_t)a4 psiDatabase:(id)a5 completion:(id)a6;
@end

@implementation PLScopedSearchUtilities

+ (void)intersectSortedArray:(const __CFArray *)a3 withOtherSortedArray:(__CFArray *)a4 intersectionLimit:(unint64_t)a5
{
  CFArrayRef v7 = *a3;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  CFArrayRef v35 = v7;
  if (v7)
  {
    CFIndex Count = CFArrayGetCount(v7);
    if (!a4) {
      goto LABEL_72;
    }
  }
  else
  {
    CFIndex Count = 0;
    if (!a4) {
      goto LABEL_72;
    }
  }
  CFIndex v9 = CFArrayGetCount(a4);
  if (Count)
  {
    uint64_t v10 = v9;
    if (v9)
    {
      if (Count >= 1 && v9 >= 1)
      {
        v11 = a4;
        v12 = 0;
        v13 = 0;
        char v14 = 0;
        CFIndex v15 = 0;
        CFIndex v16 = 0;
        unint64_t v36 = a5 - 1;
        uint64_t v17 = 8;
        CFArrayRef theArray = v35;
        do
        {
          if ((v14 & 1) == 0)
          {
            if (!v17)
            {
              if (v13 && v12) {
                __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 154, "seeking && !needsSeekStrategy");
              }
              goto LABEL_82;
            }
            v21 = v13;
            CFIndex v20 = v16;
            uint64_t v19 = Count;
            goto LABEL_34;
          }
          if (v13)
          {
            if (!v12) {
              goto LABEL_64;
            }
          }
          else
          {
            v28 = v11;
            ValueAtIndex = CFArrayGetValueAtIndex(theArray, v16);
            v11 = v28;
            v13 = ValueAtIndex;
            if (!v12)
            {
LABEL_64:
              v30 = v11;
              v31 = CFArrayGetValueAtIndex(v11, v15);
              v11 = v30;
              v12 = v31;
            }
          }
          BOOL v18 = v12 >= v13;
          if (v12 < v13) {
            uint64_t v19 = v10;
          }
          else {
            uint64_t v19 = Count;
          }
          if (v12 >= v13)
          {
            CFIndex v20 = v16;
          }
          else
          {
            uint64_t v10 = Count;
            CFIndex v20 = v15;
          }
          if (v12 >= v13)
          {
            v21 = v13;
          }
          else
          {
            CFIndex v15 = v16;
            v21 = v12;
          }
          if (v12 < v13) {
            v12 = v13;
          }
          CFArrayRef v22 = theArray;
          if (v18) {
            v23 = v11;
          }
          else {
            v23 = theArray;
          }
          if (!v18) {
            CFArrayRef v22 = v11;
          }
          CFArrayRef theArray = v22;
          if (v12 < v21) {
            __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 116, "elemB >= elemA");
          }
          if (v19 >= 9)
          {
            CFArrayRef v25 = Mutable;
            unint64_t v24 = v12 - v21;
            if (log((double)v19) < (double)v24)
            {
              if (v21 && v12)
              {
                v40.length = v19 - v20;
                v40.location = v20;
                CFIndex v32 = CFArrayBSearchValues(theArray, v40, v12, (CFComparatorFunction)PSIRowIDCompare, 0);
                if (v32 < v19)
                {
                  CFIndex v16 = v32;
                  v33 = CFArrayGetValueAtIndex(theArray, v32);
                  if (v12 == v33)
                  {
                    char v14 = 0;
                    v11 = v23;
                    CFIndex Count = v19;
                    uint64_t v17 = 8;
                    v13 = v12;
                  }
                  else
                  {
                    v13 = v33;
                    if (v12 >= v33) {
                      __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 167, "elemA > elemB");
                    }
                    uint64_t v17 = 0;
                    char v14 = 1;
                    v11 = v23;
                    CFIndex Count = v19;
                  }
                  continue;
                }
                break;
              }
LABEL_82:
              __assert_rtn("sortedArrayIntersection", "PSIUtilities.h", 153, "elemA && elemB");
            }
            v11 = v23;
            uint64_t v17 = 8;
            goto LABEL_35;
          }
          v11 = v23;
          uint64_t v17 = 8;
LABEL_34:
          CFArrayRef v25 = Mutable;
LABEL_35:
          char v14 = 1;
          if (v20 >= v19) {
            goto LABEL_59;
          }
          CFArrayRef v26 = v11;
          if (v15 >= v10) {
            goto LABEL_58;
          }
          while (v17)
          {
            if (v21)
            {
              if (v12) {
                goto LABEL_40;
              }
            }
            else
            {
              v21 = CFArrayGetValueAtIndex(theArray, v20);
              if (v12) {
                goto LABEL_40;
              }
            }
            v12 = CFArrayGetValueAtIndex(v26, v15);
LABEL_40:
            if (v21 < v12)
            {
              v21 = 0;
              ++v20;
LABEL_44:
              --v17;
              goto LABEL_52;
            }
            if (v21 > v12)
            {
              v12 = 0;
              ++v15;
              goto LABEL_44;
            }
            if (v25) {
              unint64_t v27 = CFArrayGetCount(v25);
            }
            else {
              unint64_t v27 = 0;
            }
            if (v36 < v27) {
              goto LABEL_72;
            }
            CFArrayRef v25 = Mutable;
            CFArrayAppendValue(Mutable, v21);
            v21 = 0;
            v12 = 0;
            ++v20;
            ++v15;
LABEL_52:
            char v14 = 1;
            if (v20 >= v19 || v15 >= v10) {
              goto LABEL_58;
            }
          }
          uint64_t v17 = -1;
          char v14 = 1;
LABEL_58:
          v11 = v26;
LABEL_59:
          CFIndex Count = v19;
          CFIndex v16 = v20;
          v13 = v21;
        }
        while (v16 < Count && v15 < v10);
      }
    }
  }
LABEL_72:
  *a3 = Mutable;
  if (v35)
  {
    CFRelease(v35);
  }
}

+ (id)_UUIDsForGroup:(id)a3 searchResultsType:(unint64_t)a4 delegate:(id)a5
{
  char v6 = a4;
  char v7 = ~(_BYTE)a4;
  id v8 = a3;
  id v9 = a5;
  if ((v7 & 3) == 0) {
    goto LABEL_2;
  }
  if ((v6 & 1) == 0)
  {
    if ((v6 & 2) == 0
      || ![v8 collectionIds]
      || CFArrayGetCount((CFArrayRef)[v8 collectionIds]))
    {
      uint64_t v10 = objc_msgSend(v9, "collectionUUIDsForCollectionIDs:", objc_msgSend(v8, "collectionIds"));
      goto LABEL_11;
    }
LABEL_2:
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] set];
    goto LABEL_11;
  }
  if ([v8 assetIds] && !CFArrayGetCount((CFArrayRef)objc_msgSend(v8, "assetIds"))) {
    goto LABEL_2;
  }
  uint64_t v10 = objc_msgSend(v9, "assetUUIDsForAssetIDs:", objc_msgSend(v8, "assetIds"));
LABEL_11:
  v11 = (void *)v10;

  return v11;
}

+ (id)groupDictionariesFromArrayOfGroupsArrays:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v3;
  uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v5;
        char v6 = *(void **)(*((void *)&v29 + 1) + 8 * v5);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v26 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              uint64_t v14 = [v12 contentString];
              CFIndex v15 = (void *)v14;
              if (v14) {
                CFIndex v16 = (__CFString *)v14;
              }
              else {
                CFIndex v16 = &stru_1EEB2EB80;
              }
              [v13 setObject:v16 forKeyedSubscript:@"content_string"];

              uint64_t v17 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v12, "category"));
              [v13 setObject:v17 forKeyedSubscript:@"category"];

              BOOL v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "groupId"));
              [v13 setObject:v18 forKeyedSubscript:@"row_id"];

              [v4 addObject:v13];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }

  uint64_t v19 = [v4 allObjects];

  return v19;
}

+ (id)generateFruitfulMatchedGroupsFromAllMatchedGroups:(id)a3 queryMatchedScopedAssetUUIDs:(id)a4 queryMatchedScopedCollectionUUIDs:(id)a5 searchResultTypes:(unint64_t)a6 delegate:(id)a7
{
  char v8 = a6;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v47 = a4;
  id v46 = a5;
  id v51 = a7;
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v11;
  uint64_t v12 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v53 != v14) {
          objc_enumerationMutation(obj);
        }
        CFIndex v16 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v18 = [v16 contentString];
        uint64_t v19 = (void *)v18;
        if (v18) {
          CFIndex v20 = (__CFString *)v18;
        }
        else {
          CFIndex v20 = &stru_1EEB2EB80;
        }
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, @"content string", v46);

        uint64_t v21 = [v16 lookupIdentifier];
        uint64_t v22 = (void *)v21;
        if (v21) {
          uint64_t v23 = (__CFString *)v21;
        }
        else {
          uint64_t v23 = &stru_1EEB2EB80;
        }
        [v17 setObject:v23 forKeyedSubscript:@"lookup identifier"];

        uint64_t v24 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v16, "category"));
        [v17 setObject:v24 forKeyedSubscript:@"category"];

        if (v8)
        {
          long long v25 = [a1 _UUIDsForGroup:v16 searchResultsType:1 delegate:v51];
          long long v26 = (void *)[v25 mutableCopy];

          long long v27 = [MEMORY[0x1E4F1CAD0] setWithArray:v47];
          [v26 intersectSet:v27];

          uint64_t v28 = [v26 count];
          long long v29 = [NSNumber numberWithUnsignedInteger:v28];
          [v17 setObject:v29 forKeyedSubscript:@"asset count"];

          uint64_t v30 = [v26 allObjects];
          long long v31 = (void *)v30;
          if (v30) {
            uint64_t v32 = v30;
          }
          else {
            uint64_t v32 = MEMORY[0x1E4F1CBF0];
          }
          [v17 setObject:v32 forKeyedSubscript:@"asset UUIDs"];
        }
        if ((v8 & 2) != 0)
        {
          v33 = [a1 _UUIDsForGroup:v16 searchResultsType:2 delegate:v51];
          v34 = (void *)[v33 mutableCopy];

          uint64_t v35 = [MEMORY[0x1E4F1CAD0] setWithArray:v46];
          [v34 intersectSet:v35];

          uint64_t v36 = [v34 count];
          v37 = [NSNumber numberWithUnsignedInteger:v36];
          [v17 setObject:v37 forKeyedSubscript:@"collection count"];

          uint64_t v38 = [v34 allObjects];
          v39 = (void *)v38;
          if (v38) {
            uint64_t v40 = v38;
          }
          else {
            uint64_t v40 = MEMORY[0x1E4F1CBF0];
          }
          [v17 setObject:v40 forKeyedSubscript:@"collection UUIDs"];
        }
        v41 = [v16 contentString];
        if ([v41 length]) {
          [v16 contentString];
        }
        else {
        v42 = [v16 lookupIdentifier];
        }

        v56 = v42;
        id v57 = v17;
        v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        [v50 addObject:v43];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v13);
  }

  v44 = [v50 allObjects];

  return v44;
}

+ (__CFArray)_sortCFArrayOfPSIIdentifiers:(__CFArray *)a3
{
  if (a3)
  {
    v7.length = CFArrayGetCount(a3);
    v7.location = 0;
    CFArraySortValues(a3, v7, (CFComparatorFunction)PSIRowIDCompare, 0);
    return CFArrayCreateCopy(0, a3);
  }
  else
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    return CFArrayCreate(v5, 0, 0, 0);
  }
}

+ (BOOL)groupDuplicateOrSynonymExistsForGroup:(id)a3 inGroups:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  CFRange v7 = v6;
  if (!v5 || ![v6 count])
  {
    LOBYTE(v8) = 0;
    goto LABEL_25;
  }
  if ([v7 containsObject:v5])
  {
    LOBYTE(v8) = 1;
    goto LABEL_25;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v8 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v8) {
    goto LABEL_24;
  }
  uint64_t v10 = *(void *)v20;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v9);
      }
      uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      int IsSynonym = PLSearchIndexCategoryIsSynonym((int)objc_msgSend(v5, "category", (void)v19));
      if (PLSearchIndexCategoryIsSynonym((int)[v12 category]))
      {
        uint64_t v14 = [v12 owningGroupId];
        uint64_t v15 = [v5 groupId];
        if (v14 == v15) {
          char v16 = 0;
        }
        else {
          char v16 = IsSynonym;
        }
        if ((v16 & 1) == 0)
        {
          if (v14 == v15) {
            goto LABEL_23;
          }
          continue;
        }
      }
      else if (!IsSynonym)
      {
        continue;
      }
      uint64_t v17 = [v5 owningGroupId];
      if (v17 == [v12 groupId])
      {
LABEL_23:
        LOBYTE(v8) = 1;
        goto LABEL_24;
      }
    }
    uint64_t v8 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_24:

LABEL_25:
  return v8;
}

+ (id)UUIDsFromSearchIndexIds:(__CFArray *)a3 searchIndexIdsToUUIDs:(id)a4 searchResultType:(unint64_t)a5 delegate:(id)a6
{
  char v7 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  if (!v12)
  {
    long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"PLScopedSearchUtilities.m", 447, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
  }
  if ((~v7 & 3) != 0)
  {
    if (a3) {
      goto LABEL_5;
    }
  }
  else
  {
    long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"PLScopedSearchUtilities.m", 451, @"Invalid parameter not satisfying: %@", @"!(wantsAssetResults && wantsCollectionResults)" object file lineNumber description];

    if (a3)
    {
LABEL_5:
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v14 = a3;
      if ([v11 count])
      {
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        uint64_t v28 = v14;
        uint64_t v15 = v14;
        uint64_t v16 = [(__CFArray *)v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v30 != v18) {
                objc_enumerationMutation(v15);
              }
              long long v20 = [NSNumber numberWithUnsignedLongLong:*(void *)(*((void *)&v29 + 1) + 8 * i)];
              long long v21 = [v11 objectForKeyedSubscript:v20];

              if (v21) {
                [v13 addObject:v21];
              }
            }
            uint64_t v17 = [(__CFArray *)v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
          }
          while (v17);
        }

        uint64_t v14 = v28;
        goto LABEL_16;
      }
      if (v7)
      {
        uint64_t v23 = [v12 assetUUIDsForAssetIDs:v14];
      }
      else
      {
        if ((v7 & 2) == 0)
        {
LABEL_16:
          id v22 = v13;
LABEL_22:

          goto LABEL_25;
        }
        uint64_t v23 = [v12 collectionUUIDsForCollectionIDs:v14];
      }
      uint64_t v24 = v23;
      id v22 = [v23 allObjects];

      goto LABEL_22;
    }
  }
  id v22 = (id)MEMORY[0x1E4F1CBF0];
LABEL_25:

  return v22;
}

+ (void)searchIndexIdsFromUUIDs:(id)a3 searchResultTypes:(unint64_t)a4 psiDatabase:(id)a5 completion:(id)a6
{
  char v8 = a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t, uint64_t, uint64_t, void *))a6;
  if (!v12)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PLScopedSearchUtilities.m", 412, @"Invalid parameter not satisfying: %@", @"psiDatabase" object file lineNumber description];
  }
  if ([v11 count])
  {
    uint64_t v35 = 0;
    uint64_t v36 = &v35;
    uint64_t v37 = 0x2020000000;
    uint64_t v38 = 0;
    uint64_t v29 = 0;
    long long v30 = &v29;
    uint64_t v31 = 0x3032000000;
    long long v32 = __Block_byref_object_copy__9328;
    uint64_t v14 = (void *)MEMORY[0x1E4F1CC08];
    v33 = __Block_byref_object_dispose__9329;
    id v34 = (id)MEMORY[0x1E4F1CC08];
    if (v8)
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __92__PLScopedSearchUtilities_searchIndexIdsFromUUIDs_searchResultTypes_psiDatabase_completion___block_invoke;
      v28[3] = &unk_1E5864198;
      v28[4] = &v35;
      v28[5] = &v29;
      [v12 assetIdsFromUUIDs:v11 completion:v28];
    }
    uint64_t v24 = 0;
    long long v25 = &v24;
    uint64_t v26 = 0x2020000000;
    uint64_t v27 = 0;
    uint64_t v18 = 0;
    long long v19 = &v18;
    uint64_t v20 = 0x3032000000;
    long long v21 = __Block_byref_object_copy__9328;
    id v22 = __Block_byref_object_dispose__9329;
    id v23 = v14;
    if ((v8 & 2) != 0)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __92__PLScopedSearchUtilities_searchIndexIdsFromUUIDs_searchResultTypes_psiDatabase_completion___block_invoke_2;
      v17[3] = &unk_1E5864198;
      v17[4] = &v24;
      v17[5] = &v18;
      [v12 collectionIdsFromUUIDs:v11 completion:v17];
      uint64_t v15 = v25[3];
      uint64_t v14 = (void *)v19[5];
    }
    else
    {
      uint64_t v15 = 0;
    }
    v13[2](v13, v36[3], v15, v30[5], v14);
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v29, 8);

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    v13[2](v13, 0, 0, MEMORY[0x1E4F1CC08], (void *)MEMORY[0x1E4F1CC08]);
  }
}

void __92__PLScopedSearchUtilities_searchIndexIdsFromUUIDs_searchResultTypes_psiDatabase_completion___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __92__PLScopedSearchUtilities_searchIndexIdsFromUUIDs_searchResultTypes_psiDatabase_completion___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

+ (id)removeSynonymsOfOtherGroupsInGroups:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v28 = v3;
    id obj = v3;
    uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v32)
    {
      uint64_t v30 = *(void *)v40;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v40 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = v4;
          id v5 = *(void **)(*((void *)&v39 + 1) + 8 * v4);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v6 = v31;
          uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v36;
            id v34 = v6;
LABEL_9:
            uint64_t v10 = 0;
            while (1)
            {
              if (*(void *)v36 != v9) {
                objc_enumerationMutation(v34);
              }
              id v11 = *(void **)(*((void *)&v35 + 1) + 8 * v10);
              uint64_t v12 = [v5 groupId];
              uint64_t v13 = [v11 owningGroupId];
              uint64_t v14 = [v5 owningGroupId];
              uint64_t v15 = [v11 groupId];
              if ([v5 owningGroupId])
              {
                uint64_t v16 = [v5 owningGroupId];
                BOOL v17 = v16 == [v11 owningGroupId];
              }
              else
              {
                BOOL v17 = 0;
              }
              BOOL v18 = v12 == v13 || v14 == v15;
              if (v18 || v17) {
                break;
              }
              if (v8 == ++v10)
              {
                id v6 = v34;
                uint64_t v8 = [v34 countByEnumeratingWithState:&v35 objects:v43 count:16];
                if (v8) {
                  goto LABEL_9;
                }
                goto LABEL_22;
              }
            }
            id v19 = v11;
            id v6 = v34;

            if (!v19) {
              goto LABEL_26;
            }
            uint64_t v20 = [v5 contentString];
            unint64_t v21 = [v20 length];

            id v22 = [v19 contentString];
            unint64_t v23 = [v22 length];

            if (v23 > v21)
            {
              [v34 removeObject:v19];
              goto LABEL_26;
            }
            uint64_t v24 = v33;
          }
          else
          {
LABEL_22:

            id v19 = 0;
LABEL_26:
            uint64_t v24 = v33;
            [v6 addObject:v5];
          }

          uint64_t v4 = v24 + 1;
        }
        while (v4 != v32);
        uint64_t v25 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
        uint64_t v32 = v25;
      }
      while (v25);
    }

    uint64_t v26 = (void *)[v31 copy];
    id v3 = v28;
  }
  else
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
  }

  return v26;
}

+ (id)filterArrayOfGroupsArraysForEqualMatchType:(id)a3 searchTokens:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v6 count])
  {
    uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, a1, @"PLScopedSearchUtilities.m", 309, @"Invalid parameter not satisfying: %@", @"arrayOfGroupsArrays.count > 0" object file lineNumber description];
  }
  if (![v7 count])
  {
    id v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, a1, @"PLScopedSearchUtilities.m", 310, @"Invalid parameter not satisfying: %@", @"searchTokens.count > 0" object file lineNumber description];
  }
  uint64_t v8 = [v6 count];
  if (v8 != [v7 count])
  {
    long long v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, a1, @"PLScopedSearchUtilities.m", 311, @"Invalid parameter not satisfying: %@", @"arrayOfGroupsArrays.count == searchTokens.count" object file lineNumber description];
  }
  uint64_t v9 = [v6 count];
  if (v9 != [v7 count])
  {
    long long v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, a1, @"PLScopedSearchUtilities.m", 317, @"Invalid parameter not satisfying: %@", @"arrayOfGroupsArrays.count == searchTokens.count" object file lineNumber description];
  }
  if (![v6 count] || !objc_msgSend(v7, "count"))
  {
    uint64_t v30 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "Unexpectedly encountered arrayOfGroupsArrays and search tokens array with different counts, unable to filter arrayOfGroupsArrays for equal match type", buf, 2u);
    }
    id v31 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_44;
  }
  long long v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (![v7 count]) {
    goto LABEL_40;
  }
  uint64_t v10 = 0;
  long long v39 = v7;
  id v40 = v6;
  while (2)
  {
    id v11 = [v7 objectAtIndexedSubscript:v10];
    uint64_t v41 = v10;
    uint64_t v12 = [v6 objectAtIndexedSubscript:v10];
    id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (!v14) {
      goto LABEL_33;
    }
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(v13);
        }
        BOOL v18 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v19 = [v11 identifier];
        if ([v19 length])
        {
          uint64_t v20 = [v11 identifier];
          unint64_t v21 = [v18 lookupIdentifier];
          int v22 = [v20 isEqualToString:v21];

          if (v22)
          {
            [v42 addObject:v18];
            unint64_t v23 = v18;
            uint64_t v24 = 3;
            goto LABEL_30;
          }
        }
        else
        {
        }
        uint64_t v25 = [v11 normalizedText];
        if ([v25 length])
        {
          uint64_t v26 = [v11 normalizedText];
          uint64_t v27 = [v18 normalizedString];
          int v28 = [v26 isEqualToString:v27];

          if (v28)
          {
            if ([v11 matchType] == 2)
            {
              [v18 setMatchTypeForQuery:2];
              [v42 addObject:v18];
              continue;
            }
            unint64_t v23 = v18;
            uint64_t v24 = 1;
            goto LABEL_30;
          }
        }
        else
        {
        }
        if ([v11 matchType] == 2) {
          continue;
        }
        unint64_t v23 = v18;
        uint64_t v24 = 0;
LABEL_30:
        [v23 setMatchTypeForQuery:v24];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v15);
LABEL_33:

    if ([v42 count])
    {
      [v38 addObject:v42];
    }
    else if ([v11 matchType] != 2)
    {
      uint64_t v29 = [a1 removeSynonymsOfOtherGroupsInGroups:v13];
      [v38 addObject:v29];
    }
    if ([v42 count] || objc_msgSend(v11, "matchType") != 2)
    {

      uint64_t v10 = v41 + 1;
      id v7 = v39;
      id v6 = v40;
      if (v41 + 1 >= (unint64_t)[v39 count])
      {
LABEL_40:
        uint64_t v30 = v38;
        id v31 = [v38 copy];
        goto LABEL_44;
      }
      continue;
    }
    break;
  }

  id v31 = (id)MEMORY[0x1E4F1CBF0];
  id v7 = v39;
  id v6 = v40;
  uint64_t v30 = v38;
LABEL_44:

  return v31;
}

+ (id)removeGroupsWithNonExactMatchTextFromGroups:(id)a3 searchText:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __82__PLScopedSearchUtilities_removeGroupsWithNonExactMatchTextFromGroups_searchText___block_invoke;
  uint64_t v16 = &unk_1E5864170;
  id v17 = v5;
  id v18 = v8;
  id v9 = v8;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:&v13];

  id v11 = objc_msgSend(v9, "copy", v13, v14, v15, v16);
  return v11;
}

void __82__PLScopedSearchUtilities_removeGroupsWithNonExactMatchTextFromGroups_searchText___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 normalizedString];
  uint64_t v4 = [v3 localizedCaseInsensitiveCompare:*(void *)(a1 + 32)];

  if (!v4) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

+ (BOOL)shouldUseExactMatchResultsForGroups:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 count])
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PLScopedSearchUtilities.m", 261, @"Invalid parameter not satisfying: %@", @"groups.count > 0" object file lineNumber description];
  }
  if ([v5 count])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    [v6 addIndex:1203];
    [v6 addIndex:1204];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v7);
          }
          uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v14 isExactMatchForQuery])
          {
            ++v11;
            if ([v14 matchTypeForQuery] == 1) {
              v10 += objc_msgSend(v6, "containsIndex:", (int)objc_msgSend(v14, "category")) ^ 1;
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
    }

    BOOL v15 = [v7 count] == v11 || v10 != 0;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

+ (void)_recursivelyIntersectGroups:(id)a3 searchResultTypes:(unint64_t)a4 query:(id)a5 groupArrayIndex:(unint64_t)a6 iterationCount:(unint64_t)a7 iterationIdIntersections:(__CFArray *)a8 finalIdIntersections:(__CFArray *)a9 finalExactMatchIdIntersections:(__CFArray *)a10 iterationGroups:(id *)a11 finalGroups:(id)a12 allMatchedGroups:(id)a13
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v70 = a5;
  id v19 = a12;
  id v68 = a13;
  if ([v18 count])
  {
    if (a8) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v54 = [MEMORY[0x1E4F28B00] currentHandler];
    [v54 handleFailureInMethod:a2, a1, @"PLScopedSearchUtilities.m", 101, @"Invalid parameter not satisfying: %@", @"arrayOfGroupArrays.count > 0" object file lineNumber description];

    if (a8) {
      goto LABEL_3;
    }
  }
  long long v55 = [MEMORY[0x1E4F28B00] currentHandler];
  [v55 handleFailureInMethod:a2, a1, @"PLScopedSearchUtilities.m", 102, @"Invalid parameter not satisfying: %@", @"iterationIdIntersections" object file lineNumber description];

LABEL_3:
  if (!a11)
  {
    v56 = [MEMORY[0x1E4F28B00] currentHandler];
    [v56 handleFailureInMethod:a2, a1, @"PLScopedSearchUtilities.m", 103, @"Invalid parameter not satisfying: %@", @"iterationGroups" object file lineNumber description];
  }
  long long v20 = a10;
  if (!a9)
  {
    id v57 = [MEMORY[0x1E4F28B00] currentHandler];
    [v57 handleFailureInMethod:a2, a1, @"PLScopedSearchUtilities.m", 104, @"Invalid parameter not satisfying: %@", @"finalIdIntersections" object file lineNumber description];

    long long v20 = a10;
  }
  v64 = v20;
  if (!v20)
  {
    v58 = [MEMORY[0x1E4F28B00] currentHandler];
    [v58 handleFailureInMethod:a2, a1, @"PLScopedSearchUtilities.m", 105, @"Invalid parameter not satisfying: %@", @"finalExactMatchIdIntersections" object file lineNumber description];
  }
  if (v68)
  {
    if (a4) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v59 = [MEMORY[0x1E4F28B00] currentHandler];
    [v59 handleFailureInMethod:a2, a1, @"PLScopedSearchUtilities.m", 106, @"Invalid parameter not satisfying: %@", @"allMatchedGroups" object file lineNumber description];

    if (a4) {
      goto LABEL_11;
    }
  }
  v60 = [MEMORY[0x1E4F28B00] currentHandler];
  [v60 handleFailureInMethod:a2, a1, @"PLScopedSearchUtilities.m", 107, @"Invalid parameter not satisfying: %@", @"searchResultTypes != (PLSearchResultTypeAsset & PLSearchResultTypeCollection)" object file lineNumber description];

LABEL_11:
  if ([v18 count] > a6)
  {
    long long v21 = [v18 objectAtIndexedSubscript:a6];
    if (![v21 count])
    {
      CFArrayRemoveAllValues(a9);
      CFArrayRemoveAllValues(v64);
      long long v53 = v19;
      goto LABEL_85;
    }
    if ([v21 count])
    {
      unint64_t v22 = 0;
      CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      v67 = v21;
      unint64_t v61 = a6 + 1;
      id v62 = v18;
      unint64_t v69 = a6;
      do
      {
        if ([v70 isCanceled])
        {
          CFArrayRemoveAllValues(a9);
          CFArrayRemoveAllValues(v64);
          long long v53 = v19;
LABEL_85:
          [v53 removeAllObjects];
          [v68 removeAllObjects];
          break;
        }
        if (!a6)
        {
          [*a11 removeAllObjects];
          CFArrayRemoveAllValues(*a8);
          a7 = v22;
        }
        unint64_t v23 = [v21 objectAtIndexedSubscript:v22];
        uint64_t v24 = v23;
        if (a4) {
          CFArrayRef v25 = (const __CFArray *)[v23 assetIds];
        }
        else {
          CFArrayRef v25 = (const __CFArray *)[v23 collectionIds];
        }
        CFArrayRef v26 = v25;
        v72 = v24;
        if (v25) {
          CFIndex Count = CFArrayGetCount(v25);
        }
        else {
          CFIndex Count = 0;
        }
        CFIndex v28 = CFArrayGetCount(*a8);
        cf = CFArrayCreateMutableCopy(allocator, v28, *a8);
        id v29 = objc_alloc(MEMORY[0x1E4F1CA48]);
        uint64_t v30 = (void *)[*a11 mutableCopy];
        id v73 = (id)[v29 initWithArray:v30];

        if (v28)
        {
          +[PLScopedSearchUtilities intersectSortedArray:a8 withOtherSortedArray:v26 intersectionLimit:0];
          a6 = v69;
          id v31 = v72;
        }
        else
        {
          a6 = v69;
          id v31 = v72;
          if (Count)
          {
            v85.location = 0;
            v85.length = Count;
            CFArrayAppendArray(*a8, v26, v85);
          }
        }
        BOOL v32 = +[PLScopedSearchUtilities groupDuplicateOrSynonymExistsForGroup:v31 inGroups:*a11];
        if (*a8)
        {
          if (CFArrayGetCount(*a8)) {
            int v33 = !v32;
          }
          else {
            int v33 = 0;
          }
          if (v33 == 1 && Count) {
            [*a11 addObject:v31];
          }
          if ([v18 count] - 1 == a6)
          {
            if (v33)
            {
              [v19 addObject:v31];
              [v31 updateWithIntersectedIds:*a8 searchResultType:a4];
              [v68 addObjectsFromArray:*a11];
              id v34 = *a8;
              v86.length = CFArrayGetCount(*a8);
              v86.location = 0;
              CFArrayAppendArray(a9, v34, v86);
              long long v80 = 0u;
              long long v81 = 0u;
              long long v78 = 0u;
              long long v79 = 0u;
              id v35 = *a11;
              uint64_t v36 = [v35 countByEnumeratingWithState:&v78 objects:v83 count:16];
              if (v36)
              {
                uint64_t v37 = v36;
                uint64_t v38 = 0;
                uint64_t v39 = *(void *)v79;
                do
                {
                  for (uint64_t i = 0; i != v37; ++i)
                  {
                    if (*(void *)v79 != v39) {
                      objc_enumerationMutation(v35);
                    }
                    v38 += [*(id *)(*((void *)&v78 + 1) + 8 * i) isExactMatchForQuery];
                  }
                  uint64_t v37 = [v35 countByEnumeratingWithState:&v78 objects:v83 count:16];
                }
                while (v37);
              }
              else
              {
                uint64_t v38 = 0;
              }

              BOOL v42 = v38 == [*a11 count];
              a6 = v69;
              id v31 = v72;
              if (v42)
              {
                long long v43 = *a8;
                v87.length = CFArrayGetCount(*a8);
                v87.location = 0;
                CFArrayAppendArray(v64, v43, v87);
              }
            }
LABEL_58:
            long long v21 = v67;
            if (v22 == [v67 count] - 1)
            {
              [v73 removeLastObject];
              *a11 = v73;
              CFArrayRemoveAllValues(*a8);
              long long v76 = 0u;
              long long v77 = 0u;
              long long v74 = 0u;
              long long v75 = 0u;
              id v44 = *a11;
              uint64_t v45 = [v44 countByEnumeratingWithState:&v74 objects:v82 count:16];
              if (v45)
              {
                uint64_t v46 = v45;
                uint64_t v47 = *(void *)v75;
                do
                {
                  for (uint64_t j = 0; j != v46; ++j)
                  {
                    if (*(void *)v75 != v47) {
                      objc_enumerationMutation(v44);
                    }
                    uint64_t v49 = *(void **)(*((void *)&v74 + 1) + 8 * j);
                    if (a4) {
                      CFArrayRef v50 = (const __CFArray *)[v49 assetIds];
                    }
                    else {
                      CFArrayRef v50 = (const __CFArray *)[v49 collectionIds];
                    }
                    CFArrayRef v51 = v50;
                    if (v50) {
                      CFIndex v52 = CFArrayGetCount(v50);
                    }
                    else {
                      CFIndex v52 = 0;
                    }
                    if (CFArrayGetCount(*a8))
                    {
                      +[PLScopedSearchUtilities intersectSortedArray:a8 withOtherSortedArray:v51 intersectionLimit:0];
                    }
                    else
                    {
                      v88.location = 0;
                      v88.length = v52;
                      CFArrayAppendArray(*a8, v51, v88);
                    }
                  }
                  uint64_t v46 = [v44 countByEnumeratingWithState:&v74 objects:v82 count:16];
                }
                while (v46);
              }

              id v18 = v62;
              a6 = v69;
              long long v21 = v67;
              uint64_t v41 = cf;
              id v31 = v72;
              if (!cf) {
                goto LABEL_81;
              }
            }
            else
            {
              if (*a8) {
                CFRelease(*a8);
              }
              uint64_t v41 = cf;
              *a8 = cf;
              CFRetain(cf);
              *a11 = v73;
              if (!cf) {
                goto LABEL_81;
              }
            }
            goto LABEL_80;
          }
          if (v33)
          {
            [a1 _recursivelyIntersectGroups:v18 searchResultTypes:a4 query:v70 groupArrayIndex:v61 iterationCount:a7 iterationIdIntersections:a8 finalIdIntersections:a9 finalExactMatchIdIntersections:v64 iterationGroups:a11 finalGroups:v19 allMatchedGroups:v68];
            long long v21 = v67;
            uint64_t v41 = cf;
            if (!cf) {
              goto LABEL_81;
            }
            goto LABEL_80;
          }
        }
        else if ([v18 count] - 1 == a6)
        {
          goto LABEL_58;
        }
        if (*a8) {
          CFRelease(*a8);
        }
        uint64_t v41 = cf;
        *a8 = cf;
        CFRetain(cf);
        *a11 = v73;
        long long v21 = v67;
        if (!cf) {
          goto LABEL_81;
        }
LABEL_80:
        CFRelease(v41);
LABEL_81:

        ++v22;
      }
      while (v22 < [v21 count]);
    }
  }
}

+ (void)intersectGroups:(id)a3 searchResultTypes:(unint64_t)a4 shouldGenerateCompletionCandidates:(BOOL)a5 query:(id)a6 completion:(id)a7
{
  BOOL v34 = a5;
  id v12 = a3;
  id v36 = a6;
  id v13 = a7;
  uint64_t v37 = v12;
  if ([v12 count])
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, a1, @"PLScopedSearchUtilities.m", 27, @"Invalid parameter not satisfying: %@", @"arrayOfGroupArrays.count > 0" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  id v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, a1, @"PLScopedSearchUtilities.m", 28, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  int v33 = (void (**)(void, void, void, void, void))v13;
  if (!a4)
  {
    BOOL v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, a1, @"PLScopedSearchUtilities.m", 29, @"Invalid parameter not satisfying: %@", @"searchResultTypes != (PLSearchResultTypeAsset & PLSearchResultTypeCollection)" object file lineNumber description];
  }
  id v14 = a1;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0);
  CFMutableArrayRef v18 = CFArrayCreateMutable(v16, 0, 0);
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  CFMutableArrayRef v40 = CFArrayCreateMutable(v16, 0, 0);
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  PLPhotosSearchGetLog();
  long long v21 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v22 = os_signpost_id_generate(v21);

  unint64_t v23 = v21;
  uint64_t v24 = v23;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "PLSearchGroupIntersectionsSignpost", "", buf, 2u);
  }

  id v38 = v19;
  if (v34) {
    id v25 = v15;
  }
  else {
    id v25 = 0;
  }
  [v14 _recursivelyIntersectGroups:v37 searchResultTypes:a4 query:v36 groupArrayIndex:0 iterationCount:0 iterationIdIntersections:&v40 finalIdIntersections:Mutable finalExactMatchIdIntersections:v18 iterationGroups:&v38 finalGroups:v25 allMatchedGroups:v20];
  id v35 = v38;

  CFArrayRef v26 = +[PLScopedSearchUtilities _sortCFArrayOfPSIIdentifiers:Mutable];
  uint64_t v27 = +[PLScopedSearchUtilities _sortCFArrayOfPSIIdentifiers:v18];
  CFIndex v28 = v24;
  id v29 = v28;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v29, OS_SIGNPOST_INTERVAL_END, v22, "PLSearchGroupIntersectionsSignpost", "", buf, 2u);
  }

  CFRelease(v40);
  CFRelease(Mutable);
  CFRelease(v18);
  CFMutableArrayRef v40 = 0;
  ((void (**)(void, __CFArray *, __CFArray *, id, id))v33)[2](v33, v26, v27, v15, v20);
}

@end
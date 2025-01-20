@interface PGPeopleTitleUtility
+ (id)_placeDisplayNameForPeopleAddressNodeLabel:(id)a3 titleComponent:(id)a4 containsMe:(BOOL)a5;
+ (id)beautifiedLocationStringWithPersonNode:(id)a3 peopleAddressEdge:(id)a4 titleComponent:(id)a5 insertLineBreak:(BOOL)a6 allowFamilyHome:(BOOL)a7 serviceManager:(id)a8;
+ (id)nameFromPersonNode:(id)a3 serviceManager:(id)a4;
+ (id)nameStringForPersonNodes:(id)a3 includeMe:(BOOL)a4 allowUnnamed:(BOOL)a5 allowedGroupsFormat:(unint64_t)a6 insertLineBreaks:(BOOL)a7 serviceManager:(id)a8;
+ (id)nameStringForPersonNodes:(id)a3 includeMe:(BOOL)a4 insertLineBreaks:(BOOL)a5 serviceManager:(id)a6;
+ (id)peopleGroupNameForPersonNodes:(id)a3 allowedGroupsFormat:(unint64_t)a4;
+ (id)peopleGroupNameForPersonNodes:(id)a3 allowedGroupsFormat:(unint64_t)a4 fallbackToGeneric:(BOOL)a5;
@end

@implementation PGPeopleTitleUtility

+ (id)_placeDisplayNameForPeopleAddressNodeLabel:(id)a3 titleComponent:(id)a4 containsMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 isEqualToString:@"Home"])
  {
    v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"PGPeoplePlaceFormatHome" value:@"PGPeoplePlaceFormatHome" table:@"Localizable"];

    if (v5) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 3;
    }
    v12 = v8;
LABEL_9:
    [v12 setType:v11];
    goto LABEL_13;
  }
  if ([v7 isEqualToString:@"Work"])
  {
    v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v10 = [v13 localizedStringForKey:@"PGPeoplePlaceFormatWork" value:@"PGPeoplePlaceFormatWork" table:@"Localizable"];

    if (!v5) {
      goto LABEL_13;
    }
    v12 = v8;
    uint64_t v11 = 2;
    goto LABEL_9;
  }
  v10 = [v7 capitalizedString];
  v14 = +[PGLogging sharedLogging];
  v15 = [v14 loggingConnection];

  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v17 = 138412290;
    id v18 = v7;
    _os_log_error_impl(&dword_1D1805000, v15, OS_LOG_TYPE_ERROR, "Could not find place name for edge with label %@. Falling back to edge label", (uint8_t *)&v17, 0xCu);
  }

LABEL_13:
  return v10;
}

+ (id)nameFromPersonNode:(id)a3 serviceManager:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 contactIdentifier];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__69969;
  uint64_t v19 = __Block_byref_object_dispose__69970;
  id v20 = 0;
  if ([v7 length])
  {
    v21[0] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__PGPeopleTitleUtility_nameFromPersonNode_serviceManager___block_invoke;
    v14[3] = &unk_1E68EFCC0;
    v14[4] = &v15;
    [v6 enumeratePersonsForIdentifiers:v8 usingBlock:v14];
  }
  v9 = (void *)v16[5];
  if (!v9)
  {
    uint64_t v10 = [v5 name];
    uint64_t v11 = (void *)v16[5];
    v16[5] = v10;

    v9 = (void *)v16[5];
  }
  id v12 = v9;
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __58__PGPeopleTitleUtility_nameFromPersonNode_serviceManager___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  v3 = [v12 nickname];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    uint64_t v5 = [v12 nickname];
  }
  else
  {
    id v6 = [v12 firstName];

    if (v6)
    {
      uint64_t v5 = [v12 localizedShortName];
    }
    else
    {
      id v7 = [v12 fullName];
      uint64_t v8 = [v7 length];

      v9 = v12;
      if (!v8) {
        goto LABEL_8;
      }
      uint64_t v5 = [v12 fullName];
    }
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;

  v9 = v12;
LABEL_8:
}

+ (id)peopleGroupNameForPersonNodes:(id)a3 allowedGroupsFormat:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 count])
  {
    uint64_t v11 = +[PGLogging sharedLogging];
    id v7 = [v11 loggingConnection];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "+[PGPeopleTitleUtility peopleGroupNameForPersonNodes:allowedGroupsFormat:] personNodes.count == 0", buf, 2u);
    }
    goto LABEL_13;
  }
  char v37 = v4;
  id v6 = [v5 anyObject];
  id v7 = [v6 graph];

  if (!v7)
  {
    id v12 = +[PGLogging sharedLogging];
    p_super = [v12 loggingConnection];

    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, p_super, OS_LOG_TYPE_ERROR, "+[PGPeopleTitleUtility peopleGroupNameForPersonNodes:allowedGroupsFormat:] Nil graph", buf, 2u);
    }
    uint64_t v10 = 0;
    goto LABEL_51;
  }
  if ((v37 & 0xF) == 0 || ![v5 count])
  {
LABEL_13:
    uint64_t v10 = 0;
    goto LABEL_52;
  }
  uint64_t v8 = [(MAElementCollection *)[PGGraphPersonNodeCollection alloc] initWithSet:v5 graph:v7];
  v35 = +[PGGraphNodeCollection nodesInGraph:v7];
  if (![v35 count])
  {
    v14 = +[PGLogging sharedLogging];
    uint64_t v15 = [v14 loggingConnection];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "+[PGPeopleTitleUtility peopleGroupNameForPersonNodes:allowedGroupsFormat:] No me node found in graph, not using group name", buf, 2u);
    }
    uint64_t v10 = 0;
    goto LABEL_49;
  }
  v36 = [(MAElementCollection *)v8 collectionBySubtracting:v35];

  if ([(MAElementCollection *)v36 count] >= 2 || (v37 & 1) != 0)
  {
    v16 = +[PGGraphRelationshipEdge familyRelationshipLabels];
    uint64_t v17 = [MEMORY[0x1E4F28BD0] set];
    *(void *)buf = 0;
    v48 = buf;
    uint64_t v49 = 0x2020000000;
    uint64_t v50 = 0;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __74__PGPeopleTitleUtility_peopleGroupNameForPersonNodes_allowedGroupsFormat___block_invoke;
    v42[3] = &unk_1E68EFC98;
    id v43 = v35;
    id v18 = v16;
    v44 = v18;
    v46 = buf;
    id v19 = v17;
    id v45 = v19;
    [(MAElementCollection *)v36 enumerateIdentifiersAsCollectionsWithBlock:v42];
    v33 = v18;
    v34 = v19;
    if (!*((void *)v48 + 3))
    {
      uint64_t v10 = 0;
LABEL_48:

      _Block_object_dispose(buf, 8);
      uint64_t v8 = v36;
      uint64_t v15 = v33;
LABEL_49:

      v36 = v8;
      goto LABEL_50;
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v20 = v19;
    v21 = 0;
    unint64_t v22 = 0;
    uint64_t v23 = [v20 countByEnumeratingWithState:&v38 objects:v51 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v39 != v24) {
            objc_enumerationMutation(v20);
          }
          v26 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          unint64_t v27 = objc_msgSend(v20, "countForObject:", v26, v33, v34);
          if (v27 > v22)
          {
            id v28 = v26;

            v21 = v28;
            unint64_t v22 = v27;
          }
        }
        uint64_t v23 = [v20 countByEnumeratingWithState:&v38 objects:v51 count:16];
      }
      while (v23);
    }

    unint64_t v29 = *((void *)v48 + 3);
    if (v29 != v22 && (v29 < 4 || ceilf((float)v29 * 0.75) > (float)v22)) {
      goto LABEL_43;
    }
    if ((v37 & 2) != 0 && [v21 isEqualToString:@"FAMILY"])
    {
      v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v31 = [v30 localizedStringForKey:@"PGSocialGroupFormatTitleFamily" value:@"PGSocialGroupFormatTitleFamily" table:@"Localizable"];
    }
    else
    {
      if ((v37 & 4) != 0 && [v21 isEqualToString:@"PARTNER"])
      {
LABEL_45:
        v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v31 = [v30 localizedStringForKey:@"PGPeopleTitleFormatGenericSocialGroup" value:@"PGPeopleTitleFormatGenericSocialGroup" table:@"Localizable"];
        goto LABEL_46;
      }
      if ((v37 & 8) == 0 || ![v21 isEqualToString:@"FRIEND"])
      {
LABEL_43:
        if ((v37 & 1) == 0)
        {
          uint64_t v10 = 0;
LABEL_47:

          goto LABEL_48;
        }
        goto LABEL_45;
      }
      v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v31 = [v30 localizedStringForKey:@"PGSocialGroupFormatTitleFriends" value:@"PGSocialGroupFormatTitleFriends" table:@"Localizable"];
    }
LABEL_46:
    uint64_t v10 = (void *)v31;

    goto LABEL_47;
  }
  uint64_t v10 = 0;
LABEL_50:

  p_super = &v36->super.super.super.super;
LABEL_51:

LABEL_52:
  return v10;
}

void __74__PGPeopleTitleUtility_peopleGroupNameForPersonNodes_allowedGroupsFormat___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = +[PGGraphRelationshipEdge confirmedRelationshipFilter];
  id v7 = +[MAEdgeCollection edgesFromNodes:v5 toNodes:v4 matchingFilter:v6];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v9 = objc_msgSend(v7, "labels", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(__CFString **)(*((void *)&v18 + 1) + 8 * i);
        if ([*(id *)(a1 + 40) containsObject:v14]) {
          uint64_t v15 = @"FAMILY";
        }
        else {
          uint64_t v15 = v14;
        }
        [v8 addObject:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v8 count];
  v16 = *(void **)(a1 + 48);
  uint64_t v17 = [v8 allObjects];
  [v16 addObjectsFromArray:v17];
}

+ (id)peopleGroupNameForPersonNodes:(id)a3 allowedGroupsFormat:(unint64_t)a4 fallbackToGeneric:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = [a1 peopleGroupNameForPersonNodes:a3 allowedGroupsFormat:a4];
  id v7 = (void *)v6;
  if (v5 && !v6)
  {
    id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v7 = [v8 localizedStringForKey:@"PGPeopleTitleFormatGenericSocialGroup" value:@"PGPeopleTitleFormatGenericSocialGroup" table:@"Localizable"];
  }
  return v7;
}

+ (id)nameStringForPersonNodes:(id)a3 includeMe:(BOOL)a4 allowUnnamed:(BOOL)a5 allowedGroupsFormat:(unint64_t)a6 insertLineBreaks:(BOOL)a7 serviceManager:(id)a8
{
  BOOL v11 = a5;
  v74[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a8;
  if (![v14 count])
  {
    unint64_t v22 = 0;
    goto LABEL_53;
  }
  BOOL v65 = a7;
  BOOL v66 = v11;
  v16 = (void *)[v14 mutableCopy];
  uint64_t v17 = [v14 anyObject];
  long long v18 = [v17 graph];
  long long v19 = +[PGGraphNodeCollection nodesInGraph:v18];
  long long v20 = [v19 anyNode];

  if (v20)
  {
    [v16 removeObject:v20];
    if (![v16 count])
    {
      [v16 addObject:v20];
      a4 = 0;
    }
  }
  unint64_t v21 = [v16 count];
  if (a6 == 1
    || v21 < 2
    || ([a1 peopleGroupNameForPersonNodes:v16 allowedGroupsFormat:a6],
        (unint64_t v22 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v68 = v20;
    uint64_t v23 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"name" ascending:1];
    v74[0] = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:1];
    v25 = [v16 sortedArrayUsingDescriptors:v24];

    v26 = [MEMORY[0x1E4F1CA48] array];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v27 = v25;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v69 objects:v73 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      BOOL v61 = a4;
      v58 = v16;
      v63 = v14;
      uint64_t v30 = 0;
      uint64_t v31 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v70 != v31) {
            objc_enumerationMutation(v27);
          }
          v33 = [a1 nameFromPersonNode:*(void *)(*((void *)&v69 + 1) + 8 * i) serviceManager:v15];
          v34 = v33;
          if (v33)
          {
            if ([v33 length]) {
              [v26 addObject:v34];
            }
            else {
              ++v30;
            }
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v69 objects:v73 count:16];
      }
      while (v29);

      id v14 = v63;
      if (v66)
      {
        a4 = v61;
        if (v30 == 1)
        {
          if ([v26 count]) {
            char v35 = 1;
          }
          else {
            char v35 = v61;
          }
          if ((v35 & 1) == 0)
          {
            uint64_t v50 = [v63 anyObject];
            uint64_t v51 = [v50 ageCategory];

            uint64_t v52 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v53 = v52;
            if (v51 == 1) {
              v54 = @"PGPeopleTitleFormatGenericUnnamedChild";
            }
            else {
              v54 = @"PGPeopleTitleFormatGenericUnnamedPerson";
            }
            unint64_t v22 = [v52 localizedStringForKey:v54 value:v54 table:@"Localizable"];

            v16 = v58;
            goto LABEL_50;
          }
          uint64_t v30 = 1;
        }
      }
      else
      {
        a4 = v61;
      }
      int v36 = a6 & 1;
      v16 = v58;
      if ((a6 & 1) != 0 && v30)
      {
        char v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        unint64_t v22 = [v37 localizedStringForKey:@"PGPeopleTitleFormatGenericSocialGroup" value:@"PGPeopleTitleFormatGenericSocialGroup" table:@"Localizable"];

LABEL_50:
        long long v20 = v68;
        goto LABEL_51;
      }
    }
    else
    {

      int v36 = a6 & 1;
    }
    int v64 = v36;
    long long v20 = v68;
    BOOL v38 = !a4;
    if (!v68) {
      BOOL v38 = 1;
    }
    if (!v38)
    {
      long long v39 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      long long v40 = [v39 localizedStringForKey:@"PGPeopleTitleFormatMePerson" value:@"PGPeopleTitleFormatMePerson" table:@"Localizable"];
      [v26 addObject:v40];
    }
    if ([v26 count] == 2)
    {
      v67 = [v26 firstObject];
      uint64_t v41 = [v26 lastObject];
      v59 = NSString;
      v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v43 = [v42 localizedStringForKey:@"PGPeopleTitleFormatTwoPeopleWithPersonName %@ otherPersonName %@" value:@"PGPeopleTitleFormatTwoPeopleWithPersonName %@ otherPersonName %@" table:@"Localizable"];
      v62 = (void *)v41;
      unint64_t v22 = objc_msgSend(v59, "localizedStringWithFormat:", v43, v67, v41);
    }
    else
    {
      if ((unint64_t)[v26 count] < 3)
      {
        unint64_t v22 = [v26 firstObject];
LABEL_51:

        goto LABEL_52;
      }
      v67 = objc_msgSend(v26, "subarrayWithRange:", 0, objc_msgSend(v26, "count") - 1);
      v62 = [v26 lastObject];
      v57 = NSString;
      v60 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v44 = [v60 localizedStringForKey:@"PGPeopleTitleFormatMultiplePeopleWithConcatenatedPersonNames %@ lastPersonName %@" value:@"PGPeopleTitleFormatMultiplePeopleWithConcatenatedPersonNames %@ lastPersonName %@" table:@"Localizable"];
      v56 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v45 = [v56 localizedStringForKey:@"PGPeopleTitleFormatMultiplePeoplePersonNameConcatenator" value:@"PGPeopleTitleFormatMultiplePeoplePersonNameConcatenator" table:@"Localizable"];
      v46 = [v67 componentsJoinedByString:v45];
      unint64_t v22 = objc_msgSend(v57, "localizedStringWithFormat:", v44, v46, v62);

      long long v20 = v68;
    }
    if (v65)
    {
      uint64_t v47 = +[PGCommonTitleUtility titleWithLineBreakForTitle:v22 andUsedNames:v26];

      unint64_t v22 = (void *)v47;
    }

    if (v64 && (unint64_t)[v22 length] >= 0x17)
    {
      v48 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v49 = [v48 localizedStringForKey:@"PGPeopleTitleFormatGenericSocialGroup" value:@"PGPeopleTitleFormatGenericSocialGroup" table:@"Localizable"];

      unint64_t v22 = (void *)v49;
    }
    goto LABEL_51;
  }
LABEL_52:

LABEL_53:
  return v22;
}

+ (id)nameStringForPersonNodes:(id)a3 includeMe:(BOOL)a4 insertLineBreaks:(BOOL)a5 serviceManager:(id)a6
{
  return (id)[a1 nameStringForPersonNodes:a3 includeMe:a4 allowUnnamed:1 allowedGroupsFormat:7 insertLineBreaks:a5 serviceManager:a6];
}

+ (id)beautifiedLocationStringWithPersonNode:(id)a3 peopleAddressEdge:(id)a4 titleComponent:(id)a5 insertLineBreak:(BOOL)a6 allowFamilyHome:(BOOL)a7 serviceManager:(id)a8
{
  BOOL v9 = a7;
  BOOL v39 = a6;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v41 = a8;
  v16 = [v14 targetNode];
  uint64_t v17 = [v16 label];

  uint64_t v18 = [v13 isMeNode];
  long long v19 = [a1 _placeDisplayNameForPeopleAddressNodeLabel:v17 titleComponent:v15 containsMe:v18];
  long long v20 = v19;
  if (v18)
  {
    id v21 = v19;
    goto LABEL_22;
  }
  unint64_t v22 = [v14 sourceNode];
  uint64_t v23 = [v13 graph];
  long long v40 = +[PGGraphNodeCollection nodesInGraph:v23];

  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v24 = [v40 anyNode];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __143__PGPeopleTitleUtility_beautifiedLocationStringWithPersonNode_peopleAddressEdge_titleComponent_insertLineBreak_allowFamilyHome_serviceManager___block_invoke;
  v42[3] = &unk_1E68EFC70;
  id v38 = v22;
  id v43 = v38;
  id v25 = v17;
  id v44 = v25;
  id v45 = &v46;
  [v24 enumerateHomeOrWorkAddressNodesUsingBlock:v42];

  if (*((unsigned char *)v47 + 24))
  {
    if ([v25 isEqualToString:@"Home"]) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = 2;
    }
    [v15 setType:v26];
    id v21 = v20;
    goto LABEL_21;
  }
  if ((v9 & [v25 isEqualToString:@"Home"]) != 1
    || ![v13 isMemberOfMyFamily])
  {
    char v37 = [a1 nameFromPersonNode:v13 serviceManager:v41];
    if ([v37 length])
    {
      if ([v15 type] == 3)
      {
        uint64_t v28 = NSString;
        uint64_t v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v30 = [v29 localizedStringForKey:@"PGPeoplePlaceTitleFormatHomeWithPersonName %@" value:@"PGPeoplePlaceTitleFormatHomeWithPersonName %@" table:@"Localizable"];
        uint64_t v31 = objc_msgSend(v28, "localizedStringWithFormat:", v30, v37);

        [v15 setPersonName:v37];
        if (v39)
        {
          v50[0] = v37;
          v50[1] = v20;
          v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
          id v21 = +[PGCommonTitleUtility titleWithLineBreakForTitle:v31 andUsedNames:v32];
        }
        else
        {
          uint64_t v31 = v31;
          id v21 = v31;
        }
        goto LABEL_20;
      }
      v34 = +[PGLogging sharedLogging];
      uint64_t v31 = [v34 loggingConnection];

      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        int v36 = [v15 type];
        *(_DWORD *)buf = 67109120;
        int v52 = v36;
        _os_log_error_impl(&dword_1D1805000, v31, OS_LOG_TYPE_ERROR, "Expected titleComponent.type to be PGLocationTitleComponentTypeOthersHome at this point, but it is type %d. Returning nil.", buf, 8u);
      }
    }
    else
    {
      v33 = +[PGLogging sharedLogging];
      uint64_t v31 = [v33 loggingConnection];

      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v31, OS_LOG_TYPE_INFO, "Could not find any person name for people", buf, 2u);
      }
    }
    id v21 = 0;
LABEL_20:

    goto LABEL_21;
  }
  [v15 setType:4];
  id v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v21 = [v27 localizedStringForKey:@"PGPeoplePlaceTitleFormatFamilyHome" value:@"PGPeoplePlaceTitleFormatFamilyHome" table:@"Localizable"];

LABEL_21:
  _Block_object_dispose(&v46, 8);

LABEL_22:
  return v21;
}

void __143__PGPeopleTitleUtility_beautifiedLocationStringWithPersonNode_peopleAddressEdge_titleComponent_insertLineBreak_allowFamilyHome_serviceManager___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  if ([*(id *)(a1 + 32) isSameNodeAsNode:a2])
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = [v9 label];
    LODWORD(v7) = [v7 isEqualToString:v8];

    if (v7)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

@end
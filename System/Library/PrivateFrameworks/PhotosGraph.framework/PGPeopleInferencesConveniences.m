@interface PGPeopleInferencesConveniences
+ (BOOL)anyPersonNodes:(id)a3 belongToBestSocialGroupsInGraph:(id)a4;
+ (BOOL)isValidContact:(id)a3;
+ (BOOL)signalInRunOptions:(unint64_t)a3 signal:(unint64_t)a4;
+ (BOOL)socialGroupNodes:(id)a3 intersectWithBestSocialGroupsInGraph:(id)a4;
+ (id)countedPersonNodesFromMomentNodes:(id)a3 amongPersonNodes:(id)a4;
+ (id)momentNodesAtHomeInMomentNodes:(id)a3;
+ (id)momentNodesAtWorkInMomentNodes:(id)a3;
+ (id)momentNodesByAddressNodeFromMomentNodes:(id)a3;
+ (id)personLocalIdentifierByContactIdentifierFromPersonNodes:(id)a3;
+ (id)topPersonNodeIdentifierForTwoPersonSocialGroupsFromPersonNodes:(id)a3 personNodes:(id)a4;
@end

@implementation PGPeopleInferencesConveniences

+ (BOOL)socialGroupNodes:(id)a3 intersectWithBestSocialGroupsInGraph:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [PGGraphSocialGroupNodeCollection alloc];
  v8 = [v5 bestSocialGroupNodes];
  v9 = [(MAElementCollection *)v7 initWithArray:v8 graph:v5];

  LOBYTE(v5) = [(MAElementCollection *)v9 intersectsCollection:v6];
  return (char)v5;
}

+ (BOOL)anyPersonNodes:(id)a3 belongToBestSocialGroupsInGraph:(id)a4
{
  id v6 = a4;
  v7 = [a3 socialGroupNodes];
  LOBYTE(a1) = [a1 socialGroupNodes:v7 intersectWithBestSocialGroupsInGraph:v6];

  return (char)a1;
}

+ (id)topPersonNodeIdentifierForTwoPersonSocialGroupsFromPersonNodes:(id)a3 personNodes:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a3 socialGroupNodesSortedByImportance];
  if ([v6 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      v11 = &stru_1F283BC78;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "collection", (void)v17);
          v14 = [v13 personNodes];

          if ([v14 count] == 1 && (objc_msgSend(v5, "intersectsCollection:", v14) & 1) != 0)
          {
            v15 = [v14 localIdentifiers];
            v11 = [v15 anyObject];

            goto LABEL_15;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      v11 = &stru_1F283BC78;
    }
LABEL_15:
  }
  else
  {
    v11 = &stru_1F283BC78;
  }

  return v11;
}

+ (id)momentNodesAtHomeInMomentNodes:(id)a3
{
  id v3 = a3;
  v4 = [v3 graph];
  id v5 = +[PGGraphNodeCollection nodesInGraph:v4];

  id v6 = [v5 homeNodes];
  id v7 = [v6 addressNodes];
  uint64_t v8 = [v7 momentNodes];
  uint64_t v9 = [v8 collectionByIntersecting:v3];

  return v9;
}

+ (id)momentNodesAtWorkInMomentNodes:(id)a3
{
  id v3 = a3;
  v4 = [v3 graph];
  id v5 = [v4 meNodeCollection];
  id v6 = [v5 workNodes];
  id v7 = [v6 addressNodes];
  uint64_t v8 = [v7 momentNodes];

  uint64_t v9 = [v8 collectionByIntersecting:v3];

  return v9;
}

+ (id)momentNodesByAddressNodeFromMomentNodes:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F71E88];
  id v4 = a3;
  id v5 = +[PGGraphMomentNode addressOfMoment];
  id v6 = [v3 adjacencyWithSources:v4 relation:v5 targetsClass:objc_opt_class()];

  id v7 = [v6 transposed];

  return v7;
}

+ (id)countedPersonNodesFromMomentNodes:(id)a3 amongPersonNodes:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 elementIdentifiers];
  uint64_t v8 = [v5 graph];

  uint64_t v9 = (void *)MEMORY[0x1E4F71E88];
  uint64_t v10 = +[PGGraphMomentNode personInMoment];
  v11 = [v9 adjacencyWithSources:v6 relation:v10 targetsClass:objc_opt_class()];

  v12 = [v11 transposed];
  id v13 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  v14 = [v12 adjacency];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __85__PGPeopleInferencesConveniences_countedPersonNodesFromMomentNodes_amongPersonNodes___block_invoke;
  v21[3] = &unk_1E68E4AB8;
  id v22 = v7;
  id v23 = v8;
  id v15 = v13;
  id v24 = v15;
  id v16 = v8;
  id v17 = v7;
  [v14 enumerateTargetsBySourceWith:v21];

  long long v18 = v24;
  id v19 = v15;

  return v19;
}

void __85__PGPeopleInferencesConveniences_countedPersonNodesFromMomentNodes_amongPersonNodes___block_invoke(id *a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([a1[4] containsIdentifier:a2])
  {
    id v6 = [a1[5] nodeForIdentifier:a2];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if ([v5 count])
      {
        unint64_t v7 = 0;
        do
        {
          [a1[6] addObject:v6];
          ++v7;
        }
        while (v7 < [v5 count]);
      }
    }
    else
    {
      uint64_t v8 = +[PGLogging sharedLogging];
      uint64_t v9 = [v8 loggingConnection];

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = 134217984;
        uint64_t v11 = a2;
        _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "Could not fetch person node with identifier %lu", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

+ (id)personLocalIdentifierByContactIdentifierFromPersonNodes:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__PGPeopleInferencesConveniences_personLocalIdentifierByContactIdentifierFromPersonNodes___block_invoke;
  v8[3] = &unk_1E68EF528;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateNodesUsingBlock:v8];

  return v6;
}

void __90__PGPeopleInferencesConveniences_personLocalIdentifierByContactIdentifierFromPersonNodes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 contactIdentifier];
  id v4 = [v3 localIdentifier];

  if ([v5 length] && objc_msgSend(v4, "length")) {
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v5];
  }
}

+ (BOOL)signalInRunOptions:(unint64_t)a3 signal:(unint64_t)a4
{
  return (a4 & ~a3) == 0;
}

+ (BOOL)isValidContact:(id)a3
{
  id v3 = a3;
  if ([v3 isMe] & 1) != 0 || (objc_msgSend(v3, "isOrganization"))
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [v3 CNIdentifier];
    BOOL v4 = [v5 length] != 0;
  }
  return v4;
}

@end
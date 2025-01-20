@interface PLSearchEntity
+ (BOOL)enumerateAssetSearchEntitiesForLibrary:(id)a3 error:(id *)a4 withBlock:(id)a5;
+ (id)_fetchEdgesForNodes:(id)a3 toMoment:(id)a4;
+ (id)_fetchEdgesForPersonRelationsOnPerson:(id)a3;
+ (id)_fetchEdgesForPersonRelationsOnSearchEntityForPerson:(id)a3;
+ (id)_fetchGraphNodesForOIDs:(id)a3 inContext:(id)a4;
+ (id)_fetchMeOrSelfEdgeForPerson:(id)a3;
+ (id)_fetchMeOrSelfSearchEntityForPerson:(id)a3;
+ (id)_fetchSearchEntityNodesForMoment:(id)a3;
+ (id)_fetchSearchEntityWithLabel:(id)a3 type:(unint64_t)a4 identifier:(id)a5 inContext:(id)a6;
+ (id)_groupAndRemoveMatchingDictionariesInSearchEntityDictionaries:(id)a3 byNodeOIDFromValuesByNodeOID:(id)a4;
+ (id)_labelIDWithCode:(unsigned int)a3 inContext:(id)a4;
+ (id)_labelWithCode:(unsigned int)a3 inContext:(id)a4;
+ (id)_newNodeContainerWithManagedObjectContext:(id)a3 dictionary:(id)a4;
+ (id)_personRelationLabelIDsInContext:(id)a3;
+ (id)_predicateForSearchEntityEdgesToMoment:(id)a3;
+ (id)decodeIdentifierString:(id)a3 intoLabel:(id *)a4 type:(unint64_t *)a5 outIdentifier:(id *)a6;
+ (id)fetchSearchEntityWithEncodedIdentifierString:(id)a3 inLibrary:(id)a4;
+ (id)newNodeContainerWithManagedObjectContext:(id)a3;
+ (id)personRelationDictionaryForRelationWithType:(signed __int16)a3 label:(id)a4 confidence:(double)a5 relatedPersonUUID:(id)a6;
+ (id)predicateForSearchEntitySourceNodes;
+ (id)synonymsFromSynonymsString:(id)a3;
+ (id)synonymsStringFromSynonyms:(id)a3;
+ (void)_cleanUpStaleSearchRankingsNotIn:(id)a3 inLibrary:(id)a4;
+ (void)_collectLabels:(id *)a3 identifiers:(id *)a4 types:(id *)a5 fromDictionaries:(id)a6;
+ (void)_disconnectNodes:(id)a3 fromMoment:(id)a4;
+ (void)_findMatchingNodes:(id *)a3 andSearchEntityDictionariesByOID:(id *)a4 inSearchEntityDictionaries:(id)a5 inContext:(id)a6;
+ (void)_nodeValuesByNode:(id)a3 into:(id)a4;
+ (void)_removeAllEdgesWithPredicate:(id)a3 inContext:(id)a4;
+ (void)_removeAllPersonRelationEdgesFromNode:(id)a3;
+ (void)_removeAllPersonRelationEdgesFromPerson:(id)a3;
+ (void)_removeAllSearchEntityEdgesFromMoment:(id)a3;
+ (void)_setConfidence:(double)a3 onEdge:(id)a4;
+ (void)_setDateIntervalStart:(id)a3 end:(id)a4 onEdge:(id)a5;
+ (void)enumerateAssetSearchEntitiesForMoment:(id)a3 withBlock:(id)a4;
+ (void)enumerateAssetSearchEntityPersonRelationsForPerson:(id)a3 withBlock:(id)a4;
+ (void)enumeratePersonRelationsForPerson:(id)a3 withBlock:(id)a4;
+ (void)prepareForDeletingOutgoingEdge:(id)a3;
+ (void)prepareForDeletionWithNode:(id)a3;
+ (void)removePersonRelationsMatchingDictionaries:(id)a3 onPerson:(id)a4;
+ (void)setAssetSearchEntitiesFromDictionaries:(id)a3 onMoment:(id)a4;
+ (void)setPersonRelationsFromDictionaries:(id)a3 onPerson:(id)a4;
+ (void)setSearchRankingsFromDictionaries:(id)a3 inLibrary:(id)a4;
+ (void)willInsertOutgoingEdge:(id)a3;
+ (void)willSaveWithNode:(id)a3;
- (BOOL)_matchesLabel:(id)a3 type:(unint64_t)a4 identifier:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)synonyms;
- (NSString)identifier;
- (NSString)label;
- (NSString)synonymsString;
- (double)confidenceForMoment:(id)a3;
- (double)rankingScore;
- (id)_fetchSearchEntityEdgeToMoment:(id)a3;
- (id)_insertMomentEdgeForMoment:(id)a3 confidence:(double)a4 startDate:(id)a5 endDate:(id)a6;
- (id)_insertRelationEdgeForPerson:(id)a3 relationType:(signed __int16)a4 confidence:(double)a5;
- (id)_predicateForSearchEntityEdgeToMoment:(id)a3;
- (id)dateIntervalForMoment:(id)a3;
- (id)description;
- (id)descriptionForMoment:(id)a3;
- (id)encodedIdentifierString;
- (id)fetchAllMomentsWithError:(id *)a3;
- (unint64_t)hash;
- (unint64_t)type;
- (void)_updateChangeFlagForMoments;
- (void)_updateChangeFlagForProperties;
- (void)_updateChangeFlagForRelations;
- (void)setIdentifier:(id)a3;
- (void)setLabel:(id)a3;
- (void)setRankingScore:(double)a3;
- (void)setSynonyms:(id)a3;
- (void)setSynonymsString:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PLSearchEntity

- (BOOL)isEqual:(id)a3
{
  v4 = (PLSearchEntity *)a3;
  if (self == v4)
  {
    char v23 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if ([v5 isEqual:objc_opt_class()])
    {
      v6 = v4;
      v7 = [(PLSearchEntity *)self label];
      v8 = [(PLSearchEntity *)v6 label];
      int v9 = [v7 isEqualToString:v8];

      if (!v9) {
        goto LABEL_12;
      }
      v10 = [(PLSearchEntity *)self identifier];
      v11 = [(PLSearchEntity *)v6 identifier];
      int v12 = [v10 isEqualToString:v11];

      if (!v12) {
        goto LABEL_12;
      }
      unint64_t v13 = [(PLSearchEntity *)self type];
      if (v13 != [(PLSearchEntity *)v6 type]) {
        goto LABEL_12;
      }
      [(PLSearchEntity *)self rankingScore];
      double v15 = v14;
      [(PLSearchEntity *)v6 rankingScore];
      if (vabdd_f64(v15, v16) > 0.00000011920929) {
        goto LABEL_12;
      }
      v17 = [(PLSearchEntity *)self synonymsString];
      v18 = [(PLSearchEntity *)v6 synonymsString];
      BOOL v19 = v18 != 0;

      if ((v17 == 0) != v19)
      {
        v20 = [(PLSearchEntity *)self synonymsString];

        if (v20)
        {
          v21 = [(PLSearchEntity *)self synonymsString];
          v22 = [(PLSearchEntity *)v6 synonymsString];
          char v23 = [v21 isEqualToString:v22];
        }
        else
        {
          char v23 = 1;
        }
      }
      else
      {
LABEL_12:
        char v23 = 0;
      }
    }
    else
    {
      char v23 = 0;
    }
  }

  return v23;
}

- (unint64_t)hash
{
  v3 = [(PLSearchEntity *)self label];
  uint64_t v4 = [v3 hash];
  v5 = [(PLSearchEntity *)self identifier];
  uint64_t v6 = [v5 hash] + v4;
  unint64_t v7 = v6 + [(PLSearchEntity *)self type];

  return v7;
}

- (id)descriptionForMoment:(id)a3
{
  uint64_t v4 = NSString;
  id v5 = a3;
  uint64_t v6 = [(PLSearchEntity *)self label];
  unint64_t v7 = [(PLSearchEntity *)self type];
  [(PLSearchEntity *)self confidenceForMoment:v5];
  uint64_t v9 = v8;

  v10 = [(PLSearchEntity *)self identifier];
  [(PLSearchEntity *)self rankingScore];
  uint64_t v12 = v11;
  unint64_t v13 = [(PLSearchEntity *)self synonymsString];
  double v14 = [v4 stringWithFormat:@"\nlabel: %@\ntype: %lld\nconfidence: %g\nidentifier: %@\nrankingScore: %g\nsynonyms: %@", v6, v7, v9, v10, v12, v13];

  return v14;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(PLSearchEntity *)self label];
  unint64_t v5 = [(PLSearchEntity *)self type];
  uint64_t v6 = [(PLSearchEntity *)self identifier];
  [(PLSearchEntity *)self rankingScore];
  uint64_t v8 = v7;
  uint64_t v9 = [(PLSearchEntity *)self synonymsString];
  v10 = [v3 stringWithFormat:@"\nlabel: %@\ntype: %llu\nidentifier: %@\nrankingScore: %g\nsynonyms: %@", v4, v5, v6, v8, v9];

  return v10;
}

- (void)_updateChangeFlagForRelations
{
  id v2 = [(PLGraphNodeContainer *)self sourceNode];
  objc_msgSend(v2, "setChangeFlag2:", objc_msgSend(v2, "changeFlag2") + 1);
}

- (void)_updateChangeFlagForMoments
{
  id v2 = [(PLGraphNodeContainer *)self sourceNode];
  objc_msgSend(v2, "setChangeFlag1:", objc_msgSend(v2, "changeFlag1") + 1);
}

- (void)_updateChangeFlagForProperties
{
  id v2 = [(PLGraphNodeContainer *)self sourceNode];
  objc_msgSend(v2, "setChangeFlag0:", objc_msgSend(v2, "changeFlag0") + 1);
}

- (id)encodedIdentifierString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PLSearchEntity type](self, "type"));
  [v3 setObject:v4 forKeyedSubscript:@"type"];

  unint64_t v5 = [(PLSearchEntity *)self label];
  [v3 setObject:v5 forKeyedSubscript:@"label"];

  uint64_t v6 = [(PLSearchEntity *)self identifier];
  [v3 setObject:v6 forKeyedSubscript:@"identifier"];

  uint64_t v7 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:0];
  uint64_t v8 = (void *)[[NSString alloc] initWithData:v7 encoding:4];

  return v8;
}

- (id)fetchAllMomentsWithError:(id *)a3
{
  v31[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PLGraphNodeContainer *)self sourceNode];
  unint64_t v5 = [v4 managedObjectContext];

  uint64_t v6 = +[PLSearchEntity _labelIDWithCode:1100 inContext:v5];
  uint64_t v7 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v8 = +[PLGraphEdge entityName];
  uint64_t v9 = [v7 fetchRequestWithEntityName:v8];

  [v9 setIncludesPendingChanges:0];
  v10 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v11 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v12 = [(PLGraphNodeContainer *)self sourceNode];
  unint64_t v13 = [v11 predicateWithFormat:@"%K = %@", @"sourceNode", v12];
  v31[0] = v13;
  double v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"primaryLabel", v6];
  v31[1] = v14;
  double v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"targetMoment");
  v31[2] = v15;
  double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
  v17 = [v10 andPredicateWithSubpredicates:v16];
  [v9 setPredicate:v17];

  v30 = @"targetMoment";
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  [v9 setRelationshipKeyPathsForPrefetching:v18];

  id v25 = 0;
  BOOL v19 = [v5 executeFetchRequest:v9 error:&v25];
  id v20 = v25;
  if (v19)
  {
    v21 = objc_msgSend(v19, "_pl_map:", &__block_literal_global_95727);
  }
  else
  {
    v22 = PLBackendGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v27 = self;
      __int16 v28 = 2112;
      id v29 = v20;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Failed to find graph edge from search entity (%@) to moments (%@)", buf, 0x16u);
    }

    v21 = 0;
    if (a3) {
      *a3 = v20;
    }
  }

  return v21;
}

uint64_t __43__PLSearchEntity_fetchAllMomentsWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 targetMoment];
}

- (id)dateIntervalForMoment:(id)a3
{
  id v3 = [(PLSearchEntity *)self _fetchSearchEntityEdgeToMoment:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 edgeValueWithName:@"DateIntervalStart"];
    uint64_t v6 = [v5 dateValue];

    uint64_t v7 = [v4 edgeValueWithName:@"DateIntervalEnd"];
    uint64_t v8 = [v7 dateValue];

    uint64_t v9 = 0;
    if (v6 && v8) {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v6 endDate:v8];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (double)confidenceForMoment:(id)a3
{
  id v3 = [(PLSearchEntity *)self _fetchSearchEntityEdgeToMoment:a3];
  uint64_t v4 = [v3 edgeValueWithName:@"Confidence"];
  [v4 floatValue];
  double v6 = v5;

  return v6;
}

- (id)_fetchSearchEntityEdgeToMoment:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = (void *)MEMORY[0x1E4F1C0D0];
  double v6 = +[PLGraphEdge entityName];
  uint64_t v7 = [v5 fetchRequestWithEntityName:v6];

  uint64_t v8 = [(PLSearchEntity *)self _predicateForSearchEntityEdgeToMoment:v4];
  [v7 setPredicate:v8];

  [v7 setFetchLimit:1];
  uint64_t v9 = [v4 managedObjectContext];
  id v15 = 0;
  v10 = [v9 executeFetchRequest:v7 error:&v15];
  id v11 = v15;

  if (!v10)
  {
    uint64_t v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v17 = self;
      __int16 v18 = 2112;
      id v19 = v4;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Failed to find graph edge from search entity (%@) to moment (%@) (%@)", buf, 0x20u);
    }
  }
  unint64_t v13 = [v10 firstObject];

  return v13;
}

- (void)setSynonymsString:(id)a3
{
  id v9 = a3;
  id v4 = [(PLGraphNodeContainer *)self sourceNode];
  if (v9)
  {
    double v5 = [v4 nodeValueWithName:@"synonymsString" createIfMissing:1];

    [v5 setStringValue:v9];
  }
  else
  {
    double v5 = [v4 nodeValueWithName:@"synonymsString"];

    if (v5)
    {
      double v6 = [(PLGraphNodeContainer *)self sourceNode];
      [v6 removeNodeValue:v5];

      uint64_t v7 = [(PLGraphNodeContainer *)self sourceNode];
      uint64_t v8 = [v7 managedObjectContext];
      [v8 deleteObject:v5];
    }
  }

  [(PLSearchEntity *)self _updateChangeFlagForProperties];
}

- (NSString)synonymsString
{
  id v2 = [(PLGraphNodeContainer *)self sourceNode];
  id v3 = [v2 nodeValueWithName:@"synonymsString"];

  id v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (void)setSynonyms:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    id v4 = +[PLSearchEntity synonymsStringFromSynonyms:v7];
  }
  else
  {
    id v4 = 0;
  }
  double v5 = [(PLSearchEntity *)self synonymsString];
  char v6 = [v5 isEqualToString:v4];

  if ((v6 & 1) == 0) {
    [(PLSearchEntity *)self setSynonymsString:v4];
  }
}

- (NSArray)synonyms
{
  id v3 = [(PLSearchEntity *)self synonymsString];
  if (v3)
  {
    id v4 = [(PLSearchEntity *)self synonymsString];
    double v5 = +[PLSearchEntity synonymsFromSynonymsString:v4];
  }
  else
  {
    double v5 = 0;
  }

  return (NSArray *)v5;
}

- (void)setRankingScore:(double)a3
{
  double v5 = [(PLGraphNodeContainer *)self sourceNode];
  char v6 = v5;
  if (a3 == 0.0)
  {
    id v7 = [v5 nodeValueWithName:@"rankingScore"];

    if (v7)
    {
      uint64_t v8 = [(PLGraphNodeContainer *)self sourceNode];
      [v8 removeNodeValue:v7];

      id v9 = [(PLGraphNodeContainer *)self sourceNode];
      v10 = [v9 managedObjectContext];
      [v10 deleteObject:v7];
    }
  }
  else
  {
    id v7 = [v5 nodeValueWithName:@"rankingScore" createIfMissing:1];

    [v7 floatValue];
    if (v11 != a3) {
      [v7 setFloatValue:a3];
    }
  }

  [(PLSearchEntity *)self _updateChangeFlagForProperties];
}

- (double)rankingScore
{
  id v2 = [(PLGraphNodeContainer *)self sourceNode];
  id v3 = [v2 nodeValueWithName:@"rankingScore"];

  [v3 floatValue];
  double v5 = v4;

  return v5;
}

- (void)setType:(unint64_t)a3
{
  double v5 = [(PLGraphNodeContainer *)self sourceNode];
  id v6 = [v5 nodeValueWithName:@"searchEntityType" createIfMissing:1];

  [v6 setIntValue:a3];
  [(PLSearchEntity *)self _updateChangeFlagForProperties];
}

- (unint64_t)type
{
  id v2 = [(PLGraphNodeContainer *)self sourceNode];
  id v3 = [v2 nodeValueWithName:@"searchEntityType"];

  unint64_t v4 = [v3 intValue];
  return v4;
}

- (void)setIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = [(PLGraphNodeContainer *)self sourceNode];
  id v6 = [v5 nodeValueWithName:@"searchEntityIdentifier" createIfMissing:1];

  [v6 setStringValue:v4];
  [(PLSearchEntity *)self _updateChangeFlagForProperties];
}

- (NSString)identifier
{
  id v2 = [(PLGraphNodeContainer *)self sourceNode];
  id v3 = [v2 nodeValueWithName:@"searchEntityIdentifier"];

  id v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  double v5 = [(PLGraphNodeContainer *)self sourceNode];
  id v6 = [v5 nodeValueWithName:@"searchEntityLabel" createIfMissing:1];

  [v6 setStringValue:v4];
  [(PLSearchEntity *)self _updateChangeFlagForProperties];
}

- (NSString)label
{
  id v2 = [(PLGraphNodeContainer *)self sourceNode];
  id v3 = [v2 nodeValueWithName:@"searchEntityLabel"];

  id v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (id)_insertMomentEdgeForMoment:(id)a3 confidence:(double)a4 startDate:(id)a5 endDate:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PLSearchEntity.m", 345, @"Invalid parameter not satisfying: %@", @"moment" object file lineNumber description];
  }
  double v14 = [(PLGraphNodeContainer *)self sourceNode];
  id v15 = [v14 managedObjectContext];

  double v16 = +[PLSearchEntity _labelWithCode:1100 inContext:v15];
  v17 = +[PLGraphEdge insertGraphEdgeInContext:v15 withPrimaryLabel:v16];
  __int16 v18 = [(PLGraphNodeContainer *)self sourceNode];
  [v17 setSourceNode:v18];

  [v17 setTargetMoment:v11];
  +[PLSearchEntity _setConfidence:v17 onEdge:a4];
  +[PLSearchEntity _setDateIntervalStart:v12 end:v13 onEdge:v17];
  [(PLSearchEntity *)self _updateChangeFlagForMoments];

  return v17;
}

- (id)_predicateForSearchEntityEdgeToMoment:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = +[PLSearchEntity _predicateForSearchEntityEdgesToMoment:a3];
  double v5 = (void *)MEMORY[0x1E4F28BA0];
  v12[0] = v4;
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = [(PLGraphNodeContainer *)self sourceNode];
  uint64_t v8 = [v6 predicateWithFormat:@"%K = %@", @"sourceNode", v7];
  v12[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v10 = [v5 andPredicateWithSubpredicates:v9];

  return v10;
}

- (BOOL)_matchesLabel:(id)a3 type:(unint64_t)a4 identifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(PLSearchEntity *)self label];
  if (v10)
  {
  }
  else
  {
    id v11 = [(PLSearchEntity *)self identifier];

    if (!v11) {
      goto LABEL_8;
    }
  }
  if ([(PLSearchEntity *)self type] == a4)
  {
    id v12 = [(PLSearchEntity *)self label];
    id v13 = v12;
    if (v12 == v8)
    {
    }
    else
    {
      int v14 = [v12 isEqualToString:v8];

      if (!v14)
      {
        char v15 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    id v16 = [(PLSearchEntity *)self identifier];
    v17 = v16;
    if (v16 == v9) {
      char v15 = 1;
    }
    else {
      char v15 = [v16 isEqualToString:v9];
    }

    goto LABEL_14;
  }
LABEL_8:
  char v15 = 0;
LABEL_15:

  return v15;
}

- (id)_insertRelationEdgeForPerson:(id)a3 relationType:(signed __int16)a4 confidence:(double)a5
{
  int v6 = a4;
  id v9 = a3;
  if (!v9)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PLSearchEntity.m", 74, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  v10 = [(PLGraphNodeContainer *)self sourceNode];
  id v11 = [v10 managedObjectContext];

  if (v6 == 1)
  {
    uint64_t v12 = 1102;
  }
  else if (v6 == 2)
  {
    uint64_t v12 = 1103;
  }
  else
  {
    uint64_t v12 = 1101;
  }
  id v13 = +[PLSearchEntity _labelWithCode:v12 inContext:v11];
  int v14 = +[PLGraphEdge insertGraphEdgeInContext:v11 withPrimaryLabel:v13];
  char v15 = [(PLGraphNodeContainer *)self sourceNode];
  [v14 setSourceNode:v15];

  [v14 setTargetPerson:v9];
  id v16 = [v14 edgeValueWithName:@"RelationType" createIfMissing:1];
  [v16 setIntValue:v6];
  [v14 addEdgeValue:v16];
  v17 = [v14 edgeValueWithName:@"RelationTypeConfidence" createIfMissing:1];

  [v17 setFloatValue:a5];
  [v14 addEdgeValue:v17];
  if (v6 == 1) {
    [v9 setMeConfidence:a5];
  }
  [(PLSearchEntity *)self _updateChangeFlagForRelations];

  return v14;
}

+ (id)personRelationDictionaryForRelationWithType:(signed __int16)a3 label:(id)a4 confidence:(double)a5 relatedPersonUUID:(id)a6
{
  uint64_t v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x1E4F1CA60];
  id v11 = a6;
  uint64_t v12 = [v10 dictionary];
  [v12 setObject:&unk_1EEBEFE58 forKeyedSubscript:@"type"];
  id v13 = [NSNumber numberWithShort:v8];
  [v12 setObject:v13 forKeyedSubscript:@"PLSearchEntityPersonRelationTypeKey"];

  int v14 = [NSNumber numberWithDouble:a5];
  [v12 setObject:v14 forKeyedSubscript:@"RelationTypeConfidence"];

  [v12 setObject:v11 forKeyedSubscript:@"identifier"];
  if (v9) {
    [v12 setObject:v9 forKeyedSubscript:@"label"];
  }

  return v12;
}

+ (void)enumeratePersonRelationsForPerson:(id)a3 withBlock:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *, unsigned char *))a4;
  if (!v7)
  {
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"PLSearchEntity.m", 1136, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  id v21 = v7;
  [a1 _fetchEdgesForPersonRelationsOnPerson:v7];
  unsigned __int8 v27 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v24 != v11) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
      int v14 = [PLSearchEntityRelationToPerson alloc];
      char v15 = [v13 targetPerson];
      id v16 = [v13 edgeValueWithName:@"RelationType"];
      __int16 v17 = [v16 intValue];
      __int16 v18 = [v13 edgeValueWithName:@"RelationTypeConfidence"];
      [v18 floatValue];
      id v19 = -[PLSearchEntityRelationToPerson initWithPerson:relationType:relationTypeConfidence:](v14, "initWithPerson:relationType:relationTypeConfidence:", v15, v17);

      v8[2](v8, v19, &v27);
      LODWORD(v18) = v27;

      if (v18) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v10) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

+ (void)enumerateAssetSearchEntityPersonRelationsForPerson:(id)a3 withBlock:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *, unsigned char *))a4;
  if (!v7)
  {
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"PLSearchEntity.m", 1123, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  id v21 = v7;
  [a1 _fetchEdgesForPersonRelationsOnSearchEntityForPerson:v7];
  unsigned __int8 v27 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v24 != v11) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v23 + 1) + 8 * v12);
      int v14 = [PLSearchEntityRelationToPerson alloc];
      char v15 = [v13 targetPerson];
      id v16 = [v13 edgeValueWithName:@"RelationType"];
      __int16 v17 = [v16 intValue];
      __int16 v18 = [v13 edgeValueWithName:@"RelationTypeConfidence"];
      [v18 floatValue];
      id v19 = -[PLSearchEntityRelationToPerson initWithPerson:relationType:relationTypeConfidence:](v14, "initWithPerson:relationType:relationTypeConfidence:", v15, v17);

      v8[2](v8, v19, &v27);
      LODWORD(v18) = v27;

      if (v18) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v10) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

+ (void)removePersonRelationsMatchingDictionaries:(id)a3 onPerson:(id)a4
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 managedObjectContext];
  uint64_t v9 = +[PLSearchEntity _fetchMeOrSelfSearchEntityForPerson:v7];
  if (!v9)
  {
    uint64_t v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v104 = v7;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Couldn't find ME/SELF search entity for person %@", buf, 0xCu);
    }
    goto LABEL_52;
  }
  id v83 = a1;
  v73 = v7;
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id v74 = v6;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v95 objects:v107 count:16];
  v77 = v8;
  if (!v12) {
    goto LABEL_11;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v96;
  v75 = v9;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v96 != v14) {
        objc_enumerationMutation(v11);
      }
      id v16 = *(void **)(*((void *)&v95 + 1) + 8 * i);
      __int16 v17 = [v16 objectForKeyedSubscript:@"PLSearchEntityPersonRelationTypeKey"];
      uint64_t v18 = [v17 integerValue];

      if (v18 == 1)
      {

        [v83 _removeAllPersonRelationEdgesFromPerson:v7];
        [v7 setMeConfidence:0.0];
        uint64_t v9 = v75;
        [v75 rankingScore];
        if (v64 == 0.0)
        {
          long long v24 = [v75 sourceNode];
          uint64_t v8 = v77;
          [v77 deleteObject:v24];
          goto LABEL_51;
        }
LABEL_43:
        uint64_t v8 = v77;
        goto LABEL_52;
      }
      id v19 = [v16 objectForKeyedSubscript:@"PLSearchEntityPersonRelationTypeKey"];
      uint64_t v20 = [v19 integerValue];

      if (v20 == 2)
      {

        uint64_t v9 = v75;
        v65 = [v75 sourceNode];
        [v83 _removeAllPersonRelationEdgesFromNode:v65];

        [v75 rankingScore];
        if (v66 == 0.0)
        {
          long long v24 = [v75 sourceNode];
          uint64_t v8 = v77;
          [v77 deleteObject:v24];
          id v7 = v73;
          goto LABEL_51;
        }
        id v7 = v73;
        goto LABEL_43;
      }
      id v21 = [v16 objectForKeyedSubscript:@"identifier"];
      [v10 addObject:v21];
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v95 objects:v107 count:16];
    uint64_t v9 = v75;
    uint64_t v8 = v77;
    if (v13) {
      continue;
    }
    break;
  }
LABEL_11:

  uint64_t v22 = (void *)MEMORY[0x1E4F1C0D0];
  long long v23 = +[PLPerson entityName];
  long long v24 = [v22 fetchRequestWithEntityName:v23];

  long long v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"personUUID", v10];
  [v24 setPredicate:v25];

  id v94 = 0;
  long long v26 = [v8 executeFetchRequest:v24 error:&v94];
  id v27 = v94;
  id v28 = v27;
  if (!v26)
  {
    v42 = PLBackendGetLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v104 = v10;
      __int16 v105 = 2112;
      id v106 = v28;
      _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_ERROR, "Couldn't fetch persons for uuids %@ (%@)", buf, 0x16u);
    }
    id v45 = v28;
    id v7 = v73;
    id v6 = v74;
    goto LABEL_50;
  }
  v71 = v24;
  v72 = v10;
  v81 = v27;
  uint64_t v29 = (void *)MEMORY[0x1E4F1C0D0];
  v30 = +[PLGraphEdge entityName];
  v31 = [v29 fetchRequestWithEntityName:v30];

  v32 = (void *)MEMORY[0x1E4F28BA0];
  v33 = (void *)MEMORY[0x1E4F28F60];
  v76 = v9;
  v34 = [v9 sourceNode];
  v35 = [v33 predicateWithFormat:@"%K = %@", @"sourceNode", v34];
  v102[0] = v35;
  v70 = v26;
  v36 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"targetPerson", v26];
  v102[1] = v36;
  v37 = (void *)MEMORY[0x1E4F28F60];
  v38 = [v83 _personRelationLabelIDsInContext:v8];
  v39 = [v37 predicateWithFormat:@"%K IN %@", @"primaryLabel", v38];
  v102[2] = v39;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:3];
  v41 = [v32 andPredicateWithSubpredicates:v40];
  [v31 setPredicate:v41];

  v42 = v31;
  uint64_t v8 = v77;

  v101[0] = @"targetPerson";
  v101[1] = @"sourceNode";
  v101[2] = @"values";
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:3];
  [v31 setRelationshipKeyPathsForPrefetching:v43];

  id v93 = v81;
  uint64_t v44 = [v77 executeFetchRequest:v31 error:&v93];
  id v45 = v93;

  v80 = (void *)v44;
  if (!v44)
  {
    v46 = PLBackendGetLog();
    id v6 = v74;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = v76;
      v67 = [v76 sourceNode];
      *(_DWORD *)buf = 138412546;
      v104 = v67;
      __int16 v105 = 2112;
      id v106 = v45;
      _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_ERROR, "Couldn't fetch edges for node %@ (%@)", buf, 0x16u);

      id v7 = v73;
LABEL_48:
      long long v24 = v71;
      uint64_t v10 = v72;
      goto LABEL_49;
    }
LABEL_47:
    id v7 = v73;
    uint64_t v9 = v76;
    goto LABEL_48;
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  v46 = v11;
  uint64_t v82 = [v46 countByEnumeratingWithState:&v89 objects:v100 count:16];
  if (!v82)
  {
    id v6 = v74;
    goto LABEL_47;
  }
  id v68 = v45;
  v69 = v31;
  uint64_t v78 = *(void *)v90;
  v79 = v46;
  do
  {
    uint64_t v47 = 0;
    do
    {
      if (*(void *)v90 != v78) {
        objc_enumerationMutation(v46);
      }
      uint64_t v84 = v47;
      v48 = *(void **)(*((void *)&v89 + 1) + 8 * v47);
      v49 = [v48 objectForKeyedSubscript:@"PLSearchEntityPersonRelationTypeKey"];
      __int16 v50 = [v49 integerValue];

      v51 = [v48 objectForKeyedSubscript:@"identifier"];
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v52 = v80;
      uint64_t v53 = [v52 countByEnumeratingWithState:&v85 objects:v99 count:16];
      if (v53)
      {
        uint64_t v54 = v53;
        uint64_t v55 = *(void *)v86;
        while (2)
        {
          for (uint64_t j = 0; j != v54; ++j)
          {
            if (*(void *)v86 != v55) {
              objc_enumerationMutation(v52);
            }
            v57 = *(void **)(*((void *)&v85 + 1) + 8 * j);
            v58 = [v57 edgeValueWithName:@"RelationType"];
            __int16 v59 = [v58 intValue];

            v60 = [v57 targetPerson];
            v61 = v60;
            if (v59 == v50)
            {
              v62 = [v60 personUUID];
              int v63 = [v62 isEqualToString:v51];

              if (v63)
              {
                [v77 deleteObject:v57];

                goto LABEL_29;
              }
            }
          }
          uint64_t v54 = [v52 countByEnumeratingWithState:&v85 objects:v99 count:16];
          if (v54) {
            continue;
          }
          break;
        }
      }
LABEL_29:

      uint64_t v47 = v84 + 1;
      v46 = v79;
    }
    while (v84 + 1 != v82);
    uint64_t v82 = [v79 countByEnumeratingWithState:&v89 objects:v100 count:16];
  }
  while (v82);
  id v7 = v73;
  id v6 = v74;
  uint64_t v9 = v76;
  uint64_t v8 = v77;
  long long v24 = v71;
  uint64_t v10 = v72;
  v42 = v69;
  long long v26 = v70;
  id v45 = v68;
LABEL_49:

LABEL_50:
LABEL_51:

LABEL_52:
}

+ (void)setPersonRelationsFromDictionaries:(id)a3 onPerson:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 managedObjectContext];
  uint64_t v9 = (void *)[v6 mutableCopy];
  v61 = v7;
  uint64_t v10 = [a1 _fetchMeOrSelfSearchEntityForPerson:v7];
  if (!v10)
  {
    v56 = v9;
    v58 = v8;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v59 = v6;
    id v35 = v6;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v69 objects:v78 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v70;
LABEL_18:
      uint64_t v39 = 0;
      while (1)
      {
        if (*(void *)v70 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = *(void **)(*((void *)&v69 + 1) + 8 * v39);
        v41 = [v40 objectForKeyedSubscript:@"PLSearchEntityPersonRelationTypeKey"];
        __int16 v42 = [v41 unsignedIntegerValue];

        if ((unsigned __int16)(v42 - 3) >= 0xFFFEu) {
          break;
        }
        if (v37 == ++v39)
        {
          uint64_t v37 = [v35 countByEnumeratingWithState:&v69 objects:v78 count:16];
          if (v37) {
            goto LABEL_18;
          }
          goto LABEL_24;
        }
      }
      v43 = [v40 objectForKeyedSubscript:@"label"];
      uint64_t v44 = [v40 objectForKeyedSubscript:@"type"];
      uint64_t v45 = [v44 integerValue];
      v46 = [v40 objectForKeyedSubscript:@"identifier"];
      uint64_t v47 = v45;
      uint64_t v8 = v58;
      uint64_t v48 = +[PLSearchEntity _fetchSearchEntityWithLabel:v43 type:v47 identifier:v46 inContext:v58];

      id v11 = (void *)v48;
      if (!v48) {
        id v11 = (void *)[a1 _newNodeContainerWithManagedObjectContext:v58 dictionary:v40];
      }
      v49 = [v40 objectForKeyedSubscript:@"RelationTypeConfidence"];
      [v49 doubleValue];
      id v50 = (id)objc_msgSend(v11, "_insertRelationEdgeForPerson:relationType:confidence:", v61, v42);

      uint64_t v9 = v56;
      [v56 removeObject:v40];

      id v6 = v59;
      if (v11) {
        goto LABEL_3;
      }
    }
    else
    {
LABEL_24:

      uint64_t v8 = v58;
      id v6 = v59;
    }
    uint64_t v13 = PLBackendGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v51 = [v61 personUUID];
      *(_DWORD *)buf = 138412290;
      v75 = v51;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "ERROR: Failed to find or create a person search entity to add relations to for person(%@.", buf, 0xCu);
    }
    id v11 = 0;
    goto LABEL_34;
  }
  id v11 = v10;
  uint64_t v12 = [v10 sourceNode];
  +[PLSearchEntity _removeAllPersonRelationEdgesFromNode:v12];

LABEL_3:
  if ([v9 count])
  {
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __62__PLSearchEntity_setPersonRelationsFromDictionaries_onPerson___block_invoke;
    v68[3] = &__block_descriptor_40_e22__16__0__NSDictionary_8l;
    v68[4] = a1;
    uint64_t v13 = objc_msgSend(v6, "_pl_map:", v68);
    uint64_t v14 = (void *)MEMORY[0x1E4F1C0D0];
    char v15 = +[PLPerson entityName];
    id v16 = [v14 fetchRequestWithEntityName:v15];

    __int16 v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"personUUID", v13];
    [v16 setPredicate:v17];

    id v67 = 0;
    uint64_t v18 = [v8 executeFetchRequest:v16 error:&v67];
    id v19 = v67;
    uint64_t v20 = v19;
    if (v18)
    {
      id v52 = v19;
      uint64_t v53 = v18;
      uint64_t v54 = v16;
      uint64_t v55 = v13;
      v57 = v8;
      v60 = objc_msgSend(v18, "_pl_indexBy:", &__block_literal_global_212_95881);
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id obj = v9;
      uint64_t v21 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            long long v25 = v11;
            if (*(void *)v64 != v23) {
              objc_enumerationMutation(obj);
            }
            long long v26 = *(void **)(*((void *)&v63 + 1) + 8 * i);
            id v27 = [v26 objectForKeyedSubscript:@"PLSearchEntityPersonRelationTypeKey"];
            __int16 v28 = [v27 unsignedIntegerValue];

            if ((unsigned __int16)(v28 - 1) > 1u)
            {
              v30 = [v26 objectForKeyedSubscript:@"identifier"];
              id v29 = [v60 objectForKeyedSubscript:v30];
            }
            else
            {
              id v29 = v61;
            }
            v31 = [v26 objectForKeyedSubscript:@"RelationTypeConfidence"];
            [v31 doubleValue];
            uint64_t v32 = v28;
            id v11 = v25;
            id v33 = (id)objc_msgSend(v25, "_insertRelationEdgeForPerson:relationType:confidence:", v29, v32);
          }
          uint64_t v22 = [obj countByEnumeratingWithState:&v63 objects:v73 count:16];
        }
        while (v22);
      }

      uint64_t v8 = v57;
      uint64_t v13 = v55;
      uint64_t v18 = v53;
      id v16 = v54;
      uint64_t v20 = v52;
      v34 = v60;
    }
    else
    {
      v34 = PLBackendGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v75 = v13;
        __int16 v76 = 2112;
        v77 = v20;
        _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Failed to load PLPersons for personUUIDs: %@ (%@)", buf, 0x16u);
      }
    }

LABEL_34:
  }
}

uint64_t __62__PLSearchEntity_setPersonRelationsFromDictionaries_onPerson___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"identifier"];
}

uint64_t __62__PLSearchEntity_setPersonRelationsFromDictionaries_onPerson___block_invoke_209(uint64_t a1, void *a2)
{
  return [a2 personUUID];
}

+ (void)setSearchRankingsFromDictionaries:(id)a3 inLibrary:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v34 = a4;
  uint64_t v6 = [v34 managedObjectContext];
  id v35 = v5;
  id v45 = 0;
  id v46 = 0;
  v31 = (void *)[v5 mutableCopy];
  id v33 = (void *)v6;
  +[PLSearchEntity _findMatchingNodes:andSearchEntityDictionariesByOID:inSearchEntityDictionaries:inContext:](PLSearchEntity, "_findMatchingNodes:andSearchEntityDictionariesByOID:inSearchEntityDictionaries:inContext:", &v46, &v45);
  id v7 = v46;
  id v8 = v45;
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        char v15 = [v14 objectID];
        id v16 = +[PLGraphNodeContainer newNodeContainerWithNode:v14];
        __int16 v17 = [v8 objectForKeyedSubscript:v15];
        uint64_t v18 = [v17 objectForKeyedSubscript:@"rankingScore"];
        [v18 doubleValue];
        objc_msgSend(v16, "setRankingScore:");

        id v19 = [v8 objectForKeyedSubscript:v15];
        uint64_t v20 = [v19 objectForKeyedSubscript:@"synonyms"];

        if (v20) {
          [v16 setSynonyms:v20];
        }
        [v9 addObject:v15];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v11);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v21 = v31;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v38 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v37 + 1) + 8 * j);
        id v27 = [v34 managedObjectContext];
        id v28 = +[PLSearchEntity _newNodeContainerWithManagedObjectContext:v27 dictionary:v26];

        if (v28)
        {
          id v29 = [v28 sourceNode];
          v30 = [v29 objectID];
          [v9 addObject:v30];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v23);
  }

  [a1 _cleanUpStaleSearchRankingsNotIn:v9 inLibrary:v34];
}

+ (id)predicateForSearchEntitySourceNodes
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K.%K = %d", @"primaryLabel", @"code", 1100);
}

+ (id)decodeIdentifierString:(id)a3 intoLabel:(id *)a4 type:(unint64_t *)a5 outIdentifier:(id *)a6
{
  uint64_t v9 = [a3 dataUsingEncoding:4];
  id v17 = 0;
  uint64_t v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v9 options:0 error:&v17];
  id v11 = v17;
  if (v10)
  {
    if (a4)
    {
      *a4 = [v10 objectForKeyedSubscript:@"label"];
    }
    if (a5)
    {
      uint64_t v12 = [v10 objectForKeyedSubscript:@"type"];
      *a5 = [v12 integerValue];
    }
    if (a6)
    {
      *a6 = [v10 objectForKeyedSubscript:@"identifier"];
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F8B9B8];
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
    char v15 = [v13 successWithResult:v14];
  }
  else
  {
    char v15 = [MEMORY[0x1E4F8B9B8] failureWithError:v11];
  }

  return v15;
}

+ (id)fetchSearchEntityWithEncodedIdentifierString:(id)a3 inLibrary:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a3 dataUsingEncoding:4];
  id v31 = 0;
  id v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v7 options:0 error:&v31];
  id v30 = v31;
  uint64_t v9 = [v8 objectForKeyedSubscript:@"label"];
  uint64_t v10 = [v8 objectForKeyedSubscript:@"identifier"];
  id v11 = [v8 objectForKeyedSubscript:@"type"];
  uint64_t v12 = v11;
  if (v11) {
    BOOL v13 = (v9 | v10) == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    id v29 = v7;
    id v14 = v6;
    char v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = @"N";
      if (v12) {
        id v17 = @"N";
      }
      else {
        id v17 = @"Y";
      }
      if (!(v9 | v10)) {
        id v16 = @"Y";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v17;
      __int16 v37 = 2114;
      long long v38 = v16;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Invalid encoded identifier string for fetching search entity, missing type: %{public}@, missing label/identifier: %{public}@", buf, 0x16u);
    }

    uint64_t v18 = (void *)MEMORY[0x1E4F8B9B8];
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F8C500];
    uint64_t v33 = *MEMORY[0x1E4F28228];
    uint64_t v26 = [NSString stringWithFormat:@"Invalid encoded identifier string for fetching search entity, type: %@, label: %@, identifier: %@", v12, v9, v10];
    id v34 = v26;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    uint64_t v22 = [v19 errorWithDomain:v20 code:46514 userInfo:v21];
    uint64_t v23 = [v18 failureWithError:v22];

    goto LABEL_16;
  }
  uint64_t v24 = [v11 integerValue];
  long long v25 = [v6 managedObjectContext];
  uint64_t v26 = [a1 _fetchSearchEntityWithLabel:v9 type:v24 identifier:v10 inContext:v25];

  id v27 = (void *)MEMORY[0x1E4F8B9B8];
  if (v26)
  {
    id v29 = v7;
    id v14 = v6;
    uint64_t v32 = v26;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    uint64_t v23 = [v27 successWithResult:v21];
LABEL_16:

    id v6 = v14;
    id v7 = v29;
    goto LABEL_17;
  }
  uint64_t v23 = [MEMORY[0x1E4F8B9B8] successWithResult:MEMORY[0x1E4F1CBF0]];
LABEL_17:

  return v23;
}

+ (id)_fetchSearchEntityWithLabel:(id)a3 type:(unint64_t)a4 identifier:(id)a5 inContext:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v12 = NSNumber;
  id v13 = a6;
  id v14 = [v12 numberWithUnsignedInteger:a4];
  char v15 = [v11 dictionaryWithObject:v14 forKey:@"type"];

  [v15 setObject:v9 forKeyedSubscript:@"label"];
  [v15 setObject:v10 forKeyedSubscript:@"identifier"];
  id v16 = [MEMORY[0x1E4F1CA48] arrayWithObject:v15];
  id v24 = 0;
  id v25 = 0;
  +[PLSearchEntity _findMatchingNodes:&v25 andSearchEntityDictionariesByOID:&v24 inSearchEntityDictionaries:v16 inContext:v13];

  id v17 = v25;
  id v18 = v24;
  if ((unint64_t)[v17 count] >= 2)
  {
    id v19 = PLBackendGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [v17 count];
      *(_DWORD *)buf = 138413058;
      id v27 = v9;
      __int16 v28 = 2114;
      id v29 = v10;
      __int16 v30 = 2048;
      unint64_t v31 = a4;
      __int16 v32 = 2048;
      uint64_t v33 = v20;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Expected to get 1 or less matches for [label: %@, identifier: %{public}@, type: %lu], got %tu", buf, 0x2Au);
    }
  }
  id v21 = [v17 firstObject];
  if (v21) {
    id v22 = +[PLGraphNodeContainer newNodeContainerWithNode:v21];
  }
  else {
    id v22 = 0;
  }

  return v22;
}

+ (BOOL)enumerateAssetSearchEntitiesForLibrary:(id)a3 error:(id *)a4 withBlock:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"PLSearchEntity.m", 864, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__PLSearchEntity_enumerateAssetSearchEntitiesForLibrary_error_withBlock___block_invoke;
  v15[3] = &unk_1E5873370;
  id v16 = v9;
  id v17 = v10;
  id v18 = a4;
  id v11 = v10;
  id v12 = v9;
  [v12 performBlockAndWait:v15];

  return 1;
}

void __73__PLSearchEntity_enumerateAssetSearchEntitiesForLibrary_error_withBlock___block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = +[PLSearchEntity _labelIDWithCode:1100 inContext:v2];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F1C0D0];
    id v5 = +[PLGraphNode entityName];
    id v6 = [v4 fetchRequestWithEntityName:v5];

    id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"primaryLabel", v3];
    [v6 setPredicate:v7];

    v20[0] = @"values";
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [v6 setRelationshipKeyPathsForPrefetching:v8];

    [v6 setReturnsObjectsAsFaults:0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __73__PLSearchEntity_enumerateAssetSearchEntitiesForLibrary_error_withBlock___block_invoke_2;
    v14[3] = &unk_1E58720B8;
    id v15 = *(id *)(a1 + 40);
    id v9 = [v2 enumerateObjectsFromFetchRequest:v6 usingDefaultBatchSizeWithBlock:v14];
    id v10 = v9;
    if (*(void *)(a1 + 48) && v9)
    {
      id v11 = v9;
      **(void **)(a1 + 48) = v11;
      id v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v17 = v13;
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Enumeration of asset search entities failed for library %@ (ERROR: %@)", buf, 0x16u);
      }
    }
  }
}

void __73__PLSearchEntity_enumerateAssetSearchEntitiesForLibrary_error_withBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = +[PLGraphNodeContainer newNodeContainerWithNode:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)enumerateAssetSearchEntitiesForMoment:(id)a3 withBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void *, unsigned char *))a4;
  if (!v8)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PLSearchEntity.m", 851, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  +[PLSearchEntity _fetchSearchEntityNodesForMoment:v7];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = (void *)[a1 newNodeContainerWithNode:*(void *)(*((void *)&v18 + 1) + 8 * v13)];
      unsigned __int8 v17 = 0;
      v8[2](v8, v14, &v17);
      int v15 = v17;

      if (v15) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

+ (void)setAssetSearchEntitiesFromDictionaries:(id)a3 onMoment:(id)a4
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v83 = a4;
  id v7 = PLBackendGetLog();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  id v9 = v7;
  uint64_t v10 = v9;
  unint64_t v71 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLSearchEntityDonationToMoment", "", buf, 2u);
  }
  os_signpost_id_t spid = v8;
  long long v70 = v10;

  uint64_t v68 = mach_absolute_time();
  id v69 = a1;
  uint64_t v11 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v12 = [a1 _fetchSearchEntityNodesForMoment:v83];
  __int16 v76 = [v11 setWithArray:v12];

  uint64_t v13 = [v83 photoLibrary];
  uint64_t v14 = [v13 managedObjectContext];

  v73 = v6;
  id v96 = 0;
  id v97 = 0;
  v80 = (void *)[v6 mutableCopy];
  long long v72 = (void *)v14;
  +[PLSearchEntity _findMatchingNodes:andSearchEntityDictionariesByOID:inSearchEntityDictionaries:inContext:](PLSearchEntity, "_findMatchingNodes:andSearchEntityDictionariesByOID:inSearchEntityDictionaries:inContext:", &v97, &v96);
  id v15 = v97;
  id v75 = v96;
  id v16 = +[PLSearchEntity _fetchEdgesForNodes:v15 toMoment:v83];
  unsigned __int8 v17 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id obj = v16;
  uint64_t v18 = [obj countByEnumeratingWithState:&v92 objects:v105 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v93;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v93 != v20) {
          objc_enumerationMutation(obj);
        }
        id v22 = *(void **)(*((void *)&v92 + 1) + 8 * i);
        uint64_t v23 = objc_msgSend(v22, "sourceNode", spid);
        id v24 = [v23 objectID];
        [v17 setObject:v22 forKeyedSubscript:v24];
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v92 objects:v105 count:16];
    }
    while (v19);
  }
  id v74 = v17;

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v77 = v15;
  uint64_t v26 = v75;
  id v25 = v76;
  id v81 = (id)[v77 countByEnumeratingWithState:&v88 objects:v104 count:16];
  if (v81)
  {
    uint64_t v79 = *(void *)v89;
    do
    {
      for (uint64_t j = 0; j != v81; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v89 != v79) {
          objc_enumerationMutation(v77);
        }
        __int16 v28 = *(void **)(*((void *)&v88 + 1) + 8 * (void)j);
        id v29 = objc_msgSend(v28, "objectID", spid);
        if ([v25 containsObject:v28])
        {
          __int16 v30 = [v74 objectForKeyedSubscript:v29];
          unint64_t v31 = [v26 objectForKeyedSubscript:v29];
          __int16 v32 = [v31 objectForKeyedSubscript:@"Confidence"];
          [v32 doubleValue];
          double v34 = v33;

          +[PLSearchEntity _setConfidence:v30 onEdge:v34];
          id v35 = [v26 objectForKeyedSubscript:v29];
          uint64_t v36 = [v35 objectForKeyedSubscript:@"DateIntervalStart"];

          __int16 v37 = [v26 objectForKeyedSubscript:v29];
          long long v38 = [v37 objectForKeyedSubscript:@"DateIntervalEnd"];

          +[PLSearchEntity _setDateIntervalStart:v36 end:v38 onEdge:v30];
          id v39 = +[PLGraphNodeContainer newNodeContainerWithNode:v28];
        }
        else
        {
          id v39 = +[PLGraphNodeContainer newNodeContainerWithNode:v28];
          __int16 v30 = [v26 objectForKeyedSubscript:v29];
          uint64_t v36 = [v30 objectForKeyedSubscript:@"Confidence"];
          [v36 doubleValue];
          double v41 = v40;
          long long v38 = [v26 objectForKeyedSubscript:v29];
          long long v42 = [v38 objectForKeyedSubscript:@"DateIntervalStart"];
          long long v43 = [v26 objectForKeyedSubscript:v29];
          long long v44 = [v43 objectForKeyedSubscript:@"DateIntervalEnd"];
          id v45 = (id)[v39 _insertMomentEdgeForMoment:v83 confidence:v42 startDate:v44 endDate:v41];

          uint64_t v26 = v75;
          id v25 = v76;
        }

        id v46 = [v26 objectForKeyedSubscript:v29];
        uint64_t v47 = [v46 objectForKeyedSubscript:@"synonyms"];
        [v39 setSynonyms:v47];

        [v25 removeObject:v28];
        uint64_t v48 = [v26 objectForKeyedSubscript:v29];
        [v80 removeObject:v48];
      }
      id v81 = (id)[v77 countByEnumeratingWithState:&v88 objects:v104 count:16];
    }
    while (v81);
  }

  [v69 _disconnectNodes:v25 fromMoment:v83];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v82 = v80;
  uint64_t v49 = [v82 countByEnumeratingWithState:&v84 objects:v103 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v85;
    do
    {
      for (uint64_t k = 0; k != v50; ++k)
      {
        if (*(void *)v85 != v51) {
          objc_enumerationMutation(v82);
        }
        uint64_t v53 = *(void **)(*((void *)&v84 + 1) + 8 * k);
        uint64_t v54 = objc_msgSend(v83, "managedObjectContext", spid);
        id v55 = +[PLSearchEntity _newNodeContainerWithManagedObjectContext:v54 dictionary:v53];

        v56 = [v53 objectForKeyedSubscript:@"Confidence"];
        [v56 doubleValue];
        double v58 = v57;
        id v59 = [v53 objectForKeyedSubscript:@"DateIntervalStart"];
        v60 = [v53 objectForKeyedSubscript:@"DateIntervalEnd"];
        id v61 = (id)[v55 _insertMomentEdgeForMoment:v83 confidence:v59 startDate:v60 endDate:v58];
      }
      uint64_t v50 = [v82 countByEnumeratingWithState:&v84 objects:v103 count:16];
    }
    while (v50);
  }

  uint64_t v62 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  long long v65 = v70;
  long long v66 = v65;
  if (v71 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v66, OS_SIGNPOST_INTERVAL_END, spid, "PLSearchEntityDonationToMoment", "", buf, 2u);
  }

  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v100 = "PLSearchEntityDonationToMoment";
    __int16 v101 = 2048;
    double v102 = (float)((float)((float)((float)(v62 - v68) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_19B3C7000, v66, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

+ (id)synonymsFromSynonymsString:(id)a3
{
  return (id)[a3 componentsSeparatedByString:@"|"];
}

+ (id)synonymsStringFromSynonyms:(id)a3
{
  return (id)[a3 componentsJoinedByString:@"|"];
}

+ (id)_labelWithCode:(unsigned int)a3 inContext:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_msgSend(v5, "pl_graphCache");
  id v7 = [v6 labelWithCode:v4 inContext:v5];

  if (!v7)
  {
    os_signpost_id_t v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F8C500];
      uint64_t v14 = *MEMORY[0x1E4F28228];
      id v15 = @"No search search entities found";
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      uint64_t v12 = [v9 errorWithDomain:v10 code:41004 userInfo:v11];
      *(_DWORD *)buf = 67109378;
      int v17 = 1100;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Failed to find label for code \"%u\" (Error: %@)", buf, 0x12u);
    }
  }
  return v7;
}

+ (id)_labelIDWithCode:(unsigned int)a3 inContext:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_msgSend(v5, "pl_graphCache");
  id v7 = [v6 objectIDForLabelWithCode:v4 inContext:v5];

  if (!v7)
  {
    os_signpost_id_t v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F8C500];
      uint64_t v14 = *MEMORY[0x1E4F28228];
      id v15 = @"No search search entities found";
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      uint64_t v12 = [v9 errorWithDomain:v10 code:41004 userInfo:v11];
      *(_DWORD *)buf = 67109378;
      int v17 = 1100;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "Failed to find label for code \"%u\" (Error: %@)", buf, 0x12u);
    }
  }
  return v7;
}

+ (void)prepareForDeletingOutgoingEdge:(id)a3
{
  id v4 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___PLSearchEntity;
  objc_msgSendSuper2(&v14, sel_prepareForDeletingOutgoingEdge_, v4);
  objc_opt_class();
  id v5 = [v4 managedObjectContext];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    os_signpost_id_t v8 = [v4 targetMoment];
    id v9 = [v8 uuid];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      uint64_t v11 = [v4 targetMoment];
      uint64_t v12 = [v11 uuid];
      id v13 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:v12 flags:2048 managedObjectContext:v7];
    }
  }
}

+ (void)willInsertOutgoingEdge:(id)a3
{
  id v4 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___PLSearchEntity;
  objc_msgSendSuper2(&v14, sel_willInsertOutgoingEdge_, v4);
  objc_opt_class();
  id v5 = [v4 managedObjectContext];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    uint64_t v8 = [v4 targetMoment];
    if (v8)
    {
      id v9 = (void *)v8;
      int v10 = [v4 isInserted];

      if (v10)
      {
        uint64_t v11 = [v4 targetMoment];
        uint64_t v12 = [v11 uuid];
        id v13 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:v12 flags:2048 managedObjectContext:v7];
      }
    }
  }
}

+ (void)prepareForDeletionWithNode:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 managedObjectContext];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (!v6) {
    goto LABEL_24;
  }
  id v7 = +[PLGraphNodeContainer newNodeContainerWithNode:v3];
  if ([v7 type])
  {
    uint64_t v8 = [v7 label];
    if (v8)
    {

LABEL_9:
      int v10 = [v7 encodedIdentifierString];
      id v11 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:v10 flags:512 managedObjectContext:v6];

      goto LABEL_10;
    }
    id v9 = [v7 identifier];

    if (v9) {
      goto LABEL_9;
    }
  }
LABEL_10:
  id v28 = 0;
  uint64_t v12 = [v7 fetchAllMomentsWithError:&v28];
  id v13 = v28;
  if (!v12)
  {
    objc_super v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v7;
      __int16 v32 = 2112;
      id v33 = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Fetch failed for all moment associated with search entity %@ (%@)", buf, 0x16u);
    }
  }
  uint64_t v23 = v13;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (([v20 isDeleted] & 1) == 0)
        {
          long long v21 = [v20 uuid];
          id v22 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:v21 flags:2048 managedObjectContext:v6];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v17);
  }

LABEL_24:
}

+ (void)willSaveWithNode:(id)a3
{
  id v15 = a3;
  id v3 = [v15 managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v15 isDeleted] & 1) == 0)
  {
    id v4 = +[PLGraphNodeContainer newNodeContainerWithNode:v15];
    if ([v4 type])
    {
      id v5 = [v4 label];
      if (v5)
      {

LABEL_7:
        if ([v15 isInserted])
        {
          [v4 rankingScore];
          if (v7 == 0.0) {
            uint64_t v8 = 1026;
          }
          else {
            uint64_t v8 = 1538;
          }
          id v9 = [v4 encodedIdentifierString];
          id v10 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:v9 flags:v8 managedObjectContext:v3];
        }
        else
        {
          id v9 = [v15 nodeValueWithName:@"rankingScore"];
          if ([v9 isInsertedDeletedOrChanged]) {
            uint64_t v11 = 512;
          }
          else {
            uint64_t v11 = 0;
          }
          uint64_t v12 = [v15 nodeValueWithName:@"synonymsString"];
          if ([v12 isInsertedDeletedOrChanged]) {
            v11 |= 0x400uLL;
          }
          if (v11)
          {
            id v13 = [v4 encodedIdentifierString];
            id v14 = +[PLBackgroundJobWorkItem insertDonateToSearchIndexWorkItemIfNeededWithIdentifier:v13 flags:v11 managedObjectContext:v3];
          }
        }

        goto LABEL_21;
      }
      id v6 = [v4 identifier];

      if (v6) {
        goto LABEL_7;
      }
    }
LABEL_21:
  }
}

+ (id)newNodeContainerWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  id v5 = +[PLSearchEntity _labelWithCode:1100 inContext:v4];
  id v6 = +[PLGraphNode insertGraphNodeInContext:v4 withPrimaryLabel:v5];

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___PLSearchEntity;
  double v7 = objc_msgSend(objc_msgSendSuper2(&v11, sel_alloc), "initWithNode:", v6);
  uint64_t v8 = [MEMORY[0x1E4F29128] UUID];
  id v9 = [v8 UUIDString];
  [v7 setUuid:v9];

  return v7;
}

+ (id)_newNodeContainerWithManagedObjectContext:(id)a3 dictionary:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 objectForKeyedSubscript:@"label"];
  uint64_t v9 = [v7 objectForKeyedSubscript:@"identifier"];
  id v10 = [v7 objectForKeyedSubscript:@"type"];
  uint64_t v11 = [v10 integerValue];

  if (!v11)
  {
    uint64_t v18 = PLBackendGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v23) = 0;
      uint64_t v19 = "Attempting to set an unknown type";
      uint64_t v20 = v18;
      uint32_t v21 = 2;
LABEL_8:
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_FAULT, v19, (uint8_t *)&v23, v21);
    }
LABEL_9:

    uint64_t v12 = 0;
    goto LABEL_10;
  }
  if (!(v8 | v9))
  {
    uint64_t v18 = PLBackendGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      int v23 = 134218240;
      uint64_t v24 = 0;
      __int16 v25 = 2048;
      uint64_t v26 = 0;
      uint64_t v19 = "Attempting to set nil label (%p) or identifier (%p)";
      uint64_t v20 = v18;
      uint32_t v21 = 22;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  uint64_t v12 = (void *)[a1 newNodeContainerWithManagedObjectContext:v6];
  id v13 = [v7 objectForKeyedSubscript:@"label"];
  [v12 setLabel:v13];

  id v14 = [v7 objectForKeyedSubscript:@"identifier"];
  [v12 setIdentifier:v14];

  id v15 = [v7 objectForKeyedSubscript:@"type"];
  objc_msgSend(v12, "setType:", objc_msgSend(v15, "integerValue"));

  uint64_t v16 = [v7 objectForKeyedSubscript:@"rankingScore"];
  [v16 doubleValue];
  objc_msgSend(v12, "setRankingScore:");

  uint64_t v17 = [v7 objectForKeyedSubscript:@"synonyms"];
  [v12 setSynonyms:v17];

LABEL_10:
  return v12;
}

+ (id)_fetchEdgesForPersonRelationsOnPerson:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 managedObjectContext];
  id v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = +[PLGraphEdge entityName];
  id v7 = [v5 fetchRequestWithEntityName:v6];

  uint64_t v8 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"targetPerson", v3];
  v24[0] = v9;
  id v10 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v11 = +[PLSearchEntity _personRelationLabelIDsInContext:v4];
  uint64_t v12 = [v10 predicateWithFormat:@"%K IN %@", @"primaryLabel", v11];
  v24[1] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  id v14 = [v8 andPredicateWithSubpredicates:v13];
  [v7 setPredicate:v14];

  id v19 = 0;
  id v15 = [v4 executeFetchRequest:v7 error:&v19];
  id v16 = v19;
  if (!v15)
  {
    uint64_t v17 = PLBackendGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v3;
      __int16 v22 = 2112;
      id v23 = v16;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Fetch for person relation edges failed for person %@, (%@)", buf, 0x16u);
    }
  }
  return v15;
}

+ (id)_fetchEdgesForPersonRelationsOnSearchEntityForPerson:(id)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 managedObjectContext];
  id v5 = +[PLSearchEntity _fetchMeOrSelfEdgeForPerson:v3];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1C0D0];
    id v7 = +[PLGraphEdge entityName];
    uint64_t v8 = [v6 fetchRequestWithEntityName:v7];

    uint64_t v9 = (void *)MEMORY[0x1E4F28BA0];
    id v10 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v11 = [v5 sourceNode];
    uint64_t v12 = [v10 predicateWithFormat:@"%K = %@", @"sourceNode", v11];
    v29[0] = v12;
    id v13 = (void *)MEMORY[0x1E4F28F60];
    id v14 = +[PLSearchEntity _personRelationLabelIDsInContext:v4];
    id v15 = [v13 predicateWithFormat:@"%K IN %@", @"primaryLabel", v14];
    v29[1] = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    uint64_t v17 = [v9 andPredicateWithSubpredicates:v16];
    [v8 setPredicate:v17];

    v28[0] = @"targetPerson";
    v28[1] = @"values";
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    [v8 setRelationshipKeyPathsForPrefetching:v18];

    id v23 = 0;
    id v19 = [v4 executeFetchRequest:v8 error:&v23];
    id v20 = v23;
    if (!v19)
    {
      id v21 = PLBackendGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v25 = v3;
        __int16 v26 = 2112;
        id v27 = v20;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Fetch for person relation edges failed for person %@, (%@)", buf, 0x16u);
      }
    }
  }
  else
  {
    id v19 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

+ (id)_fetchMeOrSelfSearchEntityForPerson:(id)a3
{
  id v3 = +[PLSearchEntity _fetchMeOrSelfEdgeForPerson:a3];
  id v4 = [v3 sourceNode];

  if (v4) {
    id v5 = +[PLGraphNodeContainer newNodeContainerWithNode:v4];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

+ (id)_fetchMeOrSelfEdgeForPerson:(id)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 managedObjectContext];
  id v6 = [a1 _labelIDWithCode:1102 inContext:v5];
  id v7 = [a1 _labelIDWithCode:1103 inContext:v5];
  uint64_t v8 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v9 = +[PLGraphEdge entityName];
  id v10 = [v8 fetchRequestWithEntityName:v9];

  uint64_t v11 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v12 = (void *)MEMORY[0x1E4F28F60];
  v32[0] = v6;
  v32[1] = v7;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  id v14 = [v12 predicateWithFormat:@"%K IN %@", @"primaryLabel", v13];
  v33[0] = v14;
  id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"noindex:(%K) = %@", @"targetPerson", v4];
  v33[1] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  uint64_t v17 = [v11 andPredicateWithSubpredicates:v16];
  [v10 setPredicate:v17];

  id v31 = @"sourceNode";
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  [v10 setRelationshipKeyPathsForPrefetching:v18];

  id v24 = 0;
  id v19 = [v5 executeFetchRequest:v10 error:&v24];
  id v20 = v24;
  if (v19)
  {
    id v21 = [v19 firstObject];
  }
  else
  {
    __int16 v22 = PLBackendGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v26 = v4;
      __int16 v27 = 2112;
      id v28 = v5;
      __int16 v29 = 2112;
      id v30 = v20;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Failed to fetch me/self graph edge for person %@ in context %@ (%@)", buf, 0x20u);
    }

    id v21 = 0;
  }

  return v21;
}

+ (void)_removeAllPersonRelationEdgesFromPerson:(id)a3
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 managedObjectContext];
  id v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = +[PLGraphEdge entityName];
  id v7 = [v5 fetchRequestWithEntityName:v6];

  uint64_t v8 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"targetPerson", v3];
  v36[0] = v9;
  id v10 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v11 = +[PLSearchEntity _personRelationLabelIDsInContext:v4];
  uint64_t v12 = [v10 predicateWithFormat:@"%K IN %@", @"primaryLabel", v11];
  v36[1] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  id v14 = [v8 andPredicateWithSubpredicates:v13];
  [v7 setPredicate:v14];

  v35[0] = @"targetPerson";
  v35[1] = @"sourceNode";
  v35[2] = @"values";
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
  [v7 setRelationshipKeyPathsForPrefetching:v15];

  id v29 = 0;
  id v16 = [v4 executeFetchRequest:v7 error:&v29];
  id v17 = v29;
  if (v16)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          [v4 deleteObject:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v20);
    }
  }
  else
  {
    id v18 = +[PLSearchEntity _fetchMeOrSelfSearchEntityForPerson:v3];
    id v23 = PLBackendGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = [v18 sourceNode];
      *(_DWORD *)buf = 138412546;
      __int16 v32 = v24;
      __int16 v33 = 2112;
      id v34 = v17;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Couldn't fetch edges for node %@ (%@)", buf, 0x16u);
    }
  }
}

+ (void)_removeAllPersonRelationEdgesFromNode:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 managedObjectContext];
  id v6 = (void *)MEMORY[0x1E4F28BA0];
  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"sourceNode", v4];

  v13[0] = v7;
  uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v9 = [a1 _personRelationLabelIDsInContext:v5];
  id v10 = [v8 predicateWithFormat:@"%K IN %@", @"primaryLabel", v9];
  v13[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v12 = [v6 andPredicateWithSubpredicates:v11];

  +[PLSearchEntity _removeAllEdgesWithPredicate:v12 inContext:v5];
}

+ (id)_personRelationLabelIDsInContext:(id)a3
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 _labelIDWithCode:1101 inContext:v4];
  id v6 = objc_msgSend(a1, "_labelIDWithCode:inContext:", 1102, v4, v5);
  v10[1] = v6;
  id v7 = [a1 _labelIDWithCode:1103 inContext:v4];

  v10[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];

  return v8;
}

+ (void)_cleanUpStaleSearchRankingsNotIn:(id)a3 inLibrary:(id)a4
{
  v73[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v56 = a4;
  id v6 = [v56 managedObjectContext];
  uint64_t v7 = +[PLSearchEntity _labelIDWithCode:1100 inContext:v6];
  uint64_t v8 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v9 = +[PLGraphNode entityName];
  id v10 = [v8 fetchRequestWithEntityName:v9];

  uint64_t v11 = (void *)MEMORY[0x1E4F28BA0];
  id v55 = (void *)v7;
  uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"primaryLabel", v7];
  v73[0] = v12;
  id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT self IN %@", v5];
  v73[1] = v13;
  id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K.%K = %@", @"values", @"valueName", @"rankingScore"];
  v73[2] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:3];
  id v16 = [v11 andPredicateWithSubpredicates:v15];
  [v10 setPredicate:v16];

  [v10 setResultType:1];
  [v10 setFetchBatchSize:100];
  id v67 = 0;
  id v17 = [v6 executeFetchRequest:v10 error:&v67];
  id v18 = v67;
  if (!v17)
  {
    uint64_t v19 = PLBackendGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v72 = v18;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Failed to execute fetch to find nodes delete or un-rank (%@)", buf, 0xCu);
    }
  }
  if ([v17 count])
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v21 = +[PLGraphEdge entityName];
    __int16 v22 = [v20 fetchRequestWithEntityName:v21];

    id v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"sourceNode", v17];
    [v22 setPredicate:v23];

    long long v70 = @"sourceNode";
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
    [v22 setRelationshipKeyPathsForPrefetching:v24];

    [v22 setFetchBatchSize:100];
    id v66 = v18;
    long long v25 = [v6 executeFetchRequest:v22 error:&v66];
    id v26 = v66;

    if (v25)
    {
      uint64_t v50 = v26;
      uint64_t v51 = v22;
      id v53 = v5;
      uint64_t v54 = v17;
      long long v27 = [MEMORY[0x1E4F1CA80] set];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v52 = v25;
      id v28 = v25;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v62 objects:v69 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v63;
        do
        {
          uint64_t v32 = 0;
          do
          {
            if (*(void *)v63 != v31) {
              objc_enumerationMutation(v28);
            }
            __int16 v33 = *(void **)(*((void *)&v62 + 1) + 8 * v32);
            id v34 = (void *)MEMORY[0x19F38D3B0]();
            id v35 = [v33 sourceNode];
            id v36 = +[PLGraphNodeContainer newNodeContainerWithNode:v35];
            [v36 setRankingScore:0.0];
            __int16 v37 = [v35 objectID];
            [v27 addObject:v37];

            ++v32;
          }
          while (v30 != v32);
          uint64_t v30 = [v28 countByEnumeratingWithState:&v62 objects:v69 count:16];
        }
        while (v30);
      }

      long long v38 = [MEMORY[0x1E4F1CA80] setWithArray:v54];
      [v38 minusSet:v27];
      id v39 = (void *)MEMORY[0x1E4F1C0D0];
      double v40 = +[PLGraphNode entityName];
      double v41 = [v39 fetchRequestWithEntityName:v40];

      long long v42 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v38];
      [v41 setPredicate:v42];

      [v41 setFetchBatchSize:100];
      id v61 = v50;
      long long v43 = [v6 executeFetchRequest:v41 error:&v61];
      id v44 = v61;

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v45 = v43;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v57 objects:v68 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v58;
        do
        {
          uint64_t v49 = 0;
          do
          {
            if (*(void *)v58 != v48) {
              objc_enumerationMutation(v45);
            }
            [v6 deleteObject:*(void *)(*((void *)&v57 + 1) + 8 * v49++)];
          }
          while (v47 != v49);
          uint64_t v47 = [v45 countByEnumeratingWithState:&v57 objects:v68 count:16];
        }
        while (v47);
      }

      id v26 = v44;
      __int16 v22 = v41;
      id v5 = v53;
      id v17 = v54;
      long long v25 = v52;
    }
    else
    {
      long long v27 = PLBackendGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v72 = v26;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Failed to execute fetch to find edges to nodes un-rank (%@)", buf, 0xCu);
      }
    }

    id v18 = v26;
    id v10 = v22;
  }
}

+ (void)_setDateIntervalStart:(id)a3 end:(id)a4 onEdge:(id)a5
{
  id v15 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v8 edgeValueWithName:@"DateIntervalStart" createIfMissing:1];
  id v10 = [v8 edgeValueWithName:@"DateIntervalEnd" createIfMissing:1];

  uint64_t v11 = [v9 dateValue];
  char v12 = [v11 isEqualToDate:v15];

  if ((v12 & 1) == 0) {
    [v9 setDateValue:v15];
  }
  id v13 = [v10 dateValue];
  char v14 = [v13 isEqualToDate:v7];

  if ((v14 & 1) == 0) {
    [v10 setDateValue:v7];
  }
}

+ (void)_setConfidence:(double)a3 onEdge:(id)a4
{
  id v6 = [a4 edgeValueWithName:@"Confidence" createIfMissing:1];
  [v6 floatValue];
  if (v5 != a3) {
    [v6 setFloatValue:a3];
  }
}

+ (id)_fetchEdgesForNodes:(id)a3 toMoment:(id)a4
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 managedObjectContext];
  id v8 = +[PLSearchEntity _labelIDWithCode:1100 inContext:v7];

  uint64_t v9 = (void *)MEMORY[0x1E4F1C0D0];
  id v10 = +[PLGraphEdge entityName];
  uint64_t v11 = [v9 fetchRequestWithEntityName:v10];

  char v12 = (void *)MEMORY[0x1E4F28BA0];
  id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"targetMoment", v5];
  v26[0] = v13;
  char v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"sourceNode", v6];

  v26[1] = v14;
  id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"primaryLabel", v8];
  v26[2] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
  id v17 = [v12 andPredicateWithSubpredicates:v16];
  [v11 setPredicate:v17];

  id v18 = [v5 managedObjectContext];

  id v23 = 0;
  uint64_t v19 = [v18 executeFetchRequest:v11 error:&v23];
  id v20 = v23;

  if (!v19)
  {
    uint64_t v21 = PLBackendGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v20;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to execute fetch to find nodes delete or un-rank (%@)", buf, 0xCu);
    }
  }
  return v19;
}

+ (id)_fetchSearchEntityNodesForMoment:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 managedObjectContext];
  uint64_t v5 = +[PLSearchEntity _labelIDWithCode:1100 inContext:v4];
  id v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = +[PLGraphEdge entityName];
  id v8 = [v6 fetchRequestWithEntityName:v7];

  v35[0] = @"sourceNode";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  [v8 setRelationshipKeyPathsForPrefetching:v9];

  id v10 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"targetMoment", v3];
  v34[0] = v11;
  id v26 = (void *)v5;
  char v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"noindex:(%K) = %@", @"primaryLabel", v5];
  v34[1] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  char v14 = [v10 andPredicateWithSubpredicates:v13];
  [v8 setPredicate:v14];

  id v28 = 0;
  id v15 = [v4 executeFetchRequest:v8 error:&v28];
  id v16 = v28;
  if (v15)
  {
    id v17 = [v15 valueForKey:@"sourceNode"];
    id v18 = (void *)MEMORY[0x1E4F1C0D0];
    uint64_t v19 = +[PLGraphNode entityName];
    id v20 = [v18 fetchRequestWithEntityName:v19];

    uint64_t v29 = @"values";
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    [v20 setRelationshipKeyPathsForPrefetching:v21];

    __int16 v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN %@", v17];
    [v20 setPredicate:v22];

    id v27 = v16;
    id v23 = [v4 executeFetchRequest:v20 error:&v27];
    id v24 = v27;

    id v16 = v24;
    id v8 = v20;
  }
  else
  {
    id v17 = PLBackendGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v3;
      __int16 v32 = 2112;
      id v33 = v16;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Failed to fetch edges to moment %@ (%@)", buf, 0x16u);
    }
    id v23 = 0;
  }

  return v23;
}

+ (void)_disconnectNodes:(id)a3 fromMoment:(id)a4
{
  v82[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 managedObjectContext];
  id v8 = [v6 managedObjectContext];
  uint64_t v9 = +[PLSearchEntity _labelIDWithCode:1100 inContext:v8];

  id v10 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v11 = +[PLGraphEdge entityName];
  char v12 = [v10 fetchRequestWithEntityName:v11];

  id v13 = (void *)MEMORY[0x1E4F28BA0];
  id v52 = (void *)v9;
  char v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"primaryLabel", v9];
  v82[0] = v14;
  id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"sourceNode", v5];
  v82[1] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
  id v17 = [v13 andPredicateWithSubpredicates:v16];
  [v12 setPredicate:v17];

  id v81 = @"sourceNode";
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
  [v12 setRelationshipKeyPathsForPrefetching:v18];

  id v71 = 0;
  long long v58 = v7;
  uint64_t v51 = v12;
  uint64_t v19 = [v7 executeFetchRequest:v12 error:&v71];
  id v20 = v71;
  uint64_t v21 = v20;
  if (v19)
  {
    id v48 = v20;
    id v50 = v5;
    __int16 v22 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    uint64_t v49 = v19;
    id v23 = v19;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v67 objects:v74 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v68 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          uint64_t v29 = [v28 sourceNode];
          uint64_t v30 = [v29 objectID];

          id v31 = [v22 objectForKeyedSubscript:v30];
          if (!v31)
          {
            id v31 = [MEMORY[0x1E4F1CA48] array];
            [v22 setObject:v31 forKeyedSubscript:v30];
          }
          [v31 addObject:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v67 objects:v74 count:16];
      }
      while (v25);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    __int16 v32 = v22;
    uint64_t v55 = [v32 countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v55)
    {
      uint64_t v53 = *(void *)v64;
      uint64_t v54 = v32;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v64 != v53) {
            objc_enumerationMutation(v32);
          }
          uint64_t v57 = v33;
          id v34 = [v32 objectForKeyedSubscript:*(void *)(*((void *)&v63 + 1) + 8 * v33)];
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          uint64_t v35 = [v34 countByEnumeratingWithState:&v59 objects:v72 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v60;
            do
            {
              for (uint64_t j = 0; j != v36; ++j)
              {
                if (*(void *)v60 != v37) {
                  objc_enumerationMutation(v34);
                }
                id v39 = *(void **)(*((void *)&v59 + 1) + 8 * j);
                double v40 = [v39 targetMoment];
                double v41 = [v40 objectID];
                long long v42 = [v6 objectID];
                int v43 = [v41 isEqual:v42];

                if (v43)
                {
                  [v58 deleteObject:v39];
                  if ([v34 count] == 1)
                  {
                    id v44 = [v39 sourceNode];
                    id v45 = +[PLGraphNodeContainer newNodeContainerWithNode:v44];

                    [v45 rankingScore];
                    if (v46 == 0.0)
                    {
                      uint64_t v47 = [v39 sourceNode];
                      [v58 deleteObject:v47];
                    }
                  }
                }
              }
              uint64_t v36 = [v34 countByEnumeratingWithState:&v59 objects:v72 count:16];
            }
            while (v36);
          }

          uint64_t v33 = v57 + 1;
          __int16 v32 = v54;
        }
        while (v57 + 1 != v55);
        uint64_t v55 = [v54 countByEnumeratingWithState:&v63 objects:v73 count:16];
      }
      while (v55);
    }

    uint64_t v19 = v49;
    id v5 = v50;
    uint64_t v21 = v48;
  }
  else
  {
    __int16 v32 = PLBackendGetLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v76 = a1;
      __int16 v77 = 2112;
      id v78 = v6;
      __int16 v79 = 2112;
      v80 = v21;
      _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "Failed to find graph edge from search entity (%@) to moment (%@) (%@)", buf, 0x20u);
    }
  }
}

+ (void)_removeAllSearchEntityEdgesFromMoment:(id)a3
{
  id v3 = a3;
  id v5 = +[PLSearchEntity _predicateForSearchEntityEdgesToMoment:v3];
  id v4 = [v3 managedObjectContext];

  +[PLSearchEntity _removeAllEdgesWithPredicate:v5 inContext:v4];
}

+ (id)_predicateForSearchEntityEdgesToMoment:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 managedObjectContext];
  id v5 = +[PLSearchEntity _labelIDWithCode:1100 inContext:v4];

  id v6 = (void *)MEMORY[0x1E4F28BA0];
  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"targetMoment", v3];

  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"primaryLabel", v5];
  v12[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v10 = [v6 andPredicateWithSubpredicates:v9];

  return v10;
}

+ (void)_findMatchingNodes:(id *)a3 andSearchEntityDictionariesByOID:(id *)a4 inSearchEntityDictionaries:(id)a5 inContext:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  uint64_t v25 = a3;
  if (!a3)
  {
    __int16 v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"PLSearchEntity.m", 193, @"Invalid parameter not satisfying: %@", @"outMatchingNodes" object file lineNumber description];
  }
  if (!a4)
  {
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"PLSearchEntity.m", 194, @"Invalid parameter not satisfying: %@", @"outMatchingSearchEntityDictionariesByOID" object file lineNumber description];
  }
  id v27 = 0;
  id v28 = 0;
  id v26 = 0;
  +[PLSearchEntity _collectLabels:&v28 identifiers:&v27 types:&v26 fromDictionaries:v11];
  id v24 = v28;
  id v13 = v27;
  id v14 = v26;
  id v15 = [MEMORY[0x1E4F1CA60] dictionary];
  id v16 = +[PLGraphNodeValue fetchGraphNodeValuesWithName:@"searchEntityLabel" andValues:v24 forValueType:@"stringValue" inContext:v12 prefetchNode:0];
  +[PLSearchEntity _nodeValuesByNode:v16 into:v15];
  id v17 = +[PLGraphNodeValue fetchGraphNodeValuesWithName:@"searchEntityIdentifier" andValues:v13 forValueType:@"stringValue" inContext:v12 prefetchNode:0];

  +[PLSearchEntity _nodeValuesByNode:v17 into:v15];
  id v18 = +[PLGraphNodeValue fetchGraphNodeValuesWithName:@"searchEntityType" andValues:v14 forValueType:@"intValue" inContext:v12 prefetchNode:0];

  +[PLSearchEntity _nodeValuesByNode:v18 into:v15];
  id v19 = +[PLSearchEntity _groupAndRemoveMatchingDictionariesInSearchEntityDictionaries:v11 byNodeOIDFromValuesByNodeOID:v15];
  *a4 = v19;
  id v20 = [v19 allKeys];
  id v21 = +[PLSearchEntity _fetchGraphNodesForOIDs:v20 inContext:v12];

  *uint64_t v25 = v21;
}

+ (id)_fetchGraphNodesForOIDs:(id)a3 inContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = a3;
  id v8 = +[PLGraphNode entityName];
  uint64_t v9 = [v6 fetchRequestWithEntityName:v8];

  id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF in %@", v7];

  [v9 setPredicate:v10];
  id v16 = 0;
  id v11 = [v5 executeFetchRequest:v9 error:&v16];
  id v12 = v16;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v5;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to fetch graph nodes for context %@ (ERROR: %@)", buf, 0x16u);
    }
  }
  return v11;
}

+ (id)_groupAndRemoveMatchingDictionariesInSearchEntityDictionaries:(id)a3 byNodeOIDFromValuesByNodeOID:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v31 = a4;
  uint64_t v29 = v5;
  id v6 = (void *)[v5 mutableCopy];
  id v28 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v6;
  uint64_t v32 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v32)
  {
    id v7 = @"label";
    id v8 = @"searchEntityLabel";
    uint64_t v30 = *(void *)v45;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v45 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v9;
        id v10 = *(void **)(*((void *)&v44 + 1) + 8 * v9);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v11 = v31;
        uint64_t v38 = [v11 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (!v38) {
          goto LABEL_27;
        }
        uint64_t v37 = *(void *)v41;
        id v34 = v11;
        while (2)
        {
          for (uint64_t i = 0; i != v38; ++i)
          {
            if (*(void *)v41 != v37) {
              objc_enumerationMutation(v11);
            }
            uint64_t v13 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            id v14 = [v11 objectForKeyedSubscript:v13];
            id v15 = [v10 objectForKeyedSubscript:v7];
            id v16 = [v14 objectForKeyedSubscript:v8];
            if (v15 == v16)
            {
            }
            else
            {
              int v17 = [v15 isEqualToString:v16];

              if (!v17) {
                goto LABEL_18;
              }
            }
            uint64_t v35 = v13;
            id v18 = [v10 objectForKeyedSubscript:@"identifier"];
            id v39 = v14;
            id v19 = [v14 objectForKeyedSubscript:@"searchEntityIdentifier"];
            if (v18 == v19)
            {
            }
            else
            {
              int v20 = [v18 isEqualToString:v19];

              if (!v20)
              {

                id v14 = v39;
LABEL_18:

                goto LABEL_22;
              }
            }
            uint64_t v21 = v8;
            __int16 v22 = v7;
            id v23 = [v10 objectForKeyedSubscript:@"type"];
            uint64_t v24 = [v39 objectForKeyedSubscript:@"searchEntityType"];
            if (v23 == (void *)v24)
            {

              id v7 = v22;
              id v8 = v21;
              id v11 = v34;
              id v14 = v39;
LABEL_26:
              [v28 setObject:v10 forKeyedSubscript:v35];
              [v29 removeObject:v10];

              goto LABEL_27;
            }
            uint64_t v25 = (void *)v24;
            char v36 = [v23 isEqual:v24];

            id v7 = v22;
            id v8 = v21;
            id v11 = v34;
            id v14 = v39;
            if (v36) {
              goto LABEL_26;
            }
LABEL_22:
          }
          uint64_t v38 = [v11 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v38) {
            continue;
          }
          break;
        }
LABEL_27:

        uint64_t v9 = v33 + 1;
      }
      while (v33 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v32);
  }

  return v28;
}

+ (void)_nodeValuesByNode:(id)a3 into:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v6;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = [v12 node];
        id v14 = [v13 objectID];

        id v15 = [v7 objectForKeyedSubscript:v14];
        if (!v15)
        {
          id v15 = [MEMORY[0x1E4F1CA60] dictionary];
          [v7 setObject:v15 forKeyedSubscript:v14];
        }
        id v16 = [v12 stringValue];
        int v17 = v16;
        if (!v16)
        {
          id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "intValue"));
          int v17 = v4;
        }
        id v18 = [v12 valueName];
        [v15 setObject:v17 forKeyedSubscript:v18];

        if (!v16) {
      }
        }
      uint64_t v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }
}

+ (void)_collectLabels:(id *)a3 identifiers:(id *)a4 types:(id *)a5 fromDictionaries:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v26 = a3;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_19:
    long long v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"PLSearchEntity.m", 127, @"Invalid parameter not satisfying: %@", @"outIdentifiers" object file lineNumber description];

    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_20;
  }
  long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, a1, @"PLSearchEntity.m", 126, @"Invalid parameter not satisfying: %@", @"outLabels" object file lineNumber description];

  if (!a4) {
    goto LABEL_19;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_20:
  long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, a1, @"PLSearchEntity.m", 128, @"Invalid parameter not satisfying: %@", @"outTypes" object file lineNumber description];

LABEL_4:
  *id v26 = [MEMORY[0x1E4F1CA80] set];
  [MEMORY[0x1E4F1CA80] set];
  uint64_t v25 = a4;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1E4F1CA80] set];
  id v12 = a5;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v11;
  uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(obj);
        }
        int v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v18 = [v17 objectForKeyedSubscript:@"label"];
        if (v18) {
          [*v26 addObject:v18];
        }
        id v19 = [v17 objectForKeyedSubscript:@"identifier"];
        if (v19) {
          [*v25 addObject:v19];
        }
        long long v20 = [v17 objectForKeyedSubscript:@"type"];
        if (v20) {
          [*v12 addObject:v20];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }
}

+ (void)_removeAllEdgesWithPredicate:(id)a3 inContext:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"PLSearchEntity.m", 108, @"Invalid parameter not satisfying: %@", @"predicate" object file lineNumber description];
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v10 = +[PLGraphEdge entityName];
  id v11 = [v9 fetchRequestWithEntityName:v10];

  [v11 setPredicate:v7];
  id v29 = 0;
  id v12 = [v8 executeFetchRequest:v11 error:&v29];
  id v13 = v29;
  if (!v12)
  {
    uint64_t v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v32 = a1;
      __int16 v33 = 2112;
      id v34 = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to fetch relation edges for node %@ (%@)", buf, 0x16u);
    }
  }
  uint64_t v24 = v13;
  uint64_t v15 = [a1 _labelWithCode:1102 inContext:v8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v21 hasLabel:v15])
        {
          long long v22 = [v21 targetPerson];
          [v22 setMeConfidence:0.0];
        }
        [v8 deleteObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v18);
  }
}

@end
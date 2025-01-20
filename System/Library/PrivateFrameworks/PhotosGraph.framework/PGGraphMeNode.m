@interface PGGraphMeNode
+ (id)filter;
+ (id)inferredPersonOfMe;
- (BOOL)_status:(unint64_t)a3 fitsQuery:(unint64_t)a4;
- (id)_relationshipLabelForRelationship:(unint64_t)a3;
- (id)inferredPersonNode;
- (id)label;
- (id)relationshipEdgesToPersonNode:(id)a3 matchingQuery:(unint64_t)a4;
- (id)storytellingRelationshipLabelsToPersonNode:(id)a3;
- (void)_enumerateRelationshipWithLabel:(id)a3 matchingQuery:(unint64_t)a4 usingBlock:(id)a5;
- (void)_enumerateSocialGroupNodesForRelationshipLabel:(id)a3 usingBlock:(id)a4;
- (void)enumeratePersonNodesWithRelationship:(unint64_t)a3 matchingQuery:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateSocialGroupNodesWithRelationship:(unint64_t)a3 usingBlock:(id)a4;
@end

@implementation PGGraphMeNode

- (id)inferredPersonNode
{
  v2 = [(MANodeCollection *)[PGGraphMeNodeCollection alloc] initWithNode:self];
  v3 = [(PGGraphMeNodeCollection *)v2 inferredPersonNodes];
  v4 = [v3 anyNode];

  return v4;
}

- (id)relationshipEdgesToPersonNode:(id)a3 matchingQuery:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1CA80] set];
  v8 = [(PGGraphPersonNode *)self collection];
  v9 = [v6 collection];
  v10 = +[PGGraphEdgeCollection edgesFromNodes:v8 toNodes:v9];
  v11 = [v10 set];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (-[PGGraphMeNode _status:fitsQuery:](self, "_status:fitsQuery:", objc_msgSend(v17, "status", (void)v19), a4))
        {
          [v7 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v7;
}

- (id)storytellingRelationshipLabelsToPersonNode:(id)a3
{
  id v4 = a3;
  v5 = [(PGGraphPersonNode *)self collection];
  id v6 = [v4 collection];

  v7 = +[PGGraphEdgeCollection edgesFromNodes:v5 toNodes:v6];

  v8 = [v7 labels];

  return v8;
}

- (void)enumeratePersonNodesWithRelationship:(unint64_t)a3 matchingQuery:(unint64_t)a4 usingBlock:(id)a5
{
  id v9 = a5;
  v8 = [(PGGraphMeNode *)self _relationshipLabelForRelationship:a3];
  if (v8) {
    [(PGGraphMeNode *)self _enumerateRelationshipWithLabel:v8 matchingQuery:a4 usingBlock:v9];
  }
}

- (id)_relationshipLabelForRelationship:(unint64_t)a3
{
  if (_relationshipLabelForRelationship__onceToken != -1) {
    dispatch_once(&_relationshipLabelForRelationship__onceToken, &__block_literal_global_32971);
  }
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [(id)_relationshipLabelForRelationship__labelByRelationship objectForKeyedSubscript:v4];

  return v5;
}

void __51__PGGraphMeNode__relationshipLabelForRelationship___block_invoke()
{
  v3[12] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F28D1BD8;
  v2[1] = &unk_1F28D1BF0;
  v3[0] = @"PARTNER";
  v3[1] = @"FAMILY";
  v2[2] = &unk_1F28D1C08;
  v2[3] = &unk_1F28D1C20;
  v3[2] = @"PARENT";
  v3[3] = @"MOTHER";
  v2[4] = &unk_1F28D1C38;
  v2[5] = &unk_1F28D1C50;
  v3[4] = @"FATHER";
  v3[5] = @"CHILD";
  v2[6] = &unk_1F28D1C68;
  v2[7] = &unk_1F28D1C80;
  v3[6] = @"SON";
  v3[7] = @"DAUGHTER";
  v2[8] = &unk_1F28D1C98;
  v2[9] = &unk_1F28D1CB0;
  v3[8] = @"FRIEND";
  v3[9] = @"COWORKER";
  v2[10] = &unk_1F28D1CC8;
  v2[11] = &unk_1F28D1CE0;
  v3[10] = @"BROTHER";
  v3[11] = @"SISTER";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:12];
  v1 = (void *)_relationshipLabelForRelationship__labelByRelationship;
  _relationshipLabelForRelationship__labelByRelationship = v0;
}

- (void)_enumerateRelationshipWithLabel:(id)a3 matchingQuery:(unint64_t)a4 usingBlock:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  if (v8)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__PGGraphMeNode__enumerateRelationshipWithLabel_matchingQuery_usingBlock___block_invoke;
    v10[3] = &unk_1E68E8ED8;
    v10[4] = self;
    unint64_t v12 = a4;
    id v11 = v8;
    [(MANode *)self enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:a3 domain:300 usingBlock:v10];
  }
}

void __74__PGGraphMeNode__enumerateRelationshipWithLabel_matchingQuery_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "_status:fitsQuery:", objc_msgSend(v6, "status"), *(void *)(a1 + 48)))(*(void (**)(void))(*(void *)(a1 + 40) + 16))(); {
}
  }

- (BOOL)_status:(unint64_t)a3 fitsQuery:(unint64_t)a4
{
  unint64_t v4 = (a4 >> 1) & 1;
  char v5 = a4 & 1;
  if (a3) {
    char v5 = 0;
  }
  if (a3 != 1) {
    LOBYTE(v4) = v5;
  }
  if (a3 == 2) {
    return (a4 & 4) != 0;
  }
  else {
    return v4;
  }
}

- (void)_enumerateSocialGroupNodesForRelationshipLabel:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __75__PGGraphMeNode__enumerateSocialGroupNodesForRelationshipLabel_usingBlock___block_invoke;
    v8[3] = &unk_1E68E8EB0;
    id v9 = v6;
    [(MANode *)self enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:a3 domain:302 usingBlock:v8];
  }
}

uint64_t __75__PGGraphMeNode__enumerateSocialGroupNodesForRelationshipLabel_usingBlock___block_invoke(uint64_t a1)
{
  char v2 = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateSocialGroupNodesWithRelationship:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  if (a3 == 4 || a3 == 1)
  {
    v7 = [(PGGraphMeNode *)self _relationshipLabelForRelationship:a3];
    [(PGGraphMeNode *)self _enumerateSocialGroupNodesForRelationshipLabel:v7 usingBlock:v6];
  }
  else
  {
    id v8 = +[PGLogging sharedLogging];
    id v9 = [v8 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "Requesting a non supported relationship for social groups", v10, 2u);
    }
  }
}

- (id)label
{
  char v2 = @"Me";
  return @"Me";
}

+ (id)inferredPersonOfMe
{
  char v2 = +[PGGraphInferredPersonEdge filter];
  v3 = [v2 outRelation];

  return v3;
}

+ (id)filter
{
  char v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"Me" domain:300];
  return v2;
}

@end
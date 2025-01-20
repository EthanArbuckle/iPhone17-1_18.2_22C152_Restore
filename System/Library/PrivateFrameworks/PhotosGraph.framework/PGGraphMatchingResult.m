@interface PGGraphMatchingResult
+ (id)matchingDescriptionWithEventNode:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResult:(id)a3;
- (NSDictionary)keywords;
- (NSMutableDictionary)context;
- (PGGraphMatchingResult)initWithEvent:(id)a3;
- (PGGraphRelatableEvent)event;
- (double)score;
- (id)_contextItemsSortedByScoreAscending:(BOOL)a3;
- (id)_highestScoredContextItemWithPreferredRelatedType:(unint64_t)a3;
- (id)contextItemForRelatedType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)keywordsForRelatedType:(unint64_t)a3;
- (id)localEndDate;
- (id)localStartDate;
- (id)sortedCriteria;
- (unint64_t)hash;
- (void)addKeywords:(id)a3 forRelatedType:(unint64_t)a4;
- (void)clearKeywordsForRelatedType:(unint64_t)a3;
- (void)enumerateContextItems:(id)a3;
- (void)setContextItem:(id)a3 forRelatedType:(unint64_t)a4;
- (void)setScore:(double)a3;
@end

@implementation PGGraphMatchingResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

- (NSMutableDictionary)context
{
  return self->_context;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (PGGraphRelatableEvent)event
{
  return self->_event;
}

- (id)debugDescription
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = [(NSMutableDictionary *)self->_context allKeys];
  v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [(NSMutableDictionary *)self->_context objectForKeyedSubscript:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        v11 = [v10 debugDescription];
        [v3 appendFormat:@"\n\t\t%@", v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v12 = NSString;
  v13 = [(PGGraphRelatableEvent *)self->_event name];
  double score = self->_score;
  v15 = [(id)objc_opt_class() matchingDescriptionWithEventNode:self->_event];
  v16 = [v12 stringWithFormat:@"event: %@\nscore: %0.2f\ncontexts: %@\nmatchingDescription: %@", v13, *(void *)&score, v3, v15];

  return v16;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PGGraphMatchingResult *)self event];
  uint64_t v6 = [v5 name];
  [(PGGraphMatchingResult *)self score];
  uint64_t v8 = [v3 stringWithFormat:@"<%@:%p> - event:%@ - score:%0.2f", v4, self, v6, v7];

  return v8;
}

- (unint64_t)hash
{
  return [(PGGraphRelatableEvent *)self->_event hash];
}

- (BOOL)isEqual:(id)a3
{
  return self == a3 || -[PGGraphMatchingResult isEqualToResult:](self, "isEqualToResult:");
}

- (BOOL)isEqualToResult:(id)a3
{
  id v4 = a3;
  double score = self->_score;
  [v4 score];
  if (score == v6)
  {
    event = self->_event;
    uint64_t v8 = [v4 event];
    char v9 = [(PGGraphRelatableEvent *)event isEqualToNode:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)enumerateContextItems:(id)a3
{
  id v4 = a3;
  context = self->_context;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__PGGraphMatchingResult_enumerateContextItems___block_invoke;
  v7[3] = &unk_1E68F1A28;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)context enumerateKeysAndObjectsUsingBlock:v7];
}

void __47__PGGraphMatchingResult_enumerateContextItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  [a2 unsignedIntegerValue];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)sortedCriteria
{
  v2 = [(PGGraphMatchingResult *)self _contextItemsSortedByScoreAscending:0];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__PGGraphMatchingResult_sortedCriteria__block_invoke;
  v6[3] = &unk_1E68F1A00;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateObjectsUsingBlock:v6];

  return v4;
}

uint64_t __39__PGGraphMatchingResult_sortedCriteria__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 criteria];
  return [v2 addIndex:v3];
}

- (NSDictionary)keywords
{
  keywords = self->_keywords;
  if (!keywords)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = self->_keywords;
    self->_keywords = v4;

    keywords = self->_keywords;
  }
  return keywords;
}

- (id)_highestScoredContextItemWithPreferredRelatedType:(unint64_t)a3
{
  context = self->_context;
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [(NSMutableDictionary *)context objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v7 = [(PGGraphMatchingResult *)self _contextItemsSortedByScoreAscending:0];
    id v6 = [v7 firstObject];
  }
  return v6;
}

- (id)_contextItemsSortedByScoreAscending:(BOOL)a3
{
  BOOL v3 = a3;
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(NSMutableDictionary *)self->_context allValues];
  id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:v3];
  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v7 = [v4 sortedArrayUsingDescriptors:v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  objc_storeStrong((id *)(v5 + 8), self->_event);
  *(double *)(v5 + 24) = self->_score;
  uint64_t v6 = [(NSDictionary *)self->_keywords copyWithZone:a3];
  id v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSMutableDictionary *)self->_context mutableCopyWithZone:a3];
  char v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  return (id)v5;
}

- (id)localEndDate
{
  v2 = [(PGGraphMatchingResult *)self _highestScoredContextItemWithPreferredRelatedType:2];
  BOOL v3 = [v2 localEndDate];

  return v3;
}

- (id)localStartDate
{
  v2 = [(PGGraphMatchingResult *)self _highestScoredContextItemWithPreferredRelatedType:2];
  BOOL v3 = [v2 localStartDate];

  return v3;
}

- (void)setContextItem:(id)a3 forRelatedType:(unint64_t)a4
{
  context = self->_context;
  uint64_t v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)context setObject:v7 forKeyedSubscript:v8];
}

- (id)contextItemForRelatedType:(unint64_t)a3
{
  context = self->_context;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v5 = [(NSMutableDictionary *)context objectForKeyedSubscript:v4];

  return v5;
}

- (void)clearKeywordsForRelatedType:(unint64_t)a3
{
  id v6 = [(PGGraphMatchingResult *)self keywords];
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v5 = [v6 objectForKeyedSubscript:v4];
  [v5 removeAllObjects];
}

- (void)addKeywords:(id)a3 forRelatedType:(unint64_t)a4
{
  id v11 = a3;
  id v6 = [(PGGraphMatchingResult *)self keywords];
  id v7 = [NSNumber numberWithUnsignedInteger:a4];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    char v9 = [(PGGraphMatchingResult *)self keywords];
    v10 = [NSNumber numberWithUnsignedInteger:a4];
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
  [v8 addObjectsFromArray:v11];
}

- (id)keywordsForRelatedType:(unint64_t)a3
{
  keywords = self->_keywords;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v5 = [(NSDictionary *)keywords objectForKeyedSubscript:v4];

  return v5;
}

- (PGGraphMatchingResult)initWithEvent:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphMatchingResult;
  id v6 = [(PGGraphMatchingResult *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_event, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    context = v7->_context;
    v7->_context = (NSMutableDictionary *)v8;
  }
  return v7;
}

+ (id)matchingDescriptionWithEventNode:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28E78] string];
  id v5 = [v3 name];

  uint64_t v6 = [v3 label];
  id v7 = (void *)v6;
  if (v5)
  {
    uint64_t v8 = [v3 name];
    [v4 appendFormat:@"[%@:%@]", v7, v8];
  }
  else
  {
    [v4 appendFormat:@"[%@]", v6];
  }

  char v9 = [MEMORY[0x1E4F1CA80] set];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __58__PGGraphMatchingResult_matchingDescriptionWithEventNode___block_invoke;
  v51[3] = &unk_1E68F1A50;
  id v10 = v3;
  id v52 = v10;
  id v11 = v9;
  id v53 = v11;
  id v12 = v4;
  id v54 = v12;
  [v10 enumerateInEdgesUsingBlock:v51];
  if ([v11 count])
  {
    objc_msgSend(v12, "appendString:", @" (<- ");
    id v42 = v12;
    id v38 = v10;
    v13 = [v10 graph];
    v14 = +[PGGraphNodeCollection nodesInGraph:v13];

    v41 = v14;
    v15 = [v14 anyNode];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v39 = v11;
    id obj = v11;
    uint64_t v16 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v48;
      long long v19 = @"unknown";
      v40 = v15;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v48 != v18) {
            objc_enumerationMutation(obj);
          }
          long long v21 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          v22 = @"me";
          if (([v21 isEqualToNode:v15] & 1) == 0)
          {
            uint64_t v23 = [v21 collection];
            v24 = +[PGGraphEdgeCollection edgesFromNodes:v41 toNodes:v23];
            v25 = [v24 anyEdge];
            [v25 label];
            uint64_t v26 = v17;
            v27 = v19;
            v29 = uint64_t v28 = v18;
            v22 = [v29 lowercaseString];

            uint64_t v18 = v28;
            long long v19 = v27;
            uint64_t v17 = v26;

            id v12 = v42;
            v15 = v40;
          }
          uint64_t v30 = [v21 name];
          v31 = (void *)v30;
          if (v22) {
            v32 = v22;
          }
          else {
            v32 = v19;
          }
          [v12 appendFormat:@"%@:%@ | ", v30, v32];
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v17);
    }

    [v12 replaceCharactersInRange:objc_msgSend(v12, "length") - 3, 3, @"" withString]);
    id v10 = v38;
    id v11 = v39;
  }
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __58__PGGraphMatchingResult_matchingDescriptionWithEventNode___block_invoke_2;
  v44[3] = &unk_1E68F1AA0;
  id v45 = v10;
  id v33 = v12;
  id v46 = v33;
  id v34 = v10;
  [v34 enumerateOutEdgesUsingBlock:v44];
  v35 = v46;
  id v36 = v33;

  return v36;
}

void __58__PGGraphMatchingResult_matchingDescriptionWithEventNode___block_invoke(uint64_t a1, void *a2)
{
  id v8 = [a2 oppositeNode:*(void *)(a1 + 32)];
  if ([v8 domain] == 300)
  {
    [*(id *)(a1 + 40) addObject:v8];
  }
  else
  {
    id v3 = [v8 name];

    id v4 = *(void **)(a1 + 48);
    uint64_t v5 = [v8 label];
    uint64_t v6 = (void *)v5;
    if (v3)
    {
      id v7 = [v8 name];
      [v4 appendFormat:@" (<-%@:%@)", v6, v7];
    }
    else
    {
      [v4 appendFormat:@" (<-%@)", v5];
    }
  }
}

void __58__PGGraphMatchingResult_matchingDescriptionWithEventNode___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__74330;
  long long v20 = __Block_byref_object_dispose__74331;
  id v21 = [v3 oppositeNode:*(void *)(a1 + 32)];
  if ([v3 domain] == 200)
  {
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = [(id)v17[5] label];
    uint64_t v6 = [(id)v17[5] name];
    objc_msgSend(v4, "appendFormat:", @" (->%@:%@"), v5, v6;

    while ([(id)v17[5] outEdgesCount])
    {
      id v7 = (void *)v17[5];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __58__PGGraphMatchingResult_matchingDescriptionWithEventNode___block_invoke_286;
      v13[3] = &unk_1E68F1A78;
      v15 = &v16;
      id v14 = *(id *)(a1 + 40);
      [v7 enumerateOutEdgesUsingBlock:v13];
    }
    [*(id *)(a1 + 40) appendString:@""]);
  }
  else
  {
    if ([v3 domain] == 600)
    {
      id v8 = *(void **)(a1 + 40);
      char v9 = [(id)v17[5] label];
      [v8 appendFormat:@" (->Scene:%@)", v9];
    }
    else
    {
      id v10 = [(id)v17[5] name];

      id v11 = *(void **)(a1 + 40);
      char v9 = [(id)v17[5] label];
      if (v10)
      {
        id v12 = [(id)v17[5] name];
        [v11 appendFormat:@" (->%@:%@)", v9, v12];
      }
      else
      {
        [v11 appendFormat:@" (->%@)", v9];
      }
    }
  }
  _Block_object_dispose(&v16, 8);
}

void __58__PGGraphMatchingResult_matchingDescriptionWithEventNode___block_invoke_286(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  if ([v10 domain] == 200)
  {
    uint64_t v5 = [v10 oppositeNode:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = *(void **)(a1 + 32);
    char v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) name];
    [v8 appendFormat:@"/%@", v9];

    *a3 = 1;
  }
}

@end
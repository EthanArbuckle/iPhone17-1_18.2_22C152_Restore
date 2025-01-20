@interface PGGraphMatchingContextItem
+ (unint64_t)criteriaForLocationLabel:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContextItem:(id)a3;
- (NSDate)localEndDate;
- (NSDate)localStartDate;
- (NSSet)contextNodes;
- (PGGraphMatchingContextItem)initWithRelatedType:(unint64_t)a3 score:(double)a4 criteria:(unint64_t)a5 referenceNode:(id)a6 matchedNode:(id)a7 contextNodes:(id)a8;
- (PGGraphNode)matchedNode;
- (PGGraphNode)referenceNode;
- (double)score;
- (id)_matchedAddressNode;
- (id)debugDescription;
- (id)description;
- (unint64_t)criteria;
- (unint64_t)hash;
- (unint64_t)relatedType;
- (void)_findLocalStartAndEndDate;
- (void)setCriteria:(unint64_t)a3;
- (void)setScore:(double)a3;
@end

@implementation PGGraphMatchingContextItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localEndDate, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
  objc_storeStrong((id *)&self->_contextNodes, 0);
  objc_storeStrong((id *)&self->_matchedNode, 0);
  objc_storeStrong((id *)&self->_referenceNode, 0);
}

- (NSSet)contextNodes
{
  return self->_contextNodes;
}

- (PGGraphNode)matchedNode
{
  return self->_matchedNode;
}

- (PGGraphNode)referenceNode
{
  return self->_referenceNode;
}

- (void)setCriteria:(unint64_t)a3
{
  self->_criteria = a3;
}

- (unint64_t)criteria
{
  return self->_criteria;
}

- (unint64_t)relatedType
{
  return self->_relatedType;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (unint64_t)hash
{
  return [(MANode *)self->_matchedNode hash];
}

- (BOOL)isEqual:(id)a3
{
  return self == a3 || -[PGGraphMatchingContextItem isEqualToContextItem:](self, "isEqualToContextItem:");
}

- (BOOL)isEqualToContextItem:(id)a3
{
  id v4 = a3;
  double score = self->_score;
  [v4 score];
  if (score == v6
    && (unint64_t criteria = self->_criteria, criteria == [v4 criteria])
    && (unint64_t relatedType = self->_relatedType, relatedType == [v4 relatedType]))
  {
    matchedNode = self->_matchedNode;
    v10 = [v4 matchedNode];
    if ([(PGGraphNode *)matchedNode isEqualToNode:v10])
    {
      contextNodes = self->_contextNodes;
      v12 = [v4 contextNodes];
      BOOL v13 = [(NSSet *)contextNodes isEqualToSet:v12];
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"option: %lu, score %f, criteria %lu", self->_relatedType, *(void *)&self->_score, self->_criteria];
}

- (id)_matchedAddressNode
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_criteria - 12 <= 8)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v3 = self->_contextNodes;
    uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v9 = objc_msgSend(v8, "label", (void)v13);
          if ([v9 isEqualToString:@"Address"])
          {
            id v11 = v8;

            goto LABEL_15;
          }
        }
        uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_13:
    id v11 = 0;
    goto LABEL_16;
  }
  v3 = [(PGGraphNode *)self->_matchedNode collection];
  v10 = [(NSSet *)v3 addressNodes];
  id v11 = [v10 anyNode];

LABEL_15:
LABEL_16:
  return v11;
}

- (void)_findLocalStartAndEndDate
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__49680;
  long long v15 = __Block_byref_object_dispose__49681;
  id v16 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__49680;
  v9 = __Block_byref_object_dispose__49681;
  id v10 = 0;
  matchedNode = self->_matchedNode;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__PGGraphMatchingContextItem__findLocalStartAndEndDate__block_invoke;
  v4[3] = &unk_1E68EE110;
  v4[4] = &v11;
  v4[5] = &v5;
  [(MANode *)matchedNode enumerateNeighborNodesThroughEdgesWithLabel:@"DATE" domain:400 usingBlock:v4];
  objc_storeStrong((id *)&self->_localStartDate, (id)v12[5]);
  objc_storeStrong((id *)&self->_localEndDate, (id)v6[5]);
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(&v11, 8);
}

void __55__PGGraphMatchingContextItem__findLocalStartAndEndDate__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 localDate];
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = v3;
  if (*(void *)(v5 + 40))
  {
    if (objc_msgSend(v3, "compare:") != -1) {
      goto LABEL_5;
    }
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v4 = obj;
  }
  objc_storeStrong((id *)(v5 + 40), v4);
LABEL_5:
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v6 + 40))
  {
    if (objc_msgSend(obj, "compare:") != 1) {
      goto LABEL_9;
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  objc_storeStrong((id *)(v6 + 40), obj);
LABEL_9:
}

- (NSDate)localEndDate
{
  localEndDate = self->_localEndDate;
  if (!localEndDate)
  {
    [(PGGraphMatchingContextItem *)self _findLocalStartAndEndDate];
    localEndDate = self->_localEndDate;
  }
  return localEndDate;
}

- (NSDate)localStartDate
{
  localStartDate = self->_localStartDate;
  if (!localStartDate)
  {
    [(PGGraphMatchingContextItem *)self _findLocalStartAndEndDate];
    localStartDate = self->_localStartDate;
  }
  return localStartDate;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> option: %lu, score %f, criteria %lu", objc_opt_class(), self, self->_relatedType, *(void *)&self->_score, self->_criteria];
}

- (PGGraphMatchingContextItem)initWithRelatedType:(unint64_t)a3 score:(double)a4 criteria:(unint64_t)a5 referenceNode:(id)a6 matchedNode:(id)a7 contextNodes:(id)a8
{
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)PGGraphMatchingContextItem;
  uint64_t v18 = [(PGGraphMatchingContextItem *)&v21 init];
  v19 = v18;
  if (v18)
  {
    v18->_double score = a4;
    v18->_unint64_t relatedType = a3;
    v18->_unint64_t criteria = a5;
    objc_storeStrong((id *)&v18->_referenceNode, a6);
    objc_storeStrong((id *)&v19->_matchedNode, a7);
    objc_storeStrong((id *)&v19->_contextNodes, a8);
  }

  return v19;
}

+ (unint64_t)criteriaForLocationLabel:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (criteriaForLocationLabel__onceToken != -1) {
    dispatch_once(&criteriaForLocationLabel__onceToken, &__block_literal_global_49693);
  }
  uint64_t v4 = [(id)criteriaForLocationLabel__s_LabelCriteriaDictionary objectForKeyedSubscript:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 unsignedIntegerValue];
  }
  else
  {
    uint64_t v7 = +[PGLogging sharedLogging];
    v8 = [v7 loggingConnection];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "Could not find criteria for label %@", (uint8_t *)&v10, 0xCu);
    }

    unint64_t v6 = 0;
  }

  return v6;
}

void __55__PGGraphMatchingContextItem_criteriaForLocationLabel___block_invoke()
{
  v3[9] = *MEMORY[0x1E4F143B8];
  v2[0] = @"Area";
  v2[1] = @"Address";
  v3[0] = &unk_1F28D22B0;
  v3[1] = &unk_1F28D22C8;
  v2[2] = @"Number";
  v2[3] = @"Street";
  v3[2] = &unk_1F28D22E0;
  v3[3] = &unk_1F28D22F8;
  v2[4] = @"District";
  v2[5] = @"City";
  v3[4] = &unk_1F28D2310;
  v3[5] = &unk_1F28D2328;
  v2[6] = @"County";
  v2[7] = @"State";
  v3[6] = &unk_1F28D2340;
  v3[7] = &unk_1F28D2358;
  v2[8] = @"Country";
  v3[8] = &unk_1F28D2370;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:9];
  v1 = (void *)criteriaForLocationLabel__s_LabelCriteriaDictionary;
  criteriaForLocationLabel__s_LabelCriteriaDictionary = v0;
}

@end
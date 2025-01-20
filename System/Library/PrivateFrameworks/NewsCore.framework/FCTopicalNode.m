@interface FCTopicalNode
- (BOOL)isEqual:(id)a3;
- (double)calculateLeafScoresWithTopicScoreProvider:(double *)a1;
- (double)individualScoreWithTopicScoreProvider:(uint64_t)a1;
- (id)description;
- (id)initWithIdentifier:(void *)a3 displayedElements:(void *)a4 allTopicCollections:(double)a5 relatednessThreshold:(double)a6 relatednessKWeight:(double)a7 topicScoreWeight:(double)a8 highestScoringRelativeScoreMultiplier:;
- (void)calculateNonLeafScoresWithTopicProvider:(uint64_t)a1;
- (void)considerEdge:(void *)a3 withNodeScorer:;
- (void)setIdentifier:(id)a3;
- (void)setScore:(uint64_t)a1;
@end

@implementation FCTopicalNode

- (id)initWithIdentifier:(void *)a3 displayedElements:(void *)a4 allTopicCollections:(double)a5 relatednessThreshold:(double)a6 relatednessKWeight:(double)a7 topicScoreWeight:(double)a8 highestScoringRelativeScoreMultiplier:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  if (a1)
  {
    if (![v16 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v25 = (void *)[[NSString alloc] initWithFormat:@"Node initialized with an empty identifiers set"];
      *(_DWORD *)buf = 136315906;
      v28 = "-[FCTopicalNode initWithIdentifier:displayedElements:allTopicCollections:relatednessThreshold:relatednessKWe"
            "ight:topicScoreWeight:highestScoringRelativeScoreMultiplier:]";
      __int16 v29 = 2080;
      v30 = "FCHeadlineClusterOrdering.m";
      __int16 v31 = 1024;
      int v32 = 149;
      __int16 v33 = 2114;
      v34 = v25;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v26.receiver = a1;
    v26.super_class = (Class)FCTopicalNode;
    v19 = (id *)objc_msgSendSuper2(&v26, sel_init);
    a1 = v19;
    if (v19)
    {
      objc_storeStrong(v19 + 3, a2);
      v20 = [v16 allObjects];
      v21 = [v20 sortedArrayUsingComparator:&__block_literal_global_11];
      uint64_t v22 = [v21 firstObject];
      id v23 = a1[4];
      a1[4] = (id)v22;

      objc_storeStrong(a1 + 5, a3);
      objc_storeStrong(a1 + 6, a4);
      a1[1] = 0;
      *((unsigned char *)a1 + 16) = 0;
      *((double *)a1 + 13) = a5;
      *((double *)a1 + 14) = a6;
      *((double *)a1 + 15) = a7;
      *((double *)a1 + 16) = a8;
      a1[9] = (id)0x3FF0000000000000;
      a1[10] = 0;
      a1[11] = 0;
      a1[12] = 0;
    }
  }

  return a1;
}

uint64_t __169__FCTopicalNode_initWithIdentifier_displayedElements_allTopicCollections_relatednessThreshold_relatednessKWeight_topicScoreWeight_highestScoringRelativeScoreMultiplier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)isEqual:(id)a3
{
  v4 = (uint64_t *)a3;
  v5 = v4;
  if (!self)
  {
    identifiers = 0;
    if (v4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v7 = 0;
    goto LABEL_4;
  }
  identifiers = self->_identifiers;
  if (!v4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v7 = v4[3];
LABEL_4:
  v8 = identifiers;
  BOOL v9 = [(NSSet *)v8 isEqualToSet:v7];

  return v9;
}

- (void)considerEdge:(void *)a3 withNodeScorer:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (v5)
    {
      uint64_t v7 = (double *)*((id *)v5 + 2);
      v8 = (double *)*((id *)v5 + 3);
      BOOL v9 = v8;
      if (v7 == a1)
      {
        uint64_t v7 = a1;
LABEL_9:

        if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          __int16 v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "possibleParent");
          *(_DWORD *)buf = 136315906;
          v45 = "-[FCTopicalNode considerEdge:withNodeScorer:]";
          __int16 v46 = 2080;
          v47 = "FCHeadlineClusterOrdering.m";
          __int16 v48 = 1024;
          int v49 = 196;
          __int16 v50 = 2114;
          v51 = v29;
          _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
        uint64_t v11 = -[FCTopicalEdge independentCountForNode:]((uint64_t)v5, a1);
        if (v5) {
          unint64_t v12 = *((void *)v5 + 5);
        }
        else {
          unint64_t v12 = 0;
        }
        uint64_t v13 = -[FCTopicalEdge independentCountForNode:]((uint64_t)v5, v9);
        if (v11 | v12)
        {
          if (v12 | v13)
          {
            if (v12)
            {
              if (v11 | v13)
              {
                double v16 = (double)(unint64_t)v11;
                double v17 = (double)(unint64_t)v13;
                double v18 = (double)v12
                    / ((double)(unint64_t)v11 + (double)v12 + a1[14] * sqrt((double)(unint64_t)v13));
                double v20 = v6[2](v6, v9);
                if (v18 >= a1[13])
                {
                  double v21 = a1[10];
                  double v22 = (double)v12 / ((double)v12 + v17);
                  if (v18 > v21
                    || v18 == v21
                    && ((double v23 = a1[11], v22 > v23)
                     || v22 == v23
                     && ((double v24 = a1[12], v20 > v24)
                      || v20 == v24
                      && ((id v35 = objc_getProperty(a1, v19, 32, 1), !v9)
                        ? (id v36 = 0)
                        : (id v36 = objc_getProperty(v9, v34, 32, 1)),
                          uint64_t v37 = [v35 compare:v36],
                          v35,
                          v37 == -1))))
                  {
                    aBlock[0] = MEMORY[0x1E4F143A8];
                    aBlock[1] = 3221225472;
                    aBlock[2] = __45__FCTopicalNode_considerEdge_withNodeScorer___block_invoke;
                    aBlock[3] = &unk_1E5B4D220;
                    v25 = v9;
                    v39 = v25;
                    v40 = a1;
                    double v41 = v18;
                    double v42 = v22;
                    double v43 = v20;
                    objc_super v26 = (void (**)(void))_Block_copy(aBlock);
                    if (v16 < v17
                      || v16 == v17
                      && ((double v28 = v6[2](v6, a1), v28 > v20)
                       || v28 == v20
                       && ((id v31 = objc_getProperty(a1, v27, 32, 1), !v9)
                         ? (id Property = 0)
                         : (id Property = objc_getProperty(v25, v30, 32, 1)),
                           uint64_t v33 = [v31 compare:Property],
                           v31,
                           v33 == -1)))
                    {
                      v26[2](v26);
                    }
                  }
                }
                goto LABEL_38;
              }
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                v14 = (void *)[[NSString alloc] initWithFormat:@"Considered an edge that has only shared mentions of %@ and %@, these two nodes should have been merged", a1, v9];
                *(_DWORD *)buf = 136315906;
                v45 = "-[FCTopicalNode considerEdge:withNodeScorer:]";
                __int16 v46 = 2080;
                v47 = "FCHeadlineClusterOrdering.m";
                __int16 v48 = 1024;
                int v49 = 226;
                __int16 v50 = 2114;
                v51 = v14;
                v15 = MEMORY[0x1E4F14500];
                goto LABEL_26;
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              v14 = (void *)[[NSString alloc] initWithFormat:@"Considered an edge that has no shared mentions of %@ and %@", a1, v9];
              *(_DWORD *)buf = 136315906;
              v45 = "-[FCTopicalNode considerEdge:withNodeScorer:]";
              __int16 v46 = 2080;
              v47 = "FCHeadlineClusterOrdering.m";
              __int16 v48 = 1024;
              int v49 = 221;
              __int16 v50 = 2114;
              v51 = v14;
              v15 = MEMORY[0x1E4F14500];
              goto LABEL_26;
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            v14 = (void *)[[NSString alloc] initWithFormat:@"Considered an edge that has no independent mentions of %@ or shared mentions with %@", v9, a1];
            *(_DWORD *)buf = 136315906;
            v45 = "-[FCTopicalNode considerEdge:withNodeScorer:]";
            __int16 v46 = 2080;
            v47 = "FCHeadlineClusterOrdering.m";
            __int16 v48 = 1024;
            int v49 = 216;
            __int16 v50 = 2114;
            v51 = v14;
            v15 = MEMORY[0x1E4F14500];
            goto LABEL_26;
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          v14 = (void *)[[NSString alloc] initWithFormat:@"Considered an edge that has no independent mentions of %@ or shared mentions with %@", a1, v9];
          *(_DWORD *)buf = 136315906;
          v45 = "-[FCTopicalNode considerEdge:withNodeScorer:]";
          __int16 v46 = 2080;
          v47 = "FCHeadlineClusterOrdering.m";
          __int16 v48 = 1024;
          int v49 = 211;
          __int16 v50 = 2114;
          v51 = v14;
          v15 = MEMORY[0x1E4F14500];
LABEL_26:
          _os_log_error_impl(&dword_1A460D000, v15, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
        }
LABEL_38:

        goto LABEL_39;
      }
      if (v8 == a1)
      {
        v10 = (double *)*((id *)v5 + 2);
        BOOL v9 = a1;
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v7 = 0;
      BOOL v9 = 0;
    }
    v10 = 0;
LABEL_8:

    BOOL v9 = v10;
    goto LABEL_9;
  }
LABEL_39:
}

void __45__FCTopicalNode_considerEdge_withNodeScorer___block_invoke(uint64_t a1)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__FCTopicalNode_considerEdge_withNodeScorer___block_invoke_2;
  v8[3] = &unk_1E5B4C0B8;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v9 = v2;
  uint64_t v10 = v3;
  if (__45__FCTopicalNode_considerEdge_withNodeScorer___block_invoke_2((uint64_t)v8))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      objc_storeWeak((id *)(v4 + 56), *(id *)(a1 + 32));
      uint64_t v5 = *(void *)(a1 + 40);
      if (v5)
      {
        *(void *)(v5 + 80) = *(void *)(a1 + 48);
        uint64_t v6 = *(void *)(a1 + 40);
        if (v6)
        {
          *(void *)(v6 + 88) = *(void *)(a1 + 56);
          uint64_t v7 = *(void *)(a1 + 40);
          if (v7) {
            *(void *)(v7 + 96) = *(void *)(a1 + 64);
          }
        }
      }
    }
  }
}

uint64_t __45__FCTopicalNode_considerEdge_withNodeScorer___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)*(id *)(a1 + 32);
  if (!v2) {
    return 1;
  }
  uint64_t v3 = v2;
  do
  {
    uint64_t v4 = *(id **)(a1 + 40);
    BOOL v5 = v3 != v4;
    if (v3 == v4) {
      break;
    }
    WeakRetained = (id *)objc_loadWeakRetained(v3 + 7);

    uint64_t v3 = WeakRetained;
  }
  while (WeakRetained);

  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  if (self)
  {
    BOOL v5 = self->_identifiers;
    p_parent = &self->_parent;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
    BOOL v7 = WeakRetained == 0;
    if (WeakRetained)
    {
      v8 = (FCTopicalNode **)objc_loadWeakRetained((id *)&self->_parent);
      p_parent = v8;
      if (v8) {
        id v9 = v8[3];
      }
      else {
        id v9 = 0;
      }
      uint64_t v10 = v9;
    }
    else
    {
      uint64_t v10 = @"Root";
    }
    children = self->_children;
  }
  else
  {
    BOOL v5 = 0;
    id WeakRetained = 0;
    children = 0;
    BOOL v7 = 1;
    uint64_t v10 = @"Root";
  }
  unint64_t v12 = children;
  uint64_t v13 = [(NSSet *)v12 allObjects];
  v14 = objc_msgSend(v13, "fc_arrayByTransformingWithBlock:", &__block_literal_global_49_1);
  v15 = [v3 stringWithFormat:@"Node : %@ with Parent : %@ and Children : %@", v5, v10, v14];

  if (!v7)
  {
  }
  return v15;
}

id __28__FCTopicalNode_description__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return *(id *)(a2 + 24);
  }
  else {
    return 0;
  }
}

- (void)setScore:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 16) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"Asked to score a node that has already been scored"];
    int v5 = 136315906;
    uint64_t v6 = "-[FCTopicalNode setScore:]";
    __int16 v7 = 2080;
    v8 = "FCHeadlineClusterOrdering.m";
    __int16 v9 = 1024;
    int v10 = 336;
    __int16 v11 = 2114;
    unint64_t v12 = v4;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);
  }
  *(double *)(a1 + 8) = a2;
  *(unsigned char *)(a1 + 16) = 1;
}

- (double)individualScoreWithTopicScoreProvider:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  double v3 = *(double *)(a1 + 120);
  double v4 = (*(double (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 24));
  id v5 = *(id *)(a1 + 40);
  if ([v5 count])
  {
    id v6 = *(id *)(a1 + 40);
    __int16 v7 = [v6 allObjects];
    objc_msgSend(v7, "fc_reduceArrayWithDouble:block:", &__block_literal_global_58_0, 0.0);
    double v9 = v8 / (double)(unint64_t)[*(id *)(a1 + 40) count];
  }
  else
  {
    double v9 = 0.0;
  }

  return (1.0 - v3) * v9 + v3 * v4;
}

double __55__FCTopicalNode_individualScoreWithTopicScoreProvider___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    double v3 = *(double *)(a3 + 24);
  }
  else {
    double v3 = 0.0;
  }
  return v3 + a1;
}

- (double)calculateLeafScoresWithTopicScoreProvider:(double *)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    if (![*((id *)a1 + 8) count])
    {
      double v17 = -[FCTopicalNode individualScoreWithTopicScoreProvider:]((uint64_t)a1, (uint64_t)v3);
      -[FCTopicalNode setScore:]((uint64_t)a1, v17);
      a1 = -[FCTopicalLeafNode initWithNode:score:]((double *)[FCTopicalLeafNode alloc], a1, a1[1] * a1[9]);
      goto LABEL_21;
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = *((id *)a1 + 8);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (!v5)
    {
      __int16 v7 = 0;
      double v9 = 0.0;
      goto LABEL_20;
    }
    uint64_t v6 = v5;
    __int16 v7 = 0;
    uint64_t v8 = *(void *)v20;
    double v9 = 0.0;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = -[FCTopicalNode calculateLeafScoresWithTopicScoreProvider:](*(void *)(*((void *)&v19 + 1) + 8 * v10), v3);
        unint64_t v12 = (double *)v11;
        if (v11)
        {
          id v13 = *(id *)(v11 + 8);
          double v14 = v12[2];
          if (v7) {
            goto LABEL_10;
          }
        }
        else
        {
          id v13 = 0;
          double v14 = 0.0;
          if (v7)
          {
LABEL_10:
            if (v14 <= v9) {
              goto LABEL_12;
            }
          }
        }
        id v15 = v13;

        double v9 = v14;
        __int16 v7 = v15;
LABEL_12:

        ++v10;
      }
      while (v6 != v10);
      uint64_t v16 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v6 = v16;
      if (!v16)
      {
LABEL_20:

        a1 = -[FCTopicalLeafNode initWithNode:score:]((double *)[FCTopicalLeafNode alloc], v7, v9);
        break;
      }
    }
  }
LABEL_21:

  return a1;
}

- (void)calculateNonLeafScoresWithTopicProvider:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && [*(id *)(a1 + 64) count])
  {
    uint64_t v15 = 0;
    uint64_t v16 = (double *)&v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    id v4 = *(id *)(a1 + 64);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __57__FCTopicalNode_calculateNonLeafScoresWithTopicProvider___block_invoke;
    unint64_t v12 = &unk_1E5B4D2B0;
    id v5 = v3;
    id v13 = v5;
    double v14 = &v15;
    [v4 enumerateObjectsUsingBlock:&v9];

    double v6 = v16[3];
    double v7 = v6 + -[FCTopicalNode individualScoreWithTopicScoreProvider:](a1, (uint64_t)v5);
    v16[3] = v7;
    id v8 = *(id *)(a1 + 64);
    -[FCTopicalNode setScore:](a1, v7 / ((double)(unint64_t)objc_msgSend(v8, "count", v9, v10, v11, v12) + 1.0));

    _Block_object_dispose(&v15, 8);
  }
}

void __57__FCTopicalNode_calculateNonLeafScoresWithTopicProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  -[FCTopicalNode calculateNonLeafScoresWithTopicProvider:]();
  if (v3 && v3[16])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    double v6 = *(double *)(v4 + 24);
    id v5 = (double *)(v4 + 24);
    double v7 = v6;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"Scoring node that has an unscored child"];
      int v12 = 136315906;
      id v13 = "-[FCTopicalNode calculateNonLeafScoresWithTopicProvider:]_block_invoke";
      __int16 v14 = 2080;
      uint64_t v15 = "FCHeadlineClusterOrdering.m";
      __int16 v16 = 1024;
      int v17 = 390;
      __int16 v18 = 2114;
      long long v19 = v11;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);
    }
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    double v9 = *(double *)(v8 + 24);
    id v5 = (double *)(v8 + 24);
    double v7 = v9;
    if (!v3)
    {
      double v10 = 0.0;
      goto LABEL_8;
    }
  }
  double v10 = *((double *)v3 + 1) * *((double *)v3 + 9);
LABEL_8:
  double *v5 = v7 + v10;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedNodeIdentifier, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_topicCollections, 0);
  objc_storeStrong((id *)&self->_displayedElements, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
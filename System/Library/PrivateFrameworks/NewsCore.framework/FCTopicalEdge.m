@interface FCTopicalEdge
- (BOOL)isEqual:(id)a3;
- (BOOL)relatednessCalculated;
- (id)description;
- (uint64_t)independentCountForNode:(uint64_t)a1;
- (unint64_t)hash;
- (void)calculateRelatedness;
- (void)setA:(id)a3;
- (void)setB:(id)a3;
- (void)setRelatednessCalculated:(BOOL)a3;
@end

@implementation FCTopicalEdge

- (uint64_t)independentCountForNode:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = *(id *)(a1 + 16);
    if (v4 == v3)
    {
    }
    else
    {
      id v5 = *(id *)(a1 + 24);

      if (v5 != v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v6 = (void *)[[NSString alloc] initWithFormat:@"Asked for independent count for node %@ but node not part of edge %@", v3, a1];
        *(_DWORD *)buf = 136315906;
        v10 = "-[FCTopicalEdge independentCountForNode:]";
        __int16 v11 = 2080;
        v12 = "FCHeadlineClusterOrdering.m";
        __int16 v13 = 1024;
        int v14 = 510;
        __int16 v15 = 2114;
        v16 = v6;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
    uint64_t v7 = 48;
    if (*(id *)(a1 + 16) == v3) {
      uint64_t v7 = 32;
    }
    a1 = *(void *)(a1 + v7);
  }

  return a1;
}

uint64_t __38__FCTopicalEdge_initWithNode_andNode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v7 = objc_getProperty(a2, v4, 32, 1);
    if (v5) {
      id Property = objc_getProperty(v5, v6, 32, 1);
    }
    else {
      id Property = 0;
    }
    uint64_t v9 = [v7 compare:Property];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)calculateRelatedness
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ([a1 relatednessCalculated]
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)[[NSString alloc] initWithFormat:@"Asking to calculate relatedness when it already calculated : %@", a1];
      *(_DWORD *)buf = 136315906;
      __int16 v11 = "-[FCTopicalEdge calculateRelatedness]";
      __int16 v12 = 2080;
      __int16 v13 = "FCHeadlineClusterOrdering.m";
      __int16 v14 = 1024;
      int v15 = 456;
      __int16 v16 = 2114;
      uint64_t v17 = v6;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v2 = (void *)a1[2];
    if (v2) {
      v2 = (void *)v2[6];
    }
    id v3 = v2;
    id v4 = (void *)a1[3];
    if (v4) {
      id v4 = (void *)v4[6];
    }
    id v5 = v4;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__FCTopicalEdge_calculateRelatedness__block_invoke_3;
    v9[3] = &unk_1E5B4D320;
    v9[4] = a1;
    a1[4] = __37__FCTopicalEdge_calculateRelatedness__block_invoke(v3, v9);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37__FCTopicalEdge_calculateRelatedness__block_invoke_4;
    v8[3] = &unk_1E5B4D320;
    v8[4] = a1;
    a1[5] = __37__FCTopicalEdge_calculateRelatedness__block_invoke(v3, v8);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__FCTopicalEdge_calculateRelatedness__block_invoke_5;
    v7[3] = &unk_1E5B4D320;
    v7[4] = a1;
    a1[6] = __37__FCTopicalEdge_calculateRelatedness__block_invoke(v5, v7);
    [a1 setRelatednessCalculated:1];
  }
}

uint64_t __37__FCTopicalEdge_calculateRelatedness__block_invoke(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__FCTopicalEdge_calculateRelatedness__block_invoke_2;
  v9[3] = &unk_1E5B4D2F8;
  __int16 v12 = &v13;
  id v5 = v4;
  id v11 = v5;
  id v6 = v3;
  id v10 = v6;
  [v6 enumerateObjectsUsingBlock:v9];
  uint64_t v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __37__FCTopicalEdge_calculateRelatedness__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    uint64_t v3 = [*(id *)(a1 + 32) countForObject:v4];
  }
  else {
    uint64_t v3 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v3;
}

uint64_t __37__FCTopicalEdge_calculateRelatedness__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  id v5 = *(id *)(v4 + 24);
  uint64_t v7 = v5;
  if (!v5)
  {
LABEL_6:
    id Property = 0;
    goto LABEL_4;
  }
  id Property = objc_getProperty(v5, v6, 32, 1);
LABEL_4:
  uint64_t v9 = [v3 containsObject:Property] ^ 1;

  return v9;
}

uint64_t __37__FCTopicalEdge_calculateRelatedness__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  id v5 = *(id *)(v4 + 24);
  uint64_t v7 = v5;
  if (!v5)
  {
LABEL_6:
    id Property = 0;
    goto LABEL_4;
  }
  id Property = objc_getProperty(v5, v6, 32, 1);
LABEL_4:
  uint64_t v9 = [v3 containsObject:Property];

  return v9;
}

uint64_t __37__FCTopicalEdge_calculateRelatedness__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  id v5 = *(id *)(v4 + 16);
  uint64_t v7 = v5;
  if (!v5)
  {
LABEL_6:
    id Property = 0;
    goto LABEL_4;
  }
  id Property = objc_getProperty(v5, v6, 32, 1);
LABEL_4:
  uint64_t v9 = [v3 containsObject:Property] ^ 1;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (self) {
    a = self->_a;
  }
  else {
    a = 0;
  }
  id v6 = a;
  uint64_t v7 = v6;
  if (v4) {
    v8 = (FCTopicalNode *)v4[2];
  }
  else {
    v8 = 0;
  }
  if (v6 == v8)
  {
    if (self)
    {
      b = self->_b;
      if (v4)
      {
LABEL_9:
        id v11 = (FCTopicalNode *)v4[3];
LABEL_10:
        BOOL v9 = b == v11;

        goto LABEL_11;
      }
    }
    else
    {
      b = 0;
      if (v4) {
        goto LABEL_9;
      }
    }
    id v11 = 0;
    goto LABEL_10;
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (unint64_t)hash
{
  v2 = self;
  if (self)
  {
    id v3 = self->_a;
    uint64_t v4 = v3;
    if (v3)
    {
      identifiers = v3->_identifiers;
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  identifiers = 0;
LABEL_4:
  id v6 = identifiers;
  uint64_t v7 = [(NSSet *)v6 hash];
  if (v2)
  {
    v8 = v2->_b;
    v2 = (FCTopicalEdge *)v8;
    if (v8) {
      v8 = (FCTopicalNode *)v8->_identifiers;
    }
  }
  else
  {
    v8 = 0;
  }
  unint64_t v9 = [(FCTopicalNode *)v8 hash] ^ v7;

  return v9;
}

- (id)description
{
  id v3 = NSString;
  if (self)
  {
    uint64_t v4 = self->_a;
    id v5 = v4;
    if (v4) {
      identifiers = v4->_identifiers;
    }
    else {
      identifiers = 0;
    }
    uint64_t v7 = identifiers;
    v8 = self->_b;
    unint64_t v9 = v8;
    if (v8) {
      id v10 = v8->_identifiers;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
    unint64_t containsAButNotB = self->_containsAButNotB;
  }
  else
  {
    id v11 = 0;
    uint64_t v7 = 0;
    id v5 = 0;
    unint64_t v9 = 0;
    unint64_t containsAButNotB = 0;
  }
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:containsAButNotB];
  if (self) {
    unint64_t containsAAndB = self->_containsAAndB;
  }
  else {
    unint64_t containsAAndB = 0;
  }
  uint64_t v15 = [NSNumber numberWithUnsignedInteger:containsAAndB];
  if (self) {
    unint64_t containsBButNotA = self->_containsBButNotA;
  }
  else {
    unint64_t containsBButNotA = 0;
  }
  uint64_t v17 = [NSNumber numberWithUnsignedInteger:containsBButNotA];
  uint64_t v18 = [v3 stringWithFormat:@"Edge from %@ to %@ with { %@ -- %@ -- %@ }", v7, v11, v13, v15, v17];

  return v18;
}

- (void)setA:(id)a3
{
}

- (void)setB:(id)a3
{
}

- (BOOL)relatednessCalculated
{
  return self->_relatednessCalculated;
}

- (void)setRelatednessCalculated:(BOOL)a3
{
  self->_relatednessCalculated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_b, 0);
  objc_storeStrong((id *)&self->_a, 0);
}

@end
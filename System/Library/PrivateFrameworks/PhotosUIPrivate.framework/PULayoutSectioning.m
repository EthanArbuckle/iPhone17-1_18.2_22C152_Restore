@interface PULayoutSectioning
- (BOOL)hasSomeSampling;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (PULayoutSectioning)baseSectioning;
- (PULayoutSectioningDelegate)delegate;
- (PUSimpleIndexPath)mainRealItemIndexPathForVisualIndexPath:(PUSimpleIndexPath)a3;
- (PUSimpleIndexPath)visualIndexPathForRealIndexPath:(PUSimpleIndexPath)a3 isMainItem:(BOOL *)a4;
- (id)_sectioningDescriptionShowInvisibleItemsInBaseSectioning:(BOOL)a3 hasIncorrectSampling:(BOOL *)a4 hasInvisibleItemsInBaseSectioning:(BOOL *)a5;
- (id)description;
- (id)sectioningDescription;
- (id)sectioningHash;
- (id)sectioningHashHasIncorrectSampling:(BOOL *)a3 hasInvisibleItemsInBaseSectioning:(BOOL *)a4;
- (id)visibleUnsampledIndexesForCombinedRealSections:(id)a3;
- (int64_t)__debugUnsampledIndexForRealIndexPath:(PUSimpleIndexPath)a3;
- (int64_t)mainRealSectionForVisualSection:(int64_t)a3;
- (int64_t)numberOfVisualItemsInVisualSection:(int64_t)a3;
- (int64_t)visualSectionForRealSection:(int64_t)a3;
- (void)_baseSectioningDidInvalidateSampling:(id)a3;
- (void)_baseSectioningDidInvalidateSections:(id)a3;
- (void)dealloc;
- (void)enumerateRealMainItemIndexPathsForVisualSection:(int64_t)a3 inVisualItemRange:(_NSRange)a4 usingBlock:(id)a5;
- (void)enumerateRealSectionsForVisualSection:(int64_t)a3 usingBlock:(id)a4;
- (void)invalidateSampling;
- (void)invalidateSections;
- (void)setBaseSectioning:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PULayoutSectioning

- (void).cxx_destruct
{
}

- (PULayoutSectioning)baseSectioning
{
  return self->_baseSectioning;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (PULayoutSectioningDelegate *)a3;
}

- (PULayoutSectioningDelegate)delegate
{
  return self->_delegate;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  v31 = a4;
  v43[2] = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v5 = [(PULayoutSectioning *)self delegate];
  uint64_t v6 = [v5 numberOfRealSectionsForSectioning:self];
  char v7 = objc_opt_respondsToSelector();
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
  unint64_t v9 = 0x1E4F28000uLL;
  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if ((v7 & 1) != 0
        && ([v5 debugDescriptionOfRealSection:i forSectioning:self],
            (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v12 = (void *)v11;
        v42[1] = @"count";
        v43[0] = v11;
        v42[0] = @"name";
        v13 = objc_msgSend(*(id *)(v9 + 3792), "numberWithInteger:", objc_msgSend(v5, "numberOfItemsInRealSection:forSectioning:", i, self));
        v43[1] = v13;
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
        [v8 addObject:v14];

        unint64_t v9 = 0x1E4F28000;
      }
      else
      {
        v40 = @"count";
        v12 = objc_msgSend(*(id *)(v9 + 3792), "numberWithInteger:", objc_msgSend(v5, "numberOfItemsInRealSection:forSectioning:", i, self, v31));
        v41 = v12;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        [v8 addObject:v13];
      }
    }
  }
  objc_msgSend(v34, "setObject:forKey:", v8, @"realSections", v31);

  uint64_t v15 = [v5 numberOfVisualSectionsForSectioning:self];
  v37 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v15];
  char v36 = objc_opt_respondsToSelector();
  char v35 = objc_opt_respondsToSelector();
  unint64_t v16 = 0x1E4F1C000uLL;
  if (v15 >= 1)
  {
    uint64_t v17 = v15;
    for (uint64_t j = 0; j != v17; ++j)
    {
      v19 = [v5 realSectionsForVisualSection:j forSectioning:self];
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v19, "count"));
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __39__PULayoutSectioning_writeToURL_error___block_invoke;
      v38[3] = &unk_1E5F2C2D8;
      id v21 = v20;
      id v39 = v21;
      [v19 enumerateIndexesUsingBlock:v38];
      if (v36)
      {
        v22 = [v5 debugDescriptionOfVisualSection:j forSectioning:self];
      }
      else
      {
        v22 = 0;
      }
      id v23 = objc_alloc_init(*(Class *)(v16 + 2656));
      [v23 setObject:v21 forKey:@"realSections"];
      if (v22) {
        [v23 setObject:v22 forKey:@"name"];
      }
      if (v35)
      {
        uint64_t v24 = objc_msgSend(v5, "maximumNumberOfItemsInVisualSection:withNumberOfRealItems:forSectioning:", j, -[PULayoutSectioning numberOfRealItemsInVisualSection:](self, "numberOfRealItemsInVisualSection:", j), self);
        if (v24 >= 1)
        {
          v25 = [NSNumber numberWithInteger:v24];
          [v23 setObject:v25 forKey:@"max"];

          unint64_t v16 = 0x1E4F1C000;
        }
      }
      [v37 addObject:v23];
    }
  }
  [v34 setObject:v37 forKey:@"visualSections"];

  v26 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v34 format:200 options:0 error:v32];
  v27 = v26;
  if (v26)
  {
    v28 = v33;
    char v29 = [v26 writeToURL:v33 options:0 error:v32];
  }
  else
  {
    char v29 = 0;
    v28 = v33;
  }

  return v29;
}

void __39__PULayoutSectioning_writeToURL_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithInteger:a2];
  [v2 addObject:v3];
}

- (id)sectioningHash
{
  return [(PULayoutSectioning *)self sectioningHashHasIncorrectSampling:0 hasInvisibleItemsInBaseSectioning:0];
}

- (id)sectioningHashHasIncorrectSampling:(BOOL *)a3 hasInvisibleItemsInBaseSectioning:(BOOL *)a4
{
  v4 = NSString;
  v5 = [(PULayoutSectioning *)self _sectioningDescriptionShowInvisibleItemsInBaseSectioning:0 hasIncorrectSampling:a3 hasInvisibleItemsInBaseSectioning:a4];
  uint64_t v6 = objc_msgSend(v4, "stringWithFormat:", @"%llx", objc_msgSend(v5, "pu_platformAgnosticHash"));

  return v6;
}

- (id)sectioningDescription
{
  return [(PULayoutSectioning *)self _sectioningDescriptionShowInvisibleItemsInBaseSectioning:1 hasIncorrectSampling:0 hasInvisibleItemsInBaseSectioning:0];
}

- (id)_sectioningDescriptionShowInvisibleItemsInBaseSectioning:(BOOL)a3 hasIncorrectSampling:(BOOL *)a4 hasInvisibleItemsInBaseSectioning:(BOOL *)a5
{
  v8 = [(PULayoutSectioning *)self delegate];
  char v26 = objc_opt_respondsToSelector();
  char v9 = objc_opt_respondsToSelector();
  v10 = [MEMORY[0x1E4F28E78] string];
  uint64_t v28 = [v8 numberOfVisualSectionsForSectioning:self];
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (v28 >= 1)
  {
    uint64_t v11 = 0;
    char v25 = v9 & 1;
    do
    {
      v12 = [v8 realSectionsForVisualSection:v11 forSectioning:self];
      uint64_t v13 = [v12 count];
      int64_t v14 = [(PULayoutSectioning *)self numberOfVisualItemsInVisualSection:v11];
      char v29 = v12;
      if ((v26 & 1) != 0
        && ([v8 debugDescriptionOfVisualSection:v11 forSectioning:self],
            (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        unint64_t v16 = (void *)v15;
        [v10 appendFormat:@"[%@ (%lu real sections - %ld displayed items)]\n", v15, v13, v14];
      }
      else
      {
        objc_msgSend(v10, "appendFormat:", @"[Visual Section #%ld (%lu real sections - %ld displayed items)]\n", v11, v13, v14);
        unint64_t v16 = 0;
      }
      v42[0] = 0;
      v42[1] = v42;
      void v42[2] = 0x2020000000;
      v42[3] = 0x7FFFFFFFFFFFFFFFLL;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __134__PULayoutSectioning__sectioningDescriptionShowInvisibleItemsInBaseSectioning_hasIncorrectSampling_hasInvisibleItemsInBaseSectioning___block_invoke;
      aBlock[3] = &unk_1E5F27130;
      char v36 = v42;
      char v40 = v25;
      uint64_t v17 = v8;
      id v33 = v8;
      id v34 = self;
      v18 = v10;
      id v19 = v10;
      id v35 = v19;
      uint64_t v37 = v11;
      v38 = a4;
      v20 = a4;
      id v21 = a5;
      id v39 = a5;
      BOOL v41 = a3;
      v22 = _Block_copy(aBlock);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __134__PULayoutSectioning__sectioningDescriptionShowInvisibleItemsInBaseSectioning_hasIncorrectSampling_hasInvisibleItemsInBaseSectioning___block_invoke_2;
      v30[3] = &unk_1E5F27158;
      id v23 = v22;
      id v31 = v23;
      -[PULayoutSectioning enumerateRealMainItemIndexPathsForVisualSection:inVisualItemRange:usingBlock:](self, "enumerateRealMainItemIndexPathsForVisualSection:inVisualItemRange:usingBlock:", v11, 0, v14, v30);
      [v19 appendString:@"\n\n"];

      _Block_object_dispose(v42, 8);
      ++v11;
      a5 = v21;
      a4 = v20;
      v10 = v18;
      v8 = v17;
    }
    while (v28 != v11);
  }

  return v10;
}

uint64_t __134__PULayoutSectioning__sectioningDescriptionShowInvisibleItemsInBaseSectioning_hasIncorrectSampling_hasInvisibleItemsInBaseSectioning___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != a3)
  {
    if (*(unsigned char *)(a1 + 88)
      && ([*(id *)(a1 + 32) debugDescriptionOfRealSection:a3 forSectioning:*(void *)(a1 + 40)],
          (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      char v9 = (void *)v8;
      [*(id *)(a1 + 48) appendFormat:@"(%@)", v8];
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "appendFormat:", @"(#%ld)", a3);
    }
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
  }
  char v23 = 0;
  BOOL v11 = 0;
  if (objc_msgSend(*(id *)(a1 + 40), "visualIndexPathForRealIndexPath:isMainItem:", a3, a4, &v23) == *(void *)(a1 + 64)
    && v10 == a2)
  {
    BOOL v11 = v23 != 0;
  }
  if (!v11)
  {
    uint64_t v13 = *(unsigned char **)(a1 + 72);
    if (v13) {
      unsigned char *v13 = 1;
    }
  }
  unsigned __int8 v22 = 1;
  if ((*(void *)(a1 + 80) || *(unsigned char *)(a1 + 89)) && (int64_t v14 = *(void **)(*(void *)(a1 + 40) + 16)) != 0)
  {
    objc_msgSend(v14, "visualIndexPathForRealIndexPath:isMainItem:", a3, a4, &v22);
    uint64_t v15 = *(unsigned char **)(a1 + 80);
    int v16 = v22;
    if (v15 && !v22)
    {
      *uint64_t v15 = 1;
      int v16 = v22;
    }
  }
  else
  {
    int v16 = 1;
  }
  if (*(unsigned char *)(a1 + 89)) {
    BOOL v17 = v16 == 0;
  }
  else {
    BOOL v17 = 0;
  }
  char v18 = v17;
  id v19 = *(void **)(a1 + 48);
  if (v11)
  {
    if (v18) {
      return objc_msgSend(v19, "appendFormat:", @"{%ld/%ld}", a4, objc_msgSend(*(id *)(a1 + 40), "__debugUnsampledIndexForRealIndexPath:", a3, a4));
    }
    else {
      return objc_msgSend(v19, "appendFormat:", @"<%ld>", a4, v21);
    }
  }
  else if (v18)
  {
    return objc_msgSend(v19, "appendFormat:", @"{*%ld/%ld*}", a4, objc_msgSend(*(id *)(a1 + 40), "__debugUnsampledIndexForRealIndexPath:", a3, a4));
  }
  else
  {
    return objc_msgSend(v19, "appendFormat:", @"<*%ld*>", a4, v21);
  }
}

uint64_t __134__PULayoutSectioning__sectioningDescriptionShowInvisibleItemsInBaseSectioning_hasIncorrectSampling_hasInvisibleItemsInBaseSectioning___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)__debugUnsampledIndexForRealIndexPath:(PUSimpleIndexPath)a3
{
  return a3.var1;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PULayoutSectioning *)self delegate];
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p for %@>", v4, self, v5];

  return v6;
}

- (id)visibleUnsampledIndexesForCombinedRealSections:(id)a3
{
  return 0;
}

- (void)enumerateRealMainItemIndexPathsForVisualSection:(int64_t)a3 inVisualItemRange:(_NSRange)a4 usingBlock:(id)a5
{
  char v10 = 0;
  if ((uint64_t)a4.location < (int64_t)(a4.location + a4.length))
  {
    NSUInteger location = a4.location;
    NSUInteger v8 = a4.length - 1;
    do
    {
      (*((void (**)(id, NSUInteger, int64_t, NSUInteger, char *))a5 + 2))(a5, location, a3, location, &v10);
      ++location;
      if (v10) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = v8 == 0;
      }
      --v8;
    }
    while (!v9);
  }
}

- (void)enumerateRealSectionsForVisualSection:(int64_t)a3 usingBlock:(id)a4
{
  char v4 = 0;
  (*((void (**)(id, int64_t, char *))a4 + 2))(a4, a3, &v4);
}

- (int64_t)visualSectionForRealSection:(int64_t)a3
{
  return a3;
}

- (int64_t)mainRealSectionForVisualSection:(int64_t)a3
{
  return a3;
}

- (PUSimpleIndexPath)visualIndexPathForRealIndexPath:(PUSimpleIndexPath)a3 isMainItem:(BOOL *)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  if (a4) {
    *a4 = 1;
  }
  result.int64_t var1 = var1;
  result.int64_t var0 = var0;
  return result;
}

- (PUSimpleIndexPath)mainRealItemIndexPathForVisualIndexPath:(PUSimpleIndexPath)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  result.int64_t var1 = var1;
  result.int64_t var0 = var0;
  return result;
}

- (int64_t)numberOfVisualItemsInVisualSection:(int64_t)a3
{
  v5 = [(PULayoutSectioning *)self delegate];
  int64_t v6 = [v5 numberOfItemsInRealSection:a3 forSectioning:self];

  return v6;
}

- (void)setBaseSectioning:(id)a3
{
  v5 = (PULayoutSectioning *)a3;
  baseSectioning = self->_baseSectioning;
  BOOL v11 = v5;
  if (baseSectioning != v5)
  {
    if (baseSectioning)
    {
      char v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 removeObserver:self name:@"_PULayoutSectioningDidInvalidateSamplingNotification" object:self->_baseSectioning];

      NSUInteger v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 removeObserver:self name:@"_PULayoutSectioningDidInvalidateSectionsNotification" object:self->_baseSectioning];
    }
    objc_storeStrong((id *)&self->_baseSectioning, a3);
    if (self->_baseSectioning)
    {
      BOOL v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 addObserver:self selector:sel__baseSectioningDidInvalidateSampling_ name:@"_PULayoutSectioningDidInvalidateSamplingNotification" object:self->_baseSectioning];

      char v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 addObserver:self selector:sel__baseSectioningDidInvalidateSections_ name:@"_PULayoutSectioningDidInvalidateSectionsNotification" object:self->_baseSectioning];
    }
  }
}

- (void)invalidateSections
{
  [(PULayoutSectioning *)self invalidateSampling];
  if (!self->_invalidatingSections)
  {
    baseSectioning = self->_baseSectioning;
    if (baseSectioning)
    {
      self->_invalidatingSections = 1;
      [(PULayoutSectioning *)baseSectioning invalidateSections];
      char v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v4 postNotificationName:@"_PULayoutSectioningDidInvalidateSectionsNotification" object:self];

      self->_invalidatingSections = 0;
    }
  }
}

- (void)_baseSectioningDidInvalidateSections:(id)a3
{
  if (!self->_invalidatingSections) {
    [(PULayoutSectioning *)self invalidateSections];
  }
}

- (BOOL)hasSomeSampling
{
  return 0;
}

- (void)invalidateSampling
{
  if (!self->_invalidatingSampling)
  {
    baseSectioning = self->_baseSectioning;
    if (baseSectioning)
    {
      self->_invalidatingSampling = 1;
      [(PULayoutSectioning *)baseSectioning invalidateSampling];
      char v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v4 postNotificationName:@"_PULayoutSectioningDidInvalidateSamplingNotification" object:self];

      self->_invalidatingSampling = 0;
    }
  }
}

- (void)_baseSectioningDidInvalidateSampling:(id)a3
{
  if (!self->_invalidatingSampling) {
    [(PULayoutSectioning *)self invalidateSampling];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PULayoutSectioning;
  [(PULayoutSectioning *)&v4 dealloc];
}

@end
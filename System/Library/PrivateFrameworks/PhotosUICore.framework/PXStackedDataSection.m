@interface PXStackedDataSection
+ (id)dataSectionForAssetsInCollections:(id)a3;
- (NSArray)childDataSections;
- (PXStackedDataSection)initWithChildDataSections:(id)a3 outlineObject:(id)a4;
- (id)_nextEnumerator;
- (id)objectAtIndex:(int64_t)a3;
- (int64_t)count;
- (int64_t)indexOfChildDataSourceForObjectAtIndex:(int64_t)a3 localIndex:(int64_t *)a4;
- (int64_t)itemStartIndexForChildDataSourceAtIndex:(int64_t)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_resetEnumerationState:(id *)a3;
@end

@implementation PXStackedDataSection

+ (id)dataSectionForAssetsInCollections:(id)a3
{
  v16 = (objc_class *)a1;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v3;
  uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        v7 = objc_msgSend(v6, "px_fetchContainedAssetCollections", v16);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v21 != v10) {
                objc_enumerationMutation(v7);
              }
              v12 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:*(void *)(*((void *)&v20 + 1) + 8 * j) options:0];
              v13 = [[PXFetchResultDataSection alloc] initWithFetchResult:v12];
              [v4 addObject:v13];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v9);
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v19);
  }

  v14 = (void *)[[v16 alloc] initWithChildDataSections:v4 outlineObject:0];
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childDataSections, 0);
  objc_storeStrong((id *)&self->_currentEnumerator, 0);
  objc_storeStrong((id *)&self->_childDataSectionsEnumerator, 0);
  objc_storeStrong((id *)&self->_nonEmptyChildDataSectionsIndexMap, 0);
  objc_storeStrong((id *)&self->_nonEmptyChildDataSectionsStartIndexSet, 0);
  objc_storeStrong((id *)&self->_childDataSectionsStartIndexes, 0);
}

- (NSArray)childDataSections
{
  return self->_childDataSections;
}

- (int64_t)count
{
  return self->_count;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (!self->_currentEnumerator)
  {
    uint64_t v9 = [(PXStackedDataSection *)self _nextEnumerator];
    currentEnumerator = self->_currentEnumerator;
    self->_currentEnumerator = v9;

    if (!self->_currentEnumerator) {
      return 0;
    }
    [(PXStackedDataSection *)self _resetEnumerationState:a3];
  }
  a3->var2 = self->_currentEnumeratorMutationsPtr;
  unint64_t result = [(NSFastEnumeration *)self->_currentEnumerator countByEnumeratingWithState:a3 objects:a4 count:a5];
  for (self->_currentEnumeratorMutationsPtr = a3->var2; ; self->_currentEnumeratorMutationsPtr = a3->var2)
  {
    a3->var2 = &self->_enumerationMutations;
    if (result) {
      break;
    }
    v12 = [(PXStackedDataSection *)self _nextEnumerator];
    v13 = self->_currentEnumerator;
    self->_currentEnumerator = v12;

    if (!self->_currentEnumerator) {
      return 0;
    }
    [(PXStackedDataSection *)self _resetEnumerationState:a3];
    a3->var2 = self->_currentEnumeratorMutationsPtr;
    unint64_t result = [(NSFastEnumeration *)self->_currentEnumerator countByEnumeratingWithState:a3 objects:a4 count:a5];
  }
  return result;
}

- (id)_nextEnumerator
{
  childDataSectionsEnumerator = self->_childDataSectionsEnumerator;
  if (!childDataSectionsEnumerator)
  {
    v4 = [(PXStackedDataSection *)self childDataSections];
    v5 = [v4 objectEnumerator];
    v6 = self->_childDataSectionsEnumerator;
    self->_childDataSectionsEnumerator = v5;

    childDataSectionsEnumerator = self->_childDataSectionsEnumerator;
  }
  v7 = [(NSEnumerator *)childDataSectionsEnumerator nextObject];
  if (!v7)
  {
    uint64_t v8 = self->_childDataSectionsEnumerator;
    self->_childDataSectionsEnumerator = 0;
  }
  return v7;
}

- (void)_resetEnumerationState:(id *)a3
{
  a3->var0 = 0;
  *(_OWORD *)a3->var3 = 0u;
  *(_OWORD *)&a3->var3[2] = 0u;
  a3->var3[4] = 0;
  self->_currentEnumeratorMutationsPtr = 0;
}

- (id)objectAtIndex:(int64_t)a3
{
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  int64_t v4 = [(PXStackedDataSection *)self indexOfChildDataSourceForObjectAtIndex:a3 localIndex:&v9];
  v5 = [(PXStackedDataSection *)self childDataSections];
  v6 = [v5 objectAtIndexedSubscript:v4];

  v7 = [v6 objectAtIndex:v9];

  return v7;
}

- (int64_t)itemStartIndexForChildDataSourceAtIndex:(int64_t)a3
{
  id v3 = [(NSArray *)self->_childDataSectionsStartIndexes objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (int64_t)indexOfChildDataSourceForObjectAtIndex:(int64_t)a3 localIndex:(int64_t *)a4
{
  NSUInteger v8 = -[NSIndexSet indexLessThanOrEqualToIndex:](self->_nonEmptyChildDataSectionsStartIndexSet, "indexLessThanOrEqualToIndex:");
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStackedDataSection.m", 62, @"no child data source found for index %ld", a3);

  if (a4) {
LABEL_3:
  }
    *a4 = a3 - v8;
LABEL_4:
  NSUInteger v9 = -[NSIndexSet countOfIndexesInRange:](self->_nonEmptyChildDataSectionsStartIndexSet, "countOfIndexesInRange:", 0, a3 + 1);
  nonEmptyChildDataSectionsIndexMap = self->_nonEmptyChildDataSectionsIndexMap;
  v11 = [NSNumber numberWithUnsignedInteger:v9 - 1];
  v12 = [(NSDictionary *)nonEmptyChildDataSectionsIndexMap objectForKeyedSubscript:v11];

  if (v12) {
    int64_t v13 = [v12 integerValue];
  }
  else {
    int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v13;
}

- (PXStackedDataSection)initWithChildDataSections:(id)a3 outlineObject:(id)a4
{
  long long v23 = self;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v24 = a4;
  id v27 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v28 = 0;
    int64_t v10 = 0;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "count", v23);
        v14 = [NSNumber numberWithUnsignedInteger:v10];
        [v6 addObject:v14];

        if (v13 >= 1)
        {
          [v27 addIndex:v10];
          v15 = [NSNumber numberWithUnsignedInteger:v28 + i];
          [NSNumber numberWithUnsignedInteger:v9];
          v17 = v16 = v6;
          [v26 setObject:v15 forKey:v17];

          v6 = v16;
          v10 += v13;
          ++v9;
        }
      }
      v28 += i;
      uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v8);
  }
  else
  {
    int64_t v10 = 0;
  }

  v29.receiver = v23;
  v29.super_class = (Class)PXStackedDataSection;
  uint64_t v18 = [(PXDataSection *)&v29 initWithOutlineObject:v24];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_nonEmptyChildDataSectionsStartIndexSet, v27);
    objc_storeStrong((id *)&v19->_nonEmptyChildDataSectionsIndexMap, v26);
    objc_storeStrong((id *)&v19->_childDataSectionsStartIndexes, v6);
    uint64_t v20 = [obj copy];
    childDataSections = v19->_childDataSections;
    v19->_childDataSections = (NSArray *)v20;

    v19->_count = v10;
  }

  return v19;
}

@end
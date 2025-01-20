@interface PXSectionedDataSourceEnumerator
- (PXIndexPathSet)indexPathSet;
- (PXSectionedDataSource)dataSource;
- (PXSectionedDataSourceEnumerator)init;
- (PXSectionedDataSourceEnumerator)initWithDataSource:(id)a3 indexPathSet:(id)a4 enumeratedTypes:(unint64_t)a5;
- (PXSimpleIndexPath)_nextItemIndexPathFromIndexPath:(SEL)a3;
- (PXSimpleIndexPath)_nextSectionIndexPathFromIndexPath:(SEL)a3;
- (PXSimpleIndexPath)_nextSubitemIndexPathFromIndexPath:(SEL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)firstObject;
- (id)nextObject;
- (unint64_t)count;
- (unint64_t)enumeratedTypes;
- (void)_setToInitialState;
- (void)_transitionToNextPhase;
@end

@implementation PXSectionedDataSourceEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathSet, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_cachedCount, 0);
}

- (unint64_t)enumeratedTypes
{
  return self->_enumeratedTypes;
}

- (PXIndexPathSet)indexPathSet
{
  return self->_indexPathSet;
}

- (PXSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (id)firstObject
{
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(PXSectionedDataSourceEnumerator *)self indexPathSet];
  v4 = [(PXSectionedDataSourceEnumerator *)self dataSource];
  uint64_t v5 = [v4 identifier];
  if (v3)
  {
    [v3 firstItemIndexPathForDataSourceIdentifier:v5];
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }

  if ((void)v10)
  {
    v6 = [(PXSectionedDataSourceEnumerator *)self dataSource];
    v9[0] = v10;
    v9[1] = v11;
    v7 = [v6 objectAtIndexPath:v9];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)nextObject
{
  int64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  long long v15 = *(_OWORD *)&PXSimpleIndexPathNull[8];
  while (1)
  {
    switch(self->_currentPhase)
    {
      case 0:
        long long v3 = *(_OWORD *)&self->_lastIndexPath.item;
        long long v10 = *(_OWORD *)&self->_lastIndexPath.dataSourceIdentifier;
        long long v11 = v3;
        [(PXSectionedDataSourceEnumerator *)self _nextSectionIndexPathFromIndexPath:&v10];
        int64_t v4 = v12;
        long long v15 = v13;
        int64_t v16 = v14;
        if (!v12) {
          goto LABEL_8;
        }
        goto LABEL_9;
      case 1:
        long long v5 = *(_OWORD *)&self->_lastIndexPath.item;
        long long v10 = *(_OWORD *)&self->_lastIndexPath.dataSourceIdentifier;
        long long v11 = v5;
        [(PXSectionedDataSourceEnumerator *)self _nextItemIndexPathFromIndexPath:&v10];
        goto LABEL_7;
      case 2:
        long long v6 = *(_OWORD *)&self->_lastIndexPath.item;
        long long v10 = *(_OWORD *)&self->_lastIndexPath.dataSourceIdentifier;
        long long v11 = v6;
        [(PXSectionedDataSourceEnumerator *)self _nextSubitemIndexPathFromIndexPath:&v10];
LABEL_7:
        int64_t v4 = v12;
        long long v15 = v13;
        int64_t v16 = v14;
        if (!v12) {
          goto LABEL_8;
        }
LABEL_9:
        v7 = [(PXSectionedDataSourceEnumerator *)self dataSource];
        int64_t v12 = v4;
        long long v13 = v15;
        int64_t v14 = v16;
        v8 = [v7 objectAtIndexPath:&v12];

LABEL_11:
        self->_lastIndexPath.dataSourceIdentifier = v4;
        *(_OWORD *)&self->_lastIndexPath.section = v15;
        self->_lastIndexPath.subitem = v16;
        return v8;
      case 3:
        int64_t v4 = 0;
        v8 = 0;
        goto LABEL_11;
      default:
LABEL_8:
        [(PXSectionedDataSourceEnumerator *)self _transitionToNextPhase];
        break;
    }
  }
}

- (void)_transitionToNextPhase
{
  int64_t currentPhase = self->_currentPhase;
  switch(currentPhase)
  {
    case 2:
      int64_t v5 = 3;
      goto LABEL_10;
    case 1:
      goto LABEL_5;
    case 0:
      if (([(PXSectionedDataSourceEnumerator *)self enumeratedTypes] & 2) == 0)
      {
LABEL_5:
        char v4 = [(PXSectionedDataSourceEnumerator *)self enumeratedTypes];
        int64_t v5 = 2;
        if ((v4 & 4) == 0) {
          int64_t v5 = 3;
        }
        goto LABEL_10;
      }
      int64_t v5 = 1;
LABEL_10:
      self->_int64_t currentPhase = v5;
      break;
  }
  *(_OWORD *)&self->_lastIndexPath.dataSourceIdentifier = *(_OWORD *)PXSimpleIndexPathNull;
  *(_OWORD *)&self->_lastIndexPath.item = *(_OWORD *)&PXSimpleIndexPathNull[16];
}

- (PXSimpleIndexPath)_nextSubitemIndexPathFromIndexPath:(SEL)a3
{
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  return self;
}

- (PXSimpleIndexPath)_nextItemIndexPathFromIndexPath:(SEL)a3
{
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  v7 = [(PXSectionedDataSourceEnumerator *)self dataSource];
  int64_t v8 = [v7 identifier];

  v9 = [(PXSectionedDataSourceEnumerator *)self indexPathSet];
  id v22 = [v9 sectionsWithItemsForDataSourceIdentifier:v8];

  if (a4->dataSourceIdentifier)
  {
    uint64_t section = a4->section;
    int64_t item = a4->item;
    int64_t v12 = [(PXSectionedDataSourceEnumerator *)self indexPathSet];
    long long v13 = [v12 itemIndexSetForDataSourceIdentifier:v8 section:section];

    uint64_t v14 = [v13 indexGreaterThanIndex:item];
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = [v22 indexGreaterThanIndex:section];
      if (v15 == 0x7FFFFFFFFFFFFFFFLL
        || (uint64_t section = v15,
            [(PXSectionedDataSourceEnumerator *)self indexPathSet],
            int64_t v16 = objc_claimAutoreleasedReturnValue(),
            [v16 itemIndexSetForDataSourceIdentifier:v8 section:section],
            v17 = objc_claimAutoreleasedReturnValue(),
            v16,
            !v17))
      {

        v19 = v22;
        goto LABEL_14;
      }
      int64_t v18 = [v17 firstIndex];

      goto LABEL_10;
    }
  }
  else
  {
    v19 = v22;
    if (!v22) {
      goto LABEL_14;
    }
    uint64_t section = [v22 firstIndex];
    v19 = v22;
    if (section == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_14;
    }
    v20 = [(PXSectionedDataSourceEnumerator *)self indexPathSet];
    long long v13 = [v20 itemIndexSetForDataSourceIdentifier:v8 section:section];

    uint64_t v14 = [v13 firstIndex];
  }
  int64_t v18 = v14;
LABEL_10:

  v19 = v22;
  if (section != 0x7FFFFFFFFFFFFFFFLL && v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    retstr->dataSourceIdentifier = v8;
    retstr->uint64_t section = section;
    retstr->int64_t item = v18;
    retstr->subint64_t item = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_14:

  return result;
}

- (PXSimpleIndexPath)_nextSectionIndexPathFromIndexPath:(SEL)a3
{
  *retstr = *(PXSimpleIndexPath *)PXSimpleIndexPathNull;
  v7 = [(PXSectionedDataSourceEnumerator *)self dataSource];
  int64_t v8 = [v7 identifier];

  v9 = [(PXSectionedDataSourceEnumerator *)self indexPathSet];
  long long v13 = [v9 sectionIndexSetForDataSourceIdentifier:v8];

  if (a4->dataSourceIdentifier)
  {
    long long v11 = v13;
    if (!v13) {
      goto LABEL_8;
    }
    int64_t v10 = [v13 indexGreaterThanIndex:a4->section];
  }
  else
  {
    long long v11 = v13;
    if (!v13) {
      goto LABEL_8;
    }
    int64_t v10 = [v13 firstIndex];
  }
  long long v11 = v13;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    retstr->dataSourceIdentifier = v8;
    retstr->uint64_t section = v10;
    *(int64x2_t *)&retstr->int64_t item = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
LABEL_8:

  return (PXSimpleIndexPath *)MEMORY[0x270F9A758](v10, v11);
}

- (unint64_t)count
{
  cachedCount = self->_cachedCount;
  if (!cachedCount)
  {
    if ([(PXSectionedDataSourceEnumerator *)self enumeratedTypes])
    {
      int64_t v5 = [(PXSectionedDataSourceEnumerator *)self indexPathSet];
      uint64_t v4 = [v5 sectionCount];
    }
    else
    {
      uint64_t v4 = 0;
    }
    if (([(PXSectionedDataSourceEnumerator *)self enumeratedTypes] & 2) != 0)
    {
      long long v6 = [(PXSectionedDataSourceEnumerator *)self indexPathSet];
      v4 += [v6 itemCount];
    }
    if (([(PXSectionedDataSourceEnumerator *)self enumeratedTypes] & 4) != 0)
    {
      v7 = [(PXSectionedDataSourceEnumerator *)self indexPathSet];
      v4 += [v7 subitemCount];
    }
    int64_t v8 = [NSNumber numberWithUnsignedInteger:v4];
    v9 = self->_cachedCount;
    self->_cachedCount = v8;

    cachedCount = self->_cachedCount;
  }

  return [(NSNumber *)cachedCount unsignedIntegerValue];
}

- (void)_setToInitialState
{
  if ([(PXSectionedDataSourceEnumerator *)self enumeratedTypes])
  {
    self->_int64_t currentPhase = 0;
  }
  else
  {
    if (([(PXSectionedDataSourceEnumerator *)self enumeratedTypes] & 2) != 0)
    {
      int64_t v3 = 1;
    }
    else if (([(PXSectionedDataSourceEnumerator *)self enumeratedTypes] & 4) != 0)
    {
      int64_t v3 = 2;
    }
    else
    {
      int64_t v3 = 3;
    }
    self->_int64_t currentPhase = v3;
  }
  *(_OWORD *)&self->_lastIndexPath.dataSourceIdentifier = *(_OWORD *)PXSimpleIndexPathNull;
  *(_OWORD *)&self->_lastIndexPath.int64_t item = *(_OWORD *)&PXSimpleIndexPathNull[16];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [PXSectionedDataSourceEnumerator alloc];
  int64_t v5 = [(PXSectionedDataSourceEnumerator *)self dataSource];
  long long v6 = [(PXSectionedDataSourceEnumerator *)self indexPathSet];
  v7 = [(PXSectionedDataSourceEnumerator *)v4 initWithDataSource:v5 indexPathSet:v6 enumeratedTypes:[(PXSectionedDataSourceEnumerator *)self enumeratedTypes]];

  return v7;
}

- (PXSectionedDataSourceEnumerator)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSectionedDataSourceEnumerator.m", 41, @"%s is not available as initializer", "-[PXSectionedDataSourceEnumerator init]");

  abort();
}

- (PXSectionedDataSourceEnumerator)initWithDataSource:(id)a3 indexPathSet:(id)a4 enumeratedTypes:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXSectionedDataSourceEnumerator;
  long long v11 = [(PXSectionedDataSourceEnumerator *)&v16 init];
  int64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataSource, a3);
    uint64_t v13 = [v10 copy];
    indexPathSet = v12->_indexPathSet;
    v12->_indexPathSet = (PXIndexPathSet *)v13;

    v12->_enumeratedTypes = a5;
    [(PXSectionedDataSourceEnumerator *)v12 _setToInitialState];
  }

  return v12;
}

@end
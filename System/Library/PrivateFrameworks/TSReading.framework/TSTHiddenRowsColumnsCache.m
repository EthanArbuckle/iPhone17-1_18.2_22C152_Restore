@interface TSTHiddenRowsColumnsCache
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)visibleCellOffsetBy:(id)a3 fromCellID:(id)a4;
- (BOOL)anyColumnsHiddenInCellRange:(id)a3;
- (BOOL)anyRowsHiddenInCellRange:(id)a3;
- (BOOL)anyRowsUserHiddenInCellRange:(id)a3;
- (BOOL)isColumnHidden:(unsigned __int8)a3;
- (BOOL)isRowHidden:(unsigned __int16)a3;
- (BOOL)isRowUserHidden:(unsigned __int16)a3;
- (NSIndexSet)visibleColumnIndices;
- (NSIndexSet)visibleRowIndices;
- (TSTHiddenRowsColumnsCache)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)nextVisibleColumn:(unsigned __int8)a3;
- (unsigned)nextVisibleRow:(unsigned __int16)a3;
- (unsigned)numberColumnsHiddenInCellRange:(id)a3;
- (unsigned)numberOfVisibleRowsFromHeader:(unsigned __int16)a3;
- (unsigned)numberRowsHiddenInCellRange:(id)a3;
- (unsigned)numberRowsUserHiddenInCellRange:(id)a3;
- (unsigned)previousNthVisibleColumn:(unsigned __int16)a3 fromColumnIndex:(unsigned __int8)a4;
- (unsigned)previousNthVisibleRow:(unsigned __int16)a3 fromRowIndex:(unsigned __int16)a4;
- (unsigned)previousVisibleColumn:(unsigned __int8)a3;
- (unsigned)previousVisibleRow:(unsigned __int16)a3;
- (void)dealloc;
- (void)pop;
- (void)push;
- (void)pushAndValidate:(id)a3;
- (void)swap;
- (void)validate:(id)a3;
- (void)validateChangeDescriptors:(id)a3;
@end

@implementation TSTHiddenRowsColumnsCache

- (TSTHiddenRowsColumnsCache)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSTHiddenRowsColumnsCache;
  v2 = [(TSTHiddenRowsColumnsCache *)&v4 init];
  if (v2)
  {
    v2->mHiddenRows = [[TSTHiddenDimensionCache alloc] initWithUserHiddenInformation:1];
    v2->mHiddenColumns = [[TSTHiddenDimensionCache alloc] initWithUserHiddenInformation:0];
  }
  return v2;
}

- (void)dealloc
{
  self->mHiddenRows = 0;
  self->mHiddenColumns = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTHiddenRowsColumnsCache;
  [(TSTHiddenRowsColumnsCache *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = [+[TSTHiddenRowsColumnsCache allocWithZone:a3] init];
  v4->mHiddenColumns = (TSTHiddenDimensionCache *)[(TSTHiddenDimensionCache *)self->mHiddenColumns copy];
  v4->mHiddenRows = (TSTHiddenDimensionCache *)[(TSTHiddenDimensionCache *)self->mHiddenRows copy];
  return v4;
}

- (BOOL)isRowHidden:(unsigned __int16)a3
{
  return [(TSTHiddenDimensionCache *)self->mHiddenRows isIndexHidden:a3];
}

- (BOOL)isRowUserHidden:(unsigned __int16)a3
{
  return [(TSTHiddenDimensionCache *)self->mHiddenRows isIndexUserHidden:a3];
}

- (BOOL)isColumnHidden:(unsigned __int8)a3
{
  return [(TSTHiddenDimensionCache *)self->mHiddenColumns isIndexHidden:a3];
}

- (unsigned)numberRowsHiddenInCellRange:(id)a3
{
  return -[TSTHiddenDimensionCache numberHiddenIndicesInRange:](self->mHiddenRows, "numberHiddenIndicesInRange:", a3.var0.var0, a3.var1.var1);
}

- (unsigned)numberRowsUserHiddenInCellRange:(id)a3
{
  return -[TSTHiddenDimensionCache numberUserHiddenIndicesInRange:](self->mHiddenRows, "numberUserHiddenIndicesInRange:", a3.var0.var0, a3.var1.var1);
}

- (unsigned)numberColumnsHiddenInCellRange:(id)a3
{
  return -[TSTHiddenDimensionCache numberHiddenIndicesInRange:](self->mHiddenColumns, "numberHiddenIndicesInRange:", a3.var0.var1, a3.var1.var0);
}

- (BOOL)anyRowsHiddenInCellRange:(id)a3
{
  return -[TSTHiddenDimensionCache anyHiddenIndicesInRange:](self->mHiddenRows, "anyHiddenIndicesInRange:", a3.var0.var0, a3.var1.var1);
}

- (BOOL)anyRowsUserHiddenInCellRange:(id)a3
{
  return -[TSTHiddenDimensionCache anyUserHiddenIndicesInRange:](self->mHiddenRows, "anyUserHiddenIndicesInRange:", a3.var0.var0, a3.var1.var1);
}

- (BOOL)anyColumnsHiddenInCellRange:(id)a3
{
  return -[TSTHiddenDimensionCache anyHiddenIndicesInRange:](self->mHiddenColumns, "anyHiddenIndicesInRange:", a3.var0.var1, a3.var1.var0);
}

- (unsigned)previousVisibleRow:(unsigned __int16)a3
{
  return [(TSTHiddenDimensionCache *)self->mHiddenRows findPreviousVisibleIndex:a3];
}

- (unsigned)nextVisibleRow:(unsigned __int16)a3
{
  return [(TSTHiddenDimensionCache *)self->mHiddenRows findNextVisibleIndex:a3];
}

- (unsigned)previousVisibleColumn:(unsigned __int8)a3
{
  return [(TSTHiddenDimensionCache *)self->mHiddenColumns findPreviousVisibleIndex:a3];
}

- (unsigned)nextVisibleColumn:(unsigned __int8)a3
{
  return [(TSTHiddenDimensionCache *)self->mHiddenColumns findNextVisibleIndex:a3];
}

- (unsigned)previousNthVisibleRow:(unsigned __int16)a3 fromRowIndex:(unsigned __int16)a4
{
  return [(TSTHiddenDimensionCache *)self->mHiddenRows findNthPreviousVisibleIndex:a3 fromIndex:a4];
}

- (unsigned)previousNthVisibleColumn:(unsigned __int16)a3 fromColumnIndex:(unsigned __int8)a4
{
  return [(TSTHiddenDimensionCache *)self->mHiddenColumns findNthPreviousVisibleIndex:a3 fromIndex:a4];
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)visibleCellOffsetBy:(id)a3 fromCellID:(id)a4
{
  unsigned __int16 var0 = a4.var0;
  uint64_t v5 = *(void *)&a4.var0 >> 16;
  uint64_t v6 = a4.var0;
  if (a4.var0 == 0xFFFFLL || (*(_DWORD *)&a4 & 0xFF0000) == 0xFF0000)
  {
    unsigned int v12 = *(_DWORD *)&a4 & 0xFF000000;
  }
  else
  {
    uint64_t var1 = a3.var1;
    if (a3.var0)
    {
      mHiddenColumns = self->mHiddenColumns;
      if (a3.var0 < 1) {
        char v11 = [(TSTHiddenDimensionCache *)mHiddenColumns findNthPreviousVisibleIndex:-a3.var0 fromIndex:a4.var1];
      }
      else {
        char v11 = [(TSTHiddenDimensionCache *)mHiddenColumns findNthNextVisibleIndex:a3.var0 fromIndex:a4.var1];
      }
      LOBYTE(v5) = v11;
    }
    if (var1)
    {
      mHiddenRows = self->mHiddenRows;
      if ((int)var1 < 1) {
        unsigned __int16 v14 = [(TSTHiddenDimensionCache *)mHiddenRows findNthPreviousVisibleIndex:-(uint64_t)(*(void *)&a3 & 0xFFFFFFFF00000000) >> 32 fromIndex:v6];
      }
      else {
        unsigned __int16 v14 = [(TSTHiddenDimensionCache *)mHiddenRows findNthNextVisibleIndex:var1 fromIndex:v6];
      }
      unsigned __int16 var0 = v14;
    }
    unsigned int v12 = 0;
  }
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)(v12 | (v5 << 16) | var0);
}

- (NSIndexSet)visibleRowIndices
{
  return [(TSTHiddenDimensionCache *)self->mHiddenRows visibleIndices];
}

- (NSIndexSet)visibleColumnIndices
{
  return [(TSTHiddenDimensionCache *)self->mHiddenColumns visibleIndices];
}

- (unsigned)numberOfVisibleRowsFromHeader:(unsigned __int16)a3
{
  return [(TSTHiddenDimensionCache *)self->mHiddenRows numberOfVisibleIndicesToMarkIndexFrom:a3];
}

- (void)pushAndValidate:(id)a3
{
  [(TSTHiddenRowsColumnsCache *)self push];

  [(TSTHiddenRowsColumnsCache *)self validate:a3];
}

- (void)push
{
  id AssociatedObject = objc_getAssociatedObject(self, "TSTHiddenRowsColumnsCacheStackKey");
  if (!AssociatedObject)
  {
    id AssociatedObject = (id)[MEMORY[0x263EFF980] array];
    objc_setAssociatedObject(self, "TSTHiddenRowsColumnsCacheStackKey", AssociatedObject, (void *)1);
  }
  if ([AssociatedObject count])
  {
    objc_super v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSTHiddenRowsColumnsCache push]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTHiddenRowsColumnsCache.m"), 249, @"really we should only be pushing one");
  }
  id v6 = (id)[(TSTHiddenRowsColumnsCache *)self copy];

  [AssociatedObject addObject:v6];
}

- (void)swap
{
  id AssociatedObject = objc_getAssociatedObject(self, "TSTHiddenRowsColumnsCacheStackKey");
  if (AssociatedObject)
  {
    objc_super v4 = AssociatedObject;
    uint64_t v5 = (id *)(id)[AssociatedObject lastObject];
    if (v5)
    {
      id v6 = v5;
      [v4 removeLastObject];
      objc_msgSend(v4, "addObject:", (id)-[TSTHiddenRowsColumnsCache copy](self, "copy"));

      self->mHiddenColumns = (TSTHiddenDimensionCache *)v6[2];
      self->mHiddenRows = (TSTHiddenDimensionCache *)v6[1];
    }
  }
}

- (void)pop
{
  id AssociatedObject = objc_getAssociatedObject(self, "TSTHiddenRowsColumnsCacheStackKey");
  if (AssociatedObject)
  {
    objc_super v4 = AssociatedObject;
    uint64_t v5 = [AssociatedObject lastObject];
    if (v5)
    {
      uint64_t v6 = v5;

      self->mHiddenColumns = (TSTHiddenDimensionCache *)*(id *)(v6 + 16);
      self->mHiddenRows = (TSTHiddenDimensionCache *)*(id *)(v6 + 8);
      [v4 removeLastObject];
    }
    if (![v4 count])
    {
      objc_setAssociatedObject(self, "TSTHiddenRowsColumnsCacheStackKey", 0, (void *)0x301);
    }
  }
}

- (void)validate:(id)a3
{
  [(TSTHiddenDimensionCache *)self->mHiddenRows setCount:TSTMasterLayoutGetTableNumberOfRows((uint64_t)a3)];
  [(TSTHiddenDimensionCache *)self->mHiddenRows setMarkIndex:TSTMasterLayoutGetTableNumberOfHeaderRows((unsigned __int16 *)a3)];
  [(TSTHiddenDimensionCache *)self->mHiddenColumns setCount:TSTMasterLayoutGetTableNumberOfColumns((uint64_t)a3)];
  if (([a3 isDynamicallyHidingRowsCols] & 1) != 0
    || objc_msgSend((id)objc_msgSend(a3, "tableModel"), "numberOfHiddenColumns"))
  {
    mHiddenColumns = self->mHiddenColumns;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __38__TSTHiddenRowsColumnsCache_validate___block_invoke;
    v8[3] = &unk_2646B3918;
    v8[4] = a3;
    [(TSTHiddenDimensionCache *)mHiddenColumns setAllInvalidValuesUsingBlock:v8];
  }
  else
  {
    [(TSTHiddenDimensionCache *)self->mHiddenColumns setAllValuesToZero];
  }
  if (([a3 isDynamicallyHidingRowsCols] & 1) != 0
    || objc_msgSend((id)objc_msgSend(a3, "tableModel"), "numberOfHiddenRows"))
  {
    mHiddenRows = self->mHiddenRows;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__TSTHiddenRowsColumnsCache_validate___block_invoke_2;
    v7[3] = &unk_2646B3918;
    v7[4] = a3;
    [(TSTHiddenDimensionCache *)mHiddenRows setAllInvalidValuesUsingBlock:v7];
  }
  else
  {
    [(TSTHiddenDimensionCache *)self->mHiddenRows setAllValuesToZero];
  }
}

uint64_t __38__TSTHiddenRowsColumnsCache_validate___block_invoke(uint64_t a1, unsigned __int8 a2)
{
  return TSTMasterLayoutIsColumnHiddenWorker(*(void **)(a1 + 32), a2);
}

uint64_t __38__TSTHiddenRowsColumnsCache_validate___block_invoke_2(uint64_t a1, unsigned __int16 a2)
{
  return TSTMasterLayoutIsRowHiddenWorker(*(void **)(a1 + 32), a2);
}

- (void)validateChangeDescriptors:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v10 = [v9 changeDescriptor];
        char v11 = (void *)[v9 cellRegion];
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __55__TSTHiddenRowsColumnsCache_validateChangeDescriptors___block_invoke;
        v12[3] = &unk_2646B3580;
        int v13 = v10;
        v12[4] = self;
        v12[5] = v9;
        [v11 enumerateCellRangesUsingBlock:v12];
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

uint64_t __55__TSTHiddenRowsColumnsCache_validateChangeDescriptors___block_invoke(uint64_t result, unint64_t a2)
{
  switch(*(_DWORD *)(result + 48))
  {
    case 1:
      long long v15 = *(void **)(*(void *)(result + 32) + 16);
      uint64_t v16 = BYTE2(a2);
      unint64_t v17 = WORD2(a2);
      goto LABEL_15;
    case 2:
      v18 = *(void **)(*(void *)(result + 32) + 16);
      uint64_t v19 = BYTE2(a2);
      unint64_t v20 = WORD2(a2);
      goto LABEL_19;
    case 3:
    case 6:
      v2 = *(void **)(*(void *)(result + 32) + 16);
      uint64_t v3 = BYTE2(a2);
      uint64_t v4 = WORD2(a2);
      uint64_t v5 = ([*(id *)(result + 40) cellID] >> 16);
      uint64_t v6 = v2;
      uint64_t v7 = v3;
      uint64_t v8 = v4;
      goto LABEL_4;
    case 5:
      unsigned int v12 = *(void **)(*(void *)(result + 32) + 16);
      uint64_t v14 = BYTE2(a2);
      unint64_t v13 = WORD2(a2);
      goto LABEL_11;
    case 7:
    case 0x17:
      v9 = *(void **)(*(void *)(result + 32) + 8);
      unint64_t v10 = HIWORD(a2);
      uint64_t v11 = (unsigned __int16)a2;
      uint64_t v5 = (unsigned __int16)[*(id *)(result + 40) cellID];
      uint64_t v6 = v9;
      uint64_t v7 = v11;
      uint64_t v8 = v10;
LABEL_4:
      result = objc_msgSend(v6, "moveRangeFrom:toIndex:", v7, v8, v5);
      break;
    case 0x15:
      long long v15 = *(void **)(*(void *)(result + 32) + 8);
      unint64_t v17 = HIWORD(a2);
      uint64_t v16 = (unsigned __int16)a2;
LABEL_15:
      result = objc_msgSend(v15, "deleteRange:", v16, v17);
      break;
    case 0x16:
      v18 = *(void **)(*(void *)(result + 32) + 8);
      unint64_t v20 = HIWORD(a2);
      uint64_t v19 = (unsigned __int16)a2;
LABEL_19:
      result = objc_msgSend(v18, "insertRange:", v19, v20);
      break;
    case 0x19:
    case 0x1A:
      unsigned int v12 = *(void **)(*(void *)(result + 32) + 8);
      unint64_t v13 = HIWORD(a2);
      uint64_t v14 = (unsigned __int16)a2;
LABEL_11:
      result = objc_msgSend(v12, "invalidate:", v14, v13);
      break;
    default:
      return result;
  }
  return result;
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p hiddenColumns=%@ hiddenRows=%@>", NSStringFromClass(v4), self, -[TSTHiddenDimensionCache description](self->mHiddenColumns, "description"), -[TSTHiddenDimensionCache description](self->mHiddenRows, "description")];
}

@end
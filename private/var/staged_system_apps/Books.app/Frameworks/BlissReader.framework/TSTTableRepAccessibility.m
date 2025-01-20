@interface TSTTableRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- ($0E7DCC040F5CEAF2787150A9C1D66156)tsaxRangeOfSelectedColumnsOrRows;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxCellIDForCanvasPoint:(CGPoint)a3;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxClosestCellIDForCanvasPoint:(CGPoint)a3;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxCoordinatesOfFirstNonMergedCellInColumnOrRowForCellID:(id)a3 inDirection:(int)a4;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxEditingCellID;
- (BOOL)_tsaxNeedsColumnAndRowIndexElements;
- (BOOL)isAccessibilityElement;
- (BOOL)tsaxChildCellIsSelectedAtCellID:(id)a3;
- (BOOL)tsaxColumnOrRowIsSelectedAtCellID:(id)a3 inDirection:(int)a4;
- (BOOL)tsaxIsChromeVisible;
- (CGRect)tsaxConvertBoundsToTableLayoutUnscaledRect:(CGRect)a3;
- (CGRect)tsaxDeviceBoundsForCellRange:(id)a3;
- (CGRect)tsaxUnscaledCanvasFrameForCellRange:(id)a3;
- (NSArray)tsaxChildrenCells;
- (NSArray)tsaxColumnElements;
- (NSArray)tsaxColumnIndexElements;
- (NSArray)tsaxRowElements;
- (NSArray)tsaxRowIndexElements;
- (NSArray)tsaxSelectedCells;
- (NSMutableArray)_tsaxCellsRowsAndColumnsCache;
- (NSMutableArray)_tsaxChildrenCellsCache;
- (NSMutableArray)_tsaxColumnElementsCache;
- (NSMutableArray)_tsaxColumnIndexElementsCache;
- (NSMutableArray)_tsaxRowElementsCache;
- (NSMutableArray)_tsaxRowIndexElementsCache;
- (NSMutableArray)_tsaxTwoDimensionalChildrenCellsCache;
- (NSMutableArray)tsaxHeaderElementsCache;
- (NSString)tsaxLabel;
- (NSString)tsaxTableName;
- (TSTCellRegionAccessibility)tsaxSelectionRegion;
- (TSTTableCellAccessibilityElement)tsaxSelectionAnchorCellElement;
- (TSTTableCellTextEditingControllerAccessibility)tsaxContainedTextEditor;
- (TSTTableControlCellEditorAccessibility)tsaxControlCellEditor;
- (TSTTableEditorAccessibility)tsaxTableEditor;
- (TSTTableSelectionAccessibility)tsaxTableSelection;
- (TSWPRepAccessibility)tsaxContainedTextEditingRep;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_tsaxColumnOrRowElementWithKind:(int)a3 forCellID:(id)a4 inDirection:(int)a5;
- (id)_tsaxPrePopulatedColumnOrRowElementsCacheWithKind:(int)a3 inDirection:(int)a4 cacheWasRebuilt:(BOOL *)a5;
- (id)accessibilityElements;
- (id)tsaxChildCellForCellID:(id)a3;
- (id)tsaxChildrenCellsInColumnOrRowForCellID:(id)a3 inDirection:(int)a4;
- (id)tsaxChildrenCellsInRange:(id)a3;
- (id)tsaxColumnOrRowElementForCellID:(id)a3 inDirection:(int)a4;
- (id)tsaxColumnOrRowFullIndexDescriptionForCellID:(id)a3 inDirection:(int)a4;
- (id)tsaxColumnOrRowIndexDescriptionForCellID:(id)a3 inDirection:(int)a4;
- (id)tsaxColumnOrRowIndexElementForCellID:(id)a3 inDirection:(int)a4;
- (id)tsaxColumnOrRowNameForCellID:(id)a3 inDirection:(int)a4 withComponents:(int)a5;
- (id)tsaxFocusedElement;
- (id)tsaxKnobLabel;
- (id)tsaxStringForCellID:(id)a3;
- (id)tsaxTableChrome;
- (id)tsaxTableLayout;
- (id)tsaxTableModel;
- (int)tsaxControlKindForCellID:(id)a3;
- (int)tsaxEditingMode;
- (int64_t)accessibilityContainerType;
- (unint64_t)tsaxColumnsCount;
- (unint64_t)tsaxRowsCount;
- (unsigned)tsaxNumberOfHeaderColumns;
- (unsigned)tsaxNumberOfHeaderRows;
- (void)_tsaxCleanupChildren;
- (void)_tsaxCleanupTableChildrenElementsCache:(id)a3;
- (void)_tsaxPerformGestureOnCellForID:(id)a3 withSafeBlock:(id)a4;
- (void)_tsaxSetCellsRowsAndColumnsCache:(id)a3;
- (void)_tsaxSetChildrenCellsCache:(id)a3;
- (void)_tsaxSetColumnElementsCache:(id)a3;
- (void)_tsaxSetColumnIndexElementsCache:(id)a3;
- (void)_tsaxSetRowElementsCache:(id)a3;
- (void)_tsaxSetRowIndexElementsCache:(id)a3;
- (void)_tsaxSetTwoDimensionalChildrenCellsCache:(id)a3;
- (void)tsaxAccessModelForCellID:(id)a3 usingBlock:(id)a4;
- (void)tsaxBeginEditingCellForID:(id)a3 editingSelection:(int)a4;
- (void)tsaxDidCleanupChildren;
- (void)tsaxEndEditingCurrentEditingCell;
- (void)tsaxEnumerateSelectedCellsIncludingEmptyCells:(BOOL)a3 includeHiddenCells:(BOOL)a4 usingBlock:(id)a5;
- (void)tsaxMoveToColumnOrRowForCellID:(id)a3 inDirection:(int)a4;
- (void)tsaxPerformCleanupTasksPriorToRemovalFromCanvas;
- (void)tsaxSelectCellForID:(id)a3;
- (void)tsaxSelectColumnOrRowForCellID:(id)a3 inDirection:(int)a4;
- (void)tsaxSetHeaderElementsCache:(id)a3;
- (void)tsaxShowPopupMenuForMultipleChoiceCellWithModel:(id)a3;
- (void)tsaxToggleValueOfCheckboxInCellWithModel:(id)a3;
- (void)tsaxWillSelectCellForID:(id)a3;
- (void)updateChildrenFromLayout;
- (void)updateFromLayout;
@end

@implementation TSTTableRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTTableRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSMutableArray)_tsaxChildrenCellsCache
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_5738BA);
}

- (void)_tsaxSetChildrenCellsCache:(id)a3
{
}

- (NSMutableArray)_tsaxTwoDimensionalChildrenCellsCache
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_5738BB);
}

- (void)_tsaxSetTwoDimensionalChildrenCellsCache:(id)a3
{
}

- (NSString)tsaxLabel
{
  v3 = [(TSDRepAccessibility *)self tsaxLockedLabel];
  v4 = [(TSTTableRepAccessibility *)self tsaxTableName];
  uint64_t v5 = [(TSTTableRepAccessibility *)self tsaxRowsCount];
  uint64_t v6 = [(TSTTableRepAccessibility *)self tsaxColumnsCount];
  if (v5 == 1) {
    CFStringRef v7 = @"row.count.singular %@";
  }
  else {
    CFStringRef v7 = @"row.count.plural %@";
  }
  v8 = TSAccessibilityLocalizedString((uint64_t)v7);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, TSAccessibilityLocalizedUnsignedInteger(v5));
  if (v6 == 1) {
    CFStringRef v9 = @"column.count.singular %@";
  }
  else {
    CFStringRef v9 = @"column.count.plural %@";
  }
  v10 = TSAccessibilityLocalizedString((uint64_t)v9);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, TSAccessibilityLocalizedUnsignedInteger(v6));
  if (![(NSString *)v4 length]) {
    v4 = TSAccessibilityLocalizedString(@"table");
  }
  return (NSString *)__TSAccessibilityStringForVariables(1, v3, v11, v12, v13, v14, v15, v16, (uint64_t)v4);
}

- (id)tsaxKnobLabel
{
  return TSAccessibilityLocalizedString(@"table");
}

- (NSArray)tsaxChildrenCells
{
  unint64_t v4 = [(TSTTableRepAccessibility *)self tsaxRowsCount];
  unint64_t v5 = [(TSTTableRepAccessibility *)self tsaxColumnsCount];
  uint64_t v6 = [(TSTTableRepAccessibility *)self _tsaxChildrenCellsCache];
  CFStringRef v7 = [(TSTTableRepAccessibility *)self _tsaxTwoDimensionalChildrenCellsCache];
  v8 = v7;
  p_super = &v6->super;
  if (v6)
  {
    if ([(NSMutableArray *)v7 count] == (id)v4 && [(NSMutableArray *)v6 count] == (id)(v5 * v4)) {
      return p_super;
    }
    [(NSMutableArray *)v6 removeAllObjects];
  }
  else
  {
    CFStringRef v9 = (NSArray *)objc_opt_new();
    [(TSTTableRepAccessibility *)self _tsaxSetChildrenCellsCache:v9];
    p_super = v9;
  }
  id v33 = [v8 mutableCopy];
  v37 = (char *)[v33 count];
  if (v8)
  {
    [v8 removeAllObjects];
  }
  else
  {
    v8 = objc_opt_new();
    [(TSTTableRepAccessibility *)self _tsaxSetTwoDimensionalChildrenCellsCache:v8];
  }
  uint64_t v36 = (unsigned __int16)v4;
  if ((_WORD)v4)
  {
    uint64_t v10 = 0;
    v34 = v8;
    uint64_t v35 = v5;
    unint64_t v11 = (unint64_t)v5 << 16;
    do
    {
      uint64_t v12 = objc_opt_new();
      [v8 addObject:v12];
      uint64_t v13 = v37;
      if (v37)
      {
        id v14 = [v33 objectAtIndex:0];
        [v33 removeObjectAtIndex:0];
        uint64_t v13 = v37 - 1;
      }
      else
      {
        id v14 = 0;
      }
      uint64_t v15 = (char *)[v14 count];
      v37 = v13;
      if (v35)
      {
        uint64_t v16 = v15;
        uint64_t v17 = 0;
        do
        {
          uint64_t v18 = v17 | v10;
          if (v16)
          {
            v19 = (TSTTableCellAccessibilityElement *)[v14 objectAtIndex:0];
            [v14 removeObjectAtIndex:0];
            --v16;
            if (TSAccessibilityShouldPerformValidationChecks())
            {
              if (v18 != ((unint64_t)[(TSTTableCellAccessibilityElement *)v19 cellID] & 0xFFFFFF))
              {
                int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
                if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Cell ID of previous cell is invalid", v21, v22, v23, v24, v25, (uint64_t)v33))abort(); {
              }
                }
            }
          }
          else
          {
            if ([(TSTTableRepAccessibility *)self tsaxRespondsToSelector:"tsaxAlternateParentForCellID:" fromExtrasProtocol:&OBJC_PROTOCOL___TSTTableRepAccessibilityExtras])
            {
              unint64_t v38 = v38 & 0xFFFFFFFF00000000 | v18;
              v26 = (TSTTableRepAccessibility *)-[TSTTableRepAccessibility tsaxAlternateParentForCellID:](self, "tsaxAlternateParentForCellID:");
            }
            else
            {
              v26 = 0;
            }
            if (v26) {
              v27 = v26;
            }
            else {
              v27 = self;
            }
            v19 = [(TSAccessibilityElement *)[TSTTableCellAccessibilityElement alloc] initWithAccessibilityParent:v27];
            [(TSTTableCellAccessibilityElement *)v19 setTableRep:self];
            unint64_t v2 = v2 & 0xFFFFFFFF00000000 | v18;
            [(TSTTableCellAccessibilityElement *)v19 setCellID:v2];
            uint64_t v16 = 0;
          }
          [v12 addObject:v19];
          [(NSArray *)p_super addObject:v19];

          v17 += 0x10000;
        }
        while (v11 != v17);
      }

      [(TSTTableRepAccessibility *)self _tsaxCleanupTableChildrenElementsCache:v14];
      ++v10;
      v8 = v34;
    }
    while (v10 != v36);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v28 = [v33 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v41;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v41 != v30) {
          objc_enumerationMutation(v33);
        }
        [(TSTTableRepAccessibility *)self _tsaxCleanupTableChildrenElementsCache:*(void *)(*((void *)&v40 + 1) + 8 * i)];
      }
      id v29 = [v33 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v29);
  }
  [v33 removeAllObjects];

  return p_super;
}

- (id)tsaxChildCellForCellID:(id)a3
{
  [(TSTTableRepAccessibility *)self _tsaxEnsureChildrenCellsAreLoaded];
  unint64_t v5 = [(TSTTableRepAccessibility *)self _tsaxTwoDimensionalChildrenCellsCache];
  if (a3.var0 >= (unint64_t)[(NSMutableArray *)v5 count]) {
    return 0;
  }
  id v6 = [(NSMutableArray *)v5 objectAtIndex:a3.var0];
  unint64_t var1 = a3.var1;
  if (var1 >= (unint64_t)[v6 count]) {
    return 0;
  }

  return [v6 objectAtIndex:var1];
}

- (id)tsaxChildrenCellsInRange:(id)a3
{
  unint64_t v3 = (unint64_t)a3;
  int var1 = a3.var1.var1;
  [(TSTTableRepAccessibility *)self _tsaxEnsureChildrenCellsAreLoaded];
  [(TSTTableRepAccessibility *)self tsaxTableModel];
  uint64_t v24 = [(TSTTableRepAccessibility *)self _tsaxTwoDimensionalChildrenCellsCache];
  unsigned __int16 v6 = (unsigned __int16)[(NSMutableArray *)v24 count];
  unsigned int v7 = var1 + (unsigned __int16)v3;
  if (v7 >= v6) {
    unsigned int v7 = v6;
  }
  unsigned int v23 = v7;
  if (v7 <= (unsigned __int16)v3)
  {
    v8 = 0;
  }
  else
  {
    v8 = 0;
    uint64_t v22 = BYTE2(v3);
    int v9 = (unsigned __int16)v3 | (BYTE2(v3) << 16);
    unsigned int v21 = BYTE2(v3);
    unsigned int v10 = BYTE2(v3) + WORD2(v3);
    do
    {
      id v11 = [(NSMutableArray *)v24 objectAtIndex:(unsigned __int16)v9];
      unsigned __int8 v12 = [v11 count];
      if (v10 >= v12) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = v10;
      }
      unsigned int v14 = v9;
      uint64_t v15 = v22;
      if (v13 > v21)
      {
        do
        {
          uint64_t v16 = v14;
          unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v14;
          unint64_t v17 = TSTTableMergeRangeAtCellID();
          if ((_WORD)v17 == 0xFFFF
            || ((v17 & 0xFF0000) != 0xFF0000 ? (BOOL v18 = HIWORD(v17) == 0) : (BOOL v18 = 1),
                !v18 ? (BOOL v19 = (v17 & 0xFFFF00000000) == 0) : (BOOL v19 = 1),
                v19 || (v17 & 0xFFFFFF) == v16 && (v17 & 0xFFFFFFFF00000000) == 0x1000100000000))
          {
            if (!v8) {
              v8 = objc_opt_new();
            }
            [v8 addObject:[v11 objectAtIndex:v15]];
          }
          ++v15;
          unsigned int v14 = v16 + 0x10000;
        }
        while (v13 > v15);
      }
      ++v9;
    }
    while (v23 > (unsigned __int16)v9);
  }

  return v8;
}

- (id)tsaxStringForCellID:(id)a3
{
  id result = [(TSTTableRepAccessibility *)self tsaxTableModel];
  if (result)
  {
    return (id)TSTTableStringForCellAtCellID();
  }
  return result;
}

- (int)tsaxControlKindForCellID:(id)a3
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_25D40C;
  v5[3] = &unk_46BB18;
  v5[4] = &v6;
  [(TSTTableRepAccessibility *)self tsaxAccessModelForCellID:*(unsigned int *)&a3 usingBlock:v5];
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)tsaxAccessModelForCellID:(id)a3 usingBlock:(id)a4
{
  uint64_t var1 = a3.var1;
  uint64_t var0 = a3.var0;
  id v8 = [(TSTTableRepAccessibility *)self tsaxTableModel];
  id v9 = [(TSDCanvasAccessibility *)[(TSDRepAccessibility *)self tsaxCanvas] tsaxValueForKey:@"accessController"];

  +[TSTCellAccessibility tsaxAccessModelForCellAtColumnIndex:var1 rowIndex:var0 tableModel:v8 accessController:v9 usingBlock:a4];
}

- (void)tsaxToggleValueOfCheckboxInCellWithModel:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_25D528;
  v4[3] = &unk_456E38;
  v4[4] = [(TSTTableRepAccessibility *)self tsaxControlCellEditor];
  v4[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
}

- (void)tsaxShowPopupMenuForMultipleChoiceCellWithModel:(id)a3
{
  unsigned int v5 = [(TSTTableRepAccessibility *)self tsaxRespondsToSelector:"tsaxHandleShowPopupMenuForCellWithModel:" fromExtrasProtocol:&OBJC_PROTOCOL___TSTTableRepAccessibilityExtras];
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if ((v5 & 1) == 0)
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Attempting to show popup menu for multiple choice cell on a platform that can't handle that yet.", v7, v8, v9, v10, v11, v12))abort(); {
    }
      }
  }
  if (v5)
  {
    [(TSTTableRepAccessibility *)self tsaxHandleShowPopupMenuForCellWithModel:a3];
  }
}

- (void)_tsaxCleanupChildren
{
  [(TSTTableRepAccessibility *)self _tsaxCleanupTableChildrenElementsCache:[(TSTTableRepAccessibility *)self _tsaxChildrenCellsCache]];
  [(TSTTableRepAccessibility *)self _tsaxCleanupTableChildrenElementsCache:[(TSTTableRepAccessibility *)self _tsaxColumnIndexElementsCache]];
  [(TSTTableRepAccessibility *)self _tsaxCleanupTableChildrenElementsCache:[(TSTTableRepAccessibility *)self _tsaxRowIndexElementsCache]];
  [(TSTTableRepAccessibility *)self _tsaxCleanupTableChildrenElementsCache:[(TSTTableRepAccessibility *)self _tsaxColumnElementsCache]];
  [(TSTTableRepAccessibility *)self _tsaxCleanupTableChildrenElementsCache:[(TSTTableRepAccessibility *)self _tsaxRowElementsCache]];
  [(NSMutableArray *)[(TSTTableRepAccessibility *)self _tsaxTwoDimensionalChildrenCellsCache] makeObjectsPerformSelector:"removeAllObjects"];
  if ([(TSTTableRepAccessibility *)self tsaxRespondsToSelector:"tsaxDidCleanupChildren" fromExtrasProtocol:&OBJC_PROTOCOL___TSTTableRepAccessibilityExtras])
  {
    [(TSTTableRepAccessibility *)self tsaxDidCleanupChildren];
  }
}

- (unint64_t)tsaxColumnsCount
{
  return [self tsaxTableModel].tsaxUnsignedIntValueForKey:@"numberOfColumns"];
}

- (unint64_t)tsaxRowsCount
{
  return [self tsaxTableModel].tsaxUnsignedIntValueForKey:@"numberOfRows"];
}

- (NSArray)tsaxColumnElements
{
  return (NSArray *)[(TSTTableRepAccessibility *)self _tsaxPrePopulatedColumnOrRowElementsCacheWithKind:1 inDirection:1 cacheWasRebuilt:0];
}

- (NSArray)tsaxRowElements
{
  return (NSArray *)[(TSTTableRepAccessibility *)self _tsaxPrePopulatedColumnOrRowElementsCacheWithKind:1 inDirection:0 cacheWasRebuilt:0];
}

- (NSArray)tsaxColumnIndexElements
{
  return (NSArray *)[(TSTTableRepAccessibility *)self _tsaxPrePopulatedColumnOrRowElementsCacheWithKind:0 inDirection:1 cacheWasRebuilt:0];
}

- (NSArray)tsaxRowIndexElements
{
  return (NSArray *)[(TSTTableRepAccessibility *)self _tsaxPrePopulatedColumnOrRowElementsCacheWithKind:0 inDirection:0 cacheWasRebuilt:0];
}

- (NSMutableArray)_tsaxColumnIndexElementsCache
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_5738BC);
}

- (void)_tsaxSetColumnIndexElementsCache:(id)a3
{
}

- (NSMutableArray)_tsaxRowIndexElementsCache
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_5738BD);
}

- (void)_tsaxSetRowIndexElementsCache:(id)a3
{
}

- (NSMutableArray)_tsaxColumnElementsCache
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_5738BE);
}

- (void)_tsaxSetColumnElementsCache:(id)a3
{
}

- (NSMutableArray)_tsaxRowElementsCache
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_5738BF);
}

- (void)_tsaxSetRowElementsCache:(id)a3
{
}

- (id)tsaxColumnOrRowElementForCellID:(id)a3 inDirection:(int)a4
{
  return [(TSTTableRepAccessibility *)self _tsaxColumnOrRowElementWithKind:1 forCellID:*(unsigned int *)&a3 inDirection:*(void *)&a4];
}

- (id)tsaxColumnOrRowIndexElementForCellID:(id)a3 inDirection:(int)a4
{
  return [(TSTTableRepAccessibility *)self _tsaxColumnOrRowElementWithKind:0 forCellID:*(unsigned int *)&a3 inDirection:*(void *)&a4];
}

- (id)tsaxChildrenCellsInColumnOrRowForCellID:(id)a3 inDirection:(int)a4
{
  [(TSTTableRepAccessibility *)self _tsaxEnsureChildrenCellsAreLoaded];
  uint64_t v7 = [(TSTTableRepAccessibility *)self _tsaxTwoDimensionalChildrenCellsCache];
  uint64_t v8 = v7;
  if (a4 == 1)
  {
    uint64_t v9 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v10)
    {
      id v11 = v10;
      unint64_t var1 = a3.var1;
      uint64_t v13 = *(void *)v33;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v16 = [v15 count];
          if (TSAccessibilityShouldPerformValidationChecks())
          {
            if (var1 >= (unint64_t)v16)
            {
              int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
              [v15 count];
              if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Out of bounds column index: %lu; should be less than: %lu.",
                                   v18,
                                   v19,
                                   v20,
                                   v21,
                                   v22,
                                   var1))
                goto LABEL_24;
            }
          }
          if (var1 < (unint64_t)v16) {
            [v9 addObject:[v15 objectAtIndex:var1]];
          }
        }
        id v11 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v11);
    }
    return v9;
  }
  else
  {
    unint64_t var0 = a3.var0;
    id v25 = [(NSMutableArray *)v7 count];
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      if (var0 >= (unint64_t)v25)
      {
        int v26 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        [(NSMutableArray *)v8 count];
        if (__TSAccessibilityHandleValidationErrorWithDescription(v26, 0, @"Out of bounds row index: %lu; should be less than: %lu.",
                             v27,
                             v28,
                             v29,
                             v30,
                             v31,
                             var0))
LABEL_24:
          abort();
      }
    }
    if (var0 < (unint64_t)v25)
    {
      return [(NSMutableArray *)v8 objectAtIndex:var0];
    }
    else
    {
      return 0;
    }
  }
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxCoordinatesOfFirstNonMergedCellInColumnOrRowForCellID:(id)a3 inDirection:(int)a4
{
  unint64_t v5 = *(void *)&a3.var0;
  unint64_t v6 = (unint64_t)self;
  uint64_t v7 = *(void *)&a3.var0 >> 24;
  [(TSTTableRepAccessibility *)self tsaxTableModel];
  int v8 = v7 << 24;
  if (a4 == 1)
  {
    unint64_t v9 = v5 >> 16;
    unsigned int v10 = (unsigned __int16)[(id)v6 tsaxRowsCount];
    if (v10)
    {
      LODWORD(v5) = 1;
      while (1)
      {
        unint64_t v6 = v6 & 0xFFFFFFFF00000000 | (v5 - 1) | v8 & 0xFF00FFFF | (v9 << 16);
        unint64_t v11 = TSTTableMergeRangeAtCellID();
        if ((_WORD)v11 == 0xFFFF) {
          break;
        }
        uint64_t v12 = v11 & 0xFFFF00000000;
        BOOL v13 = (v11 & 0xFF0000) == 0xFF0000 || HIWORD(v11) == 0;
        if (v13 || v12 == 0) {
          break;
        }
        BOOL v16 = v12 == 0x100000000 && v9 == BYTE2(v11);
        __int16 v17 = v5 + 1;
        if (v10 > v5)
        {
          LODWORD(v5) = v5 + 1;
          if (!v16) {
            continue;
          }
        }
        if (!v16) {
          goto LABEL_42;
        }
        LOWORD(v5) = v17 - 1;
        return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)(v8 & 0xFF000000 | (v9 << 16) | (unsigned __int16)v5);
      }
    }
    else
    {
LABEL_42:
      LOWORD(v5) = 0;
    }
  }
  else
  {
    unsigned int v18 = [(id)v6 tsaxColumnsCount];
    if (v18)
    {
      int v19 = 0;
      LODWORD(v9) = 1;
      while (1)
      {
        unint64_t v6 = v6 & 0xFFFFFFFF00000000 | v19 | v8 | (unsigned __int16)v5;
        unint64_t v20 = TSTTableMergeRangeAtCellID();
        if ((_WORD)v20 == 0xFFFF) {
          break;
        }
        unint64_t v21 = HIWORD(v20);
        BOOL v22 = (v20 & 0xFF0000) == 0xFF0000 || v21 == 0;
        if (v22 || (v20 & 0xFFFF00000000) == 0) {
          break;
        }
        BOOL v25 = v21 == 1 && (unsigned __int16)v5 == (unsigned __int16)v20;
        char v26 = v9 + 1;
        if (v18 > v9)
        {
          v19 += 0x10000;
          LODWORD(v9) = v9 + 1;
          if (!v25) {
            continue;
          }
        }
        if (!v25) {
          goto LABEL_43;
        }
        LOBYTE(v9) = v26 - 1;
        return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)(v8 & 0xFF000000 | (v9 << 16) | (unsigned __int16)v5);
      }
    }
    else
    {
LABEL_43:
      LOBYTE(v9) = 0;
    }
  }
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)(v8 & 0xFF000000 | (v9 << 16) | (unsigned __int16)v5);
}

- (id)_tsaxColumnOrRowElementWithKind:(int)a3 forCellID:(id)a4 inDirection:(int)a5
{
  if (a5 == 1) {
    unint64_t var1 = a4.var1;
  }
  else {
    unint64_t var1 = a4.var0;
  }
  if (a3 == 1)
  {
    if (a5 == 1) {
      uint64_t v7 = [(TSTTableRepAccessibility *)self tsaxColumnElements];
    }
    else {
      uint64_t v7 = [(TSTTableRepAccessibility *)self tsaxRowElements];
    }
    goto LABEL_13;
  }
  if (!a3)
  {
    if (a5 == 1) {
      uint64_t v7 = [(TSTTableRepAccessibility *)self tsaxColumnIndexElements];
    }
    else {
      uint64_t v7 = [(TSTTableRepAccessibility *)self tsaxRowIndexElements];
    }
LABEL_13:
    int v8 = v7;
    goto LABEL_14;
  }
  int v8 = 0;
LABEL_14:
  NSUInteger v9 = [(NSArray *)v8 count];
  if (TSAccessibilityShouldPerformValidationChecks() && var1 >= v9)
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    CFStringRef v16 = &stru_46D7E8;
    if (!a3) {
      CFStringRef v16 = @"index ";
    }
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Table column or row %@element at index %lu is out of bounds; number of elements: %lu",
                         v11,
                         v12,
                         v13,
                         v14,
                         v15,
                         (uint64_t)v16))
      abort();
  }
  if (var1 >= v9) {
    return 0;
  }

  return [(NSArray *)v8 objectAtIndex:var1];
}

- (id)tsaxColumnOrRowNameForCellID:(id)a3 inDirection:(int)a4 withComponents:(int)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = [(TSTTableRepAccessibility *)self tsaxTableModel];
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2810000000;
  v33[3] = &unk_41622E;
  v33[4] = 0;
  if (v6 == 1)
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3052000000;
    uint64_t v30 = sub_25DF18;
    uint64_t v31 = sub_25DF28;
    uint64_t v32 = 0;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_25DF34;
    v25[3] = &unk_46BB40;
    v25[4] = v9;
    v25[5] = &v27;
    $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v26 = a3;
    v25[6] = v33;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v25)) {
      abort();
    }
  }
  else
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3052000000;
    uint64_t v30 = sub_25DF18;
    uint64_t v31 = sub_25DF28;
    uint64_t v32 = 0;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_25DF7C;
    v23[3] = &unk_46BB40;
    v23[4] = v9;
    v23[5] = &v27;
    $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24 = a3;
    v23[6] = v33;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v23)) {
      abort();
    }
  }
  unsigned int v10 = (NSMutableString *)v28[5];
  _Block_object_dispose(&v27, 8);
  id v11 = [(NSMutableString *)v10 length];
  id v12 = v11;
  if (a5) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = v11 == 0;
  }
  int v14 = v13;
  if (a5 == 1 || v14)
  {
    uint64_t v15 = [(TSTTableRepAccessibility *)self tsaxColumnOrRowFullIndexDescriptionForCellID:*(unsigned int *)&a3 inDirection:v6];
    if (v12) {
      uint64_t v15 = __TSAccessibilityStringForVariables(1, v10, v16, v17, v18, v19, v20, v21, (uint64_t)v15);
    }
    unsigned int v10 = v15;
  }
  _Block_object_dispose(v33, 8);
  return v10;
}

- (id)tsaxColumnOrRowIndexDescriptionForCellID:(id)a3 inDirection:(int)a4
{
  if (a4 != 1) {
    return +[NSString stringWithFormat:@"%d", a3.var0 + 1, v5];
  }
  if (a3.var1 > 0x19u) {
    return +[NSString stringWithFormat:@"%c%c", (a3.var1 / 0x1Au) | 0x40, (a3.var1 % 0x1Au + 65)];
  }
  return +[NSString stringWithFormat:@"%c", (a3.var1 + 65), v5];
}

- (id)tsaxColumnOrRowFullIndexDescriptionForCellID:(id)a3 inDirection:(int)a4
{
  id v5 = -[TSTTableRepAccessibility tsaxColumnOrRowIndexDescriptionForCellID:inDirection:](self, "tsaxColumnOrRowIndexDescriptionForCellID:inDirection:", *(unsigned int *)&a3);
  if (a4 == 1) {
    CFStringRef v6 = @"column.index %@";
  }
  else {
    CFStringRef v6 = @"row.index %@";
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)v6), v5);
}

- (id)_tsaxPrePopulatedColumnOrRowElementsCacheWithKind:(int)a3 inDirection:(int)a4 cacheWasRebuilt:(BOOL *)a5
{
  uint64_t v6 = *(void *)&a4;
  if (a3 == 1)
  {
    int v14 = &selRef__tsaxColumnElementsCache;
    BOOL v10 = a4 == 1;
    if (a4 != 1) {
      int v14 = &selRef__tsaxRowElementsCache;
    }
    id v11 = *v14;
    id v12 = &selRef__tsaxSetColumnElementsCache_;
    BOOL v13 = &selRef__tsaxSetRowElementsCache_;
    goto LABEL_9;
  }
  if (!a3)
  {
    id v9 = &selRef__tsaxColumnIndexElementsCache;
    BOOL v10 = a4 == 1;
    if (a4 != 1) {
      id v9 = &selRef__tsaxRowIndexElementsCache;
    }
    id v11 = *v9;
    id v12 = &selRef__tsaxSetColumnIndexElementsCache_;
    BOOL v13 = &selRef__tsaxSetRowIndexElementsCache_;
LABEL_9:
    if (!v10) {
      id v12 = v13;
    }
    uint64_t v15 = *v12;
    goto LABEL_13;
  }
  uint64_t v15 = 0;
  id v11 = 0;
LABEL_13:
  id v16 = [(TSTTableRepAccessibility *)self performSelector:v11];
  if (v6 == 1) {
    id v17 = [(TSTTableRepAccessibility *)self tsaxColumnsCount];
  }
  else {
    id v17 = [(TSTTableRepAccessibility *)self tsaxRowsCount];
  }
  id v18 = v17;
  if (v16 && [v16 count] == v17) {
    return v16;
  }
  id v19 = [v16 mutableCopy];
  uint64_t v20 = (char *)[v19 count];
  if (v16)
  {
    [v16 removeAllObjects];
  }
  else
  {
    id v16 = (id)objc_opt_new();
    [(TSTTableRepAccessibility *)self performSelector:v15 withObject:v16];
  }
  long long v41 = a5;
  if (a3 > 1) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = (objc_class *)objc_opt_class();
  }
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if (([(objc_class *)v21 conformsToProtocol:&OBJC_PROTOCOL___TSTTableChildAccessibilityElement] & 1) == 0)
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      BOOL v22 = NSStringFromClass(v21);
      NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___TSTTableChildAccessibilityElement);
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"%@ does not conform to protocol %@.", v23, v24, v25, v26, v27, (uint64_t)v22))goto LABEL_57; {
    }
      }
  }
  int ShouldPerformValidationChecks = TSAccessibilityShouldPerformValidationChecks();
  if (v6 == 1)
  {
    if (!ShouldPerformValidationChecks
      || ([(objc_class *)v21 conformsToProtocol:&OBJC_PROTOCOL___TSTTableColumnAccessibilityElement] & 1) != 0)
    {
      goto LABEL_35;
    }
    int v43 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    uint64_t v29 = NSStringFromClass(v21);
    uint64_t v30 = &OBJC_PROTOCOL___TSTTableColumnAccessibilityElement;
  }
  else
  {
    if (!ShouldPerformValidationChecks
      || ([(objc_class *)v21 conformsToProtocol:&OBJC_PROTOCOL___TSTTableRowAccessibilityElement] & 1) != 0)
    {
      goto LABEL_35;
    }
    int v43 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    uint64_t v29 = NSStringFromClass(v21);
    uint64_t v30 = &OBJC_PROTOCOL___TSTTableRowAccessibilityElement;
  }
  NSStringFromProtocol((Protocol *)v30);
  if (__TSAccessibilityHandleValidationErrorWithDescription(v43, 0, @"%@ does not conform to protocol %@.", v31, v32, v33, v34, v35, (uint64_t)v29))LABEL_57:abort(); {
LABEL_35:
  }
  if (v18)
  {
    uint64_t v36 = 0;
    while (v20)
    {
      id v37 = [v19 objectAtIndex:0];
      [v19 removeObjectAtIndex:0];
      --v20;
LABEL_53:
      [v16 addObject:v37];

      if (v18 == (id)++v36) {
        goto LABEL_54;
      }
    }
    if (a3 == 1)
    {
      if ([(TSTTableRepAccessibility *)self tsaxRespondsToSelector:"tsaxAlternateParentForColumnOrRowElementAtIndex:inDirection:" fromExtrasProtocol:&OBJC_PROTOCOL___TSTTableRepAccessibilityExtras])
      {
        unint64_t v38 = (TSTTableRepAccessibility *)[(TSTTableRepAccessibility *)self tsaxAlternateParentForColumnOrRowElementAtIndex:v36 inDirection:v6];
        goto LABEL_46;
      }
    }
    else if (!a3 {
           && [(TSTTableRepAccessibility *)self tsaxRespondsToSelector:"tsaxAlternateParentForColumnOrRowIndexElementAtIndex:inDirection:" fromExtrasProtocol:&OBJC_PROTOCOL___TSTTableRepAccessibilityExtras])
    }
    {
      unint64_t v38 = (TSTTableRepAccessibility *)[(TSTTableRepAccessibility *)self tsaxAlternateParentForColumnOrRowIndexElementAtIndex:v36 inDirection:v6];
LABEL_46:
      if (v38) {
        v39 = v38;
      }
      else {
        v39 = self;
      }
      id v37 = [[v21 alloc] initWithAccessibilityParent:v39];
      [v37 setTableRep:self];
      if (v6 == 1) {
        [v37 setColumnIndex:v36];
      }
      else {
        [v37 setRowIndex:(unsigned __int16)v36];
      }
      uint64_t v20 = 0;
      goto LABEL_53;
    }
    unint64_t v38 = 0;
    goto LABEL_46;
  }
LABEL_54:
  [(TSTTableRepAccessibility *)self _tsaxCleanupTableChildrenElementsCache:v19];

  if (v41) {
    *long long v41 = 1;
  }
  return v16;
}

- (void)_tsaxCleanupTableChildrenElementsCache:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(a3);
        }
        int v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 setParent:0];
        [v8 setTableRep:0];
      }
      id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [a3 removeAllObjects];
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxCellIDForCanvasPoint:(CGPoint)a3
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)_TSTTableRepGetCellIDForCanvasPoint(self, a2, (__n128)a3, *(__n128 *)&a3.y);
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxClosestCellIDForCanvasPoint:(CGPoint)a3
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)_TSTTableRepGetClosestCellIDForCanvasPoint(self, a2, (__n128)a3, *(__n128 *)&a3.y);
}

- (TSTCellRegionAccessibility)tsaxSelectionRegion
{
  char v5 = 0;
  int v3 = objc_opt_class();
  id result = (TSTCellRegionAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"selectionRegion"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSTTableSelectionAccessibility)tsaxTableSelection
{
  unint64_t v2 = [(TSTTableRepAccessibility *)self tsaxTableEditor];
  if ([(TSTTableEditorAccessibility *)v2 tsaxHasMultipleTableInfos]) {
    return 0;
  }
  char v5 = 0;
  id v4 = objc_opt_class();
  id result = (TSTTableSelectionAccessibility *)__TSAccessibilityCastAsSafeCategory(v4, (uint64_t)[v2 tsaxValueForKey:@"editingState"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSTTableCellAccessibilityElement)tsaxSelectionAnchorCellElement
{
  unsigned int v3 = [(TSTTableSelectionAccessibility *)[(TSTTableRepAccessibility *)self tsaxTableSelection] tsaxAnchorCellID];
  if ((_WORD)v3 == 0xFFFF || (v3 & 0xFF0000) == 0xFF0000) {
    return 0;
  }

  return (TSTTableCellAccessibilityElement *)-[TSTTableRepAccessibility tsaxChildCellForCellID:](self, "tsaxChildCellForCellID:");
}

- (NSArray)tsaxSelectedCells
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  int v8 = sub_25DF18;
  long long v9 = sub_25DF28;
  uint64_t v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_25E800;
  v4[3] = &unk_46BB68;
  v4[4] = self;
  v4[5] = &v5;
  [(TSTTableRepAccessibility *)self tsaxEnumerateSelectedCellsIncludingEmptyCells:1 includeHiddenCells:0 usingBlock:v4];
  unint64_t v2 = (NSArray *)(id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)tsaxChildCellIsSelectedAtCellID:(id)a3
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_25E950;
  v5[3] = &unk_46BB90;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v6 = a3;
  v5[4] = &v7;
  [(TSTTableRepAccessibility *)self tsaxEnumerateSelectedCellsIncludingEmptyCells:1 includeHiddenCells:0 usingBlock:v5];
  char v3 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)tsaxEnumerateSelectedCellsIncludingEmptyCells:(BOOL)a3 includeHiddenCells:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v9 = [(TSTTableRepAccessibility *)self tsaxTableSelection];
  id v10 = [(TSTTableRepAccessibility *)self tsaxTableModel];

  [(TSTTableSelectionAccessibility *)v9 tsaxEnumerateSelectedCellsInTableModel:v10 includeEmptyCells:v7 includeHiddenCells:v6 usingBlock:a5];
}

- ($0E7DCC040F5CEAF2787150A9C1D66156)tsaxRangeOfSelectedColumnsOrRows
{
  unint64_t v2 = [(TSTTableRepAccessibility *)self tsaxTableSelection];
  unsigned int v3 = [(TSTTableSelectionAccessibility *)v2 tsaxSelectionType];
  if (v3 - 1 > 1)
  {
    unint64_t v6 = 0;
    uint64_t v8 = 16711680;
    uint64_t var0 = 0xFFFFLL;
  }
  else
  {
    unsigned int v4 = v3;
    $0E7DCC040F5CEAF2787150A9C1D66156 v5 = [(TSTCellRegionAccessibility *)[(TSTTableSelectionAccessibility *)v2 tsaxCellRegion] tsaxBoundingCellRange];
    unint64_t v6 = *(void *)&v5 & 0xFFFF000000000000;
    uint64_t var0 = 0xFFFFLL;
    if (v4 == 2)
    {
      uint64_t v8 = *(void *)&v5 & 0xFF0000;
    }
    else
    {
      uint64_t var0 = v5.var0.var0;
      uint64_t v8 = 16711680;
    }
    if (v4 == 2) {
      unint64_t v6 = *(void *)&v5 & 0xFFFF00000000;
    }
  }
  return ($0E7DCC040F5CEAF2787150A9C1D66156)(v8 | var0 | v6);
}

- (BOOL)tsaxColumnOrRowIsSelectedAtCellID:(id)a3 inDirection:(int)a4
{
  unint64_t v6 = [(TSTTableRepAccessibility *)self tsaxTableSelection];
  unsigned int v7 = [(TSTTableSelectionAccessibility *)v6 tsaxSelectionType];
  unsigned int v8 = v7;
  if (a4 == 1 && v7 == 2 || (BOOL result = 0, !a4) && v8 == 1)
  {
    $0E7DCC040F5CEAF2787150A9C1D66156 v10 = [(TSTCellRegionAccessibility *)[(TSTTableSelectionAccessibility *)v6 tsaxCellRegion] tsaxBoundingCellRange];
    if (a4 == 1) {
      BOOL v11 = v10.var0.var1 > a3.var1 || a3.var1 >= v10.var0.var1 + v10.var1.var0;
    }
    else {
      BOOL v11 = v10.var0.var0 > a3.var0 || a3.var0 >= *(_DWORD *)&v10.var1.var1 + v10.var0.var0;
    }
    return !v11;
  }
  return result;
}

- (TSWPRepAccessibility)tsaxContainedTextEditingRep
{
  char v5 = 0;
  unsigned int v3 = objc_opt_class();
  BOOL result = (TSWPRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"containedTextEditingRep"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSTTableCellTextEditingControllerAccessibility)tsaxContainedTextEditor
{
  char v5 = 0;
  unsigned int v3 = objc_opt_class();
  BOOL result = (TSTTableCellTextEditingControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", @"masterLayout") tsaxValueForKey:@"containedTextEditor"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)tsaxTableModel
{
  return [(TSDRepAccessibility *)self tsaxValueForKey:@"tableModel"];
}

- (id)tsaxTableLayout
{
  return [(TSDRepAccessibility *)self tsaxValueForKey:@"tableLayout"];
}

- (id)tsaxTableChrome
{
  return [(TSDRepAccessibility *)self tsaxValueForKey:@"tableChrome"];
}

- (BOOL)tsaxIsChromeVisible
{
  id v2 = [(TSTTableRepAccessibility *)self tsaxTableLayout];

  return _TSTLayoutGetTabsVisible(v2);
}

- (TSTTableEditorAccessibility)tsaxTableEditor
{
  char v5 = 0;
  unsigned int v3 = objc_opt_class();
  BOOL result = (TSTTableEditorAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"tableEditor"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (NSString)tsaxTableName
{
  id v2 = [(TSTTableRepAccessibility *)self tsaxTableModel];

  return (NSString *)[v2 tsaxValueForKey:@"tableName"];
}

- (int)tsaxEditingMode
{
  id v2 = [(TSTTableRepAccessibility *)self tsaxTableEditor];

  return [(TSTTableEditorAccessibility *)v2 tsaxEditingMode];
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxEditingCellID
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2810000000;
  unsigned int v8 = &unk_41622E;
  int v9 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_25EDE4;
  v4[3] = &unk_4573D8;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v2 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)*((_DWORD *)v6 + 8);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (unsigned)tsaxNumberOfHeaderColumns
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  __int16 v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_25EEEC;
  v4[3] = &unk_4573D8;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
  unsigned __int8 v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (unsigned)tsaxNumberOfHeaderRows
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  __int16 v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_25EFEC;
  v4[3] = &unk_4573D8;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
  unsigned __int16 v2 = *((_WORD *)v6 + 12);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (TSTTableControlCellEditorAccessibility)tsaxControlCellEditor
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  int v9 = sub_25DF18;
  $0E7DCC040F5CEAF2787150A9C1D66156 v10 = sub_25DF28;
  uint64_t v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_25F13C;
  v5[3] = &unk_4573D8;
  v5[4] = [(TSDRepAccessibility *)self tsaxInteractiveCanvasController];
  void v5[5] = &v6;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  uint64_t v2 = v7[5];
  _Block_object_dispose(&v6, 8);
  LOBYTE(v6) = 0;
  unsigned int v3 = objc_opt_class();
  BOOL result = (TSTTableControlCellEditorAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, v2, 1, &v6);
  if ((_BYTE)v6) {
    abort();
  }
  return result;
}

- (CGRect)tsaxUnscaledCanvasFrameForCellRange:(id)a3
{
  [(TSDRepAccessibility *)self tsaxValueForKey:@"tableLayout"];

  TSTLayoutGetCanvasFrameForRange();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)tsaxDeviceBoundsForCellRange:(id)a3
{
  v16.a = 0.0;
  *(void *)&v16.b = &v16;
  *(void *)&v16.c = 0x4010000000;
  *(void *)&v16.d = &unk_41622E;
  *(_OWORD *)&v16.tCGFloat x = 0u;
  long long v17 = 0u;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_25F344;
  v15[3] = &unk_458E98;
  v15[4] = self;
  v15[5] = &v16;
  v15[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v15)) {
    abort();
  }
  CGFloat x = *(double *)(*(void *)&v16.b + 32);
  CGFloat y = *(double *)(*(void *)&v16.b + 40);
  CGFloat width = *(double *)(*(void *)&v16.b + 48);
  CGFloat height = *(double *)(*(void *)&v16.b + 56);
  _Block_object_dispose(&v16, 8);
  [tsaxCanvasContainerView tsaxScreenScale];
  if (v8 > 0.0)
  {
    double v9 = v8;
    if ([(TSDRepAccessibility *)self tsaxIsInInteractiveCanvas])
    {
      memset(&v16, 0, sizeof(v16));
      CGAffineTransformMakeScale(&v16, 1.0 / v9, 1.0 / v9);
      CGAffineTransform v14 = v16;
      v18.origin.CGFloat x = x;
      v18.origin.CGFloat y = y;
      v18.size.CGFloat width = width;
      v18.size.CGFloat height = height;
      CGRect v19 = CGRectApplyAffineTransform(v18, &v14);
      CGFloat x = v19.origin.x;
      CGFloat y = v19.origin.y;
      CGFloat width = v19.size.width;
      CGFloat height = v19.size.height;
    }
  }
  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (CGRect)tsaxConvertBoundsToTableLayoutUnscaledRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(TSTTableRepAccessibility *)self tsaxTableLayout];
  TSTLayoutGetViewScale();
  CGAffineTransformMakeScale(&v8, 1.0 / v7, 1.0 / v7);
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v9, &v8);
}

- (void)_tsaxPerformGestureOnCellForID:(id)a3 withSafeBlock:(id)a4
{
  if ([(TSTTableRepAccessibility *)self tsaxTableLayout])
  {
    TSTLayoutGetCanvasFrameForRange();
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_25F494;
    v9[3] = &unk_46BBB8;
    v9[4] = a4;
    v9[5] = v5;
    v9[6] = v6;
    v9[7] = v7;
    v9[8] = v8;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v9)) {
      abort();
    }
  }
}

- (void)tsaxSelectColumnOrRowForCellID:(id)a3 inDirection:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if ([(TSTTableRepAccessibility *)self tsaxIsChromeVisible])
  {
    id v7 = [(TSTTableRepAccessibility *)self tsaxColumnOrRowIndexElementForCellID:*(unsigned int *)&a3 inDirection:v4];
    if (v7)
    {
      [v7 frameInUnscaledCanvas];
      -[TSDInteractiveCanvasControllerAccessibility tsaxConvertBoundsToUnscaledRect:]([(TSDRepAccessibility *)self tsaxInteractiveCanvasController], "tsaxConvertBoundsToUnscaledRect:", v8, v9, v10, v11);
      CGFloat x = v18.origin.x;
      CGFloat y = v18.origin.y;
      CGFloat width = v18.size.width;
      CGFloat height = v18.size.height;
      CGFloat MidX = CGRectGetMidX(v18);
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_25F624;
      v17[3] = &unk_46BBE0;
      v17[4] = self;
      *(CGFloat *)&v17[5] = MidX;
      v17[6] = CGRectGetMidY(v19);
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v17)) {
        abort();
      }
    }
  }
}

- (void)tsaxSelectCellForID:(id)a3
{
  uint64_t v5 = [(TSTTableRepAccessibility *)self tsaxTableEditor];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_25F6C8;
  v6[3] = &unk_46BC08;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v7 = a3;
  v6[4] = self;
  v6[5] = v5;
  if (v5) {
    [(TSTTableEditorAccessibility *)v5 tsaxPerformBlockAffectingTableSelection:v6];
  }
  else {
    sub_25F6C8((uint64_t)v6);
  }
}

- (void)tsaxBeginEditingCellForID:(id)a3 editingSelection:(int)a4
{
  [(TSTTableRepAccessibility *)self tsaxEndEditingCurrentEditingCell];
  id v7 = [(TSTTableRepAccessibility *)self tsaxTableModel];
  if (objc_msgSend(+[TSTConfigurationAccessibility tsaxSharedTableConfiguration](TSTConfigurationAccessibility, "tsaxSharedTableConfiguration"), "tsaxSupportsContainedTextEditing"))
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_25F940;
    v8[3] = &unk_45BF28;
    int v9 = a4;
    $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v10 = a3;
    v8[4] = self;
    v8[5] = v7;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v8)) {
      abort();
    }
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_25F938;
    v11[3] = &unk_46BC30;
    v11[4] = self;
    [(TSTTableRepAccessibility *)self _tsaxPerformGestureOnCellForID:*(unsigned int *)&a3 withSafeBlock:v11];
  }
}

- (void)tsaxEndEditingCurrentEditingCell
{
  if ((~[(TSTTableRepAccessibility *)self tsaxEditingCellID] & 0xFFFFFF) != 0)
  {
    double v3 = [(TSTTableRepAccessibility *)self tsaxContainedTextEditor];
    if (v3)
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_25FAD4;
      v4[3] = &unk_456DE0;
      v4[4] = v3;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v4)) {
        abort();
      }
    }
  }
}

- (void)tsaxPerformCleanupTasksPriorToRemovalFromCanvas
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_25FB70;
  v4[3] = &unk_456DE0;
  v4[4] = self;
  TSAccessibilityPerformBlockOnMainThread(v4);
  v3.receiver = self;
  v3.super_class = (Class)TSTTableRepAccessibility;
  [(TSDRepAccessibility *)&v3 tsaxPerformCleanupTasksPriorToRemovalFromCanvas];
}

- (void)updateChildrenFromLayout
{
  unsigned int v3 = [(TSTTableRepAccessibility *)self tsaxRespondsToSelector:"tsaxDidBeginEditingTextInCellWithContainedTextEditingRep:" fromExtrasProtocol:&OBJC_PROTOCOL___TSTTableRepAccessibilityExtras];
  if (v3) {
    uint64_t v4 = [(TSTTableRepAccessibility *)self tsaxContainedTextEditingRep];
  }
  else {
    uint64_t v4 = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)TSTTableRepAccessibility;
  [(TSTTableRepAccessibility *)&v6 updateChildrenFromLayout];
  if (v3)
  {
    uint64_t v5 = [(TSTTableRepAccessibility *)self tsaxContainedTextEditingRep];
    if (v4 != v5)
    {
      if (v5) {
        [(TSTTableRepAccessibility *)self tsaxDidBeginEditingTextInCellWithContainedTextEditingRep:v5];
      }
    }
  }
}

- (NSMutableArray)_tsaxCellsRowsAndColumnsCache
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_573A31);
}

- (void)_tsaxSetCellsRowsAndColumnsCache:(id)a3
{
}

- (BOOL)_tsaxNeedsColumnAndRowIndexElements
{
  BOOL v3 = [(TSTTableRepAccessibility *)self tsaxIsChromeVisible];
  if (v3)
  {
    LOBYTE(v3) = [(TSDRepAccessibility *)self tsaxIsSelected];
  }
  return v3;
}

- (NSMutableArray)tsaxHeaderElementsCache
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_573A32);
}

- (void)tsaxSetHeaderElementsCache:(id)a3
{
}

- (void)tsaxMoveToColumnOrRowForCellID:(id)a3 inDirection:(int)a4
{
  id v4 = [(TSTTableRepAccessibility *)self tsaxColumnOrRowIndexElementForCellID:*(unsigned int *)&a3 inDirection:*(void *)&a4];
  if (v4)
  {
    uint64_t v5 = v4;
    UIAccessibilityNotifications v6 = UIAccessibilityLayoutChangedNotification;
    UIAccessibilityPostNotification(v6, v5);
  }
}

- (void)tsaxWillSelectCellForID:(id)a3
{
  BOOL v3 = [(TSDRepAccessibility *)self tsaxInteractiveCanvasController];

  [(TSDInteractiveCanvasControllerAccessibility *)v3 endEditing];
}

- (void)tsaxDidCleanupChildren
{
  uint64_t v2 = [(TSTTableRepAccessibility *)self _tsaxCellsRowsAndColumnsCache];

  [(NSMutableArray *)v2 removeAllObjects];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityElements
{
  char v24 = 0;
  unsigned int v3 = [(TSTTableRepAccessibility *)self _tsaxNeedsColumnAndRowIndexElements];
  if (v3)
  {
    id v4 = [(TSTTableRepAccessibility *)self _tsaxPrePopulatedColumnOrRowElementsCacheWithKind:0 inDirection:1 cacheWasRebuilt:&v24];
    id v5 = [(TSTTableRepAccessibility *)self _tsaxPrePopulatedColumnOrRowElementsCacheWithKind:0 inDirection:0 cacheWasRebuilt:&v24];
  }
  else
  {
    id v4 = 0;
    id v5 = 0;
  }
  unint64_t v6 = [(TSTTableRepAccessibility *)self tsaxRowsCount];
  unint64_t v7 = [(TSTTableRepAccessibility *)self tsaxColumnsCount];
  double v8 = [(TSTTableRepAccessibility *)self _tsaxCellsRowsAndColumnsCache];
  int v9 = v8;
  if (v24 || !v8)
  {
    if (!v8)
    {
      int v9 = objc_opt_new();
      [(TSTTableRepAccessibility *)self _tsaxSetCellsRowsAndColumnsCache:v9];

      if (!v3)
      {
LABEL_13:
        double v11 = [(TSTTableRepAccessibility *)self tsaxChildrenCells];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v21;
          int v15 = 0xFFFF;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
              if (v3)
              {
                unsigned __int16 v18 = (unsigned __int16)[*(id *)(*((void *)&v20 + 1) + 8 * i) cellID];
                if (v15 != v18)
                {
                  int v15 = v18;
                  if (v6 > v18) {
                    [v9 addObject:[v5 objectAtIndex:v18]];
                  }
                }
              }
              [v9 addObject:v17];
            }
            id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
          }
          while (v13);
        }
        return v9;
      }
LABEL_12:
      [v9 addObjectsFromArray:v4];
      goto LABEL_13;
    }
LABEL_11:
    [v9 removeAllObjects];
    if (!v3) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unint64_t v10 = v7 + v6;
  if (!v3) {
    unint64_t v10 = 0;
  }
  if ([(NSMutableArray *)v8 count] != (id)(v10 + v7 * v6)) {
    goto LABEL_11;
  }
  return v9;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  -[TSDInteractiveCanvasControllerAccessibility tsaxConvertBoundsToUnscaledPoint:]([(TSDRepAccessibility *)self tsaxInteractiveCanvasController], "tsaxConvertBoundsToUnscaledPoint:", a3.x, a3.y);
  double v6 = v5;
  double v8 = v7;
  unsigned int v9 = -[TSTTableRepAccessibility tsaxCellIDForCanvasPoint:](self, "tsaxCellIDForCanvasPoint:");
  if (![(TSTTableRepAccessibility *)self _tsaxNeedsColumnAndRowIndexElements]
    || ((unsigned __int16)v9 != 0xFFFF || BYTE2(v9) == 255) && ((unsigned __int16)v9 == 0xFFFF || BYTE2(v9) != 255)
    || (id result = [(TSTTableRepAccessibility *)self tsaxColumnOrRowIndexElementForCellID:v9 & 0xFF000000 | (BYTE2(v9) << 16) | (unsigned __int16)v9 inDirection:BYTE2(v9) != 255]) == 0)
  {
    unsigned int v11 = -[TSTTableRepAccessibility tsaxClosestCellIDForCanvasPoint:](self, "tsaxClosestCellIDForCanvasPoint:", v6, v8);
    if ((([(TSTTableRepAccessibility *)self tsaxEditingCellID] ^ v11) & 0xFFFFFF) != 0
      || (id result = [(TSTTableRepAccessibility *)self tsaxContainedTextEditingRep]) == 0)
    {
      return [(TSTTableRepAccessibility *)self tsaxChildCellForCellID:v11];
    }
  }
  return result;
}

- (id)tsaxFocusedElement
{
  unsigned int v3 = [(TSTTableRepAccessibility *)self tsaxRangeOfSelectedColumnsOrRows];
  if (BYTE2(v3) != 255)
  {
    unsigned int v5 = v3 & 0xFF000000 | (BYTE2(v3) << 16) | (unsigned __int16)v3;
    uint64_t v4 = 1;
LABEL_5:
    id result = [(TSTTableRepAccessibility *)self tsaxColumnOrRowIndexElementForCellID:v5 inDirection:v4];
    if (result) {
      return result;
    }
    goto LABEL_6;
  }
  if ((unsigned __int16)v3 != 0xFFFF)
  {
    uint64_t v4 = 0;
    unsigned int v5 = v3 & 0xFF00FFFF | 0xFF0000;
    goto LABEL_5;
  }
LABEL_6:
  id result = [(TSTTableRepAccessibility *)self tsaxSelectionAnchorCellElement];
  if (!result)
  {
    id result = [(NSArray *)[(TSTTableRepAccessibility *)self tsaxSelectedCells] firstObject];
    if (!result)
    {
      v7.receiver = self;
      v7.super_class = (Class)TSTTableRepAccessibility;
      return [(TSDRepAccessibility *)&v7 tsaxFocusedElement];
    }
  }
  return result;
}

- (void)updateFromLayout
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableRepAccessibility;
  [(TSTTableRepAccessibility *)&v3 updateFromLayout];
  [(TSTTableRepAccessibility *)self tsaxEnsureChildrenAreLoaded];
}

@end
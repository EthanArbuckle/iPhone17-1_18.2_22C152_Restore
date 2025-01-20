@interface UITableViewRowData
+ (int)sectionLocationForRow:(int64_t)a3 inSection:(int64_t)a4 numRows:(unint64_t)a5 gapIndexPath:(id)a6 rowSpacing:(double)a7;
- (double)floatingRectForFooterInSection:(char)a3 visibleRect:(BOOL *)a4 heightCanBeGuessed:(CGFloat)a5 outIsFloating:(CGFloat)a6;
- (double)floatingRectForHeaderInSection:(char)a3 visibleRect:(BOOL *)a4 heightCanBeGuessed:(CGFloat)a5 outIsFloating:(double)a6;
- (double)fullContentWidth;
- (double)heightForFooterInSection:(char)a3 canGuess:;
- (double)heightForHeaderInSection:(char)a3 canGuess:;
- (double)heightForRow:(uint64_t)a3 inSection:(char)a4 canGuess:(int)a5 adjustForReorderedRow:;
- (double)heightForSection:(uint64_t)a1;
- (double)heightForTable;
- (double)heightForTableFooterView;
- (double)heightForTableHeaderView;
- (double)heightForTableHeaderViewHiding;
- (double)indexPathsForRowsInRect:(CGFloat)a3;
- (double)maxFooterTitleWidthForSection:(uint64_t)a1;
- (double)maxHeaderTitleWidthForSection:(uint64_t)a1;
- (double)offsetForHeaderInSection:(uint64_t)a1;
- (double)offsetForSection:(uint64_t)a1;
- (double)rectForFooterInSection:(char)a3 heightCanBeGuessed:;
- (double)rectForGlobalRow:(char)a3 heightCanBeGuessed:;
- (double)rectForHeaderInSection:(char)a3 heightCanBeGuessed:;
- (double)rectForRow:(uint64_t)a3 inSection:(char)a4 heightCanBeGuessed:;
- (double)rectForSection:(uint64_t)a1;
- (double)rectForTable;
- (double)rectForTableFooterView;
- (double)rectForTableHeaderView;
- (double)removeReorderedRowWithHeight:(double)a3 atIndexPath:;
- (id)_indexPathsBelowIndexPath:(uint64_t)a1;
- (id)_nextIndexPathOrSectionHeader:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)indexPathForRowAtGlobalRow:(void *)a1;
- (id)indexPathsForRowsInRect:(CGFloat)a3 extraHitSpaceBetweenRows:(CGFloat)a4;
- (id)targetIndexPathForPoint:(CGFloat)a3 adjustedForGap:(CGFloat)a4;
- (uint64_t)_sectionForPoint:(size_t)a3 beginningWithSection:(double)a4 numberOfSections:(CGFloat)a5;
- (uint64_t)_sectionRowForGlobalRow:(uint64_t *)a3 inSection:;
- (uint64_t)dropLocationForPoint:(double)a3 atIndexPath:(CGFloat)a4 withInsets:(double)a5;
- (uint64_t)ensureHeightsFaultedInForScrollToIndexPath:(double)a3 boundsHeight:;
- (uint64_t)footerAlignmentForSection:(uint64_t)result;
- (uint64_t)globalRowForRowAtIndexPath:(uint64_t)result;
- (uint64_t)globalRowsInRect:(CGFloat)a3 canGuess:(CGFloat)a4;
- (uint64_t)hasHeaderForSection:(uint64_t)result;
- (uint64_t)hasRows;
- (uint64_t)headerAlignmentForSection:(uint64_t)result;
- (uint64_t)invalidateSection:(uint64_t)result;
- (uint64_t)numberOfRowsBeforeSection:(uint64_t)a1;
- (uint64_t)numberOfRowsInSection:(uint64_t)a1;
- (uint64_t)sectionLocationForReorderedRow:(uint64_t)a3 inSection:;
- (uint64_t)sectionLocationForRow:(uint64_t)a3 inSection:;
- (uint64_t)sectionsInRect:(CGFloat)a3;
- (void)_ensureSectionOffsetIsValidForSection:(uint64_t)a1;
- (void)_updateSectionRowDataArrayForNumSections:(UITableViewRowData *)a1;
- (void)_updateTopAndBottomPadding;
- (void)addDropTargetGapAtIndexPath:(uint64_t)a1;
- (void)addGapAtIndexPath:(uint64_t)a1;
- (void)dealloc;
- (void)ensureAllSectionsAreValid;
- (void)initWithTableView:(void *)a1;
- (void)invalidateAllSectionOffsetsAndUpdatePadding;
- (void)invalidateAllSections;
- (void)moveDropTargetGapToIndexPath:(uint64_t)a1;
- (void)moveRowAtIndexPathFrom:(void *)a3 toIndexPath:;
- (void)numberOfRows;
- (void)removeGap;
- (void)restoreReorderedRowWithHeight:(double)a3 atIndexPath:;
- (void)setDraggedIndexPath:(uint64_t)a1;
- (void)setHeight:(double)a3 forFooterInSection:;
- (void)setHeight:(double)a3 forHeaderInSection:;
- (void)setHeight:(double)a3 forRowAtIndexPath:;
- (void)setReorderedIndexPath:(uint64_t)a1;
- (void)tableHeaderHeightDidChangeToHeight:(uint64_t)a1;
- (void)temporarilyDeletedIndexPathBeingReordered;
@end

@implementation UITableViewRowData

uint64_t __56__UITableViewRowData__sectionRowForGlobalRow_inSection___block_invoke(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = a1[4];
  uint64_t v5 = ((uint64_t)a3 - *(void *)(v4 + 88)) >> 3;
  uint64_t v6 = *a3;
  if (!*(unsigned char *)(*a3 + 8)) {
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](v6, v5, *(void **)(v4 + 8), v4);
  }
  if (!*(unsigned char *)(v6 + 9)) {
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1[4], v5);
  }
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  BOOL v9 = v7 == v5;
  BOOL v10 = v7 < v5;
  uint64_t v11 = *(void *)(v6 + 24);
  uint64_t v12 = *(void *)(v6 + 32);
  if (v10) {
    ++v11;
  }
  if (v9) {
    ++v12;
  }
  BOOL v13 = v8 >= v12 + v11;
  if (v8 < v11) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v13;
  }
}

- (void)invalidateAllSectionOffsetsAndUpdatePadding
{
  if (a1)
  {
    -[UITableViewRowData _updateSectionRowDataArrayForNumSections:](a1, [(UITable_RowDataSource *)a1->_tableView _numberOfSections]);
    uint64_t numSections = a1->_numSections;
    if (numSections >= 1)
    {
      sectionRowData = a1->_sectionRowData;
      do
      {
        if (*sectionRowData) {
          *((unsigned char *)*sectionRowData + 9) = 0;
        }
        ++sectionRowData;
        --numSections;
      }
      while (numSections);
    }
    -[UITableViewRowData _updateTopAndBottomPadding]((uint64_t)a1);
  }
}

- (uint64_t)hasRows
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 64);
    if (v2 >= 1)
    {
      uint64_t v3 = *(void *)(*(void *)(result + 88) + 8 * v2 - 8);
      if (*(unsigned char *)(v3 + 8) && *(unsigned char *)(v3 + 9))
      {
        if ((uint64_t)(*(void *)(v3 + 32) + *(void *)(v3 + 24)) > 0) {
          return 1;
        }
        uint64_t v4 = -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered]((void *)result);

        if (v4) {
          return 1;
        }
      }
      else
      {
        uint64_t v5 = [*(id *)(result + 8) _numberOfSections];
        if (v5 >= 1)
        {
          uint64_t v6 = v5;
          uint64_t v7 = 0;
          while ([*(id *)(v1 + 8) _numberOfRowsInSection:v7] <= 0)
          {
            if (v6 == ++v7) {
              return 0;
            }
          }
          return 1;
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t __77__UITableViewRowData__sectionForPoint_beginningWithSection_numberOfSections___block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = ((uint64_t)a3 - *(void *)(v4 + 88)) >> 3;
  uint64_t v6 = *a3;
  if (!*(unsigned char *)(*a3 + 8))
  {
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](v6, v5, *(void **)(v4 + 8), v4);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  if (!*(unsigned char *)(v6 + 9))
  {
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](v4, v5);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  v9.origin.x = -[UITableViewRowData rectForSection:](v4, v5);
  double y = v9.origin.y;
  if (CGRectContainsPoint(v9, *(CGPoint *)(a1 + 40))) {
    return 0;
  }
  if (*(double *)(a1 + 48) >= y) {
    return 1;
  }
  return 0xFFFFFFFFLL;
}

- (uint64_t)numberOfRowsBeforeSection:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered]((void *)a1);
  uint64_t v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 section] <= a2;
  }
  else {
    uint64_t v6 = 0;
  }
  if (a2 >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 88) + 8 * v7);
      if (!*(unsigned char *)(v8 + 8)) {
        -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(void *)(*(void *)(a1 + 88) + 8 * v7), a2, *(void **)(a1 + 8), a1);
      }
      if (!*(unsigned char *)(v8 + 9)) {
        -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
      }
      v6 += *(void *)(v8 + 32);
      ++v7;
    }
    while (a2 != v7);
  }

  return v6;
}

- (double)heightForHeaderInSection:(char)a3 canGuess:
{
  if (!a1) {
    return 0.0;
  }
  if (a2 < 0 || *(void *)(a1 + 64) <= a2)
  {
    CGRect v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel_heightForHeaderInSection_canGuess_, a1, @"UITableViewRowData.m", 1941, @"request for invalid section (%ld)", a2);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 88) + 8 * a2);
  if (!*(unsigned char *)(v6 + 8)) {
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(void *)(*(void *)(a1 + 88) + 8 * a2), a2, *(void **)(a1 + 8), a1);
  }
  if (!*(unsigned char *)(v6 + 9)) {
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
  }
  -[UISectionRowData sizeForHeaderInSection:canGuess:](v6, a2, a3);
  return v7;
}

- (double)heightForFooterInSection:(char)a3 canGuess:
{
  if (!a1) {
    return 0.0;
  }
  if (a2 < 0 || *(void *)(a1 + 64) <= a2)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_heightForFooterInSection_canGuess_, a1, @"UITableViewRowData.m", 1949, @"request for invalid section (%ld)", a2);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 88) + 8 * a2);
  if (!*(unsigned char *)(v6 + 8)) {
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(void *)(*(void *)(a1 + 88) + 8 * a2), a2, *(void **)(a1 + 8), a1);
  }
  if (!*(unsigned char *)(v6 + 9)) {
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
  }
  return -[UISectionRowData heightForFooterInSection:canGuess:](v6, a2, a3);
}

- (uint64_t)sectionsInRect:(CGFloat)a3
{
  if (!result) {
    return result;
  }
  uint64_t v5 = (size_t *)result;
  uint64_t v6 = *(void *)(result + 64);
  if (!v6) {
    return 0;
  }
  if (v6 == 1)
  {
    v54.origin.x = -[UITableViewRowData rectForSection:](result, 0);
    v54.origin.double y = v11;
    v54.size.width = v12;
    v54.size.height = v13;
    v48.origin.x = a2;
    v48.origin.double y = a3;
    v48.size.width = a4;
    v48.size.height = a5;
    CGRectIntersectsRect(v48, v54);
    return 0;
  }
  double MinX = CGRectGetMinX(*(CGRect *)&a2);
  v49.origin.x = a2;
  v49.origin.double y = a3;
  v49.size.width = a4;
  v49.size.height = a5;
  double MinY = CGRectGetMinY(v49);
  v50.origin.x = a2;
  v50.origin.double y = a3;
  v50.size.width = a4;
  v50.size.height = a5;
  double v44 = CGRectGetMinX(v50);
  v51.origin.x = a2;
  v51.origin.double y = a3;
  v51.size.width = a4;
  v51.size.height = a5;
  double MaxY = CGRectGetMaxY(v51);
  if (a5 > 0.0) {
    double MaxY = MaxY + -0.01;
  }
  double v47 = MaxY;
  double v16 = -[UITableViewRowData rectForSection:]((uint64_t)v5, 0);
  CGFloat v42 = v17;
  CGFloat v43 = v16;
  double v19 = v18;
  CGFloat v21 = v20;
  double v22 = -[UITableViewRowData rectForSection:]((uint64_t)v5, v5[8] - 1);
  double v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  CGFloat v45 = MinY;
  uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
  if (MinY >= v19)
  {
    int v34 = 1;
  }
  else
  {
    v52.origin.x = a2;
    v52.origin.double y = a3;
    v52.size.width = a4;
    v52.size.height = a5;
    double v30 = v22;
    v55.origin.double y = v19;
    uint64_t v31 = v26;
    v55.size.width = v21;
    uint64_t v32 = v28;
    v55.size.height = v42;
    v55.origin.x = v43;
    BOOL v33 = CGRectIntersectsRect(v52, v55);
    uint64_t v28 = v32;
    uint64_t v26 = v31;
    double v22 = v30;
    int v34 = !v33;
    if (v33) {
      uint64_t v29 = 0;
    }
  }
  if (v47 > v24)
  {
    v53.origin.x = a2;
    v53.origin.double y = a3;
    v53.size.width = a4;
    v53.size.height = a5;
    double v35 = v24;
    if (CGRectIntersectsRect(v53, *(CGRect *)&v22))
    {
      uint64_t v36 = v5[8] - 1;
      if (!v34) {
        goto LABEL_25;
      }
LABEL_18:
      uint64_t v37 = [(UITableViewRowData *)(uint64_t)v5 _sectionForPoint:v5[8] beginningWithSection:MinX numberOfSections:v45];
      uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
      if (v37 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v38 = v37;
        if (v5[15] - 1 > 1)
        {
          uint64_t v29 = v37;
        }
        else
        {
          double v39 = *(double *)(*(void *)(v5[11] + 8 * v37) + 48);
          uint64_t v29 = v37;
          if (v39 > 0.0)
          {
            uint64_t v40 = [(UITableViewRowData *)(uint64_t)v5 _sectionForPoint:v5[8] beginningWithSection:MinX numberOfSections:v45 - v39];
            if (v40 == 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v29 = v38;
            }
            else {
              uint64_t v29 = v40;
            }
          }
        }
      }
      goto LABEL_25;
    }
  }
  uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  if (v34) {
    goto LABEL_18;
  }
LABEL_25:
  if (v36 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v36 = [(UITableViewRowData *)(uint64_t)v5 _sectionForPoint:v5[8] beginningWithSection:v44 numberOfSections:v47];
  }
  if (v29 == 0x7FFFFFFFFFFFFFFFLL || v36 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return v29;
  }
}

- (uint64_t)_sectionForPoint:(size_t)a3 beginningWithSection:(double)a4 numberOfSections:(CGFloat)a5
{
  *(double *)&__kedouble y = a4;
  *((CGFloat *)&__key + 1) = a5;
  if (!*(void *)(a1 + 64)) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v15.origin.x = -[UITableViewRowData rectForSection:](a1, a2);
  if (a5 < CGRectGetMinY(v15)) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v16.origin.x = -[UITableViewRowData rectForSection:](a1, a2 + a3 - 1);
  if (a5 > CGRectGetMaxY(v16)) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  CGRect v9 = (const void *)(*(void *)(a1 + 88) + 8 * a2);
  __compar[0] = MEMORY[0x1E4F143A8];
  __compar[1] = 3221225472;
  __compar[2] = __77__UITableViewRowData__sectionForPoint_beginningWithSection_numberOfSections___block_invoke;
  __compar[3] = &unk_1E53091F0;
  __compar[4] = a1;
  long long v13 = __key;
  BOOL v10 = bsearch_b(&__key, v9, a3, 8uLL, __compar);
  if (v10) {
    return ((uint64_t)v10 - *(void *)(a1 + 88)) >> 3;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (double)rectForTable
{
  if (!a1) {
    return 0.0;
  }
  if ([*(id *)(a1 + 8) _shouldUseNewHeaderFooterBehavior])
  {
    -[UITableViewRowData rectForTableFooterView](a1);
    return 0.0;
  }
  else
  {
    double x = -[UITableViewRowData rectForTableHeaderView](a1);
    CGFloat y = v3;
    CGFloat width = v5;
    CGFloat height = v7;
    if (*(uint64_t *)(a1 + 64) >= 1)
    {
      uint64_t v9 = 0;
      do
      {
        v17.origin.double x = -[UITableViewRowData rectForSection:](a1, v9);
        v17.origin.CGFloat y = v10;
        v17.size.CGFloat width = v11;
        v17.size.CGFloat height = v12;
        v15.origin.double x = x;
        v15.origin.CGFloat y = y;
        v15.size.CGFloat width = width;
        v15.size.CGFloat height = height;
        CGRect v16 = CGRectUnion(v15, v17);
        double x = v16.origin.x;
        CGFloat y = v16.origin.y;
        CGFloat width = v16.size.width;
        CGFloat height = v16.size.height;
        ++v9;
      }
      while (v9 < *(void *)(a1 + 64));
    }
    long long v13 = [*(id *)(a1 + 8) _tableFooterView];

    if (v13) {
      -[UITableViewRowData heightForTableFooterView](a1);
    }
  }
  return x;
}

- (double)rectForSection:(uint64_t)a1
{
  if (a1)
  {
    if (a2 < 0 || *(void *)(a1 + 64) <= a2)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_rectForSection_, a1, @"UITableViewRowData.m", 2152, @"request for rect of invalid section (%ld)", a2);
    }
    uint64_t v4 = *(void *)(*(void *)(a1 + 88) + 8 * a2);
    if (!*(unsigned char *)(v4 + 8)) {
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(void *)(*(void *)(a1 + 88) + 8 * a2), a2, *(void **)(a1 + 8), a1);
    }
    if (!*(unsigned char *)(v4 + 9)) {
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
    }
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
    -[UITableViewRowData offsetForSection:](a1, v4);
  }
  return 0.0;
}

- (id)indexPathForRowAtGlobalRow:(void *)a1
{
  uint64_t v4 = 0;
  if (a1)
  {
    if (a2 != 0x7FFFFFFFFFFFFFFFLL)
    {
      var18[0] = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v5 = -[UITableViewRowData _sectionRowForGlobalRow:inSection:](a1, a2, var18);
      if (var18[0] == 0x7FFFFFFFFFFFFFFFLL || v5 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v4 = 0;
      }
      else
      {
        uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v5);
      }
    }
    uint64_t v2 = var18[4];
  }
  return v4;
}

- (uint64_t)globalRowForRowAtIndexPath:(uint64_t)result
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    unint64_t v4 = [a2 row];
    unint64_t v5 = [a2 section];
    if (v5 >= *(void *)(v3 + 64)) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    unint64_t v6 = v5;
    if (v4 >= -[UITableViewRowData numberOfRowsInSection:](v3, v5))
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      if (v6)
      {
        uint64_t v7 = 0;
        uint64_t v8 = 0;
        do
        {
          if (*(void *)(v3 + 64) <= v7)
          {
            if (dyld_program_sdk_at_least())
            {
              CGFloat v12 = [MEMORY[0x1E4F28B00] currentHandler];
              long long v13 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _UITableViewRowDataNumberOfRowsInSection(UITableViewRowData *__unsafe_unretained, NSInteger)");
              objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"UITableViewRowData.m", 1765, @"Requested the number of rows for section (%ld) which is out of bounds.", v7);
            }
            else
            {
              v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UITableViewRowDataNumberOfRowsInSection___s_category)+ 8);
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v16 = v7;
                _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Requested the number of rows for section (%ld) which is out of bounds.", buf, 0xCu);
              }
            }
            uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            uint64_t v9 = *(void *)(*(void *)(v3 + 88) + 8 * v7);
            if (!*(unsigned char *)(v9 + 8)) {
              -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(void *)(*(void *)(v3 + 88) + 8 * v7), v7, *(void **)(v3 + 8), v3);
            }
            if (!*(unsigned char *)(v9 + 9)) {
              -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](v3, v7);
            }
            uint64_t v10 = *(void *)(v9 + 32);
            id v11 = -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered]((void *)v3);
            if (v11)
            {
              if (v7 == [v11 section]) {
                ++v10;
              }
            }
          }
          v8 += v10;
          ++v7;
        }
        while (v6 != v7);
      }
      else
      {
        uint64_t v8 = 0;
      }
      return v8 + v4;
    }
  }
  return result;
}

- (uint64_t)sectionLocationForRow:(uint64_t)a3 inSection:
{
  if (!a1) {
    return 0;
  }
  if (a3 < 0 || *(void *)(a1 + 64) <= a3)
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel_sectionLocationForRow_inSection_, a1, @"UITableViewRowData.m", 2036, @"request for invalid section (%ld)", a3);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 88) + 8 * a3);
  if (!*(unsigned char *)(v6 + 8)) {
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(void *)(*(void *)(a1 + 88) + 8 * a3), a3, *(void **)(a1 + 8), a1);
  }
  if (!*(unsigned char *)(v6 + 9)) {
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a3);
  }
  uint64_t v7 = -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered]((void *)a1);
  uint64_t v8 = v7;
  if (v7 && [v7 section] == a3) {
    a2 -= [v8 row] < a2;
  }
  uint64_t v9 = *(void *)(v6 + 96);
  if (v9 && (uint64_t v10 = *(void **)(v9 + 176)) != 0)
  {
    uint64_t v11 = *(void *)(v9 + 64);
    if (v11 < 1)
    {
LABEL_17:
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v12 = 0;
      while (*(void *)(*(void *)(v9 + 88) + 8 * v12) != v6)
      {
        if (v11 == ++v12) {
          goto LABEL_17;
        }
      }
    }
    uint64_t v13 = +[UISectionRowData sectionLocationForRow:inSection:numRows:gapIndexPath:rowSpacing:](*(double *)(v9 + 144), (uint64_t)UISectionRowData, a2, v12, *(void *)(v6 + 32), v10);
  }
  else
  {
    uint64_t v14 = *(void *)(v6 + 32);
    self;
    if (v14 - 1 == a2) {
      unsigned int v15 = 4;
    }
    else {
      unsigned int v15 = 2;
    }
    if (v14 - 1 == a2) {
      unsigned int v16 = 3;
    }
    else {
      unsigned int v16 = 1;
    }
    if (a2) {
      uint64_t v13 = v16;
    }
    else {
      uint64_t v13 = v15;
    }
  }

  return v13;
}

- (uint64_t)globalRowsInRect:(CGFloat)a3 canGuess:(CGFloat)a4
{
  if (a1)
  {
    uint64_t v12 = -[UITableViewRowData numberOfRows]((uint64_t)a1);
    if (v12)
    {
      uint64_t v13 = (uint64_t)v12;
      uint64_t v14 = (char *)v12 - 1;
      unsigned int v15 = -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered](a1);
      if (v15) {
        uint64_t v16 = -[UITableViewRowData globalRowForRowAtIndexPath:]((uint64_t)a1, v15);
      }
      else {
        uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v13 < 1)
      {
        uint64_t v18 = 0;
        uint64_t v24 = 0;
        uint64_t v19 = (uint64_t)v14;
      }
      else
      {
        uint64_t v18 = 0;
        uint64_t v19 = (uint64_t)v14;
        do
        {
          uint64_t v20 = v19 - v18;
          if (v19 >= v18) {
            uint64_t v21 = v19 - v18;
          }
          else {
            uint64_t v21 = v20 + 1;
          }
          uint64_t v22 = v18 + (v21 >> 1);
          uint64_t v23 = v16 - (v20 > 1);
          if (v16 < v19) {
            uint64_t v23 = v16 + 1;
          }
          if (v22 == v16) {
            uint64_t v24 = v23;
          }
          else {
            uint64_t v24 = v22;
          }
          v54.origin.CGFloat x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](a1, v24, 1);
          double y = v54.origin.y;
          v66.origin.CGFloat x = a3;
          v66.origin.double y = a4;
          v66.size.CGFloat width = a5;
          v66.size.CGFloat height = a6;
          if (CGRectIntersectsRect(v54, v66)) {
            break;
          }
          if (y < a4) {
            uint64_t v18 = v24 + 1;
          }
          else {
            uint64_t v19 = v24 - 1;
          }
        }
        while (v18 <= v19);
      }
      if (v18 > v19) {
        goto LABEL_33;
      }
      v55.origin.CGFloat x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](a1, v24, a2);
      CGFloat x = v55.origin.x;
      CGFloat v27 = v55.origin.y;
      CGFloat width = v55.size.width;
      CGFloat height = v55.size.height;
      v67.origin.CGFloat x = a3;
      v67.origin.double y = a4;
      v67.size.CGFloat width = a5;
      v67.size.CGFloat height = a6;
      if (!CGRectIntersectsRect(v55, v67))
      {
LABEL_33:
        uint64_t v17 = 0;
LABEL_49:

        return v17;
      }
      CGFloat v52 = v27;
      CGFloat v53 = x;
      CGFloat v50 = height;
      CGFloat v51 = width;
      if (v24 >= 1)
      {
        v56.origin.CGFloat x = x;
        v56.origin.double y = v27;
        v56.size.CGFloat width = width;
        v56.size.CGFloat height = height;
        double MinY = CGRectGetMinY(v56);
        v57.origin.CGFloat x = a3;
        v57.origin.double y = a4;
        v57.size.CGFloat width = a5;
        v57.size.CGFloat height = a6;
        uint64_t v31 = v24;
        if (MinY <= CGRectGetMinY(v57))
        {
LABEL_35:
          uint64_t v17 = v31;
          if (v31 != 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_37:
            if (v24 < (uint64_t)v14)
            {
              v61.origin.double y = v52;
              v61.origin.CGFloat x = v53;
              v61.size.CGFloat height = v50;
              v61.size.CGFloat width = v51;
              double MaxY = CGRectGetMaxY(v61);
              v62.origin.CGFloat x = a3;
              v62.origin.double y = a4;
              v62.size.CGFloat width = a5;
              v62.size.CGFloat height = a6;
              if (MaxY < CGRectGetMaxY(v62))
              {
                uint64_t v40 = v16 - 1;
                while (v24 + 1 < v13)
                {
                  v41 = (void *)MEMORY[0x18C108260]();
                  v63.origin.CGFloat x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](a1, v24 + 1, a2);
                  CGFloat v42 = v63.origin.x;
                  CGFloat v43 = v63.origin.y;
                  CGFloat v44 = v63.size.width;
                  CGFloat v45 = v63.size.height;
                  v69.origin.CGFloat x = a3;
                  v69.origin.double y = a4;
                  v69.size.CGFloat width = a5;
                  v69.size.CGFloat height = a6;
                  if (!CGRectIntersectsRect(v63, v69))
                  {
                    goto LABEL_49;
                  }
                  v64.origin.CGFloat x = v42;
                  v64.origin.double y = v43;
                  v64.size.CGFloat width = v44;
                  v64.size.CGFloat height = v45;
                  double v46 = CGRectGetMaxY(v64);
                  v65.origin.CGFloat x = a3;
                  v65.origin.double y = a4;
                  v65.size.CGFloat width = a5;
                  v65.size.CGFloat height = a6;
                  double v47 = CGRectGetMaxY(v65);
                  if (v46 >= v47 && v40 != v24++) {
                    goto LABEL_49;
                  }
                }
              }
            }
            goto LABEL_49;
          }
        }
        else
        {
          uint64_t v31 = v24;
          while (1)
          {
            uint64_t v17 = v31 - 1;
            if (v31 < 1) {
              break;
            }
            uint64_t v32 = (void *)MEMORY[0x18C108260]();
            v58.origin.CGFloat x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](a1, v31 - 1, a2);
            CGFloat v33 = v58.origin.x;
            CGFloat v34 = v58.origin.y;
            CGFloat v35 = v58.size.width;
            CGFloat v36 = v58.size.height;
            v68.origin.CGFloat x = a3;
            v68.origin.double y = a4;
            v68.size.CGFloat width = a5;
            v68.size.CGFloat height = a6;
            if (!CGRectIntersectsRect(v58, v68))
            {
              goto LABEL_35;
            }
            v59.origin.CGFloat x = v33;
            v59.origin.double y = v34;
            v59.size.CGFloat width = v35;
            v59.size.CGFloat height = v36;
            double v37 = CGRectGetMinY(v59);
            v60.origin.CGFloat x = a3;
            v60.origin.double y = a4;
            v60.size.CGFloat width = a5;
            v60.size.CGFloat height = a6;
            double v38 = CGRectGetMinY(v60);
            --v31;
            if (v37 < v38) {
              goto LABEL_37;
            }
          }
        }
      }
      uint64_t v17 = 0;
      goto LABEL_37;
    }
  }
  return 0;
}

- (double)rectForGlobalRow:(char)a3 heightCanBeGuessed:
{
  if (!a1) {
    return 0.0;
  }
  double v5 = *MEMORY[0x1E4F1DB28];
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v6 = -[UITableViewRowData _sectionRowForGlobalRow:inSection:](a1, a2, &v8);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL) {
    return -[UITableViewRowData rectForRow:inSection:heightCanBeGuessed:]((uint64_t)a1, v6, v8, a3);
  }
  return v5;
}

- (uint64_t)_sectionRowForGlobalRow:(uint64_t *)a3 inSection:
{
  uint64_t v3 = (uint64_t)a1;
  __kedouble y = a2;
  if (a1)
  {
    uint64_t v6 = -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered](a1);
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 section];
      size_t v9 = *(void *)(v3 + 64);
    }
    else
    {
      size_t v9 = *(void *)(v3 + 64);
      uint64_t v8 = v9;
    }
    uint64_t v10 = *(const void **)(v3 + 88);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__UITableViewRowData__sectionRowForGlobalRow_inSection___block_invoke;
    v14[3] = &unk_1E53091F0;
    v14[4] = v3;
    v14[5] = v8;
    v14[6] = a2;
    uint64_t v11 = bsearch_b(&__key, v10, v9, 8uLL, v14);
    if (v11)
    {
      uint64_t v12 = ((uint64_t)v11 - *(void *)(v3 + 88)) >> 3;
      uint64_t v3 = __key - *(void *)(*(void *)v11 + 24) - (v8 < v12);
    }
    else
    {
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
    }
    *a3 = v12;
  }
  return v3;
}

- (double)rectForRow:(uint64_t)a3 inSection:(char)a4 heightCanBeGuessed:
{
  if (a1)
  {
    uint64_t v6 = a2;
    if (*(void *)(a1 + 64) <= a3 || -[UITableViewRowData numberOfRowsInSection:](a1, a3) <= a2)
    {
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v14 = [MEMORY[0x1E4F28D58] indexPathForRow:v6 inSection:a3];
      [v13 handleFailureInMethod:sel_rectForRow_inSection_heightCanBeGuessed_, a1, @"UITableViewRowData.m", 2375, @"request for rect at invalid index path (%@)", v14 object file lineNumber description];
    }
    uint64_t v8 = -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered]((void *)a1);
    size_t v9 = v8;
    if (v8 && [v8 section] == a3)
    {
      if ([v9 row] == v6)
      {
        char v10 = 1;
      }
      else
      {
        char v10 = 0;
        v6 -= [v9 row] < v6;
      }
    }
    else
    {
      char v10 = 0;
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 88) + 8 * a3);
    if (!*(unsigned char *)(v11 + 8)) {
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(void *)(*(void *)(a1 + 88) + 8 * a3), a3, *(void **)(a1 + 8), a1);
    }
    if (!*(unsigned char *)(v11 + 9)) {
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a3);
    }
    -[UISectionRowData offsetForRow:adjustedForGap:](v11, v6, 1);
    if ((v10 & 1) == 0) {
      -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](a1, v6, a3, a4, 0);
    }
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a3);
    -[UITableViewRowData offsetForSection:](a1, v11);
  }
  return 0.0;
}

- (void)_ensureSectionOffsetIsValidForSection:(uint64_t)a1
{
  if (a1)
  {
    unint64_t v4 = *(uint64_t **)(a1 + 88);
    if (!*(unsigned char *)(v4[a2] + 9))
    {
      uint64_t v5 = a2;
      while (1)
      {
        uint64_t v6 = v5 - 1;
        if (v5 < 1) {
          break;
        }
        if (*(unsigned __int8 *)(v4[--v5] + 9))
        {
          uint64_t v8 = v6 + 1;
          goto LABEL_10;
        }
      }
      uint64_t v9 = *v4;
      if (!*(unsigned char *)(*v4 + 8)) {
        -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](v9, 0, *(void **)(a1 + 8), a1);
      }
      double v10 = *(double *)(a1 + 152);
      *(double *)(v9 + 16) = v10 + -[UITableViewRowData heightForTableHeaderView](a1);
      *(void *)(v9 + 24) = 0;
      uint64_t v8 = 1;
      *(unsigned char *)(v9 + 9) = 1;
LABEL_10:
      if (v8 <= a2)
      {
        uint64_t v11 = a2 + 1;
        do
        {
          uint64_t v12 = (uint64_t *)(*(void *)(a1 + 88) + 8 * v8);
          uint64_t v13 = *(v12 - 1);
          uint64_t v14 = *v12;
          if (!*(unsigned char *)(v13 + 8)) {
            -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](v13, v8 - 1, *(void **)(a1 + 8), a1);
          }
          if (!*(unsigned char *)(v13 + 9)) {
            -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, v8 - 1);
          }
          if (!*(unsigned char *)(a1 + 72)) {
            *(double *)(v14 + 16) = *(double *)(v13 + 16) + *(double *)(v13 + 40);
          }
          *(void *)(v14 + 24) = *(void *)(v13 + 32) + *(void *)(v13 + 24);
          *(unsigned char *)(v14 + 9) = 1;
          ++v8;
        }
        while (v11 != v8);
      }
    }
  }
}

- (double)offsetForSection:(uint64_t)a1
{
  double v2 = 0.0;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      double v5 = *(double *)(a1 + 152);
      v10.origin.CGFloat x = -[UITableViewRowData rectForTableHeaderView](a1);
      double Height = CGRectGetHeight(v10);
      uint64_t v7 = *(void *)(a1 + 64);
      if (v7 < 1)
      {
LABEL_7:
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"request for offset of unknown section row data", Height);
      }
      else
      {
        double Height = v5 + Height;
        uint64_t v8 = *(void *)(a1 + 88);
        while (*(void *)v8 != a2)
        {
          double Height = Height + *(double *)(*(void *)v8 + 40);
          v8 += 8;
          if (!--v7) {
            goto LABEL_7;
          }
        }
        return Height;
      }
    }
    else
    {
      return *(double *)(a2 + 16);
    }
  }
  return v2;
}

- (double)rectForTableHeaderView
{
  if (a1)
  {
    if ([*(id *)(a1 + 8) _shouldUseNewHeaderFooterBehavior])
    {
      CGFloat v2 = *(double *)(a1 + 152);
      CGFloat v3 = *(double *)(a1 + 24);
      double v4 = -[UITableViewRowData heightForTableHeaderView](a1);
    }
    else
    {
      double v5 = [*(id *)(a1 + 8) _tableHeaderView];

      if (v5)
      {
        uint64_t v6 = [*(id *)(a1 + 8) _tableHeaderView];
        [v6 frame];
        double v4 = v7;
      }
      else
      {
        double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      }
      CGFloat v2 = *(double *)(a1 + 152);
      CGFloat v3 = *(double *)(a1 + 24);
    }
    if ((*(unsigned char *)(a1 + 128) & 8) != 0)
    {
      uint64_t v8 = [*(id *)(a1 + 8) _scrollView];
      [v8 bounds];
      CGRectGetMinY(v10);
      [*(id *)(a1 + 8) _contentInset];

      v11.origin.CGFloat x = 0.0;
      v11.origin.double y = v2;
      v11.size.CGFloat width = v3;
      v11.size.CGFloat height = v4;
      CGRectGetMinY(v11);
    }
  }
  return 0.0;
}

- (uint64_t)numberOfRowsInSection:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (a2 < 0 || *(void *)(a1 + 64) <= a2)
  {
    if (dyld_program_sdk_at_least())
    {
      double v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _UITableViewRowDataNumberOfRowsInSection(UITableViewRowData *__unsafe_unretained, NSInteger)");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"UITableViewRowData.m", 1765, @"Requested the number of rows for section (%ld) which is out of bounds.", a2);
    }
    else
    {
      uint64_t v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UITableViewRowDataNumberOfRowsInSection___s_category)
                        + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v12 = a2;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Requested the number of rows for section (%ld) which is out of bounds.", buf, 0xCu);
      }
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 88) + 8 * a2);
    if (!*(unsigned char *)(v4 + 8)) {
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(void *)(*(void *)(a1 + 88) + 8 * a2), a2, *(void **)(a1 + 8), a1);
    }
    if (!*(unsigned char *)(v4 + 9)) {
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
    }
    uint64_t v5 = *(void *)(v4 + 32);
    id v6 = -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered]((void *)a1);
    if (v6 && [v6 section] == a2) {
      ++v5;
    }
  }
  return v5;
}

- (void)temporarilyDeletedIndexPathBeingReordered
{
  if (a1)
  {
    CGFloat v2 = (void *)a1[23];
    if (!v2) {
      CGFloat v2 = (void *)a1[24];
    }
    a1 = v2;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (double)heightForRow:(uint64_t)a3 inSection:(char)a4 canGuess:(int)a5 adjustForReorderedRow:
{
  if (!a1) {
    return 0.0;
  }
  if (a3 < 0 || *(void *)(a1 + 64) <= a3)
  {
    unsigned int v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel_heightForRow_inSection_canGuess_adjustForReorderedRow_, a1, @"UITableViewRowData.m", 1962, @"request for invalid section (%ld)", a3);
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 88) + 8 * a3);
  if (!*(unsigned char *)(v10 + 8)) {
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(void *)(*(void *)(a1 + 88) + 8 * a3), a3, *(void **)(a1 + 8), a1);
  }
  if (!*(unsigned char *)(v10 + 9)) {
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a3);
  }
  CGRect v11 = -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered]((void *)a1);
  uint64_t v12 = v11;
  if (a5 && v11 && [v11 section] == a3)
  {
    if ([v12 row] == a2)
    {
      double v13 = 0.0;
      if (!*(void *)(a1 + 192)) {
        double v13 = *(double *)(a1 + 216);
      }
      goto LABEL_16;
    }
    a2 -= [v12 row] < a2;
  }
  double v13 = -[UISectionRowData heightForRow:inSection:canGuess:](v10, a2, a3, a4);
LABEL_16:

  return v13;
}

- (void)numberOfRows
{
  uint64_t v1 = (void *)a1;
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 64);
    uint64_t v3 = v2 - 1;
    if (v2 < 1)
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 88) + 8 * v3);
      if (!*(unsigned char *)(v4 + 8)) {
        -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(void *)(*(void *)(a1 + 88) + 8 * v3), v3, *(void **)(a1 + 8), a1);
      }
      if (!*(unsigned char *)(v4 + 9)) {
        -[UITableViewRowData _ensureSectionOffsetIsValidForSection:]((uint64_t)v1, v3);
      }
      uint64_t v5 = (void *)(*(void *)(v4 + 32) + *(void *)(v4 + 24));
    }
    id v6 = -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered](v1);
    if (v6) {
      uint64_t v1 = (void *)((char *)v5 + 1);
    }
    else {
      uint64_t v1 = v5;
    }
  }
  return v1;
}

- (double)rectForHeaderInSection:(char)a3 heightCanBeGuessed:
{
  if (!a1) {
    return 0.0;
  }
  if (a2 < 0 || *(void *)(a1 + 64) <= a2)
  {
    unsigned int v15 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel_rectForHeaderInSection_heightCanBeGuessed_, a1, @"UITableViewRowData.m", 2176, @"request for rect of header in invalid section (%ld)", a2);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 88) + 8 * a2);
  if (!*(unsigned char *)(v6 + 8)) {
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(void *)(*(void *)(a1 + 88) + 8 * a2), a2, *(void **)(a1 + 8), a1);
  }
  if (!*(unsigned char *)(v6 + 9)) {
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
  }
  [*(id *)(a1 + 8) _sectionHeaderContentInsets];
  double v8 = v7;
  uint64_t v9 = [*(id *)(a1 + 8) _constants];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    CGRect v11 = [*(id *)(a1 + 8) _constants];
    [v11 headerFooterOffsetFromContentInsetForTableView:*(void *)(a1 + 8)];
    double v13 = v12;

    double v8 = v8 + v13;
  }
  -[UISectionRowData sizeForHeaderInSection:canGuess:](v6, a2, a3);
  -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
  -[UITableViewRowData offsetForSection:](a1, v6);
  return v8;
}

- (double)fullContentWidth
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 8) _sectionHeaderContentInsets];
  double v3 = v2;
  double v5 = v4;
  uint64_t v6 = [*(id *)(a1 + 8) _constants];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [*(id *)(a1 + 8) _constants];
    [v8 headerFooterOffsetFromContentInsetForTableView:*(void *)(a1 + 8)];
    double v10 = v9;
    double v12 = v11;

    double v3 = v3 + v10;
    double v5 = v5 + v12;
  }
  return *(double *)(a1 + 24) - (v5 + v3);
}

- (double)rectForFooterInSection:(char)a3 heightCanBeGuessed:
{
  if (!a1) {
    return 0.0;
  }
  if (a2 < 0 || *(void *)(a1 + 64) <= a2)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_rectForFooterInSection_heightCanBeGuessed_, a1, @"UITableViewRowData.m", 2268, @"request for rect of footer in invalid section (%ld)", a2);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 88) + 8 * a2);
  if (!*(unsigned char *)(v6 + 8)) {
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(void *)(*(void *)(a1 + 88) + 8 * a2), a2, *(void **)(a1 + 8), a1);
  }
  if (!*(unsigned char *)(v6 + 9)) {
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
  }
  [*(id *)(a1 + 8) _sectionFooterContentInsets];
  double v8 = v7;
  -[UISectionRowData heightForFooterInSection:canGuess:](v6, a2, a3);
  -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
  -[UITableViewRowData offsetForSection:](a1, v6);
  return v8;
}

- (void)setHeight:(double)a3 forRowAtIndexPath:
{
  id v5 = a2;
  if (a1)
  {
    id v26 = v5;
    uint64_t v6 = [v5 section];
    if (v6 >= *(void *)(a1 + 64))
    {
      uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel_setHeight_forRowAtIndexPath_, a1, @"UITableViewRowData.m", 2017, @"attempt to set height for row in section %ld when there are only %ld sections in the table", v6, *(void *)(a1 + 64));
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 88) + 8 * v6);
    if (!*(unsigned char *)(v7 + 8)) {
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(void *)(*(void *)(a1 + 88) + 8 * v6), v6, *(void **)(a1 + 8), a1);
    }
    if (!*(unsigned char *)(v7 + 9)) {
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, v6);
    }
    float v8 = *(float *)(*(void *)(v7 + 136) + 4 * [v26 row]);
    id v5 = v26;
    if (v8 < -1.0) {
      float v8 = -v8;
    }
    float v9 = a3;
    float v10 = v9 - v8;
    if (v10 < 0.0) {
      float v10 = -v10;
    }
    if (v10 > 0.00000011921)
    {
      uint64_t v11 = [v26 row];
      double v12 = fmax(a3, 0.00000011920929);
      double v13 = -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered](*(void **)(v7 + 96));
      uint64_t v14 = v13;
      if (v13 && [v13 section] == v6) {
        v11 -= [v14 row] < v11;
      }
      uint64_t v15 = *(void *)(v7 + 136);
      float v16 = *(float *)(v15 + 4 * v11);
      if (v16 < -1.0) {
        float v16 = -v16;
      }
      double v17 = v12 - v16;
      float v18 = v12;
      *(float *)(v15 + 4 * v11) = v18;
      if (*(unsigned char *)(*(void *)(v7 + 96) + 72))
      {
        unint64_t v19 = *(void *)(v7 + 32);
        BOOL v20 = v19 > v11 + 1;
        unint64_t v21 = v19 - (v11 + 1);
        if (v20) {
          memset_pattern16((void *)(*(void *)(v7 + 144) + 8 * (v11 + 1)), &xmmword_186B93620, 8 * v21);
        }
      }
      else
      {
        unint64_t v22 = *(void *)(v7 + 32);
        if (v11 + 1 < v22)
        {
          unint64_t v23 = ~v11 + v22;
          uint64_t v24 = (double *)(*(void *)(v7 + 144) + 8 * v11 + 8);
          do
          {
            *uint64_t v24 = v17 + *v24;
            ++v24;
            --v23;
          }
          while (v23);
        }
      }
      -[UISectionRowData updateSectionHeightWithDelta:section:updateFooterOffset:](v7, v6, 1, v17);

      id v5 = v26;
    }
  }
}

- (double)heightForTable
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2 < 1)
  {
    double v6 = *(double *)(a1 + 152);
    double v5 = v6 + -[UITableViewRowData heightForTableHeaderView](a1);
  }
  else
  {
    -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](a1, v2 - 1, 1);
    double v5 = v3 + v4;
  }
  return v5 + -[UITableViewRowData heightForTableFooterView](a1) + *(double *)(a1 + 160);
}

- (double)heightForTableFooterView
{
  if (!a1) {
    return 0.0;
  }
  if ((*(unsigned char *)(a1 + 128) & 2) == 0
    && ((dyld_program_sdk_at_least() & 1) != 0
     || [*(id *)(a1 + 8) _shouldUseNewHeaderFooterBehavior]))
  {
    [*(id *)(a1 + 8) _heightForTableFooter];
    *(void *)(a1 + 104) = v2;
    *(unsigned char *)(a1 + 128) |= 2u;
  }
  return *(double *)(a1 + 104);
}

- (double)heightForTableHeaderViewHiding
{
  if (!a1) {
    return 0.0;
  }
  double v2 = *(double *)(a1 + 112);
  if (v2 < 0.0)
  {
    if ([*(id *)(a1 + 8) _isTableHeaderAutohiding]) {
      double v2 = -[UITableViewRowData heightForTableHeaderView](a1);
    }
  }
  return fmax(v2, 0.0);
}

- (double)heightForTableHeaderView
{
  if (!a1) {
    return 0.0;
  }
  if ((*(unsigned char *)(a1 + 128) & 1) == 0
    && ((dyld_program_sdk_at_least() & 1) != 0
     || [*(id *)(a1 + 8) _shouldUseNewHeaderFooterBehavior]))
  {
    [*(id *)(a1 + 8) _heightForTableHeader];
    *(void *)(a1 + 96) = v2;
    *(unsigned char *)(a1 + 128) |= 1u;
  }
  return *(double *)(a1 + 96);
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = -[UITableViewRowData initWithTableView:]([UITableViewRowData alloc], self->_tableView);
  v4[8] = self->_numSections;
  v4[10] = self->_sectionRowDataCapacity;
  double v5 = malloc_type_calloc(self->_sectionRowDataCapacity, 8uLL, 0x80040B8603338uLL);
  if (self->_numSections >= 1)
  {
    int64_t v6 = 0;
    do
    {
      uint64_t v7 = [self->_sectionRowData[v6] copy];
      float v8 = (void *)v5[v6];
      v5[v6] = v7;

      ++v6;
    }
    while (v6 < self->_numSections);
  }
  v4[11] = v5;
  v4[17] = *(void *)&self->_minimumRowHeight;
  v4[18] = *(void *)&self->_rowSpacing;
  v4[3] = *(void *)&self->_tableViewWidth;
  long long v9 = *(_OWORD *)&self->_sectionContentInset.bottom;
  *((_OWORD *)v4 + 2) = *(_OWORD *)&self->_sectionContentInset.top;
  *((_OWORD *)v4 + 3) = v9;
  v4[12] = *(void *)&self->_tableHeaderHeight;
  v4[13] = *(void *)&self->_tableFooterHeight;
  v4[14] = *(void *)&self->_heightForTableHeaderViewHiding;
  v4[19] = *(void *)&self->_tableTopPadding;
  v4[20] = *(void *)&self->_tableBottomPadding;
  v4[21] = *(void *)&self->_tableSidePadding;
  uint64_t v10 = [(NSIndexPath *)self->_reorderedIndexPath copy];
  uint64_t v11 = (void *)v4[23];
  v4[23] = v10;

  uint64_t v12 = [(NSIndexPath *)self->_draggedIndexPath copy];
  double v13 = (void *)v4[24];
  v4[24] = v12;

  v4[28] = *(void *)&self->_draggedRowHeight;
  uint64_t v14 = [(NSIndexPath *)self->_gapIndexPath copy];
  uint64_t v15 = (void *)v4[22];
  v4[22] = v14;

  v4[27] = *(void *)&self->_gapRowHeight;
  *((_DWORD *)v4 + 32) = self->_rowDataFlags;
  *((unsigned char *)v4 + 72) = self->_estimatesHeights;
  return v4;
}

- (void)initWithTableView:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)UITableViewRowData;
    double v4 = objc_msgSendSuper2(&v11, sel_init);
    a1 = v4;
    if (v4)
    {
      v4[1] = v3;
      double v5 = [v3 _scrollView];
      [v5 bounds];
      a1[3] = v6;

      a1[17] = 0x7FEFFFFFFFFFFFFFLL;
      [v3 _heightForTableHeader];
      a1[12] = v7;
      [v3 _heightForTableFooter];
      a1[13] = v8;
      a1[14] = 0xBFF0000000000000;
      [v3 _rowSpacing];
      a1[18] = v9;
      a1[15] = [v3 _headerFooterPinningBehavior];
    }
  }

  return a1;
}

- (void)ensureAllSectionsAreValid
{
  if (a1)
  {
    -[UITableViewRowData _updateSectionRowDataArrayForNumSections:](a1, [(UITable_RowDataSource *)a1->_tableView _numberOfSections]);
    if (a1->_numSections >= 1)
    {
      uint64_t v2 = 0;
      do
      {
        id v3 = a1->_sectionRowData[v2];
        if (!v3[8]) {
          -[UISectionRowData refreshWithSection:tableView:tableViewRowData:]((uint64_t)a1->_sectionRowData[v2], v2, a1->_tableView, (uint64_t)a1);
        }
        if (!v3[9]) {
          -[UITableViewRowData _ensureSectionOffsetIsValidForSection:]((uint64_t)a1, v2);
        }
        ++v2;
      }
      while (v2 < a1->_numSections);
    }
  }
}

- (void)invalidateAllSections
{
  if (a1)
  {
    *(unsigned char *)(a1 + 128) &= 0xF8u;
    id v6 = *(id *)(a1 + 8);
    [v6 _rowSpacing];
    *(void *)(a1 + 144) = v2;
    *(void *)(a1 + 120) = [v6 _headerFooterPinningBehavior];
    -[UITableViewRowData _updateSectionRowDataArrayForNumSections:]((UITableViewRowData *)a1, [*(id *)(a1 + 8) _numberOfSections]);
    uint64_t v3 = *(void *)(a1 + 64);
    if (v3 >= 1)
    {
      uint64_t v4 = *(void *)(a1 + 88);
      do
      {
        if (*(void *)v4) {
          *(_WORD *)(*(void *)v4 + 8) = 0;
        }
        v4 += 8;
        --v3;
      }
      while (v3);
    }
    *(void *)(a1 + 136) = 0x7FEFFFFFFFFFFFFFLL;
    double v5 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (dyld_program_sdk_at_least()) {
      -[UITableViewRowData _updateTopAndBottomPadding](a1);
    }
  }
}

- (void)_updateSectionRowDataArrayForNumSections:(UITableViewRowData *)a1
{
  if (a1)
  {
    if (a1->_sectionRowDataCapacity < count)
    {
      uint64_t v4 = (id *)malloc_type_calloc(count, 8uLL, 0x80040B8603338uLL);
      double v5 = v4;
      if (a1->_sectionRowDataCapacity >= 1)
      {
        int64_t v6 = 0;
        uint64_t v7 = v4;
        do
        {
          objc_storeStrong(v7, a1->_sectionRowData[v6]);
          sectionRowData = a1->_sectionRowData;
          id v9 = sectionRowData[v6];
          sectionRowData[v6] = 0;

          ++v6;
          ++v7;
        }
        while (v6 < a1->_sectionRowDataCapacity);
      }
      uint64_t v10 = a1->_sectionRowData;
      if (v10) {
        free(v10);
      }
      a1->_sectionRowData = v5;
      if (!v5)
      {
        double v17 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel__updateSectionRowDataArrayForNumSections_, a1, @"UITableViewRowData.m", 1210, @"Failed to allocate data stores for %ld sections. Consider using fewer sections.", count);
      }
      a1->_sectionRowDataCapacitdouble y = count;
    }
    int64_t numSections = a1->_numSections;
    if (numSections >= count)
    {
      for (; numSections > count; --numSections)
      {
        uint64_t v15 = (uint64_t)&a1->_sectionRowData[numSections];
        float v16 = *(void **)(v15 - 8);
        *(void *)(v15 - 8) = 0;
      }
    }
    else
    {
      do
      {
        uint64_t v12 = [UISectionRowData alloc];
        if (v12)
        {
          v18.receiver = v12;
          v18.super_class = (Class)UISectionRowData;
          uint64_t v12 = (UISectionRowData *)[(UITableViewRowData *)&v18 init];
          if (v12) {
            v12->_rowData = a1;
          }
        }
        double v13 = a1->_sectionRowData;
        id v14 = v13[numSections];
        v13[numSections] = v12;

        ++numSections;
      }
      while (count != numSections);
    }
    a1->_int64_t numSections = count;
  }
}

- (void)_updateTopAndBottomPadding
{
  if (a1)
  {
    unint64_t v2 = [*(id *)(a1 + 8) _tableStyle];
    if (v2 <= 0x10 && ((1 << v2) & 0x10006) != 0)
    {
      *(double *)(a1 + 152) = GroupedTableOffsetFromTop(*(void **)(a1 + 8), (void *)a1);
      id v4 = *(id *)(a1 + 8);
      double v5 = (double *)(id)a1;
      [v4 _bottomPadding];
      double v7 = v6;
      if (v6 == -1.0)
      {
        double v7 = 0.0;
        if (-[UITableViewRowData heightForTableFooterView]((uint64_t)v5) <= 0.0)
        {
          uint64_t v8 = +[UIDevice currentDevice];
          uint64_t v9 = [v8 userInterfaceIdiom];

          double v7 = 20.0;
          if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
          {
            if ([v4 usesVariableMargins]) {
              double v7 = 40.0;
            }
            else {
              double v7 = 20.0;
            }
          }
        }
      }

      v5[20] = v7;
    }
  }
}

- (double)indexPathsForRowsInRect:(CGFloat)a3
{
  if (a1)
  {
    -[UITableViewRowData indexPathsForRowsInRect:extraHitSpaceBetweenRows:]((uint64_t)a1, a2, a3, a4, a5, a1[18]);
    a1 = (double *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = vars8;
  }
  return a1;
}

- (id)indexPathsForRowsInRect:(CGFloat)a3 extraHitSpaceBetweenRows:(CGFloat)a4
{
  if (!a1)
  {
    uint64_t v12 = 0;
    goto LABEL_39;
  }
  if (!*(void *)(a1 + 64))
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_39;
  }
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  v51.origin.CGFloat x = -[UITableViewRowData rectForSection:](a1, 0);
  double MinY = CGRectGetMinY(v51);
  v52.origin.CGFloat x = -[UITableViewRowData rectForSection:](a1, *(void *)(a1 + 64) - 1);
  double MaxY = CGRectGetMaxY(v52);
  int v15 = dyld_program_sdk_at_least();
  p_left = (CGFloat *)(a1 + 40);
  p_right = (CGFloat *)(a1 + 56);
  if (!v15)
  {
    p_right = &UIEdgeInsetsZero.right;
    p_left = &UIEdgeInsetsZero.left;
  }
  v63.origin.CGFloat x = *p_left;
  v63.size.CGFloat width = *(double *)(a1 + 24) - (*p_left + *p_right);
  v63.size.CGFloat height = MaxY - MinY;
  v53.origin.CGFloat x = a2;
  v53.origin.double y = a3;
  v53.size.CGFloat width = a4;
  v53.size.CGFloat height = a5;
  v63.origin.double y = MinY;
  if (!CGRectIntersectsRect(v53, v63)) {
    goto LABEL_39;
  }
  v54.origin.CGFloat x = a2;
  v54.origin.double y = a3;
  v54.size.CGFloat width = a4;
  v54.size.CGFloat height = a5;
  if (!CGRectIsEmpty(v54)) {
    a5 = a5 + -1.0;
  }
  v55.origin.CGFloat x = a2;
  v55.origin.double y = a3;
  v55.size.CGFloat width = a4;
  v55.size.CGFloat height = a5;
  CGFloat v18 = CGRectGetMinY(v55);
  uint64_t v19 = [(UITableViewRowData *)a1 _sectionForPoint:*(void *)(a1 + 64) beginningWithSection:0.0 numberOfSections:v18];
  if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = v19;
  }
  v56.origin.CGFloat x = a2;
  v56.origin.double y = a3;
  v56.size.CGFloat width = a4;
  v56.size.CGFloat height = a5;
  CGFloat v21 = CGRectGetMaxY(v56);
  uint64_t v22 = [(UITableViewRowData *)a1 _sectionForPoint:*(void *)(a1 + 64) - v20 beginningWithSection:0.0 numberOfSections:v21];
  if (v22 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v22 = *(void *)(a1 + 64) - 1;
  }
  uint64_t v23 = *(void *)(*(void *)(a1 + 88) + 8 * v20);
  v57.origin.CGFloat x = a2;
  v57.origin.double y = a3;
  v57.size.CGFloat width = a4;
  v57.size.CGFloat height = a5;
  double v24 = CGRectGetMinY(v57);
  if (!v23)
  {
    uint64_t v25 = 0;
    uint64_t v32 = *(void *)(*(void *)(a1 + 88) + 8 * v22);
    if (v22 > v20) {
      goto LABEL_22;
    }
LABEL_43:
    v61.origin.CGFloat x = a2;
    v61.origin.double y = a3;
    v61.size.CGFloat width = a4;
    v61.size.CGFloat height = a5;
    double v45 = CGRectGetMaxY(v61);
    uint64_t v46 = [(UISectionRowData *)v32 _rowForPoint:*(void *)(v32 + 32) - v25 beginningWithRow:0.0 numberOfRows:v45 extraHitSpaceBetweenRows:a6];
    if (v46 == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v47 = _sectionFooterMinY(a1, v32);
      v62.origin.CGFloat x = a2;
      v62.origin.double y = a3;
      v62.size.CGFloat width = a4;
      v62.size.CGFloat height = a5;
      if (CGRectGetMaxY(v62) >= v47) {
        uint64_t v46 = *(void *)(v32 + 32) - 1;
      }
      else {
        uint64_t v46 = -1;
      }
    }
    if (v25 <= v46)
    {
      uint64_t v48 = v46 + 1;
      do
      {
        CGRect v49 = [MEMORY[0x1E4F28D58] indexPathForRow:v25 inSection:v20];
        [v12 addObject:v49];

        ++v25;
      }
      while (v48 != v25);
    }
    goto LABEL_39;
  }
  uint64_t v25 = [(UISectionRowData *)v23 _rowForPoint:*(void *)(v23 + 32) beginningWithRow:0.0 numberOfRows:v24 extraHitSpaceBetweenRows:a6];
  if (v25 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!*(void *)(v23 + 32))
    {
      if (v22 <= v20) {
        goto LABEL_39;
      }
      uint64_t v32 = *(void *)(*(void *)(a1 + 88) + 8 * v22);
      uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_22;
    }
    double v26 = -[UITableViewRowData offsetForSection:](a1, v23);
    double v27 = *(double *)(v23 + 48);
    -[UISectionRowData headerSize](v23);
    double v29 = v28;
    double v30 = 0.0;
    if (v28 > 0.0) {
      objc_msgSend(*(id *)(a1 + 8), "_sectionHeaderToFirstRowPadding", 0.0);
    }
    CGFloat v31 = v26 + v27 + v29 + v30;
    v58.origin.CGFloat x = a2;
    v58.origin.double y = a3;
    v58.size.CGFloat width = a4;
    v58.size.CGFloat height = a5;
    if (CGRectGetMinY(v58) <= v31) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  uint64_t v32 = *(void *)(*(void *)(a1 + 88) + 8 * v22);
  if (v22 <= v20)
  {
    if (v25 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_39;
    }
    goto LABEL_43;
  }
LABEL_22:
  while ((unint64_t)v25 < *(void *)(v23 + 32))
  {
    CGFloat v33 = [MEMORY[0x1E4F28D58] indexPathForRow:v25 inSection:v20];
    [v12 addObject:v33];

    ++v25;
  }
  uint64_t v34 = v20 + 1;
  if (v34 < v22)
  {
    uint64_t v35 = *(void *)(a1 + 88);
    do
    {
      if (*(void *)(*(void *)(v35 + 8 * v34) + 32))
      {
        unint64_t v36 = 0;
        do
        {
          double v37 = [MEMORY[0x1E4F28D58] indexPathForRow:v36 inSection:v34];
          [v12 addObject:v37];

          ++v36;
          uint64_t v35 = *(void *)(a1 + 88);
        }
        while (v36 < *(void *)(*(void *)(v35 + 8 * v34) + 32));
      }
      ++v34;
    }
    while (v34 != v22);
  }
  v59.origin.CGFloat x = a2;
  v59.origin.double y = a3;
  v59.size.CGFloat width = a4;
  v59.size.CGFloat height = a5;
  double v38 = CGRectGetMaxY(v59);
  if (!v32)
  {
    uint64_t v39 = 0;
LABEL_35:
    uint64_t v41 = 0;
    uint64_t v42 = v39 + 1;
    do
    {
      CGFloat v43 = [MEMORY[0x1E4F28D58] indexPathForRow:v41 inSection:v22];
      [v12 addObject:v43];

      ++v41;
    }
    while (v42 != v41);
    goto LABEL_39;
  }
  uint64_t v39 = [(UISectionRowData *)v32 _rowForPoint:*(void *)(v32 + 32) beginningWithRow:0.0 numberOfRows:v38 extraHitSpaceBetweenRows:a6];
  if (v39 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v40 = _sectionFooterMinY(a1, v32);
    v60.origin.CGFloat x = a2;
    v60.origin.double y = a3;
    v60.size.CGFloat width = a4;
    v60.size.CGFloat height = a5;
    if (CGRectGetMaxY(v60) < v40) {
      goto LABEL_39;
    }
    uint64_t v39 = *(void *)(v32 + 32) - 1;
  }
  if ((v39 & 0x8000000000000000) == 0) {
    goto LABEL_35;
  }
LABEL_39:
  return v12;
}

- (void)dealloc
{
  if (self->_numSections >= 1)
  {
    int64_t v3 = 0;
    do
    {
      sectionRowData = self->_sectionRowData;
      id v5 = sectionRowData[v3];
      sectionRowData[v3] = 0;

      ++v3;
    }
    while (v3 < self->_numSections);
  }
  double v6 = self->_sectionRowData;
  if (v6) {
    free(v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)UITableViewRowData;
  [(UITableViewRowData *)&v7 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draggedIndexPath, 0);
  objc_storeStrong((id *)&self->_reorderedIndexPath, 0);
  objc_storeStrong((id *)&self->_gapIndexPath, 0);
  objc_storeStrong((id *)&self->_headerFooterViewUsedForMeasurements, 0);
}

- (double)maxHeaderTitleWidthForSection:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  if (a2 < 0 || *(void *)(a1 + 64) <= a2)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_maxHeaderTitleWidthForSection_, a1, @"UITableViewRowData.m", 2795, @"request for invalid section (%ld)", a2);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 88) + 8 * a2);
  if (!*(unsigned char *)(v4 + 8))
  {
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](v4, a2, *(void **)(a1 + 8), a1);
    uint64_t v4 = *(void *)(*(void *)(a1 + 88) + 8 * a2);
  }
  if (!*(unsigned char *)(v4 + 9))
  {
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
    uint64_t v4 = *(void *)(*(void *)(a1 + 88) + 8 * a2);
  }
  return *(double *)(v4 + 80);
}

- (uint64_t)headerAlignmentForSection:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (a2 < 0 || *(void *)(result + 64) <= a2)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_headerAlignmentForSection_, v3, @"UITableViewRowData.m", 2781, @"request for invalid section (%ld)", a2);
    }
    uint64_t v4 = *(void *)(*(void *)(v3 + 88) + 8 * a2);
    if (!*(unsigned char *)(v4 + 8))
    {
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](v4, a2, *(void **)(v3 + 8), v3);
      uint64_t v4 = *(void *)(*(void *)(v3 + 88) + 8 * a2);
    }
    if (!*(unsigned char *)(v4 + 9))
    {
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](v3, a2);
      uint64_t v4 = *(void *)(*(void *)(v3 + 88) + 8 * a2);
    }
    return *(void *)(v4 + 64);
  }
  return result;
}

- (double)floatingRectForHeaderInSection:(char)a3 visibleRect:(BOOL *)a4 heightCanBeGuessed:(CGFloat)a5 outIsFloating:(double)a6
{
  if (!a1) {
    return 0.0;
  }
  double v16 = -[UITableViewRowData heightForTableHeaderView](a1);
  double v17 = -0.0;
  if ((*(unsigned char *)(a1 + 128) & 0x10) != 0) {
    double v17 = v16;
  }
  double v18 = a6 + v17;
  double v19 = 0.0;
  if ((*(unsigned char *)(a1 + 128) & 0x10) != 0) {
    double v19 = v16;
  }
  double v20 = a8 - v19;
  int v21 = -[UITableViewRowData hasHeaderForSection:](a1, a2);
  double v22 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](a1, a2, a3);
  double v24 = v23;
  CGFloat v26 = v25;
  CGFloat rect2 = a5;
  CGFloat rect2_8 = v27;
  unint64_t v28 = *(void *)(a1 + 120) - 1;
  CGFloat v52 = v20;
  if (!v21) {
    goto LABEL_8;
  }
  v55.origin.CGFloat x = a5;
  v55.origin.double y = v18;
  v55.size.CGFloat width = a7;
  v55.size.CGFloat height = v20;
  v69.origin.CGFloat x = v22;
  v69.origin.double y = v24;
  v69.size.CGFloat width = v26;
  v69.size.CGFloat height = rect2_8;
  if (CGRectContainsRect(v55, v69))
  {
LABEL_8:
    double v29 = v24;
    if (!a4) {
      return v22;
    }
    goto LABEL_23;
  }
  v56.origin.CGFloat x = v22;
  v56.origin.double y = v24;
  v56.size.CGFloat width = v26;
  v56.size.CGFloat height = rect2_8;
  CGFloat v30 = v22;
  double MinY = CGRectGetMinY(v56);
  v57.origin.CGFloat x = a5;
  v57.origin.double y = v18;
  double rect = a7;
  v57.size.CGFloat width = a7;
  v57.size.CGFloat height = v20;
  double v32 = 0.0;
  BOOL v33 = MinY < CGRectGetMinY(v57);
  double v22 = v30;
  if (v33)
  {
    v58.origin.CGFloat x = a5;
    v58.origin.double y = v18;
    v58.size.CGFloat width = rect;
    v58.size.CGFloat height = v20;
    double v34 = CGRectGetMinY(v58);
    v59.origin.CGFloat x = v30;
    v59.origin.double y = v24;
    v59.size.CGFloat width = v26;
    v59.size.CGFloat height = rect2_8;
    double v32 = v34 - CGRectGetMinY(v59);
  }
  if (v28 > 1)
  {
    double v36 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](a1, a2, a3);
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v50 = v41;
    v62.origin.CGFloat x = v22;
    v62.origin.double y = v24;
    v62.size.CGFloat width = v26;
    v62.size.CGFloat height = rect2_8;
    CGFloat v49 = v32 + CGRectGetMaxY(v62);
    CGFloat v48 = v36;
    v63.origin.CGFloat x = v36;
    v63.origin.double y = v38;
    v63.size.CGFloat width = v40;
    v63.size.CGFloat height = v50;
    if (v49 > CGRectGetMinY(v63))
    {
      v64.origin.CGFloat x = v22;
      v64.origin.double y = v24;
      v64.size.CGFloat width = v26;
      v64.size.CGFloat height = rect2_8;
      double v42 = v32 + CGRectGetMaxY(v64);
      v65.origin.CGFloat x = v48;
      v65.size.CGFloat width = v40;
      v65.origin.double y = v38;
      v65.size.CGFloat height = v50;
      double v32 = v32 - (v42 - CGRectGetMinY(v65));
    }
  }
  else if (a2 + 1 < *(void *)(a1 + 64))
  {
    v60.origin.CGFloat x = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](a1, a2 + 1, 1);
    double v35 = CGRectGetMinY(v60);
    v61.origin.CGFloat x = rect2;
    v61.origin.double y = v18;
    v61.size.CGFloat width = rect;
    v61.size.CGFloat height = v20;
    if (v35 <= CGRectGetMinY(v61)) {
      double v32 = 0.0;
    }
  }
  double v43 = -0.0;
  if (v32 > 0.0) {
    double v43 = v32;
  }
  double v29 = v24 + v43;
  a7 = rect;
  if (a4)
  {
LABEL_23:
    if (v28 > 1)
    {
      *a4 = v24 != v29;
    }
    else
    {
      uint64_t v44 = *(void *)(a1 + 120);
      if (a2 || v44 != 2)
      {
        v66.origin.CGFloat x = v22;
        v66.origin.double y = v29;
        v66.size.CGFloat width = v26;
        v66.size.CGFloat height = rect2_8;
        double v46 = CGRectGetMinY(v66);
        v67.size.CGFloat height = v52;
        v67.origin.CGFloat x = rect2;
        v67.origin.double y = v18;
        v67.size.CGFloat width = a7;
        BOOL v45 = vabdd_f64(v46, CGRectGetMinY(v67)) <= 0.1;
      }
      else
      {
        BOOL v45 = 1;
      }
      *a4 = v45;
      if (v44 == 2 && v45)
      {
        v68.size.CGFloat height = v52;
        v68.origin.CGFloat x = rect2;
        v68.origin.double y = v18;
        v68.size.CGFloat width = a7;
        CGRectGetMinY(v68);
      }
    }
  }
  return v22;
}

- (uint64_t)hasHeaderForSection:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (a2 < 0 || *(void *)(result + 64) <= a2)
    {
      double v6 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_hasHeaderForSection_, v3, @"UITableViewRowData.m", 1847, @"request for invalid section (%ld)", a2);
    }
    uint64_t v4 = *(void *)(*(void *)(v3 + 88) + 8 * a2);
    if (!*(unsigned char *)(v4 + 8)) {
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(void *)(*(void *)(v3 + 88) + 8 * a2), a2, *(void **)(v3 + 8), v3);
    }
    if (!*(unsigned char *)(v4 + 9)) {
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](v3, a2);
    }
    -[UISectionRowData headerSize](v4);
    return v5 > 0.0;
  }
  return result;
}

- (double)rectForTableFooterView
{
  double v1 = 0.0;
  if (a1)
  {
    if ([*(id *)(a1 + 8) _shouldUseNewHeaderFooterBehavior])
    {
      uint64_t v3 = *(void *)(a1 + 64);
      if (v3 < 1) {
        -[UITableViewRowData rectForTableHeaderView](a1);
      }
      else {
        -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](a1, v3 - 1, 1);
      }
      -[UITableViewRowData heightForTableFooterView](a1);
    }
    else
    {
      uint64_t v4 = [*(id *)(a1 + 8) _tableFooterView];
      double v5 = v4;
      if (v4)
      {
        [v4 frame];
        double v1 = v6;
      }
      else
      {
        double v1 = *MEMORY[0x1E4F1DB28];
      }
      uint64_t v7 = *(void *)(a1 + 64);
      if (v7 < 1) {
        -[UITableViewRowData rectForTableHeaderView](a1);
      }
      else {
        -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](a1, v7 - 1, 1);
      }
    }
  }
  return v1;
}

- (void)tableHeaderHeightDidChangeToHeight:(uint64_t)a1
{
  if (a1)
  {
    double v3 = *(double *)(a1 + 96);
    *(double *)(a1 + 96) = a2;
    unint64_t v4 = [*(id *)(a1 + 8) _tableStyle];
    BOOL v5 = v4 > 0x10 || ((1 << v4) & 0x10006) == 0;
    double v6 = v5 ? 0.0 : GroupedTableOffsetFromTop(*(void **)(a1 + 8), (void *)a1);
    *(double *)(a1 + 152) = v6;
    uint64_t v7 = *(void *)(a1 + 64);
    if (v7 >= 1)
    {
      uint64_t v8 = 0;
      double v9 = *(double *)(a1 + 96) - v3;
      int v10 = *(unsigned __int8 *)(a1 + 72);
      do
      {
        if (!v10)
        {
          uint64_t v11 = *(void *)(*(void *)(a1 + 88) + 8 * v8);
          *(double *)(v11 + 16) = v9 + *(double *)(v11 + 16);
        }
        ++v8;
      }
      while (v7 != v8);
    }
  }
}

- (uint64_t)invalidateSection:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = *(void *)(result + 88);
    uint64_t v3 = *(void *)(v2 + 8 * a2);
    if (v3) {
      *(_WORD *)(v3 + 8) = 0;
    }
    uint64_t v4 = *(void *)(result + 64);
    if (a2 + 1 < v4)
    {
      uint64_t v5 = ~a2 + v4;
      uint64_t v6 = v2 + 8 * a2 + 8;
      do
      {
        if (*(void *)v6) {
          *(unsigned char *)(*(void *)v6 + 9) = 0;
        }
        v6 += 8;
        --v5;
      }
      while (v5);
    }
  }
  return result;
}

- (id)targetIndexPathForPoint:(CGFloat)a3 adjustedForGap:(CGFloat)a4
{
  if (!a1
    || (double v8 = *(double *)(a1 + 152), v9 = -[UITableViewRowData heightForTableHeaderView](a1), *(uint64_t *)(a1 + 64) < 1))
  {
LABEL_7:
    double v16 = 0;
    goto LABEL_8;
  }
  uint64_t v10 = 0;
  CGFloat v11 = *MEMORY[0x1E4F1DB28];
  CGFloat v12 = *(double *)(a1 + 24);
  double v13 = v8 + v9;
  while (1)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 88) + 8 * v10);
    double v15 = *(double *)(v14 + 40);
    v35.origin.CGFloat x = v11;
    v35.origin.double y = v13;
    v35.size.CGFloat width = v12;
    v35.size.CGFloat height = v15;
    v33.CGFloat x = a3;
    v33.double y = a4;
    if (CGRectContainsPoint(v35, v33)) {
      break;
    }
    v36.origin.CGFloat x = v11;
    v36.origin.double y = v13;
    v36.size.CGFloat width = v12;
    v36.size.CGFloat height = v15;
    if (CGRectGetMaxY(v36) <= a4)
    {
      double v13 = v13 + v15;
      if (++v10 < *(void *)(a1 + 64)) {
        continue;
      }
    }
    goto LABEL_7;
  }
  CGFloat v18 = v13 + *(double *)(v14 + 48);
  v37.size.CGFloat width = -[UISectionRowData headerSize](v14);
  v37.size.CGFloat height = v19;
  v37.origin.CGFloat x = v11;
  v37.origin.double y = v18;
  v34.CGFloat x = a3;
  v34.double y = a4;
  if (CGRectContainsPoint(v37, v34))
  {
    double v16 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:v10];
    goto LABEL_8;
  }
  uint64_t v20 = *(void *)(v14 + 32);
  if (v20 < 1)
  {
LABEL_22:
    uint64_t v26 = -[UITableViewRowData numberOfRowsInSection:](a1, v10);
    double v27 = -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered]((void *)a1);
    unint64_t v28 = v27;
    if (v27) {
      v26 -= [v27 section] == v10;
    }
  }
  else
  {
    uint64_t v21 = 0;
    while (1)
    {
      double v22 = v13 + -[UISectionRowData offsetForRow:adjustedForGap:](v14, v21, a2);
      float v23 = *(float *)(*(void *)(v14 + 136) + 4 * v21);
      if (v23 < -1.0) {
        float v23 = -v23;
      }
      double v24 = v23;
      v38.origin.CGFloat x = v11;
      v38.origin.double y = v22;
      v38.size.CGFloat width = v12;
      v38.size.CGFloat height = v24;
      if (a4 <= CGRectGetMaxY(v38)) {
        break;
      }
      v39.origin.CGFloat x = v11;
      v39.origin.double y = v22;
      v39.size.CGFloat width = v12;
      v39.size.CGFloat height = v24;
      ++v21;
      if (CGRectGetMaxY(v39) > a4 || v21 >= v20) {
        goto LABEL_22;
      }
    }
    id v29 = *(id *)(a1 + 192);
    unint64_t v28 = v29;
    uint64_t v26 = v21;
    if (v29)
    {
      uint64_t v26 = v21;
      if ([v29 section] == v10)
      {
        if (v21 < [v28 row]) {
          uint64_t v26 = v21;
        }
        else {
          uint64_t v26 = v21 + 1;
        }
      }
    }
    if (v20 - 1 == v21)
    {
      v40.origin.CGFloat x = v11;
      v40.origin.double y = v22;
      v40.size.CGFloat width = v12;
      v40.size.CGFloat height = v24;
      if (a4 >= CGRectGetMaxY(v40) + v24 * -0.2 && (!v28 || [v28 section] != v10))
      {
        CGFloat v30 = (void *)MEMORY[0x1E4F28D58];
        uint64_t v31 = v26 + 1;
        goto LABEL_34;
      }
    }
  }
  CGFloat v30 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v31 = v26;
LABEL_34:
  double v16 = [v30 indexPathForRow:v31 inSection:v10];

LABEL_8:
  return v16;
}

- (uint64_t)dropLocationForPoint:(double)a3 atIndexPath:(CGFloat)a4 withInsets:(double)a5
{
  id v14 = a2;
  double v15 = v14;
  if (a1)
  {
    uint64_t v16 = [v14 section];
    uint64_t v17 = [v15 row];
    if (v16 < *(void *)(a1 + 64))
    {
      unint64_t v18 = v17;
      uint64_t v19 = *(void *)(*(void *)(a1 + 88) + 8 * v16);
      id v20 = *(id *)(a1 + 192);
      uint64_t v21 = v20;
      unint64_t v22 = *(void *)(v19 + 32);
      if (v20)
      {
        if (v16 == [v20 section]) {
          unint64_t v23 = v22 + 1;
        }
        else {
          unint64_t v23 = v22;
        }
        if (v18 >= v23) {
          goto LABEL_19;
        }
        if (v16 == [v21 section]) {
          v18 -= (uint64_t)v18 > [v21 row];
        }
      }
      else if (v18 >= v22)
      {
        goto LABEL_19;
      }
      if (!*(unsigned char *)(v19 + 8)) {
        -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](v19, v16, *(void **)(a1 + 8), a1);
      }
      if (!*(unsigned char *)(v19 + 9)) {
        -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, v16);
      }
      double v24 = -[UITableViewRowData offsetForSection:](a1, v19);
      double v25 = -[UISectionRowData offsetForRow:adjustedForGap:](v19, v18, 1);
      float v26 = *(float *)(*(void *)(v19 + 136) + 4 * v18);
      if (v26 < -1.0) {
        float v26 = -v26;
      }
      double v27 = v24 + v25;
      double v28 = a6 + *MEMORY[0x1E4F1DB28];
      double v29 = a5 + v27;
      double v30 = *(double *)(a1 + 24) - (a6 + a8);
      double v31 = v26 - (a5 + a7);
      v33.origin.CGFloat x = v28;
      v33.origin.double y = v29;
      v33.size.CGFloat width = v30;
      v33.size.CGFloat height = v31;
      if (a4 >= CGRectGetMinY(v33))
      {
        v34.origin.CGFloat x = v28;
        v34.origin.double y = v29;
        v34.size.CGFloat width = v30;
        v34.size.CGFloat height = v31;
        a1 = a4 > CGRectGetMaxY(v34);
        goto LABEL_21;
      }
LABEL_19:
      a1 = -1;
LABEL_21:

      goto LABEL_22;
    }
    a1 = -1;
  }
LABEL_22:

  return a1;
}

- (void)addGapAtIndexPath:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v14 = v4;
    uint64_t v5 = [v4 section];
    uint64_t v6 = v5;
    if (v5 < 0 || v5 >= *(void *)(a1 + 64))
    {
      double v13 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel_addGapAtIndexPath_, a1, @"UITableViewRowData.m", 1522, @"request to add gap at invalid section (%ld)", v6);
    }
    unint64_t v7 = [v14 row];
    double v8 = *(double *)(a1 + 216) + *(double *)(a1 + 144);
    -[UISectionRowData addOffset:fromRow:](*(void *)(*(void *)(a1 + 88) + 8 * v6), v7, v8);
    uint64_t v9 = v6 + 1;
    uint64_t v10 = *(void *)(a1 + 64);
    if (v10 > v6 + 1)
    {
      int v11 = *(unsigned __int8 *)(a1 + 72);
      do
      {
        if (!v11)
        {
          uint64_t v12 = *(void *)(*(void *)(a1 + 88) + 8 * v9);
          *(double *)(v12 + 16) = v8 + *(double *)(v12 + 16);
        }
        ++v9;
      }
      while (v10 != v9);
    }
    [*(id *)(a1 + 8) _coalesceContentSizeUpdateWithDelta:v8];
    objc_storeStrong((id *)(a1 + 176), a2);
    id v4 = v14;
  }
}

- (void)removeGap
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 176);
    if (v2)
    {
      id v13 = v2;
      uint64_t v3 = [v2 section];
      uint64_t v4 = v3;
      if (v3 < 0 || v3 >= *(void *)(a1 + 64))
      {
        uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_removeGap, a1, @"UITableViewRowData.m", 1543, @"request to remove gap at invalid section (%ld)", v4);
      }
      unint64_t v5 = [v13 row];
      double v6 = *(double *)(a1 + 216) + *(double *)(a1 + 144);
      -[UISectionRowData addOffset:fromRow:](*(void *)(*(void *)(a1 + 88) + 8 * v4), v5, -v6);
      uint64_t v7 = v4 + 1;
      uint64_t v8 = *(void *)(a1 + 64);
      if (v8 > v4 + 1)
      {
        int v9 = *(unsigned __int8 *)(a1 + 72);
        do
        {
          if (!v9)
          {
            uint64_t v10 = *(void *)(*(void *)(a1 + 88) + 8 * v7);
            *(double *)(v10 + 16) = *(double *)(v10 + 16) - v6;
          }
          ++v7;
        }
        while (v8 != v7);
      }
      [*(id *)(a1 + 8) _coalesceContentSizeUpdateWithDelta:-v6];
      int v11 = *(void **)(a1 + 176);
      *(void *)(a1 + 176) = 0;

      id v2 = v13;
    }
  }
}

- (void)restoreReorderedRowWithHeight:(double)a3 atIndexPath:
{
  id v5 = a2;
  if (a1)
  {
    id v15 = v5;
    uint64_t v6 = [v5 section];
    uint64_t v7 = v6;
    if (v6 < 0 || v6 >= *(void *)(a1 + 64))
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel_restoreReorderedRowWithHeight_atIndexPath_, a1, @"UITableViewRowData.m", 1564, @"request to restore reordered row in invalid section (%ld)", v7);
    }
    -[UISectionRowData insertRowAtIndex:inSection:rowHeight:tableViewRowData:](*(void *)(*(void *)(a1 + 88) + 8 * v7), [v15 row], v7, a1, a3);
    double v8 = *(double *)(a1 + 144) + a3;
    uint64_t v9 = *(void *)(a1 + 64);
    if (v9 > v7 + 1)
    {
      int v10 = *(unsigned __int8 *)(a1 + 72);
      uint64_t v11 = ~v7 + v9;
      uint64_t v12 = *(void *)(a1 + 88) + 8 * v7 + 8;
      do
      {
        uint64_t v13 = *(void *)v12;
        ++*(void *)(*(void *)v12 + 24);
        if (!v10) {
          *(double *)(v13 + 16) = v8 + *(double *)(v13 + 16);
        }
        v12 += 8;
        --v11;
      }
      while (v11);
    }
    [*(id *)(a1 + 8) _coalesceContentSizeUpdateWithDelta:v8];
    id v5 = v15;
  }
}

- (double)removeReorderedRowWithHeight:(double)a3 atIndexPath:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    uint64_t v7 = [v5 section];
    uint64_t v8 = v7;
    if (v7 < 0 || v7 >= *(void *)(a1 + 64))
    {
      id v20 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel_removeReorderedRowWithHeight_atIndexPath_, a1, @"UITableViewRowData.m", 1576, @"request to remove reordered row in invalid section (%ld)", v8);
    }
    uint64_t v9 = [v6 row];
    uint64_t v11 = *(void *)(a1 + 88);
    uint64_t v12 = *(void *)(v11 + 8 * v8);
    if (a3 == 0.0)
    {
      double v10 = -[UISectionRowData heightForRow:inSection:canGuess:](*(void *)(v11 + 8 * v8), v9, v8, 0);
      a3 = v10;
    }
    [(UISectionRowData *)v12 deleteRowAtIndex:v10];
    double v13 = a3 + *(double *)(a1 + 144);
    uint64_t v14 = *(void *)(a1 + 64);
    if (v14 > v8 + 1)
    {
      int v15 = *(unsigned __int8 *)(a1 + 72);
      uint64_t v16 = ~v8 + v14;
      uint64_t v17 = *(void *)(a1 + 88) + 8 * v8 + 8;
      do
      {
        uint64_t v18 = *(void *)v17;
        --*(void *)(*(void *)v17 + 24);
        if (!v15) {
          *(double *)(v18 + 16) = *(double *)(v18 + 16) - v13;
        }
        v17 += 8;
        --v16;
      }
      while (v16);
    }
    [*(id *)(a1 + 8) _coalesceContentSizeUpdateWithDelta:-v13];
  }
  else
  {
    a3 = 0.0;
  }

  return a3;
}

- (void)setReorderedIndexPath:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    uint64_t v6 = *(void *)(a1 + 192);
    if (has_internal_diagnostics)
    {
      if (v6)
      {
        double v10 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Cannot set a reorderedIndexPath on the row data while a draggedIndexPath is already set.", buf, 2u);
        }
      }
    }
    else if (v6)
    {
      uint64_t v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setReorderedIndexPath____s_category) + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Cannot set a reorderedIndexPath on the row data while a draggedIndexPath is already set.", v12, 2u);
      }
    }
    id v7 = *(id *)(a1 + 184);
    if (v7 != v4)
    {
      if (v7) {
        -[UITableViewRowData restoreReorderedRowWithHeight:atIndexPath:](a1, v7, *(double *)(a1 + 216));
      }
      objc_storeStrong((id *)(a1 + 184), a2);
      uint64_t v8 = *(void **)(a1 + 184);
      if (v8) {
        double v9 = -[UITableViewRowData removeReorderedRowWithHeight:atIndexPath:](a1, v8, *(double *)(a1 + 216));
      }
      else {
        double v9 = 0.0;
      }
      *(double *)(a1 + 216) = v9;
    }
  }
}

- (void)moveRowAtIndexPathFrom:(void *)a3 toIndexPath:
{
  id v20 = a2;
  id v5 = a3;
  if (a1 && ([v20 isEqual:v5] & 1) == 0)
  {
    uint64_t v6 = [v20 row];
    uint64_t v7 = [v20 section];
    uint64_t v8 = [v5 row];
    uint64_t v9 = [v5 section];
    double v10 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](a1, v6, v7, 1, 1);
    [(UISectionRowData *)*(void *)(*(void *)(a1 + 88) + 8 * v7) deleteRowAtIndex:v10];
    -[UISectionRowData insertRowAtIndex:inSection:rowHeight:tableViewRowData:](*(void *)(*(void *)(a1 + 88) + 8 * v9), v8, v9, a1, v10);
    double v11 = v10 + *(double *)(a1 + 144);
    if (v7 <= v9)
    {
      if (v9 > v7)
      {
        uint64_t v16 = v7 + 1;
        uint64_t v17 = *(void *)(a1 + 88);
        int v18 = *(unsigned __int8 *)(a1 + 72);
        do
        {
          uint64_t v19 = *(void *)(v17 + 8 * v16);
          --*(void *)(v19 + 24);
          if (!v18) {
            *(double *)(v19 + 16) = *(double *)(v19 + 16) - v11;
          }
          ++v16;
        }
        while (v16 < v9 + 1);
      }
    }
    else
    {
      uint64_t v12 = v9 + 1;
      uint64_t v13 = *(void *)(a1 + 88);
      int v14 = *(unsigned __int8 *)(a1 + 72);
      do
      {
        uint64_t v15 = *(void *)(v13 + 8 * v12);
        ++*(void *)(v15 + 24);
        if (!v14) {
          *(double *)(v15 + 16) = v11 + *(double *)(v15 + 16);
        }
        ++v12;
      }
      while (v12 < v7 + 1);
    }
  }
}

- (void)setDraggedIndexPath:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v5 = *(id *)(a1 + 192);
    if (v5 != v4)
    {
      id v8 = v4;
      if (v5) {
        -[UITableViewRowData restoreReorderedRowWithHeight:atIndexPath:](a1, v5, *(double *)(a1 + 224));
      }
      objc_storeStrong((id *)(a1 + 192), a2);
      uint64_t v6 = *(void **)(a1 + 192);
      if (v6) {
        double v7 = -[UITableViewRowData removeReorderedRowWithHeight:atIndexPath:](a1, v6, *(double *)(a1 + 224));
      }
      else {
        double v7 = 0.0;
      }
      id v4 = v8;
      *(double *)(a1 + 224) = v7;
    }
  }
}

- (void)addDropTargetGapAtIndexPath:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v17 = v3;
    if (!v3)
    {
      int v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:sel_addDropTargetGapAtIndexPath_, a1, @"UITableViewRowData.m", 1729, @"Invalid parameter not satisfying: %@", @"indexPath != nil" object file lineNumber description];
    }
    if (*(void *)(a1 + 176))
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:sel_addDropTargetGapAtIndexPath_ object:a1 file:@"UITableViewRowData.m" lineNumber:1730 description:@"UITableView internal inconsistency: attempted to add a drop target gap when one already exists"];
    }
    id v4 = v17;
    if (!v17)
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:sel__dropTargetGapHeightForIndexPath_, a1, @"UITableViewRowData.m", 1687, @"Invalid parameter not satisfying: %@", @"indexPath != nil" object file lineNumber description];
    }
    if (*(void *)(a1 + 192))
    {
      uint64_t v5 = *(void *)(a1 + 224);
LABEL_22:

      *(void *)(a1 + 216) = v5;
      -[UITableViewRowData addGapAtIndexPath:](a1, v4);
      id v3 = v17;
      goto LABEL_23;
    }
    uint64_t v6 = [v4 section];
    uint64_t v7 = [v4 row];
    if (v6 >= *(void *)(a1 + 64)) {
      goto LABEL_16;
    }
    uint64_t v8 = v7;
    uint64_t v9 = -[UITableViewRowData numberOfRowsInSection:](a1, v6);
    if (v9 < 1) {
      goto LABEL_16;
    }
    if (v8 >= v9)
    {
      if (v8 != v9) {
        goto LABEL_16;
      }
      --v8;
    }
    double v10 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](a1, v8, v6, 1, 1);
    if (v10 != 0.0)
    {
LABEL_20:
      uint64_t v5 = *(void *)&v10;
      goto LABEL_22;
    }
LABEL_16:
    [*(id *)(a1 + 8) rowHeight];
    double v11 = *(void **)(a1 + 8);
    if (v12 <= 0.0)
    {
      [v11 estimatedRowHeight];
      if (v13 <= 0.0)
      {
        uint64_t v5 = 0x4046000000000000;
        goto LABEL_22;
      }
      [*(id *)(a1 + 8) estimatedRowHeight];
    }
    else
    {
      [v11 rowHeight];
    }
    goto LABEL_20;
  }
LABEL_23:
}

- (void)moveDropTargetGapToIndexPath:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (!v3)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:sel_moveDropTargetGapToIndexPath_, a1, @"UITableViewRowData.m", 1739, @"Invalid parameter not satisfying: %@", @"indexPath != nil" object file lineNumber description];

      id v3 = 0;
    }
    id v4 = *(id *)(a1 + 176);
    if (!v4)
    {
      id v8 = v3;
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel_moveDropTargetGapToIndexPath_ object:a1 file:@"UITableViewRowData.m" lineNumber:1740 description:@"UITableView internal inconsistency: attempted to move a drop target gap without one being added first"];

      id v3 = v8;
      id v4 = *(id *)(a1 + 176);
    }
    if (v4 != v3)
    {
      id v7 = v3;
      -[UITableViewRowData removeGap](a1);
      *(void *)(a1 + 216) = 0;
      -[UITableViewRowData addDropTargetGapAtIndexPath:](a1, v7);
      id v3 = v7;
    }
  }
}

- (double)heightForSection:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  if (a2 < 0 || *(void *)(a1 + 64) <= a2)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_heightForSection_, a1, @"UITableViewRowData.m", 1913, @"request for invalid section (%ld)", a2);
  }
  id v4 = *(id *)(*(void *)(a1 + 88) + 8 * a2);
  id v5 = v4;
  if (!v4[8]) {
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:]((uint64_t)v4, a2, *(void **)(a1 + 8), a1);
  }
  if (!*((unsigned char *)v5 + 9)) {
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
  }
  double v6 = *((double *)v5 + 5);

  return v6;
}

- (id)_indexPathsBelowIndexPath:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_opt_new();
    id v5 = v3;
    if ([v5 section] == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v6 = v5;
    }
    else
    {
      do
      {
        [v4 addObject:v5];
        double v6 = -[UITableViewRowData _nextIndexPathOrSectionHeader:](a1, v5);

        id v5 = v6;
      }
      while ([v6 section] != 0x7FFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_nextIndexPathOrSectionHeader:(uint64_t)a1
{
  uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if ([a2 section] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([a2 row] != 0x7FFFFFFFFFFFFFFFLL
      || -[UITableViewRowData numberOfRowsInSection:](a1, [a2 section]) < 1
      || (v5 = [a2 section], uint64_t v4 = 0, v5 == 0x7FFFFFFFFFFFFFFFLL))
    {
      if ([a2 row] == 0x7FFFFFFFFFFFFFFFLL
        || (uint64_t v6 = [a2 row],
            v6 >= -[UITableViewRowData numberOfRowsInSection:](a1, [a2 section]) - 1))
      {
        if ([a2 section] >= *(void *)(a1 + 64) - 1)
        {
          uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          uint64_t v5 = [a2 section] + 1;
          if (-[UITableViewRowData numberOfRowsInSection:](a1, v5) > 0) {
            uint64_t v4 = 0;
          }
        }
      }
      else
      {
        uint64_t v5 = [a2 section];
        uint64_t v4 = [a2 row] + 1;
      }
    }
  }
  id v7 = [MEMORY[0x1E4F28D58] indexPathForRow:v4 inSection:v5];
  return v7;
}

- (void)setHeight:(double)a3 forHeaderInSection:
{
  if (a1)
  {
    if (*(void *)(a1 + 64) <= a2)
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel_setHeight_forHeaderInSection_, a1, @"UITableViewRowData.m", 1990, @"attempt to set height for header in section %ld when there are only %ld sections in the table", a2, *(void *)(a1 + 64));
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 88) + 8 * a2);
    if (!*(unsigned char *)(v6 + 8)) {
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(void *)(*(void *)(a1 + 88) + 8 * a2), a2, *(void **)(a1 + 8), a1);
    }
    if (!*(unsigned char *)(v6 + 9)) {
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
    }
    -[UISectionRowData headerSize](v6);
    float v8 = v7;
    *(float *)&double v7 = a3;
    float v9 = *(float *)&v7 - v8;
    if (v9 < 0.0) {
      float v9 = -v9;
    }
    if (v9 > 0.00000011921)
    {
      double v10 = fmax(a3, 0.00000011920929);
      double v11 = *(double *)(v6 + 112);
      if (v11 < -1.0) {
        double v11 = -v11;
      }
      float v12 = v11;
      double v13 = v10 - v12;
      *(double *)(v6 + 112) = v10;
      uint64_t v14 = *(void *)(v6 + 32);
      if (*(unsigned char *)(*(void *)(v6 + 96) + 72))
      {
        if (v14) {
          memset_pattern16(*(void **)(v6 + 144), &xmmword_186B93620, 8 * v14);
        }
      }
      else if (v14)
      {
        uint64_t v15 = *(double **)(v6 + 144);
        do
        {
          *uint64_t v15 = v13 + *v15;
          ++v15;
          --v14;
        }
        while (v14);
      }
      -[UISectionRowData updateSectionHeightWithDelta:section:updateFooterOffset:](v6, a2, 1, v13);
    }
  }
}

- (void)setHeight:(double)a3 forFooterInSection:
{
  if (a1)
  {
    if (*(void *)(a1 + 64) <= a2)
    {
      double v13 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel_setHeight_forFooterInSection_, a1, @"UITableViewRowData.m", 2003, @"attempt to set height for footer in section %ld when there are only %ld sections in the table", a2, *(void *)(a1 + 64));
    }
    uint64_t v6 = *(void *)(*(void *)(a1 + 88) + 8 * a2);
    if (!*(unsigned char *)(v6 + 8)) {
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(void *)(*(void *)(a1 + 88) + 8 * a2), a2, *(void **)(a1 + 8), a1);
    }
    if (!*(unsigned char *)(v6 + 9)) {
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
    }
    double v7 = *(double *)(v6 + 120);
    if (v7 < -1.0) {
      double v7 = -v7;
    }
    float v8 = v7;
    float v9 = a3;
    float v10 = v9 - v8;
    if (v10 < 0.0) {
      float v10 = -v10;
    }
    if (v10 > 0.00000011921)
    {
      double v11 = fmax(a3, 0.00000011920929);
      double v12 = v11 - v8;
      *(double *)(v6 + 120) = v11;
      -[UISectionRowData updateSectionHeightWithDelta:section:updateFooterOffset:](v6, a2, 0, v12);
    }
  }
}

+ (int)sectionLocationForRow:(int64_t)a3 inSection:(int64_t)a4 numRows:(unint64_t)a5 gapIndexPath:(id)a6 rowSpacing:(double)a7
{
  return +[UISectionRowData sectionLocationForRow:inSection:numRows:gapIndexPath:rowSpacing:](a7, (uint64_t)UISectionRowData, a3, a4, a5, a6);
}

- (uint64_t)sectionLocationForReorderedRow:(uint64_t)a3 inSection:
{
  if (result)
  {
    uint64_t v5 = result;
    if (a3 < 0 || *(void *)(result + 64) <= a3)
    {
      float v8 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_sectionLocationForReorderedRow_inSection_, v5, @"UITableViewRowData.m", 2048, @"request for invalid section (%ld)", a3);
    }
    uint64_t v6 = *(void *)(*(void *)(v5 + 88) + 8 * a3);
    if (!*(unsigned char *)(v6 + 8)) {
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(void *)(*(void *)(v5 + 88) + 8 * a3), a3, *(void **)(v5 + 8), v5);
    }
    if (!*(unsigned char *)(v6 + 9)) {
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](v5, a3);
    }
    uint64_t v7 = *(void *)(v6 + 32);
    if (a2)
    {
      if (v7 == a2) {
        return 3;
      }
      else {
        return 1;
      }
    }
    else if (v7)
    {
      return 2;
    }
    else
    {
      return 4;
    }
  }
  return result;
}

- (double)offsetForHeaderInSection:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  if (a2 < 0 || *(void *)(a1 + 64) <= a2)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_offsetForHeaderInSection_, a1, @"UITableViewRowData.m", 2169, @"request for offset of header in invalid section (%ld)", a2);
  }
  return *(double *)(*(void *)(*(void *)(a1 + 88) + 8 * a2) + 48);
}

- (double)floatingRectForFooterInSection:(char)a3 visibleRect:(BOOL *)a4 heightCanBeGuessed:(CGFloat)a5 outIsFloating:(CGFloat)a6
{
  if (!a1) {
    return 0.0;
  }
  if (a2 < 0 || *(void *)(a1 + 64) <= a2)
  {
    CGFloat v48 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", sel_hasFooterForSection_, a1, @"UITableViewRowData.m", 1855, @"request for invalid section (%ld)", a2);
  }
  uint64_t v16 = *(void *)(*(void *)(a1 + 88) + 8 * a2);
  if (!*(unsigned char *)(v16 + 8)) {
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(void *)(*(void *)(a1 + 88) + 8 * a2), a2, *(void **)(a1 + 8), a1);
  }
  CGFloat v54 = a5;
  if (!*(unsigned char *)(v16 + 9)) {
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
  }
  double v17 = *(double *)(v16 + 120);
  if (v17 >= -1.0) {
    double v18 = *(double *)(v16 + 120);
  }
  else {
    double v18 = -v17;
  }
  double v20 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](a1, a2, a3);
  double v21 = v19;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  unint64_t v26 = *(void *)(a1 + 120) - 1;
  CGFloat v53 = a6;
  if (v18 <= 0.0)
  {
    CGFloat v32 = a7;
    CGFloat v33 = a8;
    double v34 = v19;
    if (!a4) {
      return v20;
    }
    goto LABEL_27;
  }
  v55.origin.CGFloat x = a5;
  v55.origin.double y = a6;
  v55.size.CGFloat width = a7;
  v55.size.CGFloat height = a8;
  double v27 = v20;
  CGFloat v28 = a8;
  CGFloat v29 = v21;
  CGFloat v30 = v23;
  CGFloat v31 = v25;
  if (CGRectContainsRect(v55, *(CGRect *)(&v21 - 1)))
  {
    CGFloat v32 = a7;
    CGFloat v33 = v28;
    double v34 = v29;
    double v21 = v29;
    if (!a4) {
      return v20;
    }
    goto LABEL_27;
  }
  v56.origin.CGFloat x = v20;
  double rect = v29;
  v56.origin.double y = v29;
  v56.size.CGFloat width = v23;
  v56.size.CGFloat height = v25;
  double MaxY = CGRectGetMaxY(v56);
  v57.origin.CGFloat x = a5;
  v57.origin.double y = a6;
  CGFloat v32 = a7;
  v57.size.CGFloat width = a7;
  CGFloat v33 = v28;
  v57.size.CGFloat height = v28;
  double v36 = 0.0;
  if (MaxY > CGRectGetMaxY(v57))
  {
    v58.origin.CGFloat x = v20;
    v58.origin.double y = rect;
    v58.size.CGFloat width = v23;
    v58.size.CGFloat height = v25;
    double v37 = CGRectGetMaxY(v58);
    v59.origin.double y = v53;
    v59.origin.CGFloat x = a5;
    v59.size.CGFloat width = v32;
    v59.size.CGFloat height = v33;
    double v36 = v37 - CGRectGetMaxY(v59);
  }
  if (v26 > 1)
  {
    double v39 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](a1, a2, a3);
    CGFloat v50 = v41;
    CGFloat v51 = v40;
    CGFloat v43 = v42;
    v62.origin.CGFloat x = v20;
    v62.origin.double y = rect;
    v62.size.CGFloat width = v23;
    v62.size.CGFloat height = v25;
    CGFloat v49 = CGRectGetMinY(v62) - v36;
    v63.origin.CGFloat x = v39;
    v63.origin.double y = v51;
    v63.size.CGFloat width = v43;
    v63.size.CGFloat height = v50;
    if (v49 < CGRectGetMaxY(v63))
    {
      v64.size.CGFloat width = v43;
      v64.origin.CGFloat x = v39;
      v64.origin.double y = v51;
      v64.size.CGFloat height = v50;
      double v44 = CGRectGetMaxY(v64);
      v65.origin.CGFloat x = v20;
      v65.origin.double y = rect;
      v65.size.CGFloat width = v23;
      v65.size.CGFloat height = v25;
      double v36 = v36 - (v44 - (CGRectGetMinY(v65) - v36));
    }
  }
  else if (a2 >= 1)
  {
    v60.origin.CGFloat x = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](a1, a2 - 1, a3);
    double v38 = CGRectGetMaxY(v60);
    v61.origin.double y = v53;
    v61.origin.CGFloat x = a5;
    v61.size.CGFloat width = v32;
    v61.size.CGFloat height = v33;
    if (v38 >= CGRectGetMaxY(v61)) {
      double v36 = 0.0;
    }
  }
  double v21 = rect;
  double v34 = rect - fmax(v36, 0.0);
  if (a4)
  {
LABEL_27:
    if (v26 > 1)
    {
      BOOL v46 = v21 != v34;
    }
    else
    {
      v66.origin.CGFloat x = v20;
      v66.origin.double y = v34;
      v66.size.CGFloat width = v23;
      v66.size.CGFloat height = v25;
      double v45 = CGRectGetMaxY(v66);
      v67.origin.double y = v53;
      v67.origin.CGFloat x = v54;
      v67.size.CGFloat width = v32;
      v67.size.CGFloat height = v33;
      BOOL v46 = vabdd_f64(v45, CGRectGetMaxY(v67)) <= 0.1;
    }
    *a4 = v46;
  }
  return v20;
}

- (uint64_t)footerAlignmentForSection:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (a2 < 0 || *(void *)(result + 64) <= a2)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_footerAlignmentForSection_, v3, @"UITableViewRowData.m", 2788, @"request for invalid section (%ld)", a2);
    }
    uint64_t v4 = *(void *)(*(void *)(v3 + 88) + 8 * a2);
    if (!*(unsigned char *)(v4 + 8))
    {
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](v4, a2, *(void **)(v3 + 8), v3);
      uint64_t v4 = *(void *)(*(void *)(v3 + 88) + 8 * a2);
    }
    if (!*(unsigned char *)(v4 + 9))
    {
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](v3, a2);
      uint64_t v4 = *(void *)(*(void *)(v3 + 88) + 8 * a2);
    }
    return *(void *)(v4 + 72);
  }
  return result;
}

- (double)maxFooterTitleWidthForSection:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  if (a2 < 0 || *(void *)(a1 + 64) <= a2)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_maxFooterTitleWidthForSection_, a1, @"UITableViewRowData.m", 2802, @"request for invalid section (%ld)", a2);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 88) + 8 * a2);
  if (!*(unsigned char *)(v4 + 8))
  {
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](v4, a2, *(void **)(a1 + 8), a1);
    uint64_t v4 = *(void *)(*(void *)(a1 + 88) + 8 * a2);
  }
  if (!*(unsigned char *)(v4 + 9))
  {
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
    uint64_t v4 = *(void *)(*(void *)(a1 + 88) + 8 * a2);
  }
  return *(double *)(v4 + 88);
}

- (uint64_t)ensureHeightsFaultedInForScrollToIndexPath:(double)a3 boundsHeight:
{
  if (result)
  {
    uint64_t v5 = result;
    if ([a2 section] == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v46 = [MEMORY[0x1E4F28B00] currentHandler];
      [v46 handleFailureInMethod:sel__assertValidIndexPath_allowEmptySection_ object:v5 file:@"UITableViewRowData.m" lineNumber:2904 description:@"Invalid indexPath"];
    }
    if ([a2 section] < 0 || objc_msgSend(a2, "section") >= *(void *)(v5 + 64))
    {
      double v45 = [MEMORY[0x1E4F28B00] currentHandler];
      [v45 handleFailureInMethod:sel__assertValidIndexPath_allowEmptySection_ object:v5 file:@"UITableViewRowData.m" lineNumber:2905 description:@"Invalid indexPath"];
    }
    if ([a2 row] != 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([a2 row] < 0
        || (uint64_t v6 = [a2 row],
            v6 >= -[UITableViewRowData numberOfRowsInSection:](v5, [a2 section])))
      {
        uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
        [v7 handleFailureInMethod:sel__assertValidIndexPath_allowEmptySection_ object:v5 file:@"UITableViewRowData.m" lineNumber:2908 description:@"Invalid indexPath"];
      }
    }
    result = [*(id *)(v5 + 8) _estimatesHeights];
    if (result)
    {
      if ([a2 row] == 0x7FFFFFFFFFFFFFFFLL) {
        double v8 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](v5, [a2 section], 0);
      }
      else {
        double v8 = -[UITableViewRowData rectForRow:inSection:heightCanBeGuessed:](v5, [a2 row], objc_msgSend(a2, "section"), 0);
      }
      CGFloat v12 = v8;
      CGFloat v13 = v9;
      CGFloat v14 = v10;
      CGFloat v15 = v11;
      double MinY = CGRectGetMinY(*(CGRect *)&v8);
      v47.origin.CGFloat x = v12;
      v47.origin.double y = v13;
      v47.size.CGFloat width = v14;
      v47.size.CGFloat height = v15;
      double MaxY = CGRectGetMaxY(v47);
      double v18 = MaxY - a3;
      double v19 = MinY + a3;
      id v20 = a2;
      double v21 = v20;
      id v22 = 0;
      if (MaxY >= MinY + a3)
      {
        CGFloat v23 = v20;
      }
      else
      {
        CGFloat v23 = v20;
        do
        {
          double v24 = v22;
          id v22 = v23;

          CGFloat v23 = -[UITableViewRowData _nextIndexPathOrSectionHeader:](v5, v22);

          if ([v23 section] == 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
          uint64_t v25 = [v23 section];
          if (v25 != [v22 section])
          {
            unint64_t v26 = (double *)*(id *)(*(void *)(v5 + 88) + 8 * [v23 section]);
            double v27 = -[UITableViewRowData heightForHeaderInSection:canGuess:](v5, [v23 section], 0);
            if (v26)
            {
              double v28 = v26[14];
              if (v28 < -1.0) {
                double v28 = -v28;
              }
              double v29 = v26[6] + v28;
              if (v28 > 0.0)
              {
                [*(id *)(*((void *)v26 + 12) + 8) _sectionHeaderToFirstRowPadding];
                double v29 = v29 + v30;
              }
            }
            else
            {
              double v29 = 0.0;
            }
            double MaxY = MaxY + v27 + v29;
          }
          if ([v23 row] != 0x7FFFFFFFFFFFFFFFLL) {
            double MaxY = MaxY
          }
                 + -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v5, [v23 row], objc_msgSend(v23, "section"), 0, 1)+ *(double *)(v5 + 144);
          uint64_t v31 = [v23 row];
          if (v31 == -[UITableViewRowData numberOfRowsInSection:](v5, [v23 section]) - 1
            || [v23 row] == 0x7FFFFFFFFFFFFFFFLL)
          {
            double MaxY = MaxY + -[UITableViewRowData heightForFooterInSection:canGuess:](v5, [v23 section], 0);
          }
        }
        while (MaxY < v19);
      }
      id v32 = v21;

      if (MinY > v18)
      {
        while (1)
        {
          CGFloat v33 = v22;
          id v22 = v32;

          uint64_t v34 = [v22 section];
          uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
          if (v34 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_43;
          }
          if (objc_msgSend(v22, "row", 0x7FFFFFFFFFFFFFFFLL) != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v22, "row")) {
            break;
          }
          if ([v22 section] >= 1)
          {
            uint64_t v35 = [v22 section] - 1;
            if (-[UITableViewRowData numberOfRowsInSection:](v5, v35) >= 1)
            {
              uint64_t v37 = -[UITableViewRowData numberOfRowsInSection:](v5, v35);
              goto LABEL_41;
            }
          }
          uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_43:
          id v32 = [MEMORY[0x1E4F28D58] indexPathForRow:v36 inSection:v35];

          if ([v32 section] != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v38 = [v32 section];
            if (v38 != [v22 section]) {
              double MinY = MinY
            }
                   - -[UITableViewRowData heightForFooterInSection:canGuess:](v5, [v32 section], 0);
            if ([v32 row] != 0x7FFFFFFFFFFFFFFFLL)
            {
              double v39 = MinY - *(double *)(v5 + 144);
              double MinY = v39
                   - -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v5, [v32 row], objc_msgSend(v32, "section"), 0, 1);
            }
            if (![v32 row] || objc_msgSend(v32, "row") == 0x7FFFFFFFFFFFFFFFLL)
            {
              double v40 = (double *)*(id *)(*(void *)(v5 + 88) + 8 * [v32 section]);
              double v41 = v40;
              if (v40)
              {
                double v42 = v40[14];
                if (v42 < -1.0) {
                  double v42 = -v42;
                }
                double v43 = v40[6] + v42;
                if (v42 > 0.0)
                {
                  [*(id *)(*((void *)v40 + 12) + 8) _sectionHeaderToFirstRowPadding];
                  double v43 = v43 + v44;
                }
              }
              else
              {
                double v43 = 0.0;
              }
              double MinY = MinY
                   - v43
                   - -[UITableViewRowData heightForHeaderInSection:canGuess:](v5, [v32 section], 0);
            }
            if (MinY > v18) {
              continue;
            }
          }
          goto LABEL_59;
        }
        uint64_t v35 = [v22 section];
        uint64_t v37 = [v22 row];
LABEL_41:
        uint64_t v36 = v37 - 1;
        goto LABEL_43;
      }
LABEL_59:

      return 1;
    }
  }
  return result;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithString:@"{\n"];
  if (self->_numSections)
  {
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = NSString;
      uint64_t v6 = [self->_sectionRowData[v4] description];
      uint64_t v7 = [v5 stringWithFormat:@"%@", v6];
      [v3 appendString:v7];

      unint64_t numSections = self->_numSections;
      if (v4 < numSections - 1)
      {
        [v3 appendString:@", \n"];
        unint64_t numSections = self->_numSections;
      }
      ++v4;
    }
    while (v4 < numSections);
  }
  [v3 appendString:@"\n}"];
  double v9 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)UITableViewRowData;
  double v10 = [(UITableViewRowData *)&v13 description];
  objc_msgSend(v9, "stringWithFormat:", @"%@ num sections: %ld; capacity: %ld; minimum row height: %g; table view width: %g; table header height: %g; table footer height: %g; table top padding: %g; table bottom padding: %g; reordered index path: %@; dragged index path: %@; gap row height: %g; dragged row height: %g; section data: %@",
    v10,
    self->_numSections,
    self->_sectionRowDataCapacity,
    *(void *)&self->_minimumRowHeight,
    *(void *)&self->_tableViewWidth,
    *(void *)&self->_tableHeaderHeight,
    *(void *)&self->_tableFooterHeight,
    *(void *)&self->_tableTopPadding,
    *(void *)&self->_tableBottomPadding,
    self->_reorderedIndexPath,
    self->_draggedIndexPath,
    *(void *)&self->_gapRowHeight,
    *(void *)&self->_draggedRowHeight,
  double v11 = v3);

  return v11;
}

@end
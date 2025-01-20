@interface __NSTextSelectionLineFragmentInfo
- (BOOL)isMonotonicDirection;
- (BOOL)location:(id)a3 isLeading:(BOOL *)a4 trailing:(BOOL *)a5 inTextRanges:(id)a6;
- (NSTextRange)textRange;
- (NSTextSelectionNavigation)textSelectionNavigation;
- (__NSTextSelectionLineFragmentInfo)initWithTextSelectionNavigation:(id)a3 range:(id)a4;
- (const)caretPositionAtIndex:(int64_t)a3;
- (const)caretPositionClosestToLocation:(id)a3 visualDirection:(int64_t)a4 matchLocation:(BOOL *)a5;
- (const)caretPositionClosestToOffset:(double)a3;
- (const)logicalFirstCaret;
- (const)logicalLastCaret;
- (double)offsetForLocation:(id)a3;
- (id)_findNextCaretLocationForLocation:(id)a3;
- (id)_locationForEdgeCaretAtIndex:(unint64_t)a3 leftEdge:(BOOL)a4;
- (id)_secondaryLocationTable;
- (id)_sortedLocations;
- (id)description;
- (id)rangesBetweenStartingOffset:(double)a3 endOffset:(double)a4 continuous:(BOOL)a5;
- (id)textRangeOfCharacterAtOffset:(double)a3 fractionOfDistanceThroughGlyph:(double *)a4;
- (int64_t)_baseWritingDirection;
- (int64_t)_sortedLocationIndexForLocation:(id)a3;
- (int64_t)caretIndexForEdgeLocationInTextRanges:(id)a3 leftEdge:(BOOL)a4;
- (int64_t)caretIndexForLocation:(id)a3 inTextRanges:(id)a4 secondaryCaretIndex:(int64_t *)a5;
- (int64_t)caretIndexForPrimaryLocation:(id)a3;
- (int64_t)caretIndexForSecondaryLocation:(id)a3;
- (int64_t)numberOfCaretPositions;
- (void)_cache;
- (void)_computeVisualDirection;
- (void)_fetchCaretOffsets;
- (void)_invalidateSortedLocations;
- (void)_resolveTrailingEdges;
- (void)dealloc;
@end

@implementation __NSTextSelectionLineFragmentInfo

- (NSTextRange)textRange
{
  return (NSTextRange *)objc_getProperty(self, a2, 16, 1);
}

- (__NSTextSelectionLineFragmentInfo)initWithTextSelectionNavigation:(id)a3 range:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)__NSTextSelectionLineFragmentInfo;
  v6 = [(__NSTextSelectionLineFragmentInfo *)&v9 init];
  if (v6)
  {
    unint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "textSelectionDataSource"), "offsetFromLocation:toLocation:", objc_msgSend(a4, "location"), objc_msgSend(a4, "endLocation"));
    v6->_offset = v7;
    if (v7 < 0x7FFFFFFFFFFFFFFFLL)
    {
      v6->_offset = v7 + 1;
      v6->_navigation = (NSTextSelectionNavigation *)a3;
      v6->_textRange = (NSTextRange *)a4;
      v6->_visualDirection = -1;
      v6->_baseDirection = -1;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (double)offsetForLocation:(id)a3
{
  int64_t v4 = [(__NSTextSelectionLineFragmentInfo *)self caretIndexForPrimaryLocation:a3];
  double v5 = -1.0;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = [(__NSTextSelectionLineFragmentInfo *)self caretPositionAtIndex:v4];
    if (v6) {
      return v6->var0;
    }
  }
  return v5;
}

- (int64_t)caretIndexForPrimaryLocation:(id)a3
{
  [(__NSTextSelectionLineFragmentInfo *)self _cache];
  id v5 = [(NSMapTable *)self->_primaryLocationTable objectForKey:a3];
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return [v5 integerValue];
}

- (const)caretPositionAtIndex:(int64_t)a3
{
  if (a3 < 0 || self->_numberOfCarets <= a3) {
    return 0;
  }
  else {
    return &self->_carets[a3];
  }
}

- (void)_cache
{
  if (!self->_carets)
  {
    [(__NSTextSelectionLineFragmentInfo *)self _fetchCaretOffsets];
    if (self->_numberOfCarets)
    {
      [(__NSTextSelectionLineFragmentInfo *)self _resolveTrailingEdges];
      [(__NSTextSelectionLineFragmentInfo *)self _computeVisualDirection];
      [(__NSTextSelectionLineFragmentInfo *)self _invalidateSortedLocations];
    }
  }
}

- (void)_resolveTrailingEdges
{
  __assert_rtn("-[__NSTextSelectionLineFragmentInfo _resolveTrailingEdges]", "NSTextSelectionNavigation.m", 307, "NULL != _carets");
}

- (void)_invalidateSortedLocations
{
  self->_sortedLocations = 0;
}

- (void)_computeVisualDirection
{
  [(__NSTextSelectionLineFragmentInfo *)self _cache];
  self->_visualDirection = -1;
  unint64_t numberOfCarets = self->_numberOfCarets;
  if (!numberOfCarets) {
    return;
  }
  int v4 = -1;
  uint64_t v5 = 25;
  unint64_t v6 = self->_numberOfCarets;
  do
  {
    if (v4 == -1)
    {
      int v4 = *((unsigned __int8 *)&self->_carets->var0 + v5);
      goto LABEL_8;
    }
    if (v4 == 2) {
      break;
    }
    if (v4 != *((unsigned __int8 *)&self->_carets->var0 + v5))
    {
      int v4 = 2;
LABEL_8:
      self->_visualDirection = v4;
    }
    v5 += 32;
    --v6;
  }
  while (v6);
  if (numberOfCarets > 1 && v4 != 2)
  {
    if (v4 == 1)
    {
      unint64_t v7 = &self->_carets[numberOfCarets];
      carets = v7 - 2;
      objc_super v9 = v7 - 1;
    }
    else
    {
      carets = self->_carets;
      objc_super v9 = carets + 1;
    }
    if (self->_visualDirection != ([carets->var1 compare:v9->var1] == 1)) {
      self->_visualDirection = 2;
    }
  }
}

- (void)_fetchCaretOffsets
{
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0x7FFFFFFFFFFFFFFFLL;
  id v3 = objc_alloc_init(MEMORY[0x1E4F28D30]);
  BOOL v4 = [(__NSTextSelectionLineFragmentInfo *)self _baseWritingDirection] == 1;
  uint64_t v5 = (NSMapTable *)(id)[MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  uint64_t v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  uint64_t v16 = 0;
  if (!self->_carets) {
    self->_carets = ($8A3C5446200872A078FBC44726AE0FCF *)NSZoneCalloc(0, self->_offset, 0x20uLL);
  }
  id v6 = [(NSTextSelectionNavigation *)self->_navigation textSelectionDataSource];
  id v7 = [(NSTextRange *)self->_textRange location];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55____NSTextSelectionLineFragmentInfo__fetchCaretOffsets__block_invoke;
  v9[3] = &unk_1E55C5850;
  v9[4] = self;
  v9[5] = v3;
  BOOL v10 = v4;
  v9[6] = v5;
  v9[7] = &v24;
  v9[8] = v23;
  v9[9] = &v11;
  v9[10] = &v17;
  [v6 enumerateCaretOffsetsInLineFragmentAtLocation:v7 usingBlock:v9];
  unint64_t v8 = v25[3];
  self->_unint64_t numberOfCarets = v8;
  if (v8)
  {

    self->_primaryLocationTable = v5;
    self->_secondaryLocationTable = (NSMapTable *)v18[5];

    self->_otherLocations = (NSArray *)v12[5];
  }
  else
  {

    if (v12[5]) {
      __assert_rtn("-[__NSTextSelectionLineFragmentInfo _fetchCaretOffsets]", "NSTextSelectionNavigation.m", 293, "!otherTable");
    }
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v24, 8);
}

- (int64_t)_baseWritingDirection
{
  int64_t result = self->_baseDirection;
  if (result == -1)
  {
    int64_t result = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self->_navigation, "textSelectionDataSource"), "baseWritingDirectionAtLocation:", -[NSTextRange location](self->_textRange, "location"));
    self->_baseDirection = result;
    if (result == -1)
    {
      int64_t result = +[NSParagraphStyle defaultWritingDirectionForLanguage:0];
      self->_baseDirection = result;
    }
  }
  return result;
}

- (void)dealloc
{
  carets = self->_carets;
  if (carets) {
    NSZoneFree(0, carets);
  }

  v4.receiver = self;
  v4.super_class = (Class)__NSTextSelectionLineFragmentInfo;
  [(__NSTextSelectionLineFragmentInfo *)&v4 dealloc];
}

- (id)description
{
  id v3 = (void *)[MEMORY[0x1E4F28E78] string];
  [v3 appendFormat:@"<%p %@", self, objc_opt_class()];
  if (self->_carets)
  {
    if (self->_numberOfCarets)
    {
      uint64_t v4 = 0;
      unint64_t v5 = 0;
      do
      {
        [v3 appendFormat:@" %@", objc_msgSend(self->_carets[v4].var1, "description")];
        carets = self->_carets;
        id var2 = carets[v4].var2;
        if (var2)
        {
          [v3 appendFormat:@"/%@", objc_msgSend(var2, "description")];
          carets = self->_carets;
        }
        if (!carets[v4].var3)
        {
          [v3 appendString:@"t"];
          carets = self->_carets;
        }
        objc_msgSend(v3, "appendFormat:", @"@%g", *(void *)&carets[v4].var0);
        ++v5;
        ++v4;
      }
      while (v5 < self->_numberOfCarets);
    }
  }
  else
  {
    [v3 appendFormat:@" uncached"];
  }
  [v3 appendString:@">"];
  return v3;
}

- (id)_sortedLocations
{
  [(__NSTextSelectionLineFragmentInfo *)self _cache];
  objc_sync_enter(self);
  sortedLocations = self->_sortedLocations;
  if (!sortedLocations)
  {
    sortedLocations = [(NSArray *)NSAllMapTableKeys(self->_primaryLocationTable) sortedArrayUsingSelector:sel_compare_];
    self->_sortedLocations = sortedLocations;
  }
  objc_sync_exit(self);
  return sortedLocations;
}

- (int64_t)_sortedLocationIndexForLocation:(id)a3
{
  id v4 = [(__NSTextSelectionLineFragmentInfo *)self _sortedLocations];
  uint64_t v5 = [v4 count];

  return objc_msgSend(v4, "indexOfObject:inSortedRange:options:usingComparator:", a3, 0, v5, 1024, &__block_literal_global_3);
}

- (id)_findNextCaretLocationForLocation:(id)a3
{
  id v5 = [(__NSTextSelectionLineFragmentInfo *)self _sortedLocations];
  int64_t v6 = [(__NSTextSelectionLineFragmentInfo *)self _sortedLocationIndexForLocation:a3];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  int64_t v7 = v6 + 1;
  if (v6 + 1 >= (unint64_t)[v5 count]) {
    return 0;
  }

  return (id)[v5 objectAtIndexedSubscript:v7];
}

- (id)_secondaryLocationTable
{
  id result = self->_secondaryLocationTable;
  if (!result)
  {
    id result = (id)[MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    self->_secondaryLocationTable = (NSMapTable *)result;
  }
  return result;
}

- (id)textRangeOfCharacterAtOffset:(double)a3 fractionOfDistanceThroughGlyph:(double *)a4
{
  [(__NSTextSelectionLineFragmentInfo *)self _cache];
  unint64_t numberOfCarets = self->_numberOfCarets;
  if (!numberOfCarets) {
    return 0;
  }
  carets = self->_carets;
  double var0 = carets->var0;
  if (carets->var0 >= a3)
  {
    id var1 = carets->var1;
    id v15 = var1;
    if (numberOfCarets >= 2) {
      id v15 = carets[1].var1;
    }
    if (!a4) {
      goto LABEL_21;
    }
  }
  else
  {
    unint64_t v10 = numberOfCarets - 1;
    double var0 = carets[numberOfCarets - 1].var0;
    if (var0 > a3)
    {
      if (numberOfCarets < 2) {
LABEL_8:
      }
        -[__NSTextSelectionLineFragmentInfo textRangeOfCharacterAtOffset:fractionOfDistanceThroughGlyph:]();
      p_var4 = &carets[1].var4;
      uint64_t v12 = 1;
      while (1)
      {
        double var0 = *(double *)(p_var4 - 25);
        if (var0 > a3) {
          break;
        }
        ++v12;
        p_var4 += 32;
        if (numberOfCarets == v12) {
          goto LABEL_8;
        }
      }
      if (*(p_var4 - 1) && *p_var4)
      {
        int v19 = 1;
        uint64_t v20 = v12--;
      }
      else
      {
        int v19 = 0;
        uint64_t v20 = v12 - 1;
      }
      id v15 = carets[v12].var1;
      id var1 = carets[v20].var1;
      if (!a4) {
        goto LABEL_21;
      }
      double var0 = (a3 - *(double *)(p_var4 - 57)) / (var0 - *(double *)(p_var4 - 57));
      *a4 = var0;
      if (!v19) {
        goto LABEL_21;
      }
      double var0 = 1.0 - var0;
      goto LABEL_20;
    }
    id v15 = carets[v10].var1;
    id var1 = v15;
    if (numberOfCarets >= 2) {
      id var1 = (id)*((void *)&carets[numberOfCarets - 1] - 3);
    }
    if (!a4) {
      goto LABEL_21;
    }
    carets += v10;
  }
  double var0 = 0.0;
  if (!carets->var3) {
    double var0 = 1.0;
  }
LABEL_20:
  *a4 = var0;
LABEL_21:
  uint64_t v16 = objc_msgSend(v15, "compare:", var1, var0);
  if (v16 == -1) {
    id v17 = v15;
  }
  else {
    id v17 = var1;
  }
  if (v16 == -1) {
    id v15 = var1;
  }
  v18 = [[NSTextRange alloc] initWithLocation:v17 endLocation:v15];

  return v18;
}

- (const)caretPositionClosestToOffset:(double)a3
{
  [(__NSTextSelectionLineFragmentInfo *)self _cache];
  carets = self->_carets;
  if (!carets) {
    return 0;
  }
  unint64_t numberOfCarets = self->_numberOfCarets;
  if (!numberOfCarets) {
    return 0;
  }
  if (carets->var0 >= a3) {
    return self->_carets;
  }
  unint64_t v7 = numberOfCarets - 1;
  unint64_t v8 = &carets[numberOfCarets - 1];
  if (v8->var0 <= a3) {
    return v8;
  }
  if ((v7 & 0x8000000000000000) != 0) {
    return 0;
  }
  do
  {
    id result = &carets[((char *)v8 - (char *)carets) >> 6];
    if (result->var0 == a3) {
      break;
    }
    if (result->var0 <= a3)
    {
      carets = ($8A3C5446200872A078FBC44726AE0FCF *)&result[1];
      double var0 = result[1].var0;
      if (var0 > a3)
      {
        if (a3 - result->var0 > (var0 - result->var0) * 0.5) {
          ++result;
        }
        return result;
      }
    }
    else
    {
      unint64_t v8 = result - 1;
    }
  }
  while (carets <= v8);
  return result;
}

- (const)logicalFirstCaret
{
  id v3 = [(NSTextRange *)[(__NSTextSelectionLineFragmentInfo *)self textRange] location];

  return [(__NSTextSelectionLineFragmentInfo *)self caretPositionClosestToLocation:v3 visualDirection:1 matchLocation:0];
}

- (const)logicalLastCaret
{
  id v3 = [(NSTextRange *)[(__NSTextSelectionLineFragmentInfo *)self textRange] endLocation];

  return [(__NSTextSelectionLineFragmentInfo *)self caretPositionClosestToLocation:v3 visualDirection:0 matchLocation:0];
}

- (const)caretPositionClosestToLocation:(id)a3 visualDirection:(int64_t)a4 matchLocation:(BOOL *)a5
{
  if (!-[NSTextRange containsLocation:](self->_textRange, "containsLocation:")
    && !objc_msgSend(-[NSTextRange endLocation](self->_textRange, "endLocation"), "isEqual:", a3))
  {
    return 0;
  }
  [(__NSTextSelectionLineFragmentInfo *)self _cache];
  int64_t v9 = [(__NSTextSelectionLineFragmentInfo *)self caretIndexForPrimaryLocation:a3];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_29;
  }
  int visualDirection = self->_visualDirection;
  if (visualDirection == 2)
  {
    id v11 = [(__NSTextSelectionLineFragmentInfo *)self _sortedLocations];
    int64_t v12 = [(__NSTextSelectionLineFragmentInfo *)self _sortedLocationIndexForLocation:a3];
    int64_t v13 = v12 - 1;
    if ((unint64_t)(v12 - 1) > 0x7FFFFFFFFFFFFFFDLL)
    {
      int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      int64_t v14 = v12;
      if ((a4 == 2) != ([(__NSTextSelectionLineFragmentInfo *)self _baseWritingDirection] != 0))
      {
        if (v14 + 1 >= (unint64_t)[v11 count]) {
          int64_t v15 = v14;
        }
        else {
          int64_t v15 = v14 + 1;
        }
        int64_t v13 = v15 - 1;
      }
      int64_t v9 = -[__NSTextSelectionLineFragmentInfo caretIndexForPrimaryLocation:](self, "caretIndexForPrimaryLocation:", [v11 objectAtIndexedSubscript:v13]);
    }
    goto LABEL_29;
  }
  unint64_t numberOfCarets = self->_numberOfCarets;
  if (numberOfCarets < 2)
  {
    int64_t v9 = 0;
LABEL_29:
    uint64_t v27 = [(__NSTextSelectionLineFragmentInfo *)self caretPositionAtIndex:v9];
    uint64_t v16 = v27;
    if (a5 && v27 && [v27->var2 isEqual:a3]) {
      *a5 = 0;
    }
    return v16;
  }
  carets = self->_carets;
  int v19 = &carets[numberOfCarets];
  if (visualDirection == 1) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = -1;
  }
  v21 = &v19[v20];
  uint64_t v22 = &carets[visualDirection == 1];
  if (visualDirection == 1) {
    uint64_t v23 = -1;
  }
  else {
    uint64_t v23 = 1;
  }
  uint64_t v24 = v21 - 1;
  while (v22 <= v24)
  {
    v25 = &v22[((char *)v24 - (char *)v22) >> 6];
    uint64_t v26 = [a3 compare:v25->var1];
    if (v26 != -1 && [v25[v23].var1 compare:a3] != -1)
    {
      if (visualDirection == 1) {
        uint64_t v22 = v25 - 1;
      }
      else {
        v22 += ((char *)v24 - (char *)v22) >> 6;
      }
      if (visualDirection == 1) {
        uint64_t v24 = v25;
      }
      else {
        uint64_t v24 = v25 + 1;
      }
      break;
    }
    if (v26 == v23) {
      uint64_t v22 = v25 + 1;
    }
    else {
      uint64_t v24 = v25 - 1;
    }
  }
  if (v22 == v24 || a4 == 3) {
    return v22;
  }
  else {
    return v24;
  }
}

- (id)rangesBetweenStartingOffset:(double)a3 endOffset:(double)a4 continuous:(BOOL)a5
{
  BOOL v5 = a5;
  v38[1] = *MEMORY[0x1E4F143B8];
  if (a3 >= a4) {
    double v7 = a4;
  }
  else {
    double v7 = a3;
  }
  if (a3 >= a4) {
    double v8 = a3;
  }
  else {
    double v8 = a4;
  }
  int64_t v9 = [(__NSTextSelectionLineFragmentInfo *)self caretPositionClosestToOffset:v7];
  unint64_t v10 = [(__NSTextSelectionLineFragmentInfo *)self caretPositionClosestToOffset:v8];
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    return 0;
  }
  int64_t v13 = v10;
  if (v5)
  {
    id var1 = v9->var1;
    id v15 = v10->var1;
    uint64_t v16 = [var1 compare:v15];
    if (v16 == 1) {
      id v17 = v15;
    }
    else {
      id v17 = var1;
    }
    if (v16 != 1) {
      id var1 = v15;
    }
    v18 = [[NSTextRange alloc] initWithLocation:v17 endLocation:var1];
    v38[0] = v18;
    int v19 = (NSTextRange **)v38;
    goto LABEL_24;
  }
  int visualDirection = self->_visualDirection;
  if (visualDirection == 1)
  {
    v18 = [[NSTextRange alloc] initWithLocation:v10->var1 endLocation:v9->var1];
    v36 = v18;
    int v19 = &v36;
    goto LABEL_24;
  }
  if (!visualDirection)
  {
    v18 = [[NSTextRange alloc] initWithLocation:v9->var1 endLocation:v10->var1];
    v37 = v18;
    int v19 = &v37;
LABEL_24:
    int64_t v12 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];

    return v12;
  }
  int64_t v22 = [(__NSTextSelectionLineFragmentInfo *)self _baseWritingDirection];
  int64_t v12 = (void *)[MEMORY[0x1E4F1CA48] array];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v33 = __86____NSTextSelectionLineFragmentInfo_rangesBetweenStartingOffset_endOffset_continuous___block_invoke;
  v34 = &unk_1E55C58A0;
  v35 = v12;
  if (v9 <= v13)
  {
    id v23 = 0;
    int v24 = v22 == 1;
    do
    {
      if (v9->var2)
      {
        int var3 = v9->var3;
        if (var3 == v24) {
          id var2 = v9->var2;
        }
        else {
          id var2 = v9->var1;
        }
        if (v23)
        {
          if (var3 == v24) {
            id v27 = v9->var1;
          }
          else {
            id v27 = v9->var2;
          }
          v33((uint64_t)v32, v23, v27, 0);
        }
        id v23 = var2;
      }
      else
      {
        id var2 = v9->var1;
        if (!v23) {
          id v23 = v9->var1;
        }
      }
      ++v9;
    }
    while (v9 <= v13);
    if (v23) {
      BOOL v28 = var2 == 0;
    }
    else {
      BOOL v28 = 1;
    }
    if (!v28)
    {
      BOOL v29 = [v12 count] == 0;
      v33((uint64_t)v32, v23, var2, v29);
    }
  }
  if ((unint64_t)[v12 count] >= 2)
  {
    [v12 sortUsingComparator:&__block_literal_global_237];
    if ([v12 count] != 1)
    {
      unint64_t v30 = 0;
      do
      {
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", v30), "endLocation"), "isEqual:", objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", v30 + 1), "location")))
        {
          v31 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", v30), "location"), objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", v30 + 1), "endLocation"));
          [v12 setObject:v31 atIndexedSubscript:v30];
          [v12 removeObjectAtIndex:v30 + 1];
        }
        else
        {
          ++v30;
        }
      }
      while (v30 < [v12 count] - 1);
    }
  }
  return v12;
}

- (int64_t)numberOfCaretPositions
{
  return self->_numberOfCarets;
}

- (BOOL)isMonotonicDirection
{
  return self->_visualDirection != 2;
}

- (int64_t)caretIndexForSecondaryLocation:(id)a3
{
  [(__NSTextSelectionLineFragmentInfo *)self _cache];
  secondaryLocationTable = self->_secondaryLocationTable;
  if (!secondaryLocationTable) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v6 = [(NSMapTable *)secondaryLocationTable objectForKey:a3];
  if (!v6) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return [v6 integerValue];
}

- (BOOL)location:(id)a3 isLeading:(BOOL *)a4 trailing:(BOOL *)a5 inTextRanges:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [a6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v20 != v12) {
        objc_enumerationMutation(a6);
      }
      int64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
      uint64_t v15 = objc_msgSend((id)objc_msgSend(v14, "location"), "compare:", a3);
      if (v15 == 1) {
        break;
      }
      uint64_t v16 = v15;
      uint64_t v17 = objc_msgSend(a3, "compare:", objc_msgSend(v14, "endLocation"));
      if (v17 != 1)
      {
        *a4 = v17 == -1;
        *a5 = v16 == -1;
        return 1;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [a6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  BOOL result = 0;
  *a5 = 0;
  *a4 = 0;
  return result;
}

- (int64_t)caretIndexForLocation:(id)a3 inTextRanges:(id)a4 secondaryCaretIndex:(int64_t *)a5
{
  __int16 v23 = 0;
  int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (![(__NSTextSelectionLineFragmentInfo *)self location:a3 isLeading:(char *)&v23 + 1 trailing:&v23 inTextRanges:a4])return v8; {
  int64_t v9 = [(__NSTextSelectionLineFragmentInfo *)self caretIndexForPrimaryLocation:a3];
  }
  int64_t v10 = v9;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_3;
  }
  if (!(HIBYTE(v23) | v23)) {
    goto LABEL_15;
  }
  carets = self->_carets;
  if (!HIBYTE(v23))
  {
    if (!(_BYTE)v23 || (uint64_t v15 = &carets[v9], v15->var3) && v15->var2)
    {
LABEL_3:
      BOOL v11 = 0;
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  BOOL var3 = carets[v9].var3;
  BOOL v11 = var3;
  BOOL v14 = var3 || v23 == 0;
  if (!v14) {
LABEL_15:
  }
    BOOL v11 = 1;
LABEL_16:
  int64_t v16 = [(__NSTextSelectionLineFragmentInfo *)self caretIndexForSecondaryLocation:a3];
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18 = self->_carets;
    if (!v18[v16].var2) {
      -[__NSTextSelectionLineFragmentInfo caretIndexForLocation:inTextRanges:secondaryCaretIndex:]();
    }
    if (HIBYTE(v23) && v18[v16].var3)
    {
      BOOL v17 = 1;
      goto LABEL_24;
    }
    if ((_BYTE)v23)
    {
      BOOL v17 = !v18[v16].var3;
      goto LABEL_24;
    }
  }
  BOOL v17 = 0;
LABEL_24:
  if (v11 || !v17) {
    int64_t v19 = v10;
  }
  else {
    int64_t v19 = v16;
  }
  int v20 = v11 || v17;
  if (a5)
  {
    BOOL v14 = !v11 || !v17;
    int64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v14) {
      int64_t v21 = v16;
    }
    *a5 = v21;
  }
  if (v20) {
    return v19;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)_locationForEdgeCaretAtIndex:(unint64_t)a3 leftEdge:(BOOL)a4
{
  BOOL v4 = a4;
  [(__NSTextSelectionLineFragmentInfo *)self _cache];
  double v7 = &self->_carets[a3];
  if (v7->var2)
  {
    if (([(__NSTextSelectionLineFragmentInfo *)self _baseWritingDirection] == 0) ^ v4 ^ !v7->var3) {
      p_id var2 = &v7->var2;
    }
    else {
      p_id var2 = &v7->var1;
    }
  }
  else
  {
    p_id var2 = &v7->var1;
  }
  return *p_var2;
}

- (int64_t)caretIndexForEdgeLocationInTextRanges:(id)a3 leftEdge:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  [(__NSTextSelectionLineFragmentInfo *)self _cache];
  if (objc_msgSend((id)objc_msgSend(a3, "firstObject"), "isEmpty"))
  {
    int64_t v7 = -[__NSTextSelectionLineFragmentInfo caretIndexForLocation:inTextRanges:secondaryCaretIndex:](self, "caretIndexForLocation:inTextRanges:secondaryCaretIndex:", objc_msgSend((id)objc_msgSend(a3, "firstObject"), "location"), a3, 0);
LABEL_13:
    int64_t v13 = v7;
    v23[3] = v7;
    goto LABEL_14;
  }
  if (self->_visualDirection == 2)
  {
    id v8 = [(__NSTextSelectionLineFragmentInfo *)self _sortedLocations];
    int64_t v9 = -[__NSTextSelectionLineFragmentInfo _sortedLocationIndexForLocation:](self, "_sortedLocationIndexForLocation:", objc_msgSend((id)objc_msgSend(a3, "firstObject"), "location"));
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v23[3] = 0x7FFFFFFFFFFFFFFFLL;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v18 = __84____NSTextSelectionLineFragmentInfo_caretIndexForEdgeLocationInTextRanges_leftEdge___block_invoke;
      int64_t v19 = &unk_1E55C58C8;
      int v20 = &v22;
      BOOL v21 = v4;
      uint64_t v10 = [v8 count];
      if (v9 < v10)
      {
        do
        {
          uint64_t v11 = [v8 objectAtIndexedSubscript:v9];
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "lastObject"), "endLocation"), "compare:", v11) == -1) {
            break;
          }
          uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
          int64_t v12 = [(__NSTextSelectionLineFragmentInfo *)self caretIndexForLocation:v11 inTextRanges:a3 secondaryCaretIndex:&v16];
          v18((uint64_t)v17, v12);
          v18((uint64_t)v17, v16);
          ++v9;
        }
        while (v10 != v9);
      }
    }
  }
  int64_t v13 = v23[3];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((self->_visualDirection != 0) == v4) {
      uint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "endLocation");
    }
    else {
      uint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "firstObject"), "location");
    }
    int64_t v7 = [(__NSTextSelectionLineFragmentInfo *)self caretIndexForLocation:v14 inTextRanges:a3 secondaryCaretIndex:0];
    goto LABEL_13;
  }
LABEL_14:
  _Block_object_dispose(&v22, 8);
  return v13;
}

- (NSTextSelectionNavigation)textSelectionNavigation
{
  return self->_navigation;
}

- (void)textRangeOfCharacterAtOffset:fractionOfDistanceThroughGlyph:.cold.1()
{
}

- (void)caretIndexForLocation:inTextRanges:secondaryCaretIndex:.cold.1()
{
}

@end
@interface NSTextSelectionNavigation
+ (id)_substringRangeForEnumerationType:(unint64_t)a3 location:(id)a4 dataSource:(id)a5 string:(id *)a6 enclosingRange:(id *)a7;
+ (void)_setupCharacterSets;
+ (void)initialize;
- (BOOL)_location:(id)a3 withAffinity:(int64_t)a4 isAtBoundaryOfDestination:(int64_t)a5 onSide:(int64_t)a6;
- (BOOL)_usesVisualBidiSelection;
- (BOOL)allowsNonContiguousRanges;
- (BOOL)rotatesCoordinateSystemForLayoutOrientation;
- (NSArray)deletionRangesForTextSelection:(NSTextSelection *)textSelection direction:(NSTextSelectionNavigationDirection)direction destination:(NSTextSelectionNavigationDestination)destination allowsDecomposition:(BOOL)allowsDecomposition;
- (NSArray)textSelectionsInteractingAtPoint:(CGPoint)point inContainerAtLocation:(id)containerLocation anchors:(NSArray *)anchors modifiers:(NSTextSelectionNavigationModifier)modifiers selecting:(BOOL)selecting bounds:(CGRect)bounds;
- (NSTextSelection)destinationSelectionForTextSelection:(NSTextSelection *)textSelection direction:(NSTextSelectionNavigationDirection)direction destination:(NSTextSelectionNavigationDestination)destination extending:(BOOL)extending confined:(BOOL)confined;
- (NSTextSelection)textSelectionForSelectionGranularity:(NSTextSelectionGranularity)selectionGranularity enclosingPoint:(CGPoint)point inContainerAtLocation:(id)location;
- (NSTextSelection)textSelectionForSelectionGranularity:(NSTextSelectionGranularity)selectionGranularity enclosingTextSelection:(NSTextSelection *)textSelection;
- (NSTextSelectionNavigation)initWithDataSource:(id)dataSource;
- (double)_anchorPositionOffsetForLocation:(id)a3 textSelection:(id)a4 affinity:(int64_t)a5;
- (double)_caretOffsetForTextLocation:(id)a3 affinity:(int64_t)a4;
- (id)_adjustLocationForNearestCaretPosition:(id)a3 direction:(int64_t)a4;
- (id)_copyRangeForTextLineFragmentAtLocation:(id)a3 affinity:(int64_t)a4;
- (id)_copyRangeForTextLineFragmentAtLocation:(id)a3 affinity:(int64_t)a4 copyEnclosingRange:(id *)a5;
- (id)_findAnchorInfoForTextSelection:(id)a3 anchorPositionOffset:(double *)a4 anchorLocation:(id *)a5;
- (id)_lineFragmentInfoForLocation:(id)a3 affinity:(int64_t)a4;
- (id)_lineFragmentInfoForPoint:(CGPoint)a3 inContainerAtLocation:(id)a4 bounds:(CGRect)a5 layoutOrientation:(int64_t)a6 beforeLineFragment:(BOOL *)a7 afterLineFragment:(BOOL *)a8 lineFragmentRange:(id *)a9;
- (id)_lineFragmentInfoForRange:(id)a3;
- (id)_logicalDestinationLocationForTextSelection:(id)a3 originLocation:(id)a4 direction:(int64_t)a5 destination:(int64_t)a6 extending:(BOOL)a7 confined:(BOOL)a8 affinity:(int64_t *)a9;
- (id)_rangeOfCombinedLineFragmentsInRanges:(id)a3;
- (id)_rangesForSelectionStartingOffset:(double)a3 inLineFragmentInfo:(id)a4 endingOffset:(double)a5 inLineFragmentInfo:(id)a6 contiguous:(BOOL)a7;
- (id)_rangesWithDirectionalFormatAdjustmentsForRanges:(id)a3;
- (id)_visualDestinationLocationForTextSelection:(id)a3 originLocation:(id *)a4 direction:(int64_t)a5 destination:(int64_t)a6 extending:(BOOL)a7 confined:(BOOL)a8 affinity:(int64_t *)a9 crossedLine:(BOOL *)a10;
- (id)deletionRangesForTextSelection:(id)a3 direction:(int64_t)a4 destination:(int64_t)a5 allowsDecomposition:(BOOL)a6 confined:(BOOL)a7;
- (id)destinationForTextSelection:(id)a3 direction:(int64_t)a4 destination:(int64_t)a5 extending:(BOOL)a6;
- (id)resolvedInsertionLocationForTextSelection:(NSTextSelection *)textSelection writingDirection:(NSTextSelectionNavigationWritingDirection)writingDirection;
- (id)textSelectionDataSource;
- (id)textSelectionForSelectionGranularity:(int64_t)a3 enclosingPoint:(CGPoint)a4 inContainerAtLocation:(id)a5 bounds:(CGRect)a6;
- (id)textSelectionsInteractingAtPoint:(CGPoint)a3 inContainerAtLocation:(id)a4 anchors:(id)a5 modifiers:(unint64_t)a6 selecting:(BOOL)a7;
- (int64_t)_horizontalDirectionForDirection:(int64_t)a3 location:(id)a4;
- (int64_t)_logicalDirectionForDirection:(int64_t)a3 textSelection:(id)a4;
- (unsigned)_bidiLevelAtLocation:(id)a3 affinity:(int64_t)a4;
- (void)dealloc;
- (void)flushLayoutCache;
- (void)setAllowsNonContiguousRanges:(BOOL)allowsNonContiguousRanges;
- (void)setRotatesCoordinateSystemForLayoutOrientation:(BOOL)rotatesCoordinateSystemForLayoutOrientation;
- (void)setTextSelectionDataSource:(id)a3;
@end

@implementation NSTextSelectionNavigation

- (id)_lineFragmentInfoForRange:(id)a3
{
  v5 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "documentRange");
  if (([v5 containsRange:a3] & 1) == 0
    && (![a3 isEmpty]
     || !objc_msgSend((id)objc_msgSend(v5, "endLocation"), "isEqual:", objc_msgSend(a3, "location"))))
  {
    return 0;
  }
  unint64_t v6 = 0;
  lineFragmentInfoCache = self->_lineFragmentInfoCache;
  do
  {
    v8 = &self->super.isa + v6;
    Class v9 = v8[2];
    if (!v9)
    {
      unint64_t v11 = v6;
      goto LABEL_16;
    }
    if (objc_msgSend((id)-[objc_class textRange](v9, "textRange"), "isEqualToTextRange:", a3)) {
      v10 = (__NSTextSelectionLineFragmentInfo *)v8[2];
    }
    else {
      v10 = 0;
    }
    unint64_t v11 = v6 + 1;
    if (v10) {
      break;
    }
  }
  while (v6++ < 7);
  if (v10) {
    return v10;
  }
LABEL_16:
  v10 = [[__NSTextSelectionLineFragmentInfo alloc] initWithTextSelectionNavigation:self range:a3];
  if (v11 >= 8)
  {
    v13 = self->_lineFragmentInfoCache[0];
    long long v14 = *(_OWORD *)&self->_lineFragmentInfoCache[1];
    long long v15 = *(_OWORD *)&self->_lineFragmentInfoCache[3];
    long long v16 = *(_OWORD *)&self->_lineFragmentInfoCache[5];
    self->_lineFragmentInfoCache[6] = self->_lineFragmentInfoCache[7];
    *(_OWORD *)&self->_lineFragmentInfoCache[2] = v15;
    *(_OWORD *)&self->_lineFragmentInfoCache[4] = v16;
    *(_OWORD *)lineFragmentInfoCache = v14;
    unint64_t v11 = 7;
  }
  lineFragmentInfoCache[v11] = v10;
  return v10;
}

- (double)_caretOffsetForTextLocation:(id)a3 affinity:(int64_t)a4
{
  id v5 = [(NSTextSelectionNavigation *)self _lineFragmentInfoForLocation:a3 affinity:a4];
  if (!v5) {
    return -1.0;
  }

  [v5 offsetForLocation:a3];
  return result;
}

- (id)_lineFragmentInfoForLocation:(id)a3 affinity:(int64_t)a4
{
  unint64_t v6 = [(NSTextSelectionNavigation *)self _copyRangeForTextLineFragmentAtLocation:a3 affinity:a4];
  v7 = v6;
  if (v6
    && ([(NSTextRange *)v6 containsLocation:a3]
     || (objc_msgSend(a3, "isEqual:", -[NSTextRange endLocation](v7, "endLocation")) & 1) != 0
     || !objc_msgSend(a3, "isEqual:", objc_msgSend((id)objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "documentRange"), "endLocation"))|| (v7, (v7 = -[NSTextRange initWithLocation:]([NSTextRange alloc], "initWithLocation:", a3)) != 0)))
  {
    id v8 = [(NSTextSelectionNavigation *)self _lineFragmentInfoForRange:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_copyRangeForTextLineFragmentAtLocation:(id)a3 affinity:(int64_t)a4 copyEnclosingRange:(id *)a5
{
  int v9 = objc_msgSend(a3, "isEqual:", objc_msgSend((id)objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "documentRange"), "endLocation"));
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3052000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  uint64_t v32 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  uint64_t v26 = 0;
  id v10 = [(NSTextSelectionNavigation *)self textSelectionDataSource];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __97__NSTextSelectionNavigation__copyRangeForTextLineFragmentAtLocation_affinity_copyEnclosingRange___block_invoke;
  v20[3] = &unk_1E55C5940;
  v20[4] = a3;
  v20[5] = &v27;
  v20[7] = a4;
  v20[8] = a5;
  v20[6] = &v21;
  [v10 enumerateSubstringsFromLocation:a3 options:512 usingBlock:v20];
  unint64_t v11 = (void *)v28[5];
  if (!v11 || objc_msgSend(a3, "compare:", objc_msgSend(v11, "location")) == -1)
  {
    id v12 = [(NSTextSelectionNavigation *)self textSelectionDataSource];
    v13 = (void *)v28[5];
    id v14 = a3;
    if (v13) {
      id v14 = (id)objc_msgSend(v13, "location", a3);
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __97__NSTextSelectionNavigation__copyRangeForTextLineFragmentAtLocation_affinity_copyEnclosingRange___block_invoke_2;
    v18[3] = &unk_1E55C5968;
    char v19 = v9;
    v18[4] = a3;
    v18[5] = &v27;
    v18[6] = &v21;
    v18[7] = a5;
    [v12 enumerateSubstringsFromLocation:v14 options:768 usingBlock:v18];
  }
  long long v15 = v28;
  long long v16 = (NSTextRange *)v28[5];
  if (!v16 && v9)
  {
    long long v16 = [[NSTextRange alloc] initWithLocation:a3];
    long long v15 = v28;
    v28[5] = (uint64_t)v16;
  }
  if (a5)
  {
    *a5 = (id)v22[5];
    long long v16 = (NSTextRange *)v15[5];
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v16;
}

- (id)textSelectionDataSource
{
  return objc_loadWeak((id *)&self->_textSelectionDataSource);
}

- (id)_copyRangeForTextLineFragmentAtLocation:(id)a3 affinity:(int64_t)a4
{
  return [(NSTextSelectionNavigation *)self _copyRangeForTextLineFragmentAtLocation:a3 affinity:a4 copyEnclosingRange:0];
}

- (void)flushLayoutCache
{
  uint64_t v2 = 0;
  lineFragmentInfoCache = self->_lineFragmentInfoCache;
  do
  {
    v4 = lineFragmentInfoCache[v2];
    if (!v4) {
      break;
    }

    ++v2;
  }
  while (v2 != 8);
  *((_OWORD *)lineFragmentInfoCache + 2) = 0u;
  *((_OWORD *)lineFragmentInfoCache + 3) = 0u;
  *(_OWORD *)lineFragmentInfoCache = 0u;
  *((_OWORD *)lineFragmentInfoCache + 1) = 0u;
}

id __97__NSTextSelectionNavigation__copyRangeForTextLineFragmentAtLocation_affinity_copyEnclosingRange___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, unsigned char *a5)
{
  if (!*(unsigned char *)(a1 + 64)
    || (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
     || (id result = (id)objc_msgSend((id)objc_msgSend(a3, "endLocation"), "isEqual:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "endLocation")), result))&& (id result = (id)objc_msgSend(*(id *)(a1 + 32), "isEqual:", objc_msgSend(a3, "endLocation")), result))
  {
    id result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    if (*(void *)(a1 + 56))
    {

      id result = a4;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
    }
  }
  *a5 = 1;
  return result;
}

uint64_t __97__NSTextSelectionNavigation__copyRangeForTextLineFragmentAtLocation_affinity_copyEnclosingRange___block_invoke(void *a1, uint64_t a2, void *a3, void *a4, unsigned char *a5)
{
  if (a1[7] == 1 || (uint64_t result = objc_msgSend((id)objc_msgSend(a3, "location"), "isEqual:", a1[4]), (result & 1) == 0))
  {
    uint64_t result = a3;
    *(void *)(*(void *)(a1[5] + 8) + 40) = result;
    if (a1[8])
    {
      uint64_t result = a4;
      *(void *)(*(void *)(a1[6] + 8) + 40) = result;
    }
  }
  *a5 = 1;
  return result;
}

+ (void)initialize
{
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];

  [v2 registerDefaults:&unk_1EDD68C10];
}

- (void)dealloc
{
  [(NSTextSelectionNavigation *)self setTextSelectionDataSource:0];
  [(NSTextSelectionNavigation *)self flushLayoutCache];
  v3.receiver = self;
  v3.super_class = (Class)NSTextSelectionNavigation;
  [(NSTextSelectionNavigation *)&v3 dealloc];
}

- (NSTextSelectionNavigation)initWithDataSource:(id)dataSource
{
  v7.receiver = self;
  v7.super_class = (Class)NSTextSelectionNavigation;
  v4 = [(NSTextSelectionNavigation *)&v7 init];
  id v5 = v4;
  if (v4)
  {
    [(NSTextSelectionNavigation *)v4 setTextSelectionDataSource:dataSource];
    v5->_supportsContainer = objc_opt_respondsToSelector() & 1;
    v5->_supportsLayoutOrientation = objc_opt_respondsToSelector() & 1;
    v5->_allowsNonContiguousRanges = 1;
  }
  return v5;
}

- (void)setTextSelectionDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)_substringRangeForEnumerationType:(unint64_t)a3 location:(id)a4 dataSource:(id)a5 string:(id *)a6 enclosingRange:(id *)a7
{
  uint64_t v11 = 1024;
  if (!a6) {
    uint64_t v11 = 1536;
  }
  unint64_t v12 = v11 | a3 & 0xFFFFFFFFFFFFFEFFLL;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3052000000;
  v45 = __Block_byref_object_copy__1;
  v46 = __Block_byref_object_dispose__1;
  uint64_t v47 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3052000000;
  v39 = __Block_byref_object_copy__1;
  v40 = __Block_byref_object_dispose__1;
  uint64_t v41 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3052000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  uint64_t v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3052000000;
  uint64_t v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  uint64_t v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __105__NSTextSelectionNavigation__substringRangeForEnumerationType_location_dataSource_string_enclosingRange___block_invoke;
  v23[3] = &unk_1E55C58F0;
  v23[4] = a4;
  v23[5] = &v36;
  v23[6] = &v30;
  v23[7] = &v24;
  v23[8] = &v42;
  [a5 enumerateSubstringsFromLocation:a4 options:v12 usingBlock:v23];
  if (!v25[5])
  {
    v13 = (void *)v37[5];
    if (v13)
    {
      if (!objc_msgSend(a4, "isEqual:", objc_msgSend(v13, "location"))) {
        goto LABEL_13;
      }
      if (!v31[5]) {
        goto LABEL_11;
      }
      id v14 = (void *)[(id)v37[5] location];
      if (!objc_msgSend(v14, "isEqual:", objc_msgSend((id)v31[5], "location"))) {
        goto LABEL_13;
      }
      long long v15 = (void *)v31[5];
      if (!v15) {
LABEL_11:
      }
        long long v15 = (void *)v37[5];
    }
    else
    {
      long long v15 = (void *)[a5 documentRange];
    }
    id v16 = (id)[v15 endLocation];
    v25[5] = (uint64_t)v16;
  }
LABEL_13:
  uint64_t v17 = v25[5];
  if (v17)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __105__NSTextSelectionNavigation__substringRangeForEnumerationType_location_dataSource_string_enclosingRange___block_invoke_2;
    v22[3] = &unk_1E55C5918;
    v22[4] = a4;
    v22[5] = &v36;
    v22[6] = &v30;
    v22[7] = &v42;
    [a5 enumerateSubstringsFromLocation:v17 options:v12 | 0x100 usingBlock:v22];
  }
  v18 = (void *)v43[5];
  if (a6) {
    *a6 = v18;
  }
  else {

  }
  char v19 = (void *)v31[5];
  if (a7) {
    *a7 = v19;
  }
  else {

  }
  id v20 = (id)v37[5];
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
  return v20;
}

id __105__NSTextSelectionNavigation__substringRangeForEnumerationType_location_dataSource_string_enclosingRange___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, unsigned char *a5)
{
  if ([a3 containsLocation:*(void *)(a1 + 32)])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a3;
    id v10 = a4;
LABEL_3:
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v10;
    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "compare:", objc_msgSend(a3, "location")) == -1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = (id)[a3 location];
    if ([a4 containsLocation:*(void *)(a1 + 32)])
    {
      id v10 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", [a4 location], objc_msgSend(a3, "location"));
      goto LABEL_3;
    }
  }
LABEL_7:
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

id __105__NSTextSelectionNavigation__substringRangeForEnumerationType_location_dataSource_string_enclosingRange___block_invoke_2(void *a1, void *a2, void *a3, void *a4, unsigned char *a5)
{
  if ([a3 containsLocation:a1[4]])
  {

    *(void *)(*(void *)(a1[5] + 8) + 40) = a3;
LABEL_3:
    *(void *)(*(void *)(a1[6] + 8) + 40) = a4;
    goto LABEL_8;
  }
  if (![a4 containsLocation:a1[4]]) {
    goto LABEL_8;
  }
  if (!*(void *)(*(void *)(a1[6] + 8) + 40)) {
    goto LABEL_3;
  }
  if (objc_msgSend((id)objc_msgSend(a3, "endLocation"), "compare:", a1[4]) != 1)
  {
    id v10 = *(void **)(*(void *)(a1[6] + 8) + 40);
    *(void *)(*(void *)(a1[6] + 8) + 40) = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", [a3 endLocation], objc_msgSend(v10, "endLocation"));
  }
LABEL_8:

  id result = a2;
  *(void *)(*(void *)(a1[7] + 8) + 40) = result;
  *a5 = 1;
  return result;
}

+ (void)_setupCharacterSets
{
  if (_setupCharacterSets_onceToken != -1) {
    dispatch_once(&_setupCharacterSets_onceToken, &__block_literal_global_119);
  }
}

void __48__NSTextSelectionNavigation__setupCharacterSets__block_invoke()
{
  id v0 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B88], "alphanumericCharacterSet"), "mutableCopy");
  objc_msgSend(v0, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x1E4F28B88], "symbolCharacterSet"));
  __NSNonSkippableSet = [v0 copy];
  [v0 invert];
  __NSSkippableSet = [v0 copy];
}

- (id)_rangesWithDirectionalFormatAdjustmentsForRanges:(id)a3
{
  return a3;
}

- (int64_t)_horizontalDirectionForDirection:(int64_t)a3 location:(id)a4
{
  if (self->_supportsLayoutOrientation)
  {
    uint64_t v5 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "textLayoutOrientationAtLocation:", a4);
    unint64_t v6 = a3 - 2;
    if (a3 >= 2 && v5 == 1)
    {
      if (v6 > 3) {
        return 5;
      }
      else {
        return qword_18E5F7410[v6];
      }
    }
  }
  return a3;
}

- (int64_t)_logicalDirectionForDirection:(int64_t)a3 textSelection:(id)a4
{
  int64_t v4 = a3;
  if (a3 >= 2)
  {
    uint64_t v7 = -[NSTextSelectionNavigation _horizontalDirectionForDirection:location:](self, "_horizontalDirectionForDirection:location:", a3, objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "textRanges"), "firstObject"), "location"));
    uint64_t v8 = v7;
    if (v7 > 3)
    {
      return v7 == 4;
    }
    else
    {
      NSWritingDirection v9 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "baseWritingDirectionAtLocation:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "textRanges"), "firstObject"), "location"));
      if (v9 == NSWritingDirectionNatural) {
        NSWritingDirection v9 = +[NSParagraphStyle defaultWritingDirectionForLanguage:0];
      }
      if (v9 == NSWritingDirectionRightToLeft) {
        return v8 == 2;
      }
      else {
        return v8 != 2;
      }
    }
  }
  return v4;
}

- (id)_lineFragmentInfoForPoint:(CGPoint)a3 inContainerAtLocation:(id)a4 bounds:(CGRect)a5 layoutOrientation:(int64_t)a6 beforeLineFragment:(BOOL *)a7 afterLineFragment:(BOOL *)a8 lineFragmentRange:(id *)a9
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v18 = a3.y;
  double v19 = a3.x;
  uint64_t v21 = [(NSTextSelectionNavigation *)self textSelectionDataSourcePrivate];
  v22 = (void *)[(NSTextSelectionDataSourcePrivate *)v21 documentRange];
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3052000000;
  v49 = __Block_byref_object_copy__1;
  v50 = __Block_byref_object_dispose__1;
  uint64_t v51 = 0;
  v52.origin.double x = x;
  v52.origin.double y = y;
  v52.size.double width = width;
  v52.size.double height = height;
  if (!NSIsEmptyRect(v52))
  {
    if (a6 && self->_rotatesCoordinateSystemForLayoutOrientation)
    {
      BOOL v23 = v19 >= x + width;
      if (v19 >= x) {
        goto LABEL_5;
      }
    }
    else
    {
      BOOL v23 = v18 >= y + height;
      if (v18 >= y)
      {
LABEL_5:
        if (v23)
        {
          BOOL v24 = 0;
          BOOL v23 = 1;
          goto LABEL_22;
        }
        goto LABEL_7;
      }
    }
    uint64_t v28 = [v22 location];
    if (self->_supportsContainer)
    {
      uint64_t v40 = 0;
      uint64_t v41 = &v40;
      uint64_t v42 = 0x3052000000;
      v43 = __Block_byref_object_copy__1;
      uint64_t v44 = __Block_byref_object_dispose__1;
      uint64_t v45 = 0;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __157__NSTextSelectionNavigation__lineFragmentInfoForPoint_inContainerAtLocation_bounds_layoutOrientation_beforeLineFragment_afterLineFragment_lineFragmentRange___block_invoke;
      v39[3] = &unk_1E55C5990;
      v39[4] = &v40;
      [(NSTextSelectionDataSourcePrivate *)v21 enumerateContainerBoundariesFromLocation:a4 reverse:1 usingBlock:v39];
      uint64_t v29 = (void *)v41[5];
      if (v29 && ([v29 isEqual:v28] & 1) == 0) {
        uint64_t v28 = v41[5];
      }
      _Block_object_dispose(&v40, 8);
    }
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __157__NSTextSelectionNavigation__lineFragmentInfoForPoint_inContainerAtLocation_bounds_layoutOrientation_beforeLineFragment_afterLineFragment_lineFragmentRange___block_invoke_2;
    v38[3] = &unk_1E55C59B8;
    v38[4] = &v46;
    [(NSTextSelectionDataSourcePrivate *)v21 enumerateSubstringsFromLocation:v28 options:512 usingBlock:v38];
    BOOL v24 = 1;
    goto LABEL_22;
  }
LABEL_7:
  uint64_t v25 = -[NSTextSelectionDataSourcePrivate lineFragmentRangeForPoint:inContainerAtLocation:](v21, "lineFragmentRangeForPoint:inContainerAtLocation:", a4, v19, v18);
  v47[5] = v25;
  if (v25)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_12;
    }
    uint64_t v26 = -[NSTextSelectionDataSourcePrivate placementOfPoint:inContainerAtLocation:](v21, "placementOfPoint:inContainerAtLocation:", a4, v19, v18) & 6;
    if (v26 == 2)
    {
      BOOL v23 = 0;
      BOOL v24 = 1;
      goto LABEL_13;
    }
    if (v26 == 4)
    {
      BOOL v24 = 0;
      BOOL v23 = 1;
    }
    else
    {
LABEL_12:
      BOOL v24 = 0;
      BOOL v23 = 0;
    }
LABEL_13:
    id v27 = -[NSTextSelectionNavigation _copyRangeForTextLineFragmentAtLocation:affinity:](self, "_copyRangeForTextLineFragmentAtLocation:affinity:", [(id)v47[5] location], 1);
    v47[5] = (uint64_t)v27;
    goto LABEL_22;
  }
  BOOL v24 = 0;
  BOOL v23 = 0;
LABEL_22:
  if (!v47[5])
  {
    uint64_t v30 = [v22 endLocation];
    if (self->_supportsContainer)
    {
      uint64_t v40 = 0;
      uint64_t v41 = &v40;
      uint64_t v42 = 0x3052000000;
      v43 = __Block_byref_object_copy__1;
      uint64_t v44 = __Block_byref_object_dispose__1;
      uint64_t v45 = 0;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __157__NSTextSelectionNavigation__lineFragmentInfoForPoint_inContainerAtLocation_bounds_layoutOrientation_beforeLineFragment_afterLineFragment_lineFragmentRange___block_invoke_3;
      v37[3] = &unk_1E55C5990;
      v37[4] = &v40;
      [(NSTextSelectionDataSourcePrivate *)v21 enumerateContainerBoundariesFromLocation:a4 reverse:0 usingBlock:v37];
      v31 = (void *)v41[5];
      if (v31 && ([v31 isEqual:v30] & 1) == 0) {
        uint64_t v30 = v41[5];
      }
      _Block_object_dispose(&v40, 8);
    }
    id v32 = [(NSTextSelectionNavigation *)self textSelectionDataSource];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __157__NSTextSelectionNavigation__lineFragmentInfoForPoint_inContainerAtLocation_bounds_layoutOrientation_beforeLineFragment_afterLineFragment_lineFragmentRange___block_invoke_4;
    v36[3] = &unk_1E55C59E0;
    v36[4] = v30;
    v36[5] = &v46;
    [v32 enumerateSubstringsFromLocation:v30 options:768 usingBlock:v36];
    BOOL v23 = 1;
  }
  if (a7) {
    *a7 = v24;
  }
  if (a8) {
    *a8 = v23;
  }
  if (v47[5]) {
    id v33 = -[NSTextSelectionNavigation _lineFragmentInfoForRange:](self, "_lineFragmentInfoForRange:");
  }
  else {
    id v33 = 0;
  }
  v34 = (void *)v47[5];
  if (a9) {
    *a9 = v34;
  }
  else {

  }
  _Block_object_dispose(&v46, 8);
  return v33;
}

uint64_t __157__NSTextSelectionNavigation__lineFragmentInfoForPoint_inContainerAtLocation_bounds_layoutOrientation_beforeLineFragment_afterLineFragment_lineFragmentRange___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) = a2;
  *a3 = 1;
  return result;
}

id __157__NSTextSelectionNavigation__lineFragmentInfoForPoint_inContainerAtLocation_bounds_layoutOrientation_beforeLineFragment_afterLineFragment_lineFragmentRange___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  id result = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

uint64_t __157__NSTextSelectionNavigation__lineFragmentInfoForPoint_inContainerAtLocation_bounds_layoutOrientation_beforeLineFragment_afterLineFragment_lineFragmentRange___block_invoke_3(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) = a2;
  *a3 = 1;
  return result;
}

NSTextRange *__157__NSTextSelectionNavigation__lineFragmentInfoForPoint_inContainerAtLocation_bounds_layoutOrientation_beforeLineFragment_afterLineFragment_lineFragmentRange___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4, unsigned char *a5)
{
  if (a4
    && objc_msgSend((id)objc_msgSend(a4, "endLocation"), "isEqual:", *(void *)(a1 + 32))
    && objc_msgSend((id)objc_msgSend(a3, "endLocation"), "compare:", objc_msgSend(a4, "endLocation")) == -1)
  {
    id result = -[NSTextRange initWithLocation:]([NSTextRange alloc], "initWithLocation:", [a4 endLocation]);
  }
  else
  {
    id result = a3;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

- (id)_adjustLocationForNearestCaretPosition:(id)a3 direction:(int64_t)a4
{
  uint64_t v7 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "documentRange");
  id v8 = a3;
  if ((objc_msgSend((id)objc_msgSend(v7, "location"), "isEqual:", a3) & 1) == 0
    && (objc_msgSend((id)objc_msgSend(v7, "endLocation"), "isEqual:", a3) & 1) == 0)
  {
    id v20 = 0;
    id v9 = [(NSTextSelectionNavigation *)self _copyRangeForTextLineFragmentAtLocation:a3 affinity:1 copyEnclosingRange:&v20];
    if (v9)
    {
      int64_t v10 = [(NSTextSelectionNavigation *)self _horizontalDirectionForDirection:a4 location:a3];
      if (!v20
        || ([v9 containsLocation:a3] & 1) != 0
        || (objc_msgSend((id)objc_msgSend(v9, "endLocation"), "isEqual:", a3) & 1) != 0
        || ![v20 containsLocation:a3]
        || (v10 & 0xFFFFFFFFFFFFFFFDLL) != 0)
      {
        if (objc_msgSend((id)objc_msgSend(v9, "location"), "isEqual:", a3)) {
          goto LABEL_24;
        }
        id v12 = [(NSTextSelectionNavigation *)self _lineFragmentInfoForRange:v9];
        if (!v12) {
          goto LABEL_24;
        }
        v13 = v12;
        uint64_t v14 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "baseWritingDirectionAtLocation:", a3);
        switch(v10)
        {
          case 0:
          case 5:
            if (v14 == 1) {
              int64_t v10 = 3;
            }
            else {
              int64_t v10 = 2;
            }
            break;
          case 1:
          case 4:
            if (v14 == 1) {
              int64_t v10 = 2;
            }
            else {
              int64_t v10 = 3;
            }
            break;
          default:
            break;
        }
        char v19 = 1;
        uint64_t v15 = [v13 caretPositionClosestToLocation:a3 visualDirection:v10 matchLocation:&v19];
        if (!v15) {
          goto LABEL_24;
        }
        uint64_t v16 = v15;

        uint64_t v17 = 8;
        if (!v19) {
          uint64_t v17 = 16;
        }
        id v11 = *(id *)(v16 + v17);
      }
      else
      {

        id v11 = (id)[v20 endLocation];
      }
      id v8 = v11;
    }
LABEL_24:
  }
  return v8;
}

- (BOOL)_location:(id)a3 withAffinity:(int64_t)a4 isAtBoundaryOfDestination:(int64_t)a5 onSide:(int64_t)a6
{
  if ((unint64_t)a6 >= 2) {
    -[NSTextSelectionNavigation _location:withAffinity:isAtBoundaryOfDestination:onSide:]();
  }
  uint64_t v8 = 1;
  switch(a5)
  {
    case 1:
      uint64_t v8 = 3;
      goto LABEL_8;
    case 2:
      if ((a6 == 1) != a4) {
        return 0;
      }
      uint64_t v8 = 0;
LABEL_8:
      uint64_t v16 = 0;
      uint64_t v17 = &v16;
      uint64_t v18 = 0x3052000000;
      char v19 = __Block_byref_object_copy__1;
      id v20 = __Block_byref_object_dispose__1;
      uint64_t v21 = 0;
      id v9 = [(NSTextSelectionNavigation *)self textSelectionDataSource];
      uint64_t v10 = 512;
      if (!a6) {
        uint64_t v10 = 768;
      }
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __85__NSTextSelectionNavigation__location_withAffinity_isAtBoundaryOfDestination_onSide___block_invoke;
      v15[3] = &unk_1E55C59B8;
      v15[4] = &v16;
      [v9 enumerateSubstringsFromLocation:a3 options:v8 | v10 usingBlock:v15];
      id v11 = (void *)v17[5];
      if (v11)
      {
        if (a6 == 1) {
          id v12 = (void *)[v11 location];
        }
        else {
          id v12 = (void *)[v11 endLocation];
        }
        char v13 = [v12 isEqual:a3];
      }
      else
      {
        char v13 = 0;
      }
      _Block_object_dispose(&v16, 8);
      return v13;
    case 3:
      uint64_t v8 = 4;
      goto LABEL_8;
    case 4:
      goto LABEL_8;
    default:
      uint64_t v8 = 2;
      goto LABEL_8;
  }
}

id __85__NSTextSelectionNavigation__location_withAffinity_isAtBoundaryOfDestination_onSide___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  id result = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

- (id)_logicalDestinationLocationForTextSelection:(id)a3 originLocation:(id)a4 direction:(int64_t)a5 destination:(int64_t)a6 extending:(BOOL)a7 confined:(BOOL)a8 affinity:(int64_t *)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  int64_t v15 = [(NSTextSelectionNavigation *)self _logicalDirectionForDirection:a5 textSelection:a3];
  uint64_t v16 = (void *)[a3 textRanges];
  int v17 = objc_msgSend((id)objc_msgSend(v16, "firstObject"), "isEmpty");
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3052000000;
  NSRect v52 = __Block_byref_object_copy__1;
  v53 = __Block_byref_object_dispose__1;
  uint64_t v54 = 0;
  if ((unint64_t)(a6 - 5) <= 1)
  {
    if (a6 == 5 && self->_supportsContainer)
    {
      uint64_t v43 = 0;
      uint64_t v44 = &v43;
      uint64_t v45 = 0x3052000000;
      uint64_t v46 = __Block_byref_object_copy__1;
      uint64_t v47 = __Block_byref_object_dispose__1;
      uint64_t v48 = 0;
      id v18 = [(NSTextSelectionNavigation *)self textSelectionDataSource];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __138__NSTextSelectionNavigation__logicalDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity___block_invoke;
      v42[3] = &unk_1E55C5990;
      v42[4] = &v43;
      [v18 enumerateContainerBoundariesFromLocation:a4 reverse:v15 == 1 usingBlock:v42];
      a4 = (id)v44[5];
      _Block_object_dispose(&v43, 8);
    }
    else
    {
      uint64_t v21 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "documentRange");
      if (v15) {
        v22 = (void *)[v21 location];
      }
      else {
        v22 = (void *)[v21 endLocation];
      }
      a4 = v22;
    }
    goto LABEL_47;
  }
  int v19 = v17;
  if (!v9
    || (!v17 ? (uint64_t v20 = [a3 affinity] == 0) : (uint64_t v20 = objc_msgSend(a3, "affinity")),
        (BOOL v23 = [(NSTextSelectionNavigation *)self _location:a4 withAffinity:v20 isAtBoundaryOfDestination:a6 onSide:v15], a4)? (v24 = v23): (v24 = 0), !v24))
  {
    if (a6 < 1)
    {
      if ((v19 | v10))
      {
        id v26 = [(NSTextSelectionNavigation *)self textSelectionDataSource];
        if (v15 == 1) {
          uint64_t v27 = 773;
        }
        else {
          uint64_t v27 = 517;
        }
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __138__NSTextSelectionNavigation__logicalDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity___block_invoke_3;
        v38[3] = &unk_1E55C59B8;
        v38[4] = &v49;
        [v26 enumerateSubstringsFromLocation:a4 options:v27 usingBlock:v38];
      }
      else
      {
        if (v15 == 1) {
          uint64_t v28 = (void *)[v16 firstObject];
        }
        else {
          uint64_t v28 = (void *)[v16 lastObject];
        }
        v50[5] = (uint64_t)v28;
        id v31 = v28;
      }
    }
    else
    {
      if (((v19 | v10) & 1) == 0)
      {
        if (v15 == 1) {
          uint64_t v25 = objc_msgSend((id)objc_msgSend(v16, "firstObject"), "location");
        }
        else {
          uint64_t v25 = objc_msgSend((id)objc_msgSend(v16, "lastObject"), "endLocation");
        }
        a4 = v25;
      }
      id v29 = [(NSTextSelectionNavigation *)self textSelectionDataSource];
      if ((unint64_t)a6 > 4) {
        uint64_t v30 = 2;
      }
      else {
        uint64_t v30 = qword_18E5F7430[a6 - 1];
      }
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __138__NSTextSelectionNavigation__logicalDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity___block_invoke_2;
      v39[3] = &unk_1E55C5A08;
      BOOL v40 = a6 == 1;
      BOOL v41 = v15 == 1;
      v39[4] = a4;
      void v39[5] = &v49;
      v39[6] = a6;
      [v29 enumerateSubstringsFromLocation:a4 options:((unint64_t)(v15 == 1) << 8) | ((unint64_t)(a6 != 1) << 9) | v30 usingBlock:v39];
    }
    id v32 = (id)v50[5];
    if (v32)
    {
      if (!v9)
      {
LABEL_42:
        id v33 = (void *)v50[5];
        if (v15 == 1) {
          v34 = (void *)[v33 location];
        }
        else {
          v34 = (void *)[v33 endLocation];
        }
        a4 = v34;
        if (a6 == 2) {
          *a9 = v15 == 1;
        }
        goto LABEL_47;
      }
    }
    else
    {
      id v32 = (id)objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "documentRange");
      v50[5] = (uint64_t)v32;
      if (!v9) {
        goto LABEL_42;
      }
    }
    if (([v32 containsLocation:a4] & 1) == 0
      && !objc_msgSend((id)objc_msgSend((id)v50[5], "endLocation"), "isEqual:", a4))
    {
      goto LABEL_47;
    }
    goto LABEL_42;
  }
LABEL_47:
  id v35 = a4;

  id v36 = a4;
  _Block_object_dispose(&v49, 8);
  return v36;
}

id __138__NSTextSelectionNavigation__logicalDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  *a3 = 1;
  return result;
}

id __138__NSTextSelectionNavigation__logicalDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, unsigned char *a5)
{
  if (!*(unsigned char *)(a1 + 56)
    || (uint64_t v10 = [a2 length],
        +[NSTextSelectionNavigation _setupCharacterSets],
        id result = (id)objc_msgSend(a2, "rangeOfCharacterFromSet:options:range:", __NSSkippableSet, 8, 0, v10),
        v12 != v10))
  {
    if (*(unsigned char *)(a1 + 57)
      || !a4
      || *(void *)(a1 + 48) != 2
      || (id result = (id)objc_msgSend(*(id *)(a1 + 32), "compare:", objc_msgSend(a3, "endLocation")), result == (id)-1))
    {
      id result = a3;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
      *a5 = 1;
    }
  }
  return result;
}

id __138__NSTextSelectionNavigation__logicalDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  id result = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

- (id)_visualDestinationLocationForTextSelection:(id)a3 originLocation:(id *)a4 direction:(int64_t)a5 destination:(int64_t)a6 extending:(BOOL)a7 confined:(BOOL)a8 affinity:(int64_t *)a9 crossedLine:(BOOL *)a10
{
  BOOL v91 = a8;
  BOOL v10 = a7;
  v107[1] = *MEMORY[0x1E4F143B8];
  id v16 = *a4;
  int v17 = (void *)[a3 textRanges];
  int64_t v18 = [(NSTextSelectionNavigation *)self _horizontalDirectionForDirection:a5 location:v16];
  unint64_t v19 = v18 & 0xFFFFFFFFFFFFFFFELL;
  int v20 = objc_msgSend((id)objc_msgSend(v17, "firstObject"), "isEmpty");
  if (a6) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = v18 < 2;
  }
  char v22 = v21;
  if (v19 == 2 || (v22 & 1) == 0)
  {
    BOOL v89 = v19 != 2;
    [a3 anchorPositionOffset];
    if ((a6 | 2) == 2)
    {
      double v24 = v23;
      BOOL v90 = v10;
      int v25 = v20 | v10;
      if (a6) {
        char v26 = 1;
      }
      else {
        char v26 = v25;
      }
      uint64_t v27 = v16;
      if ((v26 & 1) == 0)
      {
        uint64_t v27 = v16;
        if (v19 != 2)
        {
          uint64_t v28 = (void *)(v18 == 4
                       ? objc_msgSend((id)objc_msgSend(v17, "firstObject"), "location")
                       : objc_msgSend((id)objc_msgSend(v17, "lastObject"), "endLocation"));
          uint64_t v27 = v28;
          if ([v28 isEqual:v16]) {
            uint64_t v27 = v16;
          }
        }
      }
      int64_t v29 = objc_msgSend((id)objc_msgSend(v17, "firstObject"), "isEmpty") ? *a9 : 1;
      id v93 = [(NSTextSelectionNavigation *)self _copyRangeForTextLineFragmentAtLocation:v27 affinity:v29];
      if (v93)
      {
        uint64_t v87 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "baseWritingDirectionAtLocation:", v16);
        v85 = a4;
        BOOL v30 = (objc_msgSend((id)objc_msgSend(v17, "firstObject"), "isEmpty") & 1) != 0
           || *a9 != 1
           || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "firstObject"), "location"), "compare:", objc_msgSend(v93, "location")) != -1;
        BOOL v86 = v30;
        if (a6 || v19 == 2) {
          goto LABEL_87;
        }
        id v32 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "documentRange");
        v88 = v32;
        if (v18 == 4)
        {
          uint64_t v36 = objc_msgSend((id)objc_msgSend(v32, "location"), "compare:", objc_msgSend(v93, "location"));
          v34 = v88;
          if (v36) {
            goto LABEL_37;
          }
          uint64_t v35 = [v88 location];
        }
        else
        {
          uint64_t v33 = objc_msgSend((id)objc_msgSend(v32, "endLocation"), "compare:", objc_msgSend(v93, "endLocation"));
          v34 = v88;
          if (v33) {
            goto LABEL_37;
          }
          uint64_t v35 = [v88 endLocation];
        }
        id v31 = (void *)v35;
        v34 = v88;
        if (v35)
        {
LABEL_162:

          return v31;
        }
LABEL_37:
        uint64_t v101 = 0;
        v102 = &v101;
        uint64_t v103 = 0x3052000000;
        v104 = __Block_byref_object_copy__1;
        v105 = __Block_byref_object_dispose__1;
        uint64_t v106 = 0;
        if (objc_msgSend(v16, "isEqual:", objc_msgSend(v34, "endLocation")))
        {
          int v37 = objc_msgSend(v16, "isEqual:", objc_msgSend(v93, "endLocation")) ^ 1;
          if (v18 != 4) {
            LOBYTE(v37) = 0;
          }
          if (v37) {
            goto LABEL_50;
          }
        }
        BOOL v38 = v18 == 4 || v90;
        if (!v38 && objc_msgSend(v27, "isEqual:", objc_msgSend(v93, "location")) && (!v25 || !*a9))
        {
LABEL_50:
          id v40 = v93;
          v102[5] = (uint64_t)v40;
          BOOL v41 = v90;
          if (v40) {
            goto LABEL_64;
          }
        }
        else
        {
          if (v18 == 4) {
            uint64_t v39 = [v93 location];
          }
          else {
            uint64_t v39 = [v93 endLocation];
          }
          BOOL v41 = v90;
          uint64_t v42 = v39;
          uint64_t v97 = 0;
          v98 = &v97;
          uint64_t v99 = 0x2020000000;
          char v100 = 0;
          if (!v38
            && objc_msgSend((id)objc_msgSend(v17, "firstObject"), "isEmpty")
            && ([v93 isEmpty] & 1) == 0
            && objc_msgSend(v27, "isEqual:", objc_msgSend(v93, "endLocation"))
            && !*a9)
          {
            *((unsigned char *)v98 + 24) = 1;
          }
          id v43 = [(NSTextSelectionNavigation *)self textSelectionDataSource];
          v96[0] = MEMORY[0x1E4F143A8];
          v96[1] = 3221225472;
          v96[2] = __149__NSTextSelectionNavigation__visualDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity_crossedLine___block_invoke;
          v96[3] = &unk_1E55C5A30;
          if (v18 == 4) {
            uint64_t v44 = 768;
          }
          else {
            uint64_t v44 = 512;
          }
          v96[4] = v27;
          v96[5] = v42;
          v96[6] = &v97;
          v96[7] = &v101;
          [v43 enumerateSubstringsFromLocation:v42 options:v44 usingBlock:v96];
          _Block_object_dispose(&v97, 8);
          id v40 = (id)v102[5];
          if (v40)
          {
LABEL_64:
            if (v24 <= 0.0)
            {
              uint64_t v45 = [a3 affinity];
              if (v41) {
                uint64_t v46 = 1;
              }
              else {
                uint64_t v46 = v45;
              }
              [(NSTextSelectionNavigation *)self _anchorPositionOffsetForLocation:v16 textSelection:a3 affinity:v46];
              double v24 = v47;
              id v40 = (id)v102[5];
            }
            id v48 = [(NSTextSelectionNavigation *)self _lineFragmentInfoForRange:v40];
            uint64_t v49 = [v48 caretPositionClosestToOffset:v24];
            if (v49
              || (uint64_t v53 = [v48 numberOfCaretPositions], v53 >= 1)
              && (uint64_t v49 = [v48 caretPositionAtIndex:v53 - 1]) != 0)
            {
              id v31 = *(void **)(v49 + 8);
              if (v41)
              {
                char v50 = objc_msgSend((id)objc_msgSend(v17, "firstObject"), "isEmpty");
                unsigned int v51 = v18 != 4;
                if ((v50 & 1) == 0) {
                  goto LABEL_82;
                }
              }
              else
              {
                if ([(id)v102[5] isEmpty]) {
                  int v52 = 0;
                }
                else {
                  int v52 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v48, "textRange"), "endLocation"), "isEqual:", v31);
                }
                unsigned int v51 = v52 ^ 1;
              }
              *a9 = v51;
            }
            else
            {
              id v31 = 0;
            }
LABEL_82:

LABEL_83:
            if (a10 && v31)
            {
              *a10 = 1;
              _Block_object_dispose(&v101, 8);
              goto LABEL_162;
            }
            _Block_object_dispose(&v101, 8);
            if (v31) {
              goto LABEL_162;
            }
LABEL_87:
            if ([v93 isEmpty]) {
              goto LABEL_161;
            }
            if (![(NSTextSelectionNavigation *)self allowsNonContiguousRanges]) {
              goto LABEL_161;
            }
            id v54 = [(NSTextSelectionNavigation *)self _lineFragmentInfoForRange:v93];
            id v55 = v54;
            if (!v54 || ([v54 isMonotonicDirection] & 1) != 0) {
              goto LABEL_161;
            }
            if (a6) {
              char v56 = 1;
            }
            else {
              char v56 = v89;
            }
            if (v56)
            {
              if ((a6 | 2) != 2)
              {
                BOOL v63 = v87 != (v18 != 2) && v86;
                id v31 = [(NSTextSelectionNavigation *)self _logicalDestinationLocationForTextSelection:a3 originLocation:*v85 direction:v63 destination:a6 extending:v90 confined:v91 affinity:a9];
                if (!v31 || ![v93 containsLocation:v31]) {
                  goto LABEL_162;
                }
                if (a6 == 2)
                {
                  if (v18 == 3) {
                    uint64_t v64 = 0;
                  }
                  else {
                    uint64_t v64 = [v55 numberOfCaretPositions] - 1;
                  }
                  uint64_t v82 = [v55 caretPositionAtIndex:v64];
                  if (v82)
                  {
                    id v31 = *(void **)(v82 + 8);
                    if (!objc_msgSend(v31, "compare:", objc_msgSend(v93, "endLocation"))) {
                      *a9 = 0;
                    }
                    goto LABEL_162;
                  }
                  goto LABEL_161;
                }
LABEL_99:
                uint64_t v57 = [v55 caretIndexForEdgeLocationInTextRanges:v17 leftEdge:(v87 == 0) ^ (*a9 != 0)];
                if (v57 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  id v83 = 0;
                  if (!a6)
                  {
LABEL_150:
                    if (v18 == 3) {
                      uint64_t v79 = v57 - 1;
                    }
                    else {
                      uint64_t v79 = v57 + 1;
                    }
                    if ((v79 & 0x8000000000000000) == 0 && v79 < [v55 numberOfCaretPositions])
                    {
                      uint64_t v80 = [v55 caretPositionAtIndex:v79];
                      if (v80)
                      {
                        id v31 = *(void **)(v80 + 8);
LABEL_157:
                        if (v31)
                        {
                          id *v85 = v83;
                          if (objc_msgSend((id)objc_msgSend(v17, "firstObject"), "isEmpty")) {
                            *a9 = (v18 == 3) ^ (v87 == 0);
                          }
                          goto LABEL_162;
                        }
                      }
                    }
                    goto LABEL_160;
                  }
                }
                else
                {
                  uint64_t v62 = [v55 caretPositionAtIndex:v57];
                  if (v62) {
                    id v83 = *(id *)(v62 + 8);
                  }
                  else {
                    id v83 = 0;
                  }
                  if (!a6) {
                    goto LABEL_150;
                  }
                  if (v57 < 0)
                  {
LABEL_160:

                    goto LABEL_161;
                  }
                }
                int v92 = v18 == 3;
                uint64_t v65 = -1;
                if (v18 != 3) {
                  uint64_t v65 = 1;
                }
                uint64_t v84 = v65;
                unint64_t v66 = a6 - 1;
                while (v57 < [v55 numberOfCaretPositions])
                {
                  uint64_t v67 = [v55 caretPositionAtIndex:v57];
                  id v31 = (void *)v67;
                  if (v67)
                  {
                    uint64_t v101 = 0;
                    v102 = &v101;
                    uint64_t v103 = 0x3052000000;
                    v104 = __Block_byref_object_copy__1;
                    v105 = __Block_byref_object_dispose__1;
                    uint64_t v106 = 0;
                    int v68 = *(unsigned __int8 *)(v67 + 25);
                    id v69 = [(NSTextSelectionNavigation *)self textSelectionDataSource];
                    if (v66 > 3) {
                      uint64_t v70 = 2;
                    }
                    else {
                      uint64_t v70 = qword_18E5F7430[v66];
                    }
                    uint64_t v71 = v31[1];
                    v95[0] = MEMORY[0x1E4F143A8];
                    v95[1] = 3221225472;
                    v95[2] = __149__NSTextSelectionNavigation__visualDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity_crossedLine___block_invoke_2;
                    v95[3] = &unk_1E55C5A58;
                    v95[4] = &v101;
                    v95[5] = a6;
                    [v69 enumerateSubstringsFromLocation:v71 options:v70 | ((unint64_t)(v68 != v92) << 8) usingBlock:v95];
                    if (v68 == v92) {
                      uint64_t v72 = 768;
                    }
                    else {
                      uint64_t v72 = 512;
                    }
                    id v73 = [(NSTextSelectionNavigation *)self textSelectionDataSource];
                    v74 = (void *)v102[5];
                    if (v68 == v92) {
                      uint64_t v75 = [v74 endLocation];
                    }
                    else {
                      uint64_t v75 = [v74 location];
                    }
                    if (v66 > 3) {
                      uint64_t v76 = 2;
                    }
                    else {
                      uint64_t v76 = qword_18E5F7430[v66];
                    }
                    v94[0] = MEMORY[0x1E4F143A8];
                    v94[1] = 3221225472;
                    v94[2] = __149__NSTextSelectionNavigation__visualDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity_crossedLine___block_invoke_3;
                    v94[3] = &unk_1E55C59B8;
                    v94[4] = &v101;
                    [v73 enumerateSubstringsFromLocation:v75 options:v76 | v72 usingBlock:v94];
                    v107[0] = v102[5];
                    uint64_t v77 = objc_msgSend(v55, "caretIndexForEdgeLocationInTextRanges:leftEdge:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v107, 1), v18 == 3);
                    if (v57 == v77)
                    {
                      id v31 = 0;
                      v57 += v84;
                    }
                    else
                    {
                      uint64_t v78 = [v55 caretPositionAtIndex:v77];
                      if (v78) {
                        id v31 = *(void **)(v78 + 8);
                      }
                      else {
                        id v31 = 0;
                      }
                    }

                    _Block_object_dispose(&v101, 8);
                  }
                  if (v31 || v57 < 0) {
                    goto LABEL_157;
                  }
                }
                goto LABEL_160;
              }
              if (!a6) {
                goto LABEL_99;
              }
            }
            else
            {
              if ((objc_msgSend((id)objc_msgSend(v17, "firstObject"), "isEmpty") | v90)) {
                goto LABEL_99;
              }
              if (!v86)
              {
                uint64_t v58 = objc_msgSend((id)objc_msgSend(v17, "firstObject"), "location");
                id v59 = [(NSTextSelectionNavigation *)self _copyRangeForTextLineFragmentAtLocation:v58 affinity:1];
                if (v59)
                {
                  NSWritingDirection v60 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "baseWritingDirectionAtLocation:", v58);
                  if (v60 == NSWritingDirectionNatural) {
                    NSWritingDirection v60 = +[NSParagraphStyle defaultWritingDirectionForLanguage:0];
                  }
                  if ((v18 == 3) != (v60 != NSWritingDirectionLeftToRight)) {
                    id v55 = [(NSTextSelectionNavigation *)self _lineFragmentInfoForRange:v59];
                  }
                }
              }
              uint64_t v61 = objc_msgSend(v55, "caretPositionAtIndex:", objc_msgSend(v55, "caretIndexForEdgeLocationInTextRanges:leftEdge:", v17, v18 == 3));
              if (v61)
              {
                id v31 = *(void **)(v61 + 8);
                goto LABEL_162;
              }
            }
LABEL_161:
            id v31 = 0;
            goto LABEL_162;
          }
        }
        if (v18 == 4)
        {
          _Block_object_dispose(&v101, 8);
          goto LABEL_87;
        }
        id v31 = (void *)[v88 endLocation];
        goto LABEL_83;
      }
    }
  }
  id v31 = 0;
  return v31;
}

id __149__NSTextSelectionNavigation__visualDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity_crossedLine___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, unsigned char *a5)
{
  id result = (id)[a4 containsLocation:*(void *)(a1 + 32)];
  if (!result
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && (id result = (id)objc_msgSend(*(id *)(a1 + 40), "isEqual:", objc_msgSend(a4, "location")), result))
  {
    id result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
    *a5 = 1;
  }
  return result;
}

id __149__NSTextSelectionNavigation__visualDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity_crossedLine___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, unsigned char *a5)
{
  if (*(void *)(a1 + 40) == 1)
  {
    +[NSTextSelectionNavigation _setupCharacterSets];
    [a2 rangeOfCharacterFromSet:__NSSkippableSet options:8];
    if (v9) {
      a3 = 0;
    }
  }
  id result = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

uint64_t __149__NSTextSelectionNavigation__visualDestinationLocationForTextSelection_originLocation_direction_destination_extending_confined_affinity_crossedLine___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [a3 isEqualToTextRange:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  if ((result & 1) == 0)
  {
    uint64_t result = [a3 containsRange:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    if (result)
    {

      uint64_t result = a3;
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
    }
  }
  *a5 = 1;
  return result;
}

- (id)_rangeOfCombinedLineFragmentsInRanges:(id)a3
{
  uint64_t v22 = 0;
  double v23 = &v22;
  uint64_t v24 = 0x3052000000;
  int v25 = __Block_byref_object_copy__1;
  char v26 = __Block_byref_object_dispose__1;
  uint64_t v27 = 0;
  id v5 = [(NSTextSelectionNavigation *)self textSelectionDataSource];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "firstObject"), "location");
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __67__NSTextSelectionNavigation__rangeOfCombinedLineFragmentsInRanges___block_invoke;
  v21[3] = &unk_1E55C59B8;
  v21[4] = &v22;
  [v5 enumerateSubstringsFromLocation:v6 options:0 usingBlock:v21];
  if ((objc_msgSend((id)objc_msgSend(a3, "firstObject"), "isEmpty") & 1) == 0
    && objc_msgSend((id)objc_msgSend((id)v23[5], "endLocation"), "compare:", objc_msgSend((id)objc_msgSend(a3, "lastObject"), "endLocation")) == -1)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3052000000;
    int64_t v18 = __Block_byref_object_copy__1;
    unint64_t v19 = __Block_byref_object_dispose__1;
    uint64_t v20 = 0;
    id v7 = [(NSTextSelectionNavigation *)self textSelectionDataSource];
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "endLocation");
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__NSTextSelectionNavigation__rangeOfCombinedLineFragmentsInRanges___block_invoke_2;
    v14[3] = &unk_1E55C59B8;
    v14[4] = &v15;
    [v7 enumerateSubstringsFromLocation:v8 options:256 usingBlock:v14];
    if (v16[5])
    {

      uint64_t v9 = [NSTextRange alloc];
      uint64_t v10 = [(id)v23[5] location];
      uint64_t v11 = [(NSTextRange *)v9 initWithLocation:v10 endLocation:v16[5]];
      v23[5] = v11;
    }
    _Block_object_dispose(&v15, 8);
  }
  id v12 = (id)v23[5];
  _Block_object_dispose(&v22, 8);
  return v12;
}

id __67__NSTextSelectionNavigation__rangeOfCombinedLineFragmentsInRanges___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  id result = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

id __67__NSTextSelectionNavigation__rangeOfCombinedLineFragmentsInRanges___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  id result = (id)[a3 endLocation];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  *a5 = 1;
  return result;
}

- (id)_rangesForSelectionStartingOffset:(double)a3 inLineFragmentInfo:(id)a4 endingOffset:(double)a5 inLineFragmentInfo:(id)a6 contiguous:(BOOL)a7
{
  BOOL v7 = a7;
  id v9 = a4;
  v50[1] = *MEMORY[0x1E4F143B8];
  if (a4 == a6)
  {
    uint64_t v14 = 0;
    id v15 = a4;
  }
  else
  {
    uint64_t v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "textRange"), "location"), "compare:", objc_msgSend((id)objc_msgSend(a6, "textRange"), "location"));
    if (v13 == 1) {
      uint64_t v14 = -1;
    }
    else {
      uint64_t v14 = v13;
    }
    if (v13 == 1) {
      id v15 = a6;
    }
    else {
      id v15 = v9;
    }
    if (v13 == 1)
    {
      double v16 = a3;
    }
    else
    {
      id v9 = a6;
      double v16 = a5;
    }
    if (v13 == 1) {
      a3 = a5;
    }
    a5 = v16;
  }
  id v17 = [(NSTextSelectionNavigation *)self textSelectionDataSource];
  if (v7)
  {
    uint64_t v18 = objc_msgSend(v17, "baseWritingDirectionAtLocation:", objc_msgSend((id)objc_msgSend(v15, "textRange"), "location"));
    if (v18 == 1) {
      double v19 = 0.0;
    }
    else {
      double v19 = a3;
    }
    double v20 = 1.79769313e308;
    if (v18 == 1) {
      double v20 = a3;
    }
    if (a5 >= a3) {
      double v21 = a5;
    }
    else {
      double v21 = a3;
    }
    if (a5 >= a3) {
      double v22 = a3;
    }
    else {
      double v22 = a5;
    }
    if (v18 == 1) {
      double v23 = v21;
    }
    else {
      double v23 = v22;
    }
    if (v18 != 1) {
      double v22 = v21;
    }
    if (v14) {
      double v24 = v20;
    }
    else {
      double v24 = v22;
    }
    if (v14) {
      double v25 = v19;
    }
    else {
      double v25 = v23;
    }
    if (v14) {
      double v26 = a5;
    }
    else {
      double v26 = v21;
    }
    uint64_t v27 = objc_msgSend(v15, "rangesBetweenStartingOffset:endOffset:continuous:", -[NSTextSelectionNavigation _usesVisualBidiSelection](self, "_usesVisualBidiSelection") ^ 1, v25, v24);
    if (v14)
    {
      uint64_t v28 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "baseWritingDirectionAtLocation:", objc_msgSend((id)objc_msgSend(v9, "textRange"), "location"));
      double v29 = v28 == 1 ? v26 : 0.0;
      double v30 = v28 == 1 ? 1.79769313e308 : v26;
      uint64_t v31 = objc_msgSend(v9, "rangesBetweenStartingOffset:endOffset:continuous:", -[NSTextSelectionNavigation _usesVisualBidiSelection](self, "_usesVisualBidiSelection") ^ 1, v29, v30);
      if (v31)
      {
        if (v27)
        {
          id v32 = (void *)v31;
          uint64_t v33 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "documentRange");
          v34 = objc_msgSend((id)objc_msgSend(v27, "lastObject"), "location");
          uint64_t v35 = objc_msgSend((id)objc_msgSend(v32, "firstObject"), "endLocation");
          uint64_t v36 = [v34 compare:v35];
          int v37 = (objc_class *)objc_opt_class();
          BOOL v38 = NSStringFromClass(v37);
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __125__NSTextSelectionNavigation__rangesForSelectionStartingOffset_inLineFragmentInfo_endingOffset_inLineFragmentInfo_contiguous___block_invoke;
          v47[3] = &unk_1E55C5A80;
          v47[4] = v34;
          v47[5] = v35;
          v47[6] = v33;
          if (v36 == 1) {
            uint64_t v39 = (void *)v35;
          }
          else {
            uint64_t v39 = v34;
          }
          if (v36 != 1) {
            v34 = (void *)v35;
          }
          _UIFoundationAssert(self, v38, v36 != 1, v47);
          id v40 = [[NSTextRange alloc] initWithLocation:v39 endLocation:v34];
          if ((unint64_t)[v27 count] <= 1 && (unint64_t)objc_msgSend(v32, "count") < 2)
          {
            v50[0] = v40;
            BOOL v41 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
          }
          else
          {
            BOOL v41 = (void *)[MEMORY[0x1E4F1CA48] array];
            if ((unint64_t)[v27 count] >= 2) {
              objc_msgSend(v41, "replaceObjectsInRange:withObjectsFromArray:range:", 0, 0, v27, 0, objc_msgSend(v27, "count") - 1);
            }
            [v41 addObject:v40];
            if ((unint64_t)[v32 count] >= 2) {
              objc_msgSend(v41, "replaceObjectsInRange:withObjectsFromArray:range:", objc_msgSend(v41, "count"), 0, v32, 1, objc_msgSend(v32, "count") - 1);
            }
          }

          return v41;
        }
      }
    }
  }
  else if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "textRange"), "location"), "isEqual:", objc_msgSend((id)objc_msgSend(v17, "documentRange"), "endLocation")))
  {
    uint64_t v48 = [v15 textRange];
    uint64_t v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
    return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  }
  else
  {
    uint64_t v27 = (void *)[MEMORY[0x1E4F1CA48] array];
    if (a3 >= a5) {
      double v42 = a5;
    }
    else {
      double v42 = a3;
    }
    if (a3 >= a5) {
      a5 = a3;
    }
    id v43 = [(NSTextSelectionNavigation *)self textSelectionDataSource];
    uint64_t v44 = objc_msgSend((id)objc_msgSend(v15, "textRange"), "location");
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __125__NSTextSelectionNavigation__rangesForSelectionStartingOffset_inLineFragmentInfo_endingOffset_inLineFragmentInfo_contiguous___block_invoke_2;
    v46[3] = &unk_1E55C5AA8;
    *(double *)&v46[7] = v42;
    *(double *)&v46[8] = a5;
    v46[4] = self;
    v46[5] = v27;
    v46[6] = v9;
    [v43 enumerateSubstringsFromLocation:v44 options:0 usingBlock:v46];
  }
  return v27;
}

uint64_t __125__NSTextSelectionNavigation__rangesForSelectionStartingOffset_inLineFragmentInfo_endingOffset_inLineFragmentInfo_contiguous___block_invoke(void *a1)
{
  return [NSString stringWithFormat:@"Reverse ordering in locations found. %@:%@ documentRange:%@", a1[4], a1[5], a1[6]];
}

uint64_t __125__NSTextSelectionNavigation__rangesForSelectionStartingOffset_inLineFragmentInfo_endingOffset_inLineFragmentInfo_contiguous___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "_lineFragmentInfoForRange:");
  if (v8)
  {
    uint64_t v9 = [v8 rangesBetweenStartingOffset:0 endOffset:*(double *)(a1 + 56) continuous:*(double *)(a1 + 64)];
    if (v9) {
      [*(id *)(a1 + 40) addObject:v9];
    }
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(a3, "location"), "compare:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "textRange"), "location"));
  if (result != -1) {
    *a5 = 1;
  }
  return result;
}

- (double)_anchorPositionOffsetForLocation:(id)a3 textSelection:(id)a4 affinity:(int64_t)a5
{
  uint64_t v8 = (void *)[a4 textRanges];
  id v9 = [(NSTextSelectionNavigation *)self _lineFragmentInfoForLocation:a3 affinity:a5];
  if ((objc_msgSend((id)objc_msgSend(v8, "firstObject"), "isEmpty") & 1) == 0
    && objc_msgSend((id)objc_msgSend(v9, "textRange"), "isEqual:", a3)
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "lastObject"), "endLocation"), "isEqual:", a3))
  {
    id v9 = [(NSTextSelectionNavigation *)self _lineFragmentInfoForLocation:a3 affinity:0];
  }
  double v10 = 0.0;
  if (v9)
  {
    uint64_t v11 = (double *)objc_msgSend(v9, "caretPositionAtIndex:", objc_msgSend(v9, "caretIndexForPrimaryLocation:", a3));
    if (v11) {
      return *v11;
    }
  }
  return v10;
}

- (id)_findAnchorInfoForTextSelection:(id)a3 anchorPositionOffset:(double *)a4 anchorLocation:(id *)a5
{
  if (a4)
  {
    double v9 = *a4;
  }
  else
  {
    [a3 anchorPositionOffset];
    double v9 = v10;
  }
  uint64_t v11 = (void *)[a3 selectionAnchorLocation];
  uint64_t v12 = (uint64_t)v11;
  if (!v11) {
    uint64_t v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "textRanges"), "firstObject"), "location");
  }
  id v13 = -[NSTextSelectionNavigation _lineFragmentInfoForLocation:affinity:](self, "_lineFragmentInfoForLocation:affinity:", v12, [a3 affinity]);
  uint64_t v14 = v13;
  if (v11 || !v13) {
    goto LABEL_16;
  }
  if (v9 != 0.0)
  {
    uint64_t v17 = [v13 caretPositionClosestToOffset:v9];
    if (!v17) {
      goto LABEL_21;
    }
    uint64_t v11 = *(void **)(v17 + 8);
LABEL_16:
    if (!a4) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  uint64_t v15 = objc_msgSend(v13, "caretIndexForPrimaryLocation:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "textRanges"), "firstObject"), "location"));
  if (v15 != 0x7FFFFFFFFFFFFFFFLL && (uint64_t v16 = [v14 caretPositionAtIndex:v15]) != 0
    || (uint64_t v16 = [v14 caretPositionClosestToOffset:v9]) != 0)
  {
    uint64_t v11 = *(void **)(v16 + 8);
    double v9 = *(double *)v16;
    if (!a4) {
      goto LABEL_18;
    }
LABEL_17:
    *a4 = v9;
    goto LABEL_18;
  }
LABEL_21:
  uint64_t v11 = 0;
  if (a4) {
    goto LABEL_17;
  }
LABEL_18:
  if (a5) {
    *a5 = v11;
  }
  return v14;
}

- (unsigned)_bidiLevelAtLocation:(id)a3 affinity:(int64_t)a4
{
  id v5 = [(NSTextSelectionNavigation *)self _lineFragmentInfoForLocation:a3 affinity:a4];
  uint64_t v6 = v5;
  if (v5) {
    uint64_t v7 = [v5 caretIndexForPrimaryLocation:a3];
  }
  else {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v8 = [v6 caretPositionAtIndex:v7];
  if (v8) {
    LOBYTE(v8) = *(unsigned char *)(v8 + 25) != 0;
  }
  return v8;
}

- (BOOL)_usesVisualBidiSelection
{
  if (visualBidiSelectionEnabled_once != -1) {
    dispatch_once(&visualBidiSelectionEnabled_once, &__block_literal_global_240);
  }
  if (!visualBidiSelectionEnabled_result) {
    return 0;
  }

  return [(NSTextSelectionNavigation *)self allowsNonContiguousRanges];
}

- (NSTextSelection)destinationSelectionForTextSelection:(NSTextSelection *)textSelection direction:(NSTextSelectionNavigationDirection)direction destination:(NSTextSelectionNavigationDestination)destination extending:(BOOL)extending confined:(BOOL)confined
{
  BOOL v7 = confined;
  BOOL v8 = extending;
  uint64_t v11 = textSelection;
  v66[1] = *MEMORY[0x1E4F143B8];
  id v13 = [(NSTextSelection *)textSelection textRanges];
  id v65 = 0;
  uint64_t v14 = [(NSTextSelection *)v11 affinity];
  uint64_t v64 = v14;
  char v63 = 0;
  context = (void *)MEMORY[0x192FAE510]();
  if (objc_msgSend(-[NSArray firstObject](v13, "firstObject"), "isEmpty"))
  {
    uint64_t v15 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "documentRange");
    uint64_t v16 = -[NSTextSelectionNavigation _logicalDirectionForDirection:textSelection:](self, "_logicalDirectionForDirection:textSelection:", direction, v11)? [v15 location]: objc_msgSend(v15, "endLocation");
    if (objc_msgSend((id)objc_msgSend(-[NSArray firstObject](v13, "firstObject"), "location"), "isEqual:", v16)) {
      goto LABEL_59;
    }
  }
  uint64_t v17 = (void *)(v8 && v14
               ? objc_msgSend(-[NSArray lastObject](v13, "lastObject"), "endLocation")
               : objc_msgSend(-[NSArray firstObject](v13, "firstObject"), "location"));
  id v65 = v17;
  id v18 = [(NSTextSelectionNavigation *)self _visualDestinationLocationForTextSelection:v11 originLocation:&v65 direction:direction destination:destination extending:v8 confined:v7 affinity:&v64 crossedLine:&v63];
  id v19 = v18;
  if (!v18)
  {
    id v19 = [(NSTextSelectionNavigation *)self _logicalDestinationLocationForTextSelection:v11 originLocation:v65 direction:direction destination:destination extending:v8 confined:v7 affinity:&v64];
    if (!v19) {
      goto LABEL_59;
    }
  }
  id v20 = v65;
  uint64_t v21 = [v65 compare:v19];
  id v49 = [(NSTextSelectionNavigation *)self _adjustLocationForNearestCaretPosition:v19 direction:direction];
  if (!v8) {
    goto LABEL_31;
  }
  if (!v21) {
    goto LABEL_59;
  }
  double v22 = [(NSTextSelection *)v11 textRanges];
  double v23 = v22;
  if (v21 == 1)
  {
    id v19 = v65;
    id v24 = v49;
  }
  else
  {
    id v24 = v20;
  }
  if (!v18)
  {
    uint64_t v57 = 0;
    uint64_t v58 = &v57;
    uint64_t v59 = 0x3052000000;
    NSWritingDirection v60 = __Block_byref_object_copy__1;
    uint64_t v61 = __Block_byref_object_dispose__1;
    uint64_t v62 = 0;
    uint64_t v53 = 0;
    id v54 = &v53;
    uint64_t v55 = 0x2020000000;
    uint64_t v56 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v35 = v22;
    if (objc_msgSend(v49, "compare:", objc_msgSend(-[NSArray firstObject](v22, "firstObject"), "location")) == -1)
    {
      uint64_t v39 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v49, objc_msgSend(-[NSArray firstObject](v23, "firstObject"), "endLocation"));
      v58[5] = (uint64_t)v39;
      v54[3] = 0;
      uint64_t v64 = 0;
    }
    else if (objc_msgSend((id)objc_msgSend(-[NSArray lastObject](v23, "lastObject"), "endLocation"), "compare:", v49) == -1)
    {
      uint64_t v36 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend(-[NSArray lastObject](v23, "lastObject"), "location"), v49);
      v58[5] = (uint64_t)v36;
      uint64_t v37 = [(NSArray *)v23 count];
      v54[3] = v37 - 1;
      uint64_t v64 = 1;
    }
    if (v58[5])
    {
      v34 = (NSArray *)[(NSArray *)v23 mutableCopy];
      [(NSArray *)v34 replaceObjectAtIndex:v54[3] withObject:v58[5]];

      uint64_t v27 = v34;
    }
    else
    {
      uint64_t v40 = objc_msgSend(v65, "compare:", objc_msgSend(-[NSArray firstObject](v23, "firstObject"), "location"));
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __107__NSTextSelectionNavigation_destinationSelectionForTextSelection_direction_destination_extending_confined___block_invoke;
      v51[3] = &unk_1E55C5AD0;
      BOOL v52 = v40 != 0;
      uint64_t v41 = 1;
      if (!v40) {
        uint64_t v41 = -1;
      }
      v51[4] = v49;
      v51[5] = &v57;
      v51[6] = &v53;
      v51[7] = v41;
      -[NSArray enumerateObjectsWithOptions:usingBlock:](v23, "enumerateObjectsWithOptions:usingBlock:", 2 * (v40 != 0), v51, COERCE_DOUBLE(3221225472));
      if (v58[5])
      {
        uint64_t v42 = v54[3];
        if (v40)
        {
          uint64_t v43 = 0;
        }
        else
        {
          uint64_t v44 = [(NSArray *)v23 count];
          uint64_t v43 = v42 + 1;
          uint64_t v42 = v44 + ~v54[3];
        }
        if (v42)
        {
          uint64_t v45 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v34 = v45;
          if (v40) {
            -[NSArray replaceObjectsInRange:withObjectsFromArray:range:](v45, "replaceObjectsInRange:withObjectsFromArray:range:", 0, 0, v35, v43, v42);
          }
          [(NSArray *)v34 addObject:v58[5]];
          if (!v40) {
            -[NSArray replaceObjectsInRange:withObjectsFromArray:range:](v34, "replaceObjectsInRange:withObjectsFromArray:range:", [(NSArray *)v34 count], 0, v35, v43, v42);
          }
          uint64_t v27 = v34;
        }
        else
        {
          v66[0] = v58[5];
          v34 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1];
          uint64_t v27 = 0;
        }
      }
      else
      {
        v34 = 0;
        uint64_t v27 = 0;
        uint64_t v64 = 1;
      }
    }
    _Block_object_dispose(&v53, 8);
    _Block_object_dispose(&v57, 8);
    if (!v34) {
      goto LABEL_31;
    }
    goto LABEL_51;
  }
  id v25 = [(NSTextSelectionNavigation *)self _lineFragmentInfoForLocation:v24 affinity:1];
  id v26 = [(NSTextSelectionNavigation *)self _lineFragmentInfoForLocation:v19 affinity:1];
  uint64_t v27 = 0;
  if (v25)
  {
    uint64_t v28 = v26;
    if (v26)
    {
      [v25 offsetForLocation:v24];
      double v30 = v29;
      [v28 offsetForLocation:v19];
      double v32 = 0.0;
      if (v30 >= 0.0) {
        double v33 = v30;
      }
      else {
        double v33 = 0.0;
      }
      if (v31 >= 0.0) {
        double v32 = v31;
      }
      uint64_t v27 = 0;
      v34 = +[NSTextRange combineTextRanges:[(NSTextSelectionNavigation *)self _rangesForSelectionStartingOffset:v25 inLineFragmentInfo:v28 endingOffset:1 inLineFragmentInfo:v33 contiguous:v32] withTextRanges:v23 usingOperator:3];
      if (!v34) {
        goto LABEL_31;
      }
LABEL_51:
      uint64_t v46 = [NSTextSelection alloc];
      BOOL v38 = [(NSTextSelection *)v46 initWithRanges:v34 affinity:v64 granularity:[(NSTextSelection *)v11 granularity]];

      goto LABEL_52;
    }
  }
  v34 = v23;
  if (v23) {
    goto LABEL_51;
  }
LABEL_31:
  BOOL v38 = 0;
LABEL_52:
  if (!v38 && v49)
  {
    double v47 = [NSTextSelection alloc];
    BOOL v38 = [(NSTextSelection *)v47 initWithLocation:v49 affinity:v64];
  }
  if (v38)
  {
    [(NSTextSelection *)v11 anchorPositionOffset];
    if (v8)
    {
      if (destination == NSTextSelectionNavigationDestinationCharacter) {
        goto LABEL_63;
      }
    }
    else if (destination)
    {
      goto LABEL_62;
    }
    if (v63)
    {
LABEL_63:
      -[NSTextSelection setAnchorPositionOffset:](v38, "setAnchorPositionOffset:");
      return v38;
    }
LABEL_62:
    [(NSTextSelectionNavigation *)self _anchorPositionOffsetForLocation:v49 textSelection:v38 affinity:[(NSTextSelection *)v38 affinity]];
    goto LABEL_63;
  }
LABEL_59:
  return v11;
}

uint64_t __107__NSTextSelectionNavigation_destinationSelectionForTextSelection_direction_destination_extending_confined___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  BOOL v8 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 64)) {
    uint64_t v9 = [a2 location];
  }
  else {
    uint64_t v9 = [a2 endLocation];
  }
  uint64_t result = [v8 compare:v9];
  if (result == *(void *)(a1 + 56))
  {
    int v11 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v12 = [NSTextRange alloc];
    if (v11)
    {
      uint64_t v13 = [a2 location];
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = v12;
    }
    else
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v14 = [a2 endLocation];
      uint64_t v15 = v12;
      uint64_t v13 = v16;
    }
    uint64_t result = [(NSTextRange *)v15 initWithLocation:v13 endLocation:v14];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)textSelectionForSelectionGranularity:(int64_t)a3 enclosingPoint:(CGPoint)a4 inContainerAtLocation:(id)a5 bounds:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v11 = a4.y;
  double v12 = a4.x;
  if (self->_supportsLayoutOrientation) {
    uint64_t v15 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "textLayoutOrientationAtLocation:", a5);
  }
  else {
    uint64_t v15 = 0;
  }
  __int16 v26 = 0;
  id v16 = -[NSTextSelectionNavigation _lineFragmentInfoForPoint:inContainerAtLocation:bounds:layoutOrientation:beforeLineFragment:afterLineFragment:lineFragmentRange:](self, "_lineFragmentInfoForPoint:inContainerAtLocation:bounds:layoutOrientation:beforeLineFragment:afterLineFragment:lineFragmentRange:", a5, v15, (char *)&v26 + 1, &v26, 0, v12, v11, x, y, width, height);
  if (!v16) {
    return 0;
  }
  uint64_t v17 = v16;
  if (HIBYTE(v26))
  {
    id v18 = (double *)[v16 logicalFirstCaret];
  }
  else
  {
    if (!(_BYTE)v26)
    {
      if (!self->_rotatesCoordinateSystemForLayoutOrientation || v15 == 0) {
        double v20 = v12;
      }
      else {
        double v20 = v11;
      }
      goto LABEL_11;
    }
    id v18 = (double *)[v16 logicalLastCaret];
  }
  double v20 = *v18;
LABEL_11:
  uint64_t v21 = [v17 textRangeOfCharacterAtOffset:0 fractionOfDistanceThroughGlyph:v20];
  if (v21)
  {
    double v22 = [[NSTextSelection alloc] initWithRange:v21 affinity:0 granularity:0];
    double v23 = [(NSTextSelectionNavigation *)self textSelectionForSelectionGranularity:a3 enclosingTextSelection:v22];

    id v19 = v23;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (NSTextSelection)textSelectionForSelectionGranularity:(NSTextSelectionGranularity)selectionGranularity enclosingPoint:(CGPoint)point inContainerAtLocation:(id)location
{
  return (NSTextSelection *)-[NSTextSelectionNavigation textSelectionForSelectionGranularity:enclosingPoint:inContainerAtLocation:bounds:](self, "textSelectionForSelectionGranularity:enclosingPoint:inContainerAtLocation:bounds:", selectionGranularity, location, point.x, point.y, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (NSArray)textSelectionsInteractingAtPoint:(CGPoint)point inContainerAtLocation:(id)containerLocation anchors:(NSArray *)anchors modifiers:(NSTextSelectionNavigationModifier)modifiers selecting:(BOOL)selecting bounds:(CGRect)bounds
{
  double height = bounds.size.height;
  double width = bounds.size.width;
  double y = bounds.origin.y;
  double x = bounds.origin.x;
  char v13 = modifiers;
  double v16 = point.y;
  double v17 = point.x;
  v85[1] = *MEMORY[0x1E4F143B8];
  if (self->_supportsLayoutOrientation) {
    uint64_t v19 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "textLayoutOrientationAtLocation:", containerLocation);
  }
  else {
    uint64_t v19 = 0;
  }
  BOOL v20 = !self->_rotatesCoordinateSystemForLayoutOrientation || v19 == 0;
  if (v20) {
    double v21 = v17;
  }
  else {
    double v21 = v16;
  }
  __int16 v81 = 0;
  id v80 = 0;
  id v22 = -[NSTextSelectionNavigation _lineFragmentInfoForPoint:inContainerAtLocation:bounds:layoutOrientation:beforeLineFragment:afterLineFragment:lineFragmentRange:](self, "_lineFragmentInfoForPoint:inContainerAtLocation:bounds:layoutOrientation:beforeLineFragment:afterLineFragment:lineFragmentRange:", containerLocation, v19, (char *)&v81 + 1, &v81, &v80, v17, v16, x, y, width, height);
  id v79 = 0;
  if ([(NSArray *)anchors count] <= 1) {
    self->_int64_t multipleSelectionAnchor = 0;
  }
  uint64_t v75 = 0;
  uint64_t v76 = &v75;
  uint64_t v77 = 0x2020000000;
  char v78 = 0;
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke;
  v74[3] = &unk_1E55C5AF8;
  v74[4] = &v75;
  [(NSArray *)anchors enumerateObjectsUsingBlock:v74];
  if (*((unsigned char *)v76 + 24))
  {
    if (v22) {
      goto LABEL_14;
    }
LABEL_17:
    id v24 = 0;
    goto LABEL_66;
  }
  self->_int64_t multipleSelectionAnchor = 0;
  if (!v22) {
    goto LABEL_17;
  }
LABEL_14:
  if (HIBYTE(v81))
  {
    uint64_t v23 = [v22 logicalFirstCaret];
  }
  else if ((_BYTE)v81)
  {
    uint64_t v23 = [v22 logicalLastCaret];
  }
  else
  {
    uint64_t v23 = [v22 caretPositionClosestToOffset:v21];
  }
  uint64_t v25 = v23;
  id v26 = v22;
  if (v25)
  {
    if (self->_multipleSelectionAnchor) {
      id v27 = [(NSArray *)anchors firstObject];
    }
    else {
      id v27 = [(NSArray *)anchors lastObject];
    }
    uint64_t v28 = v27;
    [v27 anchorPositionOffset];
    double v73 = v29;
    if (v28) {
      id v30 = [(NSTextSelectionNavigation *)self _findAnchorInfoForTextSelection:v28 anchorPositionOffset:&v73 anchorLocation:&v79];
    }
    else {
      id v30 = 0;
    }
    double v31 = *(double *)v25;
    id v32 = v30;
    if ((v13 & 3) == 0
      || !v30
      || ![v28 granularity]
      && ((int v33 = objc_msgSend((id)objc_msgSend(v22, "textRange"), "isEqualToTextRange:", objc_msgSend(v30, "textRange")),
           v73 == v31)
        ? (int v34 = v33)
        : (int v34 = 0),
          v34 == 1))
    {
      if ([v80 isEmpty]) {
        uint64_t v35 = 1;
      }
      else {
        uint64_t v35 = objc_msgSend((id)objc_msgSend(v80, "endLocation"), "isEqual:", *(void *)(v25 + 8)) ^ 1;
      }
      uint64_t v39 = [[NSTextSelection alloc] initWithLocation:*(void *)(v25 + 8) affinity:v35];
      uint64_t v40 = v39;
      if ((v13 & 2) != 0) {
        double v41 = v21;
      }
      else {
        double v41 = v31;
      }
      [(NSTextSelection *)v39 setAnchorPositionOffset:v41];
      [(NSTextSelection *)v40 setSecondarySelectionLocation:*(void *)(v25 + 16)];
      [(NSTextSelection *)v40 setLogical:0];
      if ((v13 & 4) != 0 && *((unsigned char *)v76 + 24))
      {
        uint64_t v68 = 0;
        id v69 = &v68;
        uint64_t v70 = 0x3010000000;
        uint64_t v71 = (void (*)(uint64_t, uint64_t))"";
        long long v72 = xmmword_18E5F72A0;
        uint64_t v59 = 0;
        NSWritingDirection v60 = &v59;
        uint64_t v61 = 0x2020000000;
        LOBYTE(v62) = 0;
        int64_t multipleSelectionAnchor = self->_multipleSelectionAnchor;
        BOOL v20 = multipleSelectionAnchor == 0;
        BOOL v43 = multipleSelectionAnchor != 0;
        char v44 = v20;
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_2;
        void v66[3] = &unk_1E55C5B20;
        v66[7] = &v59;
        v66[8] = v25;
        char v67 = v44;
        v66[5] = anchors;
        v66[6] = &v68;
        v66[4] = self;
        [(NSArray *)anchors enumerateObjectsWithOptions:2 * v43 usingBlock:v66];
        uint64_t v45 = (void *)[MEMORY[0x1E4F1CA48] array];
        [v45 addObject:v40];
        objc_msgSend(v45, "replaceObjectsInRange:withObjectsFromArray:range:", *((unsigned char *)v60 + 24) == 0, 0, anchors, v69[4], v69[5]);
        id v24 = v45;
        _Block_object_dispose(&v59, 8);
        _Block_object_dispose(&v68, 8);
        goto LABEL_64;
      }
      v85[0] = v40;
      uint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:1];
      goto LABEL_56;
    }
    if ((v13 & 6) != 0)
    {
      id v36 = [(NSTextSelectionNavigation *)self _rangesForSelectionStartingOffset:v30 inLineFragmentInfo:v22 endingOffset:0 inLineFragmentInfo:v73 contiguous:v21];
      id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_5;
      v56[3] = &unk_1E55C5B98;
      BOOL v57 = (v13 & 2) == 0;
      v56[4] = v37;
      v56[5] = 0;
      *(double *)&v56[6] = v73;
      [v36 enumerateObjectsUsingBlock:v56];
      if ((v13 & 2) != 0)
      {
        uint64_t v40 = [[NSTextSelection alloc] initWithRanges:v37 affinity:1 granularity:0];
        [(NSTextSelection *)v40 setAnchorPositionOffset:v73];
        [(NSTextSelection *)v40 setLogical:0];
        uint64_t v82 = v40;
        id v24 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];

        goto LABEL_64;
      }
      id v24 = (NSArray *)v37;
      uint64_t v68 = 0;
      id v69 = &v68;
      uint64_t v70 = 0x2020000000;
      LOBYTE(v71) = 0;
      if (!v79) {
        id v79 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v28, "textRanges"), "firstObject"), "location");
      }
      BOOL v38 = objc_msgSend(-[NSArray firstObject](v24, "firstObject"), "textRanges");
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_6;
      v55[3] = &unk_1E55C5B48;
      v55[4] = v79;
      v55[5] = &v68;
      [v38 enumerateObjectsUsingBlock:v55];
      if (!*((unsigned char *)v69 + 24)) {
        self->_int64_t multipleSelectionAnchor = 1;
      }
      _Block_object_dispose(&v68, 8);
    }
    else
    {
      id v24 = [(NSTextSelectionNavigation *)self _rangesForSelectionStartingOffset:v30 inLineFragmentInfo:v22 endingOffset:1 inLineFragmentInfo:v73 contiguous:v31];
      if (v24)
      {
        BOOL v47 = (!v79 || [v79 compare:*(void *)(v25 + 8)] != 1)
           && !objc_msgSend((id)objc_msgSend(v80, "endLocation"), "isEqual:", *(void *)(v25 + 8));
        if ([v28 granularity]
          && (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v28, "textRanges"), "firstObject"), "isEmpty") & 1) == 0)
        {
          uint64_t v68 = 0;
          id v69 = &v68;
          uint64_t v70 = 0x3052000000;
          uint64_t v71 = __Block_byref_object_copy__1;
          *(void *)&long long v72 = __Block_byref_object_dispose__1;
          *((void *)&v72 + 1) = 0;
          char v50 = (void *)[v28 textRanges];
          v65[0] = MEMORY[0x1E4F143A8];
          v65[1] = 3221225472;
          v65[2] = __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_3;
          v65[3] = &unk_1E55C5B48;
          v65[4] = v79;
          v65[5] = &v68;
          [v50 enumerateObjectsUsingBlock:v65];
          if (v69[5])
          {
            if (objc_msgSend(-[NSArray firstObject](v24, "firstObject"), "isEmpty"))
            {
              uint64_t v84 = v69[5];
              id v24 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
            }
            else
            {
              uint64_t v59 = 0;
              NSWritingDirection v60 = &v59;
              uint64_t v61 = 0x3052000000;
              uint64_t v62 = __Block_byref_object_copy__1;
              char v63 = __Block_byref_object_dispose__1;
              uint64_t v64 = 0;
              v58[0] = MEMORY[0x1E4F143A8];
              v58[1] = 3221225472;
              v58[2] = __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_4;
              v58[3] = &unk_1E55C5B70;
              v58[5] = &v68;
              v58[6] = &v59;
              v58[4] = v24;
              [(NSArray *)v24 enumerateObjectsUsingBlock:v58];
              unsigned int v51 = (void *)v60[5];
              if (v51) {
                id v24 = v51;
              }
              _Block_object_dispose(&v59, 8);
            }
          }
          _Block_object_dispose(&v68, 8);
        }
        uint64_t v40 = -[NSTextSelection initWithRanges:affinity:granularity:]([NSTextSelection alloc], "initWithRanges:affinity:granularity:", v24, v47, [v28 granularity]);
        if ([(NSTextSelection *)v40 granularity])
        {
          BOOL v52 = -[NSTextSelectionNavigation textSelectionForSelectionGranularity:enclosingTextSelection:](self, "textSelectionForSelectionGranularity:enclosingTextSelection:", [v28 granularity], v40);

          uint64_t v40 = v52;
        }
        [(NSTextSelection *)v40 setAnchorPositionOffset:v73];
        [(NSTextSelection *)v40 setLogical:0];
        id v83 = v40;
        uint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
LABEL_56:
        id v24 = (NSArray *)v46;
LABEL_64:

        goto LABEL_65;
      }
    }
    uint64_t v40 = 0;
    goto LABEL_64;
  }
  id v24 = 0;
LABEL_65:

LABEL_66:
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_7;
  v53[3] = &unk_1E55C5BC0;
  BOOL v54 = selecting;
  v53[4] = v79;
  [(NSArray *)v24 enumerateObjectsUsingBlock:v53];
  if (!selecting) {
    self->_int64_t multipleSelectionAnchor = 0;
  }

  if (v24) {
    uint64_t v48 = v24;
  }
  else {
    uint64_t v48 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  _Block_object_dispose(&v75, 8);
  return v48;
}

uint64_t __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isTransient];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  BOOL v7 = objc_msgSend(*(id *)(a1 + 32), "_rangeOfCombinedLineFragmentsInRanges:", objc_msgSend(a2, "textRanges"));
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 64) + 8), "compare:", objc_msgSend(v7, "location"));
  uint64_t v9 = result;
  if (*(unsigned char *)(a1 + 72))
  {
    if (result == 1)
    {
      uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 64) + 8), "compare:", objc_msgSend(v7, "endLocation"));
      if (result != -1) {
        return result;
      }
      goto LABEL_12;
    }
    if (a3 || result != -1)
    {
LABEL_12:
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      *(void *)(v11 + 32) = 0;
      *(void *)(v11 + 40) = a3;
      goto LABEL_14;
    }
    *(_OWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = xmmword_18E5F73B0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *(void *)(*(void *)(a1 + 32) + 80) = 1;
  }
  else
  {
    uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 64) + 8), "compare:", objc_msgSend(v7, "endLocation"));
    if (result == -1) {
      return result;
    }
    uint64_t result = [*(id *)(a1 + 40) count];
    if (result - 1 != a3 || v9 == -1)
    {
      uint64_t result = [*(id *)(a1 + 40) count];
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      *(void *)(v12 + 32) = a3;
      *(void *)(v12 + 40) = result - a3;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      *(void *)(v10 + 32) = a3;
      *(void *)(v10 + 40) = 1;
      *(void *)(*(void *)(a1 + 32) + 80) = 0;
    }
  }
LABEL_14:
  *a4 = 1;
  return result;
}

id __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = (id)[a2 containsLocation:*(void *)(a1 + 32)];
  if (result)
  {
    id result = a2;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
    *a4 = 1;
  }
  return result;
}

uint64_t __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ((objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "location"), "isEqual:", objc_msgSend(a2, "endLocation")) & 1) != 0|| (uint64_t result = objc_msgSend((id)objc_msgSend(a2, "location"), "isEqual:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "endLocation")), result))
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) mutableCopy];
    uint64_t result = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "replaceObjectAtIndex:withObject:", a3, objc_msgSend(a2, "textRangeByFormingUnionWithTextRange:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)));
    *a4 = 1;
  }
  return result;
}

void __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_5(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 56))
  {
    BOOL v8 = [[NSTextSelection alloc] initWithRanges:*(void *)(a1 + 32) affinity:1 granularity:0];
    [*(id *)(a1 + 40) setAnchorPositionOffset:*(double *)(a1 + 48)];
    [*(id *)(a1 + 40) setLogical:0];
    [*(id *)(a1 + 32) addObject:v8];
  }
  else
  {
    int64_t v4 = (void *)[a2 firstObject];
    uint64_t v5 = [*(id *)(a1 + 32) count];
    if (v5)
    {
      uint64_t v6 = v5;
      if ([v4 isEmpty]) {
        return;
      }
      if (v6 == 1 && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "firstObject"), "isEmpty")) {
        [*(id *)(a1 + 32) removeObjectAtIndex:0];
      }
    }
    BOOL v7 = *(void **)(a1 + 32);
    [v7 addObjectsFromArray:a2];
  }
}

uint64_t __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 containsLocation:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __119__NSTextSelectionNavigation_textSelectionsInteractingAtPoint_inContainerAtLocation_anchors_modifiers_selecting_bounds___block_invoke_7(uint64_t a1, void *a2)
{
  [a2 setTransient:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 32);

  return [a2 setSelectionAnchorLocation:v4];
}

- (id)textSelectionsInteractingAtPoint:(CGPoint)a3 inContainerAtLocation:(id)a4 anchors:(id)a5 modifiers:(unint64_t)a6 selecting:(BOOL)a7
{
  return -[NSTextSelectionNavigation textSelectionsInteractingAtPoint:inContainerAtLocation:anchors:modifiers:selecting:bounds:](self, "textSelectionsInteractingAtPoint:inContainerAtLocation:anchors:modifiers:selecting:bounds:", a4, a5, a6, a7, a3.x, a3.y, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (NSTextSelection)textSelectionForSelectionGranularity:(NSTextSelectionGranularity)selectionGranularity enclosingTextSelection:(NSTextSelection *)textSelection
{
  id v7 = [(NSArray *)[(NSTextSelection *)textSelection textRanges] lastObject];
  BOOL v8 = objc_msgSend(-[NSArray firstObject](-[NSTextSelection textRanges](textSelection, "textRanges"), "firstObject"), "location");
  uint64_t v9 = [v7 endLocation];
  uint64_t v10 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "textRangeForSelectionGranularity:enclosingLocation:", selectionGranularity, v8);
  if (!v10) {
    return textSelection;
  }
  uint64_t v11 = (void *)v10;
  if (([v8 isEqual:v9] & 1) == 0 && (objc_msgSend(v11, "containsLocation:", v9) & 1) == 0)
  {
    uint64_t v12 = objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "textRangeForSelectionGranularity:enclosingLocation:", selectionGranularity, objc_msgSend(-[NSTextSelectionNavigation textSelectionDataSource](self, "textSelectionDataSource"), "locationFromLocation:withOffset:", v9, -1));
    if (v12)
    {
      uint64_t v11 = (void *)[v11 textRangeByFormingUnionWithTextRange:v12];
      if (!v11) {
        return textSelection;
      }
    }
  }
  char v13 = [[NSTextSelection alloc] initWithRange:v11 affinity:1 granularity:selectionGranularity];

  return v13;
}

- (id)resolvedInsertionLocationForTextSelection:(NSTextSelection *)textSelection writingDirection:(NSTextSelectionNavigationWritingDirection)writingDirection
{
  if (!objc_msgSend(-[NSArray firstObject](-[NSTextSelection textRanges](textSelection, "textRanges"), "firstObject"), "isEmpty"))return 0; {
  if ((-[NSTextSelectionNavigation _bidiLevelAtLocation:affinity:](self, "_bidiLevelAtLocation:affinity:", objc_msgSend(-[NSArray firstObject](-[NSTextSelection textRanges](textSelection, "textRanges"), "firstObject"), "location"), -[NSTextSelection affinity](textSelection, "affinity")) & 1) == writingDirection)
  }
  {
    id v7 = [(NSArray *)[(NSTextSelection *)textSelection textRanges] firstObject];
    return (id)[v7 location];
  }
  else
  {
    return [(NSTextSelection *)textSelection secondarySelectionLocation];
  }
}

- (id)deletionRangesForTextSelection:(id)a3 direction:(int64_t)a4 destination:(int64_t)a5 allowsDecomposition:(BOOL)a6 confined:(BOOL)a7
{
  BOOL v7 = a7;
  v28[1] = *MEMORY[0x1E4F143B8];
  char v13 = (NSArray *)[a3 textRanges];
  if ([(NSArray *)v13 count] == 1
    && objc_msgSend(-[NSArray firstObject](v13, "firstObject"), "isEmpty"))
  {
    if (a5)
    {
      char v13 = [[(NSTextSelectionNavigation *)self destinationSelectionForTextSelection:a3 direction:a4 destination:a5 extending:1 confined:v7] textRanges];
    }
    else
    {
      int64_t v14 = [(NSTextSelectionNavigation *)self _logicalDirectionForDirection:a4 textSelection:a3];
      uint64_t v15 = objc_msgSend(-[NSArray firstObject](v13, "firstObject"), "location");
      uint64_t v22 = 0;
      uint64_t v23 = &v22;
      uint64_t v24 = 0x3052000000;
      uint64_t v25 = __Block_byref_object_copy__1;
      id v26 = __Block_byref_object_dispose__1;
      uint64_t v27 = 0;
      id v16 = [(NSTextSelectionNavigation *)self textSelectionDataSource];
      uint64_t v17 = 2;
      if (v14 == 1) {
        uint64_t v17 = 262;
      }
      uint64_t v18 = 512;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __111__NSTextSelectionNavigation_deletionRangesForTextSelection_direction_destination_allowsDecomposition_confined___block_invoke;
      v21[3] = &unk_1E55C5BE8;
      if (v14 == 1 && a6) {
        uint64_t v18 = 0;
      }
      void v21[5] = &v22;
      v21[6] = v18;
      v21[4] = self;
      [v16 enumerateSubstringsFromLocation:v15 options:v18 | v17 usingBlock:v21];
      uint64_t v19 = (void *)v23[5];
      if (v19)
      {
        v28[0] = v23[5];
        char v13 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
        uint64_t v19 = (void *)v23[5];
      }

      _Block_object_dispose(&v22, 8);
    }
  }
  return [(NSTextSelectionNavigation *)self _rangesWithDirectionalFormatAdjustmentsForRanges:v13];
}

uint64_t __111__NSTextSelectionNavigation_deletionRangesForTextSelection_direction_destination_allowsDecomposition_confined___block_invoke(uint64_t result, void *a2, void *a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v7 = result;
  if (!*(void *)(result + 48))
  {
    uint64_t result = [a2 length];
    if (result >= 1)
    {
      uint64_t v9 = result;
      if ((unint64_t)result >= 3 && ([a2 characterAtIndex:result - 1] & 0xFC00) == 0xDC00)
      {
        if (([a2 characterAtIndex:v9 - 2] & 0xFC00) == 0xD800) {
          uint64_t v10 = -2;
        }
        else {
          uint64_t v10 = -1;
        }
      }
      else
      {
        uint64_t v10 = -1;
      }
      uint64_t result = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", objc_msgSend((id)objc_msgSend(*(id *)(v7 + 32), "textSelectionDataSource"), "locationFromLocation:withOffset:", objc_msgSend(*(id *)(*(void *)(*(void *)(v7 + 40) + 8) + 40), "endLocation"), v10), objc_msgSend(*(id *)(*(void *)(*(void *)(v7 + 40) + 8) + 40), "endLocation"));
      *(void *)(*(void *)(*(void *)(v7 + 40) + 8) + 40) = result;
    }
  }
  if (!*(void *)(*(void *)(*(void *)(v7 + 40) + 8) + 40))
  {
    uint64_t result = a3;
    *(void *)(*(void *)(*(void *)(v7 + 40) + 8) + 40) = result;
  }
  *a5 = 1;
  return result;
}

- (NSArray)deletionRangesForTextSelection:(NSTextSelection *)textSelection direction:(NSTextSelectionNavigationDirection)direction destination:(NSTextSelectionNavigationDestination)destination allowsDecomposition:(BOOL)allowsDecomposition
{
  return (NSArray *)[(NSTextSelectionNavigation *)self deletionRangesForTextSelection:textSelection direction:direction destination:destination allowsDecomposition:allowsDecomposition confined:destination == NSTextSelectionNavigationDestinationLine];
}

- (BOOL)allowsNonContiguousRanges
{
  return self->_allowsNonContiguousRanges;
}

- (void)setAllowsNonContiguousRanges:(BOOL)allowsNonContiguousRanges
{
  self->_allowsNonContiguousRanges = allowsNonContiguousRanges;
}

- (BOOL)rotatesCoordinateSystemForLayoutOrientation
{
  return self->_rotatesCoordinateSystemForLayoutOrientation;
}

- (void)setRotatesCoordinateSystemForLayoutOrientation:(BOOL)rotatesCoordinateSystemForLayoutOrientation
{
  self->_rotatesCoordinateSystemForLayoutOrientation = rotatesCoordinateSystemForLayoutOrientation;
}

- (id)destinationForTextSelection:(id)a3 direction:(int64_t)a4 destination:(int64_t)a5 extending:(BOOL)a6
{
  return [(NSTextSelectionNavigation *)self destinationSelectionForTextSelection:a3 direction:a4 destination:a5 extending:a6 confined:0];
}

- (void)_location:withAffinity:isAtBoundaryOfDestination:onSide:.cold.1()
{
  __assert_rtn("-[NSTextSelectionNavigation _location:withAffinity:isAtBoundaryOfDestination:onSide:]", "NSTextSelectionNavigation.m", 1407, "side == NSTextSelectionNavigationDirectionForward || side == NSTextSelectionNavigationDirectionBackward");
}

@end
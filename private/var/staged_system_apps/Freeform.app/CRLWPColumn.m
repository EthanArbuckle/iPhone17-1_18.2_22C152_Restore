@interface CRLWPColumn
+ (BOOL)partitionedAttachmentStartsAtCharIndex:(unint64_t)a3 withColumns:(id)a4;
+ (CGPoint)connectionLinePointForChangeRange:(_NSRange)a3 withColumns:(id)a4 layoutTarget:(id)a5;
+ (CGPoint)p_pinPoint:(CGPoint)a3 toRect:(CGRect)a4;
+ (CGPoint)pinPoint:(CGPoint)a3 toBottomOfLineFragmentInColumns:(id)a4;
+ (CGPoint)pinToNaturalBounds:(CGPoint)a3 andLastLineFragment:(BOOL)a4 inLayoutTarget:(id)a5;
+ (CGRect)boundsRectForSelection:(id)a3 columnArray:(id)a4 includeRuby:(BOOL)a5 includePaginatedAttachments:(BOOL)a6;
+ (CGRect)caretRectForInsertionPoint:(id)a3 withColumns:(id)a4;
+ (CGRect)columnRectForRange:(_NSRange)a3 withColumns:(id)a4;
+ (CGRect)frameBoundsOfColumns:(id)a3;
+ (CGRect)labelRectForCharIndex:(unint64_t)a3 withColumns:(id)a4;
+ (CGRect)rectForSelection:(id)a3 withColumns:(id)a4;
+ (CGRect)rectForSelection:(id)a3 withColumns:(id)a4 useParagraphModeRects:(BOOL)a5;
+ (_NSRange)charRangeForPencilAnnotationStartPoint:(CGPoint)a3 toEndPoint:(CGPoint)a4 inLayoutTarget:(id)a5 onSingleLineFragment:(BOOL)a6;
+ (_NSRange)rangeOfColumns:(id)a3;
+ (id)closestColumnInColumnsArray:(id)a3 forPoint:(CGPoint)a4 ignoreEmptyColumns:(BOOL)a5 ignoreDrawableOnlyColumns:(BOOL)a6;
+ (id)columnForCharIndex:(unint64_t)a3 allowEndOfColumn:(BOOL)a4 withColumns:(id)a5;
+ (id)commentKnobBaseOriginForHighlightAtTextRange:(_NSRange)a3 withColumns:(id)a4 positionForRTL:(BOOL)a5;
+ (id)contentRectsToAvoidPencilAnnotationOverlapWithColumns:(id)a3;
+ (id)pathForHighlightWithRange:(_NSRange)a3 columnArray:(id)a4 pathStyle:(int)a5;
+ (id)selectionRectsforColumns:(id)a3 forSelection:(id)a4;
+ (id)smartFieldWithAttributeKind:(unint64_t)a3 inColumnArray:(id)a4 atPoint:(CGPoint)a5;
+ (unint64_t)charIndexForPoint:(CGPoint)a3 inColumnsArray:(id)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 ignoreEmptyColumns:(BOOL)a7 isAtEndOfLine:(BOOL *)a8 leadingEdge:(BOOL *)a9;
+ (unint64_t)charIndexForPoint:(CGPoint)a3 inColumnsArray:(id)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 pastCenterGoesToNextChar:(BOOL)a7 constrainToAscentAndDescent:(BOOL)a8 ignoreEmptyColumns:(BOOL)a9 isAtEndOfLine:(BOOL *)a10 leadingEdge:(BOOL *)a11;
+ (unint64_t)charIndexForPoint:(CGPoint)a3 inColumnsArray:(id)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 pastCenterGoesToNextChar:(BOOL)a7 ignoreEmptyColumns:(BOOL)a8 isAtEndOfLine:(BOOL *)a9 leadingEdge:(BOOL *)a10;
+ (unint64_t)charIndexForPointWithPinning:(CGPoint)a3 inLayoutTarget:(id)a4;
+ (unint64_t)charIndexForPointWithPinning:(CGPoint)a3 isTail:(BOOL)a4 selectionType:(unint64_t)a5 inLayoutTarget:(id)a6;
+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 constrainToAscentAndDescent:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 leadingEdge:(BOOL *)a8 inLayoutTarget:(id)a9;
+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 isAtEndOfLine:(BOOL *)a6 leadingEdge:(BOOL *)a7 inLayoutTarget:(id)a8;
+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 pastCenterGoesToNextChar:(BOOL)a6 constrainToAscentAndDescent:(BOOL)a7 isAtEndOfLine:(BOOL *)a8 leadingEdge:(BOOL *)a9 ignoreEmptyColumns:(BOOL)a10 inLayoutTarget:(id)a11;
+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 pastCenterGoesToNextChar:(BOOL)a6 constrainToAscentAndDescent:(BOOL)a7 isAtEndOfLine:(BOOL *)a8 leadingEdge:(BOOL *)a9 inLayoutTarget:(id)a10;
+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 pastCenterGoesToNextChar:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 leadingEdge:(BOOL *)a8 inLayoutTarget:(id)a9;
+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 constrainToAscentAndDescent:(BOOL)a5 isAtEndOfLine:(BOOL *)a6 inLayoutTarget:(id)a7;
+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 isAtEndOfLine:(BOOL *)a5 inLayoutTarget:(id)a6;
+ (void)calculateSelectionPinRectsForSelection:(id)a3 inColumns:(id)a4 outSelectionPinRect:(CGRect *)a5 outSelectionTailPinRect:(CGRect *)a6;
+ (void)populateHeadAndTailCharIndicesInSelection:(id)a3 forColumns:(id)a4;
- ($1C7B61A4053D036F47119D3E279950B5)lineMetricsAtCharIndex:(SEL)a3 allowEndOfLine:(unint64_t)a4;
- (BOOL)lastLineIsEmptyAndHasListLabel;
- (BOOL)p_isFirstPartitionForCharIndex:(unint64_t)a3;
- (BOOL)p_pencilAnnotationsShouldSkipLineFragment:(const void *)a3;
- (BOOL)requiresGlyphVectorsForHeightMeasurement;
- (BOOL)terminatedByBreak;
- (BOOL)textIsVertical;
- (CGAffineTransform)transformFromWP;
- (CGAffineTransform)transformToWP;
- (CGRect)boundsOfLineFragmentAtIndex:(unint64_t)a3;
- (CGRect)caretRectForSelection:(id)a3;
- (CGRect)columnRectForRange:(_NSRange)a3;
- (CGRect)erasableBounds:(unint64_t)a3;
- (CGRect)erasableRectForSelectionRange:(_NSRange)a3;
- (CGRect)firstRectForSelection:(id)a3 includeSpaceAfter:(BOOL)a4 includeSpaceBefore:(BOOL)a5 includeLeading:(BOOL)a6;
- (CGRect)frameBounds;
- (CGRect)glyphRectForRange:(_NSRange)a3 includingLabel:(BOOL)a4;
- (CGRect)glyphRectForRubyFieldAtCharIndex:(unint64_t)a3 glyphRange:(_NSRange)a4;
- (CGRect)rawGlyphRectOfRange:(_NSRange)a3;
- (CGRect)typographicBounds;
- (CGSize)maxSize;
- (CRLWPColumn)initWithStorage:(id)a3 frameBounds:(CGRect)a4;
- (CRLWPFontHeightInfo)fontHeightInfoAtCharIndex:(SEL)a3;
- (CRLWPStyleProvider)styleProvider;
- (_NSRange)anchoredRange;
- (_NSRange)range;
- (_NSRange)rangeOfLineFragmentAtIndex:(unint64_t)a3;
- (_TtC8Freeform12CRLWPStorage)storage;
- (const)lineFragmentArray;
- (const)lineFragmentArrayForUnitTests;
- (const)lineFragmentAtIndex:(unint64_t)a3;
- (const)lineFragmentClosestToPoint:(CGPoint)a3 knobTag:(unint64_t)a4;
- (const)lineFragmentForCharIndex:(unint64_t)a3 knobTag:(unint64_t)a4 selectionType:(unint64_t)a5;
- (const)nearestLineFragmentWithSameVerticalPositionAs:(unint64_t)a3 xPos:(double)a4;
- (const)pColumnEndingPartitionedLineFragmentInSelectionRange:(_NSRange)a3;
- (double)baselineOfLineFragmentAtIndex:(unint64_t)a3;
- (double)contentBlockBottom;
- (double)erasableContentBottom;
- (double)horizontalOffsetForCharIndex:(unint64_t)a3 lineFragmentIndex:(unint64_t)a4 bumpPastHyphen:(BOOL)a5 allowPastLineBounds:(BOOL)a6;
- (double)logicalBoundsBottom;
- (double)logicalBoundsTop;
- (double)minimumHeightForLayoutOnPage;
- (double)nextLinePosition;
- (double)textBlockBottom;
- (double)textHeight;
- (id).cxx_construct;
- (id)drawableIntersectionRectsForSelection:(id)a3 inTarget:(id)a4;
- (id)initForTestingWithStorage:(id)a3 frameBounds:(CGRect)a4;
- (id)lineSelectionsForSelection:(id)a3;
- (id)naturalRectsForSelection:(id)a3 ranges:(id *)a4;
- (id)pMutableRectsForSelectionRange:(_NSRange)a3 selectionType:(unint64_t)a4 includeSpaceAfter:(BOOL)a5 includeSpaceBefore:(BOOL)a6 includeLeading:(BOOL)a7 forParagraphMode:(BOOL)a8 includeRuby:(BOOL)a9 includePaginatedAttachments:(BOOL)a10 inranges:(id)a11 outranges:(id *)a12;
- (id)pTransformReturnRects:(id)a3;
- (id)partitionedLayoutOfLineFragmentAtIndex:(unint64_t)a3;
- (id)rectsForSelection:(id)a3 ranges:(id *)a4;
- (id)rectsForSelection:(id)a3 ranges:(id *)a4 includePaginatedAttachments:(BOOL)a5;
- (id)rectsForSelectionRange:(_NSRange)a3 selectionType:(unint64_t)a4 forParagraphMode:(BOOL)a5 includeRuby:(BOOL)a6 includePaginatedAttachments:(BOOL)a7;
- (id)rectsForSelectionRanges:(id)a3 selectionType:(unint64_t)a4;
- (id)smartFieldAtCharIndex:(unint64_t)a3 attributeKind:(unint64_t)a4;
- (unint64_t)anchoredCharCount;
- (unint64_t)charIndexForSelectionFromPoint:(CGPoint)a3 isTail:(BOOL)a4;
- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 pastCenterGoesToNextChar:(BOOL)a5 allowNotFound:(BOOL)a6 constrainToAscentAndDescent:(BOOL)a7 isAtEndOfLine:(BOOL *)a8 leadingEdge:(BOOL *)a9;
- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 pastCenterGoesToNextChar:(BOOL)a5 allowNotFound:(BOOL)a6 constrainToAscentAndDescent:(BOOL)a7 isAtEndOfLine:(BOOL *)a8 outFragment:(const CRLWPLineFragment *)a9 leadingEdge:(BOOL *)a10;
- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 pastCenterGoesToNextChar:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 leadingEdge:(BOOL *)a8;
- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 pastCenterGoesToNextChar:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 outFragment:(const CRLWPLineFragment *)a8 leadingEdge:(BOOL *)a9;
- (unint64_t)charIndexFromWPPoint:(CGPoint)a3 pastCenterGoesToNextChar:(BOOL)a4 allowNotFound:(BOOL)a5 constrainToAscentAndDescent:(BOOL)a6 outFragment:(const CRLWPLineFragment *)a7 leadingEdge:(BOOL *)a8;
- (unint64_t)characterCount;
- (unint64_t)columnIndex;
- (unint64_t)glyphCountForRubyFieldAtCharIndex:(unint64_t)a3;
- (unint64_t)layoutResultFlags;
- (unint64_t)lineCount;
- (unint64_t)lineFragmentCountForBaseline:(double)a3;
- (unint64_t)lineIndexForCharIndex:(unint64_t)a3 eol:(BOOL)a4;
- (unint64_t)nextWidowPullsDownFromCharIndex;
- (unint64_t)pRemapCharIndex:(unint64_t)a3 outIsAfterBreak:(BOOL *)a4 outWithTextSource:(id *)a5;
- (unint64_t)p_charIndexWithTextClosestToWPPoint:(CGPoint)a3 pastCenterGoesToNextChar:(BOOL)a4 outFragment:(const CRLWPLineFragment *)a5 leadingEdge:(BOOL *)a6;
- (unint64_t)pageNumber;
- (unint64_t)scaleTextPercent;
- (unint64_t)startAnchoredCharIndex;
- (unint64_t)startCharIndex;
- (unint64_t)storageChangeCount;
- (unsigned)fontTraitsForRange:(_NSRange)a3 includingLabel:(BOOL)a4;
- (unsigned)hyphenCharOfLineFragmentAtIndex:(unint64_t)a3;
- (void)addAdornmentRect:(id)a3;
- (void)clearAdornments;
- (void)dealloc;
- (void)enumerateParagraphAdornmentsUsingBlock:(id)a3;
- (void)makeEmpty:(unint64_t)a3 anchoredRange:(_NSRange)a4 layoutResultFlags:(unint64_t)a5;
- (void)offsetLineFragmentsBy:(CGSize)a3;
- (void)pInfoForCharIndex:(unint64_t)a3 isAtStart:(BOOL *)a4 isAtEnd:(BOOL *)a5;
- (void)renderWithRenderer:(id)a3 currentSelection:(id)a4 limitSelection:(id)a5 listRange:(_NSRange)a6 rubyGlyphRange:(_NSRange)a7 isCanvasInteractive:(BOOL)a8 isInDrawingMode:(BOOL)a9 spellChecker:(id)a10 suppressedMisspellingRange:(_NSRange)a11 blackAndWhite:(BOOL)a12 dictationInterpretations:(id)a13 autocorrections:(id)a14 markedRange:(_NSRange)a15 markedText:(id)a16 renderMode:(unint64_t)a17 pageCount:(unint64_t)a18 suppressInvisibles:(BOOL)a19 currentCanvasSelection:(id)a20;
- (void)setAnchoredRange:(_NSRange)a3;
- (void)setCharacterCount:(unint64_t)a3;
- (void)setColumnIndex:(unint64_t)a3;
- (void)setContentBlockBottom:(double)a3;
- (void)setErasableContentBottom:(double)a3;
- (void)setFrameBounds:(CGRect)a3;
- (void)setLayoutResultFlags:(unint64_t)a3;
- (void)setLineFragmentArray:(const void *)a3;
- (void)setNextLinePosition:(double)a3;
- (void)setNextWidowPullsDownFromCharIndex:(unint64_t)a3;
- (void)setPageNumber:(unint64_t)a3;
- (void)setRange:(_NSRange)a3;
- (void)setScaleTextPercent:(unint64_t)a3;
- (void)setStartCharIndex:(unint64_t)a3;
- (void)setStorageChangeCount:(unint64_t)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTextIsVertical:(BOOL)a3;
- (void)setTransformFromWP:(CGAffineTransform *)a3;
@end

@implementation CRLWPColumn

- (BOOL)lastLineIsEmptyAndHasListLabel
{
  ptr = self->_lineFragmentArray.__ptr_;
  if (ptr)
  {
    ptr = (void *)sub_1000399F8(ptr);
    if (ptr) {
      LOBYTE(ptr) = (*(void *)(sub_100039A08(self->_lineFragmentArray.__ptr_, (unint64_t)ptr - 1) + 24) & 0x2004800) == 33570816;
    }
  }
  return (char)ptr;
}

- (BOOL)terminatedByBreak
{
  return (BYTE1(self->_layoutResultFlags) >> 3) & 1;
}

+ (id)contentRectsToAvoidPencilAnnotationOverlapWithColumns:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  if ([v3 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v16;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v10 = [v9 range:v15];
          [v9 columnRectForRange:v10, v11];
          v12 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:");
          [v4 addObject:v12];
        }
        id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
  }
  id v13 = [v4 copy:v15];

  return v13;
}

+ (CGRect)frameBoundsOfColumns:(id)a3
{
  id v3 = a3;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v3;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v11) frameBounds:(void)v20];
        v28.origin.CGFloat x = v12;
        v28.origin.CGFloat y = v13;
        v28.size.CGFloat width = v14;
        v28.size.CGFloat height = v15;
        v25.origin.CGFloat x = x;
        v25.origin.CGFloat y = y;
        v25.size.CGFloat width = width;
        v25.size.CGFloat height = height;
        CGRect v26 = CGRectUnion(v25, v28);
        CGFloat x = v26.origin.x;
        CGFloat y = v26.origin.y;
        CGFloat width = v26.size.width;
        CGFloat height = v26.size.height;
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

+ (CGRect)caretRectForInsertionPoint:(id)a3 withColumns:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v54;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v54 != v13) {
          objc_enumerationMutation(v11);
        }
        CGFloat v15 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        [v15 caretRectForSelection:v5];
        CGFloat x = v16;
        CGFloat y = v17;
        double width = v18;
        double height = v19;
        if ([v15 textIsVertical])
        {
          if (width > 0.0)
          {
            double height = fmax(height, 1.0);
            goto LABEL_14;
          }
        }
        else if (height > 0.0)
        {
          double width = fmax(width, 1.0);
          goto LABEL_14;
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v53 objects:v57 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  v65.origin.CGFloat x = CGRectNull.origin.x;
  v65.origin.CGFloat y = CGRectNull.origin.y;
  v65.size.double width = CGRectNull.size.width;
  v65.size.double height = CGRectNull.size.height;
  v58.origin.CGFloat x = x;
  v58.origin.CGFloat y = y;
  v58.size.double width = width;
  v58.size.double height = height;
  if (!CGRectEqualToRect(v58, v65))
  {
    id v20 = [v5 caretAffinity];
    long long v21 = +[CRLWPColumn columnForCharIndex:allowEndOfColumn:withColumns:](CRLWPColumn, "columnForCharIndex:allowEndOfColumn:withColumns:", [v5 start], v20 == (id)1, v11);
    if (v21)
    {
      uint64_t v52 = 0;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      [v21 lineMetricsAtCharIndex:[v5 start] allowEndOfLine:v20 == (id)1];
      v59.origin = 0u;
      v59.size = 0u;
      if (!CGRectIsNull(v59))
      {
        [v21 transformToWP];
        v60.origin.CGFloat x = x;
        v60.origin.CGFloat y = y;
        v60.size.double width = width;
        v60.size.double height = height;
        CGRect v61 = CGRectApplyAffineTransform(v60, &v31);
        CGFloat v22 = v61.origin.x;
        CGFloat v23 = v61.size.width;
        CGFloat v24 = v61.size.height;
        CGFloat v25 = *((double *)&v32 + 1);
        [v21 transformFromWP];
        v62.origin.CGFloat x = v22;
        v62.origin.CGFloat y = v25;
        v62.size.double width = v23;
        v62.size.double height = v24;
        CGRect v63 = CGRectApplyAffineTransform(v62, &v30);
        CGFloat x = v63.origin.x;
        CGFloat y = v63.origin.y;
        double width = v63.size.width;
        double height = v63.size.height;
      }
    }
  }
  double v26 = x;
  double v27 = y;
  double v28 = width;
  double v29 = height;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

+ (CGRect)rectForSelection:(id)a3 withColumns:(id)a4
{
  [a1 rectForSelection:a3 withColumns:a4 useParagraphModeRects:1];
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

+ (CGRect)rectForSelection:(id)a3 withColumns:(id)a4 useParagraphModeRects:(BOOL)a5
{
  id v6 = a3;
  id v59 = a4;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  if ([v6 isValid])
  {
    id v11 = [v59 firstObject];

    if (v11)
    {
      id v12 = [v59 firstObject];
      uint64_t v13 = [v12 storage];

      if (v13)
      {
        CGRect v58 = v13;
        id v14 = [v6 insertionChar];
        if (v14 > [v13 length])
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E3398);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10108D3A8();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E33B8);
          }
          CGFloat v15 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
          {
            +[CRLAssertionHandler packedBacktraceString];
            objc_claimAutoreleasedReturnValue();
            sub_1010663B0();
          }

          double v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPColumn rectForSelection:withColumns:useParagraphModeRects:]");
          double v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"];
          +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:333 isFatal:0 description:"selection is past the end of storage"];
        }
        if ([v6 isInsertionPoint])
        {
          id v18 = [v6 insertionChar];
          if (v18 <= [v13 length])
          {
            id v20 = [v13 wordAtCharIndex:[v6 range] includePreviousWord:1];
            if (v20 != (char *)0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v21 = v19;
              CGFloat v22 = +[CRLWPColumn columnForCharIndex:allowEndOfColumn:withColumns:](CRLWPColumn, "columnForCharIndex:allowEndOfColumn:withColumns:", [v6 range], [v6 isAtEndOfLine], v59);
              if (v22)
              {
                id v23 = objc_msgSend(v22, "lineIndexForCharIndex:eol:", objc_msgSend(v6, "range"), objc_msgSend(v6, "isAtEndOfLine"));
                if (v23 == [v22 lineIndexForCharIndex:v20 eol:0]
                  && v23 == objc_msgSend(v22, "lineIndexForCharIndex:eol:", &v20[v21], objc_msgSend(v6, "isAtEndOfLine")))
                {
                  id v24 = [v6 copyWithNewRange:v20, v21];

                  id v6 = v24;
                }
              }
            }
          }
        }
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v25 = v59;
        id v26 = [v25 countByEnumeratingWithState:&v64 objects:v69 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v65;
          while (2)
          {
            for (i = 0; i != v26; i = (char *)i + 1)
            {
              if (*(void *)v65 != v27) {
                objc_enumerationMutation(v25);
              }
              double v29 = *(void **)(*((void *)&v64 + 1) + 8 * i);
              if ([v6 isInsertionPoint])
              {
                [v29 caretRectForSelection:v6];
                CGFloat x = v30;
                CGFloat y = v31;
                double width = v32;
                double height = v33;
                if ([v29 textIsVertical])
                {
                  if (width > 0.0)
                  {
                    double height = fmax(height, 1.0);
                    goto LABEL_51;
                  }
                }
                else if (height > 0.0)
                {
                  double width = fmax(width, 1.0);
                  goto LABEL_51;
                }
              }
              else
              {
                id v34 = [v29 range];
                NSUInteger v36 = v35;
                long long v37 = (char *)[v29 lineCount];
                if (v37 && (*((void *)[v29 lineFragmentAtIndex:v37 - 1] + 3) & 0x101) == 1) {
                  ++v36;
                }
                v70.location = (NSUInteger)[v6 range];
                v71.location = (NSUInteger)v34;
                v71.length = v36;
                if (NSIntersectionRange(v70, v71).length)
                {
                  id v38 = [v6 range];
                  long long v40 = [v29 rectsForSelectionRange:v38 selectionType:v39 forParagraphMode:[v6 type] includeRuby:0 includePaginatedAttachments:0];
                  [v29 frameBounds];
                  long long v62 = 0u;
                  long long v63 = 0u;
                  long long v60 = 0u;
                  long long v61 = 0u;
                  id v41 = v40;
                  id v42 = [v41 countByEnumeratingWithState:&v60 objects:v68 count:16];
                  if (v42)
                  {
                    uint64_t v43 = *(void *)v61;
                    do
                    {
                      for (j = 0; j != v42; j = (char *)j + 1)
                      {
                        if (*(void *)v61 != v43) {
                          objc_enumerationMutation(v41);
                        }
                        [*(id *)(*((void *)&v60 + 1) + 8 * (void)j) CGRectValue];
                        uint64_t v47 = v46;
                        uint64_t v49 = v48;
                        double v51 = v50;
                        double v52 = fmax(v45, 1.0);
                        if (v50 <= 0.0) {
                          double v53 = v45;
                        }
                        else {
                          double v53 = v52;
                        }
                        v72.origin.CGFloat x = x;
                        v72.origin.CGFloat y = y;
                        v72.size.double width = width;
                        v72.size.double height = height;
                        CGRect v73 = CGRectUnion(v72, *(CGRect *)&v47);
                        CGFloat x = v73.origin.x;
                        CGFloat y = v73.origin.y;
                        double width = v73.size.width;
                        double height = v73.size.height;
                      }
                      id v42 = [v41 countByEnumeratingWithState:&v60 objects:v68 count:16];
                    }
                    while (v42);
                  }
                }
              }
            }
            id v26 = [v25 countByEnumeratingWithState:&v64 objects:v69 count:16];
            if (v26) {
              continue;
            }
            break;
          }
        }
LABEL_51:

        uint64_t v13 = v58;
      }
    }
  }

  double v54 = x;
  double v55 = y;
  double v56 = width;
  double v57 = height;
  result.size.double height = v57;
  result.size.double width = v56;
  result.origin.CGFloat y = v55;
  result.origin.CGFloat x = v54;
  return result;
}

+ (void)calculateSelectionPinRectsForSelection:(id)a3 inColumns:(id)a4 outSelectionPinRect:(CGRect *)a5 outSelectionTailPinRect:(CGRect *)a6
{
  id v9 = a3;
  id v149 = a4;
  v156 = v9;
  unint64_t v10 = (unint64_t)[v9 type];
  v157 = (char *)[v9 range];
  uint64_t v151 = v11;
  id v12 = [v149 firstObject];
  unsigned int v159 = [v12 textIsVertical];

  if (!a5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E33D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108D430();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E33F8);
    }
    v129 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v129, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d illegal nil parameter", v130, v131, v132, v133, v134, v135, v136, (uint64_t)"+[CRLWPColumn calculateSelectionPinRectsForSelection:inColumns:outSelectionPinRect:outSelectionTailPinRect:]");
    v137 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPColumn calculateSelectionPinRectsForSelection:inColumns:outSelectionPinRect:outSelectionTailPinRect:]");
    v138 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v137 file:v138 lineNumber:431 isFatal:1 description:"illegal nil parameter"];
LABEL_168:

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v147, v148);
    abort();
  }
  if (!a6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3418);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108D4B8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3438);
    }
    v139 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v139, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d illegal nil parameter", v140, v141, v142, v143, v144, v145, v146, (uint64_t)"+[CRLWPColumn calculateSelectionPinRectsForSelection:inColumns:outSelectionPinRect:outSelectionTailPinRect:]");
    v137 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPColumn calculateSelectionPinRectsForSelection:inColumns:outSelectionPinRect:outSelectionTailPinRect:]");
    v138 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v137 file:v138 lineNumber:432 isFatal:1 description:"illegal nil parameter"];
    goto LABEL_168;
  }
  if (v10 == 7)
  {
    uint64_t v13 = (char *)[v9 headCharIndex];
    id v14 = (char *)[v9 tailCharIndex];
    if (v14 >= v13) {
      CGFloat v15 = v13;
    }
    else {
      CGFloat v15 = v14;
    }
    double v16 = (char *)[v156 headCharIndex];
    double v17 = (char *)[v156 tailCharIndex];
    if (v16 <= v17) {
      id v18 = v17;
    }
    else {
      id v18 = v16;
    }
    if (v15 == (char *)0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v19 = v157;
    }
    else {
      uint64_t v19 = v15;
    }
    if (v18 == (char *)0x7FFFFFFFFFFFFFFFLL) {
      id v20 = &v157[v151];
    }
    else {
      id v20 = v18 + 1;
    }
    if (v19 <= v20) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = v19;
    }
    if (v19 < v20) {
      id v20 = v19;
    }
    v157 = v20;
    uint64_t v151 = v21 - v20;
  }
  CGSize size = CGRectNull.size;
  a5->origin = CGRectNull.origin;
  a5->CGSize size = size;
  CGSize v23 = CGRectNull.size;
  a6->origin = CGRectNull.origin;
  a6->CGSize size = v23;
  long long v185 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  id obj = v149;
  id v24 = [obj countByEnumeratingWithState:&v185 objects:v191 count:16];
  if (v24)
  {
    uint64_t v152 = *(void *)v186;
    unint64_t v160 = (unint64_t)&v157[v151];
    do
    {
      uint64_t v25 = 0;
      id v153 = v24;
      do
      {
        if (*(void *)v186 != v152) {
          objc_enumerationMutation(obj);
        }
        id v26 = *(void **)(*((void *)&v185 + 1) + 8 * v25);
        [v26 frameBounds];
        CGFloat v171 = v28;
        CGFloat v172 = v27;
        CGFloat v169 = v30;
        CGFloat v170 = v29;
        id v31 = [v156 headCharIndex];
        double v32 = v157;
        if (v31 != (id)0x7FFFFFFFFFFFFFFFLL) {
          double v32 = [v156 headCharIndex];
        }
        double v33 = (char *)[v26 lineFragmentForCharIndex:v32 knobTag:11 selectionType:v10];
        id v34 = [v156 tailCharIndex];
        NSUInteger v35 = &v157[v151];
        if (v34 != (id)0x7FFFFFFFFFFFFFFFLL) {
          NSUInteger v35 = [v156 tailCharIndex];
        }
        NSUInteger v36 = (char *)[v26 lineFragmentForCharIndex:v35 knobTag:10 selectionType:v10];
        uint64_t v37 = (uint64_t)v36;
        p_double y = &CGRectNull.origin.y;
        p_CGSize size = &CGRectNull.size;
        p_CGFloat height = &CGRectNull.size.height;
        if (v33)
        {
          id v41 = (const CGRect *)(v33 + 40);
          id v42 = (CGFloat *)(v33 + 48);
          uint64_t v43 = (CGSize *)(v33 + 56);
          long long v44 = (CGFloat *)(v33 + 64);
          if (!v36) {
            goto LABEL_35;
          }
        }
        else
        {
          long long v44 = &CGRectNull.size.height;
          uint64_t v43 = &CGRectNull.size;
          id v42 = &CGRectNull.origin.y;
          id v41 = &CGRectNull;
          if (!v36)
          {
LABEL_35:
            double v45 = &CGRectNull;
            goto LABEL_36;
          }
        }
        double v45 = (const CGRect *)(v36 + 40);
        p_double y = (CGFloat *)(v36 + 48);
        p_CGSize size = (CGSize *)(v36 + 56);
        p_CGFloat height = (CGFloat *)(v36 + 64);
LABEL_36:
        CGFloat v167 = *v42;
        CGFloat x = v41->origin.x;
        CGFloat v165 = *v44;
        CGFloat width = v43->width;
        CGFloat v163 = p_size->width;
        CGFloat v164 = *p_height;
        CGFloat v161 = *p_y;
        CGFloat v162 = v45->origin.x;
        if (v10 == 7 && [v156 validVisualRanges])
        {
          v155 = [v156 visualRangesArray];
        }
        else
        {
          uint64_t v46 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v157, v151);
          v190 = v46;
          v155 = +[NSArray arrayWithObjects:&v190 count:1];
        }
        long long v183 = 0u;
        long long v184 = 0u;
        long long v181 = 0u;
        long long v182 = 0u;
        uint64_t v47 = [v26 rectsForSelectionRanges:v155 selectionType:v10];
        id v48 = [v47 countByEnumeratingWithState:&v181 objects:v189 count:16];
        uint64_t v154 = v25;
        if (v48)
        {
          uint64_t v49 = *(void *)v182;
          do
          {
            for (i = 0; i != v48; i = (char *)i + 1)
            {
              if (*(void *)v182 != v49) {
                objc_enumerationMutation(v47);
              }
              [*(id *)(*((void *)&v181 + 1) + 8 * i) CGRectValue];
              v230.origin.double y = v171;
              v230.origin.CGFloat x = v172;
              v230.size.CGFloat height = v169;
              v230.size.CGFloat width = v170;
              CGRect v193 = CGRectIntersection(v192, v230);
              double v51 = v193.origin.x;
              double y = v193.origin.y;
              CGFloat v53 = v193.size.width;
              CGFloat height = v193.size.height;
              if (v26) {
                [v26 transformToWP];
              }
              else {
                memset(&v180, 0, sizeof(v180));
              }
              v194.origin.CGFloat x = v51;
              v194.origin.double y = y;
              v194.size.CGFloat width = v53;
              v194.size.CGFloat height = height;
              CGRect v195 = CGRectApplyAffineTransform(v194, &v180);
              CGFloat v55 = v195.origin.x;
              CGFloat v56 = v195.origin.y;
              CGFloat v57 = v195.size.width;
              CGFloat rect2 = v195.size.height;
              if (v10 == 7)
              {
                if (v33)
                {
                  v196.origin.double y = v167;
                  v196.origin.CGFloat x = x;
                  v196.size.CGFloat height = v165;
                  v196.size.CGFloat width = width;
                  v231.origin.CGFloat x = v55;
                  v231.origin.double y = v56;
                  v231.size.CGFloat width = v57;
                  v231.size.CGFloat height = rect2;
                  if (CGRectIntersectsRect(v196, v231))
                  {
                    v197.origin.double y = v167;
                    v197.origin.CGFloat x = x;
                    v197.size.CGFloat height = v165;
                    v197.size.CGFloat width = width;
                    double MinY = CGRectGetMinY(v197);
                    v198.origin.CGFloat x = v55;
                    v198.origin.double y = v56;
                    v198.size.CGFloat width = v57;
                    v198.size.CGFloat height = rect2;
                    double v59 = CGRectGetMinY(v198);
                    BOOL v60 = MinY < v59 || MinY == v59;
                    if (v60 || vabdd_f64(MinY, v59) < 0.01)
                    {
                      v199.origin.CGFloat x = v55;
                      v199.origin.double y = v56;
                      v199.size.CGFloat width = v57;
                      v199.size.CGFloat height = rect2;
                      double MaxY = CGRectGetMaxY(v199);
                      v200.origin.double y = v167;
                      v200.origin.CGFloat x = x;
                      v200.size.CGFloat height = v165;
                      v200.size.CGFloat width = width;
                      double v62 = CGRectGetMaxY(v200);
                      if (MaxY <= v62 || vabdd_f64(MaxY, v62) < 0.01)
                      {
                        CGFloat v63 = a5->origin.x;
                        CGFloat v64 = a5->origin.y;
                        CGFloat v65 = a5->size.width;
                        CGFloat v66 = a5->size.height;
                        if ((v33[25] & 0x10) != 0)
                        {
                          if (CGRectIsEmpty(*(CGRect *)&v63)
                            || (double MaxX = CGRectGetMaxX(*a5),
                                v207.origin.CGFloat x = v51,
                                v207.origin.double y = y,
                                v207.size.CGFloat width = v53,
                                v207.size.CGFloat height = height,
                                MaxX < CGRectGetMaxX(v207)))
                          {
                            double v85 = v51;
                            double v86 = y;
                            CGFloat v87 = v53;
                            CGFloat v88 = height;
                            if (v159)
                            {
                              CGFloat MinX = CGRectGetMinX(*(CGRect *)&v85);
                              v208.origin.CGFloat x = v51;
                              v208.origin.double y = y;
                              v208.size.CGFloat width = v53;
                              v208.size.CGFloat height = height;
                              CGFloat v158 = CGRectGetMaxY(v208);
                              v209.origin.CGFloat x = v51;
                              v209.origin.double y = y;
                              v209.size.CGFloat width = v53;
                              v209.size.CGFloat height = height;
                              double v70 = CGRectGetWidth(v209);
                              double v71 = 1.0;
                            }
                            else
                            {
                              CGFloat MinX = CGRectGetMaxX(*(CGRect *)&v85);
                              v210.origin.CGFloat x = v51;
                              v210.origin.double y = y;
                              v210.size.CGFloat width = v53;
                              v210.size.CGFloat height = height;
                              CGFloat v158 = CGRectGetMinY(v210);
                              v211.origin.CGFloat x = v51;
                              v211.origin.double y = y;
                              v211.size.CGFloat width = v53;
                              v211.size.CGFloat height = height;
                              double v71 = CGRectGetHeight(v211);
                              double v70 = 1.0;
                            }
                            CGFloat v69 = v158;
LABEL_89:
                            a5->origin.CGFloat x = MinX;
                            a5->origin.double y = v69;
                            a5->size.CGFloat width = v70;
                            a5->size.CGFloat height = v71;
                          }
                        }
                        else
                        {
                          IsEmptdouble y = CGRectIsEmpty(*(CGRect *)&v63);
                          CGFloat MinX = v51;
                          CGFloat v69 = y;
                          double v70 = v53;
                          double v71 = height;
                          if (IsEmpty) {
                            goto LABEL_89;
                          }
                          double v72 = CGRectGetMinX(*a5);
                          v201.origin.CGFloat x = v51;
                          v201.origin.double y = y;
                          v201.size.CGFloat width = v53;
                          v201.size.CGFloat height = height;
                          BOOL v73 = v72 <= CGRectGetMinX(v201);
                          CGFloat MinX = v51;
                          CGFloat v69 = y;
                          double v70 = v53;
                          double v71 = height;
                          if (!v73) {
                            goto LABEL_89;
                          }
                        }
                      }
                    }
                  }
                }
                if (v37)
                {
                  v212.origin.double y = v161;
                  v212.origin.CGFloat x = v162;
                  v212.size.CGFloat width = v163;
                  v212.size.CGFloat height = v164;
                  v233.origin.CGFloat x = v55;
                  v233.origin.double y = v56;
                  v233.size.CGFloat width = v57;
                  v233.size.CGFloat height = rect2;
                  if (CGRectIntersectsRect(v212, v233))
                  {
                    v213.origin.double y = v161;
                    v213.origin.CGFloat x = v162;
                    v213.size.CGFloat width = v163;
                    v213.size.CGFloat height = v164;
                    double v89 = CGRectGetMinY(v213);
                    v214.origin.CGFloat x = v55;
                    v214.origin.double y = v56;
                    v214.size.CGFloat width = v57;
                    v214.size.CGFloat height = rect2;
                    double v90 = CGRectGetMinY(v214);
                    BOOL v91 = v89 < v90 || v89 == v90;
                    if (v91 || vabdd_f64(v89, v90) < 0.01)
                    {
                      v215.origin.CGFloat x = v55;
                      v215.origin.double y = v56;
                      v215.size.CGFloat width = v57;
                      v215.size.CGFloat height = rect2;
                      double v92 = CGRectGetMaxY(v215);
                      v216.origin.double y = v161;
                      v216.origin.CGFloat x = v162;
                      v216.size.CGFloat width = v163;
                      v216.size.CGFloat height = v164;
                      double v93 = CGRectGetMaxY(v216);
                      if (v92 <= v93 || vabdd_f64(v92, v93) < 0.01)
                      {
                        CGFloat v94 = a6->origin.x;
                        CGFloat v95 = a6->origin.y;
                        CGFloat v96 = a6->size.width;
                        CGFloat v97 = a6->size.height;
                        if ((*(unsigned char *)(v37 + 25) & 0x10) != 0)
                        {
                          if (CGRectIsEmpty(*(CGRect *)&v94)
                            || (double v106 = CGRectGetMinX(*a6),
                                v220.origin.CGFloat x = v51,
                                v220.origin.double y = y,
                                v220.size.CGFloat width = v53,
                                v220.size.CGFloat height = height,
                                v106 > CGRectGetMinX(v220)))
                          {
                            a6->origin.CGFloat x = v51;
                            a6->origin.double y = y;
                            a6->size.CGFloat width = v53;
                            a6->size.CGFloat height = height;
                            if (!v159)
                            {
                              double v111 = v51 + -1.0;
LABEL_132:
                              a6->origin.CGFloat x = v111;
                              continue;
                            }
                            double v107 = y + -1.0;
LABEL_135:
                            a6->origin.double y = v107;
                            continue;
                          }
                        }
                        else if (CGRectIsEmpty(*(CGRect *)&v94) {
                               || (double v98 = CGRectGetMaxX(*a6),
                        }
                                   v217.origin.CGFloat x = v51,
                                   v217.origin.double y = y,
                                   v217.size.CGFloat width = v53,
                                   v217.size.CGFloat height = height,
                                   v98 < CGRectGetMaxX(v217)))
                        {
                          double v99 = v51;
                          double v100 = y;
                          CGFloat v101 = v53;
                          CGFloat v102 = height;
                          if (v159)
                          {
                            CGFloat v103 = CGRectGetMinX(*(CGRect *)&v99);
                            v218.origin.CGFloat x = v51;
                            v218.origin.double y = y;
                            v218.size.CGFloat width = v53;
                            v218.size.CGFloat height = height;
                            double v104 = CGRectGetMaxY(v218);
                            v219.origin.CGFloat x = v51;
                            v219.origin.double y = y;
                            v219.size.CGFloat width = v53;
                            v219.size.CGFloat height = height;
                            CGFloat v105 = CGRectGetWidth(v219);
                            a6->origin.CGFloat x = v103;
                            a6->origin.double y = v104 + -1.0;
                            a6->size.CGFloat width = v105;
                            a6->size.CGFloat height = 1.0;
                          }
                          else
                          {
                            double v108 = CGRectGetMaxX(*(CGRect *)&v99);
                            v221.origin.CGFloat x = v51;
                            v221.origin.double y = y;
                            v221.size.CGFloat width = v53;
                            v221.size.CGFloat height = height;
                            CGFloat v109 = CGRectGetMinY(v221);
                            v222.origin.CGFloat x = v51;
                            v222.origin.double y = y;
                            v222.size.CGFloat width = v53;
                            v222.size.CGFloat height = height;
                            CGFloat v110 = CGRectGetHeight(v222);
                            a6->origin.CGFloat x = v108 + -1.0;
                            a6->origin.double y = v109;
                            a6->size.CGFloat width = 1.0;
                            a6->size.CGFloat height = v110;
                          }
                        }
                      }
                    }
                  }
                }
                continue;
              }
              if ((v10 & 0xFFFFFFFFFFFFFFFBLL) != 0) {
                continue;
              }
              if (v33)
              {
                v202.origin.double y = v167;
                v202.origin.CGFloat x = x;
                v202.size.CGFloat height = v165;
                v202.size.CGFloat width = width;
                v232.origin.CGFloat x = v55;
                v232.origin.double y = v56;
                v232.size.CGFloat width = v57;
                v232.size.CGFloat height = rect2;
                if (CGRectIntersectsRect(v202, v232))
                {
                  v203.origin.double y = v167;
                  v203.origin.CGFloat x = x;
                  v203.size.CGFloat height = v165;
                  v203.size.CGFloat width = width;
                  double v74 = CGRectGetMinY(v203);
                  v204.origin.CGFloat x = v55;
                  v204.origin.double y = v56;
                  v204.size.CGFloat width = v57;
                  v204.size.CGFloat height = rect2;
                  double v75 = CGRectGetMinY(v204);
                  BOOL v76 = v74 < v75 || v74 == v75;
                  if (v76 || vabdd_f64(v74, v75) < 0.01)
                  {
                    v205.origin.CGFloat x = v55;
                    v205.origin.double y = v56;
                    v205.size.CGFloat width = v57;
                    v205.size.CGFloat height = rect2;
                    double v77 = CGRectGetMaxY(v205);
                    v206.origin.double y = v167;
                    v206.origin.CGFloat x = x;
                    v206.size.CGFloat height = v165;
                    v206.size.CGFloat width = width;
                    double v78 = CGRectGetMaxY(v206);
                    if (v77 <= v78 || vabdd_f64(v77, v78) < 0.01)
                    {
                      a5->origin.CGFloat x = v51;
                      a5->origin.double y = y;
                      a5->size.CGFloat width = v53;
                      a5->size.CGFloat height = height;
                      double v79 = sub_10015980C((uint64_t)v33, (unint64_t)v157, 1);
                      double v80 = v79;
                      if (v159)
                      {
                        if (v26)
                        {
                          [v26 transformFromWP];
                          double v81 = *((double *)&v177 + 1);
                          double v82 = *((double *)&v178 + 1);
                          double v83 = *((double *)&v179 + 1);
                        }
                        else
                        {
                          long long v178 = 0u;
                          long long v179 = 0u;
                          double v83 = 0.0;
                          double v82 = 0.0;
                          double v81 = 0.0;
                          long long v177 = 0u;
                        }
                        a5->origin.double y = v83 + v82 * 0.0 + v81 * v80;
                      }
                      else
                      {
                        a5->origin.CGFloat x = v79;
                      }
                    }
                  }
                }
              }
              v112 = (char *)[v26 range];
              if (v160 < (unint64_t)v112 || v160 - (unint64_t)v112 >= v113)
              {
                if (!v37 || (char *)v160 != &v112[v113]) {
                  continue;
                }
              }
              else if (!v37)
              {
                continue;
              }
              v223.origin.double y = v161;
              v223.origin.CGFloat x = v162;
              v223.size.CGFloat width = v163;
              v223.size.CGFloat height = v164;
              v234.origin.CGFloat x = v55;
              v234.origin.double y = v56;
              v234.size.CGFloat width = v57;
              v234.size.CGFloat height = rect2;
              if (CGRectIntersectsRect(v223, v234))
              {
                v224.origin.double y = v161;
                v224.origin.CGFloat x = v162;
                v224.size.CGFloat width = v163;
                v224.size.CGFloat height = v164;
                double v114 = CGRectGetMinY(v224);
                v225.origin.CGFloat x = v55;
                v225.origin.double y = v56;
                v225.size.CGFloat width = v57;
                v225.size.CGFloat height = rect2;
                double v115 = CGRectGetMinY(v225);
                if (v114 <= v115 || vabdd_f64(v114, v115) < 0.01)
                {
                  v226.origin.CGFloat x = v55;
                  v226.origin.double y = v56;
                  v226.size.CGFloat width = v57;
                  v226.size.CGFloat height = rect2;
                  double v116 = CGRectGetMaxY(v226);
                  v227.origin.double y = v161;
                  v227.origin.CGFloat x = v162;
                  v227.size.CGFloat width = v163;
                  v227.size.CGFloat height = v164;
                  double v117 = CGRectGetMaxY(v227);
                  if (v116 <= v117 || vabdd_f64(v116, v117) < 0.01)
                  {
                    double v118 = sub_10015980C(v37, v160, 0);
                    double v119 = v118;
                    a6->origin.CGFloat x = v51;
                    a6->origin.double y = y;
                    a6->size.CGFloat width = v53;
                    a6->size.CGFloat height = height;
                    if (!v159)
                    {
                      double v111 = v118 + -1.0;
                      goto LABEL_132;
                    }
                    if (v26)
                    {
                      [v26 transformFromWP];
                      double v120 = *((double *)&v174 + 1);
                      double v121 = *((double *)&v175 + 1);
                      double v122 = *((double *)&v176 + 1);
                    }
                    else
                    {
                      long long v175 = 0u;
                      long long v176 = 0u;
                      double v122 = 0.0;
                      double v121 = 0.0;
                      double v120 = 0.0;
                      long long v174 = 0u;
                    }
                    double v107 = v122 + v121 * 0.0 + v120 * v119 + -1.0;
                    goto LABEL_135;
                  }
                }
              }
            }
            id v48 = [v47 countByEnumeratingWithState:&v181 objects:v189 count:16];
          }
          while (v48);
        }

        uint64_t v25 = v154 + 1;
      }
      while ((id)(v154 + 1) != v153);
      id v24 = [obj countByEnumeratingWithState:&v185 objects:v191 count:16];
    }
    while (v24);
  }

  CGFloat v123 = a5->origin.x;
  CGFloat v124 = a5->origin.y;
  CGFloat v125 = a5->size.width;
  CGFloat v126 = a5->size.height;
  if (v159)
  {
    if (!CGRectIsNull(*(CGRect *)&v123)) {
      a5->size.CGFloat height = 1.0;
    }
    v228.origin.CGFloat x = a6->origin.x;
    v228.origin.double y = a6->origin.y;
    v228.size.CGFloat width = a6->size.width;
    CGFloat v128 = a6->size.height;
    v127 = (CGSize *)&a6->size.height;
    v228.size.CGFloat height = v128;
    if (!CGRectIsNull(v228)) {
LABEL_144:
    }
      v127->CGFloat width = 1.0;
  }
  else
  {
    if (!CGRectIsNull(*(CGRect *)&v123)) {
      a5->size.CGFloat width = 1.0;
    }
    CGRect v229 = *a6;
    v127 = &a6->size;
    if (!CGRectIsNull(v229)) {
      goto LABEL_144;
    }
  }
}

+ (id)selectionRectsforColumns:(id)a3 forSelection:(id)a4
{
  id v32 = a3;
  id v36 = a4;
  double v5 = objc_opt_new();
  id v6 = [v36 type];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v32;
  id v7 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v7)
  {
    uint64_t v34 = *(void *)v42;
    do
    {
      id v35 = v7;
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v42 != v34) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        [v9 boundsIncludingDropCapRectsForSelectionType:v6];
        CGFloat v11 = v10;
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        if (v6 == (id)7 && [v36 validVisualRanges])
        {
          id v18 = [v36 visualRangesArray];
        }
        else
        {
          id v19 = [v36 range];
          uint64_t v21 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v19, v20);
          uint64_t v46 = v21;
          id v18 = +[NSArray arrayWithObjects:&v46 count:1];
        }
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        CGFloat v22 = [v9 rectsForSelectionRanges:v18 selectionType:v6];
        id v23 = [v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v23)
        {
          uint64_t v24 = *(void *)v38;
          do
          {
            for (j = 0; j != v23; j = (char *)j + 1)
            {
              if (*(void *)v38 != v24) {
                objc_enumerationMutation(v22);
              }
              [*(id *)(*((void *)&v37 + 1) + 8 * (void)j) CGRectValue];
              v51.origin.double x = v11;
              v51.origin.double y = v13;
              v51.size.double width = v15;
              v51.size.double height = v17;
              CGRect v50 = CGRectIntersection(v49, v51);
              double x = v50.origin.x;
              double y = v50.origin.y;
              double width = v50.size.width;
              double height = v50.size.height;
              if (!CGRectIsNull(v50))
              {
                double v30 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", x, y, width, height);
                [v5 addObject:v30];
              }
            }
            id v23 = [v22 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v23);
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v7);
  }

  return v5;
}

+ (void)populateHeadAndTailCharIndicesInSelection:(id)a3 forColumns:(id)a4
{
  id v5 = a3;
  id v53 = a4;
  id v57 = [v5 type];
  if ([v5 type] == (id)7
    && ([v5 headCharIndex] == (id)0x7FFFFFFFFFFFFFFFLL
     || [v5 tailCharIndex] == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    double v59 = (char *)[v5 range];
    uint64_t v54 = v6;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id obj = v53;
    id v7 = [obj countByEnumeratingWithState:&v71 objects:v77 count:16];
    if (v7)
    {
      uint64_t v56 = *(void *)v72;
      do
      {
        id v8 = 0;
        id v58 = v7;
        do
        {
          if (*(void *)v72 != v56) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v71 + 1) + 8 * (void)v8);
          double v10 = (char *)[(id)v9 lineFragmentForCharIndex:v59 knobTag:11 selectionType:7];
          CGFloat v11 = (char *)[(id)v9 lineFragmentForCharIndex:&v59[v54 - 1] knobTag:10 selectionType:v57];
          double v12 = (long long *)v11;
          p_CGFloat y = &CGRectNull.origin.y;
          p_CGSize size = &CGRectNull.size;
          p_CGFloat height = &CGRectNull.size.height;
          double v16 = (const CGRect *)(v10 + 40);
          CGFloat v17 = (CGFloat *)(v10 + 48);
          id v18 = (CGSize *)(v10 + 56);
          id v19 = (CGFloat *)(v10 + 64);
          if (!v10)
          {
            id v19 = &CGRectNull.size.height;
            id v18 = &CGRectNull.size;
            CGFloat v17 = &CGRectNull.origin.y;
            double v16 = &CGRectNull;
          }
          CGFloat width = v18->width;
          CGFloat v65 = *v19;
          CGFloat v62 = *v17;
          CGFloat x = v16->origin.x;
          if (v11) {
            p_CGFloat height = (CGFloat *)(v11 + 64);
          }
          CGFloat rect = *p_height;
          if (v11) {
            p_CGSize size = (CGSize *)(v11 + 56);
          }
          CGFloat v20 = p_size->width;
          uint64_t v21 = (const CGRect *)(v11 + 40);
          if (!v11) {
            uint64_t v21 = &CGRectNull;
          }
          CGFloat v22 = v21->origin.x;
          if (v11) {
            p_CGFloat y = (CGFloat *)(v11 + 48);
          }
          CGFloat v23 = *p_y;
          if ([v5 validVisualRanges])
          {
            BOOL v60 = [v5 visualRangesArray];
          }
          else
          {
            uint64_t v24 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v59, v54);
            BOOL v76 = v24;
            BOOL v60 = +[NSArray arrayWithObjects:&v76 count:1];
          }
          id v25 = [v5 superRange];
          BYTE2(v52) = 0;
          LOWORD(v52) = 0;
          double v27 = [v9 pMutableRectsForSelectionRange:v25 selectionType:v26 includeSpaceAfter:7 includeSpaceBefore:1 includeLeading:1 forParagraphMode:v52 includeRuby:0 includePaginatedAttachments:0 inranges:v60 outranges:0];
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          id v28 = v27;
          id v29 = [v28 countByEnumeratingWithState:&v67 objects:v75 count:16];
          if (v29)
          {
            uint64_t v30 = *(void *)v68;
            do
            {
              for (i = 0; i != v29; i = (char *)i + 1)
              {
                if (*(void *)v68 != v30) {
                  objc_enumerationMutation(v28);
                }
                [*(id *)(*((void *)&v67 + 1) + 8 * i) CGRectValue];
                CGRect v79 = CGRectIntersection(v78, *(CGRect *)(v9 + 16));
                CGFloat v32 = v79.origin.x;
                CGFloat y = v79.origin.y;
                CGFloat v34 = v79.size.width;
                CGFloat height = v79.size.height;
                id v36 = [v5 headCharIndex];
                if (v10)
                {
                  if (v36 == (id)0x7FFFFFFFFFFFFFFFLL)
                  {
                    v80.origin.CGFloat x = v32;
                    v80.origin.CGFloat y = y;
                    v80.size.CGFloat width = v34;
                    v80.size.CGFloat height = height;
                    double MinY = CGRectGetMinY(v80);
                    v81.origin.CGFloat y = v62;
                    v81.origin.CGFloat x = x;
                    v81.size.CGFloat width = width;
                    v81.size.CGFloat height = v65;
                    if (MinY >= CGRectGetMinY(v81))
                    {
                      v82.origin.CGFloat x = v32;
                      v82.origin.CGFloat y = y;
                      v82.size.CGFloat width = v34;
                      v82.size.CGFloat height = height;
                      double MaxY = CGRectGetMaxY(v82);
                      v83.origin.CGFloat y = v62;
                      v83.origin.CGFloat x = x;
                      v83.size.CGFloat width = width;
                      v83.size.CGFloat height = v65;
                      if (MaxY <= CGRectGetMaxY(v83))
                      {
                        char v66 = 0;
                        CGFloat v39 = v32;
                        CGFloat v40 = y;
                        CGFloat v41 = v34;
                        CGFloat v42 = height;
                        if ((v10[25] & 0x10) != 0) {
                          double MinX = CGRectGetMaxX(*(CGRect *)&v39) + -1.0;
                        }
                        else {
                          double MinX = CGRectGetMinX(*(CGRect *)&v39);
                        }
                        [v5 setHeadCharIndex:sub_10015AD80((long long *)v10, 0, 0, &v66, 0, MinX)];
                      }
                    }
                  }
                }
                id v44 = [v5 tailCharIndex];
                if (v12)
                {
                  if (v44 == (id)0x7FFFFFFFFFFFFFFFLL)
                  {
                    v84.origin.CGFloat x = v32;
                    v84.origin.CGFloat y = y;
                    v84.size.CGFloat width = v34;
                    v84.size.CGFloat height = height;
                    double v45 = CGRectGetMinY(v84);
                    v85.origin.CGFloat x = v22;
                    v85.origin.CGFloat y = v23;
                    v85.size.CGFloat width = v20;
                    v85.size.CGFloat height = rect;
                    if (v45 >= CGRectGetMinY(v85))
                    {
                      v86.origin.CGFloat x = v32;
                      v86.origin.CGFloat y = y;
                      v86.size.CGFloat width = v34;
                      v86.size.CGFloat height = height;
                      double v46 = CGRectGetMaxY(v86);
                      v87.origin.CGFloat x = v22;
                      v87.origin.CGFloat y = v23;
                      v87.size.CGFloat width = v20;
                      v87.size.CGFloat height = rect;
                      if (v46 <= CGRectGetMaxY(v87))
                      {
                        char v66 = 0;
                        CGFloat v47 = v32;
                        CGFloat v48 = y;
                        CGFloat v49 = v34;
                        CGFloat v50 = height;
                        if ((*((unsigned char *)v12 + 25) & 0x10) != 0) {
                          double v51 = CGRectGetMinX(*(CGRect *)&v47);
                        }
                        else {
                          double v51 = CGRectGetMaxX(*(CGRect *)&v47) + -1.0;
                        }
                        [v5 setTailCharIndex:sub_10015AD80(v12, 0, 0, &v66, 0, v51)];
                      }
                    }
                  }
                }
              }
              id v29 = [v28 countByEnumeratingWithState:&v67 objects:v75 count:16];
            }
            while (v29);
          }

          id v8 = (char *)v8 + 1;
        }
        while (v8 != v58);
        id v7 = [obj countByEnumeratingWithState:&v71 objects:v77 count:16];
      }
      while (v7);
    }
  }
}

+ (id)commentKnobBaseOriginForHighlightAtTextRange:(_NSRange)a3 withColumns:(id)a4 positionForRTL:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger location = a3.location;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = a4;
  id v8 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v34;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v7);
        }
        CGFloat v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v39.NSUInteger location = (NSUInteger)[v11 range];
        v40.NSUInteger location = location;
        v40.length = 1;
        if (NSIntersectionRange(v39, v40).length)
        {
          double v12 = (double *)[v11 lineFragmentForCharIndex:location knobTag:11 selectionType:0];
          if (v12)
          {
            if (v5) {
              unsigned int v14 = [v11 textIsVertical] ^ 1;
            }
            else {
              unsigned int v14 = 0;
            }
            double v15 = v12[15];
            double v16 = v12[17];
            unsigned int v17 = [v11 textIsVertical];
            double v18 = v12[4];
            [v11 frameBounds];
            if (v17) {
              double v21 = v18;
            }
            else {
              double v21 = v16 + v18 + (v15 + v16) * -0.5;
            }
            if (v14) {
              double v22 = v19 + v20;
            }
            else {
              double v22 = v19;
            }
            if (v11)
            {
              [v11 transformFromWP];
              double v24 = *((double *)&v30 + 1);
              double v23 = *(double *)&v30;
              double v25 = *((double *)&v31 + 1);
              double v26 = *(double *)&v31;
              double v27 = *((double *)&v32 + 1);
              double v28 = *(double *)&v32;
            }
            else
            {
              long long v31 = 0u;
              long long v32 = 0u;
              long long v30 = 0u;
              double v27 = 0.0;
              double v25 = 0.0;
              double v24 = 0.0;
              double v28 = 0.0;
              double v26 = 0.0;
              double v23 = 0.0;
            }
            CGFloat v13 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v28 + v21 * v26 + v23 * v22, v27 + v21 * v25 + v24 * v22, v30, v31, v32, (void)v33);
            goto LABEL_24;
          }
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  CGFloat v13 = 0;
LABEL_24:

  return v13;
}

+ (CGPoint)connectionLinePointForChangeRange:(_NSRange)a3 withColumns:(id)a4 layoutTarget:(id)a5
{
  NSUInteger location = a3.location;
  id v7 = a4;
  id v29 = v7;
  if (a5)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v31 objects:v45 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v32;
      do
      {
        CGFloat v11 = 0;
        do
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v8);
          }
          double v12 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v11);
          v46.NSUInteger location = (NSUInteger)[v12 range];
          v47.NSUInteger location = location;
          v47.length = 1;
          if (NSIntersectionRange(v46, v47).length)
          {
            id v30 = 0;
            CGFloat v13 = (char *)[v12 pRemapCharIndex:location outIsAfterBreak:0 outWithTextSource:&v30];
            id v14 = v30;
            double v15 = (char *)[v12 range];
            if (v13 == &v15[v16]) {
              uint64_t v17 = 0;
            }
            else {
              uint64_t v17 = 11;
            }
            if (![v12 lineFragmentForCharIndex:location knobTag:v17 selectionType:0])
            {
              unsigned int v18 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014E3498);
              }
              double v19 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67110146;
                unsigned int v36 = v18;
                __int16 v37 = 2082;
                long long v38 = "+[CRLWPColumn connectionLinePointForChangeRange:withColumns:layoutTarget:]";
                __int16 v39 = 2082;
                NSRange v40 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm";
                __int16 v41 = 1024;
                int v42 = 684;
                __int16 v43 = 2082;
                id v44 = "lineFragment";
                _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014E34B8);
              }
              double v20 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
              {
                double v23 = +[CRLAssertionHandler packedBacktraceString];
                *(_DWORD *)buf = 67109378;
                unsigned int v36 = v18;
                __int16 v37 = 2114;
                long long v38 = v23;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
              }
              double v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPColumn connectionLinePointForChangeRange:withColumns:layoutTarget:]");
              double v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"];
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 684, 0, "invalid nil value for '%{public}s'", "lineFragment", v29);
            }
          }
          CGFloat v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v8 countByEnumeratingWithState:&v31 objects:v45 count:16];
      }
      while (v9);
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3458);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108D540();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3478);
    }
    double v24 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    double v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPColumn connectionLinePointForChangeRange:withColumns:layoutTarget:]");
    double v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 667, 0, "invalid nil value for '%{public}s'", "layoutTarget", v29);
  }
  double v27 = INFINITY;
  double v28 = INFINITY;
  result.CGFloat y = v28;
  result.CGFloat x = v27;
  return result;
}

+ (id)closestColumnInColumnsArray:(id)a3 forPoint:(CGPoint)a4 ignoreEmptyColumns:(BOOL)a5 ignoreDrawableOnlyColumns:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double y = a4.y;
  double x = a4.x;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = a3;
  CGFloat v11 = 0;
  id v12 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v33;
    double v14 = INFINITY;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        [v16 frameBounds];
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        if ((!v7 || [v16 lineCount])
          && (!v6
           || [v16 lineCount] != (id)1
           || (*((unsigned char *)[v16 lineFragmentAtIndex:0] + 24) & 0x40) == 0))
        {
          v39.origin.double x = v18;
          v39.origin.double y = v20;
          v39.size.CGFloat width = v22;
          v39.size.CGFloat height = v24;
          v38.double x = x;
          v38.double y = y;
          if (CGRectContainsPoint(v39, v38))
          {
            id v30 = v16;

            CGFloat v11 = v30;
            goto LABEL_18;
          }
          double v25 = sub_1000656DC(x, y, v18, v20, v22, v24);
          double v27 = sub_1000643CC(x, y, v25, v26);
          if (v27 < v14)
          {
            double v28 = v27;
            id v29 = v16;

            CGFloat v11 = v29;
            double v14 = v28;
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v11;
}

+ (_NSRange)charRangeForPencilAnnotationStartPoint:(CGPoint)a3 toEndPoint:(CGPoint)a4 inLayoutTarget:(id)a5 onSingleLineFragment:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a4.y;
  double x = a4.x;
  double v7 = a3.y;
  double v8 = a3.x;
  id v10 = [a5 columns];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  CGFloat v11 = [v10 firstObject];
  id v12 = v11;
  if (v11)
  {
    [v11 transformToWP];
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
  }

  long long v13 = v28;
  long long v14 = v29;
  long long v15 = v30;
  uint64_t v16 = [a1 closestColumnInColumnsArray:v10 forPoint:1 ignoreEmptyColumns:0 ignoreDrawableOnlyColumns:sub_100065E00(v8, v7, x, y, 0.5)];
  double v27 = 0;
  double v17 = [v16 p_charIndexWithTextClosestToWPPoint:1 pastCenterGoesToNextChar:&v27 outFragment:0 leadingEdge:*(double *)&v15 + v7 * *(double *)&v14 + *(double *)&v13 * v8 *(double *)&v15 + v7 * *((double *)&v14 + 1) + *((double *)&v13 + 1) * v8];
  double v18 = *(double *)&v15 + y * *(double *)&v14 + *(double *)&v13 * x;
  if (v6 && v16 && v27) {
    double v19 = (unsigned char *)sub_10015AD80(v27, 1, 0, 0, 1, v18);
  }
  else {
    double v19 = objc_msgSend(v16, "p_charIndexWithTextClosestToWPPoint:pastCenterGoesToNextChar:outFragment:leadingEdge:", 1, 0, 0, v18, *((double *)&v15 + 1) + y * *((double *)&v14 + 1) + *((double *)&v13 + 1) * x);
  }
  if (v17 <= v19) {
    double v20 = v19;
  }
  else {
    double v20 = v17;
  }
  if (v17 >= v19) {
    double v21 = v19;
  }
  else {
    double v21 = v17;
  }
  NSUInteger v22 = v20 - v21;

  NSUInteger v23 = (NSUInteger)v21;
  NSUInteger v24 = v22;
  result.length = v24;
  result.NSUInteger location = v23;
  return result;
}

+ (unint64_t)charIndexForPoint:(CGPoint)a3 inColumnsArray:(id)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 ignoreEmptyColumns:(BOOL)a7 isAtEndOfLine:(BOOL *)a8 leadingEdge:(BOOL *)a9
{
  return (unint64_t)[a1 charIndexForPoint:a4 inColumnsArray:a5 allowPastBreak:1 allowNotFound:0 pastCenterGoesToNextChar:0 constrainToAscentAndDescent:a3.x, a3.y, a8, a9];
}

+ (unint64_t)charIndexForPoint:(CGPoint)a3 inColumnsArray:(id)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 pastCenterGoesToNextChar:(BOOL)a7 ignoreEmptyColumns:(BOOL)a8 isAtEndOfLine:(BOOL *)a9 leadingEdge:(BOOL *)a10
{
  return (unint64_t)[a1 charIndexForPoint:a4 inColumnsArray:a5 allowPastBreak:a6 allowNotFound:a7 pastCenterGoesToNextChar:0 constrainToAscentAndDescent:a8 ignoreEmptyColumns:a9 isAtEndOfLine:a3.x leadingEdge:a3.y];
}

+ (unint64_t)charIndexForPoint:(CGPoint)a3 inColumnsArray:(id)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 pastCenterGoesToNextChar:(BOOL)a7 constrainToAscentAndDescent:(BOOL)a8 ignoreEmptyColumns:(BOOL)a9 isAtEndOfLine:(BOOL *)a10 leadingEdge:(BOOL *)a11
{
  BOOL v11 = a8;
  BOOL v12 = a7;
  BOOL v13 = a6;
  BOOL v14 = a5;
  double y = a3.y;
  double x = a3.x;
  double v17 = [a1 closestColumnInColumnsArray:a4 forPoint:a9 ignoreEmptyColumns:1 ignoreDrawableOnlyColumns:];
  double v18 = v17;
  if (v13 && ([v17 frameBounds], v21.double x = x, v21.y = y, !CGRectContainsPoint(v22, v21))) {
    unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v19 = [v18 charIndexFromPoint:v14 allowPastBreak:v12 pastCenterGoesToNextChar:v13 allowNotFound:v11 constrainToAscentAndDescent:a10 isAtEndOfLine:a11 leadingEdge:x y];
  }

  return v19;
}

+ (CGPoint)p_pinPoint:(CGPoint)a3 toRect:(CGRect)a4
{
  double v4 = sub_1000656DC(a3.x, a3.y, a4.origin.x, a4.origin.y, a4.size.width + -1.0, a4.size.height + -1.0);
  result.double y = v5;
  result.double x = v4;
  return result;
}

+ (CGPoint)pinToNaturalBounds:(CGPoint)a3 andLastLineFragment:(BOOL)a4 inLayoutTarget:(id)a5
{
  BOOL v5 = a4;
  double y = a3.y;
  double x = a3.x;
  id v9 = a5;
  id v10 = [v9 geometry];
  [v10 size];
  double v11 = sub_100064070();
  [a1 p_pinPoint:x y:y toRect:v11 v12 v13 v14];
  double v16 = v15;
  double v18 = v17;

  if (v5)
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    unint64_t v19 = [v9 columns];
    id v20 = [v19 countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v62;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v62 != v21) {
            objc_enumerationMutation(v19);
          }
          NSUInteger v23 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          [v23 frameBounds];
          v67.double x = v16;
          v67.double y = v18;
          if (CGRectContainsPoint(v68, v67))
          {
            NSUInteger v24 = (char *)[v23 lineCount];
            if (v24)
            {
              [v23 boundsOfLineFragmentAtIndex:v24 - 1];
              CGFloat rect = v25;
              CGFloat v27 = v26;
              CGFloat v29 = v28;
              CGFloat v31 = v30;
              if (v23)
              {
                [v23 transformToWP];
                double v32 = v56;
                double v33 = v58;
                double v45 = v57;
                double v34 = v60;
                double v46 = v59;
                double v47 = v55;
              }
              else
              {
                double v34 = 0.0;
                double v33 = 0.0;
                double v32 = 0.0;
                double v45 = 0.0;
                double v46 = 0.0;
                double v47 = 0.0;
              }
              v69.origin.double x = v29;
              v69.origin.double y = v31;
              v69.size.CGFloat width = v27;
              v69.size.CGFloat height = rect;
              double MaxY = CGRectGetMaxY(v69);
              if (v34 + v18 * v33 + v32 * v16 > MaxY)
              {
                if (v23)
                {
                  [v23 transformFromWP];
                  double v36 = v50;
                  double v37 = v49;
                  double v38 = v52;
                  double v39 = v51;
                  double v40 = v54;
                  double v41 = v53;
                }
                else
                {
                  double v40 = 0.0;
                  double v38 = 0.0;
                  double v36 = 0.0;
                  double v41 = 0.0;
                  double v39 = 0.0;
                  double v37 = 0.0;
                }
                double v42 = v46 + v18 * v45 + v47 * v16;
                double v16 = v41 + MaxY * v39 + v37 * v42;
                double v18 = v40 + MaxY * v38 + v36 * v42;
              }
            }
            goto LABEL_20;
          }
        }
        id v20 = [v19 countByEnumeratingWithState:&v61 objects:v65 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
LABEL_20:
  }
  double v43 = v16;
  double v44 = v18;
  result.double y = v44;
  result.double x = v43;
  return result;
}

+ (unint64_t)charIndexForPointWithPinning:(CGPoint)a3 inLayoutTarget:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [a1 pinToNaturalBounds:1 andLastLineFragment:v7 inLayoutTarget:x, y];
  id v8 = [a1 charIndexFromPoint:1 allowPastBreak:0 constrainToAscentAndDescent:0 isAtEndOfLine:v7];

  return (unint64_t)v8;
}

+ (unint64_t)charIndexForPointWithPinning:(CGPoint)a3 isTail:(BOOL)a4 selectionType:(unint64_t)a5 inLayoutTarget:(id)a6
{
  BOOL v7 = a4;
  double y = a3.y;
  double x = a3.x;
  id v11 = a6;
  [a1 pinToNaturalBounds:1 andLastLineFragment:v11 inLayoutTarget:x, y];
  double v13 = v12;
  double v15 = v14;
  double v16 = [v11 columns];
  double v17 = +[CRLWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](CRLWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", v16, 0, 1, v13, v15);

  if (v17)
  {
    id v18 = [v17 charIndexForSelectionFromPoint:v7 isTail:x, y];
    unint64_t v19 = (unint64_t)v18;
    if (a5 != 7 && v7 && v18 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v20 = [v11 storage];
      unint64_t v19 = (unint64_t)[v20 nextCharacterIndex:v19];
    }
  }
  else
  {
    unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v19;
}

+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 isAtEndOfLine:(BOOL *)a5 inLayoutTarget:(id)a6
{
  return (unint64_t)[a1 charIndexFromPoint:a4 allowPastBreak:0 constrainToAscentAndDescent:a5 isAtEndOfLine:a3.x inLayoutTarget:a3.y];
}

+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 constrainToAscentAndDescent:(BOOL)a5 isAtEndOfLine:(BOOL *)a6 inLayoutTarget:(id)a7
{
  return (unint64_t)[a1 charIndexFromPoint:a4 allowPastBreak:0 allowNotFound:a5 constrainToAscentAndDescent:a6 isAtEndOfLine:0 leadingEdge:a3.x inLayoutTarget:a3.y];
}

+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 isAtEndOfLine:(BOOL *)a6 leadingEdge:(BOOL *)a7 inLayoutTarget:(id)a8
{
  return (unint64_t)[a1 charIndexFromPoint:a4 allowPastBreak:1 allowNotFound:0 pastCenterGoesToNextChar:0 constrainToAscentAndDescent:a6 isAtEndOfLine:a7 leadingEdge:a3.x inLayoutTarget:a3.y];
}

+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 constrainToAscentAndDescent:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 leadingEdge:(BOOL *)a8 inLayoutTarget:(id)a9
{
  return (unint64_t)[a1 charIndexFromPoint:a4 allowPastBreak:a5 allowNotFound:a6 pastCenterGoesToNextChar:a7 constrainToAscentAndDescent:a8 isAtEndOfLine:a3.x leadingEdge:a3.y inLayoutTarget:a9];
}

+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 pastCenterGoesToNextChar:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 leadingEdge:(BOOL *)a8 inLayoutTarget:(id)a9
{
  return (unint64_t)[a1 charIndexFromPoint:a4 allowPastBreak:a5 allowNotFound:a6 pastCenterGoesToNextChar:0 constrainToAscentAndDescent:a7 isAtEndOfLine:a8 leadingEdge:a3.x inLayoutTarget:a3.y];
}

+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 pastCenterGoesToNextChar:(BOOL)a6 constrainToAscentAndDescent:(BOOL)a7 isAtEndOfLine:(BOOL *)a8 leadingEdge:(BOOL *)a9 inLayoutTarget:(id)a10
{
  LOBYTE(v11) = 0;
  return (unint64_t)[a1 charIndexFromPoint:a4 allowPastBreak:a5 allowNotFound:a6 pastCenterGoesToNextChar:a7 constrainToAscentAndDescent:a8 isAtEndOfLine:a9 leadingEdge:a3.x y:a3.y pastCenterGoesToNextChar:v11 constrainToAscentAndDescent:a10];
}

+ (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 allowNotFound:(BOOL)a5 pastCenterGoesToNextChar:(BOOL)a6 constrainToAscentAndDescent:(BOOL)a7 isAtEndOfLine:(BOOL *)a8 leadingEdge:(BOOL *)a9 ignoreEmptyColumns:(BOOL)a10 inLayoutTarget:(id)a11
{
  BOOL v29 = a7;
  BOOL v13 = a6;
  BOOL v14 = a5;
  BOOL v15 = a4;
  double y = a3.y;
  double x = a3.x;
  id v18 = a11;
  unint64_t v19 = v18;
  if (!v14 && ([v18 layoutIsValid] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E34D8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108D5D4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E34F8);
    }
    id v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    uint64_t v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPColumn charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:ignoreEmptyColumns:inLayoutTarget:]");
    CGRect v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:874 isFatal:0 description:"Should not call when layout has not been validated"];
  }
  if ([v19 layoutIsValid])
  {
    NSUInteger v23 = [v19 columns];
    if ([v23 count]
      || v14
      || ([v19 geometry],
          NSUInteger v24 = objc_claimAutoreleasedReturnValue(),
          [v24 frame],
          v30.double x = x,
          v30.double y = y,
          BOOL v25 = CGRectContainsPoint(v31, v30),
          v24,
          !v25))
    {
      unint64_t v27 = +[CRLWPColumn charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:ignoreEmptyColumns:isAtEndOfLine:leadingEdge:](CRLWPColumn, "charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:ignoreEmptyColumns:isAtEndOfLine:leadingEdge:", v23, v15, v14, v13, v29, a10, x, y, a8, a9);
    }
    else
    {
      double v26 = [v19 storage];
      unint64_t v27 = (unint64_t)[v26 length];

      if (a8) {
        *a8 = 0;
      }
      if (a9) {
        *a9 = 1;
      }
    }
  }
  else
  {
    unint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v27;
}

+ (id)smartFieldWithAttributeKind:(unint64_t)a3 inColumnArray:(id)a4 atPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = +[CRLWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](CRLWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", a4, 0, 1);
  id v9 = v8;
  if (v8
    && ([v8 frameBounds], v14.double x = x, v14.y = y, CGRectContainsPoint(v15, v14))
    && (id v10 = objc_msgSend(v9, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:leadingEdge:", 0, 0, 1, 0, 0, x, y), v10 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v11 = [v9 smartFieldAtCharIndex:v10 attributeKind:a3];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)pathForHighlightWithRange:(_NSRange)a3 columnArray:(id)a4 pathStyle:(int)a5
{
  id v17 = a4;
  BOOL v6 = +[CRLBezierPath bezierPath];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v17;
  id v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v19 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v10 = [v9 rectsForSelectionRange:a3.location selectionType:a3.length forParagraphMode:0 includeRuby:0 includePaginatedAttachments:0];
        id v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v22;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v10);
              }
              CGPoint v14 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
              [v14 CGRectValue];
              if (a5 == 2)
              {
                [v14 CGRectValue];
                CGRect v33 = CGRectInset(v32, -3.0, -3.0);
                CGRect v15 = +[CRLBezierPath bezierPathWithLegacyRoundedRect:cornerRadius:](CRLBezierPath, "bezierPathWithLegacyRoundedRect:cornerRadius:", v33.origin.x, v33.origin.y, v33.size.width, v33.size.height, 3.0);
                [v6 appendBezierPath:v15];
              }
              else
              {
                [v6 appendBezierPathWithRect:];
              }
            }
            id v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v11);
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  return v6;
}

+ (CGRect)boundsRectForSelection:(id)a3 columnArray:(id)a4 includeRuby:(BOOL)a5 includePaginatedAttachments:(BOOL)a6
{
  BOOL v34 = a6;
  BOOL v6 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  if (v8)
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v9;
    id v15 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v40;
      do
      {
        id v17 = 0;
        do
        {
          if (*(void *)v40 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v17);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v19 = [v8 range];
          long long v21 = [v18 rectsForSelectionRange:v19 selectionType:v20 forParagraphMode:[v8 type] includeRuby:0 includePaginatedAttachments:v6 v34];
          id v22 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v22)
          {
            uint64_t v23 = *(void *)v36;
            do
            {
              long long v24 = 0;
              do
              {
                if (*(void *)v36 != v23) {
                  objc_enumerationMutation(v21);
                }
                [*(id *)(*((void *)&v35 + 1) + 8 * (void)v24) CGRectValue];
                v48.origin.CGFloat x = v25;
                v48.origin.CGFloat y = v26;
                v48.size.CGFloat width = v27;
                v48.size.CGFloat height = v28;
                v45.origin.CGFloat x = x;
                v45.origin.CGFloat y = y;
                v45.size.CGFloat width = width;
                v45.size.CGFloat height = height;
                CGRect v46 = CGRectUnion(v45, v48);
                CGFloat x = v46.origin.x;
                CGFloat y = v46.origin.y;
                CGFloat width = v46.size.width;
                CGFloat height = v46.size.height;
                long long v24 = (char *)v24 + 1;
              }
              while (v22 != v24);
              id v22 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
            }
            while (v22);
          }

          id v17 = (char *)v17 + 1;
        }
        while (v17 != v15);
        id v15 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v15);
    }
  }
  double v29 = x;
  double v30 = y;
  double v31 = width;
  double v32 = height;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

+ (id)columnForCharIndex:(unint64_t)a3 allowEndOfColumn:(BOOL)a4 withColumns:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  CGFloat v26 = [v7 firstObject];
  id v8 = [v26 storage];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v9)
  {
    BOOL v10 = v5;
    uint64_t v11 = *(void *)v29;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        BOOL v13 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v12);
        CGPoint v14 = [v13 storage];
        BOOL v15 = v8 == v14;

        if (!v15)
        {
          unsigned int v16 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E3518);
          }
          id v17 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            unsigned int v33 = v16;
            __int16 v34 = 2082;
            long long v35 = "+[CRLWPColumn columnForCharIndex:allowEndOfColumn:withColumns:]";
            __int16 v36 = 2082;
            long long v37 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm";
            __int16 v38 = 1024;
            int v39 = 1068;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d unexpected column storage", buf, 0x22u);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014E3538);
          }
          id v18 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t v23 = +[CRLAssertionHandler packedBacktraceString];
            *(_DWORD *)buf = 67109378;
            unsigned int v33 = v16;
            __int16 v34 = 2114;
            long long v35 = v23;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
          }
          id v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPColumn columnForCharIndex:allowEndOfColumn:withColumns:]");
          uint64_t v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"];
          +[CRLAssertionHandler handleFailureInFunction:v19 file:v20 lineNumber:1068 isFatal:0 description:"unexpected column storage"];
        }
        id v21 = [v13 range];
        if ((unint64_t)v21 + v22 + v10 > a3)
        {
          id v24 = v13;
          goto LABEL_21;
        }
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v9 != v12);
      id v9 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v24 = 0;
LABEL_21:

  return v24;
}

+ (_NSRange)rangeOfColumns:(id)a3
{
  id v3 = a3;
  unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v5 = 0;
  if ([v3 count])
  {
    BOOL v6 = [v3 objectAtIndexedSubscript:0];
    unint64_t v4 = (unint64_t)[v6 range];
    NSUInteger v5 = v7;
  }
  if ((unint64_t)[v3 count] >= 2)
  {
    id v8 = objc_msgSend(v3, "objectAtIndexedSubscript:", (char *)objc_msgSend(v3, "count") - 1);
    id v9 = (char *)[v8 range];
    if (v4 <= (unint64_t)&v9[v10]) {
      uint64_t v11 = &v9[v10];
    }
    else {
      uint64_t v11 = (char *)v4;
    }
    if (v4 >= (unint64_t)&v9[v10]) {
      unint64_t v4 = (unint64_t)&v9[v10];
    }
    NSUInteger v5 = (NSUInteger)&v11[-v4];
  }
  NSUInteger v12 = v4;
  NSUInteger v13 = v5;
  result.length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (CRLWPColumn)initWithStorage:(id)a3 frameBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLWPColumn;
  uint64_t v11 = [(CRLWPColumn *)&v15 init];
  NSUInteger v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_storage, a3);
    v12->_frameBounds.origin.CGFloat x = x;
    v12->_frameBounds.origin.CGFloat y = y;
    v12->_frameBounds.size.CGFloat width = width;
    v12->_frameBounds.size.CGFloat height = height;
    int64x2_t v13 = vdupq_n_s64(0x7FF8000000000000uLL);
    *(int64x2_t *)&v12->_transformFromWP.a = v13;
    *(int64x2_t *)&v12->_transformFromWP.c = v13;
    *(int64x2_t *)&v12->_transformFromWP.tCGFloat x = v13;
    v12->_anchoredAttachmentRange = (_NSRange)xmmword_101176F48;
    v12->_scaleTextPercent = 100;
    v12->_nextLinePosition = NAN;
    operator new();
  }

  return 0;
}

- (id)initForTestingWithStorage:(id)a3 frameBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  id v10 = -[CRLWPColumn initWithStorage:frameBounds:](self, "initWithStorage:frameBounds:", v9, x, y, width, height);
  long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v13[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v13[1] = v11;
  v13[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [(CRLWPColumn *)v10 setTransformFromWP:v13];

  return v10;
}

- (void)dealloc
{
  cntrl = self->_lineFragmentArray.__cntrl_;
  self->_lineFragmentArray.__ptr_ = 0;
  self->_lineFragmentArray.__cntrl_ = 0;
  if (cntrl) {
    sub_100039CE8((std::__shared_weak_count *)cntrl);
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLWPColumn;
  [(CRLWPColumn *)&v4 dealloc];
}

- (double)logicalBoundsTop
{
  return CGRectGetMinY(self->_frameBounds);
}

- (double)logicalBoundsBottom
{
  return CGRectGetMaxY(self->_frameBounds);
}

- (_NSRange)range
{
  unint64_t v3 = [(CRLWPColumn *)self startCharIndex];
  NSUInteger v4 = [(CRLWPColumn *)self characterCount];
  NSUInteger v5 = v3;
  result.length = v4;
  result.NSUInteger location = v5;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  [(CRLWPColumn *)self setStartCharIndex:a3.location];

  [(CRLWPColumn *)self setCharacterCount:length];
}

- (unint64_t)startAnchoredCharIndex
{
  return self->_anchoredAttachmentRange.location;
}

- (unint64_t)anchoredCharCount
{
  return self->_anchoredAttachmentRange.length;
}

- (_NSRange)anchoredRange
{
  NSUInteger length = self->_anchoredAttachmentRange.length;
  NSUInteger location = self->_anchoredAttachmentRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setAnchoredRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.length >= 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3558);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108D65C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3578);
    }
    BOOL v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    NSUInteger v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPColumn setAnchoredRange:]");
    id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:1235 isFatal:0 description:"Illegal anchored range"];
  }
  self->_anchoredAttachmentRange.NSUInteger location = location;
  self->_anchoredAttachmentRange.NSUInteger length = length;
}

- (CGSize)maxSize
{
  double width = self->_frameBounds.size.width;
  double height = self->_frameBounds.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGAffineTransform)transformFromWP
{
  CGSize result = &self->_transformFromWP;
  long long v4 = *(_OWORD *)&result->c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&result->a;
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&result->tx;
  return result;
}

- (double)minimumHeightForLayoutOnPage
{
  if ([(CRLWPColumn *)self lineCount])
  {
    uint64_t v3 = sub_100039A08(self->_lineFragmentArray.__ptr_, 0);
    double MinY = CGRectGetMinY(*(CGRect *)(v3 + 40));
    [(CRLWPColumn *)self logicalBoundsTop];
    double v6 = v5;
    double result = 0.0;
    if (MinY > v6) {
      return result;
    }
    if (*(unsigned char *)(v3 + 488)) {
      double v8 = *(double *)(v3 + 160);
    }
    else {
      double v8 = 0.0;
    }
    double contentBottom = *(double *)(v3 + 32) + *(double *)(v3 + 136) + v8;
  }
  else
  {
    double contentBottom = self->_contentBottom;
  }
  [(CRLWPColumn *)self logicalBoundsTop];
  return contentBottom - v10;
}

- (CGRect)erasableBounds:(unint64_t)a3
{
  CGFloat x = self->_frameBounds.origin.x;
  CGFloat y = self->_frameBounds.origin.y;
  CGFloat width = self->_frameBounds.size.width;
  CGFloat height = self->_frameBounds.size.height;
  v36.origin.CGFloat x = sub_100039B6C((uint64_t *)self->_lineFragmentArray.__ptr_, a3).n64_f64[0];
  v36.origin.CGFloat y = v8;
  v36.size.CGFloat width = v9;
  v36.size.CGFloat height = v10;
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGRect v31 = CGRectUnion(v30, v36);
  CGFloat v11 = v31.origin.x;
  CGFloat v12 = v31.origin.y;
  CGFloat v13 = v31.size.width;
  CGFloat v14 = v31.size.height;
  paragraphAdornments = self->_paragraphAdornments;
  if (paragraphAdornments && [(NSMutableArray *)paragraphAdornments count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    unsigned int v16 = self->_paragraphAdornments;
    id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v26;
      do
      {
        id v19 = 0;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * (void)v19) rect];
          v37.origin.CGFloat x = v20;
          v37.origin.CGFloat y = v21;
          v37.size.CGFloat width = v22;
          v37.size.CGFloat height = v23;
          v32.origin.CGFloat x = v11;
          v32.origin.CGFloat y = v12;
          v32.size.CGFloat width = v13;
          v32.size.CGFloat height = v14;
          CGRect v33 = CGRectUnion(v32, v37);
          CGFloat v11 = v33.origin.x;
          CGFloat v12 = v33.origin.y;
          CGFloat v13 = v33.size.width;
          CGFloat v14 = v33.size.height;
          id v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v17);
    }
  }
  [(CRLWPColumn *)self transformFromWP];
  v34.origin.CGFloat x = v11;
  v34.origin.CGFloat y = v12;
  v34.size.CGFloat width = v13;
  v34.size.CGFloat height = v14;
  return CGRectApplyAffineTransform(v34, &v24);
}

- (double)textBlockBottom
{
  [(CRLWPColumn *)self logicalBoundsTop];
  double v4 = v3;
  double v5 = (void *)sub_100039A2C(self->_lineFragmentArray.__ptr_);
  if (!v5) {
    return v4;
  }
  uint64_t v6 = v5[5];
  uint64_t v7 = v5[6];
  uint64_t v8 = v5[7];
  uint64_t v9 = v5[8];

  return CGRectGetMaxY(*(CGRect *)&v6);
}

- (double)textHeight
{
  [(CRLWPColumn *)self textBlockBottom];
  double v4 = v3;
  [(CRLWPColumn *)self logicalBoundsTop];
  return v4 - v5;
}

- (BOOL)requiresGlyphVectorsForHeightMeasurement
{
  v2 = [(CRLWPColumn *)self lineFragmentArray];
  uint64_t v3 = sub_1000399F8(*v2);
  if (v3)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_100039A08(*v2, 0);
    if (sub_100158628(v5))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      unint64_t v6 = 1;
      do
      {
        unint64_t v7 = v6;
        if (v4 == v6) {
          break;
        }
        uint64_t v8 = sub_100039A08(*v2, v6);
        int v9 = sub_100158628(v8);
        unint64_t v6 = v7 + 1;
      }
      while (!v9);
      LOBYTE(v3) = v7 < v4;
    }
  }
  return v3;
}

- (void)addAdornmentRect:(id)a3
{
}

- (void)clearAdornments
{
}

- (CGRect)frameBounds
{
  CGFloat x = self->_frameBounds.origin.x;
  CGFloat y = self->_frameBounds.origin.y;
  CGFloat width = self->_frameBounds.size.width;
  CGFloat height = self->_frameBounds.size.height;
  [(CRLWPColumn *)self transformFromWP];
  v7.origin.CGFloat x = x;
  v7.origin.CGFloat y = y;
  v7.size.CGFloat width = width;
  v7.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v7, &v6);
}

- (CGAffineTransform)transformToWP
{
  [(CRLWPColumn *)self transformFromWP];
  return CGAffineTransformInvert(retstr, &v5);
}

+ (CGPoint)pinPoint:(CGPoint)a3 toBottomOfLineFragmentInColumns:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v49;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v49 != v8) {
          objc_enumerationMutation(v6);
        }
        CGFloat v10 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        [v10 frameBounds];
        v54.double x = x;
        v54.double y = y;
        if (CGRectContainsPoint(v55, v54))
        {
          CGFloat v11 = (char *)[v10 lineCount];
          if (v11)
          {
            [v10 boundsOfLineFragmentAtIndex:v11 - 1];
            CGFloat rect = v12;
            CGFloat v14 = v13;
            CGFloat v16 = v15;
            CGFloat v18 = v17;
            if (v10)
            {
              [v10 transformToWP];
              double v19 = v43;
              double v20 = v45;
              double v32 = v44;
              double v21 = v47;
              double v33 = v46;
              double v34 = v42;
            }
            else
            {
              double v21 = 0.0;
              double v20 = 0.0;
              double v19 = 0.0;
              double v32 = 0.0;
              double v33 = 0.0;
              double v34 = 0.0;
            }
            v56.origin.double x = v16;
            v56.origin.double y = v18;
            v56.size.CGFloat width = v14;
            v56.size.CGFloat height = rect;
            double MaxY = CGRectGetMaxY(v56);
            if (v21 + y * v20 + v19 * x > MaxY)
            {
              if (v10)
              {
                [v10 transformFromWP];
                double v23 = v37;
                double v24 = v36;
                double v25 = v39;
                double v26 = v38;
                double v27 = v41;
                double v28 = v40;
              }
              else
              {
                double v27 = 0.0;
                double v25 = 0.0;
                double v23 = 0.0;
                double v28 = 0.0;
                double v26 = 0.0;
                double v24 = 0.0;
              }
              double v29 = v33 + y * v32 + v34 * x;
              double x = v28 + MaxY * v26 + v24 * v29;
              double y = v27 + MaxY * v25 + v23 * v29;
            }
          }
          goto LABEL_19;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  double v30 = x;
  double v31 = y;
  result.double y = v31;
  result.double x = v30;
  return result;
}

- (unint64_t)lineCount
{
  return sub_1000399F8(self->_lineFragmentArray.__ptr_);
}

- (const)lineFragmentArray
{
  return &self->_lineFragmentArray;
}

- (const)lineFragmentArrayForUnitTests
{
  return &self->_lineFragmentArray;
}

- (void)setLineFragmentArray:(const void *)a3
{
  unint64_t v4 = *(CRLWPLineFragmentArray **)a3;
  uint64_t v3 = *((void *)a3 + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_lineFragmentArray.__cntrl_;
  self->_lineFragmentArray.__ptr_ = v4;
  self->_lineFragmentArray.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    sub_100039CE8((std::__shared_weak_count *)cntrl);
  }
}

- (const)lineFragmentAtIndex:(unint64_t)a3
{
  return (const void *)sub_100039A08(self->_lineFragmentArray.__ptr_, a3);
}

- (void)offsetLineFragmentsBy:(CGSize)a3
{
  if (a3.width != 0.0 || a3.height != 0.0)
  {
    uint64_t v4 = *(void *)&a3.height;
    sub_100039BEC((double ***)self->_lineFragmentArray.__ptr_, a3.width, a3.height);
    *(float64x2_t *)&self->_double contentBottom = vaddq_f64((float64x2_t)vdupq_lane_s64(v4, 0), *(float64x2_t *)&self->_contentBottom);
  }
}

- (unint64_t)lineFragmentCountForBaseline:(double)a3
{
  return sub_100039C3C((uint64_t *)self->_lineFragmentArray.__ptr_, a3);
}

- (void)makeEmpty:(unint64_t)a3 anchoredRange:(_NSRange)a4 layoutResultFlags:(unint64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  -[CRLWPColumn setStartCharIndex:](self, "setStartCharIndex:");
  [(CRLWPColumn *)self setCharacterCount:0];
  -[CRLWPColumn setAnchoredRange:](self, "setAnchoredRange:", location, length);
  self->_double contentBottom = 0.0;
  self->_erasableContentBottom = 0.0;
  self->_layoutResultFlags = a5;
  [(CRLWPColumn *)self setNextWidowPullsDownFromCharIndex:a3];
  sub_100039B68((uint64_t *)self->_lineFragmentArray.__ptr_);

  [(CRLWPColumn *)self clearAdornments];
}

- (CGRect)boundsOfLineFragmentAtIndex:(unint64_t)a3
{
  uint64_t v4 = (double *)sub_100039A08(self->_lineFragmentArray.__ptr_, a3);
  CGFloat v5 = v4[5];
  CGFloat v6 = v4[6];
  CGFloat v7 = v4[7];
  CGFloat v8 = v4[8];
  [(CRLWPColumn *)self transformFromWP];
  v10.origin.double x = v5;
  v10.origin.double y = v6;
  v10.size.CGFloat width = v7;
  v10.size.CGFloat height = v8;
  return CGRectApplyAffineTransform(v10, &v9);
}

- (id)partitionedLayoutOfLineFragmentAtIndex:(unint64_t)a3
{
  uint64_t v3 = sub_100039A08(self->_lineFragmentArray.__ptr_, a3);

  return sub_100152CE0(v3);
}

- (CGRect)rawGlyphRectOfRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  unint64_t v10 = [(CRLWPColumn *)self lineIndexForCharIndex:a3.location eol:0];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    CGFloat v11 = [(CRLWPColumn *)self lineFragmentAtIndex:v10];
    uint64_t v12 = (uint64_t)v11;
    if (v11[3] < 0) {
      double v13 = (NSRange *)&xmmword_101176F48;
    }
    else {
      double v13 = (NSRange *)v11;
    }
    v23.NSUInteger location = location;
    v23.NSUInteger length = length;
    NSRange v14 = NSIntersectionRange(v23, *v13);
    if (location == v14.location && length == v14.length)
    {
      CGFloat x = sub_100156930(v12, location, length, self);
      CGFloat y = v16;
      CGFloat width = v17;
      CGFloat height = v18;
    }
  }
  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CRLWPFontHeightInfo)fontHeightInfoAtCharIndex:(SEL)a3
{
  *retstr = *(CRLWPFontHeightInfo *)byte_1011763E8;
  CGRect result = [(CRLWPColumn *)self lineIndexForCharIndex:a4 eol:0];
  if (result != (CRLWPFontHeightInfo *)0x7FFFFFFFFFFFFFFFLL)
  {
    sub_100157E2C((uint64_t)[(CRLWPColumn *)self lineFragmentAtIndex:result], a4, self, (uint64_t)v11);
    long long v8 = v11[3];
    *(_OWORD *)&retstr->descent = v11[2];
    *(_OWORD *)&retstr->leadingBelow = v8;
    long long v9 = v11[5];
    *(_OWORD *)&retstr->verticalHeight = v11[4];
    *(_OWORD *)&retstr->underlinePosition = v9;
    long long v10 = v11[1];
    *(_OWORD *)&retstr->spaceBefore = v11[0];
    *(_OWORD *)&retstr->ascent = v10;
  }
  return result;
}

- (double)baselineOfLineFragmentAtIndex:(unint64_t)a3
{
  return *(double *)(sub_100039A08(self->_lineFragmentArray.__ptr_, a3) + 32);
}

- (_NSRange)rangeOfLineFragmentAtIndex:(unint64_t)a3
{
  uint64_t v3 = sub_100039A08(self->_lineFragmentArray.__ptr_, a3);
  if (*(uint64_t *)(v3 + 24) < 0) {
    uint64_t v4 = (NSUInteger *)&xmmword_101176F48;
  }
  else {
    uint64_t v4 = (NSUInteger *)v3;
  }
  NSUInteger v5 = *v4;
  NSUInteger v6 = v4[1];
  result.NSUInteger length = v6;
  result.NSUInteger location = v5;
  return result;
}

- (unsigned)hyphenCharOfLineFragmentAtIndex:(unint64_t)a3
{
  uint64_t v3 = sub_100039A08(self->_lineFragmentArray.__ptr_, a3);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  if (!sub_100159020(v3)) {
    return 0;
  }

  return sub_10015DF1C(v4);
}

- ($1C7B61A4053D036F47119D3E279950B5)lineMetricsAtCharIndex:(SEL)a3 allowEndOfLine:(unint64_t)a4
{
  BOOL v5 = a5;
  memcpy(retstr, &unk_101178488, sizeof($1C7B61A4053D036F47119D3E279950B5));
  _NSRange result = [(CRLWPColumn *)self lineIndexForCharIndex:a4 eol:v5];
  if (result != ($1C7B61A4053D036F47119D3E279950B5 *)0x7FFFFFFFFFFFFFFFLL)
  {
    long long v10 = [(CRLWPColumn *)self lineFragmentAtIndex:result];
    uint64_t v11 = (uint64_t)v10;
    BOOL v34 = 0;
    CGSize size = CGRectNull.size;
    retstr->var0.origin = CGRectNull.origin;
    retstr->var0.CGSize size = size;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    if (v10[3] < 0) {
      double v13 = &xmmword_101176F48;
    }
    else {
      double v13 = (long long *)v10;
    }
    NSRange v14 = -[CRLWPColumn rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:includePaginatedAttachments:](self, "rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:includePaginatedAttachments:", *(void *)v13, *((void *)v13 + 1), 0, 0, 0, 0);
    id v15 = [v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v31;
      CGFloat x = retstr->var0.origin.x;
      CGFloat y = retstr->var0.origin.y;
      CGFloat width = retstr->var0.size.width;
      CGFloat height = retstr->var0.size.height;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * i) CGRectValue];
          v38.origin.CGFloat x = v22;
          v38.origin.CGFloat y = v23;
          v38.size.CGFloat width = v24;
          v38.size.CGFloat height = v25;
          v36.origin.CGFloat x = x;
          v36.origin.CGFloat y = y;
          v36.size.CGFloat width = width;
          v36.size.CGFloat height = height;
          CGRect v37 = CGRectUnion(v36, v38);
          CGFloat x = v37.origin.x;
          CGFloat y = v37.origin.y;
          CGFloat width = v37.size.width;
          CGFloat height = v37.size.height;
          retstr->var0 = v37;
        }
        id v15 = [v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v15);
    }

    retstr->var1 = *(double *)(v11 + 32);
    *(_OWORD *)&retstr->var2.descent = *(_OWORD *)(v11 + 136);
    *(_OWORD *)&retstr->var2.leadingBelow = *(_OWORD *)(v11 + 152);
    *(_OWORD *)&retstr->var2.verticalHeight = *(_OWORD *)(v11 + 168);
    *(_OWORD *)&retstr->var2.underlinePosition = *(_OWORD *)(v11 + 184);
    *(_OWORD *)&retstr->var2.spaceBefore = *(_OWORD *)(v11 + 104);
    *(_OWORD *)&retstr->var2.ascent = *(_OWORD *)(v11 + 120);
    if (sub_100152BC0(v11))
    {
      double v26 = (const __CTFont *)sub_100159E2C((unint64_t *)v11, a4, &v34);
      retstr->var3 = CTFontGetXHeight(v26);
    }
    _NSRange result = [(CRLWPColumn *)self transformToWP];
    *(_OWORD *)&retstr->var7.a = v27;
    *(_OWORD *)&retstr->var7.c = v28;
    *(_OWORD *)&retstr->var7.tCGFloat x = v29;
  }
  return result;
}

- (double)horizontalOffsetForCharIndex:(unint64_t)a3 lineFragmentIndex:(unint64_t)a4 bumpPastHyphen:(BOOL)a5 allowPastLineBounds:(BOOL)a6
{
  BOOL v7 = a5;
  uint64_t v9 = sub_100039A08(self->_lineFragmentArray.__ptr_, a4);

  return sub_100153EB4(v9, a3, v7, a6, 0);
}

- (const)lineFragmentClosestToPoint:(CGPoint)a3 knobTag:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  [(CRLWPColumn *)self transformToWP];
  long long v8 = [(CRLWPColumn *)self lineFragmentArray];
  uint64_t v9 = sub_1000399F8(*v8);
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  unint64_t v12 = 0;
  double v13 = v21 + y * v20 + v19 * x;
  double v14 = INFINITY;
  do
  {
    id v15 = (double *)sub_100039A08(*v8, v12);
    sub_100289A18(a4, v15[5], v15[6], v15[7], v15[8]);
    double v17 = vabdd_f64(v13, v16);
    if (v17 < v14)
    {
      uint64_t v11 = v15;
      double v14 = v17;
    }
    ++v12;
  }
  while (v10 != v12);
  return v11;
}

- (const)lineFragmentForCharIndex:(unint64_t)a3 knobTag:(unint64_t)a4 selectionType:(unint64_t)a5
{
  char v53 = 0;
  id v7 = [(CRLWPColumn *)self range];
  if (a3 >= (unint64_t)v7 && a3 - (unint64_t)v7 < v8
    || (uint64_t v9 = (char *)[(CRLWPColumn *)self range], &v9[v10] == (char *)a3))
  {
    id v52 = 0;
    unint64_t v11 = [(CRLWPColumn *)self pRemapCharIndex:a3 outIsAfterBreak:&v53 outWithTextSource:&v52];
    id v12 = v52;
    buf[0] = 0;
    char v51 = 0;
    long long v48 = (char *)v11;
    [(CRLWPColumn *)self pInfoForCharIndex:v11 isAtStart:&v51 isAtEnd:buf];
    double v13 = [(CRLWPColumn *)self lineFragmentArray];
    uint64_t v14 = sub_1000399F8(*v13);
    uint64_t v15 = v14;
    if (v14)
    {
      unint64_t v16 = 0;
      uint64_t v47 = v14 - 1;
      do
      {
        uint64_t v17 = sub_100039A08(*v13, v16);
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)(v17 + 24);
        if ((v19 & 0x40) == 0)
        {
          BOOL v21 = (v19 & 0x1000) == 0 || a5 != 7;
          BOOL v22 = v19 < 0;
          CGFloat v23 = &xmmword_101176F48;
          if (!v22) {
            CGFloat v23 = (long long *)v17;
          }
          unint64_t v25 = *(void *)v23;
          CGFloat v24 = (char *)*((void *)v23 + 1);
          double v26 = (char *)[v12 charIndexRemappedFromStorage:*(void *)v23];
          long long v27 = (char *)[v12 charIndexRemappedFromStorage:&v24[v25]];
          BOOL v28 = (unint64_t)v48 < v25 || &v48[-v25] >= v24;
          if (!v28 || (int v29 = 0, buf[0]) && v48 == v26)
          {
            int v29 = 1;
            if (a4 == 11 && v48 == v26)
            {
              unint64_t v30 = *(void *)(v18 + 24);
              if (v30) {
                int v29 = (v30 >> 9) & 1;
              }
              else {
                int v29 = 1;
              }
            }
          }
          if (a5 == 7)
          {
            double v26 = (char *)sub_10015909C(v18);
            long long v27 = (char *)sub_1001590D0(v18);
            int v31 = (a4 == 11) ^ v21 ^ 1;
          }
          else
          {
            int v31 = a4 == 11;
          }
          BOOL v32 = v48 == v27;
          if (v48 == v27 && v31 != 0)
          {
            if (buf[0]) {
              BOOL v34 = v53 == 0;
            }
            else {
              BOOL v34 = 0;
            }
            BOOL v32 = v34 && v47 == v16;
          }
          char v36 = v31 ^ 1;
          if (v48 != v26) {
            char v36 = 1;
          }
          if (v36) {
            LOBYTE(v37) = 0;
          }
          else {
            int v37 = (*(unsigned __int8 *)(v18 + 25) >> 1) & 1;
          }
          if ((v29 | v32) & 1) != 0 || (v37) {
            goto LABEL_63;
          }
        }
      }
      while (v15 != ++v16);
    }
  }
  else
  {
    CGRect v38 = [(CRLWPColumn *)self storage];
    id v39 = [v38 length];

    if ((unint64_t)v39 >= a3) {
      return 0;
    }
    unsigned int v40 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E35D8);
    }
    double v41 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
    {
      double v46 = [(CRLWPColumn *)self storage];
      *(_DWORD *)buf = 67110402;
      unsigned int v55 = v40;
      __int16 v56 = 2082;
      double v57 = "-[CRLWPColumn lineFragmentForCharIndex:knobTag:selectionType:]";
      __int16 v58 = 2082;
      double v59 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm";
      __int16 v60 = 1024;
      int v61 = 1670;
      __int16 v62 = 2048;
      unint64_t v63 = a3;
      __int16 v64 = 2048;
      id v65 = [v46 length];
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v41, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d charIndex %lu beyond storage length: %lu", buf, 0x36u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E35F8);
    }
    double v42 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPColumn lineFragmentForCharIndex:knobTag:selectionType:]");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    double v43 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"];
    double v44 = [(CRLWPColumn *)self storage];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v43, 1670, 0, "charIndex %lu beyond storage length: %lu", a3, [v44 length]);
  }
  uint64_t v18 = 0;
LABEL_63:

  return (const void *)v18;
}

- (const)nearestLineFragmentWithSameVerticalPositionAs:(unint64_t)a3 xPos:(double)a4
{
  unint64_t v5 = a3;
  CGRect v22 = *(CGRect *)(sub_100039A08(self->_lineFragmentArray.__ptr_, a3) + 40);
  double MinY = CGRectGetMinY(v22);
  do
  {
    unint64_t v8 = v5;
    if (!v5) {
      break;
    }
    --v5;
    CGRect v23 = *(CGRect *)(sub_100039A08(self->_lineFragmentArray.__ptr_, v8 - 1) + 40);
  }
  while (CGRectGetMinY(v23) >= MinY);
  unint64_t v9 = [(CRLWPColumn *)self lineCount];
  if (v8 < v9)
  {
    unint64_t v10 = v9;
    double v11 = INFINITY;
    unint64_t v12 = v8;
    do
    {
      double v13 = (double *)sub_100039A08(self->_lineFragmentArray.__ptr_, v12);
      CGFloat v14 = v13[5];
      CGFloat v15 = v13[6];
      CGFloat v16 = v13[7];
      CGFloat v17 = v13[8];
      v24.origin.double x = v14;
      v24.origin.double y = v15;
      v24.size.CGFloat width = v16;
      v24.size.CGFloat height = v17;
      if (MinY != CGRectGetMinY(v24)) {
        break;
      }
      v25.origin.double x = v14;
      v25.origin.double y = v15;
      v25.size.CGFloat width = v16;
      v25.size.CGFloat height = v17;
      double v18 = vabdd_f64(a4, CGRectGetMinX(v25));
      v26.origin.double x = v14;
      v26.origin.double y = v15;
      v26.size.CGFloat width = v16;
      v26.size.CGFloat height = v17;
      double v19 = vabdd_f64(a4, CGRectGetMaxX(v26));
      if (v19 >= v18) {
        double v19 = v18;
      }
      if (v19 < v11)
      {
        double v11 = v19;
        unint64_t v8 = v12;
      }
      ++v12;
    }
    while (v12 < v10);
  }

  return [(CRLWPColumn *)self lineFragmentAtIndex:v8];
}

- (void)pInfoForCharIndex:(unint64_t)a3 isAtStart:(BOOL *)a4 isAtEnd:(BOOL *)a5
{
  int64_t v8 = [(CRLWPStorage *)self->_storage length];
  *a4 = a3 == 0;
  *a5 = v8 == a3;
}

- (unint64_t)pRemapCharIndex:(unint64_t)a3 outIsAfterBreak:(BOOL *)a4 outWithTextSource:(id *)a5
{
  unint64_t v9 = self->_storage;
  int64_t v10 = [(CRLWPStorage *)v9 charIndexMappedFromStorage:a3];
  unint64_t v11 = a3;
  if (v10) {
    unint64_t v11 = sub_1001CAB34(a3, v9);
  }
  if (a4)
  {
    if (v11 == a3)
    {
      BOOL v12 = 0;
    }
    else
    {
      uint64_t v13 = -[CRLWPStorage characterAtIndex:](self->_storage, "characterAtIndex:");
      int v14 = v13;
      unsigned __int8 v15 = sub_1001CA284(v13);
      if (v14 == 8232) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = v15;
      }
    }
    *a4 = v12;
  }
  if (a5) {
    *a5 = v9;
  }
  int64_t v16 = [(CRLWPStorage *)v9 charIndexRemappedFromStorage:a3];

  return v16;
}

- (unint64_t)lineIndexForCharIndex:(unint64_t)a3 eol:(BOOL)a4
{
  char v26 = 0;
  id v25 = 0;
  unint64_t v6 = [(CRLWPColumn *)self pRemapCharIndex:a3 outIsAfterBreak:&v26 outWithTextSource:&v25];
  id v7 = v25;
  __int16 v24 = 0;
  [(CRLWPColumn *)self pInfoForCharIndex:v6 isAtStart:&v24 isAtEnd:(char *)&v24 + 1];
  int64_t v8 = [(CRLWPColumn *)self lineFragmentArray];
  uint64_t v9 = sub_1000399F8(*v8);
  if (v9)
  {
    unint64_t v10 = 0;
    while (1)
    {
      unint64_t v11 = (long long *)sub_100039A08(*v8, v10);
      BOOL v12 = v11;
      uint64_t v13 = *((uint64_t *)v11 + 3) < 0 ? &xmmword_101176F48 : v11;
      unint64_t v15 = *(void *)v13;
      unint64_t v14 = *((void *)v13 + 1);
      id v16 = [v7 charRangeRemappedFromStorage:*(void *)v13, v14];
      BOOL v17 = v6 < v15 || v6 - v15 >= v14;
      BOOL v18 = !v17;
      BOOL v19 = HIBYTE(v24) && v6 == (void)v16;
      BOOL v20 = v19;
      if (v6 == v15 + v14)
      {
        BOOL v21 = HIBYTE(v24) || a4;
        if (v26) {
          BOOL v21 = 0;
        }
        BOOL v22 = (*((void *)v12 + 3) & 0x100000100) == 0 && v21;
      }
      else
      {
        BOOL v22 = 0;
      }
      if (v18 || v20 || v22) {
        break;
      }
      if (v9 == ++v10) {
        goto LABEL_31;
      }
    }
  }
  else
  {
LABEL_31:
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (CGRect)caretRectForSelection:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3618);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108D888();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3638);
    }
    unint64_t v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    unint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPColumn caretRectForSelection:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1856, 0, "invalid nil value for '%{public}s'", "selection");
  }
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  BOOL v12 = (char *)[v4 range];
  id v13 = [v4 caretAffinity];
  unint64_t v14 = (char *)[(CRLWPColumn *)self range];
  unint64_t v16 = v15;
  BOOL v17 = (char *)[(CRLWPStorage *)self->_storage range];
  if (v12 <= &v17[v18])
  {
    char v91 = 0;
    id v90 = 0;
    unint64_t v19 = [(CRLWPColumn *)self pRemapCharIndex:v12 outIsAfterBreak:&v91 outWithTextSource:&v90];
    id v76 = v90;
    __int16 v89 = 0;
    [(CRLWPColumn *)self pInfoForCharIndex:v19 isAtStart:&v89 isAtEnd:(char *)&v89 + 1];
    if ((char *)v19 == &v14[v16]) {
      uint64_t v20 = 1;
    }
    else {
      uint64_t v20 = (uint64_t)v13;
    }
    if ((char *)v19 == v12) {
      id v21 = v13;
    }
    else {
      id v21 = (id)v20;
    }
    if (v19 < (unint64_t)v14
      || v19 - (unint64_t)v14 >= v16
      || v19 <= (unint64_t)v14 && !(_BYTE)v89 && v21 == (id)1 && !v91)
    {
      if ((char *)v19 != &v14[v16]) {
        goto LABEL_108;
      }
      BOOL v22 = v21 == (id)1 && v91 == 0;
      if (!v22 && !HIBYTE(v89)) {
        goto LABEL_108;
      }
    }
    unint64_t v23 = [(CRLWPColumn *)self lineIndexForCharIndex:v12 eol:v21 == (id)1];
    if (v23 >= [(CRLWPColumn *)self lineCount]) {
      goto LABEL_108;
    }
    __int16 v24 = [(CRLWPColumn *)self lineFragmentAtIndex:v23];
    if (!v24)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E3658);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108D7F4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E3678);
      }
      id v25 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      char v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPColumn caretRectForSelection:]");
      long long v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 1898, 0, "invalid nil value for '%{public}s'", "lineFragment");
    }
    if (!sub_100152BC0((uint64_t)v24))
    {
      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(0, *(Swift::String *)&v28);
      double x = v32;
      double y = v33;
      double width = v34;
      double height = v35;
      uint64_t v36 = *((void *)v24 + 3);
      if (v36 < 0) {
        int v37 = &xmmword_101176F48;
      }
      else {
        int v37 = (long long *)v24;
      }
      unint64_t v38 = *((void *)v37 + 1);
      if (v38)
      {
        if (v36 < 0) {
          id v39 = &xmmword_101176F48;
        }
        else {
          id v39 = (long long *)v24;
        }
        double x = v32 + (double)(v19 - *(void *)v39) / (double)v38;
      }
      goto LABEL_108;
    }
    BOOL v88 = 0;
    uint64_t v30 = v91 - 1;
    if (v19 <= (unint64_t)v17) {
      uint64_t v30 = 0;
    }
    uint64_t v31 = (uint64_t)sub_100159E2C((unint64_t *)v24, v30 + v19, &v88);
    long long v74 = [(CRLWPStorage *)self->_storage characterStyleAtCharIndex:v19 before:v91 == 0 effectiveRange:0];
    double v75 = [(CRLWPStorage *)self->_storage paragraphStyleAtCharIndex:v19];
    if (v31)
    {
      CFTypeRef cf = 0;
    }
    else
    {
      uint64_t v31 = sub_1001CDA80(v74, v75, self->_scaleTextPercent);
      CFTypeRef cf = (CFTypeRef)v31;
      if (!v31)
      {
LABEL_107:

LABEL_108:
        [(CRLWPColumn *)self transformFromWP];
        v93.origin.double x = x;
        v93.origin.double y = y;
        v93.size.double width = width;
        v93.size.double height = height;
        CGRect v94 = CGRectApplyAffineTransform(v93, &v77);
        double x = v94.origin.x;
        double y = v94.origin.y;
        double width = v94.size.width;
        double height = v94.size.height;

        goto LABEL_109;
      }
    }
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    sub_1001CE5C0(v31, &v82);
    unsigned int v40 = sub_1001CD4F8(v74, v75, 0);
    double v41 = v40;
    if (v40)
    {
      [v40 doubleValue];
      double v43 = v42;
    }
    else
    {
      double v43 = 0.0;
    }
    double v44 = (char *)[v76 charIndexRemappedFromStorage:[v4 insertionChar]];
    unsigned __int8 v45 = [v4 leadingEdge];
    unint64_t v46 = -[CRLWPColumn lineIndexForCharIndex:eol:](self, "lineIndexForCharIndex:eol:", [v4 insertionChar], v21 == (id)1);
    if (v46 == v23 || v46 >= [(CRLWPColumn *)self lineCount]) {
      int v47 = 0;
    }
    else {
      int v47 = *((unsigned char *)[(CRLWPColumn *)self lineFragmentAtIndex:v46] + 28) & 1;
    }
    if ((v45 & 1) != 0
      || ((unsigned __int8 v48 = [v4 isAtEndOfLine], (unint64_t)v44 >= v19)
        ? (char v49 = 1)
        : (char v49 = v48),
          (v49 & 1) != 0))
    {
      if (!v47) {
        goto LABEL_74;
      }
    }
    else
    {
      if (v19 == *(void *)v24) {
        char v50 = 1;
      }
      else {
        char v50 = v47;
      }
      if ((v50 & 1) == 0)
      {
        unsigned __int8 v45 = 0;
        goto LABEL_74;
      }
    }
    unsigned __int8 v45 = 1;
    double v44 = (char *)v19;
LABEL_74:
    char v51 = &xmmword_101176F48;
    if (*((uint64_t *)v24 + 3) >= 0) {
      char v51 = (long long *)v24;
    }
    CGPoint v54 = v51;
    unint64_t v53 = *(void *)v51;
    id v52 = (char *)*((void *)v54 + 1);
    BOOL v55 = &v44[-v53] < v52 && (unint64_t)v44 >= v53;
    if (v55 || v44 == &v52[v53])
    {
      sub_10015A1EC((uint64_t)v24, (unint64_t)v44, v45, (int)[v4 isVisual], 0);
      double x = v59;
      double v60 = v24[4];
      v92[0] = 0.0;
      double v80 = 0.0;
      double v81 = 0.0;
      double v78 = 0.0;
      double v79 = 0.0;
      double v61 = v60 - v43;
      if (sub_10015CD60(v24, v19, v92, &v81, &v80, &v79, &v78))
      {
        double v62 = floor(v61 + v81 * 0.5 - v92[0]);
        double width = v80 + v79 + v78;
        double x = x - width;
        double v63 = 0.0;
      }
      else
      {
        unsigned int v64 = [(CRLWPColumn *)self textIsVertical];
        if (v88) {
          unsigned int v65 = 0;
        }
        else {
          unsigned int v65 = v64;
        }
        double v66 = *(double *)&v83;
        double v67 = *(double *)&v84;
        if (v65 == 1)
        {
          double v67 = (*(double *)&v83 + *(double *)&v84) * 0.5;
          *(double *)&long long v84 = v67;
          *(double *)&long long v83 = v67;
          double v66 = v67;
        }
        double v62 = floor(v61 - v66 - *((double *)&v84 + 1));
        double v63 = ceil(v61 + v67) - v62;
        double width = 0.0;
      }
      uint64_t v68 = *((void *)v24 + 3);
      if (v68) {
        double height = v24[8];
      }
      else {
        double height = v63;
      }
      if (v68) {
        double y = v24[6];
      }
      else {
        double y = v62;
      }
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E3698);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108D76C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E36B8);
      }
      __int16 v56 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v56, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      double v57 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPColumn caretRectForSelection:]");
      __int16 v58 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v57 file:v58 lineNumber:1948 isFatal:0 description:"invalid charIndex for line fragment"];
    }
    if (cf) {
      CFRelease(cf);
    }

    goto LABEL_107;
  }
LABEL_109:

  double v69 = x;
  double v70 = y;
  double v71 = width;
  double v72 = height;
  result.size.double height = v72;
  result.size.double width = v71;
  result.origin.double y = v70;
  result.origin.double x = v69;
  return result;
}

- (CGRect)glyphRectForRange:(_NSRange)a3 includingLabel:(BOOL)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  v85.NSUInteger location = (NSUInteger)[(CRLWPColumn *)self range];
  v85.NSUInteger length = v12;
  range2.NSUInteger location = location;
  v81.NSUInteger location = location;
  v81.NSUInteger length = length;
  NSUInteger v13 = sub_1002093DC(v81, v85, length == 0);
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    ptr = self->_lineFragmentArray.__ptr_;
    unint64_t v16 = *(uint64_t **)ptr;
    BOOL v17 = (uint64_t *)*((void *)ptr + 1);
    if (*(uint64_t **)ptr != v17)
    {
      NSUInteger v18 = v13;
      NSUInteger v19 = v14;
      NSUInteger v74 = v13 + v14;
      NSUInteger v20 = location + length;
      do
      {
        id v21 = (NSUInteger *)*v16;
        if (*(uint64_t *)(*v16 + 24) < 0) {
          id v21 = (NSUInteger *)&xmmword_101176F48;
        }
        NSUInteger v23 = *v21;
        NSUInteger v22 = v21[1];
        v82.NSUInteger location = *v21;
        v82.NSUInteger length = v22;
        v86.NSUInteger location = v18;
        v86.NSUInteger length = v19;
        v24.NSUInteger location = sub_1002093DC(v82, v86, v19 == 0);
        if (v24.location != 0x7FFFFFFFFFFFFFFFLL || (!v22 ? (BOOL v25 = v23 == v74) : (BOOL v25 = 0), v25))
        {
          NSUInteger v26 = v24.location + v24.length;
          if (v24.location + v24.length >= v20) {
            NSUInteger v26 = v20;
          }
          if (v24.location < v26)
          {
            NSRange v83 = NSIntersectionRange(v24, v24);
            v87.NSUInteger location = range2.location;
            v87.NSUInteger length = length;
            NSRange v27 = NSIntersectionRange(v83, v87);
            if (v27.length)
            {
              CGFloat v75 = height;
              CGFloat v77 = width;
              CGFloat v72 = y;
              CGFloat v73 = x;
              double v28 = sub_100157D64(*v16, v27.location, v27.length, self);
              CGFloat v30 = v29;
              double v32 = v31;
              CGFloat v34 = v33;
              v89.origin.CGFloat x = sub_10015835C(*v16, v27.location, v27.length);
              CGFloat v35 = v89.origin.x;
              CGFloat v36 = v89.origin.y;
              CGFloat v37 = v89.size.width;
              CGFloat v38 = v89.size.height;
              if (!CGRectIsEmpty(v89))
              {
                v90.origin.CGFloat x = v28;
                v90.origin.CGFloat y = v30;
                v90.size.CGFloat width = v32;
                v90.size.CGFloat height = v34;
                v108.origin.CGFloat x = v35;
                v108.origin.CGFloat y = v36;
                v108.size.CGFloat width = v37;
                v108.size.CGFloat height = v38;
                CGRect v91 = CGRectUnion(v90, v108);
                double v28 = v91.origin.x;
                CGFloat v30 = v91.origin.y;
                double v32 = v91.size.width;
                CGFloat v34 = v91.size.height;
              }
              v92.origin.CGFloat x = v28;
              v92.origin.CGFloat y = v30;
              v92.size.CGFloat width = v32;
              v92.size.CGFloat height = v34;
              if (!CGRectIsEmpty(v92))
              {
                v93.origin.CGFloat x = v28;
                v93.origin.CGFloat y = v30;
                v93.size.CGFloat width = v32;
                v93.size.CGFloat height = v34;
                CGRect v94 = CGRectIntegral(v93);
                double v28 = v94.origin.x;
                CGFloat v30 = v94.origin.y;
                double v32 = v94.size.width;
                CGFloat v34 = v94.size.height;
                double MaxX = CGRectGetMaxX(v94);
                if (MaxX == rint(CGRectGetMaxX(self->_frameBounds)) + -1.0) {
                  double v32 = v32 + 1.0;
                }
              }
              v109.size.CGFloat height = v75;
              v109.size.CGFloat width = v77;
              v95.origin.CGFloat x = v28;
              v95.origin.CGFloat y = v30;
              v95.size.CGFloat width = v32;
              v95.size.CGFloat height = v34;
              v109.origin.CGFloat x = v73;
              v109.origin.CGFloat y = v72;
              CGRect v96 = CGRectUnion(v95, v109);
              CGFloat x = v96.origin.x;
              CGFloat y = v96.origin.y;
              CGFloat width = v96.size.width;
              CGFloat height = v96.size.height;
            }
          }
          uint64_t v40 = *v16;
          if ((*(unsigned char *)(*v16 + 25) & 0x10) != 0) {
            uint64_t v41 = sub_1001590D0(v40);
          }
          else {
            uint64_t v41 = sub_10015909C(v40);
          }
          NSUInteger v42 = v41;
          if (a4)
          {
            uint64_t v43 = sub_100152CD8(*v16);
            if (v43)
            {
              double v44 = (void *)v43;
              v84.NSUInteger location = v42;
              v84.NSUInteger length = 0;
              v88.NSUInteger location = range2.location;
              v88.NSUInteger length = length;
              NSUInteger v45 = sub_1002093DC(v84, v88, 1);

              if (v45 != 0x7FFFFFFFFFFFFFFFLL)
              {
                double v46 = sub_100158764(*v16);
                double v48 = v47;
                double v50 = v49;
                double v52 = v51;
                unint64_t v53 = sub_100152CD8(*v16);
                CGPoint v54 = (const __CTLine *)[v53 textLine];
                if (v54)
                {
                  double v76 = height;
                  double v78 = width;
                  BOOL v55 = (CGContext *)sub_1001568AC();
                  CGRect ImageBounds = CTLineGetImageBounds(v54, v55);
                  double v56 = ImageBounds.origin.x;
                  double v57 = ImageBounds.origin.y;
                  CGFloat v58 = ImageBounds.size.width;
                  double v59 = ImageBounds.size.height;
                  double v60 = sub_100158924(*v16);
                  double v62 = v61;
                  if ([v53 isLabelTateChuYoko])
                  {
                    CGAffineTransformMakeRotation(&v80, 1.57079633);
                    v98.origin.CGFloat x = v56;
                    v98.origin.CGFloat y = v57;
                    v98.size.CGFloat width = v58;
                    v98.size.CGFloat height = v59;
                    CGRect v99 = CGRectApplyAffineTransform(v98, &v80);
                    double v56 = v99.origin.x;
                    double v57 = v99.origin.y;
                    CGFloat v58 = v99.size.width;
                    double v59 = v99.size.height;
                  }
                  v100.origin.CGFloat x = v60 + v56;
                  v100.origin.CGFloat y = v62 - v57 - v59;
                  v100.size.CGFloat width = v58;
                  v100.size.CGFloat height = v59;
                  CGRect v101 = CGRectIntegral(v100);
                  double v46 = v101.origin.x;
                  double v48 = v101.origin.y;
                  double v50 = v101.size.width;
                  double v52 = v101.size.height;
                  CGFloat height = v76;
                  CGFloat width = v78;
                }
                double v63 = [v53 shadow];
                if ([v63 isEnabled])
                {
                  [v63 shadowBoundsForRect:v46, v48, v50, v52];
                  double v46 = v64;
                  double v48 = v65;
                  double v50 = v66;
                  double v52 = v67;
                }
                v102.origin.CGFloat x = x;
                v102.origin.CGFloat y = y;
                v102.size.CGFloat width = width;
                v102.size.CGFloat height = height;
                v110.origin.CGFloat x = v46;
                v110.origin.CGFloat y = v48;
                v110.size.CGFloat width = v50;
                v110.size.CGFloat height = v52;
                CGRect v103 = CGRectUnion(v102, v110);
                CGFloat x = v103.origin.x;
                CGFloat y = v103.origin.y;
                CGFloat width = v103.size.width;
                CGFloat height = v103.size.height;
              }
            }
          }
        }
        v16 += 2;
      }
      while (v16 != v17);
    }
    v104.origin.CGFloat x = x;
    v104.origin.CGFloat y = y;
    v104.size.CGFloat width = width;
    v104.size.CGFloat height = height;
    if (!CGRectIsNull(v104))
    {
      [(CRLWPColumn *)self transformFromWP];
      v105.origin.CGFloat x = x;
      v105.origin.CGFloat y = y;
      v105.size.CGFloat width = width;
      v105.size.CGFloat height = height;
      CGRect v106 = CGRectApplyAffineTransform(v105, (CGAffineTransform *)&range2.length);
      CGFloat x = v106.origin.x;
      CGFloat y = v106.origin.y;
      CGFloat width = v106.size.width;
      CGFloat height = v106.size.height;
    }
  }
  double v68 = x;
  double v69 = y;
  double v70 = width;
  double v71 = height;
  result.size.CGFloat height = v71;
  result.size.CGFloat width = v70;
  result.origin.CGFloat y = v69;
  result.origin.CGFloat x = v68;
  return result;
}

- (unsigned)fontTraitsForRange:(_NSRange)a3 includingLabel:(BOOL)a4
{
  NSUInteger range2 = a3.length;
  NSUInteger location = a3.location;
  uint64_t v41 = 0;
  NSUInteger v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = 0;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100227964;
  v40[3] = &unk_1014E36E0;
  v40[4] = &v41;
  unint64_t v6 = objc_retainBlock(v40);
  v49.NSUInteger location = (NSUInteger)[(CRLWPColumn *)self range];
  v49.NSUInteger length = v7;
  v46.NSUInteger length = range2;
  v46.NSUInteger location = location;
  NSUInteger v8 = sub_1002093DC(v46, v49, range2 == 0);
  v33.NSUInteger length = v9;
  v33.NSUInteger location = v8;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    ptr = self->_lineFragmentArray.__ptr_;
    unint64_t v11 = *(uint64_t **)ptr;
    double v32 = (uint64_t *)*((void *)ptr + 1);
    if (*(uint64_t **)ptr != v32)
    {
      NSUInteger v31 = v8 + v9;
      do
      {
        NSRange v12 = v33;
        NSUInteger v13 = (NSUInteger *)*v11;
        if (*(uint64_t *)(*v11 + 24) < 0) {
          NSUInteger v13 = (NSUInteger *)&xmmword_101176F48;
        }
        NSUInteger v15 = *v13;
        NSUInteger v14 = v13[1];
        v47.NSUInteger location = *v13;
        v47.NSUInteger length = v14;
        if (sub_1002093DC(v47, v12, v33.length == 0) != 0x7FFFFFFFFFFFFFFFLL
          || (!v14 ? (BOOL v16 = v15 == v31) : (BOOL v16 = 0), v16))
        {
          if (sub_100152BC0(*v11))
          {
            uint64_t v17 = sub_100152BE4(*v11, 0);
            NSUInteger v18 = (const __CTLine *)sub_1001BAB78(v17);
            if (v18)
            {
              NSUInteger v19 = CTLineGetGlyphRuns(v18);
              long long v38 = 0u;
              long long v39 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              id obj = v19;
              id v20 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
              if (v20)
              {
                uint64_t v21 = *(void *)v37;
                do
                {
                  for (i = 0; i != v20; i = (char *)i + 1)
                  {
                    if (*(void *)v37 != v21) {
                      objc_enumerationMutation(obj);
                    }
                    NSUInteger v23 = *(const __CTRun **)(*((void *)&v36 + 1) + 8 * i);
                    CFRange StringRange = CTRunGetStringRange(v23);
                    BOOL v25 = sub_1001524D8(*v11);
                    id v26 = [v25 charRangeMappedToStorage:StringRange.location, StringRange.length];
                    NSUInteger v28 = v27;

                    v48.NSUInteger location = (NSUInteger)v26;
                    v48.NSUInteger length = v28;
                    v50.NSUInteger location = location;
                    v50.NSUInteger length = range2;
                    if (NSIntersectionRange(v48, v50).length) {
                      ((void (*)(void *, const __CTRun *))v6[2])(v6, v23);
                    }
                  }
                  id v20 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
                }
                while (v20);
              }
            }
          }
        }
        v11 += 2;
      }
      while (v11 != v32);
    }
  }
  unsigned int v29 = *((_DWORD *)v42 + 6);

  _Block_object_dispose(&v41, 8);
  return v29;
}

- (CGRect)glyphRectForRubyFieldAtCharIndex:(unint64_t)a3 glyphRange:(_NSRange)a4
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  ptr = self->_lineFragmentArray.__ptr_;
  NSUInteger v9 = *(uint64_t **)ptr;
  unint64_t v10 = (uint64_t *)*((void *)ptr + 1);
  if (v9 != v10)
  {
    while (1)
    {
      NSRange v12 = *(uint64_t *)(*v9 + 24) < 0 ? (unint64_t *)&xmmword_101176F48 : (unint64_t *)*v9;
      NSUInteger v15 = v12;
      unint64_t v13 = *v12;
      unint64_t v14 = v15[1];
      BOOL v17 = a3 >= v13;
      unint64_t v16 = a3 - v13;
      BOOL v17 = !v17 || v16 >= v14;
      if (!v17) {
        break;
      }
      v9 += 2;
      if (v9 == v10) {
        goto LABEL_14;
      }
    }
    double v18 = sub_1001580F0(*v9, a3, a4.location, a4.length);
    CGFloat x = v18;
    CGFloat y = v19;
    CGFloat width = v20;
    CGFloat height = v21;
    if (!CGRectIsNull(*(CGRect *)&v18))
    {
      [(CRLWPColumn *)self transformFromWP];
      v27.origin.CGFloat x = x;
      v27.origin.CGFloat y = y;
      v27.size.CGFloat width = width;
      v27.size.CGFloat height = height;
      CGRect v28 = CGRectApplyAffineTransform(v27, &v26);
      CGFloat x = v28.origin.x;
      CGFloat y = v28.origin.y;
      CGFloat width = v28.size.width;
      CGFloat height = v28.size.height;
    }
  }
LABEL_14:
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (unint64_t)glyphCountForRubyFieldAtCharIndex:(unint64_t)a3
{
  ptr = self->_lineFragmentArray.__ptr_;
  unint64_t v5 = *(uint64_t **)ptr;
  id v4 = (uint64_t *)*((void *)ptr + 1);
  if (v5 != v4)
  {
    while (1)
    {
      NSUInteger v7 = *(uint64_t *)(*v5 + 24) < 0 ? (unint64_t *)&xmmword_101176F48 : (unint64_t *)*v5;
      unint64_t v10 = v7;
      unint64_t v8 = *v7;
      unint64_t v9 = v10[1];
      BOOL v12 = a3 >= v8;
      unint64_t v11 = a3 - v8;
      BOOL v12 = !v12 || v11 >= v9;
      if (!v12) {
        break;
      }
      v5 += 2;
      if (v5 == v4) {
        return 0;
      }
    }
    uint64_t v14 = *(void *)sub_100152BFC(*v5);
    uint64_t v15 = *(void *)(sub_100152BFC(*v5) + 8);
    while (v14 != v15)
    {
      if (*(void *)(v14 + 24) == a3)
      {
        unint64_t v16 = (const __CTLine *)sub_1001BAB78(v14);
        return CTLineGetGlyphCount(v16);
      }
      v14 += 104;
    }
  }
  return 0;
}

+ (CGRect)columnRectForRange:(_NSRange)a3 withColumns:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v26;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v30.NSUInteger location = [v15 range:v25];
        v31.NSUInteger location = location;
        v31.NSUInteger length = length;
        NSRange v16 = NSIntersectionRange(v30, v31);
        if (v16.length)
        {
          [v15 columnRectForRange:v16.location, v16.length];
          v35.origin.CGFloat x = v17;
          v35.origin.CGFloat y = v18;
          v35.size.CGFloat width = v19;
          v35.size.CGFloat height = v20;
          v32.origin.CGFloat x = x;
          v32.origin.CGFloat y = y;
          v32.size.CGFloat width = width;
          v32.size.CGFloat height = height;
          CGRect v33 = CGRectUnion(v32, v35);
          CGFloat x = v33.origin.x;
          CGFloat y = v33.origin.y;
          CGFloat width = v33.size.width;
          CGFloat height = v33.size.height;
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }

  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

+ (CGRect)labelRectForCharIndex:(unint64_t)a3 withColumns:(id)a4
{
  id v5 = a4;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v10 = v5;
  id v11 = [v10 countByEnumeratingWithState:&v34 objects:v59 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v35;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v15 = [v14 range];
        BOOL v17 = a3 - (unint64_t)v15 < v16 && a3 >= (unint64_t)v15;
        if ((id)a3 == v15 || v17)
        {
          id v19 = [v14 lineIndexForCharIndex:a3 eol:0];
          if (v19 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            CGFloat v20 = (long long *)[v14 lineFragmentAtIndex:v19];
            if (v20)
            {
              if (*((uint64_t *)v20 + 3) < 0) {
                double v21 = &xmmword_101176F48;
              }
              else {
                double v21 = v20;
              }
              if (*(void *)v21 == a3)
              {
                uint64_t v58 = 0;
                long long v56 = 0u;
                long long v57 = 0u;
                long long v54 = 0u;
                long long v55 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                long long v50 = 0u;
                long long v51 = 0u;
                long long v48 = 0u;
                long long v49 = 0u;
                long long v46 = 0u;
                long long v47 = 0u;
                long long v44 = 0u;
                long long v45 = 0u;
                long long v42 = 0u;
                long long v43 = 0u;
                long long v40 = 0u;
                long long v41 = 0u;
                long long v38 = 0u;
                long long v39 = 0u;
                if (v14)
                {
                  [v14 lineMetricsAtCharIndex:a3 allowEndOfLine:0];
                  CGFloat v22 = *((double *)&v47 + 1);
                  CGFloat v23 = *(double *)&v47;
                  CGFloat v24 = *((double *)&v48 + 1);
                  CGFloat v25 = *(double *)&v48;
                  [v14 transformFromWP];
                }
                else
                {
                  CGFloat v24 = 0.0;
                  CGFloat v25 = 0.0;
                  CGFloat v22 = 0.0;
                  CGFloat v23 = 0.0;
                  memset(&v33, 0, sizeof(v33));
                }
                v60.origin.CGFloat x = v23;
                v60.origin.CGFloat y = v22;
                v60.size.CGFloat width = v25;
                v60.size.CGFloat height = v24;
                CGRect v61 = CGRectApplyAffineTransform(v60, &v33);
                CGFloat x = v61.origin.x;
                CGFloat y = v61.origin.y;
                CGFloat width = v61.size.width;
                CGFloat height = v61.size.height;
              }
            }
            else
            {
              +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014E3700);
              }
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
                sub_10108D91C();
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014E3720);
              }
              long long v26 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
              {
                +[CRLAssertionHandler packedBacktraceString];
                objc_claimAutoreleasedReturnValue();
                sub_1010663B0();
              }

              long long v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPColumn labelRectForCharIndex:withColumns:]");
              long long v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"];
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 2304, 0, "invalid nil value for '%{public}s'", "lf");
            }
          }
          goto LABEL_36;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v34 objects:v59 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_36:

  double v29 = x;
  double v30 = y;
  double v31 = width;
  double v32 = height;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (CGRect)columnRectForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  v30.NSUInteger location = (NSUInteger)[(CRLWPColumn *)self range];
  v30.NSUInteger length = v10;
  v28.NSUInteger location = location;
  v28.NSUInteger length = length;
  if (NSIntersectionRange(v28, v30).length)
  {
    ptr = self->_lineFragmentArray.__ptr_;
    uint64_t v12 = *(unint64_t ***)ptr;
    uint64_t v13 = (unint64_t **)*((void *)ptr + 1);
    if (*(unint64_t ***)ptr != v13)
    {
      do
      {
        uint64_t v14 = (NSRange *)*v12;
        if (((*v12)[3] & 0x8000000000000000) != 0) {
          uint64_t v14 = (NSRange *)&xmmword_101176F48;
        }
        v29.NSUInteger location = location;
        v29.NSUInteger length = length;
        NSRange v15 = NSIntersectionRange(v29, *v14);
        if (v15.length)
        {
          sub_100152F60(*v12, v15.location, v15.length, 1, 1, 0, 0, (char **)__p);
          sub_1001CEDF4((CGRect **)__p);
          CGFloat v17 = v16;
          CGFloat v19 = v18;
          CGFloat v21 = v20;
          CGFloat v23 = v22;
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          v31.origin.CGFloat x = x;
          v31.origin.CGFloat y = y;
          v31.size.CGFloat width = width;
          v31.size.CGFloat height = height;
          v35.origin.CGFloat x = v17;
          v35.origin.CGFloat y = v19;
          v35.size.CGFloat width = v21;
          v35.size.CGFloat height = v23;
          CGRect v32 = CGRectUnion(v31, v35);
          CGFloat x = v32.origin.x;
          CGFloat y = v32.origin.y;
          CGFloat width = v32.size.width;
          CGFloat height = v32.size.height;
        }
        v12 += 2;
      }
      while (v12 != v13);
    }
  }
  CGFloat v24 = self->_frameBounds.origin.x;
  CGFloat v25 = self->_frameBounds.size.width;
  [(CRLWPColumn *)self transformFromWP];
  v33.origin.CGFloat x = v24;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = v25;
  v33.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v33, &v26);
}

- (CGRect)typographicBounds
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  ptr = self->_lineFragmentArray.__ptr_;
  unint64_t v8 = *(uint64_t **)ptr;
  unint64_t v9 = (uint64_t *)*((void *)ptr + 1);
  while (v8 != v9)
  {
    uint64_t v10 = *v8;
    v8 += 2;
    v12.origin.CGFloat x = sub_10015902C(v10);
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    CGRect v13 = CGRectUnion(v12, v16);
    CGFloat x = v13.origin.x;
    CGFloat y = v13.origin.y;
    CGFloat width = v13.size.width;
    CGFloat height = v13.size.height;
  }
  [(CRLWPColumn *)self transformFromWP];
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v14, &v11);
}

- (id)lineSelectionsForSelection:(id)a3
{
  id v4 = (CRLWPSelection *)a3;
  id v5 = +[NSMutableArray arrayWithCapacity:1];
  id v6 = [(CRLWPColumn *)self range];
  NSUInteger v8 = v7;
  v28.NSUInteger location = (NSUInteger)[(CRLWPSelection *)v4 range];
  v29.NSUInteger location = (NSUInteger)v6;
  v29.NSUInteger length = v8;
  NSRange v9 = NSIntersectionRange(v28, v29);
  if (v9.length)
  {
    ptr = self->_lineFragmentArray.__ptr_;
    CGAffineTransform v11 = *(NSUInteger ***)ptr;
    CGRect v12 = (NSUInteger **)*((void *)ptr + 1);
    if (*(NSUInteger ***)ptr != v12)
    {
      NSUInteger v13 = v9.length + v9.location - 1;
      while (1)
      {
        CGRect v14 = *v11;
        if (((*v11)[3] & 0x8000000000000000) != 0) {
          CGRect v14 = (NSUInteger *)&xmmword_101176F48;
        }
        NSUInteger v16 = *v14;
        NSUInteger v15 = v14[1];
        BOOL v18 = v9.location >= *v14;
        NSUInteger v17 = v9.location - *v14;
        BOOL v18 = !v18 || v17 >= v15;
        if (v18)
        {
          if (v13 >= v16 && v13 - v16 < v15)
          {
            CGFloat v25 = [CRLWPSelection alloc];
            v32.NSUInteger location = v16;
            v32.NSUInteger length = v15;
            NSRange v26 = NSIntersectionRange(v9, v32);
            double v22 = -[CRLWPSelection initWithRange:](v25, "initWithRange:", v26.location, v26.length);

            [v5 addObject:v22];
            goto LABEL_27;
          }
          v30.NSUInteger location = v16;
          v30.NSUInteger length = v15;
          if (NSIntersectionRange(v9, v30).length)
          {
            double v22 = -[CRLWPSelection initWithRange:]([CRLWPSelection alloc], "initWithRange:", v16, v15);

            [v5 addObject:v22];
          }
          else
          {
            double v22 = v4;
          }
        }
        else
        {
          double v20 = [CRLWPSelection alloc];
          v31.NSUInteger location = v16;
          v31.NSUInteger length = v15;
          NSRange v21 = NSIntersectionRange(v9, v31);
          double v22 = -[CRLWPSelection initWithRange:](v20, "initWithRange:", v21.location, v21.length);

          [v5 addObject:v22];
          if (v13 >= v16 && v13 - v16 < v15) {
            goto LABEL_27;
          }
        }
        v11 += 2;
        id v4 = v22;
        if (v11 == v12) {
          goto LABEL_27;
        }
      }
    }
  }
  double v22 = v4;
LABEL_27:

  return v5;
}

+ (BOOL)partitionedAttachmentStartsAtCharIndex:(unint64_t)a3 withColumns:(id)a4
{
  unint64_t v4 = a3;
  id v5 = +[CRLWPColumn columnForCharIndex:a3 allowEndOfColumn:1 withColumns:a4];
  LOBYTE(v4) = [v5 p_isFirstPartitionForCharIndex:v4];

  return v4;
}

- (BOOL)p_isFirstPartitionForCharIndex:(unint64_t)a3
{
  ptr = self->_lineFragmentArray.__ptr_;
  unint64_t v4 = *(long long ***)ptr;
  id v5 = (long long **)*((void *)ptr + 1);
  if (v4 == v5) {
    return 0;
  }
  while (1)
  {
    id v6 = *v4;
    uint64_t v7 = *((void *)*v4 + 3);
    if ((v7 & 0x200) != 0)
    {
      if (v7 < 0) {
        id v6 = &xmmword_101176F48;
      }
      uint64_t v10 = v6;
      unint64_t v8 = *(void *)v6;
      unint64_t v9 = *((void *)v10 + 1);
      BOOL v11 = a3 - v8 < v9 && a3 >= v8;
      uint64_t v12 = v8 + v9;
      if (v11 || v12 == a3) {
        break;
      }
    }
    v4 += 2;
    if (v4 == v5) {
      return 0;
    }
  }
  return 1;
}

- (CGRect)firstRectForSelection:(id)a3 includeSpaceAfter:(BOOL)a4 includeSpaceBefore:(BOOL)a5 includeLeading:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  id v15 = [v10 range];
  BYTE2(v28) = 0;
  LOWORD(v28) = 0;
  NSUInteger v17 = -[CRLWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:", v15, v16, [v10 type], v8, v7, v6, v28, 0, 0);
  BOOL v18 = [(CRLWPColumn *)self pTransformReturnRects:v17];

  if ([v18 count])
  {
    CGFloat v19 = [v18 firstObject];
    [v19 CGRectValue];
    CGFloat x = v20;
    CGFloat y = v21;
    CGFloat width = v22;
    CGFloat height = v23;
  }
  double v24 = x;
  double v25 = y;
  double v26 = width;
  double v27 = height;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (const)pColumnEndingPartitionedLineFragmentInSelectionRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  CGRect result = [(CRLWPColumn *)self lineCount];
  if (result)
  {
    CGRect result = [(CRLWPColumn *)self lineFragmentAtIndex:(char *)result - 1];
    if ((*((void *)result + 3) & 0x101) == 1)
    {
      if (*(void *)result - location >= length || *(void *)result < location) {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)pMutableRectsForSelectionRange:(_NSRange)a3 selectionType:(unint64_t)a4 includeSpaceAfter:(BOOL)a5 includeSpaceBefore:(BOOL)a6 includeLeading:(BOOL)a7 forParagraphMode:(BOOL)a8 includeRuby:(BOOL)a9 includePaginatedAttachments:(BOOL)a10 inranges:(id)a11 outranges:(id *)a12
{
  BOOL v139 = a6;
  BOOL v140 = a5;
  NSUInteger range1 = a3.length;
  NSUInteger location = a3.location;
  id v14 = a11;
  CGFloat v128 = self;
  unint64_t v15 = [(CRLWPStorage *)self->_storage length];
  if (a12)
  {
    id v136 = +[NSMutableArray arrayWithCapacity:1];
    *a12 = v136;
  }
  else
  {
    id v136 = 0;
  }
  if (v15 < location + range1 || (id v16 = [(CRLWPColumn *)v128 range], v15 < (unint64_t)v16 + v17))
  {
    id v135 = +[NSMutableArray array];
    goto LABEL_7;
  }
  id v135 = +[NSMutableArray arrayWithCapacity:1];
  v162.NSUInteger location = (NSUInteger)[(CRLWPColumn *)v128 range];
  v162.NSUInteger length = v19;
  v160.NSUInteger location = location;
  v160.NSUInteger length = range1;
  NSRange v21 = NSIntersectionRange(v160, v162);
  NSUInteger length = v21.length;
  if (v21.length)
  {
    if (v14)
    {
      if (a4 == 7) {
        a4 = 0;
      }
    }
    else
    {
      double v23 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", location, range1);
      id v14 = +[NSArray arrayWithObject:v23];
    }
    ptr = v128->_lineFragmentArray.__ptr_;
    double v25 = *(unint64_t ***)ptr;
    v129 = (unint64_t **)*((void *)ptr + 1);
    if (*(unint64_t ***)ptr != v129)
    {
      double v26 = 0;
      NSUInteger v137 = location + range1 - 1;
      NSUInteger v125 = v21.length + v21.location - 1;
      double v133 = -1.0;
      double v127 = 0.0;
      double v124 = 0.0;
      id v122 = v14;
      while (1)
      {
        while (1)
        {
          double v27 = (NSUInteger *)&xmmword_101176F48;
          if (((*v25)[3] & 0x8000000000000000) == 0) {
            double v27 = *v25;
          }
          NSUInteger v29 = *v27;
          NSUInteger v28 = v27[1];
          if (*((double *)*v25 + 4) != v133)
          {
            double v26 = (char *)[v135 count];
            CGFloat MaxY = CGRectGetMaxY(*(CGRect *)(*v25 + 5));
            double v133 = *((double *)*v25 + 4);
            double v124 = *((double *)*v25 + 17);
            double v31 = MaxY - (v133 + v124);
            if (*((double *)*v25 + 19) < v31) {
              double v31 = *((double *)*v25 + 19);
            }
            double v127 = fmax(v31, 0.0);
          }
          v161.NSUInteger location = v21.location;
          v161.NSUInteger length = length;
          v163.NSUInteger location = v29;
          v163.NSUInteger length = v28;
          NSRange v32 = NSIntersectionRange(v161, v163);
          if (v32.length) {
            break;
          }
          v25 += 2;
          if (v25 == v129) {
            goto LABEL_106;
          }
        }
        if (v32.length == 1)
        {
          uint64_t v33 = [(CRLWPStorage *)v128->_storage characterAtIndex:v32.location];
          int v34 = v33;
          unsigned __int8 v35 = sub_1001CA284(v33);
          if (v34 == 8232) {
            char v36 = 1;
          }
          else {
            char v36 = v35;
          }
        }
        else
        {
          char v36 = 0;
        }
        NSUInteger v131 = v28;
        uint64_t v132 = v26;
        NSUInteger v130 = v29;
        if (a8)
        {
          long long v37 = (double *)*v25;
        }
        else
        {
          if (!a10) {
            goto LABEL_42;
          }
          long long v37 = (double *)*v25;
          if (((*v25)[3] & 1) == 0) {
            char v36 = 1;
          }
          if (v36)
          {
LABEL_42:
            if (v136)
            {
              long long v40 = +[NSMutableArray array];
            }
            else
            {
              long long v40 = 0;
            }
            __p = 0;
            __dst = 0;
            uint64_t v147 = 0;
            long long v141 = 0u;
            long long v142 = 0u;
            long long v143 = 0u;
            long long v144 = 0u;
            id v41 = v14;
            id v42 = [v41 countByEnumeratingWithState:&v141 objects:v158 count:16];
            if (v42)
            {
              uint64_t v43 = *(void *)v142;
              do
              {
                for (i = 0; i != v42; i = (char *)i + 1)
                {
                  if (*(void *)v142 != v43) {
                    objc_enumerationMutation(v41);
                  }
                  v164.NSUInteger location = (NSUInteger)[*(id *)(*((void *)&v141 + 1) + 8 * i) rangeValue];
                  v164.NSUInteger length = v45;
                  NSRange v46 = NSIntersectionRange(v32, v164);
                  if (v46.length)
                  {
                    if (a4 != 7
                      || (location >= v46.location ? (BOOL v47 = location - v46.location >= v46.length) : (BOOL v47 = 1),
                          v47 && (v137 >= v46.location ? (BOOL v48 = v137 - v46.location >= v46.length) : (BOOL v48 = 1), v48)))
                    {
                      sub_100152F60(*v25, v46.location, v46.length, v140, v139, a9, v40, (char **)buf);
                    }
                    else
                    {
                      sub_100156188((uint64_t)*v25, v46.location, v46.length, location, v137, v140, v139, a9, (void **)buf, v40);
                    }
                    long long v49 = *(char **)buf;
                    sub_1001488D0((uint64_t)&__p, (uint64_t)__dst, *(char **)buf, *(char **)v149, (uint64_t)(*(void *)v149 - *(void *)buf) >> 5);
                    if (v49) {
                      operator delete(v49);
                    }
                  }
                }
                id v42 = [v41 countByEnumeratingWithState:&v141 objects:v158 count:16];
              }
              while (v42);
            }

            id v14 = v122;
            id v123 = [v135 count];
            if (v136)
            {
              long long v51 = __p;
              long long v50 = __dst;
              if ([v40 count] != (id)((v50 - v51) >> 5))
              {
                unsigned int v52 = +[CRLAssertionHandler _atomicIncrementAssertCount];
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014E3740);
                }
                long long v53 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_ERROR))
                {
                  CGRect v95 = __p;
                  CGRect v94 = __dst;
                  id v96 = [v40 count];
                  *(_DWORD *)buf = 67110402;
                  *(_DWORD *)&uint8_t buf[4] = v52;
                  *(_WORD *)id v149 = 2082;
                  *(void *)&v149[2] = "-[CRLWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:inc"
                                        "ludeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAtta"
                                        "chments:inranges:outranges:]";
                  __int16 v150 = 2082;
                  uint64_t v151 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm";
                  __int16 v152 = 1024;
                  int v153 = 2541;
                  __int16 v154 = 2048;
                  uint64_t v155 = (v94 - v95) >> 5;
                  __int16 v156 = 2048;
                  id v157 = v96;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v53, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Mismatch between rect & range count: %lu vs. %lu", buf, 0x36u);
                }

                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014E3760);
                }
                long long v54 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_ERROR))
                {
                  CGFloat v97 = +[CRLAssertionHandler packedBacktraceString];
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&uint8_t buf[4] = v52;
                  *(_WORD *)id v149 = 2114;
                  *(void *)&v149[2] = v97;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v54, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
                }
                long long v55 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:]");
                long long v56 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"];
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v55, v56, 2541, 0, "Mismatch between rect & range count: %lu vs. %lu", ((unsigned char *)__dst - (unsigned char *)__p) >> 5, [v40 count]);
              }
            }
            long long v57 = (double *)__p;
            uint64_t v58 = (double *)__dst;
            if (__p != __dst)
            {
              unsigned int v59 = 0;
              do
              {
                double v60 = *v57;
                double v61 = v57[1];
                double v63 = v57[2];
                double v62 = v57[3];
                if (a7)
                {
                  double v64 = *((double *)*v25 + 4);
                  double v65 = *((double *)*v25 + 17);
                  double v66 = *((double *)*v25 + 19);
                  double v67 = *v57;
                  uint64_t v68 = *((void *)v57 + 1);
                  uint64_t v69 = *((void *)v57 + 2);
                  double v70 = CGRectGetMaxY(*(CGRect *)(&v62 - 3));
                  if (v70 < v64 + v65 + v66) {
                    double v70 = v64 + v65 + v66;
                  }
                  double v62 = v70 - v61;
                }
                double v71 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v60, v61, v63, v62);
                [v135 addObject:v71];

                if (v136)
                {
                  CGFloat v73 = __p;
                  CGFloat v72 = __dst;
                  if ([v40 count] == (id)((v72 - v73) >> 5))
                  {
                    NSUInteger v74 = [v40 objectAtIndexedSubscript:v59];
                    [v136 addObject:v74];

                    ++v59;
                  }
                }
                v57 += 4;
              }
              while (v57 != v58);
            }
            if (a4 == 2)
            {
              double x = sub_100158764((uint64_t)*v25);
              CGFloat y = v76;
              CGFloat width = v78;
              CGFloat height = v80;
            }
            else
            {
              double x = CGRectNull.origin.x;
              CGFloat y = CGRectNull.origin.y;
              CGFloat width = CGRectNull.size.width;
              CGFloat height = CGRectNull.size.height;
            }
            v165.origin.double x = x;
            v165.origin.CGFloat y = y;
            v165.size.CGFloat width = width;
            v165.size.CGFloat height = height;
            if (!CGRectIsEmpty(v165) && v123 < [v135 count])
            {
              NSRange v82 = [v135 objectAtIndexedSubscript:v123];
              [v82 CGRectValue];
              CGFloat v84 = v83;
              double v86 = v85;
              CGFloat v88 = v87;
              double v90 = v89;

              v166.origin.double x = v84;
              v166.origin.CGFloat y = v86;
              v166.size.CGFloat width = v88;
              v166.size.CGFloat height = v90;
              v169.origin.double x = x;
              v169.origin.CGFloat y = y;
              v169.size.CGFloat width = width;
              v169.size.CGFloat height = height;
              CGRect v167 = CGRectUnion(v166, v169);
              CGRect v91 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v167.origin.x, v86, v167.size.width, v90);
              [v135 setObject:v91 atIndexedSubscript:v123];
            }
            if (__p)
            {
              __dst = __p;
              operator delete(__p);
            }
            goto LABEL_97;
          }
        }
        long long v38 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v37[5], v37[6], v37[7], v37[8]);
        [v135 addObject:v38];

        if (v136)
        {
          long long v39 = *v25;
          if (((*v25)[3] & 0x8000000000000000) != 0) {
            long long v39 = (unint64_t *)&xmmword_101176F48;
          }
          long long v40 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", *v39, v39[1]);
          [v136 addObject:v40];
LABEL_97:
        }
        NSUInteger length = v21.length;
        BOOL v92 = v125 - v130 < v131 && v125 >= v130;
        v25 += 2;
        BOOL v93 = v92 || v25 == v129;
        double v26 = v132;
        if (v93)
        {
LABEL_106:
          double v20 = v127;
          if (v127 > 0.0 && v140)
          {
            double v98 = v133 + v124 + v127;
            while (v26 < [v135 count])
            {
              CGRect v99 = [v135 objectAtIndexedSubscript:v26];
              [v99 CGRectValue];
              double v101 = v100;
              double v103 = v102;
              double v105 = v104;
              double v107 = v106;

              v168.origin.double x = v101;
              v168.origin.CGFloat y = v103;
              v168.size.CGFloat width = v105;
              v168.size.CGFloat height = v107;
              double v108 = CGRectGetMaxY(v168);
              if (v98 == v108 || vabdd_f64(v98, v108) < 0.00999999978)
              {
                CGRect v109 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v101, v103, v105, v107 - v127);
                [v135 setObject:v109 atIndexedSubscript:v26];
              }
              ++v26;
            }
          }
          break;
        }
      }
    }
  }
  CGRect v110 = -[CRLWPColumn pColumnEndingPartitionedLineFragmentInSelectionRange:](v128, "pColumnEndingPartitionedLineFragmentInSelectionRange:", location, range1, v20);
  uint64_t v111 = (uint64_t)v110;
  if (v110)
  {
    double v112 = v110[6];
    double v113 = v110[8];
    if (a8)
    {
      double v114 = v110[5];
      double v115 = v110[7];
    }
    else
    {
      if (!v140) {
        double v113 = v110[17] + v110[13] + v110[18] + v110[15];
      }
      if (v139) {
        double v116 = -0.0;
      }
      else {
        double v116 = v110[13];
      }
      if (v139) {
        double v117 = 0.0;
      }
      else {
        double v117 = v110[13];
      }
      unint64_t v118 = *(void *)v110;
      double v114 = sub_100153EB4((uint64_t)v110, *(void *)v110, 1, 1, 0);
      double v112 = v112 + v116;
      double v113 = v113 - v117;
      double v115 = sub_100153EB4(v111, v118 + 1, 1, 1, 0) - v114;
    }
    double v119 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v114, v112, v115, v113);
    [v135 addObject:v119];

    if (v136)
    {
      if (*(uint64_t *)(v111 + 24) < 0) {
        double v120 = &xmmword_101176F48;
      }
      else {
        double v120 = (long long *)v111;
      }
      double v121 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", *(void *)v120, *((void *)v120 + 1));
      [v136 addObject:v121];
    }
  }
LABEL_7:

  return v135;
}

- (id)pTransformReturnRects:(id)a3
{
  id v4 = a3;
  if ([(CRLWPColumn *)self textIsVertical])
  {
    id v5 = (char *)[v4 count];
    if (v5)
    {
      for (i = 0; i != v5; ++i)
      {
        BOOL v7 = [v4 objectAtIndexedSubscript:i];
        [v7 CGRectValue];
        CGFloat v9 = v8;
        CGFloat v11 = v10;
        CGFloat v13 = v12;
        CGFloat v15 = v14;

        [(CRLWPColumn *)self transformFromWP];
        v20.origin.double x = v9;
        v20.origin.CGFloat y = v11;
        v20.size.CGFloat width = v13;
        v20.size.CGFloat height = v15;
        CGRect v21 = CGRectApplyAffineTransform(v20, &v18);
        id v16 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
        [v4 setObject:v16 atIndexedSubscript:i];
      }
    }
  }

  return v4;
}

- (id)rectsForSelectionRanges:(id)a3 selectionType:(unint64_t)a4
{
  NSUInteger v6 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v7 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = a3;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        double v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (v6 == 0x7FFFFFFFFFFFFFFFLL && v7 == 0)
        {
          id location = [v12 rangeValue];
        }
        else
        {
          v29.id location = (NSUInteger)[v12 rangeValue];
          v29.NSUInteger length = v14;
          v28.id location = v6;
          v28.NSUInteger length = v7;
          NSRange v17 = NSUnionRange(v28, v29);
          NSUInteger length = v17.length;
          id location = (id)v17.location;
        }
        NSUInteger v6 = (NSUInteger)location;
        NSUInteger v7 = length;
      }
      id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  BYTE2(v21) = 0;
  LOWORD(v21) = 0;
  CGAffineTransform v18 = -[CRLWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:", v6, v7, a4, 1, 1, 0, v21, v8, 0);
  NSUInteger v19 = [(CRLWPColumn *)self pTransformReturnRects:v18];

  return v19;
}

- (id)rectsForSelectionRange:(_NSRange)a3 selectionType:(unint64_t)a4 forParagraphMode:(BOOL)a5 includeRuby:(BOOL)a6 includePaginatedAttachments:(BOOL)a7
{
  BYTE2(v11) = a7;
  BYTE1(v11) = a6;
  LOBYTE(v11) = a5;
  id v8 = -[CRLWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:", a3.location, a3.length, a4, 1, 1, 0, v11, 0, 0);
  id v9 = [(CRLWPColumn *)self pTransformReturnRects:v8];

  return v9;
}

- (id)rectsForSelection:(id)a3 ranges:(id *)a4
{
  id v4 = [(CRLWPColumn *)self rectsForSelection:a3 ranges:a4 includePaginatedAttachments:0];

  return v4;
}

- (id)naturalRectsForSelection:(id)a3 ranges:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 range];
  BYTE2(v11) = 0;
  LOWORD(v11) = 0;
  id v9 = -[CRLWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:", v7, v8, [v6 type], 1, 1, 0, v11, 0, a4);

  return v9;
}

- (id)rectsForSelection:(id)a3 ranges:(id *)a4 includePaginatedAttachments:(BOOL)a5
{
  id v8 = a3;
  id v9 = [v8 range];
  BYTE2(v14) = a5;
  LOWORD(v14) = 0;
  uint64_t v11 = -[CRLWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:", v9, v10, [v8 type], 1, 1, 0, v14, 0, a4);
  double v12 = [(CRLWPColumn *)self pTransformReturnRects:v11];

  return v12;
}

- (CGRect)erasableRectForSelectionRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  v18.NSUInteger location = (NSUInteger)[(CRLWPColumn *)self range];
  v18.NSUInteger length = v10;
  v17.NSUInteger location = location;
  v17.NSUInteger length = length;
  NSRange v11 = NSIntersectionRange(v17, v18);
  if (v11.length)
  {
    ptr = self->_lineFragmentArray.__ptr_;
    CGFloat v13 = *(NSRange ***)ptr;
    uint64_t v14 = (NSRange **)*((void *)ptr + 1);
    if (*(NSRange ***)ptr != v14)
    {
      do
      {
        CGFloat v15 = *v13;
        if (((*v13)[1].length & 0x8000000000000000) != 0) {
          CGFloat v15 = (NSRange *)&xmmword_101176F48;
        }
        if (NSIntersectionRange(v11, *v15).length)
        {
          v22.origin.CGFloat x = x;
          v22.origin.CGFloat y = y;
          v22.size.CGFloat width = width;
          v22.size.CGFloat height = height;
          CGRect v19 = CGRectUnion(*(CGRect *)&(*v13)[4].length, v22);
          CGFloat x = v19.origin.x;
          CGFloat y = v19.origin.y;
          CGFloat width = v19.size.width;
          CGFloat height = v19.size.height;
        }
        v13 += 2;
      }
      while (v13 != v14);
    }
  }
  [(CRLWPColumn *)self transformFromWP];
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v20, &v16);
}

- (id)drawableIntersectionRectsForSelection:(id)a3 inTarget:(id)a4
{
  id v80 = a3;
  id v81 = a4;
  id v6 = [v80 range];
  BYTE2(v75) = 0;
  LOWORD(v75) = 0;
  id v8 = -[CRLWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:includePaginatedAttachments:inranges:outranges:", v6, v7, [v80 type], 1, 1, 0, v75, 0, 0);
  id v9 = (char *)[v8 count];
  if (v9)
  {
    NSUInteger v10 = 0;
    uint64_t v11 = 1;
    do
    {
      double v12 = [v8 objectAtIndexedSubscript:v10];
      [v12 CGRectValue];
      CGFloat rect = v13;
      double x = v14;
      double width = v16;
      CGFloat height = v18;

      if (v10 || (unint64_t)[v80 start] < self->_startCharIndex)
      {
        v91.origin.double x = x;
        v91.origin.CGFloat y = rect;
        v91.size.double width = width;
        v91.size.CGFloat height = height;
        double MinX = CGRectGetMinX(v91);
        double v21 = MinX - CGRectGetMinX(self->_frameBounds);
        double x = x - v21;
        double width = width + v21;
      }
      unint64_t v22 = (unint64_t)(v10 + 1);
      if (v10 + 1 < v9)
      {
        while (1)
        {
          long long v23 = [v8 objectAtIndexedSubscript:v10 + 1];
          [v23 CGRectValue];
          CGFloat v25 = v24;
          CGFloat v27 = v26;
          CGFloat v29 = v28;
          CGFloat v31 = v30;

          v92.origin.double x = v25;
          v92.origin.CGFloat y = v27;
          v92.size.double width = v29;
          v92.size.CGFloat height = v31;
          double MinY = CGRectGetMinY(v92);
          v93.origin.double x = x;
          v93.origin.CGFloat y = rect;
          v93.size.double width = width;
          v93.size.CGFloat height = height;
          if (MinY != CGRectGetMinY(v93)) {
            break;
          }
          v94.origin.double x = x;
          v94.origin.CGFloat y = rect;
          v94.size.double width = width;
          v94.size.CGFloat height = height;
          v102.origin.double x = v25;
          v102.origin.CGFloat y = v27;
          v102.size.double width = v29;
          v102.size.CGFloat height = v31;
          CGRect v95 = CGRectUnion(v94, v102);
          CGFloat rect = v95.origin.y;
          double x = v95.origin.x;
          double width = v95.size.width;
          CGFloat height = v95.size.height;
          [v8 removeObjectAtIndex:v10 + 1];
          if (v22 >= (unint64_t)--v9)
          {
            id v9 = (char *)v11;
            break;
          }
        }
      }
      if (v10 != v9 - 1
        || (startCharIndedouble x = self->_startCharIndex,
            unint64_t characterCount = self->_characterCount,
            characterCount + startCharIndex <= (unint64_t)[v80 end]))
      {
        double MaxX = CGRectGetMaxX(self->_frameBounds);
        v96.origin.double x = x;
        v96.origin.CGFloat y = rect;
        v96.size.double width = width;
        v96.size.CGFloat height = height;
        double width = width + MaxX - CGRectGetMaxX(v96);
      }
      *(double *)double v89 = x;
      *(CGFloat *)&v89[1] = rect;
      *(double *)&v89[2] = width;
      *(CGFloat *)&v89[3] = height;
      char v36 = +[NSValue valueWithBytes:v89 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      [v8 setObject:v36 atIndexedSubscript:v10];

      ++v11;
      ++v10;
    }
    while (v22 < (unint64_t)v9);
  }
  if ((unint64_t)[v8 count] >= 2)
  {
    long long v37 = [v8 firstObject];
    [v37 CGRectValue];
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    CGFloat v45 = v44;

    NSRange v46 = [v8 lastObject];
    [v46 CGRectValue];
    CGFloat recta = v47;
    CGFloat v78 = v49;
    CGFloat v79 = v48;
    CGFloat v77 = v50;

    CGFloat v76 = CGRectGetMinX(self->_frameBounds);
    v97.origin.double x = v39;
    v97.origin.CGFloat y = v41;
    v97.size.double width = v43;
    v97.size.CGFloat height = v45;
    CGFloat MaxY = CGRectGetMaxY(v97);
    CGFloat v52 = CGRectGetWidth(self->_frameBounds);
    v98.origin.double x = recta;
    v98.size.double width = v78;
    v98.origin.CGFloat y = v79;
    v98.size.CGFloat height = v77;
    double v53 = CGRectGetMinY(v98);
    v99.origin.double x = v39;
    v99.origin.CGFloat y = v41;
    v99.size.double width = v43;
    v99.size.CGFloat height = v45;
    double v54 = CGRectGetMaxY(v99);
    [v8 removeAllObjects];
    *(CGFloat *)CGFloat v88 = v39;
    *(CGFloat *)&v88[1] = v41;
    *(CGFloat *)&v88[2] = v43;
    *(CGFloat *)&v88[3] = v45;
    long long v55 = +[NSValue valueWithBytes:v88 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    [v8 addObject:v55];

    *(CGFloat *)double v87 = v76;
    *(CGFloat *)&v87[1] = MaxY;
    *(CGFloat *)&v87[2] = v52;
    *(double *)&v87[3] = v53 - v54;
    long long v56 = +[NSValue valueWithBytes:v87 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    [v8 addObject:v56];

    *(CGFloat *)double v86 = recta;
    *(CGFloat *)&v86[1] = v79;
    *(CGFloat *)&v86[2] = v78;
    *(CGFloat *)&v86[3] = v77;
    long long v57 = +[NSValue valueWithBytes:v86 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
    [v8 addObject:v57];
  }
  uint64_t v58 = (char *)[v8 count];
  if (v58)
  {
    for (i = 0; i != v58; ++i)
    {
      double v60 = [v8 objectAtIndexedSubscript:i];
      [v60 CGRectValue];
      CGFloat v62 = v61;
      CGFloat v64 = v63;
      CGFloat v66 = v65;
      CGFloat v68 = v67;

      [(CRLWPColumn *)self transformFromWP];
      v100.origin.double x = v62;
      v100.origin.CGFloat y = v64;
      v100.size.double width = v66;
      v100.size.CGFloat height = v68;
      CGRect v101 = CGRectApplyAffineTransform(v100, &v85);
      [v81 rectInRoot:v101.origin.x, v101.origin.y, v101.size.width, v101.size.height];
      v84[0] = v69;
      v84[1] = v70;
      v84[2] = v71;
      v84[3] = v72;
      CGFloat v73 = +[NSValue valueWithBytes:v84 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
      [v8 setObject:v73 atIndexedSubscript:i];
    }
  }

  return v8;
}

- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 pastCenterGoesToNextChar:(BOOL)a5 allowNotFound:(BOOL)a6 constrainToAscentAndDescent:(BOOL)a7 isAtEndOfLine:(BOOL *)a8 leadingEdge:(BOOL *)a9
{
  return -[CRLWPColumn charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:constrainToAscentAndDescent:isAtEndOfLine:outFragment:leadingEdge:](self, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:constrainToAscentAndDescent:isAtEndOfLine:outFragment:leadingEdge:", a4, a5, a6, a7, a8, 0, a3.x, a3.y, a9);
}

- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 pastCenterGoesToNextChar:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 leadingEdge:(BOOL *)a8
{
  return -[CRLWPColumn charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:constrainToAscentAndDescent:isAtEndOfLine:outFragment:leadingEdge:](self, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:constrainToAscentAndDescent:isAtEndOfLine:outFragment:leadingEdge:", a4, a5, a6, 0, a7, 0, a3.x, a3.y, a8);
}

- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 pastCenterGoesToNextChar:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 outFragment:(const CRLWPLineFragment *)a8 leadingEdge:(BOOL *)a9
{
  return -[CRLWPColumn charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:constrainToAscentAndDescent:isAtEndOfLine:outFragment:leadingEdge:](self, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:constrainToAscentAndDescent:isAtEndOfLine:outFragment:leadingEdge:", a4, a5, a6, 0, a7, a8, a3.x, a3.y, a9);
}

- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 pastCenterGoesToNextChar:(BOOL)a5 allowNotFound:(BOOL)a6 constrainToAscentAndDescent:(BOOL)a7 isAtEndOfLine:(BOOL *)a8 outFragment:(const CRLWPLineFragment *)a9 leadingEdge:(BOOL *)a10
{
  BOOL v12 = a7;
  BOOL v13 = a6;
  BOOL v14 = a5;
  double y = a3.y;
  double x = a3.x;
  BOOL v48 = 1;
  [(CRLWPColumn *)self transformToWP];
  float64x2_t v17 = vaddq_f64(v47, vmlaq_n_f64(vmulq_n_f64(v46, y), v45, x));
  double v44 = 0;
  if (a8) {
    *a8 = 0;
  }
  uint64_t v18 = [(CRLWPColumn *)self charIndexFromWPPoint:v14 pastCenterGoesToNextChar:v13 allowNotFound:v12 constrainToAscentAndDescent:&v44 outFragment:&v48 leadingEdge:*(_OWORD *)&v17];
  if (v44 && v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (*((uint64_t *)v44 + 3) < 0) {
      CGRect v19 = &xmmword_101176F48;
    }
    else {
      CGRect v19 = v44;
    }
    uint64_t v21 = *(void *)v19;
    uint64_t v20 = *((void *)v19 + 1);
    unint64_t v22 = v18;
    if (!v48)
    {
      long long v23 = sub_1001524D8((uint64_t)v44);
      unint64_t v22 = sub_1001CB3C4(v18, v23);
    }
    if (v20 && v22 == v21 + v20)
    {
      unint64_t v24 = [(CRLWPStorage *)self->_storage length];
      if (v22 <= v24)
      {
        uint64_t v30 = v22 - 1;
        uint64_t v31 = [(CRLWPStorage *)self->_storage characterAtIndex:v30];
        int v32 = v31;
        unsigned int v33 = sub_1001CA284(v31);
        if (v32 == 8232) {
          int v34 = 1;
        }
        else {
          int v34 = v33;
        }
        if (v34 != 1 || a4)
        {
          if (a8) {
            *a8 = 1;
          }
        }
        else
        {
          BOOL v48 = 1;
          uint64_t v18 = v30;
        }
      }
      else
      {
        unsigned int v25 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E3780);
        }
        double v26 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67110402;
          unsigned int v50 = v25;
          __int16 v51 = 2082;
          CGFloat v52 = "-[CRLWPColumn charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:constrainToAscent"
                "AndDescent:isAtEndOfLine:outFragment:leadingEdge:]";
          __int16 v53 = 2082;
          double v54 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm";
          __int16 v55 = 1024;
          int v56 = 2801;
          __int16 v57 = 2048;
          unint64_t v58 = v22;
          __int16 v59 = 2048;
          unint64_t v60 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Bad charIndex %lu <= %lu", buf, 0x36u);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E37A0);
        }
        CGFloat v27 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        double v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPColumn charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:constrainToAscentAndDescent:isAtEndOfLine:outFragment:leadingEdge:]");
        CGFloat v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 2801, 0, "Bad charIndex %lu <= %lu", v22, v24);

        uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    if (a9) {
      *a9 = (const CRLWPLineFragment *)v44;
    }
  }
  if (a10)
  {
    *a10 = v48;
    return v18;
  }
  if (!v48 && v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v44)
    {
      uint64_t v35 = sub_100159174(v44, v18);
      char v36 = v44;
      if (!a4)
      {
        uint64_t v37 = (*((unsigned char *)v44 + 25) & 0x10) != 0 ? sub_1001590D0((uint64_t)v44) : sub_10015909C((uint64_t)v44);
        uint64_t v39 = v37;
        char v36 = v44;
        if (v18 == v39 && (v35 != 1) == (*((unsigned char *)v44 + 25) & 0x10) >> 4)
        {
          double v40 = 0;
LABEL_47:

          return v18;
        }
      }
      sub_1001524D8((uint64_t)v36);
      double v38 = (_TtC8Freeform12CRLWPStorage *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v38 = self->_storage;
    }
    double v40 = v38;
    if (v38) {
      uint64_t v18 = sub_1001CB3C4(v18, v38);
    }
    goto LABEL_47;
  }
  return v18;
}

- (unint64_t)charIndexForSelectionFromPoint:(CGPoint)a3 isTail:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  [(CRLWPColumn *)self transformToWP];
  float64x2_t v45 = v52;
  float64x2_t v46 = v53;
  float64x2_t v47 = v51;
  float64x2_t v50 = vaddq_f64(v53, vmlaq_n_f64(vmulq_n_f64(v52, y), v51, x));
  if (v50.f64[1] < CGRectGetMinY(self->_frameBounds))
  {
    unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
    if (!v4)
    {
      unint64_t result = self->_startCharIndex;
      if (result == 0x7FFFFFFFFFFFFFFFLL)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E37C0);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10108D9B0();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E37E0);
        }
        uint64_t v7 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPColumn charIndexForSelectionFromPoint:isTail:]");
        id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:2860 isFatal:0 description:"column has unexpected start"];

        return 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    return result;
  }
  ptr = self->_lineFragmentArray.__ptr_;
  uint64_t v11 = *(uint64_t **)ptr;
  if (*(void *)ptr == *((void *)ptr + 1)) {
    goto LABEL_68;
  }
  unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    uint64_t v13 = *v11;
    CGFloat v14 = *(double *)(*v11 + 40);
    CGFloat v15 = *(double *)(*v11 + 48);
    CGFloat v16 = *(double *)(*v11 + 56);
    CGFloat v17 = *(double *)(*v11 + 64);
    v54.origin.double x = v14;
    v54.origin.double y = v15;
    v54.size.double width = v16;
    v54.size.CGFloat height = v17;
    if (v50.f64[1] < CGRectGetMinY(v54)) {
      goto LABEL_65;
    }
    if (*(unsigned char *)(v13 + 28))
    {
      double v18 = sub_1000653CC(v50.f64[0], v50.f64[1], v14, v15, v16, v17);
      unint64_t v12 = sub_10015A958(v13, -1, 0, v50.f64[0]);
      if (v18 == 0.0) {
        goto LABEL_65;
      }
      if (*(unsigned char *)(v13 + 28))
      {
        v11 += 2;
        if (v11 == *((uint64_t **)self->_lineFragmentArray.__ptr_ + 1)) {
          goto LABEL_65;
        }
        uint64_t v13 = *v11;
        CGFloat v14 = *(double *)(*v11 + 40);
        CGFloat v15 = *(double *)(*v11 + 48);
        CGFloat v16 = *(double *)(*v11 + 56);
        CGFloat v17 = *(double *)(*v11 + 64);
      }
    }
    else
    {
      double v18 = INFINITY;
    }
    uint64_t v19 = 16;
    do
    {
      uint64_t v20 = v19;
      uint64_t v21 = (char *)v11 + v19;
      if (v21 == *((char **)self->_lineFragmentArray.__ptr_ + 1)) {
        break;
      }
      double MinY = CGRectGetMinY(*(CGRect *)(*(void *)v21 + 40));
      v55.origin.double x = v14;
      v55.origin.double y = v15;
      v55.size.double width = v16;
      v55.size.CGFloat height = v17;
      CGFloat v23 = CGRectGetMinY(v55);
      uint64_t v19 = v20 + 16;
    }
    while (MinY == v23);
    v56.origin.double x = v14;
    v56.origin.double y = v15;
    v56.size.double width = v16;
    v56.size.CGFloat height = v17;
    if (v50.f64[1] <= CGRectGetMaxY(v56)) {
      break;
    }
    if (*(uint64_t *)(v13 + 24) < 0) {
      unint64_t v24 = &xmmword_101176F48;
    }
    else {
      unint64_t v24 = (long long *)v13;
    }
    unint64_t v25 = *(void *)v24 + *((void *)v24 + 1);
    if (v12 <= v25) {
      unint64_t v26 = v25;
    }
    else {
      unint64_t v26 = v12;
    }
    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v12 = v25;
    }
    else {
      unint64_t v12 = v26;
    }
    if (v4) {
      unint64_t v12 = [(CRLWPStorage *)self->_storage previousCharacterIndex:v12];
    }
    v11 += 2;
    if (v11 == *((uint64_t **)self->_lineFragmentArray.__ptr_ + 1)) {
      goto LABEL_65;
    }
  }
  if (!v20)
  {
    uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_64;
  }
  uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    uint64_t v13 = *v11;
    if ((*(void *)(*v11 + 24) & 0x40) == 0 && (*(void *)(*v11 + 24) & 0x201) != 1) {
      break;
    }
    int64_t v34 = v27;
LABEL_60:
    v11 += 2;
    uint64_t v27 = v34;
    v20 -= 16;
    if (!v20) {
      goto LABEL_64;
    }
  }
  CGFloat v29 = *(double *)(v13 + 56);
  CGFloat v28 = *(double *)(v13 + 64);
  CGFloat v31 = *(double *)(v13 + 40);
  CGFloat v30 = *(double *)(v13 + 48);
  double v32 = sub_1000653CC(v50.f64[0], v50.f64[1], v31, v30, v29, v28);
  unint64_t v33 = sub_10015A958(v13, !v4, 0, v50.f64[0]);
  int64_t v34 = v33;
  if (v32 != 0.0)
  {
    BOOL v35 = v32 < v18;
    if (v32 >= v18)
    {
      int64_t v36 = v27;
    }
    else
    {
      double v18 = v32;
      int64_t v36 = v33;
    }
    if (!v35 || !v4)
    {
      unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      int64_t v34 = v36;
    }
    else
    {
      CGFloat v38 = v31;
      CGFloat v39 = v30;
      CGFloat v40 = v29;
      CGFloat v41 = v28;
      if (v50.f64[0] <= CGRectGetMaxX(*(CGRect *)&v38))
      {
        if (*(uint64_t *)(v13 + 24) < 0) {
          double v42 = &xmmword_101176F48;
        }
        else {
          double v42 = (long long *)v13;
        }
        int64_t v34 = -[CRLWPStorage previousCharacterIndex:](self->_storage, "previousCharacterIndex:", *(void *)v42, *(_OWORD *)&v45, *(_OWORD *)&v46, *(_OWORD *)&v47);
      }
      unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      double v18 = v32;
    }
    goto LABEL_60;
  }
  unint64_t v12 = v33;
LABEL_64:
  unint64_t result = v12;
  unint64_t v12 = v27;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_65:
    unint64_t result = v12;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v13)
      {
        startCharIndedouble x = *(void *)v13;
        unint64_t characterCount = *(void *)(v13 + 8);
        return characterCount + startCharIndex;
      }
LABEL_68:
      startCharIndedouble x = self->_startCharIndex;
      unint64_t characterCount = self->_characterCount;
      return characterCount + startCharIndex;
    }
  }
  return result;
}

- (unint64_t)charIndexFromWPPoint:(CGPoint)a3 pastCenterGoesToNextChar:(BOOL)a4 allowNotFound:(BOOL)a5 constrainToAscentAndDescent:(BOOL)a6 outFragment:(const CRLWPLineFragment *)a7 leadingEdge:(BOOL *)a8
{
  id v8 = a8;
  BOOL v10 = a4;
  double y = a3.y;
  double x = a3.x;
  if (a6)
  {
    return -[CRLWPColumn p_charIndexWithTextClosestToWPPoint:pastCenterGoesToNextChar:outFragment:leadingEdge:](self, "p_charIndexWithTextClosestToWPPoint:pastCenterGoesToNextChar:outFragment:leadingEdge:", a4, a7, a8);
  }
  else
  {
    BOOL v15 = a5;
    if (a3.y >= CGRectGetMinY(self->_frameBounds))
    {
      ptr = self->_lineFragmentArray.__ptr_;
      uint64_t v19 = *(uint64_t **)ptr;
      if (*(void *)ptr != *((void *)ptr + 1))
      {
        while (1)
        {
          uint64_t v17 = *v19;
          if (![(CRLWPColumn *)self p_pencilAnnotationsShouldSkipLineFragment:*v19])
          {
            CGFloat v20 = *(double *)(v17 + 40);
            CGFloat v21 = *(double *)(v17 + 48);
            CGFloat v22 = *(double *)(v17 + 56);
            CGFloat v23 = *(double *)(v17 + 64);
            v52.origin.double x = v20;
            v52.origin.double y = v21;
            v52.size.double width = v22;
            v52.size.CGFloat height = v23;
            double MinY = CGRectGetMinY(v52);
            double v25 = MinY;
            if (v15 && y < MinY) {
              goto LABEL_23;
            }
            v53.origin.double x = v20;
            v53.origin.double y = v21;
            v53.size.double width = v22;
            v53.size.CGFloat height = v23;
            if (y <= CGRectGetMaxY(v53))
            {
              CGFloat v29 = (uint64_t *)*((void *)self->_lineFragmentArray.__ptr_ + 1);
              float64x2_t v47 = (char *)v8;
              startCharIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
              if (*(unsigned char *)(v17 + 28))
              {
                if (v19 != v29)
                {
                  uint64_t v39 = 0;
                  uint64_t v40 = 0;
                  double v41 = INFINITY;
                  while (1)
                  {
                    uint64_t v30 = v19[v39];
                    CGFloat v42 = *(double *)(v30 + 40);
                    CGFloat v43 = *(double *)(v30 + 48);
                    CGFloat v44 = *(double *)(v30 + 56);
                    CGFloat v45 = *(double *)(v30 + 64);
                    v57.origin.double x = v42;
                    v57.origin.double y = v43;
                    v57.size.double width = v44;
                    v57.size.CGFloat height = v45;
                    if (y <= CGRectGetMinY(v57)) {
                      break;
                    }
                    if (!(v39 * 8))
                    {
                      if ((*(unsigned char *)(*v19 + 25) & 0x10) != 0)
                      {
                        v59.origin.double x = v42;
                        v59.origin.double y = v43;
                        v59.size.double width = v44;
                        v59.size.CGFloat height = v45;
                        if (x > CGRectGetMaxX(v59)) {
                          goto LABEL_67;
                        }
                      }
                      else
                      {
                        v58.origin.double x = v42;
                        v58.origin.double y = v43;
                        v58.size.double width = v44;
                        v58.size.CGFloat height = v45;
                        if (x < CGRectGetMinX(v58)) {
                          goto LABEL_67;
                        }
                      }
                    }
                    v60.origin.double x = v42;
                    v60.origin.double y = v43;
                    v60.size.double width = v44;
                    v60.size.CGFloat height = v45;
                    v51.double x = x;
                    v51.double y = y;
                    if (CGRectContainsPoint(v60, v51))
                    {
                      char v48 = 1;
                      uint64_t v37 = sub_10015AD80((long long *)v30, v10, 1, &v48, 1, x);
                      if (v47) {
                        *float64x2_t v47 = v48;
                      }
                      if (v37 != 0x7FFFFFFFFFFFFFFFLL)
                      {
                        uint64_t v17 = v30;
                        goto LABEL_72;
                      }
                    }
                    if (v39 * 8)
                    {
                      double v46 = sub_1000653CC(x, y, *(CGFloat *)(v30 + 40), *(CGFloat *)(v30 + 48), *(CGFloat *)(v30 + 56), *(CGFloat *)(v30 + 64));
                      if (v46 < v41)
                      {
                        uint64_t v40 = v30;
                        double v41 = v46;
                      }
                    }
                    v39 += 2;
                    uint64_t v30 = v40;
                    if (&v19[v39] == *((uint64_t **)self->_lineFragmentArray.__ptr_ + 1)) {
                      goto LABEL_67;
                    }
                  }
                  if (v39 * 8)
                  {
                    uint64_t v30 = v40;
                    if (!v40) {
                      uint64_t v30 = *v19;
                    }
                  }
LABEL_67:
                  startCharIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
                  id v8 = (BOOL *)v47;
                  if (!v15 && v30)
                  {
                    startCharIndedouble x = sub_10015AD80((long long *)v30, v10, 0, v47, 1, x);
                    uint64_t v17 = v30;
                  }
                }
              }
              else if (v19 != v29)
              {
                uint64_t v30 = 0;
                double v31 = INFINITY;
                while (1)
                {
                  uint64_t v32 = *v19;
                  CGFloat v33 = *(double *)(*v19 + 40);
                  CGFloat v34 = *(double *)(*v19 + 48);
                  CGFloat v35 = *(double *)(*v19 + 56);
                  CGFloat v36 = *(double *)(*v19 + 64);
                  v55.origin.double x = v33;
                  v55.origin.double y = v34;
                  v55.size.double width = v35;
                  v55.size.CGFloat height = v36;
                  v50.double x = x;
                  v50.double y = y;
                  if (CGRectContainsPoint(v55, v50))
                  {
                    uint64_t v37 = sub_10015AD80((long long *)v32, v10, 1, (char *)v8, 1, x);
                    if (v37 != 0x7FFFFFFFFFFFFFFFLL) {
                      break;
                    }
                  }
                  double v38 = sub_1000653CC(x, y, *(CGFloat *)(v32 + 40), *(CGFloat *)(v32 + 48), *(CGFloat *)(v32 + 56), *(CGFloat *)(v32 + 64));
                  if (v38 < v31) {
                    uint64_t v30 = v32;
                  }
                  v56.origin.double x = v33;
                  v56.origin.double y = v34;
                  v56.size.double width = v35;
                  v56.size.CGFloat height = v36;
                  if (y > CGRectGetMinY(v56))
                  {
                    if (v38 < v31) {
                      double v31 = v38;
                    }
                    v19 += 2;
                    if (v19 != *((uint64_t **)self->_lineFragmentArray.__ptr_ + 1)) {
                      continue;
                    }
                  }
                  goto LABEL_67;
                }
                uint64_t v17 = v32;
LABEL_72:
                startCharIndedouble x = v37;
                id v8 = (BOOL *)v47;
              }
              goto LABEL_24;
            }
            if (v19 != *(uint64_t **)self->_lineFragmentArray.__ptr_ && y < v25)
            {
              uint64_t v17 = *(v19 - 2);
              v54.origin.double x = v20;
              v54.origin.double y = v21;
              v54.size.double width = v22;
              v54.size.CGFloat height = v23;
              if (x > CGRectGetMaxX(v54))
              {
                startCharIndedouble x = sub_10015AD80((long long *)v17, v10, v15, (char *)v8, 1, x);
                goto LABEL_24;
              }
            }
          }
          v19 += 2;
          if (v19 == *((uint64_t **)self->_lineFragmentArray.__ptr_ + 1)) {
            goto LABEL_23;
          }
        }
      }
    }
    else if (!v15)
    {
      startCharIndedouble x = self->_startCharIndex;
      if (sub_1000399F8(self->_lineFragmentArray.__ptr_)) {
        uint64_t v17 = sub_100039A08(self->_lineFragmentArray.__ptr_, 0);
      }
      else {
        uint64_t v17 = 0;
      }
      goto LABEL_24;
    }
    uint64_t v17 = 0;
LABEL_23:
    startCharIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
LABEL_24:
    if (a7) {
      *a7 = (const CRLWPLineFragment *)v17;
    }
    if (!v15 && startCharIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      p_startCharIndedouble x = &self->_startCharIndex;
      p_unint64_t characterCount = &self->_characterCount;
      if (v17)
      {
        p_unint64_t characterCount = (unint64_t *)(v17 + 8);
        p_startCharIndedouble x = (unint64_t *)v17;
      }
      startCharIndedouble x = *p_characterCount + *p_startCharIndex;
      if (v8) {
        *id v8 = 1;
      }
    }
    return startCharIndex;
  }
}

- (unint64_t)p_charIndexWithTextClosestToWPPoint:(CGPoint)a3 pastCenterGoesToNextChar:(BOOL)a4 outFragment:(const CRLWPLineFragment *)a5 leadingEdge:(BOOL *)a6
{
  ptr = self->_lineFragmentArray.__ptr_;
  id v8 = *(long long ***)ptr;
  id v9 = (long long **)*((void *)ptr + 1);
  unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (*(long long ***)ptr == v9)
  {
    double v18 = 0;
    if (!a5) {
      return v10;
    }
  }
  else
  {
    BOOL v12 = a4;
    CGFloat y = a3.y;
    double x = a3.x;
    CGFloat v16 = 0;
    double v17 = INFINITY;
    do
    {
      double v18 = *v8;
      if (![(CRLWPColumn *)self p_pencilAnnotationsShouldSkipLineFragment:*v8])
      {
        double v19 = *((double *)v18 + 4);
        CGFloat v20 = *((double *)v18 + 5);
        double v21 = v19 - *((double *)v18 + 15);
        CGFloat v22 = *((double *)v18 + 7);
        double v23 = v19 + *((double *)v18 + 17) - v21;
        v28.origin.double x = v20;
        v28.origin.CGFloat y = v21;
        v28.size.double width = v22;
        v28.size.CGFloat height = v23;
        v27.double x = x;
        v27.CGFloat y = y;
        if (CGRectContainsPoint(v28, v27))
        {
          uint64_t v24 = sub_10015AD80(v18, v12, 1, (char *)a6, 1, x);
          if (v24 != 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v10 = v24;
            if (a5) {
              goto LABEL_15;
            }
            return v10;
          }
        }
        double v25 = sub_1000653CC(x, y, v20, v21, v22, v23);
        if (v25 < v17)
        {
          double v17 = v25;
          CGFloat v16 = v18;
        }
      }
      v8 += 2;
    }
    while (v8 != v9);
    if (v16)
    {
      unint64_t v10 = sub_10015AD80(v16, v12, 0, (char *)a6, 1, x);
      double v18 = v16;
      if (a5) {
        goto LABEL_15;
      }
      return v10;
    }
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a5) {
      return v10;
    }
  }
LABEL_15:
  *a5 = (const CRLWPLineFragment *)v18;
  return v10;
}

- (BOOL)p_pencilAnnotationsShouldSkipLineFragment:(const void *)a3
{
  uint64_t v3 = *((void *)a3 + 3);
  return (v3 & 0x201) == 1 || (v3 & 0x40) != 0;
}

- (void)renderWithRenderer:(id)a3 currentSelection:(id)a4 limitSelection:(id)a5 listRange:(_NSRange)a6 rubyGlyphRange:(_NSRange)a7 isCanvasInteractive:(BOOL)a8 isInDrawingMode:(BOOL)a9 spellChecker:(id)a10 suppressedMisspellingRange:(_NSRange)a11 blackAndWhite:(BOOL)a12 dictationInterpretations:(id)a13 autocorrections:(id)a14 markedRange:(_NSRange)a15 markedText:(id)a16 renderMode:(unint64_t)a17 pageCount:(unint64_t)a18 suppressInvisibles:(BOOL)a19 currentCanvasSelection:(id)a20
{
  NSUInteger length = (char *)a6.length;
  NSUInteger v20 = a6.location;
  id v24 = a3;
  id v99 = a4;
  id obj = a5;
  id v25 = a5;
  id v103 = a10;
  id v96 = a13;
  id v97 = a14;
  id v98 = a16;
  id v94 = a20;
  CGRect v100 = v25;
  CGRect v101 = sub_100457AE4((uint64_t)[v24 context]);
  [v101 beginTextColumn:self limitSelection:v25];
  id v130 = 0;
  id v132 = 0;
  id location = 0;
  v111[0] = 0;
  id v112 = 0;
  v113[0] = 0;
  id v122 = 0;
  id v123 = 0;
  id v125 = 0;
  v126[0] = 0;
  bzero(&location, 0xE8uLL);
  objc_storeStrong(&location, self->_storage);
  objc_storeStrong(v111, self);
  [(CRLWPColumn *)self frameBounds];
  v111[1] = v26;
  v111[2] = v27;
  v111[3] = v28;
  v111[4] = v29;
  v113[1] = self->_scaleTextPercent;
  objc_storeStrong(&v112, a4);
  objc_storeStrong(v113, obj);
  v126[1] = (id)v20;
  v126[2] = length;
  _NSRange v127 = a7;
  char v118 = 0;
  uint64_t v30 = +[CRLColor clearColor];
  CGColorRef v114 = CGColorRetain((CGColorRef)[v30 CGColor]);

  if (v103)
  {
    double v31 = [v103 misspelledRanges];
    id v32 = v122;
    id v122 = v31;

    CGFloat v33 = [v103 ungrammaticRanges];
    id v34 = v123;
    id v123 = v33;
  }
  _NSRange v124 = a11;
  BOOL v115 = a12;
  objc_storeStrong(&v125, a13);
  objc_storeStrong(v126, a14);
  _NSRange v129 = a15;
  objc_storeStrong(&v130, a16);
  unint64_t v128 = a18;
  CGFloat v35 = [(CRLWPStorage *)self->_storage parentInfo];
  if (objc_opt_respondsToSelector())
  {
    CGFloat v36 = [(CRLWPStorage *)self->_storage parentInfo];
    unsigned __int8 v119 = [v36 shouldHideEmptyBullets];
  }
  else
  {
    unsigned __int8 v119 = 0;
  }

  BOOL v116 = a8;
  BOOL v117 = a9;
  char v120 = 0;
  objc_storeStrong(&v132, a20);
  bzero(v106, 0xA0uLL);
  if (!v25 && (a7.location != 0x7FFFFFFFFFFFFFFFLL || a7.length))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3800);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108DA38();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3820);
    }
    uint64_t v37 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    double v38 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPColumn renderWithRenderer:currentSelection:limitSelection:listRange:rubyGlyphRange:isCanvasInteractive:isInDrawingMode:spellChecker:suppressedMisspellingRange:blackAndWhite:dictationInterpretations:autocorrections:markedRange:markedText:renderMode:pageCount:suppressInvisibles:currentCanvasSelection:]");
    uint64_t v39 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPColumn.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v38 file:v39 lineNumber:3510 isFatal:0 description:"ruby glyph range is meaningless without limitSelection"];
  }
  [v24 willRenderFragmentsWithDrawingState:&location];
  [v24 getClipBoundingBox];
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  [(CRLWPColumn *)self erasableBounds:0];
  CGFloat v49 = v48;
  CGFloat v51 = v50;
  CGFloat v53 = v52;
  CGFloat v55 = v54;
  [(CRLWPColumn *)self transformToWP];
  v133.origin.double x = v49;
  v133.origin.double y = v51;
  v133.size.double width = v53;
  v133.size.double height = v55;
  CGRect v137 = CGRectApplyAffineTransform(v133, &v105);
  v134.origin.double x = v41;
  v134.origin.double y = v43;
  v134.size.double width = v45;
  v134.size.double height = v47;
  CGRect v135 = CGRectIntersection(v134, v137);
  double x = v135.origin.x;
  double y = v135.origin.y;
  double width = v135.size.width;
  double height = v135.size.height;
  if (v119 && [v99 isInsertionPoint]) {
    uint64_t v60 = (uint64_t)[v99 start];
  }
  else {
    uint64_t v60 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ((a17 & 2) != 0)
  {
    [v24 drawAdornmentRects:self->_paragraphAdornments forColumn:self foreground:0 drawingState:&location];
    uint64_t v121 = 0;
    ptr = self->_lineFragmentArray.__ptr_;
    CGFloat v62 = *(long long ***)ptr;
    double v63 = (long long **)*((void *)ptr + 1);
    if (*(long long ***)ptr != v63)
    {
      uint64_t v64 = 0;
      do
      {
        uint64_t v65 = *((void *)*v62 + 3);
        if (v65 < 0) {
          CGFloat v66 = &xmmword_101176F48;
        }
        else {
          CGFloat v66 = *v62;
        }
        unint64_t v67 = *(void *)v66;
        if (v20 > v67
          || (v65 < 0 ? (CGFloat v68 = &xmmword_101176F48) : (CGFloat v68 = *v62),
              (unint64_t)&length[v20] < *((void *)v68 + 1) + v67))
        {
          [v24 drawFragment:x, y, width, height];
          uint64_t v64 = v121;
        }
        uint64_t v121 = ++v64;
        v62 += 2;
      }
      while (v62 != v63);
    }
  }
  if (a17)
  {
    id v69 = [v96 rangeCount];
    id v70 = [v97 rangeCount];
    uint64_t v71 = 4098;
    if ((a17 & 4) == 0) {
      uint64_t v71 = 2;
    }
    unint64_t v72 = v71 & 0xFFFFFFFFFFFFDFFFLL | (((a17 >> 3) & 1) << 13);
    uint64_t v73 = v72 | 0x18;
    if (!v103) {
      uint64_t v73 = v72;
    }
    if (v69) {
      v73 |= 0x200uLL;
    }
    if (v70) {
      v73 |= 0x800uLL;
    }
    if (v98) {
      unint64_t v74 = v73 | 0x400;
    }
    else {
      unint64_t v74 = v73;
    }
    char v131 = 0;
    uint64_t v121 = 0;
    uint64_t v75 = self->_lineFragmentArray.__ptr_;
    CGFloat v76 = *(long long ***)v75;
    CGFloat v77 = (long long **)*((void *)v75 + 1);
    if (*(long long ***)v75 != v77)
    {
      do
      {
        if (*((uint64_t *)*v76 + 3) < 0) {
          CGFloat v78 = &xmmword_101176F48;
        }
        else {
          CGFloat v78 = *v76;
        }
        id v80 = v78;
        unint64_t v79 = *(void *)v78;
        id v81 = (char *)(v79 + *((void *)v80 + 1));
        if (v20 > v79 || &length[v20] < v81)
        {
          unint64_t v74 = v74 & 0xFFFFFFFFFFFFFEFFLL | ((unint64_t)(v79 == v60) << 8);
          if (!v113[0] || [v113[0] intersectsRange:v79]) {
            [v24 drawFragment:x, y, width, height];
          }
        }
        ++v121;
        v76 += 2;
      }
      while (v76 != v77);
    }
    v136.origin.double x = x;
    v136.origin.double y = y;
    v136.size.double width = width;
    v136.size.double height = height;
    if (!CGRectIsNull(v136))
    {
      CGSize size = CGRectZero.size;
      v104.origin = CGRectZero.origin;
      v104.CGSize size = size;
      if (v131
        && objc_msgSend(v24, "shouldClipFragment:drawingState:lineDrawFlags:updateRect:outClipRect:", 0, &location, v74, &v104, x, y, width, height))
      {
        CGContextSaveGState((CGContextRef)[v24 context]);
        CGFloat v84 = (CGContext *)[v24 context];
        CGContextClipToRect(v84, v104);
        int v85 = 1;
      }
      else
      {
        int v85 = 0;
      }
      [v24 drawCharacterFillAdornmentRects:self->_paragraphAdornments forColumn:self excludeRange:length drawingState:&location];
      [v24 drawCharacterStrokeAdornmentRects:self->_paragraphAdornments forColumn:self excludingRange:v20 length:length drawingState:&location];
      if (v85) {
        CGContextRestoreGState((CGContextRef)[v24 context]);
      }
    }
    uint64_t v121 = 0;
    double v86 = self->_lineFragmentArray.__ptr_;
    double v87 = *(long long ***)v86;
    CGFloat v88 = (long long **)*((void *)v86 + 1);
    if (*(long long ***)v86 != v88)
    {
      do
      {
        if (*((uint64_t *)*v87 + 3) < 0) {
          double v89 = &xmmword_101176F48;
        }
        else {
          double v89 = *v87;
        }
        CGRect v91 = v89;
        unint64_t v90 = *(void *)v89;
        CGRect v92 = (char *)(v90 + *((void *)v91 + 1));
        if (v20 > v90 || &length[v20] < v92)
        {
          unint64_t v74 = v74 & 0xFFFFFFFFFFFFFEFFLL | ((unint64_t)(v90 == v60) << 8);
          if (!v113[0] || [v113[0] intersectsRange:v90]) {
            [v24 drawAdornmentsForFragment:x, y, width, height];
          }
        }
        ++v121;
        v87 += 2;
      }
      while (v87 != v88);
    }
    [v24 drawAdornmentRects:self->_paragraphAdornments forColumn:self foreground:1 drawingState:&location];
  }
  [v24 didRenderFragments];
  if (cf) {
    CFRelease(cf);
  }
  if (color) {
    CGColorRelease(color);
  }
  if (v109) {
    CGColorRelease(v109);
  }
  if (v114) {
    CGColorRelease(v114);
  }
  [v101 endTextColumn:self];
}

- (id)smartFieldAtCharIndex:(unint64_t)a3 attributeKind:(unint64_t)a4
{
  id v6 = [(CRLWPColumn *)self storage];
  uint64_t v7 = [v6 smartFieldAtCharIndex:a3 attributeKind:a4 effectiveRange:0];

  return v7;
}

- (void)enumerateParagraphAdornmentsUsingBlock:(id)a3
{
  id v4 = a3;
  paragraphAdornments = self->_paragraphAdornments;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10022C048;
  v7[3] = &unk_1014E3848;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)paragraphAdornments enumerateObjectsUsingBlock:v7];
}

- (unint64_t)nextWidowPullsDownFromCharIndex
{
  return self->nextWidowPullsDownFromCharIndex;
}

- (void)setNextWidowPullsDownFromCharIndex:(unint64_t)a3
{
  self->nextWidowPullsDownFromCharIndedouble x = a3;
}

- (void)setFrameBounds:(CGRect)a3
{
  self->_frameBounds = a3;
}

- (_TtC8Freeform12CRLWPStorage)storage
{
  return self->_storage;
}

- (double)contentBlockBottom
{
  return self->_contentBlockBottom;
}

- (void)setContentBlockBottom:(double)a3
{
  self->_contentBlockBottom = a3;
}

- (unint64_t)layoutResultFlags
{
  return self->_layoutResultFlags;
}

- (void)setLayoutResultFlags:(unint64_t)a3
{
  self->_layoutResultFlags = a3;
}

- (unint64_t)scaleTextPercent
{
  return self->_scaleTextPercent;
}

- (void)setScaleTextPercent:(unint64_t)a3
{
  self->_scaleTextPercent = a3;
}

- (unint64_t)storageChangeCount
{
  return self->_storageChangeCount;
}

- (void)setStorageChangeCount:(unint64_t)a3
{
  self->_storageChangeCount = a3;
}

- (void)setTransformFromWP:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transformFromWP.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transformFromWP.tdouble x = v4;
  *(_OWORD *)&self->_transformFromWP.a = v3;
}

- (unint64_t)startCharIndex
{
  return self->_startCharIndex;
}

- (void)setStartCharIndex:(unint64_t)a3
{
  self->_startCharIndedouble x = a3;
}

- (unint64_t)characterCount
{
  return self->_characterCount;
}

- (void)setCharacterCount:(unint64_t)a3
{
  self->_unint64_t characterCount = a3;
}

- (double)nextLinePosition
{
  return self->_nextLinePosition;
}

- (void)setNextLinePosition:(double)a3
{
  self->_nextLinePosition = a3;
}

- (double)erasableContentBottom
{
  return self->_erasableContentBottom;
}

- (void)setErasableContentBottom:(double)a3
{
  self->_erasableContentBottom = a3;
}

- (unint64_t)columnIndex
{
  return self->_columnIndex;
}

- (void)setColumnIndex:(unint64_t)a3
{
  self->_columnIndedouble x = a3;
}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (void)setPageNumber:(unint64_t)a3
{
  self->_pageNumber = a3;
}

- (CRLWPStyleProvider)styleProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_styleProvider);

  return (CRLWPStyleProvider *)WeakRetained;
}

- (void)setStyleProvider:(id)a3
{
}

- (BOOL)textIsVertical
{
  return self->_textIsVertical;
}

- (void)setTextIsVertical:(BOOL)a3
{
  self->_textIsVertical = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_styleProvider);
  objc_storeStrong((id *)&self->_paragraphAdornments, 0);
  cntrl = self->_lineFragmentArray.__cntrl_;
  if (cntrl) {
    sub_100039CE8((std::__shared_weak_count *)cntrl);
  }

  objc_storeStrong((id *)&self->_storage, 0);
}

- (id).cxx_construct
{
  *((void *)self + 24) = 0;
  *((void *)self + 25) = 0;
  return self;
}

@end
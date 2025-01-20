@interface TSWPColumn
+ (CGColor)computeSingleColorWithColumns:(id)a3;
+ (CGRect)boundsRectForSelection:(id)a3 columnArray:(id)a4 includeRuby:(BOOL)a5;
+ (CGRect)caretRectForInsertionPoint:(id)a3 withColumns:(id)a4;
+ (CGRect)rectForSelection:(id)a3 withColumns:(id)a4;
+ (CGRect)rectForSelection:(id)a3 withColumns:(id)a4 useParagraphModeRects:(BOOL)a5;
+ (id)closestColumnInColumnsArray:(id)a3 forPoint:(CGPoint)a4 ignoreEmptyColumns:(BOOL)a5 ignoreDrawableOnlyColumns:(BOOL)a6;
+ (id)columnForCharIndex:(unint64_t)a3 eol:(BOOL)a4 withColumns:(id)a5;
+ (id)footnoteMarkAttachmentInColumnArray:(id)a3 atPoint:(CGPoint)a4;
+ (id)footnoteReferenceAttachmentInColumnArray:(id)a3 atPoint:(CGPoint)a4;
+ (id)pathForHighlightWithRange:(_NSRange)a3 columnArray:(id)a4 pathStyle:(int)a5;
+ (id)smartFieldWithAttributeKind:(unsigned int)a3 inColumnArray:(id)a4 atPoint:(CGPoint)a5;
+ (unint64_t)charIndexForPoint:(CGPoint)a3 inColumnsArray:(id)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 leadingEdge:(BOOL *)a8;
+ (unint64_t)charIndexForPoint:(CGPoint)a3 inColumnsArray:(id)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 pastCenterGoesToNextChar:(BOOL)a7 isAtEndOfLine:(BOOL *)a8 leadingEdge:(BOOL *)a9;
+ (unint64_t)charIndexForTopicDragAtPoint:(CGPoint)a3 inColumnsArray:(id)a4;
- ($67DC2B40F188BF54E27CB16063B1C8C0)lineMetricsAtCharIndex:(SEL)a3 allowEndOfLine:(unint64_t)a4;
- ($8502DCEA08BBBE1AB2005217B3838BBD)heightInfoOfLineFragmentAtIndex:(SEL)a3;
- (BOOL)isDropCapFragmentAtIndex:(unint64_t)a3;
- (BOOL)isEmptyLineFragmentAtIndex:(unint64_t)a3;
- (BOOL)isTruncatedLineFragmentAtIndex:(unint64_t)a3;
- (BOOL)onlyHasAnchoredDrawable;
- (BOOL)requiresGlyphVectorsForHeightMeasurement;
- (BOOL)textIsVertical;
- (CGAffineTransform)transformFromWP;
- (CGAffineTransform)transformToWP;
- (CGRect)boundsOfLineFragmentAtIndex:(unint64_t)a3;
- (CGRect)caretRectForSelection:(id)a3;
- (CGRect)columnRectForRange:(_NSRange)a3;
- (CGRect)erasableBounds:(unsigned int)a3;
- (CGRect)erasableRectForSelectionRange:(_NSRange)a3;
- (CGRect)firstRectForSelection:(id)a3 includeSpaceAfter:(BOOL)a4 includeSpaceBefore:(BOOL)a5 includeLeading:(BOOL)a6;
- (CGRect)frameBounds;
- (CGRect)glyphRectForRange:(_NSRange)a3 includingLabel:(BOOL)a4;
- (CGRect)glyphRectForRubyFieldAtCharIndex:(unint64_t)a3 glyphRange:(_NSRange)a4;
- (CGRect)labelBoundsOfLineFragmentAtIndex:(unint64_t)a3;
- (CGRect)typographicBounds;
- (CGRect)typographicBoundsForCell;
- (CGRect)typographicBoundsOfLineFragmentAtIndex:(unint64_t)a3;
- (CGRect)wpBounds;
- (CGSize)maxSize;
- (TSWPColumn)initWithStorage:(id)a3 frameBounds:(CGRect)a4;
- (TSWPStorage)storage;
- (TSWPStyleProvider)styleProvider;
- (_NSRange)anchoredRange;
- (_NSRange)lineFragmentRangeForLogicalLineIndex:(unint64_t)a3;
- (_NSRange)range;
- (_NSRange)rangeOfLineFragmentAtIndex:(unint64_t)a3;
- (_TSWPCharIndexAndPosition)calcAttachmentPositionForDrawable:(SEL)a3 atPoint:(id)a4 inTextLayoutTarget:(CGPoint)a5 tlBoundsInfluencingWrap:(id)a6 wrapOutset:(CGPoint)a7 wrapMargin:(CGSize)a8 makeInline:(double)a9;
- (const)lineFragmentArray;
- (const)lineFragmentAtIndex:(unint64_t)a3;
- (const)lineFragmentClosestToPoint:(CGPoint)a3 knobTag:(unint64_t)a4;
- (const)lineFragmentForCharIndex:(unint64_t)a3 knobTag:(unint64_t)a4 selectionType:(int)a5;
- (const)pColumnEndingPartitionedLineFragmentInSelectionRange:(_NSRange)a3;
- (double)baselineOfLineFragmentAtCharIndex:(unint64_t)a3;
- (double)baselineOfLineFragmentAtIndex:(unint64_t)a3;
- (double)contentBottom;
- (double)erasableContentBottom;
- (double)horizontalOffsetForCharIndex:(unint64_t)a3 lineFragmentIndex:(unint64_t)a4 bumpPastHyphen:(BOOL)a5 allowPastLineBounds:(BOOL)a6;
- (double)logicalBoundsBottom;
- (double)logicalBoundsTop;
- (double)minimumHeightForLayoutOnPage;
- (double)textBottom;
- (double)textHeight;
- (double)topOfCapForLogicalLineIndex:(unint64_t)a3;
- (double)topOfLineAtCharIndex:(unint64_t)a3;
- (double)trimToCharIndex:(unint64_t)a3 inTarget:(id)a4;
- (double)typographicGlyphExtentOfLineFragmentAtIndex:(unint64_t)a3;
- (id).cxx_construct;
- (id)drawableIntersectionRectsForSelection:(id)a3 inTarget:(id)a4;
- (id)lineSelectionsForSelection:(id)a3;
- (id)pMutableRectsForSelectionRange:(_NSRange)a3 selectionType:(int)a4 includeSpaceAfter:(BOOL)a5 includeSpaceBefore:(BOOL)a6 includeLeading:(BOOL)a7 forParagraphMode:(BOOL)a8 includeRuby:(BOOL)a9 inranges:(id)a10 outranges:(id *)a11;
- (id)partitionedLayoutForInfo:(id)a3;
- (id)rectsForSelection:(id)a3;
- (id)rectsForSelection:(id)a3 ranges:(id *)a4;
- (id)rectsForSelectionRange:(_NSRange)a3;
- (id)rectsForSelectionRange:(_NSRange)a3 selectionType:(int)a4;
- (id)rectsForSelectionRange:(_NSRange)a3 selectionType:(int)a4 forParagraphMode:(BOOL)a5;
- (id)rectsForSelectionRange:(_NSRange)a3 selectionType:(int)a4 forParagraphMode:(BOOL)a5 includeRuby:(BOOL)a6;
- (id)rectsForSelectionRange:(_NSRange)a3 selectionType:(int)a4 includeSpaceAfter:(BOOL)a5 includeSpaceBefore:(BOOL)a6 includeLeading:(BOOL)a7 forParagraphMode:(BOOL)a8 includeRuby:(BOOL)a9;
- (id)rectsForSelectionRanges:(id)a3 selectionType:(int)a4;
- (id)singleLinePartitionedInfoAtStart:(BOOL)a3;
- (id)smartFieldAtCharIndex:(unint64_t)a3 attributeKind:(unsigned int)a4;
- (int)layoutResultFlags;
- (unint64_t)anchoredCharCount;
- (unint64_t)charIndexForSelectionFromPoint:(CGPoint)a3 isTail:(BOOL)a4;
- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 pastCenterGoesToNextChar:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 leadingEdge:(BOOL *)a8;
- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 pastCenterGoesToNextChar:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 outFragment:(const TSWPLineFragment *)a8 leadingEdge:(BOOL *)a9;
- (unint64_t)charIndexFromWPPoint:(CGPoint)a3 pastCenterGoesToNextChar:(BOOL)a4 allowNotFound:(BOOL)a5 outFragment:(const TSWPLineFragment *)a6 leadingEdge:(BOOL *)a7;
- (unint64_t)characterCount;
- (unint64_t)columnIndex;
- (unint64_t)countLines;
- (unint64_t)glyphCountForRubyFieldAtCharIndex:(unint64_t)a3;
- (unint64_t)lineFragmentCountForBaseline:(double)a3;
- (unint64_t)lineIndexForCharIndex:(unint64_t)a3 eol:(BOOL)a4;
- (unint64_t)logicalLineCount;
- (unint64_t)nextWidowPullsDownFromCharIndex;
- (unint64_t)pageNumber;
- (unint64_t)scaleTextPercent;
- (unint64_t)startAnchoredCharIndex;
- (unint64_t)startCharIndex;
- (unint64_t)truncatedCharIndexForLineFragmentAtIndex:(unint64_t)a3;
- (void)addAdornmentRect:(const TSWPAdornmentRect *)a3;
- (void)clearAdornments;
- (void)dealloc;
- (void)incrementRanges:(int64_t)a3;
- (void)makeEmpty:(unint64_t)a3 layoutResultFlags:(int)a4;
- (void)normalizeLineFragmentOrigins:(CGPoint)a3;
- (void)offsetLineFragmentsByPoint:(CGPoint)a3;
- (void)renderWithRenderer:(id)a3 currentSelection:(id)a4 limitSelection:(id)a5 listRange:(_NSRange)a6 rubyGlyphRange:(_NSRange)a7 isCanvasInteractive:(BOOL)a8 spellChecker:(id)a9 suppressedMisspellingRange:(_NSRange)a10 blackAndWhite:(BOOL)a11 dictationInterpretations:(const void *)a12 autocorrections:(const void *)a13 markedRange:(_NSRange)a14 markedText:(id)a15 renderMode:(int)a16 pageCount:(unint64_t)a17 suppressInvisibles:(BOOL)a18 currentCanvasSelection:(id)a19;
- (void)renderWithRenderer:(id)a3 pageCount:(unint64_t)a4;
- (void)setAnchoredCharCount:(unint64_t)a3;
- (void)setAnchoredRange:(_NSRange)a3;
- (void)setCharacterCount:(unint64_t)a3;
- (void)setColumnIndex:(unint64_t)a3;
- (void)setContentBottom:(double)a3;
- (void)setErasableContentBottom:(double)a3;
- (void)setLayoutResultFlags:(int)a3;
- (void)setLineFragmentArray:(const void *)a3;
- (void)setNextWidowPullsDownFromCharIndex:(unint64_t)a3;
- (void)setPageNumber:(unint64_t)a3;
- (void)setRange:(_NSRange)a3;
- (void)setScaleTextPercent:(unint64_t)a3;
- (void)setStartAnchoredCharIndex:(unint64_t)a3;
- (void)setStartCharIndex:(unint64_t)a3;
- (void)setStorage:(id)a3 range:(_NSRange)a4;
- (void)setStyleProvider:(id)a3;
- (void)setTextIsVertical:(BOOL)a3;
- (void)setTransformFromWP:(CGAffineTransform *)a3;
- (void)setWpBounds:(CGRect)a3;
- (void)trimFromCharIndex:(unint64_t)a3 inTarget:(id)a4 layoutChore:(void *)a5;
@end

@implementation TSWPColumn

- (unint64_t)logicalLineCount
{
  return TSWPLineFragmentArray::logicalLineCount(self->_lineFragmentArray.__ptr_);
}

- (_NSRange)lineFragmentRangeForLogicalLineIndex:(unint64_t)a3
{
  NSUInteger v3 = TSWPLineFragmentArray::lineFragmentRangeForLogicalLineIndex(self->_lineFragmentArray.__ptr_, a3);
  result.length = v4;
  result.location = v3;
  return result;
}

- (double)topOfCapForLogicalLineIndex:(unint64_t)a3
{
  return TSWPLineFragmentArray::topOfCapForLogicalLineIndex(self->_lineFragmentArray.__ptr_, a3);
}

- (id).cxx_construct
{
  *((void *)self + 24) = 0;
  *((void *)self + 25) = 0;
  return self;
}

- (unint64_t)scaleTextPercent
{
  return self->_scaleTextPercent;
}

- (void)setTextIsVertical:(BOOL)a3
{
  self->_textIsVertical = a3;
}

- (void)setPageNumber:(unint64_t)a3
{
  self->_pageNumber = a3;
}

- (void)setWpBounds:(CGRect)a3
{
  self->_frameBounds = a3;
}

- (void)setColumnIndex:(unint64_t)a3
{
  self->_columnIndex = a3;
}

- (void)setStyleProvider:(id)a3
{
}

- (unint64_t)columnIndex
{
  return self->_columnIndex;
}

- (void).cxx_destruct
{
  cntrl = self->_lineFragmentArray.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (TSWPStyleProvider)styleProvider
{
  if (self->_styleProvider) {
    return self->_styleProvider;
  }
  else {
    return (TSWPStyleProvider *)+[TSWPStorageStyleProvider styleProviderForStorage:self->_storage];
  }
}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (double)baselineOfLineFragmentAtIndex:(unint64_t)a3
{
  uint64_t v3 = TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3);
  return *(double *)(v3 + 32) + *(double *)(v3 + 40);
}

- (_NSRange)anchoredRange
{
  NSUInteger anchoredCharCount = self->_anchoredCharCount;
  NSUInteger startAnchoredCharIndex = self->_startAnchoredCharIndex;
  result.length = anchoredCharCount;
  result.location = startAnchoredCharIndex;
  return result;
}

- (CGRect)wpBounds
{
  double x = self->_frameBounds.origin.x;
  double y = self->_frameBounds.origin.y;
  double width = self->_frameBounds.size.width;
  double height = self->_frameBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)erasableBounds:(unsigned int)a3
{
  CGFloat x = self->_frameBounds.origin.x;
  CGFloat y = self->_frameBounds.origin.y;
  CGFloat width = self->_frameBounds.size.width;
  CGFloat height = self->_frameBounds.size.height;
  v16.origin.CGFloat x = TSWPLineFragmentArray::erasableBounds(self->_lineFragmentArray.__ptr_, a3, (TSWPStorage *)self);
  v16.origin.CGFloat y = v8;
  v16.size.CGFloat width = v9;
  v16.size.CGFloat height = v10;
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGRect v14 = CGRectUnion(v13, v16);
  long long v11 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v12.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v12.c = v11;
  *(_OWORD *)&v12.tCGFloat x = *(_OWORD *)&self->_transform.tx;
  return CGRectApplyAffineTransform(v14, &v12);
}

+ (CGColor)computeSingleColorWithColumns:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = 0;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    LOBYTE(v6) = 1;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(a3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v17 + 1) + 8 * i) lineFragmentArray];
        CGFloat v10 = *(TSWPLineFragmentArray **)v8;
        CGFloat v9 = *(std::__shared_weak_count **)(v8 + 8);
        if (v9) {
          atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (v10)
        {
          uint64_t v11 = TSWPLineFragmentArray::count(v10);
          if (v11)
          {
            unint64_t v12 = 0;
            CGRect v13 = v3;
            while (1)
            {
              uint64_t v14 = TSWPLineFragmentArray::objectAtIndex(v10, v12);
              if ((*(unsigned char *)(v14 + 27) & 8) == 0) {
                break;
              }
              uint64_t v3 = (CGColor *)TSWPLineFragment::singleColor((TSWPLineFragment *)v14);
              if (!v6 || v3 == 0) {
                break;
              }
              if (v13)
              {
                BOOL v6 = CGColorEqualToColor(v13, v3);
                if (!v6) {
                  uint64_t v3 = v13;
                }
              }
              else
              {
                LOBYTE(v6) = 1;
              }
              ++v12;
              CGRect v13 = v3;
              if (v11 == v12) {
                goto LABEL_21;
              }
            }
            uint64_t v3 = 0;
            LOBYTE(v6) = 0;
          }
        }
LABEL_21:
        if (v9) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v9);
        }
      }
      uint64_t v4 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
  return v3;
}

- (void)setLineFragmentArray:(const void *)a3
{
  uint64_t v4 = *(TSWPLineFragmentArray **)a3;
  uint64_t v3 = *((void *)a3 + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_lineFragmentArray.__cntrl_;
  self->_lineFragmentArray.__ptr_ = v4;
  self->_lineFragmentArray.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (const)lineFragmentArray
{
  return &self->_lineFragmentArray;
}

- (_NSRange)range
{
  NSUInteger characterCount = self->_characterCount;
  startCharIndeCGFloat x = self->_startCharIndex;
  result.length = characterCount;
  result.location = startCharIndex;
  return result;
}

- (TSWPStorage)storage
{
  return self->_storage;
}

- (void)setTransformFromWP:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tCGFloat x = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (TSWPColumn)initWithStorage:(id)a3 frameBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)TSWPColumn;
  CGFloat v9 = [(TSWPColumn *)&v13 init];
  if (v9)
  {
    v9->_storage = (TSWPStorage *)a3;
    v9->_frameBounds.origin.CGFloat x = x;
    v9->_frameBounds.origin.CGFloat y = y;
    CGFloat v10 = (_OWORD *)MEMORY[0x263F000D0];
    v9->_frameBounds.size.CGFloat width = width;
    v9->_frameBounds.size.CGFloat height = height;
    long long v11 = v10[1];
    *(_OWORD *)&v9->_transform.a = *v10;
    *(_OWORD *)&v9->_transform.c = v11;
    *(_OWORD *)&v9->_transform.tCGFloat x = v10[2];
    v9->_NSUInteger startAnchoredCharIndex = 0x7FFFFFFFFFFFFFFFLL;
    v9->_scaleTextPercent = 100;
    operator new();
  }
  return 0;
}

- (double)contentBottom
{
  return self->_contentBottom;
}

- (int)layoutResultFlags
{
  return self->_layoutResultFlags;
}

- (void)clearAdornments
{
  paragraphAdornments = (uint64_t *)self->_paragraphAdornments;
  uint64_t v4 = *paragraphAdornments;
  uint64_t v3 = paragraphAdornments[1];
  if (v3 != *paragraphAdornments)
  {
    do
    {
      v3 -= 56;
      std::allocator<TSWPAdornmentRect>::destroy[abi:ne180100]((uint64_t)(paragraphAdornments + 2), v3);
    }
    while (v3 != v4);
  }
  paragraphAdornments[1] = v4;
}

- (_NSRange)rangeOfLineFragmentAtIndex:(unint64_t)a3
{
  uint64_t v3 = (NSUInteger *)TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3);
  NSUInteger v4 = v3[1];
  NSUInteger v5 = *v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (unint64_t)truncatedCharIndexForLineFragmentAtIndex:(unint64_t)a3
{
  uint64_t v3 = (TSWPLineFragment *)TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3);

  return TSWPLineFragment::truncatedCharIndex(v3);
}

- (BOOL)isTruncatedLineFragmentAtIndex:(unint64_t)a3
{
  return *(unsigned __int8 *)(TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3) + 26) >> 7;
}

- (CGRect)frameBounds
{
  CGRect frameBounds = self->_frameBounds;
  long long v2 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v3.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v3.c = v2;
  *(_OWORD *)&v3.tCGFloat x = *(_OWORD *)&self->_transform.tx;
  return CGRectApplyAffineTransform(frameBounds, &v3);
}

- (void)setLayoutResultFlags:(int)a3
{
  self->_layoutResultFlags = a3;
}

- (unint64_t)startCharIndex
{
  return self->_startCharIndex;
}

- (void)setNextWidowPullsDownFromCharIndex:(unint64_t)a3
{
  self->_nextWidowPullsDownFromCharIndeCGFloat x = a3;
}

- (void)setContentBottom:(double)a3
{
  self->_contentBottom = a3;
}

- (void)setCharacterCount:(unint64_t)a3
{
  self->_NSUInteger characterCount = a3;
}

- (void)setAnchoredCharCount:(unint64_t)a3
{
  self->_NSUInteger anchoredCharCount = a3;
}

- (void)setStartAnchoredCharIndex:(unint64_t)a3
{
  self->_NSUInteger startAnchoredCharIndex = a3;
}

- (void)dealloc
{
  self->_styleProvider = 0;
  cntrl = self->_lineFragmentArray.__cntrl_;
  self->_lineFragmentArray.__ptr_ = 0;
  self->_lineFragmentArray.__cntrl_ = 0;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
  paragraphAdornments = self->_paragraphAdornments;
  if (paragraphAdornments)
  {
    BOOL v6 = (void **)self->_paragraphAdornments;
    std::vector<TSWPAdornmentRect>::__destroy_vector::operator()[abi:ne180100](&v6);
    MEMORY[0x223CB8F20](paragraphAdornments, 0x20C40960023A9);
  }
  v5.receiver = self;
  v5.super_class = (Class)TSWPColumn;
  [(TSWPColumn *)&v5 dealloc];
}

- (void)setStartCharIndex:(unint64_t)a3
{
  self->_startCharIndeCGFloat x = a3;
}

- (unint64_t)countLines
{
  return TSWPLineFragmentArray::count(self->_lineFragmentArray.__ptr_);
}

- (void)setScaleTextPercent:(unint64_t)a3
{
  self->_scaleTextPercent = a3;
}

- (CGSize)maxSize
{
  double width = self->_frameBounds.size.width;
  double height = self->_frameBounds.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)renderWithRenderer:(id)a3 currentSelection:(id)a4 limitSelection:(id)a5 listRange:(_NSRange)a6 rubyGlyphRange:(_NSRange)a7 isCanvasInteractive:(BOOL)a8 spellChecker:(id)a9 suppressedMisspellingRange:(_NSRange)a10 blackAndWhite:(BOOL)a11 dictationInterpretations:(const void *)a12 autocorrections:(const void *)a13 markedRange:(_NSRange)a14 markedText:(id)a15 renderMode:(int)a16 pageCount:(unint64_t)a17 suppressInvisibles:(BOOL)a18 currentCanvasSelection:(id)a19
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v85 = 0u;
  bzero(v76, 0xF8uLL);
  v76[0] = self->_storage;
  v76[1] = self;
  [(TSWPColumn *)self wpBounds];
  char v25 = 0;
  v76[2] = v26;
  v76[3] = v27;
  v76[4] = v28;
  v76[5] = v29;
  unint64_t scaleTextPercent = self->_scaleTextPercent;
  v76[6] = a4;
  id v77 = a5;
  unint64_t v78 = scaleTextPercent;
  NSUInteger v91 = location;
  NSUInteger v92 = length;
  _NSRange v93 = a7;
  if (a8 && !a18) {
    char v25 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"ShowInvisibles");
  }
  char v82 = v25;
  CGColorRef v79 = CGColorRetain((CGColorRef)objc_msgSend(+[TSWPUserDefaults invisiblesColor](TSWPUserDefaults, "invisiblesColor"), "CGColor"));
  _NSRange v88 = a10;
  BOOL v80 = a11;
  v89 = a12;
  v90 = a13;
  _NSRange v95 = a14;
  id v96 = a15;
  unint64_t v94 = a17;
  [(TSWPStorage *)self->_storage parentInfo];
  if (objc_opt_respondsToSelector()) {
    char v31 = [(TSDContainerInfo *)[(TSWPStorage *)self->_storage parentInfo] shouldHideEmptyBullets];
  }
  else {
    char v31 = 0;
  }
  char v83 = v31;
  BOOL v81 = a8;
  BOOL v32 = ([a3 preventClipToColumn] & 1) != 0 || -[TSWPStorage wpKind](self->_storage, "wpKind") == 5;
  BOOL v84 = v32;
  id v97 = a19;
  bzero(v72, 0x98uLL);
  if (!a5 && (a7.location != *MEMORY[0x263F7C7C8] || a7.length != *(void *)(MEMORY[0x263F7C7C8] + 8)))
  {
    v33 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v34 = [NSString stringWithUTF8String:"-[TSWPColumn renderWithRenderer:currentSelection:limitSelection:listRange:rubyGlyphRange:isCanvasInteractive:spellChecker:suppressedMisspellingRange:blackAndWhite:dictationInterpretations:autocorrections:markedRange:markedText:renderMode:pageCount:suppressInvisibles:currentCanvasSelection:]"];
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 2549, @"ruby glyph range is meaningless without limitSelection");
  }
  [a3 willRenderFragmentsWithDrawingState:v76];
  [a3 getClipBoundingBox];
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  [(TSWPColumn *)self erasableBounds:0];
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  CGFloat v50 = v49;
  [(TSWPColumn *)self transformToWP];
  v98.origin.double x = v44;
  v98.origin.double y = v46;
  v98.size.double width = v48;
  v98.size.double height = v50;
  CGRect v101 = CGRectApplyAffineTransform(v98, &v71);
  v99.origin.double x = v36;
  v99.origin.double y = v38;
  v99.size.double width = v40;
  v99.size.double height = v42;
  CGRect v100 = CGRectIntersection(v99, v101);
  double x = v100.origin.x;
  double y = v100.origin.y;
  double width = v100.size.width;
  double height = v100.size.height;
  id v70 = a15;
  if (v83 && [a4 isInsertionPoint])
  {
    uint64_t v55 = [a4 start];
    NSUInteger v56 = length;
  }
  else
  {
    NSUInteger v56 = length;
    uint64_t v55 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ((a16 & 2) != 0)
  {
    [a3 drawAdornmentRects:self->_paragraphAdornments forColumn:self foreground:0];
    ptr = self->_lineFragmentArray.__ptr_;
    v58 = *(NSUInteger ***)ptr;
    v59 = (NSUInteger **)*((void *)ptr + 1);
    if (*(NSUInteger ***)ptr != v59)
    {
      do
      {
        NSUInteger v60 = **v58;
        if (location > v60 || location + v56 < (*v58)[1] + v60) {
          [a3 drawFragment:x updateRect:y drawingState:width runState:height lineDrawFlags:v70];
        }
        v58 += 2;
      }
      while (v58 != v59);
    }
  }
  if (a16)
  {
    v61 = self->_lineFragmentArray.__ptr_;
    v62 = *(NSUInteger ***)v61;
    v63 = (NSUInteger **)*((void *)v61 + 1);
    if (*(NSUInteger ***)v61 != v63)
    {
      if ((a16 & 4) != 0) {
        int v64 = 65538;
      }
      else {
        int v64 = 2;
      }
      if (a9) {
        int v65 = v64 | 0x18;
      }
      else {
        int v65 = v64;
      }
      if (*((void *)a12 + 1) != *(void *)a12) {
        v65 |= 0x200u;
      }
      if (*((void *)a13 + 1) != *(void *)a13) {
        v65 |= 0x800u;
      }
      if (v70) {
        LODWORD(v66) = v65 | 0x400;
      }
      else {
        LODWORD(v66) = v65;
      }
      do
      {
        v67 = *v62;
        NSUInteger v68 = **v62;
        if (location > v68 || location + v56 < (*v62)[1] + v68)
        {
          uint64_t v66 = v66 & 0xFFFFFEFF | ((v68 == v55) << 8);
          if (!v77 || objc_msgSend(v77, "intersectsRange:")) {
            objc_msgSend(a3, "drawFragment:updateRect:drawingState:runState:lineDrawFlags:", v67, v76, v72, v66, x, y, width, height, v70);
          }
        }
        v62 += 2;
      }
      while (v62 != v63);
    }
    objc_msgSend(a3, "drawAdornmentRects:forColumn:foreground:", self->_paragraphAdornments, self, 1, v70);
  }
  objc_msgSend(a3, "didRenderFragments", v70);
  if (cf) {
    CFRelease(cf);
  }
  if (color) {
    CGColorRelease(color);
  }
  if (v75) {
    CGColorRelease(v75);
  }
  if (v79) {
    CGColorRelease(v79);
  }
  if (*((void *)&v86 + 1))
  {
    *(void *)&long long v87 = *((void *)&v86 + 1);
    operator delete(*((void **)&v86 + 1));
  }
  if ((void)v85)
  {
    *((void *)&v85 + 1) = v85;
    operator delete((void *)v85);
  }
}

- (CGRect)typographicBoundsOfLineFragmentAtIndex:(unint64_t)a3
{
  uint64_t v4 = TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3);
  double x = TSWPLineFragment::textRect((TSWPLineFragment *)v4, 0);
  CGFloat y = v6;
  CGFloat width = v8;
  CGFloat height = v10;
  if (*(void *)(v4 + 176))
  {
    TSWPLineFragment::labelRect((TSWPLineFragment *)v4);
    v21.origin.double x = v12;
    v21.origin.CGFloat y = v13;
    v21.size.CGFloat width = v14;
    v21.size.CGFloat height = v15;
    v17.origin.double x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    CGRect v18 = CGRectUnion(v17, v21);
    double x = v18.origin.x;
    CGFloat y = v18.origin.y;
    CGFloat width = v18.size.width;
    CGFloat height = v18.size.height;
  }
  [(TSWPColumn *)self transformFromWP];
  v19.origin.double x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v19, &v16);
}

- (CGAffineTransform)transformFromWP
{
  long long v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[1].tx;
  return self;
}

- (CGAffineTransform)transformToWP
{
  long long v3 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v5.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v5.c = v3;
  *(_OWORD *)&v5.tdouble x = *(_OWORD *)&self->_transform.tx;
  return CGAffineTransformInvert(retstr, &v5);
}

+ (CGRect)caretRectForInsertionPoint:(id)a3 withColumns:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  double v6 = (CGRect *)MEMORY[0x263F001A0];
  CGFloat v7 = *MEMORY[0x263F001A0];
  CGFloat v8 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v9 = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat v10 = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = [a4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(a4);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * i) caretRectForSelection:a3];
        CGFloat v7 = v16;
        CGFloat v8 = v17;
        double v9 = v15;
        CGFloat v10 = v18;
        if (v18 > 0.0)
        {
          double v9 = fmax(v15, 1.0);
          goto LABEL_11;
        }
      }
      uint64_t v12 = [a4 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:
  v30.origin.double x = v7;
  v30.origin.CGFloat y = v8;
  v30.size.CGFloat width = v9;
  v30.size.CGFloat height = v10;
  if (!CGRectEqualToRect(v30, *v6))
  {
    id v19 = +[TSWPColumn columnForCharIndex:eol:withColumns:](TSWPColumn, "columnForCharIndex:eol:withColumns:", [a3 start], 1, a4);
    if (v19)
    {
      objc_msgSend(v19, "lineMetricsAtCharIndex:allowEndOfLine:", objc_msgSend(a3, "start", 0), 1);
      CGFloat v8 = 0.0;
    }
  }
  double v20 = v7;
  double v21 = v8;
  double v22 = v9;
  double v23 = v10;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.double x = v20;
  return result;
}

+ (CGRect)rectForSelection:(id)a3 withColumns:(id)a4
{
  [a1 rectForSelection:a3 withColumns:a4 useParagraphModeRects:1];
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.double x = v4;
  return result;
}

+ (CGRect)rectForSelection:(id)a3 withColumns:(id)a4 useParagraphModeRects:(BOOL)a5
{
  BOOL v64 = a5;
  id v6 = a3;
  uint64_t v75 = *MEMORY[0x263EF8340];
  CGFloat x = *MEMORY[0x263F001A0];
  CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
  double width = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
  if ([a3 isValid])
  {
    v63 = objc_msgSend((id)objc_msgSend(a4, "firstObject"), "storage");
    if (v63)
    {
      if ([v6 isInsertionPoint])
      {
        int v61 = 1;
        uint64_t v11 = objc_msgSend(v63, "wordAtCharIndex:includePreviousWord:", objc_msgSend(v6, "range"), 1);
        if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_10:
          long long v71 = 0u;
          long long v72 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          uint64_t v18 = [a4 countByEnumeratingWithState:&v69 objects:v74 count:16];
          if (!v18) {
            goto LABEL_49;
          }
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v70;
          while (1)
          {
            uint64_t v21 = 0;
            uint64_t v62 = v19;
            do
            {
              if (*(void *)v70 != v20) {
                objc_enumerationMutation(a4);
              }
              double v22 = *(void **)(*((void *)&v69 + 1) + 8 * v21);
              NSUInteger v23 = [v22 range];
              NSUInteger v25 = v24;
              [v22 frameBounds];
              uint64_t v27 = v26;
              uint64_t v29 = v28;
              if (![v6 isInsertionPoint])
              {
                v76.NSUInteger location = [v6 range];
                v77.NSUInteger location = v23;
                v77.NSUInteger length = v25;
                NSRange v34 = NSIntersectionRange(v76, v77);
                if (!v34.length) {
                  goto LABEL_40;
                }
                uint64_t v35 = v20;
                id v36 = a4;
                double v37 = (void *)[v22 rectsForSelection:v6];
                uint64_t v38 = objc_msgSend(v63, "selectedParagraphBreakCount:", v34.location, v34.length);
                if (objc_msgSend(v63, "emptyParagraphCount:", v34.location, v34.length)) {
                  uint64_t v39 = -1;
                }
                else {
                  uint64_t v39 = 0;
                }
                objc_msgSend(v63, "paragraphIndexRangeForCharRange:", v34.location, v34.length);
                if (v64 && (unint64_t v41 = v40, [v6 type] != 3))
                {
                  BOOL v42 = 0;
                  if ([v6 type] != 5 && v41 >= 2)
                  {
                    if (!(v38 + v39)) {
                      goto LABEL_24;
                    }
                    BOOL v42 = v38 + v39 != 1 || (unint64_t)[v37 count] > 2;
                  }
                }
                else
                {
LABEL_24:
                  BOOL v42 = 0;
                }
                long long v67 = 0u;
                long long v68 = 0u;
                long long v65 = 0u;
                long long v66 = 0u;
                uint64_t v43 = [v37 countByEnumeratingWithState:&v65 objects:v73 count:16];
                if (v43)
                {
                  uint64_t v44 = v43;
                  uint64_t v45 = *(void *)v66;
                  int v46 = v61 & v42;
                  a4 = v36;
                  uint64_t v20 = v35;
                  uint64_t v19 = v62;
                  do
                  {
                    for (uint64_t i = 0; i != v44; ++i)
                    {
                      if (*(void *)v66 != v45) {
                        objc_enumerationMutation(v37);
                      }
                      [*(id *)(*((void *)&v65 + 1) + 8 * i) CGRectValue];
                      uint64_t v51 = v50;
                      uint64_t v53 = v52;
                      if (v46) {
                        uint64_t v54 = v27;
                      }
                      else {
                        uint64_t v54 = v48;
                      }
                      if (v46) {
                        uint64_t v55 = v29;
                      }
                      else {
                        uint64_t v55 = v49;
                      }
                      v78.origin.CGFloat x = x;
                      v78.origin.CGFloat y = y;
                      v78.size.double width = width;
                      v78.size.CGFloat height = height;
                      CGRect v79 = CGRectUnion(v78, *(CGRect *)(&v51 - 1));
                      CGFloat x = v79.origin.x;
                      CGFloat y = v79.origin.y;
                      double width = v79.size.width;
                      CGFloat height = v79.size.height;
                    }
                    uint64_t v44 = [v37 countByEnumeratingWithState:&v65 objects:v73 count:16];
                  }
                  while (v44);
                }
                else
                {
                  a4 = v36;
                  uint64_t v20 = v35;
                  uint64_t v19 = v62;
                }
                goto LABEL_40;
              }
              [v22 caretRectForSelection:v6];
              CGFloat x = v31;
              CGFloat y = v32;
              double width = v30;
              CGFloat height = v33;
              if (v33 > 0.0)
              {
                double width = fmax(v30, 1.0);
                goto LABEL_49;
              }
LABEL_40:
              ++v21;
            }
            while (v21 != v19);
            uint64_t v56 = [a4 countByEnumeratingWithState:&v69 objects:v74 count:16];
            uint64_t v19 = v56;
            if (!v56) {
              goto LABEL_49;
            }
          }
        }
        uint64_t v13 = v11;
        uint64_t v14 = v12;
        id v15 = +[TSWPColumn columnForCharIndex:eol:withColumns:](TSWPColumn, "columnForCharIndex:eol:withColumns:", [v6 range], objc_msgSend(v6, "isAtEndOfLine"), a4);
        if (v15)
        {
          double v16 = v15;
          uint64_t v17 = objc_msgSend(v15, "lineIndexForCharIndex:eol:", objc_msgSend(v6, "range"), objc_msgSend(v6, "isAtEndOfLine"));
          if (v17 == [v16 lineIndexForCharIndex:v13 eol:0]
            && v17 == objc_msgSend(v16, "lineIndexForCharIndex:eol:", v13 + v14, objc_msgSend(v6, "isAtEndOfLine")))
          {
            id v6 = (id)objc_msgSend(v6, "copyWithNewRange:", v13, v14);
            int v61 = 0;
            goto LABEL_10;
          }
        }
      }
      int v61 = 1;
      goto LABEL_10;
    }
  }
LABEL_49:
  double v57 = x;
  double v58 = y;
  double v59 = width;
  double v60 = height;
  result.size.CGFloat height = v60;
  result.size.double width = v59;
  result.origin.CGFloat y = v58;
  result.origin.CGFloat x = v57;
  return result;
}

+ (id)closestColumnInColumnsArray:(id)a3 forPoint:(CGPoint)a4 ignoreEmptyColumns:(BOOL)a5 ignoreDrawableOnlyColumns:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double y = a4.y;
  double x = a4.x;
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v11 = [a3 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v11) {
    return 0;
  }
  uint64_t v12 = v11;
  uint64_t v13 = 0;
  uint64_t v14 = *(void *)v31;
  double v15 = INFINITY;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v31 != v14) {
        objc_enumerationMutation(a3);
      }
      uint64_t v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      [v17 frameBounds];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      if ((!v7 || [v17 countLines])
        && (!v6
         || [v17 countLines] != 1
         || (*(unsigned char *)([v17 lineFragmentAtIndex:0] + 24) & 0x40) == 0))
      {
        v37.origin.double x = v19;
        v37.origin.double y = v21;
        v37.size.double width = v23;
        v37.size.CGFloat height = v25;
        v36.double x = x;
        v36.double y = y;
        if (CGRectContainsPoint(v37, v36)) {
          return v17;
        }
        double v26 = TSDClampPointInRect();
        double v28 = TSDDistanceSquared(x, y, v26, v27);
        if (v28 < v15)
        {
          uint64_t v13 = v17;
          double v15 = v28;
        }
      }
    }
    uint64_t v12 = [a3 countByEnumeratingWithState:&v30 objects:v34 count:16];
    uint64_t v17 = v13;
  }
  while (v12);
  return v17;
}

+ (unint64_t)charIndexForPoint:(CGPoint)a3 inColumnsArray:(id)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 leadingEdge:(BOOL *)a8
{
  return objc_msgSend(a1, "charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:", a4, a5, a6, 1, a7, a8, a3.x, a3.y);
}

+ (unint64_t)charIndexForPoint:(CGPoint)a3 inColumnsArray:(id)a4 allowPastBreak:(BOOL)a5 allowNotFound:(BOOL)a6 pastCenterGoesToNextChar:(BOOL)a7 isAtEndOfLine:(BOOL *)a8 leadingEdge:(BOOL *)a9
{
  BOOL v11 = a7;
  BOOL v12 = a6;
  BOOL v13 = a5;
  double y = a3.y;
  double x = a3.x;
  double v16 = objc_msgSend(a1, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", a4, 0, 1);
  uint64_t v17 = v16;
  if (v12)
  {
    [v16 frameBounds];
    v20.double x = x;
    v20.double y = y;
    if (!CGRectContainsPoint(v21, v20)) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return objc_msgSend(v17, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:leadingEdge:", v13, v11, v12, a8, a9, x, y);
}

+ (unint64_t)charIndexForTopicDragAtPoint:(CGPoint)a3 inColumnsArray:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v58 = *MEMORY[0x263EF8340];
  BOOL v7 = objc_msgSend(a1, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", a4, 0, 1);
  if (!v7) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  CGFloat v8 = v7;
  uint64_t v9 = objc_msgSend(v7, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:outFragment:leadingEdge:", 0, 1, 0, 0, 0, 0, x, y);
  CGFloat v10 = (void *)[v8 storage];
  if (v10) {
    [v10 paragraphEnumeratorAtCharIndex:v9 styleProvider:0];
  }
  else {
    memset(&v56, 0, sizeof(v56));
  }
  NSUInteger v11 = TSWPParagraphEnumerator::paragraphTextRange(&v56);
  uint64_t v13 = v12;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v14 = [a4 countByEnumeratingWithState:&v52 objects:v57 count:16];
  uint64_t v51 = v8;
  double v49 = y;
  uint64_t v48 = v13;
  if (v14)
  {
    uint64_t v15 = *(void *)v53;
    unint64_t v16 = v11 + v13;
    double v50 = 0.0;
    char v17 = 1;
    double v18 = 0.0;
    double v19 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v53 != v15) {
          objc_enumerationMutation(a4);
        }
        CGRect v21 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        uint64_t v22 = objc_msgSend(v21, "range", v48);
        if (v22 + v23 > v11)
        {
          if ([v21 range] >= v16) {
            goto LABEL_35;
          }
          [v21 frameBounds];
          CGFloat v25 = v24;
          CGFloat v27 = v26;
          CGFloat v29 = v28;
          CGFloat v31 = v30;
          uint64_t v32 = [v21 lineFragmentForCharIndex:v11 knobTag:11 selectionType:0];
          uint64_t v33 = [v21 lineFragmentForCharIndex:v16 knobTag:10 selectionType:0];
          NSRange v34 = (double *)v33;
          if (v21 == v51)
          {
            if (v32)
            {
              double MinY = CGRectGetMinY(*(CGRect *)(v32 + 48));
              if (v34)
              {
                CGFloat v25 = v34[6];
                CGFloat v27 = v34[7];
                CGFloat v29 = v34[8];
                CGFloat v31 = v34[9];
              }
              double v42 = *(double *)(v32 + 112);
              v59.origin.double x = v25;
              v59.origin.double y = v27;
              v59.size.double width = v29;
              v59.size.CGFloat height = v31;
              double v49 = v49 - (MinY + v42);
              double Height = CGRectGetMaxY(v59) - (MinY + v42);
            }
            else if (v33)
            {
              double MaxY = CGRectGetMaxY(*(CGRect *)(v33 + 48));
              v61.origin.double x = v25;
              v61.origin.double y = v27;
              v61.size.double width = v29;
              v61.size.CGFloat height = v31;
              double Height = MaxY - CGRectGetMinY(v61);
            }
            else
            {
              v63.origin.double x = v25;
              v63.origin.double y = v27;
              v63.size.double width = v29;
              v63.size.CGFloat height = v31;
              double Height = CGRectGetHeight(v63);
            }
            char v17 = 0;
            double v18 = v18 + Height;
          }
          else if (v17)
          {
            CGFloat v35 = v25;
            CGFloat v36 = v27;
            CGFloat v37 = v29;
            CGFloat v38 = v31;
            if (v32)
            {
              double v39 = CGRectGetMaxY(*(CGRect *)&v35);
              double v40 = v39 - CGRectGetMinY(*(CGRect *)(v32 + 48));
            }
            else
            {
              double v40 = CGRectGetHeight(*(CGRect *)&v35);
            }
            double v19 = v19 + v40;
            char v17 = 1;
          }
          else
          {
            if (v33)
            {
              double v44 = CGRectGetMaxY(*(CGRect *)(v33 + 48));
              v60.origin.double x = v25;
              v60.origin.double y = v27;
              v60.size.double width = v29;
              v60.size.CGFloat height = v31;
              char v17 = 0;
              double v45 = v44 - CGRectGetMinY(v60);
            }
            else
            {
              v62.origin.double x = v25;
              v62.origin.double y = v27;
              v62.size.double width = v29;
              v62.size.CGFloat height = v31;
              double v45 = CGRectGetHeight(v62);
              char v17 = 0;
            }
            double v50 = v50 + v45;
          }
        }
      }
      uint64_t v14 = [a4 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v14);
  }
  else
  {
    double v50 = 0.0;
    double v18 = 0.0;
    double v19 = 0.0;
  }
LABEL_35:
  if (v49 + v19 > (v50 + v18 + v19) * 0.5)
  {
    if (v11 + v48) {
      NSUInteger v11 = v11 + v48 - (v11 + v48 != objc_msgSend((id)objc_msgSend(v51, "storage", v49 + v19), "length"));
    }
    else {
      NSUInteger v11 = 0;
    }
  }
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v56);
  return v11;
}

+ (id)smartFieldWithAttributeKind:(unsigned int)a3 inColumnArray:(id)a4 atPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v7 = *(void *)&a3;
  id v8 = +[TSWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](TSWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", a4, 0, 1);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  [v8 frameBounds];
  v13.double x = x;
  v13.double y = y;
  if (!CGRectContainsPoint(v14, v13)) {
    return 0;
  }
  uint64_t v10 = objc_msgSend(v9, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:leadingEdge:", 0, 0, 1, 0, 0, x, y);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }

  return (id)[v9 smartFieldAtCharIndex:v10 attributeKind:v7];
}

+ (id)footnoteMarkAttachmentInColumnArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = +[TSWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](TSWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", a3, 0, 1);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  if (objc_msgSend((id)objc_msgSend(v6, "storage"), "wpKind") != 2) {
    return 0;
  }
  [v7 frameBounds];
  v13.double x = x;
  v13.double y = y;
  if (!CGRectContainsPoint(v14, v13)) {
    return 0;
  }
  uint64_t v8 = objc_msgSend(v7, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:leadingEdge:", 0, 0, 1, 0, 0, x, y);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v10 = v8;
  NSUInteger v11 = (void *)[v7 storage];

  return (id)[v11 footnoteMarkAtCharIndex:v10];
}

+ (id)footnoteReferenceAttachmentInColumnArray:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = +[TSWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](TSWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", a3, 0, 1);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  if (objc_msgSend((id)objc_msgSend(v6, "storage"), "wpKind")) {
    return 0;
  }
  [v7 frameBounds];
  v13.double x = x;
  v13.double y = y;
  if (!CGRectContainsPoint(v14, v13)) {
    return 0;
  }
  uint64_t v8 = objc_msgSend(v7, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:leadingEdge:", 0, 0, 1, 0, 0, x, y);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v10 = v8;
  NSUInteger v11 = (void *)[v7 storage];

  return (id)[v11 footnoteReferenceAtCharIndex:v10];
}

+ (id)pathForHighlightWithRange:(_NSRange)a3 columnArray:(id)a4 pathStyle:(int)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = +[TSDBezierPath bezierPath];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = a4;
  uint64_t v8 = [a4 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(obj);
        }
        NSUInteger v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v12 = objc_msgSend(v11, "rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:", a3.location, a3.length, 0, 0, a5 == 1);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v23 != v15) {
                objc_enumerationMutation(v12);
              }
              char v17 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              [v17 CGRectValue];
              if (a5 == 2)
              {
                [v17 CGRectValue];
                CGRect v34 = CGRectInset(v33, -3.0, -3.0);
                objc_msgSend(v7, "appendBezierPath:", +[TSDBezierPath bezierPathWithRoundedRect:cornerRadius:](TSDBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height, 3.0));
              }
              else
              {
                objc_msgSend(v7, "appendBezierPathWithRect:");
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v14);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v9);
  }
  return v7;
}

+ (CGRect)boundsRectForSelection:(id)a3 columnArray:(id)a4 includeRuby:(BOOL)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  CGFloat x = *MEMORY[0x263F001A0];
  CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
  if (a3)
  {
    BOOL v9 = a5;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v12 = [a4 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v37;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(a4);
          }
          unint64_t v16 = *(void **)(*((void *)&v36 + 1) + 8 * v15);
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          uint64_t v17 = objc_msgSend(a3, "range", 0);
          double v19 = objc_msgSend(v16, "rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:", v17, v18, objc_msgSend(a3, "type"), 0, v9);
          uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v33;
            do
            {
              uint64_t v23 = 0;
              do
              {
                if (*(void *)v33 != v22) {
                  objc_enumerationMutation(v19);
                }
                [*(id *)(*((void *)&v32 + 1) + 8 * v23) CGRectValue];
                v46.origin.CGFloat x = v24;
                v46.origin.CGFloat y = v25;
                v46.size.CGFloat width = v26;
                v46.size.CGFloat height = v27;
                v43.origin.CGFloat x = x;
                v43.origin.CGFloat y = y;
                v43.size.CGFloat width = width;
                v43.size.CGFloat height = height;
                CGRect v44 = CGRectUnion(v43, v46);
                CGFloat x = v44.origin.x;
                CGFloat y = v44.origin.y;
                CGFloat width = v44.size.width;
                CGFloat height = v44.size.height;
                ++v23;
              }
              while (v21 != v23);
              uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v21);
          }
          ++v15;
        }
        while (v15 != v13);
        uint64_t v13 = [a4 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v13);
    }
  }
  double v28 = x;
  double v29 = y;
  double v30 = width;
  double v31 = height;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

+ (id)columnForCharIndex:(unint64_t)a3 eol:(BOOL)a4 withColumns:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a5, "firstObject"), "storage");
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = a5;
  uint64_t v8 = [a5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)v22;
LABEL_3:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v22 != v11) {
      objc_enumerationMutation(obj);
    }
    uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
    if (v7 != [v13 storage])
    {
      uint64_t v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v15 = [NSString stringWithUTF8String:"+[TSWPColumn columnForCharIndex:eol:withColumns:]"];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 462, @"unexpected column storage");
    }
    uint64_t v16 = [v13 range];
    if (v16 + v17 > a3 && a4) {
      return v13;
    }
    if (v16 + v17 > a3) {
      uint64_t v10 = v13;
    }
    if (v9 == ++v12)
    {
      uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v13 = v10;
      if (v9) {
        goto LABEL_3;
      }
      return v13;
    }
  }
}

- (double)logicalBoundsTop
{
  return CGRectGetMinY(self->_frameBounds);
}

- (double)logicalBoundsBottom
{
  return CGRectGetMaxY(self->_frameBounds);
}

- (void)setRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  [(TSWPColumn *)self setStartCharIndex:a3.location];

  [(TSWPColumn *)self setCharacterCount:length];
}

- (void)setAnchoredRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  [(TSWPColumn *)self setStartAnchoredCharIndex:a3.location];

  [(TSWPColumn *)self setAnchoredCharCount:length];
}

- (void)incrementRanges:(int64_t)a3
{
  if ((int64_t)-self->_startCharIndex > a3)
  {
    double v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPColumn incrementRanges:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 561, @"Bad delta");
  }
  unint64_t startAnchoredCharIndex = self->_startAnchoredCharIndex;
  if (-(uint64_t)startAnchoredCharIndex > a3)
  {
    uint64_t v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSWPColumn incrementRanges:]"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 562, @"Bad delta");
    unint64_t startAnchoredCharIndex = self->_startAnchoredCharIndex;
  }
  startCharIndeCGFloat x = self->_startCharIndex;
  if (-(uint64_t)startCharIndex > a3) {
    int64_t v11 = -(uint64_t)startCharIndex;
  }
  else {
    int64_t v11 = a3;
  }
  self->_startCharIndeCGFloat x = v11 + startCharIndex;
  self->_unint64_t startAnchoredCharIndex = startAnchoredCharIndex + v11;
  ptr = self->_lineFragmentArray.__ptr_;

  TSWPLineFragmentArray::incrementStartCharIndexes(ptr, v11);
}

- (void)setStorage:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  uint64_t v7 = a4.location - self->_startCharIndex;

  uint64_t v8 = (TSWPStorage *)a3;
  self->_storage = v8;
  TSWPLineFragmentArray::setStorage(self->_lineFragmentArray.__ptr_, v8, v7);
  unint64_t characterCount = self->_characterCount;
  self->_startCharIndex += v7;
  self->_startAnchoredCharIndex += v7;
  if (characterCount != length)
  {
    uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPColumn setStorage:range:]"];
    uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"];
    [v10 handleFailureInFunction:v11 file:v12 lineNumber:588 description:@"Shouldn't be changing character count here"];
  }
}

- (double)trimToCharIndex:(unint64_t)a3 inTarget:(id)a4
{
  if (self->_nextWidowPullsDownFromCharIndex < a3)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPColumn trimToCharIndex:inTarget:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 611, @"Bad charIndex");
  }
  unint64_t v9 = [(TSWPColumn *)self range];
  unint64_t v11 = v9 + v10;
  if (a3 < v9 || v11 < a3)
  {
    CGFloat v25 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v26 = [NSString stringWithUTF8String:"-[TSWPColumn trimToCharIndex:inTarget:]"];
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 616, @"Bad charIndex");
    if (a4) {
      goto LABEL_6;
    }
LABEL_19:
    CGFloat v27 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v28 = [NSString stringWithUTF8String:"-[TSWPColumn trimToCharIndex:inTarget:]"];
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 618, @"invalid nil value for '%s'", "target");
    goto LABEL_6;
  }
  if (!a4) {
    goto LABEL_19;
  }
LABEL_6:
  double v12 = 0.0;
  if (a3 >= v9 && v11 > a3)
  {
    self->_unint64_t characterCount = a3 - v9;
    uint64_t v13 = TSWPLineFragmentArray::count(self->_lineFragmentArray.__ptr_);
    if (v13)
    {
      unint64_t v14 = v13;
      LineIndexForCharIndeCGFloat x = TSWPLineFragmentArray::findLineIndexForCharIndex(self->_lineFragmentArray.__ptr_, a3);
      double v16 = 0.0;
      BOOL v17 = v14 > LineIndexForCharIndex;
      NSUInteger v18 = v14 - LineIndexForCharIndex;
      if (v17)
      {
        NSUInteger v19 = LineIndexForCharIndex;
        if (LineIndexForCharIndex)
        {
          uint64_t v20 = TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, LineIndexForCharIndex);
          uint64_t v21 = TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, v19 - 1);
          double MinY = CGRectGetMinY(*(CGRect *)(v20 + 48));
          double v12 = MinY - CGRectGetMaxY(*(CGRect *)(v21 + 48)) + *(double *)(v20 + 112);
        }
        v29.NSUInteger location = v19;
        v29.NSUInteger length = v18;
        TSWPLineFragmentArray::removeObjectsInRange(self->_lineFragmentArray.__ptr_, v29);
      }
      Object = (double *)TSWPLineFragmentArray::lastObject(self->_lineFragmentArray.__ptr_);
      if (Object) {
        double v16 = Object[4] + Object[5] + Object[17];
      }
      [(TSWPColumn *)self setContentBottom:v16];
      [(TSWPColumn *)self clearAdornments];
      TSWPLayoutChore::addParagraphAdornmentsToColumn(self, (void *)[a4 columnMetricsForCharIndex:a3 outRange:0], 0);
      TSWPLayoutChore::addChangeBarAdornmentsToColumn(self, (void *)[a4 columnMetricsForCharIndex:a3 outRange:0]);
    }
  }
  self->_nextWidowPullsDownFromCharIndeCGFloat x = a3;
  return v12;
}

- (void)trimFromCharIndex:(unint64_t)a3 inTarget:(id)a4 layoutChore:(void *)a5
{
  if (self->_nextWidowPullsDownFromCharIndex < a3)
  {
    unint64_t v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPColumn trimFromCharIndex:inTarget:layoutChore:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 658, @"Bad charIndex");
  }
  unint64_t v11 = [(TSWPColumn *)self range];
  unint64_t v13 = v11 + v12;
  if (v11 > a3 || v13 < a3)
  {
    BOOL v17 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v18 = [NSString stringWithUTF8String:"-[TSWPColumn trimFromCharIndex:inTarget:layoutChore:]"];
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 661, @"Bad charIndex");
    if (a4) {
      goto LABEL_6;
    }
LABEL_13:
    NSUInteger v19 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v20 = [NSString stringWithUTF8String:"-[TSWPColumn trimFromCharIndex:inTarget:layoutChore:]"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 663, @"invalid nil value for '%s'", "target");
    goto LABEL_6;
  }
  if (!a4) {
    goto LABEL_13;
  }
LABEL_6:
  if (v11 < a3 && v13 >= a3)
  {
    p_lineFragmentArraCGFloat y = &self->_lineFragmentArray;
    if (TSWPLineFragmentArray::count(self->_lineFragmentArray.__ptr_))
    {
      LineIndexForCharIndeCGFloat x = TSWPLineFragmentArray::findLineIndexForCharIndex(p_lineFragmentArray->__ptr_, a3);
      if (LineIndexForCharIndex)
      {
        v16.NSUInteger length = LineIndexForCharIndex;
        if (LineIndexForCharIndex != 0x7FFFFFFFFFFFFFFFLL)
        {
          self->_startCharIndeCGFloat x = a3;
          self->_unint64_t characterCount = v13 - a3;
          v16.NSUInteger location = 0;
          TSWPLineFragmentArray::removeObjectsInRange(self->_lineFragmentArray.__ptr_, v16);
          uint64_t Object = TSWPLineFragmentArray::firstObject(self->_lineFragmentArray.__ptr_);
          long long v22 = (double *)MEMORY[0x263F00148];
          if (Object)
          {
            uint64_t v23 = Object;
            [(TSWPColumn *)self frameBounds];
            double MinY = CGRectGetMinY(v32);
            double v25 = MinY - CGRectGetMinY(*(CGRect *)(v23 + 48));
            double v26 = 0.0;
          }
          else
          {
            double v26 = *MEMORY[0x263F00148];
            double v25 = *(double *)(MEMORY[0x263F00148] + 8);
          }
          v31.CGFloat x = v26;
          v31.CGFloat y = v25;
          TSWPLineFragmentArray::offsetLineFragmentsBy(p_lineFragmentArray->__ptr_, v31);
          if (v26 != *v22 || v25 != v22[1]) {
            TSWPLayoutChore::pPostProcessAttachments((uint64_t)a5, (TSWPLineFragment ****)&self->_lineFragmentArray);
          }
          CGFloat v27 = (double *)TSWPLineFragmentArray::lastObject(p_lineFragmentArray->__ptr_);
          if (v27) {
            double v28 = v27[4] + v27[5] + v27[17];
          }
          else {
            double v28 = 0.0;
          }
          [(TSWPColumn *)self setContentBottom:v28];
          [(TSWPColumn *)self clearAdornments];
          TSWPLayoutChore::addParagraphAdornmentsToColumn(self, (void *)[a4 columnMetricsForCharIndex:a3 outRange:0], 0);
          _NSRange v29 = (void *)[a4 columnMetricsForCharIndex:a3 outRange:0];
          TSWPLayoutChore::addChangeBarAdornmentsToColumn(self, v29);
        }
      }
    }
  }
}

- (double)minimumHeightForLayoutOnPage
{
  if ([(TSWPColumn *)self countLines])
  {
    uint64_t v3 = TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, 0);
    double MinY = CGRectGetMinY(*(CGRect *)(v3 + 48));
    [(TSWPColumn *)self logicalBoundsTop];
    double v6 = v5;
    double result = 0.0;
    if (MinY > v6) {
      return result;
    }
    double contentBottom = *(double *)(v3 + 32) + *(double *)(v3 + 40) + *(double *)(v3 + 136);
  }
  else
  {
    double contentBottom = self->_contentBottom;
  }
  [(TSWPColumn *)self logicalBoundsTop];
  return contentBottom - v9;
}

- (double)textBottom
{
  [(TSWPColumn *)self logicalBoundsTop];
  double v4 = v3;
  uint64_t Object = (void *)TSWPLineFragmentArray::lastObject(self->_lineFragmentArray.__ptr_);
  if (!Object) {
    return v4;
  }
  uint64_t v6 = Object[6];
  uint64_t v7 = Object[7];
  uint64_t v8 = Object[8];
  uint64_t v9 = Object[9];

  return CGRectGetMaxY(*(CGRect *)&v6);
}

- (double)textHeight
{
  [(TSWPColumn *)self textBottom];
  double v4 = v3;
  [(TSWPColumn *)self logicalBoundsTop];
  return v4 - v5;
}

- (BOOL)requiresGlyphVectorsForHeightMeasurement
{
  long long v2 = [(TSWPColumn *)self lineFragmentArray];
  uint64_t v3 = TSWPLineFragmentArray::count(*v2);
  if (v3)
  {
    unint64_t v4 = v3;
    double v5 = (TSWPLineFragment *)TSWPLineFragmentArray::objectAtIndex(*v2, 0);
    if (TSWPLineFragment::requiresGlyphVectorsForHeightMeasurement(v5))
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
        uint64_t v8 = (TSWPLineFragment *)TSWPLineFragmentArray::objectAtIndex(*v2, v6);
        BOOL v9 = TSWPLineFragment::requiresGlyphVectorsForHeightMeasurement(v8);
        unint64_t v6 = v7 + 1;
      }
      while (!v9);
      LOBYTE(v3) = v7 < v4;
    }
  }
  return v3;
}

- (void)addAdornmentRect:(const TSWPAdornmentRect *)a3
{
  paragraphAdornments = (uint64_t *)self->_paragraphAdornments;
  unint64_t v4 = paragraphAdornments[1];
  if (v4 >= paragraphAdornments[2])
  {
    uint64_t v5 = std::vector<TSWPAdornmentRect>::__push_back_slow_path<TSWPAdornmentRect const&>(paragraphAdornments, (uint64_t)a3);
  }
  else
  {
    std::vector<TSWPAdornmentRect>::__construct_one_at_end[abi:ne180100]<TSWPAdornmentRect const&>((uint64_t)paragraphAdornments, (uint64_t)a3);
    uint64_t v5 = v4 + 56;
  }
  paragraphAdornments[1] = v5;
}

- (const)lineFragmentAtIndex:(unint64_t)a3
{
  return (const void *)TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3);
}

- (void)normalizeLineFragmentOrigins:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(TSWPColumn *)self frameBounds];
  double v7 = v6 - x;
  double v9 = v8 - y;

  -[TSWPColumn offsetLineFragmentsByPoint:](self, "offsetLineFragmentsByPoint:", v7, v9);
}

- (void)offsetLineFragmentsByPoint:(CGPoint)a3
{
  if (a3.x != 0.0 || a3.y != 0.0)
  {
    uint64_t v4 = *(void *)&a3.y;
    TSWPLineFragmentArray::offsetLineFragmentsBy(self->_lineFragmentArray.__ptr_, a3);
    *(float64x2_t *)&self->_double contentBottom = vaddq_f64((float64x2_t)vdupq_lane_s64(v4, 0), *(float64x2_t *)&self->_contentBottom);
  }
}

- (unint64_t)lineFragmentCountForBaseline:(double)a3
{
  return TSWPLineFragmentArray::lineFragmentCountForBaseline(self->_lineFragmentArray.__ptr_, a3);
}

- (void)makeEmpty:(unint64_t)a3 layoutResultFlags:(int)a4
{
  self->_startCharIndedouble x = a3;
  self->_unint64_t characterCount = 0;
  self->_unint64_t startAnchoredCharIndex = a3;
  self->_NSUInteger anchoredCharCount = 0;
  self->_double contentBottom = 0.0;
  self->_erasableContentBottom = 0.0;
  self->_layoutResultFlags = a4;
  self->_nextWidowPullsDownFromCharIndedouble x = a3;
  TSWPLineFragmentArray::removeAllObjects(self->_lineFragmentArray.__ptr_);

  [(TSWPColumn *)self clearAdornments];
}

- (CGRect)boundsOfLineFragmentAtIndex:(unint64_t)a3
{
  uint64_t v3 = (double *)TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3);
  double v4 = v3[6];
  double v5 = v3[7];
  double v6 = v3[8];
  double v7 = v3[9];
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)labelBoundsOfLineFragmentAtIndex:(unint64_t)a3
{
  uint64_t v3 = (TSWPLineFragment *)TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3);

  TSWPLineFragment::labelRect(v3);
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (double)typographicGlyphExtentOfLineFragmentAtIndex:(unint64_t)a3
{
  return *(double *)(TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3) + 216);
}

- (BOOL)isEmptyLineFragmentAtIndex:(unint64_t)a3
{
  return (*(unsigned __int8 *)(TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3) + 25) >> 6) & 1;
}

- (BOOL)isDropCapFragmentAtIndex:(unint64_t)a3
{
  return (*(unsigned __int8 *)(TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a3) + 27) >> 1) & 1;
}

- ($8502DCEA08BBBE1AB2005217B3838BBD)heightInfoOfLineFragmentAtIndex:(SEL)a3
{
  CGRect result = ($8502DCEA08BBBE1AB2005217B3838BBD *)TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a4);
  long long v6 = *(_OWORD *)&result[2].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&result[1].var6;
  *(_OWORD *)&retstr->var2 = v6;
  long long v7 = *(_OWORD *)&result[2].var4;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&result[2].var2;
  *(_OWORD *)&retstr->var6 = v7;
  return result;
}

- (double)baselineOfLineFragmentAtCharIndex:(unint64_t)a3
{
  ptr = self->_lineFragmentArray.__ptr_;
  double v4 = *(unint64_t ***)ptr;
  double v5 = (unint64_t **)*((void *)ptr + 1);
  double result = 0.0;
  while (v4 != v5)
  {
    unint64_t v7 = **v4;
    BOOL v9 = a3 >= v7;
    unint64_t v8 = a3 - v7;
    BOOL v9 = !v9 || v8 >= (*v4)[1];
    if (!v9) {
      return *((double *)*v4 + 4) + *((double *)*v4 + 5);
    }
    v4 += 2;
  }
  return result;
}

- ($67DC2B40F188BF54E27CB16063B1C8C0)lineMetricsAtCharIndex:(SEL)a3 allowEndOfLine:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  *retstr = *($67DC2B40F188BF54E27CB16063B1C8C0 *)TSWPEmptyLineMetrics;
  double result = [(TSWPColumn *)self lineIndexForCharIndex:a4 eol:a5];
  if (result != ($67DC2B40F188BF54E27CB16063B1C8C0 *)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v9 = [(TSWPColumn *)self lineFragmentAtIndex:result];
    BOOL v29 = 0;
    CGSize v10 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    retstr->var0.origin = (CGPoint)*MEMORY[0x263F001A0];
    retstr->var0.size = v10;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v11 = -[TSWPColumn rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:](self, "rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:", *(void *)v9, *((void *)v9 + 1), 0, 0, 0, 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      CGFloat x = retstr->var0.origin.x;
      CGFloat y = retstr->var0.origin.y;
      CGFloat width = retstr->var0.size.width;
      CGFloat height = retstr->var0.size.height;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * i) CGRectValue];
          v34.origin.CGFloat x = v20;
          v34.origin.CGFloat y = v21;
          v34.size.CGFloat width = v22;
          v34.size.CGFloat height = v23;
          v32.origin.CGFloat x = x;
          v32.origin.CGFloat y = y;
          v32.size.CGFloat width = width;
          v32.size.CGFloat height = height;
          CGRect v33 = CGRectUnion(v32, v34);
          CGFloat x = v33.origin.x;
          CGFloat y = v33.origin.y;
          CGFloat width = v33.size.width;
          CGFloat height = v33.size.height;
          retstr->var0 = v33;
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v13);
    }
    retstr->var1 = *((double *)v9 + 4) + *((double *)v9 + 5);
    *(_OWORD *)&retstr->var2 = *((_OWORD *)v9 + 8);
    long long v24 = (const __CTFont *)TSWPLineFragment::fontAtCharIndex(v9, a4, &v29);
    retstr->var4 = CTFontGetXHeight(v24);
  }
  return result;
}

- (double)horizontalOffsetForCharIndex:(unint64_t)a3 lineFragmentIndex:(unint64_t)a4 bumpPastHyphen:(BOOL)a5 allowPastLineBounds:(BOOL)a6
{
  BOOL v9 = (TSWPLineFragment *)TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, a4);

  return TSWPLineFragment::wpOffsetForCharIndex(v9, a3, a5, a6, 0);
}

- (const)lineFragmentClosestToPoint:(CGPoint)a3 knobTag:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  if (self)
  {
    [(TSWPColumn *)self transformToWP];
    double v8 = *((double *)&v22 + 1);
    double v9 = *((double *)&v23 + 1);
    double v10 = *((double *)&v24 + 1);
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v22 = 0u;
    double v10 = 0.0;
    double v9 = 0.0;
    double v8 = 0.0;
  }
  id v11 = [(TSWPColumn *)self lineFragmentArray];
  uint64_t v12 = TSWPLineFragmentArray::count(*v11);
  if (!v12) {
    return 0;
  }
  uint64_t v13 = v12;
  uint64_t v14 = 0;
  unint64_t v15 = 0;
  double v16 = v10 + y * v9 + v8 * x;
  double v17 = INFINITY;
  do
  {
    uint64_t v18 = (double *)TSWPLineFragmentArray::objectAtIndex(*v11, v15);
    TSDPositionOfKnobOnRectangle(a4, v18[6], v18[7], v18[8], v18[9]);
    double v20 = vabdd_f64(v16, v19);
    if (v20 < v17)
    {
      uint64_t v14 = v18;
      double v17 = v20;
    }
    ++v15;
  }
  while (v13 != v15);
  return v14;
}

- (const)lineFragmentForCharIndex:(unint64_t)a3 knobTag:(unint64_t)a4 selectionType:(int)a5
{
  unint64_t v8 = -[TSWPStorage selectionRangeMaxForCharIndex:](self->_storage, "selectionRangeMaxForCharIndex:");
  unint64_t v9 = v8;
  int v35 = 0;
  if (a3 && v8 == a3) {
    int v35 = IsParagraphBreakingCharacter([(TSWPStorage *)self->_storage characterAtIndex:a3 - 1]);
  }
  double v10 = [(TSWPColumn *)self lineFragmentArray];
  uint64_t v11 = TSWPLineFragmentArray::count(*v10);
  if (!v11) {
    return 0;
  }
  uint64_t v12 = v11;
  unint64_t v13 = 0;
  uint64_t v34 = v11 - 1;
  while (1)
  {
    uint64_t v14 = TSWPLineFragmentArray::objectAtIndex(*v10, v13);
    unsigned int v15 = *(_DWORD *)(v14 + 24);
    if ((v15 & 0x40) == 0)
    {
      uint64_t v16 = v14;
      BOOL v17 = (v15 & 0x1000) != 0 && a5 == 7;
      BOOL v18 = !v17;
      uint64_t v20 = *(void *)v14;
      unint64_t v19 = *(void *)(v14 + 8);
      BOOL v21 = a3 - *(void *)v14 < v19 && a3 >= *(void *)v14;
      BOOL v22 = a3 == v20 && v9 == a3;
      if (!v22 && !v21)
      {
        int v25 = 0;
      }
      else
      {
        int v24 = (v15 >> 9) & 1;
        if (a3 != v20) {
          int v24 = 1;
        }
        if (a4 != 11) {
          int v24 = 1;
        }
        int v25 = (v15 & 1) != 0 ? v24 : 1;
      }
      if (a5 == 7)
      {
        int v27 = (a4 == 11) ^ v18 ^ 1;
        uint64_t v20 = TSWPLineFragment::leftMostCharIndex((TSWPLineFragment *)v14);
        uint64_t v26 = TSWPLineFragment::rightMostCharIndex((TSWPLineFragment *)v16);
      }
      else
      {
        uint64_t v26 = v19 + v20;
        int v27 = a4 == 11;
      }
      LOBYTE(v28) = 0;
      int v29 = v27 ^ 1;
      if (v9 != a3) {
        int v29 = 1;
      }
      if (v26 == a3)
      {
        int v30 = v27;
      }
      else
      {
        int v29 = 1;
        int v30 = 1;
      }
      int v31 = v30 ^ 1;
      int v32 = v29 | v35 ? v31 : v34 == v13;
      if (v27 && v20 == a3) {
        int v28 = (*(unsigned __int8 *)(v16 + 25) >> 1) & 1;
      }
      if ((v25 | v32) & 1) != 0 || (v28) {
        break;
      }
    }
    if (v12 == ++v13) {
      return 0;
    }
  }
  return (const void *)v16;
}

- (unint64_t)lineIndexForCharIndex:(unint64_t)a3 eol:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = -[TSWPStorage selectionRangeMaxForCharIndex:](self->_storage, "selectionRangeMaxForCharIndex:");
  if (a3)
  {
    uint64_t v8 = [(TSWPStorage *)self->_storage characterAtIndex:a3 - 1];
    int v9 = v8;
    int v10 = IsParagraphBreakingCharacter(v8);
    if (v9 == 8232) {
      int v11 = 1;
    }
    else {
      int v11 = v10;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 == a3) {
    int v12 = 0;
  }
  else {
    int v12 = objc_msgSend(-[TSWPStorage attachmentAtCharIndex:](self->_storage, "attachmentAtCharIndex:", a3), "isPartitioned");
  }
  unint64_t v13 = [(TSWPColumn *)self lineFragmentArray];
  uint64_t v14 = TSWPLineFragmentArray::count(*v13);
  if (!v14) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v15 = v14;
  unint64_t v16 = 0;
  while (1)
  {
    uint64_t v17 = TSWPLineFragmentArray::objectAtIndex(*v13, v16);
    unint64_t v18 = *(void *)(v17 + 8);
    int v19 = *(_DWORD *)(v17 + 24);
    unsigned int v20 = v19 & 0x200;
    if (a3 == *(void *)v17) {
      int v21 = v12;
    }
    else {
      int v21 = 0;
    }
    int v22 = v21 & (v20 >> 9);
    BOOL v23 = a3 == *(void *)v17 && v7 == a3;
    BOOL v24 = a3 - *(void *)v17 < v18 && a3 >= *(void *)v17;
    int v25 = v21 ^ 1;
    unint64_t v26 = v18 + *(void *)v17;
    int v27 = v22 ^ 1;
    if (v26 != a3) {
      int v27 = 0;
    }
    unint64_t v28 = v26;
    if ((v11 | v25) == 1) {
      int v29 = v11 & v22;
    }
    else {
      int v29 = 0;
    }
    if ((v11 | v25) == 1) {
      int v27 = 0;
    }
    if (v28 == a3 && (v4 && ((v29 | v22 ^ 1) & 1) != 0 || v7 == a3)) {
      int v30 = (v19 & 0x100) != 0 ? 0 : v11 ^ 1;
    }
    else {
      int v30 = 0;
    }
    if (((v24 & (v25 | (v20 >> 9)) | v23 | v27 | v29) & 1) != 0 || v30) {
      break;
    }
    if (v15 == ++v16) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v16;
}

- (CGRect)caretRectForSelection:(id)a3
{
  if (!a3)
  {
    double v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPColumn caretRectForSelection:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 1129, @"invalid nil value for '%s'", "selection");
  }
  if (([a3 isInsertionPoint] & 1) == 0)
  {
    unint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPColumn caretRectForSelection:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 1130, @"Caret rect for ranged selection is not meaningful");
  }
  double v9 = *MEMORY[0x263F001A0];
  double v10 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v11 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v12 = *(double *)(MEMORY[0x263F001A0] + 24);
  unint64_t v13 = [a3 range];
  id v49 = a3;
  int v14 = [a3 caretAffinity];
  startCharIndedouble x = self->_startCharIndex;
  unint64_t characterCount = self->_characterCount;
  unint64_t v17 = [(TSWPStorage *)self->_storage selectionRangeForCharIndex:v13];
  unint64_t v19 = v17 + v18;
  if (v13 < v17 || v13 > v19)
  {
    int v21 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v22 = [NSString stringWithUTF8String:"-[TSWPColumn caretRectForSelection:]"];
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 1139, @"invalid selection");
  }
  int v23 = 0;
  if (v13 > v17 && v13 <= v19)
  {
    uint64_t v24 = [(TSWPStorage *)self->_storage characterAtIndex:v13 - 1];
    int v25 = v24;
    int v26 = IsParagraphBreakingCharacter(v24);
    if (v25 == 8232) {
      int v23 = 1;
    }
    else {
      int v23 = v26;
    }
  }
  if (v13 == v19) {
    int v27 = 0;
  }
  else {
    int v27 = objc_msgSend(-[TSWPStorage attachmentAtCharIndex:](self->_storage, "attachmentAtCharIndex:", v13), "isPartitioned");
  }
  if (v14 == 1) {
    int v28 = 1;
  }
  else {
    int v28 = v27;
  }
  if (v13 >= startCharIndex && v13 - startCharIndex < characterCount)
  {
    BOOL v29 = v13 > startCharIndex || v13 == v17;
    int v30 = v28 ^ 1;
    if (v29) {
      int v30 = 1;
    }
    if ((v30 | v23)) {
      goto LABEL_61;
    }
  }
  if (v23) {
    int v31 = v27;
  }
  else {
    int v31 = v28;
  }
  if (v13 == v19) {
    int v31 = 1;
  }
  if (v13 == characterCount + startCharIndex && v31)
  {
LABEL_61:
    unint64_t v32 = -[TSWPColumn lineIndexForCharIndex:eol:](self, "lineIndexForCharIndex:eol:", v13);
    if (v32 < [(TSWPColumn *)self countLines])
    {
      CGRect v33 = [(TSWPColumn *)self lineFragmentAtIndex:v32];
      if (!v33)
      {
        uint64_t v34 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v35 = [NSString stringWithUTF8String:"-[TSWPColumn caretRectForSelection:]"];
        objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 1163, @"invalid nil value for '%s'", "lineFragment");
      }
      BOOL v60 = 0;
      if (v13 > v17) {
        uint64_t v36 = v23 ^ 1u;
      }
      else {
        uint64_t v36 = 0;
      }
      FontForStyle = (const __CTFont *)TSWPLineFragment::fontAtCharIndex(v33, v13 - v36, &v60);
      id v38 = [(TSWPStorage *)self->_storage characterStyleAtCharIndex:v13 left:v23 ^ 1u effectiveRange:0];
      long long v39 = (void *)[(TSWPStyleProvider *)[(TSWPColumn *)self styleProvider] paragraphStyleAtParIndex:[(TSWPStorage *)self->_storage paragraphIndexAtCharIndex:v13] effectiveRange:0];
      if (FontForStyle)
      {
        double v40 = 0;
      }
      else
      {
        FontForStyle = TSWPFastCreateFontForStyle((uint64_t)v38, v39, self->_scaleTextPercent);
        double v40 = FontForStyle;
        if (!FontForStyle) {
          goto LABEL_58;
        }
      }
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      TSWPFontHeightInfoForFont(FontForStyle, &v56);
      unint64_t v41 = (void *)TSWPResolvePropertyForStyles((uint64_t)v38, (uint64_t)v39, 33, 0);
      if (v41)
      {
        [v41 doubleValue];
        double v43 = v42;
      }
      else
      {
        double v43 = 0.0;
      }
      TSWPLineFragment::wpOffsetForInsertionPoint(v33, [v49 insertionChar], objc_msgSend(v49, "leadingEdge"), objc_msgSend(v49, "isVisual"), 0);
      double v9 = v44;
      double v45 = *((double *)v33 + 4) + *((double *)v33 + 5) - v43;
      double v54 = 0.0;
      double v55 = 0.0;
      double v52 = 0.0;
      double v53 = 0.0;
      double v51 = 0.0;
      if (TSWPLineFragment::isInsideTateChuYokoLineAtCharIndex(v33, v13, &v55, &v54, &v53, &v52, &v51))
      {
        double v10 = floor(v45 + v54 * 0.5 - v55);
        double v11 = v53 + v52 + v51;
        double v9 = v9 - v11;
        double v12 = 0.0;
        if (!v40) {
          goto LABEL_58;
        }
        goto LABEL_57;
      }
      BOOL v46 = [(TSWPColumn *)self textIsVertical];
      double v47 = *((double *)&v57 + 1);
      double v48 = *(double *)&v57;
      if (v46 && !v60)
      {
        double v47 = (*(double *)&v57 + *((double *)&v57 + 1)) * 0.5;
        *(double *)&long long v57 = v47;
        *((double *)&v57 + 1) = v47;
        double v48 = v47;
      }
      double v10 = floor(v45 - v48 - *(double *)&v58);
      double v12 = ceil(v45 + v47) - v10;
      double v11 = 0.0;
      if (v40) {
LABEL_57:
      }
        CFRelease(v40);
    }
  }
LABEL_58:
  [(TSWPColumn *)self transformFromWP];
  v61.origin.double x = v9;
  v61.origin.double y = v10;
  v61.size.CGFloat width = v11;
  v61.size.CGFloat height = v12;
  return CGRectApplyAffineTransform(v61, &v50);
}

- (CGRect)glyphRectForRange:(_NSRange)a3 includingLabel:(BOOL)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v93[2] = *MEMORY[0x263EF8340];
  CGFloat v86 = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat v87 = *MEMORY[0x263F001A0];
  CGFloat range2_8 = *(double *)(MEMORY[0x263F001A0] + 24);
  CGFloat v85 = *(double *)(MEMORY[0x263F001A0] + 16);
  [(TSWPColumn *)self range];
  NSUInteger range2 = location;
  NSUInteger v7 = length;
  uint64_t v8 = TSUIntersectionRangeWithEdge();
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    ptr = self->_lineFragmentArray.__ptr_;
    double v11 = *(uint64_t ***)ptr;
    BOOL v81 = (uint64_t **)*((void *)ptr + 1);
    if (*(uint64_t ***)ptr != v81)
    {
      uint64_t v78 = v8 + v9;
      NSUInteger v79 = location + length;
      do
      {
        char v82 = v11;
        double v12 = (TSWPLineFragment *)*v11;
        uint64_t v13 = **v11;
        uint64_t v14 = (*v11)[1];
        unint64_t v15 = TSUIntersectionRangeWithEdge();
        NSUInteger v17 = v15;
        NSUInteger v18 = v16;
        if (v15 != 0x7FFFFFFFFFFFFFFFLL || (!v14 ? (BOOL v19 = v13 == v78) : (BOOL v19 = 0), v19))
        {
          if (v15 + v16 >= v79) {
            NSUInteger v20 = v79;
          }
          else {
            NSUInteger v20 = v15 + v16;
          }
          if (v15 < v20)
          {
            NSUInteger v21 = v15;
            do
            {
              uint64_t v92 = 0x1000000;
              v93[0] = 0;
              *(_DWORD *)((char *)v93 + 7) = 0;
              -[TSWPStorage attributesAtCharIndex:attributesOfInterest:attributesTable:effectiveRange:](self->_storage, "attributesAtCharIndex:attributesOfInterest:attributesTable:effectiveRange:", v21, &v92, v91, &v90, v78);
              v94.NSUInteger location = v17;
              v94.NSUInteger length = v18;
              NSRange v95 = NSIntersectionRange(v94, v90);
              v96.NSUInteger location = range2;
              v96.NSUInteger length = v7;
              NSRange v22 = NSIntersectionRange(v95, v96);
              if (v22.length)
              {
                double v23 = TSWPLineFragment::glyphRectForLineRange(v12, v22, (TSWPStorage *)self, 1);
                double v25 = v24;
                double v27 = v26;
                double v29 = v28;
                TSWPLineFragment::emphasisMarkRectForLineRange(v12, v22);
                CGFloat x = v97.origin.x;
                CGFloat y = v97.origin.y;
                CGFloat width = v97.size.width;
                CGFloat height = v97.size.height;
                if (!CGRectIsEmpty(v97))
                {
                  v98.origin.CGFloat x = v23;
                  v98.origin.CGFloat y = v25;
                  v98.size.CGFloat width = v27;
                  v98.size.CGFloat height = v29;
                  v116.origin.CGFloat x = x;
                  v116.origin.CGFloat y = y;
                  v116.size.CGFloat width = width;
                  v116.size.CGFloat height = height;
                  CGRect v99 = CGRectUnion(v98, v116);
                  double v23 = v99.origin.x;
                  double v25 = v99.origin.y;
                  double v27 = v99.size.width;
                  double v29 = v99.size.height;
                }
                v100.origin.CGFloat x = v23;
                v100.origin.CGFloat y = v25;
                v100.size.CGFloat width = v27;
                v100.size.CGFloat height = v29;
                if (!CGRectIsEmpty(v100))
                {
                  v101.origin.CGFloat x = v23;
                  v101.origin.CGFloat y = v25;
                  v101.size.CGFloat width = v27;
                  v101.size.CGFloat height = v29;
                  CGRect v102 = CGRectIntegral(v101);
                  double v23 = v102.origin.x;
                  double v25 = v102.origin.y;
                  double v34 = v102.size.width;
                  double v29 = v102.size.height;
                  double MaxX = CGRectGetMaxX(v102);
                  if (MaxX == rint(CGRectGetMaxX(self->_frameBounds)) + -1.0) {
                    double v27 = v34 + 1.0;
                  }
                  else {
                    double v27 = v34;
                  }
                }
                id v36 = [(TSWPStorage *)self->_storage valueForProperty:22 atCharIndex:v22.location effectiveRange:0];
                id v37 = v36;
                if (!v36 || ![v36 unsignedIntValue]) {
                  id v37 = [(TSWPStorage *)self->_storage valueForProperty:26 atCharIndex:v22.location effectiveRange:0];
                }
                if ([v37 unsignedIntValue])
                {
                  TSWPLineFragment::rectsForLineRange(v12, v22, 0, 1, 1, 0, (double **)__p);
                  TSWPUnionRects((CGRect **)__p);
                  CGFloat v39 = v38;
                  CGFloat v41 = v40;
                  CGFloat v43 = v42;
                  CGFloat v45 = v44;
                  if (__p[0])
                  {
                    __p[1] = __p[0];
                    operator delete(__p[0]);
                  }
                  v103.origin.CGFloat x = v23;
                  v103.origin.CGFloat y = v25;
                  v103.size.CGFloat width = v27;
                  v103.size.CGFloat height = v29;
                  v117.origin.CGFloat x = v39;
                  v117.origin.CGFloat y = v41;
                  v117.size.CGFloat width = v43;
                  v117.size.CGFloat height = v45;
                  CGRect v104 = CGRectUnion(v103, v117);
                  double v23 = v104.origin.x;
                  double v25 = v104.origin.y;
                  double v27 = v104.size.width;
                  double v29 = v104.size.height;
                }
                if ((*((unsigned char *)v12 + 24) & 0x20) != 0)
                {
                  id v46 = [(TSWPStorage *)self->_storage valueForProperty:40 atCharIndex:v22.location effectiveRange:0];
                  double v47 = v46;
                  if (v46)
                  {
                    if ([v46 isEnabled])
                    {
                      objc_msgSend(v47, "shadowBoundsForRect:", v23, v25, v27, v29);
                      double v23 = v48;
                      double v25 = v49;
                      double v27 = v50;
                      double v29 = v51;
                    }
                  }
                }
                v105.origin.CGFloat x = v23;
                v105.origin.CGFloat y = v25;
                v105.size.CGFloat width = v27;
                v105.size.CGFloat height = v29;
                v118.origin.CGFloat y = v86;
                v118.origin.CGFloat x = v87;
                v118.size.CGFloat height = range2_8;
                v118.size.CGFloat width = v85;
                CGRect v106 = CGRectUnion(v105, v118);
                CGFloat v86 = v106.origin.y;
                CGFloat v87 = v106.origin.x;
                CGFloat range2_8 = v106.size.height;
                CGFloat v85 = v106.size.width;
              }
              if (v21 + 1 > v90.length + v90.location) {
                ++v21;
              }
              else {
                NSUInteger v21 = v90.length + v90.location;
              }
            }
            while (v21 < v20);
          }
          if ((*((unsigned char *)v12 + 25) & 0x10) != 0) {
            TSWPLineFragment::rightMostCharIndex(v12);
          }
          else {
            TSWPLineFragment::leftMostCharIndex(v12);
          }
          double v52 = v82;
          if (!a4 || !*((void *)v12 + 22)) {
            goto LABEL_50;
          }
          if (TSUIntersectionRangeWithEdge() != 0x7FFFFFFFFFFFFFFFLL)
          {
            TSWPLineFragment::labelRect(v12);
            double v55 = v54;
            double v57 = v56;
            double v59 = v58;
            double v61 = v60;
            uint64_t v62 = *((void *)v12 + 22);
            CGRect v63 = *(const __CTLine **)(v62 + 16);
            if (v63)
            {
              FakeContext = (CGContext *)TSWPLineFragment::GetFakeContext(v53);
              CGRect ImageBounds = CTLineGetImageBounds(v63, FakeContext);
              double v65 = ImageBounds.origin.y;
              CGFloat v66 = ImageBounds.size.width;
              double v67 = ImageBounds.size.height;
              v119.origin.CGFloat x = TSWPLineFragment::labelTextPosition(v12) + ImageBounds.origin.x;
              v119.origin.CGFloat y = v68 - v65 - v67;
              v108.origin.CGFloat x = v55;
              v108.origin.CGFloat y = v57;
              v108.size.CGFloat width = v59;
              v108.size.CGFloat height = v61;
              v119.size.CGFloat width = v66;
              v119.size.CGFloat height = v67;
              CGRect v109 = CGRectUnion(v108, v119);
              double v55 = v109.origin.x;
              double v57 = v109.origin.y;
              double v59 = v109.size.width;
              double v61 = v109.size.height;
            }
            long long v69 = *(void **)(v62 + 32);
            if (objc_msgSend(v69, "isEnabled", v78))
            {
              objc_msgSend(v69, "shadowBoundsForRect:", v55, v57, v59, v61);
              double v55 = v70;
              double v57 = v71;
              double v59 = v72;
              double v61 = v73;
            }
            v110.origin.CGFloat y = v86;
            v110.origin.CGFloat x = v87;
            v110.size.CGFloat height = range2_8;
            v110.size.CGFloat width = v85;
            v120.origin.CGFloat x = v55;
            v120.origin.CGFloat y = v57;
            v120.size.CGFloat width = v59;
            v120.size.CGFloat height = v61;
            CGRect v111 = CGRectUnion(v110, v120);
            CGFloat v86 = v111.origin.y;
            CGFloat v87 = v111.origin.x;
            CGFloat range2_8 = v111.size.height;
            CGFloat v85 = v111.size.width;
          }
        }
        double v52 = v82;
LABEL_50:
        double v11 = v52 + 2;
      }
      while (v11 != v81);
    }
    v112.origin.CGFloat y = v86;
    v112.origin.CGFloat x = v87;
    v112.size.CGFloat height = range2_8;
    v112.size.CGFloat width = v85;
    if (!CGRectIsNull(v112))
    {
      if (self) {
        [(TSWPColumn *)self transformFromWP];
      }
      else {
        memset(&v88, 0, sizeof(v88));
      }
      v113.origin.CGFloat y = v86;
      v113.origin.CGFloat x = v87;
      v113.size.CGFloat height = range2_8;
      v113.size.CGFloat width = v85;
      CGRect v114 = CGRectApplyAffineTransform(v113, &v88);
      CGFloat v86 = v114.origin.y;
      CGFloat v87 = v114.origin.x;
      CGFloat range2_8 = v114.size.height;
      CGFloat v85 = v114.size.width;
    }
  }
  double v75 = v86;
  double v74 = v87;
  double v77 = range2_8;
  double v76 = v85;
  result.size.CGFloat height = v77;
  result.size.CGFloat width = v76;
  result.origin.CGFloat y = v75;
  result.origin.CGFloat x = v74;
  return result;
}

- (CGRect)glyphRectForRubyFieldAtCharIndex:(unint64_t)a3 glyphRange:(_NSRange)a4
{
  double v4 = *MEMORY[0x263F001A0];
  double v5 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A0] + 24);
  ptr = self->_lineFragmentArray.__ptr_;
  uint64_t v9 = *(TSWPLineFragment ***)ptr;
  double v10 = (TSWPLineFragment **)*((void *)ptr + 1);
  while (v9 != v10)
  {
    unint64_t v11 = *(void *)*v9;
    BOOL v13 = a3 >= v11;
    unint64_t v12 = a3 - v11;
    BOOL v13 = !v13 || v12 >= *((void *)*v9 + 1);
    if (!v13)
    {
      double v4 = TSWPLineFragment::glyphRectForRubyField(*v9, a3, a4);
      break;
    }
    v9 += 2;
  }
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (unint64_t)glyphCountForRubyFieldAtCharIndex:(unint64_t)a3
{
  ptr = self->_lineFragmentArray.__ptr_;
  double v4 = *(unint64_t ***)ptr;
  double v5 = (unint64_t **)*((void *)ptr + 1);
  while (v4 != v5)
  {
    double v6 = *v4;
    unint64_t v7 = **v4;
    BOOL v9 = a3 >= v7;
    unint64_t v8 = a3 - v7;
    BOOL v9 = !v9 || v8 >= (*v4)[1];
    if (!v9)
    {
      for (unint64_t i = v6[28]; i != v6[29]; i += 48)
      {
        if (*(void *)(i + 24) == a3) {
          return CTLineGetGlyphCount(*(CTLineRef *)i);
        }
      }
      return 0;
    }
    v4 += 2;
  }
  return 0;
}

- (CGRect)columnRectForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  CGFloat x = *MEMORY[0x263F001A0];
  CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
  NSRange v30 = *(NSRange *)&self->_startCharIndex;
  v28.NSUInteger location = location;
  v28.NSUInteger length = length;
  if (NSIntersectionRange(v28, v30).length)
  {
    ptr = self->_lineFragmentArray.__ptr_;
    unint64_t v11 = *(NSRange ***)ptr;
    unint64_t v12 = (NSRange **)*((void *)ptr + 1);
    while (v11 != v12)
    {
      BOOL v13 = *v11;
      v29.NSUInteger location = location;
      v29.NSUInteger length = length;
      NSRange v14 = NSIntersectionRange(v29, **v11);
      if (v14.length)
      {
        TSWPLineFragment::rectsForLineRange((TSWPLineFragment *)v13, v14, 0, 1, 1, 0, (double **)__p);
        TSWPUnionRects((CGRect **)__p);
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        v31.origin.CGFloat x = x;
        v31.origin.CGFloat y = y;
        v31.size.CGFloat width = width;
        v31.size.CGFloat height = height;
        v34.origin.CGFloat x = v16;
        v34.origin.CGFloat y = v18;
        v34.size.CGFloat width = v20;
        v34.size.CGFloat height = v22;
        CGRect v32 = CGRectUnion(v31, v34);
        CGFloat x = v32.origin.x;
        CGFloat y = v32.origin.y;
        CGFloat width = v32.size.width;
        CGFloat height = v32.size.height;
      }
      v11 += 2;
    }
  }
  double v23 = self->_frameBounds.origin.x;
  double v24 = self->_frameBounds.size.width;
  double v25 = y;
  double v26 = height;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v23;
  return result;
}

- (double)topOfLineAtCharIndex:(unint64_t)a3
{
  CGFloat v5 = *MEMORY[0x263F001A8];
  CGFloat v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  unint64_t v9 = [(TSWPColumn *)self range];
  if (a3 < v9 || a3 - v9 >= v10)
  {
    if (v9 + v10 == a3)
    {
      uint64_t Object = (TSWPLineFragment *)TSWPLineFragmentArray::lastObject(self->_lineFragmentArray.__ptr_);
      if (Object)
      {
        v24.NSUInteger location = a3;
        v24.NSUInteger length = 0;
        TSWPLineFragment::rectsForLineRange(Object, v24, 0, 1, 1, 0, (double **)__p);
        TSWPUnionRects((CGRect **)__p);
        CGFloat v5 = v16;
        CGFloat v6 = v17;
        CGFloat v7 = v18;
        CGFloat v8 = v19;
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      else
      {
        CGFloat v20 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v21 = [NSString stringWithUTF8String:"-[TSWPColumn topOfLineAtCharIndex:]"];
        [v20 handleFailureInFunction:v21, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 1448, @"should have a line fragment, even in an empty column" file lineNumber description];
      }
    }
  }
  else
  {
    -[TSWPColumn columnRectForRange:](self, "columnRectForRange:", a3, 1);
    CGFloat v5 = v11;
    CGFloat v6 = v12;
    CGFloat v7 = v13;
    CGFloat v8 = v14;
  }
  v25.origin.CGFloat x = v5;
  v25.origin.CGFloat y = v6;
  v25.size.CGFloat width = v7;
  v25.size.CGFloat height = v8;
  return CGRectGetMinY(v25);
}

- (CGRect)typographicBounds
{
  CGFloat v3 = *MEMORY[0x263F001A0];
  CGFloat v4 = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat v5 = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat v6 = *(double *)(MEMORY[0x263F001A0] + 24);
  ptr = self->_lineFragmentArray.__ptr_;
  CGFloat v8 = *(TSWPLineFragment ***)ptr;
  unint64_t v9 = (TSWPLineFragment **)*((void *)ptr + 1);
  if (*(TSWPLineFragment ***)ptr == v9) {
    goto LABEL_6;
  }
  do
  {
    unint64_t v10 = *v8;
    double x = TSWPLineFragment::textRect(*v8, 0);
    CGFloat y = v12;
    CGFloat width = v14;
    CGFloat height = v16;
    if (*((void *)v10 + 22))
    {
      TSWPLineFragment::labelRect(v10);
      v29.origin.double x = v18;
      v29.origin.CGFloat y = v19;
      v29.size.CGFloat width = v20;
      v29.size.CGFloat height = v21;
      v23.origin.double x = x;
      v23.origin.CGFloat y = y;
      v23.size.CGFloat width = width;
      v23.size.CGFloat height = height;
      CGRect v24 = CGRectUnion(v23, v29);
      double x = v24.origin.x;
      CGFloat y = v24.origin.y;
      CGFloat width = v24.size.width;
      CGFloat height = v24.size.height;
    }
    v25.origin.double x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    v30.origin.double x = v3;
    v30.origin.CGFloat y = v4;
    v30.size.CGFloat width = v5;
    v30.size.CGFloat height = v6;
    CGRect v26 = CGRectUnion(v25, v30);
    CGFloat v3 = v26.origin.x;
    CGFloat v4 = v26.origin.y;
    CGFloat v5 = v26.size.width;
    CGFloat v6 = v26.size.height;
    v8 += 2;
  }
  while (v8 != v9);
  if (self) {
LABEL_6:
  }
    [(TSWPColumn *)self transformFromWP];
  else {
    memset(&v22, 0, sizeof(v22));
  }
  v27.origin.double x = v3;
  v27.origin.CGFloat y = v4;
  v27.size.CGFloat width = v5;
  v27.size.CGFloat height = v6;
  return CGRectApplyAffineTransform(v27, &v22);
}

- (CGRect)typographicBoundsForCell
{
  CGFloat v3 = *MEMORY[0x263F001A0];
  CGFloat v4 = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat v5 = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat v6 = *(double *)(MEMORY[0x263F001A0] + 24);
  ptr = self->_lineFragmentArray.__ptr_;
  CGFloat v8 = *(TSWPLineFragment ***)ptr;
  unint64_t v9 = (TSWPLineFragment **)*((void *)ptr + 1);
  if (*(TSWPLineFragment ***)ptr == v9) {
    goto LABEL_6;
  }
  do
  {
    unint64_t v10 = *v8;
    double x = TSWPLineFragment::textRect(*v8, 0);
    CGFloat y = v12;
    CGFloat width = v14;
    CGFloat height = v16;
    if (*((void *)v10 + 22))
    {
      TSWPLineFragment::labelRect(v10);
      v29.origin.double x = v18;
      v29.origin.CGFloat y = v19;
      v29.size.CGFloat width = v20;
      v29.size.CGFloat height = v21;
      v23.origin.double x = x;
      v23.origin.CGFloat y = y;
      v23.size.CGFloat width = width;
      v23.size.CGFloat height = height;
      CGRect v24 = CGRectUnion(v23, v29);
      double x = v24.origin.x;
      CGFloat y = v24.origin.y;
      CGFloat width = v24.size.width;
      CGFloat height = v24.size.height;
    }
    v25.origin.double x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    v30.origin.double x = v3;
    v30.origin.CGFloat y = v4;
    v30.size.CGFloat width = v5;
    v30.size.CGFloat height = v6;
    CGRect v26 = CGRectUnion(v25, v30);
    CGFloat v3 = v26.origin.x;
    CGFloat v4 = v26.origin.y;
    CGFloat v5 = v26.size.width;
    CGFloat v6 = v26.size.height;
    v8 += 2;
  }
  while (v8 != v9);
  if (self) {
LABEL_6:
  }
    [(TSWPColumn *)self transformFromWP];
  else {
    memset(&v22, 0, sizeof(v22));
  }
  v27.origin.double x = v3;
  v27.origin.CGFloat y = v4;
  v27.size.CGFloat width = v5;
  v27.size.CGFloat height = v6;
  return CGRectApplyAffineTransform(v27, &v22);
}

- (id)lineSelectionsForSelection:(id)a3
{
  CGFloat v5 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:1];
  startCharIndedouble x = self->_startCharIndex;
  NSUInteger characterCount = self->_characterCount;
  v27.NSUInteger location = [a3 range];
  v28.NSUInteger location = startCharIndex;
  v28.NSUInteger length = characterCount;
  NSRange v8 = NSIntersectionRange(v27, v28);
  if (v8.length)
  {
    ptr = self->_lineFragmentArray.__ptr_;
    unint64_t v10 = *(NSRange ***)ptr;
    double v11 = (NSRange **)*((void *)ptr + 1);
    if (*(NSRange ***)ptr != v11)
    {
      NSUInteger v12 = v8.length + v8.location - 1;
      while (1)
      {
        while (1)
        {
          NSUInteger location = (*v10)->location;
          NSUInteger length = (*v10)->length;
          if (v8.location < location || v8.location - location >= length) {
            break;
          }
          CGFloat v18 = [TSWPSelection alloc];
          v29.NSUInteger location = location;
          v29.NSUInteger length = length;
          NSRange v19 = NSIntersectionRange(v8, v29);
          CGFloat v20 = -[TSWPSelection initWithRange:](v18, "initWithRange:", v19.location, v19.length);
          [v5 addObject:v20];

          BOOL v21 = v12 - location < length && v12 >= location;
          v10 += 2;
          if (v21 || v10 == v11) {
            return v5;
          }
        }
        if (v12 >= location && v12 - location < length) {
          break;
        }
        if (NSIntersectionRange(v8, **v10).length)
        {
          double v17 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", location, length);
          [v5 addObject:v17];
        }
        v10 += 2;
        if (v10 == v11) {
          return v5;
        }
      }
      CGRect v23 = [TSWPSelection alloc];
      v30.NSUInteger location = location;
      v30.NSUInteger length = length;
      NSRange v24 = NSIntersectionRange(v8, v30);
      CGRect v25 = -[TSWPSelection initWithRange:](v23, "initWithRange:", v24.location, v24.length);
      [v5 addObject:v25];
    }
  }
  return v5;
}

- (CGRect)firstRectForSelection:(id)a3 includeSpaceAfter:(BOOL)a4 includeSpaceBefore:(BOOL)a5 includeLeading:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  double v11 = *MEMORY[0x263F001A0];
  double v12 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v13 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v14 = *(double *)(MEMORY[0x263F001A0] + 24);
  uint64_t v15 = [a3 range];
  LOWORD(v26) = 0;
  id v17 = -[TSWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:", v15, v16, [a3 type], v8, v7, v6, v26, 0, 0);
  if ([v17 count])
  {
    objc_msgSend((id)objc_msgSend(v17, "firstObject"), "CGRectValue");
    double v11 = v18;
    double v12 = v19;
    double v13 = v20;
    double v14 = v21;
  }
  double v22 = v11;
  double v23 = v12;
  double v24 = v13;
  double v25 = v14;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.double x = v22;
  return result;
}

- (id)rectsForSelection:(id)a3
{
  if (([a3 isValid] & 1) == 0)
  {
    CGFloat v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPColumn rectsForSelection:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 1565, @"invalid text selection");
  }
  uint64_t v7 = [a3 range];
  uint64_t v9 = v8;
  uint64_t v10 = [a3 type];

  return -[TSWPColumn rectsForSelectionRange:selectionType:](self, "rectsForSelectionRange:selectionType:", v7, v9, v10);
}

- (id)rectsForSelectionRange:(_NSRange)a3
{
  return -[TSWPColumn rectsForSelectionRange:selectionType:](self, "rectsForSelectionRange:selectionType:", a3.location, a3.length, 0);
}

- (const)pColumnEndingPartitionedLineFragmentInSelectionRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  CGRect result = [(TSWPColumn *)self countLines];
  if (result)
  {
    CGRect result = [(TSWPColumn *)self lineFragmentAtIndex:(char *)result - 1];
    if ((*((_DWORD *)result + 6) & 0x101) == 1)
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

- (id)pMutableRectsForSelectionRange:(_NSRange)a3 selectionType:(int)a4 includeSpaceAfter:(BOOL)a5 includeSpaceBefore:(BOOL)a6 includeLeading:(BOOL)a7 forParagraphMode:(BOOL)a8 includeRuby:(BOOL)a9 inranges:(id)a10 outranges:(id *)a11
{
  BOOL range1_12 = a6;
  BOOL v113 = a5;
  NSUInteger length = a3.length;
  NSUInteger range1 = a3.location;
  uint64_t v126 = *MEMORY[0x263EF8340];
  double v13 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:1];
  if (a11)
  {
    CGRect v108 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:1];
    *a11 = v108;
  }
  else
  {
    CGRect v108 = 0;
  }
  v127.NSUInteger location = range1;
  NSUInteger v97 = length;
  v127.NSUInteger length = length;
  NSRange v15 = NSIntersectionRange(v127, *(NSRange *)&self->_startCharIndex);
  if (v15.length)
  {
    obunint64_t j = a10;
    if (a10)
    {
      int v16 = a4;
      if (a4 == 7) {
        int v16 = 0;
      }
      a4 = v16;
    }
    else
    {
      obunint64_t j = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", range1, length));
    }
    ptr = self->_lineFragmentArray.__ptr_;
    double v18 = *(NSUInteger ***)ptr;
    CGRect v103 = (NSUInteger **)*((void *)ptr + 1);
    if (*(NSUInteger ***)ptr != v103)
    {
      uint64_t v101 = 0;
      NSUInteger v109 = length + range1 - 1;
      if (v108) {
        double v19 = (NSArray **)&v117;
      }
      else {
        double v19 = 0;
      }
      CGRect v99 = v13;
      NSUInteger v100 = v15.length + v15.location - 1;
      double v20 = -1.0;
      double v102 = 0.0;
      CGRect v98 = self;
      do
      {
        while (1)
        {
          double v21 = *v18;
          NSUInteger v106 = **v18;
          CGRect v104 = v18;
          NSUInteger v105 = (*v18)[1];
          if (*((double *)*v18 + 4) + *((double *)*v18 + 5) != v20)
          {
            uint64_t v101 = [v13 count];
            CGFloat MaxY = CGRectGetMaxY(*(CGRect *)(v21 + 6));
            double v20 = *((double *)v21 + 4) + *((double *)v21 + 5);
            double v23 = MaxY - (v20 + *((double *)v21 + 17));
            if (*((double *)v21 + 19) < v23) {
              double v23 = *((double *)v21 + 19);
            }
            double v102 = fmax(v23, 0.0);
          }
          v128.NSUInteger length = v105;
          v128.NSUInteger location = v106;
          NSRange v24 = NSIntersectionRange(v15, v128);
          if (v24.length) {
            break;
          }
          double v18 = v104 + 2;
          if (v104 + 2 == v103) {
            goto LABEL_77;
          }
        }
        if (a8)
        {
          objc_msgSend(v13, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", *((double *)v21 + 6), *((double *)v21 + 7), *((double *)v21 + 8), *((double *)v21 + 9)));
          if (v108) {
            objc_msgSend(v108, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", *v21, v21[1]));
          }
        }
        else
        {
          double v25 = (void *)[MEMORY[0x263EFF980] array];
          __p = 0;
          __dst = 0;
          uint64_t v124 = 0;
          long long v118 = 0u;
          long long v119 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          uint64_t v26 = [obj countByEnumeratingWithState:&v118 objects:v125 count:16];
          if (v26)
          {
            uint64_t v27 = *(void *)v119;
            do
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v119 != v27) {
                  objc_enumerationMutation(obj);
                }
                NSRange v29 = *(void **)(*((void *)&v118 + 1) + 8 * i);
                uint64_t v117 = 0;
                v129.NSUInteger location = [v29 rangeValue];
                v129.NSUInteger length = v30;
                NSRange v31 = NSIntersectionRange(v24, v129);
                v32.NSUInteger length = v31.length;
                if (v31.length)
                {
                  if (a4 != 7
                    || (range1 >= v31.location ? (BOOL v33 = range1 - v31.location >= v31.length) : (BOOL v33 = 1),
                        v33 && (v109 >= v31.location ? (BOOL v34 = v109 - v31.location >= v31.length) : (BOOL v34 = 1), v34)))
                  {
                    v32.NSUInteger location = v31.location;
                    TSWPLineFragment::rectsForLineRange((TSWPLineFragment *)v21, v32, v19, v113, range1_12, a9, v116);
                  }
                  else
                  {
                    v32.NSUInteger location = v31.location;
                    TSWPLineFragment::rectsForVisualRange((TSWPLineFragment *)v21, v32, range1, v109, v113, range1_12, a9, v116, v19);
                  }
                  uint64_t v35 = (char *)v116[0];
                  id v36 = (char *)v116[1];
                  [v25 addObjectsFromArray:v117];
                  std::vector<CGRect>::__insert_with_size[abi:ne180100]<std::__wrap_iter<CGRect*>,std::__wrap_iter<CGRect*>>((uint64_t)&__p, (uint64_t)__dst, v35, v36, (v36 - v35) >> 5);
                  if (v35) {
                    operator delete(v35);
                  }
                }
              }
              uint64_t v26 = [obj countByEnumeratingWithState:&v118 objects:v125 count:16];
            }
            while (v26);
          }
          double v13 = v99;
          unint64_t v37 = [v99 count];
          if (v108)
          {
            CGFloat v39 = __p;
            double v38 = __dst;
            if ([v25 count] != (v38 - v39) >> 5)
            {
              double v40 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
              uint64_t v41 = [NSString stringWithUTF8String:"-[TSWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:]"];
              uint64_t v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"];
              objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, v42, 1689, @"Mismatch between rect & range count: %lu vs. %lu", v37, ((unsigned char *)__dst - (unsigned char *)__p) >> 5);
            }
          }
          CGFloat v43 = (double *)__p;
          double v44 = (double *)__dst;
          if (__p != __dst)
          {
            unsigned int v45 = 0;
            do
            {
              double v46 = *v43;
              double v47 = v43[1];
              double v49 = v43[2];
              double v48 = v43[3];
              if (a7)
              {
                double v50 = *((double *)v21 + 4);
                double v51 = *((double *)v21 + 5);
                double v52 = *((double *)v21 + 17);
                double v53 = *((double *)v21 + 19);
                double v54 = *v43;
                uint64_t v55 = *((void *)v43 + 1);
                uint64_t v56 = *((void *)v43 + 2);
                double v57 = CGRectGetMaxY(*(CGRect *)(&v48 - 3));
                if (v57 < v50 + v51 + v52 + v53) {
                  double v57 = v50 + v51 + v52 + v53;
                }
                double v48 = v57 - v47;
              }
              objc_msgSend(v99, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v46, v47, v49, v48));
              if (v108)
              {
                double v59 = __p;
                double v58 = __dst;
                if ([v25 count] == (v58 - v59) >> 5) {
                  objc_msgSend(v108, "addObject:", objc_msgSend(v25, "objectAtIndexedSubscript:", v45++));
                }
              }
              v43 += 4;
            }
            while (v43 != v44);
          }
          if (a4 == 2)
          {
            TSWPLineFragment::labelRect((TSWPLineFragment *)v21);
            self = v98;
            CGFloat v61 = v60;
            CGFloat v63 = v62;
            CGFloat v65 = v64;
            CGFloat v67 = v66;
          }
          else
          {
            CGFloat v61 = *MEMORY[0x263F001A0];
            CGFloat v63 = *(double *)(MEMORY[0x263F001A0] + 8);
            CGFloat v65 = *(double *)(MEMORY[0x263F001A0] + 16);
            CGFloat v67 = *(double *)(MEMORY[0x263F001A0] + 24);
            self = v98;
          }
          v130.origin.double x = v61;
          v130.origin.double y = v63;
          v130.size.CGFloat width = v65;
          v130.size.double height = v67;
          if (!CGRectIsEmpty(v130) && v37 < [v99 count])
          {
            objc_msgSend((id)objc_msgSend(v99, "objectAtIndexedSubscript:", v37), "CGRectValue");
            double y = v131.origin.y;
            double height = v131.size.height;
            v135.origin.double x = v61;
            v135.origin.double y = v63;
            v135.size.CGFloat width = v65;
            v135.size.double height = v67;
            CGRect v132 = CGRectUnion(v131, v135);
            objc_msgSend(v99, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v132.origin.x, y, v132.size.width, height), v37);
          }
          if (__p)
          {
            __dst = __p;
            operator delete(__p);
          }
        }
        BOOL v70 = v100 - v106 < v105 && v100 >= v106;
        double v18 = v104 + 2;
      }
      while (!v70 && v18 != v103);
LABEL_77:
      double v14 = v102;
      if (v102 > 0.0 && v113)
      {
        unint64_t v72 = objc_msgSend(v13, "count", v102);
        for (unint64_t j = v101; j < v72; unint64_t j = v74 + 1)
        {
          unint64_t v74 = j;
          objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:"), "CGRectValue");
          objc_msgSend(v13, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:"), v74);
          unint64_t v72 = [v13 count];
        }
      }
    }
  }
  double v75 = -[TSWPColumn pColumnEndingPartitionedLineFragmentInSelectionRange:](self, "pColumnEndingPartitionedLineFragmentInSelectionRange:", range1, v97, v14);
  double v76 = (TSWPLineFragment *)v75;
  if (v75)
  {
    double v77 = *((double *)v75 + 7);
    double v78 = *((double *)v75 + 9);
    if (a8)
    {
      double v79 = *((double *)v75 + 6);
      double v80 = *((double *)v75 + 8);
    }
    else
    {
      double v81 = v113
          ? *((double *)v75 + 9)
          : *((double *)v75 + 17) + *((double *)v75 + 16) + *((double *)v75 + 14) + *((double *)v75 + 18);
      double v82 = range1_12 ? -0.0 : *((double *)v75 + 14);
      double v83 = range1_12 ? 0.0 : *((double *)v75 + 14);
      uint64_t v84 = *v75;
      double v79 = TSWPLineFragment::wpOffsetForCharIndex((TSWPLineFragment *)v75, *v75, 1, 1, 0);
      double v85 = TSWPLineFragment::wpOffsetForCharIndex(v76, v84 + 1, 1, 1, 0);
      double v77 = v77 + v82;
      double v78 = v81 - v83;
      double v80 = v85 - v79;
    }
    objc_msgSend(v13, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v79, v77, v80, v78));
    if (v108) {
      objc_msgSend(v108, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", *(void *)v76, *((void *)v76 + 1)));
    }
  }
  if ([(TSWPColumn *)self textIsVertical])
  {
    uint64_t v86 = [v13 count];
    if (v86)
    {
      for (uint64_t k = 0; k != v86; ++k)
      {
        objc_msgSend((id)objc_msgSend(v13, "objectAtIndexedSubscript:", k), "CGRectValue");
        CGFloat v89 = v88;
        CGFloat v91 = v90;
        CGFloat v93 = v92;
        CGFloat v95 = v94;
        if (self) {
          [(TSWPColumn *)self transformFromWP];
        }
        else {
          memset(&v115, 0, sizeof(v115));
        }
        v133.origin.double x = v89;
        v133.origin.double y = v91;
        v133.size.CGFloat width = v93;
        v133.size.double height = v95;
        CGRect v134 = CGRectApplyAffineTransform(v133, &v115);
        objc_msgSend(v13, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v134.origin.x, v134.origin.y, v134.size.width, v134.size.height), k);
      }
    }
  }
  return v13;
}

- (id)rectsForSelectionRanges:(id)a3 selectionType:(int)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v6 = (uint64_t *)MEMORY[0x263F7C7C8];
  NSUInteger v7 = *MEMORY[0x263F7C7C8];
  NSUInteger v8 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(a3);
        }
        uint64_t v14 = *v6;
        uint64_t v13 = v6[1];
        uint64_t location = [*(id *)(*((void *)&v23 + 1) + 8 * v12) rangeValue];
        v17.uint64_t location = location;
        v17.NSUInteger length = length;
        if (v7 != v14 || v8 != v13)
        {
          v29.uint64_t location = v7;
          v29.NSUInteger length = v8;
          NSRange v19 = NSUnionRange(v29, v17);
          NSUInteger length = v19.length;
          uint64_t location = v19.location;
        }
        NSUInteger v7 = location;
        NSUInteger v8 = length;
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }
  LOWORD(v21) = 0;
  return [(TSWPColumn *)self pMutableRectsForSelectionRange:v7 selectionType:v8 includeSpaceAfter:a4 includeSpaceBefore:1 includeLeading:1 forParagraphMode:0 includeRuby:v21 inranges:a3 outranges:0];
}

- (id)rectsForSelectionRange:(_NSRange)a3 selectionType:(int)a4
{
  return -[TSWPColumn rectsForSelectionRange:selectionType:forParagraphMode:](self, "rectsForSelectionRange:selectionType:forParagraphMode:", a3.location, a3.length, *(void *)&a4, 0);
}

- (id)rectsForSelectionRange:(_NSRange)a3 selectionType:(int)a4 forParagraphMode:(BOOL)a5
{
  LOWORD(v6) = a5;
  return [(TSWPColumn *)self pMutableRectsForSelectionRange:a3.location selectionType:a3.length includeSpaceAfter:*(void *)&a4 includeSpaceBefore:1 includeLeading:1 forParagraphMode:0 includeRuby:v6 inranges:0 outranges:0];
}

- (id)rectsForSelectionRange:(_NSRange)a3 selectionType:(int)a4 forParagraphMode:(BOOL)a5 includeRuby:(BOOL)a6
{
  BYTE1(v7) = a6;
  LOBYTE(v7) = a5;
  return [(TSWPColumn *)self pMutableRectsForSelectionRange:a3.location selectionType:a3.length includeSpaceAfter:*(void *)&a4 includeSpaceBefore:1 includeLeading:1 forParagraphMode:0 includeRuby:v7 inranges:0 outranges:0];
}

- (id)rectsForSelectionRange:(_NSRange)a3 selectionType:(int)a4 includeSpaceAfter:(BOOL)a5 includeSpaceBefore:(BOOL)a6 includeLeading:(BOOL)a7 forParagraphMode:(BOOL)a8 includeRuby:(BOOL)a9
{
  LOWORD(v10) = __PAIR16__(a9, a8);
  return [(TSWPColumn *)self pMutableRectsForSelectionRange:a3.location selectionType:a3.length includeSpaceAfter:*(void *)&a4 includeSpaceBefore:a5 includeLeading:a6 forParagraphMode:a7 includeRuby:v10 inranges:0 outranges:0];
}

- (id)rectsForSelection:(id)a3 ranges:(id *)a4
{
  uint64_t v7 = [a3 range];
  LOWORD(v10) = 0;
  return -[TSWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:", v7, v8, [a3 type], 1, 1, 0, v10, 0, a4);
}

- (CGRect)erasableRectForSelectionRange:(_NSRange)a3
{
  v18.NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  CGFloat x = *MEMORY[0x263F001A0];
  CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
  NSRange v19 = *(NSRange *)&self->_startCharIndex;
  v18.NSUInteger location = location;
  NSRange v9 = NSIntersectionRange(v18, v19);
  if (v9.length)
  {
    ptr = self->_lineFragmentArray.__ptr_;
    uint64_t v11 = *(NSRange ***)ptr;
    uint64_t v12 = (NSRange **)*((void *)ptr + 1);
    if (*(NSRange ***)ptr != v12)
    {
      do
      {
        uint64_t v13 = *v11;
        if (NSIntersectionRange(v9, **v11).length)
        {
          v22.origin.CGFloat x = x;
          v22.origin.CGFloat y = y;
          v22.size.CGFloat width = width;
          v22.size.CGFloat height = height;
          CGRect v20 = CGRectUnion(*(CGRect *)&v13[5].location, v22);
          CGFloat x = v20.origin.x;
          CGFloat y = v20.origin.y;
          CGFloat width = v20.size.width;
          CGFloat height = v20.size.height;
        }
        v11 += 2;
      }
      while (v11 != v12);
    }
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (id)drawableIntersectionRectsForSelection:(id)a3 inTarget:(id)a4
{
  uint64_t v7 = [a3 range];
  LOWORD(v51) = 0;
  id v9 = -[TSWPColumn pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:](self, "pMutableRectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:inranges:outranges:", v7, v8, [a3 type], 1, 1, 0, v51, 0, 0);
  uint64_t v10 = [v9 count];
  if (v10)
  {
    unint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = 1;
    do
    {
      objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v12), "CGRectValue");
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      if (v12 || [a3 start] < self->_startCharIndex)
      {
        v60.origin.CGFloat x = v15;
        v60.origin.CGFloat y = v17;
        v60.size.CGFloat width = v19;
        v60.size.CGFloat height = v21;
        double MinX = CGRectGetMinX(v60);
        double v23 = MinX - CGRectGetMinX(self->_frameBounds);
        double v15 = v15 - v23;
        double v19 = v19 + v23;
      }
      unint64_t v24 = v12 + 1;
      if (v12 + 1 < v11)
      {
        while (1)
        {
          objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", v12 + 1), "CGRectValue");
          CGFloat x = v61.origin.x;
          CGFloat v26 = v21;
          CGFloat y = v61.origin.y;
          CGFloat width = v61.size.width;
          CGFloat height = v61.size.height;
          double rect = CGRectGetMinY(v61);
          v62.origin.CGFloat x = v15;
          v62.origin.CGFloat y = v17;
          v62.size.CGFloat width = v19;
          v62.size.CGFloat height = v26;
          if (rect != CGRectGetMinY(v62)) {
            break;
          }
          v63.origin.CGFloat x = v15;
          v63.origin.CGFloat y = v17;
          v63.size.CGFloat width = v19;
          v63.size.CGFloat height = v26;
          v71.origin.CGFloat x = x;
          v71.origin.CGFloat y = y;
          v71.size.CGFloat width = width;
          v71.size.CGFloat height = height;
          CGRect v64 = CGRectUnion(v63, v71);
          double v15 = v64.origin.x;
          double v17 = v64.origin.y;
          double v19 = v64.size.width;
          double v21 = v64.size.height;
          [v9 removeObjectAtIndex:v12 + 1];
          if (v24 >= --v11)
          {
            unint64_t v11 = v13;
            goto LABEL_11;
          }
        }
        double v21 = v26;
      }
LABEL_11:
      if (v12 != v11 - 1 || (unint64_t v30 = self->_characterCount + self->_startCharIndex, v30 <= [a3 end]))
      {
        double MaxX = CGRectGetMaxX(self->_frameBounds);
        v65.origin.CGFloat x = v15;
        v65.origin.CGFloat y = v17;
        v65.size.CGFloat width = v19;
        v65.size.CGFloat height = v21;
        double v19 = v19 + MaxX - CGRectGetMaxX(v65);
      }
      objc_msgSend(a4, "rectInRoot:", v15, v17, v19, v21);
      objc_msgSend(v9, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:"), v12);
      ++v13;
      ++v12;
    }
    while (v24 < v11);
  }
  if ((unint64_t)[v9 count] > 1)
  {
    objc_msgSend((id)objc_msgSend(v9, "firstObject"), "CGRectValue");
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    objc_msgSend((id)objc_msgSend(v9, "lastObject"), "CGRectValue");
    double v54 = v41;
    double v55 = v40;
    double v53 = v42;
    double recta = v43;
    objc_msgSend(a4, "rectInRoot:", self->_frameBounds.origin.x, self->_frameBounds.origin.y, self->_frameBounds.size.width, self->_frameBounds.size.height);
    CGFloat v44 = v66.origin.x;
    CGFloat v45 = v66.origin.y;
    CGFloat v46 = v66.size.width;
    CGFloat v47 = v66.size.height;
    double v57 = CGRectGetMinX(v66);
    v67.origin.CGFloat x = v33;
    v67.origin.CGFloat y = v35;
    v67.size.CGFloat width = v37;
    v67.size.CGFloat height = v39;
    double MaxY = CGRectGetMaxY(v67);
    v68.origin.CGFloat x = v44;
    v68.origin.CGFloat y = v45;
    v68.size.CGFloat width = v46;
    v68.size.CGFloat height = v47;
    double v52 = CGRectGetWidth(v68);
    v69.origin.CGFloat x = v55;
    v69.origin.CGFloat y = v54;
    v69.size.CGFloat width = v53;
    v69.size.CGFloat height = recta;
    double MinY = CGRectGetMinY(v69);
    v70.origin.CGFloat x = v33;
    v70.origin.CGFloat y = v35;
    v70.size.CGFloat width = v37;
    v70.size.CGFloat height = v39;
    double v49 = MinY - CGRectGetMaxY(v70);
    [v9 removeAllObjects];
    objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v33, v35, v37, v39));
    objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v57, MaxY, v52, v49));
    objc_msgSend(v9, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v55, v54, v53, recta));
  }
  return v9;
}

- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 pastCenterGoesToNextChar:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 leadingEdge:(BOOL *)a8
{
  return -[TSWPColumn charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:outFragment:leadingEdge:](self, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:outFragment:leadingEdge:", a4, a5, a6, a7, 0, a8, a3.x, a3.y);
}

- (unint64_t)charIndexFromPoint:(CGPoint)a3 allowPastBreak:(BOOL)a4 pastCenterGoesToNextChar:(BOOL)a5 allowNotFound:(BOOL)a6 isAtEndOfLine:(BOOL *)a7 outFragment:(const TSWPLineFragment *)a8 leadingEdge:(BOOL *)a9
{
  BOOL v12 = a6;
  BOOL v13 = a5;
  BOOL v41 = 1;
  if (self)
  {
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    [(TSWPColumn *)self transformToWP];
    a3.CGFloat y = y;
    a3.CGFloat x = x;
    float64x2_t v17 = v38;
    float64x2_t v16 = v39;
    float64x2_t v18 = v40;
  }
  else
  {
    float64x2_t v18 = 0uLL;
    float64x2_t v39 = 0u;
    float64x2_t v40 = 0u;
    float64x2_t v38 = 0u;
    float64x2_t v17 = 0uLL;
    float64x2_t v16 = 0uLL;
  }
  float64x2_t v19 = vaddq_f64(v18, vmlaq_n_f64(vmulq_n_f64(v16, a3.y), v17, a3.x));
  double v37 = 0;
  if (a7) {
    *a7 = 0;
  }
  unint64_t v20 = [(TSWPColumn *)self charIndexFromWPPoint:v13 pastCenterGoesToNextChar:v12 allowNotFound:&v37 outFragment:&v41 leadingEdge:*(_OWORD *)&v19];
  unint64_t v21 = v20;
  if (v37 && v20 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v22 = *((void *)v37 + 1);
    if (v41) {
      unint64_t v23 = v20;
    }
    else {
      unint64_t v23 = v20 + 1;
    }
    if (v22 && v23 == v22 + *(void *)v37)
    {
      unint64_t v24 = v23 - 1;
      uint64_t v25 = [(TSWPStorage *)self->_storage characterAtIndex:v23 - 1];
      int v26 = v25;
      int v27 = IsParagraphBreakingCharacter(v25);
      if (v26 == 8232) {
        int v28 = 1;
      }
      else {
        int v28 = v27;
      }
      if (v28 != 1 || a4)
      {
        if (a7) {
          *a7 = 1;
        }
      }
      else
      {
        BOOL v41 = 1;
        unint64_t v21 = v24;
      }
    }
    if (a8) {
      *a8 = v37;
    }
  }
  if (a9)
  {
    *a9 = v41;
    return v21;
  }
  if (!v41 && v21 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!v37)
    {
      p_storage = (void **)&self->_storage;
      goto LABEL_37;
    }
    int v30 = TSWPLineFragment::writingDirectionForCharIndex(v37, v21);
    NSRange v31 = v37;
    if (a4
      || ((*((unsigned char *)v37 + 25) & 0x10) != 0
        ? (uint64_t v32 = TSWPLineFragment::rightMostCharIndex(v37))
        : (uint64_t v32 = TSWPLineFragment::leftMostCharIndex(v37)),
          (v34 = v32, NSRange v31 = v37, v21 != v34) || (v30 != 1) != (*((unsigned char *)v37 + 25) & 0x10) >> 4))
    {
      p_storage = (void **)((char *)v31 + 184);
LABEL_37:
      if (*p_storage) {
        return TSWPNextCharFromTextSource(v21, *p_storage);
      }
    }
  }
  return v21;
}

- (unint64_t)charIndexForSelectionFromPoint:(CGPoint)a3 isTail:(BOOL)a4
{
  BOOL v4 = a4;
  if (self)
  {
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    [(TSWPColumn *)self transformToWP];
    a3.CGFloat y = y;
    a3.CGFloat x = x;
    float64x2_t v7 = v53;
    float64x2_t v6 = v54;
    float64x2_t v8 = v55;
  }
  else
  {
    float64x2_t v8 = 0uLL;
    float64x2_t v7 = 0uLL;
    float64x2_t v6 = 0uLL;
  }
  float64x2_t v52 = vaddq_f64(v8, vmlaq_n_f64(vmulq_n_f64(v6, a3.y), v7, a3.x));
  if (v52.f64[1] < CGRectGetMinY(self->_frameBounds))
  {
    unint64_t result = self->_startCharIndex;
    if (result == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPColumn charIndexForSelectionFromPoint:isTail:]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPColumn.mm"), 2023, @"column has unexpected start");
      goto LABEL_54;
    }
    return result;
  }
  ptr = self->_lineFragmentArray.__ptr_;
  double v14 = *(unint64_t ***)ptr;
  BOOL v13 = (unint64_t **)*((void *)ptr + 1);
  if (*(unint64_t ***)ptr == v13) {
    goto LABEL_54;
  }
  unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    p_startCharIndeCGFloat x = *v14;
    CGFloat v18 = *((double *)*v14 + 6);
    CGFloat v17 = *((double *)*v14 + 7);
    CGFloat v20 = *((double *)*v14 + 8);
    CGFloat v19 = *((double *)*v14 + 9);
    if ((*((unsigned char *)*v14 + 27) & 2) != 0)
    {
      int v21 = [(TSWPStorage *)self->_storage isWritingDirectionRightToLeftForParagraphAtCharIndex:*p_startCharIndex] ^ v4 ^ 1;
      TSDDistanceToRect(v52.f64[0], v52.f64[1], v18, v17, v20, v19);
      double v23 = v22;
      unint64_t v15 = TSWPLineFragment::charIndexForWPOffsetWithDirection((TSWPLineFragment *)p_startCharIndex, v21, 0, v52.f64[0]);
      if (v23 == 0.0) {
        goto LABEL_51;
      }
      unint64_t v24 = v14[2];
      v14 += 2;
      p_startCharIndeCGFloat x = v24;
      CGFloat v18 = *((double *)v24 + 6);
      CGFloat v17 = *((double *)v24 + 7);
      CGFloat v20 = *((double *)v24 + 8);
      CGFloat v19 = *((double *)v24 + 9);
    }
    uint64_t v25 = 16;
    while (1)
    {
      uint64_t v26 = v25;
      int v27 = (unint64_t **)((char *)v14 + v25);
      if (v27 == v13) {
        break;
      }
      double MinY = CGRectGetMinY(*(CGRect *)(*v27 + 6));
      v56.origin.CGFloat x = v18;
      v56.origin.CGFloat y = v17;
      v56.size.CGFloat width = v20;
      v56.size.CGFloat height = v19;
      CGFloat v29 = CGRectGetMinY(v56);
      uint64_t v25 = v26 + 16;
      if (MinY != v29)
      {
        int v30 = (unint64_t **)((char *)v14 + v26);
        goto LABEL_17;
      }
    }
    int v30 = v13;
LABEL_17:
    v57.origin.CGFloat x = v18;
    v57.origin.CGFloat y = v17;
    v57.size.CGFloat width = v20;
    v57.size.CGFloat height = v19;
    if (v52.f64[1] < CGRectGetMinY(v57)) {
      goto LABEL_51;
    }
    v58.origin.CGFloat x = v18;
    v58.origin.CGFloat y = v17;
    v58.size.CGFloat width = v20;
    v58.size.CGFloat height = v19;
    if (v52.f64[1] <= CGRectGetMaxY(v58)) {
      break;
    }
    unint64_t v31 = p_startCharIndex[1];
    unint64_t v32 = v31 + *p_startCharIndex;
    if (v15 <= v32) {
      unint64_t v33 = v31 + *p_startCharIndex;
    }
    else {
      unint64_t v33 = v15;
    }
    if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v15 = v32;
    }
    else {
      unint64_t v15 = v33;
    }
    if (v4) {
      unint64_t v15 = [(TSWPStorage *)self->_storage previousCharacterIndex:v15];
    }
    v14 += 2;
    if (v14 == v13) {
      goto LABEL_51;
    }
  }
  uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
  if (v14 == v30) {
    goto LABEL_50;
  }
  double v35 = INFINITY;
  while (1)
  {
    p_startCharIndeCGFloat x = *v14;
    if (((*v14)[3] & 0x40) == 0 && ((*v14)[3] & 0x201) != 1) {
      break;
    }
    unint64_t v44 = v34;
LABEL_47:
    v14 += 2;
    uint64_t v34 = v44;
    v26 -= 16;
    if (!v26) {
      goto LABEL_50;
    }
  }
  CGFloat v37 = *((double *)p_startCharIndex + 8);
  CGFloat v36 = *((double *)p_startCharIndex + 9);
  CGFloat v39 = *((double *)p_startCharIndex + 6);
  CGFloat v38 = *((double *)p_startCharIndex + 7);
  int v40 = [(TSWPStorage *)self->_storage isWritingDirectionRightToLeftForParagraphAtCharIndex:*p_startCharIndex];
  TSDDistanceToRect(v52.f64[0], v52.f64[1], v39, v38, v37, v36);
  double v42 = v41;
  unint64_t v43 = TSWPLineFragment::charIndexForWPOffsetWithDirection((TSWPLineFragment *)p_startCharIndex, v40 ^ v4 ^ 1u, 0, v52.f64[0]);
  unint64_t v44 = v43;
  if (v42 != 0.0)
  {
    BOOL v45 = v42 < v35;
    if (v42 >= v35)
    {
      unint64_t v46 = v34;
    }
    else
    {
      double v35 = v42;
      unint64_t v46 = v43;
    }
    if (!v45 || !v4)
    {
      unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v44 = v46;
    }
    else
    {
      v59.origin.CGFloat x = v39;
      v59.origin.CGFloat y = v38;
      v59.size.CGFloat width = v37;
      v59.size.CGFloat height = v36;
      int v48 = v52.f64[0] <= CGRectGetMaxX(v59);
      if (v40 != v48) {
        unint64_t v44 = [(TSWPStorage *)self->_storage previousCharacterIndex:*p_startCharIndex];
      }
      unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      double v35 = v42;
    }
    goto LABEL_47;
  }
  unint64_t v15 = v43;
LABEL_50:
  unint64_t result = v15;
  unint64_t v15 = v34;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_51:
    unint64_t result = v15;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (p_startCharIndex)
      {
        p_NSUInteger characterCount = p_startCharIndex + 1;
        return *p_characterCount + *p_startCharIndex;
      }
LABEL_54:
      p_startCharIndeCGFloat x = &self->_startCharIndex;
      p_NSUInteger characterCount = &self->_characterCount;
      return *p_characterCount + *p_startCharIndex;
    }
  }
  return result;
}

- (unint64_t)charIndexFromWPPoint:(CGPoint)a3 pastCenterGoesToNextChar:(BOOL)a4 allowNotFound:(BOOL)a5 outFragment:(const TSWPLineFragment *)a6 leadingEdge:(BOOL *)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  double y = a3.y;
  double x = a3.x;
  if (a3.y < CGRectGetMinY(self->_frameBounds))
  {
    if (v9)
    {
      uint64_t v14 = 0;
      startCharIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_37;
    }
    startCharIndedouble x = self->_startCharIndex;
    if (TSWPLineFragmentArray::count(self->_lineFragmentArray.__ptr_))
    {
      uint64_t v14 = TSWPLineFragmentArray::objectAtIndex(self->_lineFragmentArray.__ptr_, 0);
      goto LABEL_37;
    }
    goto LABEL_24;
  }
  ptr = self->_lineFragmentArray.__ptr_;
  uint64_t v17 = *(void *)ptr;
  CGFloat v18 = (TSWPLineFragment **)*((void *)ptr + 1);
  startCharIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  if (*(TSWPLineFragment ***)ptr == v18)
  {
LABEL_24:
    uint64_t v14 = 0;
    goto LABEL_37;
  }
  CGFloat v36 = a6;
  CGFloat v37 = a7;
  uint64_t v19 = 0;
  while (1)
  {
    uint64_t v14 = *(void *)(v17 + v19);
    if ((*(_DWORD *)(v14 + 24) & 0x40) != 0 || (*(_DWORD *)(v14 + 24) & 0x201) == 1) {
      goto LABEL_20;
    }
    CGFloat v21 = *(double *)(v14 + 48);
    double v20 = *(double *)(v14 + 56);
    CGFloat v22 = *(double *)(v14 + 64);
    CGFloat v23 = *(double *)(v14 + 72);
    v38.origin.double x = v21;
    v38.origin.double y = v20;
    v38.size.CGFloat width = v22;
    v38.size.CGFloat height = v23;
    double MinY = CGRectGetMinY(v38);
    int v25 = y >= MinY || !v9;
    if (v25 != 1)
    {
LABEL_21:
      startCharIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_36;
    }
    double v26 = MinY;
    if ((*(unsigned char *)(v14 + 27) & 2) != 0)
    {
      v39.origin.double x = v21;
      v39.origin.double y = v20;
      v39.size.CGFloat width = v22;
      v39.size.CGFloat height = v23;
      if (y <= CGRectGetMaxY(v39))
      {
        unint64_t v32 = TSWPLineFragment::charIndexForWPOffset((TSWPLineFragment *)v14, x, v10, 1, v37, 1);
        if (v32 != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_35;
        }
        goto LABEL_20;
      }
    }
    v40.origin.double x = v21;
    v40.origin.double y = v20;
    v40.size.CGFloat width = v22;
    v40.size.CGFloat height = v23;
    if (y <= CGRectGetMaxY(v40)) {
      break;
    }
    if (v19)
    {
      if (y < v26)
      {
        uint64_t v14 = *(void *)(v17 + v19 - 16);
        v41.origin.double x = v21;
        v41.origin.double y = v20;
        v41.size.CGFloat width = v22;
        v41.size.CGFloat height = v23;
        if (x > CGRectGetMaxX(v41))
        {
          unint64_t v32 = TSWPLineFragment::charIndexForWPOffset((TSWPLineFragment *)v14, x, v10, v9, v37, 1);
LABEL_35:
          startCharIndedouble x = v32;
LABEL_36:
          a6 = v36;
          goto LABEL_37;
        }
      }
    }
LABEL_20:
    v19 += 16;
    if ((TSWPLineFragment **)(v17 + v19) == v18) {
      goto LABEL_21;
    }
  }
  int v27 = (TSWPLineFragment **)(v17 + v19);
  startCharIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  if ((TSWPLineFragment **)(v17 + v19) == v18) {
    goto LABEL_36;
  }
  int v28 = 0;
  double v29 = INFINITY;
  do
  {
    int v30 = (CGFloat *)*v27;
    if (*((double *)*v27 + 7) != v20) {
      break;
    }
    unint64_t v32 = TSWPLineFragment::charIndexForWPOffset(*v27, x, v10, 1, v37, 1);
    if (v32 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_35;
    }
    TSDDistanceToRect(x, y, v30[6], v30[7], v30[8], v30[9]);
    if (v31 < v29)
    {
      int v28 = (TSWPLineFragment *)v30;
      double v29 = v31;
    }
    v27 += 2;
  }
  while (v27 != v18);
  startCharIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  a6 = v36;
  if (!v9 && v28)
  {
    startCharIndedouble x = TSWPLineFragment::charIndexForWPOffset(v28, x, v10, 0, v37, 1);
    uint64_t v14 = (uint64_t)v28;
  }
LABEL_37:
  if (a6) {
    *a6 = (const TSWPLineFragment *)v14;
  }
  if (!v9 && startCharIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    p_NSUInteger characterCount = (unint64_t *)(v14 + 8);
    p_startCharIndedouble x = &self->_startCharIndex;
    if (v14) {
      p_startCharIndedouble x = (unint64_t *)v14;
    }
    else {
      p_NSUInteger characterCount = &self->_characterCount;
    }
    return *p_characterCount + *p_startCharIndex;
  }
  return startCharIndex;
}

- (_TSWPCharIndexAndPosition)calcAttachmentPositionForDrawable:(SEL)a3 atPoint:(id)a4 inTextLayoutTarget:(CGPoint)a5 tlBoundsInfluencingWrap:(id)a6 wrapOutset:(CGPoint)a7 wrapMargin:(CGSize)a8 makeInline:(double)a9
{
  double height = a8.height;
  double y = a7.y;
  double v14 = a5.y;
  double x = a5.x;
  retstr->var0 = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)&retstr->var1 = 0;
  retstr->var2 = NAN;
  *(void *)&retstr->var3 = 0;
  retstr->var4 = NAN;
  char v54 = 0;
  float64x2_t v53 = 0;
  unint64_t result = -[TSWPColumn charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:outFragment:leadingEdge:](self, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:outFragment:leadingEdge:", 0, 1, 0, &v54, &v53, 0, a7.x, a7.y);
  if (result != (_TSWPCharIndexAndPosition *)0x7FFFFFFFFFFFFFFFLL && v53)
  {
    uint64_t v19 = result;
    if (a10 || ([(id)objc_opt_class() canPartition] & 1) != 0)
    {
      unint64_t result = (_TSWPCharIndexAndPosition *)[(id)objc_opt_class() canPartition];
      if (result)
      {
        double v20 = v53;
        CGFloat v21 = [(TSWPColumn *)self lineFragmentAtIndex:[(TSWPColumn *)self countLines] - 1];
        v56.origin.double x = *((CGFloat *)v53 + 6);
        v56.origin.double y = *((CGFloat *)v53 + 7);
        v56.size.CGFloat width = *((CGFloat *)v53 + 8);
        v56.size.double height = *((CGFloat *)v53 + 9);
        double MaxY = CGRectGetMaxY(v56);
        if (v20 == v21)
        {
          unint64_t v23 = *(void *)v53;
          uint64_t v33 = *((void *)v53 + 1);
          if ((*((unsigned char *)v53 + 25) & 8) != 0)
          {
            if (v19 == (_TSWPCharIndexAndPosition *)(v23 + v33 - 1) && y >= MaxY)
            {
              unint64_t result = (_TSWPCharIndexAndPosition *)[(TSWPStorage *)[(TSWPColumn *)self storage] characterAtIndex:v19];
              if (((unsigned __int16)result & 0xFFFE) != 4) {
                uint64_t v19 = (_TSWPCharIndexAndPosition *)((char *)v19 + 1);
              }
              goto LABEL_9;
            }
          }
          else if (v19 == (_TSWPCharIndexAndPosition *)(v33 + v23) && y >= MaxY)
          {
            goto LABEL_9;
          }
        }
        else
        {
          unint64_t v23 = *(void *)v53;
        }
        uint64_t v19 = (_TSWPCharIndexAndPosition *)v23;
      }
LABEL_9:
      retstr->var0 = (unint64_t)v19;
      retstr->var2 = 0.0;
      double v24 = 0.0;
LABEL_10:
      retstr->var4 = v24;
      return result;
    }
    v57.origin.double x = *((CGFloat *)v53 + 6);
    v57.origin.double y = *((CGFloat *)v53 + 7);
    v57.size.CGFloat width = *((CGFloat *)v53 + 8);
    v57.size.double height = *((CGFloat *)v53 + 9);
    if (y < CGRectGetMaxY(v57))
    {
      int v25 = [(TSWPColumn *)self lineFragmentArray];
      uint64_t v26 = TSWPLineFragmentArray::count(*v25);
      if (v26)
      {
        unint64_t v27 = v26;
        unint64_t v28 = -1;
        while (1)
        {
          double v29 = (TSWPLineFragment *)TSWPLineFragmentArray::objectAtIndex(*v25, v28 + 1);
          if (v29 == v53) {
            break;
          }
          unint64_t v30 = v28 + 2;
          ++v28;
          if (v30 >= v27) {
            goto LABEL_33;
          }
        }
        while (v28 != -1)
        {
          uint64_t v31 = TSWPLineFragmentArray::objectAtIndex(*v25, v28);
          double MinY = CGRectGetMinY(*(CGRect *)(v31 + 48));
          v58.origin.double x = *((CGFloat *)v53 + 6);
          v58.origin.double y = *((CGFloat *)v53 + 7);
          v58.size.CGFloat width = *((CGFloat *)v53 + 8);
          v58.size.double height = *((CGFloat *)v53 + 9);
          --v28;
          if (MinY < CGRectGetMinY(v58))
          {
            float64x2_t v53 = (TSWPLineFragment *)v31;
            break;
          }
        }
      }
    }
LABEL_33:
    unint64_t v35 = [(TSWPColumn *)self anchoredRange];
    if (*(void *)v53 < v35)
    {
      unint64_t v36 = v35;
      CGFloat v37 = [(TSWPColumn *)self lineFragmentArray];
      uint64_t v38 = TSWPLineFragmentArray::count(*v37);
      if (v38)
      {
        uint64_t v39 = v38;
        unint64_t v40 = 0;
        while (1)
        {
          CGRect v41 = (TSWPLineFragment *)TSWPLineFragmentArray::objectAtIndex(*v37, v40);
          if (*(void *)v41 >= v36) {
            break;
          }
          if (v39 == ++v40) {
            goto LABEL_40;
          }
        }
        float64x2_t v53 = v41;
      }
    }
LABEL_40:
    if ((*((_DWORD *)v53 + 6) & 0x301) == 0x101)
    {
      double v42 = [(TSWPColumn *)self lineFragmentArray];
      LineIndexForCharIndedouble x = TSWPLineFragmentArray::findLineIndexForCharIndex(*v42, *(void *)v53);
      if (LineIndexForCharIndex != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v44 = LineIndexForCharIndex + 1;
        if (LineIndexForCharIndex + 1 < (unint64_t)TSWPLineFragmentArray::count(*v42)) {
          float64x2_t v53 = (TSWPLineFragment *)TSWPLineFragmentArray::objectAtIndex(*v42, v44);
        }
      }
    }
    NSUInteger v45 = *(void *)v53;
    retstr->var0 = *(void *)v53;
    unint64_t v46 = [(TSWPColumn *)self storage];
    CGFloat v47 = v53;
    NSUInteger v48 = *((void *)v53 + 1) + *(void *)v53;
    if (v45 < v48)
    {
      while (1)
      {
        objc_opt_class();
        [(TSWPStorage *)v46 attachmentAtCharIndex:v45];
        if (![(id)TSUDynamicCast() isAnchored]) {
          break;
        }
        retstr->var0 = ++v45;
        if (v48 == v45)
        {
          NSUInteger v45 = v48;
          break;
        }
      }
      CGFloat v47 = v53;
    }
    v55.NSUInteger location = v45;
    v55.NSUInteger length = 0;
    TSWPLineFragment::rectsForLineRange(v47, v55, 0, 0, 1, 0, (double **)__p);
    TSWPUnionRects((CGRect **)__p);
    double v50 = v49;
    unint64_t result = (_TSWPCharIndexAndPosition *)__p[0];
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    retstr->var2 = x;
    double v51 = v14 - (height + v50) + *((double *)v53 + 52);
    retstr->var4 = v51;
    if (height + v51 < 0.0)
    {
      objc_opt_class();
      unint64_t result = (_TSWPCharIndexAndPosition *)TSUDynamicCast();
      if (result)
      {
        retstr->var3 = 1;
        [(_TSWPCharIndexAndPosition *)result frame];
        double v24 = v14 + CGRectGetMinY(v59) - (height - a9);
        goto LABEL_10;
      }
    }
  }
  return result;
}

- (void)renderWithRenderer:(id)a3 pageCount:(unint64_t)a4
{
  float64x2_t v8 = 0;
  BOOL v9 = 0;
  uint64_t v10 = 0;
  LOBYTE(v7) = 0;
  LODWORD(v6) = 3;
  LOBYTE(v5) = 0;
  LOBYTE(v4) = 0;
  -[TSWPColumn renderWithRenderer:currentSelection:limitSelection:listRange:rubyGlyphRange:isCanvasInteractive:spellChecker:suppressedMisspellingRange:blackAndWhite:dictationInterpretations:autocorrections:markedRange:markedText:renderMode:pageCount:suppressInvisibles:currentCanvasSelection:](self, "renderWithRenderer:currentSelection:limitSelection:listRange:rubyGlyphRange:isCanvasInteractive:spellChecker:suppressedMisspellingRange:blackAndWhite:dictationInterpretations:autocorrections:markedRange:markedText:renderMode:pageCount:suppressInvisibles:currentCanvasSelection:", a3, 0, 0, *MEMORY[0x263F7C7C8], *(void *)(MEMORY[0x263F7C7C8] + 8), v4, 0, *MEMORY[0x263F7C7C8], *(void *)(MEMORY[0x263F7C7C8] + 8), v5, &v8, &v8, *MEMORY[0x263F7C7C8], *(void *)(MEMORY[0x263F7C7C8] + 8), 0,
    v6,
    a4,
    v7,
    0);
  if (v8)
  {
    BOOL v9 = v8;
    operator delete(v8);
  }
}

- (id)smartFieldAtCharIndex:(unint64_t)a3 attributeKind:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = [(TSWPColumn *)self storage];

  return [(TSWPStorage *)v6 smartFieldAtCharIndex:a3 attributeKind:v4 effectiveRange:0];
}

- (id)partitionedLayoutForInfo:(id)a3
{
  ptr = self->_lineFragmentArray.__ptr_;
  uint64_t v4 = *(void *)ptr;
  uint64_t v5 = *((void *)ptr + 1);
  if (*(void *)ptr == v5) {
    return 0;
  }
  while (1)
  {
    uint64_t v7 = *(void **)(*(void *)v4 + 432);
    if ((id)[v7 info] == a3) {
      break;
    }
    v4 += 16;
    if (v4 == v5) {
      return 0;
    }
  }
  return v7;
}

- (id)singleLinePartitionedInfoAtStart:(BOOL)a3
{
  if ([(TSWPColumn *)self countLines] != 1) {
    return 0;
  }
  uint64_t v5 = [(TSWPColumn *)self lineFragmentAtIndex:0];
  int v6 = v5[6];
  if ((v6 & 1) == 0) {
    return 0;
  }
  if (((v6 & 0x200) != 0 || !a3) && ((v6 & 0x100) != 0 || a3)) {
    return 0;
  }
  float64x2_t v8 = (void *)*((void *)v5 + 54);

  return (id)[v8 info];
}

- (BOOL)onlyHasAnchoredDrawable
{
  if ([(TSWPColumn *)self countLines] == 1) {
    return (*(unsigned __int8 *)([(TSWPColumn *)self lineFragmentAtIndex:0] + 24) >> 6) & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (unint64_t)characterCount
{
  return self->_characterCount;
}

- (unint64_t)startAnchoredCharIndex
{
  return self->_startAnchoredCharIndex;
}

- (unint64_t)anchoredCharCount
{
  return self->_anchoredCharCount;
}

- (unint64_t)nextWidowPullsDownFromCharIndex
{
  return self->_nextWidowPullsDownFromCharIndex;
}

- (double)erasableContentBottom
{
  return self->_erasableContentBottom;
}

- (void)setErasableContentBottom:(double)a3
{
  self->_erasableContentBottom = a3;
}

- (BOOL)textIsVertical
{
  return self->_textIsVertical;
}

@end
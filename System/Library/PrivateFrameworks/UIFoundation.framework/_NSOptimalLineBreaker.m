@interface _NSOptimalLineBreaker
- ($102BB1629D0471A0919C413AE880609B)lineBreakAtIndex:(SEL)a3;
- ($554B148941027912B77C686939519A4B)lineInfoAtIndex:(SEL)a3;
- (BOOL)_attributedStringOverridesMethodWithSelector:(void *)a1;
- (BOOL)_breakRange:(uint64_t)a3 fallsWithinTokenWithTokenizer:(CFStringTokenizerRef)tokenizer;
- (BOOL)allowsHyphenation;
- (BOOL)avoidsRivers;
- (BOOL)breaksWithinCJWords;
- (BOOL)compressesLeftAlignedText;
- (BOOL)expandsGlyphs;
- (BOOL)hyphenatesAsLastResort;
- (BOOL)hyphenatesBetweenMorphemesFreely;
- (BOOL)shouldFillLastLine;
- (BOOL)usesCFStringTokenizerForLineBreaks;
- (BOOL)usesHangingPunctuation;
- (BOOL)usesStretchClasses;
- (NSAttributedString)attributedString;
- (NSParagraphStyle)defaultParagraphStyle;
- (NSString)debugString;
- (NSString)lineBreakAlgorithm;
- (_NSOptimalLineBreaker)init;
- (_NSRange)paragraphRange;
- (__CFLocale)locale;
- (__CTLine)lineAtIndex:(unint64_t)a3 lineInfo:(id *)a4;
- (__CTLine)paragraphLine;
- (double)_breakPenaltyForBreak:(uint64_t)a1;
- (double)_demeritFromBreak:(uint64_t)a3 toBreak:;
- (double)_expansionRatioFromBreak:(uint64_t)a3 toBreak:;
- (double)_minimumDemeritForLineEndingAtBreak:(double)a3 withExpansionRatio:;
- (double)_naturalWidthFromBreak:(id *)a3 toBreak:(id *)a4;
- (double)_softHyphenPenaltyForBreak:(uint64_t)a1;
- (double)hyphenationFactor;
- (double)minimumLastLineLength;
- (double)textContainerWidth;
- (id)_getNaturalWidth:(double *)a3 expand:(double *)a4 contract:(uint64_t)a5 fromBreak:(uint64_t)a6 toBreak:;
- (id)_lineMetrics;
- (int)koreanLineBreakBehavior;
- (int)prepositionLineBreakBehavior;
- (int64_t)lineCountAdjustment;
- (int64x2_t)_resetOptions;
- (long)_breakPenaltyForHyphenationFactor:(uint64_t)a1;
- (long)_implicitNBSPPenaltyForBreak:(uint64_t)a1;
- (uint64_t)_bestNode:(uint64_t)a3 dominatesNode:;
- (uint64_t)_bestNodeInNodeList:(uint64_t)a3 withLineCount:;
- (uint64_t)_createNodeWithParent:(long long *)a3 lineBreak:(char)a4 expansionRatio:(double)a5 mustSucceed:;
- (uint64_t)_equivalenceClassForNode:(int)a3 asTerminalNode:;
- (uint64_t)_hasArtificialBreak;
- (uint64_t)_lineBreakTokenizer;
- (uint64_t)_localeHasDictionaryBasedLineBreaks;
- (uint64_t)_mustExceedLineCount:(uint64_t)result;
- (uint64_t)_node:(uint64_t *)a3 isBetterThanNode:;
- (uint64_t)_shouldAllowLastLineFromBreak:(uint64_t)a3 toBreak:;
- (uint64_t)_shouldAvoidBreakingAfterWord:(uint64_t)a1;
- (unint64_t)_indexOfLastResortHyphenInRange:(CFIndex)a3 maxWidth:(double)a4;
- (unint64_t)_indexOfLineBreakAtCharacterIndex:(unint64_t)result;
- (unint64_t)_rangeOfLineBreakEndingAtIndex:(_WORD *)a3 flags:(unint64_t)a4 inRange:(uint64_t)a5 inlineBuffer:(uint64_t)a6;
- (unint64_t)lineBreakStrategy;
- (unint64_t)lineCount;
- (unint64_t)maximumNumberOfLines;
- (unint64_t)minHyphenationLineCount;
- (unint64_t)minPostHyphenLength;
- (unint64_t)minPreHyphenLength;
- (void)_addLineBreakWithRange:(uint64_t)a3 flags:(__int16)a4;
- (void)_calculateFirstFitWrapping;
- (void)_calculateLineBreaks;
- (void)_calculateOptimalWrapping;
- (void)_calculateOptimalWrappingWithLineBreakFilter:(uint64_t)a1;
- (void)_computeFontMetricsAtIndex:(uint64_t)a1;
- (void)_computeLineBreakGeometry;
- (void)_computeParagraphStyleValues;
- (void)_createLines;
- (void)_demeritFromBreak:(uint64_t)a3 toBreak:(double)a4 usingExpansionRatio:;
- (void)_enumerateEquivalenceClassComponentsForNode:(int)a3 asTerminalNode:(void *)a4 withBlock:;
- (void)_enumerateHyphenationPointsWithBlock:(uint64_t)a1;
- (void)_enumerateNonBreakingSpacesWithBlock:(id *)a1;
- (void)_enumerateOrdinaryLineBreaksWithBlock:(uint64_t)a1;
- (void)_estimatedExpansionRatioForLineWithNaturalWidth:(uint64_t)a1;
- (void)_forcedBreakBetweenBreak:(_OWORD *)a3@<X2> andBreak:(_OWORD *)a4@<X3> withLastNBSP:(char *)a5@<X4> shouldRetryEndBreak:(uint64_t)a6@<X8>;
- (void)_getMinWidth:(double *)a3 maxWidth:(uint64_t)a4 whenJustifyingLineFromBreak:(uint64_t)a5 toBreak:;
- (void)_hasArtificialBreak;
- (void)_paragraphStyle;
- (void)dealloc;
- (void)enumerateLineBreaksInRange:(_NSRange)a3 withBlock:(id)a4;
- (void)invalidateWrapping;
- (void)layout;
- (void)setAllowsHyphenation:(BOOL)a3;
- (void)setAttributedString:(id)a3;
- (void)setAttributedString:(id)a3 paragraphRange:(_NSRange)a4;
- (void)setAvoidsRivers:(BOOL)a3;
- (void)setBreaksWithinCJWords:(BOOL)a3;
- (void)setCompressesLeftAlignedText:(BOOL)a3;
- (void)setDefaultParagraphStyle:(id)a3;
- (void)setExpandsGlyphs:(BOOL)a3;
- (void)setHyphenatesAsLastResort:(BOOL)a3;
- (void)setHyphenatesBetweenMorphemesFreely:(BOOL)a3;
- (void)setHyphenationFactor:(double)a3;
- (void)setKoreanLineBreakBehavior:(int)a3;
- (void)setLineBreakAlgorithm:(id)a3;
- (void)setLineBreakStrategy:(unint64_t)a3;
- (void)setLineCountAdjustment:(int64_t)a3;
- (void)setLocale:(__CFLocale *)a3;
- (void)setMaximumNumberOfLines:(unint64_t)a3;
- (void)setMinHyphenationLineCount:(unint64_t)a3;
- (void)setMinPostHyphenLength:(unint64_t)a3;
- (void)setMinPreHyphenLength:(unint64_t)a3;
- (void)setMinimumLastLineLength:(double)a3;
- (void)setOptions:(id)a3;
- (void)setParagraphLine:(__CTLine *)a3;
- (void)setParagraphRange:(_NSRange)a3;
- (void)setPrepositionLineBreakBehavior:(int)a3;
- (void)setShouldFillLastLine:(BOOL)a3;
- (void)setTextContainerWidth:(double)a3;
- (void)setUsesCFStringTokenizerForLineBreaks:(BOOL)a3;
- (void)setUsesHangingPunctuation:(BOOL)a3;
- (void)setUsesStretchClasses:(BOOL)a3;
@end

@implementation _NSOptimalLineBreaker

- (void)setUsesCFStringTokenizerForLineBreaks:(BOOL)a3
{
  if (self->_usesCFStringTokenizerForLineBreaks != a3)
  {
    self->_usesCFStringTokenizerForLineBreaks = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18E5F72A0;
  }
}

- (void)setTextContainerWidth:(double)a3
{
  if (self->_textContainerWidth != a3)
  {
    self->_textContainerWidth = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    paragraphStyle = self->_paragraphStyle;
    self->_paragraphStyle = 0;
  }
}

- (void)setShouldFillLastLine:(BOOL)a3
{
  if (self->_shouldFillLastLine != a3)
  {
    self->_shouldFillLastLine = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
  }
}

- (void)setPrepositionLineBreakBehavior:(int)a3
{
  if (self->_prepositionLineBreakBehavior != a3)
  {
    self->_prepositionLineBreakBehavior = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18E5F72A0;
  }
}

- (void)setParagraphLine:(__CTLine *)a3
{
  paragraphLine = self->_paragraphLine;
  if (paragraphLine != a3)
  {
    if (paragraphLine) {
      CFRelease(paragraphLine);
    }
    if (a3) {
      CFRetain(a3);
    }
    self->_paragraphLine = a3;
    self->_lineMetricsValid = 0;
  }
}

- (void)setMinimumLastLineLength:(double)a3
{
  if (self->_minimumLastLineLength != a3)
  {
    self->_minimumLastLineLength = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
  }
}

- (void)setMinPreHyphenLength:(unint64_t)a3
{
  self->_minPreHyphenLength = a3;
}

- (void)setMinPostHyphenLength:(unint64_t)a3
{
  self->_minPostHyphenLength = a3;
}

- (void)setMinHyphenationLineCount:(unint64_t)a3
{
  if (self->_minHyphenationLineCount != a3)
  {
    self->_minHyphenationLineCount = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
  }
}

- (void)setLocale:(__CFLocale *)a3
{
  locale = self->_locale;
  if (locale != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      locale = self->_locale;
    }
    if (locale) {
      CFRelease(locale);
    }
    self->_locale = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18E5F72A0;
    wordTokenizer = self->_wordTokenizer;
    if (wordTokenizer)
    {
      CFRelease(wordTokenizer);
      self->_wordTokenizer = 0;
    }
    wordBoundaryTokenizer = self->_wordBoundaryTokenizer;
    if (wordBoundaryTokenizer)
    {
      CFRelease(wordBoundaryTokenizer);
      self->_wordBoundaryTokenizer = 0;
    }
    lineBreakTokenizer = self->_lineBreakTokenizer;
    if (lineBreakTokenizer)
    {
      CFRelease(lineBreakTokenizer);
      self->_lineBreakTokenizer = 0;
      self->_lineBreakTokenizerValid = 0;
    }
  }
}

- (void)setLineBreakStrategy:(unint64_t)a3
{
  if (self->_lineBreakStrategy != a3)
  {
    self->_lineBreakStrategy = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18E5F72A0;
  }
}

- (void)setKoreanLineBreakBehavior:(int)a3
{
  if (self->_koreanLineBreakBehavior != a3)
  {
    self->_koreanLineBreakBehavior = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18E5F72A0;
  }
}

- (void)setHyphenationFactor:(double)a3
{
  if (self->_hyphenationFactor != a3)
  {
    self->_hyphenationFactor = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
  }
}

- (void)setHyphenatesBetweenMorphemesFreely:(BOOL)a3
{
  if (self->_hyphenatesBetweenMorphemesFreely != a3)
  {
    self->_hyphenatesBetweenMorphemesFreely = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18E5F72A0;
  }
}

- (void)setHyphenatesAsLastResort:(BOOL)a3
{
  if (self->_hyphenatesAsLastResort != a3)
  {
    self->_hyphenatesAsLastResort = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18E5F72A0;
  }
}

- (void)setBreaksWithinCJWords:(BOOL)a3
{
  if (self->_breaksWithinCJWords != a3)
  {
    self->_breaksWithinCJWords = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18E5F72A0;
  }
}

- (void)setAttributedString:(id)a3 paragraphRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  if (location == 0x7FFFFFFFFFFFFFFFLL) {
    -[_NSOptimalLineBreaker setAttributedString:paragraphRange:]();
  }
  id v11 = v8;
  if (location + length > [v8 length]) {
    -[_NSOptimalLineBreaker setAttributedString:paragraphRange:]();
  }
  BOOL v9 = location == self->_paragraphRange.location && length == self->_paragraphRange.length;
  if (!v9 || ([v11 isEqualToAttributedString:self->_attributedString] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_attributedString, a3);
    self->_paragraphRange.NSUInteger location = location;
    self->_paragraphRange.NSUInteger length = length;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18E5F72A0;
    self->_lineMetricsValid = 0;
    paragraphStyle = self->_paragraphStyle;
    self->_paragraphStyle = 0;

    self->_lineBreakTokenizerValid = 0;
  }
}

- (void)invalidateWrapping
{
  *(_WORD *)&self->_wrappingValid = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_hyphenationFactorHyphenPenalty = _Q0;
}

- (void)setAllowsHyphenation:(BOOL)a3
{
  if (self->_allowsHyphenation != a3)
  {
    self->_allowsHyphenation = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18E5F72A0;
  }
}

- (_NSOptimalLineBreaker)init
{
  v5.receiver = self;
  v5.super_class = (Class)_NSOptimalLineBreaker;
  v2 = [(_NSOptimalLineBreaker *)&v5 init];
  v3 = v2;
  if (v2)
  {
    -[_NSOptimalLineBreaker _resetOptions]((uint64_t)v2);
    v3->_cachedHyphenFontRange = (_NSRange)xmmword_18E5F72A0;
  }
  return v3;
}

- (int64x2_t)_resetOptions
{
  if (a1)
  {
    *(_WORD *)(a1 + 369) = 1;
    *(void *)(a1 + 392) = 0xBFF0000000000000;
    *(void *)(a1 + 400) = 0x7FFFFFFFFFFFFFFFLL;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(a1 + 232) = _Q0;
    *(void *)(a1 + 408) = 0;
    v7 = *(void **)(a1 + 432);
    *(void *)(a1 + 432) = @"Optimal";

    *(_WORD *)(a1 + 372) = 0;
    *(unsigned char *)(a1 + 208) = 0;
    *(void *)(a1 + 16) = 0x4059000000000000;
    *(_OWORD *)(a1 + 216) = xmmword_18E5F7380;
    *(int64x2_t *)(a1 + 248) = vdupq_n_s64(0x40A7700000000000uLL);
    *(void *)(a1 + 264) = 0x416312D000000000;
    *(void *)(a1 + 272) = 5;
    *(void *)(a1 + 280) = 0x4008000000000000;
    *(_OWORD *)(a1 + 288) = xmmword_18E5F7390;
    *(_OWORD *)(a1 + 304) = xmmword_18E5F73A0;
    int64x2_t result = vdupq_n_s64(0x3F947AE147AE147BuLL);
    *(int64x2_t *)(a1 + 320) = result;
    *(void *)(a1 + 336) = 0;
    *(void *)(a1 + 344) = 0;
    *(void *)(a1 + 380) = 0x200000003;
    *(unsigned char *)(a1 + 375) = 1;
    *(unsigned char *)(a1 + 377) = 0;
  }
  return result;
}

- (unint64_t)lineCount
{
  unint64_t chosenLineBreakCount = self->_chosenLineBreakCount;
  BOOL v3 = chosenLineBreakCount != 0;
  unint64_t v4 = chosenLineBreakCount - 1;
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

- ($102BB1629D0471A0919C413AE880609B)lineBreakAtIndex:(SEL)a3
{
  if (self[3].var0.length <= a4) {
    -[_NSOptimalLineBreaker lineBreakAtIndex:]();
  }
  NSUInteger v4 = self[3].var0.location + (a4 << 6);
  long long v5 = *(_OWORD *)(v4 + 16);
  retstr->var0 = *(_NSRange *)v4;
  *(_OWORD *)&retstr->var1 = v5;
  long long v6 = *(_OWORD *)(v4 + 48);
  *(_OWORD *)&retstr->var3 = *(_OWORD *)(v4 + 32);
  *(_OWORD *)&retstr->var5 = v6;
  return self;
}

- (void)layout
{
  -[_NSOptimalLineBreaker _calculateLineBreaks]((uint64_t)self);
  if ([(NSString *)self->_lineBreakAlgorithm isEqualToString:@"Optimal"])
  {
    -[_NSOptimalLineBreaker _calculateOptimalWrapping]((uint64_t)self);
  }
  else if ([(NSString *)self->_lineBreakAlgorithm isEqualToString:@"First Fit"])
  {
    -[_NSOptimalLineBreaker _calculateFirstFitWrapping]((uint64_t)self);
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"unrecognized line break algorithm '%@'", self->_lineBreakAlgorithm format];
  }
}

- (void)_calculateOptimalWrapping
{
  if (a1 && !*(unsigned char *)(a1 + 9))
  {
    if (*(unsigned char *)(a1 + 369))
    {
      uint64_t v2 = *(void *)(a1 + 400);
      if (v2 != 0x7FFFFFFFFFFFFFFFLL && (-[_NSOptimalLineBreaker _mustExceedLineCount:](a1, v2 - 1) & 1) == 0)
      {
        -[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:](a1, &__block_literal_global_166);
        if ((unint64_t)[(id)a1 lineCount] < *(void *)(a1 + 400)
          && !-[_NSOptimalLineBreaker _hasArtificialBreak](a1))
        {
          return;
        }
        [(id)a1 invalidateWrapping];
      }
    }
    -[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:](a1, 0);
  }
}

- (uint64_t)_node:(uint64_t *)a3 isBetterThanNode:
{
  if (result)
  {
    if (!a2 || *((unsigned char *)a2 + 32)) {
      -[_NSOptimalLineBreaker _node:isBetterThanNode:]();
    }
    if (a3)
    {
      if (*((unsigned char *)a3 + 32)) {
        -[_NSOptimalLineBreaker _node:isBetterThanNode:]();
      }
      double v3 = *((double *)a3 + 3);
      double v4 = *((double *)a2 + 3);
      if (vabdd_f64(v3, v4) >= 0.000001)
      {
        return v4 < v3;
      }
      else
      {
        while (1)
        {
          unint64_t v5 = a2[6];
          unint64_t v6 = a3[6];
          uint64_t v7 = v6 < v5;
          if (v5 < v6) {
            uint64_t v7 = -1;
          }
          if (!v7)
          {
            unint64_t v8 = a2[7] + v5;
            unint64_t v9 = a3[7] + v6;
            uint64_t v7 = v9 < v8;
            if (v8 < v9) {
              break;
            }
          }
          if (v7) {
            return v7 == 1;
          }
          a2 = (uint64_t *)*a2;
          a3 = (uint64_t *)*a3;
          if (a2) {
            BOOL v10 = a3 == 0;
          }
          else {
            BOOL v10 = 1;
          }
          if (v10) {
            return 0;
          }
        }
        uint64_t v7 = -1;
        return v7 == 1;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (void)_calculateLineBreaks
{
  __assert_rtn("-[_NSOptimalLineBreaker _calculateLineBreaks]", "NSOptimalLineBreaker.m", 1713, "NSMaxRange(_lineBreaks[i].range) <= _lineBreaks[i + 1].range.location");
}

- (void)_enumerateOrdinaryLineBreaksWithBlock:(uint64_t)a1
{
  double v3 = a2;
  if (!a1) {
    goto LABEL_31;
  }
  double v4 = [(id)a1 attributedString];
  unint64_t v5 = [v4 string];

  unint64_t v6 = [(id)a1 paragraphRange];
  CFIndex v8 = v7;
  memset(buffer, 0, sizeof(buffer));
  CFStringRef theString = v5;
  unint64_t v100 = v6;
  int64_t v101 = v7;
  CharactersPtr = CFStringGetCharactersPtr(v5);
  if (CharactersPtr) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
  }
  int64_t v102 = 0;
  int64_t v103 = 0;
  v99 = CStringPtr;
  BOOL v10 = [*(id *)(a1 + 136) languageIdentifier];
  CFLocaleRef Value = *(const __CFLocale **)(a1 + 136);
  if (Value) {
    CFLocaleRef Value = (const __CFLocale *)CFLocaleGetValue(Value, (CFLocaleKey)*MEMORY[0x1E4F1D218]);
  }
  CFLocaleRef v87 = Value;
  char v86 = [(__CFLocale *)v87 isEqualToString:@"ko"];
  if (*(unsigned char *)(a1 + 376) && -[_NSOptimalLineBreaker _localeHasDictionaryBasedLineBreaks](a1))
  {
    -[_NSOptimalLineBreaker _localeHasDictionaryBasedLineBreaks](a1);
    unint64_t v85 = 0;
    char v83 = 1;
    int v12 = 1;
  }
  else
  {
    CFIndex v13 = v8;
    uint64_t v14 = _NSCopyBreakIterator(v10, 0, 0, 2u);
    v15 = (UText *)CFStringOpenUText();
    LODWORD(v90) = 0;
    unint64_t v85 = v14;
    ubrk_setUText();
    utext_close(v15);
    if (-[_NSOptimalLineBreaker _localeHasDictionaryBasedLineBreaks](a1))
    {
      v16 = *(__CFStringTokenizer **)(a1 + 72);
      CFIndex v8 = v13;
      v17.int location = v6;
      v17.NSUInteger length = v13;
      if (v16)
      {
        CFStringTokenizerSetString(v16, v5, v17);
        char v83 = 0;
        int v12 = 0;
      }
      else
      {
        char v83 = 0;
        int v12 = 0;
        *(void *)(a1 + 72) = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v5, v17, 4uLL, *(CFLocaleRef *)(a1 + 136));
      }
    }
    else
    {
      int v12 = 0;
      char v83 = 1;
      CFIndex v8 = v13;
    }
  }
  v18 = *(void **)(a1 + 176);
  if (v18) {
    [v18 removeAllObjects];
  }
  if (!-[_NSOptimalLineBreaker _attributedStringOverridesMethodWithSelector:]((void *)a1, (uint64_t)sel_lineBreakBeforeIndex_withinRange_))
  {
    uint64_t v82 = 0;
    unint64_t v25 = v6 + v8;
    CFIndex v79 = v8;
    char v81 = 1;
    unint64_t v84 = v6;
    v80 = v10;
    while (1)
    {
      do
      {
        while (!v12)
        {
          if (v81) {
            int v35 = ubrk_following();
          }
          else {
            int v35 = ubrk_next();
          }
          if (v35 == -1) {
            goto LABEL_29;
          }
          char v81 = 0;
          if (v25 >= v35) {
            int v29 = v35;
          }
          else {
            int v29 = v25;
          }
LABEL_63:
          __int16 v95 = 0;
          unint64_t v38 = v82 + v84;
          unint64_t v39 = [(_NSOptimalLineBreaker *)(void *)a1 _rangeOfLineBreakEndingAtIndex:&v95 flags:v82 + v84 inRange:v25 - (v82 + v84) inlineBuffer:(uint64_t)buffer];
          unint64_t v41 = v39;
          uint64_t v42 = v40;
          char v43 = v83;
          if (v40) {
            char v43 = 1;
          }
          if ((v43 & 1) == 0)
          {
            BOOL v50 = [(_NSOptimalLineBreaker *)a1 _breakRange:v40 fallsWithinTokenWithTokenizer:*(CFStringTokenizerRef *)(a1 + 72)];
            char v51 = v86;
            if (v42) {
              char v51 = 0;
            }
            if (v50 || (v51 & 1) == 0)
            {
              if (v50) {
                goto LABEL_115;
              }
              goto LABEL_87;
            }
LABEL_80:
            int v52 = *(_DWORD *)(a1 + 380);
            if (!v52) {
              goto LABEL_115;
            }
            if (v52 == 1)
            {
              v53 = [(id)a1 attributedString];
              unint64_t v54 = [v53 length];

              if (v41 < v54)
              {
                v55 = [(id)a1 attributedString];
                uint64_t v56 = objc_msgSend(v55, "doubleClickAtIndex:inRange:", v41, v6, v79);
                uint64_t v77 = v57;

                if (v56 + 1 == v41 || v41 + 1 == v56 + v77) {
                  goto LABEL_115;
                }
              }
            }
            v95 |= 0x20u;
            goto LABEL_87;
          }
          char v44 = v86 ^ 1;
          if (v40) {
            char v44 = 1;
          }
          if ((v44 & 1) == 0) {
            goto LABEL_80;
          }
          if (v40 != 1) {
            goto LABEL_87;
          }
          if (*(_DWORD *)(a1 + 384) == 2) {
            goto LABEL_87;
          }
          int64_t v45 = v39 - v6;
          if ((uint64_t)(v39 - v6) < 0) {
            goto LABEL_87;
          }
          int64_t v46 = v101;
          if (v101 <= v45) {
            goto LABEL_87;
          }
          v47 = CharactersPtr;
          if (CharactersPtr)
          {
            unint64_t v48 = v100 + v45;
LABEL_75:
            UniChar v49 = v47[v48];
            goto LABEL_118;
          }
          if (!v99)
          {
            if (v103 <= v45 || (int64_t v73 = v102, v102 > v45))
            {
              int64_t v74 = v45 - 4;
              if ((unint64_t)v45 < 4) {
                int64_t v74 = 0;
              }
              if (v74 + 64 < v101) {
                int64_t v46 = v74 + 64;
              }
              int64_t v102 = v74;
              int64_t v103 = v46;
              v105.int location = v100 + v74;
              v105.NSUInteger length = v46 - v74;
              CFStringGetCharacters(theString, v105, (UniChar *)buffer);
              int64_t v73 = v102;
            }
            unint64_t v48 = v45 - v73;
            v47 = (const UniChar *)buffer;
            goto LABEL_75;
          }
          UniChar v49 = v99[v100 + v45];
LABEL_118:
          BOOL v70 = v49 != 32 || v84 == 0x7FFFFFFFFFFFFFFFLL;
          if (!v70 && v41 - v38 <= 2)
          {
            v78 = [(id)a1 attributedString];
            v76 = [v78 string];
            v71 = objc_msgSend(v76, "substringWithRange:", v38, v41 - v38);

            if (-[_NSOptimalLineBreaker _shouldAvoidBreakingAfterWord:](a1, v71))
            {
              int v72 = *(_DWORD *)(a1 + 384);
              if (v72 != 1)
              {
                if (v72) {
                  -[_NSOptimalLineBreaker _enumerateOrdinaryLineBreaksWithBlock:]();
                }

                goto LABEL_115;
              }
              v95 |= 0x40u;
            }
          }
LABEL_87:
          if ((v95 & 0x100) == 0) {
            goto LABEL_114;
          }
          if (*(void *)(a1 + 336))
          {
            if (v42) {
              goto LABEL_139;
            }
            if (v41 - 1 >= *(void *)(a1 + 472) + 1)
            {
              uint64_t v90 = 0;
              v91 = &v90;
              uint64_t v92 = 0x3010000000;
              v93 = "";
              long long v94 = xmmword_18E5F72A0;
              v59 = [*(id *)(a1 + 448) string];
              uint64_t v60 = *(void *)(a1 + 472);
              v89[0] = MEMORY[0x1E4F143A8];
              v89[1] = 3221225472;
              v89[2] = __63___NSOptimalLineBreaker__enumerateOrdinaryLineBreaksWithBlock___block_invoke;
              v89[3] = &unk_1E55C5668;
              v89[4] = &v90;
              objc_msgSend(v59, "enumerateSubstringsInRange:options:usingBlock:", v60, v41 - 1 - v60, 771, v89);

              unint64_t v61 = v91[4];
              if (v61 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t)v91[5] >= *(void *)(a1 + 336))
              {
                BOOL v58 = 1;
              }
              else if (*(void *)(a1 + 472) >= v61)
              {
                BOOL v58 = 0;
              }
              else
              {
                v62 = [*(id *)(a1 + 448) string];
                BOOL v58 = [v62 characterAtIndex:v91[4] - 1] == 45;
              }
              _Block_object_dispose(&v90, 8);
            }
            else
            {
              BOOL v58 = 1;
            }
            if (!*(void *)(a1 + 344))
            {
LABEL_111:
              if (v58) {
                goto LABEL_114;
              }
              goto LABEL_115;
            }
          }
          else
          {
            if (!*(void *)(a1 + 344)) {
              goto LABEL_114;
            }
            if (v42) {
LABEL_139:
            }
              -[_NSOptimalLineBreaker _enumerateOrdinaryLineBreaksWithBlock:]();
            BOOL v58 = 1;
          }
          if (v41 >= *(void *)(a1 + 480) + *(void *)(a1 + 472)) {
            goto LABEL_111;
          }
          uint64_t v90 = 0;
          v91 = &v90;
          uint64_t v92 = 0x3010000000;
          v93 = "";
          long long v94 = xmmword_18E5F72A0;
          v63 = [*(id *)(a1 + 448) string];
          unint64_t v64 = *(void *)(a1 + 472) - v41 + *(void *)(a1 + 480);
          v88[0] = MEMORY[0x1E4F143A8];
          v88[1] = 3221225472;
          v88[2] = __63___NSOptimalLineBreaker__enumerateOrdinaryLineBreaksWithBlock___block_invoke_2;
          v88[3] = &unk_1E55C5668;
          v88[4] = &v90;
          objc_msgSend(v63, "enumerateSubstringsInRange:options:usingBlock:", v41, v64, 515, v88);

          uint64_t v65 = v91[4];
          if (v65 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v66 = v91[5], v66 >= *(void *)(a1 + 344)))
          {
            _Block_object_dispose(&v90, 8);
            if (!v58) {
              goto LABEL_115;
            }
LABEL_114:
            v3[2](v3, v41, v42);
            unint64_t v84 = v41;
            uint64_t v82 = v42;
            goto LABEL_115;
          }
          if (v66 + v65 >= *(void *)(a1 + 480) + *(void *)(a1 + 472))
          {
            _Block_object_dispose(&v90, 8);
          }
          else
          {
            BOOL v75 = v58;
            v67 = [*(id *)(a1 + 448) string];
            int v68 = [v67 characterAtIndex:v91[5] + v91[4]];

            BOOL v69 = v68 == 45 && v75;
            _Block_object_dispose(&v90, 8);
            if (v69) {
              goto LABEL_114;
            }
          }
LABEL_115:
          BOOL v10 = v80;
        }
        v26 = (__CFStringTokenizer *)-[_NSOptimalLineBreaker _lineBreakTokenizer](a1);
        if (!CFStringTokenizerAdvanceToNextToken(v26)) {
          goto LABEL_30;
        }
        v27 = (__CFStringTokenizer *)-[_NSOptimalLineBreaker _lineBreakTokenizer](a1);
        int location = CFStringTokenizerGetCurrentTokenRange(v27).location;
      }
      while (location == v6);
      int v29 = location;
      if (location <= v6 || location >= v25) {
        goto LABEL_63;
      }
      uint64_t v30 = location - v6;
      if (v30 < 0 || (uint64_t v31 = v101, v101 <= v30))
      {
        UniChar v34 = 0;
      }
      else
      {
        v32 = CharactersPtr;
        if (CharactersPtr)
        {
          unint64_t v33 = v100 + v30;
        }
        else
        {
          if (v99)
          {
            UniChar v34 = v99[v100 + v30];
            goto LABEL_44;
          }
          if (v103 <= v30 || (int64_t v36 = v102, v102 > v30))
          {
            uint64_t v37 = v30 - 4;
            if ((unint64_t)v30 < 4) {
              uint64_t v37 = 0;
            }
            if (v37 + 64 < v101) {
              uint64_t v31 = v37 + 64;
            }
            int64_t v102 = v37;
            int64_t v103 = v31;
            v104.int location = v100 + v37;
            v104.NSUInteger length = v31 - v37;
            CFStringGetCharacters(theString, v104, (UniChar *)buffer);
            int64_t v36 = v102;
          }
          unint64_t v33 = v30 - v36;
          v32 = (const UniChar *)buffer;
        }
        UniChar v34 = v32[v33];
      }
LABEL_44:
      if ((charIsNormalWhitespace(v34) & 1) == 0) {
        goto LABEL_63;
      }
    }
  }
  unint64_t v19 = v6 + v8;
  if (v6 + v8 > v6)
  {
    unint64_t v20 = v6 + v8;
    do
    {
      unint64_t v21 = objc_msgSend(v4, "lineBreakBeforeIndex:withinRange:", v20, v6, v20 - v6);
      if (v21 == 0x7FFFFFFFFFFFFFFFLL || v21 <= v6 || v21 > v19) {
        break;
      }
      LOWORD(v90) = 0;
      unint64_t v20 = [(_NSOptimalLineBreaker *)(void *)a1 _rangeOfLineBreakEndingAtIndex:&v90 flags:v6 inRange:v21 - v6 inlineBuffer:(uint64_t)buffer];
      ((void (*)(void (**)(id, unint64_t, uint64_t), unint64_t, uint64_t, void))v3[2])(v3, v20, v24, (unsigned __int16)v90);
    }
    while (v20 > v6);
  }
  if ((v12 & 1) == 0) {
LABEL_29:
  }
    _NSDisposeBreakIterator(v85, v10, 2);
LABEL_30:

LABEL_31:
}

- (void)_addLineBreakWithRange:(uint64_t)a3 flags:(__int16)a4
{
  if (a1)
  {
    if ([a1 paragraphRange] > a2) {
      -[_NSOptimalLineBreaker _addLineBreakWithRange:flags:]();
    }
    uint64_t v8 = [a1 paragraphRange];
    if (a2 + a3 > v8 + v9) {
      -[_NSOptimalLineBreaker _addLineBreakWithRange:flags:]();
    }
    BOOL v10 = (void *)a1[3];
    if (v10)
    {
      uint64_t v11 = a1[4];
      if (v11 == a1[5])
      {
        uint64_t v12 = 2 * v11;
        a1[5] = 2 * v11;
        if ((unint64_t)(2 * v11) <= 1) {
          uint64_t v12 = 1;
        }
        CFIndex v13 = (char *)malloc_type_realloc(v10, v12 << 6, 0x1000040A976A909uLL);
        a1[3] = v13;
        bzero(&v13[64 * v11], (a1[5] - v11) << 6);
        uint64_t v11 = a1[4];
      }
    }
    else
    {
      uint64_t v14 = [a1 attributedString];
      unint64_t v15 = [v14 length] / 5uLL;

      uint64_t v16 = 8;
      if (v15 > 8) {
        uint64_t v16 = v15;
      }
      a1[5] = v16;
      CFRange v17 = malloc_type_malloc(v16 << 6, 0x1000040A976A909uLL);
      a1[3] = v17;
      bzero(v17, a1[5] << 6);
      uint64_t v11 = 0;
    }
    uint64_t v18 = a1[3];
    a1[4] = v11 + 1;
    uint64_t v19 = v18 + (v11 << 6);
    *(void *)uint64_t v19 = a2;
    *(void *)(v19 + 8) = a3;
    *(_WORD *)(v19 + 48) = a4;
  }
}

- (_NSRange)paragraphRange
{
  NSUInteger length = self->_paragraphRange.length;
  NSUInteger location = self->_paragraphRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (unint64_t)_rangeOfLineBreakEndingAtIndex:(_WORD *)a3 flags:(unint64_t)a4 inRange:(uint64_t)a5 inlineBuffer:(uint64_t)a6
{
  if (!a1) {
    return 0;
  }
  uint64_t v11 = [a1 paragraphRange];
  uint64_t v12 = ~v11;
  uint64_t v13 = ~v11 + a2;
  if (v13 < 0 || (uint64_t v14 = *(void *)(a6 + 160), v14 <= v13))
  {
    unsigned __int16 v16 = 0;
  }
  else
  {
    uint64_t v15 = *(void *)(a6 + 136);
    if (v15)
    {
      unsigned __int16 v16 = *(_WORD *)(v15 + 2 * (*(void *)(a6 + 152) + v13));
    }
    else
    {
      uint64_t v25 = *(void *)(a6 + 144);
      if (v25)
      {
        unsigned __int16 v16 = *(char *)(v25 + *(void *)(a6 + 152) + v13);
      }
      else
      {
        if (*(void *)(a6 + 176) <= v13 || (uint64_t v29 = *(void *)(a6 + 168), v29 > v13))
        {
          uint64_t v30 = v13 - 4;
          if ((unint64_t)v13 < 4) {
            uint64_t v30 = 0;
          }
          if (v30 + 64 < v14) {
            uint64_t v14 = v30 + 64;
          }
          *(void *)(a6 + 168) = v30;
          *(void *)(a6 + 176) = v14;
          v60.NSUInteger location = *(void *)(a6 + 152) + v30;
          v60.NSUInteger length = v14 - v30;
          CFStringGetCharacters(*(CFStringRef *)(a6 + 128), v60, (UniChar *)a6);
          uint64_t v29 = *(void *)(a6 + 168);
        }
        unsigned __int16 v16 = *(_WORD *)(a6 + 2 * (v13 - v29));
      }
    }
  }
  if (a2)
  {
    unint64_t v59 = a2;
    if (v16 != 10)
    {
      if (v16 == 13)
      {
        unint64_t v17 = (__PAIR128__(a2, a4) - a2) >> 64;
        if (v17 <= a4) {
          goto LABEL_61;
        }
        uint64_t v18 = v17 + v12;
        if (v18 < 0) {
          goto LABEL_61;
        }
        goto LABEL_12;
      }
      if (!charIsNormalWhitespace(v16))
      {
        if (v16 != 173)
        {
          unint64_t v17 = a2;
          LOWORD(a2) = 0;
          goto LABEL_95;
        }
        unint64_t v17 = (__PAIR128__(a2, a4) - a2) >> 64;
        if (v17 > a4)
        {
          uint64_t v26 = v17 + v12;
          if (v26 < 0 || (uint64_t v27 = *(void *)(a6 + 160), v27 <= v26))
          {
            unsigned __int16 v16 = 0;
          }
          else
          {
            uint64_t v28 = *(void *)(a6 + 136);
            if (v28)
            {
              unsigned __int16 v16 = *(_WORD *)(v28 + 2 * (*(void *)(a6 + 152) + v26));
            }
            else
            {
              uint64_t v55 = *(void *)(a6 + 144);
              if (v55)
              {
                unsigned __int16 v16 = *(char *)(v55 + *(void *)(a6 + 152) + v26);
              }
              else
              {
                if (*(void *)(a6 + 176) <= v26 || (uint64_t v56 = *(void *)(a6 + 168), v56 > v26))
                {
                  uint64_t v57 = v26 - 4;
                  if ((unint64_t)v26 < 4) {
                    uint64_t v57 = 0;
                  }
                  if (v57 + 64 < v27) {
                    uint64_t v27 = v57 + 64;
                  }
                  *(void *)(a6 + 168) = v57;
                  *(void *)(a6 + 176) = v27;
                  v64.NSUInteger location = *(void *)(a6 + 152) + v57;
                  v64.NSUInteger length = v27 - v57;
                  CFStringGetCharacters(*(CFStringRef *)(a6 + 128), v64, (UniChar *)a6);
                  uint64_t v56 = *(void *)(a6 + 168);
                }
                unsigned __int16 v16 = *(_WORD *)(a6 + 2 * (v26 - v56));
              }
            }
          }
          LOWORD(a2) = 10;
          goto LABEL_95;
        }
        unsigned __int16 v16 = 0;
        LOWORD(a2) = 10;
LABEL_91:
        a4 = v17;
        goto LABEL_92;
      }
      if (v16 != 10)
      {
        unint64_t v17 = a2;
        LOWORD(a2) = 0;
        goto LABEL_63;
      }
    }
    unint64_t v21 = (__PAIR128__(a2, a4) - a2) >> 64;
    if (v21 <= a4 || (uint64_t v22 = v21 + v12, v22 < 0) || (v23 = *(void *)(a6 + 160), v23 <= v22))
    {
      unsigned __int16 v16 = 0;
    }
    else
    {
      uint64_t v24 = *(void *)(a6 + 136);
      if (v24)
      {
        unsigned __int16 v16 = *(_WORD *)(v24 + 2 * (*(void *)(a6 + 152) + v22));
      }
      else
      {
        uint64_t v31 = *(void *)(a6 + 144);
        if (v31)
        {
          unsigned __int16 v16 = *(char *)(v31 + *(void *)(a6 + 152) + v22);
        }
        else
        {
          if (*(void *)(a6 + 176) <= v22 || (uint64_t v33 = *(void *)(a6 + 168), v33 > v22))
          {
            uint64_t v34 = v22 - 4;
            if ((unint64_t)v22 < 4) {
              uint64_t v34 = 0;
            }
            if (v34 + 64 < v23) {
              uint64_t v23 = v34 + 64;
            }
            *(void *)(a6 + 168) = v34;
            *(void *)(a6 + 176) = v23;
            v61.NSUInteger location = *(void *)(a6 + 152) + v34;
            v61.NSUInteger length = v23 - v34;
            CFStringGetCharacters(*(CFStringRef *)(a6 + 128), v61, (UniChar *)a6);
            uint64_t v33 = *(void *)(a6 + 168);
          }
          unsigned __int16 v16 = *(_WORD *)(a6 + 2 * (v22 - v33));
        }
      }
      if (v16 == 13)
      {
        unint64_t v17 = v21 - 1;
        if (v21 - 1 <= a4) {
          goto LABEL_61;
        }
        uint64_t v18 = v21 - v11 - 2;
        if (v18 < 0) {
          goto LABEL_61;
        }
LABEL_12:
        uint64_t v19 = *(void *)(a6 + 160);
        if (v19 > v18)
        {
          uint64_t v20 = *(void *)(a6 + 136);
          if (v20)
          {
            unsigned __int16 v16 = *(_WORD *)(v20 + 2 * (*(void *)(a6 + 152) + v18));
          }
          else
          {
            uint64_t v32 = *(void *)(a6 + 144);
            if (v32)
            {
              unsigned __int16 v16 = *(char *)(v32 + *(void *)(a6 + 152) + v18);
            }
            else
            {
              if (*(void *)(a6 + 176) <= v18 || (uint64_t v53 = *(void *)(a6 + 168), v53 > v18))
              {
                uint64_t v54 = v18 - 4;
                if ((unint64_t)v18 < 4) {
                  uint64_t v54 = 0;
                }
                if (v54 + 64 < v19) {
                  uint64_t v19 = v54 + 64;
                }
                *(void *)(a6 + 168) = v54;
                *(void *)(a6 + 176) = v19;
                v63.NSUInteger location = *(void *)(a6 + 152) + v54;
                v63.NSUInteger length = v19 - v54;
                CFStringGetCharacters(*(CFStringRef *)(a6 + 128), v63, (UniChar *)a6);
                uint64_t v53 = *(void *)(a6 + 168);
              }
              unsigned __int16 v16 = *(_WORD *)(a6 + 2 * (v18 - v53));
            }
          }
          goto LABEL_62;
        }
LABEL_61:
        unsigned __int16 v16 = 0;
LABEL_62:
        LOWORD(a2) = 1;
LABEL_63:
        if (v17 > a4)
        {
          char IsNormalWhitespace = charIsNormalWhitespace(v16);
          BOOL v36 = v16 == 160;
          if ((IsNormalWhitespace & 1) != 0 || v16 == 160)
          {
            BOOL v58 = a3;
            while (1)
            {
              unint64_t v37 = v17;
              if (v36)
              {
                unint64_t v38 = (void *)a1[22];
                if (!v38)
                {
                  uint64_t v39 = [MEMORY[0x1E4F1CA80] set];
                  uint64_t v40 = (void *)a1[22];
                  a1[22] = v39;

                  unint64_t v38 = (void *)a1[22];
                }
                --v17;
                unint64_t v41 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v37 - 1, 1, v58);
                [v38 addObject:v41];
              }
              else
              {
                --v17;
              }
              if (v17 <= a4) {
                break;
              }
              uint64_t v42 = v37 - v11 - 2;
              if (v42 < 0 || (uint64_t v43 = *(void *)(a6 + 160), v43 <= v42))
              {
                unsigned __int16 v16 = 0;
              }
              else
              {
                uint64_t v44 = *(void *)(a6 + 136);
                if (v44)
                {
                  unsigned __int16 v16 = *(_WORD *)(v44 + 2 * (*(void *)(a6 + 152) + v42));
                }
                else
                {
                  uint64_t v46 = *(void *)(a6 + 144);
                  if (v46)
                  {
                    unsigned __int16 v16 = *(char *)(v46 + *(void *)(a6 + 152) + v42);
                  }
                  else
                  {
                    if (*(void *)(a6 + 176) <= v42 || (uint64_t v47 = *(void *)(a6 + 168), v47 > v42))
                    {
                      uint64_t v48 = v42 - 4;
                      if ((unint64_t)v42 < 4) {
                        uint64_t v48 = 0;
                      }
                      if (v48 + 64 < v43) {
                        uint64_t v43 = v48 + 64;
                      }
                      *(void *)(a6 + 168) = v48;
                      *(void *)(a6 + 176) = v43;
                      v62.NSUInteger location = *(void *)(a6 + 152) + v48;
                      v62.NSUInteger length = v43 - v48;
                      CFStringGetCharacters(*(CFStringRef *)(a6 + 128), v62, (UniChar *)a6);
                      uint64_t v47 = *(void *)(a6 + 168);
                    }
                    unsigned __int16 v16 = *(_WORD *)(a6 + 2 * (v42 - v47));
                  }
                }
              }
              char v45 = charIsNormalWhitespace(v16);
              BOOL v36 = v16 == 160;
              if ((v45 & 1) == 0 && v16 != 160)
              {
                a3 = v58;
                goto LABEL_95;
              }
            }
            unsigned __int16 v16 = 0;
            a3 = v58;
LABEL_92:
            unint64_t v49 = v59 - a4;
            if (!a4) {
              goto LABEL_107;
            }
LABEL_96:
            if (v16 - 8208 <= 4 && v16 != 8210 || v16 == 173 || v16 == 45)
            {
              if (v16 == 45 && v49 == 0) {
                __int16 v51 = 264;
              }
              else {
                __int16 v51 = 8;
              }
              LOWORD(a2) = v51 | a2;
            }
            goto LABEL_107;
          }
LABEL_95:
          unint64_t v49 = v59 - v17;
          a4 = v17;
          goto LABEL_96;
        }
        goto LABEL_91;
      }
    }
    LOWORD(a2) = 1;
    unint64_t v17 = v21;
    goto LABEL_63;
  }
  a4 = 0;
LABEL_107:
  *a3 = a2;
  return a4;
}

- (uint64_t)_localeHasDictionaryBasedLineBreaks
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 136);
    if (v2)
    {
      id v3 = v2;
    }
    else
    {
      id v3 = [MEMORY[0x1E4F1CA20] currentLocale];
    }
    double v4 = v3;
    unint64_t v5 = [v3 languageCode];
    if (([v5 isEqualToString:@"zh"] & 1) != 0
      || [v5 isEqualToString:@"ja"])
    {
      BOOL v6 = *(unsigned char *)(v1 + 375) == 0;
    }
    else
    {
      if (![v5 isEqualToString:@"ko"])
      {
        uint64_t v1 = 0;
LABEL_11:

        return v1;
      }
      BOOL v6 = *(_DWORD *)(v1 + 380) == 2;
    }
    uint64_t v1 = v6;
    goto LABEL_11;
  }
  return v1;
}

- (void)_enumerateNonBreakingSpacesWithBlock:(id *)a1
{
  uint64_t v15 = a2;
  if (a1)
  {
    if (_enumerateNonBreakingSpacesWithBlock__once != -1) {
      dispatch_once(&_enumerateNonBreakingSpacesWithBlock__once, &__block_literal_global_125);
    }
    id v3 = [a1 attributedString];
    double v4 = [v3 string];

    unint64_t v5 = [a1 paragraphRange];
    unint64_t v7 = v5 + v6;
    if (v5 < v5 + v6)
    {
      unint64_t v8 = v5;
      do
      {
        uint64_t v9 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", _enumerateNonBreakingSpacesWithBlock__nbspCharacterSet, 0, v8, v7 - v8);
        if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        uint64_t v11 = v9;
        uint64_t v12 = v10;
        if ([a1[22] count])
        {
          id v13 = a1[22];
          uint64_t v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v11, v12);
          LOBYTE(v13) = [v13 containsObject:v14];

          if (v13) {
            continue;
          }
        }
        v15[2](v15, v11, v12);
        unint64_t v8 = v11 + v12;
      }
      while (v11 + v12 < v7);
    }
  }
}

- (void)_computeLineBreakGeometry
{
}

- (void)_calculateOptimalWrappingWithLineBreakFilter:(uint64_t)a1
{
  id v3 = a2;
  if (!a1 || *(unsigned char *)(a1 + 9)) {
    goto LABEL_119;
  }
  if (!*(void *)(a1 + 32))
  {
    *(void *)(a1 + 200) = 0;
    *(unsigned char *)(a1 + 9) = 1;
    goto LABEL_119;
  }
  int64_t v74 = v3;
  double v4 = objc_alloc_init(_NSLineBreakerQueue);
  CFIndex v79 = objc_alloc_init(_NSLineBreakerNodeDictionary);
  uint64_t v77 = objc_alloc_init(_NSLineBreakerNodeDictionary);
  unint64_t v5 = *(void **)(a1 + 184);
  if (!v5)
  {
    uint64_t v6 = objc_alloc_init(_NSLineBreakerNodePool);
    unint64_t v7 = *(void **)(a1 + 184);
    *(void *)(a1 + 184) = v6;

    unint64_t v5 = *(void **)(a1 + 184);
  }
  [v5 reset];
  uint64_t v8 = [*(id *)(a1 + 184) allocNode];
  *(void *)uint64_t v8 = 0;
  *(unsigned char *)(v8 + 33) = 1;
  *(void *)(v8 + 16) = 0;
  *(void *)(v8 + 24) = 0;
  *(void *)(v8 + 40) = 0;
  uint64_t v9 = *(_OWORD **)(a1 + 24);
  long long v11 = v9[2];
  long long v10 = v9[3];
  long long v12 = v9[1];
  *(_OWORD *)(v8 + 48) = *v9;
  *(_OWORD *)(v8 + 64) = v12;
  *(_OWORD *)(v8 + 80) = v11;
  *(_OWORD *)(v8 + 96) = v10;
  [(_NSLineBreakerQueue *)v4 appendValue:v8];
  uint64_t v13 = [*(id *)(a1 + 184) retainNode:v8];
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = xmmword_18E5F72A0;
  long long v98 = 0u;
  if (*(unsigned char *)(a1 + 372)) {
    double v14 = *(double *)(a1 + 256) + 0.0;
  }
  else {
    double v14 = 0.0;
  }
  uint64_t v15 = (uint64_t (**)(char *, uint64_t))v74;
  if (*(unsigned char *)(a1 + 373)) {
    double v14 = v14 + *(double *)(a1 + 264) * 32.0;
  }
  uint64_t v75 = v13;
  unint64_t v83 = *(void *)(a1 + 32);
  if (v83 < 2) {
    goto LABEL_128;
  }
  uint64_t v82 = 0;
  int64_t v73 = v74 + 16;
  uint64_t v16 = 1;
  v78 = v4;
  do
  {
    uint64_t v17 = *(void *)(a1 + 24) + (v16 << 6);
    __int16 v87 = *(_WORD *)(v17 + 48);
    if (v15)
    {
      int v18 = v15[2]((char *)v15, v17) ^ 1;
      unint64_t v83 = *(void *)(a1 + 32);
    }
    else
    {
      int v18 = 0;
    }
    unint64_t v19 = 0;
    char v96 = 0;
    uint64_t v81 = v16 + 1;
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x2020000000;
    double v20 = INFINITY;
    uint64_t v95 = 0;
    while (v19 < [(_NSLineBreakerQueue *)v4 count])
    {
      uint64_t v21 = [(_NSLineBreakerQueue *)v4 valueAtIndex:v19];
      if (v20 >= *(double *)(v21 + 24)) {
        double v20 = *(double *)(v21 + 24);
      }
      ++v19;
    }
    uint64_t v76 = v16;
    uint64_t v22 = 0;
    char v23 = 0;
    unint64_t v24 = 0;
    int v86 = v18 | ((v87 & 4) >> 2);
    uint64_t v80 = v17;
    while (v24 < [(_NSLineBreakerQueue *)v4 count])
    {
      uint64_t v25 = [(_NSLineBreakerQueue *)v4 valueAtIndex:v24];
      uint64_t v26 = v25;
      if (*(unsigned char *)(v25 + 32)) {
        __assert_rtn("-[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:]", "NSOptimalLineBreaker.m", 2320, "!parent->isFree");
      }
      double v27 = -[_NSOptimalLineBreaker _expansionRatioFromBreak:toBreak:](a1, v25 + 48, v17);
      double v28 = v27;
      unsigned __int8 v29 = (v27 < -1.0) | v87;
      v22 += v29 & ~v23 & 1;
      char v30 = v86;
      if (v27 < -1.0) {
        char v30 = 1;
      }
      if ((v30 & 1) == 0)
      {
        if (v27 > 0.0)
        {
          if (v27 > *(double *)(a1 + 16)) {
            break;
          }
          if (!*(void *)(a1 + 416))
          {
            double v31 = -[_NSOptimalLineBreaker _minimumDemeritForLineEndingAtBreak:withExpansionRatio:](a1, v17, v27);
            uint64_t v32 = v93[3];
            if (v32)
            {
              if (v20 + v31 > v14 + *(double *)(v32 + 24) + 0.000001) {
                break;
              }
            }
          }
        }
        uint64_t v33 = -[_NSOptimalLineBreaker _createNodeWithParent:lineBreak:expansionRatio:mustSucceed:](a1, v26, (long long *)v17, 0, v28);
        uint64_t v34 = (uint64_t *)v33;
        if (v33)
        {
          if (v81 == v83) {
            goto LABEL_35;
          }
          int v35 = 0;
          uint64_t v37 = *(void *)(a1 + 424);
          if (v37)
          {
            BOOL v36 = v79;
            if (v37 != 0x7FFFFFFFFFFFFFFFLL)
            {
              if (*(void *)(v33 + 16) != v37)
              {
                int v35 = 0;
                goto LABEL_40;
              }
LABEL_35:
              int v35 = 1;
              BOOL v36 = v77;
            }
          }
          else
          {
LABEL_40:
            BOOL v36 = v79;
          }
          unint64_t v38 = v36;
          unint64_t v85 = v93;
          int v39 = v35;
          uint64_t v40 = -[_NSOptimalLineBreaker _equivalenceClassForNode:asTerminalNode:](a1, (uint64_t)v34, v35);
          unint64_t v41 = (void *)v40;
          if (v38)
          {
            if (v38->_firstClass == v40)
            {
              firstNode = (uint64_t *)v38->_firstNode;
              if (!firstNode)
              {
LABEL_52:
                char v84 = 1;
LABEL_53:
                -[_NSLineBreakerNodeDictionary setNode:forClass:](v38, v34, v41);
                uint64_t v44 = (uint64_t *)v82;
                char v45 = v39;
                if ((v39 & 1) == 0) {
                  uint64_t v44 = (uint64_t *)v85[3];
                }
                if (!v44
                  || v44 == firstNode
                  || (v46 = -[_NSOptimalLineBreaker _node:isBetterThanNode:](a1, v34, v44), char v45 = v39, v46))
                {
                  if (v45) {
                    uint64_t v82 = (uint64_t)v34;
                  }
                  else {
                    v85[3] = (uint64_t)v34;
                  }
                  if ((v84 & 1) == 0)
                  {
LABEL_62:
                    if (v34 == firstNode)
                    {
                      int v71 = 2380;
                      int v72 = "*bestNode != existingNode";
LABEL_123:
                      __assert_rtn("-[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:]", "NSOptimalLineBreaker.m", v71, v72);
                    }
                    [*(id *)(a1 + 184) releaseNode:firstNode];
                  }
                }
                else if ((v84 & 1) == 0)
                {
                  if (v39) {
                    uint64_t v34 = (uint64_t *)v82;
                  }
                  else {
                    uint64_t v34 = (uint64_t *)v85[3];
                  }
                  goto LABEL_62;
                }
LABEL_65:

                double v4 = v78;
                uint64_t v17 = v80;
                goto LABEL_66;
              }
LABEL_47:
              if ((void *)-[_NSOptimalLineBreaker _equivalenceClassForNode:asTerminalNode:](a1, (uint64_t)firstNode, v39) != v41)
              {
                int v71 = 2372;
                int v72 = "!existingNode || [self _equivalenceClassForNode:existingNode asTerminalNode:isTerminalNode] == nodeClass";
                goto LABEL_123;
              }
              if (-[_NSOptimalLineBreaker _node:isBetterThanNode:](a1, v34, firstNode))
              {
                char v84 = 0;
                goto LABEL_53;
              }
              [*(id *)(a1 + 184) releaseNode:v34];
              goto LABEL_65;
            }
            CFDictionaryRef dict = v38->_dict;
            if (dict)
            {
              firstNode = (uint64_t *)CFDictionaryGetValue(dict, v41);
              if (!firstNode) {
                goto LABEL_52;
              }
              goto LABEL_47;
            }
          }
          firstNode = 0;
          goto LABEL_52;
        }
      }
LABEL_66:
      v23 |= v29 ^ 1;
      ++v24;
    }
    if (v87) {
      uint64_t v22 = [(_NSLineBreakerQueue *)v4 count];
    }
    if (v22)
    {
      for (uint64_t i = 0; i != v22; ++i)
        objc_msgSend(*(id *)(a1 + 184), "releaseNode:", -[_NSLineBreakerQueue valueAtIndex:](v4, "valueAtIndex:", i));
    }
    [(_NSLineBreakerQueue *)v4 removeValuesBeforeIndex:v22];
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __70___NSOptimalLineBreaker__calculateOptimalWrappingWithLineBreakFilter___block_invoke;
    v89[3] = &unk_1E55C5798;
    v89[4] = a1;
    v91 = &v92;
    uint64_t v48 = v4;
    uint64_t v90 = v48;
    -[_NSLineBreakerNodeDictionary enumerateClassesAndNodesUsingBlock:](v79, v89);
    if (v79)
    {
      v79->_firstClass = 0;
      v79->_firstNode = 0;
      unint64_t v49 = v79->_dict;
      if (v49) {
        CFDictionaryRemoveAllValues(v49);
      }
    }
    if (v93[3])
    {
      [*(id *)(a1 + 184) releaseNode:v75];
      uint64_t v75 = [*(id *)(a1 + 184) retainNode:v93[3]];
    }
    if (![(_NSLineBreakerQueue *)v48 count] && !v82)
    {
      if (!v75) {
        __assert_rtn("-[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:]", "NSOptimalLineBreaker.m", 2418, "lastResortNode");
      }
      memset(v88, 0, sizeof(v88));
      [(_NSOptimalLineBreaker *)a1 _forcedBreakBetweenBreak:(_OWORD *)v17 andBreak:&v97 withLastNBSP:&v96 shouldRetryEndBreak:(uint64_t)v88];
      double v50 = -[_NSOptimalLineBreaker _expansionRatioFromBreak:toBreak:](a1, v75 + 48, (uint64_t)v88);
      if (v50 < -1.0) {
        double v50 = -1.0;
      }
      if (v50 >= *(double *)(a1 + 16)) {
        double v50 = *(double *)(a1 + 16);
      }
      uint64_t v51 = -[_NSOptimalLineBreaker _createNodeWithParent:lineBreak:expansionRatio:mustSucceed:](a1, v75, v88, 1, v50);
      int v52 = (unsigned char *)v51;
      if (!v51) {
        __assert_rtn("-[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:]", "NSOptimalLineBreaker.m", 2426, "forcedBreakNode");
      }
      if (v81 == v83 && !v96
        || (uint64_t v56 = *(void *)(a1 + 424)) != 0 && v56 != 0x7FFFFFFFFFFFFFFFLL && *(void *)(v51 + 16) == v56)
      {
        if (v77)
        {
          CFDictionaryRef v53 = v77->_dict;
          uint64_t v54 = v77->_firstNode != 0;
          if (v53) {
            v54 += CFDictionaryGetCount(v53);
          }
          if (v54) {
            __assert_rtn("-[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:]", "NSOptimalLineBreaker.m", 2430, "!bestTerminalNode && terminalList.count == 0");
          }
        }
        uint64_t v82 = [*(id *)(a1 + 184) retainNode:v52];
        uint64_t v55 = (void *)-[_NSOptimalLineBreaker _equivalenceClassForNode:asTerminalNode:](a1, (uint64_t)v52, 1);
        -[_NSLineBreakerNodeDictionary setNode:forClass:](v77, v52, v55);
      }
      else
      {
        [(_NSLineBreakerQueue *)v48 appendValue:v51];
        [*(id *)(a1 + 184) releaseNode:v75];
        uint64_t v75 = [*(id *)(a1 + 184) retainNode:v52];
        uint64_t v82 = 0;
      }
    }
    if (v96)
    {
      --v76;
    }
    else if ((v87 & 4) != 0)
    {
      long long v57 = *(_OWORD *)v17;
      long long v58 = *(_OWORD *)(v17 + 16);
      long long v59 = *(_OWORD *)(v17 + 48);
      long long v99 = *(_OWORD *)(v17 + 32);
      long long v100 = v59;
      long long v97 = v57;
      long long v98 = v58;
    }
    uint64_t v60 = [(_NSLineBreakerQueue *)v48 count];

    _Block_object_dispose(&v92, 8);
    uint64_t v15 = (uint64_t (**)(char *, uint64_t))v74;
    if (!v60) {
      break;
    }
    uint64_t v16 = v76 + 1;
    unint64_t v83 = *(void *)(a1 + 32);
  }
  while (v76 + 1 < v83);
  uint64_t v61 = v82;
  if (!v82) {
LABEL_128:
  }
    -[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:]();
  uint64_t v62 = *(void *)(v82 + 16);
  uint64_t v63 = *(void *)(a1 + 416);
  if (v63)
  {
    while (1)
    {
      uint64_t v64 = -[_NSOptimalLineBreaker _bestNodeInNodeList:withLineCount:](a1, v77, v63 + v62);
      if (v64) {
        break;
      }
      if (v63 < 0) {
        ++v63;
      }
      else {
        --v63;
      }
      if (!v63) {
        goto LABEL_114;
      }
    }
    uint64_t v61 = v64;
LABEL_114:
    uint64_t v62 = *(void *)(v61 + 16);
  }
  uint64_t v65 = v62 + 1;
  *(void *)(a1 + 200) = v62 + 1;
  *(void *)(a1 + 192) = malloc_type_realloc(*(void **)(a1 + 192), (v62 + 1) << 6, 0x1000040A976A909uLL);
  uint64_t v66 = v62 << 6;
  do
  {
    --v65;
    v67 = (_OWORD *)(*(void *)(a1 + 192) + v66);
    long long v68 = *(_OWORD *)(v61 + 48);
    long long v69 = *(_OWORD *)(v61 + 64);
    long long v70 = *(_OWORD *)(v61 + 96);
    v67[2] = *(_OWORD *)(v61 + 80);
    v67[3] = v70;
    _OWORD *v67 = v68;
    v67[1] = v69;
    uint64_t v61 = *(void *)v61;
    v66 -= 64;
  }
  while (v61);
  if (v65) {
    -[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:]();
  }
  *(unsigned char *)(a1 + 9) = 1;

  id v3 = v74;
LABEL_119:
}

- (double)_expansionRatioFromBreak:(uint64_t)a3 toBreak:
{
  if (!a1) {
    return 0.0;
  }
  if (!*(unsigned char *)(a1 + 8)) {
    -[_NSOptimalLineBreaker _expansionRatioFromBreak:toBreak:]();
  }
  double v14 = 0.0;
  double v15 = 0.0;
  double v13 = 0.0;
  -[_NSOptimalLineBreaker _getNaturalWidth:expand:contract:fromBreak:toBreak:]((id *)a1, &v15, &v14, &v13, a2, a3);
  double v11 = 0.0;
  double v12 = 0.0;
  -[_NSOptimalLineBreaker _getMinWidth:maxWidth:whenJustifyingLineFromBreak:toBreak:](a1, &v12, &v11, a2, a3);
  if (*(unsigned char *)(a1 + 208)
    && (-[_NSOptimalLineBreaker _computeParagraphStyleValues]((void *)a1), *(void *)(a1 + 152) == 3))
  {
    double v6 = v15 * (1.0 - *(double *)(a1 + 320));
    double v7 = v15 * (*(double *)(a1 + 328) + 1.0);
  }
  else
  {
    double v6 = v15;
    double v7 = v15;
  }
  if (v7 >= v12)
  {
    double result = 0.0;
    if (v6 > v11)
    {
      double v9 = v6 - v11;
      if (v13 <= 0.0)
      {
        BOOL v10 = v9 > 0.001;
        double result = -INFINITY;
        if (!v10) {
          return 0.0;
        }
      }
      else
      {
        return -v9 / v13;
      }
    }
  }
  else if (v14 <= 0.0)
  {
    return INFINITY;
  }
  else
  {
    return (v12 - v7) / v14;
  }
  return result;
}

- (id)_getNaturalWidth:(double *)a3 expand:(double *)a4 contract:(uint64_t)a5 fromBreak:(uint64_t)a6 toBreak:
{
  if (!result) {
    return result;
  }
  uint64_t v11 = (uint64_t)result;
  uint64_t v12 = *(void *)(a5 + 8) + *(void *)a5;
  unint64_t v13 = *(void *)a6 - v12;
  double v14 = -[_NSOptimalLineBreaker _lineMetrics](result);
  objc_msgSend(v14, "widthOfSubstringWithRange:", v12, v13);
  double v16 = v15;

  if (v16 - *(double *)(a5 + 40) - *(double *)(a6 + 32) + *(double *)(a6 + 24) >= 0.0) {
    double v17 = v16 - *(double *)(a5 + 40) - *(double *)(a6 + 32) + *(double *)(a6 + 24);
  }
  else {
    double v17 = 0.0;
  }
  double v18 = *(double *)(a5 + 56);
  if (*(double *)(a6 + 56) - *(double *)(a6 + 16) - v18 >= 0.0) {
    double v19 = *(double *)(a6 + 56) - *(double *)(a6 + 16) - v18;
  }
  else {
    double v19 = 0.0;
  }
  BOOL v21 = fabs(v19) < 0.001 && v13 > 1;
  if (v21) {
    double v19 = v17 / (double)v13 * (double)(v13 - 1) * 0.2;
  }
  double result = (id *)-[_NSOptimalLineBreaker _computeParagraphStyleValues]((void *)v11);
  if (*(void *)(v11 + 152) == 3)
  {
    double v22 = v19 * *(double *)(v11 + 304);
    double v23 = 0.0;
    if (v21) {
      goto LABEL_26;
    }
  }
  else
  {
    double v24 = *(double *)(v11 + 312);
    -[_NSOptimalLineBreaker _computeFontMetricsAtIndex:](v11, *(void *)(v11 + 472));
    double v25 = v24 * *(double *)(v11 + 120);
    double result = (id *)-[_NSOptimalLineBreaker _computeParagraphStyleValues]((void *)v11);
    double v22 = v25 + v25;
    if (*(void *)(v11 + 152) != 1) {
      double v22 = v25;
    }
    if (*(unsigned char *)(v11 + 374)) {
      char v26 = v21;
    }
    else {
      char v26 = 1;
    }
    double v23 = 0.0;
    if (v26) {
      goto LABEL_26;
    }
  }
  double v23 = v19 * *(double *)(v11 + 296);
LABEL_26:
  if (a2) {
    *a2 = v17;
  }
  if (a3) {
    *a3 = v22;
  }
  if (a4) {
    *a4 = v23;
  }
  return result;
}

- (void)_computeParagraphStyleValues
{
  if (result)
  {
    uint64_t v1 = result;
    if (!result[18])
    {
      uint64_t v2 = [result attributedString];
      uint64_t v3 = [v2 length];

      if (v3)
      {
        uint64_t v4 = [v1 paragraphRange];
        unint64_t v5 = [v1 attributedString];
        BOOL v6 = v4 == [v5 length];

        double v7 = [v1 attributedString];
        uint64_t v8 = [v7 attribute:@"NSParagraphStyle" atIndex:v4 - v6 effectiveRange:0];
        double v9 = (void *)v1[18];
        v1[18] = v8;
      }
      BOOL v10 = (void *)v1[18];
      if (!v10)
      {
        uint64_t v11 = [v1 defaultParagraphStyle];
        uint64_t v12 = (void *)v1[18];
        v1[18] = v11;

        BOOL v10 = (void *)v1[18];
      }
      v1[19] = [v10 alignment];
      double v13 = 0.0;
      double v14 = 0.0;
      +[NSCoreTypesetter _minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:](NSCoreTypesetter, "_minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:", v1[18], [(id)v1[18] baseWritingDirection], 1, &v14, &v13, *((double *)v1 + 57));
      *((double *)v1 + 20) = v13 - v14;
      double result = (void *)+[NSCoreTypesetter _minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:](NSCoreTypesetter, "_minMaxPositionsForLineFragmentWithParagraphStyle:baseWidth:writingDirection:isBeginningOfParagraph:minPosition:maxPosition:", v1[18], [(id)v1[18] baseWritingDirection], 0, &v14, &v13, *((double *)v1 + 57));
      *((double *)v1 + 21) = v13 - v14;
    }
  }
  return result;
}

- (id)_lineMetrics
{
  if (a1)
  {
    uint64_t v2 = a1;
    if (!*((unsigned char *)a1 + 368))
    {
      id v3 = a1[45];
      if (v3)
      {
        uint64_t v4 = [a1 attributedString];
        uint64_t v5 = [v2 paragraphRange];
        objc_msgSend(v3, "setAttributedString:range:line:", v4, v5, v6, objc_msgSend(v2, "paragraphLine"));
      }
      else
      {
        double v7 = [_NSLineMetrics alloc];
        uint64_t v4 = [v2 attributedString];
        uint64_t v8 = [v2 paragraphRange];
        uint64_t v10 = -[_NSLineMetrics initWithAttributedString:range:line:](v7, "initWithAttributedString:range:line:", v4, v8, v9, [v2 paragraphLine]);
        id v11 = v2[45];
        v2[45] = (id)v10;
      }
      [v2[45] setLocale:v2[17]];
      *((unsigned char *)v2 + 368) = 1;
    }
    a1 = (id *)v2[45];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_getMinWidth:(double *)a3 maxWidth:(uint64_t)a4 whenJustifyingLineFromBreak:(uint64_t)a5 toBreak:
{
  if (!a1) {
    return;
  }
  __int16 v9 = *(_WORD *)(a4 + 48);
  if (a5)
  {
    __int16 v10 = *(_WORD *)(a5 + 48);
    -[_NSOptimalLineBreaker _computeParagraphStyleValues]((void *)a1);
    uint64_t v11 = 160;
    if ((v9 & 1) == 0) {
      uint64_t v11 = 168;
    }
    double v12 = *(double *)(a1 + v11);
    if ((v10 & 1) != 0 && !*(unsigned char *)(a1 + 370))
    {
      double v13 = *(double *)(a1 + 408);
      if (v13 <= 0.0)
      {
        double v14 = 0.0;
        if (*(unsigned char *)(a1 + 440))
        {
          -[_NSOptimalLineBreaker _computeFontMetricsAtIndex:](a1, *(void *)a4);
          if (*(double *)(a1 + 128) * (double)*(unint64_t *)(a1 + 272) >= *(double *)(a1 + 456)) {
            double v16 = *(double *)(a1 + 456);
          }
          else {
            double v16 = *(double *)(a1 + 128) * (double)*(unint64_t *)(a1 + 272);
          }
          -[_NSOptimalLineBreaker _computeFontMetricsAtIndex:](a1, *(void *)a4);
          double v14 = v16 + *(double *)(a1 + 128) * 3.0;
        }
      }
      else
      {
        -[_NSOptimalLineBreaker _computeFontMetricsAtIndex:](a1, *(void *)a4);
        double v14 = *(double *)(a1 + 128) * 3.0 + v13 * v12;
      }
      goto LABEL_13;
    }
  }
  else
  {
    -[_NSOptimalLineBreaker _computeParagraphStyleValues]((void *)a1);
    uint64_t v15 = 160;
    if ((v9 & 1) == 0) {
      uint64_t v15 = 168;
    }
    double v12 = *(double *)(a1 + v15);
  }
  double v14 = v12;
LABEL_13:
  if (a2)
  {
    if (v14 >= v12) {
      double v14 = v12;
    }
    *a2 = v14;
  }
  if (a3) {
    *a3 = v12;
  }
}

- (void)_computeFontMetricsAtIndex:(uint64_t)a1
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unint64_t v4 = *(void *)(a1 + 104);
    uint64_t v5 = a1 + 104;
    BOOL v7 = a2 >= v4;
    unint64_t v6 = a2 - v4;
    BOOL v7 = !v7 || v6 >= *(void *)(a1 + 112);
    if (v7)
    {
      uint64_t v8 = [(id)a1 attributedString];
      __int16 v9 = v8;
      if (a2) {
        uint64_t v10 = a2 - 1;
      }
      else {
        uint64_t v10 = 0;
      }
      uint64_t v11 = [v8 attribute:@"NSFont" atIndex:v10 effectiveRange:v5];

      if ((!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        && (NSDefaultFont(), v12 = objc_claimAutoreleasedReturnValue(), v11, (uint64_t v11 = (void *)v12) == 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        -[_NSOptimalLineBreaker _computeFontMetricsAtIndex:]();
      }
      if (!*(void *)(a1 + 96) || (objc_msgSend(v11, "isEqual:") & 1) == 0)
      {
        objc_storeStrong((id *)(a1 + 96), v11);
        double v18 = @"NSFont";
        v19[0] = v11;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
        double v13 = (const __CTLine *)CTLineCreateWithString();
        *(double *)(a1 + 120) = CTLineGetTypographicBounds(v13, 0, 0, 0);
        CFRelease(v13);
        UniChar characters = 109;
        CGGlyph glyphs = 0;
        v15.double width = 0.0;
        v15.height = 0.0;
        if (CTFontGetGlyphsForCharacters((CTFontRef)v11, &characters, &glyphs, 1))
        {
          CTFontGetAdvancesForGlyphs((CTFontRef)v11, kCTFontOrientationDefault, &glyphs, &v15, 1);
          if ((CTFontGetSymbolicTraits((CTFontRef)v11) & 0x400) != 0) {
            double width = v15.width;
          }
          else {
            double width = v15.width * 0.5;
          }
        }
        else
        {
          *(CGRect *)(&width - 2) = CTFontGetBoundingBox((CTFontRef)v11);
        }
        *(double *)(a1 + 128) = width;
      }
    }
  }
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (uint64_t)_createNodeWithParent:(long long *)a3 lineBreak:(char)a4 expansionRatio:(double)a5 mustSucceed:
{
  if (!a1) {
    return 0;
  }
  if (!a2 || *(unsigned char *)(a2 + 32)) {
    -[_NSOptimalLineBreaker _createNodeWithParent:lineBreak:expansionRatio:mustSucceed:]();
  }
  int v8 = 1;
  int v9 = 3;
  if (a5 < 1.0) {
    int v9 = 2;
  }
  if (a5 >= 0.5) {
    int v8 = v9;
  }
  if (a5 < -0.5) {
    int v8 = 0;
  }
  if (*(unsigned char *)(a1 + 372)) {
    int v10 = v8;
  }
  else {
    int v10 = 1;
  }
  double v11 = 0.0;
  if ((a4 & 1) == 0)
  {
    -[_NSOptimalLineBreaker _demeritFromBreak:toBreak:usingExpansionRatio:](a1, a2 + 48, (uint64_t)a3, a5);
    double v11 = v12;
    if (*(unsigned char *)(a1 + 372))
    {
      if (*(void *)a2)
      {
        int v13 = v10 - *(unsigned __int8 *)(a2 + 33);
        if (v13 < 0) {
          int v13 = *(unsigned __int8 *)(a2 + 33) - v10;
        }
        if (v13 >= 2) {
          double v11 = v12 + *(double *)(a1 + 256);
        }
      }
    }
  }
  uint64_t v14 = 0;
  if (fabs(v11) != INFINITY)
  {
    uint64_t v14 = [*(id *)(a1 + 184) allocNode];
    *(void *)uint64_t v14 = [*(id *)(a1 + 184) retainNode:a2];
    *(unsigned char *)(v14 + 33) = v10;
    *(void *)(v14 + 16) = *(void *)(a2 + 16) + 1;
    long long v15 = a3[3];
    long long v17 = *a3;
    long long v16 = a3[1];
    *(_OWORD *)(v14 + 80) = a3[2];
    *(_OWORD *)(v14 + 96) = v15;
    *(_OWORD *)(v14 + 48) = v17;
    *(_OWORD *)(v14 + 64) = v16;
    *(void *)(v14 + 40) = 0;
    *(double *)(v14 + 24) = v11 + *(double *)(a2 + 24);
  }
  return v14;
}

- (unint64_t)_indexOfLastResortHyphenInRange:(CFIndex)a3 maxWidth:(double)a4
{
  if (!a1) {
    return 0;
  }
  int v8 = *(const void **)(a1 + 136);
  if (v8) {
    CFLocaleRef v9 = (const __CFLocale *)CFRetain(v8);
  }
  else {
    CFLocaleRef v9 = CFLocaleCopyCurrent();
  }
  CFLocaleRef v10 = v9;
  if (CFStringIsHyphenationAvailableForLocale(v9))
  {
    if (a2 + a3 < *(void *)(a1 + 480) + *(void *)(a1 + 472)) {
      ++a3;
    }
    unint64_t v11 = a3 + a2;
    while (1)
    {
      double v12 = [*(id *)(a1 + 448) string];
      v19.NSUInteger location = a2;
      v19.NSUInteger length = a3;
      unint64_t HyphenationLocationBeforeIndex = CFStringGetHyphenationLocationBeforeIndex(v12, v11, v19, 0, v10, 0);

      BOOL v14 = HyphenationLocationBeforeIndex != -1 && HyphenationLocationBeforeIndex > a2;
      if (!v14 || HyphenationLocationBeforeIndex >= v11) {
        break;
      }
      objc_msgSend(*(id *)(a1 + 360), "widthOfSubstringWithRange:", a2, HyphenationLocationBeforeIndex - a2);
      double v17 = v16;
      -[_NSOptimalLineBreaker _computeFontMetricsAtIndex:](a1, HyphenationLocationBeforeIndex);
      unint64_t v11 = HyphenationLocationBeforeIndex;
      if (v17 + *(double *)(a1 + 120) <= a4) {
        goto LABEL_19;
      }
    }
  }
  unint64_t HyphenationLocationBeforeIndex = 0x7FFFFFFFFFFFFFFFLL;
LABEL_19:
  CFRelease(v10);
  return HyphenationLocationBeforeIndex;
}

- (__CTLine)paragraphLine
{
  return self->_paragraphLine;
}

- (uint64_t)_bestNodeInNodeList:(uint64_t)a3 withLineCount:
{
  uint64_t v5 = a2;
  unint64_t v6 = v5;
  if (a1)
  {
    uint64_t v10 = 0;
    unint64_t v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59___NSOptimalLineBreaker__bestNodeInNodeList_withLineCount___block_invoke;
    v9[3] = &unk_1E55C5750;
    v9[4] = a1;
    v9[5] = &v10;
    v9[6] = a3;
    -[_NSLineBreakerNodeDictionary enumerateClassesAndNodesUsingBlock:](v5, v9);
    uint64_t v7 = v11[3];
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)_attributedStringOverridesMethodWithSelector:(void *)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  uint64_t v5 = [a1 attributedString];
  BOOL v6 = v4 != [v5 methodForSelector:a2];

  return v6;
}

- (void)dealloc
{
  lineBreaks = self->_lineBreaks;
  if (lineBreaks) {
    free(lineBreaks);
  }
  lines = self->_lines;
  if (lines) {
    CFRelease(lines);
  }
  lineInfos = self->_lineInfos;
  if (lineInfos) {
    free(lineInfos);
  }
  wordTokenizer = self->_wordTokenizer;
  if (wordTokenizer) {
    CFRelease(wordTokenizer);
  }
  wordBoundaryTokenizer = self->_wordBoundaryTokenizer;
  if (wordBoundaryTokenizer) {
    CFRelease(wordBoundaryTokenizer);
  }
  lineBreakTokenizer = self->_lineBreakTokenizer;
  if (lineBreakTokenizer) {
    CFRelease(lineBreakTokenizer);
  }
  chosenLineBreaks = self->_chosenLineBreaks;
  if (chosenLineBreaks) {
    free(chosenLineBreaks);
  }
  locale = self->_locale;
  if (locale) {
    CFRelease(locale);
  }
  paragraphLine = self->_paragraphLine;
  if (paragraphLine) {
    CFRelease(paragraphLine);
  }
  v12.receiver = self;
  v12.super_class = (Class)_NSOptimalLineBreaker;
  [(_NSOptimalLineBreaker *)&v12 dealloc];
}

- (void)setLineCountAdjustment:(int64_t)a3
{
  if (self->_lineCountAdjustment != a3)
  {
    self->_lineCountAdjustment = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
  }
}

- (void)setMaximumNumberOfLines:(unint64_t)a3
{
  if (self->_maximumNumberOfLines != a3)
  {
    self->_maximumNumberOfLines = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
  }
}

- (void)setLineBreakAlgorithm:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  if (self->_lineBreakAlgorithm != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_lineBreakAlgorithm, a3);
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    uint64_t v5 = v6;
  }
}

- (void)setUsesHangingPunctuation:(BOOL)a3
{
  if (self->_usesHangingPunctuation != a3)
  {
    self->_usesHangingPunctuation = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    self->_lineBreaksValid = 0;
    self->_cachedHyphenFontRange = (_NSRange)xmmword_18E5F72A0;
  }
}

- (void)setUsesStretchClasses:(BOOL)a3
{
  if (self->_usesStretchClasses != a3)
  {
    self->_usesStretchClasses = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
  }
}

- (void)setAvoidsRivers:(BOOL)a3
{
  if (self->_avoidsRivers != a3)
  {
    self->_avoidsRivers = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
  }
}

- (void)setCompressesLeftAlignedText:(BOOL)a3
{
  if (self->_compressesLeftAlignedText != a3)
  {
    self->_compressesLeftAlignedText = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
  }
}

- (void)setExpandsGlyphs:(BOOL)a3
{
  if (self->_expandsGlyphs != a3)
  {
    self->_expandsGlyphs = a3;
    [(_NSOptimalLineBreaker *)self invalidateWrapping];
  }
}

- (void)setAttributedString:(id)a3
{
  id v4 = a3;
  -[_NSOptimalLineBreaker setAttributedString:paragraphRange:](self, "setAttributedString:paragraphRange:", v4, 0, [v4 length]);
}

- (void)setParagraphRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [(_NSOptimalLineBreaker *)self attributedString];
  -[_NSOptimalLineBreaker setAttributedString:paragraphRange:](self, "setAttributedString:paragraphRange:", v6, location, length);
}

- (__CFLocale)locale
{
  return self->_locale;
}

- (NSParagraphStyle)defaultParagraphStyle
{
  defaultParagraphStyle = self->_defaultParagraphStyle;
  if (defaultParagraphStyle)
  {
    id v3 = defaultParagraphStyle;
  }
  else
  {
    id v3 = +[NSParagraphStyle defaultParagraphStyle];
  }

  return v3;
}

- (void)setDefaultParagraphStyle:(id)a3
{
  if (self->_defaultParagraphStyle != a3)
  {
    id v4 = (NSParagraphStyle *)[a3 copy];
    defaultParagraphStyle = self->_defaultParagraphStyle;
    self->_defaultParagraphStyle = v4;

    [(_NSOptimalLineBreaker *)self invalidateWrapping];
    paragraphStyle = self->_paragraphStyle;
    self->_paragraphStyle = 0;
  }
}

- (void)setOptions:(id)a3
{
  id v32 = a3;
  id v4 = [v32 objectForKeyedSubscript:@"tolerance"];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v4 floatValue];
      self->_tolerance = v5;
    }
  }

  id v6 = [v32 objectForKeyedSubscript:@"justifiedHyphenPenalty"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v6 floatValue];
      self->_justifiedHyphenPenalty = v7;
    }
  }

  int v8 = [v32 objectForKeyedSubscript:@"nonJustifiedHyphenPenalty"];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v8 floatValue];
      self->_nonJustifiedHyphenPenalty = v9;
    }
  }

  uint64_t v10 = [v32 objectForKeyedSubscript:@"twoHyphenPenalty"];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v10 floatValue];
      self->_twoHyphenPenalty = v11;
    }
  }

  objc_super v12 = [v32 objectForKeyedSubscript:@"stretchClassMismatchPenalty"];
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v12 floatValue];
      self->_stretchClassMismatchPenalty = v13;
    }
  }

  BOOL v14 = [v32 objectForKeyedSubscript:@"riverPenalty"];
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v14 floatValue];
      self->_riverPenalty = v15;
    }
  }

  double v16 = [v32 objectForKeyedSubscript:@"expansionPower"];
  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v16 floatValue];
      self->_expansionPower = v17;
    }
  }

  double v18 = [v32 objectForKeyedSubscript:@"expansionWeight"];
  if (v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v18 floatValue];
      self->_expansionWeight = v19;
    }
  }

  double v20 = [v32 objectForKeyedSubscript:@"maxContract"];
  if (v20)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v20 floatValue];
      self->_maxContract = v21;
    }
  }

  double v22 = [v32 objectForKeyedSubscript:@"maxExpand"];
  if (v22)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v22 floatValue];
      self->_maxExpand = v23;
    }
  }

  double v24 = [v32 objectForKeyedSubscript:@"nonJustifiedStretchFactor"];
  if (v24)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v24 floatValue];
      self->_nonJustifiedStretchFactor = v25;
    }
  }

  char v26 = [v32 objectForKeyedSubscript:@"maxGlyphContract"];
  if (v26)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v26 floatValue];
      self->_maxGlyphContract = v27;
    }
  }

  double v28 = [v32 objectForKeyedSubscript:@"maxGlyphExpand"];
  if (v28)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v28 floatValue];
      self->_maxGlyphExpand = v29;
    }
  }

  char v30 = [v32 objectForKeyedSubscript:@"minPreHyphenLength"];
  if (v30)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      self->_minPreHyphenLength = [v30 integerValue];
    }
  }

  double v31 = [v32 objectForKeyedSubscript:@"minPostHyphenLength"];
  if (v31)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      self->_minPostHyphenLength = [v31 integerValue];
    }
  }
}

- (void)_paragraphStyle
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[_NSOptimalLineBreaker _computeParagraphStyleValues](a1);
    a1 = (id)v2[18];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (double)_naturalWidthFromBreak:(id *)a3 toBreak:(id *)a4
{
  double v5 = 0.0;
  -[_NSOptimalLineBreaker _getNaturalWidth:expand:contract:fromBreak:toBreak:]((id *)&self->super.isa, &v5, 0, 0, (uint64_t)a3, (uint64_t)a4);
  return v5;
}

- (void)_estimatedExpansionRatioForLineWithNaturalWidth:(uint64_t)a1
{
  if (a1)
  {
    if (a2 <= 0.0 || *(double *)(a1 + 456) < a2) {
      -[_NSOptimalLineBreaker _estimatedExpansionRatioForLineWithNaturalWidth:]();
    }
    -[_NSOptimalLineBreaker _computeParagraphStyleValues]((void *)a1);
    uint64_t v3 = *(void *)(a1 + 152);
    if (v3 != 3) {
      -[_NSOptimalLineBreaker _computeFontMetricsAtIndex:](a1, *(void *)(a1 + 472));
    }
  }
}

- (long)_breakPenaltyForHyphenationFactor:(uint64_t)a1
{
  long double result = 0.0;
  if (a1)
  {
    if (a2 == 0.0)
    {
      return INFINITY;
    }
    else if (a2 != 1.0)
    {
      -[_NSOptimalLineBreaker _estimatedExpansionRatioForLineWithNaturalWidth:](a1, *(double *)(a1 + 456) * a2);
      double v6 = *(double *)(a1 + 288);
      return v6 * pow(fabs(v5), *(long double *)(a1 + 280)) + 0.5;
    }
  }
  return result;
}

- (double)_softHyphenPenaltyForBreak:(uint64_t)a1
{
  double v2 = 0.0;
  if (a1)
  {
    __int16 v4 = *(_WORD *)(a2 + 48);
    if (v4) {
      -[_NSOptimalLineBreaker _softHyphenPenaltyForBreak:]();
    }
    if ((v4 & 2) == 0) {
      -[_NSOptimalLineBreaker _softHyphenPenaltyForBreak:]();
    }
    double v6 = *(double *)(a1 + 392);
    if (v6 >= 0.0)
    {
      float v7 = (void *)(a1 + 232);
      if (*(double *)(a1 + 232) < 0.0) {
        *(long double *)(a1 + 232) = -[_NSOptimalLineBreaker _breakPenaltyForHyphenationFactor:](a1, v6);
      }
    }
    else
    {
      -[_NSOptimalLineBreaker _computeParagraphStyleValues]((void *)a1);
      if (*(void *)(a1 + 152) == 3) {
        float v7 = (void *)(a1 + 216);
      }
      else {
        float v7 = (void *)(a1 + 224);
      }
    }
    if ((*(_WORD *)(a2 + 48) & 0x80) == 0 && *(void *)(a2 + 8) != 1) {
      return *(double *)v7;
    }
  }
  return v2;
}

- (long)_implicitNBSPPenaltyForBreak:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  __int16 v2 = *(_WORD *)(a2 + 48);
  if (v2) {
    -[_NSOptimalLineBreaker _implicitNBSPPenaltyForBreak:]();
  }
  if ((v2 & 0x40) == 0) {
    -[_NSOptimalLineBreaker _implicitNBSPPenaltyForBreak:]();
  }
  double v4 = *(double *)(a1 + 392);
  if (v4 >= 0.0)
  {
    long double result = *(double *)(a1 + 240);
    if (result < 0.0)
    {
      double v6 = 0.5;
      if (v4 >= 0.5) {
        double v6 = *(double *)(a1 + 392);
      }
      long double result = -[_NSOptimalLineBreaker _breakPenaltyForHyphenationFactor:](a1, v6);
      *(long double *)(a1 + 240) = result;
    }
  }
  else
  {
    -[_NSOptimalLineBreaker _computeParagraphStyleValues]((void *)a1);
    if (*(void *)(a1 + 152) == 3) {
      return *(double *)(a1 + 216);
    }
    else {
      return *(double *)(a1 + 224);
    }
  }
  return result;
}

- (double)_demeritFromBreak:(uint64_t)a3 toBreak:
{
  if (!a1) {
    return 0.0;
  }
  double v6 = -[_NSOptimalLineBreaker _expansionRatioFromBreak:toBreak:](a1, a2, a3);

  -[_NSOptimalLineBreaker _demeritFromBreak:toBreak:usingExpansionRatio:](a1, a2, a3, v6);
  return result;
}

- (void)_demeritFromBreak:(uint64_t)a3 toBreak:(double)a4 usingExpansionRatio:
{
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 8)) {
      -[_NSOptimalLineBreaker _demeritFromBreak:toBreak:usingExpansionRatio:]();
    }
    double v6 = fabs(a4);
    if (v6 != INFINITY
      && ((*(_WORD *)(a3 + 48) & 1) == 0
       || -[_NSOptimalLineBreaker _shouldAllowLastLineFromBreak:toBreak:](a1, a2, a3)))
    {
      if (a4 >= -1.0) {
        pow(v6, *(long double *)(a1 + 280));
      }
      -[_NSOptimalLineBreaker _breakPenaltyForBreak:](a1, a3);
    }
  }
}

- (double)_breakPenaltyForBreak:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  __int16 v2 = *(_WORD *)(a2 + 48);
  if ((v2 & 0x11) != 0) {
    return 0.0;
  }
  if ((v2 & 2) != 0) {
    return -[_NSOptimalLineBreaker _softHyphenPenaltyForBreak:](a1, a2);
  }
  if ((v2 & 0x40) == 0) {
    return 0.0;
  }
  return -[_NSOptimalLineBreaker _implicitNBSPPenaltyForBreak:](a1, a2);
}

- (BOOL)_breakRange:(uint64_t)a3 fallsWithinTokenWithTokenizer:(CFStringTokenizerRef)tokenizer
{
  if (!a1) {
    return 0;
  }
  uint64_t v5 = *(void *)(a1 + 472);
  if (a2 == v5) {
    return 0;
  }
  unint64_t v6 = a2 + a3;
  if (a2 + a3 == *(void *)(a1 + 480) + v5) {
    return 0;
  }
  CFIndex location = CFStringTokenizerGetCurrentTokenRange(tokenizer).location;
  if (!CFStringTokenizerGoToTokenAtIndex(tokenizer, a2)) {
    return 0;
  }
  CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(tokenizer);
  BOOL v11 = CurrentTokenRange.location < a2 && v6 < CurrentTokenRange.location + CurrentTokenRange.length;
  if (location != -1) {
    CFStringTokenizerGoToTokenAtIndex(tokenizer, location);
  }
  return v11;
}

- (uint64_t)_shouldAllowLastLineFromBreak:(uint64_t)a3 toBreak:
{
  BOOL v3 = a1;
  if (a1)
  {
    if ((*(_WORD *)(a3 + 48) & 1) == 0) {
      -[_NSOptimalLineBreaker _shouldAllowLastLineFromBreak:toBreak:]();
    }
    if ((*(unsigned char *)(a1 + 440) & 1) != 0 && *(unsigned char *)(a1 + 375))
    {
      CFLocaleRef v4 = *(const __CFLocale **)(a1 + 136);
      if (v4)
      {
        unint64_t v6 = (id)CFLocaleGetValue(v4, (CFLocaleKey)*MEMORY[0x1E4F1D218]);
        float v7 = v6;
        if (v6
          && (([v6 isEqualToString:@"zh"] & 1) != 0
           || [v7 isEqualToString:@"ja"]))
        {
          int v8 = (__CFStringTokenizer *)-[_NSOptimalLineBreaker _lineBreakTokenizer](v3);
          BOOL v3 = ![(_NSOptimalLineBreaker *)v3 _breakRange:*(void *)(a2 + 8) fallsWithinTokenWithTokenizer:v8];
LABEL_13:

          return v3;
        }
      }
      else
      {
        float v7 = 0;
      }
      BOOL v3 = 1;
      goto LABEL_13;
    }
    return 1;
  }
  return v3;
}

- (uint64_t)_lineBreakTokenizer
{
  if (result)
  {
    uint64_t v1 = result;
    __int16 v2 = [*(id *)(result + 448) string];

    if (!*(unsigned char *)(v1 + 88))
    {
      CFRange v3 = *(CFRange *)(v1 + 472);
      CFLocaleRef v4 = *(__CFStringTokenizer **)(v1 + 80);
      if (v4) {
        CFStringTokenizerSetString(v4, v2, v3);
      }
      else {
        *(void *)(v1 + 80) = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v2, v3, 3uLL, *(CFLocaleRef *)(v1 + 136));
      }
      *(unsigned char *)(v1 + 88) = 1;
    }
    return *(void *)(v1 + 80);
  }
  return result;
}

- (double)_minimumDemeritForLineEndingAtBreak:(double)a3 withExpansionRatio:
{
  if (!a1) {
    return 0.0;
  }
  double v5 = -[_NSOptimalLineBreaker _breakPenaltyForBreak:](a1, a2);
  if (a3 >= -1.0)
  {
    long double v7 = fabs(a3);
    double v8 = *(double *)(a1 + 288);
    double v6 = v8 * pow(v7, *(long double *)(a1 + 280)) + 0.5 + 1.0;
  }
  else
  {
    double v6 = INFINITY;
  }
  return (v5 + v6) * (v5 + v6);
}

- (void)_enumerateHyphenationPointsWithBlock:(uint64_t)a1
{
  v37[32] = *MEMORY[0x1E4F143B8];
  CFRange v3 = a2;
  if (a1)
  {
    CFLocaleRef v4 = *(const void **)(a1 + 136);
    CFLocaleRef v5 = v4 ? (const __CFLocale *)CFRetain(v4) : CFLocaleCopyCurrent();
    CFLocaleRef v6 = v5;
    if (v5)
    {
      BOOL v35 = -[_NSOptimalLineBreaker _attributedStringOverridesMethodWithSelector:]((void *)a1, (uint64_t)sel_lineBreakByHyphenatingBeforeIndex_withinRange_);
      if (v35 || CFStringIsHyphenationAvailableForLocale(v6))
      {
        if (*(unsigned char *)(a1 + 377) && (CFLocaleRef Value = (void *)CFLocaleGetValue(v6, (CFLocaleKey)*MEMORY[0x1E4F1D218])) != 0) {
          int v34 = [Value isEqualToString:@"de"];
        }
        else {
          int v34 = 0;
        }
        double v8 = [(id)a1 attributedString];
        float v9 = [v8 string];

        CFIndex v10 = [(id)a1 paragraphRange];
        [(id)a1 paragraphRange];
        v13.NSUInteger length = v11;
        objc_super v12 = *(__CFStringTokenizer **)(a1 + 64);
        CFLocaleRef v33 = v6;
        v13.CFIndex location = v10;
        if (v12)
        {
          CFStringTokenizerSetString(v12, v9, v13);
          BOOL v14 = *(__CFStringTokenizer **)(a1 + 64);
        }
        else
        {
          BOOL v14 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v9, v13, 0, v6);
          *(void *)(a1 + 64) = v14;
        }
        if (CFStringTokenizerAdvanceToNextToken(v14))
        {
          id v32 = v3;
          while (1)
          {
            CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)*(void *)(a1 + 64));
            unint64_t v16 = CurrentTokenRange.location + CurrentTokenRange.length;
            if (v35) {
              break;
            }
            uint64_t AllPossibleHyphenationLocations = _CFHyphenationGetAllPossibleHyphenationLocations();
            if (AllPossibleHyphenationLocations >= 32) {
              uint64_t v17 = 32;
            }
            else {
              uint64_t v17 = AllPossibleHyphenationLocations;
            }
            if (AllPossibleHyphenationLocations != -1 && v17) {
              goto LABEL_31;
            }
LABEL_54:
            if (!CFStringTokenizerAdvanceToNextToken(*(CFStringTokenizerRef *)(a1 + 64))) {
              goto LABEL_55;
            }
          }
          uint64_t v17 = 0;
          unint64_t v18 = CurrentTokenRange.location + CurrentTokenRange.length;
          while (1)
          {
            float v19 = [(id)a1 attributedString];
            unint64_t v20 = objc_msgSend(v19, "lineBreakByHyphenatingBeforeIndex:withinRange:", v18, CurrentTokenRange.location, CurrentTokenRange.length);

            if (v20 == 0x7FFFFFFFFFFFFFFFLL || CurrentTokenRange.location >= v20 || v20 >= v18) {
              break;
            }
            v37[v17] = v20;
            unint64_t v18 = v20;
            if (++v17 == 32)
            {
              CFRange v3 = v32;
              goto LABEL_31;
            }
          }
          CFRange v3 = v32;
          if (!v17) {
            goto LABEL_54;
          }
LABEL_31:
          if (v34) {
            CFIndex CurrentSubTokens = CFStringTokenizerGetCurrentSubTokens(*(CFStringTokenizerRef *)(a1 + 64), &ranges, 32, 0);
          }
          else {
            CFIndex CurrentSubTokens = 0;
          }
          if (v17 >= 1)
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              unint64_t v24 = v37[i];
              if (v24 <= CurrentTokenRange.location || v16 <= v24) {
                -[_NSOptimalLineBreaker _enumerateHyphenationPointsWithBlock:]();
              }
              if (v24 - CurrentTokenRange.location >= *(void *)(a1 + 336) && v16 - v24 >= *(void *)(a1 + 344))
              {
                if (CurrentSubTokens < 2)
                {
                  BOOL v29 = 0;
                }
                else
                {
                  p_CFRange ranges = &ranges;
                  CFIndex v27 = CurrentSubTokens - 1;
                  do
                  {
                    CFIndex location = p_ranges->location;
                    ++p_ranges;
                    BOOL v29 = location == v24;
                  }
                  while (location != v24 && v27-- != 0);
                }
                v3[2](v3, v24, v29);
              }
            }
          }
          goto LABEL_54;
        }
LABEL_55:
        CFLocaleRef v31 = v33;
      }
      else
      {
        CFLocaleRef v31 = v6;
      }
      CFRelease(v31);
    }
  }
}

- (uint64_t)_shouldAvoidBreakingAfterWord:(uint64_t)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_5;
  }
  if (_shouldAvoidBreakingAfterWord__once != -1) {
    dispatch_once(&_shouldAvoidBreakingAfterWord__once, &__block_literal_global_1);
  }
  unint64_t v4 = [v3 length];
  if (v4 <= _shouldAvoidBreakingAfterWord__maxShortWordLength)
  {
    CFLocaleRef v6 = *(void **)(a1 + 136);
    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F1CA20] currentLocale];
    }
    double v8 = v7;
    float v9 = [v7 languageCode];
    CFIndex v10 = [(id)_shouldAvoidBreakingAfterWord__wordSets objectForKeyedSubscript:v9];
    if (v10)
    {
      uint64_t v11 = [v3 lowercaseString];

      uint64_t v5 = [v10 containsObject:v11];
      id v3 = (id)v11;
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
LABEL_5:
    uint64_t v5 = 0;
  }

  return v5;
}

- (NSString)debugString
{
  id v3 = [(_NSOptimalLineBreaker *)self attributedString];
  unint64_t v4 = [v3 string];

  uint64_t v5 = [MEMORY[0x1E4F28E78] string];
  NSUInteger location = self->_paragraphRange.location;
  if (self->_lineBreakCount)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    while (1)
    {
      lineBreaks = self->_lineBreaks;
      NSUInteger v10 = lineBreaks[v7].var0.location;
      NSUInteger length = v10 - location;
      if (v10 > location)
      {
        objc_super v12 = objc_msgSend(v4, "substringWithRange:");
        [v5 appendString:v12];
      }
      unsigned __int16 var5 = lineBreaks[v7].var5;
      if ((var5 & 2) != 0) {
        break;
      }
      NSUInteger length = lineBreaks[v7].var0.length;
      if (!length)
      {
        float v15 = v5;
        unint64_t v16 = @"¦";
LABEL_12:
        objc_msgSend(v15, "appendString:", v16, length);
        goto LABEL_13;
      }
      BOOL v14 = [v4 substringWithRange:lineBreaks[v7].var0.location];
      [v5 appendFormat:@"[%@]", v14];

LABEL_13:
      NSUInteger location = lineBreaks[v7].var0.length + lineBreaks[v7].var0.location;
      ++v8;
      ++v7;
      if (v8 >= self->_lineBreakCount)
      {
        NSUInteger v17 = self->_paragraphRange.location;
        goto LABEL_16;
      }
    }
    float v15 = v5;
    if ((var5 & 0x80) != 0) {
      unint64_t v16 = @"^";
    }
    else {
      unint64_t v16 = @"'";
    }
    goto LABEL_12;
  }
  NSUInteger v17 = self->_paragraphRange.location;
LABEL_16:
  if (self->_paragraphRange.length + v17 > location)
  {
    unint64_t v18 = objc_msgSend(v4, "substringWithRange:");
    [v5 appendString:v18];
  }

  return (NSString *)v5;
}

- (void)_calculateFirstFitWrapping
{
  if (a1 && !*(unsigned char *)(a1 + 9))
  {
    if (*(void *)(a1 + 32))
    {
      id v28 = [MEMORY[0x1E4F1CA48] array];
      [v28 addObject:&unk_1EDD68C88];
      if (*(void *)(a1 + 32) != 1)
      {
        unint64_t v2 = 0;
        do
        {
          __int16 v3 = *(_WORD *)(*(void *)(a1 + 24) + (v2 << 6) + 48);
          [(id)a1 textContainerWidth];
          double v5 = v4;
          uint64_t v6 = *(void *)(a1 + 24);
          if (v3) {
            double v5 = v4 - *(double *)(v6 + (v2 << 6) + 16);
          }
          unint64_t v7 = v2 + 1;
          uint64_t v8 = (v2 << 6) + 112;
          uint64_t v9 = (v2 << 6) + 64;
          do
          {
            unint64_t v10 = v7;
            uint64_t v11 = v8;
            uint64_t v12 = v9;
            if (v7 >= *(void *)(a1 + 32) - 1) {
              break;
            }
            [(id)a1 _naturalWidthFromBreak:v6 + (v2 << 6) toBreak:v6 + v8 + 16];
            uint64_t v6 = *(void *)(a1 + 24);
            if (v13 > v5) {
              break;
            }
            uint64_t v8 = v11 + 64;
            unint64_t v7 = v10 + 1;
            uint64_t v9 = v12 + 64;
          }
          while ((*(_WORD *)(v6 + v11) & 1) == 0);
          if ((*(_WORD *)(v6 + v11) & 2) != 0 && v10 > v2)
          {
            uint64_t v14 = v6 + v12;
            unint64_t v15 = v10;
            while ((*(_WORD *)(v14 + 48) & 2) != 0)
            {
              --v15;
              v14 -= 64;
              if (v15 <= v2) {
                goto LABEL_21;
              }
            }
            objc_msgSend((id)a1, "_naturalWidthFromBreak:toBreak:", v6 + (v2 << 6));
            if (v16 > v5 * 0.9) {
              unint64_t v10 = v15;
            }
          }
LABEL_21:
          NSUInteger v17 = [NSNumber numberWithUnsignedInteger:v10];
          [v28 addObject:v17];

          unint64_t v2 = v10;
        }
        while (v10 < *(void *)(a1 + 32) - 1);
      }
      uint64_t v18 = [v28 count];
      *(void *)(a1 + 200) = v18;
      *(void *)(a1 + 192) = malloc_type_realloc(*(void **)(a1 + 192), v18 << 6, 0x1000040A976A909uLL);
      if (*(void *)(a1 + 200))
      {
        uint64_t v19 = 0;
        unint64_t v20 = 0;
        do
        {
          float v21 = (_OWORD *)(*(void *)(a1 + 192) + v19);
          uint64_t v22 = *(void *)(a1 + 24);
          float v23 = [v28 objectAtIndexedSubscript:v20];
          unint64_t v24 = (long long *)(v22 + ([v23 unsignedIntegerValue] << 6));
          long long v25 = v24[3];
          long long v27 = *v24;
          long long v26 = v24[1];
          v21[2] = v24[2];
          v21[3] = v25;
          *float v21 = v27;
          v21[1] = v26;

          ++v20;
          v19 += 64;
        }
        while (v20 < *(void *)(a1 + 200));
      }
      *(unsigned char *)(a1 + 9) = 1;
    }
    else
    {
      *(void *)(a1 + 200) = 0;
      *(unsigned char *)(a1 + 9) = 1;
    }
  }
}

- (uint64_t)_equivalenceClassForNode:(int)a3 asTerminalNode:
{
  if (!a1) {
    return 0;
  }
  if (!a2 || *(unsigned char *)(a2 + 32)) {
    -[_NSOptimalLineBreaker _equivalenceClassForNode:asTerminalNode:]();
  }
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65___NSOptimalLineBreaker__equivalenceClassForNode_asTerminalNode___block_invoke;
  v5[3] = &unk_1E55C5728;
  v5[4] = &v6;
  -[_NSOptimalLineBreaker _enumerateEquivalenceClassComponentsForNode:asTerminalNode:withBlock:](a1, (void *)a2, a3, v5);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_enumerateEquivalenceClassComponentsForNode:(int)a3 asTerminalNode:(void *)a4 withBlock:
{
  unint64_t v7 = a4;
  if (a1)
  {
    uint64_t v8 = *(void *)(a1 + 416);
    if (a3)
    {
      if (!v8) {
        goto LABEL_18;
      }
      uint64_t v12 = v7;
      (*((void (**)(char *, void))v7 + 2))(v7, a2[2]);
      goto LABEL_17;
    }
    uint64_t v12 = v7;
    if (v8 || (uint64_t v11 = *(void *)(a1 + 424)) != 0 && v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      (*((void (**)(char *, void))v7 + 2))(v7, a2[2]);
      unint64_t v7 = v12;
    }
    uint64_t v9 = (void (**)(id, void))(v7 + 16);
    (*((void (**)(char *, void))v7 + 2))(v7, a2[6]);
    (*v9)(v12, a2[7]);
    if (*(unsigned char *)(a1 + 372)) {
      (*((void (**)(char *, void))v12 + 2))(v12, *((unsigned __int8 *)a2 + 33));
    }
    unint64_t v7 = v12;
    if (*(unsigned char *)(a1 + 373))
    {
      if (*a2) {
        uint64_t v10 = *(void *)(*a2 + 56) + *(void *)(*a2 + 48);
      }
      else {
        uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      }
      (*((void (**)(char *, uint64_t))v12 + 2))(v12, v10);
      (*((void (**)(char *, void))v12 + 2))(v12, a2[5]);
LABEL_17:
      unint64_t v7 = v12;
    }
  }
LABEL_18:
}

- (uint64_t)_bestNode:(uint64_t)a3 dominatesNode:
{
  if (result)
  {
    if (!a2 || !a3) {
      -[_NSOptimalLineBreaker _bestNode:dominatesNode:]();
    }
    if (*(unsigned char *)(a2 + 32) || *(unsigned char *)(a3 + 32)) {
      -[_NSOptimalLineBreaker _bestNode:dominatesNode:].cold.4();
    }
    if (a3 != a2)
    {
      if (*(void *)(a2 + 48) != *(void *)(a3 + 48) || *(void *)(a2 + 56) != *(void *)(a3 + 56)) {
        -[_NSOptimalLineBreaker _bestNode:dominatesNode:]();
      }
      uint64_t v5 = result;
      if ((-[_NSOptimalLineBreaker _node:isBetterThanNode:](result, (uint64_t *)a2, (uint64_t *)a3) & 1) == 0) {
        -[_NSOptimalLineBreaker _bestNode:dominatesNode:]();
      }
      uint64_t v6 = *(void *)(v5 + 424);
      if (!v6 || v6 == 0x7FFFFFFFFFFFFFFFLL || *(void *)(a3 + 16) == *(void *)(a2 + 16))
      {
        uint64_t v7 = *(void *)(v5 + 416);
        if (*(unsigned char *)(v5 + 372))
        {
          if (!v7 && *(double *)(a3 + 24) >= *(double *)(a2 + 24) + *(double *)(v5 + 256)) {
            return 1;
          }
        }
        else if (!*(unsigned char *)(v5 + 373))
        {
          unint64_t v8 = *(void *)(a3 + 16);
          unint64_t v9 = *(void *)(a2 + 16);
          if (v7 < 0)
          {
            if (v8 - v7 < v9) {
              return 1;
            }
          }
          else if (v8 > v9 + v7 || !v7 && v8 < v9)
          {
            return 1;
          }
        }
      }
    }
    return 0;
  }
  return result;
}

- (uint64_t)_mustExceedLineCount:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (!*(unsigned char *)(result + 8) || (uint64_t v3 = *(void *)(result + 32)) == 0) {
      -[_NSOptimalLineBreaker _mustExceedLineCount:]();
    }
    if (a2)
    {
      if (a2 == 0x7FFFFFFFFFFFFFFFLL) {
        -[_NSOptimalLineBreaker _mustExceedLineCount:]();
      }
      uint64_t v5 = *(void *)(result + 24);
      uint64_t v6 = v5 + (v3 << 6);
      [(id)result _naturalWidthFromBreak:v5 toBreak:v6 - 64];
      double v8 = v7 - (*(double *)(v6 - 8) - *(double *)(v6 - 48) - *(double *)(v5 + 56));
      -[_NSOptimalLineBreaker _computeParagraphStyleValues]((void *)v2);
      double v9 = *(double *)(v2 + 160);
      -[_NSOptimalLineBreaker _computeParagraphStyleValues]((void *)v2);
      return v8 > v9 + (double)(unint64_t)(a2 - 1) * *(double *)(v2 + 168);
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (uint64_t)_hasArtificialBreak
{
  if (result)
  {
    if (!*(unsigned char *)(result + 9)) {
      -[_NSOptimalLineBreaker _hasArtificialBreak]();
    }
    uint64_t v1 = *(void *)(result + 200);
    if (v1)
    {
      uint64_t v2 = v1 - 1;
      uint64_t v3 = (unsigned __int16 *)(*(void *)(result + 192) + 48);
      do
      {
        uint64_t v4 = v2;
        unsigned int v5 = *v3;
        v3 += 32;
        double result = (v5 >> 4) & 1;
        if ((v5 & 0x10) != 0) {
          break;
        }
        --v2;
      }
      while (v4);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)_forcedBreakBetweenBreak:(_OWORD *)a3@<X2> andBreak:(_OWORD *)a4@<X3> withLastNBSP:(char *)a5@<X4> shouldRetryEndBreak:(uint64_t)a6@<X8>
{
  *(_OWORD *)(a6 + 32) = 0u;
  *(_OWORD *)(a6 + 48) = 0u;
  *(_OWORD *)a6 = 0u;
  *(_OWORD *)(a6 + 16) = 0u;
  if (a1)
  {
    __int16 v12 = *(_WORD *)(a2 + 48);
    -[_NSOptimalLineBreaker _computeParagraphStyleValues]((void *)a1);
    uint64_t v13 = 160;
    if ((v12 & 1) == 0) {
      uint64_t v13 = 168;
    }
    double v14 = *(double *)(a1 + v13);
    if (*(void *)a4 == 0x7FFFFFFFFFFFFFFFLL
      || *(void *)(a2 + 8) + *(void *)a2 >= *(void *)a4
      || (double v15 = -[_NSOptimalLineBreaker _expansionRatioFromBreak:toBreak:](a1, a2, (uint64_t)a4), v15 < -1.0)
      || v15 > *(double *)(a1 + 16))
    {
      unint64_t v16 = *(void *)(a2 + 8) + *(void *)a2;
      NSUInteger v17 = -[_NSOptimalLineBreaker _lineMetrics]((id *)a1);
      double v18 = v14 + 0.001;
      unint64_t v19 = [v17 suggestedLineBreakAfterIndex:v16 withWidth:v18];

      BOOL v20 = v19 != 0x7FFFFFFFFFFFFFFFLL && v19 > v16;
      if (!v20 || v19 >= *(void *)a3)
      {
        char v23 = 0;
        long long v24 = a3[1];
        *(_OWORD *)a6 = *a3;
        *(_OWORD *)(a6 + 16) = v24;
        long long v25 = a3[3];
        *(_OWORD *)(a6 + 32) = a3[2];
        *(_OWORD *)(a6 + 48) = v25;
LABEL_22:
        *a5 = v23;
        *(_WORD *)(a6 + 48) |= 0x10u;
        return;
      }
      int v21 = *(unsigned __int8 *)(a1 + 378);
      if (*(unsigned char *)(a1 + 378))
      {
        unint64_t v22 = [(_NSOptimalLineBreaker *)a1 _indexOfLastResortHyphenInRange:v19 - v16 maxWidth:v18];
        int v21 = v22 != 0x7FFFFFFFFFFFFFFFLL;
        if (v22 != 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v19 = v22;
        }
      }
      *(void *)a6 = v19;
      *(_OWORD *)(a6 + 8) = 0u;
      *(_OWORD *)(a6 + 24) = 0u;
      *(void *)(a6 + 40) = 0;
      *(void *)(a6 + 56) = *(void *)(a2 + 56);
      *(_WORD *)(a6 + 48) = 0;
      if (v21)
      {
        -[_NSOptimalLineBreaker _computeFontMetricsAtIndex:](a1, v19);
        *(void *)(a6 + 24) = *(void *)(a1 + 120);
        *(_WORD *)(a6 + 48) = 10;
      }
    }
    else
    {
      long long v26 = a4[1];
      *(_OWORD *)a6 = *a4;
      *(_OWORD *)(a6 + 16) = v26;
      long long v27 = a4[3];
      *(_OWORD *)(a6 + 32) = a4[2];
      *(_OWORD *)(a6 + 48) = v27;
    }
    char v23 = 1;
    goto LABEL_22;
  }
}

- (void)_createLines
{
}

- ($554B148941027912B77C686939519A4B)lineInfoAtIndex:(SEL)a3
{
  -[_NSOptimalLineBreaker _createLines]((uint64_t)self);
  double v8 = &self->_lineInfos[a4];
  long long v9 = *(_OWORD *)&v8->var2;
  retstr->var1 = v8->var1;
  *(_OWORD *)&retstr->var2 = v9;
  retstr->var4 = v8->var4;
  CGSize size = v8->var0.size;
  retstr->var0.origin = v8->var0.origin;
  retstr->var0.CGSize size = size;
  return result;
}

- (__CTLine)lineAtIndex:(unint64_t)a3 lineInfo:(id *)a4
{
  -[_NSOptimalLineBreaker _createLines]((uint64_t)self);
  if (a4)
  {
    double v7 = &self->_lineInfos[a3];
    a4->var0.origin = v7->var0.origin;
    CGSize size = v7->var0.size;
    _NSRange var1 = v7->var1;
    long long v10 = *(_OWORD *)&v7->var2;
    a4->var4 = v7->var4;
    a4->_NSRange var1 = var1;
    *(_OWORD *)&a4->var2 = v10;
    a4->var0.CGSize size = size;
  }
  lines = self->_lines;

  return (__CTLine *)CFArrayGetValueAtIndex(lines, a3);
}

- (unint64_t)_indexOfLineBreakAtCharacterIndex:(unint64_t)result
{
  if (result)
  {
    uint64_t v2 = (void *)result;
    double result = *(void *)(result + 32);
    if (!result) {
      -[_NSOptimalLineBreaker _indexOfLineBreakAtCharacterIndex:]();
    }
    unint64_t v3 = v2[59];
    if (v3 > a2 || v2[60] + v3 < a2) {
      -[_NSOptimalLineBreaker _indexOfLineBreakAtCharacterIndex:]();
    }
    if (v3 == a2)
    {
      return 0;
    }
    else if (result < 2)
    {
      return 1;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v5 = v2[3];
      do
      {
        if (*(void *)(v5 + ((v4 + ((result - v4) >> 1)) << 6)) >= a2) {
          double result = v4 + ((result - v4) >> 1);
        }
        else {
          v4 += (result - v4) >> 1;
        }
      }
      while (v4 + 1 < result);
    }
  }
  return result;
}

- (void)enumerateLineBreaksInRange:(_NSRange)a3 withBlock:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  double v7 = (void (**)(void))a4;
  unint64_t v8 = -[_NSOptimalLineBreaker _indexOfLineBreakAtCharacterIndex:]((unint64_t)self, location);
  NSUInteger v9 = location + length;
  unint64_t v10 = v8 - 1;
  for (unint64_t i = v8 << 6;
        ++v10 < self->_lineBreakCount
     && *(NSUInteger *)((char *)&self->_lineBreaks->var0.length + i)
      + *(NSUInteger *)((char *)&self->_lineBreaks->var0.location + i) <= v9;
        i += 64)
  {
    v7[2](v7);
  }
}

- (BOOL)allowsHyphenation
{
  return self->_allowsHyphenation;
}

- (double)hyphenationFactor
{
  return self->_hyphenationFactor;
}

- (unint64_t)minHyphenationLineCount
{
  return self->_minHyphenationLineCount;
}

- (BOOL)shouldFillLastLine
{
  return self->_shouldFillLastLine;
}

- (double)minimumLastLineLength
{
  return self->_minimumLastLineLength;
}

- (int64_t)lineCountAdjustment
{
  return self->_lineCountAdjustment;
}

- (unint64_t)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

- (NSString)lineBreakAlgorithm
{
  return self->_lineBreakAlgorithm;
}

- (BOOL)usesHangingPunctuation
{
  return self->_usesHangingPunctuation;
}

- (BOOL)usesStretchClasses
{
  return self->_usesStretchClasses;
}

- (BOOL)avoidsRivers
{
  return self->_avoidsRivers;
}

- (BOOL)compressesLeftAlignedText
{
  return self->_compressesLeftAlignedText;
}

- (BOOL)expandsGlyphs
{
  return self->_expandsGlyphs;
}

- (unint64_t)lineBreakStrategy
{
  return self->_lineBreakStrategy;
}

- (int)koreanLineBreakBehavior
{
  return self->_koreanLineBreakBehavior;
}

- (int)prepositionLineBreakBehavior
{
  return self->_prepositionLineBreakBehavior;
}

- (BOOL)breaksWithinCJWords
{
  return self->_breaksWithinCJWords;
}

- (BOOL)usesCFStringTokenizerForLineBreaks
{
  return self->_usesCFStringTokenizerForLineBreaks;
}

- (BOOL)hyphenatesBetweenMorphemesFreely
{
  return self->_hyphenatesBetweenMorphemesFreely;
}

- (BOOL)hyphenatesAsLastResort
{
  return self->_hyphenatesAsLastResort;
}

- (double)textContainerWidth
{
  return self->_textContainerWidth;
}

- (unint64_t)minPreHyphenLength
{
  return self->_minPreHyphenLength;
}

- (unint64_t)minPostHyphenLength
{
  return self->_minPostHyphenLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_lineBreakAlgorithm, 0);
  objc_storeStrong((id *)&self->_lineMetrics, 0);
  objc_storeStrong((id *)&self->_defaultParagraphStyle, 0);
  objc_storeStrong((id *)&self->_nodePool, 0);
  objc_storeStrong((id *)&self->_consumedNBSPRanges, 0);
  objc_storeStrong((id *)&self->_paragraphStyle, 0);

  objc_storeStrong((id *)&self->_cachedHyphenFont, 0);
}

- (void)setAttributedString:paragraphRange:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker setAttributedString:paragraphRange:]", "NSOptimalLineBreaker.m", 393, "range.location != NSNotFound");
}

- (void)setAttributedString:paragraphRange:.cold.2()
{
  __assert_rtn("-[_NSOptimalLineBreaker setAttributedString:paragraphRange:]", "NSOptimalLineBreaker.m", 394, "NSMaxRange(range) <= attributedString.length");
}

- (void)_expansionRatioFromBreak:toBreak:.cold.1()
{
}

- (void)_estimatedExpansionRatioForLineWithNaturalWidth:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _estimatedExpansionRatioForLineWithNaturalWidth:]", "NSOptimalLineBreaker.m", 689, "0 < naturalWidth && naturalWidth <= _textContainerWidth");
}

- (void)_softHyphenPenaltyForBreak:.cold.1()
{
}

- (void)_softHyphenPenaltyForBreak:.cold.2()
{
}

- (void)_implicitNBSPPenaltyForBreak:.cold.1()
{
}

- (void)_implicitNBSPPenaltyForBreak:.cold.2()
{
}

- (void)_demeritFromBreak:toBreak:usingExpansionRatio:.cold.1()
{
}

- (void)_shouldAllowLastLineFromBreak:toBreak:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _shouldAllowLastLineFromBreak:toBreak:]", "NSOptimalLineBreaker.m", 827, "(end->flags & _NSLineBreakIsParagraphBoundary) != 0 && \"_shouldAllowLastLineFromBreak:toBreak: is only meaningful for last line\"");
}

- (void)_computeFontMetricsAtIndex:.cold.1()
{
}

- (void)_enumerateHyphenationPointsWithBlock:.cold.1()
{
}

- (void)_enumerateOrdinaryLineBreaksWithBlock:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _enumerateOrdinaryLineBreaksWithBlock:]", "NSOptimalLineBreaker.m", 1338, "breakRange.length == 0");
}

- (void)_enumerateOrdinaryLineBreaksWithBlock:.cold.2()
{
  __assert_rtn("-[_NSOptimalLineBreaker _enumerateOrdinaryLineBreaksWithBlock:]", "NSOptimalLineBreaker.m", 1329, "_prepositionLineBreakBehavior == _NSOptimalLineBreakerBreaksAfterPrepositionNever");
}

- (void)_addLineBreakWithRange:flags:.cold.1()
{
  __assert_rtn("-[_NSOptimalLineBreaker _addLineBreakWithRange:flags:]", "NSOptimalLineBreaker.m", 1413, "self.paragraphRange.location <= range.location");
}

- (void)_addLineBreakWithRange:flags:.cold.2()
{
  __assert_rtn("-[_NSOptimalLineBreaker _addLineBreakWithRange:flags:]", "NSOptimalLineBreaker.m", 1414, "NSMaxRange(range) <= NSMaxRange(self.paragraphRange)");
}

- (void)_equivalenceClassForNode:asTerminalNode:.cold.1()
{
}

- (void)_createNodeWithParent:lineBreak:expansionRatio:mustSucceed:.cold.1()
{
}

- (void)_node:isBetterThanNode:.cold.1()
{
}

- (void)_node:isBetterThanNode:.cold.2()
{
}

- (void)_bestNode:dominatesNode:.cold.1()
{
}

- (void)_bestNode:dominatesNode:.cold.2()
{
}

- (void)_bestNode:dominatesNode:.cold.3()
{
}

- (void)_bestNode:dominatesNode:.cold.4()
{
}

- (void)_mustExceedLineCount:.cold.1()
{
}

- (void)_mustExceedLineCount:.cold.2()
{
  __assert_rtn("-[_NSOptimalLineBreaker _mustExceedLineCount:]", "NSOptimalLineBreaker.m", 2106, "lineCount != NSNotFound");
}

- (void)_hasArtificialBreak
{
}

- (void)_calculateOptimalWrappingWithLineBreakFilter:.cold.1()
{
}

- (void)_calculateOptimalWrappingWithLineBreakFilter:.cold.2()
{
  __assert_rtn("-[_NSOptimalLineBreaker _calculateOptimalWrappingWithLineBreakFilter:]", "NSOptimalLineBreaker.m", 2487, "n == 0");
}

- (void)lineBreakAtIndex:.cold.1()
{
}

- (void)_indexOfLineBreakAtCharacterIndex:.cold.1()
{
}

- (void)_indexOfLineBreakAtCharacterIndex:.cold.2()
{
  __assert_rtn("-[_NSOptimalLineBreaker _indexOfLineBreakAtCharacterIndex:]", "NSOptimalLineBreaker.m", 2683, "_paragraphRange.location <= i && i <= NSMaxRange(_paragraphRange)");
}

@end
@interface NSParagraphArbitrator
+ (BOOL)_hyphenatesAsLastResort;
+ (id)paragraphArbitratorWithAttributedString:(id)a3 range:(_NSRange)a4;
+ (int)_languageCategoryForLanguageCode:(id)a3;
+ (int)_lineBreakStyleForFont:(id)a3;
+ (void)initialize;
- ($F08F7EC4C389A89376F473094BC6C9F8)_firstFitLineBreakContextBeforeIndex:(SEL)a3 lineFragmentWidth:(unint64_t)a4 range:(double)a5;
- ($F08F7EC4C389A89376F473094BC6C9F8)_optimalLineBreakContextBeforeIndex:(SEL)a3 lineFragmentWidth:(unint64_t)a4 range:(double)a5;
- ($F08F7EC4C389A89376F473094BC6C9F8)lineBreakContextBeforeIndex:(SEL)a3 lineFragmentWidth:(unint64_t)a4 range:(double)a5;
- (BOOL)_attributedStringOverridesLineBreakBeforeIndex:(id)a3;
- (BOOL)_hyphenatesAsLastResort;
- (BOOL)_shouldUseCFStringTokenizerForLineBreaks;
- (BOOL)_shouldUseOptimalLayout;
- (BOOL)breaksLinesForInteractiveText;
- (BOOL)prepareBreakIteratorForCharacterAtIndex:(unint64_t)a3;
- (BOOL)prepareTokenizerForPreferredLanguage:(id)a3;
- (BOOL)textContainerIsSimple;
- (NSAttributedString)attributedString;
- (NSParagraphArbitrator)init;
- (NSParagraphArbitrator)initWithAttributedString:(id)a3 range:(_NSRange)a4;
- (NSParagraphStyle)defaultParagraphStyle;
- (NSString)debugString;
- (NSString)preferredLanguage;
- (_NSRange)paragraphRange;
- (_NSRange)previousLineRange;
- (__CFStringTokenizer)tokenizer;
- (__CTLine)paragraphLine;
- (double)hyphenationFactor;
- (double)raggednessWithCharIndexAsLineBreak:(unint64_t)a3 inRange:(_NSRange)a4;
- (double)textContainerWidth;
- (id)_preferredLanguageForCharacterAtIndex:(unint64_t)a3;
- (id)lineWidth;
- (id)optimalLineBreaker;
- (id)validateLineBreakContext;
- (int)_lineBreakStyle;
- (int)_lineBreakStyleForLastResortHyphenation:(BOOL)a3;
- (int64_t)typesetterBehavior;
- (unint64_t)adjustedLineBreakIndexForProposedIndex:(unint64_t)a3;
- (unint64_t)lineBreakStrategy;
- (unint64_t)maximumNumberOfLines;
- (void)_computeOptimalLayout;
- (void)configureOptimalLineBreaker;
- (void)dealloc;
- (void)reset;
- (void)resetBreaker;
- (void)setAttributedString:(id)a3;
- (void)setBreaksLinesForInteractiveText:(BOOL)a3;
- (void)setDefaultParagraphStyle:(id)a3;
- (void)setHyphenationFactor:(double)a3;
- (void)setLineBreakStrategy:(unint64_t)a3;
- (void)setLineWidth:(id)a3;
- (void)setMaximumNumberOfLines:(unint64_t)a3;
- (void)setParagraphLine:(__CTLine *)a3;
- (void)setParagraphRange:(_NSRange)a3;
- (void)setPreferredLanguage:(id)a3;
- (void)setPreviousLineRange:(_NSRange)a3;
- (void)setTextContainerIsSimple:(BOOL)a3;
- (void)setTextContainerWidth:(double)a3;
- (void)setTypesetterBehavior:(int64_t)a3;
- (void)setValidateLineBreakContext:(id)a3;
@end

@implementation NSParagraphArbitrator

+ (id)paragraphArbitratorWithAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29060], "currentThread"), "threadDictionary");
  v8 = v7;
  if (v7)
  {
    v9 = (void *)[v7 objectForKeyedSubscript:@"NSParagraphArbitratorKey"];
    if ([v9 attributedString])
    {
      v8 = 0;
    }
    else if (v9)
    {
      goto LABEL_8;
    }
  }
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1EDD49F70];
  v9 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAttributedString:range:", v10, 0x7FFFFFFFFFFFFFFFLL, 0);

  if (v8) {
    [v8 setObject:v9 forKeyedSubscript:@"NSParagraphArbitratorKey"];
  }
  id v11 = v9;
LABEL_8:
  if ([a3 length]) {
    id v12 = a3;
  }
  else {
    id v12 = 0;
  }
  [v9 setAttributedString:v12];
  objc_msgSend(v9, "setParagraphRange:", location, length);
  [v9 setHyphenationFactor:0.0];
  [v9 setLineBreakStrategy:0];
  objc_msgSend(v9, "setTypesetterBehavior:", +[NSTypesetter defaultTypesetterBehavior](NSTypesetter, "defaultTypesetterBehavior"));
  [v9 setLineWidth:0];
  [v9 setTextContainerIsSimple:0];
  [v9 setTextContainerWidth:0.0];
  [v9 setDefaultParagraphStyle:0];
  [v9 setBreaksLinesForInteractiveText:0];
  [v9 setMaximumNumberOfLines:0];
  [v9 resetBreaker];
  return v9;
}

- (void)setTextContainerWidth:(double)a3
{
  if (self->_textContainerWidth != a3)
  {
    self->_textContainerWidth = a3;
    self->_needsOptimalLayout = 1;
    self->_usesOptimalLayout = 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)setTextContainerIsSimple:(BOOL)a3
{
  self->_textContainerIsSimple = a3;
}

- (void)setDefaultParagraphStyle:(id)a3
{
  defaultParagraphStyle = self->_defaultParagraphStyle;
  if (defaultParagraphStyle != a3)
  {

    self->_defaultParagraphStyle = (NSParagraphStyle *)[a3 copy];
    self->_needsOptimalLayout = 1;
    self->_usesOptimalLayout = 0x7FFFFFFFFFFFFFFFLL;
    self->_lineBreakStyle = 0;
  }
}

- (void)setBreaksLinesForInteractiveText:(BOOL)a3
{
  self->_breaksLinesForInteractiveText = a3;
}

- (void)resetBreaker
{
  breaker = self->_breaker;
  if (breaker)
  {
    _NSDisposeBreakIterator((unint64_t)breaker, 0, 0);
    self->_breaker = 0;

    self->_breakerString = 0;
    self->_breakerLanguage = 0;
  }
}

- (void)reset
{
  [(NSParagraphArbitrator *)self setAttributedString:0];
  -[NSParagraphArbitrator setParagraphRange:](self, "setParagraphRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  [(NSParagraphArbitrator *)self setParagraphLine:0];
  [(NSParagraphArbitrator *)self setLineWidth:0];
  [(NSParagraphArbitrator *)self setValidateLineBreakContext:0];
  [(NSParagraphArbitrator *)self setLineBreakStrategy:0];
  [(NSParagraphArbitrator *)self setTypesetterBehavior:+[NSTypesetter defaultTypesetterBehavior]];
  [(NSParagraphArbitrator *)self setHyphenationFactor:0.0];
  -[NSParagraphArbitrator setPreviousLineRange:](self, "setPreviousLineRange:", 0x7FFFFFFFFFFFFFFFLL, 0);

  [(NSParagraphArbitrator *)self setPreferredLanguage:0];
}

- (void)setParagraphRange:(_NSRange)a3
{
  if (a3.location != self->_paragraphRange.location || a3.length != self->_paragraphRange.length)
  {
    self->_paragraphRange = a3;
    self->_needsOptimalLayout = 1;
    self->_usesOptimalLayout = 0x7FFFFFFFFFFFFFFFLL;
    self->_lineBreakStyle = 0;
  }
}

- (void)setAttributedString:(id)a3
{
  attributedString = self->_attributedString;
  if (attributedString != a3)
  {

    self->_attributedString = (NSAttributedString *)a3;
    self->_needsOptimalLayout = 1;
    self->_usesOptimalLayout = 0x7FFFFFFFFFFFFFFFLL;
    self->_lineBreakStyle = 0;
  }
}

- (void)setTypesetterBehavior:(int64_t)a3
{
  self->_typesetterBehavior = a3;
}

- (void)setLineWidth:(id)a3
{
}

- (void)setLineBreakStrategy:(unint64_t)a3
{
  self->_lineBreakStrategy = a3;
}

- (void)setHyphenationFactor:(double)a3
{
  self->_hyphenationFactor = a3;
}

- (void)setValidateLineBreakContext:(id)a3
{
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
    self->_needsOptimalLayout = 1;
  }
}

- ($F08F7EC4C389A89376F473094BC6C9F8)lineBreakContextBeforeIndex:(SEL)a3 lineFragmentWidth:(unint64_t)a4 range:(double)a5
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  result = ($F08F7EC4C389A89376F473094BC6C9F8 *)[(NSParagraphArbitrator *)self _shouldUseOptimalLayout];
  if (result)
  {
    if (self)
    {
      return -[NSParagraphArbitrator _optimalLineBreakContextBeforeIndex:lineFragmentWidth:range:](self, "_optimalLineBreakContextBeforeIndex:lineFragmentWidth:range:", a4, location, length, a5);
    }
LABEL_10:
    retstr->var0 = 0;
    retstr->var1 = 0;
    *(void *)&retstr->var2 = 0;
    return result;
  }
  if (!self) {
    goto LABEL_10;
  }

  return -[NSParagraphArbitrator _firstFitLineBreakContextBeforeIndex:lineFragmentWidth:range:](self, "_firstFitLineBreakContextBeforeIndex:lineFragmentWidth:range:", a4, location, length, a5);
}

- (BOOL)_shouldUseOptimalLayout
{
  if (_shouldUseOptimalLayout_once != -1) {
    dispatch_once(&_shouldUseOptimalLayout_once, &__block_literal_global_122);
  }
  unint64_t usesOptimalLayout = self->_usesOptimalLayout;
  if (usesOptimalLayout == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = [(NSAttributedString *)[(NSParagraphArbitrator *)self attributedString] string];
    v5 = [(NSAttributedString *)[(NSParagraphArbitrator *)self attributedString] attribute:@"NSParagraphStyle" atIndex:[(NSParagraphArbitrator *)self paragraphRange] effectiveRange:0];
    if (!v5) {
      v5 = [(NSParagraphArbitrator *)self defaultParagraphStyle];
    }
    int v6 = [(NSParagraphArbitrator *)self _lineBreakStyle];
    if (([(NSParagraphArbitrator *)self lineBreakStrategy] & 4) != 0) {
      goto LABEL_9;
    }
    if (([(NSParagraphArbitrator *)self lineBreakStrategy] & 8) != 0)
    {
      BOOL v7 = 1;
    }
    else
    {
      if ((__NSLineBreakStrategyStandardActualOptions([(NSParagraphStyle *)v5 alignment] == NSTextAlignmentJustified) & 8) == 0)
      {
LABEL_9:
        BOOL v7 = 0;
        goto LABEL_12;
      }
      BOOL v7 = ([(NSParagraphArbitrator *)self lineBreakStrategy] & 3) == 0;
    }
LABEL_12:
    if (![(NSParagraphArbitrator *)self breaksLinesForInteractiveText]
      && (v6 != 1 || [(NSParagraphStyle *)v5 spansAllLines]))
    {
      BOOL v7 = 1;
    }
    BOOL textContainerIsSimple = self->_textContainerIsSimple;
    if (self->_textContainerIsSimple)
    {
      if (self->_textContainerWidth <= 0.001 || [(NSString *)v4 length] > 0x2000)
      {
        BOOL textContainerIsSimple = 0;
      }
      else
      {
        uint64_t v9 = _shouldUseOptimalLayout_forbiddenCharacterSet;
        uint64_t v10 = [(NSParagraphArbitrator *)self paragraphRange];
        BOOL textContainerIsSimple = -[NSString rangeOfCharacterFromSet:options:range:](v4, "rangeOfCharacterFromSet:options:range:", v9, 0, v10, v11) == 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    unint64_t usesOptimalLayout = v7 & textContainerIsSimple;
    self->_unint64_t usesOptimalLayout = usesOptimalLayout;
  }
  return usesOptimalLayout != 0;
}

- ($F08F7EC4C389A89376F473094BC6C9F8)_firstFitLineBreakContextBeforeIndex:(SEL)a3 lineFragmentWidth:(unint64_t)a4 range:(double)a5
{
  NSUInteger location = a6.location;
  unint64_t v8 = a4;
  uint64_t v9 = self;
  *(void *)&retstr->var2 = 0;
  *(_OWORD *)&retstr->var0 = xmmword_18E5F7540;
  uint64_t v10 = [(NSParagraphArbitrator *)self attributedString];
  theString = [(NSAttributedString *)v10 string];
  unint64_t v105 = v8 - location;
  uint64_t v97 = [(NSParagraphArbitrator *)v9 paragraphRange];
  uint64_t v12 = v11;
  [(NSParagraphArbitrator *)v9 hyphenationFactor];
  double v14 = v13;
  BOOL v96 = [(NSParagraphArbitrator *)v9 _hyphenatesAsLastResort];
  unsigned __int8 v99 = [(NSParagraphArbitrator *)v9 lineBreakStrategy];
  v104 = v10;
  BOOL v98 = [(NSParagraphArbitrator *)v9 _attributedStringOverridesLineBreakBeforeIndex:v10];
  uint64_t v15 = [(NSParagraphArbitrator *)v9 lineWidth];
  if (_firstFitLineBreakContextBeforeIndex_lineFragmentWidth_range__once != -1) {
    dispatch_once(&_firstFitLineBreakContextBeforeIndex_lineFragmentWidth_range__once, &__block_literal_global_38);
  }
  BOOL v100 = [(NSParagraphArbitrator *)v9 prepareBreakIteratorForCharacterAtIndex:v8];
  unint64_t v16 = 0;
  unint64_t v95 = v97 + v12;
  uint64_t v101 = 0x7FFFFFFFFFFFFFFFLL;
  v102 = v9;
  unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    double v19 = 0.0;
    if (v16 == 1 && ([(NSParagraphArbitrator *)v9 previousLineRange], !v20))
    {
      -[NSParagraphArbitrator raggednessWithCharIndexAsLineBreak:inRange:](v9, "raggednessWithCharIndexAsLineBreak:inRange:", v18, location, v105);
      double v19 = v22;
      if (v8)
      {
LABEL_7:
        unint64_t v18 = v8 - 1;
        result = ($F08F7EC4C389A89376F473094BC6C9F8 *)CFStringGetCharacterAtIndex(theString, v8 - 1);
        if (result == 9) {
          goto LABEL_20;
        }
      }
    }
    else if (v8)
    {
      goto LABEL_7;
    }
    if (v100)
    {
      if (!v9->_breaker) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a3, v9, @"NSParagraphArbitrator.m", 655, @"_breaker should have been set by -prepareBreakIterator");
      }
      result = ($F08F7EC4C389A89376F473094BC6C9F8 *)ubrk_preceding();
      unint64_t v18 = result == -1 ? 0x7FFFFFFFFFFFFFFFLL : (int)result;
    }
    else
    {
      result = ($F08F7EC4C389A89376F473094BC6C9F8 *)(v98
                                                   ? -[NSAttributedString lineBreakBeforeIndex:withinRange:](v104, "lineBreakBeforeIndex:withinRange:", v8, location, v105): -[NSAttributedString _lineBreakBeforeIndex:withinRange:lineBreakStrategy:](v104, "_lineBreakBeforeIndex:withinRange:lineBreakStrategy:", v8, location, v105, [(NSParagraphArbitrator *)v9 lineBreakStrategy]));
      unint64_t v18 = (unint64_t)result;
    }
LABEL_20:
    if (v16 == 1)
    {
      result = ($F08F7EC4C389A89376F473094BC6C9F8 *)-[NSParagraphArbitrator raggednessWithCharIndexAsLineBreak:inRange:](v9, "raggednessWithCharIndexAsLineBreak:inRange:", v18, location, v105);
      if (v23 < 0.6
        || (double v24 = v23,
            result = ($F08F7EC4C389A89376F473094BC6C9F8 *)[(NSParagraphArbitrator *)v9 previousLineRange], !v25)&& vabdd_f64(1.0, v24) > vabdd_f64(1.0, v19))
      {
        unint64_t v18 = v8;
      }
    }
    if (!v18 || v18 == 0x7FFFFFFFFFFFFFFFLL || v18 <= location || v18 >= v8) {
      unint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (!v16
      && v18 == 0x7FFFFFFFFFFFFFFFLL
      && ((result = ($F08F7EC4C389A89376F473094BC6C9F8 *)-[__CFString rangeOfCharacterFromSet:options:range:](theString, "rangeOfCharacterFromSet:options:range:", _firstFitLineBreakContextBeforeIndex_lineFragmentWidth_range__lastResortCharacterSet, 4, location, v105), result == ($F08F7EC4C389A89376F473094BC6C9F8 *)0x7FFFFFFFFFFFFFFFLL)|| (unint64_t v18 = (unint64_t)result + v26, (unint64_t)result + v26 >= v8)))
    {
      unint64_t v18 = location;
    }
    else
    {
      unint64_t v27 = v101;
      if (v16 != 1) {
        unint64_t v27 = location;
      }
      if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v18 = v27;
      }
    }
    if (v18 <= location)
    {
      BOOL v28 = 0;
      if (!v15) {
        goto LABEL_51;
      }
    }
    else
    {
      result = ($F08F7EC4C389A89376F473094BC6C9F8 *)[(__CFString *)theString characterAtIndex:v18 - 1];
      BOOL v28 = result == 173;
      if (result == 173) {
        unint64_t v17 = v18 - 1;
      }
      if (!v15)
      {
LABEL_51:
        if (!v15) {
          goto LABEL_85;
        }
        goto LABEL_57;
      }
    }
    if (v28) {
      goto LABEL_51;
    }
    if (v14 <= 0.0)
    {
      if (v18 != location || !v96) {
        goto LABEL_85;
      }
    }
    else if (v18 != location {
           && (*(double (**)(uint64_t, NSUInteger, unint64_t, void))(v15 + 16))(v15, location, v18 - location, 0)/ a5 >= v14)
    }
    {
      goto LABEL_85;
    }
LABEL_57:
    double v30 = (double)v8;
    for (uint64_t i = 3; i; --i)
    {
      result = -[NSAttributedString lineBreakByHyphenatingBeforeIndex:withinRange:](v104, "lineBreakByHyphenatingBeforeIndex:withinRange:", (unint64_t)v30, location, v105);
      BOOL v32 = result != ($F08F7EC4C389A89376F473094BC6C9F8 *)0x7FFFFFFFFFFFFFFFLL;
      BOOL v33 = v17 < (unint64_t)result;
      BOOL v34 = !v32 || !v33;
      v35 = v32 && v33 ? result : ($F08F7EC4C389A89376F473094BC6C9F8 *)(v17 + 1);
      uint64_t v36 = v34 ? 0x7FFFFFFFFFFFFFFFLL : v17;
      v37 = v17 == 0x7FFFFFFFFFFFFFFFLL ? result : v35;
      unint64_t v17 = v17 == 0x7FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v36;
      if (v37 == ($F08F7EC4C389A89376F473094BC6C9F8 *)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if ((unint64_t)v37 > location && (unint64_t)v37 < v8)
      {
        if ((*(double (**)(uint64_t, NSUInteger, char *, uint64_t))(v15 + 16))(v15, location, (char *)v37 - location, 1) <= a5)
        {
          if ((v99 & (v16 == 0)) != 0) {
            unint64_t v16 = 0;
          }
          LOBYTE(v41) = 1;
          goto LABEL_111;
        }
        BOOL v39 = v17 == 0x7FFFFFFFFFFFFFFFLL && v28;
        if (v39 && v14 == 0.0)
        {
          unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
          break;
        }
        double v30 = v30 + -1.0;
      }
    }
LABEL_85:
    BOOL v40 = v17 == 0x7FFFFFFFFFFFFFFFLL && v28;
    if (!v40 || v14 != 0.0) {
      break;
    }
    unint64_t v8 = v18 - (v18 == v8);
    unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v9 = v102;
LABEL_159:
    if (v8 <= location)
    {
      LOBYTE(v41) = 0;
      goto LABEL_163;
    }
  }
  LOBYTE(v41) = 0;
  uint64_t v9 = v102;
  if ((v99 & 1) == 0) {
    goto LABEL_155;
  }
  if (v16) {
    goto LABEL_155;
  }
  LOBYTE(v41) = 0;
  if (location != v97 || v18 >= v8) {
    goto LABEL_155;
  }
  unint64_t v42 = v95 - v18;
  if (v95 - v18 > 0xA) {
    goto LABEL_153;
  }
  BOOL v43 = [(NSParagraphArbitrator *)v102 prepareTokenizerForPreferredLanguage:[(NSParagraphArbitrator *)v102 _preferredLanguageForCharacterAtIndex:v18]];
  v94 = [(NSParagraphArbitrator *)v102 attributedString];
  uint64_t v44 = [(NSParagraphArbitrator *)v102 paragraphRange];
  CFStringTokenizerRef tokenizer = v45;
  CFIndex v90 = v44;
  if (!v43
    || (v85 = [(NSAttributedString *)v94 string],
        -[NSString rangeOfCharacterFromSet:options:range:](v85, "rangeOfCharacterFromSet:options:range:", [MEMORY[0x1E4F28B88] alphanumericCharacterSet], 8, v18, v42), v95 <= v18)|| !v46)
  {
    uint64_t v58 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
    if (v95 <= v18) {
      goto LABEL_153;
    }
    uint64_t v92 = v58;
    -[NSString rangeOfCharacterFromSet:options:range:]([(NSAttributedString *)v94 string], "rangeOfCharacterFromSet:options:range:", v58, 8, v18, v42);
    if (!v59) {
      goto LABEL_153;
    }
    result = [(NSAttributedString *)v94 nextWordFromIndex:v18 forward:1];
    v60 = result;
    if (v95 > (unint64_t)result)
    {
      unint64_t v61 = v95 - (void)result;
      result = ($F08F7EC4C389A89376F473094BC6C9F8 *)-[NSString rangeOfCharacterFromSet:options:range:]([(NSAttributedString *)v94 string], "rangeOfCharacterFromSet:options:range:", v92, 0, result, v61);
      if (!v62) {
        v60 = ($F08F7EC4C389A89376F473094BC6C9F8 *)v95;
      }
    }
    unint64_t v16 = 0;
    if (v60 != ($F08F7EC4C389A89376F473094BC6C9F8 *)v95)
    {
      LOBYTE(v41) = 0;
LABEL_155:
      v37 = ($F08F7EC4C389A89376F473094BC6C9F8 *)v18;
      goto LABEL_156;
    }
LABEL_144:
    if (v43) {
      NSUInteger v76 = v16;
    }
    else {
      NSUInteger v76 = v18 - (v18 == v8);
    }
    if (v76 > location)
    {
      if (v43) {
        unint64_t v8 = v16 + 1;
      }
      else {
        unint64_t v8 = v18 - (v18 == v8);
      }
      unint64_t v16 = 1;
      uint64_t v101 = v18;
      goto LABEL_159;
    }
    goto LABEL_153;
  }
  BOOL v47 = v43;
  uint64_t v48 = [(NSParagraphArbitrator *)v102 tokenizer];
  if (!v48)
  {
LABEL_153:
    LOBYTE(v41) = 0;
    goto LABEL_154;
  }
  v49 = (__CFStringTokenizer *)v48;
  BOOL v86 = v47;
  CFStringRef v50 = [(NSAttributedString *)v94 string];
  v108.CFIndex length = (CFIndex)tokenizer;
  v108.NSUInteger location = v90;
  CFStringTokenizerSetString(v49, v50, v108);
  CFStringTokenizerGoToTokenAtIndex(v49, v18);
  CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v49);
  v52 = v49;
  CFIndex v53 = CurrentTokenRange.location + CurrentTokenRange.length;
  tokenizera = v52;
  CFStringTokenizerTokenType Token = CFStringTokenizerAdvanceToNextToken(v52);
  CFRange v54 = CFStringTokenizerGetCurrentTokenRange(v52);
  if (v54.location == -1) {
    CFIndex v55 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    CFIndex v55 = v54.location;
  }
  CFIndex v82 = v55;
  unint64_t v56 = v55 + v54.length;
  result = [(NSAttributedString *)v94 length];
  CFIndex v57 = CurrentTokenRange.location;
  if (CurrentTokenRange.location >= v18)
  {
    unint64_t v16 = 0;
    LOBYTE(v41) = 0;
    if (CurrentTokenRange.location != v18 || !Token || v56 > (unint64_t)result) {
      goto LABEL_141;
    }
    v63 = [(NSAttributedString *)v94 string];
    -[NSString rangeOfCharacterFromSet:options:range:](v63, "rangeOfCharacterFromSet:options:range:", [MEMORY[0x1E4F28B88] punctuationCharacterSet], 12, v82, v54.length);
    uint64_t v9 = v102;
    if (v64)
    {
      BOOL v65 = CurrentTokenRange.length == 1 && v53 == v95;
      BOOL v66 = !v65;
      if (v81 + v54.length == v95 || !v66)
      {
        CFStringTokenizerTokenType v41 = CFStringTokenizerGoToTokenAtIndex(tokenizera, v18 - 1);
        CFRange v69 = CFStringTokenizerGetCurrentTokenRange(tokenizera);
        CFIndex length = v69.length;
        CFIndex v67 = v69.location;
        if (!v41)
        {
LABEL_154:
          unint64_t v16 = 0;
          goto LABEL_155;
        }
        unint64_t v70 = 0;
        while (1)
        {
          unint64_t v83 = v70;
          CFIndex v84 = v67;
          uint64_t v71 = v67 == -1 ? 0x7FFFFFFFFFFFFFFFLL : v67;
          CFIndex v72 = length;
          if (v71 + length > [(NSAttributedString *)v94 length]) {
            break;
          }
          v73 = [(NSAttributedString *)v94 string];
          result = ($F08F7EC4C389A89376F473094BC6C9F8 *)-[NSString rangeOfCharacterFromSet:options:range:](v73, "rangeOfCharacterFromSet:options:range:", [MEMORY[0x1E4F28B88] alphanumericCharacterSet], 0, v71, v72);
          if (v74)
          {
            BOOL v43 = v86;
            CFIndex v57 = v84;
            goto LABEL_143;
          }
          CFStringTokenizerTokenType v41 = CFStringTokenizerGoToTokenAtIndex(tokenizera, v84 - 1);
          CFRange v75 = CFStringTokenizerGetCurrentTokenRange(tokenizera);
          CFIndex length = v75.length;
          CFIndex v67 = v75.location;
          if (v83 > 1) {
            goto LABEL_153;
          }
          unint64_t v70 = v83 + 1;
          if (!v41) {
            goto LABEL_154;
          }
        }
      }
    }
    goto LABEL_153;
  }
  if (v53 == v95)
  {
    uint64_t v9 = v102;
    BOOL v43 = v47;
LABEL_143:
    unint64_t v16 = v57 & ~(v57 >> 63);
    goto LABEL_144;
  }
  BOOL v43 = v47;
  if (Token && v56 <= (unint64_t)result)
  {
    v77 = [(NSAttributedString *)v94 string];
    result = ($F08F7EC4C389A89376F473094BC6C9F8 *)-[NSString rangeOfCharacterFromSet:options:range:](v77, "rangeOfCharacterFromSet:options:range:", [MEMORY[0x1E4F28B88] punctuationCharacterSet], 12, v82, v54.length);
    CFIndex v57 = CurrentTokenRange.location;
    uint64_t v9 = v102;
    if (!v78) {
      goto LABEL_153;
    }
    goto LABEL_143;
  }
  LOBYTE(v41) = 0;
  unint64_t v16 = 0;
LABEL_141:
  v37 = ($F08F7EC4C389A89376F473094BC6C9F8 *)v18;
LABEL_111:
  uint64_t v9 = v102;
LABEL_156:
  result = [(NSParagraphArbitrator *)v9 validateLineBreakContext];
  if (result)
  {
    v79 = *(uint64_t (**)($F08F7EC4C389A89376F473094BC6C9F8 *, void *))&result->var2;
    v106[0] = v37;
    v106[1] = v16;
    char v107 = v41;
    result = ($F08F7EC4C389A89376F473094BC6C9F8 *)v79(result, v106);
    if ((result & 1) == 0)
    {
      unint64_t v16 = 0;
      unint64_t v8 = (unint64_t)v37 - (v37 == ($F08F7EC4C389A89376F473094BC6C9F8 *)v8);
      unint64_t v18 = (unint64_t)v37;
      goto LABEL_159;
    }
  }
  unint64_t v18 = (unint64_t)v37;
LABEL_163:
  retstr->var2 = v41;
  unint64_t v80 = 0x7FFFFFFFFFFFFFFFLL;
  if (v18 > location) {
    unint64_t v80 = v18;
  }
  retstr->var0 = v80;
  retstr->var1 = v16;
  if (v18 > location)
  {
    result = [(NSAttributedString *)[(NSParagraphArbitrator *)v9 attributedString] length];
    if (v18 < (unint64_t)result) {
      return ($F08F7EC4C389A89376F473094BC6C9F8 *)-[NSParagraphArbitrator setPreviousLineRange:](v9, "setPreviousLineRange:", location, v18 - location);
    }
  }
  return result;
}

- (_NSRange)paragraphRange
{
  NSUInteger length = self->_paragraphRange.length;
  NSUInteger location = self->_paragraphRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (unint64_t)lineBreakStrategy
{
  return self->_lineBreakStrategy;
}

- (void)setPreviousLineRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_previousLineRange, &v3, 16, 1, 0);
}

- (id)lineWidth
{
  return objc_getProperty(self, a2, 128, 1);
}

- (unint64_t)adjustedLineBreakIndexForProposedIndex:(unint64_t)a3
{
  v4 = [(NSAttributedString *)[(NSParagraphArbitrator *)self attributedString] string];
  uint64_t v5 = [(NSString *)v4 length];
  if (adjustedLineBreakIndexForProposedIndex__onceToken != -1) {
    dispatch_once(&adjustedLineBreakIndexForProposedIndex__onceToken, &__block_literal_global_155);
  }
  while (1)
  {
    uint64_t v6 = -[NSString rangeOfCharacterFromSet:options:range:](v4, "rangeOfCharacterFromSet:options:range:", adjustedLineBreakIndexForProposedIndex__whitespaceNoTab, 8, a3, v5 - a3);
    if (!v7) {
      break;
    }
    a3 = v6 + v7;
  }
  unint64_t v8 = a3 + 1;
  if (a3 + 1 < [(NSString *)v4 length]
    && ([(NSString *)v4 characterAtIndex:a3 + 1] & 0xFC00) == 0xDC00)
  {
    return a3 + 2;
  }
  return v8;
}

- (double)hyphenationFactor
{
  return self->_hyphenationFactor;
}

- (BOOL)_hyphenatesAsLastResort
{
  _NSRange v3 = [(NSAttributedString *)[(NSParagraphArbitrator *)self attributedString] attribute:@"NSParagraphStyle" atIndex:[(NSParagraphArbitrator *)self paragraphRange] effectiveRange:0];
  if (!v3) {
    _NSRange v3 = +[NSParagraphStyle defaultParagraphStyle];
  }
  uint64_t v4 = [(NSParagraphStyle *)v3 secondaryLineBreakMode];
  if (v4 != 1)
  {
    if (v4 == 2)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      LODWORD(v4) = +[NSParagraphArbitrator _hyphenatesAsLastResort];
      if (v4) {
        LOBYTE(v4) = [(NSParagraphArbitrator *)self _lineBreakStyleForLastResortHyphenation:1] != 1;
      }
    }
  }
  return v4;
}

- (int)_lineBreakStyleForLastResortHyphenation:(BOOL)a3
{
  if (_lineBreakStyleForLastResortHyphenation__once != -1) {
    dispatch_once(&_lineBreakStyleForLastResortHyphenation__once, &__block_literal_global_153);
  }
  if (self->_lineBreakStyle)
  {
LABEL_12:
    if (a3) {
      return self->_lineBreakStyle;
    }
    goto LABEL_16;
  }
  if (_lineBreakStyleForLastResortHyphenation__enabled)
  {
    uint64_t v5 = [(NSAttributedString *)[(NSParagraphArbitrator *)self attributedString] attributesAtIndex:[(NSParagraphArbitrator *)self paragraphRange] effectiveRange:0];
    if (!v5) {
      goto LABEL_9;
    }
    uint64_t v6 = v5;
    id v7 = [(NSDictionary *)v5 objectForKey:@"NSFont"];
    if (objc_msgSend(-[NSDictionary objectForKey:](v6, "objectForKey:", @"CTVerticalForms"), "BOOLValue"))id v7 = (id)objc_msgSend(v7, "verticalFont"); {
    if (!v7)
    }
LABEL_9:
      id v7 = (id)NSDefaultFont();
    int v8 = [(id)objc_opt_class() _lineBreakStyleForFont:v7];
    self->_lineBreakStyle = v8;
    if (v8 != 1)
    {
      id v9 = __NSCreateNormalizedLanguage((CFStringRef)[(NSParagraphArbitrator *)self _preferredLanguageForCharacterAtIndex:[(NSParagraphArbitrator *)self paragraphRange]]);
      self->_languageSupportsLineBreakStyle = +[NSParagraphArbitrator _languageCategoryForLanguageCode:v9] != 0;

      goto LABEL_12;
    }
  }
  else
  {
    self->_lineBreakStyle = 1;
  }
  self->_languageSupportsLineBreakStyle = 0;
  if (a3) {
    return self->_lineBreakStyle;
  }
LABEL_16:
  if (self->_languageSupportsLineBreakStyle) {
    return self->_lineBreakStyle;
  }
  return 1;
}

- (id)_preferredLanguageForCharacterAtIndex:(unint64_t)a3
{
  if (_preferredLanguageForCharacterAtIndex__once != -1) {
    dispatch_once(&_preferredLanguageForCharacterAtIndex__once, &__block_literal_global_119_0);
  }
  uint64_t v5 = [(NSParagraphArbitrator *)self attributedString];
  id result = [(NSAttributedString *)v5 attribute:NSLanguageAttributeName atIndex:a3 effectiveRange:0];
  if (!result)
  {
    id v7 = [(NSAttributedString *)[(NSParagraphArbitrator *)self attributedString] attributesAtIndex:a3 effectiveRange:0];
    if (v7)
    {
      int v8 = v7;
      id v9 = [(NSDictionary *)v7 objectForKey:@"NSFont"];
      if (objc_msgSend(-[NSDictionary objectForKey:](v8, "objectForKey:", @"CTVerticalForms"), "BOOLValue"))id v9 = (id)objc_msgSend(v9, "verticalFont"); {
      if (v9)
      }
        goto LABEL_9;
    }
    id result = (id)NSDefaultFont();
    id v9 = result;
    if (result)
    {
LABEL_9:
      uint64_t v10 = (void *)[v9 fontDescriptor];
      id result = (id)[v10 objectForKey:*MEMORY[0x1E4F24480]];
      if (result)
      {
        id v11 = result;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id result = v11;
        }
        else {
          id result = 0;
        }
      }
    }
  }
  if (!result) {
    return (id)_preferredLanguageForCharacterAtIndex__globalPreferredLanguage;
  }
  return result;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

+ (BOOL)_hyphenatesAsLastResort
{
  if (_hyphenatesAsLastResort_once != -1) {
    dispatch_once(&_hyphenatesAsLastResort_once, &__block_literal_global_16);
  }
  return _hyphenatesAsLastResort_result;
}

- (id)validateLineBreakContext
{
  return objc_getProperty(self, a2, 136, 1);
}

- (BOOL)prepareBreakIteratorForCharacterAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSParagraphArbitrator *)self attributedString];
  unint64_t v6 = [(NSAttributedString *)v5 length];
  if (v6 > 0x200) {
    return 0;
  }
  id v7 = [(NSParagraphArbitrator *)self _preferredLanguageForCharacterAtIndex:a3 - (v6 == a3)];
  if (!self->_breaker
    || (breakerLanguage = self->_breakerLanguage, breakerLanguage != v7)
    && ([(NSString *)breakerLanguage isEqual:v7] & 1) == 0)
  {
    [(NSParagraphArbitrator *)self resetBreaker];
    [(NSParagraphArbitrator *)self lineBreakStrategy];
    self->_breaker = (UBreakIterator *)_NSCopyBreakIterator(v7, 0, 0, 0);

    self->_breakerLanguage = v7;
  }
  id v9 = [(NSAttributedString *)v5 string];
  if (!self->_breaker) {
    return 0;
  }
  uint64_t v10 = v9;
  if (self->_breakerString == v9) {
    return 1;
  }
  id v11 = (UText *)CFStringOpenUText();
  ubrk_setUText();
  utext_close(v11);

  self->_breakerString = v10;
  return self->_breaker != 0;
}

- (BOOL)_attributedStringOverridesLineBreakBeforeIndex:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__NSParagraphArbitrator__attributedStringOverridesLineBreakBeforeIndex___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = sel_lineBreakBeforeIndex_withinRange_;
  if (_attributedStringOverridesLineBreakBeforeIndex__onceToken != -1) {
    dispatch_once(&_attributedStringOverridesLineBreakBeforeIndex__onceToken, block);
  }
  _NSRange v3 = (objc_class *)objc_opt_class();
  return class_getMethodImplementation(v3, sel_lineBreakBeforeIndex_withinRange_) != (IMP)_attributedStringOverridesLineBreakBeforeIndex__defaultImp;
}

- (int)_lineBreakStyle
{
  return [(NSParagraphArbitrator *)self _lineBreakStyleForLastResortHyphenation:0];
}

- (BOOL)breaksLinesForInteractiveText
{
  return self->_breaksLinesForInteractiveText;
}

+ (int)_lineBreakStyleForFont:(id)a3
{
  if (_lineBreakStyleForFont__once != -1) {
    dispatch_once(&_lineBreakStyleForFont__once, &__block_literal_global_75_0);
  }
  uint64_t v4 = (void *)[a3 fontDescriptor];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4F24498]];
  if (!v5) {
    return 1;
  }
  unint64_t v6 = (void *)v5;
  id v7 = (void *)_lineBreakStyleForFont__cache;
  objc_sync_enter((id)_lineBreakStyleForFont__cache);
  int v8 = (char *)[(id)_lineBreakStyleForFont__cache objectForKeyedSubscript:v6];
  if (!v8)
  {
    while ([v6 rangeOfString:*(__CFString **)((char *)&_lineBreakStyleForFont__pairs + (void)v8)] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 += 16;
      if (v8 == (char *)128)
      {
        uint64_t v9 = 0;
        goto LABEL_10;
      }
    }
    uint64_t v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)&_lineBreakStyleForFont__pairs + (void)v8 + 8)];
LABEL_10:
    if (v9) {
      int v8 = (char *)v9;
    }
    else {
      int v8 = (char *)&unk_1EDD68CB8;
    }
    [(id)_lineBreakStyleForFont__cache setObject:v8 forKeyedSubscript:v6];
  }
  int v10 = [v8 unsignedIntegerValue];
  objc_sync_exit(v7);
  return v10;
}

+ (int)_languageCategoryForLanguageCode:(id)a3
{
  if (_languageCategoryForLanguageCode__once != -1)
  {
    dispatch_once(&_languageCategoryForLanguageCode__once, &__block_literal_global_127);
    if (a3) {
      goto LABEL_3;
    }
    return 0;
  }
  if (!a3) {
    return 0;
  }
LABEL_3:
  uint64_t v4 = (void *)_languageCategoryForLanguageCode__cache;
  objc_sync_enter((id)_languageCategoryForLanguageCode__cache);
  uint64_t v5 = (void *)[(id)_languageCategoryForLanguageCode__cache objectForKeyedSubscript:a3];
  if (!v5)
  {
    unint64_t v6 = (void *)[MEMORY[0x1E4F1CA20] scriptCodeFromLanguage:a3];
    if (([v6 isEqualToString:@"Latn"] & 1) != 0
      || ([v6 isEqualToString:@"Cyrl"] & 1) != 0
      || ([v6 isEqualToString:@"Grek"] & 1) != 0
      || [v6 isEqualToString:@"Hebr"])
    {
      if (_languageCategoryForLanguageCode__enabledForAllLanguages
        || ([a3 isEqualToString:@"de"] & 1) != 0
        || ([a3 isEqualToString:@"ru"] & 1) != 0
        || [a3 isEqualToString:@"uk"])
      {
        uint64_t v5 = &unk_1EDD68CB8;
      }
      else
      {
        uint64_t v5 = &unk_1EDD68CD0;
      }
    }
    else if (([a3 isEqualToString:@"zh"] & 1) != 0 {
           || ([a3 isEqualToString:@"ja"] & 1) != 0)
    }
    {
      uint64_t v5 = &unk_1EDD68CE8;
    }
    else if ([a3 isEqualToString:@"ko"])
    {
      uint64_t v5 = &unk_1EDD68D00;
    }
    else
    {
      uint64_t v5 = &unk_1EDD68CD0;
    }
    [(id)_languageCategoryForLanguageCode__cache setObject:v5 forKeyedSubscript:a3];
  }
  objc_sync_exit(v4);
  return [v5 unsignedIntegerValue];
}

- (NSParagraphStyle)defaultParagraphStyle
{
  id result = self->_defaultParagraphStyle;
  if (!result) {
    return +[NSParagraphStyle defaultParagraphStyle];
  }
  return result;
}

- (void)configureOptimalLineBreaker
{
}

- (__CTLine)paragraphLine
{
  return self->_paragraphLine;
}

- (BOOL)_shouldUseCFStringTokenizerForLineBreaks
{
  if (_shouldUseCFStringTokenizerForLineBreaks_once != -1) {
    dispatch_once(&_shouldUseCFStringTokenizerForLineBreaks_once, &__block_literal_global_14);
  }
  return _shouldUseCFStringTokenizerForLineBreaks_result;
}

- (NSParagraphArbitrator)initWithAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v11.receiver = self;
  v11.super_class = (Class)NSParagraphArbitrator;
  id v7 = [(NSParagraphArbitrator *)&v11 init];
  int v8 = v7;
  if (v7)
  {
    [(NSParagraphArbitrator *)v7 reset];
    if ([a3 length]) {
      id v9 = a3;
    }
    else {
      id v9 = 0;
    }
    [(NSParagraphArbitrator *)v8 setAttributedString:v9];
    -[NSParagraphArbitrator setParagraphRange:](v8, "setParagraphRange:", location, length);
    v8->_unint64_t usesOptimalLayout = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v8;
}

- (void)setPreferredLanguage:(id)a3
{
}

- (double)raggednessWithCharIndexAsLineBreak:(unint64_t)a3 inRange:(_NSRange)a4
{
  NSUInteger location = a4.location;
  unint64_t v5 = a3;
  id v7 = [(NSParagraphArbitrator *)self lineWidth];
  if (v7
    && ((int v8 = v7,
         double v9 = v7[2](v7, location, v5 - location, 0),
         [(NSParagraphArbitrator *)self previousLineRange],
         !v10)
      ? (v13 = [(NSParagraphArbitrator *)self paragraphRange], unint64_t v12 = v14 - v5 + v13)
      : (v5 = [(NSParagraphArbitrator *)self previousLineRange], unint64_t v12 = v11),
        double v15 = v8[2](v8, v5, v12, 0),
        v15 > 0.0))
  {
    return v9 / v15;
  }
  else
  {
    return 0.0;
  }
}

- (_NSRange)previousLineRange
{
  objc_copyStruct(v4, &self->_previousLineRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

id __48__NSParagraphArbitrator__shouldUseOptimalLayout__block_invoke()
{
  id result = (id)[MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\t"];
  _shouldUseOptimalLayout_forbiddenCharacterSet = (uint64_t)result;
  return result;
}

+ (void)initialize
{
  if (initialize_once != -1) {
    dispatch_once(&initialize_once, &__block_literal_global_12);
  }
}

id __48__NSParagraphArbitrator__lineBreakStyleForFont___block_invoke()
{
  id result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  _lineBreakStyleForFont__cache = (uint64_t)result;
  return result;
}

uint64_t __35__NSParagraphArbitrator_initialize__block_invoke()
{
  v0 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];

  return [v0 registerDefaults:&unk_1EDD68C38];
}

- ($F08F7EC4C389A89376F473094BC6C9F8)_optimalLineBreakContextBeforeIndex:(SEL)a3 lineFragmentWidth:(unint64_t)a4 range:(double)a5
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  if ([(NSParagraphArbitrator *)self paragraphRange] <= a6.location)
  {
    uint64_t v10 = [(NSParagraphArbitrator *)self paragraphRange];
    if (location + length <= v10 + v11)
    {
      [(NSParagraphArbitrator *)self _computeOptimalLayout];
      *(void *)&retstr->var2 = 0;
      *(_OWORD *)&retstr->var0 = xmmword_18E5F7540;
      if ([(_NSOptimalLineBreaker *)self->_optimalLineBreaker lineCount] != -1)
      {
        unint64_t v12 = 0;
        do
        {
          optimalLineBreaker = self->_optimalLineBreaker;
          if (optimalLineBreaker) {
            [(_NSOptimalLineBreaker *)optimalLineBreaker lineBreakAtIndex:v12];
          }
          ++v12;
        }
        while (v12 < [(_NSOptimalLineBreaker *)self->_optimalLineBreaker lineCount]+ 1);
      }
      -[NSParagraphArbitrator _optimalLineBreakContextBeforeIndex:lineFragmentWidth:range:]();
    }
  }
  -[NSParagraphArbitrator _optimalLineBreakContextBeforeIndex:lineFragmentWidth:range:]();
}

- (void)_computeOptimalLayout
{
  if (self->_needsOptimalLayout)
  {
    [(NSParagraphArbitrator *)self configureOptimalLineBreaker];
    [(_NSOptimalLineBreaker *)self->_optimalLineBreaker layout];
    self->_needsOptimalLayout = 0;
  }
}

- (BOOL)prepareTokenizerForPreferredLanguage:(id)a3
{
  if (a3)
  {
    int v5 = __NSShouldUseTokenizerForPushOut((const __CFString *)a3);
    if (!v5) {
      return v5;
    }
  }
  else
  {
    if (prepareTokenizerForPreferredLanguage__onceToken != -1) {
      dispatch_once(&prepareTokenizerForPreferredLanguage__onceToken, &__block_literal_global_35);
    }
    if (!prepareTokenizerForPreferredLanguage__shouldUseTokenizerForSystemLanguage)
    {
      LOBYTE(v5) = 0;
      return v5;
    }
  }
  if (!self->_tokenizer)
  {
    CFLocaleRef v7 = __NSCreateLocaleForPreferredLanguage((CFStringRef)a3);
    v10.NSUInteger location = 0;
    v10.NSUInteger length = 0;
    int v8 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v10, 4uLL, v7);
    if (v7) {
      CFRelease(v7);
    }
    self->_CFStringTokenizerRef tokenizer = v8;
    goto LABEL_14;
  }
  if (![(NSString *)[(NSParagraphArbitrator *)self preferredLanguage] isEqualToString:a3])
  {
    CFLocaleRef v6 = __NSCreateLocaleForPreferredLanguage((CFStringRef)a3);
    _CFStringTokenizerSetLocale();
    if (v6) {
      CFRelease(v6);
    }
LABEL_14:
    [(NSParagraphArbitrator *)self setPreferredLanguage:a3];
  }
  LOBYTE(v5) = 1;
  return v5;
}

uint64_t __65__NSParagraphArbitrator__lineBreakStyleForLastResortHyphenation___block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSUsesTextStylesForLineBreaks");
  _lineBreakStyleForLastResortHyphenation__enabled = result;
  return result;
}

uint64_t __48__NSParagraphArbitrator__hyphenatesAsLastResort__block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSHyphenatesAsLastResort");
  _hyphenatesAsLastResort_uint64_t result = result;
  return result;
}

id __86__NSParagraphArbitrator__firstFitLineBreakContextBeforeIndex_lineFragmentWidth_range___block_invoke()
{
  id result = (id)objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithRange:", 160, 1);
  _firstFitLineBreakContextBeforeIndex_lineFragmentWidth_range__lastResortCharacterSet = (uint64_t)result;
  return result;
}

IMP __72__NSParagraphArbitrator__attributedStringOverridesLineBreakBeforeIndex___block_invoke(uint64_t a1)
{
  NSUInteger v2 = (objc_class *)objc_opt_class();
  IMP result = class_getMethodImplementation(v2, *(SEL *)(a1 + 32));
  _attributedStringOverridesLineBreakBeforeIndex__defaultImp = (uint64_t)result;
  return result;
}

uint64_t __64__NSParagraphArbitrator_adjustedLineBreakIndexForProposedIndex___block_invoke()
{
  v0 = (void *)[MEMORY[0x1E4F28E58] whitespaceCharacterSet];
  objc_msgSend(v0, "removeCharactersInRange:", 9, 1);
  uint64_t result = [v0 copy];
  adjustedLineBreakIndexForProposedIndex__whitespaceNoTab = result;
  return result;
}

uint64_t __63__NSParagraphArbitrator__preferredLanguageForCharacterAtIndex___block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA20], "preferredLanguages"), "firstObject"), "copy");
  _preferredLanguageForCharacterAtIndex__globalPreferredLanguage = result;
  return result;
}

id __58__NSParagraphArbitrator__languageCategoryForLanguageCode___block_invoke()
{
  _languageCategoryForLanguageCode__enabledForAllLanguages = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSUsesTextStylesForLineBreaksInAllLanguages");
  id result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  _languageCategoryForLanguageCode__cache = (uint64_t)result;
  return result;
}

uint64_t __65__NSParagraphArbitrator__shouldUseCFStringTokenizerForLineBreaks__block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSUsesCFStringTokenizerForLineBreaks");
  _shouldUseCFStringTokenizerForLineBreaks_uint64_t result = result;
  return result;
}

- (double)textContainerWidth
{
  return self->_textContainerWidth;
}

- (id)optimalLineBreaker
{
  return self->_optimalLineBreaker;
}

- (NSParagraphArbitrator)init
{
  return -[NSParagraphArbitrator initWithAttributedString:range:](self, "initWithAttributedString:range:", 0, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (void)dealloc
{
  [(NSParagraphArbitrator *)self reset];
  CFStringTokenizerRef tokenizer = self->_tokenizer;
  if (tokenizer)
  {
    CFRelease(tokenizer);
    self->_CFStringTokenizerRef tokenizer = 0;
  }

  [(NSParagraphArbitrator *)self setParagraphLine:0];
  [(NSParagraphArbitrator *)self resetBreaker];
  v4.receiver = self;
  v4.super_class = (Class)NSParagraphArbitrator;
  [(NSParagraphArbitrator *)&v4 dealloc];
}

uint64_t __62__NSParagraphArbitrator_prepareTokenizerForPreferredLanguage___block_invoke()
{
  uint64_t result = __NSShouldUseTokenizerForPushOut((const __CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA20], "preferredLanguages"), "firstObject"));
  prepareTokenizerForPreferredLanguage__shouldUseTokenizerForSystemLanguage = result;
  return result;
}

- (NSString)debugString
{
  NSUInteger v3 = [(NSAttributedString *)[(NSParagraphArbitrator *)self attributedString] attributesAtIndex:[(NSParagraphArbitrator *)self paragraphRange] effectiveRange:0];
  if (!v3) {
    goto LABEL_5;
  }
  objc_super v4 = v3;
  id v5 = [(NSDictionary *)v3 objectForKey:@"NSFont"];
  if (objc_msgSend(-[NSDictionary objectForKey:](v4, "objectForKey:", @"CTVerticalForms"), "BOOLValue"))id v5 = (id)objc_msgSend(v5, "verticalFont"); {
  if (!v5)
  }
LABEL_5:
    id v5 = (id)NSDefaultFont();
  CFLocaleRef v6 = (void *)[v5 fontDescriptor];
  CFLocaleRef v7 = (void *)[v6 objectForKey:*MEMORY[0x1E4F24498]];
  if (!v7) {
    return (NSString *)@"ts=nil";
  }
  int v8 = v7;
  if ([v7 hasPrefix:@"UICTFontTextStyle"]) {
    int v8 = (void *)[v8 substringFromIndex:objc_msgSend(@"UICTFontTextStyle", "length")];
  }
  int v9 = [(NSParagraphArbitrator *)self _lineBreakStyle];
  CFRange v10 = (NSString *)[MEMORY[0x1E4F28E78] stringWithFormat:@"ts=%@", v8];
  uint64_t v11 = v10;
  if ((v9 - 2) <= 3) {
    [(NSString *)v10 appendFormat:off_1E55C6D08[v9 - 2]];
  }
  return v11;
}

- (__CFStringTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (unint64_t)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

- (void)setMaximumNumberOfLines:(unint64_t)a3
{
  self->_maximumNumberOfLines = a3;
}

- (int64_t)typesetterBehavior
{
  return self->_typesetterBehavior;
}

- (BOOL)textContainerIsSimple
{
  return self->_textContainerIsSimple;
}

- (NSString)preferredLanguage
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)_optimalLineBreakContextBeforeIndex:lineFragmentWidth:range:.cold.1()
{
  __assert_rtn("-[NSParagraphArbitrator _optimalLineBreakContextBeforeIndex:lineFragmentWidth:range:]", "NSParagraphArbitrator.m", 798, "self.paragraphRange.location <= range.location && NSMaxRange(range) <= NSMaxRange(self.paragraphRange)");
}

- (void)_optimalLineBreakContextBeforeIndex:lineFragmentWidth:range:.cold.2()
{
}

@end
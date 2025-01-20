@interface _NSLineMetrics
- (BOOL)_hasShaping;
- (NSAttributedString)attributedString;
- (_NSLineMetrics)initWithAttributedString:(id)a3 range:(_NSRange)a4;
- (_NSLineMetrics)initWithAttributedString:(id)a3 range:(_NSRange)a4 line:(__CTLine *)a5;
- (_NSRange)lineRange;
- (__CFLocale)locale;
- (__CTLine)line;
- (double)_finalAdvanceForCharacterAtIndex:(unint64_t)a3 range:(_NSRange *)a4;
- (double)_initialAdvanceForCharacterAtIndex:(unint64_t)a3 range:(_NSRange *)a4;
- (double)widthOfSubstringToIndex:(unint64_t)a3;
- (double)widthOfSubstringWithRange:(_NSRange)a3;
- (unint64_t)suggestedLineBreakAfterIndex:(unint64_t)a3 withWidth:(double)a4;
- (void)_calculatePositions;
- (void)_calculatePositions:(double *)a3 hasAdvanceAdjustment:(BOOL *)a4 withCapacity:(unint64_t)a5 forAttributedString:(id)a6 range:(_NSRange)a7 line:(__CTLine *)a8;
- (void)_ensureGlyphCapacity:(unint64_t)a3;
- (void)_ensureTerminalAdvancesCapacity:(unint64_t)a3;
- (void)_getInitialAdvanceForComposedCharacterInRange:(_NSRange)a3 andFinalAdvanceForComposedCharacterInRange:(_NSRange)a4;
- (void)dealloc;
- (void)setAttributedString:(id)a3 range:(_NSRange)a4 line:(__CTLine *)a5;
- (void)setLocale:(__CFLocale *)a3;
@end

@implementation _NSLineMetrics

- (double)widthOfSubstringWithRange:(_NSRange)a3
{
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL) {
    -[_NSLineMetrics widthOfSubstringWithRange:]();
  }
  NSUInteger location = a3.location;
  NSUInteger v5 = self->_lineRange.location;
  if (a3.location < v5) {
    -[_NSLineMetrics widthOfSubstringWithRange:]();
  }
  NSUInteger v6 = a3.location + a3.length;
  if (a3.location + a3.length > self->_lineRange.length + v5) {
    -[_NSLineMetrics widthOfSubstringWithRange:]();
  }
  if (!a3.length) {
    return 0.0;
  }
  double v7 = self->_positions[v6 - v5] - self->_positions[a3.location - v5];
  if (a3.length != 1 && [(_NSLineMetrics *)self _hasShaping])
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    [(_NSLineMetrics *)self _initialAdvanceForCharacterAtIndex:location range:&v13];
    if (v13 == location) {
      double v7 = v7
    }
         + v8
         - (self->_positions[v14 + location - self->_lineRange.location]
          - self->_positions[location - self->_lineRange.location]);
    [(_NSLineMetrics *)self _finalAdvanceForCharacterAtIndex:v6 - 1 range:&v11];
    if (v12 + v11 == v6) {
      return v7
    }
           + v9
           - (self->_positions[v6 - self->_lineRange.location]
            - self->_positions[v11 - self->_lineRange.location]);
  }
  return v7;
}

- (unint64_t)suggestedLineBreakAfterIndex:(unint64_t)a3 withWidth:(double)a4
{
  NSUInteger location = self->_lineRange.location;
  if (location > a3 || self->_lineRange.length + location < a3) {
    -[_NSLineMetrics suggestedLineBreakAfterIndex:withWidth:]();
  }
  CTLineGetStringRange(self->_line);
  uint64_t v6 = CTLineSuggestClusterBreakWithOffset();
  if (v6 < 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v6 + a3;
  }
}

- (BOOL)_hasShaping
{
  if (_hasShaping_once != -1) {
    dispatch_once(&_hasShaping_once, &__block_literal_global_10);
  }
  unint64_t hasShaping = self->_hasShaping;
  if (hasShaping == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_unint64_t hasShaping = 0;
    attributedString = self->_attributedString;
    NSUInteger location = self->_lineRange.location;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __29___NSLineMetrics__hasShaping__block_invoke_2;
    v9[3] = &unk_1E55C65B0;
    v9[4] = self;
    [(NSAttributedString *)attributedString enumerateAttribute:@"NSParagraphStyle", location, self->_lineRange.length, 0x100000, v9 inRange options usingBlock];
    unint64_t hasShaping = self->_hasShaping;
    if (!hasShaping)
    {
      locale = self->_locale;
      if (locale)
      {
        double v7 = (id)CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x1E4F1D218]);
        if (v7 && [(id)_hasShaping_cjShapingLanguages containsObject:v7]) {
          self->_unint64_t hasShaping = 1;
        }
      }
      else
      {
        double v7 = 0;
      }

      unint64_t hasShaping = self->_hasShaping;
    }
  }
  return hasShaping != 0;
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
  }
  self->_unint64_t hasShaping = 0x7FFFFFFFFFFFFFFFLL;
}

- (_NSLineMetrics)initWithAttributedString:(id)a3 range:(_NSRange)a4 line:(__CTLine *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_NSLineMetrics;
  v10 = [(_NSLineMetrics *)&v13 init];
  uint64_t v11 = v10;
  if (v10) {
    -[_NSLineMetrics setAttributedString:range:line:](v10, "setAttributedString:range:line:", v9, location, length, a5);
  }

  return v11;
}

- (void)setAttributedString:(id)a3 range:(_NSRange)a4 line:(__CTLine *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v12 = a3;
  objc_storeStrong((id *)&self->_attributedString, a3);
  self->_lineRange.NSUInteger location = location;
  self->_lineRange.NSUInteger length = length;
  line = self->_line;
  if (line)
  {
    CFRelease(line);
    self->_line = 0;
  }
  if (a5)
  {
    self->_line = (__CTLine *)CFRetain(a5);
  }
  else
  {
    objc_msgSend(v12, "attributedSubstringFromRange:", location, length);
    CFAttributedStringRef v11 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue();
    self->_line = CTLineCreateWithAttributedString(v11);
  }
  [(_NSLineMetrics *)self _calculatePositions];
  self->_terminalAdvancesValid = 0;
  self->_unint64_t hasShaping = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_calculatePositions
{
  size_t v3 = self->_lineRange.length + 1;
  self->_positions = (double *)malloc_type_realloc(self->_positions, 8 * v3, 0x100004000313F17uLL);
  v4 = (BOOL *)malloc_type_realloc(self->_hasAdvanceAdjustment, v3, 0x100004077774924uLL);
  self->_hasAdvanceAdjustment = v4;
  bzero(v4, v3);
  -[_NSLineMetrics _calculatePositions:hasAdvanceAdjustment:withCapacity:forAttributedString:range:line:](self, "_calculatePositions:hasAdvanceAdjustment:withCapacity:forAttributedString:range:line:", self->_positions, self->_hasAdvanceAdjustment, v3, self->_attributedString, self->_lineRange.location, self->_lineRange.length, self->_line);
}

- (void)_calculatePositions:(double *)a3 hasAdvanceAdjustment:(BOOL *)a4 withCapacity:(unint64_t)a5 forAttributedString:(id)a6 range:(_NSRange)a7 line:(__CTLine *)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v37 = a6;
  if (length + 1 > a5) {
    -[_NSLineMetrics _calculatePositions:hasAdvanceAdjustment:withCapacity:forAttributedString:range:line:]();
  }
  if (self->_isInCalculatePositions) {
    -[_NSLineMetrics _calculatePositions:hasAdvanceAdjustment:withCapacity:forAttributedString:range:line:]();
  }
  self->_isInCalculatePositions = 1;
  uint64_t __pattern8 = 0x7FF8000000000000;
  memset_pattern8(a3, &__pattern8, 8 * a5);
  objc_super v13 = a8;
  if (!a8) {
    objc_super v13 = CTLineCreateWithAttributedString((CFAttributedStringRef)objc_msgSend(v37, "attributedSubstringFromRange:", location, length));
  }
  CFIndex v14 = CTLineGetStringRange(v13).location;
  CFArrayRef GlyphRuns = CTLineGetGlyphRuns(v13);
  CFIndex Count = CFArrayGetCount(GlyphRuns);
  runsBuf = self->_runsBuf;
  if (runsBuf)
  {
    CFArrayRemoveAllValues(runsBuf);
    v45.NSUInteger location = 0;
    v45.NSUInteger length = Count;
    CFArrayAppendArray(self->_runsBuf, GlyphRuns, v45);
    MutableCopy = self->_runsBuf;
  }
  else
  {
    CFAllocatorRef v19 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFArrayRef v20 = CTLineGetGlyphRuns(v13);
    MutableCopy = CFArrayCreateMutableCopy(v19, 0, v20);
    self->_runsBuf = MutableCopy;
  }
  v36 = v13;
  _CFArraySortValuesWithBlock(MutableCopy, 0, Count, &__block_literal_global_6);
  if (Count)
  {
    CFIndex v21 = 0;
    double v22 = 0.0;
    CFIndex v38 = Count;
    v39 = self;
    do
    {
      ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(self->_runsBuf, v21);
      GlyphCFIndex Count = CTRunGetGlyphCount(ValueAtIndex);
      [(_NSLineMetrics *)self _ensureGlyphCapacity:GlyphCount];
      advancesBuf = self->_advancesBuf;
      stringIndicesBuf = self->_stringIndicesBuf;
      v43.NSUInteger location = 0;
      v43.NSUInteger length = GlyphCount;
      CTRunGetBaseAdvancesAndOrigins(ValueAtIndex, v43, advancesBuf, 0);
      v44.NSUInteger location = 0;
      v44.NSUInteger length = GlyphCount;
      CTRunGetStringIndices(ValueAtIndex, v44, stringIndicesBuf);
      CTRunGetPropertiesPtr();
      if (CTRunGetStatus(ValueAtIndex))
      {
        if (GlyphCount)
        {
          CFIndex v31 = GlyphCount - 1;
          for (i = &advancesBuf[GlyphCount - 1].width; ; i -= 2)
          {
            int64_t v33 = stringIndicesBuf[v31] - v14;
            if (!v31) {
              break;
            }
            double v34 = *i;
            double v22 = v22 + v34;
            --v31;
          }
          CTRunGetInitialBaseAdvance();
          if (v35 != 0.0)
          {
            double v22 = v22 + v35;
            if (a4) {
              a4[v33] = 1;
            }
          }
          double v22 = v22 + *i;
        }
      }
      else if (GlyphCount)
      {
        for (uint64_t j = 0; j != GlyphCount; ++j)
        {
          int64_t v28 = stringIndicesBuf[j] - v14;
          if (!j)
          {
            CTRunGetInitialBaseAdvance();
            if (v30 != 0.0)
            {
              double v22 = v22 + v30;
              if (a4) {
                a4[v28] = 1;
              }
            }
          }
          double width = advancesBuf->width;
          ++advancesBuf;
          double v22 = v22 + width;
        }
      }
      ++v21;
      self = v39;
    }
    while (v21 != v38);
  }
  else
  {
    double v22 = 0.0;
  }
  for (a3[length] = v22; length; --length)
    ;
  CFArrayRemoveAllValues(self->_runsBuf);
  if (!a8) {
    CFRelease(v36);
  }
  self->_isInCalculatePositions = 0;
}

- (void)_ensureGlyphCapacity:(unint64_t)a3
{
  unint64_t glyphCapacity = self->_glyphCapacity;
  if (glyphCapacity) {
    unint64_t v5 = self->_glyphCapacity;
  }
  else {
    unint64_t v5 = 16;
  }
  do
  {
    unint64_t v6 = v5;
    v5 *= 2;
  }
  while (v6 < a3);
  if (v6 > glyphCapacity)
  {
    self->_unint64_t glyphCapacity = v6;
    self->_advancesBuf = (CGSize *)malloc_type_realloc(self->_advancesBuf, 16 * v6, 0x1000040451B5BE8uLL);
    self->_stringIndicesBuf = (int64_t *)malloc_type_realloc(self->_stringIndicesBuf, 8 * self->_glyphCapacity, 0x100004000313F17uLL);
  }
}

- (__CFLocale)locale
{
  return self->_locale;
}

- (_NSLineMetrics)initWithAttributedString:(id)a3 range:(_NSRange)a4
{
  return -[_NSLineMetrics initWithAttributedString:range:line:](self, "initWithAttributedString:range:line:", a3, a4.location, a4.length, 0);
}

- (void)dealloc
{
  line = self->_line;
  if (line) {
    CFRelease(line);
  }
  positions = self->_positions;
  if (positions) {
    free(positions);
  }
  hasAdvanceAdjustment = self->_hasAdvanceAdjustment;
  if (hasAdvanceAdjustment) {
    free(hasAdvanceAdjustment);
  }
  runsBuf = self->_runsBuf;
  if (runsBuf) {
    CFRelease(runsBuf);
  }
  advancesBuf = self->_advancesBuf;
  if (advancesBuf) {
    free(advancesBuf);
  }
  stringIndicesBuf = self->_stringIndicesBuf;
  if (stringIndicesBuf) {
    free(stringIndicesBuf);
  }
  initialAdvances = self->_initialAdvances;
  if (initialAdvances) {
    free(initialAdvances);
  }
  finalAdvances = self->_finalAdvances;
  if (finalAdvances) {
    free(finalAdvances);
  }
  locale = self->_locale;
  if (locale) {
    CFRelease(locale);
  }
  v12.receiver = self;
  v12.super_class = (Class)_NSLineMetrics;
  [(_NSLineMetrics *)&v12 dealloc];
}

- (void)_ensureTerminalAdvancesCapacity:(unint64_t)a3
{
  unint64_t terminalAdvancesCapacity = self->_terminalAdvancesCapacity;
  if (terminalAdvancesCapacity) {
    unint64_t v5 = self->_terminalAdvancesCapacity;
  }
  else {
    unint64_t v5 = 16;
  }
  do
  {
    unint64_t v6 = v5;
    v5 *= 2;
  }
  while (v6 < a3);
  if (v6 > terminalAdvancesCapacity)
  {
    self->_unint64_t terminalAdvancesCapacity = v6;
    self->_initialAdvances = (double *)malloc_type_realloc(self->_initialAdvances, 8 * v6, 0x100004000313F17uLL);
    self->_finalAdvances = (double *)malloc_type_realloc(self->_finalAdvances, 8 * self->_terminalAdvancesCapacity, 0x100004000313F17uLL);
  }
}

- (double)_initialAdvanceForCharacterAtIndex:(unint64_t)a3 range:(_NSRange *)a4
{
  if (_initialAdvanceForCharacterAtIndex_range__once != -1) {
    dispatch_once(&_initialAdvanceForCharacterAtIndex_range__once, &__block_literal_global_17);
  }
  NSUInteger location = self->_lineRange.location;
  BOOL v9 = a3 >= location;
  NSUInteger v8 = a3 - location;
  BOOL v9 = !v9 || v8 >= self->_lineRange.length;
  if (v9) {
    -[_NSLineMetrics _initialAdvanceForCharacterAtIndex:range:]();
  }
  v10 = [(NSAttributedString *)self->_attributedString string];
  uint64_t v11 = [v10 characterAtIndex:a3];

  LODWORD(v10) = self->_hasAdvanceAdjustment[a3 - self->_lineRange.location];
  int v12 = [(id)_initialAdvanceForCharacterAtIndex_range__openingMarkCharacterSet characterIsMember:v11];
  if (v10) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = v12 == 0;
  }
  if (v13 || a3 + 1 == self->_lineRange.length + self->_lineRange.location) {
    return NAN;
  }
  v15 = [(NSAttributedString *)self->_attributedString string];
  NSUInteger v16 = [v15 rangeOfComposedCharacterSequenceAtIndex:a3];
  NSUInteger v18 = v17;

  double result = NAN;
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v19 = self->_lineRange.location;
    if (v19 != 0x7FFFFFFFFFFFFFFFLL && v19 <= v16)
    {
      if (v16 + v18 >= self->_lineRange.length + v19) {
        return NAN;
      }
      a4->NSUInteger location = v16;
      a4->NSUInteger length = v18;
      if (self->_terminalAdvancesValid)
      {
        return self->_initialAdvances[v16 - self->_lineRange.location];
      }
      else
      {
        CFArrayRef v20 = [(NSAttributedString *)self->_attributedString string];
        unint64_t v21 = [v20 rangeOfComposedCharacterSequenceAtIndex:v16 + v18];
        uint64_t v23 = v22;

        double result = NAN;
        if (v21 != 0x7FFFFFFFFFFFFFFFLL)
        {
          NSUInteger v24 = self->_lineRange.location;
          if (v24 != 0x7FFFFFFFFFFFFFFFLL && v24 <= v21)
          {
            double result = NAN;
            if (v16 + v18 <= v21 && v21 + v23 <= self->_lineRange.length + v24)
            {
              -[_NSLineMetrics _getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:](self, "_getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:", v16, v18, v21, v23, NAN);
              return self->_initialAdvances[v16 - self->_lineRange.location];
            }
          }
        }
      }
    }
  }
  return result;
}

- (double)_finalAdvanceForCharacterAtIndex:(unint64_t)a3 range:(_NSRange *)a4
{
  if (_finalAdvanceForCharacterAtIndex_range__once != -1) {
    dispatch_once(&_finalAdvanceForCharacterAtIndex_range__once, &__block_literal_global_24);
  }
  NSUInteger location = self->_lineRange.location;
  BOOL v9 = a3 >= location;
  NSUInteger v8 = a3 - location;
  BOOL v9 = !v9 || v8 >= self->_lineRange.length;
  if (v9) {
    -[_NSLineMetrics _finalAdvanceForCharacterAtIndex:range:]();
  }
  v10 = [(NSAttributedString *)self->_attributedString string];
  uint64_t v11 = [v10 characterAtIndex:a3];

  LODWORD(v10) = self->_hasAdvanceAdjustment[a3 - self->_lineRange.location];
  int v12 = [(id)_finalAdvanceForCharacterAtIndex_range__closingMarkCharacterSet characterIsMember:v11];
  if (v10) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = v12 == 0;
  }
  if (v13) {
    return NAN;
  }
  NSUInteger v14 = self->_lineRange.location;
  if (a3 < v14 || a3 - v14 >= self->_lineRange.length) {
    -[_NSLineMetrics _finalAdvanceForCharacterAtIndex:range:]();
  }
  if (a3 == v14) {
    return NAN;
  }
  NSUInteger v16 = [(NSAttributedString *)self->_attributedString string];
  NSUInteger v17 = [v16 rangeOfComposedCharacterSequenceAtIndex:a3];
  NSUInteger v19 = v18;

  double result = NAN;
  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v20 = self->_lineRange.location;
    if (v20 != 0x7FFFFFFFFFFFFFFFLL && v20 <= v17)
    {
      double result = NAN;
      if (v17 != v20 && v17 + v19 <= self->_lineRange.length + v20)
      {
        a4->NSUInteger location = v17;
        a4->NSUInteger length = v19;
        if (self->_terminalAdvancesValid)
        {
          return self->_finalAdvances[v17 - self->_lineRange.location];
        }
        else
        {
          unint64_t v21 = [(NSAttributedString *)self->_attributedString string];
          unint64_t v22 = [v21 rangeOfComposedCharacterSequenceAtIndex:v17 - 1];
          uint64_t v24 = v23;

          double result = NAN;
          if (v22 != 0x7FFFFFFFFFFFFFFFLL)
          {
            NSUInteger v25 = self->_lineRange.location;
            if (v25 != 0x7FFFFFFFFFFFFFFFLL && v25 <= v22)
            {
              double result = NAN;
              if (v22 + v24 <= self->_lineRange.length + v25 && v22 + v24 <= v17)
              {
                -[_NSLineMetrics _getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:](self, "_getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:", v22, v24, v17, v19, NAN);
                return self->_finalAdvances[v17 - self->_lineRange.location];
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (void)_getInitialAdvanceForComposedCharacterInRange:(_NSRange)a3 andFinalAdvanceForComposedCharacterInRange:(_NSRange)a4
{
  __pattern8[32] = *MEMORY[0x1E4F143B8];
  NSUInteger location = self->_lineRange.location;
  BOOL v6 = a3.location == 0x7FFFFFFFFFFFFFFFLL || location == 0x7FFFFFFFFFFFFFFFLL || location > a3.location;
  NSUInteger v7 = a3.location + a3.length;
  NSUInteger v8 = self->_lineRange.length + location;
  if (v6 || v7 > v8) {
    -[_NSLineMetrics _getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:]();
  }
  if (a4.location == 0x7FFFFFFFFFFFFFFFLL || location > a4.location || a4.location + a4.length > v8) {
    -[_NSLineMetrics _getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:]();
  }
  if (v7 > a4.location) {
    -[_NSLineMetrics _getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:]();
  }
  -[_NSLineMetrics _ensureTerminalAdvancesCapacity:](self, "_ensureTerminalAdvancesCapacity:");
  if (!self->_terminalAdvancesValid)
  {
    initialAdvances = self->_initialAdvances;
    NSUInteger length = self->_lineRange.length;
    __pattern8[0] = 0x7FF8000000000000;
    memset_pattern8(initialAdvances, __pattern8, 8 * length);
    finalAdvances = self->_finalAdvances;
    NSUInteger v14 = self->_lineRange.length;
    __pattern8[0] = 0x7FF8000000000000;
    memset_pattern8(finalAdvances, __pattern8, 8 * v14);
    self->_terminalAdvancesValid = 1;
  }
}

- (double)widthOfSubstringToIndex:(unint64_t)a3
{
  NSUInteger location = self->_lineRange.location;
  if (a3 < location || self->_lineRange.length + location < a3) {
    -[_NSLineMetrics widthOfSubstringToIndex:]();
  }

  -[_NSLineMetrics widthOfSubstringWithRange:](self, "widthOfSubstringWithRange:");
  return result;
}

- (NSAttributedString)attributedString
{
  return (NSAttributedString *)objc_getProperty(self, a2, 8, 1);
}

- (_NSRange)lineRange
{
  objc_copyStruct(v4, &self->_lineRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (__CTLine)line
{
  return self->_line;
}

- (void).cxx_destruct
{
}

- (void)_calculatePositions:hasAdvanceAdjustment:withCapacity:forAttributedString:range:line:.cold.1()
{
  __assert_rtn("-[_NSLineMetrics _calculatePositions:hasAdvanceAdjustment:withCapacity:forAttributedString:range:line:]", "NSLineMetrics.m", 87, "range.length + 1 <= capacity && \"positions buffer isn't big enough for requested line range\"");
}

- (void)_calculatePositions:hasAdvanceAdjustment:withCapacity:forAttributedString:range:line:.cold.2()
{
}

- (void)_initialAdvanceForCharacterAtIndex:range:.cold.1()
{
}

- (void)_finalAdvanceForCharacterAtIndex:range:.cold.1()
{
}

- (void)_finalAdvanceForCharacterAtIndex:range:.cold.2()
{
}

- (void)_getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:.cold.1()
{
}

- (void)_getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:.cold.2()
{
}

- (void)_getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:.cold.3()
{
  __assert_rtn("-[_NSLineMetrics _getInitialAdvanceForComposedCharacterInRange:andFinalAdvanceForComposedCharacterInRange:]", "NSLineMetrics.m", 392, "NSMaxRange(c0) <= c1.location");
}

- (void)widthOfSubstringWithRange:.cold.1()
{
  __assert_rtn("-[_NSLineMetrics widthOfSubstringWithRange:]", "NSLineMetrics.m", 417, "range.location != NSNotFound");
}

- (void)widthOfSubstringWithRange:.cold.2()
{
  __assert_rtn("-[_NSLineMetrics widthOfSubstringWithRange:]", "NSLineMetrics.m", 418, "_lineRange.location <= range.location");
}

- (void)widthOfSubstringWithRange:.cold.3()
{
  __assert_rtn("-[_NSLineMetrics widthOfSubstringWithRange:]", "NSLineMetrics.m", 419, "NSMaxRange(range) <= NSMaxRange(_lineRange)");
}

- (void)widthOfSubstringWithRange:.cold.4()
{
}

- (void)widthOfSubstringWithRange:.cold.5()
{
}

- (void)widthOfSubstringToIndex:.cold.1()
{
  __assert_rtn("-[_NSLineMetrics widthOfSubstringToIndex:]", "NSLineMetrics.m", 463, "_lineRange.location <= index && index <= NSMaxRange(_lineRange)");
}

- (void)suggestedLineBreakAfterIndex:withWidth:.cold.1()
{
  __assert_rtn("-[_NSLineMetrics suggestedLineBreakAfterIndex:withWidth:]", "NSLineMetrics.m", 468, "_lineRange.location <= index && index <= NSMaxRange(_lineRange)");
}

@end
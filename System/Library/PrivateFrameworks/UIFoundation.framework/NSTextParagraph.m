@interface NSTextParagraph
+ (id)textParagraphsForAttributedString:(id)a3 range:(_NSRange)a4;
- (BOOL)_containsTextAttachments;
- (BOOL)isBeginningOfParagraph;
- (BOOL)isEndOfParagraph;
- (CGSize)estimatedIntrinsicContentSizeForTextLayoutManager:(id)a3;
- (NSAttributedString)attributedString;
- (NSDictionary)attributes;
- (NSTextParagraph)init;
- (NSTextParagraph)initWithAttributedString:(NSAttributedString *)attributedString;
- (NSTextParagraph)initWithAttributedString:(id)a3 range:(_NSRange)a4;
- (NSTextParagraph)initWithString:(id)a3 attributes:(id)a4;
- (NSTextParagraph)initWithTextAttachment:(id)a3 attributes:(id)a4;
- (NSTextParagraph)initWithTextContentManager:(id)a3;
- (NSTextRange)paragraphContentRange;
- (NSTextRange)paragraphSeparatorRange;
- (_NSRange)rangeForLocation:(id)a3 allowsTrailingEdge:(BOOL)a4;
- (id)_textElementLocationForCharacterIndex:(unint64_t)a3;
- (id)description;
- (id)locationForCharacterIndex:(int64_t)a3 actualRange:(_NSRange *)a4;
- (id)locationForCharacterIndex:(int64_t)a3 dataSourceLocationsOnly:(BOOL)a4 actualRange:(_NSRange *)a5;
- (id)paragraphRange;
- (int64_t)_resolvedBaseWritingDirectionWithFallbackDirection:(int64_t)a3;
- (void)_setContainsTextAttachments:(BOOL)a3;
- (void)_setElementTextLocation:(id)a3 forCharacterIndex:(unint64_t)a4;
- (void)dealloc;
- (void)enumerateSubstringsFromLocation:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateSubstringsInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)setAttributedString:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setElementRange:(id)a3;
- (void)setIsBeginningOfParagraph:(BOOL)a3;
- (void)setIsEndOfParagraph:(BOOL)a3;
- (void)setParagraphContentRange:(id)a3;
- (void)setParagraphSeparatorRange:(id)a3;
- (void)synchronizeDocumentRange;
@end

@implementation NSTextParagraph

- (_NSRange)rangeForLocation:(id)a3 allowsTrailingEdge:(BOOL)a4
{
  long long v9 = xmmword_18E5F72A0;
  if (a3
    && ((BOOL v4 = a4,
         [(NSTextRange *)[(NSTextElement *)self elementRange] containsLocation:a3])
     || v4
     && objc_msgSend(-[NSTextRange endLocation](-[NSTextElement elementRange](self, "elementRange"), "endLocation"), "isEqual:", a3)))
  {
    [(NSTextParagraph *)self locationForCharacterIndex:[(NSTextContentManager *)[(NSTextElement *)self textContentManager] offsetFromLocation:[(NSTextRange *)[(NSTextElement *)self elementRange] location] toLocation:a3] dataSourceLocationsOnly:0 actualRange:&v9];
    NSUInteger v8 = *((void *)&v9 + 1);
    NSUInteger v7 = v9;
  }
  else
  {
    NSUInteger v8 = 0;
    NSUInteger v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  result.length = v8;
  result.location = v7;
  return result;
}

- (id)locationForCharacterIndex:(int64_t)a3 dataSourceLocationsOnly:(BOOL)a4 actualRange:(_NSRange *)a5
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger length = [(NSAttributedString *)[(NSTextParagraph *)self attributedString] length];
    NSUInteger v11 = 0;
  }
  else
  {
    NSUInteger length = self->_range.length;
    NSUInteger v11 = self->_range.location;
  }
  if (length < a3) {
    return 0;
  }
  id v13 = [(NSTextContentManager *)[(NSTextElement *)self textContentManager] locationFromLocation:[(NSTextRange *)[(NSTextElement *)self elementRange] location] withOffset:a3];
  v12 = v13;
  if (a5 && v13)
  {
    if (length <= a3)
    {
      v14.NSUInteger length = 0;
      v14.NSUInteger location = v11 + a3;
    }
    else
    {
      v14.NSUInteger location = [(NSString *)[(NSAttributedString *)self->_attributedString string] rangeOfComposedCharacterSequenceAtIndex:v11 + a3];
      if (location != 0x7FFFFFFFFFFFFFFFLL) {
        NSRange v14 = NSIntersectionRange(v14, *p_range);
      }
    }
    a5->NSUInteger location = v14.location - v11;
    a5->NSUInteger length = v14.length;
  }
  return v12;
}

- (NSAttributedString)attributedString
{
  NSUInteger location = self->_range.location;
  attributedString = self->_attributedString;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v4 = attributedString;
    return v4;
  }
  else
  {
    return -[NSAttributedString attributedSubstringFromRange:](attributedString, "attributedSubstringFromRange:");
  }
}

- (void)setIsEndOfParagraph:(BOOL)a3
{
  self->_isEndOfParagraph = a3;
}

- (void)setIsBeginningOfParagraph:(BOOL)a3
{
  self->_isBeginningOfParagraph = a3;
}

- (void)_setContainsTextAttachments:(BOOL)a3
{
  BOOL v3 = a3;
  objc_sync_enter(self);
  if (v3) {
    unsigned __int8 v5 = 2;
  }
  else {
    unsigned __int8 v5 = 1;
  }
  self->_containsTextAttachments = v5;

  objc_sync_exit(self);
}

- (NSTextParagraph)initWithAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v7 = [(NSTextParagraph *)self initWithAttributedString:0];
  if (v7)
  {
    v7->_attributedString = (NSAttributedString *)a3;
    v7->_range.NSUInteger location = location;
    v7->_range.NSUInteger length = length;
  }
  return v7;
}

- (int64_t)_resolvedBaseWritingDirectionWithFallbackDirection:(int64_t)a3
{
  int64_t result = self->_resolvedBaseDirection;
  int64_t fallbackBaseDirection = self->_fallbackBaseDirection;
  if ((fallbackBaseDirection == a3 || fallbackBaseDirection == -1) && result != -1) {
    return result;
  }
  uint64_t v8 = a3;
  attributedString = self->_attributedString;
  if (!attributedString) {
    attributedString = [(NSTextParagraph *)self attributedString];
  }
  NSUInteger location = self->_range.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t length = [(NSAttributedString *)attributedString length];
    NSUInteger location = 0;
  }
  else
  {
    uint64_t length = self->_range.length;
  }
  attributes = self->_attributes;
  if (attributes)
  {
LABEL_15:
    id v13 = [(NSDictionary *)attributes objectForKeyedSubscript:@"NSParagraphStyle"];
    if (v13) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (![(NSAttributedString *)attributedString length])
  {
    attributes = self->_attributes;
    goto LABEL_15;
  }
  id v13 = [(NSAttributedString *)attributedString attribute:@"NSParagraphStyle" atIndex:location effectiveRange:0];
  if (!v13) {
LABEL_16:
  }
    id v13 = +[NSParagraphStyle defaultParagraphStyle];
LABEL_17:
  int64_t result = [(NSParagraphStyle *)v13 baseWritingDirection];
  self->_resolvedBaseDirection = result;
  if (result == -1)
  {
    if (length)
    {
      NSRange v14 = (unsigned __int8 *)NSZoneMalloc(0, length);
      v15 = NSZoneMalloc(0, length);
      memset(v14, v8, length);
      CFAttributedStringGetBidiLevelsAndResolvedDirections();
      if (v14)
      {
        uint64_t v8 = *v14;
        NSZoneFree(0, v14);
        NSZoneFree(0, v15);
      }
      else
      {
        uint64_t v8 = -1;
      }
    }
    self->_resolvedBaseDirection = v8;
    return v8;
  }
  else
  {
    self->_int64_t fallbackBaseDirection = -1;
  }
  return result;
}

- (NSTextRange)paragraphSeparatorRange
{
  objc_sync_enter(self);
  BOOL v3 = self->_paragraphSeparatorRange;
  objc_sync_exit(self);
  return v3;
}

- (void)setElementRange:(id)a3
{
  objc_sync_enter(self);
  v6.receiver = self;
  v6.super_class = (Class)NSTextParagraph;
  [(NSTextElement *)&v6 setElementRange:a3];
  if (self->_range.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_range.NSUInteger location = [(NSTextRange *)[(NSTextElement *)self elementRange] range];
    self->_range.uint64_t length = v5;
  }
  objc_sync_exit(self);
}

- (void)setParagraphContentRange:(id)a3
{
  objc_sync_enter(self);
  paragraphContentRange = self->_paragraphContentRange;
  if (paragraphContentRange != a3)
  {

    self->_paragraphContentRange = (NSTextRange *)a3;
  }

  objc_sync_exit(self);
}

- (NSTextParagraph)initWithAttributedString:(NSAttributedString *)attributedString
{
  v7.receiver = self;
  v7.super_class = (Class)NSTextParagraph;
  BOOL v4 = [(NSTextElement *)&v7 initWithTextContentManager:0];
  NSUInteger v5 = v4;
  if (v4)
  {
    [(NSTextElement *)v4 setCoalescingType:3];
    [(NSTextParagraph *)v5 setAttributedString:attributedString];
    v5->_range = (_NSRange)xmmword_18E5F72A0;
    v5->_resolvedBaseDirection = -1;
    v5->_int64_t fallbackBaseDirection = 0;
    v5->_isEndOfParagraph = 1;
    v5->_isBeginningOfParagraph = 1;
  }
  return v5;
}

- (void)setAttributedString:(id)a3
{
  if (self->_attributedString != a3)
  {
    objc_sync_enter(self);

    self->_attributedString = (NSAttributedString *)[a3 copy];
    self->_range = (_NSRange)xmmword_18E5F72A0;
    objc_sync_exit(self);
  }
}

- (void)setParagraphSeparatorRange:(id)a3
{
  objc_sync_enter(self);
  if (self->_paragraphSeparatorRange != a3)
  {
    unsigned __int8 v5 = [(NSTextElement *)self coalescingType];
    paragraphSeparatorRange = self->_paragraphSeparatorRange;

    uint64_t v7 = v5 & 0xF;
    self->_paragraphSeparatorRange = (NSTextRange *)a3;
    if (!paragraphSeparatorRange)
    {
      if ([a3 isEmpty])
      {
        uint64_t v7 = v5 & 0xD | 2u;
      }
      else
      {
        attributedString = self->_attributedString;
        if (attributedString) {
          long long v9 = [(NSAttributedString *)attributedString string];
        }
        else {
          long long v9 = [(NSAttributedString *)[(NSTextParagraph *)self attributedString] string];
        }
        v10 = v9;
        NSUInteger location = self->_range.location;
        if (location == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v12 = [(NSString *)v9 length];
        }
        else {
          uint64_t v12 = self->_range.length + location;
        }
        int v13 = [(NSString *)v10 characterAtIndex:v12 - 1];
        char v14 = v5 | 4;
        if (v13 != 13) {
          char v14 = v5;
        }
        uint64_t v7 = v14 & 0xD;
      }
    }
    [(NSTextElement *)self setCoalescingType:v7];
  }

  objc_sync_exit(self);
}

- (NSTextParagraph)initWithString:(id)a3 attributes:(id)a4
{
  objc_super v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:a3 attributes:a4];
  uint64_t v7 = [(NSTextParagraph *)self initWithAttributedString:v6];
  uint64_t v8 = v7;
  if (v7) {
    [(NSTextParagraph *)v7 setAttributes:a4];
  }

  return v8;
}

- (void)setAttributes:(id)a3
{
}

- (NSTextRange)paragraphContentRange
{
  objc_sync_enter(self);
  BOOL v3 = self->_paragraphContentRange;
  objc_sync_exit(self);
  return v3;
}

- (BOOL)isEndOfParagraph
{
  return self->_isEndOfParagraph;
}

- (CGSize)estimatedIntrinsicContentSizeForTextLayoutManager:(id)a3
{
  uint64_t v5 = objc_msgSend(a3, "textContainerForLocation:", -[NSTextRange location](-[NSTextElement elementRange](self, "elementRange"), "location"));
  double v6 = *MEMORY[0x1E4F1DB30];
  double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (!v5) {
    goto LABEL_28;
  }
  uint64_t v8 = (void *)v5;
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  attributedString = self->_attributedString;
  if (!attributedString) {
    attributedString = [(NSTextParagraph *)self attributedString];
  }
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t length = self->_range.length;
    if (length > 0)
    {
      NSUInteger v13 = p_range->location;
      goto LABEL_9;
    }
LABEL_10:
    char v14 = (NSDictionary *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "textSelections"), "firstObject"), "typingAttributes");
    int v15 = 0;
    goto LABEL_11;
  }
  int64_t length = [(NSAttributedString *)attributedString length];
  if (length <= 0) {
    goto LABEL_10;
  }
  NSUInteger v13 = 0;
LABEL_9:
  char v14 = [(NSAttributedString *)attributedString attributesAtIndex:v13 effectiveRange:0];
  int v15 = 1;
LABEL_11:
  [v8 size];
  double v17 = v16;
  double v26 = 0.0;
  +[NSCoreTypesetter _lineMetricsForAttributes:typesetterBehavior:usesFontLeading:applySpacings:usesSystemFontLeading:usesNegativeFontLeading:layoutOrientation:lineHeight:baselineOffset:spacing:](NSCoreTypesetter, "_lineMetricsForAttributes:typesetterBehavior:usesFontLeading:applySpacings:usesSystemFontLeading:usesNegativeFontLeading:layoutOrientation:lineHeight:baselineOffset:spacing:", v14, +[NSTypesetter defaultTypesetterBehavior](NSTypesetter, "defaultTypesetterBehavior"), [a3 usesFontLeading], 1, 0, 0, objc_msgSend(v8, "layoutOrientation"), &v26, 0, 0);
  if (([a3 allowsFontSubstitutionAffectingVerticalMetrics] & 1) == 0
    && (id v18 = [(NSDictionary *)v14 objectForKeyedSubscript:@"NSOriginalFont"]) != 0
    || (id v18 = [(NSDictionary *)v14 objectForKeyedSubscript:@"NSFont"]) != 0)
  {
    if (!v15) {
      goto LABEL_28;
    }
  }
  else
  {
    id v18 = (id)NSDefaultFont();
    if (!v15) {
      goto LABEL_28;
    }
  }
  if ((CTFontGetSymbolicTraits((CTFontRef)v18) & 0x400) != 0
    || (characters = 109, CGGlyph glyphs = 0, !CTFontGetGlyphsForCharacters((CTFontRef)v18, &characters, &glyphs, 1))
    || (advances.width = 0.0,
        advances.height = 0.0,
        CTFontGetAdvancesForGlyphs((CTFontRef)v18, kCTFontOrientationDefault, &glyphs, &advances, 1),
        double MaxX = advances.width * 0.5,
        advances.width * 0.5 <= 0.0))
  {
    [v18 boundingRectForFont];
    double MaxX = CGRectGetMaxX(v28);
  }
  uint64_t v20 = 0;
  double v6 = MaxX * (double)length;
  if (v17 > 0.0 && v17 < 10000000.0 && v6 >= v17)
  {
    uint64_t v20 = vcvtpd_s64_f64(v6 / v17);
    double v6 = v17;
  }
  if (v20 <= 1) {
    uint64_t v20 = 1;
  }
  double v7 = v26 * (double)v20;
LABEL_28:
  double v21 = v6;
  double v22 = v7;
  result.height = v22;
  result.width = v21;
  return result;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)isBeginningOfParagraph
{
  return self->_isBeginningOfParagraph;
}

- (id)locationForCharacterIndex:(int64_t)a3 actualRange:(_NSRange *)a4
{
  return [(NSTextParagraph *)self locationForCharacterIndex:a3 dataSourceLocationsOnly:1 actualRange:a4];
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];

  textElementLocationTable = self->_textElementLocationTable;
  self->_textElementLocationTable = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v4 = [(NSMapTable *)textElementLocationTable objectEnumerator];
  uint64_t v5 = [(NSEnumerator *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8++) setTextElement:0];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSEnumerator *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)NSTextParagraph;
  [(NSTextElement *)&v9 dealloc];
}

uint64_t __65__NSTextParagraph_enumerateSubstringsInRange_options_usingBlock___block_invoke(uint64_t a1, int a2, NSRange range1, NSUInteger a4, NSUInteger a5)
{
  NSUInteger length = range1.length;
  NSUInteger location = range1.location;
  NSRange v15 = *(NSRange *)(a1 + 40);
  v13.NSUInteger location = location;
  v13.NSUInteger length = length;
  NSIntersectionRange(v13, v15);
  v14.NSUInteger location = a4;
  v14.NSUInteger length = a5;
  NSIntersectionRange(v14, *(NSRange *)(a1 + 40));
  long long v10 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v10();
}

- (void)enumerateSubstringsFromLocation:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  objc_super v9 = [(NSTextParagraph *)self paragraphContentRange];
  long long v10 = [(NSTextParagraph *)self paragraphSeparatorRange];
  id v11 = [(NSTextRange *)v9 location];
  id v12 = [(NSTextRange *)v10 endLocation];
  if ([a3 compare:v11] != -1)
  {
    uint64_t v13 = [a3 compare:v12];
    id v14 = (a4 & 0x100) != 0 ? v11 : a3;
    id v15 = (a4 & 0x100) != 0 ? a3 : v12;
    if (v13 == -1)
    {
      id v11 = v14;
      id v12 = v15;
    }
  }
  uint64_t v16 = [(NSTextParagraph *)self rangeForLocation:v11 allowsTrailingEdge:0];
  uint64_t v17 = [(NSTextParagraph *)self rangeForLocation:v12 allowsTrailingEdge:1];
  if (v16 != 0x7FFFFFFFFFFFFFFFLL && v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70__NSTextParagraph_enumerateSubstringsFromLocation_options_usingBlock___block_invoke;
    v18[3] = &unk_1E55C6C38;
    v18[4] = self;
    v18[5] = a5;
    -[NSTextParagraph enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", v16, v17 - v16, a4, v18);
  }
}

- (void)enumerateSubstringsInRange:(_NSRange)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  objc_super v9 = [(NSAttributedString *)self->_attributedString string];
  NSUInteger v10 = self->_range.location;
  if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v10 = 0;
  }
  -[NSString enumerateSubstringsInRange:options:usingBlock:](v9, "enumerateSubstringsInRange:options:usingBlock:", MEMORY[0x1E4F143A8], 3221225472, __65__NSTextParagraph_enumerateSubstringsInRange_options_usingBlock___block_invoke, &unk_1E55C6C10, a5, v10 + location, length, v10);
}

void __70__NSTextParagraph_enumerateSubstringsFromLocation_options_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", [*(id *)(a1 + 32) locationForCharacterIndex:a3 dataSourceLocationsOnly:0 actualRange:0], objc_msgSend(*(id *)(a1 + 32), "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", a3 + a4, 0, 0));
  if (a3 != a5 || (id v12 = 0, a4 != a6)) {
    id v12 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", [*(id *)(a1 + 32) locationForCharacterIndex:a5 dataSourceLocationsOnly:0 actualRange:0], objc_msgSend(*(id *)(a1 + 32), "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", a5 + a6, 0, 0));
  }
  uint64_t v13 = v12;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)description
{
  if (self->_range.location != 0x7FFFFFFFFFFFFFFFLL || (attributedString = self->_attributedString) == 0) {
    attributedString = [(NSTextParagraph *)self attributedString];
  }
  uint64_t v4 = [(NSAttributedString *)attributedString string];
  return (id)[NSString stringWithFormat:@"<%@: %p \"%@\">", objc_opt_class(), self, v4];
}

+ (id)textParagraphsForAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3052000000;
  id v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  uint64_t v20 = 0;
  objc_super v9 = (void *)[a3 string];
  if (location + length > [a3 length])
  {
    uint64_t v13 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    v21.NSUInteger location = location;
    v21.NSUInteger length = length;
    [v13 handleFailureInMethod:a2, a1, @"NSTextElement.m", 262, @"Out-of-bounds range specified %@", NSStringFromRange(v21) object file lineNumber description];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__NSTextParagraph_textParagraphsForAttributedString_range___block_invoke;
  v14[3] = &unk_1E55C6BE8;
  v14[4] = a3;
  v14[5] = &v15;
  objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", location, length, 513, v14);
  NSUInteger v10 = (void *)v16[5];
  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }
  _Block_object_dispose(&v15, 8);
  return v11;
}

void __59__NSTextParagraph_textParagraphsForAttributedString_range___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = -[NSTextParagraph initWithAttributedString:]([NSTextParagraph alloc], "initWithAttributedString:", objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", a5, a6));
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  NSUInteger v10 = v7;
  if (!v8)
  {
    id v9 = (id)[MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = v10;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v9;
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  [v8 addObject:v7];
}

- (NSTextParagraph)initWithTextContentManager:(id)a3
{
  uint64_t v4 = [(NSTextParagraph *)self initWithAttributedString:0];
  uint64_t v5 = v4;
  if (v4) {
    [(NSTextElement *)v4 setTextContentManager:a3];
  }
  return v5;
}

- (NSTextParagraph)init
{
  return [(NSTextParagraph *)self initWithAttributedString:0];
}

- (id)_textElementLocationForCharacterIndex:(unint64_t)a3
{
  objc_sync_enter(self);
  id v5 = [(NSMapTable *)self->_textElementLocationTable objectForKey:a3 + 1];
  objc_sync_exit(self);
  return v5;
}

- (void)_setElementTextLocation:(id)a3 forCharacterIndex:(unint64_t)a4
{
  objc_sync_enter(self);
  textElementLocationTable = self->_textElementLocationTable;
  if (!textElementLocationTable)
  {
    textElementLocationTable = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:1282 valueOptions:512 capacity:0];
    self->_textElementLocationTable = textElementLocationTable;
  }
  [(NSMapTable *)textElementLocationTable setObject:a3 forKey:a4 + 1];

  objc_sync_exit(self);
}

- (void)synchronizeDocumentRange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (self->_range.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_range.NSUInteger location = [(NSTextRange *)[(NSTextElement *)self elementRange] range];
    self->_range.NSUInteger length = v3;
  }
  textElementLocationTable = self->_textElementLocationTable;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(NSMapTable *)textElementLocationTable objectEnumerator];
  uint64_t v6 = [(NSEnumerator *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) updateBaseLocation];
      }
      uint64_t v6 = [(NSEnumerator *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  objc_sync_exit(self);
}

- (NSTextParagraph)initWithTextAttachment:(id)a3 attributes:(id)a4
{
  uint64_t v7 = (void *)[a4 mutableCopy];
  if ([a3 embeddingType] == 1)
  {
    uint64_t v8 = [a3 standaloneAlignment];
    if (v8 != 3)
    {
      uint64_t v9 = v8;
      long long v10 = (void *)[a4 objectForKeyedSubscript:@"NSParagraphStyle"];
      if (v9 == 1) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = 2 * (v9 == 2);
      }
      if (v10)
      {
        long long v12 = v10;
        if ([v10 alignment] == v11) {
          goto LABEL_12;
        }
        uint64_t v13 = (NSMutableParagraphStyle *)[v12 mutableCopy];
      }
      else
      {
        if ([+[NSParagraphStyle defaultParagraphStyle] alignment] == v11)goto LABEL_12; {
        uint64_t v13 = objc_alloc_init(NSMutableParagraphStyle);
        }
      }
      uint64_t v14 = v13;
      [(NSMutableParagraphStyle *)v13 setAlignment:v11];
      [v7 setObject:v14 forKeyedSubscript:@"NSParagraphStyle"];
    }
  }
LABEL_12:
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithAttachment:a3 attributes:v7];
  uint64_t v16 = [(NSTextParagraph *)self initWithAttributedString:v15];
  if ([a3 embeddingType] == 1) {
    [(NSTextElement *)v16 setCoalescingType:0];
  }

  return v16;
}

- (BOOL)_containsTextAttachments
{
  objc_sync_enter(self);
  int containsTextAttachments = self->_containsTextAttachments;
  if (!self->_containsTextAttachments)
  {
    attributedString = self->_attributedString;
    if (!attributedString) {
      attributedString = [(NSTextParagraph *)self attributedString];
    }
    NSUInteger location = self->_range.location;
    if (location == 0x7FFFFFFFFFFFFFFFLL)
    {
      NSUInteger length = [(NSAttributedString *)attributedString length];
      NSUInteger location = 0;
    }
    else
    {
      NSUInteger length = self->_range.length;
    }
    NSUInteger v10 = location;
    uint64_t v11 = 0;
    NSUInteger v7 = length + location;
    if (location < length + location)
    {
      while (![(NSAttributedString *)attributedString attribute:@"NSAttachment", location, &v10, location, v7 - location atIndex longestEffectiveRange inRange])
      {
        NSUInteger location = v11 + v10;
        NSUInteger v10 = location;
        if (location >= v7) {
          goto LABEL_12;
        }
      }
      self->_int containsTextAttachments = 2;
    }
LABEL_12:
    int containsTextAttachments = self->_containsTextAttachments;
  }
  BOOL v8 = containsTextAttachments != 1;
  objc_sync_exit(self);
  return v8;
}

- (id)paragraphRange
{
  objc_sync_enter(self);
  paragraphContentRange = self->_paragraphContentRange;
  if (self->_paragraphSeparatorRange) {
    uint64_t v4 = -[NSTextRange textRangeByFormingUnionWithTextRange:](paragraphContentRange, "textRangeByFormingUnionWithTextRange:");
  }
  else {
    uint64_t v4 = paragraphContentRange;
  }
  id v5 = v4;
  objc_sync_exit(self);
  return v5;
}

@end
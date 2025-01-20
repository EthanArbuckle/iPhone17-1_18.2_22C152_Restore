@interface NSTypesetter
+ (BOOL)_usesATSTypesetter;
+ (NSTypesetter)sharedSystemTypesetter;
+ (NSTypesetterBehavior)defaultTypesetterBehavior;
+ (id)sharedSystemTypesetterForBehavior:(NSTypesetterBehavior)behavior;
+ (int64_t)defaultStringDrawingTypesetterBehavior;
+ (unint64_t)defaultLineBreakStrategy;
+ (void)initialize;
- ($0177D170777CFC227CB001A659B5CD18)_allocateAuxData;
- ($0177D170777CFC227CB001A659B5CD18)_getAuxData;
- ($500F09A0A86A1DC0979241A7D72823DF)_lineFragmentRectForProposedRectArgs;
- (BOOL)_allowsEllipsisGlyphSubstitution;
- (BOOL)_forceOriginalFontBaseline;
- (BOOL)_isLineBreakModeOverridden;
- (BOOL)bidiProcessingEnabled;
- (BOOL)finalizeLineFragmentRect:(CGRect *)a3 lineFragmentUsedRect:(CGRect *)a4 baselineOffset:(double *)a5 forGlyphRange:(_NSRange)a6;
- (BOOL)usesFontLeading;
- (CGFloat)baselineOffsetInLayoutManager:(NSLayoutManager *)layoutMgr glyphIndex:(NSUInteger)glyphIndex;
- (CGFloat)lineFragmentPadding;
- (CGFloat)lineSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(NSRect)rect;
- (CGFloat)paragraphSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(NSRect)rect;
- (CGFloat)paragraphSpacingBeforeGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(NSRect)rect;
- (NSArray)textContainers;
- (NSAttributedString)attributedString;
- (NSDictionary)attributesForExtraLineFragment;
- (NSFont)substituteFontForFont:(NSFont *)originalFont;
- (NSLayoutManager)layoutManager;
- (NSParagraphStyle)currentParagraphStyle;
- (NSRange)characterRangeForGlyphRange:(NSRange)glyphRange actualGlyphRange:(NSRangePointer)actualGlyphRange;
- (NSRange)glyphRangeForCharacterRange:(NSRange)charRange actualCharacterRange:(NSRangePointer)actualCharRange;
- (NSRange)layoutCharactersInRange:(NSRange)characterRange forLayoutManager:(NSLayoutManager *)layoutManager maximumNumberOfLineFragments:(NSUInteger)maxNumLines;
- (NSRange)paragraphCharacterRange;
- (NSRange)paragraphGlyphRange;
- (NSRange)paragraphSeparatorCharacterRange;
- (NSRange)paragraphSeparatorGlyphRange;
- (NSTextContainer)currentTextContainer;
- (NSTextTab)textTabForGlyphLocation:(CGFloat)glyphLocation writingDirection:(NSWritingDirection)direction maxLocation:(CGFloat)maxLocation;
- (NSTypesetterBehavior)typesetterBehavior;
- (NSTypesetterControlCharacterAction)actionForControlCharacterAtIndex:(NSUInteger)charIndex;
- (NSUInteger)getGlyphsInRange:(NSRange)glyphsRange glyphs:(NSGlyph *)glyphBuffer characterIndexes:(NSUInteger *)charIndexBuffer glyphInscriptions:(NSGlyphInscription *)inscribeBuffer elasticBits:(BOOL *)elasticBuffer bidiLevels:(unsigned __int8 *)bidiLevelBuffer;
- (NSUInteger)layoutParagraphAtPoint:(NSPointPointer)lineFragmentOrigin;
- (float)hyphenationFactor;
- (float)tightenThresholdForTruncation;
- (id)_ellipsisFontForFont:(id)a3;
- (id)defaultParagraphStyle;
- (int64_t)_baseWritingDirection;
- (int64_t)applicationFrameworkContext;
- (unint64_t)_getRemainingNominalParagraphRange:(_NSRange *)a3 andParagraphSeparatorRange:(_NSRange *)a4 charactarIndex:(unint64_t)a5 layoutManager:(id)a6 string:(id)a7;
- (unint64_t)getGlyphsInRange:(_NSRange)a3 glyphs:(unsigned __int16 *)a4 properties:(int64_t *)a5 characterIndexes:(unint64_t *)a6 bidiLevels:(char *)a7;
- (void)_layoutGlyphsInLayoutManager:(id)a3 startingAtGlyphIndex:(unint64_t)a4 maxNumberOfLineFragments:(unint64_t)a5 maxCharacterIndex:(unint64_t)a6 nextGlyphIndex:(unint64_t *)a7 nextCharacterIndex:(unint64_t *)a8;
- (void)_setForceOriginalFontBaseline:(BOOL)a3;
- (void)_setLineBreakModeOverridden:(BOOL)a3;
- (void)_updateParagraphStyleCache:(id)a3;
- (void)beginLineWithGlyphAtIndex:(NSUInteger)glyphIndex;
- (void)beginParagraph;
- (void)dealloc;
- (void)deleteGlyphsInRange:(NSRange)glyphRange;
- (void)endLineWithGlyphRange:(NSRange)lineGlyphRange;
- (void)endParagraph;
- (void)finalize;
- (void)getLineFragmentRect:(NSRectPointer)lineFragmentRect usedRect:(NSRectPointer)lineFragmentUsedRect forParagraphSeparatorGlyphRange:(NSRange)paragraphSeparatorGlyphRange atProposedOrigin:(NSPoint)lineOrigin;
- (void)getLineFragmentRect:(NSRectPointer)lineFragmentRect usedRect:(NSRectPointer)lineFragmentUsedRect remainingRect:(NSRectPointer)remainingRect forStartingGlyphAtIndex:(NSUInteger)startingGlyphIndex proposedRect:(NSRect)proposedRect lineSpacing:(CGFloat)lineSpacing paragraphSpacingBefore:(CGFloat)paragraphSpacingBefore paragraphSpacingAfter:(CGFloat)paragraphSpacingAfter;
- (void)insertGlyph:(NSGlyph)glyph atGlyphIndex:(NSUInteger)glyphIndex characterIndex:(NSUInteger)characterIndex;
- (void)layoutGlyphsInLayoutManager:(NSLayoutManager *)layoutManager startingAtGlyphIndex:(NSUInteger)startGlyphIndex maxNumberOfLineFragments:(NSUInteger)maxNumLines nextGlyphIndex:(NSUInteger *)nextGlyph;
- (void)setApplicationFrameworkContext:(int64_t)a3;
- (void)setAttachmentSize:(NSSize)attachmentSize forGlyphRange:(NSRange)glyphRange;
- (void)setAttributedString:(NSAttributedString *)attributedString;
- (void)setBidiLevels:(const uint8_t *)levels forGlyphRange:(NSRange)glyphRange;
- (void)setBidiProcessingEnabled:(BOOL)bidiProcessingEnabled;
- (void)setDefaultParagraphStyle:(id)a3;
- (void)setDrawsOutsideLineFragment:(BOOL)flag forGlyphRange:(NSRange)glyphRange;
- (void)setHardInvalidation:(BOOL)flag forGlyphRange:(NSRange)glyphRange;
- (void)setHyphenationFactor:(float)hyphenationFactor;
- (void)setLineFragmentPadding:(CGFloat)lineFragmentPadding;
- (void)setLineFragmentRect:(NSRect)fragmentRect forGlyphRange:(NSRange)glyphRange usedRect:(NSRect)usedRect baselineOffset:(CGFloat)baselineOffset;
- (void)setLocation:(NSPoint)location withAdvancements:(const CGFloat *)advancements forStartOfGlyphRange:(NSRange)glyphRange;
- (void)setNotShownAttribute:(BOOL)flag forGlyphRange:(NSRange)glyphRange;
- (void)setParagraphGlyphRange:(NSRange)paragraphRange separatorGlyphRange:(NSRange)paragraphSeparatorRange;
- (void)setTightenThresholdForTruncation:(float)a3;
- (void)setTypesetterBehavior:(NSTypesetterBehavior)typesetterBehavior;
- (void)setUsesFontLeading:(BOOL)usesFontLeading;
- (void)substituteGlyphsInRange:(NSRange)glyphRange withGlyphs:(NSGlyph *)glyphs;
@end

@implementation NSTypesetter

- (BOOL)usesFontLeading
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  return (*(unsigned char *)&reserved->var19 >> 4) & 1;
}

- (NSTypesetterBehavior)typesetterBehavior
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  return *(_DWORD *)&reserved->var19 & 0xFLL;
}

- (id)defaultParagraphStyle
{
  id result = self->_defaultParagraphStyle;
  if (!result) {
    return +[NSParagraphStyle defaultParagraphStyle];
  }
  return result;
}

- (int64_t)applicationFrameworkContext
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  return ((unint64_t)reserved->var19 >> 22) & 7;
}

- (void)setUsesFontLeading:(BOOL)usesFontLeading
{
  BOOL v3 = usesFontLeading;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  if (v3) {
    int v6 = 16;
  }
  else {
    int v6 = 0;
  }
  reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFFFFFEF | v6);
}

- (void)setTypesetterBehavior:(NSTypesetterBehavior)typesetterBehavior
{
  char v3 = typesetterBehavior;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFFFFFF0 | v3 & 0xF);
}

+ (int64_t)defaultStringDrawingTypesetterBehavior
{
  return __NSStringDrawingTypesetterCompatibilityLevel;
}

- (void)setAttributedString:(NSAttributedString *)attributedString
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  *(void *)reserved->var0 = attributedString;
}

- (void)setLineFragmentPadding:(CGFloat)lineFragmentPadding
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  *((CGFloat *)reserved->var0 + 5) = lineFragmentPadding;
}

- (void)setApplicationFrameworkContext:(int64_t)a3
{
  LOBYTE(v3) = a3;
  if (!a3) {
    uint64_t v3 = _NSTextScalingTypeForCurrentEnvironment();
  }
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFE3FFFFF | ((v3 & 7) << 22));
}

- ($0177D170777CFC227CB001A659B5CD18)_getAuxData
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved)
  {
    reserved = [(NSTypesetter *)self _allocateAuxData];
    self->_reserved = reserved;
    reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFFC7FC0 | [(id)objc_opt_class() defaultTypesetterBehavior] & 0xF | 0x28030);
    reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFE3FFFFF | ((_NSTextScalingTypeForCurrentEnvironment() & 7) << 22));
  }
  return reserved;
}

+ (NSTypesetterBehavior)defaultTypesetterBehavior
{
  return (unint64_t)__NSTypesetterCompatibilityLevel;
}

- ($0177D170777CFC227CB001A659B5CD18)_allocateAuxData
{
  id result = ($0177D170777CFC227CB001A659B5CD18 *)NSAllocateScannedUncollectable();
  *(_OWORD *)&result->var0 = 0u;
  *(_OWORD *)&result->var1.length = 0u;
  *(_OWORD *)&result->var2.length = 0u;
  *(_OWORD *)&result->var5 = 0u;
  *(_OWORD *)&result->var7 = 0u;
  *(_OWORD *)&result->var9 = 0u;
  *(_OWORD *)&result->var11 = 0u;
  result->var13.origin = 0u;
  result->var13.size = 0u;
  result->var14.origin = 0u;
  result->var14.size = 0u;
  result->var15 = 0u;
  *(_OWORD *)&result->var16 = 0u;
  *(_OWORD *)&result->var18 = 0u;
  *(_OWORD *)&result->var20[2] = 0u;
  *(_OWORD *)&result->var20[4] = 0u;
  *(_OWORD *)&result->var20[6] = 0u;
  *(_OWORD *)&result->var20[8] = 0u;
  *(_OWORD *)&result->var20[10] = 0u;
  result->var20[12] = 0;
  *(_OWORD *)result->var20 = 0u;
  result->var0 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)result->var20;
  return result;
}

- (void)dealloc
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }

  v4 = self->_reserved;
  if (v4) {
    NSZoneFree(0, v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)NSTypesetter;
  [(NSTypesetter *)&v5 dealloc];
}

- (void)setDefaultParagraphStyle:(id)a3
{
  if (self->_defaultParagraphStyle != a3 && (objc_msgSend(a3, "isEqual:") & 1) == 0)
  {

    self->_defaultParagraphStyle = (NSParagraphStyle *)a3;
  }
}

- (CGFloat)lineFragmentPadding
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  return *((double *)reserved->var0 + 5);
}

- (NSAttributedString)attributedString
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  return *(NSAttributedString **)reserved->var0;
}

- (BOOL)bidiProcessingEnabled
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  return (*(unsigned char *)&reserved->var19 >> 5) & 1;
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    uint64_t v3 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    v4 = @"NSTypesetterBehavior";
    if ([v3 objectForKey:@"NSTypesetterBehavior"]
      || (v4 = @"NSTypesetterCompatibilityLevel",
          [v3 objectForKey:@"NSTypesetterCompatibilityLevel"]))
    {
      unint64_t v5 = [v3 integerForKey:v4];
      int v6 = 6;
      if (v5 < 6) {
        int v6 = v5;
      }
      __NSTypesetterCompatibilityLevel = v6;
    }
    if ([v3 objectForKey:@"NSStringDrawingTypesetterBehavior"])
    {
      unint64_t v7 = [v3 integerForKey:@"NSStringDrawingTypesetterBehavior"];
      int v8 = 6;
      if (v7 < 6) {
        int v8 = v7;
      }
    }
    else
    {
      int v8 = __NSTypesetterCompatibilityLevel;
      if (__NSTypesetterCompatibilityLevel >= __NSStringDrawingTypesetterCompatibilityLevel)
      {
LABEL_13:
        __NSDefaultNotShownIMP = +[NSLayoutManager instanceMethodForSelector:sel_setNotShownAttribute_forGlyphAtIndex_];
        __NSDefaultDrawsOutsideIMP = +[NSLayoutManager instanceMethodForSelector:sel_setDrawsOutsideLineFragment_forGlyphAtIndex_];
        __NSLayoutManagerClass = objc_opt_class();
        return;
      }
    }
    __NSStringDrawingTypesetterCompatibilityLevel = v8;
    goto LABEL_13;
  }
}

- (void)setParagraphGlyphRange:(NSRange)paragraphRange separatorGlyphRange:(NSRange)paragraphSeparatorRange
{
  NSUInteger length = paragraphSeparatorRange.length;
  NSUInteger location = paragraphSeparatorRange.location;
  NSUInteger v6 = paragraphRange.length;
  NSUInteger v7 = paragraphRange.location;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (reserved)
  {
    var0 = reserved->var0;
  }
  else
  {
    v11 = [(NSTypesetter *)self _getAuxData];
    reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    var0 = v11->var0;
    if (!reserved) {
      reserved = [(NSTypesetter *)self _getAuxData];
    }
  }
  *((void *)var0 + 1) = v7;
  *((void *)var0 + 2) = v6;
  *((void *)var0 + 3) = location;
  *((void *)var0 + 4) = length;
  if (location + length == v7 + v6) {
    *((void *)var0 + 2) = location - v7;
  }
  *(_DWORD *)&reserved->var19 &= ~0x40000u;
  reserved->var1.NSUInteger location = [(NSTypesetter *)self characterRangeForGlyphRange:*((void *)var0 + 1) actualGlyphRange:*((void *)var0 + 2)];
  reserved->var1.NSUInteger length = v12;
  reserved->var2.NSUInteger location = -[NSTypesetter characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", *((void *)var0 + 3), *((void *)var0 + 4), (char *)var0 + 24);
  reserved->var2.NSUInteger length = v13;
}

- (void)beginParagraph
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  NSUInteger length = reserved->var1.length;
  [(NSTypesetter *)self _updateParagraphStyleCache:[(NSAttributedString *)[(NSTypesetter *)self attributedString] attribute:@"NSParagraphStyle", reserved->var1.location, 0, reserved->var1.location, length atIndex longestEffectiveRange inRange]];
  CGSize v5 = *(CGSize *)(MEMORY[0x1E4F28AD8] + 16);
  reserved->var13.origin = (CGPoint)*MEMORY[0x1E4F28AD8];
  reserved->var13.size = v5;
  NSUInteger v6 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!v6) {
    NSUInteger v6 = [(NSTypesetter *)self _getAuxData];
  }
  reserved->var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFFBFFFF | ((length == *((void *)v6->var0 + 2)) << 18));
}

- (void)_updateParagraphStyleCache:(id)a3
{
  id v3 = a3;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (reserved)
  {
    var0 = reserved->var0;
    if (a3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  NSUInteger v7 = [(NSTypesetter *)self _getAuxData];
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  var0 = v7->var0;
  if (reserved)
  {
    if (v3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  reserved = [(NSTypesetter *)self _getAuxData];
  if (!v3) {
LABEL_6:
  }
    id v3 = [(NSTypesetter *)self defaultParagraphStyle];
LABEL_7:
  if (([*((id *)var0 + 12) isEqual:v3] & 1) == 0)
  {
    id v3 = (id)objc_msgSend(v3, "copyWithZone:", -[NSTypesetter zone](self, "zone"));

    *((void *)var0 + 12) = v3;
    [v3 lineSpacing];
    reserved->var7 = v8;
    [v3 headIndent];
    reserved->var8 = v9;
    [v3 tailIndent];
    reserved->var9 = v10;
    [v3 minimumLineHeight];
    reserved->var10 = v11;
    [v3 maximumLineHeight];
    reserved->var11 = v12;
    [v3 lineHeightMultiple];
    reserved->var12 = v13;
    reserved->$4E0ED78154A14BB469A82D51316F92F1 var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFFF87FF | (([v3 lineBreakMode] & 0xF) << 11));
  }
  NSWritingDirection v14 = [v3 alignment];
  if (v14 == 4)
  {
    NSWritingDirection v14 = [v3 baseWritingDirection];
    if (v14 == NSWritingDirectionNatural) {
      NSWritingDirection v14 = +[NSParagraphStyle defaultWritingDirectionForLanguage:0];
    }
    LOBYTE(v14) = 2 * (v14 == NSWritingDirectionRightToLeft);
  }
  $4E0ED78154A14BB469A82D51316F92F1 var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFFFF87F | ((v14 & 0xF) << 7));
  reserved->$4E0ED78154A14BB469A82D51316F92F1 var19 = var19;
  if (v3)
  {
    unsigned int v16 = (([v3 baseWritingDirection] << 19) + 0x80000) & 0x180000;
    $4E0ED78154A14BB469A82D51316F92F1 var19 = reserved->var19;
  }
  else
  {
    unsigned int v16 = 0;
  }
  reserved->$4E0ED78154A14BB469A82D51316F92F1 var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&var19 & 0xFFE7FFFF | v16);
}

- (void)endParagraph
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  reserved->$4E0ED78154A14BB469A82D51316F92F1 var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFF87FFF | 0x28000);
}

- (NSRange)paragraphCharacterRange
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  NSUInteger length = reserved->var1.length;
  NSUInteger location = reserved->var1.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)_isLineBreakModeOverridden
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  return (*((unsigned __int8 *)&reserved->var19 + 2) >> 5) & 1;
}

- (NSRange)paragraphGlyphRange
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  var0 = reserved->var0;
  NSUInteger v5 = *((void *)reserved->var0 + 1);
  NSUInteger v6 = *((void *)var0 + 2);
  result.NSUInteger length = v6;
  result.NSUInteger location = v5;
  return result;
}

- (BOOL)_forceOriginalFontBaseline
{
  if ([(NSTypesetter *)self applicationFrameworkContext] != 2
    || (reserved = [(NSTypesetter *)self typesetterBehavior],
        reserved != ($0177D170777CFC227CB001A659B5CD18 *)1))
  {
    reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    if (!reserved) {
      reserved = [(NSTypesetter *)self _getAuxData];
    }
    LODWORD(reserved) = (*(unsigned char *)&reserved->var19 >> 6) & 1;
  }
  return (char)reserved;
}

- (NSRange)paragraphSeparatorGlyphRange
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  var0 = reserved->var0;
  NSUInteger v5 = *((void *)reserved->var0 + 3);
  NSUInteger v6 = *((void *)var0 + 4);
  result.NSUInteger length = v6;
  result.NSUInteger location = v5;
  return result;
}

- (void)_setForceOriginalFontBaseline:(BOOL)a3
{
  BOOL v3 = a3;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  if (v3) {
    int v6 = 64;
  }
  else {
    int v6 = 0;
  }
  reserved->$4E0ED78154A14BB469A82D51316F92F1 var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFFFFFBF | v6);
}

- (NSTextContainer)currentTextContainer
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  return (NSTextContainer *)*((void *)reserved->var0 + 8);
}

- (NSRange)paragraphSeparatorCharacterRange
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  NSUInteger length = reserved->var2.length;
  NSUInteger location = reserved->var2.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)finalizeLineFragmentRect:(CGRect *)a3 lineFragmentUsedRect:(CGRect *)a4 baselineOffset:(double *)a5 forGlyphRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v12 = [(NSLayoutManager *)[(NSTypesetter *)self layoutManager] delegate];
  if (objc_opt_respondsToSelector()) {
    return objc_msgSend(v12, "layoutManager:shouldSetLineFragmentRect:lineFragmentUsedRect:baselineOffset:inTextContainer:forGlyphRange:", -[NSTypesetter layoutManager](self, "layoutManager"), a3, a4, a5, -[NSTypesetter currentTextContainer](self, "currentTextContainer"), location, length);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  NSWritingDirection v14 = [(NSTypesetter *)self layoutManager];

  return objc_msgSend(v12, "layoutManager:shouldSetLineFragmentRect:lineFragmentUsedRect:baselineOffset:forGlyphRange:", v14, a3, a4, a5, location, length);
}

- (NSLayoutManager)layoutManager
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  return (NSLayoutManager *)*((void *)reserved->var0 + 6);
}

- (void)endLineWithGlyphRange:(NSRange)lineGlyphRange
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (reserved)
  {
    ++reserved->var18;
    NSUInteger length = reserved->var1.length;
    NSUInteger v5 = reserved;
  }
  else
  {
    reserved = [(NSTypesetter *)self _getAuxData];
    NSUInteger v5 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    ++reserved->var18;
    NSUInteger length = reserved->var1.length;
    if (!v5) {
      NSUInteger v5 = [(NSTypesetter *)self _getAuxData];
    }
  }
  reserved->$4E0ED78154A14BB469A82D51316F92F1 var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFFBFFFF | ((length == *((void *)v5->var0 + 2)) << 18));
}

- (void)beginLineWithGlyphAtIndex:(NSUInteger)glyphIndex
{
  if (![(NSTypesetter *)self _isLineBreakModeOverridden])
  {
    reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    if (reserved)
    {
      var0 = reserved->var0;
    }
    else
    {
      int v6 = [(NSTypesetter *)self _getAuxData];
      reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
      var0 = v6->var0;
      if (!reserved) {
        reserved = [(NSTypesetter *)self _getAuxData];
      }
    }
    unint64_t v7 = [*((id *)var0 + 8) maximumNumberOfLines];
    if (v7)
    {
      if (reserved->var18 >= v7) {
        *((void *)var0 + 8) = 0;
      }
    }
  }
}

+ (BOOL)_usesATSTypesetter
{
  return __NSTypesetterCompatibilityLevel > 0;
}

+ (id)sharedSystemTypesetterForBehavior:(NSTypesetterBehavior)behavior
{
  return +[NSATSTypesetter sharedTypesetter];
}

+ (NSTypesetter)sharedSystemTypesetter
{
  return (NSTypesetter *)[a1 sharedSystemTypesetterForBehavior:__NSTypesetterCompatibilityLevel];
}

- (void)finalize
{
  reserved = self->_reserved;
  if (reserved) {
    NSZoneFree(0, reserved);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSTypesetter;
  [(NSTypesetter *)&v4 finalize];
}

- (void)_setLineBreakModeOverridden:(BOOL)a3
{
  BOOL v3 = a3;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  if (v3) {
    int v6 = 0x200000;
  }
  else {
    int v6 = 0;
  }
  reserved->$4E0ED78154A14BB469A82D51316F92F1 var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFDFFFFF | v6);
}

- (unint64_t)_getRemainingNominalParagraphRange:(_NSRange *)a3 andParagraphSeparatorRange:(_NSRange *)a4 charactarIndex:(unint64_t)a5 layoutManager:(id)a6 string:(id)a7
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  unint64_t v14 = [a7 length];
  uint64_t v72 = 0;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  *(_OWORD *)theString = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  *(_OWORD *)buffer = 0u;
  BOOL v15 = [(NSTypesetter *)self bidiProcessingEnabled];
  unsigned int v16 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!v16) {
    unsigned int v16 = [(NSTypesetter *)self _getAuxData];
  }
  double v17 = *((double *)v16->var0 + 11);
  if (_getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__bmpOnce != -1) {
    dispatch_once(&_getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__bmpOnce, &__block_literal_global_33);
  }
  *(_DWORD *)&reserved->var19 &= 0xFFFD7FFF;
  theString[0] = (CFStringRef)a7;
  *((void *)&v70 + 1) = 0;
  *(void *)&long long v71 = v14;
  CFStringRef CharactersPtr = (const __CFString *)CFStringGetCharactersPtr((CFStringRef)a7);
  CStringPtr = 0;
  theString[1] = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a7, 0x600u);
  }
  *((void *)&v71 + 1) = 0;
  uint64_t v72 = 0;
  *(void *)&long long v70 = CStringPtr;
  if (v14 <= a5) {
    return 1;
  }
  id v58 = a6;
  v59 = a3;
  v60 = a4;
  p_cache = UICTFont.cache;
  unint64_t v21 = a5;
  while (1)
  {
    if ((v21 & 0x8000000000000000) != 0 || (uint64_t v22 = v71, (uint64_t)v71 <= (uint64_t)v21))
    {
      UniChar v25 = 0;
    }
    else
    {
      v23 = (UniChar *)theString[1];
      if (theString[1])
      {
        unint64_t v24 = *((void *)&v70 + 1) + v21;
LABEL_15:
        UniChar v25 = v23[v24];
        goto LABEL_17;
      }
      if (!(void)v70)
      {
        if (v72 <= (uint64_t)v21 || (uint64_t v34 = *((void *)&v71 + 1), *((uint64_t *)&v71 + 1) > (uint64_t)v21))
        {
          unint64_t v35 = v21 - 4;
          if (v21 < 4) {
            unint64_t v35 = 0;
          }
          if ((uint64_t)(v35 + 64) < (uint64_t)v71) {
            uint64_t v22 = v35 + 64;
          }
          *((void *)&v71 + 1) = v35;
          uint64_t v72 = v22;
          v73.NSUInteger location = *((void *)&v70 + 1) + v35;
          v73.NSUInteger length = v22 - v35;
          CFStringGetCharacters(theString[0], v73, buffer);
          p_cache = (void **)(UICTFont + 16);
          uint64_t v34 = *((void *)&v71 + 1);
        }
        unint64_t v24 = v21 - v34;
        v23 = buffer;
        goto LABEL_15;
      }
      UniChar v25 = *(char *)(v70 + *((void *)&v70 + 1) + v21);
    }
LABEL_17:
    unsigned int v26 = v25;
    if (!v15)
    {
      BOOL v15 = 0;
      goto LABEL_50;
    }
    uint64_t BitmapPtrForPlane = (uint64_t)p_cache[190];
    uint64_t v28 = _getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__bidiPropertyBMP;
    if (v25 >> 10 != 54) {
      goto LABEL_41;
    }
    uint64_t v29 = v21 + 1;
    if ((uint64_t)(v21 + 1) >= 0)
    {
      uint64_t v30 = v71;
      if ((uint64_t)v71 > v29) {
        break;
      }
    }
LABEL_48:
    BOOL v15 = 1;
LABEL_71:
    unint64_t v21 = v29;
    if (v29 >= v14) {
      return 1;
    }
  }
  v31 = (UniChar *)theString[1];
  if (theString[1])
  {
    uint64_t v32 = *((void *)&v70 + 1) + v29;
    goto LABEL_23;
  }
  if ((void)v70)
  {
    UniChar v33 = *(char *)(v70 + *((void *)&v70 + 1) + v29);
  }
  else
  {
    if (v72 <= v29 || (uint64_t v42 = *((void *)&v71 + 1), *((uint64_t *)&v71 + 1) > v29))
    {
      unint64_t v43 = v21 - 3;
      if (v21 < 3) {
        unint64_t v43 = 0;
      }
      if ((uint64_t)(v43 + 64) < (uint64_t)v71) {
        uint64_t v30 = v43 + 64;
      }
      *((void *)&v71 + 1) = v43;
      uint64_t v72 = v30;
      v74.NSUInteger location = *((void *)&v70 + 1) + v43;
      v74.NSUInteger length = v30 - v43;
      CFStringGetCharacters(theString[0], v74, buffer);
      p_cache = (void **)(UICTFont + 16);
      uint64_t v42 = *((void *)&v71 + 1);
    }
    uint64_t v32 = v29 - v42;
    v31 = buffer;
LABEL_23:
    UniChar v33 = v31[v32];
  }
  if (v33 >> 10 != 55) {
    goto LABEL_48;
  }
  unsigned int v26 = (v26 << 10) + v33 - 56613888;
  if ((v26 & 0x1F0000) != 0)
  {
    uint64_t BitmapPtrForPlane = CFUniCharGetBitmapPtrForPlane();
    uint64_t UnicodePropertyDataForPlane = CFUniCharGetUnicodePropertyDataForPlane();
    p_cache = (void **)(UICTFont + 16);
    uint64_t v28 = UnicodePropertyDataForPlane;
  }
  ++v21;
LABEL_41:
  if (BitmapPtrForPlane
    && ((*(unsigned __int8 *)(BitmapPtrForPlane + ((unsigned __int16)v26 >> 3)) >> (v26 & 7)) & 1) != 0)
  {
    goto LABEL_47;
  }
  if (!v28) {
    goto LABEL_49;
  }
  unsigned int v37 = *(unsigned __int8 *)(v28 + BYTE1(v26));
  if (v37 >= 0x13) {
    unsigned int v37 = *(unsigned __int8 *)(v28 + (v37 << 8) - 4864 + v26 + 256);
  }
  if (v37 == 3)
  {
LABEL_47:
    BOOL v15 = 0;
    *(_DWORD *)&reserved->var19 |= 0x8000u;
  }
  else
  {
LABEL_49:
    BOOL v15 = 1;
  }
LABEL_50:
  $4E0ED78154A14BB469A82D51316F92F1 var19 = reserved->var19;
  if ((*(_DWORD *)&var19 & 0x20000) != 0 || v26 < 0x590)
  {
LABEL_58:
    if (!HIWORD(v26))
    {
      if ((v26 - 1424) >> 4 <= 0x10E) {
        reserved->$4E0ED78154A14BB469A82D51316F92F1 var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&var19 | 0x10000);
      }
      goto LABEL_61;
    }
LABEL_70:
    uint64_t v29 = v21 + 1;
    goto LABEL_71;
  }
  if (v26 - 11264 < 0xFFFFF400
    || _getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__controlBMP
    && ((*(unsigned __int8 *)(_getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__controlBMP
                            + ((unint64_t)v26 >> 3)) >> (v26 & 7)) & 1) != 0
    || _getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__nonBaseBMP
    && ((*(unsigned __int8 *)(_getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__nonBaseBMP
                            + ((unint64_t)v26 >> 3)) >> (v26 & 7)) & 1) != 0)
  {
    $4E0ED78154A14BB469A82D51316F92F1 var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&var19 | 0x20000);
    reserved->$4E0ED78154A14BB469A82D51316F92F1 var19 = var19;
    goto LABEL_58;
  }
LABEL_61:
  LOBYTE(v39) = _getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__controlBMP;
  if (_getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__controlBMP) {
    int v39 = (*(unsigned __int8 *)(_getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__controlBMP
  }
                              + ((unint64_t)v26 >> 3)) >> (v26 & 7)) & 1;
  if (v26 == 9) {
    LOBYTE(v39) = 0;
  }
  if ((v39 & 1) == 0 && (v26 & 0xFFFFFFFE) != 0x2028) {
    goto LABEL_70;
  }
  NSTypesetterControlCharacterAction v40 = -[NSTypesetter actionForControlCharacterAtIndex:](self, "actionForControlCharacterAtIndex:", v21, v58);
  p_cache = (void **)(UICTFont + 16);
  unint64_t v41 = v40;
  if ((v40 & 8) == 0 && (v17 >= 10000000.0 || (v40 & 0x20) == 0)) {
    goto LABEL_70;
  }
  unint64_t v45 = v21 - a5;
  if (v21 == a5)
  {
    uint64_t v46 = objc_msgSend(v58, "glyphIndexForCharacterAtIndex:", a5, v45);
    NSUInteger v47 = 0;
  }
  else
  {
    uint64_t v46 = objc_msgSend(v58, "glyphRangeForCharacterRange:actualCharacterRange:", a5, v45, 0);
  }
  v59->NSUInteger location = v46;
  v59->NSUInteger length = v47;
  NSUInteger v48 = v47 + v46;
  if (v26 != 13) {
    goto LABEL_93;
  }
  uint64_t v49 = v21 + 1;
  uint64_t v50 = 1;
  if (v21 + 1 >= v14 || v49 < 0) {
    goto LABEL_94;
  }
  uint64_t v51 = v71;
  if ((uint64_t)v71 <= v49)
  {
LABEL_93:
    uint64_t v50 = 1;
    goto LABEL_94;
  }
  v52 = (UniChar *)theString[1];
  if (theString[1])
  {
    uint64_t v53 = *((void *)&v70 + 1) + v49;
    goto LABEL_92;
  }
  if ((void)v70)
  {
    UniChar v54 = *(char *)(v70 + *((void *)&v70 + 1) + v49);
  }
  else
  {
    if (v72 <= v49 || (uint64_t v56 = *((void *)&v71 + 1), *((uint64_t *)&v71 + 1) > v49))
    {
      unint64_t v57 = v21 - 3;
      if (v21 < 3) {
        unint64_t v57 = 0;
      }
      if ((uint64_t)(v57 + 64) < (uint64_t)v71) {
        uint64_t v51 = v57 + 64;
      }
      *((void *)&v71 + 1) = v57;
      uint64_t v72 = v51;
      v75.NSUInteger location = *((void *)&v70 + 1) + v57;
      v75.NSUInteger length = v51 - v57;
      CFStringGetCharacters(theString[0], v75, buffer);
      uint64_t v56 = *((void *)&v71 + 1);
    }
    uint64_t v53 = v49 - v56;
    v52 = buffer;
LABEL_92:
    UniChar v54 = v52[v53];
  }
  BOOL v55 = v54 == 10;
  uint64_t v50 = 1;
  if (v55) {
    uint64_t v50 = 2;
  }
LABEL_94:
  v60->NSUInteger location = v48;
  v60->NSUInteger length = v50;
  return v41;
}

uint64_t __114__NSTypesetter__getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string___block_invoke()
{
  _getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__strongRightBMP = CFUniCharGetBitmapPtrForPlane();
  _getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__bidiPropertyBMP = CFUniCharGetUnicodePropertyDataForPlane();
  _getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__controlBMP = CFUniCharGetBitmapPtrForPlane();
  uint64_t result = CFUniCharGetBitmapPtrForPlane();
  _getRemainingNominalParagraphRange_andParagraphSeparatorRange_charactarIndex_layoutManager_string__nonBaseBMP = result;
  return result;
}

- ($500F09A0A86A1DC0979241A7D72823DF)_lineFragmentRectForProposedRectArgs
{
  return 0;
}

+ (unint64_t)defaultLineBreakStrategy
{
  return 0xFFFFLL;
}

- (BOOL)_allowsEllipsisGlyphSubstitution
{
  return [(NSTypesetter *)self layoutManager] != 0;
}

- (id)_ellipsisFontForFont:(id)a3
{
  CTFontGetWeight();
  [a3 pointSize];

  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
}

- (int64_t)_baseWritingDirection
{
  return 0;
}

- (float)hyphenationFactor
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  return reserved->var3;
}

- (void)setHyphenationFactor:(float)hyphenationFactor
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  reserved->var3 = hyphenationFactor;
}

- (NSFont)substituteFontForFont:(NSFont *)originalFont
{
  objc_super v4 = [(NSTypesetter *)self layoutManager];
  if (!v4) {
    return originalFont;
  }

  return [(NSLayoutManager *)v4 substituteFontForFont:originalFont];
}

- (NSTextTab)textTabForGlyphLocation:(CGFloat)glyphLocation writingDirection:(NSWritingDirection)direction maxLocation:(CGFloat)maxLocation
{
  BOOL v8 = direction != NSWritingDirectionRightToLeft;
  double v9 = [(NSTypesetter *)self currentParagraphStyle];
  double v10 = [(NSParagraphStyle *)v9 tabStops];
  uint64_t v11 = [(NSArray *)v10 count];
  if (v11 < 1)
  {
LABEL_14:
    [(NSParagraphStyle *)v9 defaultTabInterval];
    if (v21 > 0.0)
    {
      uint64_t v22 = (uint64_t)(glyphLocation / v21);
      double v23 = v21 * (double)(v22 + 1);
      double v24 = v21 * (double)(v22 + 2);
      double v25 = v23 <= glyphLocation ? v24 : v23;
      if (v25 < maxLocation)
      {
        v27 = [NSTextTab alloc];
        uint64_t v28 = [(NSTextTab *)v27 initWithTextAlignment:2 * (direction == NSWritingDirectionRightToLeft) location:MEMORY[0x1E4F1CC08] options:v25];
        return v28;
      }
    }
  }
  else
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = 2 * v8;
    while (1)
    {
      BOOL v15 = [(NSArray *)v10 objectAtIndex:v13];
      [(NSTextTab *)v15 location];
      double v17 = v16;
      uint64_t v18 = [(NSTextTab *)v15 alignment];
      if (v17 > maxLocation) {
        break;
      }
      uint64_t v19 = (unint64_t)(v18 - 3) >= 2 ? v18 : 2 * (direction == NSWritingDirectionRightToLeft);
      if (v17 == maxLocation && v19 != v14) {
        break;
      }
      if (v17 > glyphLocation) {
        return v15;
      }
      if (v12 == ++v13) {
        goto LABEL_14;
      }
    }
  }
  return 0;
}

- (void)setBidiProcessingEnabled:(BOOL)bidiProcessingEnabled
{
  BOOL v3 = bidiProcessingEnabled;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  if (v3) {
    int v6 = 32;
  }
  else {
    int v6 = 0;
  }
  reserved->$4E0ED78154A14BB469A82D51316F92F1 var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&reserved->var19 & 0xFFFFFFDF | v6);
}

- (float)tightenThresholdForTruncation
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  return reserved->var4;
}

- (void)setTightenThresholdForTruncation:(float)a3
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  reserved->var4 = a3;
}

- (CGFloat)lineSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(NSRect)rect
{
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  var0 = reserved->var0;
  id v12 = [(NSLayoutManager *)[(NSTypesetter *)self layoutManager] delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v13 = [(NSTypesetter *)self layoutManager];
    objc_msgSend(v12, "layoutManager:lineSpacingAfterGlyphAtIndex:withProposedLineFragmentRect:", v13, glyphIndex, x, y, width, height);
  }
  else if (*((void *)var0 + 4) || (CGFloat result = 0.0, *((void *)var0 + 3) > glyphIndex + 1))
  {
    BOOL v15 = [(NSTypesetter *)self currentParagraphStyle];
    CGFloat result = 0.0;
    if (v15)
    {
      [(NSParagraphStyle *)v15 lineSpacing];
      if (result < 0.0) {
        return 0.0;
      }
    }
  }
  return result;
}

- (CGFloat)paragraphSpacingBeforeGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(NSRect)rect
{
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  id v10 = [(NSLayoutManager *)[(NSTypesetter *)self layoutManager] delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [(NSTypesetter *)self layoutManager];
    objc_msgSend(v10, "layoutManager:paragraphSpacingBeforeGlyphAtIndex:withProposedLineFragmentRect:", v11, glyphIndex, x, y, width, height);
  }
  else
  {
    uint64_t v13 = [(NSTypesetter *)self currentParagraphStyle];
    if (v13 && y > 0.0)
    {
      [(NSParagraphStyle *)v13 paragraphSpacingBefore];
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

- (CGFloat)paragraphSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(NSRect)rect
{
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  id v10 = [(NSLayoutManager *)[(NSTypesetter *)self layoutManager] delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [(NSTypesetter *)self layoutManager];
    objc_msgSend(v10, "layoutManager:paragraphSpacingAfterGlyphAtIndex:withProposedLineFragmentRect:", v11, glyphIndex, x, y, width, height);
  }
  else
  {
    uint64_t v13 = [(NSTypesetter *)self currentParagraphStyle];
    if (v13)
    {
      [(NSParagraphStyle *)v13 paragraphSpacing];
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

- (NSArray)textContainers
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  return (NSArray *)*((void *)reserved->var0 + 7);
}

- (NSParagraphStyle)currentParagraphStyle
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  return (NSParagraphStyle *)*((void *)reserved->var0 + 12);
}

- (void)setHardInvalidation:(BOOL)flag forGlyphRange:(NSRange)glyphRange
{
  NSUInteger length = glyphRange.length;
  NSUInteger location = glyphRange.location;
  int v6 = [(NSTypesetter *)self layoutManager];
  if (v6)
  {
    -[NSLayoutManager invalidateGlyphsOnLayoutInvalidationForGlyphRange:](v6, "invalidateGlyphsOnLayoutInvalidationForGlyphRange:", location, length);
  }
}

- (void)getLineFragmentRect:(NSRectPointer)lineFragmentRect usedRect:(NSRectPointer)lineFragmentUsedRect forParagraphSeparatorGlyphRange:(NSRange)paragraphSeparatorGlyphRange atProposedOrigin:(NSPoint)lineOrigin
{
  double y = lineOrigin.y;
  double x = lineOrigin.x;
  NSUInteger length = paragraphSeparatorGlyphRange.length;
  NSUInteger location = paragraphSeparatorGlyphRange.location;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (reserved)
  {
    var0 = reserved->var0;
  }
  else
  {
    uint64_t v14 = [(NSTypesetter *)self _getAuxData];
    reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    var0 = v14->var0;
    if (!reserved) {
      reserved = [(NSTypesetter *)self _getAuxData];
    }
  }
  NSRectPointer v88 = lineFragmentUsedRect;
  BOOL v15 = [(NSTypesetter *)self attributedString];
  double v16 = [(NSAttributedString *)v15 string];
  int64_t v87 = [(NSTextContainer *)[(NSTypesetter *)self currentTextContainer] layoutOrientation];
  memset(v93, 0, sizeof(v93));
  NSTypesetterBehavior v92 = [(NSTypesetter *)self typesetterBehavior];
  BOOL v89 = [(NSTypesetter *)self usesFontLeading];
  BOOL v17 = [(NSTypesetter *)self _forceOriginalFontBaseline];
  if (location != *((void *)var0 + 3) || length != *((void *)var0 + 4)) {
    -[NSTypesetter setParagraphGlyphRange:separatorGlyphRange:](self, "setParagraphGlyphRange:separatorGlyphRange:", location, 0, location, length);
  }
  unint64_t v19 = reserved->var1.location;
  if ((uint64_t)v19 < 1) {
    goto LABEL_21;
  }
  if (v19 == 1)
  {
    unint64_t v20 = 0;
  }
  else
  {
    int v21 = [(NSString *)v16 characterAtIndex:v19 - 1];
    unint64_t v20 = v19 - 1;
    if (v21 == 10)
    {
      if ([(NSString *)v16 characterAtIndex:v19 - 2] == 13) {
        unint64_t v20 = v19 - 2;
      }
      else {
        unint64_t v20 = v19 - 1;
      }
    }
  }
  char v22 = [(NSTypesetter *)self actionForControlCharacterAtIndex:v20];
  if ((v22 & 0x10) != 0 || v92 <= NSTypesetterBehavior_10_3 && (v22 & 0x20) != 0)
  {
LABEL_21:
    BOOL v23 = 1;
  }
  else
  {
    unint64_t v43 = [(NSTypesetter *)self attributedString];
    uint64_t v94 = 0;
    uint64_t v95 = 0;
    id v44 = [(NSAttributedString *)v43 attribute:@"NSAttachment" atIndex:v19 - 1 effectiveRange:&v94];
    if (v95 + v94 > v19 || !v44)
    {
      if ([(NSString *)v16 length] <= v19)
      {
        id v44 = 0;
      }
      else
      {
        id v44 = [(NSAttributedString *)v43 attribute:@"NSAttachment" atIndex:v19 effectiveRange:&v94];
        if (v95 + v94 > v19) {
          id v44 = 0;
        }
      }
    }
    BOOL v23 = [v44 embeddingType] == 1;
  }
  BOOL v91 = v23;
  if (length)
  {
    if (![(NSAttributedString *)v15 length])
    {
      double v25 = 0;
      goto LABEL_28;
    }
    double v24 = [(NSAttributedString *)v15 attributesAtIndex:v19 effectiveRange:0];
  }
  else
  {
    double v24 = [(NSTypesetter *)self attributesForExtraLineFragment];
  }
  double v25 = v24;
LABEL_28:
  [(NSTypesetter *)self _updateParagraphStyleCache:[(NSDictionary *)v25 objectForKey:@"NSParagraphStyle"]];
  id v26 = [(NSDictionary *)v25 objectForKey:@"CTVerticalForms"];
  if (!v25) {
    goto LABEL_35;
  }
  if (!v17 || (id v27 = [(NSDictionary *)v25 objectForKey:_NSOriginalFontAttributeName]) == 0) {
    id v27 = [(NSDictionary *)v25 objectForKey:@"NSFont"];
  }
  if (objc_msgSend(-[NSDictionary objectForKey:](v25, "objectForKey:", @"CTVerticalForms"), "BOOLValue"))id v27 = (id)objc_msgSend(v27, "verticalFont"); {
  if (!v27)
  }
LABEL_35:
    id v27 = (id)NSDefaultFont();
  if (([v26 BOOLValue] & 1) != 0 || (uint64_t v28 = (uint64_t)v27, !v26) && (uint64_t v28 = (uint64_t)v27, v87)) {
    uint64_t v28 = [v27 verticalFont];
  }
  if (v28) {
    uint64_t v29 = (void *)v28;
  }
  else {
    uint64_t v29 = v27;
  }
  uint64_t v30 = [(NSTypesetter *)self substituteFontForFont:v29];
  [(UIFont *)v30 _defaultLineHeightForUILayout];
  double v31 = 0.0;
  double var10 = v32 + 0.0;
  uint64_t v34 = v92;
  if (v92 >= NSTypesetterBehavior_10_3)
  {
    double var12 = reserved->var12;
    BOOL v38 = var12 <= 0.0;
    double v36 = var10 * var12;
    if (!v38) {
      double var10 = v36;
    }
  }
  double var11 = reserved->var11;
  if (var10 < reserved->var10) {
    double var10 = reserved->var10;
  }
  BOOL v38 = var11 >= var10 || var11 <= 0.0;
  if (v38) {
    double v39 = var10;
  }
  else {
    double v39 = reserved->var11;
  }
  if (v89)
  {
    [(UIFont *)v30 _leading];
    double v31 = v40;
  }
  if (v92 >= NSTypesetterBehavior_10_2)
  {
    double var7 = reserved->var7;
    if (var7 < 0.0)
    {
      double v42 = v31 + var7;
      if (v31 + var7 >= 0.0)
      {
        double v31 = v31 + var7;
      }
      else
      {
        double v31 = 0.0;
        if (v19)
        {
          if ([(NSString *)[(NSAttributedString *)v15 string] characterAtIndex:(void)((__PAIR128__(v19, length) - 1) >> 64)] != 12)
          {
            double v39 = v39 + v42;
            if (v39 <= 0.0) {
              double v39 = 0.0001;
            }
          }
          uint64_t v34 = v92;
        }
      }
    }
  }
  char v45 = [(NSTypesetter *)self applicationFrameworkContext] == 2 || v89;
  if ((v45 & 1) == 0 && length)
  {
    if (CTFontIsSystemUIFont())
    {
      [(UIFont *)v30 _leading];
      double v31 = v46;
    }
    goto LABEL_79;
  }
  if (length)
  {
LABEL_79:
    -[NSTypesetter lineSpacingAfterGlyphAtIndex:withProposedLineFragmentRect:](self, "lineSpacingAfterGlyphAtIndex:withProposedLineFragmentRect:", length + location - 1, x, y, 10000000.0, v39);
    goto LABEL_80;
  }
  double v47 = 0.0;
LABEL_80:
  NSRectPointer v48 = lineFragmentRect;
  if (v31 < v47) {
    double v31 = v47;
  }
  char v49 = !v91;
  double v50 = 0.0;
  if (v34 < 3) {
    char v49 = 1;
  }
  double v51 = 0.0;
  if ((v49 & 1) == 0)
  {
    -[NSTypesetter paragraphSpacingBeforeGlyphAtIndex:withProposedLineFragmentRect:](self, "paragraphSpacingBeforeGlyphAtIndex:withProposedLineFragmentRect:", location, x, y, 10000000.0, v39);
    double v51 = v52;
  }
  if (length && (unint64_t v53 = v19 + length, [(NSString *)v16 length] >= v19 + length))
  {
    p_double x = &v88->origin.x;
    if ((uint64_t)v53 < 1) {
      goto LABEL_112;
    }
    if (v53 == 1)
    {
      unint64_t v55 = 0;
    }
    else
    {
      int v56 = [(NSString *)v16 characterAtIndex:v53 - 1];
      unint64_t v55 = v53 - 1;
      if (v56 == 10)
      {
        if ([(NSString *)v16 characterAtIndex:v53 - 2] == 13) {
          unint64_t v55 = v53 - 2;
        }
        else {
          unint64_t v55 = v53 - 1;
        }
        uint64_t v34 = v92;
      }
    }
    char v57 = [(NSTypesetter *)self actionForControlCharacterAtIndex:v55];
    if ((v57 & 0x10) != 0 || v34 <= 3 && (v57 & 0x20) != 0) {
      goto LABEL_112;
    }
    id v58 = [(NSTypesetter *)self attributedString];
    uint64_t v94 = 0;
    uint64_t v95 = 0;
    id v59 = [(NSAttributedString *)v58 attribute:@"NSAttachment" atIndex:v53 - 1 effectiveRange:&v94];
    if (v95 + v94 > v53 || !v59)
    {
      if ([(NSString *)v16 length] <= v53)
      {
        id v59 = 0;
      }
      else
      {
        id v59 = [(NSAttributedString *)v58 attribute:@"NSAttachment" atIndex:v53 effectiveRange:&v94];
        if (v95 + v94 > v53) {
          id v59 = 0;
        }
      }
    }
    NSRectPointer v48 = lineFragmentRect;
    if ([v59 embeddingType] == 1)
    {
LABEL_112:
      -[NSTypesetter paragraphSpacingAfterGlyphAtIndex:withProposedLineFragmentRect:](self, "paragraphSpacingAfterGlyphAtIndex:withProposedLineFragmentRect:", length + location - 1, x, y, 10000000.0, v39);
      double v50 = v60;
    }
  }
  else
  {
    p_double x = &v88->origin.x;
  }
  -[NSTypesetter getLineFragmentRect:usedRect:remainingRect:forStartingGlyphAtIndex:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter:](self, "getLineFragmentRect:usedRect:remainingRect:forStartingGlyphAtIndex:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter:", v48, p_x, v93, location, x, y, 10000000.0, v39, v31, v51, v50);
  if (v48->size.width <= 0.0 || v48->size.height <= 0.0)
  {
    CGSize v68 = *(CGSize *)(MEMORY[0x1E4F28AD8] + 16);
    v48->origin = (CGPoint)*MEMORY[0x1E4F28AD8];
    v48->size = v68;
    return;
  }
  v61 = [(NSTypesetter *)self currentParagraphStyle];
  [(NSTypesetter *)self lineFragmentPadding];
  double v63 = v62;
  unint64_t var19 = reserved->var19;
  unsigned int v65 = (var19 >> 19) & 3;
  if (v91)
  {
    [(NSParagraphStyle *)v61 firstLineHeadIndent];
    double var8 = v66;
  }
  else
  {
    double var8 = reserved->var8;
  }
  if (v65) {
    NSWritingDirection v69 = (unint64_t)(v65 - 1);
  }
  else {
    NSWritingDirection v69 = +[NSParagraphStyle defaultWritingDirectionForLanguage:0];
  }
  if (v48->size.width >= 10000000.0) {
    uint64_t v70 = 0;
  }
  else {
    uint64_t v70 = (var19 >> 7) & 0xF;
  }
  uint64_t v71 = 2 * (v69 == NSWritingDirectionRightToLeft);
  if (v70 != 3) {
    uint64_t v71 = v70;
  }
  p_x[2] = v63 + v63;
  double v72 = 0.0;
  if (var8 >= 0.0) {
    double v72 = var8;
  }
  if (v71 == 1)
  {
    if (v92 > NSTypesetterBehavior_10_2_WithCompatibility)
    {
      if (v69 == NSWritingDirectionRightToLeft)
      {
        double v79 = v48->size.width + v63 * -2.0;
        double v80 = v79 - v72;
        double var9 = reserved->var9;
        if (var9 <= 0.0) {
          double v79 = 0.0;
        }
        double v82 = v80 - (var9 - v79);
      }
      else
      {
        double v84 = reserved->var9;
        if (v84 <= 0.0)
        {
          double v85 = v63 + v84;
          double v86 = v84 - v63;
          if (v85 > 0.0) {
            double v86 = -v63;
          }
          double v84 = v86 + v48->size.width - v63;
        }
        double v82 = v72 + v84;
      }
      double v73 = v82 * 0.5;
    }
    else
    {
      if (length) {
        double v74 = reserved->var8;
      }
      else {
        double v74 = 0.0;
      }
      double v73 = (v48->size.width - (v63 + v63)) * 0.5 + v74;
    }
    goto LABEL_162;
  }
  if (v71 == 2)
  {
    if (v69 == NSWritingDirectionRightToLeft)
    {
      double v73 = v48->size.width - (v72 + v63 * 2.0);
LABEL_162:
      double v76 = *p_x + v73;
      goto LABEL_163;
    }
    double v72 = reserved->var9;
    if (v72 <= 0.0)
    {
      double v77 = v63 + v72;
      double v78 = v72 - v63;
      if (v77 > 0.0) {
        double v78 = -v63;
      }
      double v72 = v78 + v48->size.width - v63;
    }
  }
  else
  {
    if (v69 == NSWritingDirectionRightToLeft)
    {
      double v75 = reserved->var9;
      if (v75 > 0.0) {
        double v75 = v75 + v63 * 2.0 - v48->size.width;
      }
      double v76 = *p_x - v75;
      goto LABEL_163;
    }
    if (v92 < NSTypesetterBehavior_10_2 && length == 0) {
      double v72 = 0.0;
    }
  }
  double v76 = v72 + *p_x;
LABEL_163:
  *p_double x = v76;
}

- (NSDictionary)attributesForExtraLineFragment
{
  BOOL v3 = [(NSTypesetter *)self attributedString];
  uint64_t v4 = [(NSAttributedString *)v3 length];
  NSUInteger v5 = (void *)[(NSTextView *)[(NSTextContainer *)[(NSTypesetter *)self currentTextContainer] textView] superview];
  if (!v5
    || (int v6 = v5, v4) && [v5 selectedRange] != v4
    || (objc_opt_respondsToSelector() & 1) == 0
    || (CGFloat result = (NSDictionary *)[v6 typingAttributes]) == 0)
  {
    CGFloat result = [(NSTextContainer *)[(NSTypesetter *)self currentTextContainer] attributesForExtraLineFragment];
    if (!result)
    {
      if (v4)
      {
        return [(NSAttributedString *)v3 attributesAtIndex:v4 - 1 effectiveRange:0];
      }
      else
      {
        return (NSDictionary *)MEMORY[0x1E4F1CC08];
      }
    }
  }
  return result;
}

- (NSTypesetterControlCharacterAction)actionForControlCharacterAtIndex:(NSUInteger)charIndex
{
  uint64_t v4 = [(NSTypesetter *)self attributedString];
  int v5 = [(NSString *)[(NSAttributedString *)v4 string] characterAtIndex:charIndex];
  if (v5 > 132)
  {
    if (v5 == 133 || v5 == 8232)
    {
      return 8;
    }
    else if (v5 == 8233)
    {
      return 24;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    int v6 = v5 - 9;
    NSTypesetterControlCharacterAction result = 4;
    switch(v6)
    {
      case 0:
        return result;
      case 1:
      case 4:
        return 24;
      case 2:
        return 8;
      case 3:
        if ([(NSAttributedString *)v4 _isStringDrawingTextStorage]) {
          NSTypesetterControlCharacterAction result = 8;
        }
        else {
          NSTypesetterControlCharacterAction result = 40;
        }
        break;
      default:
        return 1;
    }
  }
  return result;
}

- (void)_layoutGlyphsInLayoutManager:(id)a3 startingAtGlyphIndex:(unint64_t)a4 maxNumberOfLineFragments:(unint64_t)a5 maxCharacterIndex:(unint64_t)a6 nextGlyphIndex:(unint64_t *)a7 nextCharacterIndex:(unint64_t *)a8
{
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  v216 = reserved;
  int v214 = [a3 isValidGlyphIndex:a4];
  id v12 = (long long *)MEMORY[0x1E4F28AD8];
  reserved->var15.NSUInteger length = 0;
  p_NSUInteger length = &reserved->var15.length;
  long long v14 = *v12;
  long long v15 = v12[1];
  *(_OWORD *)(p_length - 9) = *v12;
  *(_OWORD *)(p_length - 7) = v15;
  long long v201 = v15;
  long long v202 = v14;
  *(_OWORD *)(p_length - 3) = v15;
  *(_OWORD *)(p_length - 5) = v14;
  *(p_length - 1) = 0x7FFFFFFFFFFFFFFFLL;
  v203 = p_length;
  p_length[1] = 0;
  double v16 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  v217 = self;
  if (!v16) {
    double v16 = [(NSTypesetter *)self _getAuxData];
  }
  var0 = v16->var0;
  unint64_t v240 = 0;
  uint64_t v241 = 0;
  uint64_t v18 = (void *)[a3 textContainers];
  *((void *)var0 + 7) = v18;
  unint64_t v207 = [v18 count];
  if (v214) {
    unint64_t v218 = a4;
  }
  else {
    unint64_t v218 = [a3 numberOfGlyphs];
  }
  if (!v207) {
    goto LABEL_155;
  }
  if (v218) {
    uint64_t v19 = [a3 textContainerForGlyphAtIndex:v218 - 1 effectiveRange:&v240 withoutAdditionalLayout:1];
  }
  else {
    uint64_t v19 = [*((id *)var0 + 7) objectAtIndex:0];
  }
  *((void *)var0 + 8) = v19;
  if (v19)
  {
    unint64_t v238 = 0;
    unint64_t v239 = 0;
    uint64_t v236 = 0;
    uint64_t v237 = 0;
    long long v200 = *MEMORY[0x1E4F28AD0];
    long long v235 = *MEMORY[0x1E4F28AD0];
    *(void *)var0 = [a3 textStorage];
    if (*((id *)var0 + 6) != a3)
    {
      *((void *)var0 + 6) = a3;
      if (objc_opt_class() != __NSLayoutManagerClass)
      {
        v216->var5 = (void *)[a3 methodForSelector:sel_setNotShownAttribute_forGlyphAtIndex_];
        v216->var6 = (void *)[a3 methodForSelector:sel_setDrawsOutsideLineFragment_forGlyphAtIndex_];
      }
    }
    -[NSTypesetter setTypesetterBehavior:](self, "setTypesetterBehavior:", [a3 typesetterBehavior]);
    -[NSTypesetter _setForceOriginalFontBaseline:](self, "_setForceOriginalFontBaseline:", [a3 allowsOriginalFontMetricsOverride]);
    -[NSTypesetter setUsesFontLeading:](self, "setUsesFontLeading:", [a3 usesFontLeading]);
    -[NSTypesetter setApplicationFrameworkContext:](self, "setApplicationFrameworkContext:", [a3 applicationFrameworkContext]);
    [a3 hyphenationFactor];
    float v21 = v20;
    if (v21 == 0.0 && [a3 usesDefaultHyphenation])
    {
      +[NSParagraphStyle _defaultHyphenationFactor];
      float v21 = *(float *)&v20;
    }
    *(float *)&double v20 = v21;
    [(NSTypesetter *)self setHyphenationFactor:v20];
    uint64_t v205 = [*(id *)var0 string];
    [*((id *)var0 + 8) size];
    *((double *)var0 + 10) = v23;
    *((double *)var0 + 11) = v22;
    if (v23 <= 0.0) {
      *((void *)var0 + 10) = 0x416312D000000000;
    }
    if (v22 <= 0.0) {
      *((void *)var0 + 11) = 0x416312D000000000;
    }
    *((void *)var0 + 9) = [*((id *)var0 + 7) indexOfObjectIdenticalTo:*((void *)var0 + 8)];
    [*((id *)var0 + 8) lineFragmentPadding];
    -[NSTypesetter setLineFragmentPadding:](self, "setLineFragmentPadding:");
    v216->var18 = 0;
    if (!v218)
    {
      char v31 = 8;
      if (v214) {
        char v31 = 1;
      }
      char v212 = v31;
      if (_NSTypesetterTextBlockRetriesDict)
      {
        os_unfair_lock_lock_with_options();
        CFDictionaryRemoveValue((CFMutableDictionaryRef)_NSTypesetterTextBlockRetriesDict, a3);
        os_unfair_lock_unlock((os_unfair_lock_t)&_NSTypesetterTextBlockRetriesDictLock);
      }
      goto LABEL_69;
    }
    unint64_t v24 = v218 - 1;
    char v212 = -[NSTypesetter actionForControlCharacterAtIndex:](self, "actionForControlCharacterAtIndex:", [a3 characterIndexForGlyphAtIndex:v218 - 1]);
    if (_NSTypesetterTextBlockRetriesDict
      && (os_unfair_lock_lock_with_options(),
          Value = CFDictionaryGetValue((CFDictionaryRef)_NSTypesetterTextBlockRetriesDict, a3),
          CFDictionaryRemoveValue((CFMutableDictionaryRef)_NSTypesetterTextBlockRetriesDict, a3),
          os_unfair_lock_unlock((os_unfair_lock_t)&_NSTypesetterTextBlockRetriesDictLock),
          (const void *)v218 == Value))
    {
      CFDictionarySetValue((CFMutableDictionaryRef)_NSTypesetterTextBlockRetriesDict, a3, Value);
      v212 |= 0x20u;
    }
    else if (*((double *)var0 + 11) < 10000000.0 && (v212 & 0x20) != 0)
    {
      id v26 = (void *)[*((id *)var0 + 12) textBlocks];
      if (v26)
      {
        if ([v26 count])
        {
          char v212 = 8;
          goto LABEL_44;
        }
      }
    }
    if (*((double *)var0 + 11) < 10000000.0 && (v212 & 0x20) != 0)
    {
      unint64_t v27 = *((void *)var0 + 9) + 1;
      *((void *)var0 + 9) = v27;
      if (v27 >= v207)
      {
        *((void *)var0 + 8) = 0;
      }
      else
      {
        uint64_t v28 = objc_msgSend(*((id *)var0 + 7), "objectAtIndex:");
        *((void *)var0 + 8) = v28;
        [v28 size];
        *((double *)var0 + 10) = v30;
        *((double *)var0 + 11) = v29;
        if (v30 <= 0.0) {
          *((void *)var0 + 10) = 0x416312D000000000;
        }
        if (v29 <= 0.0) {
          *((void *)var0 + 11) = 0x416312D000000000;
        }
        [*((id *)var0 + 8) lineFragmentPadding];
        -[NSTypesetter setLineFragmentPadding:](v217, "setLineFragmentPadding:");
      }
      char v212 = 8;
      goto LABEL_60;
    }
LABEL_44:
    uint64_t v32 = [a3 characterIndexForGlyphAtIndex:v24];
    unint64_t v33 = [*(id *)var0 length];
    uint64_t v34 = objc_msgSend((id)objc_msgSend(*(id *)var0, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", v32, 0), "textBlocks");
    [a3 lineFragmentRectForGlyphAtIndex:v24 effectiveRange:0 withoutAdditionalLayout:1];
    *(void *)&long long v235 = 0;
    *((double *)&v235 + 1) = v35 + v36;
    if (!v34 || (uint64_t v37 = [v34 count]) == 0)
    {
LABEL_60:
      unint64_t v46 = [*((id *)var0 + 8) maximumNumberOfLines];
      if (v46)
      {
        if (v241)
        {
          *(void *)buffer = v240;
          *(void *)&buffer[4] = 0;
          if (v240 < v218)
          {
            uint64_t v47 = 0;
            do
            {
              objc_msgSend(a3, "lineFragmentRectForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:");
              --v47;
            }
            while (*(void *)&buffer[4] + *(void *)buffer < v218);
            if (v47)
            {
              if (-v47 >= v46)
              {
                *((void *)var0 + 8) = 0;
              }
              else
              {
                v216->var18 -= v47;
                a5 -= v47;
              }
            }
          }
        }
      }
LABEL_69:
      if (!*((void *)var0 + 8)) {
        goto LABEL_156;
      }
      NSRectPointer v48 = @"NSParagraphStyle";
      double v198 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
      double v199 = *MEMORY[0x1E4F28AD8];
      double v193 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
      double v194 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
      char v49 = (void *)&v231 + 1;
      while (1)
      {
        if (v216->var18 >= a5) {
          goto LABEL_156;
        }
        if ((v214 & 1) == 0)
        {
          if ((v212 & 8) != 0)
          {
            *(_OWORD *)buffer = 0u;
            long long v222 = 0u;
            long long v219 = 0u;
            long long v220 = 0u;
            -[NSTypesetter getLineFragmentRect:usedRect:forParagraphSeparatorGlyphRange:atProposedOrigin:](v217, "getLineFragmentRect:usedRect:forParagraphSeparatorGlyphRange:atProposedOrigin:", buffer, &v219, v218, 0, v235);
            objc_msgSend(a3, "setExtraLineFragmentRect:usedRect:textContainer:", *((void *)var0 + 8), *(double *)buffer, *(double *)&buffer[4], v222, v219, v220);
          }
          goto LABEL_155;
        }
        if ([a3 characterIndexForGlyphAtIndex:v218] >= a6) {
          goto LABEL_156;
        }
        char v212 = -[NSTypesetter _getRemainingNominalParagraphRange:andParagraphSeparatorRange:charactarIndex:layoutManager:string:](v217, "_getRemainingNominalParagraphRange:andParagraphSeparatorRange:charactarIndex:layoutManager:string:", &v238, &v236, [a3 characterIndexForGlyphAtIndex:v218], a3, v205);
        if ((v212 & 0x28) != 0)
        {
          unint64_t v50 = v238;
          unint64_t v51 = v239;
          uint64_t v52 = v236;
          uint64_t v53 = v237;
        }
        else
        {
          uint64_t v52 = [a3 numberOfGlyphs];
          uint64_t v53 = 0;
          unint64_t v50 = v218;
          unint64_t v51 = v52 - v218;
          unint64_t v238 = v218;
          unint64_t v239 = v52 - v218;
          uint64_t v236 = v52;
          uint64_t v237 = 0;
        }
        -[NSTypesetter setParagraphGlyphRange:separatorGlyphRange:](v217, "setParagraphGlyphRange:separatorGlyphRange:", v50, v51, v52, v53);
        unint64_t v238 = [(NSTypesetter *)v217 paragraphGlyphRange];
        unint64_t v239 = v54;
        unint64_t v55 = [(NSTypesetter *)v217 layoutParagraphAtPoint:&v235];
        unint64_t v218 = v55;
        if (!NSIsEmptyRect(v216->var13) && v216->var13.size.width < 10000000.0)
        {
          int v56 = (void *)[*((id *)var0 + 12) textBlocks];
          if (v56)
          {
            if ([v56 count])
            {
              unint64_t location = v216->var1.location;
              if (location < [*(id *)var0 length])
              {
                id v58 = objc_msgSend((id)objc_msgSend(*(id *)var0, "attribute:atIndex:effectiveRange:", v48, v216->var1.location, 0), "textBlocks");
                id v59 = v58;
                if (v58)
                {
                  unint64_t v60 = [v58 count];
                  if (v60)
                  {
                    unint64_t v61 = v216->var1.location;
                    if (v61 < [*(id *)var0 length]) {
                      break;
                    }
                  }
                }
              }
            }
          }
        }
LABEL_131:
        if (!*((void *)var0 + 8))
        {
          if (!v55)
          {
            unint64_t v218 = 0;
            goto LABEL_156;
          }
          if (v55 >= v237 + v236) {
            goto LABEL_151;
          }
          v131 = (void *)[a3 textContainerForGlyphAtIndex:v55 - 1 effectiveRange:0 withoutAdditionalLayout:1];
          v132 = v131;
          if (!v131 || ![v131 lineBreakMode]) {
            goto LABEL_151;
          }
          long long v219 = 0uLL;
          *((void *)var0 + 8) = v132;
          *((void *)var0 + 9) = [*((id *)var0 + 7) indexOfObject:v132];
          [*((id *)var0 + 8) size];
          *((double *)var0 + 10) = v137;
          *((double *)var0 + 11) = v136;
          if (v137 <= 0.0) {
            *((void *)var0 + 10) = 0x416312D000000000;
          }
          if (v136 <= 0.0) {
            *((void *)var0 + 11) = 0x416312D000000000;
          }
          [*((id *)var0 + 8) lineFragmentPadding];
          -[NSTypesetter setLineFragmentPadding:](v217, "setLineFragmentPadding:");
          [a3 lineFragmentRectForGlyphAtIndex:v55 - 1 effectiveRange:&v219 withoutAdditionalLayout:1];
          *(void *)&long long v235 = v138;
          *((void *)&v235 + 1) = v139;
          unint64_t v140 = v219;
          if ((unint64_t)v219 >= v238 && (unint64_t)v219 - v238 < v239)
          {
            uint64_t v141 = [(NSTypesetter *)v217 paragraphSeparatorCharacterRange];
            uint64_t v143 = objc_msgSend(a3, "glyphRangeForCharacterRange:actualCharacterRange:", v141, v142, 0);
            BOOL v144 = 0;
            *((void *)&v219 + 1) = v143 + v145 - v219;
            goto LABEL_232;
          }
          if ((void)v219)
          {
            uint64_t v146 = v219;
            v184 = v49;
            unint64_t v213 = v219;
            while (1)
            {
              -[NSTypesetter _getRemainingNominalParagraphRange:andParagraphSeparatorRange:charactarIndex:layoutManager:string:](v217, "_getRemainingNominalParagraphRange:andParagraphSeparatorRange:charactarIndex:layoutManager:string:", &v238, &v236, [a3 characterIndexForGlyphAtIndex:v146], a3, v205);
              unint64_t v147 = v219;
              if (v239) {
                break;
              }
              [a3 lineFragmentRectForGlyphAtIndex:(void)v219 - 1 effectiveRange:&v219 withoutAdditionalLayout:1];
              *(void *)&long long v235 = v148;
              *((void *)&v235 + 1) = v149;
              uint64_t v146 = v219;
              if (!(void)v219)
              {
                if ([(NSTypesetter *)v217 bidiProcessingEnabled]
                  && (*((unsigned char *)&v216->var19 + 1) & 0x80) == 0)
                {
                  uint64_t BitmapPtrForPlane = CFUniCharGetBitmapPtrForPlane();
                  uint64_t UnicodePropertyDataForPlane = CFUniCharGetUnicodePropertyDataForPlane();
                  uint64_t v232 = 0;
                  long long v230 = 0u;
                  long long v231 = 0u;
                  long long v228 = 0u;
                  *(_OWORD *)theString = 0u;
                  long long v226 = 0u;
                  long long v227 = 0u;
                  long long v224 = 0u;
                  long long v225 = 0u;
                  long long v222 = 0u;
                  long long v223 = 0u;
                  *(_OWORD *)buffer = 0u;
                  v152 = (__CFString *)[*(id *)var0 string];
                  uint64_t v153 = [(__CFString *)v152 length];
                  theString[0] = v152;
                  *((void *)&v230 + 1) = 0;
                  *(void *)&long long v231 = v153;
                  theString[1] = (CFStringRef)CFStringGetCharactersPtr(v152);
                  if (theString[1]) {
                    CStringPtr = 0;
                  }
                  else {
                    CStringPtr = CFStringGetCStringPtr(v152, 0x600u);
                  }
                  *(void *)&long long v230 = CStringPtr;
                  *char v49 = 0;
                  v49[1] = 0;
                  uint64_t v155 = [a3 characterRangeForGlyphRange:v219 actualGlyphRange:0];
                  unint64_t v157 = v155 + v156;
                  if (v155 < (unint64_t)(v155 + v156))
                  {
                    while (1)
                    {
                      if (v155 < 0 || (uint64_t v158 = v231, (uint64_t)v231 <= v155))
                      {
                        LOWORD(v162) = 0;
                        goto LABEL_187;
                      }
                      v159 = (UniChar *)theString[1];
                      if (theString[1]) {
                        break;
                      }
                      if (!(void)v230)
                      {
                        if (v232 <= v155 || (uint64_t v171 = *((void *)&v231 + 1), *((uint64_t *)&v231 + 1) > v155))
                        {
                          uint64_t v172 = v155 - 4;
                          if ((unint64_t)v155 < 4) {
                            uint64_t v172 = 0;
                          }
                          if (v172 + 64 < (uint64_t)v231) {
                            uint64_t v158 = v172 + 64;
                          }
                          *((void *)&v231 + 1) = v172;
                          uint64_t v232 = v158;
                          v242.unint64_t location = *((void *)&v230 + 1) + v172;
                          v242.NSUInteger length = v158 - v172;
                          CFStringGetCharacters(theString[0], v242, buffer);
                          uint64_t v171 = *((void *)&v231 + 1);
                        }
                        uint64_t v160 = v155 - v171;
                        v159 = buffer;
                        goto LABEL_185;
                      }
                      UniChar v161 = *(char *)(v230 + *((void *)&v230 + 1) + v155);
LABEL_198:
                      int v162 = v161;
                      if (v161 >> 10 != 54) {
                        goto LABEL_187;
                      }
                      uint64_t v166 = v155 + 1;
                      uint64_t v167 = v231;
                      if ((uint64_t)v231 <= v155 + 1) {
                        goto LABEL_194;
                      }
                      v168 = (UniChar *)theString[1];
                      if (theString[1])
                      {
                        uint64_t v169 = *((void *)&v230 + 1) + v166;
LABEL_202:
                        UniChar v170 = v168[v169];
                        goto LABEL_213;
                      }
                      if (!(void)v230)
                      {
                        if (v232 <= v166 || (uint64_t v173 = *((void *)&v231 + 1), *((uint64_t *)&v231 + 1) > v166))
                        {
                          uint64_t v174 = v155 - 3;
                          if ((unint64_t)v155 < 3) {
                            uint64_t v174 = 0;
                          }
                          if (v174 + 64 < (uint64_t)v231) {
                            uint64_t v167 = v174 + 64;
                          }
                          *((void *)&v231 + 1) = v174;
                          uint64_t v232 = v167;
                          v243.unint64_t location = *((void *)&v230 + 1) + v174;
                          v243.NSUInteger length = v167 - v174;
                          CFStringGetCharacters(theString[0], v243, buffer);
                          uint64_t v173 = *((void *)&v231 + 1);
                        }
                        uint64_t v169 = v166 - v173;
                        v168 = buffer;
                        goto LABEL_202;
                      }
                      UniChar v170 = *(char *)(v230 + *((void *)&v230 + 1) + v166);
LABEL_213:
                      if (v170 >> 10 != 55) {
                        goto LABEL_194;
                      }
                      int v162 = (v162 << 10) + v170 - 56613888;
                      if ((v162 & 0x1F0000) == 0)
                      {
                        ++v155;
LABEL_187:
                        uint64_t v163 = BitmapPtrForPlane;
                        uint64_t v164 = UnicodePropertyDataForPlane;
                        if (BitmapPtrForPlane) {
                          goto LABEL_188;
                        }
                        goto LABEL_189;
                      }
                      uint64_t v163 = CFUniCharGetBitmapPtrForPlane();
                      uint64_t v164 = CFUniCharGetUnicodePropertyDataForPlane();
                      ++v155;
                      if (v163)
                      {
LABEL_188:
                        if ((*(unsigned __int8 *)(v163 + ((unsigned __int16)v162 >> 3)) >> (v162 & 7))) {
                          goto LABEL_226;
                        }
                      }
LABEL_189:
                      if (v164)
                      {
                        unsigned int v165 = *(unsigned __int8 *)(v164 + BYTE1(v162));
                        if (v165 >= 0x13) {
                          unsigned int v165 = *(unsigned __int8 *)(v164 + (v165 << 8) - 4864 + v162 + 256);
                        }
                        if (v165 == 3)
                        {
LABEL_226:
                          *(_DWORD *)&v216->var19 |= 0x8000u;
                          goto LABEL_227;
                        }
                      }
                      uint64_t v166 = v155 + 1;
LABEL_194:
                      uint64_t v155 = v166;
                      if (v166 >= v157) {
                        goto LABEL_227;
                      }
                    }
                    uint64_t v160 = *((void *)&v230 + 1) + v155;
LABEL_185:
                    UniChar v161 = v159[v160];
                    goto LABEL_198;
                  }
LABEL_227:
                  char v49 = v184;
                  unint64_t v140 = v213;
                }
                uint64_t v146 = v219;
              }
              *((void *)&v219 + 1) = v237 + v236 - v146;
              if (!v146) {
                goto LABEL_230;
              }
            }
          }
          else
          {
LABEL_230:
            unint64_t v147 = 0;
          }
          BOOL v144 = v147 < v140;
LABEL_232:
          uint64_t v175 = [v132 lineBreakMode];
          uint64_t v177 = *((void *)&v219 + 1);
          uint64_t v176 = v219;
          if (v175 >= 3)
          {
            uint64_t v178 = [(NSTypesetter *)v217 characterRangeForGlyphRange:v219 actualGlyphRange:0];
            uint64_t v180 = v179;
            objc_msgSend(a3, "_invalidateGlyphsForExtendedCharacterRange:changeInLength:", v178, v179, 0);
            uint64_t v176 = objc_msgSend(a3, "glyphRangeForCharacterRange:actualCharacterRange:", v178, v180, 0);
            uint64_t v177 = v181;
            *(void *)&long long v219 = v176;
            *((void *)&v219 + 1) = v181;
          }
          -[NSTypesetter setParagraphGlyphRange:separatorGlyphRange:](v217, "setParagraphGlyphRange:separatorGlyphRange:", v176, v177, v177 + v176, 0);
          [(NSTypesetter *)v217 _setLineBreakModeOverridden:1];
          unint64_t v218 = [(NSTypesetter *)v217 layoutParagraphAtPoint:&v235];
          [(NSTypesetter *)v217 _setLineBreakModeOverridden:0];
          if (v144) {
            objc_msgSend(a3, "_invalidateUsageForTextContainersInRange:", *((void *)var0 + 9), 1);
          }
LABEL_155:
          *((void *)var0 + 8) = 0;
          goto LABEL_156;
        }
        LOBYTE(v214) = [a3 isValidGlyphIndex:v55];
        BOOL v126 = *((double *)var0 + 11) >= 10000000.0 || (v212 & 0x20) == 0;
        if (v126 || NSIsEmptyRect(v216->var13) || v216->var13.size.width >= 10000000.0)
        {
          if (*((double *)var0 + 11) >= 10000000.0 || (v212 & 0x20) == 0) {
            goto LABEL_151;
          }
          unint64_t v127 = *((void *)var0 + 9) + 1;
          *((void *)var0 + 9) = v127;
          if (v127 >= v207) {
            goto LABEL_155;
          }
          v128 = objc_msgSend(*((id *)var0 + 7), "objectAtIndex:");
          *((void *)var0 + 8) = v128;
          [v128 size];
          *((double *)var0 + 10) = v130;
          *((double *)var0 + 11) = v129;
          if (v130 <= 0.0) {
            *((void *)var0 + 10) = 0x416312D000000000;
          }
          if (v129 <= 0.0) {
            *((void *)var0 + 11) = 0x416312D000000000;
          }
          [*((id *)var0 + 8) lineFragmentPadding];
          -[NSTypesetter setLineFragmentPadding:](v217, "setLineFragmentPadding:");
          long long v235 = v200;
        }
        char v212 = 8;
LABEL_151:
        if (!*((void *)var0 + 8)) {
          goto LABEL_156;
        }
      }
      unint64_t v62 = [*(id *)var0 length];
      if (v216->var1.length + v216->var1.location + v237 >= v62)
      {
        long long v64 = 0;
      }
      else
      {
        double v63 = objc_msgSend((id)objc_msgSend(*(id *)var0, "attribute:atIndex:effectiveRange:", v48), "textBlocks");
        long long v64 = v63;
        if (v63)
        {
          unint64_t v65 = [v63 count];
          goto LABEL_90;
        }
      }
      unint64_t v65 = 0;
LABEL_90:
      v182 = v48;
      v183 = v49;
      memset(buffer, 0, sizeof(buffer));
      long long v219 = xmmword_18E5F72A0;
      if (v60 >= v65) {
        unint64_t v66 = v65;
      }
      else {
        unint64_t v66 = v60;
      }
      uint64_t v233 = 0;
      uint64_t v234 = 0;
      bRect_24 = v59;
      unint64_t v67 = 0;
      if (!v66) {
        goto LABEL_98;
      }
      while (1)
      {
        uint64_t v68 = [v59 objectAtIndex:v67];
        if (v68 != [v64 objectAtIndex:v67]) {
          break;
        }
        if (v66 == ++v67)
        {
          unint64_t v67 = v66;
          break;
        }
      }
      if (v60 > v67)
      {
LABEL_98:
        uint64_t v69 = 0;
        uint64_t v185 = 0x7FFFFFFFFFFFFFFFLL;
        double bRect_8 = v198;
        double bRect_16 = v199;
        do
        {
          unint64_t v70 = v60--;
          uint64_t v71 = (void *)[bRect_24 objectAtIndex:v60];
          if (v69)
          {
            *(_OWORD *)buffer = v219;
            double v72 = bRect_8;
            double v73 = bRect_16;
            uint64_t v192 = v69;
            uint64_t v74 = v185;
          }
          else
          {
            [a3 layoutRectForTextBlock:v71 atIndex:*((void *)var0 + 1) effectiveRange:buffer];
            double v73 = v75;
            double v72 = v76;
            if (*(void *)&buffer[4])
            {
              uint64_t v74 = objc_msgSend(a3, "characterRangeForGlyphRange:actualGlyphRange:", *(void *)buffer, *(void *)&buffer[4], 0);
              uint64_t v192 = v77;
            }
            else
            {
              uint64_t v74 = [*(id *)var0 rangeOfTextBlock:v71 atIndex:v216->var1.location];
              uint64_t v192 = v78;
              *(void *)buffer = objc_msgSend(a3, "glyphRangeForCharacterRange:actualCharacterRange:");
              *(void *)&buffer[4] = v79;
            }
          }
          double v80 = (void *)[a3 textContainerForGlyphAtIndex:*(void *)buffer effectiveRange:0 withoutAdditionalLayout:1];
          if (!v80)
          {
            double v80 = (void *)*((void *)var0 + 8);
            if (!v80) {
              continue;
            }
          }
          [v80 size];
          double v82 = v81;
          double v84 = v83;
          [v80 lineFragmentPadding];
          CGFloat v86 = v85;
          if (v82 > 0.0) {
            double v87 = v82;
          }
          else {
            double v87 = 10000000.0;
          }
          if (v84 > 0.0) {
            double v88 = v84;
          }
          else {
            double v88 = 10000000.0;
          }
          uint64_t v89 = 0;
          uint64_t v90 = 0;
          NSRect v244 = NSInsetRect(*(NSRect *)(&v87 - 2), v86, 0.0);
          double x = v244.origin.x;
          double y = v244.origin.y;
          double width = v244.size.width;
          CGFloat height = v244.size.height;
          double v191 = v72;
          double bRect = v73;
          CGFloat dX = v86;
          if (v60)
          {
            uint64_t v92 = [bRect_24 objectAtIndex:v70 - 2];
            [a3 layoutRectForTextBlock:v92 atIndex:*((void *)var0 + 1) effectiveRange:&v219];
            double bRect_8 = v96;
            double bRect_16 = v95;
            if (*((void *)&v219 + 1))
            {
              double v97 = v93;
              double v98 = v94;
              uint64_t v185 = [a3 characterRangeForGlyphRange:v219 actualGlyphRange:0];
              uint64_t v69 = v99;
              CGFloat height = v98;
              double y = v97;
              double width = bRect_8;
              double x = bRect_16;
            }
            else
            {
              uint64_t v185 = [*(id *)var0 rangeOfTextBlock:v92 atIndex:v216->var1.location];
              uint64_t v69 = v100;
              *(void *)&long long v219 = objc_msgSend(a3, "glyphRangeForCharacterRange:actualCharacterRange:");
              *((void *)&v219 + 1) = v101;
            }
          }
          double v190 = height;
          uint64_t v102 = *(void *)buffer;
          double v104 = v193;
          double v103 = v194;
          double v106 = v198;
          double v105 = v199;
          if (*(void *)buffer < *(void *)&buffer[4] + *(void *)buffer)
          {
            double v211 = v86 + v86;
            CGFloat v108 = v198;
            CGFloat v107 = v199;
            CGFloat v109 = v193;
            CGFloat v110 = v194;
            do
            {
              [a3 lineFragmentRectForGlyphAtIndex:v102 effectiveRange:&v233 withoutAdditionalLayout:1];
              double v105 = v111;
              double v103 = v112;
              double v106 = v113;
              double v104 = v114;
              [a3 lineFragmentUsedRectForGlyphAtIndex:v102 effectiveRange:&v233 withoutAdditionalLayout:1];
              double v117 = v115 + v116;
              if (v103 + v104 > v117) {
                double v104 = v117 - v103;
              }
              if (v106 >= v211)
              {
                v245.origin.double x = v105;
                v245.origin.double y = v103;
                v245.size.double width = v106;
                v245.size.CGFloat height = v104;
                NSRect v246 = NSInsetRect(v245, dX, 0.0);
                double v105 = v246.origin.x;
                double v103 = v246.origin.y;
                double v106 = v246.size.width;
                double v104 = v246.size.height;
              }
              v247.origin.double x = v107;
              v247.origin.double y = v110;
              v247.size.double width = v108;
              v247.size.CGFloat height = v109;
              if (!NSIsEmptyRect(v247))
              {
                v248.origin.double x = v107;
                v248.origin.double y = v110;
                v248.size.double width = v108;
                v248.size.CGFloat height = v109;
                v252.origin.double x = v105;
                v252.origin.double y = v103;
                v252.size.double width = v106;
                v252.size.CGFloat height = v104;
                NSRect v249 = NSUnionRect(v248, v252);
                double v105 = v249.origin.x;
                double v103 = v249.origin.y;
                double v106 = v249.size.width;
                double v104 = v249.size.height;
              }
              uint64_t v102 = v234 + v233;
              CGFloat v107 = v105;
              CGFloat v110 = v103;
              CGFloat v108 = v106;
              CGFloat v109 = v104;
            }
            while ((unint64_t)(v234 + v233) < *(void *)&buffer[4] + *(void *)buffer);
          }
          double v118 = v191;
          if (v191 > 0.0)
          {
            v250.origin.double x = v105;
            v250.origin.double y = v103;
            v250.size.double width = v106;
            v250.size.CGFloat height = v104;
            double v119 = bRect;
            double v120 = v103;
            double v121 = v104;
            NSRect v251 = NSUnionRect(v250, *(NSRect *)(&v118 - 2));
            double v105 = v251.origin.x;
            double v103 = v251.origin.y;
            double v106 = v251.size.width;
            double v104 = v251.size.height;
          }
          objc_msgSend(v71, "boundsRectForContentRect:inRect:textContainer:characterRange:", v80, v74, v192, v105, v103, v106, v104, x, y, width, v190);
          double v123 = v122;
          double v125 = v124;
          [a3 setBoundsRect:v71 forTextBlock:*(void *)buffer glyphRange:*(void *)&buffer[4]];
          if (*((double *)&v235 + 1) < v123 + v125) {
            *((double *)&v235 + 1) = v123 + v125;
          }
        }
        while (v60 > v67);
      }
      NSRectPointer v48 = v182;
      char v49 = v183;
      goto LABEL_131;
    }
    if (v32 + 1 >= v33)
    {
      double v39 = 0;
    }
    else
    {
      BOOL v38 = objc_msgSend((id)objc_msgSend(*(id *)var0, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle"), "textBlocks");
      double v39 = v38;
      if (v38)
      {
        unint64_t v40 = [v38 count];
        goto LABEL_53;
      }
    }
    unint64_t v40 = 0;
LABEL_53:
    unint64_t v41 = 0;
    char v42 = 1;
    do
    {
      uint64_t v43 = [v34 objectAtIndex:v41];
      if ((v42 & (v41 < v40)) == 1 && v43 == [v39 objectAtIndex:v41])
      {
        char v42 = 1;
      }
      else
      {
        [a3 boundsRectForTextBlock:v43 atIndex:v24 effectiveRange:0];
        char v42 = 0;
        if (*((double *)&v235 + 1) < v44 + v45) {
          *((double *)&v235 + 1) = v44 + v45;
        }
      }
      ++v41;
    }
    while (v37 != v41);
    goto LABEL_60;
  }
LABEL_156:
  int v215 = v214 & 1;
  v133 = v203 - 5;
  v216->var5 = 0;
  v216->var6 = 0;
  v216->unint64_t var19 = ($4E0ED78154A14BB469A82D51316F92F1)(*(_DWORD *)&v216->var19 & 0xFFF87FFF | 0x28000);
  *(_OWORD *)v133 = v202;
  *((_OWORD *)v133 + 1) = v201;
  v216->var15.unint64_t location = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger *v203 = 0;
  v203[1] = 0;
  if (a7) {
    *a7 = v218;
  }
  v134 = a8;
  if (a8)
  {
    if (v215)
    {
      unint64_t v135 = [a3 characterIndexForGlyphAtIndex:v218];
      v134 = a8;
      a6 = v135;
    }
    unint64_t *v134 = a6;
  }
}

- (void)layoutGlyphsInLayoutManager:(NSLayoutManager *)layoutManager startingAtGlyphIndex:(NSUInteger)startGlyphIndex maxNumberOfLineFragments:(NSUInteger)maxNumLines nextGlyphIndex:(NSUInteger *)nextGlyph
{
  uint64_t v11 = [(NSTextStorage *)[(NSLayoutManager *)layoutManager textStorage] length];

  [(NSTypesetter *)self _layoutGlyphsInLayoutManager:layoutManager startingAtGlyphIndex:startGlyphIndex maxNumberOfLineFragments:maxNumLines maxCharacterIndex:v11 nextGlyphIndex:nextGlyph nextCharacterIndex:0];
}

- (NSRange)layoutCharactersInRange:(NSRange)characterRange forLayoutManager:(NSLayoutManager *)layoutManager maximumNumberOfLineFragments:(NSUInteger)maxNumLines
{
  NSUInteger length = characterRange.length;
  NSUInteger location = characterRange.location;
  NSUInteger v11 = characterRange.location + characterRange.length;
  NSUInteger v19 = characterRange.location + characterRange.length;
  unint64_t v12 = [(NSTextStorage *)[(NSLayoutManager *)layoutManager textStorage] length];
  if (v11 > v12)
  {
    unint64_t v13 = v12;
    long long v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3C8];
    double v16 = NSStringFromSelector(a2);
    v20.NSUInteger location = location;
    v20.NSUInteger length = length;
    [v14 raise:v15, @"%@: Invalid character range %@ requested for a text storage with length %d", v16, NSStringFromRange(v20), v13 format];
  }
  [(NSTypesetter *)self _layoutGlyphsInLayoutManager:layoutManager startingAtGlyphIndex:[(NSLayoutManager *)layoutManager glyphIndexForCharacterAtIndex:location] maxNumberOfLineFragments:maxNumLines maxCharacterIndex:v11 nextGlyphIndex:0 nextCharacterIndex:&v19];
  NSUInteger v17 = v19 - location;
  NSUInteger v18 = location;
  result.NSUInteger length = v17;
  result.NSUInteger location = v18;
  return result;
}

- (CGFloat)baselineOffsetInLayoutManager:(NSLayoutManager *)layoutMgr glyphIndex:(NSUInteger)glyphIndex
{
  [(NSLayoutManager *)layoutMgr baselineOffsetForGlyphAtIndex:glyphIndex];
  double v8 = v7;
  if (v7 == 0.0)
  {
    double v9 = (void *)[(NSTextStorage *)[(NSLayoutManager *)layoutMgr textStorage] attributesAtIndex:[(NSLayoutManager *)layoutMgr characterIndexForGlyphAtIndex:glyphIndex] effectiveRange:0];
    id v10 = (void *)[v9 objectForKey:@"NSBaselineOffset"];
    if (v10)
    {
      [v10 doubleValue];
      double v8 = v8 + v11;
    }
    uint64_t v12 = [v9 objectForKey:@"NSSuperScript"];
    if (v12)
    {
      unint64_t v13 = (void *)v12;
      BOOL v14 = [(NSTypesetter *)self _forceOriginalFontBaseline];
      if (!v9) {
        goto LABEL_12;
      }
      if (!v14 || (uint64_t v15 = (void *)[v9 objectForKey:_NSOriginalFontAttributeName]) == 0) {
        uint64_t v15 = (void *)[v9 objectForKey:@"NSFont"];
      }
      if (objc_msgSend((id)objc_msgSend(v9, "objectForKey:", @"CTVerticalForms"), "BOOLValue")) {
        uint64_t v15 = (void *)[v15 verticalFont];
      }
      if (!v15) {
LABEL_12:
      }
        uint64_t v15 = NSDefaultFont();
      [(NSLayoutManager *)layoutMgr typesetterBehavior];
      BOOL v16 = [(NSLayoutManager *)layoutMgr usesFontLeading];
      [v15 _defaultLineHeightForUILayout];
      double v18 = v17;
      double v19 = 0.0;
      if (v16) {
        objc_msgSend(v15, "_leading", 0.0);
      }
      double v8 = v8 + ceil((v18 + v19) * (double)[v13 integerValue] * 0.4);
    }
    if ([(NSTextContainer *)[(NSLayoutManager *)layoutMgr textContainerForGlyphAtIndex:glyphIndex effectiveRange:0] layoutOrientation])
    {
      NSRange v20 = (void *)[v9 objectForKey:@"NSFont"];
      if (!v20) {
        NSRange v20 = NSDefaultFont();
      }
      if (!objc_msgSend((id)objc_msgSend(v20, "verticalFont"), "isVertical"))
      {
        [(NSLayoutManager *)layoutMgr lineFragmentRectForGlyphAtIndex:glyphIndex effectiveRange:0];
        double v24 = v26 * 0.5;
        return v24 - v8;
      }
    }
    [(NSLayoutManager *)layoutMgr locationForGlyphAtIndex:glyphIndex];
    double v22 = v21;
  }
  else
  {
    double v22 = 0.0;
  }
  [(NSLayoutManager *)layoutMgr lineFragmentRectForGlyphAtIndex:glyphIndex effectiveRange:0];
  double v24 = v23 - v22;
  return v24 - v8;
}

- (NSRange)characterRangeForGlyphRange:(NSRange)glyphRange actualGlyphRange:(NSRangePointer)actualGlyphRange
{
  NSUInteger length = glyphRange.length;
  NSUInteger location = glyphRange.location;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  double v9 = reserved;
  if (!reserved)
  {
    reserved = [(NSTypesetter *)self _getAuxData];
    double v9 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    if (!v9) {
      double v9 = [(NSTypesetter *)self _getAuxData];
    }
  }
  var0 = v9->var0;
  if ((*((unsigned char *)&reserved->var19 + 2) & 4) != 0)
  {
    if (actualGlyphRange)
    {
      actualGlyphRange->NSUInteger location = location;
      actualGlyphRange->NSUInteger length = length;
    }
    double v11 = (void *)(reserved->var1.location + location - *((void *)var0 + 1));
    goto LABEL_13;
  }
  double v11 = (void *)*((void *)var0 + 6);
  if (!v11)
  {
    NSUInteger length = 0;
LABEL_13:
    NSUInteger v12 = length;
    goto LABEL_14;
  }

  double v11 = objc_msgSend(v11, "characterRangeForGlyphRange:actualGlyphRange:", location, length, actualGlyphRange);
LABEL_14:
  result.NSUInteger length = v12;
  result.NSUInteger location = (NSUInteger)v11;
  return result;
}

- (NSRange)glyphRangeForCharacterRange:(NSRange)charRange actualCharacterRange:(NSRangePointer)actualCharRange
{
  NSUInteger length = charRange.length;
  NSUInteger location = charRange.location;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  double v9 = reserved;
  if (!reserved)
  {
    reserved = [(NSTypesetter *)self _getAuxData];
    double v9 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    if (!v9) {
      double v9 = [(NSTypesetter *)self _getAuxData];
    }
  }
  var0 = v9->var0;
  if ((*((unsigned char *)&reserved->var19 + 2) & 4) != 0)
  {
    if (actualCharRange)
    {
      actualCharRange->NSUInteger location = location;
      actualCharRange->NSUInteger length = length;
    }
    double v11 = (void *)(*((void *)var0 + 1) + location - reserved->var1.location);
    goto LABEL_13;
  }
  double v11 = (void *)*((void *)var0 + 6);
  if (!v11)
  {
    NSUInteger length = 0;
LABEL_13:
    NSUInteger v12 = length;
    goto LABEL_14;
  }

  double v11 = objc_msgSend(v11, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, actualCharRange);
LABEL_14:
  result.NSUInteger length = v12;
  result.NSUInteger location = (NSUInteger)v11;
  return result;
}

- (unint64_t)getGlyphsInRange:(_NSRange)a3 glyphs:(unsigned __int16 *)a4 properties:(int64_t *)a5 characterIndexes:(unint64_t *)a6 bidiLevels:(char *)a7
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  unint64_t result = *((void *)reserved->var0 + 6);
  if (result)
  {
    return objc_msgSend((id)result, "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", location, length, a4, a5, a6, a7);
  }
  return result;
}

- (NSUInteger)getGlyphsInRange:(NSRange)glyphsRange glyphs:(NSGlyph *)glyphBuffer characterIndexes:(NSUInteger *)charIndexBuffer glyphInscriptions:(NSGlyphInscription *)inscribeBuffer elasticBits:(BOOL *)elasticBuffer bidiLevels:(unsigned __int8 *)bidiLevelBuffer
{
  NSUInteger length = glyphsRange.length;
  NSUInteger location = glyphsRange.location;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  NSUInteger result = *((void *)reserved->var0 + 6);
  if (result)
  {
    return [(id)result getGlyphsInRange:location glyphs:length characterIndexes:glyphBuffer glyphInscriptions:charIndexBuffer elasticBits:inscribeBuffer bidiLevels:elasticBuffer];
  }
  return result;
}

- (void)getLineFragmentRect:(NSRectPointer)lineFragmentRect usedRect:(NSRectPointer)lineFragmentUsedRect remainingRect:(NSRectPointer)remainingRect forStartingGlyphAtIndex:(NSUInteger)startingGlyphIndex proposedRect:(NSRect)proposedRect lineSpacing:(CGFloat)lineSpacing paragraphSpacingBefore:(CGFloat)paragraphSpacingBefore paragraphSpacingAfter:(CGFloat)paragraphSpacingAfter
{
  double height = proposedRect.size.height;
  double width = proposedRect.size.width;
  double y = proposedRect.origin.y;
  double x = proposedRect.origin.x;
  double v22 = [(NSTypesetter *)self _lineFragmentRectForProposedRectArgs];
  if (v22)
  {
    double v23 = v22;
    v22->var0.var0 = lineSpacing;
    v22->var0.var1 = paragraphSpacingBefore;
    v22->var0.var2 = paragraphSpacingAfter;
    v22->var0.var3 = startingGlyphIndex;
    -[NSTypesetter lineFragmentRectForProposedRect:remainingRect:](self, "lineFragmentRectForProposedRect:remainingRect:", remainingRect, x, y, width, height + lineSpacing + paragraphSpacingBefore + paragraphSpacingAfter);
    lineFragmentRect->origin.double x = v24;
    lineFragmentRect->origin.double y = v25;
    lineFragmentRect->size.double width = v26;
    lineFragmentRect->size.double height = v27;
    if (lineFragmentUsedRect)
    {
      CGSize size = v23->var1.var0.size;
      lineFragmentUsedRect->origin = *(CGPoint *)&v23->var0.var0;
      lineFragmentUsedRect->CGSize size = size;
    }
    return;
  }
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  double v158 = paragraphSpacingAfter;
  double v155 = lineSpacing;
  double v160 = paragraphSpacingBefore;
  double v172 = width;
  double v173 = x;
  if (reserved)
  {
    var0 = reserved->var0;
    double v31 = y;
  }
  else
  {
    uint64_t v32 = [(NSTypesetter *)self _getAuxData];
    reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    var0 = v32->var0;
    double v31 = y;
    if (!reserved) {
      reserved = [(NSTypesetter *)self _getAuxData];
    }
  }
  unint64_t v33 = [(NSTypesetter *)self textContainers];
  uint64_t v34 = [(NSTypesetter *)self currentTextContainer];
  double v35 = *((double *)var0 + 10);
  double v166 = *((double *)var0 + 11);
  uint64_t v159 = *((void *)var0 + 9);
  CGFloat v36 = *MEMORY[0x1E4F28AD8];
  double v156 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  double v38 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  double v37 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  v150 = v33;
  unint64_t v154 = [(NSArray *)v33 count];
  if (!v34)
  {
    char v138 = 1;
    double v165 = paragraphSpacingAfter;
    goto LABEL_112;
  }
  double v151 = v36;
  double v152 = v37;
  double v153 = v38;
  char v149 = 0;
  double v169 = height + paragraphSpacingBefore;
  double v39 = height + paragraphSpacingBefore + paragraphSpacingAfter + v155;
  NSUInteger v143 = startingGlyphIndex - 1;
  uint64_t v142 = *MEMORY[0x1E4F1C3B8];
  double v147 = *(double *)(MEMORY[0x1E4F28AD0] + 8);
  double v148 = *MEMORY[0x1E4F28AD0];
  unint64_t v40 = &off_18E5F7000;
  double v41 = v155;
  double v165 = paragraphSpacingAfter;
  v168 = var0;
  UniChar v161 = remainingRect;
  NSUInteger v162 = startingGlyphIndex;
  while (2)
  {
    while (2)
    {
      while (2)
      {
        uint64_t v163 = v34;
        double v157 = v41;
LABEL_11:
        for (double i = v41; ; double i = v102 - v31 - v169)
        {
          double v170 = v39;
          if (NSIsEmptyRect(reserved->var13))
          {
            char v42 = (void *)*((void *)var0 + 6);
            uint64_t v43 = (void *)[*((id *)var0 + 12) textBlocks];
            uint64_t v44 = [v43 count];
            v177[0] = 0uLL;
            [(NSTypesetter *)self lineFragmentPadding];
            CGFloat dX = v45;
            CGFloat v46 = *((double *)v40 + 120);
            if (v43) {
              BOOL v47 = v44 == 0;
            }
            else {
              BOOL v47 = 1;
            }
            if (v47 || (unint64_t v48 = reserved->var1.location, v48 >= [*(id *)var0 length]))
            {
              NSUInteger length = 0;
              unint64_t v61 = 0;
              unint64_t v73 = 0x7FFFFFFFFFFFFFFFLL;
              CGFloat v60 = v46;
              double v54 = v31;
              CGFloat v59 = v31;
              CGFloat v58 = v173;
            }
            else
            {
              char v49 = objc_msgSend((id)objc_msgSend(*(id *)var0, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", reserved->var1.location, 0), "textBlocks");
              if (v49
                && (unint64_t v50 = v49, (v51 = [v49 count]) != 0)
                && (v52 = v51, unint64_t v53 = reserved->var1.location, v53 < [*(id *)var0 length]))
              {
                double v54 = v31;
                uint64_t v55 = [v50 lastObject];
                if ((id)v55 == reserved->var16
                  && (NSUInteger location = reserved->var1.location,
                      unint64_t v73 = reserved->var15.location,
                      BOOL v105 = location >= v73,
                      NSUInteger v106 = location - v73,
                      v105)
                  && (NSUInteger length = reserved->var15.length, v106 < length))
                {
                  unint64_t v61 = (void *)v55;
                  CGFloat v58 = reserved->var14.origin.x;
                  CGFloat v59 = reserved->var14.origin.y;
                  CGFloat v60 = reserved->var14.size.width;
                  CGFloat v46 = reserved->var14.size.height;
                }
                else
                {
                  uint64_t v145 = lineFragmentRect;
                  uint64_t v146 = lineFragmentUsedRect;
                  uint64_t v56 = 0;
                  char v57 = 0;
                  CGFloat v46 = v166;
                  CGFloat v58 = 0.0;
                  CGFloat v59 = 0.0;
                  double v144 = v35;
                  CGFloat v60 = v35;
                  do
                  {
                    unint64_t v61 = (void *)[v50 objectAtIndex:v56];
                    v178.origin.double x = v58;
                    v178.origin.double y = v59;
                    v178.size.double width = v60;
                    v178.size.double height = v46;
                    NSRect v179 = NSInsetRect(v178, dX, 0.0);
                    double v62 = v179.origin.x;
                    double v63 = v179.origin.y;
                    CGFloat v64 = v179.size.width;
                    double v164 = v179.size.height;
                    [v42 layoutRectForTextBlock:v61 atIndex:*((void *)v168 + 1) effectiveRange:v177];
                    if (*((void *)&v177[0] + 1)
                      && (v69 = v65, CGFloat v70 = v66, v71 = v67, v72 = v68, !NSIsEmptyRect(*(NSRect *)&v65)))
                    {
                      unint64_t v73 = [v42 characterRangeForGlyphRange:v177[0] actualGlyphRange:0];
                      NSUInteger length = v83;
                      double v78 = v173;
                    }
                    else
                    {
                      unint64_t v73 = [*(id *)v168 rangeOfTextBlock:v61 atIndex:reserved->var1.location];
                      NSUInteger length = v74;
                      *(void *)&v177[0] = objc_msgSend(v42, "glyphRangeForCharacterRange:actualCharacterRange:", v73, v74, 0);
                      *((void *)&v177[0] + 1) = v76;
                      double v77 = v64;
                      double v78 = v173;
                      objc_msgSend(v61, "rectForLayoutAtPoint:inRect:textContainer:characterRange:", v163, v73, length, v173, v54, v62, v63, v77, v164);
                      CGFloat v69 = v79;
                      CGFloat v70 = v80;
                      CGFloat v71 = v81;
                      CGFloat v72 = v82;
                      objc_msgSend(v42, "setLayoutRect:forTextBlock:glyphRange:", v61, v177[0]);
                      v57 |= reserved->var1.location == v73;
                    }
                    v180.origin.double x = v69;
                    v180.origin.double y = v70;
                    v180.size.double width = v71;
                    v180.size.double height = v72;
                    NSRect v181 = NSInsetRect(v180, -dX, 0.0);
                    CGFloat v58 = v181.origin.x;
                    CGFloat v59 = v181.origin.y;
                    CGFloat v60 = v181.size.width;
                    CGFloat v46 = v181.size.height;
                    if (v57) {
                      double v78 = v181.origin.x;
                    }
                    double v173 = v78;
                    if (v57) {
                      double v54 = v181.origin.y;
                    }
                    ++v56;
                  }
                  while (v52 != v56);
                  lineFragmentRect = v145;
                  lineFragmentUsedRect = v146;
                  double v35 = v144;
                }
              }
              else
              {
                NSUInteger length = 0;
                unint64_t v61 = 0;
                unint64_t v73 = 0x7FFFFFFFFFFFFFFFLL;
                CGFloat v60 = v46;
                double v54 = v31;
                CGFloat v59 = v31;
                CGFloat v58 = v173;
              }
              uint64_t v34 = v163;
            }
            reserved->var13.origin.double x = v58;
            reserved->var13.origin.double y = v59;
            reserved->var13.size.double width = v60;
            reserved->var13.size.double height = v46;
            reserved->var14.origin.double x = v58;
            reserved->var14.origin.double y = v59;
            reserved->var14.size.double width = v60;
            reserved->var14.size.double height = v46;
            reserved->var15.NSUInteger location = v73;
            reserved->var15.NSUInteger length = length;
            reserved->var16 = v61;
            var0 = v168;
            remainingRect = v161;
            startingGlyphIndedouble x = v162;
            unint64_t v40 = &off_18E5F7000;
          }
          else
          {
            double v54 = v31;
            CGFloat v58 = reserved->var13.origin.x;
            CGFloat v59 = reserved->var13.origin.y;
            CGFloat v60 = reserved->var13.size.width;
            CGFloat v46 = reserved->var13.size.height;
          }
          v182.origin.double x = v58;
          v182.origin.double y = v59;
          v182.size.double width = v60;
          v182.size.double height = v46;
          if (NSIsEmptyRect(v182))
          {
            double v84 = v172;
            double v85 = v173;
            double v31 = v54;
LABEL_48:
            double v94 = v170;
            goto LABEL_49;
          }
          double v86 = reserved->var13.size.width;
          double v84 = v172;
          double v85 = v173;
          double v31 = v54;
          if (v86 >= *((double *)v40 + 120)) {
            goto LABEL_48;
          }
          double v87 = reserved->var13.origin.x;
          double v88 = reserved->var13.origin.y;
          uint64_t v89 = v173 >= v87 ? *(void *)&v173 : *(void *)&reserved->var13.origin.x;
          double v90 = v54 >= v88 ? v54 : reserved->var13.origin.y;
          CGFloat v91 = reserved->var13.size.height;
          double v92 = v172;
          double v93 = v170;
          NSRect v183 = NSIntersectionRect(*(NSRect *)&v89, *(NSRect *)(&v86 - 2));
          double v85 = v183.origin.x;
          double v31 = v183.origin.y;
          double v84 = v183.size.width;
          double v94 = v183.size.height;
LABEL_49:
          double v172 = v84;
          double v173 = v85;
          double v95 = v94;
          -[NSTextContainer lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:](v34, "lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:", -[NSTypesetter characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", startingGlyphIndex, 1, 0), [(NSTypesetter *)self _baseWritingDirection], remainingRect, v85, v31, v84, v94);
          CGFloat v36 = v97;
          double v99 = v98;
          double v38 = v96;
          double v37 = v100;
          if (v100 != 0.0 && v96 != 0.0)
          {
            char v138 = 0;
            goto LABEL_113;
          }
          [(NSTextContainer *)v34 size];
          double v103 = *((double *)v40 + 120);
          if (v101 <= 0.0) {
            double v35 = *((double *)v40 + 120);
          }
          else {
            double v35 = v101;
          }
          if (v102 <= 0.0) {
            double v102 = *((double *)v40 + 120);
          }
          double v166 = v102;
          if (v38 == 0.0 || v169 + v31 > v102) {
            break;
          }
          if (v165 > 0.0)
          {
            double v107 = v31 + v95 - v165;
            double v108 = v102;
            double v109 = v102 - v31;
            double v110 = v108 - v107;
            double v111 = v95 - v165;
            BOOL v112 = v107 < v108;
            double v113 = 0.0;
            if (v112) {
              double v113 = v110;
            }
            double v165 = v113;
            if (v112) {
              double v39 = v109;
            }
            else {
              double v39 = v111;
            }
            double v41 = v157;
            goto LABEL_11;
          }
          if (i <= 0.0) {
            break;
          }
          double v39 = v102 - v31;
        }
        if (NSIsEmptyRect(reserved->var13) || reserved->var13.size.width >= v103) {
          goto LABEL_94;
        }
        double v114 = (void *)*((void *)var0 + 6);
        double v115 = (void *)[*((id *)var0 + 12) textBlocks];
        [v115 count];
        v177[0] = xmmword_18E5F72A0;
        uint64_t v175 = 0;
        uint64_t v176 = 0;
        if (!v115) {
          goto LABEL_93;
        }
        uint64_t v116 = [v115 count];
        if (!v116) {
          goto LABEL_93;
        }
        uint64_t v117 = v116;
        unint64_t v118 = reserved->var1.location;
        if (v118 >= [*(id *)v168 length]) {
          goto LABEL_93;
        }
        uint64_t v119 = objc_msgSend((id)objc_msgSend(*(id *)v168, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", reserved->var1.location, 0), "textBlocks");
        if (!v119) {
          goto LABEL_93;
        }
        double v120 = (void *)v119;
        unint64_t v121 = reserved->var1.location;
        if (v121 >= [*(id *)v168 length]) {
          goto LABEL_93;
        }
        double v122 = (void *)[v120 objectAtIndex:0];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v123 = *(id *)v168;
          uint64_t v124 = [v122 table];
          double v125 = v123;
          var0 = v168;
          uint64_t v34 = v163;
          uint64_t v126 = [v125 _rangeOfTextTableRow:v124 atIndex:reserved->var1.location];
          *(void *)&v177[0] = objc_msgSend(v114, "glyphRangeForCharacterRange:actualCharacterRange:", v126, v127, 0);
          *((void *)&v177[0] + 1) = v128;
        }
        else
        {
          uint64_t v128 = *((void *)&v177[0] + 1);
          var0 = v168;
        }
        if (!v128)
        {
          [v114 layoutRectForTextBlock:v122 atIndex:*((void *)var0 + 1) effectiveRange:v177];
          uint64_t v128 = *((void *)&v177[0] + 1);
          if (!*((void *)&v177[0] + 1))
          {
            uint64_t v129 = [*(id *)var0 rangeOfTextBlock:v122 atIndex:reserved->var1.location];
            *(void *)&v177[0] = objc_msgSend(v114, "glyphRangeForCharacterRange:actualCharacterRange:", v129, v130, 0);
            *((void *)&v177[0] + 1) = v128;
          }
        }
        if (*(void *)&v177[0] < v162 && *(void *)&v177[0] && v128)
        {
          v174[0] = 0;
          v174[1] = 0;
          double v37 = v152;
          double v38 = v153;
          CGFloat v36 = v151;
          double v99 = v156;
          if (![v114 textContainerForGlyphAtIndex:v143 effectiveRange:v174 withoutAdditionalLayout:1]|| v174[0] != *(void *)&v177[0])
          {
            os_unfair_lock_lock_with_options();
            CFDictionaryRef Mutable = (const __CFDictionary *)_NSTypesetterTextBlockRetriesDict;
            if (!_NSTypesetterTextBlockRetriesDict)
            {
              CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
              _NSTypesetterTextBlockRetriesDict = (uint64_t)Mutable;
            }
            unint64_t v140 = *(const void **)&v177[0];
            Value = CFDictionaryGetValue(Mutable, v114);
            CFDictionarySetValue((CFMutableDictionaryRef)_NSTypesetterTextBlockRetriesDict, v114, *(const void **)&v177[0]);
            os_unfair_lock_unlock((os_unfair_lock_t)&_NSTypesetterTextBlockRetriesDictLock);
            if (v140 == Value) {
              objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v142, @"*** block retry failed at %ld for layout manager %p", *(void *)&v177[0], v114);
            }
          }
          uint64_t v34 = 0;
          goto LABEL_109;
        }
        for (uint64_t j = 0; j != v117; ++j)
        {
          uint64_t v132 = [v120 objectAtIndex:j];
          [v114 layoutRectForTextBlock:v132 atIndex:*((void *)v168 + 1) effectiveRange:&v175];
          if (v176) {
            objc_msgSend(v114, "setLayoutRect:forTextBlock:glyphRange:", v132, v175, v151, v156, v153, v152);
          }
          [v114 boundsRectForTextBlock:v132 atIndex:*((void *)v168 + 1) effectiveRange:&v175];
          if (v176) {
            objc_msgSend(v114, "setBoundsRect:forTextBlock:glyphRange:", v132, v175, v151, v156, v153, v152);
          }
        }
LABEL_93:
        var0 = v168;
        remainingRect = v161;
        startingGlyphIndedouble x = v162;
        unint64_t v40 = &off_18E5F7000;
LABEL_94:
        if (v31 == 0.0 && v95 > v166)
        {
          double v39 = v166;
          double v41 = i;
          continue;
        }
        break;
      }
      BOOL v105 = v159 + 1 >= v154;
      double v41 = i;
      ++v159;
      if (!v105)
      {
        uint64_t v34 = [(NSArray *)v150 objectAtIndex:v166];
        [(NSTextContainer *)v34 size];
        if (v133 <= 0.0) {
          double v35 = v103;
        }
        else {
          double v35 = v133;
        }
        if (v134 <= 0.0) {
          double v135 = v103;
        }
        else {
          double v135 = v134;
        }
        double v166 = v135;
        double v41 = v155;
        CGPoint v136 = (CGPoint)*MEMORY[0x1E4F28AD8];
        CGSize v137 = *(CGSize *)(MEMORY[0x1E4F28AD8] + 16);
        reserved->var13.origin = (CGPoint)*MEMORY[0x1E4F28AD8];
        reserved->var13.CGSize size = v137;
        double v39 = v169 - v160 + v155 + v158;
        reserved->var14.origin = v136;
        reserved->var14.CGSize size = v137;
        reserved->var15.NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
        reserved->var15.NSUInteger length = 0;
        reserved->var16 = 0;
        double v160 = 0.0;
        double v165 = v158;
        double v173 = v148;
        double v31 = v147;
        if (!v34)
        {
LABEL_109:
          char v138 = 1;
          goto LABEL_113;
        }
        continue;
      }
      break;
    }
    char v138 = 1;
    if (!((i <= 0.0) | v149 & 1) && v95 > i)
    {
      double v39 = v95 - i;
      char v149 = 1;
      continue;
    }
    break;
  }
  uint64_t v34 = 0;
  double v37 = v152;
  double v38 = v153;
  CGFloat v36 = v151;
LABEL_112:
  double v99 = v156;
LABEL_113:
  lineFragmentRect->origin.double x = v36;
  lineFragmentRect->origin.double y = v99;
  lineFragmentRect->size.double width = v38;
  lineFragmentRect->size.double height = v37;
  if (lineFragmentUsedRect)
  {
    v184.origin.double x = v36;
    v184.origin.double y = v99;
    v184.size.double width = v38;
    v184.size.double height = v37;
    if (!NSIsEmptyRect(v184))
    {
      lineFragmentUsedRect->origin.double x = v36;
      lineFragmentUsedRect->origin.double y = v160 + v99;
      lineFragmentUsedRect->size.double width = v38;
      lineFragmentUsedRect->size.double height = v37 - (v165 + v160);
    }
  }
  if (v34 != *((NSTextContainer **)var0 + 8))
  {
    *((void *)var0 + 8) = v34;
    if ((v138 & 1) == 0)
    {
      *((double *)var0 + 10) = v35;
      *((double *)var0 + 11) = v166;
      *((void *)var0 + 9) = v159;
      [(NSTextContainer *)v34 lineFragmentPadding];
      -[NSTypesetter setLineFragmentPadding:](self, "setLineFragmentPadding:");
    }
  }
}

- (void)setLineFragmentRect:(NSRect)fragmentRect forGlyphRange:(NSRange)glyphRange usedRect:(NSRect)usedRect baselineOffset:(CGFloat)baselineOffset
{
  double height = usedRect.size.height;
  double width = usedRect.size.width;
  double y = usedRect.origin.y;
  double x = usedRect.origin.x;
  NSUInteger length = glyphRange.length;
  NSUInteger location = glyphRange.location;
  double v11 = fragmentRect.size.height;
  double v12 = fragmentRect.size.width;
  double v13 = fragmentRect.origin.y;
  double v14 = fragmentRect.origin.x;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (reserved)
  {
    double v17 = (void *)*((void *)reserved->var0 + 6);
  }
  else
  {
    double v18 = [(NSTypesetter *)self _getAuxData];
    reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    double v17 = (void *)*((void *)v18->var0 + 6);
    if (!reserved) {
      reserved = [(NSTypesetter *)self _getAuxData];
    }
  }
  reserved->var17 = baselineOffset;
  objc_msgSend(v17, "setTextContainer:forGlyphRange:", -[NSTypesetter currentTextContainer](self, "currentTextContainer"), location, length);

  objc_msgSend(v17, "setLineFragmentRect:forGlyphRange:usedRect:baselineOffset:", location, length, v14, v13, v12, v11, x, y, width, height);
}

- (void)substituteGlyphsInRange:(NSRange)glyphRange withGlyphs:(NSGlyph *)glyphs
{
  int64_t length = glyphRange.length;
  NSUInteger location = glyphRange.location;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  if (length >= 1)
  {
    double v9 = (void *)*((void *)reserved->var0 + 6);
    id v10 = &glyphs[length];
    do
    {
      unsigned int v11 = *glyphs++;
      [v9 replaceGlyphAtIndex:location++ withGlyph:v11];
    }
    while (glyphs < v10);
  }
}

- (void)insertGlyph:(NSGlyph)glyph atGlyphIndex:(NSUInteger)glyphIndex characterIndex:(NSUInteger)characterIndex
{
  uint64_t v7 = *(void *)&glyph;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  [*((id *)reserved->var0 + 6) insertGlyph:v7 atGlyphIndex:glyphIndex characterIndex:characterIndex];
  id v10 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!v10) {
    id v10 = [(NSTypesetter *)self _getAuxData];
  }
  *(_DWORD *)&v10->var19 &= ~0x40000u;
}

- (void)deleteGlyphsInRange:(NSRange)glyphRange
{
  NSUInteger length = glyphRange.length;
  NSUInteger location = glyphRange.location;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  objc_msgSend(*((id *)reserved->var0 + 6), "deleteGlyphsInRange:", location, length);
  uint64_t v7 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!v7) {
    uint64_t v7 = [(NSTypesetter *)self _getAuxData];
  }
  *(_DWORD *)&v7->var19 &= ~0x40000u;
}

- (void)setNotShownAttribute:(BOOL)flag forGlyphRange:(NSRange)glyphRange
{
  NSUInteger length = glyphRange.length;
  NSUInteger location = glyphRange.location;
  BOOL v6 = flag;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  uint64_t v9 = *((void *)reserved->var0 + 6);
  if (v9)
  {
    id v10 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    if (!v10) {
      id v10 = [(NSTypesetter *)self _getAuxData];
    }
    if (v10->var5) {
      var5 = (void (*)(uint64_t, char *, BOOL, NSUInteger))v10->var5;
    }
    else {
      var5 = (void (*)(uint64_t, char *, BOOL, NSUInteger))__NSDefaultNotShownIMP;
    }
    if (location < location + length)
    {
      do
      {
        var5(v9, sel_setNotShownAttribute_forGlyphAtIndex_, v6, location++);
        --length;
      }
      while (length);
    }
  }
}

- (void)setDrawsOutsideLineFragment:(BOOL)flag forGlyphRange:(NSRange)glyphRange
{
  NSUInteger length = glyphRange.length;
  NSUInteger location = glyphRange.location;
  BOOL v6 = flag;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  uint64_t v9 = *((void *)reserved->var0 + 6);
  if (v9)
  {
    id v10 = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    if (!v10) {
      id v10 = [(NSTypesetter *)self _getAuxData];
    }
    if (v10->var6) {
      var6 = (void (*)(uint64_t, char *, BOOL, NSUInteger))v10->var6;
    }
    else {
      var6 = (void (*)(uint64_t, char *, BOOL, NSUInteger))__NSDefaultDrawsOutsideIMP;
    }
    if (location < location + length)
    {
      do
      {
        var6(v9, sel_setDrawsOutsideLineFragment_forGlyphAtIndex_, v6, location++);
        --length;
      }
      while (length);
    }
  }
}

- (void)setLocation:(NSPoint)location withAdvancements:(const CGFloat *)advancements forStartOfGlyphRange:(NSRange)glyphRange
{
  if (glyphRange.length)
  {
    NSUInteger length = glyphRange.length;
    NSUInteger v6 = glyphRange.location;
    double y = location.y;
    double x = location.x;
    reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    if (reserved)
    {
      unsigned int v11 = (void *)*((void *)reserved->var0 + 6);
    }
    else
    {
      double v12 = [(NSTypesetter *)self _getAuxData];
      reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
      unsigned int v11 = (void *)*((void *)v12->var0 + 6);
      if (!reserved) {
        reserved = [(NSTypesetter *)self _getAuxData];
      }
    }
    double v13 = reserved->var17 - y;
    objc_msgSend(v11, "setLocation:forStartOfGlyphRange:", v6, length, x, v13);
  }
}

- (void)setAttachmentSize:(NSSize)attachmentSize forGlyphRange:(NSRange)glyphRange
{
  if (glyphRange.length)
  {
    NSUInteger length = glyphRange.length;
    NSUInteger location = glyphRange.location;
    double height = attachmentSize.height;
    double width = attachmentSize.width;
    reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
    if (!reserved) {
      reserved = [(NSTypesetter *)self _getAuxData];
    }
    uint64_t v9 = (void *)*((void *)reserved->var0 + 6);
    objc_msgSend(v9, "setAttachmentSize:forGlyphRange:", location, length, width, height);
  }
}

- (void)setBidiLevels:(const uint8_t *)levels forGlyphRange:(NSRange)glyphRange
{
  int64_t length = glyphRange.length;
  NSUInteger location = glyphRange.location;
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  if (length >= 1)
  {
    uint64_t v9 = (void *)*((void *)reserved->var0 + 6);
    id v10 = &levels[length];
    do
    {
      unsigned int v11 = *levels++;
      [v9 setIntAttribute:2 value:v11 forGlyphAtIndex:location++];
    }
    while (levels < v10);
  }
}

- (NSUInteger)layoutParagraphAtPoint:(NSPointPointer)lineFragmentOrigin
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  reserved = ($0177D170777CFC227CB001A659B5CD18 *)self->_reserved;
  if (!reserved) {
    reserved = [(NSTypesetter *)self _getAuxData];
  }
  return *((void *)reserved->var0 + 1);
}

@end
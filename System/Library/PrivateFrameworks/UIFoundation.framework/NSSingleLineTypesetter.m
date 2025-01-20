@interface NSSingleLineTypesetter
+ (BOOL)_validateAttributes:(id)a3 measuringOnly:(BOOL)a4;
+ (void)initialize;
+ (void)performWithSingleLineTypesetterContext:(id)a3;
- (BOOL)_allowsEllipsisGlyphSubstitution;
- (BOOL)_mirrorsTextAlignment;
- (BOOL)_usesScreenFonts;
- (BOOL)synchronizesAlignmentToDirection;
- (NSSingleLineTypesetter)init;
- (_NSRange)characterRangeForGlyphRange:(_NSRange)a3 actualGlyphRange:(_NSRange *)a4;
- (_NSRange)glyphRangeForCharacterRange:(_NSRange)a3 actualCharacterRange:(_NSRange *)a4;
- (id)_textContainerForAttachmentProtocol;
- (id)_textStorageForAttachmentProtocol;
- (id)attributedString;
- (id)createRenderingContextForCharacterRange:(_NSRange)a3 typesetterBehavior:(int64_t)a4 usesScreenFonts:(BOOL)a5 hasStrongRight:(BOOL)a6 maximumWidth:(double)a7;
- (id)createRenderingContextForCharacterRange:(_NSRange)a3 typesetterBehavior:(int64_t)a4 usesScreenFonts:(BOOL)a5 hasStrongRight:(BOOL)a6 syncDirection:(BOOL)a7 mirrorsTextAlignment:(BOOL)a8 maximumWidth:(double)a9;
- (id)substituteFontForFont:(id)a3;
- (unint64_t)getGlyphsInRange:(_NSRange)a3 glyphs:(unsigned __int16 *)a4 properties:(int64_t *)a5 characterIndexes:(unint64_t *)a6 bidiLevels:(char *)a7;
- (unint64_t)layoutOptions;
- (void)dealloc;
- (void)getLineFragmentRect:(CGRect *)a3 usedRect:(CGRect *)a4 remainingRect:(CGRect *)a5 forStartingGlyphAtIndex:(unint64_t)a6 proposedRect:(CGRect)a7 lineSpacing:(double)a8 paragraphSpacingBefore:(double)a9 paragraphSpacingAfter:(double)a10;
- (void)setGlyphs:(const unsigned __int16 *)a3 properties:(const int64_t *)a4 characterIndexes:(const unint64_t *)a5 font:(id)a6 forGlyphRange:(_NSRange)a7;
@end

@implementation NSSingleLineTypesetter

+ (BOOL)_validateAttributes:(id)a3 measuringOnly:(BOOL)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a4) {
    return 1;
  }
  memset(v12, 0, sizeof(v12));
  CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)a3);
  if (Count > 40) {
    return 0;
  }
  CFIndex v7 = Count;
  v8 = (const void **)v12;
  CFDictionaryGetKeysAndValues((CFDictionaryRef)a3, (const void **)v12, 0);
  v9 = (const void **)v12 + v7;
  do
  {
    BOOL v4 = v8 >= v9;
    if (v8 >= v9) {
      break;
    }
    v10 = *v8++;
  }
  while (!CFSetContainsValue((CFSetRef)__NSUnrecognizedAttributes, v10));
  return v4;
}

- (BOOL)_usesScreenFonts
{
  return *(_DWORD *)&self->_slFlags & 1;
}

- (id)_textStorageForAttachmentProtocol
{
  return self->_textStorage;
}

- (BOOL)synchronizesAlignmentToDirection
{
  return (*(unsigned char *)&self->_slFlags >> 1) & 1;
}

- (BOOL)_mirrorsTextAlignment
{
  return (*(unsigned char *)&self->_slFlags >> 2) & 1;
}

+ (void)performWithSingleLineTypesetterContext:(id)a3
{
  os_unfair_lock_lock_with_options();
  int v5 = __NSSingleLineTypesetterCacheNextIndex;
  if (__NSSingleLineTypesetterCacheNextIndex)
  {
    --__NSSingleLineTypesetterCacheNextIndex;
    id v8 = (id)__NSSingleLineTypesetterCache[v5 - 1];
    os_unfair_lock_unlock(&__NSSingleLineTypesetterLock);
    uint64_t v6 = (uint64_t)v8;
    if (v8) {
      goto LABEL_6;
    }
  }
  else
  {
    os_unfair_lock_unlock(&__NSSingleLineTypesetterLock);
  }
  uint64_t v6 = [objc_allocWithZone((Class)a1) init];
LABEL_6:
  id v9 = (id)v6;
  (*((void (**)(id))a3 + 2))(a3);
  os_unfair_lock_lock_with_options();
  uint64_t v7 = __NSSingleLineTypesetterCacheNextIndex;
  if (__NSSingleLineTypesetterCacheNextIndex > 4)
  {
    os_unfair_lock_unlock(&__NSSingleLineTypesetterLock);
  }
  else
  {
    ++__NSSingleLineTypesetterCacheNextIndex;
    __NSSingleLineTypesetterCache[v7] = v9;
    os_unfair_lock_unlock(&__NSSingleLineTypesetterLock);
  }
}

- (id)createRenderingContextForCharacterRange:(_NSRange)a3 typesetterBehavior:(int64_t)a4 usesScreenFonts:(BOOL)a5 hasStrongRight:(BOOL)a6 syncDirection:(BOOL)a7 mirrorsTextAlignment:(BOOL)a8 maximumWidth:(double)a9
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v29 = 0;
  long long v28 = *MEMORY[0x1E4F28AD0];
  NSUInteger v17 = [(NSAttributedString *)self->super.attributedString length];
  if (length || (NSUInteger v18 = v17, result = 0, location <= v18))
  {
    self->_lineWidth = a9;
    self->_slFlags = ($0C8DD4A126019293B142AD28B7DE2D96)(*(_DWORD *)&self->_slFlags & 0xFFFFFFFE | v11);
    [(NSTypesetter *)self setTypesetterBehavior:a4];
    -[NSTypesetter setParagraphGlyphRange:separatorGlyphRange:](self, "setParagraphGlyphRange:separatorGlyphRange:", location, length, location + length, 0);
    [(NSATSTypesetter *)self beginParagraph];
    NSUInteger v26 = location;
    NSUInteger v27 = location;
    v20 = self->super._private;
    if (!v20)
    {
      v20 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSSingleLineTypesetter *)self zone]), self);
      self->super._private = v20;
    }
    if (v10) {
      int v21 = 0x8000;
    }
    else {
      int v21 = 0;
    }
    *(_DWORD *)(v20[5] + 216) = *(_DWORD *)(v20[5] + 216) & 0xFFFF7FFF | v21;
    if (a8) {
      int v22 = 4;
    }
    else {
      int v22 = 0;
    }
    if (v9) {
      int v23 = 2;
    }
    else {
      int v23 = 0;
    }
    self->_slFlags = ($0C8DD4A126019293B142AD28B7DE2D96)(v22 | v23 | *(_DWORD *)&self->_slFlags & 0xFFFFFFF9);
    [(NSATSTypesetter *)self _layoutLineFragmentStartingWithGlyphAtIndex:&v27 characterIndex:&v26 atPoint:&v28 renderingContext:&v29];
    v24 = self->super._private;
    if (!v24)
    {
      v24 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSSingleLineTypesetter *)self zone]), self);
      self->super._private = v24;
    }
    objc_msgSend(v29, "setResolvedTextAlignment:", ((unint64_t)*(unsigned int *)(v24[5] + 216) >> 7) & 0xF, v26, v27);
    int64_t v25 = [(NSATSTypesetter *)self _baseWritingDirection];
    [v29 setResolvedBaseWritingDirection:v25];
    [(NSATSTypesetter *)self endParagraph];
    [(NSATSTypesetter *)self _flushCachedObjects];

    self->_textStorage = 0;
    return v29;
  }
  return result;
}

- (_NSRange)characterRangeForGlyphRange:(_NSRange)a3 actualGlyphRange:(_NSRange *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)attributedString
{
  return self->super.attributedString;
}

- (NSSingleLineTypesetter)init
{
  v5.receiver = self;
  v5.super_class = (Class)NSSingleLineTypesetter;
  v2 = [(NSATSTypesetter *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(NSTypesetter *)v2 setUsesFontLeading:0];
    [(NSATSTypesetter *)v3 _setBaselineRenderingMode:1];
    [(NSTypesetter *)v3 _setForceOriginalFontBaseline:1];
  }
  return v3;
}

- (id)substituteFontForFont:(id)a3
{
  if (*(unsigned char *)&self->_slFlags) {
    return (id)[a3 screenFontWithRenderingMode:0];
  }
  else {
    return a3;
  }
}

- (unint64_t)getGlyphsInRange:(_NSRange)a3 glyphs:(unsigned __int16 *)a4 properties:(int64_t *)a5 characterIndexes:(unint64_t *)a6 bidiLevels:(char *)a7
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  self->_currentBufferRange = a3;
  self->_glyphs = a4;
  self->_props = a5;
  self->_charIndexes = a6;
  if (a7) {
    bzero(a7, a3.length);
  }
  objc_msgSend(+[NSGlyphGenerator defaultGlyphGenerator](NSGlyphGenerator, "defaultGlyphGenerator", location, location), "generateGlyphsForGlyphStorage:desiredNumberOfCharacters:glyphIndex:characterIndex:", self, length, &v12, &v11);
  self->_glyphs = 0;
  self->_props = 0;
  self->_charIndexes = 0;
  return length;
}

- (void)setGlyphs:(const unsigned __int16 *)a3 properties:(const int64_t *)a4 characterIndexes:(const unint64_t *)a5 font:(id)a6 forGlyphRange:(_NSRange)a7
{
  NSUInteger length = a7.length;
  NSUInteger v11 = a7.location - self->_currentBufferRange.location;
  if (a3)
  {
    glyphs = self->_glyphs;
    if (glyphs) {
      memcpy(&glyphs[v11], a3, 2 * a7.length);
    }
  }
  if (a4)
  {
    props = self->_props;
    if (props) {
      memcpy(&props[v11], a4, 8 * length);
    }
  }
  if (a5)
  {
    charIndexes = self->_charIndexes;
    if (charIndexes)
    {
      memcpy(&charIndexes[v11], a5, 8 * length);
    }
  }
}

- (unint64_t)layoutOptions
{
  return 0;
}

- (void)getLineFragmentRect:(CGRect *)a3 usedRect:(CGRect *)a4 remainingRect:(CGRect *)a5 forStartingGlyphAtIndex:(unint64_t)a6 proposedRect:(CGRect)a7 lineSpacing:(double)a8 paragraphSpacingBefore:(double)a9 paragraphSpacingAfter:(double)a10
{
  double lineWidth = self->_lineWidth;
  if (lineWidth < a7.size.width && lineWidth > 0.0) {
    a7.size.width = self->_lineWidth;
  }
  if (a3)
  {
    a3->origin.x = a7.origin.x;
    a3->origin.y = a7.origin.y;
    a3->size.width = a7.size.width;
    a3->size.height = a8 + a9 + a10 + a7.size.height;
  }
  if (a4)
  {
    a4->origin.x = a7.origin.x;
    a4->origin.y = a7.origin.y + a9;
    a4->size.width = a7.size.width;
    a4->size.height = a9 + a10 + a7.size.height;
  }
  if (a5)
  {
    CGSize v12 = *(CGSize *)(MEMORY[0x1E4F28AD8] + 16);
    a5->origin = (CGPoint)*MEMORY[0x1E4F28AD8];
    a5->size = v12;
  }
}

+ (void)initialize
{
  v3[9] = *(const void **)MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    v3[0] = @"NSBackgroundColor";
    v3[1] = @"NSLink";
    v3[2] = @"NSTextAlternativesDisplayStyle";
    v3[3] = @"NSSpellingState";
    v3[4] = @"NSUnderlineColor";
    v3[5] = @"NSUnderline";
    v3[6] = @"NSStrikethrough";
    v3[7] = @"NSStrikethroughColor";
    v3[8] = NSMarkedClauseSegmentAttributeName;
    __NSUnrecognizedAttributes = (uint64_t)CFSetCreate(0, v3, 9, MEMORY[0x1E4F1D548]);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSSingleLineTypesetter;
  [(NSATSTypesetter *)&v3 dealloc];
}

- (BOOL)_allowsEllipsisGlyphSubstitution
{
  return 1;
}

- (id)_textContainerForAttachmentProtocol
{
  textStorage = self->_textStorage;
  if (!textStorage)
  {
    BOOL v4 = [[__NSImmutableTextStorage alloc] initWithAttributedString:[(NSSingleLineTypesetter *)self attributedString]];
    self->_textStorage = v4;
    objc_super v5 = [(__NSImmutableTextStorage *)v4 layoutManager];
    [(NSLayoutManager *)v5 setApplicationFrameworkContext:[(NSTypesetter *)self applicationFrameworkContext]];
    [(NSLayoutManager *)v5 setUsesFontLeading:[(NSTypesetter *)self usesFontLeading]];
    -[NSTextContainer setSize:]([(__NSImmutableTextStorage *)self->_textStorage textContainer], "setSize:", self->_lineWidth, 0.0);
    textStorage = self->_textStorage;
  }

  return [(__NSImmutableTextStorage *)textStorage textContainer];
}

- (id)createRenderingContextForCharacterRange:(_NSRange)a3 typesetterBehavior:(int64_t)a4 usesScreenFonts:(BOOL)a5 hasStrongRight:(BOOL)a6 maximumWidth:(double)a7
{
  LOBYTE(v8) = 0;
  return -[NSSingleLineTypesetter createRenderingContextForCharacterRange:typesetterBehavior:usesScreenFonts:hasStrongRight:syncDirection:mirrorsTextAlignment:maximumWidth:](self, "createRenderingContextForCharacterRange:typesetterBehavior:usesScreenFonts:hasStrongRight:syncDirection:mirrorsTextAlignment:maximumWidth:", a3.location, a3.length, a4, a5, a6, 0, a7, v8);
}

- (_NSRange)glyphRangeForCharacterRange:(_NSRange)a3 actualCharacterRange:(_NSRange *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

@end
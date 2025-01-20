@interface NSATSTypesetter
+ (BOOL)_allowsScreenFontKerning;
+ (NSATSTypesetter)sharedInstance;
+ (NSATSTypesetter)sharedTypesetter;
+ (void)initialize;
- ($0177D170777CFC227CB001A659B5CD18)_allocateAuxData;
- ($500F09A0A86A1DC0979241A7D72823DF)_lineFragmentRectForProposedRectArgs;
- (BOOL)_baselineRenderingMode;
- (BOOL)_forceWordWrapping;
- (BOOL)_isBusy;
- (BOOL)_layoutLineFragmentStartingWithGlyphAtIndex:(unint64_t *)a3 characterIndex:(unint64_t *)a4 atPoint:(CGPoint *)a5 renderingContext:(id *)a6;
- (BOOL)_mirrorsTextAlignment;
- (BOOL)_usesScreenFonts;
- (BOOL)limitsLayoutForSuspiciousContents;
- (BOOL)shouldBreakLineByHyphenatingBeforeCharacterAtIndex:(NSUInteger)charIndex;
- (BOOL)shouldBreakLineByWordBeforeCharacterAtIndex:(NSUInteger)charIndex;
- (BOOL)synchronizesAlignmentToDirection;
- (NSATSTypesetter)init;
- (NSRect)boundingBoxForControlGlyphAtIndex:(NSUInteger)glyphIndex forTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(NSRect)proposedRect glyphPosition:(NSPoint)glyphPosition characterIndex:(NSUInteger)charIndex;
- (NSRect)lineFragmentRectForProposedRect:(NSRect)proposedRect remainingRect:(NSRectPointer)remainingRect;
- (NSUInteger)layoutParagraphAtPoint:(NSPoint *)lineFragmentOrigin;
- (UTF32Char)hyphenCharacterForGlyphAtIndex:(NSUInteger)glyphIndex;
- (_NSRange)layoutCharactersInRange:(_NSRange)a3 forLayoutManager:(id)a4 maximumNumberOfLineFragments:(unint64_t)a5;
- (__CTTypesetter)_ctTypesetter;
- (const)_bidiLevels;
- (double)baselineOffsetInLayoutManager:(id)a3 glyphIndex:(unint64_t)a4;
- (double)defaultTighteningFactor;
- (float)hyphenationFactorForGlyphAtIndex:(NSUInteger)glyphIndex;
- (id)_getATSTypesetterGuts;
- (id)_textContainerForAttachmentProtocol;
- (id)_textStorageForAttachmentProtocol;
- (id)paragraphArbitrator;
- (int64_t)_baseWritingDirection;
- (unint64_t)_sweepDirectionForGlyphAtIndex:(int64_t)a3;
- (unint64_t)actionForControlCharacterAtIndex:(unint64_t)a3;
- (unint64_t)lineBreakStrategy;
- (void)_doBidiProcessing;
- (void)_flushCachedObjects;
- (void)_setBaselineRenderingMode:(BOOL)a3;
- (void)_setBusy:(BOOL)a3;
- (void)_setForceWordWrapping:(BOOL)a3;
- (void)beginLineWithGlyphAtIndex:(unint64_t)a3;
- (void)beginParagraph;
- (void)dealloc;
- (void)endLineWithGlyphRange:(_NSRange)a3;
- (void)endParagraph;
- (void)layoutGlyphsInLayoutManager:(id)a3 startingAtGlyphIndex:(unint64_t)a4 maxNumberOfLineFragments:(unint64_t)a5 nextGlyphIndex:(unint64_t *)a6;
- (void)setDefaultTighteningFactor:(double)a3;
- (void)setLimitsLayoutForSuspiciousContents:(BOOL)a3;
- (void)setLineBreakStrategy:(unint64_t)a3;
@end

@implementation NSATSTypesetter

- ($0177D170777CFC227CB001A659B5CD18)_allocateAuxData
{
  result = ($0177D170777CFC227CB001A659B5CD18 *)NSAllocateScannedUncollectable();
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
  result->var0 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&self->attributedString;
  return result;
}

- (int64_t)_baseWritingDirection
{
  v3 = self->_private;
  if (!v3)
  {
    v3 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v3;
  }
  int v4 = v3[22] & 3;
  if (!v4)
  {
    [(NSATSTypesetter *)self _doBidiProcessing];
    int v4 = v3[22] & 3;
  }
  return v4 - 1;
}

- (void)_doBidiProcessing
{
  v3 = self->_private;
  if (!v3)
  {
    v3 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v3;
  }
  int64_t v4 = [(NSTypesetter *)self applicationFrameworkContext];
  if (![(NSTypesetter *)self bidiProcessingEnabled])
  {
    v14 = 0;
    NSWritingDirection v10 = NSWritingDirectionLeftToRight;
    goto LABEL_30;
  }
  v5 = (NSZone *)[(NSATSTypesetter *)self zone];
  NSWritingDirection v6 = +[NSParagraphStyle defaultWritingDirectionForLanguage:0];
  NSWritingDirection v7 = v6;
  unsigned int v8 = *(_DWORD *)(*((void *)v3 + 5) + 216);
  int v9 = (v8 >> 19) & 3;
  NSWritingDirection v10 = v9 - 1;
  if ((v8 & 0x8000) != 0 || v9 == 2)
  {
    [(NSTypesetter *)self paragraphCharacterRange];
    if (!v15)
    {
LABEL_17:
      v14 = 0;
      goto LABEL_26;
    }
    NSUInteger v13 = v15;
    if (v9)
    {
      v16 = 0;
      goto LABEL_22;
    }
LABEL_18:
    v17 = (unsigned __int8 *)NSZoneMalloc(v5, v13);
    v16 = v17;
    if (v4 == 2) {
      int v18 = v7;
    }
    else {
      int v18 = 0;
    }
    memset(v17, v18, v13);
LABEL_22:
    v14 = NSZoneMalloc(v5, v13);
    if ((CFAttributedStringGetBidiLevelsAndResolvedDirections() & 1) == 0)
    {
      NSZoneFree(v5, v14);
      v14 = 0;
    }
    if (v16)
    {
      NSWritingDirection v10 = (unint64_t)*v16;
      NSZoneFree(v5, v16);
      goto LABEL_30;
    }
LABEL_26:
    if (v9) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (v9) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v6 == NSWritingDirectionRightToLeft;
  }
  if (!v11) {
    goto LABEL_17;
  }
  [(NSTypesetter *)self paragraphCharacterRange];
  if (v12)
  {
    NSUInteger v13 = v12;
    goto LABEL_18;
  }
  v14 = 0;
LABEL_29:
  NSWritingDirection v10 = v7;
LABEL_30:
  *((_DWORD *)v3 + 22) = *((_DWORD *)v3 + 22) & 0xFFFFFFFC | ((_BYTE)v10 + 1) & 3;
  *((void *)v3 + 7) = v14;
  NSTextAlignment v19 = [(NSParagraphStyle *)self->currentParagraphStyle alignment];
  if ([(NSATSTypesetter *)self _mirrorsTextAlignment])
  {
    if (v19 == NSTextAlignmentRight)
    {
      uint64_t v20 = *((void *)v3 + 5);
      unsigned int v21 = *(_DWORD *)(v20 + 216) & 0xFFFFF87F;
      goto LABEL_39;
    }
    if (v19 == NSTextAlignmentLeft)
    {
      uint64_t v20 = *((void *)v3 + 5);
      unsigned int v21 = *(_DWORD *)(v20 + 216) & 0xFFFFF87F | 0x100;
LABEL_39:
      *(_DWORD *)(v20 + 216) = v21;
      [(NSATSTypesetter *)self synchronizesAlignmentToDirection];
      return;
    }
  }
  if ([(NSATSTypesetter *)self synchronizesAlignmentToDirection]
    && v19 == NSTextAlignmentNatural)
  {
    *(_DWORD *)(*((void *)v3 + 5) + 216) = *(_DWORD *)(*((void *)v3 + 5) + 216) & 0xFFFFF87F | ((v10 == NSWritingDirectionRightToLeft) << 8);
  }
}

- (void)setDefaultTighteningFactor:(double)a3
{
  v5 = (double *)self->_private;
  if (!v5)
  {
    v5 = (double *)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v5;
  }
  v5[8] = a3;
}

- (void)setLimitsLayoutForSuspiciousContents:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = self->_private;
  if (!v5)
  {
    v5 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v5;
  }
  if (v3) {
    int v6 = 4;
  }
  else {
    int v6 = 0;
  }
  v5[21] = v5[21] & 0xFFFFFFFB | v6;
}

- (void)beginParagraph
{
  BOOL v3 = (void **)self->_private;
  if (!v3)
  {
    BOOL v3 = (void **)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v3;
  }
  v5.receiver = self;
  v5.super_class = (Class)NSATSTypesetter;
  [(NSTypesetter *)&v5 beginParagraph];
  *((_DWORD *)v3 + 22) = 0;
  v3[3] = 0;
  v3[4] = 0;
  int64_t v4 = v3[12];
  if (v4)
  {
    CFRelease(v4);
    v3[12] = 0;
  }
  if (v3[7])
  {
    NSZoneFree((NSZone *)[(NSATSTypesetter *)self zone], v3[7]);
    v3[7] = 0;
  }
  if ((*((unsigned char *)v3[5] + 217) & 0x70) == 0
    && [(NSAttributedString *)self->attributedString _isStringDrawingTextStorage])
  {
    if ([(NSAttributedString *)self->attributedString _baselineMode]) {
      *((_DWORD *)v3[5] + 54) = *((_DWORD *)v3[5] + 54) & 0xFFFF87FF | 0x1000;
    }
  }
}

- (void)endParagraph
{
  BOOL v3 = self->_private;
  if (!v3)
  {
    BOOL v3 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v3;
  }
  v5.receiver = self;
  v5.super_class = (Class)NSATSTypesetter;
  [(NSTypesetter *)&v5 endParagraph];
  int64_t v4 = (const void *)*((void *)v3 + 12);
  if (v4)
  {
    CFRelease(v4);
    *((void *)v3 + 12) = 0;
  }
  if (*((void *)v3 + 7))
  {
    NSZoneFree((NSZone *)[(NSATSTypesetter *)self zone], *((void **)v3 + 7));
    *((void *)v3 + 7) = 0;
  }
  -[NSATSLineFragment _invalidate](*((void *)v3 + 1));
  -[NSATSGlyphStorage _invalidate](*((void **)v3 + 2));
  if ((*(_DWORD *)(*((void *)v3 + 5) + 216) & 0x7800) == 0x1000
    && [(NSAttributedString *)self->attributedString _isStringDrawingTextStorage])
  {
    if ([(NSAttributedString *)self->attributedString _baselineMode]) {
      *(_DWORD *)(*((void *)v3 + 5) + 216) = *(_DWORD *)(*((void *)v3 + 5) + 216) & 0xFFFF87FF | (([(NSParagraphStyle *)self->currentParagraphStyle lineBreakMode] & 0xF) << 11);
    }
  }
}

- (void)_flushCachedObjects
{
  BOOL v3 = self->_private;
  if (!v3)
  {
    BOOL v3 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v3;
  }
  CFStringRef v4 = (const __CFString *)v3[2];

  -[NSATSGlyphStorage _flushCachedObjects](v4);
}

- (BOOL)limitsLayoutForSuspiciousContents
{
  BOOL v3 = (unsigned __int8 *)self->_private;
  if (!v3)
  {
    BOOL v3 = (unsigned __int8 *)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v3;
  }
  return (v3[84] >> 2) & 1;
}

- (const)_bidiLevels
{
  BOOL v3 = (const char **)self->_private;
  if (!v3)
  {
    BOOL v3 = (const char **)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v3;
  }
  if (((_BYTE)v3[11] & 3) == 0) {
    [(NSATSTypesetter *)self _doBidiProcessing];
  }
  return v3[7];
}

- (double)defaultTighteningFactor
{
  BOOL v3 = (double *)self->_private;
  if (!v3)
  {
    BOOL v3 = (double *)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v3;
  }
  return v3[8];
}

- (__CTTypesetter)_ctTypesetter
{
  BOOL v3 = self->_private;
  if (!v3)
  {
    BOOL v3 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v3;
  }
  result = (__CTTypesetter *)*((void *)v3 + 12);
  if (!result)
  {
    uint64_t v5 = [(NSTypesetter *)self paragraphCharacterRange];
    uint64_t v7 = v6;
    unsigned int v8 = (NSATSGlyphStorage *)*((void *)v3 + 2);
    if (!v8)
    {
      unsigned int v8 = +[NSATSGlyphStorage allocWithZone:[(NSATSTypesetter *)self zone]];
      if (v8)
      {
        v9.receiver = v8;
        v9.super_class = (Class)NSATSGlyphStorage;
        unsigned int v8 = [(NSATSTypesetter *)&v9 init];
        if (v8) {
          v8->_typesetter = self;
        }
      }
      *((void *)v3 + 2) = v8;
    }
    -[NSATSGlyphStorage setGlyphRange:characterRange:]((id *)&v8->super.super.isa, self->paragraphGlyphRange.location, self->paragraphGlyphRange.length, v5, v7);
    result = (__CTTypesetter *)-[NSATSGlyphStorage createCTTypesetter](*((void *)v3 + 2));
    *((void *)v3 + 12) = result;
  }
  return result;
}

- (id)_getATSTypesetterGuts
{
  id result = self->_private;
  if (!result)
  {
    id result = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = result;
  }
  return result;
}

- (void)_setBaselineRenderingMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = self->_private;
  if (!v5)
  {
    uint64_t v5 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v5;
  }
  if (v3) {
    int v6 = 8;
  }
  else {
    int v6 = 0;
  }
  v5[21] = v5[21] & 0xFFFFFFF7 | v6;
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    __NSATSTypesetterClass = objc_opt_class();
    __NSRaiseWithRecursiveLayoutRequest = [v5 BOOLForKey:@"_NSRaiseWithRecursiveLayoutRequest"];
    __NSAllowsScreenFontKerning = [v5 BOOLForKey:@"_NSAllowsScreenFontKerning"];
    __NSATSTypesetterSharedInstance = [objc_allocWithZone((Class)NSATSTypesetter) init];
  }
  else if (!__NSLineFragmentRectIMP && objc_opt_class() != __NSATSTypesetterClass)
  {
    uint64_t v3 = [(id)__NSATSTypesetterClass instanceMethodForSelector:sel_lineFragmentRectForProposedRect_remainingRect_];
    if ([(id)objc_opt_class() instanceMethodForSelector:sel_lineFragmentRectForProposedRect_remainingRect_] != v3)
    {
      uint64_t v4 = objc_opt_class();
      NSLog((NSString *)@"Detected an NSATSTypesetter subclass %@ implementing a deprecated interface, -lineFragmentRectForProposedRect:remainingRect:.  NSATSTypesetter is running in backward compatibility mode.  Developers are recommended to use -getLineFragmentRect:usedRect:remainingRect:forStartingGlyphAtIndex:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter: instead.", v4);
      __NSLineFragmentRectIMP = v3;
    }
  }
}

- (NSATSTypesetter)init
{
  v5.receiver = self;
  v5.super_class = (Class)NSATSTypesetter;
  uint64_t v2 = [(NSATSTypesetter *)&v5 init];
  uint64_t v3 = v2;
  if (v2 && !v2->_private) {
    v2->_private = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)v2 zone]), v2);
  }
  return v3;
}

- (BOOL)_layoutLineFragmentStartingWithGlyphAtIndex:(unint64_t *)a3 characterIndex:(unint64_t *)a4 atPoint:(CGPoint *)a5 renderingContext:(id *)a6
{
  int v6 = a5;
  NSWritingDirection v10 = (NSATSLineFragment **)self->_private;
  if (!v10)
  {
    int v6 = a5;
    NSWritingDirection v10 = (NSATSLineFragment **)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v10;
  }
  BOOL v11 = [(NSAttributedString *)self->attributedString string];
  memset(&v179, 0, sizeof(v179));
  CGSize v142 = *(CGSize *)(MEMORY[0x1E4F28AD8] + 16);
  CGPoint v143 = (CGPoint)*MEMORY[0x1E4F28AD8];
  long long v177 = *MEMORY[0x1E4F28AD8];
  CGSize v178 = v142;
  memset(&v176, 0, sizeof(v176));
  v136 = a3;
  v137 = a4;
  unint64_t location = *a3;
  unint64_t v174 = 0;
  unint64_t v175 = 0;
  unint64_t v13 = *a4;
  uint64_t v14 = [(NSTypesetter *)self paragraphCharacterRange];
  uint64_t v159 = v15;
  uint64_t v161 = v14;
  uint64_t bRect = [(NSTypesetter *)self paragraphSeparatorCharacterRange];
  uint64_t v147 = v16;
  int64_t v144 = [(NSATSTypesetter *)self _baseWritingDirection];
  unint64_t flags = v10[5][1]._flags;
  NSTypesetterBehavior v153 = [(NSTypesetter *)self typesetterBehavior];
  double v172 = 0.0;
  double v173 = 0.0;
  double v170 = 0.0;
  double v171 = 0.0;
  v155 = v11;
  unint64_t v140 = [(NSString *)v11 length];
  BOOL v152 = [(NSATSTypesetter *)self _baselineRenderingMode];
  double y = v6->y;
  double x = v6->x;
  v138 = v6;
  NSTextAlignment v19 = [(NSAttributedString *)self->attributedString attributesAtIndex:v13 effectiveRange:0];
  int64_t v20 = [(NSTextContainer *)[(NSTypesetter *)self currentTextContainer] layoutOrientation];
  unsigned int v21 = self->_private;
  if (!v21)
  {
    unsigned int v21 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v21;
  }
  v22 = (double *)v21[5];
  NSTypesetterBehavior v23 = [(NSTypesetter *)self typesetterBehavior];
  BOOL v24 = [(NSTypesetter *)self _forceOriginalFontBaseline];
  if (!v19) {
    goto LABEL_12;
  }
  if (!v24 || (id v25 = [(NSDictionary *)v19 objectForKey:_NSOriginalFontAttributeName]) == 0) {
    id v25 = [(NSDictionary *)v19 objectForKey:@"NSFont"];
  }
  if (objc_msgSend(-[NSDictionary objectForKey:](v19, "objectForKey:", @"CTVerticalForms"), "BOOLValue"))id v25 = (id)objc_msgSend(v25, "verticalFont"); {
  if (!v25)
  }
LABEL_12:
    id v25 = (id)NSDefaultFont();
  uint64_t v26 = (uint64_t)v25;
  if (v20) {
    uint64_t v26 = [v25 verticalFont];
  }
  if (v26) {
    v27 = (void *)v26;
  }
  else {
    v27 = v25;
  }
  [v27 _defaultLineHeightForUILayout];
  double v29 = v28 + 0.0;
  if (location && ([(NSTypesetter *)self usesFontLeading] || CTFontIsSystemUIFont()))
  {
    [v27 _leading];
    if (v30 >= 0.0) {
      double v30 = -0.0;
    }
    double v29 = v29 + v30;
  }
  if (v23 >= NSTypesetterBehavior_10_3)
  {
    double v31 = v22[13];
    if (v31 > 0.0) {
      double v29 = v29 * v31;
    }
  }
  double v32 = v22[11];
  double v33 = v22[12];
  if (v29 >= v32) {
    double v32 = v29;
  }
  if (v32 > v33 && v33 > 0.0) {
    double v32 = v22[12];
  }
  char v35 = v152;
  if (v23 < NSTypesetterBehavior_10_2) {
    char v35 = 1;
  }
  if ((v35 & 1) == 0)
  {
    double v36 = v22[8];
    BOOL v37 = v36 < 0.0;
    double v38 = v32 + v36;
    if (v37) {
      double v32 = v38;
    }
  }
  if (v32 <= 0.0) {
    double v39 = 0.001;
  }
  else {
    double v39 = v32;
  }
  v40 = [(NSAttributedString *)self->attributedString string];
  if ((uint64_t)v13 < 1) {
    goto LABEL_54;
  }
  v41 = v40;
  if (v13 == 1)
  {
    unint64_t v42 = 0;
  }
  else
  {
    int v43 = [(NSString *)v40 characterAtIndex:v13 - 1];
    unint64_t v42 = v13 - 1;
    if (v43 == 10)
    {
      if ([(NSString *)v41 characterAtIndex:v13 - 2] == 13) {
        unint64_t v42 = v13 - 2;
      }
      else {
        unint64_t v42 = v13 - 1;
      }
    }
  }
  char v44 = [(NSATSTypesetter *)self actionForControlCharacterAtIndex:v42];
  if ((v44 & 0x10) != 0 || v153 <= NSTypesetterBehavior_10_3 && (v44 & 0x20) != 0)
  {
LABEL_54:
    BOOL v45 = 1;
  }
  else
  {
    v113 = [(NSTypesetter *)self attributedString];
    v168.origin = 0uLL;
    id v114 = [(NSAttributedString *)v113 attribute:@"NSAttachment" atIndex:v13 - 1 effectiveRange:&v168];
    if (*(void *)&v168.origin.y + *(void *)&v168.origin.x > v13 || !v114)
    {
      if ([(NSString *)v41 length] <= v13)
      {
        id v114 = 0;
      }
      else
      {
        id v114 = [(NSAttributedString *)v113 attribute:@"NSAttachment" atIndex:v13 effectiveRange:&v168];
        if (*(void *)&v168.origin.y + *(void *)&v168.origin.x > v13) {
          id v114 = 0;
        }
      }
    }
    BOOL v45 = [v114 embeddingType] == 1;
  }
  NSUInteger v151 = 0;
  unint64_t v154 = 0;
  double v170 = 0.0;
  BOOL v47 = v153 > NSTypesetterBehavior_10_3 && v144 == 1;
  BOOL v149 = v47;
  BOOL v148 = v45;
  BOOL v48 = v153 > NSTypesetterBehavior_10_2 && v45;
  BOOL v145 = v48;
  unint64_t v146 = v161 + v159;
  uint64_t v139 = v161 + v159 + 1;
  uint64_t v134 = bRect + v147 - 1;
  unint64_t v141 = bRect + v147;
  uint64_t v133 = bRect + v147 - 2;
  CGFloat v49 = *MEMORY[0x1E4F28AD8];
  CGFloat v160 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  CGFloat v162 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  CGFloat bRecta = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  char v50 = 1;
  double v51 = 10000000.0;
  double v52 = 0.0;
  double v150 = 0.0;
  double v53 = 0.0;
  double v54 = 0.0;
  double v55 = 0.0;
  CGFloat v156 = *MEMORY[0x1E4F28AD8];
  do
  {
    [(NSATSTypesetter *)self beginLineWithGlyphAtIndex:location];
    unint64_t currentTextContainerIndex = self->currentTextContainerIndex;
    currentTextContainer = self->currentTextContainer;
    CGSize currentTextContainerSize = self->currentTextContainerSize;
    -[NSTypesetter getLineFragmentRect:usedRect:remainingRect:forStartingGlyphAtIndex:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter:](self, "getLineFragmentRect:usedRect:remainingRect:forStartingGlyphAtIndex:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter:", &v179, 0, &v176, location, x, y, v51, v39, v55, v53, v54);
    if (v179.size.width != 0.0)
    {
      double v52 = v179.size.width + self->lineFragmentPadding * -2.0;
      if (v149)
      {
        v59 = v10[5];
        double elasticRangeWidth = v59->_elasticRangeWidth;
        if (elasticRangeWidth <= 0.0) {
          double v61 = -elasticRangeWidth;
        }
        else {
          double v61 = v52 - elasticRangeWidth;
        }
        if (v148) {
          [(NSParagraphStyle *)self->currentParagraphStyle firstLineHeadIndent];
        }
        else {
          double v62 = *(double *)&v59->_elasticCharIndex;
        }
        double v66 = v52 - v62;
        goto LABEL_92;
      }
      if (v153 > NSTypesetterBehavior_10_2_WithCompatibility)
      {
        if (!v148)
        {
          v63 = v10[5];
LABEL_89:
          double v61 = *(double *)&v63->_elasticCharIndex;
LABEL_90:
          double v66 = v10[5]->_elasticRangeWidth;
          if (v66 <= 0.0) {
            double v66 = v52 + v66;
          }
LABEL_92:
          if (v66 <= v52)
          {
            if (v66 < 0.0) {
              double v52 = 0.0;
            }
            else {
              double v52 = v66;
            }
          }
          double v68 = 0.0;
          if (v61 >= 0.0)
          {
            double v68 = v61;
            if (v61 > v52) {
              double v68 = v52;
            }
          }
          v69 = v10[1];
          CGFloat v49 = v156;
          if (!v69)
          {
            double v70 = v52;
            double v71 = v39;
            double v72 = v54;
            double v73 = v53;
            double v74 = v55;
            double v75 = y;
            double v76 = v51;
            double v77 = v68;
            v69 = +[NSATSLineFragment allocWithZone:[(NSATSTypesetter *)self zone]];
            if (v69) {
              v69->_typesetter = self;
            }
            v10[1] = v69;
            double v68 = v77;
            double v51 = v76;
            double y = v75;
            double v55 = v74;
            double v53 = v73;
            double v54 = v72;
            double v39 = v71;
            double v52 = v70;
            CGFloat v49 = v156;
          }
          double v150 = v68;
          -[NSATSLineFragment layoutForStartingGlyphAtIndex:characterIndex:minPosition:maxPosition:lineFragmentRect:]((CFIndex)v69, v68, v52, v179.origin.x, v179.origin.y, v179.size.width, v179.size.height, v58, v13);
          v78 = v10[1];
          if (v78)
          {
            unint64_t location = v78->_glyphRange.location;
            NSUInteger length = v78->_glyphRange.length;
            unint64_t v13 = v78->_characterRange.location;
            NSUInteger v80 = v78->_characterRange.length;
          }
          else
          {
            unint64_t location = 0;
            NSUInteger length = 0;
            NSUInteger v80 = 0;
            unint64_t v13 = 0;
          }
          -[NSATSLineFragment getTypographicLineHeight:baselineOffset:leading:]((unint64_t)v78, &v179.size.height, &v171, &v170);
          *((void *)&v177 + 1) = *(void *)&v179.origin.y;
          v178.CGFloat height = v179.size.height;
          unint64_t v154 = length;
          NSUInteger v151 = v80;
          if (v152) {
            goto LABEL_165;
          }
          if (v153 <= NSTypesetterBehavior_10_2_WithCompatibility)
          {
            double v55 = v170;
          }
          else
          {
            double maxPosition = v10[5]->_maxPosition;
            double v55 = v170;
            if (maxPosition < 0.0)
            {
              double v55 = maxPosition + v170;
              double v170 = v55;
              if (v55 < 0.0)
              {
                if (!v148)
                {
                  double v82 = v179.size.height + v55;
                  v179.size.CGFloat height = v82;
                  double v83 = v55 + v171;
                  double v171 = v55 + v171;
                  if (v82 <= 0.0)
                  {
                    double v171 = v83 - v82;
                    v179.size.CGFloat height = 0.001;
                  }
                }
                double v170 = 0.0;
                double v55 = 0.0;
              }
            }
          }
          [(NSTypesetter *)self lineSpacingAfterGlyphAtIndex:location + length - 1 withProposedLineFragmentRect:v179.origin.x];
          if (v55 < v84) {
            double v55 = v84;
          }
          double v54 = 0.0;
          double v53 = 0.0;
          if (v145)
          {
            -[NSTypesetter paragraphSpacingBeforeGlyphAtIndex:withProposedLineFragmentRect:](self, "paragraphSpacingBeforeGlyphAtIndex:withProposedLineFragmentRect:", self->paragraphGlyphRange.location, *(_OWORD *)&v179.origin, *(_OWORD *)&v179.size);
            double v53 = v85;
          }
          if (v147 && v13 + v80 >= v146)
          {
            if (*((unsigned char *)v10 + 84))
            {
              -[NSATSTypesetter paragraphSpacingAfterCharactersInRange:withProposedLineFragmentRect:](self, "paragraphSpacingAfterCharactersInRange:withProposedLineFragmentRect:", v13, v139 - v13, *(_OWORD *)&v179.origin, *(_OWORD *)&v179.size);
LABEL_143:
              double v54 = v87;
              goto LABEL_144;
            }
            if (v141 <= v140)
            {
              if ((uint64_t)v141 < 1) {
                goto LABEL_142;
              }
              if (v141 == 1)
              {
                uint64_t v86 = 0;
              }
              else
              {
                int v88 = [(NSString *)v155 characterAtIndex:v134];
                uint64_t v86 = v134;
                if (v88 == 10)
                {
                  if ([(NSString *)v155 characterAtIndex:v133] == 13) {
                    uint64_t v86 = v133;
                  }
                  else {
                    uint64_t v86 = v134;
                  }
                }
              }
              char v89 = [(NSATSTypesetter *)self actionForControlCharacterAtIndex:v86];
              if ((v89 & 0x10) != 0 || v153 <= NSTypesetterBehavior_10_3 && (v89 & 0x20) != 0) {
                goto LABEL_142;
              }
              v90 = [(NSTypesetter *)self attributedString];
              v168.origin = 0uLL;
              id v91 = [(NSAttributedString *)v90 attribute:@"NSAttachment" atIndex:v134 effectiveRange:&v168];
              if (*(void *)&v168.origin.y + *(void *)&v168.origin.x > v141 || !v91)
              {
                if ([(NSString *)v155 length] <= v141)
                {
                  id v91 = 0;
                }
                else
                {
                  id v91 = -[NSAttributedString attribute:atIndex:effectiveRange:](v90, "attribute:atIndex:effectiveRange:", @"NSAttachment");
                  if (*(void *)&v168.origin.y + *(void *)&v168.origin.x > v141) {
                    id v91 = 0;
                  }
                }
              }
              if ([v91 embeddingType] == 1)
              {
LABEL_142:
                -[NSTypesetter paragraphSpacingAfterGlyphAtIndex:withProposedLineFragmentRect:](self, "paragraphSpacingAfterGlyphAtIndex:withProposedLineFragmentRect:", self->paragraphSeparatorGlyphRange.location + self->paragraphSeparatorGlyphRange.length - 1, *(_OWORD *)&v179.origin, *(_OWORD *)&v179.size);
                goto LABEL_143;
              }
            }
          }
LABEL_144:
          if (v55 <= 0.0 && v53 <= 0.0 && v54 <= 0.0 && v179.size.height == v39) {
            goto LABEL_165;
          }
          long long v166 = 0u;
          long long v167 = 0u;
          memset(&v165, 0, sizeof(v165));
          double lineFragmentPadding = self->lineFragmentPadding;
          v93.double y = v179.origin.y;
          v168.size.CGFloat height = v179.size.height;
          v93.double x = x;
          v168.origin = v93;
          v168.size.double width = v51;
          -[NSTypesetter getLineFragmentRect:usedRect:remainingRect:forStartingGlyphAtIndex:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter:](self, "getLineFragmentRect:usedRect:remainingRect:forStartingGlyphAtIndex:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter:", &v168, &v166, &v165, location);
          CGFloat height = v168.size.height;
          if (v168.size.width != 0.0
            && v168.size.height != 0.0
            && v179.size.width == v168.size.width
            && lineFragmentPadding == self->lineFragmentPadding)
          {
            NSRect v179 = v168;
            *((void *)&v177 + 1) = *((void *)&v166 + 1);
            v178.CGFloat height = *((CGFloat *)&v167 + 1);
            NSRect v176 = v165;
            CGFloat v49 = v156;
            goto LABEL_165;
          }
          if (v179.size.height <= v39)
          {
            if (v168.size.height <= v39)
            {
              CGFloat v96 = v168.origin.y;
              if (v168.origin.y == v179.origin.y
                || (v97 = v168.origin.x, double width = 10000000.0, v179.size.width == v168.size.width)
                && lineFragmentPadding == self->lineFragmentPadding)
              {
LABEL_164:
                CGFloat v49 = v156;
                v185.origin.double x = v156;
                v185.size.double width = v160;
                v185.origin.double y = v162;
                v185.size.CGFloat height = bRecta;
                if (!NSEqualRects(v179, v185)) {
                  goto LABEL_168;
                }
                goto LABEL_165;
              }
            }
            else
            {
              if (v50 & 1 | (v168.size.width >= v179.size.width)) {
                double width = v51;
              }
              else {
                double width = v168.size.width;
              }
              CGFloat height = v179.size.height;
              CGFloat v96 = y;
              CGFloat v97 = x;
              char v50 = 0;
            }
          }
          else
          {
            CGFloat height = v179.size.height;
            double width = v51;
            CGFloat v96 = y;
            CGFloat v97 = x;
          }
          v179.origin = v143;
          v179.size = v142;
          double v39 = height;
          double v51 = width;
          double y = v96;
          double x = v97;
          goto LABEL_164;
        }
      }
      else
      {
        v63 = v10[5];
        int v64 = (*(_DWORD *)&v63[1]._flags >> 7) & 0xF;
        BOOL v65 = v64 == 3 || v64 == 0;
        if (!v65 || !v148) {
          goto LABEL_89;
        }
      }
      [(NSParagraphStyle *)self->currentParagraphStyle firstLineHeadIndent];
      double v61 = v67;
      goto LABEL_90;
    }
    if (v39 + y <= self->currentTextContainerSize.height
      || -[NSString characterAtIndex:](v155, "characterAtIndex:", v13, v39 + y) != 65532
      || ![(NSAttributedString *)self->attributedString attribute:@"NSAttachment" atIndex:v13 effectiveRange:0])
    {
LABEL_168:
      self->currentTextContainer = 0;
      return 0;
    }
    char v50 = 0;
    double v39 = self->currentTextContainerSize.height - y;
    self->unint64_t currentTextContainerIndex = currentTextContainerIndex;
    self->currentTextContainer = currentTextContainer;
    self->CGSize currentTextContainerSize = currentTextContainerSize;
LABEL_165:
    v186.origin.double x = v49;
    v186.size.double width = v160;
    v186.origin.double y = v162;
    v186.size.CGFloat height = bRecta;
  }
  while (NSEqualRects(v179, v186));
  double v172 = v52;
  double v173 = v150;
  uint64_t v99 = (flags >> 7) & 0xF;
  if (((flags >> 7) & 0xF) == 3)
  {
    NSWritingDirection v100 = v144;
    if (![(NSATSTypesetter *)self synchronizesAlignmentToDirection]) {
      NSWritingDirection v100 = ((*(_DWORD *)&v10[5][1]._flags >> 19) & 3) - 1;
    }
    if (v13 + v151 < v146) {
      -[NSATSLineFragment justifyWithFactor:]((uint64_t)v10[1], 1.0);
    }
    if (v100 == NSWritingDirectionNatural) {
      NSWritingDirection v100 = +[NSParagraphStyle defaultWritingDirectionForLanguage:0];
    }
    uint64_t v99 = 2 * (v100 == NSWritingDirectionRightToLeft);
  }
  v101 = v10[1];
  if (v101)
  {
    double v102 = v101->_elasticRangeWidth;
    CGRect BoundsWithOptions = CTLineGetBoundsWithOptions((CTLineRef)v101->_line, 0);
    double v103 = BoundsWithOptions.size.width + v101->_hyphenGlyphWidth - v102;
    uint64_t v104 = (uint64_t)v10[1];
  }
  else
  {
    uint64_t v104 = 0;
    double v103 = 0.0;
  }
  v178.double width = v103;
  -[NSATSLineFragment resolveOpticalAlignmentUpdatingMinPosition:maxPosition:](v104, &v173, &v172);
  double v105 = v179.size.width;
  if (v179.size.width >= 10000000.0 || (double v105 = v172 - v173, v103 >= v172 - v173)) {
    uint64_t v99 = 0;
  }
  v106 = v10[1];
  if (!v106
    || (*(unsigned char *)&v106->_flags & 8) == 0
    || ((v107 = [(NSTypesetter *)self attributedString], (v108 = v10[1]) == 0)
      ? (NSUInteger v109 = 0)
      : (NSUInteger v109 = v108->_characterRange.location),
        (id v110 = [(NSAttributedString *)v107 attribute:@"NSAttachment" atIndex:v109 effectiveRange:0]) == 0))
  {
LABEL_190:
    if (v99 == 1) {
      goto LABEL_199;
    }
    if (v99 == 2) {
      goto LABEL_192;
    }
LABEL_204:
    double v112 = v173;
    goto LABEL_205;
  }
  uint64_t v111 = [v110 standaloneAlignment];
  if (!v111)
  {
    uint64_t v99 = 0;
    goto LABEL_204;
  }
  if (v111 == 1)
  {
LABEL_199:
    double v112 = v173 + (v172 - (v103 + v173)) * 0.5;
    goto LABEL_200;
  }
  if (v111 != 2) {
    goto LABEL_190;
  }
LABEL_192:
  double v112 = v172 - v103;
LABEL_200:
  uint64_t v99 = 1;
LABEL_205:
  uint64_t v115 = (uint64_t)v10[1];
  if (v115)
  {
    double v116 = *(double *)(v115 + 80);
    if (v116 > 0.0)
    {
      double v103 = v116 + v103;
      if (v144 == 1 || *(void *)(v115 + 40) == *(void *)(v115 + 72))
      {
        if (v112 != v172 && v103 <= v116) {
          double v116 = 0.0;
        }
        double v112 = v112 - v116;
      }
    }
  }
  double v164 = v112;
  if (v153 > NSTypesetterBehavior_10_2_WithCompatibility || v99)
  {
    double v118 = v173;
    if (v112 + *(double *)&v177 >= v173)
    {
      double v118 = v112 + *(double *)&v177;
    }
    else
    {
      double v103 = v103 - (v173 - (v112 + *(double *)&v177));
LABEL_222:
      *(double *)&long long v177 = v118;
    }
  }
  else
  {
    if (v112 < 0.0)
    {
      double v118 = v112 + *(double *)&v177;
      goto LABEL_222;
    }
    double v103 = v112 + v103;
    double v118 = *(double *)&v177;
  }
  if (v172 < v118 + v103)
  {
    double v103 = v103 - (v118 + v103 - v172);
    v178.double width = v103;
  }
  double v119 = v118 + v179.origin.x;
  double v120 = v103 + self->lineFragmentPadding * 2.0;
  unint64_t v174 = location;
  unint64_t v175 = v154;
  if (!a6)
  {
    -[NSATSLineFragment saveMorphedGlyphs:](v115, (uint64_t)&v174);
    unint64_t v121 = v175;
    unint64_t v122 = v175 - v154;
    if (v175 > v154)
    {
      self->paragraphSeparatorGlyphRange.location += v122;
      self->paragraphGlyphRange.length += v122;
      unint64_t v154 = v121;
    }
  }
  CGFloat v123 = *((double *)&v177 + 1);
  double v124 = v178.height;
  v181.origin.double x = v119;
  v181.origin.double y = *((CGFloat *)&v177 + 1);
  v181.size.double width = v120;
  v181.size.CGFloat height = v178.height;
  NSRect v182 = NSIntersectionRect(v181, v179);
  CGFloat v125 = v182.origin.x;
  double v126 = v182.origin.y;
  double v127 = v182.size.width;
  double v128 = v182.size.height;
  if (NSIsEmptyRect(v182))
  {
    if (v120 == 0.0)
    {
      v178.double width = 1.0;
      double v120 = 1.0;
    }
    if (v124 == 0.0)
    {
      v178.CGFloat height = 1.0;
      double v124 = 1.0;
    }
    v183.origin.double x = v119;
    v183.origin.double y = v123;
    v183.size.double width = v120;
    v183.size.CGFloat height = v124;
    NSRect v184 = NSIntersectionRect(v183, v179);
    CGFloat v125 = v184.origin.x;
    double v126 = v184.origin.y;
    if (v120 == 0.0) {
      double v127 = 1.0;
    }
    else {
      double v127 = v184.size.width;
    }
    if (v124 == 0.0) {
      double v128 = 1.0;
    }
    else {
      double v128 = v184.size.height;
    }
  }
  *(CGFloat *)&long long v177 = v125;
  *((double *)&v177 + 1) = v126;
  v178.double width = v127;
  v178.CGFloat height = v128;
  unint64_t v129 = v13 + v151;
  if (v13 + v151 >= v146) {
    v154 += self->paragraphSeparatorGlyphRange.length;
  }
  double v171 = v171 + v126 - v179.origin.y;
  if ((*((unsigned char *)v10 + 84) & 2) != 0) {
    -[NSATSTypesetter willSetLineFragmentRect:forGlyphRange:usedRect:baselineOffset:](self, "willSetLineFragmentRect:forGlyphRange:usedRect:baselineOffset:", &v179, location, v154, &v177, &v171);
  }
  if (-[NSTypesetter finalizeLineFragmentRect:lineFragmentUsedRect:baselineOffset:forGlyphRange:](self, "finalizeLineFragmentRect:lineFragmentUsedRect:baselineOffset:forGlyphRange:", &v179, &v177, &v171, location, v154))
  {
    v176.origin = v143;
    v176.size = v142;
  }
  -[NSTypesetter setLineFragmentRect:forGlyphRange:usedRect:baselineOffset:](self, "setLineFragmentRect:forGlyphRange:usedRect:baselineOffset:", location, v154, *(_OWORD *)&v179.origin, *(_OWORD *)&v179.size, v177, v178, *(void *)&v171);
  if (a6)
  {
    if (v129 >= v146) {
      *a6 = (id)-[NSATSLineFragment _copyRenderingContextWithGlyphOrigin:]((uint64_t)v10[1], v164);
    }
  }
  else
  {
    if ([(NSAttributedString *)self->attributedString _isStringDrawingTextStorage])
    {
      [(NSAttributedString *)self->attributedString _setBaselineDelta:v171];
      v130 = v10[1];
      if (v130)
      {
        if ((*(unsigned char *)&v130->_flags & 0x10) != 0) {
          [(NSAttributedString *)self->attributedString _setWrappedByCluster:1];
        }
      }
    }
    -[NSATSLineFragment saveWithGlyphOrigin:]((uint64_t)v10[1], v164);
    if (v129 >= v146)
    {
      if (v144 == 1) {
        double v131 = *(double *)&v177 - v179.origin.x + self->lineFragmentPadding;
      }
      else {
        double v131 = *(double *)&v177 + v178.width - v179.origin.x - self->lineFragmentPadding;
      }
      -[NSTypesetter setLocation:withAdvancements:forStartOfGlyphRange:](self, "setLocation:withAdvancements:forStartOfGlyphRange:", 0, self->paragraphSeparatorGlyphRange.location, self->paragraphSeparatorGlyphRange.length, v131, 0.0);
      -[NSTypesetter setNotShownAttribute:forGlyphRange:](self, "setNotShownAttribute:forGlyphRange:", 1, self->paragraphSeparatorGlyphRange.location, self->paragraphSeparatorGlyphRange.length);
      unint64_t v129 = v151 + v147 + v13;
    }
  }
  -[NSATSTypesetter endLineWithGlyphRange:](self, "endLineWithGlyphRange:", location, v154);
  unint64_t *v136 = v154 + location;
  unint64_t *v137 = v129;
  v187.origin.double x = v156;
  v187.size.double width = v160;
  v187.origin.double y = v162;
  v187.size.CGFloat height = bRecta;
  if (NSEqualRects(v176, v187))
  {
    CGFloat v132 = v179.origin.y + v179.size.height;
    v138->double x = 0.0;
    v138->double y = v132;
  }
  else
  {
    CGPoint *v138 = v176.origin;
  }
  return 1;
}

- (void)endLineWithGlyphRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  int v6 = self->_private;
  if (!v6)
  {
    int v6 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v6;
  }
  v7.receiver = self;
  v7.super_class = (Class)NSATSTypesetter;
  -[NSTypesetter endLineWithGlyphRange:](&v7, sel_endLineWithGlyphRange_, location, length);
  v6[3] = 0;
  v6[4] = 0;
}

- (void)beginLineWithGlyphAtIndex:(unint64_t)a3
{
  objc_super v5 = self->_private;
  if (!v5)
  {
    objc_super v5 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v5;
  }
  v12.receiver = self;
  v12.super_class = (Class)NSATSTypesetter;
  [(NSTypesetter *)&v12 beginLineWithGlyphAtIndex:a3];
  textContainers = self->textContainers;
  if (textContainers)
  {
    if (v5[3] == a3 && (unint64_t v7 = v5[4], v7 != self->currentTextContainerIndex))
    {
      if (v7 < [(NSArray *)textContainers count])
      {
        self->unint64_t currentTextContainerIndex = v5[4];
        unsigned int v8 = -[NSArray objectAtIndex:](self->textContainers, "objectAtIndex:");
        self->currentTextContainer = v8;
        [(NSTextContainer *)v8 size];
        self->currentTextContainerSize.double width = v10;
        self->currentTextContainerSize.CGFloat height = v9;
        if (v10 <= 0.0) {
          self->currentTextContainerSize.double width = 10000000.0;
        }
        if (v9 <= 0.0) {
          self->currentTextContainerSize.CGFloat height = 10000000.0;
        }
        [(NSTextContainer *)self->currentTextContainer lineFragmentPadding];
        self->double lineFragmentPadding = v11;
      }
    }
    else
    {
      v5[3] = a3;
      v5[4] = self->currentTextContainerIndex;
    }
  }
}

- (BOOL)_baselineRenderingMode
{
  uint64_t v3 = (unsigned __int8 *)self->_private;
  if (!v3)
  {
    uint64_t v3 = (unsigned __int8 *)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v3;
  }
  return (v3[84] >> 3) & 1;
}

+ (NSATSTypesetter)sharedInstance
{
  uint64_t v2 = objc_opt_class();
  if (v2 != objc_opt_class()) {
    NSRequestConcreteImplementation();
  }
  return (NSATSTypesetter *)__NSATSTypesetterSharedInstance;
}

+ (NSATSTypesetter)sharedTypesetter
{
  return (NSATSTypesetter *)[(id)__NSATSTypesetterClass sharedInstance];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSATSTypesetter;
  [(NSTypesetter *)&v3 dealloc];
}

+ (BOOL)_allowsScreenFontKerning
{
  return __NSAllowsScreenFontKerning;
}

- (BOOL)_forceWordWrapping
{
  objc_super v3 = (unsigned __int8 *)self->_private;
  if (!v3)
  {
    objc_super v3 = (unsigned __int8 *)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v3;
  }
  return (v3[84] >> 4) & 1;
}

- (void)_setForceWordWrapping:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = self->_private;
  if (!v5)
  {
    objc_super v5 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v5;
  }
  if (v3) {
    int v6 = 16;
  }
  else {
    int v6 = 0;
  }
  v5[21] = v5[21] & 0xFFFFFFEF | v6;
}

- (id)_textContainerForAttachmentProtocol
{
  return 0;
}

- (id)_textStorageForAttachmentProtocol
{
  return 0;
}

- (BOOL)_usesScreenFonts
{
  return 0;
}

- (BOOL)_mirrorsTextAlignment
{
  uint64_t v2 = [(NSTypesetter *)self layoutManager];

  return [(NSLayoutManager *)v2 _mirrorsTextAlignment];
}

- (BOOL)synchronizesAlignmentToDirection
{
  uint64_t v2 = [(NSTypesetter *)self layoutManager];

  return [(NSLayoutManager *)v2 synchronizesAlignmentToDirection];
}

- (unint64_t)_sweepDirectionForGlyphAtIndex:(int64_t)a3
{
  return [(NSTypesetter *)self typesetterBehavior] < NSTypesetterBehavior_10_4
      || [(NSATSTypesetter *)self _baseWritingDirection] != 1;
}

- (unint64_t)lineBreakStrategy
{
  BOOL v3 = (unint64_t *)self->_private;
  if (!v3)
  {
    BOOL v3 = (unint64_t *)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v3;
  }
  unint64_t result = v3[9];
  if (!result)
  {
    objc_super v5 = [(NSTypesetter *)self currentParagraphStyle];
    return [(NSParagraphStyle *)v5 lineBreakStrategy];
  }
  return result;
}

- (void)setLineBreakStrategy:(unint64_t)a3
{
  objc_super v5 = self->_private;
  if (!v5)
  {
    objc_super v5 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v5;
  }
  v5[9] = a3;
}

- (id)paragraphArbitrator
{
  return [(NSLayoutManager *)self->layoutManager paragraphArbitrator];
}

- (unint64_t)actionForControlCharacterAtIndex:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSATSTypesetter;
  id v5 = -[NSTypesetter actionForControlCharacterAtIndex:](&v8, sel_actionForControlCharacterAtIndex_);
  id v6 = [(NSLayoutManager *)self->layoutManager delegate];
  if (objc_opt_respondsToSelector()) {
    return [v6 layoutManager:self->layoutManager shouldUseAction:v5 forControlCharacterAtIndex:a3];
  }
  return (unint64_t)v5;
}

- (NSUInteger)layoutParagraphAtPoint:(NSPoint *)lineFragmentOrigin
{
  p_paragraphGlyphRange = &self->paragraphGlyphRange;
  NSUInteger location = self->paragraphGlyphRange.location;
  NSUInteger v21 = location;
  CTSwapLineBreakEpsilon();
  [(NSATSTypesetter *)self beginParagraph];
  if (p_paragraphGlyphRange->length)
  {
    *(void *)&long long v19 = [(NSTypesetter *)self paragraphCharacterRange];
    uint64_t v7 = [(NSTypesetter *)self paragraphSeparatorCharacterRange];
    unint64_t v9 = v7 + v8;
    if ((unint64_t)v19 < v7 + v8)
    {
      do
        BOOL v10 = [(NSATSTypesetter *)self _layoutLineFragmentStartingWithGlyphAtIndex:&v21 characterIndex:&v19 atPoint:lineFragmentOrigin renderingContext:0];
      while ((unint64_t)v19 < v9 && v10);
    }
  }
  else
  {
    p_paragraphSeparatorGlyphRange = &self->paragraphSeparatorGlyphRange;
    if (self->paragraphSeparatorGlyphRange.length)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      [(NSATSTypesetter *)self beginLineWithGlyphAtIndex:location];
      -[NSTypesetter getLineFragmentRect:usedRect:forParagraphSeparatorGlyphRange:atProposedOrigin:](self, "getLineFragmentRect:usedRect:forParagraphSeparatorGlyphRange:atProposedOrigin:", &v19, &v17, p_paragraphSeparatorGlyphRange->location, self->paragraphSeparatorGlyphRange.length, lineFragmentOrigin->x, lineFragmentOrigin->y);
      if (!self->layoutManager || self->currentTextContainer)
      {
        double v16 = *((double *)&v17 + 1) + *((double *)&v18 + 1) - *((double *)&v19 + 1);
        unint64_t v13 = self->_private;
        if (!v13)
        {
          unint64_t v13 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
          self->_private = v13;
        }
        if ((v13[84] & 2) != 0) {
          -[NSATSTypesetter willSetLineFragmentRect:forGlyphRange:usedRect:baselineOffset:](self, "willSetLineFragmentRect:forGlyphRange:usedRect:baselineOffset:", &v19, p_paragraphSeparatorGlyphRange->location, self->paragraphSeparatorGlyphRange.length, &v17, &v16);
        }
        -[NSTypesetter finalizeLineFragmentRect:lineFragmentUsedRect:baselineOffset:forGlyphRange:](self, "finalizeLineFragmentRect:lineFragmentUsedRect:baselineOffset:forGlyphRange:", &v19, &v17, &v16, p_paragraphSeparatorGlyphRange->location, self->paragraphSeparatorGlyphRange.length);
        -[NSTypesetter setLineFragmentRect:forGlyphRange:usedRect:baselineOffset:](self, "setLineFragmentRect:forGlyphRange:usedRect:baselineOffset:", p_paragraphSeparatorGlyphRange->location, self->paragraphSeparatorGlyphRange.length, v19, v20, v17, v18, *(void *)&v16);
        -[NSTypesetter setLocation:withAdvancements:forStartOfGlyphRange:](self, "setLocation:withAdvancements:forStartOfGlyphRange:", 0, p_paragraphSeparatorGlyphRange->location, self->paragraphSeparatorGlyphRange.length, *(double *)&v17 - *(double *)&v19 + self->lineFragmentPadding, 0.0);
        -[NSTypesetter setNotShownAttribute:forGlyphRange:](self, "setNotShownAttribute:forGlyphRange:", 1, p_paragraphSeparatorGlyphRange->location, self->paragraphSeparatorGlyphRange.length);
        NSUInteger v21 = self->paragraphSeparatorGlyphRange.length + p_paragraphSeparatorGlyphRange->location;
        -[NSATSTypesetter endLineWithGlyphRange:](self, "endLineWithGlyphRange:", p_paragraphGlyphRange->location, v21 - p_paragraphGlyphRange->location);
        CGFloat v14 = *((double *)&v19 + 1) + *((double *)&v20 + 1);
        lineFragmentOrigin->double x = 0.0;
        lineFragmentOrigin->double y = v14;
      }
    }
  }
  [(NSATSTypesetter *)self endParagraph];
  CTSwapLineBreakEpsilon();
  return v21;
}

- (BOOL)shouldBreakLineByWordBeforeCharacterAtIndex:(NSUInteger)charIndex
{
  id v5 = [(NSLayoutManager *)[(NSTypesetter *)self layoutManager] delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  id v6 = [(NSTypesetter *)self layoutManager];

  return [v5 layoutManager:v6 shouldBreakLineByWordBeforeCharacterAtIndex:charIndex];
}

- (BOOL)shouldBreakLineByHyphenatingBeforeCharacterAtIndex:(NSUInteger)charIndex
{
  id v5 = [(NSLayoutManager *)[(NSTypesetter *)self layoutManager] delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  id v6 = [(NSTypesetter *)self layoutManager];

  return [v5 layoutManager:v6 shouldBreakLineByHyphenatingBeforeCharacterAtIndex:charIndex];
}

- (float)hyphenationFactorForGlyphAtIndex:(NSUInteger)glyphIndex
{
  [(NSParagraphStyle *)self->currentParagraphStyle hyphenationFactor];
  if (v4 == 0.0)
  {
    [(NSTypesetter *)self hyphenationFactor];
  }
  else
  {
    double v6 = v4;
    if (v6 < 0.0) {
      double v6 = 0.0;
    }
    return fmin(v6, 1.0);
  }
  return result;
}

- (NSRect)boundingBoxForControlGlyphAtIndex:(NSUInteger)glyphIndex forTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(NSRect)proposedRect glyphPosition:(NSPoint)glyphPosition characterIndex:(NSUInteger)charIndex
{
  double y = glyphPosition.y;
  double x = glyphPosition.x;
  double height = proposedRect.size.height;
  double width = proposedRect.size.width;
  double v12 = proposedRect.origin.y;
  double v13 = proposedRect.origin.x;
  id v17 = [(NSLayoutManager *)[(NSTypesetter *)self layoutManager] delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v17, "layoutManager:boundingBoxForControlGlyphAtIndex:forTextContainer:proposedLineFragment:glyphPosition:characterIndex:", -[NSTypesetter layoutManager](self, "layoutManager"), glyphIndex, textContainer, charIndex, v13, v12, width, height, x, y);
  }
  else
  {
    double v18 = *MEMORY[0x1E4F28AD8];
    double v19 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
    double v20 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
    double v21 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
  }
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (UTF32Char)hyphenCharacterForGlyphAtIndex:(NSUInteger)glyphIndex
{
  return 8208;
}

- (BOOL)_isBusy
{
  BOOL v3 = (BOOL *)self->_private;
  if (!v3)
  {
    BOOL v3 = (BOOL *)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v3;
  }
  return v3[80];
}

- (void)_setBusy:(BOOL)a3
{
  id v5 = self->_private;
  if (!v5)
  {
    id v5 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v5;
  }
  v5[80] = a3;
}

- (void)layoutGlyphsInLayoutManager:(id)a3 startingAtGlyphIndex:(unint64_t)a4 maxNumberOfLineFragments:(unint64_t)a5 nextGlyphIndex:(unint64_t *)a6
{
  os_unfair_lock_lock((os_unfair_lock_t)&__NSATSTypesetterLock);
  if ([(NSATSTypesetter *)self _isBusy])
  {
    if (a4 && __NSRaiseWithRecursiveLayoutRequest && self->layoutManager == a3)
    {
      [(NSATSTypesetter *)self _setBusy:0];
      os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSTypesetterLock);
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@: Recursive layout request for layout manager %@", self, a3 format];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSTypesetterLock);
    id v14 = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), "init");
    [v14 layoutGlyphsInLayoutManager:a3 startingAtGlyphIndex:a4 maxNumberOfLineFragments:a5 nextGlyphIndex:a6];
  }
  else
  {
    [(NSATSTypesetter *)self _setBusy:1];
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSTypesetterLock);
    double v11 = (void *)[a3 textStorage];
    BOOL v12 = [(NSATSTypesetter *)self _baselineRenderingMode];
    BOOL v13 = [(NSATSTypesetter *)self _forceWordWrapping];
    -[NSTypesetter setApplicationFrameworkContext:](self, "setApplicationFrameworkContext:", [a3 applicationFrameworkContext]);
    if ([v11 _isStringDrawingTextStorage])
    {
      -[NSATSTypesetter _setForceWordWrapping:](self, "_setForceWordWrapping:", [v11 _forceWordWrapping]);
      [v11 defaultTighteningFactor];
      -[NSATSTypesetter setDefaultTighteningFactor:](self, "setDefaultTighteningFactor:");
      [(NSATSTypesetter *)self setLineBreakStrategy:+[NSTypesetter defaultLineBreakStrategy]];
      -[NSATSTypesetter setLimitsLayoutForSuspiciousContents:](self, "setLimitsLayoutForSuspiciousContents:", [a3 limitsLayoutForSuspiciousContents]);
    }
    v15.receiver = self;
    v15.super_class = (Class)NSATSTypesetter;
    [(NSTypesetter *)&v15 layoutGlyphsInLayoutManager:a3 startingAtGlyphIndex:a4 maxNumberOfLineFragments:a5 nextGlyphIndex:a6];
    [(NSATSTypesetter *)self _flushCachedObjects];
    if (!v12) {
      [(NSATSTypesetter *)self _setBaselineRenderingMode:0];
    }
    if (!v13) {
      [(NSATSTypesetter *)self _setForceWordWrapping:0];
    }
    [(NSATSTypesetter *)self setDefaultTighteningFactor:0.0];
    [(NSATSTypesetter *)self setLineBreakStrategy:0];
    [(NSATSTypesetter *)self setLimitsLayoutForSuspiciousContents:0];
    [(NSATSTypesetter *)self _setBusy:0];
  }
}

- (_NSRange)layoutCharactersInRange:(_NSRange)a3 forLayoutManager:(id)a4 maximumNumberOfLineFragments:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  os_unfair_lock_lock((os_unfair_lock_t)&__NSATSTypesetterLock);
  if ([(NSATSTypesetter *)self _isBusy])
  {
    if (__NSRaiseWithRecursiveLayoutRequest) {
      BOOL v10 = location == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10 && self->layoutManager == a4)
    {
      [(NSATSTypesetter *)self _setBusy:0];
      os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSTypesetterLock);
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@: Recursive layout request for layout manager %@", self, a4 format];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSTypesetterLock);
    double v11 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), "init");
    id v12 = (id)objc_msgSend(v11, "layoutCharactersInRange:forLayoutManager:maximumNumberOfLineFragments:", location, length, a4, a5);
    NSUInteger v14 = v13;
  }
  else
  {
    [(NSATSTypesetter *)self _setBusy:1];
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSTypesetterLock);
    objc_super v15 = (void *)[a4 textStorage];
    BOOL v16 = [(NSATSTypesetter *)self _baselineRenderingMode];
    BOOL v17 = [(NSATSTypesetter *)self _forceWordWrapping];
    -[NSTypesetter setApplicationFrameworkContext:](self, "setApplicationFrameworkContext:", [a4 applicationFrameworkContext]);
    if ([v15 _isStringDrawingTextStorage])
    {
      -[NSATSTypesetter _setForceWordWrapping:](self, "_setForceWordWrapping:", [v15 _forceWordWrapping]);
      [v15 defaultTighteningFactor];
      -[NSATSTypesetter setDefaultTighteningFactor:](self, "setDefaultTighteningFactor:");
      [(NSATSTypesetter *)self setLineBreakStrategy:+[NSTypesetter defaultLineBreakStrategy]];
    }
    -[NSATSTypesetter setLimitsLayoutForSuspiciousContents:](self, "setLimitsLayoutForSuspiciousContents:", [a4 limitsLayoutForSuspiciousContents]);
    v21.receiver = self;
    v21.super_class = (Class)NSATSTypesetter;
    id v12 = -[NSTypesetter layoutCharactersInRange:forLayoutManager:maximumNumberOfLineFragments:](&v21, sel_layoutCharactersInRange_forLayoutManager_maximumNumberOfLineFragments_, location, length, a4, a5);
    NSUInteger v14 = v18;
    [(NSATSTypesetter *)self _flushCachedObjects];
    if (!v16) {
      [(NSATSTypesetter *)self _setBaselineRenderingMode:0];
    }
    if (!v17) {
      [(NSATSTypesetter *)self _setForceWordWrapping:0];
    }
    [(NSATSTypesetter *)self setDefaultTighteningFactor:0.0];
    [(NSATSTypesetter *)self setLineBreakStrategy:0];
    [(NSATSTypesetter *)self setLimitsLayoutForSuspiciousContents:0];
    [(NSATSTypesetter *)self _setBusy:0];
  }
  NSUInteger v19 = (NSUInteger)v12;
  NSUInteger v20 = v14;
  result.NSUInteger length = v20;
  result.NSUInteger location = v19;
  return result;
}

- (double)baselineOffsetInLayoutManager:(id)a3 glyphIndex:(unint64_t)a4
{
  os_unfair_lock_lock((os_unfair_lock_t)&__NSATSTypesetterLock);
  if ([(NSATSTypesetter *)self _isBusy])
  {
    if (a4 && __NSRaiseWithRecursiveLayoutRequest && self->layoutManager == a3)
    {
      [(NSATSTypesetter *)self _setBusy:0];
      os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSTypesetterLock);
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"%@: Recursive layout request for layout manager %@", self, a3 format];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSTypesetterLock);
    uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[NSATSTypesetter zone](self, "zone")), "init");
    [v7 baselineOffsetInLayoutManager:a3 glyphIndex:a4];
    double v9 = v8;
  }
  else
  {
    [(NSATSTypesetter *)self _setBusy:1];
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSATSTypesetterLock);
    v12.receiver = self;
    v12.super_class = (Class)NSATSTypesetter;
    [(NSTypesetter *)&v12 baselineOffsetInLayoutManager:a3 glyphIndex:a4];
    double v9 = v10;
    [(NSATSTypesetter *)self _setBusy:0];
  }
  return v9;
}

- ($500F09A0A86A1DC0979241A7D72823DF)_lineFragmentRectForProposedRectArgs
{
  BOOL v3 = ($500F09A0A86A1DC0979241A7D72823DF **)self->_private;
  if (!v3)
  {
    BOOL v3 = ($500F09A0A86A1DC0979241A7D72823DF **)-[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v3;
  }
  return v3[6];
}

- (NSRect)lineFragmentRectForProposedRect:(NSRect)proposedRect remainingRect:(NSRectPointer)remainingRect
{
  double height = proposedRect.size.height;
  double width = proposedRect.size.width;
  double y = proposedRect.origin.y;
  double x = proposedRect.origin.x;
  double v10 = self->_private;
  if (!v10)
  {
    double v10 = -[_NSATSTypesetterGuts initWithTypesetter:](+[_NSATSTypesetterGuts allocWithZone:](_NSATSTypesetterGuts, "allocWithZone:", [(NSATSTypesetter *)self zone]), self);
    self->_private = v10;
  }
  uint64_t v11 = v10[6];
  long long v18 = 0u;
  long long v19 = 0u;
  if (v11)
  {
    double v12 = height - (*(double *)v11 + *(double *)(v11 + 8) + *(double *)(v11 + 16));
    v10[6] = 0;
    -[NSTypesetter getLineFragmentRect:usedRect:remainingRect:forStartingGlyphAtIndex:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter:](self, "getLineFragmentRect:usedRect:remainingRect:forStartingGlyphAtIndex:proposedRect:lineSpacing:paragraphSpacingBefore:paragraphSpacingAfter:", &v18, v11, remainingRect, *(void *)(v11 + 24), x, y, width, v12, *(double *)v11, *(double *)(v11 + 8), *(double *)(v11 + 16));
    v10[6] = v11;
    NSUInteger v13 = (double *)&v18;
    double v14 = *((double *)&v18 + 1);
    double v15 = *(double *)&v19;
  }
  else
  {
    NSUInteger v13 = (double *)MEMORY[0x1E4F28AD8];
    double v14 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  }
  double v16 = v13[3];
  double v17 = *v13;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v17;
  return result;
}

@end
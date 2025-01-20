@interface NSStringDrawingTextStorage
+ (BOOL)_hasCustomSettings;
+ (id)stringDrawingTextStorage;
+ (void)_setHasCustomSettings:(BOOL)a3;
+ (void)initialize;
+ (void)performLayoutOperation:(id)a3;
- (BOOL)_baselineMode;
- (BOOL)_forceWordWrapping;
- (BOOL)_isStringDrawingTextStorage;
- (BOOL)_shouldSetOriginalFontAttribute;
- (BOOL)_usesSimpleTextEffects;
- (BOOL)_wrappedByCluster;
- (CGPoint)defaultTextContainerOriginForRect:(CGRect)a3;
- (CGRect)usedRectForTextContainer:(id)a3;
- (CUICatalog)cuiCatalog;
- (CUIStyleEffectConfiguration)cuiStyleEffects;
- (NSStringDrawingTextStorage)init;
- (double)_baselineDelta;
- (double)defaultTighteningFactor;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)layoutManager;
- (id)string;
- (id)textContainer;
- (id)textContainerForAttributedString:(id)a3;
- (id)textContainerForAttributedString:(id)a3 containerSize:(CGSize)a4 lineFragmentPadding:(double)a5;
- (int64_t)_applicationFrameworkContext;
- (int64_t)typesetterBehavior;
- (unint64_t)length;
- (void)_setApplicationFrameworkContext:(int64_t)a3;
- (void)_setBaselineDelta:(double)a3;
- (void)_setBaselineMode:(BOOL)a3;
- (void)_setForceWordWrapping:(BOOL)a3;
- (void)_setUsesSimpleTextEffects:(BOOL)a3;
- (void)_setWrappedByCluster:(BOOL)a3;
- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5;
- (void)dealloc;
- (void)drawTextContainer:(id)a3 range:(_NSRange)a4 withRect:(CGRect)a5 graphicsContext:(CGContext *)a6 baselineMode:(BOOL)a7 scrollable:(BOOL)a8 padding:(double)a9;
- (void)drawTextContainer:(id)a3 withRect:(CGRect)a4 graphicsContext:(CGContext *)a5 baselineMode:(BOOL)a6 scrollable:(BOOL)a7 padding:(double)a8;
- (void)processEditing;
- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)setAttributes:(id)a3 range:(_NSRange)a4;
- (void)setCuiCatalog:(id)a3;
- (void)setCuiStyleEffects:(id)a3;
- (void)setDefaultTighteningFactor:(double)a3;
@end

@implementation NSStringDrawingTextStorage

+ (BOOL)_hasCustomSettings
{
  return __NSHasCustomSettings;
}

+ (void)initialize
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    __NSDefaultStringDrawingBehavior = +[NSTypesetter defaultStringDrawingTypesetterBehavior];
  }
}

+ (id)stringDrawingTextStorage
{
  uint64_t v2 = (void *)[objc_allocWithZone((Class)objc_opt_class()) init];

  return v2;
}

+ (void)performLayoutOperation:(id)a3
{
  os_unfair_lock_lock_with_options();
  int v5 = __NSStringDrawingTextStorageCacheNextIndex;
  if (__NSStringDrawingTextStorageCacheNextIndex)
  {
    --__NSStringDrawingTextStorageCacheNextIndex;
    id v10 = (id)__NSStringDrawingTextStorageCache[v5 - 1];
    os_unfair_lock_unlock(&__NSStringDrawingTextStorageLock);
    if (v10) {
      goto LABEL_6;
    }
  }
  else
  {
    os_unfair_lock_unlock(&__NSStringDrawingTextStorageLock);
  }
  id v10 = objc_alloc_init((Class)a1);
LABEL_6:
  (*((void (**)(id, id, uint64_t, uint64_t))a3 + 2))(a3, v10, [v10 layoutManager], objc_msgSend(v10, "textContainer"));
  os_unfair_lock_lock_with_options();
  BOOL v6 = [v10 retainCount] != 1 || __NSStringDrawingTextStorageCacheNextIndex > 3;
  if (!v6
    && ((unint64_t v7 = [v10 length], v8 = __NSStringDrawingTextStorageCacheNextIndex, v7 >= 0x190)
      ? (BOOL v9 = __NSStringDrawingTextStorageCacheNextIndex == 0)
      : (BOOL v9 = 1),
        v9))
  {
    ++__NSStringDrawingTextStorageCacheNextIndex;
    __NSStringDrawingTextStorageCache[v8] = v10;
    os_unfair_lock_unlock(&__NSStringDrawingTextStorageLock);
  }
  else
  {
    os_unfair_lock_unlock(&__NSStringDrawingTextStorageLock);
  }
}

- (id)layoutManager
{
  return self->_layoutManager;
}

- (id)textContainer
{
  return self->_textContainer;
}

- (int64_t)typesetterBehavior
{
  return *(_DWORD *)&self->_sdflags & 0xFLL;
}

- (CGRect)usedRectForTextContainer:(id)a3
{
  [(NSLayoutManager *)self->_layoutManager ensureLayoutForTextContainer:"ensureLayoutForTextContainer:"];
  layoutManager = self->_layoutManager;

  [(NSLayoutManager *)layoutManager usedRectForTextContainer:a3];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)_setBaselineDelta:(double)a3
{
  self->_baselineDelta = a3;
}

- (double)_baselineDelta
{
  return self->_baselineDelta;
}

- (void)_setBaselineMode:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_sdflags = ($F38F01E48181EA944A1921002A125B21)(*(_DWORD *)&self->_sdflags & 0xFFFFFFDF | v3);
}

- (BOOL)_baselineMode
{
  return (*(unsigned char *)&self->_sdflags >> 5) & 1;
}

- (void)_setApplicationFrameworkContext:(int64_t)a3
{
  self->_sdflags = ($F38F01E48181EA944A1921002A125B21)(*(_DWORD *)&self->_sdflags & 0xFFFFF8FF | ((a3 & 7) << 8));
}

- (int64_t)_applicationFrameworkContext
{
  return ((unint64_t)self->_sdflags >> 8) & 7;
}

- (void)_setWrappedByCluster:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_sdflags = ($F38F01E48181EA944A1921002A125B21)(*(_DWORD *)&self->_sdflags & 0xFFFFF7FF | v3);
}

- (BOOL)_wrappedByCluster
{
  return (*((unsigned __int8 *)&self->_sdflags + 1) >> 3) & 1;
}

- (BOOL)_usesSimpleTextEffects
{
  return *(unsigned char *)&self->_sdflags >> 7;
}

- (void)_setUsesSimpleTextEffects:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_sdflags = ($F38F01E48181EA944A1921002A125B21)(*(_DWORD *)&self->_sdflags & 0xFFFFFF7F | v3);
}

- (BOOL)_forceWordWrapping
{
  return (*(unsigned char *)&self->_sdflags >> 6) & 1;
}

- (void)_setForceWordWrapping:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_sdflags = ($F38F01E48181EA944A1921002A125B21)(*(_DWORD *)&self->_sdflags & 0xFFFFFFBF | v3);
}

- (void)drawTextContainer:(id)a3 withRect:(CGRect)a4 graphicsContext:(CGContext *)a5 baselineMode:(BOOL)a6 scrollable:(BOOL)a7 padding:(double)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  unint64_t v18 = [(NSStringDrawingTextStorage *)self length];

  -[NSStringDrawingTextStorage drawTextContainer:range:withRect:graphicsContext:baselineMode:scrollable:padding:](self, "drawTextContainer:range:withRect:graphicsContext:baselineMode:scrollable:padding:", a3, 0, v18, a5, v10, v9, x, y, width, height, a8);
}

- (void)drawTextContainer:(id)a3 range:(_NSRange)a4 withRect:(CGRect)a5 graphicsContext:(CGContext *)a6 baselineMode:(BOOL)a7 scrollable:(BOOL)a8 padding:(double)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v19 = (void *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] graphicsContextForApplicationFrameworkContext:[(NSStringDrawingTextStorage *)self _applicationFrameworkContext]];
  v20 = (double *)MEMORY[0x1E4F28AD8];
  if (v19) {
    char v21 = [v19 isFlipped] ^ 1;
  }
  else {
    char v21 = 0;
  }
  double v22 = *v20;
  double v68 = v20[1];
  [(NSStringDrawingTextStorage *)self usedRectForTextContainer:a3];
  double v27 = v24;
  double v28 = v25;
  double v29 = v26;
  if (width > 0.0 && v25 > width || (v30 = 0, height > 0.0) && v26 > height) {
    v30 = a6;
  }
  double v31 = v23 + v25;
  double v63 = v22;
  double v64 = v31;
  if (width <= 0.0) {
    double v32 = v31;
  }
  else {
    double v32 = width;
  }
  if (height <= 0.0) {
    double v33 = v24 + v26;
  }
  else {
    double v33 = height;
  }
  double v61 = v33;
  double v62 = v32;
  NSUInteger v34 = -[NSLayoutManager glyphRangeForBoundingRect:inTextContainer:](self->_layoutManager, "glyphRangeForBoundingRect:inTextContainer:", a3, v22, v68);
  NSUInteger v36 = v35;
  double baselineDelta = 0.0;
  if (v10) {
    double baselineDelta = self->_baselineDelta;
  }
  char v38 = 1;
  double v65 = x;
  if (width > 0.0 && v9)
  {
    -[NSStringDrawingTextStorage defaultTextContainerOriginForRect:](self, "defaultTextContainerOriginForRect:", x, y, width, height);
    double x = floor(v39);
    char v38 = 1;
    if (!v10 && height > 0.0 && v28 >= width + width)
    {
      NSUInteger v34 = -[NSLayoutManager glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:](self->_layoutManager, "glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:", a3, v63, v68, v62, v61);
      NSUInteger v36 = v40;
      char v38 = 0;
    }
  }
  if (height <= 0.0) {
    double v41 = v29;
  }
  else {
    double v41 = height;
  }
  double v42 = v27 + v41;
  if (v10) {
    double v42 = baselineDelta;
  }
  double v43 = y + v42;
  if (v21) {
    double v44 = v43;
  }
  else {
    double v44 = y - (v27 + baselineDelta);
  }
  if (v30)
  {
    double v60 = v44;
    double v45 = v64;
    if (width > 0.0) {
      double v45 = width;
    }
    double v46 = v45 + a9 * 2.0;
    if (height <= 0.0) {
      CGFloat v47 = v29;
    }
    else {
      CGFloat v47 = height;
    }
    double v48 = 0.0;
    double v49 = baselineDelta - v29;
    if ((v21 & 1) == 0) {
      double v49 = -baselineDelta;
    }
    if (v10) {
      double v48 = v49;
    }
    double v50 = y + v48;
    char v51 = v38 ^ 1;
    if (height <= 0.0) {
      char v51 = 1;
    }
    if ((v51 & 1) == 0 && v29 >= height + height)
    {
      uint64_t v52 = -[NSLayoutManager glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:](self->_layoutManager, "glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:", a3, v63, v68, v62, v61);
      NSUInteger v54 = v52 + v53 >= v34 + v36 ? v36 : v52 + v53 - v34;
      if (v53) {
        NSUInteger v36 = v54;
      }
    }
    CGContextSaveGState(v30);
    v73.origin.double x = v65 - a9;
    v73.origin.double y = v50;
    v73.size.double width = v46;
    v73.size.double height = v47;
    CGContextClipToRect(v30, v73);
  }
  unint64_t v69 = 0;
  uint64_t v70 = 0;
  v72.NSUInteger location = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self->_layoutManager, "glyphRangeForCharacterRange:actualCharacterRange:", location, length, 0, *(void *)&v60);
  v72.NSUInteger length = v55;
  v71.NSUInteger location = v34;
  v71.NSUInteger length = v36;
  NSRange v56 = NSIntersectionRange(v71, v72);
  unint64_t v57 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self->_layoutManager, "characterRangeForGlyphRange:actualGlyphRange:", v56.location, v56.length, 0);
  unint64_t v69 = v57;
  uint64_t v70 = v58;
  unint64_t v59 = v58 + v57;
  [(NSLayoutManager *)self->_layoutManager setFlipsIfNeeded:1];
  if (v57 < v59)
  {
    while (![(NSStringDrawingTextStorage *)self attribute:@"NSBackgroundColor" atIndex:v57 effectiveRange:&v69])
    {
      unint64_t v57 = v70 + v69;
      unint64_t v69 = v57;
      if (v57 >= v59) {
        goto LABEL_56;
      }
    }
    -[NSLayoutManager drawBackgroundForGlyphRange:atPoint:](self->_layoutManager, "drawBackgroundForGlyphRange:atPoint:", v56.location, v56.length, x, v44);
  }
LABEL_56:
  -[NSLayoutManager drawGlyphsForGlyphRange:atPoint:](self->_layoutManager, "drawGlyphsForGlyphRange:atPoint:", v56.location, v56.length, x, v44);
  [(NSLayoutManager *)self->_layoutManager setFlipsIfNeeded:0];
  if (v30) {
    CGContextRestoreGState(v30);
  }
}

- (CGPoint)defaultTextContainerOriginForRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(NSLayoutManager *)self->_layoutManager usedRectForTextContainer:self->_textContainer];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(NSTextContainer *)self->_textContainer size];
  double v18 = _NSCalculateContainerOrigin(x, y, width, height, v9, v11, v13, v15, v16, v17, *MEMORY[0x1E4F28AE0]);
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (id)textContainerForAttributedString:(id)a3
{
  return -[NSStringDrawingTextStorage textContainerForAttributedString:containerSize:lineFragmentPadding:](self, "textContainerForAttributedString:containerSize:lineFragmentPadding:", a3, *MEMORY[0x1E4F28AE0], *(double *)(MEMORY[0x1E4F28AE0] + 8), 0.0);
}

- (id)textContainerForAttributedString:(id)a3 containerSize:(CGSize)a4 lineFragmentPadding:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  -[NSConcreteMutableAttributedString replaceCharactersInRange:withAttributedString:](self->_contents, "replaceCharactersInRange:withAttributedString:", 0, [(NSStringDrawingTextStorage *)self length], a3);
  -[NSTextContainer setSize:](self->_textContainer, "setSize:", width, height);
  [(NSTextContainer *)self->_textContainer setLineFragmentPadding:a5];
  return self->_textContainer;
}

- (BOOL)_isStringDrawingTextStorage
{
  return 1;
}

- (BOOL)_shouldSetOriginalFontAttribute
{
  return 1;
}

- (NSStringDrawingTextStorage)init
{
  if (__NSHasCustomSettings) {
    p_settings = &+[NSStringDrawingTextStorageSettings threadSpecificStringDrawingTextStorageSettings:]((uint64_t)NSStringDrawingTextStorageSettings, 1)->_settings;
  }
  else {
    p_settings = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)NSStringDrawingTextStorage;
  v4 = [(NSTextStorage *)&v11 init];
  int v5 = v4;
  if (v4)
  {
    double v6 = [(NSConcreteMutableAttributedString *)+[NSConcreteNotifyingMutableAttributedString allocWithZone:[(NSStringDrawingTextStorage *)v4 zone]] initWithAttributedString:0];
    v5->_contents = v6;
    [(NSConcreteNotifyingMutableAttributedString *)v6 setDelegate:v5];
    uint64_t v7 = [objc_allocWithZone((Class)NSLayoutManager) init];
    v5->_layoutManager = (NSLayoutManager *)v7;
    [(NSTextStorage *)v5 addLayoutManager:v7];
    [(NSLayoutManager *)v5->_layoutManager setUsesFontLeading:0];
    [(NSLayoutManager *)v5->_layoutManager setAllowsOriginalFontMetricsOverride:1];
    [(NSLayoutManager *)v5->_layoutManager setIgnoresViewTransformations:1];
    [(NSLayoutManager *)v5->_layoutManager setBackgroundLayoutEnabled:0];
    if (p_settings) {
      char v8 = *((unsigned char *)&p_settings->_flags + 1);
    }
    else {
      char v8 = __NSDefaultStringDrawingBehavior;
    }
    v5->_sdflags = ($F38F01E48181EA944A1921002A125B21)(*(_DWORD *)&v5->_sdflags & 0xFFFFFFF0 | v8 & 0xF);
    [(NSLayoutManager *)v5->_layoutManager setTypesetterBehavior:v8 & 0xF];
    [(NSLayoutManager *)v5->_layoutManager setLimitsLayoutForSuspiciousContents:1];

    double v9 = (NSTextContainer *)[objc_allocWithZone((Class)NSTextContainer) init];
    v5->_textContainer = v9;
    -[NSTextContainer setSize:](v9, "setSize:", 9000000.0, 9000000.0);
    [(NSLayoutManager *)v5->_layoutManager addTextContainer:v5->_textContainer];

    if (p_settings)
    {
      [(NSLayoutManager *)v5->_layoutManager setUsesFontLeading:*(_WORD *)&p_settings->_flags & 1];
      [(NSLayoutManager *)v5->_layoutManager setAllowsOriginalFontMetricsOverride:1];
      [(NSLayoutManager *)v5->_layoutManager setUsesScreenFonts:(*(_WORD *)&p_settings->_flags >> 1) & 1];
      [(NSLayoutManager *)v5->_layoutManager setHyphenationFactor:p_settings->_hyphenationFactor];
      [(NSLayoutManager *)v5->_layoutManager setShowsInvisibleCharacters:(*(_WORD *)&p_settings->_flags >> 2) & 1];
      [(NSLayoutManager *)v5->_layoutManager setShowsControlCharacters:(*(_WORD *)&p_settings->_flags >> 3) & 1];
    }
    *(_DWORD *)&v5->_sdflags &= ~0x20u;
    v5->_sdflags = ($F38F01E48181EA944A1921002A125B21)(*(_DWORD *)&v5->_sdflags & 0xFFFFF8FF | ((_NSTextScalingTypeForCurrentEnvironment() & 7) << 8));
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSStringDrawingTextStorage;
  [(NSTextStorage *)&v3 dealloc];
}

- (void)processEditing
{
  uint64_t v3 = [(NSTextStorage *)self editedRange];
  uint64_t v5 = v4;
  -[NSTextStorage invalidateAttributesInRange:](self, "invalidateAttributesInRange:", v3, v4);
  NSTextStorageEditActions v6 = [(NSTextStorage *)self editedMask];
  NSInteger v7 = [(NSTextStorage *)self changeInLength];
  uint64_t v9 = [(NSTextStorage *)self editedRange];

  -[NSTextStorage _notifyEdited:range:changeInLength:invalidatedRange:](self, "_notifyEdited:range:changeInLength:invalidatedRange:", v6, v3, v5, v7, v9, v8);
}

- (unint64_t)length
{
  return [(NSConcreteMutableAttributedString *)self->_contents length];
}

- (id)string
{
  return [(NSConcreteMutableAttributedString *)self->_contents string];
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return [(NSConcreteMutableAttributedString *)self->_contents attributesAtIndex:a3 effectiveRange:a4];
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  return [(NSConcreteMutableAttributedString *)self->_contents attribute:a3 atIndex:a4 effectiveRange:a5];
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  return -[NSConcreteMutableAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self->_contents, "attribute:atIndex:longestEffectiveRange:inRange:", a3, a4, a5, a6.location, a6.length);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
}

- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5
{
}

+ (void)_setHasCustomSettings:(BOOL)a3
{
  __NSHasCustomSettings = a3;
}

- (double)defaultTighteningFactor
{
  return self->_defaultTighteningFactor;
}

- (void)setDefaultTighteningFactor:(double)a3
{
  self->_defaultTighteningFactor = a3;
}

- (CUICatalog)cuiCatalog
{
  return self->_catalog;
}

- (void)setCuiCatalog:(id)a3
{
}

- (CUIStyleEffectConfiguration)cuiStyleEffects
{
  return self->_styleEffects;
}

- (void)setCuiStyleEffects:(id)a3
{
}

@end
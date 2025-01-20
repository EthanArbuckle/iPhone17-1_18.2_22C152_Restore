@interface NSTextLineFragment
+ (BOOL)supportsSecureCoding;
+ (__CFDictionary)_hiddenContentRenderingAttributes;
- (BOOL)_selectionColorShouldOverrideColor:(id)a3;
- (BOOL)drawMarkedTextBackgroundAtPoint:(CGPoint)a3 context:(CGContext *)a4;
- (BOOL)drawMarkedTextBackgroundAtPoint:(CGPoint)a3 context:(CGContext *)a4 adjustmentCallback:(id)a5;
- (BOOL)drawMarkedTextBackgroundAtPoint:(CGPoint)a3 graphicsContext:(id)a4;
- (BOOL)drawMarkedTextBackgroundAtPoint:(CGPoint)a3 graphicsContext:(id)a4 adjustmentCallback:(id)a5;
- (BOOL)drawMarkedTextIndicatorAtPoint:(CGPoint)a3 graphicsContext:(id)a4 backgroundOnly:(BOOL)a5 adjustmentCallback:(id)a6;
- (BOOL)isExtra;
- (BOOL)isHyphenated;
- (BOOL)isTruncated;
- (BOOL)rendersTextCorrectionMarkers;
- (CGFloat)fractionOfDistanceThroughGlyphForPoint:(CGPoint)point;
- (CGPoint)glyphOrigin;
- (CGPoint)locationForCharacterAtIndex:(NSInteger)index;
- (CGRect)boundsForMarkedTextAtPoint:(CGPoint)a3 range:(id)a4 width:(double)a5 adjustmentCallback:(id)a6;
- (CGRect)boundsWithType:(int64_t)a3 options:(unint64_t)a4;
- (CGRect)imageBounds;
- (CGRect)typographicBounds;
- (NSAttributedString)attributedString;
- (NSInteger)characterIndexForPoint:(CGPoint)point;
- (NSRange)characterRange;
- (NSTextLayoutFragment)textLayoutFragment;
- (NSTextLineFragment)initWithAttributedString:(NSAttributedString *)attributedString range:(NSRange)range;
- (NSTextLineFragment)initWithCoder:(NSCoder *)aDecoder;
- (NSTextLineFragment)initWithString:(NSString *)string attributes:(NSDictionary *)attributes range:(NSRange)range;
- (_NSRange)_rangeOfLigatureContainingCharacterIndex:(unint64_t)a3;
- (__CTLine)lineRef;
- (__CTRun)_findRunForStringIndex:(int64_t)a3 runIndex:(int64_t *)a4;
- (double)padding;
- (id)_defaultRenderingAttributesAtCharacterIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)_renderingAttributeOverridesProvider;
- (id)description;
- (id)lineBadge;
- (id)renderingAttributesProvider;
- (id)textLineFragmentRange;
- (int64_t)applicationFrameworkContext;
- (int64_t)characterIndexForPoint:(CGPoint)a3 fractionOfDistanceThroughGlyph:(double *)a4;
- (unint64_t)numberOfGlyphs;
- (void)_drawMarkedTextBackground:(id)a3 inTextRange:(id)a4 atOrigin:(CGPoint)a5 graphicsContext:(id)a6;
- (void)_drawMarkedTextUnderline:(id)a3 inTextRange:(id)a4 atOrigin:(CGPoint)a5 graphicsContext:(id)a6;
- (void)_drawTextCorrectionMarker:(int64_t)a3 characterRange:(_NSRange)a4 atOrigin:(CGPoint)a5 graphicsContext:(id)a6;
- (void)_enumerateTextAttachmentFramesInCharacterRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)_enumerateTextSegmentsInCharacterRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)_getCaretPositionsForCharactersInRange:(_NSRange)a3 positionsCache:(double *)a4 positionsCacheSize:(unint64_t *)a5 block:(id)a6;
- (void)_processCaretGlyphRunForTextSelectionProvider:(id)a3 baseLocation:(id)a4 runRange:(_NSRange)a5 glyphOffset:(double)a6 positionsCache:(double *)a7 positionsCacheSize:(unint64_t *)a8 stop:(BOOL *)a9 usingBlock:(id)a10;
- (void)_setColor:(id)a3 inGraphicsContext:(id)a4;
- (void)_setCurrentGraphicsContext:(id)a3 duringBlock:(id)a4;
- (void)dealloc;
- (void)drawAtPoint:(CGPoint)a3 graphicsContext:(id)a4;
- (void)drawAtPoint:(CGPoint)point inContext:(CGContextRef)context;
- (void)drawMarkedTextIndicatorAtPoint:(CGPoint)a3 context:(CGContext *)a4;
- (void)drawMarkedTextIndicatorAtPoint:(CGPoint)a3 context:(CGContext *)a4 adjustmentCallback:(id)a5;
- (void)drawMarkedTextIndicatorAtPoint:(CGPoint)a3 graphicsContext:(id)a4;
- (void)drawMarkedTextIndicatorAtPoint:(CGPoint)a3 graphicsContext:(id)a4 adjustmentCallback:(id)a5;
- (void)drawTextAttachmentsAtPoint:(CGPoint)a3 graphicsContext:(id)a4;
- (void)drawTextCorrectionMarkersAtPoint:(CGPoint)a3 context:(CGContext *)a4;
- (void)drawTextCorrectionMarkersAtPoint:(CGPoint)a3 graphicsContext:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateCaretOffsetsWithTextSelectionDataSource:(id)a3 baseLocation:(id)a4 usingBlock:(id)a5;
- (void)enumerateTextSegmentBoundsInTextRange:(id)a3 dataSourceLocationsOnly:(BOOL)a4 usingBlock:(id)a5;
- (void)invalidateCache;
- (void)setApplicationFrameworkContext:(int64_t)a3;
- (void)setGlyphOrigin:(CGPoint)a3;
- (void)setGlyphs:(const unsigned __int16 *)a3 advances:(const CGSize *)a4 count:(int64_t)a5 elasticCount:(unint64_t)a6 font:(id)a7;
- (void)setIsExtra:(BOOL)a3;
- (void)setIsHyphenated:(BOOL)a3;
- (void)setIsTruncated:(BOOL)a3;
- (void)setLineBadge:(id)a3;
- (void)setLineRef:(__CTLine *)a3;
- (void)setPadding:(double)a3;
- (void)setRenderingAttributesProvider:(id)a3;
- (void)setRendersTextCorrectionMarkers:(BOOL)a3;
- (void)setTextLayoutFragment:(id)a3;
- (void)setTypographicBounds:(CGRect)a3;
- (void)set_renderingAttributeOverridesProvider:(id)a3;
@end

@implementation NSTextLineFragment

uint64_t __103__NSTextLineFragment_drawMarkedTextIndicatorAtPoint_graphicsContext_backgroundOnly_adjustmentCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = [a3 count];
  if (result)
  {
    uint64_t result = [a2 isNotEmpty];
    if (result)
    {
      if (*(unsigned char *)(a1 + 88) || ![a3 objectForKeyedSubscript:@"NSUnderline"])
      {
        v7 = (void *)[a3 objectForKeyedSubscript:@"NSBackgroundColor"];
        if (v7 && (objc_msgSend(v7, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null")) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "_drawMarkedTextBackground:inTextRange:atOrigin:graphicsContext:", a3, a2, *(void *)(a1 + 40), *(double *)(a1 + 72), *(double *)(a1 + 80));
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
        }
      }
      else if (*(unsigned char *)(a1 + 89))
      {
        objc_msgSend(*(id *)(a1 + 32), "_drawMarkedTextUnderline:inTextRange:atOrigin:graphicsContext:", a3, a2, *(void *)(a1 + 40), *(double *)(a1 + 72), *(double *)(a1 + 80));
      }
      else if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        v8 = [__NSMarkedTextUnderlineRenderer alloc];
        if (v8)
        {
          CGPoint v9 = *(CGPoint *)(a1 + 72);
          long long v10 = *(_OWORD *)(a1 + 32);
          v11.receiver = v8;
          v11.super_class = (Class)__NSMarkedTextUnderlineRenderer;
          v8 = (__NSMarkedTextUnderlineRenderer *)objc_msgSendSuper2(&v11, sel_init);
          if (v8)
          {
            *(_OWORD *)&v8->_textLineFragment = v10;
            v8->_origin = v9;
            v8->_underlineThickness = 2.0;
          }
        }
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = v8;
      }
      uint64_t result = -[__NSMarkedTextUnderlineRenderer processMarkedTextUnderline:textRange:adjustmentCallback:](*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3, a2, *(void *)(a1 + 48));
      if (result) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      }
    }
  }
  return result;
}

- (void)setRenderingAttributesProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  lineRef = self->_lineRef;
  if (lineRef) {
    CFRelease(lineRef);
  }
  glyphs = self->_glyphs;
  if (glyphs) {
    NSZoneFree(0, glyphs);
  }
  advances = self->_advances;
  if (advances) {
    NSZoneFree(0, advances);
  }

  v6.receiver = self;
  v6.super_class = (Class)NSTextLineFragment;
  [(NSTextLineFragment *)&v6 dealloc];
}

- (CGPoint)glyphOrigin
{
  objc_sync_enter(self);
  CGFloat x = self->_glyphOrigin.x;
  CGFloat y = self->_glyphOrigin.y;
  objc_sync_exit(self);
  double v5 = x;
  double v6 = y;
  result.CGFloat y = v6;
  result.CGFloat x = v5;
  return result;
}

- (void)drawAtPoint:(CGPoint)a3 graphicsContext:(id)a4
{
  if (a4)
  {
    double y = a3.y;
    double x = a3.x;
    BOOL v8 = -[NSTextLineFragment drawMarkedTextBackgroundAtPoint:graphicsContext:](self, "drawMarkedTextBackgroundAtPoint:graphicsContext:");
    [(NSTextLineFragment *)self glyphOrigin];
    double v10 = x + v9;
    double v12 = y + v11;
    lineRef = self->_lineRef;
    if (lineRef)
    {
      id v14 = [(NSTextLineFragment *)self _renderingAttributeOverridesProvider];
      _NSCoreTypesetterRenderLine(lineRef, a4, (uint64_t)v14, (const __CFAttributedString *)self->_lineBadge, 0, 0, v10, v12, *MEMORY[0x1E4F28AD8], *(CGFloat *)(MEMORY[0x1E4F28AD8] + 8), *(CGFloat *)(MEMORY[0x1E4F28AD8] + 16), *(CGFloat *)(MEMORY[0x1E4F28AD8] + 24));
      if ([(NSTextLayoutFragment *)[(NSTextLineFragment *)self textLayoutFragment] textAttachmentLayoutContext]|| [(NSArray *)[(NSTextLayoutFragment *)[(NSTextLineFragment *)self textLayoutFragment] truncatedRanges] count])
      {
        -[NSTextLineFragment drawTextAttachmentsAtPoint:graphicsContext:](self, "drawTextAttachmentsAtPoint:graphicsContext:", a4, x, y);
      }
    }
    else if (self->_glyphs)
    {
      v15 = [(NSTextLineFragment *)self _renderingAttributeOverridesProvider];
      uint64_t v16 = [(NSTextLineFragment *)self characterRange];
      int64_t glyphCount = self->_glyphCount;
      int64_t v18 = [(NSTextLineFragment *)self applicationFrameworkContext];
      BOOL v48 = v8;
      if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery])
      {
        v19 = (objc_class *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] colorClassForApplicationFrameworkContext:v18];
      }
      else
      {
        v19 = +[NSTextGraphicsContextProvider __defaultColorClass];
      }
      uint64_t v51 = [(objc_class *)v19 blackColor];
      v20 = (CGContext *)[a4 CGContext];
      glyphs = self->_glyphs;
      advances = self->_advances;
      v23 = [(NSAttributedString *)[(NSTextLineFragment *)self attributedString] attributesAtIndex:v16 effectiveRange:0];
      id v24 = [(NSDictionary *)v23 objectForKeyedSubscript:@"NSFont"];
      v50 = v23;
      id v52 = [(NSDictionary *)v23 objectForKeyedSubscript:@"NSShadow"];
      if (!v24) {
        id v24 = (id)NSDefaultFont();
      }
      uint64_t v25 = v16 + glyphCount;
      while (1)
      {
        uint64_t v54 = 0;
        uint64_t v55 = 0;
        if (v15)
        {
          v26 = (void *)v15[2](v15, v16, &v54);
          uint64_t v28 = v54;
          uint64_t v27 = v55;
        }
        else
        {
          v26 = 0;
          uint64_t v27 = v25 - v16;
          uint64_t v54 = v16;
          uint64_t v55 = v25 - v16;
          uint64_t v28 = v16;
        }
        if (v27 + v28 > (unint64_t)v25)
        {
          uint64_t v27 = v25 - v28;
          uint64_t v55 = v25 - v28;
        }
        uint64_t v29 = v28 - v16;
        if (v29)
        {
          v27 += v29;
          uint64_t v54 = v16;
          uint64_t v55 = v27;
        }
        if (!v27) {
          break;
        }
        if ([v26 count])
        {
          v30 = (void *)[v26 objectForKeyedSubscript:@"NSBackgroundColor"];
          if (v30)
          {
            v31 = v30;
            if ((objc_msgSend(v30, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null")) & 1) == 0)
            {
              [(NSTextLineFragment *)self typographicBounds];
              uint64_t v49 = v32;
              uint64_t v34 = v33;
              uint64_t v36 = v35;
              uint64_t v38 = v37;
              [(NSTextLineFragment *)self glyphOrigin];
              double v39 = y;
              uint64_t v41 = v40;
              [(NSTextLineFragment *)self _setColor:v31 inGraphicsContext:a4];
              v53[0] = MEMORY[0x1E4F143A8];
              v53[1] = 3221225472;
              v53[2] = __50__NSTextLineFragment_drawAtPoint_graphicsContext___block_invoke;
              v53[3] = &__block_descriptor_80_e26_v40__0__NSRange_QQ_8d24d32l;
              v53[4] = v49;
              v53[5] = v34;
              v53[6] = v36;
              v53[7] = v38;
              v53[8] = v41;
              double y = v39;
              v53[9] = v20;
              -[NSTextLineFragment _enumerateTextSegmentsInCharacterRange:usingBlock:](self, "_enumerateTextSegmentsInCharacterRange:usingBlock:", v54, v55, v53);
            }
          }
        }
        if (![v26 count]
          || (v42 = (void *)[v26 objectForKeyedSubscript:@"NSColor"]) == 0
          || (v43 = v42, objc_msgSend(v42, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"))))
        {
          uint64_t v44 = [(NSDictionary *)v50 objectForKeyedSubscript:@"NSColor"];
          if (v44) {
            v43 = (void *)v44;
          }
          else {
            v43 = (void *)v51;
          }
        }
        CGContextSaveGState(v20);
        CGContextGetFontRenderingStyle();
        [v24 applyToGraphicsContext:a4];
        [(NSTextLineFragment *)self _setColor:v43 inGraphicsContext:a4];
        CGContextSetCharacterSpacing(v20, 0.0);
        [v52 applyToGraphicsContext:a4];
        CGContextSetTextPosition(v20, v10, v12);
        CTFontDrawGlyphsWithAdvances();
        CGContextSetFontRenderingStyle();
        CGContextRestoreGState(v20);
        uint64_t v16 = v55 + v54;
        if (v55 + v54 >= v25) {
          break;
        }
        if (v55 >= 1)
        {
          v45 = &advances[v55];
          do
          {
            double width = advances->width;
            double height = advances->height;
            ++advances;
            double v10 = v10 + width;
            double v12 = v12 + height;
          }
          while (advances < v45);
        }
        glyphs += v55;
      }
      BOOL v8 = v48;
    }
    if (!v8) {
      -[NSTextLineFragment drawMarkedTextIndicatorAtPoint:graphicsContext:](self, "drawMarkedTextIndicatorAtPoint:graphicsContext:", a4, x, y);
    }
    if ([(NSTextLineFragment *)self rendersTextCorrectionMarkers]) {
      -[NSTextLineFragment drawTextCorrectionMarkersAtPoint:graphicsContext:](self, "drawTextCorrectionMarkersAtPoint:graphicsContext:", a4, x, y);
    }
  }
}

- (BOOL)drawMarkedTextIndicatorAtPoint:(CGPoint)a3 graphicsContext:(id)a4 backgroundOnly:(BOOL)a5 adjustmentCallback:(id)a6
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v12 = [(NSTextLineFragment *)self textLayoutFragment];
  [(NSTextLineFragment *)self characterRange];
  BOOL v14 = 0;
  if (v12 && v13)
  {
    v15 = [(NSTextLayoutFragment *)v12 textLayoutManager];
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3052000000;
    v30 = __Block_byref_object_copy__9;
    v31 = __Block_byref_object_dispose__9;
    uint64_t v32 = 0;
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    char v16 = _os_feature_enabled_impl();
    v17 = (void *)MEMORY[0x192FAE510]();
    id v18 = [(NSTextLineFragment *)self textLineFragmentRange];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __103__NSTextLineFragment_drawMarkedTextIndicatorAtPoint_graphicsContext_backgroundOnly_adjustmentCallback___block_invoke;
    v20[3] = &unk_1E55C74F8;
    BOOL v21 = a5;
    char v22 = v16 ^ 1;
    *(CGFloat *)&v20[9] = x;
    *(CGFloat *)&v20[10] = y;
    v20[4] = self;
    v20[5] = a4;
    v20[7] = &v27;
    v20[8] = &v23;
    v20[6] = a6;
    [(NSTextLayoutManager *)v15 markedTextAttributesForRange:v18 usingBlock:v20];
    if (-[__NSMarkedTextUnderlineRenderer renderUnderline:](v28[5], (uint64_t)a6)) {
      *((unsigned char *)v24 + 24) = 1;
    }

    BOOL v14 = *((unsigned char *)v24 + 24) != 0;
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);
  }
  return v14;
}

__CFDictionary *__53__NSTextLineFragment_initWithAttributedString_range___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  uint64_t v5 = [objc_loadWeak((id *)(a1 + 32)) _defaultRenderingAttributesAtCharacterIndex:a2 effectiveRange:a3];
  CGPoint result = (__CFDictionary *)objc_msgSend((id)objc_msgSend(objc_loadWeak(v4), "textLayoutFragment"), "_renderingAttributesForTextAnimationContextComponent:range:attributes:effectiveRange:", 1, *a3, a3[1], v5, a3);
  if (!result)
  {
    return +[NSTextLineFragment _hiddenContentRenderingAttributes];
  }
  return result;
}

- (id)_defaultRenderingAttributesAtCharacterIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v7 = [(NSTextLineFragment *)self attributedString];
  long long range2 = xmmword_18E5F72A0;
  BOOL v8 = [(NSTextLineFragment *)self textLayoutFragment];
  uint64_t v55 = self;
  int64_t v9 = [(NSTextLineFragment *)self applicationFrameworkContext];
  if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery])
  {
    double v10 = (objc_class *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] colorClassForApplicationFrameworkContext:v9];
  }
  else
  {
    double v10 = +[NSTextGraphicsContextProvider __defaultColorClass];
  }
  NSRange v61 = (NSRange)0;
  uint64_t v56 = [(objc_class *)v10 blackColor];
  v58 = [(NSAttributedString *)v7 attributesAtIndex:a3 effectiveRange:&v61];
  if (![(NSDictionary *)v58 objectForKeyedSubscript:@"NSTextHighlightStyle"]
    || (NSRange v59 = v61,
        [(NSAttributedString *)v7 attribute:@"NSTextHighlightStyle" atIndex:a3 effectiveRange:&v59], NSRange v11 = NSIntersectionRange(v59, v61), v59 = v11, !v11.length))
  {
    v17 = 0;
    uint64_t v13 = 0;
    if (!v8) {
      goto LABEL_75;
    }
    goto LABEL_23;
  }
  double v12 = [(NSTextLayoutFragment *)[(NSTextLineFragment *)v55 textLayoutFragment] textParagraph];
  uint64_t v13 = v12;
  if (!v12)
  {
    char v16 = 0;
    v17 = 0;
    goto LABEL_22;
  }
  NSRange v63 = (NSRange)xmmword_18E5F72A0;
  uint64_t v14 = [(NSTextParagraph *)v12 locationForCharacterIndex:v11.location dataSourceLocationsOnly:0 actualRange:&v63];
  if (v14)
  {
    uint64_t v15 = v14;
    long long v62 = xmmword_18E5F72A0;
    char v16 = [(NSTextParagraph *)v13 locationForCharacterIndex:v11.length + v11.location dataSourceLocationsOnly:0 actualRange:&v62];
    if (v16)
    {
      char v16 = [[NSTextRange alloc] initWithLocation:v15 endLocation:v16];
      if (v16)
      {
        v17 = objc_msgSend(-[NSTextLayoutManager textHighlightRenderingAttributesForTextRange:attributes:](-[NSTextLayoutFragment textLayoutManager](v8, "textLayoutManager"), "textHighlightRenderingAttributesForTextRange:attributes:", v16, v58), "objectForKeyedSubscript:", @"NSColor");
        if (v17)
        {
          uint64_t v18 = [(NSDictionary *)v58 objectForKeyedSubscript:@"NSColor"];
          uint64_t v19 = v18 ? v18 : v56;
          if (([v17 isEqual:v19] & 1) == 0)
          {
            v20 = (NSDictionary *)[(NSDictionary *)v58 mutableCopy];
            [(NSDictionary *)v20 setObject:v17 forKeyedSubscript:@"NSColor"];
            NSRange v61 = v59;
            v58 = v20;
            uint64_t v13 = (NSTextParagraph *)v20;
            goto LABEL_22;
          }
        }
        goto LABEL_21;
      }
    }
  }
  else
  {
    char v16 = 0;
  }
  v17 = 0;
LABEL_21:
  uint64_t v13 = 0;
LABEL_22:

  if (!v8) {
    goto LABEL_75;
  }
LABEL_23:
  uint64_t v21 = [(NSTextLayoutManager *)[(NSTextLayoutFragment *)v8 textLayoutManager] textContainerForLocation:[(NSTextRange *)[(NSTextLayoutFragment *)v8 rangeInElement] location]];
  id v22 = [(NSTextLayoutFragment *)v8 _resolvedRenderingAttributesForCharacterIndex:a3 effectiveRange:&range2];
  uint64_t v54 = (void *)v21;
  if (v21)
  {
    uint64_t v23 = v22;
    v57 = v17;
    int64_t v52 = a3;
    v53 = a4;
    uint64_t v24 = [v22 objectForKeyedSubscript:@"__NSTextSelectionForegroundColorAttributeName"];
    uint64_t v25 = 0;
    BOOL v8 = 0;
    v63.NSUInteger location = (NSUInteger)@"NSColor";
    v63.NSUInteger length = (NSUInteger)@"NSBackgroundColor";
    v64 = @"NSStrokeColor";
    v65 = @"NSUnderlineColor";
    v66 = @"NSStrikethroughColor";
    char v26 = (void *)v56;
    while (1)
    {
      uint64_t v27 = *(__CFString **)((char *)&v63.location + v25);
      uint64_t v28 = (void *)[v23 objectForKeyedSubscript:v27];
      int v29 = objc_msgSend(v28, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
      int v30 = v29;
      if (!v28) {
        goto LABEL_34;
      }
      uint64_t v31 = 0;
      int v32 = v29 ^ 1;
      if (@"NSColor" == v27)
      {
        int v30 = 0;
      }
      else
      {
        int v32 = 1;
        int v30 = v29;
      }
      if (!v32) {
        uint64_t v28 = v26;
      }
      if ((v32 & 1) == 0 && !v26) {
        break;
      }
LABEL_43:
      if (!v57)
      {
        BOOL v35 = v28 && @"NSColor" == v27;
        if (v35
          && (v30 & 1) == 0
          && v24
          && [(NSTextLineFragment *)v55 _selectionColorShouldOverrideColor:v28])
        {
          uint64_t v28 = (void *)v24;
          uint64_t v31 = 0;
        }
      }
      if (v28) {
        char v36 = v30;
      }
      else {
        char v36 = 1;
      }
      if ((v36 & 1) == 0)
      {
        uint64_t v37 = (void *)[v54 renderingColorForDocumentColor:v28];
        if (!v31) {
          goto LABEL_62;
        }
LABEL_61:
        if (([v37 isEqual:v28] & 1) == 0)
        {
LABEL_62:
          if (v8)
          {
            if (v30) {
              goto LABEL_64;
            }
          }
          else
          {
            if ([(NSDictionary *)v58 count]) {
              uint64_t v38 = [(NSDictionary *)v58 mutableCopy];
            }
            else {
              uint64_t v38 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
            }
            BOOL v8 = (NSTextLayoutFragment *)v38;
            if (v30) {
LABEL_64:
            }
              uint64_t v37 = (void *)[MEMORY[0x1E4F1CA98] null];
          }
          [(NSTextLayoutFragment *)v8 setObject:v37 forKeyedSubscript:v27];
        }
        char v26 = (void *)v56;
        goto LABEL_67;
      }
      if (v28)
      {
        uint64_t v37 = 0;
        if (v31) {
          goto LABEL_61;
        }
        goto LABEL_62;
      }
LABEL_67:
      v25 += 8;
      if (v25 == 40)
      {
        a3 = v52;
        a4 = v53;
        goto LABEL_75;
      }
    }
    int v30 = 0;
LABEL_34:
    uint64_t v33 = [(NSDictionary *)v58 objectForKeyedSubscript:v27];
    if (@"NSColor" == v27) {
      uint64_t v34 = v26;
    }
    else {
      uint64_t v34 = 0;
    }
    if (v33) {
      uint64_t v28 = (void *)v33;
    }
    else {
      uint64_t v28 = v34;
    }
    if (v33) {
      uint64_t v31 = v33;
    }
    else {
      uint64_t v31 = (uint64_t)v34;
    }
    goto LABEL_43;
  }
  BOOL v8 = 0;
LABEL_75:
  uint64_t v39 = [(NSTextLineFragment *)v55 renderingAttributesProvider];
  uint64_t v40 = (NSDictionary *)MEMORY[0x1E4F1CC08];
  NSRange v63 = (NSRange)xmmword_18E5F72A0;
  if (v58) {
    uint64_t v40 = v58;
  }
  if (v8) {
    uint64_t v41 = (uint64_t)v8;
  }
  else {
    uint64_t v41 = (uint64_t)v40;
  }
  if ((unint64_t)a4 | v39)
  {
    uint64_t v42 = v39;
    NSRange v63 = v61;
    v43.NSUInteger location = range2;
    NSUInteger length = v61.length;
    NSUInteger location = v61.location;
    if ((void)range2 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v43.NSUInteger length = *((void *)&range2 + 1);
      if (*((void *)&range2 + 1))
      {
        NSRange v46 = NSIntersectionRange(v63, v43);
        NSUInteger location = v46.location;
        NSUInteger length = v46.length;
      }
    }
    v69.NSUInteger location = [(NSTextLineFragment *)v55 characterRange];
    v69.NSUInteger length = v47;
    v68.NSUInteger location = location;
    v68.NSUInteger length = length;
    NSRange v48 = NSIntersectionRange(v68, v69);
    NSRange v63 = v48;
    if (v42)
    {
      NSUInteger v49 = v48.length;
      if (v48.length + v48.location > a3)
      {
        if (v48.location >= a3)
        {
          a3 = v48.location;
        }
        else
        {
          v63.NSUInteger location = a3;
          v63.NSUInteger length = v48.length + v48.location - a3;
          NSUInteger v49 = v63.length;
        }
        uint64_t v41 = (*(uint64_t (**)(uint64_t, NSTextLineFragment *, int64_t, NSUInteger, uint64_t, NSRange *))(v42 + 16))(v42, v55, a3, v49, v41, &v63);
      }
    }
    if (a4) {
      *a4 = v63;
    }
  }
  id v50 = +[NSAttributeDictionary newWithDictionary:v41];
  if (v8) {

  }
  return v50;
}

- (int64_t)applicationFrameworkContext
{
  return self->_applicationFrameworkContext;
}

- (NSAttributedString)attributedString
{
  return (NSAttributedString *)objc_getProperty(self, a2, 256, 1);
}

- (id)renderingAttributesProvider
{
  return objc_getProperty(self, a2, 248, 1);
}

- (BOOL)rendersTextCorrectionMarkers
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)drawTextCorrectionMarkersAtPoint:(CGPoint)a3 graphicsContext:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  BOOL v8 = [(NSTextLineFragment *)self textLayoutFragment];
  uint64_t v9 = [(NSTextLineFragment *)self characterRange];
  if (v8)
  {
    uint64_t v11 = v10;
    if (v10)
    {
      uint64_t v12 = v9;
      uint64_t v13 = [(NSTextLayoutFragment *)v8 textLayoutManager];
      uint64_t v14 = [(NSTextLayoutFragment *)v8 textParagraph];
      uint64_t v15 = [(NSTextRange *)[(NSTextLayoutFragment *)v8 rangeInElement] location];
      uint64_t v16 = [(NSTextParagraph *)v14 locationForCharacterIndex:v12 dataSourceLocationsOnly:0 actualRange:0];
      uint64_t v17 = [(NSTextParagraph *)v14 locationForCharacterIndex:v12 + v11 dataSourceLocationsOnly:0 actualRange:0];
      if (v16)
      {
        if (v17)
        {
          uint64_t v38 = 0;
          uint64_t v39 = &v38;
          uint64_t v40 = 0x2020000000;
          uint64_t v41 = -1;
          uint64_t v32 = 0;
          uint64_t v33 = &v32;
          uint64_t v34 = 0x3052000000;
          BOOL v35 = __Block_byref_object_copy__9;
          char v36 = __Block_byref_object_dispose__9;
          uint64_t v37 = 0;
          uint64_t v26 = 0;
          uint64_t v27 = &v26;
          uint64_t v28 = 0x3052000000;
          int v29 = __Block_byref_object_copy__9;
          int v30 = __Block_byref_object_dispose__9;
          uint64_t v31 = 0;
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __71__NSTextLineFragment_drawTextCorrectionMarkersAtPoint_graphicsContext___block_invoke;
          v25[3] = &unk_1E55C7438;
          v25[4] = v17;
          v25[5] = self;
          v25[10] = &v26;
          v25[11] = &v32;
          v25[6] = v14;
          v25[7] = v15;
          *(double *)&v25[12] = x;
          *(double *)&v25[13] = y;
          v25[8] = a4;
          v25[9] = &v38;
          [(NSTextLayoutFragment *)v8 enumerateRenderingAttributesFromLocation:v16 reverse:0 usingBlock:v25];
          uint64_t v18 = v39[3];
          if (v18 != -1)
          {
            uint64_t v19 = v33[5];
            uint64_t v20 = v27[5];
            uint64_t v21 = [[NSTextRange alloc] initWithLocation:v19 endLocation:v20];
            BOOL v22 = [(NSTextLayoutManager *)v13 _shouldDrawTextCorrectionMarkerWithType:v18 inRange:v21];

            if (v22)
            {
              if (v14)
              {
                uint64_t v23 = [(NSTextParagraph *)v14 rangeForLocation:v19 allowsTrailingEdge:0];
                uint64_t v24 = [(NSTextParagraph *)v14 rangeForLocation:v20 allowsTrailingEdge:1];
              }
              else
              {
                uint64_t v23 = [(NSTextLayoutManager *)v13 offsetFromLocation:v15 toLocation:v19];
                uint64_t v24 = [(NSTextLayoutManager *)v13 offsetFromLocation:v15 toLocation:v20];
              }
              if (v23 != 0x7FFFFFFFFFFFFFFFLL && v24 != 0x7FFFFFFFFFFFFFFFLL) {
                -[NSTextLineFragment _drawTextCorrectionMarker:characterRange:atOrigin:graphicsContext:](self, "_drawTextCorrectionMarker:characterRange:atOrigin:graphicsContext:", v18, v23, v24 - v23, a4, x, y);
              }
            }
          }

          _Block_object_dispose(&v26, 8);
          _Block_object_dispose(&v32, 8);
          _Block_object_dispose(&v38, 8);
        }
      }
    }
  }
}

- (id)textLineFragmentRange
{
  uint64_t v3 = [(NSTextLineFragment *)self characterRange];
  uint64_t v5 = v4;
  double v6 = [(NSTextLayoutFragment *)[(NSTextLineFragment *)self textLayoutFragment] textParagraph];
  if (v6)
  {
    v7 = v6;
    long long v11 = xmmword_18E5F72A0;
    double v6 = [(NSTextParagraph *)v6 locationForCharacterIndex:v3 dataSourceLocationsOnly:0 actualRange:&v11];
    if (v6)
    {
      BOOL v8 = v6;
      long long v10 = xmmword_18E5F72A0;
      double v6 = [(NSTextParagraph *)v7 locationForCharacterIndex:v3 + v5 dataSourceLocationsOnly:0 actualRange:&v10];
      if (v6) {
        double v6 = [[NSTextRange alloc] initWithLocation:v8 endLocation:v6];
      }
    }
  }
  return v6;
}

- (NSTextLayoutFragment)textLayoutFragment
{
  return (NSTextLayoutFragment *)objc_loadWeak((id *)&self->_textLayoutFragment);
}

- (void)enumerateTextSegmentBoundsInTextRange:(id)a3 dataSourceLocationsOnly:(BOOL)a4 usingBlock:(id)a5
{
  uint64_t v8 = [(NSTextLineFragment *)self characterRange];
  if (!a3) {
    return;
  }
  unint64_t v10 = v8;
  uint64_t v11 = v9;
  int v12 = [a3 isEmpty];
  if (v12)
  {
    int v13 = 0;
    int v14 = 0;
    id v15 = a3;
    goto LABEL_15;
  }
  uint64_t v16 = [(NSTextLayoutFragment *)[(NSTextLineFragment *)self textLayoutFragment] textParagraph];
  if (!v16
    || (uint64_t v17 = v16,
        *(_OWORD *)NSUInteger location = xmmword_18E5F72A0,
        (uint64_t v18 = [(NSTextParagraph *)v16 locationForCharacterIndex:v10 dataSourceLocationsOnly:0 actualRange:location]) == 0)|| (v19 = v18, v64 = xmmword_18E5F72A0, (v20 = [(NSTextParagraph *)v17 locationForCharacterIndex:v10 + v11 dataSourceLocationsOnly:0 actualRange:&v64]) == 0))
  {
    BOOL v22 = 0;
    goto LABEL_13;
  }
  uint64_t v21 = [[NSTextRange alloc] initWithLocation:v19 endLocation:v20];
  BOOL v22 = v21;
  if (!v21)
  {
LABEL_13:
    int v13 = 0;
LABEL_14:

    id v15 = a3;
    int v14 = v13;
    goto LABEL_15;
  }
  if (a4)
  {
    int v13 = 0;
    int v14 = 0;
    goto LABEL_10;
  }
  int v13 = objc_msgSend(-[NSTextRange location](v21, "location"), "isEqual:", objc_msgSend(a3, "location"));
  int v59 = objc_msgSend(-[NSTextRange endLocation](v22, "endLocation"), "isEqual:", objc_msgSend(a3, "endLocation"));
  int v14 = v59;
  if (v13 && v59)
  {
    int v13 = 1;
    goto LABEL_14;
  }
LABEL_10:
  id v15 = (id)[a3 textRangeByIntersectingWithTextRange:v22];

  if (!v15) {
    return;
  }
LABEL_15:
  [(NSTextLineFragment *)self typographicBounds];
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  int v30 = v29;
  [(NSTextLineFragment *)self glyphOrigin];
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  BOOL v35 = [(NSTextLayoutFragment *)[(NSTextLineFragment *)self textLayoutFragment] textParagraph];
  unint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  if (v35)
  {
    uint64_t v37 = v35;
    int v60 = v14;
    uint64_t v38 = v11;
    int v39 = v12;
    uint64_t v40 = -[NSTextParagraph rangeForLocation:allowsTrailingEdge:](v35, "rangeForLocation:allowsTrailingEdge:", [v15 location], 1);
    int v41 = [v15 isEmpty];
    if (v40 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v12 = v39;
      if (v41)
      {
        uint64_t v11 = v38;
        if (objc_msgSend(-[NSTextRange endLocation](-[NSTextParagraph paragraphContentRange](v37, "paragraphContentRange"), "endLocation"), "isEqual:", objc_msgSend(v15, "location")))
        {
          uint64_t v42 = [(NSTextLineFragment *)self characterRange];
          unint64_t v43 = 0;
          unint64_t v36 = v42 + v44;
        }
        else
        {
          unint64_t v43 = 0;
        }
        goto LABEL_32;
      }
      unint64_t v43 = 0;
    }
    else
    {
      if (v41)
      {
        unint64_t v43 = 0;
        unint64_t v36 = v40;
      }
      else
      {
        unint64_t v45 = -[NSTextParagraph rangeForLocation:allowsTrailingEdge:](v37, "rangeForLocation:allowsTrailingEdge:", [v15 endLocation], 1);
        uint64_t v46 = [(NSTextLineFragment *)self characterRange];
        if (v45 <= v46 + v47) {
          unint64_t v43 = v45 - v40;
        }
        else {
          unint64_t v43 = 0;
        }
        if (v45 <= v46 + v47) {
          unint64_t v36 = v40;
        }
        else {
          unint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      int v12 = v39;
    }
    uint64_t v11 = v38;
LABEL_32:
    int v14 = v60;
    goto LABEL_33;
  }
  unint64_t v43 = 0;
LABEL_33:
  BOOL v48 = v10 < v36;
  BOOL v49 = (v13 & v48) == 0;
  if ((v13 & v48) != 0) {
    unint64_t v50 = v10;
  }
  else {
    unint64_t v50 = v36;
  }
  if (!v49) {
    unint64_t v43 = v43 - v10 + v36;
  }
  if (v10 + v11 <= v50 + v43) {
    unint64_t v51 = v43;
  }
  else {
    unint64_t v51 = v10 + v11 - v50;
  }
  if (v14) {
    unint64_t v52 = v51;
  }
  else {
    unint64_t v52 = v43;
  }
  if (v52)
  {
    objc_initWeak(location, self);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __95__NSTextLineFragment_enumerateTextSegmentBoundsInTextRange_dataSourceLocationsOnly_usingBlock___block_invoke;
    v62[3] = &unk_1E55C7348;
    objc_copyWeak(v63, location);
    v63[1] = v24;
    v63[2] = v26;
    v63[3] = v28;
    v63[4] = v30;
    v63[5] = v32;
    v63[6] = v34;
    v62[4] = a5;
    -[NSTextLineFragment _enumerateTextSegmentsInCharacterRange:usingBlock:](self, "_enumerateTextSegmentsInCharacterRange:usingBlock:", v50, v52, v62);
    objc_destroyWeak(v63);
    objc_destroyWeak(location);
  }
  else if (v12)
  {
    uint64_t v53 = [(NSTextLineFragment *)self characterRange];
    uint64_t v55 = v54;
    unint64_t v56 = [(NSTextLineFragment *)self characterRange];
    BOOL v58 = v50 - v56 < v57 && v50 >= v56;
    if (v58 || v50 == v53 + v55)
    {
      [(NSTextLineFragment *)self locationForCharacterAtIndex:v50];
      (*((void (**)(id, id))a5 + 2))(a5, a3);
    }
  }
}

- (NSRange)characterRange
{
  objc_copyStruct(v4, &self->_characterRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

- (CGPoint)locationForCharacterAtIndex:(NSInteger)index
{
  double x = self->_glyphOrigin.x;
  double y = self->_glyphOrigin.y;
  if (+[NSTextLayoutFragment coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled])
  {
    double x = x + self->_typographicBounds.origin.x;
    double y = y + self->_typographicBounds.origin.y;
  }
  uint64_t v28 = 0;
  int v29 = (CGFloat *)&v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  lineRef = self->_lineRef;
  if (lineRef)
  {
    OffsetForStringIndedouble x = CTLineGetOffsetForStringIndex(lineRef, index, 0);
    unint64_t v10 = v29;
    v29[3] = OffsetForStringIndex;
    uint64_t v11 = v10 + 3;
  }
  else if (self->_glyphs)
  {
    uint64_t v15 = [(NSTextLineFragment *)self characterRange];
    [(NSTextLineFragment *)self characterRange];
    uint64_t v16 = index - v15;
    if (v16 > v17)
    {
      uint64_t v27 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      v32.NSUInteger location = [(NSTextLineFragment *)self characterRange];
      [v27 handleFailureInMethod:a2, self, @"NSTextLineFragment.m", 1157, @"characterIndex %ld is out of bounds %@", v16, NSStringFromRange(v32) object file lineNumber description];
    }
    int64_t elasticGlyphCount = self->_elasticGlyphCount;
    if (v16 >= elasticGlyphCount + self->_glyphCount) {
      uint64_t v19 = elasticGlyphCount + self->_glyphCount;
    }
    else {
      uint64_t v19 = v16;
    }
    if (v19 >= 1)
    {
      advances = self->_advances;
      uint64_t v21 = &advances[v19];
      BOOL v22 = v29;
      double v23 = v29[3];
      do
      {
        double width = advances->width;
        ++advances;
        double v23 = width + v23;
        v22[3] = v23;
      }
      while (advances < v21);
    }
    unint64_t v25 = [(NSTextLineFragment *)self _rangeOfLigatureContainingCharacterIndex:v19];
    uint64_t v11 = v29 + 3;
    if (v25 < v19 && v26 >= 2)
    {
      v29[3] = v29[3] - self->_advances[v25].width;
      -[NSTextLineFragment _getCaretPositionsForCharactersInRange:positionsCache:positionsCacheSize:block:](self, "_getCaretPositionsForCharactersInRange:positionsCache:positionsCacheSize:block:");
      uint64_t v11 = v29 + 3;
    }
  }
  else
  {
    uint64_t v11 = (double *)&v31;
  }
  double v12 = x + *v11;
  _Block_object_dispose(&v28, 8);
  double v13 = v12;
  double v14 = y;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (_NSRange)_rangeOfLigatureContainingCharacterIndex:(unint64_t)a3
{
  unint64_t v3 = self->_elasticGlyphCount + self->_glyphCount;
  if (v3 == a3)
  {
    NSUInteger v4 = 0;
    NSUInteger v5 = a3;
  }
  else
  {
    if (a3)
    {
      NSUInteger v5 = a3;
      do
      {
        if ((__int16)self->_glyphs[v5] != -1) {
          break;
        }
        --v5;
      }
      while (v5);
    }
    else
    {
      NSUInteger v5 = 0;
    }
    unint64_t v7 = a3 + 1;
    if (v3 <= a3 + 1) {
      unint64_t v8 = a3 + 1;
    }
    else {
      unint64_t v8 = v3;
    }
    while (v7 < v3)
    {
      int v9 = (__int16)self->_glyphs[v7++];
      if (v9 != -1)
      {
        unint64_t v8 = v7 - 1;
        break;
      }
    }
    NSUInteger v4 = v8 - v5;
  }
  result.NSUInteger length = v4;
  result.NSUInteger location = v5;
  return result;
}

- (void)drawMarkedTextIndicatorAtPoint:(CGPoint)a3 graphicsContext:(id)a4 adjustmentCallback:(id)a5
{
}

- (void)drawMarkedTextIndicatorAtPoint:(CGPoint)a3 graphicsContext:(id)a4
{
}

- (BOOL)drawMarkedTextBackgroundAtPoint:(CGPoint)a3 graphicsContext:(id)a4 adjustmentCallback:(id)a5
{
  return -[NSTextLineFragment drawMarkedTextIndicatorAtPoint:graphicsContext:backgroundOnly:adjustmentCallback:](self, "drawMarkedTextIndicatorAtPoint:graphicsContext:backgroundOnly:adjustmentCallback:", a4, 1, a5, a3.x, a3.y);
}

- (BOOL)drawMarkedTextBackgroundAtPoint:(CGPoint)a3 graphicsContext:(id)a4
{
  return -[NSTextLineFragment drawMarkedTextBackgroundAtPoint:graphicsContext:adjustmentCallback:](self, "drawMarkedTextBackgroundAtPoint:graphicsContext:adjustmentCallback:", a4, 0, a3.x, a3.y);
}

- (id)_renderingAttributeOverridesProvider
{
  return objc_getProperty(self, a2, 240, 1);
}

void __95__NSTextLineFragment_enumerateTextSegmentBoundsInTextRange_dataSourceLocationsOnly_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  unint64_t v10 = objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)(a1 + 40)), "textLayoutFragment"), "textParagraph");
  if (v10
    && (uint64_t v11 = v10,
        long long v16 = xmmword_18E5F72A0,
        (uint64_t v12 = [v10 locationForCharacterIndex:a2 dataSourceLocationsOnly:0 actualRange:&v16]) != 0))
  {
    uint64_t v13 = v12;
    long long v15 = xmmword_18E5F72A0;
    double v14 = (NSTextRange *)[v11 locationForCharacterIndex:a2 + a3 dataSourceLocationsOnly:0 actualRange:&v15];
    if (v14) {
      double v14 = [[NSTextRange alloc] initWithLocation:v13 endLocation:v14];
    }
  }
  else
  {
    double v14 = 0;
  }
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 48) + *(double *)(a1 + 80) + a4, *(double *)(a1 + 56), a5 - a4, *(double *)(a1 + 72));
}

- (void)_enumerateTextSegmentsInCharacterRange:(_NSRange)a3 usingBlock:(id)a4
{
  BOOL v5 = +[NSTextLayoutFragment coordinateSystemCompatibilityFor2022AndEarlierSDKEnabled];
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    double v6 = 0.0;
    if (v5)
    {
      [(NSTextLineFragment *)self typographicBounds];
      double v8 = v7;
      [(NSTextLineFragment *)self glyphOrigin];
      double v6 = v8 + v9;
    }
    [(NSTextLineFragment *)self locationForCharacterAtIndex:a3.location];
    double v11 = v10;
    [(NSTextLineFragment *)self locationForCharacterAtIndex:a3.location + a3.length];
    uint64_t v13 = (void (*)(__n128, __n128))*((void *)a4 + 2);
    v14.n128_f64[0] = v12.n128_f64[0] - v6;
    v12.n128_f64[0] = v11 - v6;
    v13(v12, v14);
    return;
  }
  CFArrayRef GlyphRuns = CTLineGetGlyphRuns(self->_lineRef);
  CFIndex Count = CFArrayGetCount(GlyphRuns);
  if (Count < 1) {
    return;
  }
  CFIndex v16 = 0;
  NSUInteger length = 0;
  double v18 = 0.0;
  NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  double v20 = 0.0;
  BOOL v35 = self;
  do
  {
    lineRef = self->_lineRef;
    CFArrayRef v22 = CTLineGetGlyphRuns(lineRef);
    ValueAtIndedouble x = (const __CTRun *)CFArrayGetValueAtIndex(v22, v16);
    CFRange StringRange = CTRunGetStringRange(ValueAtIndex);
    NSRange v25 = NSIntersectionRange(a3, (NSRange)StringRange);
    CGFloat v39 = 0.0;
    CGFloat secondaryOffset = 0.0;
    char Status = CTRunGetStatus(ValueAtIndex);
    if (!v25.length)
    {
      double v33 = 0.0;
      if (!length)
      {
        double v18 = 0.0;
        double v20 = 0.0;
        goto LABEL_37;
      }
      OffsetForStringIndedouble x = 0.0;
LABEL_34:
      (*((void (**)(id, NSUInteger, NSUInteger, double, double))a4 + 2))(a4, location, length, v20, v18);
      double v18 = v33;
      NSUInteger length = v25.length;
      double v20 = OffsetForStringIndex;
LABEL_37:
      NSUInteger location = v25.location;
      goto LABEL_40;
    }
    unsigned int v27 = Status & 1;
    OffsetForStringIndedouble x = CTLineGetOffsetForStringIndex(lineRef, v25.location, &secondaryOffset);
    if (OffsetForStringIndex != secondaryOffset && v25.location == StringRange.location) {
      OffsetForStringIndedouble x = getWidthOfRuns(lineRef, 0, v16 + v27);
    }
    NSUInteger v30 = v25.location + v25.length;
    double WidthOfRuns = CTLineGetOffsetForStringIndex(lineRef, v25.location + v25.length, &v39);
    if (WidthOfRuns != v39 && v30 == StringRange.location + StringRange.length) {
      double WidthOfRuns = getWidthOfRuns(lineRef, 0, v16 + (v27 ^ 1));
    }
    if (WidthOfRuns >= OffsetForStringIndex) {
      double v33 = WidthOfRuns;
    }
    else {
      double v33 = OffsetForStringIndex;
    }
    if (WidthOfRuns < OffsetForStringIndex) {
      OffsetForStringIndedouble x = WidthOfRuns;
    }
    if (length)
    {
      if (OffsetForStringIndex - v18 >= 0.001 || location + length != v25.location && v30 != location)
      {
        self = v35;
        goto LABEL_34;
      }
      v42.NSUInteger location = location;
      v42.NSUInteger length = length;
      NSRange v34 = NSUnionRange(v42, v25);
      NSUInteger location = v34.location;
      NSUInteger length = v34.length;
      double v18 = v33;
    }
    else
    {
      double v18 = v33;
      NSUInteger length = v25.length;
      double v20 = OffsetForStringIndex;
      NSUInteger location = v25.location;
    }
    self = v35;
LABEL_40:
    ++v16;
  }
  while (Count != v16);
  if (length) {
    (*((void (**)(id, NSUInteger, NSUInteger, double, double))a4 + 2))(a4, location, length, v20, v18);
  }
}

- (CGRect)boundsWithType:(int64_t)a3 options:(unint64_t)a4
{
  if (a3 != 2)
  {
    [(NSTextLineFragment *)self typographicBounds];
    double v6 = v15;
    double v19 = v18;
    double v10 = v16;
    double v20 = v17;
    uint64_t v34 = 0;
    BOOL v35 = (double *)&v34;
    uint64_t v36 = 0x4010000000;
    uint64_t v37 = "";
    long long v21 = *(_OWORD *)(MEMORY[0x1E4F28250] + 16);
    long long v38 = *MEMORY[0x1E4F28250];
    long long v39 = v21;
    if (a3)
    {
      if (a3 != 1)
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSTextLineFragment.m", 341, @"unhandled NSTextLineFragmentBounds type %lu", a3);
        double v6 = *MEMORY[0x1E4F1DB20];
        double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
        goto LABEL_9;
      }
      CFArrayRef v22 = v33;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __45__NSTextLineFragment_boundsWithType_options___block_invoke;
      v33[3] = &unk_1E55C7230;
    }
    else
    {
      CFArrayRef v22 = v32;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __45__NSTextLineFragment_boundsWithType_options___block_invoke_2;
      v32[3] = &unk_1E55C7258;
      *(double *)&v32[5] = v15;
      *(double *)&v32[6] = v19;
      *(double *)&v32[7] = v16;
      *(double *)&v32[8] = v17;
    }
    v22[4] = &v34;
    double v23 = [(NSTextLineFragment *)self attributedString];
    uint64_t v24 = [(NSTextLineFragment *)self characterRange];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __45__NSTextLineFragment_boundsWithType_options___block_invoke_3;
    v31[3] = &unk_1E55C7280;
    v31[4] = v22;
    -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](v23, "enumerateAttributesInRange:options:usingBlock:", v24, v25, 0x100000, v31);
    double v26 = v35[4];
    double v8 = v19 - v26;
    double v12 = v20 + v26 + v35[6];
LABEL_9:
    _Block_object_dispose(&v34, 8);
    goto LABEL_10;
  }
  [(NSTextLineFragment *)self imageBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
LABEL_10:
  double v27 = v6;
  double v28 = v8;
  double v29 = v10;
  double v30 = v12;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (CGRect)imageBounds
{
  if (CGRectIsNull(self->_imageBounds))
  {
    lineRef = self->_lineRef;
    if (lineRef)
    {
      CGFloat x = *MEMORY[0x1E4F1DB28];
      CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      CFArrayRef GlyphRuns = CTLineGetGlyphRuns(self->_lineRef);
      if (CFArrayGetCount(GlyphRuns) >= 1)
      {
        CFIndex v9 = 0;
        do
        {
          CFArrayGetValueAtIndex(GlyphRuns, v9);
          Font = (const __CTFont *)CTRunGetFont();
          if (Font)
          {
            double v11 = Font;
            CFTypeID v12 = CFGetTypeID(Font);
            if (v12 == CTFontGetTypeID())
            {
              BoundingBoCGFloat x = CTFontGetBoundingBox(v11);
              v45.origin.CGFloat x = x;
              v45.origin.CGFloat y = y;
              v45.size.CGFloat width = width;
              v45.size.CGFloat height = height;
              CGRect v46 = CGRectUnion(v45, BoundingBox);
              CGFloat x = v46.origin.x;
              CGFloat y = v46.origin.y;
              CGFloat width = v46.size.width;
              CGFloat height = v46.size.height;
            }
          }
          ++v9;
        }
        while (v9 < CFArrayGetCount(GlyphRuns));
      }
      ascent.double a = 0.0;
      descent.double a = 0.0;
      double TypographicBounds = CTLineGetTypographicBounds(lineRef, &ascent.a, &descent.a, 0);
      v47.origin.CGFloat x = x;
      v47.origin.CGFloat y = y;
      v47.size.CGFloat width = width;
      v47.size.CGFloat height = height;
      double v14 = -CGRectGetMinY(v47);
      v48.origin.CGFloat x = x;
      v48.origin.CGFloat y = y;
      v48.size.CGFloat width = width;
      v48.size.CGFloat height = height;
      double MaxY = CGRectGetMaxY(v48);
      v49.origin.CGFloat x = x;
      v49.origin.CGFloat y = y;
      v49.size.CGFloat width = width;
      v49.size.CGFloat height = height;
      double MinX = CGRectGetMinX(v49);
      v50.origin.CGFloat x = x;
      v50.origin.CGFloat y = y;
      v50.size.CGFloat width = width;
      v50.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v50);
      double a = ascent.a;
      if (ascent.a < MaxY) {
        double a = MaxY;
      }
      double v19 = descent.a;
      if (descent.a < v14) {
        double v19 = v14;
      }
      double v20 = -v19;
      double v21 = TypographicBounds - MinX + MaxX;
      double v22 = a + v19;
    }
    else
    {
      double v27 = self->_font;
      if (v27)
      {
        glyphs = self->_glyphs;
        advances = self->_advances;
        int64_t glyphCount = self->_glyphCount;
        CGRect v54 = CTFontGetBoundingBox((CTFontRef)v27);
        double MinX = *MEMORY[0x1E4F1DB28];
        double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        if (glyphCount)
        {
          double v31 = v54.origin.x;
          double v32 = v54.origin.y;
          CGFloat v33 = v54.size.width;
          CGFloat v34 = v54.size.height;
          uint64_t v35 = 0;
          float64x2_t v36 = *(float64x2_t *)MEMORY[0x1E4F1DAD8];
          do
          {
            if ((__int16)glyphs[v35] != -1)
            {
              double v37 = v31 + v36.f64[0];
              double v38 = v32 + v36.f64[1];
              float64x2_t v36 = vaddq_f64(v36, (float64x2_t)advances[v35]);
              if (v35)
              {
                v55.origin.CGFloat x = MinX;
                float64x2_t v41 = v36;
                v55.origin.CGFloat y = v20;
                v55.size.CGFloat width = v21;
                v55.size.CGFloat height = v22;
                CGFloat v39 = v33;
                CGFloat v40 = v34;
                CGRect v56 = CGRectUnion(v55, *(CGRect *)&v37);
                double MinX = v56.origin.x;
                double v20 = v56.origin.y;
                float64x2_t v36 = v41;
                double v21 = v56.size.width;
                double v22 = v56.size.height;
              }
              else
              {
                double v22 = v34;
                double v21 = v33;
                double v20 = v38;
                double MinX = v37;
              }
            }
            ++v35;
          }
          while (glyphCount != v35);
        }
      }
      else
      {
        double MinX = *MEMORY[0x1E4F1DB28];
        double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      }
    }
    long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&ascent.double a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&ascent.c = v23;
    double v24 = self->_typographicBounds.origin.y;
    double v25 = self->_glyphOrigin.y;
    CGFloat v26 = self->_typographicBounds.origin.x + self->_glyphOrigin.x;
    *(_OWORD *)&ascent.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&descent.double a = *(_OWORD *)&ascent.a;
    *(_OWORD *)&descent.c = v23;
    *(_OWORD *)&descent.tCGFloat x = *(_OWORD *)&ascent.tx;
    CGAffineTransformTranslate(&ascent, &descent, v26, v24 + v25);
    CGAffineTransform v42 = ascent;
    CGAffineTransformScale(&descent, &v42, 1.0, -1.0);
    CGAffineTransform ascent = descent;
    v51.origin.CGFloat x = MinX;
    v51.origin.CGFloat y = v20;
    v51.size.CGFloat width = v21;
    v51.size.CGFloat height = v22;
    CGRect v52 = CGRectApplyAffineTransform(v51, &descent);
    CGRect result = CGRectIntegral(v52);
    self->_imageBounds = result;
  }
  else
  {
    return self->_imageBounds;
  }
  return result;
}

- (void)_enumerateTextAttachmentFramesInCharacterRange:(_NSRange)a3 usingBlock:(id)a4
{
  lineRef = self->_lineRef;
  if (lineRef)
  {
    CFArrayRef GlyphRuns = CTLineGetGlyphRuns(lineRef);
    CFIndex Count = CFArrayGetCount(GlyphRuns);
    [(NSTextLineFragment *)self glyphOrigin];
    if (Count >= 1)
    {
      double v11 = v9;
      double v12 = v10;
      CFIndex v13 = 0;
      uint64_t v14 = *MEMORY[0x1E4F247B0];
      do
      {
        ValueAtIndeCGFloat x = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v13);
        CFDictionaryRef Attributes = CTRunGetAttributes(ValueAtIndex);
        if ([(__CFDictionary *)Attributes objectForKeyedSubscript:v14])
        {
          uint64_t v17 = [(__CFDictionary *)Attributes objectForKeyedSubscript:@"NSAttachment"];
          if (v17)
          {
            uint64_t v18 = v17;
            CFIndex location = CTRunGetStringRange(ValueAtIndex).location;
            buffer.CGFloat x = 0.0;
            buffer.CGFloat y = 0.0;
            double v21 = 0.0;
            CGFloat ascent = 0.0;
            v24.CFIndex location = 0;
            v24.NSUInteger length = 0;
            double TypographicBounds = CTRunGetTypographicBounds(ValueAtIndex, v24, &ascent, &v21, 0);
            v25.CFIndex location = 0;
            v25.NSUInteger length = 1;
            CTRunGetPositions(ValueAtIndex, v25, &buffer);
            (*((void (**)(id, uint64_t, CFIndex, double, double, double, double))a4 + 2))(a4, v18, location, v11 + buffer.x, v12 - (buffer.y - v21), TypographicBounds, v21 + ascent);
          }
        }
        ++v13;
      }
      while (Count != v13);
    }
  }
}

- (NSTextLineFragment)initWithString:(NSString *)string attributes:(NSDictionary *)attributes range:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  double v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:string attributes:attributes];
  double v9 = -[NSTextLineFragment initWithAttributedString:range:](self, "initWithAttributedString:range:", v8, location, length);

  [(NSTextLineFragment *)v9 invalidateCache];
  return v9;
}

- (void)setTypographicBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  objc_sync_enter(self);
  self->_typographicBounds.origin.CGFloat x = x;
  self->_typographicBounds.origin.CGFloat y = y;
  uint64_t v8 = MEMORY[0x1E4F1DB20];
  self->_typographicBounds.size.CGFloat width = width;
  self->_typographicBounds.size.CGFloat height = height;
  CGSize v9 = *(CGSize *)(v8 + 16);
  self->_imageBounds.origin = *(CGPoint *)v8;
  self->_imageBounds.size = v9;

  objc_sync_exit(self);
}

- (void)setTextLayoutFragment:(id)a3
{
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
}

- (void)setGlyphOrigin:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  objc_sync_enter(self);
  uint64_t v6 = MEMORY[0x1E4F1DB20];
  self->_glyphOrigin.CGFloat x = x;
  self->_glyphOrigin.CGFloat y = y;
  CGSize v7 = *(CGSize *)(v6 + 16);
  self->_imageBounds.origin = *(CGPoint *)v6;
  self->_imageBounds.size = v7;

  objc_sync_exit(self);
}

- (void)setApplicationFrameworkContext:(int64_t)a3
{
  self->_applicationFrameworkContext = a3;
}

- (NSTextLineFragment)initWithAttributedString:(NSAttributedString *)attributedString range:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger v5 = range.location;
  if (range.location + range.length > [(NSAttributedString *)attributedString length])
  {

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C4A8] format:@"The range is out side of the attributed string length."];
    self = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)NSTextLineFragment;
  uint64_t v8 = [(NSTextLineFragment *)&v16 init];
  if (v8)
  {
    objc_initWeak(&location, v8);
    v8->_applicationFrameworkContext = _NSTextScalingTypeForCurrentEnvironment();
    v8->_attributedString = (NSAttributedString *)[(NSAttributedString *)attributedString copyWithZone:0];
    v8->_characterRange.id location = v5;
    v8->_characterRange.NSUInteger length = length;
    [(NSTextLineFragment *)v8 setRendersTextCorrectionMarkers:1];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    double v12 = __53__NSTextLineFragment_initWithAttributedString_range___block_invoke;
    CFIndex v13 = &unk_1E55C7208;
    objc_copyWeak(&v14, &location);
    [(NSTextLineFragment *)v8 set_renderingAttributeOverridesProvider:&v10];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  [(NSTextLineFragment *)v8 invalidateCache];
  return v8;
}

- (void)setRendersTextCorrectionMarkers:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (void)invalidateCache
{
  self->_activeRun = 0;
  self->_activeRunIndeCGFloat x = 0x7FFFFFFFFFFFFFFFLL;
  CGSize v2 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  self->_imageBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  self->_imageBounds.size = v2;
}

- (void)set_renderingAttributeOverridesProvider:(id)a3
{
}

- (void)setLineRef:(__CTLine *)a3
{
  objc_sync_enter(self);
  lineRef = self->_lineRef;
  if (lineRef != a3)
  {
    if (lineRef) {
      CFRelease(lineRef);
    }
    self->_lineRef = (__CTLine *)CFRetain(a3);
    [(NSTextLineFragment *)self invalidateCache];
    int IsRightToLeft = CTLineIsRightToLeft();
    char v7 = IsRightToLeft ? 2 : 0;
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v7;
    if ((IsRightToLeft & 1) == 0)
    {
      if (CTLineHasBidiLevels())
      {
        CFArrayRef GlyphRuns = CTLineGetGlyphRuns(self->_lineRef);
        CFIndex Count = CFArrayGetCount(GlyphRuns);
        if (Count >= 1)
        {
          CFIndex v10 = 0;
          while (1)
          {
            ValueAtIndeCGFloat x = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v10);
            if (CTRunGetStatus(ValueAtIndex)) {
              break;
            }
            if (Count == ++v10) {
              goto LABEL_15;
            }
          }
          *(unsigned char *)&self->_flags |= 2u;
        }
      }
    }
  }
LABEL_15:

  objc_sync_exit(self);
}

- (void)setIsTruncated:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (void)setIsHyphenated:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (void)setGlyphs:(const unsigned __int16 *)a3 advances:(const CGSize *)a4 count:(int64_t)a5 elasticCount:(unint64_t)a6 font:(id)a7
{
  NSUInteger v13 = a6 + a5;
  NSUInteger v14 = 2 * (a6 + a5);
  self->_glyphs = (unsigned __int16 *)NSZoneMalloc(0, v14);
  v13 *= 16;
  self->_advances = (CGSize *)NSZoneMalloc(0, v13);
  memcpy(self->_glyphs, a3, v14);
  memcpy(self->_advances, a4, v13);
  self->_int64_t glyphCount = a5;
  self->_int64_t elasticGlyphCount = a6;
  self->_font = (UIFont *)a7;
  [(NSTextLineFragment *)self invalidateCache];
  *(unsigned char *)&self->_flags &= ~2u;
}

- (void)setIsExtra:(BOOL)a3
{
  self->_isExtrdouble a = a3;
}

- (void)enumerateCaretOffsetsWithTextSelectionDataSource:(id)a3 baseLocation:(id)a4 usingBlock:(id)a5
{
  [(NSTextLineFragment *)self typographicBounds];
  double v10 = v9;
  [(NSTextLineFragment *)self glyphOrigin];
  double v12 = v10 + v11;
  NSUInteger v13 = [(NSTextLayoutFragment *)[(NSTextLineFragment *)self textLayoutFragment] textParagraph];
  NSUInteger v14 = (void *)MEMORY[0x192FAE510]();
  if (self->_lineRef)
  {
    [(NSTextLineFragment *)self typographicBounds];
    double v17 = v15 + v16;
    [(NSTextLineFragment *)self padding];
    double v19 = v17 - v18;
    CFRange StringRange = CTLineGetStringRange(self->_lineRef);
    lineRef = self->_lineRef;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__NSTextLineFragment_enumerateCaretOffsetsWithTextSelectionDataSource_baseLocation_usingBlock___block_invoke;
    block[3] = &unk_1E55C7320;
    *(double *)&block[9] = v12;
    *(double *)&block[10] = v19;
    block[4] = v13;
    block[5] = a3;
    block[6] = a4;
    block[7] = self;
    CFRange v32 = StringRange;
    block[8] = a5;
    CTLineEnumerateCaretOffsets(lineRef, block);
  }
  else if (self->_elasticGlyphCount + self->_glyphCount < 1)
  {
    if (self->_characterRange.length
      || (double v27 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)&self->_textLayoutFragment), "textLayoutManager"), "textContentManager"), "documentRange")) != 0&& objc_msgSend(a4, "isEqual:", objc_msgSend(v27, "endLocation")))
    {
      LOBYTE(v30) = 0;
      (*((void (**)(id, uint64_t, uint64_t, uint64_t *, double))a5 + 2))(a5, [a3 locationFromLocation:a4 withOffset:0], 1, &v30, v12);
    }
  }
  else
  {
    unint64_t v22 = 0;
    ptr = 0;
    uint64_t v30 = 0;
    char v28 = 0;
    do
    {
      unint64_t v23 = self->_elasticGlyphCount + self->_glyphCount;
      if (v22 >= v23) {
        break;
      }
      double v24 = v12 + self->_advances[v22].width;
      unint64_t v25 = v22 + 1;
      while (v23 != v25)
      {
        int v26 = (__int16)self->_glyphs[v25++];
        if (v26 != -1)
        {
          unint64_t v23 = v25 - 1;
          break;
        }
      }
      -[NSTextLineFragment _processCaretGlyphRunForTextSelectionProvider:baseLocation:runRange:glyphOffset:positionsCache:positionsCacheSize:stop:usingBlock:](self, "_processCaretGlyphRunForTextSelectionProvider:baseLocation:runRange:glyphOffset:positionsCache:positionsCacheSize:stop:usingBlock:", a3, a4, v22, v23 - v22, &ptr, &v30, v12, &v28, a5);
      unint64_t v22 = v23;
      double v12 = v24;
    }
    while (!v28);
    if (ptr) {
      NSZoneFree(0, ptr);
    }
  }
}

- (void)_processCaretGlyphRunForTextSelectionProvider:(id)a3 baseLocation:(id)a4 runRange:(_NSRange)a5 glyphOffset:(double)a6 positionsCache:(double *)a7 positionsCacheSize:(unint64_t *)a8 stop:(BOOL *)a9 usingBlock:(id)a10
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  [(NSTextLineFragment *)self typographicBounds];
  double v20 = v18 + v19;
  [(NSTextLineFragment *)self padding];
  v22[1] = 3221225472;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[2] = __152__NSTextLineFragment__processCaretGlyphRunForTextSelectionProvider_baseLocation_runRange_glyphOffset_positionsCache_positionsCacheSize_stop_usingBlock___block_invoke;
  v22[3] = &unk_1E55C72F8;
  *(double *)&v22[8] = a6;
  *(double *)&v22[9] = v20 - v21;
  v22[4] = a3;
  v22[5] = a4;
  v22[10] = location;
  v22[11] = length;
  v22[6] = a10;
  v22[7] = a9;
  -[NSTextLineFragment _getCaretPositionsForCharactersInRange:positionsCache:positionsCacheSize:block:](self, "_getCaretPositionsForCharactersInRange:positionsCache:positionsCacheSize:block:", location, length, a7, a8, v22);
}

- (double)padding
{
  return self->_padding;
}

- (void)_getCaretPositionsForCharactersInRange:(_NSRange)a3 positionsCache:(double *)a4 positionsCacheSize:(unint64_t *)a5 block:(id)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  int v12 = self->_glyphs[a3.location];
  if (a3.location && v12 == 0xFFFF) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSTextLineFragment.m", 485, @"attempt to get caret positions for deleted glyph at index %lu", a3.location);
  }
  double width = self->_advances[location].width;
  uint64_t v36 = 0;
  double v37 = &v36;
  uint64_t v38 = 0x2020000000;
  CGFloat v39 = v40;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  uint64_t v30 = __101__NSTextLineFragment__getCaretPositionsForCharactersInRange_positionsCache_positionsCacheSize_block___block_invoke;
  double v31 = &unk_1E55C72A8;
  CFRange v32 = &v36;
  CGFloat v33 = a4;
  CGFloat v34 = a5;
  uint64_t v35 = v40;
  if (length < 2) {
    goto LABEL_16;
  }
  CFIndex LigatureCaretPositions = CTFontGetLigatureCaretPositions((CTFontRef)self->_font, v12, 0, 0);
  CFIndex v15 = LigatureCaretPositions;
  if (LigatureCaretPositions)
  {
    uint64_t v16 = LigatureCaretPositions + 2;
    v30((char *)v29, LigatureCaretPositions + 2);
    *(void *)v37[3] = 0;
    CTFontGetLigatureCaretPositions((CTFontRef)self->_font, v12, (CGFloat *)(v37[3] + 8), v15);
    *(double *)(v37[3] + 8 * v15 + 8) = width;
    if (v15 == -2)
    {
LABEL_16:
      v30((char *)v29, 2uLL);
      *(void *)v37[3] = 0;
      *(double *)(v37[3] + 8) = width;
      uint64_t v16 = 2;
    }
  }
  else
  {
    double v17 = [(NSAttributedString *)[(NSTextLineFragment *)self attributedString] string];
    NSUInteger v18 = [(NSTextLineFragment *)self characterRange] + location;
    if (length == 2 && [(NSString *)v17 characterAtIndex:v18] >> 10 == 54) {
      goto LABEL_16;
    }
    uint64_t v25 = 0;
    int v26 = &v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0;
    uint64_t v19 = [MEMORY[0x1E4F28B88] controlCharacterSet];
    uint64_t v20 = [(NSString *)v17 length];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __101__NSTextLineFragment__getCaretPositionsForCharactersInRange_positionsCache_positionsCacheSize_block___block_invoke_2;
    v24[3] = &unk_1E55C72D0;
    v24[4] = v19;
    v24[5] = &v25;
    v24[6] = v18 + length;
    -[NSString enumerateSubstringsInRange:options:usingBlock:](v17, "enumerateSubstringsInRange:options:usingBlock:", v18, v20 - v18, 5, v24);
    uint64_t v21 = v26[3];
    if (v21 < 2)
    {
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v16 = v21 + 1;
      v30((char *)v29, v21 + 1);
      double v22 = width / (double)v26[3];
      *(void *)v37[3] = 0;
      for (uint64_t i = 1; i != v21; ++i)
        *(double *)(v37[3] + 8 * i) = v22 * (double)i;
      *(double *)(v37[3] + 8 * v21) = width;
    }
    _Block_object_dispose(&v25, 8);
    if (!v16) {
      goto LABEL_16;
    }
  }
  (*((void (**)(id, uint64_t, uint64_t))a6 + 2))(a6, v37[3], v16);
  _Block_object_dispose(&v36, 8);
}

uint64_t __152__NSTextLineFragment__processCaretGlyphRunForTextSelectionProvider_baseLocation_runRange_glyphOffset_positionsCache_positionsCacheSize_stop_usingBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a3 - 1;
  if (a3 != 1)
  {
    uint64_t v4 = result;
    NSUInteger v5 = *(unsigned char **)(result + 56);
    if (!*v5)
    {
      uint64_t v7 = 0;
      do
      {
        uint64_t v8 = (double *)(a2 + 8 * v7);
        double v9 = *v8;
        double v10 = v8[1];
        double v11 = *(double *)(v4 + 72);
        if (*(double *)(v4 + 64) + *v8 >= v11) {
          double v12 = *(double *)(v4 + 72);
        }
        else {
          double v12 = *(double *)(v4 + 64) + *v8;
        }
        uint64_t v13 = *(void *)(v4 + 48);
        uint64_t v14 = [*(id *)(v4 + 32) locationFromLocation:*(void *)(v4 + 40) withOffset:v7 + *(void *)(v4 + 80)];
        CGRect result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned char *, double))(v13 + 16))(v13, v14, 1, v5, v12);
        if (!*v5)
        {
          double v15 = v10 - v9;
          double v16 = fmax(v11 - v12, 0.0);
          if (v10 - v9 + v12 > v11) {
            double v15 = v16;
          }
          CGRect result = (*(uint64_t (**)(uint64_t, uint64_t, void, unsigned char *, double))(v13 + 16))(v13, v14, 0, v5, v12 + v15);
        }
        if (++v7 >= v3) {
          break;
        }
        NSUInteger v5 = *(unsigned char **)(v4 + 56);
      }
      while (!*v5);
    }
  }
  return result;
}

char *__101__NSTextLineFragment__getCaretPositionsForCharactersInRange_positionsCache_positionsCacheSize_block___block_invoke(char *result, unint64_t a2)
{
  CGSize v2 = result;
  if (a2 < 9)
  {
    NSUInteger v5 = (void **)(result + 56);
    goto LABEL_6;
  }
  uint64_t v4 = (void *)**((void **)result + 5);
  if (!v4 || **((void **)result + 6) < a2)
  {
    CGRect result = (char *)NSZoneRealloc(0, v4, 8 * a2);
    **((void **)v2 + 5) = result;
    NSUInteger v5 = (void **)*((void *)v2 + 5);
    **((void **)v2 + 6) = a2;
LABEL_6:
    uint64_t v4 = *v5;
  }
  *(void *)(*(void *)(*((void *)v2 + 4) + 8) + 24) = v4;
  return result;
}

- (CGRect)typographicBounds
{
  objc_sync_enter(self);
  CGFloat x = self->_typographicBounds.origin.x;
  CGFloat y = self->_typographicBounds.origin.y;
  CGFloat width = self->_typographicBounds.size.width;
  CGFloat height = self->_typographicBounds.size.height;
  objc_sync_exit(self);
  double v7 = x;
  double v8 = y;
  double v9 = width;
  double v10 = height;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

- (void)drawAtPoint:(CGPoint)point inContext:(CGContextRef)context
{
  if (context)
  {
    double y = point.y;
    double x = point.x;
    double v7 = [[_NSCGTextGraphicsContext alloc] initWithCGContext:context];
    -[NSTextLineFragment drawAtPoint:graphicsContext:](self, "drawAtPoint:graphicsContext:", v7, x, y);
  }
}

- (void)_setColor:(id)a3 inGraphicsContext:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __50__NSTextLineFragment__setColor_inGraphicsContext___block_invoke;
  v4[3] = &unk_1E55C5470;
  v4[4] = a3;
  [(NSTextLineFragment *)self _setCurrentGraphicsContext:a4 duringBlock:v4];
}

- (void)drawTextAttachmentsAtPoint:(CGPoint)a3 graphicsContext:(id)a4
{
  lineRef = self->_lineRef;
  if (lineRef)
  {
    double y = a3.y;
    double x = a3.x;
    CFArrayRef GlyphRuns = CTLineGetGlyphRuns(lineRef);
    CFIndex Count = CFArrayGetCount(GlyphRuns);
    [(NSTextLineFragment *)self glyphOrigin];
    double v12 = v11;
    double v14 = v13;
    if ([a4 CGContext])
    {
      unsigned int Type = CGContextGetType();
      if (Type <= 9) {
        unsigned int v16 = (0x1E9u >> Type) & 1;
      }
      else {
        LOBYTE(v16) = 1;
      }
      char v42 = v16;
    }
    else
    {
      char v42 = 0;
    }
    if (Count >= 1)
    {
      CFIndex v17 = 0;
      double v40 = x + v12;
      double v18 = y + v14;
      uint64_t v19 = *MEMORY[0x1E4F247B0];
      CFIndex v41 = Count;
      uint64_t v39 = *MEMORY[0x1E4F247B0];
      do
      {
        ValueAtIndedouble x = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v17);
        CFDictionaryRef Attributes = CTRunGetAttributes(ValueAtIndex);
        if ([(__CFDictionary *)Attributes objectForKeyedSubscript:v19])
        {
          uint64_t v22 = [(__CFDictionary *)Attributes objectForKeyedSubscript:@"NSAttachment"];
          if (v22)
          {
            uint64_t v23 = v22;
            CFArrayRef v24 = GlyphRuns;
            uint64_t v25 = [(NSTextLineFragment *)self textLayoutFragment];
            CFIndex location = CTRunGetStringRange(ValueAtIndex).location;
            buffer.double x = 0.0;
            buffer.double y = 0.0;
            CGFloat descent = 0.0;
            CGFloat ascent = 0.0;
            v48.CFIndex location = 0;
            v48.NSUInteger length = 0;
            double TypographicBounds = CTRunGetTypographicBounds(ValueAtIndex, v48, &ascent, &descent, 0);
            v49.CFIndex location = 0;
            v49.NSUInteger length = 1;
            CTRunGetPositions(ValueAtIndex, v49, &buffer);
            double v28 = buffer.x;
            id v29 = a4;
            int v30 = [a4 isFlipped];
            double v31 = buffer.y;
            double v32 = descent;
            double v33 = ascent;
            if (v30) {
              double v34 = -descent;
            }
            else {
              double v34 = descent;
            }
            if (v25
              && (uint64_t v35 = [(NSTextLayoutFragment *)v25 textLayoutManager],
                  (uint64_t v36 = (NSCountableTextLocation *)[(NSTextParagraph *)[(NSTextLayoutFragment *)v25 textParagraph] locationForCharacterIndex:location dataSourceLocationsOnly:0 actualRange:0]) != 0))
            {
              double v37 = v36;
              uint64_t v38 = [(NSTextLayoutManager *)v35 textContainerForLocation:v36];
            }
            else
            {
              double v37 = [[NSCountableTextLocation alloc] initWithIndex:location];
              uint64_t v38 = 0;
            }
            v43[0] = MEMORY[0x1E4F143A8];
            v43[1] = 3221225472;
            v43[2] = __65__NSTextLineFragment_drawTextAttachmentsAtPoint_graphicsContext___block_invoke;
            v43[3] = &unk_1E55C7398;
            *(double *)&v43[9] = v40 + v28;
            *(double *)&v43[10] = v18 - (v31 + v34);
            *(double *)&v43[11] = TypographicBounds;
            *(double *)&v43[12] = v33 + v32;
            v43[4] = v23;
            v43[5] = Attributes;
            v43[6] = v37;
            v43[7] = v38;
            v43[8] = self;
            char v44 = v42;
            a4 = v29;
            [(NSTextLineFragment *)self _setCurrentGraphicsContext:v29 duringBlock:v43];

            CFArrayRef GlyphRuns = v24;
            CFIndex Count = v41;
            uint64_t v19 = v39;
          }
        }
        ++v17;
      }
      while (Count != v17);
    }
  }
}

- (void)_setCurrentGraphicsContext:(id)a3 duringBlock:(id)a4
{
}

uint64_t __65__NSTextLineFragment_drawTextAttachmentsAtPoint_graphicsContext___block_invoke(uint64_t a1)
{
  CGSize v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = [*(id *)(a1 + 64) applicationFrameworkContext];
  uint64_t v7 = *(unsigned __int8 *)(a1 + 104);
  double v8 = *(double *)(a1 + 72);
  double v9 = *(double *)(a1 + 80);
  double v10 = *(double *)(a1 + 88);
  double v11 = *(double *)(a1 + 96);

  return objc_msgSend(v2, "_showWithBounds:attributes:location:textContainer:applicationFrameworkContext:acceptsViewProvider:", v3, v4, v5, v6, v7, v8, v9, v10, v11);
}

uint64_t __50__NSTextLineFragment__setColor_inGraphicsContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) set];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(NSAttributedString *)[(NSTextLineFragment *)self attributedString] string];
  uint64_t v6 = [(NSTextLineFragment *)self characterRange];
  return (id)[v3 stringWithFormat:@"<%@: %p \"%@\">", v4, self, -[NSString substringWithRange:](v5, "substringWithRange:", v6, v7)];
}

- (__CTLine)lineRef
{
  objc_sync_enter(self);
  lineRef = self->_lineRef;
  if (lineRef)
  {
    CFTypeRef v5 = CFRetain(self->_lineRef);
    CGSize v2 = (__CTLine *)CFAutorelease(v5);
  }
  objc_sync_exit(self);
  if (lineRef) {
    return v2;
  }
  else {
    return 0;
  }
}

+ (__CFDictionary)_hiddenContentRenderingAttributes
{
  if (_hiddenContentRenderingAttributes_onceToken != -1) {
    dispatch_once(&_hiddenContentRenderingAttributes_onceToken, &__block_literal_global_21);
  }
  return (__CFDictionary *)_hiddenContentRenderingAttributes_renderingAttributes;
}

id __55__NSTextLineFragment__hiddenContentRenderingAttributes__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = _NSTextScalingTypeForCurrentEnvironment();
  if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery])
  {
    v1 = (objc_class *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] colorClassForApplicationFrameworkContext:v0];
  }
  else
  {
    v1 = +[NSTextGraphicsContextProvider __defaultColorClass];
  }
  uint64_t v3 = @"NSColor";
  v4[0] = [(objc_class *)v1 clearColor];
  id result = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  _hiddenContentRenderingAttributes_renderingCFDictionaryRef Attributes = (uint64_t)result;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTextLineFragment)initWithCoder:(NSCoder *)aDecoder
{
  if ([(NSCoder *)aDecoder allowsKeyedCoding])
  {
    self->_attributedString = (NSAttributedString *)[(NSCoder *)aDecoder decodeObjectOfClass:objc_opt_class() forKey:@"NS.attributedString"];
    self->_characterRange.CFIndex location = objc_msgSend(-[NSCoder decodeObjectOfClass:forKey:](aDecoder, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NS.range"), "rangeValue");
    self->_characterRange.NSUInteger length = v5;
    [(NSTextLineFragment *)self invalidateCache];
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeObject:self->_attributedString forKey:@"NS.attributedString"];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", self->_characterRange.location, self->_characterRange.length);
    [a3 encodeObject:v5 forKey:@"NS.range"];
  }
}

- (id)lineBadge
{
  return self->_lineBadge;
}

- (void)setLineBadge:(id)a3
{
  uint64_t v4 = (NSAttributedString *)[a3 copy];

  self->_lineBadge = v4;
}

- (BOOL)isHyphenated
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)isTruncated
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

uint64_t __45__NSTextLineFragment_boundsWithType_options___block_invoke(uint64_t a1)
{
  uint64_t result = CTFontGetLanguageAwareOutsets();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(double *)(v3 + 32) < 0.0)
  {
    *(void *)(v3 + 32) = 0;
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  if (*(double *)(v3 + 48) < 0.0) {
    *(void *)(v3 + 48) = 0;
  }
  return result;
}

void __45__NSTextLineFragment_boundsWithType_options___block_invoke_2(uint64_t a1, CTFontRef font)
{
  BoundingBodouble x = CTFontGetBoundingBox(font);
  double v3 = *(double *)(a1 + 48);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v3 - BoundingBox.origin.y > *(double *)(v4 + 32))
  {
    *(double *)(v4 + 32) = v3 - BoundingBox.origin.y;
    double v3 = *(double *)(a1 + 48);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  double v5 = BoundingBox.origin.y + BoundingBox.size.height - (v3 + *(double *)(a1 + 64));
  if (v5 > *(double *)(v4 + 48)) {
    *(double *)(v4 + 48) = v5;
  }
}

uint64_t __45__NSTextLineFragment_boundsWithType_options___block_invoke_3(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"NSFont"]) {
    NSDefaultFont();
  }
  double v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

- (__CTRun)_findRunForStringIndex:(int64_t)a3 runIndex:(int64_t *)a4
{
  if (!self->_lineRef) {
    return 0;
  }
  objc_sync_enter(self);
  activeRun = self->_activeRun;
  if (!activeRun
    || ((v8 = CTRunGetStringRange(activeRun), v8.location <= a3) ? (BOOL v9 = v8.location + v8.length <= a3) : (BOOL v9 = 1), v9))
  {
    CFArrayRef GlyphRuns = CTLineGetGlyphRuns(self->_lineRef);
    if (CFArrayGetCount(GlyphRuns) < 1) {
LABEL_13:
    }
      __assert_rtn("__NSFindRunForStringIndex", "NSTextLineFragment.m", 445, "NO && \"couldn't find run for character at given index\"");
    CFIndex v11 = 0;
    while (1)
    {
      ValueAtIndedouble x = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v11);
      CFRange StringRange = CTRunGetStringRange(ValueAtIndex);
      if (StringRange.location <= a3 && StringRange.location + StringRange.length > a3) {
        break;
      }
      if (++v11 >= CFArrayGetCount(GlyphRuns)) {
        goto LABEL_13;
      }
    }
    self->_activeRun = ValueAtIndex;
    self->_activeRunIndedouble x = v11;
    if (a4) {
      *a4 = v11;
    }
  }
  else
  {
    if (a4) {
      *a4 = self->_activeRunIndex;
    }
    ValueAtIndedouble x = self->_activeRun;
  }
  objc_sync_exit(self);
  return ValueAtIndex;
}

uint64_t __101__NSTextLineFragment__getCaretPositionsForCharactersInRange_positionsCache_positionsCacheSize_block___block_invoke_2(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t result = [a2 rangeOfCharacterFromSet:a1[4] options:8];
  if (!v12) {
    ++*(void *)(*(void *)(a1[5] + 8) + 24);
  }
  if ((unint64_t)(a3 + a4) >= a1[6]) {
    *a7 = 1;
  }
  return result;
}

uint64_t __95__NSTextLineFragment_enumerateCaretOffsetsWithTextSelectionDataSource_baseLocation_usingBlock___block_invoke(uint64_t a1, unint64_t a2, char a3, unsigned char *a4, double a5)
{
  double v8 = *(double *)(a1 + 72) + a5;
  if (v8 >= *(double *)(a1 + 80)) {
    double v9 = *(double *)(a1 + 80);
  }
  else {
    double v9 = v8;
  }
  char v16 = 0;
  double v10 = *(void **)(a1 + 32);
  if (v10)
  {
    unint64_t v14 = 0;
    unint64_t v15 = 0;
    BOOL v11 = (a3 & 1) != 0 || a2 + 1 != *(void *)(a1 + 96) + *(void *)(a1 + 88);
    uint64_t result = [v10 locationForCharacterIndex:a2 dataSourceLocationsOnly:v11 actualRange:&v14];
    if (!result || a2 < v14 || a2 - v14 >= v15)
    {
      char v13 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    [*(id *)(a1 + 40) locationFromLocation:*(void *)(a1 + 48) withOffset:a2 - *(void *)(*(void *)(a1 + 56) + 16)];
  }
  uint64_t result = (*(uint64_t (**)(double))(*(void *)(a1 + 64) + 16))(v9);
  char v13 = v16;
LABEL_14:
  *a4 = v13;
  return result;
}

- (BOOL)_selectionColorShouldOverrideColor:(id)a3
{
  double v3 = [(NSTextLayoutManager *)[(NSTextLayoutFragment *)[(NSTextLineFragment *)self textLayoutFragment] textLayoutManager] isSelectionOverridableColor];
  if (v3)
  {
    uint64_t v4 = (uint64_t (*)(void))v3[2];
    LOBYTE(v3) = v4();
  }
  return (char)v3;
}

- (unint64_t)numberOfGlyphs
{
  if (self->_lineRef)
  {
    lineRef = self->_lineRef;
    return CTLineGetGlyphCount(lineRef);
  }
  else
  {
    [(NSTextLineFragment *)self characterRange];
    return v4;
  }
}

double __50__NSTextLineFragment_drawAtPoint_graphicsContext___block_invoke(uint64_t a1, double a2, double a3)
{
  v4.size.CGFloat height = *(CGFloat *)(a1 + 56);
  v4.size.CGFloat width = a3 - a2;
  v4.origin.double x = *(double *)(a1 + 32) + *(double *)(a1 + 64) + a2;
  v4.origin.double y = *(CGFloat *)(a1 + 40);
  CGContextFillRect(*(CGContextRef *)(a1 + 72), v4);
  return result;
}

double __50__NSTextLineFragment_locationForCharacterAtIndex___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = a1[6];
  uint64_t v3 = a1[7];
  if (v4 >= v3 + a3) {
    double v5 = (double *)(*(void *)(a1[4] + 48) + 16 * v3);
  }
  else {
    double v5 = (double *)(a2 + 8 * (v4 - v3));
  }
  double v6 = *v5;
  uint64_t v7 = *(void *)(a1[5] + 8);
  double result = v6 + *(double *)(v7 + 24);
  *(double *)(v7 + 24) = result;
  return result;
}

- (int64_t)characterIndexForPoint:(CGPoint)a3 fractionOfDistanceThroughGlyph:(double *)a4
{
  double v6 = a3.x - self->_glyphOrigin.x;
  lineRef = self->_lineRef;
  if (lineRef)
  {
    CGFloat v8 = a3.y - self->_glyphOrigin.y;
    uint64_t v55 = 0;
    CGRect v56 = (double *)&v55;
    uint64_t v57 = 0x2020000000;
    uint64_t v58 = 0;
    uint64_t v51 = 0;
    CGRect v52 = (double *)&v51;
    uint64_t v53 = 0x2020000000;
    uint64_t v54 = 0;
    uint64_t v47 = 0;
    CFRange v48 = &v47;
    uint64_t v49 = 0x2020000000;
    uint64_t v50 = -1;
    uint64_t v43 = 0;
    char v44 = &v43;
    uint64_t v45 = 0x2020000000;
    uint64_t v46 = -1;
    uint64_t v39 = 0;
    double v40 = &v39;
    uint64_t v41 = 0x2020000000;
    char v42 = 0;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __76__NSTextLineFragment_characterIndexForPoint_fractionOfDistanceThroughGlyph___block_invoke;
    v38[3] = &unk_1E55C73E8;
    v38[4] = self;
    v38[5] = &v43;
    *(double *)&v38[10] = v6;
    *(CGFloat *)&v38[11] = v8;
    v38[6] = &v47;
    v38[7] = &v55;
    v38[8] = &v39;
    v38[9] = &v51;
    CTLineEnumerateCaretOffsets(lineRef, v38);
    if (*((unsigned char *)v40 + 24) || v52[3] > v6 || v44[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v48[3] != -1)
      {
LABEL_40:
        if (a4)
        {
          double v33 = v56[3];
          double v34 = v52[3];
          double v35 = 0.0;
          if (v33 != v34)
          {
            double v36 = (v6 - v33) / (v34 - v33);
            if (*((unsigned char *)v40 + 24)) {
              double v36 = 1.0 - v36;
            }
            if (v36 < 0.0) {
              double v36 = 0.0;
            }
            double v35 = fmin(v36, 1.0);
          }
          *a4 = v35;
        }
        int64_t v20 = v48[3];
        _Block_object_dispose(&v39, 8);
        _Block_object_dispose(&v43, 8);
        _Block_object_dispose(&v47, 8);
        _Block_object_dispose(&v51, 8);
        _Block_object_dispose(&v55, 8);
        return v20;
      }
      uint64_t v9 = [(NSTextLineFragment *)self characterRange];
      v48[3] = v9;
      [(NSTextLineFragment *)self glyphOrigin];
      *((void *)v52 + 3) = v10;
    }
    else
    {
      uint64_t v24 = [(NSTextLineFragment *)self characterRange];
      uint64_t v26 = v25;
      uint64_t v27 = [(NSTextLineFragment *)self textLayoutFragment];
      double v28 = [(NSTextParagraph *)[(NSTextLayoutFragment *)v27 textParagraph] paragraphSeparatorRange];
      unint64_t v29 = v24 + v26;
      if ([(NSTextRange *)v28 isNotEmpty]
        && [(NSArray *)[(NSTextLayoutFragment *)v27 textLineFragments] lastObject] == self)
      {
        uint64_t v30 = [(NSTextContentManager *)[(NSTextLayoutManager *)[(NSTextLayoutFragment *)v27 textLayoutManager] textContentManager] offsetFromLocation:[(NSTextRange *)v28 location] toLocation:[(NSTextRange *)v28 endLocation]];
        if (v29 < v30 || v30 < 1) {
          uint64_t v32 = 0;
        }
        else {
          uint64_t v32 = v30;
        }
        v29 -= v32;
      }
      v48[3] = v29;
      uint64_t v10 = *((void *)v52 + 3);
    }
    *((void *)v56 + 3) = v10;
    goto LABEL_40;
  }
  if (self->_glyphs)
  {
    advances = self->_advances;
    int64_t glyphCount = self->_glyphCount;
    double v14 = 0.0;
    if (glyphCount < 1 || v6 < 0.0)
    {
      double v17 = 0.0;
      char v16 = self->_advances;
    }
    else
    {
      unint64_t v15 = &advances[glyphCount];
      char v16 = self->_advances;
      do
      {
        double v17 = v14;
        double width = v16->width;
        ++v16;
        double v14 = v14 + width;
      }
      while (v16 < v15 && v14 <= v6);
    }
    if (v6 <= v14)
    {
      uint64_t v21 = v16 - advances - ((char *)v16 - (char *)advances > 0);
      if (v21 < 0 || ([(NSTextLineFragment *)self characterRange], v21 >= v22)) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSTextLineFragment.m", 1282, @"no character found that contains point");
      }
      int64_t v20 = [(NSTextLineFragment *)self characterRange] + v21;
      if (a4)
      {
        double v23 = 0.0;
        if (v14 != 0.0) {
          double v23 = (v6 - v17) / (v14 - v17);
        }
        *a4 = v23;
      }
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    if (a4) {
      *a4 = 0.0;
    }
    return [(NSTextLineFragment *)self characterRange];
  }
  return v20;
}

uint64_t __76__NSTextLineFragment_characterIndexForPoint_fractionOfDistanceThroughGlyph___block_invoke(uint64_t a1, uint64_t a2, int a3, unsigned char *a4, double a5)
{
  uint64_t result = CTRunGetStatus((CTRunRef)[*(id *)(a1 + 32) _findRunForStringIndex:a2 runIndex:0]);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -1;
  if ((result & 1) == a3)
  {
    *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = a5;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    double v13 = *(double *)(a1 + 80);
    if (v13 == a5) {
      int v14 = a3;
    }
    else {
      int v14 = 0;
    }
    if (v13 < a5 || v14 != 0) {
      *a4 = 1;
    }
  }
  else
  {
    double v11 = *(double *)(a1 + 80);
    if (v11 == a5) {
      char v12 = a3;
    }
    else {
      char v12 = 0;
    }
    if (v11 > a5 || (v12 & 1) != 0 || *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == -1)
    {
      *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a5;
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result & 1;
    }
  }
  return result;
}

- (NSInteger)characterIndexForPoint:(CGPoint)point
{
  double y = point.y;
  double x = point.x;
  objc_sync_enter(self);
  if (x == self->_cachedPoint.x && y == self->_cachedPoint.y)
  {
    cachedCharacterIndedouble x = self->_cachedCharacterIndex;
  }
  else
  {
    self->_cachedPoint.double x = x;
    self->_cachedPoint.double y = y;
    cachedCharacterIndedouble x = -[NSTextLineFragment characterIndexForPoint:fractionOfDistanceThroughGlyph:](self, "characterIndexForPoint:fractionOfDistanceThroughGlyph:", &self->_cachedFractionWithinGlyph, x, y);
    self->_cachedCharacterIndedouble x = cachedCharacterIndex;
  }
  objc_sync_exit(self);
  return cachedCharacterIndex;
}

- (CGFloat)fractionOfDistanceThroughGlyphForPoint:(CGPoint)point
{
  double y = point.y;
  double x = point.x;
  objc_sync_enter(self);
  if (x != self->_cachedPoint.x || y != self->_cachedPoint.y)
  {
    self->_cachedPoint.double x = x;
    self->_cachedPoint.double y = y;
    self->_cachedCharacterIndedouble x = -[NSTextLineFragment characterIndexForPoint:fractionOfDistanceThroughGlyph:](self, "characterIndexForPoint:fractionOfDistanceThroughGlyph:", &self->_cachedFractionWithinGlyph, x, y);
  }
  double cachedFractionWithinGlyph = self->_cachedFractionWithinGlyph;
  objc_sync_exit(self);
  return cachedFractionWithinGlyph;
}

- (void)_drawTextCorrectionMarker:(int64_t)a3 characterRange:(_NSRange)a4 atOrigin:(CGPoint)a5 graphicsContext:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v14 = [a6 CGContext];
  [(NSTextLineFragment *)self glyphOrigin];
  if (v14 && length)
  {
    double v17 = v15;
    double v18 = v16;
    v28.NSUInteger location = [(NSTextLineFragment *)self characterRange];
    v28.NSUInteger length = v19;
    v26.NSUInteger location = location;
    v26.NSUInteger length = length;
    NSRange v20 = NSIntersectionRange(v26, v28);
    if (!v20.length)
    {
      unint64_t v22 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      v27.NSUInteger location = location;
      v27.NSUInteger length = length;
      double v23 = NSStringFromRange(v27);
      [v22 handleFailureInMethod:a2, self, @"NSTextLineFragment.m", 1425, @"out of bounds characterRange %@ specified to %@", v23, NSStringFromSelector(a2) object file lineNumber description];
    }
    double v25 = 0.0;
    id v21 = +[NSTextCorrectionMarkerRendering textCorrectionAdjustmentAttributedString:range:glyphOrigin:yDelta:](NSTextCorrectionMarkerRendering, "textCorrectionAdjustmentAttributedString:range:glyphOrigin:yDelta:", [(NSTextLineFragment *)self attributedString], v20.location, v20.length, &v25, v17, v18);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __88__NSTextLineFragment__drawTextCorrectionMarker_characterRange_atOrigin_graphicsContext___block_invoke;
    v24[3] = &unk_1E55C7410;
    v24[5] = a6;
    v24[6] = a3;
    *(double *)&void v24[7] = x + v17;
    *(double *)&v24[8] = y + v18 + v25;
    v24[4] = v21;
    -[NSTextLineFragment _enumerateTextSegmentsInCharacterRange:usingBlock:](self, "_enumerateTextSegmentsInCharacterRange:usingBlock:", v20.location, v20.length, v24);
  }
}

uint64_t __88__NSTextLineFragment__drawTextCorrectionMarker_characterRange_atOrigin_graphicsContext___block_invoke(uint64_t a1, double a2, double a3)
{
  return +[NSTextCorrectionMarkerRendering drawCorrectionMarkerOfType:font:origin:width:graphicsContext:](NSTextCorrectionMarkerRendering, "drawCorrectionMarkerOfType:font:origin:width:graphicsContext:", *(void *)(a1 + 48), *(void *)(a1 + 32), *(void *)(a1 + 40), *(double *)(a1 + 56) + a2, *(double *)(a1 + 64), a3 - a2);
}

id __71__NSTextLineFragment_drawTextCorrectionMarkersAtPoint_graphicsContext___block_invoke(double *a1, void *a2, uint64_t a3, void *a4, unsigned char *a5)
{
  int64_t v9 = +[NSTextCorrectionMarkerRendering textCorrectionMarkerTypeWithAttributes:](NSTextCorrectionMarkerRendering, "textCorrectionMarkerTypeWithAttributes:");
  id result = (id)objc_msgSend((id)objc_msgSend(a4, "endLocation"), "compare:", *((void *)a1 + 4));
  if (result != (id)-1)
  {
    *a5 = 1;
    return result;
  }
  uint64_t v11 = *(void *)(*(void *)(*((void *)a1 + 9) + 8) + 24);
  if (v9 != -1 && v11 == v9)
  {
    if (objc_msgSend(*(id *)(*(void *)(*((void *)a1 + 10) + 8) + 40), "isEqual:", objc_msgSend(a4, "location")))
    {

      goto LABEL_25;
    }
    uint64_t v11 = *(void *)(*(void *)(*((void *)a1 + 9) + 8) + 24);
  }
  if (v11 != -1)
  {
    uint64_t v13 = *(void *)(*(void *)(*((void *)a1 + 11) + 8) + 40);
    uint64_t v14 = *(void *)(*(void *)(*((void *)a1 + 10) + 8) + 40);
    double v15 = (void *)*((void *)a1 + 6);
    uint64_t v24 = *((void *)a1 + 7);
    double v25 = (void *)*((void *)a1 + 5);
    uint64_t v26 = *((void *)a1 + 8);
    double v16 = a1[12];
    double v17 = a1[13];
    double v18 = [[NSTextRange alloc] initWithLocation:v13 endLocation:v14];
    int v19 = [a2 _shouldDrawTextCorrectionMarkerWithType:v11 inRange:v18];

    if (v19)
    {
      if (v15)
      {
        uint64_t v20 = [v15 rangeForLocation:v13 allowsTrailingEdge:0];
        uint64_t v21 = [v15 rangeForLocation:v14 allowsTrailingEdge:1];
      }
      else
      {
        uint64_t v20 = [a2 offsetFromLocation:v24 toLocation:v13];
        uint64_t v21 = [a2 offsetFromLocation:v24 toLocation:v14];
      }
      if (v20 != 0x7FFFFFFFFFFFFFFFLL && v21 != 0x7FFFFFFFFFFFFFFFLL) {
        objc_msgSend(v25, "_drawTextCorrectionMarker:characterRange:atOrigin:graphicsContext:", v11, v20, v21 - v20, v26, v16, v17);
      }
    }
  }
  *(void *)(*(void *)(*((void *)a1 + 9) + 8) + 24) = v9;

  if (*(void *)(*(void *)(*((void *)a1 + 9) + 8) + 24) == -1) {
    id v23 = 0;
  }
  else {
    id v23 = (id)[a4 location];
  }
  *(void *)(*(void *)(*((void *)a1 + 11) + 8) + 40) = v23;

  if (*(void *)(*(void *)(*((void *)a1 + 9) + 8) + 24) == -1)
  {
    id result = 0;
    goto LABEL_27;
  }
LABEL_25:
  id result = (id)[a4 endLocation];
LABEL_27:
  *(void *)(*(void *)(*((void *)a1 + 10) + 8) + 40) = result;
  return result;
}

- (void)drawTextCorrectionMarkersAtPoint:(CGPoint)a3 context:(CGContext *)a4
{
  if (a4)
  {
    double y = a3.y;
    double x = a3.x;
    uint64_t v7 = [[_NSCGTextGraphicsContext alloc] initWithCGContext:a4];
    -[NSTextLineFragment drawTextCorrectionMarkersAtPoint:graphicsContext:](self, "drawTextCorrectionMarkersAtPoint:graphicsContext:", v7, x, y);
  }
}

- (void)_drawMarkedTextUnderline:(id)a3 inTextRange:(id)a4 atOrigin:(CGPoint)a5 graphicsContext:(id)a6
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  char v12 = [(NSTextLineFragment *)self textLayoutFragment];
  uint64_t v13 = [a6 CGContext];
  [(NSTextLineFragment *)self glyphOrigin];
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  char v18 = [a6 isFlipped];
  if (v13)
  {
    char v19 = v18;
    uint64_t v20 = [a3 objectForKeyedSubscript:@"NSUnderline"];
    uint64_t v21 = [a3 objectForKeyedSubscript:@"NSUnderlineColor"];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __84__NSTextLineFragment__drawMarkedTextUnderline_inTextRange_atOrigin_graphicsContext___block_invoke;
    v22[3] = &unk_1E55C7460;
    v22[4] = v21;
    v22[5] = v20;
    v22[9] = v15;
    v22[10] = v17;
    char v23 = v19;
    *(CGFloat *)&v22[11] = x;
    *(CGFloat *)&void v22[12] = y;
    v22[13] = v13;
    v22[6] = self;
    v22[7] = v12;
    v22[8] = a6;
    [(NSTextLineFragment *)self enumerateTextSegmentBoundsInTextRange:a4 dataSourceLocationsOnly:1 usingBlock:v22];
  }
}

void __84__NSTextLineFragment__drawMarkedTextUnderline_inTextRange_atOrigin_graphicsContext___block_invoke(uint64_t a1, void *a2, CGFloat a3, double a4, double a5, double a6)
{
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = [*(id *)(a1 + 40) integerValue];
  uint64_t v14 = v13 & 3;
  if (v13 <= 0) {
    uint64_t v14 = -(-v13 & 3);
  }
  double v15 = (double)v14;
  __int16 v16 = [*(id *)(a1 + 40) integerValue];
  if ((v16 & 0x2000) != 0)
  {
    if ((~v16 & 0x3000) != 0)
    {
      if (*(unsigned char *)(a1 + 112))
      {
        double v21 = a4 + *(double *)(a1 + 96);
        double v22 = 1.0;
        goto LABEL_14;
      }
      double v23 = *(double *)(a1 + 96);
      double v24 = a4 + 1.0;
    }
    else
    {
      if (*(unsigned char *)(a1 + 112))
      {
        double v21 = a4 + a6 + *(double *)(a1 + 96);
        double v22 = -1.0;
LABEL_14:
        double v20 = v21 + v22;
        goto LABEL_19;
      }
      double v23 = *(double *)(a1 + 96);
      double v24 = a4 + a6 + -1.0;
    }
    double v20 = v23 - v24;
    goto LABEL_19;
  }
  double v17 = (a6 - *(double *)(a1 + 80)) * 0.5;
  double v18 = floor(v17);
  if (v17 >= 4.0) {
    double v19 = (v17 - v15) * 0.666;
  }
  else {
    double v19 = v18;
  }
  if (*(unsigned char *)(a1 + 112)) {
    double v20 = a4 + a6 - v19;
  }
  else {
    double v20 = a4 + v19;
  }
LABEL_19:
  CGContextSaveGState(*(CGContextRef *)(a1 + 104));
  if (!v12)
  {
    uint64_t v25 = [*(id *)(a1 + 48) applicationFrameworkContext];
    if (+[NSTextGraphicsContextProvider textGraphicsContextProviderClassRespondsToColorQuery])
    {
      uint64_t v26 = (objc_class *)[(objc_class *)+[NSTextGraphicsContextProvider textGraphicsContextProviderClass] colorClassForApplicationFrameworkContext:v25];
    }
    else
    {
      uint64_t v26 = +[NSTextGraphicsContextProvider __defaultColorClass];
    }
    NSRange v27 = v26;
    uint64_t v28 = [(objc_class *)v26 blackColor];
    unint64_t v29 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "textLayoutManager"), "textContentManager");
    uint64_t v30 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "rangeInElement"), "location");
    NSUInteger v31 = objc_msgSend(v29, "offsetFromLocation:toLocation:", v30, objc_msgSend(a2, "location"));
    NSUInteger v32 = objc_msgSend(v29, "offsetFromLocation:toLocation:", v30, objc_msgSend(a2, "endLocation")) - v31;
    v41.NSUInteger location = [*(id *)(a1 + 48) characterRange];
    v42.NSUInteger location = v31;
    v42.NSUInteger length = v32;
    NSUInteger location = NSIntersectionRange(v41, v42).location;
    v40[0] = 0;
    v40[1] = 0;
    double v34 = (void *)[*(id *)(a1 + 48) _defaultRenderingAttributesAtCharacterIndex:location effectiveRange:v40];
    if (([v34 count]
       && (double v35 = (void *)[v34 objectForKeyedSubscript:@"NSColor"]) != 0
       || ((v36 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "attributedString"), "attribute:atIndex:effectiveRange:", @"NSColor", location, 0)) != 0? (double v35 = (void *)v36): (double v35 = (void *)v28), v35))&& (objc_msgSend(v35, "isEqual:", v28) & 1) == 0)
    {
      uint64_t v37 = [v35 colorWithAlphaComponent:0.8];
    }
    else
    {
      uint64_t v37 = [(objc_class *)v27 colorWithWhite:0.17 alpha:1.0];
    }
    uint64_t v12 = v37;
  }
  [*(id *)(a1 + 48) _setColor:v12 inGraphicsContext:*(void *)(a1 + 64)];
  double v38 = a3 + a5;
  if (a3 + a5 - a3 > 1.0) {
    a3 = a3 + 1.0;
  }
  if (v38 - a3 <= 1.0) {
    double v39 = v38;
  }
  else {
    double v39 = v38 + -1.0;
  }
  CGContextSetLineWidth(*(CGContextRef *)(a1 + 104), v15);
  CGContextMoveToPoint(*(CGContextRef *)(a1 + 104), a3, v20);
  CGContextAddLineToPoint(*(CGContextRef *)(a1 + 104), v39, v20);
  CGContextStrokePath(*(CGContextRef *)(a1 + 104));
  CGContextRestoreGState(*(CGContextRef *)(a1 + 104));
}

- (void)_drawMarkedTextBackground:(id)a3 inTextRange:(id)a4 atOrigin:(CGPoint)a5 graphicsContext:(id)a6
{
  uint64_t v10 = (CGContext *)objc_msgSend(a6, "CGContext", a5.x, a5.y);
  uint64_t v11 = [a3 objectForKeyedSubscript:@"NSBackgroundColor"];
  if (v11) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    uint64_t v13 = v11;
    if (v11 != [MEMORY[0x1E4F1CA98] null])
    {
      CGContextSaveGState(v10);
      [(NSTextLineFragment *)self _setColor:v13 inGraphicsContext:a6];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __85__NSTextLineFragment__drawMarkedTextBackground_inTextRange_atOrigin_graphicsContext___block_invoke;
      v14[3] = &__block_descriptor_40_e55_v48__0_CGRect__CGPoint_dd__CGSize_dd__8__NSTextRange_40l;
      v14[4] = v10;
      [(NSTextLineFragment *)self enumerateTextSegmentBoundsInTextRange:a4 dataSourceLocationsOnly:1 usingBlock:v14];
      CGContextRestoreGState(v10);
    }
  }
}

void __85__NSTextLineFragment__drawMarkedTextBackground_inTextRange_atOrigin_graphicsContext___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  if (a4 > 1.0) {
    a4 = a4 + -1.0;
  }
  double v6 = CGPathCreateWithRoundedRect(*(CGRect *)&a2, 3.0, 3.0, 0);
  CGContextAddPath(*(CGContextRef *)(a1 + 32), v6);
  CGContextFillPath(*(CGContextRef *)(a1 + 32));

  CGPathRelease(v6);
}

- (CGRect)boundsForMarkedTextAtPoint:(CGPoint)a3 range:(id)a4 width:(double)a5 adjustmentCallback:(id)a6
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v11 = [(NSTextLineFragment *)self textLayoutFragment];
  uint64_t v27 = 0;
  uint64_t v28 = (double *)&v27;
  uint64_t v29 = 0x4010000000;
  uint64_t v30 = "";
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v31 = *MEMORY[0x1E4F1DB20];
  long long v32 = v12;
  if (v11)
  {
    uint64_t v13 = v11;
    if (([a4 isEmpty] & 1) == 0)
    {
      uint64_t v14 = [(NSTextLayoutFragment *)v13 textLayoutManager];
      double v15 = (void *)MEMORY[0x192FAE510]();
      id v16 = [(NSTextLineFragment *)self textLineFragmentRange];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __80__NSTextLineFragment_boundsForMarkedTextAtPoint_range_width_adjustmentCallback___block_invoke;
      v25[3] = &unk_1E55C74D0;
      v25[4] = self;
      v25[5] = v13;
      char v26 = 1;
      *(CGFloat *)&v25[8] = x;
      *(CGFloat *)&v25[9] = y;
      v25[6] = a6;
      v25[7] = &v27;
      [(NSTextLayoutManager *)v14 markedTextAttributesForRange:v16 usingBlock:v25];
    }
  }
  double v17 = v28[4];
  double v18 = v28[5];
  double v19 = v28[6];
  double v20 = v28[7];
  _Block_object_dispose(&v27, 8);
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  double v24 = v20;
  result.size.CGFloat height = v24;
  result.size.double width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

uint64_t __80__NSTextLineFragment_boundsForMarkedTextAtPoint_range_width_adjustmentCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = [a3 count];
  if (result)
  {
    uint64_t result = [a2 isNotEmpty];
    if (result)
    {
      uint64_t result = [a3 objectForKeyedSubscript:@"NSUnderline"];
      if (result)
      {
        uint64_t v7 = (void *)result;
        objc_opt_class();
        uint64_t result = objc_opt_isKindOfClass();
        if (result)
        {
          uint64_t result = [v7 unsignedIntegerValue];
          if (result)
          {
            v10[0] = MEMORY[0x1E4F143A8];
            v10[1] = 3221225472;
            v10[2] = __80__NSTextLineFragment_boundsForMarkedTextAtPoint_range_width_adjustmentCallback___block_invoke_2;
            v10[3] = &unk_1E55C74A8;
            uint64_t v13 = result;
            long long v8 = *(_OWORD *)(a1 + 48);
            long long v14 = *(_OWORD *)(a1 + 64);
            int8x16_t v9 = *(int8x16_t *)(a1 + 32);
            char v15 = *(unsigned char *)(a1 + 80);
            int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
            long long v12 = v8;
            return [(id)v9.i64[0] enumerateTextSegmentBoundsInTextRange:a2 dataSourceLocationsOnly:1 usingBlock:v10];
          }
        }
      }
    }
  }
  return result;
}

void __80__NSTextLineFragment_boundsForMarkedTextAtPoint_range_width_adjustmentCallback___block_invoke_2(uint64_t a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  double v5 = a5.n128_f64[0];
  double v6 = a4.n128_f64[0];
  double v7 = a3.n128_f64[0];
  double v8 = a2.n128_f64[0];
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10)
  {
    double v8 = (*(double (**)(__n128, __n128, __n128, __n128))(v10 + 16))(a2, a3, a4, a5);
    double v7 = v11;
    double v6 = v12;
    double v5 = v13;
  }
  uint64_t v14 = *(void *)(a1 + 64) & 0x3000;
  if (v14 != 4096
    && (v14
     || (char v15 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "textLayoutManager"), "textContainerForLocation:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "textElement"), "elementRange"), "location"))) != 0&& objc_msgSend(v15, "layoutOrientation")))
  {
    double v16 = *(double *)(a1 + 80) - v7;
  }
  else
  {
    [*(id *)(a1 + 40) glyphOrigin];
    double v18 = (v5 - v17) * 0.5;
    double v19 = floor(v18);
    if (v18 >= 4.0) {
      double v20 = (v18 + -2.0) * 0.666;
    }
    else {
      double v20 = v19;
    }
    double v21 = v7 + v20;
    double v22 = v5 + v7 - v20;
    if (*(unsigned char *)(a1 + 88)) {
      double v16 = v22;
    }
    else {
      double v16 = v21;
    }
  }
  double v23 = v6 + v8;
  if (v6 + v8 - v8 <= 1.0) {
    double v24 = v8;
  }
  else {
    double v24 = v8 + 1.0;
  }
  if (v23 - v24 > 1.0) {
    double v23 = v23 + -1.0;
  }
  double v25 = v23 - v24;
  double v26 = 2.0;
  *(CGRect *)(*(void *)(*(void *)(a1 + 56) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 56) + 8)+ 32), *(CGRect *)(&v16 - 1));
}

- (void)drawMarkedTextIndicatorAtPoint:(CGPoint)a3 context:(CGContext *)a4
{
}

- (void)drawMarkedTextIndicatorAtPoint:(CGPoint)a3 context:(CGContext *)a4 adjustmentCallback:(id)a5
{
  if (a4)
  {
    double y = a3.y;
    double x = a3.x;
    int8x16_t v9 = [[_NSCGTextGraphicsContext alloc] initWithCGContext:a4];
    -[NSTextLineFragment drawMarkedTextIndicatorAtPoint:graphicsContext:adjustmentCallback:](self, "drawMarkedTextIndicatorAtPoint:graphicsContext:adjustmentCallback:", v9, a5, x, y);
  }
}

- (BOOL)drawMarkedTextBackgroundAtPoint:(CGPoint)a3 context:(CGContext *)a4
{
  return -[NSTextLineFragment drawMarkedTextBackgroundAtPoint:context:adjustmentCallback:](self, "drawMarkedTextBackgroundAtPoint:context:adjustmentCallback:", a4, 0, a3.x, a3.y);
}

- (BOOL)drawMarkedTextBackgroundAtPoint:(CGPoint)a3 context:(CGContext *)a4 adjustmentCallback:(id)a5
{
  if (!a4) {
    return 0;
  }
  double y = a3.y;
  double x = a3.x;
  int8x16_t v9 = [[_NSCGTextGraphicsContext alloc] initWithCGContext:a4];
  LOBYTE(a5) = -[NSTextLineFragment drawMarkedTextIndicatorAtPoint:graphicsContext:backgroundOnly:adjustmentCallback:](self, "drawMarkedTextIndicatorAtPoint:graphicsContext:backgroundOnly:adjustmentCallback:", v9, 1, a5, x, y);

  return (char)a5;
}

- (BOOL)isExtra
{
  return self->_isExtra;
}

@end
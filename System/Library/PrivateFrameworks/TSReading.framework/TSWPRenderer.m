@interface TSWPRenderer
+ (__CTFont)invisiblesFont;
- (BOOL)flipShadows;
- (BOOL)p_canvasSelectionIncludesDrawableOfAttachmentAtCharIndex:(unint64_t)a3 state:(const void *)a4;
- (BOOL)p_shouldClipFragment:(const void *)a3 drawingState:(const void *)a4 lineDrawFlags:(unsigned int)a5 updateRect:(CGRect)a6 outClipRect:(CGRect *)a7;
- (BOOL)preventClipToColumn;
- (CGRect)getClipBoundingBox;
- (CGSize)convertSizeToDeviceSpace:(CGSize)a3;
- (TSDBezierPath)interiorClippingPath;
- (TSWPRenderer)initWithContext:(CGContext *)a3;
- (double)viewScale;
- (void)dealloc;
- (void)didRenderFragments;
- (void)drawAdornmentRects:(const void *)a3 forColumn:(id)a4 foreground:(BOOL)a5;
- (void)drawFragment:(const void *)a3 updateRect:(CGRect)a4 drawingState:(const void *)a5 runState:(id *)a6 lineDrawFlags:(unsigned int)a7;
- (void)p_drawAdornmentGlyphs:(const void *)a3 lineFragment:(const void *)a4 state:(const void *)a5;
- (void)p_drawAdornmentLine:(const TSWPAdornmentLine *)a3 drawingState:(const void *)a4 lineFragment:(const void *)a5 lineFragmentStart:(CGPoint)a6 vertical:(BOOL)a7;
- (void)p_drawAdornmentLineBackgroundRect:(const TSWPAdornmentLine *)a3 lineDrawFlags:(unsigned int)a4 drawingState:(const void *)a5 bounds:(CGRect)a6;
- (void)p_drawAdornments:(const void *)a3 lineFragment:(const void *)a4 state:(const void *)a5;
- (void)p_drawAttachmentAdornments:(const void *)a3 lineFragment:(const void *)a4 state:(const void *)a5;
- (void)p_drawAttachmentGlyphAtPosition:(id)a3 fragment:(const void *)a4;
- (void)p_drawAutocorrectionMarkingsFragment:(const void *)a3 drawingState:(const void *)a4;
- (void)p_drawDictationMarkingsFragment:(const void *)a3 drawingState:(const void *)a4;
- (void)p_drawHiddenDeletionsAdornments:(const void *)a3 lineFragment:(const void *)a4 state:(const void *)a5;
- (void)p_drawInvisiblesAdornments:(const void *)a3 lineFragment:(const void *)a4 state:(const void *)a5;
- (void)p_drawInvisiblesBreakLine:(const TSWPAdornmentLine *)a3 lineFragment:(const void *)a4 state:(const void *)a5;
- (void)p_drawListLabelForFragment:(const void *)a3 drawingState:(const void *)a4 lineDrawFlags:(unsigned int)a5;
- (void)p_drawMisspelledWordMarkingsFragment:(const void *)a3 drawingState:(const void *)a4;
- (void)p_drawTextInRunsForLine:(__CTLine *)a3 fragment:(const void *)a4 state:(const void *)a5 tateChuYoko:(BOOL)a6 baseRange:(_NSRange)a7 isFirstLineRef:(BOOL)a8;
- (void)p_drawUngrammaticMarkingsFragment:(const void *)a3 drawingState:(const void *)a4;
- (void)p_drawWordMarkingsForFragment:(const void *)a3 color:(id)a4 ranges:(const void *)a5 suppressRange:(_NSRange)a6 drawingState:(const void *)a7;
- (void)p_strokeLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 width:(double)a5;
- (void)p_strokeWavyLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 width:(double)a5;
- (void)setFlipShadows:(BOOL)a3;
- (void)setInteriorClippingPath:(id)a3;
- (void)setPreventClipToColumn:(BOOL)a3;
- (void)setViewScale:(double)a3;
- (void)willRenderFragmentsWithDrawingState:(const void *)a3;
@end

@implementation TSWPRenderer

+ (__CTFont)invisiblesFont
{
  result = (__CTFont *)+[TSWPRenderer invisiblesFont]::sInvisibleFont;
  if (!+[TSWPRenderer invisiblesFont]::sInvisibleFont)
  {
    if (+[TSWPRenderer invisiblesFont]::sInited)
    {
      return 0;
    }
    else
    {
      +[TSWPRenderer invisiblesFont]::sInited = 1;
      v3 = (void *)[(id)TSWPBundle() pathForResource:@"invisible_glyphs" ofType:@"ttf"];
      double v4 = TSWPInvisibleFontSize();
      v5 = CGDataProviderCreateWithFilename((const char *)[v3 UTF8String]);
      v6 = CGFontCreateWithDataProvider(v5);
      CGDataProviderRelease(v5);
      +[TSWPRenderer invisiblesFont]::sInvisibleFont = (uint64_t)CTFontCreateWithGraphicsFont(v6, v4, 0, 0);
      double UnitsPerEm = (double)CGFontGetUnitsPerEm(v6);
      double v8 = v4 * (double)CGFontGetAscent(v6) / UnitsPerEm;
      uint64_t v9 = 0;
      double v10 = v4 * (double)-CGFontGetDescent(v6) / UnitsPerEm;
      do
      {
        v11 = (double *)((char *)&gInvisibles + v9);
        CTFontGetGlyphsForCharacters((CTFontRef)+[TSWPRenderer invisiblesFont]::sInvisibleFont, (const UniChar *)((char *)&gInvisibles + v9), (CGGlyph *)((char *)&gInvisibles + v9 + 32), 1);
        int advances = 0;
        if (!CGFontGetGlyphAdvances(v6, (const CGGlyph *)((char *)&gInvisibles + v9 + 32), 1uLL, &advances))
        {
          v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v13 = [NSString stringWithUTF8String:"+[TSWPRenderer invisiblesFont]"];
          objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRenderer.mm"), 653, @"CGFontGetGlyphAdvances failed");
        }
        v11[1] = v4 * (double)advances / UnitsPerEm;
        v11[2] = v8;
        v11[3] = v10;
        v9 += 40;
      }
      while (v9 != 400);
      CGFontRelease(v6);
      return (__CTFont *)+[TSWPRenderer invisiblesFont]::sInvisibleFont;
    }
  }
  return result;
}

- (void)dealloc
{
  CGContextRelease(self->_context);

  v3.receiver = self;
  v3.super_class = (Class)TSWPRenderer;
  [(TSWPRenderer *)&v3 dealloc];
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

- (void)setPreventClipToColumn:(BOOL)a3
{
  self->_preventClipToColumn = a3;
}

- (void)setFlipShadows:(BOOL)a3
{
  self->_flipShadows = a3;
}

- (TSWPRenderer)initWithContext:(CGContext *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSWPRenderer;
  double v4 = [(TSWPRenderer *)&v6 init];
  if (v4) {
    v4->_context = CGContextRetain(a3);
  }
  return v4;
}

- (void)drawAdornmentRects:(const void *)a3 forColumn:(id)a4 foreground:(BOOL)a5
{
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    CGContextSaveGState(self->_context);
    uint64_t v8 = *(void *)a3;
    uint64_t v9 = *((void *)a3 + 1);
    if (*(void *)a3 != v9)
    {
      do
      {
        double v11 = *(double *)(v8 + 24);
        double v10 = *(double *)(v8 + 32);
        double v12 = *(double *)(v8 + 40);
        double v13 = *(double *)(v8 + 48);
        if (a5)
        {
          if (*(void *)(v8 + 8) && *(_DWORD *)v8 == 2)
          {
            CGContextSetShouldAntialias(self->_context, 1);
            if (v13 == 0.0)
            {
              Mutable = CGPathCreateMutable();
              CGPathMoveToPoint(Mutable, 0, v11, v10);
              v20.origin.x = v11;
              v20.origin.y = v10;
              v20.size.width = v12;
              v20.size.height = v13;
              CGFloat MaxX = CGRectGetMaxX(v20);
              CGPathAddLineToPoint(Mutable, 0, MaxX, v10);
              [*(id *)(v8 + 8) paintPath:Mutable inContext:self->_context];
              CGPathRelease(Mutable);
            }
            else
            {
              objc_msgSend(*(id *)(v8 + 8), "paintRect:inContext:", self->_context, v11, v10, v12, v13);
            }
          }
          if (*(void *)(v8 + 16) && *(_DWORD *)v8 == 3)
          {
            objc_opt_class();
            v17 = (CGColor *)[(id)TSUDynamicCast() CGColor];
            CGContextSetStrokeColorWithColor(self->_context, v17);
            CGContextSetShouldAntialias(self->_context, 1);
            -[TSWPRenderer p_strokeLineFromPoint:toPoint:width:](self, "p_strokeLineFromPoint:toPoint:width:", v11 + v12 * 0.5, v10, v11 + v12 * 0.5, v10 + v13, v12);
          }
        }
        else
        {
          v16 = *(void **)(v8 + 16);
          if (v16 && *(_DWORD *)v8 == 1) {
            objc_msgSend(v16, "paintRect:inContext:", self->_context, *(double *)(v8 + 24), *(double *)(v8 + 32), *(double *)(v8 + 40), *(double *)(v8 + 48));
          }
        }
        v8 += 56;
      }
      while (v8 != v9);
    }
    context = self->_context;
    CGContextRestoreGState(context);
  }
}

- (void)drawFragment:(const void *)a3 updateRect:(CGRect)a4 drawingState:(const void *)a5 runState:(id *)a6 lineDrawFlags:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v79 = *MEMORY[0x263EF8340];
  if (!*(void *)a5)
  {
    v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v17 = [NSString stringWithUTF8String:"-[TSWPRenderer drawFragment:updateRect:drawingState:runState:lineDrawFlags:]"];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRenderer.mm"), 185, @"storage is nil");
  }
  int v59 = *((_DWORD *)a3 + 6);
  v82.origin.double x = x;
  v82.origin.double y = y;
  v82.size.double width = width;
  v82.size.double height = height;
  CGRect v81 = CGRectIntersection(*(CGRect *)((char *)a3 + 80), v82);
  if (!CGRectIsEmpty(v81))
  {
    NSUInteger v56 = *((void *)a3 + 1);
    NSUInteger v57 = *(void *)a3;
    CGSize v18 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    v76.origin = (CGPoint)*MEMORY[0x263F001A8];
    v76.size = v18;
    BOOL v58 = -[TSWPRenderer p_shouldClipFragment:drawingState:lineDrawFlags:updateRect:outClipRect:](self, "p_shouldClipFragment:drawingState:lineDrawFlags:updateRect:outClipRect:", a3, a5, v7, &v76, x, y, width, height);
    if (v58)
    {
      CGContextSaveGState(self->_context);
      CGContextClipToRect(self->_context, v76);
    }
    double v20 = *((double *)a3 + 5);
    double v19 = *((double *)a3 + 6);
    double v21 = *((double *)a3 + 8);
    double v22 = *((double *)a3 + 4);
    if (v7)
    {
      double v23 = *((double *)a3 + 7);
      double v24 = *((double *)a3 + 9);
      uint64_t v26 = *((void *)a3 + 40);
      uint64_t v25 = *((void *)a3 + 41);
      while (v26 != v25)
      {
        -[TSWPRenderer p_drawAdornmentLineBackgroundRect:lineDrawFlags:drawingState:bounds:](self, "p_drawAdornmentLineBackgroundRect:lineDrawFlags:drawingState:bounds:", v26, v7, a5, v19, v23, v21, v24);
        v26 += 80;
      }
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      v27 = (void *)*((void *)a3 + 66);
      uint64_t v28 = [v27 countByEnumeratingWithState:&v72 objects:v78 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v73 != v29) {
              objc_enumerationMutation(v27);
            }
            v31 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            if ([v31 isBackground]) {
              objc_msgSend(v31, "drawAdornmentForFragment:inContext:withFlags:state:bounds:", a3, self->_context, v7, a5, v19, v23, v21, v24);
            }
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v72 objects:v78 count:16];
        }
        while (v28);
      }
    }
    double v32 = v22 + v20;
    if ((v7 & 0x10000) != 0)
    {
      uint64_t v46 = *((void *)a3 + 43);
      uint64_t v45 = *((void *)a3 + 44);
      while (v46 != v45)
      {
        -[TSWPRenderer p_drawAdornmentLineBackgroundRect:lineDrawFlags:drawingState:bounds:](self, "p_drawAdornmentLineBackgroundRect:lineDrawFlags:drawingState:bounds:", v46, v7, a5, v19, v32 - *((double *)a3 + 16), v21, *((double *)a3 + 16) + *((double *)a3 + 17));
        v46 += 80;
      }
    }
    uint64_t v69 = 0;
    uint64_t v70 = 0;
    uint64_t v71 = 0;
    if ((v7 & 0x400) != 0)
    {
      v80.length = v56;
      v80.location = v57;
      if (NSIntersectionRange(v80, *(NSRange *)(a5 + 216)).length) {
        [(TSWPRenderer *)self p_calculateMarkAdornments:&v69 drawingState:a5 lineFragment:a3];
      }
    }
    if ((v7 & 2) != 0)
    {
      a6->var2 = v32;
      if ((v7 & 8) != 0) {
        [(TSWPRenderer *)self p_drawMisspelledWordMarkingsFragment:a3 drawingState:a5];
      }
      if ((v7 & 0x10) != 0) {
        [(TSWPRenderer *)self p_drawUngrammaticMarkingsFragment:a3 drawingState:a5];
      }
      if ((v7 & 0x200) != 0) {
        [(TSWPRenderer *)self p_drawDictationMarkingsFragment:a3 drawingState:a5];
      }
      if ((v7 & 0x800) != 0) {
        [(TSWPRenderer *)self p_drawAutocorrectionMarkingsFragment:a3 drawingState:a5];
      }
      if (*((void *)a3 + 22)) {
        [(TSWPRenderer *)self p_drawListLabelForFragment:a3 drawingState:a5 lineDrawFlags:v7];
      }
      unsigned int v33 = v59 & 0x2000;
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v62 = __76__TSWPRenderer_drawFragment_updateRect_drawingState_runState_lineDrawFlags___block_invoke;
      v63 = &unk_2646B3250;
      double v66 = v22 + v20;
      v64 = self;
      v65 = a3;
      char v68 = v33 >> 13;
      v67 = a5;
      if ((((!*((void *)a5 + 7) || !*((void *)a5 + 25))
          && (__76__TSWPRenderer_drawFragment_updateRect_drawingState_runState_lineDrawFlags___block_invoke((uint64_t)v61, (uint64_t *)a3 + 24, 0), !*((void *)a5 + 7))|| *((void *)a5 + 25))&& (v62((uint64_t)v61, (uint64_t *)a3 + 28, 0), !*((void *)a5 + 7))|| !*((void *)a5 + 25))&& (v62((uint64_t)v61, (uint64_t *)a3 + 31, 1), !*((void *)a5 + 7))|| !*((void *)a5 + 25))
      {
        uint64_t v35 = *((void *)a3 + 46);
        uint64_t v34 = *((void *)a3 + 47);
        uint64_t v60 = v34;
        while (v35 != v34)
        {
          CGContextSaveGState(self->_context);
          double v36 = *(double *)(v35 + 8);
          double v37 = *(double *)(v35 + 16);
          id v38 = *(id *)v35;
          [*(id *)v35 baselineOffset];
          double v40 = v39;
          [v38 size];
          CGContextTranslateCTM(self->_context, v19 + v36, v37 + v32 - v40 - v41);
          CGContextSetShouldAntialias(self->_context, 1);
          v42 = (void *)[v38 rendererForAttachment];
          if (!v42)
          {
            v43 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v44 = [NSString stringWithUTF8String:"-[TSWPRenderer drawFragment:updateRect:drawingState:runState:lineDrawFlags:]"];
            objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRenderer.mm"), 425, @"Nil TSWPGraphicalAttachmentRenderer for graphical attachment");
          }
          [v42 drawAttachment:v38 inContext:self->_context selection:0];
          CGContextRestoreGState(self->_context);
          v35 += 32;
          uint64_t v34 = v60;
        }
        uint64_t v48 = *((void *)a3 + 34);
        uint64_t v47 = *((void *)a3 + 35);
        while (v48 != v47)
        {
          -[TSWPRenderer p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:](self, "p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:", v48, a5, a3, v33 != 0, v19, v32);
          v48 += 80;
        }
        if ((v7 & 0x400) != 0)
        {
          uint64_t v55 = v69;
          uint64_t v54 = v70;
          while (v55 != v54)
          {
            -[TSWPRenderer p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:](self, "p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:", v55, a5, a3, v33 != 0, v19, v32);
            v55 += 80;
          }
        }
        uint64_t v50 = *((void *)a3 + 37);
        uint64_t v49 = *((void *)a3 + 38);
        while (v50 != v49)
        {
          -[TSWPRenderer p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:](self, "p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:", v50, a5, a3, v33 != 0, v19, v32);
          v50 += 80;
        }
        CGContextSetTextDrawingMode(self->_context, kCGTextFill);
        uint64_t v51 = *((void *)a3 + 55);
        uint64_t v52 = *((void *)a3 + 56);
        while (v51 != v52)
        {
          [(TSWPRenderer *)self p_drawAdornments:v51 lineFragment:a3 state:a5];
          v51 += 200;
        }
        uint64_t v53 = *((void *)a3 + 58);
        if (v53) {
          [(TSWPRenderer *)self p_drawInvisiblesBreakLine:v53 lineFragment:a3 state:a5];
        }
      }
    }
    if (v58) {
      CGContextRestoreGState(self->_context);
    }
    v77 = (void **)&v69;
    std::vector<TSWPAdornmentLine>::__destroy_vector::operator()[abi:nn180100](&v77);
  }
}

void __76__TSWPRenderer_drawFragment_updateRect_drawingState_runState_lineDrawFlags___block_invoke(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  if (*a2 != v4)
  {
    char v7 = 1;
    do
    {
      uint64_t v8 = *(const __CTLine **)v3;
      CGFloat v9 = *(double *)(v3 + 8) + *(double *)(*(void *)(a1 + 40) + 48);
      CGFloat v10 = *(double *)(v3 + 16) + *(double *)(a1 + 48);
      CGContextSaveGState(*(CGContextRef *)(*(void *)(a1 + 32) + 8));
      CGContextTranslateCTM(*(CGContextRef *)(*(void *)(a1 + 32) + 8), v9, v10);
      CGContextSetTextPosition(*(CGContextRef *)(*(void *)(a1 + 32) + 8), 0.0, 0.0);
      uint64_t v11 = *(void *)(a1 + 40);
      if (*(unsigned char *)(a1 + 64))
      {
        uint64_t v12 = *(void *)(a1 + 56);
      }
      else
      {
        uint64_t v12 = *(void *)(a1 + 56);
        if ((*(_WORD *)(v11 + 24) & 0x420) == 0 && !*(void *)(v12 + 56))
        {
          double v13 = *(CGContext **)(*(void *)(a1 + 32) + 8);
          CGAffineTransformMakeScale(&transform, 1.0, -1.0);
          CGContextConcatCTM(v13, &transform);
          CTLineDraw(v8, *(CGContextRef *)(*(void *)(a1 + 32) + 8));
          goto LABEL_8;
        }
      }
      LOBYTE(v14) = v7;
      objc_msgSend(*(id *)(a1 + 32), "p_drawTextInRunsForLine:fragment:state:tateChuYoko:baseRange:isFirstLineRef:", v8, v11, v12, a3, *(void *)(v3 + 24), *(void *)(v3 + 32), v14);
LABEL_8:
      CGContextRestoreGState(*(CGContextRef *)(*(void *)(a1 + 32) + 8));
      char v7 = 0;
      v3 += 48;
    }
    while (v3 != v4);
  }
}

- (BOOL)p_shouldClipFragment:(const void *)a3 drawingState:(const void *)a4 lineDrawFlags:(unsigned int)a5 updateRect:(CGRect)a6 outClipRect:(CGRect *)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  char v12 = a5;
  CGFloat v15 = *((double *)a4 + 2);
  CGFloat v16 = *((double *)a4 + 3);
  CGFloat v17 = *((double *)a4 + 4);
  v48.size.double height = *((CGFloat *)a4 + 5);
  v48.origin.double x = v15;
  v48.origin.double y = v16;
  v48.size.double width = v17;
  CGFloat rect = v48.size.height;
  double v18 = CGRectGetWidth(v48);
  CFIndex v19 = TSWPLineFragment::glyphCount((TSWPLineFragment *)a3);
  double v46 = 10000000.0;
  if ((v19 == 1 || v19 == 2 && (*((unsigned char *)a3 + 25) & 8) != 0) && rint(*((double *)a3 + 27)) > rint(v18))
  {
    v49.origin.double x = v15;
    v49.origin.double y = v16;
    v49.size.double width = v17;
    v49.size.double height = rect;
    double MaxX = CGRectGetMaxX(v49);
    v50.origin.double x = x;
    v50.origin.double y = y;
    v50.size.double width = width;
    v50.size.double height = height;
    double v21 = CGRectGetMaxX(v50);
    if (v21 >= MaxX) {
      double v21 = MaxX;
    }
    double v46 = v21;
    v51.origin.double x = v15;
    v51.origin.double y = v16;
    v51.size.double width = v17;
    v51.size.double height = rect;
    double MinX = CGRectGetMinX(v51);
    if (MinX >= x) {
      double x = MinX;
    }
    double y = fmax(y, -10000000.0);
    int v23 = 1;
    if ((v12 & 2) != 0) {
      goto LABEL_10;
    }
LABEL_12:
    double MaxY = CGRectGetMaxY(*(CGRect *)((char *)a3 + 48));
    double v24 = *((double *)a3 + 4) + *((double *)a3 + 5);
    goto LABEL_13;
  }
  int v23 = 0;
  if ((v12 & 2) == 0) {
    goto LABEL_12;
  }
LABEL_10:
  double v24 = *((double *)a3 + 4) + *((double *)a3 + 5);
  double MaxY = v24 + *((double *)a3 + 17);
LABEL_13:
  if (*((unsigned char *)a4 + 94)) {
    goto LABEL_14;
  }
  double v43 = *((double *)a3 + 16);
  double v44 = *((double *)a3 + 18);
  CGFloat v45 = width;
  double v27 = height;
  double v28 = rint(MaxY);
  v52.origin.double x = v15;
  v52.origin.double y = v16;
  v52.size.double width = v17;
  v52.size.double height = rect;
  BOOL v29 = v28 <= rint(CGRectGetMaxY(v52));
  double height = v27;
  double width = v45;
  if (!v29) {
    goto LABEL_19;
  }
  v53.origin.double x = v15;
  v53.origin.double y = v16;
  v53.size.double width = v17;
  v53.size.double height = rect;
  if (rint(v24 - v43 - fmin(v44, 0.0)) >= rint(CGRectGetMinY(v53)))
  {
LABEL_14:
    if (!v23)
    {
      BOOL v41 = 0;
      goto LABEL_31;
    }
    double v26 = 10000000.0;
  }
  else
  {
LABEL_19:
    v54.origin.double x = v15;
    v54.origin.double y = v16;
    v54.size.double width = v17;
    v54.size.double height = rect;
    double v26 = CGRectGetMaxY(v54);
    v55.origin.double x = x;
    v55.origin.double y = y;
    v55.size.double width = v45;
    v55.size.double height = height;
    double v30 = CGRectGetMaxY(v55);
    if (v30 < v26) {
      double v26 = v30;
    }
    v56.origin.double x = v15;
    v56.origin.double y = v16;
    v56.size.double width = v17;
    v56.size.double height = rect;
    double MinY = CGRectGetMinY(v56);
    if (MinY >= y) {
      double y = MinY;
    }
    double x = fmax(x, -10000000.0);
  }
  v57.origin.double x = x;
  v57.origin.double y = y;
  v57.size.double width = width;
  v57.size.double height = height;
  double v32 = CGRectGetMaxX(v57);
  double v33 = height;
  if (v32 >= v46) {
    double v34 = v46;
  }
  else {
    double v34 = v32;
  }
  double v35 = x;
  double v36 = y;
  double v37 = width;
  double v38 = CGRectGetMaxY(*(CGRect *)(&v33 - 3));
  if (v38 >= v26) {
    double v38 = v26;
  }
  double v39 = fmax(v38 - y, 0.0);
  double v40 = v34 - x;
  double height = v39;
  double width = fmax(v40, 0.0);
  BOOL v41 = 1;
LABEL_31:
  BOOL result = (*((_DWORD *)a3 + 6) & 0x1000000) == 0 && v41;
  a7->origin.double x = x;
  a7->origin.double y = y;
  a7->size.double width = width;
  a7->size.double height = height;
  return result;
}

- (void)p_drawAdornments:(const void *)a3 lineFragment:(const void *)a4 state:(const void *)a5
{
  int v5 = *(_DWORD *)a3;
  if ((*(_DWORD *)a3 - 1) >= 2)
  {
    if (v5 == 3)
    {
      if (!*((unsigned char *)a5 + 88) && *((unsigned char *)a5 + 90) && TSWPLineFragment::glyphCount((TSWPLineFragment *)a4))
      {
        [(TSWPRenderer *)self p_drawAttachmentAdornments:a3 lineFragment:a4 state:a5];
      }
    }
    else if (v5 == 6)
    {
      if (!*((unsigned char *)a5 + 88) && *((unsigned char *)a5 + 90))
      {
        -[TSWPRenderer p_drawHiddenDeletionsAdornments:lineFragment:state:](self, "p_drawHiddenDeletionsAdornments:lineFragment:state:");
      }
    }
    else
    {
      -[TSWPRenderer p_drawAdornmentGlyphs:lineFragment:state:](self, "p_drawAdornmentGlyphs:lineFragment:state:");
    }
  }
}

- (void)didRenderFragments
{
}

- (void)willRenderFragmentsWithDrawingState:(const void *)a3
{
  CGContextSaveGState(self->_context);
  context = self->_context;
  objc_super v6 = (void *)*((void *)a3 + 1);
  if (v6) {
    [v6 transformFromWP];
  }
  else {
    memset(&transform, 0, sizeof(transform));
  }
  CGContextConcatCTM(context, &transform);
  char v7 = self->_context;
  long long v8 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v9.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v9.c = v8;
  *(_OWORD *)&v9.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGContextSetTextMatrix(v7, &v9);
}

- (BOOL)preventClipToColumn
{
  return self->_preventClipToColumn;
}

- (CGRect)getClipBoundingBox
{
  return CGContextGetClipBoundingBox(self->_context);
}

- (CGSize)convertSizeToDeviceSpace:(CGSize)a3
{
  CGSize v5 = CGContextConvertSizeToDeviceSpace(self->_context, a3);
  double height = v5.height;
  double width = v5.width;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)p_drawWordMarkingsForFragment:(const void *)a3 color:(id)a4 ranges:(const void *)a5 suppressRange:(_NSRange)a6 drawingState:(const void *)a7
{
  NSUInteger length = a6.length;
  NSUInteger range1 = a6.location;
  lengths[2] = *(CGFloat *)MEMORY[0x263EF8340];
  NSUInteger location = *(void *)a3;
  NSUInteger v14 = *((void *)a3 + 1);
  unint64_t v15 = v14 + *(void *)a3;
  if (v15 > [*(id *)a7 characterCount])
  {
    range1_8a = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    id v16 = a4;
    CGFloat v17 = a5;
    NSUInteger v18 = length;
    uint64_t v19 = [NSString stringWithUTF8String:"-[TSWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:]"];
    uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRenderer.mm"];
    uint64_t v21 = v19;
    NSUInteger length = v18;
    a5 = v17;
    a4 = v16;
    [range1_8a handleFailureInFunction:v21 file:v20 lineNumber:742 description:@"Invalid line fragment range"];
    v52.NSUInteger location = [*(id *)a7 range];
    v52.NSUInteger length = v22;
    v49.NSUInteger location = location;
    v49.NSUInteger length = v14;
    NSRange v23 = NSIntersectionRange(v49, v52);
    NSUInteger location = v23.location;
    NSUInteger v14 = v23.length;
  }
  CGContextSaveGState(self->_context);
  CGContextSetStrokeColorWithColor(self->_context, (CGColorRef)[a4 CGColor]);
  *(void *)&lengths[0] = gSpellDotWidth;
  lengths[1] = *(double *)&gSpellDotStride - *(double *)&gSpellDotWidth;
  CGContextSetLineDash(self->_context, 0.0, lengths, 2uLL);
  int range1_8 = *((_DWORD *)a3 + 6);
  double v24 = *((double *)a3 + 16);
  NSUInteger v26 = *((void *)a7 + 27);
  NSUInteger v25 = *((void *)a7 + 28);
  uint64_t v27 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  BOOL v28 = v26 == *MEMORY[0x263F7C7C8] && v25 == v27;
  uint64_t v47 = (TSWPColumn **)a7;
  if (v28)
  {
    NSUInteger v25 = length;
    NSUInteger v26 = range1;
  }
  else
  {
    v29.NSUInteger location = range1;
    if (range1 != *MEMORY[0x263F7C7C8] || length != v27)
    {
      v29.NSUInteger length = length;
      NSRange v31 = NSUnionRange(v29, *(NSRange *)((char *)a7 + 216));
      NSUInteger v26 = v31.location;
      NSUInteger v25 = v31.length;
    }
  }
  double v33 = *(NSUInteger **)a5;
  double v32 = (NSUInteger *)*((void *)a5 + 1);
  if (*(NSUInteger **)a5 != v32)
  {
    do
    {
      NSUInteger v34 = *v33;
      NSUInteger v35 = v33[1];
      v50.NSUInteger location = *v33;
      v50.NSUInteger length = v35;
      v53.NSUInteger location = v26;
      v53.NSUInteger length = v25;
      if (!NSIntersectionRange(v50, v53).length)
      {
        v51.NSUInteger location = v34;
        v51.NSUInteger length = v35;
        v54.NSUInteger location = location;
        v54.NSUInteger length = v14;
        NSRange v36 = NSIntersectionRange(v51, v54);
        if (v36.length)
        {
          double v37 = TSWPLineFragment::wpOffsetForCharIndex((TSWPLineFragment *)a3, v36.location, 1, 1, 0);
          double v38 = rint(TSWPLineFragment::wpOffsetForCharIndex((TSWPLineFragment *)a3, v36.location + v36.length, 1, 1, 0)- v37);
          if (v38 > 0.0)
          {
            double v39 = *(double *)&gSpellDotStride;
            double v40 = fmod(v38, *(long double *)&gSpellDotStride);
            if (v40 <= 1.0) {
              double v41 = -v40;
            }
            else {
              double v41 = v39 - v40;
            }
            double v42 = TSWPLineFragment::lowestBaselineInRange((TSWPLineFragment *)a3, v36, v47[1]);
            if ((range1_8 & 0x2000) != 0) {
              double v43 = floor(v42 - v24);
            }
            else {
              double v43 = floor(v42) + *(double *)&gSpellDotHeight;
            }
            -[TSWPRenderer p_strokeLineFromPoint:toPoint:width:](self, "p_strokeLineFromPoint:toPoint:width:", v37, v43, v37 + fmax(v38 + v41, v39), v43);
          }
        }
      }
      v33 += 2;
    }
    while (v33 != v32);
  }
  CGContextRestoreGState(self->_context);
}

- (void)p_drawMisspelledWordMarkingsFragment:(const void *)a3 drawingState:(const void *)a4
{
  *(_OWORD *)&__p.__begin_ = *(_OWORD *)a3;
  TSWPRangeVector::rangesIntersecting((TSWPRangeVector *)a4 + 4, &v9);
  if ([*(id *)a4 hasTrackedChanges] && *(void *)a4)
  {
    objc_msgSend(*(id *)a4, "deletedRangeVectorInRange:", *(void *)a3, *((void *)a3 + 1));
    begin = __p.__begin_;
    if (__p.__end_ != __p.__begin_)
    {
      TSWPRangeVector::subtract(&v9, &__p);
      begin = __p.__begin_;
    }
    if (begin)
    {
      __p.__end_ = begin;
      operator delete(begin);
    }
  }
  -[TSWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:](self, "p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:", a3, objc_msgSend(MEMORY[0x263F7C808], "redColor", __p.__begin_), &v9, *((void *)a4 + 18), *((void *)a4 + 19), a4);
  if (v9.__begin_)
  {
    v9.__end_ = v9.__begin_;
    operator delete(v9.__begin_);
  }
}

- (void)p_drawUngrammaticMarkingsFragment:(const void *)a3 drawingState:(const void *)a4
{
  *(_OWORD *)&v10.__begin_ = *(_OWORD *)a3;
  TSWPRangeVector::rangesIntersecting((TSWPRangeVector *)a4 + 5, &v11);
  *(_OWORD *)&__p.__begin_ = *(_OWORD *)a3;
  TSWPRangeVector::rangesIntersecting((TSWPRangeVector *)a4 + 4, &v10);
  TSWPRangeVector::subtract(&v11, &v10);
  if ([*(id *)a4 hasTrackedChanges] && *(void *)a4)
  {
    objc_msgSend(*(id *)a4, "deletedRangeVectorInRange:", *(void *)a3, *((void *)a3 + 1));
    begin = __p.__begin_;
    if (__p.__end_ != __p.__begin_)
    {
      TSWPRangeVector::subtract(&v11, &__p);
      begin = __p.__begin_;
    }
    if (begin)
    {
      __p.__end_ = begin;
      operator delete(begin);
    }
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x263F7C808], "colorWithRed:green:blue:alpha:", 0.22, 0.62, 0.2, 1.0, __p.__begin_);
  -[TSWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:](self, "p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:", a3, v8, &v11, *MEMORY[0x263F7C7C8], *(void *)(MEMORY[0x263F7C7C8] + 8), a4);
  if (v10.__begin_)
  {
    v10.__end_ = v10.__begin_;
    operator delete(v10.__begin_);
  }
  if (v11.__begin_)
  {
    v11.__end_ = v11.__begin_;
    operator delete(v11.__begin_);
  }
}

- (void)p_drawDictationMarkingsFragment:(const void *)a3 drawingState:(const void *)a4
{
  uint64_t v7 = [MEMORY[0x263F7C808] blueColor];
  uint64_t v8 = *((void *)a4 + 20);
  uint64_t v9 = *MEMORY[0x263F7C7C8];
  uint64_t v10 = *(void *)(MEMORY[0x263F7C7C8] + 8);

  -[TSWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:](self, "p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:", a3, v7, v8, v9, v10, a4);
}

- (void)p_drawAutocorrectionMarkingsFragment:(const void *)a3 drawingState:(const void *)a4
{
  uint64_t v7 = [MEMORY[0x263F7C808] blueColor];
  uint64_t v8 = *((void *)a4 + 21);
  uint64_t v9 = *MEMORY[0x263F7C7C8];
  uint64_t v10 = *(void *)(MEMORY[0x263F7C7C8] + 8);

  -[TSWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:](self, "p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:", a3, v7, v8, v9, v10, a4);
}

- (void)p_drawAdornmentLine:(const TSWPAdornmentLine *)a3 drawingState:(const void *)a4 lineFragment:(const void *)a5 lineFragmentStart:(CGPoint)a6 vertical:(BOOL)a7
{
  double var3 = a3->var3;
  double v12 = a6.x + a3->var0.x;
  double y = a6.y + a3->var0.y;
  unsigned int var4 = a3->var4;
  if (a3->var1 >= *((double *)a5 + 8) - a3->var0.x) {
    double var1 = *((double *)a5 + 8) - a3->var0.x;
  }
  else {
    double var1 = a3->var1;
  }
  if (*((unsigned char *)a4 + 90))
  {
    memset(&v52, 0, sizeof(v52));
    CGContextGetCTM(&v52, self->_context);
    CGAffineTransform v51 = v52;
    if (TSDIsTransformAxisAligned(&v51.a))
    {
      v54.double width = var3;
      v54.double height = var3;
      CGSize v16 = CGContextConvertSizeToDeviceSpace(self->_context, v54);
      if (v16.height >= 0.5)
      {
        CGContextConvertPointToDeviceSpace(self->_context, *((CGPoint *)a4 + 1));
        CGContextConvertSizeToDeviceSpace(self->_context, *((CGSize *)a4 + 2));
        double v17 = fmax(rint(v16.height), 1.0);
        v55.CGFloat x = v12;
        v55.double y = y;
        CGPoint v19 = CGContextConvertPointToDeviceSpace(self->_context, v55);
        CGFloat x = v19.x;
        double v20 = rint(v19.y);
        double v21 = 0.0;
        if (((int)v17 & 0x80000001) == 1) {
          double v21 = 0.5;
        }
        double v22 = v21 + v20;
        double y = CGContextConvertPointToUserSpace((CGContextRef)self[8], *(CGPoint *)&x).y;
        v56.double width = v16.width;
        v56.double height = v17;
        double var3 = fabs(CGContextConvertSizeToUserSpace((CGContextRef)self[8], v56).height);
      }
    }
  }
  context = self->_context;
  id var9 = a3->var9;
  if (var9) {
    var2 = (CGColor *)[var9 cgColor];
  }
  else {
    var2 = a3->var2;
  }
  double v26 = fmax(var1, 0.0);
  CGContextSetStrokeColorWithColor(context, var2);
  double v27 = *MEMORY[0x263F001A0];
  double v28 = *(double *)(MEMORY[0x263F001A0] + 16);
  NSRange v29 = (void *)*((void *)a4 + 7);
  if (v29)
  {
    v30.NSUInteger location = [v29 range];
    uint64_t v31 = *MEMORY[0x263F7C7C8];
    NSUInteger v32 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  }
  else
  {
    uint64_t v31 = *MEMORY[0x263F7C7C8];
    NSUInteger v32 = *(void *)(MEMORY[0x263F7C7C8] + 8);
    v30.NSUInteger location = *MEMORY[0x263F7C7C8];
    v30.NSUInteger length = v32;
  }
  double v33 = v12 + v26;
  BOOL v34 = v30.location == v31 && v30.length == v32;
  char v35 = !v34;
  if (!v34)
  {
    NSUInteger v36 = *(void *)a5;
    NSUInteger v37 = *((void *)a5 + 1);
    v53.NSUInteger location = *(void *)a5;
    v53.NSUInteger length = v37;
    NSRange v38 = NSIntersectionRange(v30, v53);
    if (!v38.length) {
      return;
    }
    if (v38.location >= v36 && v38.location - v36 < v37)
    {
      double v39 = TSWPLineFragment::wpOffsetForCharIndex((TSWPLineFragment *)a5, v38.location, 1, 1, 0);
      if (v12 >= v39) {
        double v39 = v12;
      }
      double v27 = v39 + -1.0;
    }
    unint64_t v40 = v38.location + v38.length;
    BOOL v41 = v38.location + v38.length - v36 < v37 && v40 >= v36;
    if (v41 || v40 == v37 + v36)
    {
      double v43 = TSWPLineFragment::wpOffsetForCharIndex((TSWPLineFragment *)a5, v40, 1, 1, 0);
      if (v43 >= v33) {
        double v43 = v33;
      }
      BOOL v44 = v43 <= v27;
      BOOL v42 = v43 > v27;
      double v45 = v43 - v27;
      if (!v44) {
        double v28 = v45;
      }
    }
    else
    {
      BOOL v42 = 1;
    }
    if (a3->var5 == 3)
    {
      double WavyLineHalfAmplitude = GetWavyLineHalfAmplitude(var3);
      if (!v42) {
        return;
      }
    }
    else
    {
      double WavyLineHalfAmplitude = var3 * 0.5;
      if (!v42) {
        return;
      }
    }
    double v47 = WavyLineHalfAmplitude + 1.0;
    if (var4 == 2) {
      double v48 = (v47 + v47) * 1.5;
    }
    else {
      double v48 = v47 + v47;
    }
    CGFloat v49 = y - v47;
    CGContextSaveGState(self->_context);
    v57.origin.CGFloat x = v27;
    v57.origin.double y = v49;
    v57.size.double width = v28;
    v57.size.double height = v48;
    CGContextClipToRect(self->_context, v57);
  }
  if (var4)
  {
    double v50 = y;
    do
    {
      if (a3->var5 == 3) {
        -[TSWPRenderer p_strokeWavyLineFromPoint:toPoint:width:](self, "p_strokeWavyLineFromPoint:toPoint:width:", v12, y, v33, v50, var3);
      }
      else {
        -[TSWPRenderer p_strokeLineFromPoint:toPoint:width:](self, "p_strokeLineFromPoint:toPoint:width:", v12, y, v33, v50, var3);
      }
      double y = y + var3 * 2.0;
      double v50 = v50 + var3 * 2.0;
      --var4;
    }
    while (var4);
  }
  if (v35) {
    CGContextRestoreGState(self->_context);
  }
}

- (void)p_drawAdornmentLineBackgroundRect:(const TSWPAdornmentLine *)a3 lineDrawFlags:(unsigned int)a4 drawingState:(const void *)a5 bounds:(CGRect)a6
{
  CGFloat height = a6.size.height;
  double width = a6.size.width;
  CGFloat y = a6.origin.y;
  double x = a6.origin.x;
  if ((a4 & 2) != 0)
  {
    id var9 = a3->var9;
    if (var9) {
      var2 = (CGColor *)[var9 cgColor];
    }
    else {
      var2 = a3->var2;
    }
    CopyWithAlpha = CGColorCreateCopyWithAlpha(var2, 0.5);
    CGContextSetFillColorWithColor(self->_context, CopyWithAlpha);
    CGColorRelease(CopyWithAlpha);
  }
  else
  {
    context = self->_context;
    id v13 = a3->var9;
    if (v13) {
      NSUInteger v14 = (CGColor *)[v13 cgColor];
    }
    else {
      NSUInteger v14 = a3->var2;
    }
    CGContextSetFillColorWithColor(context, v14);
  }
  double var1 = width - a3->var0.x;
  if (a3->var1 < var1) {
    double var1 = a3->var1;
  }
  if (var1 > 0.0)
  {
    double v19 = x + a3->var0.x;
    double v20 = self->_context;
    CGFloat v21 = y;
    CGFloat v22 = height;
    CGContextFillRect(v20, *(CGRect *)(&var1 - 2));
  }
}

- (void)p_strokeLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 width:(double)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v7 = a3.y;
  CGFloat v8 = a3.x;
  CGContextSetLineWidth(self->_context, a5);
  CGContextMoveToPoint(self->_context, v8, v7);
  CGContextAddLineToPoint(self->_context, x, y);
  context = self->_context;

  CGContextStrokePath(context);
}

- (void)p_strokeWavyLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 width:(double)a5
{
  double x = a4.x;
  double y = a3.y;
  double v8 = a3.x;
  double WavyLineRate = GetWavyLineRate();
  double WavyLineHalfAmplitude = GetWavyLineHalfAmplitude(a5);
  double WavyLineThickness = GetWavyLineThickness(a5);
  CGContextSaveGState(self->_context);
  v24.origin.double y = y - (WavyLineHalfAmplitude + 1.0);
  v24.size.CGFloat height = WavyLineHalfAmplitude + 1.0 + WavyLineHalfAmplitude + 1.0;
  v24.origin.double x = v8;
  v24.size.double width = x - v8;
  CGContextClipToRect(self->_context, v24);
  CGContextBeginPath(self->_context);
  CGContextMoveToPoint(self->_context, v8, y);
  CGContextSetLineWidth(self->_context, WavyLineThickness);
  double v22 = fmax((x - v8) * WavyLineRate, 1.0);
  if (v22 > 0.0)
  {
    double v13 = (x - v8) / v22 * 0.5;
    double v14 = v13 * 0.5;
    double v15 = y - WavyLineHalfAmplitude;
    double v16 = y + WavyLineHalfAmplitude;
    double v17 = 0.0;
    do
    {
      double v18 = v14 + v8;
      if (x < v14 + v8) {
        double v18 = x;
      }
      CGFloat v19 = v13 + v8;
      CGContextAddQuadCurveToPoint(self->_context, v18, v15, v19, y);
      CGFloat v20 = v14 + v19;
      double v8 = v13 + v19;
      CGContextAddQuadCurveToPoint(self->_context, v20, v16, v8, y);
      double v17 = v17 + 1.0;
    }
    while (v17 < v22);
  }
  CGContextDrawPath(self->_context, kCGPathStroke);
  context = self->_context;

  CGContextRestoreGState(context);
}

- (void)p_drawTextInRunsForLine:(__CTLine *)a3 fragment:(const void *)a4 state:(const void *)a5 tateChuYoko:(BOOL)a6 baseRange:(_NSRange)a7 isFirstLineRef:(BOOL)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  BOOL v50 = a6;
  uint64_t v66 = *MEMORY[0x263EF8340];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  CFArrayRef obj = CTLineGetGlyphRuns(a3);
  uint64_t v52 = [(__CFArray *)obj countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v52)
  {
    uint64_t v51 = *(void *)v62;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v62 != v51) {
          objc_enumerationMutation(obj);
        }
        double v12 = *(const __CTRun **)(*((void *)&v61 + 1) + 8 * v11);
        uint64_t GlyphCount = CTRunGetGlyphCount(v12);
        if ((unint64_t)(GlyphCount - 65537) < 0xFFFFFFFFFFFF0000)
        {
          BOOL v44 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v45 = [NSString stringWithUTF8String:"-[TSWPRenderer p_drawTextInRunsForLine:fragment:state:tateChuYoko:baseRange:isFirstLineRef:]"];
          objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRenderer.mm"), 1187, @"bad glyph count: %ld", GlyphCount);
          return;
        }
        Attributes = (TSWPLineFragment *)CTRunGetAttributes(v12);
        double v15 = (void *)[(TSWPLineFragment *)Attributes objectForKeyedSubscript:@"TSWPRubySpacingRunAttribute"];
        if (!v15 || ([v15 BOOLValue] & 1) == 0)
        {
          CGContextSaveGState(self->_context);
          double v17 = TSWPLineFragment::baselineShiftFromRunAttributes(Attributes, v16);
          memset(&v60, 0, sizeof(v60));
          CTRunGetTextMatrix(&v60, v12);
          char Status = CTRunGetStatus(v12);
          double v19 = 0.0;
          double v20 = 0.0;
          if ((*((unsigned char *)a4 + 25) & 0x20) != 0)
          {
            if (v50)
            {
              CGContextTranslateCTM(self->_context, *((CGFloat *)a3 + 1), *((CGFloat *)a3 + 2));
              CGContextRotateCTM(self->_context, -1.57079633);
              goto LABEL_15;
            }
            char v21 = Status;
            ascent.__begin_ = 0;
            CGFloat descent = 0.0;
            leading.__begin_ = 0;
            v67.NSUInteger location = 0;
            v67.NSUInteger length = 0;
            CTRunGetTypographicBounds(v12, v67, (CGFloat *)&ascent, &descent, (CGFloat *)&leading);
            if ((v21 & 4) != 0)
            {
              CGContextRotateCTM(self->_context, -1.57079633);
LABEL_15:
              double v20 = 0.0;
            }
            else
            {
              double v20 = (*(double *)&ascent.__begin_ - descent) * -0.5;
            }
          }
          if ((*((unsigned char *)a4 + 25) & 0x10) != 0 && a8) {
            double v19 = *((double *)a4 + 65);
          }
          CGContextSetTextPosition(self->_context, v19 + v60.tx, v20 + v17 + v60.ty);
          context = self->_context;
          CGAffineTransformMakeScale(&transform, 1.0, -1.0);
          CGContextConcatCTM(context, &transform);
          if (!*((unsigned char *)a5 + 89))
          {
            NSRange v23 = (void *)[(TSWPLineFragment *)Attributes objectForKeyedSubscript:@"TSWPShadow"];
            if (v23) {
              [v23 applyToContext:self->_context viewScale:self->_flipShadows flipped:self->_viewScale];
            }
          }
          v58.NSUInteger location = 0;
          v58.NSUInteger length = 0;
          CGRect v24 = (void *)*((void *)a5 + 7);
          if (v24)
          {
            NSUInteger v26 = [v24 superRange];
            v58.NSUInteger location = v26;
            v58.NSUInteger length = v25;
            double v27 = (void *)*((void *)a5 + 7);
            if (v27 && (v50 || (location < v26 || location - v26 >= v25) && (location != v26 || v25 != length)))
            {
              if (*((void *)a5 + 24) == *MEMORY[0x263F7C7C8]
                && *((void *)a5 + 25) == *(void *)(MEMORY[0x263F7C7C8] + 8))
              {
                if ((unint64_t)[v27 visualRangeCount] < 2) {
                  TSWPRangeVector::TSWPRangeVector(&ascent, &v58);
                }
                else {
                  std::vector<CGPoint>::vector(&ascent, [*((id *)a5 + 7) visualRanges]);
                }
                CGFloat descent = 0.0;
                CGPoint v55 = 0;
                uint64_t v56 = 0;
                std::vector<unsigned long>::__vallocate[abi:nn180100](&descent, GlyphCount);
                uint64_t v31 = (char *)v55;
                bzero(v55, 8 * GlyphCount);
                CGPoint v55 = &v31[8 * GlyphCount];
                v68.NSUInteger location = 0;
                v68.NSUInteger length = GlyphCount;
                CTRunGetStringIndices(v12, v68, *(CFIndex **)&descent);
                id v32 = objc_alloc_init(MEMORY[0x263F089C8]);
                if (v50 && v58.location != 0x7FFFFFFFFFFFFFFFLL && location != 0x7FFFFFFFFFFFFFFFLL) {
                  v58.location -= location;
                }
                TSWPRangeVector::intersection(&ascent, &leading);
                std::vector<EQKitLength>::__assign_with_size[abi:nn180100]<EQKitLength*,EQKitLength*>((char *)&ascent, (char *)leading.__begin_, (uint64_t)leading.__end_, leading.__end_ - leading.__begin_);
                if (leading.__begin_)
                {
                  leading.__end_ = leading.__begin_;
                  operator delete(leading.__begin_);
                }
                begin = ascent.__begin_;
                if (ascent.__end_ == ascent.__begin_) {
                  goto LABEL_51;
                }
                unint64_t v34 = 0;
                unsigned int v35 = 1;
                do
                {
                  uint64_t v36 = objc_msgSend(*((id *)a4 + 23), "charRangeMappedFromStorage:", begin[v34].location, begin[v34].length);
                  begin = ascent.__begin_;
                  NSUInteger v37 = &ascent.__begin_[v34];
                  v37->NSUInteger location = v36;
                  v37->NSUInteger length = v38;
                  unint64_t v34 = v35++;
                }
                while (v34 < ascent.__end_ - begin);
                if (GlyphCount >= 1)
                {
LABEL_51:
                  uint64_t v39 = 0;
                  do
                  {
                    if (TSWPRangeVector::containsCharacterAtIndex(&ascent, *(void *)(*(void *)&descent + 8 * v39), 0))[v32 addIndex:v39]; {
                    ++v39;
                    }
                  }
                  while (GlyphCount != v39);
                }
                CFIndex v40 = [v32 firstIndex];
                CFIndex v41 = 0;
                uint64_t v42 = v40;
                do
                {
                  if (v42 == v41 + v40)
                  {
                    ++v41;
                  }
                  else
                  {
                    CGContextSaveGState(self->_context);
                    v69.NSUInteger location = v40;
                    v69.NSUInteger length = v41;
                    CTRunDraw(v12, self->_context, v69);
                    CGContextRestoreGState(self->_context);
                    CFIndex v40 = v42;
                    CFIndex v41 = 1;
                  }
                  uint64_t v42 = [v32 indexGreaterThanIndex:v42];
                }
                while (v40 != 0x7FFFFFFFFFFFFFFFLL);

                if (descent != 0.0)
                {
                  CGPoint v55 = *(void **)&descent;
                  operator delete(*(void **)&descent);
                }
                if (ascent.__begin_)
                {
                  ascent.__end_ = ascent.__begin_;
                  operator delete(ascent.__begin_);
                }
              }
            }
            else
            {
LABEL_34:
              NSRange v28 = (NSRange)*((_OWORD *)a5 + 12);
              v29.NSUInteger location = 0;
              if (v28 != *MEMORY[0x263F7C7C8])
              {
                v29.NSUInteger length = GlyphCount;
                NSRange v30 = NSIntersectionRange(v28, (NSRange)v29);
                v29.NSUInteger location = v30.location;
                uint64_t GlyphCount = v30.length;
              }
              v29.NSUInteger length = GlyphCount;
              CTRunDraw(v12, self->_context, v29);
            }
            CGContextRestoreGState(self->_context);
            goto LABEL_38;
          }
          _NSRange v58 = (_NSRange)*MEMORY[0x263F7C7C8];
          goto LABEL_34;
        }
LABEL_38:
        ++v11;
      }
      while (v11 != v52);
      uint64_t v43 = [(__CFArray *)obj countByEnumeratingWithState:&v61 objects:v65 count:16];
      uint64_t v52 = v43;
    }
    while (v43);
  }
}

- (void)p_drawAttachmentGlyphAtPosition:(id)a3 fragment:(const void *)a4
{
  double v5 = floor(a3.var1) + 0.5;
  double v6 = -*((double *)a4 + 16) - *((double *)a4 + 18);
  double v7 = v5 - 4.80000019 * 0.5;
  -[TSWPRenderer p_strokeLineFromPoint:toPoint:width:](self, "p_strokeLineFromPoint:toPoint:width:", a3.var0, v5, v6, v5, *((double *)a4 + 17) + *((double *)a4 + 19) + *((double *)a4 + 20), 1.0);
  context = self->_context;
  double v9 = v7;
  double v10 = v6;
  uint64_t v11 = 0x4013333340000000;
  uint64_t v12 = 0x4013333340000000;

  CGContextFillEllipseInRect(context, *(CGRect *)&v9);
}

- (void)p_drawInvisiblesAdornments:(const void *)a3 lineFragment:(const void *)a4 state:(const void *)a5
{
  int v9 = *((unsigned __int8 *)a5 + 91);
  double v10 = (const __CTFont *)*((void *)a3 + 3);
  double v11 = *((double *)a4 + 6);
  double v12 = *((double *)a4 + 4) + *((double *)a4 + 5);
  CGContextSaveGState(self->_context);
  CGContextTranslateCTM(self->_context, v11 + *(double *)(*((void *)a4 + 24) + 8), v12 + (*((double *)a4 + 17) - *((double *)a4 + 16) + *(double *)&qword_26AB70418) * 0.5);
  CGContextSetTextPosition(self->_context, 0.0, 0.0);
  CGContextSetFillColorWithColor(self->_context, *((CGColorRef *)a5 + 9));
  uint64_t v14 = *((void *)a3 + 13);
  uint64_t v13 = *((void *)a3 + 14);
  if (v9)
  {
    if (v13 != v14)
    {
LABEL_3:
      context = self->_context;
      CGAffineTransformMakeScale(&v19, 1.0, -1.0);
      CGContextConcatCTM(context, &v19);
      CTFontDrawGlyphs(v10, *((const CGGlyph **)a3 + 7), *((const CGPoint **)a3 + 13), (v13 - v14) >> 4, self->_context);
    }
  }
  else
  {
    uint64_t v16 = *((void *)a4 + 1);
    if (v16)
    {
      uint64_t v17 = *(void *)a4;
      double v18 = (void *)*((void *)a5 + 6);
      if ([v18 isValid])
      {
        if ([v18 containsCharacterAtIndex:v16 + v17 - 1]
          && v13 != v14
          && *(_DWORD *)a3 == 2)
        {
          goto LABEL_3;
        }
      }
    }
  }
  CGContextRestoreGState(self->_context);
}

- (void)p_drawHiddenDeletionsAdornments:(const void *)a3 lineFragment:(const void *)a4 state:(const void *)a5
{
  double v8 = (const __CTFont *)*((void *)a3 + 3);
  double v9 = *((double *)a4 + 6);
  CGFloat v10 = *((double *)a4 + 4) + *((double *)a4 + 5);
  CGContextSaveGState(self->_context);
  CGContextTranslateCTM(self->_context, v9 + *(double *)(*((void *)a4 + 24) + 8), v10);
  CGContextSetTextPosition(self->_context, 0.0, 0.0);
  CGContextSetFillColorWithColor(self->_context, *((CGColorRef *)a3 + 2));
  uint64_t v11 = *((void *)a3 + 14) - *((void *)a3 + 13);
  if (v11)
  {
    size_t v12 = v11 >> 4;
    context = self->_context;
    CGAffineTransformMakeScale(&v14, 1.0, -1.0);
    CGContextConcatCTM(context, &v14);
    CTFontDrawGlyphs(v8, *((const CGGlyph **)a3 + 7), *((const CGPoint **)a3 + 13), v12, self->_context);
  }
  CGContextRestoreGState(self->_context);
}

- (BOOL)p_canvasSelectionIncludesDrawableOfAttachmentAtCharIndex:(unint64_t)a3 state:(const void *)a4
{
  double v6 = (void *)[*((id *)a4 + 30) infos];
  if (![v6 count]) {
    return 0;
  }
  objc_opt_class();
  double v7 = (void *)TSUDynamicCast();
  if (v7)
  {
    if ([v7 isValid]) {
      return 0;
    }
  }
  double v8 = (void *)[*(id *)a4 attachmentAtCharIndex:a3];
  if (![v8 isDrawable]
    || ![v8 isAnchored]
    || ([v8 isPartitioned] & 1) != 0)
  {
    return 0;
  }
  objc_opt_class();
  uint64_t v10 = [(id)TSUDynamicCast() drawable];

  return [v6 containsObject:v10];
}

- (void)p_drawAttachmentAdornments:(const void *)a3 lineFragment:(const void *)a4 state:(const void *)a5
{
  int v9 = *((unsigned __int8 *)a5 + 91);
  double v10 = *((double *)a4 + 6);
  CGFloat v11 = *((double *)a4 + 4) + *((double *)a4 + 5);
  CGContextSaveGState(self->_context);
  CGContextTranslateCTM(self->_context, v10 + *(double *)(*((void *)a4 + 24) + 8), v11);
  CGContextSetFillColorWithColor(self->_context, *((CGColorRef *)a5 + 9));
  CGContextSetStrokeColorWithColor(self->_context, *((CGColorRef *)a5 + 9));
  size_t v12 = (void *)*((void *)a3 + 16);
  uint64_t v13 = (void *)*((void *)a3 + 17);
  if (v12 != v13)
  {
    CGAffineTransform v14 = (void *)*((void *)a5 + 6);
    do
    {
      if (v9
        || ([v14 containsCharacterAtIndex:*v12],
            [(TSWPRenderer *)self p_canvasSelectionIncludesDrawableOfAttachmentAtCharIndex:*v12 state:a5]))
      {
        -[TSWPRenderer p_drawAttachmentGlyphAtPosition:fragment:](self, "p_drawAttachmentGlyphAtPosition:fragment:", *v12, v12[1], a4);
      }
      v12 += 2;
    }
    while (v12 != v13);
  }
  context = self->_context;

  CGContextRestoreGState(context);
}

- (void)p_drawAdornmentGlyphs:(const void *)a3 lineFragment:(const void *)a4 state:(const void *)a5
{
  int v9 = (CGColor *)*((void *)a3 + 2);
  double v8 = (const __CTFont *)*((void *)a3 + 3);
  double v10 = *((double *)a4 + 6);
  double v11 = *((double *)a4 + 4) + *((double *)a4 + 5);
  double v13 = *((double *)a3 + 22);
  double v12 = *((double *)a3 + 23);
  if (*((unsigned char *)a3 + 192))
  {
    uint64_t v15 = *((void *)a3 + 13);
    uint64_t v14 = *((void *)a3 + 14);
    if (v14 != v15)
    {
      uint64_t v16 = 0;
      unint64_t v17 = (v14 - v15) >> 4;
      double v18 = *((double *)a3 + 19) + *((double *)a3 + 20);
      CGFloat v19 = *((double *)a3 + 21);
      unsigned int v20 = 1;
      char v21 = (CGPoint *)MEMORY[0x263F00148];
      do
      {
        CGContextSaveGState(self->_context);
        CGContextSetFillColorWithColor(self->_context, v9);
        CGContextTranslateCTM(self->_context, *(double *)(*((void *)a3 + 13) + 16 * v16) + v13 + v10 + *(double *)(*((void *)a4 + 24) + 8), v11 + v12 + *(double *)(*((void *)a3 + 13) + 16 * v16 + 8) - v18);
        CGContextSetTextPosition(self->_context, 0.0, 0.0);
        context = self->_context;
        CGAffineTransformMakeScale(&transform, 1.0, -1.0);
        CGContextConcatCTM(context, &transform);
        NSRange v23 = self->_context;
        CGAffineTransformMakeTranslation(&v31, v19, -v18);
        CGContextConcatCTM(v23, &v31);
        CGRect v24 = self->_context;
        CGAffineTransformMakeRotation(&v30, 1.57079633);
        CGContextConcatCTM(v24, &v30);
        CGPoint positions = *v21;
        CTFontDrawGlyphs(v8, (const CGGlyph *)(*((void *)a3 + 7) + 2 * v16), &positions, 1uLL, self->_context);
        CGContextRestoreGState(self->_context);
        uint64_t v16 = v20;
      }
      while (v17 > v20++);
    }
  }
  else
  {
    CGContextSaveGState(self->_context);
    CGContextSetFillColorWithColor(self->_context, v9);
    CGContextTranslateCTM(self->_context, v13 + v10 + *(double *)(*((void *)a4 + 24) + 8), v11 + v12);
    NSUInteger v26 = self->_context;
    CGAffineTransformMakeScale(&v28, 1.0, -1.0);
    CGContextConcatCTM(v26, &v28);
    size_t v27 = (uint64_t)(*((void *)a3 + 14) - *((void *)a3 + 13)) >> 4;
    CGContextSetTextPosition(self->_context, 0.0, 0.0);
    CTFontDrawGlyphs(v8, *((const CGGlyph **)a3 + 7), *((const CGPoint **)a3 + 13), v27, self->_context);
    CGContextRestoreGState(self->_context);
  }
}

- (void)p_drawInvisiblesBreakLine:(const TSWPAdornmentLine *)a3 lineFragment:(const void *)a4 state:(const void *)a5
{
  uint64_t v5 = *((void *)a4 + 1);
  if (v5)
  {
    if (*((unsigned char *)a5 + 91))
    {
      char v10 = 0;
      if (!a3) {
        return;
      }
    }
    else
    {
      uint64_t v11 = *(void *)a4;
      double v12 = (void *)*((void *)a5 + 6);
      if (![v12 isValid]) {
        return;
      }
      char v10 = [v12 containsCharacterAtIndex:v11 + v5 - 1] ^ 1;
      if (!a3) {
        return;
      }
    }
    if ((v10 & 1) == 0)
    {
      CGFloat v13 = *((double *)a4 + 6);
      CGFloat v14 = *((double *)a4 + 4) + *((double *)a4 + 5);
      CGContextSaveGState(self->_context);
      CGContextTranslateCTM(self->_context, v13, v14);
      uint64_t v15 = (long long *)*((void *)a4 + 58);
      if (v15)
      {
        uint64_t v16 = (CGColor *)*((void *)a5 + 9);
        long long v19 = *v15;
        uint64_t v20 = *((void *)v15 + 2);
        CGColorRef color = v16;
        uint64_t v17 = *((void *)v15 + 5);
        uint64_t v22 = *((void *)v15 + 4);
        uint64_t v23 = v17;
        int v24 = *((_DWORD *)v15 + 12);
        uint64_t v25 = *((void *)v15 + 7);
        char v26 = *((unsigned char *)v15 + 64);
        id v27 = (id)*((void *)v15 + 9);
        CGColorRetain(v16);
        id v18 = v27;
        -[TSWPRenderer p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:](self, "p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:", &v19, a5, a4, 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
        CGColorRelease(color);
      }
      CGContextRestoreGState(self->_context);
    }
  }
}

- (void)p_drawListLabelForFragment:(const void *)a3 drawingState:(const void *)a4 lineDrawFlags:(unsigned int)a5
{
  __int16 v5 = a5;
  uint64_t v9 = *(void *)a3;
  uint64_t v10 = *((void *)a3 + 1);
  uint64_t v11 = *((void *)a3 + 22);
  int v12 = [*((id *)a4 + 7) type];
  if (![*((id *)a4 + 7) isValid]
    || ([*((id *)a4 + 7) containsCharacterAtIndex:v9] ? (BOOL v13 = v12 == 2) : (BOOL v13 = 0), v13))
  {
    BOOL v14 = 0;
    if (!v11) {
      return;
    }
  }
  else
  {
    if ([*((id *)a4 + 7) start] != v9) {
      return;
    }
    BOOL v14 = (v12 - 3) < 0xFFFFFFFE;
    if (!v11) {
      return;
    }
  }
  if (!v14
    && (!*((unsigned char *)a4 + 93)
     || (v5 & 0x100) != 0
     || v10 != 1
     || (IsParagraphBreakingCharacter([*(id *)a4 characterAtIndex:v9]) & 1) == 0))
  {
    CGContextSaveGState(self->_context);
    if (!*((unsigned char *)a4 + 89))
    {
      id v18 = *(void **)(v11 + 32);
      if (v18)
      {
        if ([*(id *)(v11 + 32) isEnabled]) {
          [v18 applyToContext:self->_context viewScale:self->_flipShadows flipped:self->_viewScale];
        }
      }
    }
    uint64_t v15 = *(void *)(v11 + 16);
    if (v15)
    {
      double v16 = TSWPLineFragment::labelTextPosition((TSWPLineFragment *)a3);
      CGContextTranslateCTM(self->_context, v16, v17);
      CGContextSetTextPosition(self->_context, 0.0, 0.0);
      LOBYTE(v27) = 0;
      -[TSWPRenderer p_drawTextInRunsForLine:fragment:state:tateChuYoko:baseRange:isFirstLineRef:](self, "p_drawTextInRunsForLine:fragment:state:tateChuYoko:baseRange:isFirstLineRef:", v15, a3, a4, *(unsigned __int8 *)(v11 + 81), v9, 0, v27);
    }
    else
    {
      long long v19 = *(void **)(v11 + 24);
      if (v19)
      {
        TSWPLineFragment::labelRect((TSWPLineFragment *)a3);
        double v21 = v20;
        CGFloat v23 = v22;
        CGContextTranslateCTM(self->_context, v24, v25);
        if ((*((unsigned char *)a3 + 25) & 0x20) != 0)
        {
          CGContextTranslateCTM(self->_context, 0.0, v23);
          CGContextRotateCTM(self->_context, -1.57079633);
        }
        objc_msgSend(v19, "drawImageInContext:rect:", self->_context, 0.0, 0.0, v21, v23);
      }
    }
    context = self->_context;
    CGContextRestoreGState(context);
  }
}

- (BOOL)flipShadows
{
  return self->_flipShadows;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (TSDBezierPath)interiorClippingPath
{
  return self->_interiorClippingPath;
}

- (void)setInteriorClippingPath:(id)a3
{
}

@end
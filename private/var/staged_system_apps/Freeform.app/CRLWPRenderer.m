@interface CRLWPRenderer
+ (id)correctionAndDictationMarkColor;
+ (id)grammarMarkColor;
+ (id)spellingMarkColor;
+ (void)initialize;
- (BOOL)flipShadows;
- (BOOL)p_canvasSelectionIncludesDrawableOfAttachmentAtCharIndex:(unint64_t)a3 state:(const CRLWPDrawingState *)a4;
- (BOOL)shouldClipFragment:(const void *)a3 drawingState:(const CRLWPDrawingState *)a4 lineDrawFlags:(unint64_t)a5 updateRect:(CGRect)a6 outClipRect:(CGRect *)a7;
- (CGContext)context;
- (CGRect)getClipBoundingBox;
- (CGSize)convertSizeToDeviceSpace:(CGSize)a3;
- (CRLBezierPath)interiorClippingPath;
- (CRLWPRenderer)initWithContext:(CGContext *)a3;
- (double)viewScale;
- (void)dealloc;
- (void)didRenderFragments;
- (void)drawAdornmentRects:(id)a3 forColumn:(id)a4 foreground:(BOOL)a5 drawingState:(const CRLWPDrawingState *)a6;
- (void)drawAdornmentsForFragment:(const void *)a3 updateRect:(CGRect)a4 drawingState:(const CRLWPDrawingState *)a5 runState:(id *)a6 lineDrawFlags:(unint64_t)a7;
- (void)drawCharacterFillAdornmentRects:(id)a3 forColumn:(id)a4 excludeRange:(_NSRange)a5 drawingState:(const CRLWPDrawingState *)a6;
- (void)drawCharacterStrokeAdornmentRects:(id)a3 forColumn:(id)a4 excludeRange:(_NSRange)a5 drawingState:(const CRLWPDrawingState *)a6;
- (void)drawFragment:(const void *)a3 updateRect:(CGRect)a4 drawingState:(const CRLWPDrawingState *)a5 runState:(id *)a6 lineDrawFlags:(unint64_t)a7;
- (void)p_calculateMarkAdornments:(id)a3 drawingState:(const CRLWPDrawingState *)a4 lineFragment:(const void *)a5;
- (void)p_clipToInteriorClippingPath;
- (void)p_drawAdornmentGlyphs:(id)a3 lineFragment:(const void *)a4 state:(const CRLWPDrawingState *)a5;
- (void)p_drawAdornmentLine:(id)a3 drawingState:(const CRLWPDrawingState *)a4 lineFragment:(const void *)a5 lineFragmentStart:(CGPoint)a6 vertical:(BOOL)a7;
- (void)p_drawAdornmentLineBackgroundRect:(id)a3 lineDrawFlags:(unint64_t)a4 drawingState:(const CRLWPDrawingState *)a5 bounds:(CGRect)a6;
- (void)p_drawAdornments:(id)a3 lineFragment:(const void *)a4 state:(const CRLWPDrawingState *)a5;
- (void)p_drawAttachmentAdornments:(id)a3 lineFragment:(const void *)a4 state:(const CRLWPDrawingState *)a5;
- (void)p_drawAttachmentGlyphAtPosition:(id)a3 fragment:(const void *)a4;
- (void)p_drawAutocorrectionMarkingsFragment:(const void *)a3 drawingState:(const CRLWPDrawingState *)a4;
- (void)p_drawDictationMarkingsFragment:(const void *)a3 drawingState:(const CRLWPDrawingState *)a4;
- (void)p_drawHiddenDeletionsAdornments:(id)a3 lineFragment:(const void *)a4 state:(const CRLWPDrawingState *)a5;
- (void)p_drawInvisiblesAdornments:(id)a3 lineFragment:(const void *)a4 state:(const CRLWPDrawingState *)a5;
- (void)p_drawInvisiblesBreakLine:(id)a3 lineFragment:(const void *)a4 state:(const CRLWPDrawingState *)a5;
- (void)p_drawListLabelForFragment:(const void *)a3 drawingState:(const CRLWPDrawingState *)a4 lineDrawFlags:(unint64_t)a5;
- (void)p_drawMisspelledWordMarkingsFragment:(const void *)a3 drawingState:(const CRLWPDrawingState *)a4;
- (void)p_drawRun:(const __CTRun *)a3 range:(id)a4 attributes:(id)a5 canvasIsInteractive:(BOOL)a6;
- (void)p_drawTextInRunsForLine:(CRLWPLineRef *)a3 fragment:(const void *)a4 state:(const CRLWPDrawingState *)a5 listLabel:(BOOL)a6 tateChuYoko:(BOOL)a7 ruby:(BOOL)a8 baseRange:(_NSRange)a9 isFirstLineRef:(BOOL)a10;
- (void)p_drawUngrammaticMarkingsFragment:(const void *)a3 drawingState:(const CRLWPDrawingState *)a4;
- (void)p_drawWordMarkingsForFragment:(const void *)a3 color:(id)a4 ranges:(id)a5 suppressRange:(_NSRange)a6 drawingState:(const CRLWPDrawingState *)a7;
- (void)p_setCTMAndTextPositionForFragment:(const void *)a3 state:(const CRLWPDrawingState *)a4;
- (void)p_strokeLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 width:(double)a5;
- (void)p_strokeWavyLineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 width:(double)a5;
- (void)setFlipShadows:(BOOL)a3;
- (void)setInteriorClippingPath:(id)a3;
- (void)setViewScale:(double)a3;
- (void)willRenderFragmentsWithDrawingState:(const CRLWPDrawingState *)a3;
@end

@implementation CRLWPRenderer

- (CRLWPRenderer)initWithContext:(CGContext *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLWPRenderer;
  v4 = [(CRLWPRenderer *)&v6 init];
  if (v4) {
    v4->_context = CGContextRetain(a3);
  }
  return v4;
}

- (void)dealloc
{
  CGContextRelease(self->_context);
  v3.receiver = self;
  v3.super_class = (Class)CRLWPRenderer;
  [(CRLWPRenderer *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = +[CRLColor colorWithRed:1.0 green:0.227 blue:0.188 alpha:1.0];
    objc_super v3 = (void *)qword_1016A8DE0;
    qword_1016A8DE0 = v2;

    uint64_t v4 = +[CRLColor colorWithRed:0.35 green:0.766 blue:0.405 alpha:1.0];
    v5 = (void *)qword_1016A8DE8;
    qword_1016A8DE8 = v4;

    uint64_t v6 = +[CRLColor colorWithRed:0.0 green:0.478 blue:1.0 alpha:1.0];
    v7 = (void *)qword_1016A8DF0;
    qword_1016A8DF0 = v6;
  }
}

+ (id)spellingMarkColor
{
  return (id)qword_1016A8DE0;
}

+ (id)grammarMarkColor
{
  return (id)qword_1016A8DE8;
}

+ (id)correctionAndDictationMarkColor
{
  return (id)qword_1016A8DF0;
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

- (void)willRenderFragmentsWithDrawingState:(const CRLWPDrawingState *)a3
{
  CGContextSaveGState(self->_context);
  context = self->_context;
  id var1 = a3->var1;
  if (var1) {
    [var1 transformFromWP];
  }
  else {
    memset(&transform, 0, sizeof(transform));
  }
  CGContextConcatCTM(context, &transform);
  v7 = self->_context;
  long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v9.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v9.c = v8;
  *(_OWORD *)&v9.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGContextSetTextMatrix(v7, &v9);
}

- (void)didRenderFragments
{
}

- (void)drawFragment:(const void *)a3 updateRect:(CGRect)a4 drawingState:(const CRLWPDrawingState *)a5 runState:(id *)a6 lineDrawFlags:(unint64_t)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if ((a7 & 2) != 0)
  {
    v16 = sub_100457AE4((uint64_t)self->_context);
    v15 = v16;
    if (*((uint64_t *)a3 + 3) < 0) {
      v17 = &xmmword_101176F48;
    }
    else {
      v17 = (long long *)a3;
    }
    unsigned __int8 v61 = [v16 needsSeparateRunsForLineFragmentWithRange:*(void *)v17, *((void *)v17 + 1)];
  }
  else
  {
    v15 = 0;
    unsigned __int8 v61 = 0;
  }
  v63 = v15;
  if (!a5->var0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CC2A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101067B80();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CC2C0);
    }
    v18 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer drawFragment:updateRect:drawingState:runState:lineDrawFlags:]");
    v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v19 file:v20 lineNumber:186 isFatal:0 description:"storage is nil"];

    v15 = v63;
  }
  int v21 = *((_DWORD *)a3 + 6);
  v80.origin.double x = x;
  v80.origin.double y = y;
  v80.size.double width = width;
  v80.size.double height = height;
  CGRect v79 = CGRectIntersection(*(CGRect *)((char *)a3 + 72), v80);
  if (CGRectIsEmpty(v79))
  {
    if ((a7 & 2) != 0)
    {
      if (*((uint64_t *)a3 + 3) < 0) {
        v22 = &xmmword_101176F48;
      }
      else {
        v22 = (long long *)a3;
      }
      [v15 beginLineFragmentWithRange:*(void *)v22, *((void *)v22 + 1)];
      if (*((uint64_t *)a3 + 3) < 0) {
        v23 = &xmmword_101176F48;
      }
      else {
        v23 = (long long *)a3;
      }
      [v15 beginLineFragmentBodyWithRange:*(void *)v23, *((void *)v23 + 1)];
      if (*((uint64_t *)a3 + 3) < 0) {
        v24 = &xmmword_101176F48;
      }
      else {
        v24 = (long long *)a3;
      }
      [v15 endLineFragmentBodyWithRange:*(void *)v24, *((void *)v24 + 1)];
      if (*((uint64_t *)a3 + 3) < 0) {
        v25 = &xmmword_101176F48;
      }
      else {
        v25 = (long long *)a3;
      }
      [v15 endLineFragmentWithRange:*(void *)v25, *((void *)v25 + 1)];
    }
  }
  else
  {
    __int16 v60 = v21;
    CGSize size = CGRectZero.size;
    v75.origin = CGRectZero.origin;
    v75.CGSize size = size;
    unsigned int v27 = -[CRLWPRenderer shouldClipFragment:drawingState:lineDrawFlags:updateRect:outClipRect:](self, "shouldClipFragment:drawingState:lineDrawFlags:updateRect:outClipRect:", a3, a5, a7, &v75, x, y, width, height);
    if (v27)
    {
      CGContextSaveGState(self->_context);
      CGContextClipToRect(self->_context, v75);
    }
    double v28 = *((double *)a3 + 6);
    double v29 = *((double *)a3 + 7);
    double v30 = *((double *)a3 + 8);
    double v32 = *((double *)a3 + 4);
    double v31 = *((double *)a3 + 5);
    if (a7)
    {
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      v33 = sub_100152D08((uint64_t)a3);
      id v34 = [v33 countByEnumeratingWithState:&v71 objects:v77 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v72;
        do
        {
          for (i = 0; i != v34; i = (char *)i + 1)
          {
            if (*(void *)v72 != v35) {
              objc_enumerationMutation(v33);
            }
            -[CRLWPRenderer p_drawAdornmentLineBackgroundRect:lineDrawFlags:drawingState:bounds:](self, "p_drawAdornmentLineBackgroundRect:lineDrawFlags:drawingState:bounds:", *(void *)(*((void *)&v71 + 1) + 8 * i), a7, a5, v31, v28, v29, v30);
          }
          id v34 = [v33 countByEnumeratingWithState:&v71 objects:v77 count:16];
        }
        while (v34);
      }
    }
    if ((a7 & 0x3000) != 0)
    {
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      v37 = sub_100152D10((uint64_t)a3);
      unsigned int v38 = v27;
      id v39 = [v37 countByEnumeratingWithState:&v67 objects:v76 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v68;
        do
        {
          for (j = 0; j != v39; j = (char *)j + 1)
          {
            if (*(void *)v68 != v40) {
              objc_enumerationMutation(v37);
            }
            v42 = *(void **)(*((void *)&v67 + 1) + 8 * (void)j);
            if ([v42 shouldRenderForLineDrawFlags:a7])
            {
              double v43 = v28;
              double v44 = v30;
              if ((*((unsigned char *)a3 + 28) & 1) == 0)
              {
                double v45 = *((double *)a3 + 15);
                double v44 = v45 + *((double *)a3 + 17);
                double v43 = v32 - v45;
              }
              -[CRLWPRenderer p_drawAdornmentLineBackgroundRect:lineDrawFlags:drawingState:bounds:](self, "p_drawAdornmentLineBackgroundRect:lineDrawFlags:drawingState:bounds:", v42, a7, a5, v31, v43, v29, v44);
            }
          }
          id v39 = [v37 countByEnumeratingWithState:&v67 objects:v76 count:16];
        }
        while (v39);
      }

      unsigned int v27 = v38;
    }
    if (*((uint64_t *)a3 + 3) < 0) {
      v46 = (NSUInteger *)&xmmword_101176F48;
    }
    else {
      v46 = (NSUInteger *)a3;
    }
    NSUInteger v48 = *v46;
    NSUInteger v47 = v46[1];
    v49 = objc_opt_new();
    if ((a7 & 0x400) != 0)
    {
      v78.location = v48;
      v78.length = v47;
      if (NSIntersectionRange(v78, (NSRange)a5[192]).length) {
        [(CRLWPRenderer *)self p_calculateMarkAdornments:v49 drawingState:a5 lineFragment:a3];
      }
    }
    if ((a7 & 2) != 0)
    {
      if (*((uint64_t *)a3 + 3) < 0) {
        v50 = &xmmword_101176F48;
      }
      else {
        v50 = (long long *)a3;
      }
      [v63 beginLineFragmentWithRange:*(void *)v50, *((void *)v50 + 1)];
      a6->var2 = v32;
      if ((a7 & 8) != 0) {
        [(CRLWPRenderer *)self p_drawMisspelledWordMarkingsFragment:a3 drawingState:a5];
      }
      if ((a7 & 0x10) != 0) {
        [(CRLWPRenderer *)self p_drawUngrammaticMarkingsFragment:a3 drawingState:a5];
      }
      if ((a7 & 0x200) != 0) {
        [(CRLWPRenderer *)self p_drawDictationMarkingsFragment:a3 drawingState:a5];
      }
      if ((a7 & 0x800) != 0) {
        [(CRLWPRenderer *)self p_drawAutocorrectionMarkingsFragment:a3 drawingState:a5];
      }
      v51 = sub_100152CD8((uint64_t)a3);
      BOOL v52 = v51 == 0;

      if (!v52) {
        [(CRLWPRenderer *)self p_drawListLabelForFragment:a3 drawingState:a5 lineDrawFlags:a7];
      }
      if (*((uint64_t *)a3 + 3) < 0) {
        v53 = &xmmword_101176F48;
      }
      else {
        v53 = (long long *)a3;
      }
      [v63 beginLineFragmentBodyWithRange:*(void *)v53, *((void *)v53 + 1)];
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_100024DFC;
      v64[3] = &unk_1014CC2E8;
      *(double *)&v64[6] = v32;
      v64[4] = self;
      v64[5] = a3;
      v64[7] = a5;
      BOOL v65 = (v60 & 0x2000) != 0;
      unsigned __int8 v66 = v61;
      v54 = objc_retainBlock(v64);
      if (((!a5->var4 || !a5->var23.length)
         && (uint64_t v55 = sub_100152BF4((uint64_t)a3),
             ((void (*)(void *, uint64_t, void, void))v54[2])(v54, v55, 0, 0),
             !a5->var4)
         || a5->var23.length)
        && (uint64_t v56 = sub_100152BFC((uint64_t)a3),
            ((void (*)(void *, uint64_t, void, uint64_t))v54[2])(v54, v56, 0, 1),
            !a5->var4)
        || !a5->var23.length)
      {
        uint64_t v57 = sub_100152C7C((uint64_t)a3);
        ((void (*)(void *, uint64_t, uint64_t, void))v54[2])(v54, v57, 1, 0);
      }
      if (*((uint64_t *)a3 + 3) < 0) {
        v58 = &xmmword_101176F48;
      }
      else {
        v58 = (long long *)a3;
      }
      [v63 endLineFragmentBodyWithRange:*(void *)v58, *((void *)v58 + 1)];
      if (*((uint64_t *)a3 + 3) < 0) {
        v59 = &xmmword_101176F48;
      }
      else {
        v59 = (long long *)a3;
      }
      [v63 endLineFragmentWithRange:*(void *)v59, *((void *)v59 + 1)];
    }
    if (v27) {
      CGContextRestoreGState(self->_context);
    }

    v15 = v63;
  }
}

- (void)drawAdornmentsForFragment:(const void *)a3 updateRect:(CGRect)a4 drawingState:(const CRLWPDrawingState *)a5 runState:(id *)a6 lineDrawFlags:(unint64_t)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (!a5->var0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CC308);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101067C08();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CC328);
    }
    v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer drawAdornmentsForFragment:updateRect:drawingState:runState:lineDrawFlags:]");
    v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:522 isFatal:0 description:"storage is nil"];
  }
  unint64_t v19 = *((void *)a3 + 3);
  v70.origin.double x = x;
  v70.origin.double y = y;
  v70.size.double width = width;
  v70.size.double height = height;
  CGRect v69 = CGRectIntersection(*(CGRect *)((char *)a3 + 72), v70);
  if (!CGRectIsEmpty(v69))
  {
    CGSize size = CGRectZero.size;
    v63.origin = CGRectZero.origin;
    v63.CGSize size = size;
    unsigned int v21 = -[CRLWPRenderer shouldClipFragment:drawingState:lineDrawFlags:updateRect:outClipRect:](self, "shouldClipFragment:drawingState:lineDrawFlags:updateRect:outClipRect:", a3, a5, a7, &v63, x, y, width, height);
    if (v21)
    {
      CGContextSaveGState(self->_context);
      CGContextClipToRect(self->_context, v63);
    }
    double v22 = *((double *)a3 + 4);
    double v23 = *((double *)a3 + 5);
    if (*((uint64_t *)a3 + 3) < 0) {
      v24 = (NSUInteger *)&xmmword_101176F48;
    }
    else {
      v24 = (NSUInteger *)a3;
    }
    NSUInteger v26 = *v24;
    NSUInteger v25 = v24[1];
    v46 = objc_opt_new();
    if ((a7 & 0x400) != 0)
    {
      v68.location = v26;
      v68.length = v25;
      if (NSIntersectionRange(v68, (NSRange)a5[192]).length) {
        [(CRLWPRenderer *)self p_calculateMarkAdornments:v46 drawingState:a5 lineFragment:a3];
      }
    }
    if ((a7 & 2) != 0)
    {
      a6->var2 = v22;
      if (!a5->var4 || !a5->var23.length)
      {
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        unsigned int v27 = sub_100152CF8((uint64_t)a3);
        id v28 = [v27 countByEnumeratingWithState:&v59 objects:v67 count:16];
        uint64_t v29 = (v19 >> 13) & 1;
        if (v28)
        {
          uint64_t v30 = *(void *)v60;
          do
          {
            for (i = 0; i != v28; i = (char *)i + 1)
            {
              if (*(void *)v60 != v30) {
                objc_enumerationMutation(v27);
              }
              -[CRLWPRenderer p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:](self, "p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:", *(void *)(*((void *)&v59 + 1) + 8 * i), a5, a3, v29, v23, v22);
            }
            id v28 = [v27 countByEnumeratingWithState:&v59 objects:v67 count:16];
          }
          while (v28);
        }

        if ((a7 & 0x400) != 0)
        {
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id v32 = v46;
          id v33 = [v32 countByEnumeratingWithState:&v55 objects:v66 count:16];
          if (v33)
          {
            uint64_t v34 = *(void *)v56;
            do
            {
              for (j = 0; j != v33; j = (char *)j + 1)
              {
                if (*(void *)v56 != v34) {
                  objc_enumerationMutation(v32);
                }
                id v36 = *(id *)(*((void *)&v55 + 1) + 8 * (void)j);
                -[CRLWPRenderer p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:](self, "p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:", v36, a5, a3, v29, v23, v22);
              }
              id v33 = [v32 countByEnumeratingWithState:&v55 objects:v66 count:16];
            }
            while (v33);
          }
        }
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        v37 = sub_100152D00((uint64_t)a3);
        id v38 = [v37 countByEnumeratingWithState:&v51 objects:v65 count:16];
        if (v38)
        {
          uint64_t v39 = *(void *)v52;
          do
          {
            for (k = 0; k != v38; k = (char *)k + 1)
            {
              if (*(void *)v52 != v39) {
                objc_enumerationMutation(v37);
              }
              -[CRLWPRenderer p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:](self, "p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:", *(void *)(*((void *)&v51 + 1) + 8 * (void)k), a5, a3, v29, v23, v22);
            }
            id v38 = [v37 countByEnumeratingWithState:&v51 objects:v65 count:16];
          }
          while (v38);
        }

        CGContextSetTextDrawingMode(self->_context, kCGTextFill);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        v41 = sub_100152D18((uint64_t)a3);
        id v42 = [v41 countByEnumeratingWithState:&v47 objects:v64 count:16];
        if (v42)
        {
          uint64_t v43 = *(void *)v48;
          do
          {
            for (m = 0; m != v42; m = (char *)m + 1)
            {
              if (*(void *)v48 != v43) {
                objc_enumerationMutation(v41);
              }
              [(CRLWPRenderer *)self p_drawAdornments:*(void *)(*((void *)&v47 + 1) + 8 * (void)m) lineFragment:a3 state:a5];
            }
            id v42 = [v41 countByEnumeratingWithState:&v47 objects:v64 count:16];
          }
          while (v42);
        }

        double v45 = sub_100152D2C((uint64_t)a3);
        if (v45) {
          [(CRLWPRenderer *)self p_drawInvisiblesBreakLine:v45 lineFragment:a3 state:a5];
        }
      }
    }
    if (v21) {
      CGContextRestoreGState(self->_context);
    }
  }
}

- (void)p_clipToInteriorClippingPath
{
  id v3 = [(CRLWPRenderer *)self interiorClippingPath];
  if (v3 && ([v3 isEmpty] & 1) == 0)
  {
    CGContextAddPath(self->_context, (CGPathRef)[v3 CGPath]);
    CGContextClip(self->_context);
  }
}

- (void)drawCharacterFillAdornmentRects:(id)a3 forColumn:(id)a4 excludeRange:(_NSRange)a5 drawingState:(const CRLWPDrawingState *)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v10 = a3;
  id v54 = a4;
  long long v53 = v10;
  if ([v10 count])
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = v10;
    id v11 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v63;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v63 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v62 + 1) + 8 * (void)v13);
          [v14 rect];
          CGFloat x = v15;
          CGFloat y = v17;
          CGFloat width = v19;
          CGFloat height = v21;
          if ([v14 type] == 4)
          {
            double v23 = [v14 fill];
            BOOL v24 = v23 == 0;

            if (v24)
            {
              unsigned int v25 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014CC348);
              }
              NSUInteger v26 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf.a) = 67110146;
                HIDWORD(buf.a) = v25;
                LOWORD(buf.b) = 2082;
                *(void *)((char *)&buf.b + 2) = "-[CRLWPRenderer drawCharacterFillAdornmentRects:forColumn:excludeRange:drawingState:]";
                WORD1(buf.c) = 2082;
                *(void *)((char *)&buf.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm";
                WORD2(buf.d) = 1024;
                *(_DWORD *)((char *)&buf.d + 6) = 625;
                WORD1(buf.tx) = 2082;
                *(void *)((char *)&buf.tx + 4) = "adornment.fill";
                _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", (uint8_t *)&buf, 0x2Cu);
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014CC368);
              }
              unsigned int v27 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
              {
                long long v50 = +[CRLAssertionHandler packedBacktraceString];
                LODWORD(buf.a) = 67109378;
                HIDWORD(buf.a) = v25;
                LOWORD(buf.b) = 2114;
                *(void *)((char *)&buf.b + 2) = v50;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v27, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&buf, 0x12u);
              }
              id v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer drawCharacterFillAdornmentRects:forColumn:excludeRange:drawingState:]");
              uint64_t v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"];
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 625, 0, "invalid nil value for '%{public}s'", "adornment.fill");
            }
            uint64_t v30 = [v14 path];
            BOOL v31 = v30 == 0;

            if (v31)
            {
              unsigned int v32 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014CC388);
              }
              id v33 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf.a) = 67110146;
                HIDWORD(buf.a) = v32;
                LOWORD(buf.b) = 2082;
                *(void *)((char *)&buf.b + 2) = "-[CRLWPRenderer drawCharacterFillAdornmentRects:forColumn:excludeRange:drawingState:]";
                WORD1(buf.c) = 2082;
                *(void *)((char *)&buf.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm";
                WORD2(buf.d) = 1024;
                *(_DWORD *)((char *)&buf.d + 6) = 626;
                WORD1(buf.tx) = 2082;
                *(void *)((char *)&buf.tx + 4) = "adornment.path";
                _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", (uint8_t *)&buf, 0x2Cu);
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014CC3A8);
              }
              uint64_t v34 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
              {
                long long v51 = +[CRLAssertionHandler packedBacktraceString];
                LODWORD(buf.a) = 67109378;
                HIDWORD(buf.a) = v32;
                LOWORD(buf.b) = 2114;
                *(void *)((char *)&buf.b + 2) = v51;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v34, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&buf, 0x12u);
              }
              uint64_t v35 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer drawCharacterFillAdornmentRects:forColumn:excludeRange:drawingState:]");
              id v36 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"];
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v35, v36, 626, 0, "invalid nil value for '%{public}s'", "adornment.path");
            }
            if (a6->var4 || location != 0x7FFFFFFFFFFFFFFFLL || length)
            {
              uint64_t v37 = [v14 pathFromExcludeRange:location limitSelection:length];
            }
            else
            {
              uint64_t v37 = [v14 path];
            }
            id v38 = (void *)v37;
            if (v37)
            {
              CGContextSaveGState(self->_context);
              if ([v54 textIsVertical])
              {
                double v39 = sub_100065738(x, y, width, height);
                double v41 = v40;
                memset(&buf, 0, sizeof(buf));
                CGAffineTransformMakeRotation(&v61, -1.57079633);
                double v42 = sub_1000646A4(v39, v41, -1.0);
                sub_10007FCC0(&v61, &buf, v42, v43);
                context = self->_context;
                CGAffineTransform transform = buf;
                CGContextConcatCTM(context, &transform);
                CGAffineTransform v58 = buf;
                CGAffineTransformInvert(&v59, &v58);
                [v38 transformUsingAffineTransform:&v59];
                CGAffineTransform v57 = buf;
                v68.origin.CGFloat x = x;
                v68.origin.CGFloat y = y;
                v68.size.CGFloat width = width;
                v68.size.CGFloat height = height;
                CGRect v69 = CGRectApplyAffineTransform(v68, &v57);
                CGFloat x = v69.origin.x;
                CGFloat y = v69.origin.y;
                CGFloat width = v69.size.width;
                CGFloat height = v69.size.height;
              }
              double v45 = [v14 shadow];
              BOOL v46 = v45 == 0;

              if (!v46)
              {
                long long v47 = [v14 shadow];
                [v47 applyToContext:self->_context viewScale:self->_flipShadows flipped:self->_viewScale];

                CGContextBeginTransparencyLayer(self->_context, 0);
              }
              uint64_t v48 = [v14 fill];
              [v48 paintPath:[v38 CGPath] naturalBounds:self->_context isPDF:0 x:x y:y width:width height:height];

              long long v49 = [v14 shadow];
              LOBYTE(v48) = v49 == 0;

              if ((v48 & 1) == 0) {
                CGContextEndTransparencyLayer(self->_context);
              }
              CGContextRestoreGState(self->_context);
            }
          }
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v52 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
        id v11 = v52;
      }
      while (v52);
    }
  }
}

- (void)drawCharacterStrokeAdornmentRects:(id)a3 forColumn:(id)a4 excludeRange:(_NSRange)a5 drawingState:(const CRLWPDrawingState *)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v38 = a3;
  if ([v38 count])
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v38;
    id v8 = [obj countByEnumeratingWithState:&v42 objects:v56 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v43;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v43 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v10);
          if ([v11 type] == 5)
          {
            uint64_t v12 = [v11 stroke];
            BOOL v13 = v12 == 0;

            if (v13)
            {
              unsigned int v14 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014CC3C8);
              }
              double v15 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)CGAffineTransform buf = 67110146;
                unsigned int v47 = v14;
                __int16 v48 = 2082;
                long long v49 = "-[CRLWPRenderer drawCharacterStrokeAdornmentRects:forColumn:excludeRange:drawingState:]";
                __int16 v50 = 2082;
                long long v51 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm";
                __int16 v52 = 1024;
                int v53 = 676;
                __int16 v54 = 2082;
                long long v55 = "adornment.stroke";
                _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014CC3E8);
              }
              v16 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
              {
                uint64_t v35 = +[CRLAssertionHandler packedBacktraceString];
                *(_DWORD *)CGAffineTransform buf = 67109378;
                unsigned int v47 = v14;
                __int16 v48 = 2114;
                long long v49 = v35;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
              }
              double v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer drawCharacterStrokeAdornmentRects:forColumn:excludeRange:drawingState:]");
              v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"];
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 676, 0, "invalid nil value for '%{public}s'", "adornment.stroke");
            }
            double v19 = [v11 path];
            BOOL v20 = v19 == 0;

            if (v20)
            {
              unsigned int v21 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014CC408);
              }
              double v22 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)CGAffineTransform buf = 67110146;
                unsigned int v47 = v21;
                __int16 v48 = 2082;
                long long v49 = "-[CRLWPRenderer drawCharacterStrokeAdornmentRects:forColumn:excludeRange:drawingState:]";
                __int16 v50 = 2082;
                long long v51 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm";
                __int16 v52 = 1024;
                int v53 = 677;
                __int16 v54 = 2082;
                long long v55 = "adornment.path";
                _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014CC428);
              }
              double v23 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
              {
                id v36 = +[CRLAssertionHandler packedBacktraceString];
                *(_DWORD *)CGAffineTransform buf = 67109378;
                unsigned int v47 = v21;
                __int16 v48 = 2114;
                long long v49 = v36;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
              }
              BOOL v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer drawCharacterStrokeAdornmentRects:forColumn:excludeRange:drawingState:]");
              unsigned int v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"];
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 677, 0, "invalid nil value for '%{public}s'", "adornment.path");
            }
            if (a6->var4 || location != 0x7FFFFFFFFFFFFFFFLL || length)
            {
              uint64_t v26 = [v11 pathFromExcludeRange:location limitSelection:length];
            }
            else
            {
              uint64_t v26 = [v11 path];
            }
            unsigned int v27 = (void *)v26;
            if (v26)
            {
              CGContextSaveGState(self->_context);
              id v28 = [v11 shadow];
              BOOL v29 = v28 == 0;

              if (!v29)
              {
                uint64_t v30 = [v11 shadow];
                [v30 applyToContext:self->_context viewScale:self->_flipShadows flipped:self->_viewScale];

                CGContextBeginTransparencyLayer(self->_context, 0);
              }
              char v31 = sub_1004590FC((uint64_t)self->_context);
              sub_100458FD4((uint64_t)self->_context, 1);
              unsigned int v32 = [v11 stroke];
              [v32 paintPath:[v27 CGPath] inContext:self->_context];

              sub_100458FD4((uint64_t)self->_context, v31);
              id v33 = [v11 shadow];
              BOOL v34 = v33 == 0;

              if (!v34) {
                CGContextEndTransparencyLayer(self->_context);
              }
              CGContextRestoreGState(self->_context);
            }
          }
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v37 = [obj countByEnumeratingWithState:&v42 objects:v56 count:16];
        id v8 = v37;
      }
      while (v37);
    }
  }
}

- (void)drawAdornmentRects:(id)a3 forColumn:(id)a4 foreground:(BOOL)a5 drawingState:(const CRLWPDrawingState *)a6
{
  BOOL v7 = a5;
  id v57 = a3;
  if ([v57 count])
  {
    CGContextSaveGState(self->_context);
    [(CRLWPRenderer *)self p_clipToInteriorClippingPath];
    CGAffineTransform v58 = objc_opt_new();
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v9 = v57;
    id v10 = [v9 countByEnumeratingWithState:&v63 objects:v78 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v64;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v64 != v11) {
            objc_enumerationMutation(v9);
          }
          BOOL v13 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          [v13 rect];
          double v15 = v14;
          double v17 = v16;
          double v19 = v18;
          double v21 = v20;
          if (!a6->var4 && !v7)
          {
            double v22 = [v13 fill];
            if (v22)
            {
              BOOL v23 = [v13 type] == 1;

              if (v23)
              {
                BOOL v24 = [v13 fill];
                [v24 paintRect:self->_context inContext:v15, v17, v19, v21];
              }
            }
          }
          if (!a6->var4 && v7)
          {
            unsigned int v25 = [v13 stroke];
            if (v25)
            {
              BOOL v26 = [v13 type] == 2;

              if (v26)
              {
                CGContextSetShouldAntialias(self->_context, 1);
                if (v21 == 0.0)
                {
                  Mutable = CGPathCreateMutable();
                  CGPathMoveToPoint(Mutable, 0, v15, v17);
                  v79.origin.CGFloat x = v15;
                  v79.origin.CGFloat y = v17;
                  v79.size.CGFloat width = v19;
                  v79.size.CGFloat height = v21;
                  CGFloat MaxX = CGRectGetMaxX(v79);
                  CGPathAddLineToPoint(Mutable, 0, MaxX, v17);
                  BOOL v29 = [v13 stroke];
                  [v29 paintPath:Mutable inContext:self->_context];

                  CGPathRelease(Mutable);
                }
                else
                {
                  uint64_t v30 = [v13 stroke];
                  [v30 paintRect:self->_context inContext:v15, v17, v19, v21];
                }
              }
            }
          }
          if (v7)
          {
            char v31 = [v13 fill];
            if (v31)
            {
              BOOL v32 = [v13 type] == 3;

              if (v32) {
                [v58 addObject:v13];
              }
            }
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v63 objects:v78 count:16];
      }
      while (v10);
    }

    CGContextRestoreGState(self->_context);
    if ([v58 count])
    {
      CGContextSaveGState(self->_context);
      CGContextSetShouldAntialias(self->_context, 1);
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v33 = v58;
      id v34 = [v33 countByEnumeratingWithState:&v59 objects:v77 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v60;
        do
        {
          id v36 = 0;
          do
          {
            if (*(void *)v60 != v35) {
              objc_enumerationMutation(v33);
            }
            id v37 = *(void **)(*((void *)&v59 + 1) + 8 * (void)v36);
            [v37 rect];
            CGFloat x = v80.origin.x;
            CGFloat y = v80.origin.y;
            CGFloat width = v80.size.width;
            CGFloat height = v80.size.height;
            double MinX = CGRectGetMinX(v80);
            double v43 = sub_1000674C4(MinX, self->_viewScale);
            v81.origin.CGFloat x = x;
            v81.origin.CGFloat y = y;
            v81.size.CGFloat width = width;
            v81.size.CGFloat height = height;
            double v44 = CGRectGetWidth(v81);
            double v45 = sub_1000674C4(v44, self->_viewScale);
            v82.origin.CGFloat x = x;
            v82.origin.CGFloat y = y;
            v82.size.CGFloat width = width;
            v82.size.CGFloat height = height;
            CGFloat MinY = CGRectGetMinY(v82);
            v83.origin.CGFloat x = x;
            v83.origin.CGFloat y = y;
            v83.size.CGFloat width = width;
            v83.size.CGFloat height = height;
            CGFloat v47 = CGRectGetHeight(v83);
            uint64_t v48 = objc_opt_class();
            long long v49 = [v37 fill];
            __int16 v50 = sub_1002469D0(v48, v49);

            if (v50)
            {
              CGContextSetFillColorWithColor(self->_context, (CGColorRef)[v50 CGColor]);
              v84.origin.CGFloat x = v43;
              v84.origin.CGFloat y = MinY;
              v84.size.CGFloat width = v45;
              v84.size.CGFloat height = v47;
              CGContextFillRect(self->_context, v84);
            }
            else
            {
              unsigned int v51 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014CC448);
              }
              __int16 v52 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)CGAffineTransform buf = 67110146;
                unsigned int v68 = v51;
                __int16 v69 = 2082;
                CGRect v70 = "-[CRLWPRenderer drawAdornmentRects:forColumn:foreground:drawingState:]";
                __int16 v71 = 2082;
                long long v72 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm";
                __int16 v73 = 1024;
                int v74 = 774;
                __int16 v75 = 2082;
                v76 = "colorFill";
                _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014CC468);
              }
              int v53 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_ERROR))
              {
                long long v56 = +[CRLAssertionHandler packedBacktraceString];
                *(_DWORD *)CGAffineTransform buf = 67109378;
                unsigned int v68 = v51;
                __int16 v69 = 2114;
                CGRect v70 = v56;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v53, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
              }
              __int16 v54 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer drawAdornmentRects:forColumn:foreground:drawingState:]");
              long long v55 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"];
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v54, v55, 774, 0, "invalid nil value for '%{public}s'", "colorFill");
            }
            id v36 = (char *)v36 + 1;
          }
          while (v34 != v36);
          id v34 = [v33 countByEnumeratingWithState:&v59 objects:v77 count:16];
        }
        while (v34);
      }

      CGContextRestoreGState(self->_context);
    }
  }
}

- (BOOL)shouldClipFragment:(const void *)a3 drawingState:(const CRLWPDrawingState *)a4 lineDrawFlags:(unint64_t)a5 updateRect:(CGRect)a6 outClipRect:(CGRect *)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  char v12 = a5;
  if (!CGRectIsNull(a6))
  {
    v49.origin.double x = a4->var2.origin.x;
    CGFloat v19 = a4->var2.origin.y;
    CGFloat v20 = a4->var2.size.width;
    CGFloat v21 = a4->var2.size.height;
    CGFloat rect = v49.origin.x;
    v49.origin.double y = v19;
    v49.size.double width = v20;
    v49.size.double height = v21;
    double v22 = CGRectGetWidth(v49);
    if (!a3)
    {
      if (!a4->var15)
      {
        CGFloat v45 = height;
        CGFloat v31 = v21;
        CGFloat v32 = v20;
        CGFloat v33 = v19;
        double v47 = 10000000.0;
LABEL_32:
        a4->var27 = 1;
        v54.origin.double x = rect;
        v54.origin.double y = v33;
        v54.size.double width = v32;
        v54.size.double height = v31;
        CGFloat v46 = v31;
        double MaxY = CGRectGetMaxY(v54);
        v55.origin.double x = x;
        v55.origin.double y = y;
        v55.size.double width = width;
        double height = v45;
        v55.size.double height = v45;
        double v36 = CGRectGetMaxY(v55);
        if (v36 < MaxY) {
          double MaxY = v36;
        }
        v56.origin.double x = rect;
        v56.origin.double y = v33;
        v56.size.double width = v32;
        v56.size.double height = v46;
        double MinY = CGRectGetMinY(v56);
        if (MinY >= y) {
          double y = MinY;
        }
        double x = fmax(x, -10000000.0);
        goto LABEL_39;
      }
LABEL_45:
      BOOL result = 0;
LABEL_46:
      a7->origin.double x = x;
      a7->origin.double y = y;
      a7->size.double width = width;
      a7->size.double height = height;
      return result;
    }
    double v23 = v22;
    CFIndex v24 = sub_1001597CC((uint64_t)a3);
    double v47 = 10000000.0;
    if ((v24 == 1 || v24 == 2 && (*((unsigned char *)a3 + 25) & 8) != 0) && rint(*((double *)a3 + 30)) > rint(v23))
    {
      [a4->var1 erasableBounds:0];
      CGFloat v43 = v50.origin.y;
      CGFloat v44 = v50.origin.x;
      CGFloat v41 = v50.size.height;
      CGFloat v42 = v50.size.width;
      double MaxX = CGRectGetMaxX(v50);
      v51.origin.double x = x;
      v51.origin.double y = y;
      v51.size.double width = width;
      v51.size.double height = height;
      double v26 = CGRectGetMaxX(v51);
      if (v26 >= MaxX) {
        double v26 = MaxX;
      }
      double v47 = v26;
      v52.origin.double y = v43;
      v52.origin.double x = v44;
      v52.size.double height = v41;
      v52.size.double width = v42;
      double MinX = CGRectGetMinX(v52);
      if (MinX >= x) {
        double x = MinX;
      }
      double y = fmax(y, -10000000.0);
      int v28 = 1;
      if ((v12 & 2) != 0) {
        goto LABEL_21;
      }
    }
    else
    {
      int v28 = 0;
      if ((v12 & 2) != 0)
      {
LABEL_21:
        if (*((unsigned char *)a3 + 488)) {
          double v29 = *((double *)a3 + 20);
        }
        else {
          double v29 = 0.0;
        }
        double v30 = *((double *)a3 + 4) + *((double *)a3 + 17) + v29;
        goto LABEL_29;
      }
    }
    double v30 = CGRectGetMaxY(*(CGRect *)((char *)a3 + 40));
LABEL_29:
    v53.origin.double x = rect;
    v53.origin.double y = v19;
    v53.size.double width = v20;
    v53.size.double height = v21;
    double v34 = CGRectGetMaxY(v53);
    if (!a4->var15 && rint(v30) > rint(v34))
    {
      CGFloat v45 = height;
      CGFloat v31 = v21;
      CGFloat v32 = v20;
      CGFloat v33 = v19;
      goto LABEL_32;
    }
    if (v28)
    {
      double MaxY = 10000000.0;
LABEL_39:
      v57.origin.double x = x;
      v57.origin.double y = y;
      v57.size.double width = width;
      v57.size.double height = height;
      double v38 = CGRectGetMaxX(v57);
      if (v38 >= v47) {
        double v39 = v47;
      }
      else {
        double v39 = v38;
      }
      v58.origin.double x = x;
      v58.origin.double y = y;
      v58.size.double width = width;
      v58.size.double height = height;
      double v40 = CGRectGetMaxY(v58);
      if (v40 >= MaxY) {
        double v40 = MaxY;
      }
      double height = fmax(v40 - y, 0.0);
      double width = fmax(v39 - x, 0.0);
      BOOL result = 1;
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CC488);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101067C90();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CC4A8);
  }
  double v15 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
  {
    +[CRLAssertionHandler packedBacktraceString];
    objc_claimAutoreleasedReturnValue();
    sub_1010663B0();
  }

  double v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer shouldClipFragment:drawingState:lineDrawFlags:updateRect:outClipRect:]");
  double v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"];
  +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:848 isFatal:0 description:"Should not try to clip with null update rect"];

  return 0;
}

- (void)p_drawWordMarkingsForFragment:(const void *)a3 color:(id)a4 ranges:(id)a5 suppressRange:(_NSRange)a6 drawingState:(const CRLWPDrawingState *)a7
{
  _NSRange v25 = a6;
  id v27 = a4;
  id v26 = a5;
  if (*((uint64_t *)a3 + 3) < 0) {
    uint64_t v11 = (NSUInteger *)&xmmword_101176F48;
  }
  else {
    uint64_t v11 = (NSUInteger *)a3;
  }
  NSUInteger location = *v11;
  NSUInteger length = v11[1];
  if (location + length > (unint64_t)objc_msgSend(a7->var0, "length", v25.location))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CC4C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101067D18();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CC4E8);
    }
    double v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    double v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:]");
    double v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:917 isFatal:0 description:"Invalid line fragment range"];

    v50.NSUInteger location = (NSUInteger)[a7->var0 range];
    v50.NSUInteger length = v17;
    v49.NSUInteger location = location;
    v49.NSUInteger length = length;
    NSRange v18 = NSIntersectionRange(v49, v50);
    NSUInteger location = v18.location;
    NSUInteger length = v18.length;
  }
  CGContextSaveGState(self->_context);
  CGContextSetStrokeColorWithColor(self->_context, (CGColorRef)[v27 CGColor]);
  lengths[0] = 2.5;
  lengths[1] = 4.0 - 2.5;
  CGContextSetLineDash(self->_context, 0.0, lengths, 2uLL);
  long long v19 = *(_OWORD *)((char *)a3 + 152);
  long long v44 = *(_OWORD *)((char *)a3 + 136);
  long long v45 = v19;
  long long v20 = *(_OWORD *)((char *)a3 + 184);
  long long v46 = *(_OWORD *)((char *)a3 + 168);
  long long v47 = v20;
  long long v21 = *(_OWORD *)((char *)a3 + 120);
  long long v42 = *(_OWORD *)((char *)a3 + 104);
  long long v43 = v21;
  int v22 = *((_DWORD *)a3 + 6);
  NSRange var25 = a7->var25;
  if (var25 == 0x7FFFFFFFFFFFFFFFuLL)
  {
    NSRange var25 = v25;
  }
  else
  {
    NSRange v24 = v25;
    if (v25.location != 0x7FFFFFFFFFFFFFFFLL || v25.length) {
      NSRange var25 = NSUnionRange(v24, var25);
    }
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  long long v36 = v44;
  long long v37 = v45;
  long long v38 = v46;
  long long v39 = v47;
  long long v34 = v42;
  v28[2] = sub_100027AC0;
  v28[3] = &unk_1014CC510;
  NSRange v29 = var25;
  NSUInteger v30 = location;
  NSUInteger v31 = length;
  CGFloat v32 = a3;
  CGFloat v33 = a7;
  char v40 = 0;
  long long v35 = v43;
  BOOL v41 = (v22 & 0x2000) != 0;
  v28[4] = self;
  [v26 enumerateRanges:v28];
  CGContextRestoreGState(self->_context);
}

- (void)p_drawMisspelledWordMarkingsFragment:(const void *)a3 drawingState:(const CRLWPDrawingState *)a4
{
  if (*((uint64_t *)a3 + 3) < 0) {
    BOOL v7 = &xmmword_101176F48;
  }
  else {
    BOOL v7 = (long long *)a3;
  }
  id v8 = [a4->var17 rangesIntersecting:*(void *)v7, *((void *)v7 + 1)];
  id v10 = [v8 mutableCopy];

  id v9 = +[CRLWPRenderer spellingMarkColor];
  -[CRLWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:](self, "p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:", a3, v9, v10, a4->var19.location, a4->var19.length, a4);
}

- (void)p_drawUngrammaticMarkingsFragment:(const void *)a3 drawingState:(const CRLWPDrawingState *)a4
{
  if (*((uint64_t *)a3 + 3) < 0) {
    BOOL v7 = &xmmword_101176F48;
  }
  else {
    BOOL v7 = (long long *)a3;
  }
  id v8 = [a4->var18 rangesIntersecting:*(void *)v7, *((void *)v7 + 1)];
  id v12 = [v8 mutableCopy];

  if (*((uint64_t *)a3 + 3) < 0) {
    id v9 = &xmmword_101176F48;
  }
  else {
    id v9 = (long long *)a3;
  }
  id v10 = [a4->var17 rangesIntersecting:*(void *)v9, *((void *)v9 + 1)];
  [v12 subtract:v10];
  uint64_t v11 = +[CRLWPRenderer grammarMarkColor];
  -[CRLWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:](self, "p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:", a3, v11, v12, 0x7FFFFFFFFFFFFFFFLL, 0, a4);
}

- (void)p_drawDictationMarkingsFragment:(const void *)a3 drawingState:(const CRLWPDrawingState *)a4
{
  id v6 = +[CRLWPRenderer correctionAndDictationMarkColor];
  -[CRLWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:](self, "p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:", a3);
}

- (void)p_drawAutocorrectionMarkingsFragment:(const void *)a3 drawingState:(const CRLWPDrawingState *)a4
{
  id v6 = +[CRLWPRenderer correctionAndDictationMarkColor];
  -[CRLWPRenderer p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:](self, "p_drawWordMarkingsForFragment:color:ranges:suppressRange:drawingState:", a3);
}

- (void)p_drawAdornmentLine:(id)a3 drawingState:(const CRLWPDrawingState *)a4 lineFragment:(const void *)a5 lineFragmentStart:(CGPoint)a6 vertical:(BOOL)a7
{
  double y = a6.y;
  double x = a6.x;
  id v12 = a3;
  if (![v12 color]) {
    goto LABEL_39;
  }
  [v12 thickness];
  double v14 = v13;
  [v12 start];
  double v16 = v15;
  double v18 = v17;
  id v19 = [v12 lineCount];
  [v12 length];
  double v21 = v20;
  double v22 = *((double *)a5 + 7);
  [v12 start];
  double v23 = x + v16;
  double v24 = y + v18;
  double v26 = v22 - v25;
  if (v21 >= v26) {
    double v21 = v26;
  }
  if (a4->var10)
  {
    memset(&v62, 0, sizeof(v62));
    CGContextGetCTM(&v62, self->_context);
    CGAffineTransform v61 = v62;
    if (sub_10007F964(&v61.a))
    {
      v64.double width = v14;
      v64.double height = v14;
      CGSize v27 = CGContextConvertSizeToDeviceSpace(self->_context, v64);
      if (v27.height >= 0.5 && ([v12 allowAntialiasing] & 1) == 0)
      {
        CGContextConvertPointToDeviceSpace(self->_context, a4->var2.origin);
        CGContextConvertSizeToDeviceSpace(self->_context, a4->var2.size);
        v65.double x = v23;
        v65.double y = v24;
        CGPoint v29 = CGContextConvertPointToDeviceSpace(self->_context, v65);
        CGFloat v28 = v29.x;
        double v30 = fmax(rint(v27.height), 1.0);
        double v31 = rint(v29.y);
        double v32 = 0.0;
        if (((int)v30 & 0x80000001) == 1) {
          double v32 = 0.5;
        }
        double v33 = v32 + v31;
        double v24 = CGContextConvertPointToUserSpace((CGContextRef)self[16], *(CGPoint *)&v28).y;
        v66.double width = v27.width;
        v66.double height = v30;
        double v14 = fabs(CGContextConvertSizeToUserSpace((CGContextRef)self[16], v66).height);
      }
    }
  }
  CGContextSetStrokeColorWithColor(self->_context, (CGColorRef)[v12 color]);
  id var4 = a4->var4;
  if (var4)
  {
    v35.NSUInteger location = (NSUInteger)[var4 range];
  }
  else
  {
    v35.NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
    v35.NSUInteger length = 0;
  }
  double v36 = v23 + fmax(v21, 0.0);
  if (v35.location == 0x7FFFFFFFFFFFFFFFLL && !v35.length) {
    goto LABEL_31;
  }
  if (*((uint64_t *)a5 + 3) < 0) {
    long long v37 = (NSUInteger *)&xmmword_101176F48;
  }
  else {
    long long v37 = (NSUInteger *)a5;
  }
  unint64_t v39 = *v37;
  NSUInteger v38 = v37[1];
  v63.NSUInteger location = *v37;
  v63.NSUInteger length = v38;
  NSRange v40 = NSIntersectionRange(v35, v63);
  if (!v40.length) {
    goto LABEL_39;
  }
  if (v40.length >= v38)
  {
LABEL_31:
    char v53 = 0;
    if (!v19) {
      goto LABEL_37;
    }
    goto LABEL_32;
  }
  sub_100152F60((unint64_t *)a5, v39, v38, 1, 1, 0, 0, (char **)&v62);
  sub_1001CEDF4((CGRect **)&v62);
  double v42 = v41;
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  if (*(void *)&v62.a)
  {
    v62.b = v62.a;
    operator delete(*(void **)&v62.a);
  }
  if (v23 >= v42) {
    double v49 = v23;
  }
  else {
    double v49 = v42;
  }
  double v60 = v49;
  v67.origin.double x = v42;
  v67.origin.double y = v44;
  v67.size.double width = v46;
  v67.size.double height = v48;
  double MaxX = CGRectGetMaxX(v67);
  if (MaxX >= v36) {
    double v51 = v36;
  }
  else {
    double v51 = MaxX;
  }
  if ([v12 underline] == (id)3) {
    double v52 = sub_1001CE960(v14);
  }
  else {
    double v52 = v14 * 0.5;
  }
  double v57 = v60 + -1.0;
  double v58 = v52 + 1.0;
  if (v19 == (id)2) {
    double v59 = (v58 + v58) * 1.5;
  }
  else {
    double v59 = v58 + v58;
  }
  if (v51 > v57)
  {
    CGContextSaveGState(self->_context);
    v68.size.double width = v51 - v57;
    v68.origin.double y = v24 - v58;
    v68.origin.double x = v60 + -1.0;
    v68.size.double height = v59;
    CGContextClipToRect(self->_context, v68);
    char v53 = 1;
    if (!v19)
    {
LABEL_37:
      if (v53) {
        CGContextRestoreGState(self->_context);
      }
      goto LABEL_39;
    }
LABEL_32:
    unsigned int v54 = 1;
    double v55 = v24;
    do
    {
      if ([v12 underline] == (id)3) {
        -[CRLWPRenderer p_strokeWavyLineFromPoint:toPoint:width:](self, "p_strokeWavyLineFromPoint:toPoint:width:", v23, v55, v36, v24, v14);
      }
      else {
        -[CRLWPRenderer p_strokeLineFromPoint:toPoint:width:](self, "p_strokeLineFromPoint:toPoint:width:", v23, v55, v36, v24, v14);
      }
      double v55 = v55 + v14 * 2.0;
      double v24 = v24 + v14 * 2.0;
    }
    while ((unint64_t)v19 > v54++);
    goto LABEL_37;
  }
LABEL_39:
}

- (void)p_drawAdornmentLineBackgroundRect:(id)a3 lineDrawFlags:(unint64_t)a4 drawingState:(const CRLWPDrawingState *)a5 bounds:(CGRect)a6
{
  CGFloat height = a6.size.height;
  double width = a6.size.width;
  CGFloat y = a6.origin.y;
  double x = a6.origin.x;
  char v10 = a4;
  id v19 = a3;
  if ([v19 color])
  {
    if ((v10 & 2) != 0)
    {
      CopyWithAlpha = CGColorCreateCopyWithAlpha((CGColorRef)[v19 color], 0.5);
      CGContextSetFillColorWithColor(self->_context, CopyWithAlpha);
      CGColorRelease(CopyWithAlpha);
    }
    else
    {
      CGContextSetFillColorWithColor(self->_context, (CGColorRef)[v19 color]);
    }
    [v19 length];
    double v14 = v13;
    [v19 start];
    double v16 = width - v15;
    double v17 = v14 >= v16 ? v16 : v14;
    if (v17 > 0.0)
    {
      [v19 start];
      v21.origin.double x = x + v18;
      v21.origin.CGFloat y = y;
      v21.size.double width = v17;
      v21.size.CGFloat height = height;
      CGContextFillRect(self->_context, v21);
    }
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
  double v10 = sub_1001CE978();
  double v11 = sub_1001CE960(a5);
  double v12 = sub_1001CE96C(a5);
  CGContextSaveGState(self->_context);
  v24.origin.double y = y - (v11 + 1.0);
  v24.size.CGFloat height = v11 + 1.0 + v11 + 1.0;
  v24.origin.double x = v8;
  v24.size.double width = x - v8;
  CGContextClipToRect(self->_context, v24);
  CGContextBeginPath(self->_context);
  CGContextMoveToPoint(self->_context, v8, y);
  CGContextSetLineWidth(self->_context, v12);
  double v22 = fmax((x - v8) * v10, 1.0);
  if (v22 > 0.0)
  {
    double v13 = (x - v8) / v22 * 0.5;
    double v14 = v13 * 0.5;
    double v15 = y - v11;
    double v16 = y + v11;
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

- (void)p_calculateMarkAdornments:(id)a3 drawingState:(const CRLWPDrawingState *)a4 lineFragment:(const void *)a5
{
  id v51 = a3;
  if (*((uint64_t *)a5 + 3) < 0) {
    CGFloat v7 = (NSUInteger *)&xmmword_101176F48;
  }
  else {
    CGFloat v7 = (NSUInteger *)a5;
  }
  NSUInteger v8 = v7[1];
  range2.NSUInteger location = *v7;
  double v9 = *((double *)a5 + 17);
  double v10 = *((double *)a5 + 19);
  id v11 = [a4->var26 length];
  uint64_t v12 = sub_100152BE4((uint64_t)a5, 0);
  double v13 = (const __CTLine *)sub_1001BAB78(v12);
  double v14 = CTLineGetGlyphRuns(v13);
  unint64_t v15 = 0;
  double v49 = v14;
  do
  {
    if (v15 >= (unint64_t)[v14 count])
    {
      NSRange v50 = 0;
      if (!v11) {
        goto LABEL_40;
      }
      goto LABEL_15;
    }
    double v16 = [v14 objectAtIndexedSubscript:v15];

    CFRange StringRange = CTRunGetStringRange((CTRunRef)v16);
    NSUInteger location = a4->var25.location;
    ++v15;
    BOOL v19 = location >= StringRange.location;
    unint64_t v20 = location - StringRange.location;
  }
  while (!v19 || v20 >= StringRange.length);
  CGRect v21 = CTRunGetAttributes((CTRunRef)v16);
  double v22 = [v21 objectForKeyedSubscript:kCTForegroundColorAttributeName];

  if (v22)
  {
    NSRange v50 = +[CRLColor colorWithCGColor:v22];
  }
  else
  {
    NSRange v50 = 0;
  }

  if (!v11) {
    goto LABEL_40;
  }
LABEL_15:
  uint64_t v23 = 0;
  NSAttributedStringKey v24 = NSUnderlineStyleAttributeName;
  double v25 = v9 + v10 * 0.5;
  char v52 = 1;
  while (1)
  {
    double v26 = [a4->var26 attribute:NSMarkedClauseSegmentAttributeName atIndex:v23 longestEffectiveRange:&v56 inRange:v11];
    CGSize v27 = [a4->var26 attribute:v24 atIndex:v23 longestEffectiveRange:&v55 inRange:0 v11];
    if (([v26 BOOLValue] & 1) == 0
      && ([v27 BOOLValue] & 1) == 0)
    {
      break;
    }
    if (([v26 BOOLValue] & 1) == 0) {
      long long v56 = v55;
    }
    v57.NSUInteger length = *((void *)&v56 + 1);
    v57.NSUInteger location = a4->var25.location + v56;
    v58.NSUInteger location = range2.location;
    v58.NSUInteger length = v8;
    NSRange v28 = NSIntersectionRange(v57, v58);
    if (v28.length)
    {
      sub_100152F60((unint64_t *)a5, v28.location, v28.length, 1, 1, 0, 0, (char **)&range2.length);
      NSUInteger length = (void *)range2.length;
      if (v54 != (void *)range2.length)
      {
        double v30 = *(double *)range2.length;
        CGFloat v31 = *(double *)(range2.length + 8);
        double v33 = *(double *)(range2.length + 16);
        double v32 = *(double *)(range2.length + 24);
        double v34 = *((double *)a5 + 5);
        double v35 = *((double *)a5 + 19);
        int v36 = [v27 intValue];
        if (v36 >= 1)
        {
          NSUInteger v37 = v8;
          double x = v30 - v34;
          double v39 = v32 + v35;
          v59.origin.double x = x;
          v59.origin.double y = v31;
          v59.size.double width = v33;
          v59.size.CGFloat height = v32 + v35;
          double v40 = CGRectGetMaxY(v59) - *((double *)a5 + 4);
          if (v40 >= v25) {
            double v41 = v25;
          }
          else {
            double v41 = v40;
          }
          id v42 = v50;
          [a4->var26 attribute:NSUnderlineColorAttributeName atIndex:v23 longestEffectiveRange:0 inRange:v11];
          id v43 = objc_claimAutoreleasedReturnValue();
          id v44 = [v43 CGColor];

          if (v44)
          {
            uint64_t v45 = +[CRLColor colorWithCGColor:v44];

            id v42 = (id)v45;
          }
          if (!v42)
          {
            id v42 = +[CRLColor blackColor];
          }
          if (v52)
          {
            double width = v33 + -1.0;
          }
          else
          {
            v60.origin.double x = x;
            v60.origin.double y = v31;
            v60.size.double width = v33;
            v60.size.CGFloat height = v39;
            CGRect v61 = CGRectInset(v60, 1.0, 0.0);
            double x = v61.origin.x;
            double width = v61.size.width;
          }
          LOBYTE(v48) = 1;
          double v47 = -[CRLWPAdornmentLine initWithStart:length:color:thickness:lineCount:underline:adornmentLocation:underLineAdjustment:isWhitespace:renderingDelegate:allowAntialiasing:]([CRLWPAdornmentLine alloc], "initWithStart:length:color:thickness:lineCount:underline:adornmentLocation:underLineAdjustment:isWhitespace:renderingDelegate:allowAntialiasing:", [v42 CGColor], 1, 1, 2, 0, 0, x, v41, width, (double)v36, 0.0, v48);
          [v51 addObject:v47];

          char v52 = 0;
          NSUInteger v8 = v37;
          NSAttributedStringKey v24 = NSUnderlineStyleAttributeName;
        }
        NSUInteger length = (void *)range2.length;
      }
      if (length)
      {
        unsigned int v54 = length;
        operator delete(length);
      }
    }

    uint64_t v23 = *((void *)&v56 + 1) + v56;
    if (*((void *)&v56 + 1) + (void)v56 >= (unint64_t)v11) {
      goto LABEL_40;
    }
  }

LABEL_40:
}

- (void)p_drawRun:(const __CTRun *)a3 range:(id)a4 attributes:(id)a5 canvasIsInteractive:(BOOL)a6
{
  LODWORD(v30) = a6;
  id v36 = a5;
  CGContextSaveGState(self->_context);
  CGFloat v7 = [v36 objectForKeyedSubscript:kCTFontAttributeName];

  CFStringRef v8 = CTFontCopyPostScriptName((CTFontRef)v7);
  int v9 = CFEqual(v8, @"AppleColorEmoji");
  CFRelease(v8);
  double v10 = [v36 objectForKeyedSubscript:@"CRLWPCharacterFillAttribute"];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CC530);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101067DA0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CC550);
      }
      id v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      uint64_t v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer p_drawRun:range:attributes:canvasIsInteractive:]");
      double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:1331 isFatal:0 description:"unexpected color fill"];
    }
  }
  double v35 = [v36 objectForKeyedSubscript:@"CRLWPCharacterStrokeAttribute" v30];
  if (v10) {
    BOOL v14 = [v10 fillType] == 0;
  }
  else {
    BOOL v14 = 1;
  }
  BOOL v32 = v14;
  id v15 = [v36 objectForKeyedSubscript:kCTForegroundColorAttributeName];

  if (v15)
  {
    BOOL v16 = sub_10001054C((CGColor *)v15);
    if (v10) {
      goto LABEL_17;
    }
LABEL_20:
    BOOL v17 = 0;
    goto LABEL_22;
  }
  BOOL v16 = 1;
  if (!v10) {
    goto LABEL_20;
  }
LABEL_17:
  if ([v10 fillType]) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = [v10 fillType] != (id)4;
  }
LABEL_22:
  int v18 = sub_1004583EC((uint64_t)self->_context);
  BOOL v19 = (objc_class *)objc_opt_class();
  unint64_t v20 = [v36 objectForKeyedSubscript:@"CRLWPInvisibleTextAttribute"];
  CGRect v21 = sub_10024715C(v19, v20);
  unsigned __int8 v22 = [v21 BOOLValue];

  if (v9)
  {
    if (v35) {
      char v23 = 1;
    }
    else {
      char v23 = v17;
    }
    if (v23)
    {
      if (v15)
      {
        CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha((CGColorRef)v15, 1.0);
        id v15 = (id)CFAutorelease(CopyWithAlpha);
      }
      else
      {
        CGSize v27 = +[CRLColor blackColor];
        id v15 = [v27 CGColor];
      }
    }
LABEL_43:
    char v26 = 0;
    if (v15) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  if (v18)
  {
    if (v32 && !v16) {
      goto LABEL_43;
    }
    if (!v32 || !v16 || v35)
    {
      if (v15)
      {
        CGColorRef v25 = CGColorCreateCopyWithAlpha((CGColorRef)v15, 0.0);
        id v15 = (id)CFAutorelease(v25);
      }
      else
      {
        NSRange v28 = +[CRLColor clearColor];
        id v15 = [v28 CGColor];
      }
      CGContextSetTextDrawingMode(self->_context, kCGTextInvisible);
      goto LABEL_43;
    }
  }
  else if (!v17)
  {
    char v26 = v16 & (v31 ^ 1) & v22;
    if (v15) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  char v26 = 1;
  if (v15) {
    goto LABEL_45;
  }
LABEL_44:
  CGPoint v29 = +[CRLColor blackColor];
  id v15 = [v29 CGColor];

LABEL_45:
  CGContextSetFillColorWithColor(self->_context, (CGColorRef)v15);
  if ((v26 & 1) == 0) {
    CTRunDraw(a3, self->_context, (CFRange)a4);
  }
  CGContextRestoreGState(self->_context);
}

- (void)p_drawTextInRunsForLine:(CRLWPLineRef *)a3 fragment:(const void *)a4 state:(const CRLWPDrawingState *)a5 listLabel:(BOOL)a6 tateChuYoko:(BOOL)a7 ruby:(BOOL)a8 baseRange:(_NSRange)a9 isFirstLineRef:(BOOL)a10
{
  BOOL v79 = a8;
  BOOL v90 = a7;
  CGRect v83 = sub_100457AE4((uint64_t)self->_context);
  id v11 = (const __CTLine *)sub_1001BAB78((uint64_t)a3);
  v88 = CTLineGetGlyphRuns(v11);
  unint64_t v91 = 0;
  int v85 = a10 & ~(v90 || v79);
  if (v83) {
    BOOL v13 = a6;
  }
  else {
    BOOL v13 = 1;
  }
  BOOL v82 = v13;
  NSUInteger location = (char *)a9.location;
  NSUInteger length = a9.length;
  *(void *)&long long v12 = 67109378;
  long long v77 = v12;
  while (1)
  {
    if (v91 >= (unint64_t)objc_msgSend(v88, "count", v77)) {
      goto LABEL_107;
    }
    BOOL v14 = [v88 objectAtIndexedSubscript:];

    uint64_t GlyphCount = CTRunGetGlyphCount((CTRunRef)v14);
    if ((unint64_t)(GlyphCount - 65537) <= 0xFFFFFFFFFFFEFFFFLL) {
      break;
    }
    BOOL v16 = CTRunGetAttributes((CTRunRef)v14);
    BOOL v17 = [v16 objectForKeyedSubscript:@"CRLWPRubySpacingRunAttribute"];
    v86 = v17;
    if (v17) {
      unsigned int v18 = [v17 BOOLValue];
    }
    else {
      unsigned int v18 = 0;
    }
    BOOL v19 = [v16 objectForKeyedSubscript:@"__wpAttachmentMap"];

    CFRange StringRange = CTRunGetStringRange((CTRunRef)v14);
    id v21 = (id)StringRange.location;
    CFIndex v22 = StringRange.length;
    if (v85)
    {
      char v23 = sub_1001524D8((uint64_t)a4);
      id v21 = [v23 charRangeMappedToStorage:StringRange.location, StringRange.length];
      CFIndex v22 = v24;
    }
    if (v90)
    {
      CGColorRef v25 = sub_1001524D8((uint64_t)a4);
      NSUInteger location = (char *)[v25 charRangeMappedToStorage:location length];
      NSUInteger length = v26;
    }
    if (v19) {
      int v27 = 1;
    }
    else {
      int v27 = v18;
    }
    if (v27 == 1)
    {
      if (v19)
      {
        [v83 beginPrimaryTextRunWithRange:v21 hasActualContents:v22];
        [v83 endPrimaryTextRunWithRange:v21 hasActualContents:v22];
      }
      goto LABEL_70;
    }
    if (!v82)
    {
      if (v85)
      {
        [v83 beginPrimaryTextRunWithRange:v21 hasActualContents:v22];
      }
      else if (v79)
      {
        [v83 beginRubyRunWithRange:v21 baseTextRange:v22];
      }
      else if (v90)
      {
        [v83 beginTateChuYokoRunWithRange:v21 baseTextRange:v22 location:location length:length];
      }
      else
      {
        [v83 beginAncillaryTextRunWithRange:v21 baseTextRange:v22];
      }
    }
    CGContextSaveGState(self->_context);
    double v28 = sub_100152DCC(v16);
    memset(&v108, 0, sizeof(v108));
    CTRunGetTextMatrix(&v108, (CTRunRef)v14);
    char Status = CTRunGetStatus((CTRunRef)v14);
    double v30 = 0.0;
    if ((*((unsigned char *)a4 + 25) & 0x20) != 0)
    {
      if (v90)
      {
        BOOL v32 = self;
        CGContextRotateCTM(self->_context, -1.57079633);
        double v31 = 0.0;
        goto LABEL_33;
      }
      char v48 = Status;
      CGFloat ascent = 0.0;
      descent[0] = 0.0;
      CGFloat leading = 0.0;
      v109.NSUInteger location = 0;
      v109.NSUInteger length = 0;
      double TypographicBounds = CTRunGetTypographicBounds((CTRunRef)v14, v109, &ascent, descent, &leading);
      if ((v48 & 4) != 0)
      {
        id v51 = [v16 objectForKeyedSubscript:kCTHorizontalInVerticalFormsAttributeName];
        BOOL v52 = v51 == 0;

        context = self->_context;
        if (v52)
        {
          CGContextRotateCTM(self->_context, -1.57079633);
        }
        else
        {
          CGAffineTransformMakeRotation(&v99, 1.57079633);
          CGContextSetTextMatrix(context, &v99);
        }
        double v31 = 0.0;
        goto LABEL_30;
      }
      double v30 = (ascent - descent[0]) * -0.5;
    }
    double v31 = v28;
    double v28 = 0.0;
LABEL_30:
    BOOL v32 = self;
LABEL_33:
    v108.tdouble x = v28 + v108.tx;
    v108.tdouble y = v31 + v108.ty;
    CGContextSetTextPosition(v32->_context, v108.tx, v30 + v108.ty);
    double v33 = v32->_context;
    CGAffineTransformMakeScale(&transform, 1.0, -1.0);
    CGContextConcatCTM(v33, &transform);
    double v34 = v32->_context;
    long long v35 = *(_OWORD *)&a3->var4.c;
    *(_OWORD *)&v97.a = *(_OWORD *)&a3->var4.a;
    *(_OWORD *)&v97.c = v35;
    *(_OWORD *)&v97.tdouble x = *(_OWORD *)&a3->var4.tx;
    CGContextConcatCTM(v34, &v97);
    if (a5->var9
      || ([v16 objectForKeyedSubscript:@"CRLWPShadow"],
          (id v36 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      CGRect v81 = 0;
    }
    else
    {
      CGRect v81 = v36;
      [v36 applyToContext:self->_context viewScale:self->_flipShadows flipped:self->_viewScale];
    }
    id var4 = a5->var4;
    if (var4)
    {
      unint64_t v38 = (unint64_t)[var4 superRange];
      double v40 = v39;
      id var4 = a5->var4;
    }
    else
    {
      unint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
      double v40 = 0;
    }
    double v41 = (char *)[var4 type];
    id v42 = a5->var4;
    if (!v42)
    {
LABEL_48:
      NSRange var23 = a5->var23;
      if (var23 == 0x7FFFFFFFFFFFFFFFuLL)
      {
        NSUInteger v44 = 0;
      }
      else
      {
        v111.NSUInteger location = 0;
        v111.NSUInteger length = GlyphCount;
        NSRange v45 = NSIntersectionRange(var23, v111);
        NSUInteger v44 = v45.location;
        uint64_t GlyphCount = v45.length;
      }
      -[CRLWPRenderer p_drawRun:range:attributes:canvasIsInteractive:](self, "p_drawRun:range:attributes:canvasIsInteractive:", v14, v44, GlyphCount, v16, a5->var10);
      goto LABEL_52;
    }
    if (v90)
    {
      if ((unint64_t)(v41 - 1) <= 1) {
        goto LABEL_48;
      }
    }
    else if ((unint64_t)location >= v38 && &location[-v38] < v40 {
           || location == (char *)v38 && v40 == (char *)length)
    }
    {
      goto LABEL_48;
    }
    if (a5->var23.location == 0x7FFFFFFFFFFFFFFFLL && !a5->var23.length)
    {
      if ((unint64_t)[v42 visualRangeCount] < 2)
      {
        NSRange v78 = -[CRLWPRangeArray initWithRange:]([CRLWPRangeArray alloc], "initWithRange:", v38, v40);
      }
      else
      {
        NSRange v50 = [a5->var4 visualRanges];
        NSRange v78 = (CRLWPRangeArray *)[v50 copy];
      }
      sub_10002B3D8(descent, GlyphCount);
      v110.NSUInteger location = 0;
      v110.NSUInteger length = GlyphCount;
      CTRunGetStringIndices((CTRunRef)v14, v110, *(CFIndex **)&descent[0]);
      id v89 = objc_alloc_init((Class)NSMutableIndexSet);
      unsigned int v54 = &xmmword_101176F48;
      if (*((uint64_t *)a4 + 3) >= 0) {
        unsigned int v54 = (long long *)a4;
      }
      long long v55 = -[CRLWPRangeArray intersection:](v78, "intersection:", *(void *)v54, *((void *)v54 + 1));
      id v56 = [v55 mutableCopy];

      for (unsigned int i = 0; (unint64_t)[v56 rangeCount] > i; ++i)
      {
        NSRange v58 = sub_1001524D8((uint64_t)a4);
        id v59 = [v56 rangeAtIndex:i];
        id v61 = [v58 charRangeMappedFromStorage:v59, v60];
        [v56 replaceRangeAtIndex:i withRange:v61, v62];
      }
      if (GlyphCount >= 1)
      {
        uint64_t v63 = 0;
        while (1)
        {
          if (!v90) {
            goto LABEL_90;
          }
          unint64_t var3 = a3->var3;
          BOOL v65 = (unint64_t)location >= var3;
          CGSize v66 = &location[-var3];
          if (!v65) {
            break;
          }
LABEL_91:
          if ([v56 containsCharacterAtIndex:&v66[*(void *)(*(void *)&descent[0] + 8 * v63)]])[v89 addIndex:v63]; {
          if (GlyphCount == ++v63)
          }
            goto LABEL_94;
        }
        unsigned int v67 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CC590);
        }
        CGRect v68 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
        {
          LODWORD(ascent) = 67109890;
          HIDWORD(ascent) = v67;
          __int16 v102 = 2082;
          v103 = "-[CRLWPRenderer p_drawTextInRunsForLine:fragment:state:listLabel:tateChuYoko:ruby:baseRange:isFirstLineRef:]";
          __int16 v104 = 2082;
          v105 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm";
          __int16 v106 = 1024;
          int v107 = 1592;
          _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d unexpected string offset for tate chu yoko run", (uint8_t *)&ascent, 0x22u);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CC5B0);
        }
        __int16 v69 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v69, OS_LOG_TYPE_ERROR))
        {
          long long v72 = +[CRLAssertionHandler packedBacktraceString];
          CGFloat ascent = COERCE_DOUBLE(__PAIR64__(v67, v77));
          __int16 v102 = 2114;
          v103 = v72;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v69, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&ascent, 0x12u);
        }
        CGRect v70 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer p_drawTextInRunsForLine:fragment:state:listLabel:tateChuYoko:ruby:baseRange:isFirstLineRef:]");
        __int16 v71 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v70 file:v71 lineNumber:1592 isFatal:0 description:"unexpected string offset for tate chu yoko run"];

LABEL_90:
        CGSize v66 = 0;
        goto LABEL_91;
      }
LABEL_94:
      __int16 v73 = (char *)[v89 firstIndex];
      uint64_t v74 = 0;
      __int16 v75 = v73;
      do
      {
        if (v75 == &v73[v74])
        {
          ++v74;
        }
        else
        {
          CGContextSaveGState(self->_context);
          -[CRLWPRenderer p_drawRun:range:attributes:canvasIsInteractive:](self, "p_drawRun:range:attributes:canvasIsInteractive:", v14, v73, v74, v16, a5->var10);
          CGContextRestoreGState(self->_context);
          __int16 v73 = v75;
          uint64_t v74 = 1;
        }
        __int16 v75 = (char *)[v89 indexGreaterThanIndex:v75];
      }
      while (v73 != (char *)0x7FFFFFFFFFFFFFFFLL);

      if (*(void *)&descent[0])
      {
        descent[1] = descent[0];
        operator delete(*(void **)&descent[0]);
      }
    }
LABEL_52:
    CGContextRestoreGState(self->_context);
    CGFloat v46 = self->_context;
    long long v47 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v95.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v95.c = v47;
    *(_OWORD *)&v95.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGContextSetTextMatrix(v46, &v95);
    if (!v82)
    {
      if (v85)
      {
        [v83 endPrimaryTextRunWithRange:v21 hasActualContents:v22];
      }
      else if (v79)
      {
        [v83 endRubyRunWithRange:v21 baseTextRange:v22 location:location length:length];
      }
      else if (v90)
      {
        [v83 endTateChuYokoRunWithRange:v21 baseTextRange:v22 location:location length:length];
      }
      else
      {
        [v83 endAncillaryTextRunWithRange:v21 baseTextRange:v22 location:location length:length];
      }
    }

LABEL_70:
    ++v91;
  }
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014CC570);
  }
  v76 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
  {
    LODWORD(v108.a) = 134217984;
    *(void *)((char *)&v108.a + 4) = GlyphCount;
    _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "bad glyph count: %ld", (uint8_t *)&v108, 0xCu);
  }
LABEL_107:
}

- (void)p_drawAttachmentGlyphAtPosition:(id)a3 fragment:(const void *)a4
{
  double v5 = floor(a3.var1) + 0.5;
  double v6 = -*((double *)a4 + 15) - *((double *)a4 + 18);
  double v7 = v5 - 4.80000019 * 0.5;
  -[CRLWPRenderer p_strokeLineFromPoint:toPoint:width:](self, "p_strokeLineFromPoint:toPoint:width:", a3.var0, v5, v6, v5, *((double *)a4 + 17) + *((double *)a4 + 19) + *((double *)a4 + 20), 1.0);
  context = self->_context;
  double v9 = v7;
  double v10 = v6;
  uint64_t v11 = 0x4013333340000000;
  uint64_t v12 = 0x4013333340000000;

  CGContextFillEllipseInRect(context, *(CGRect *)&v9);
}

- (void)p_drawInvisiblesAdornments:(id)a3 lineFragment:(const void *)a4 state:(const CRLWPDrawingState *)a5
{
  id v8 = a3;
  BOOL var12 = a5->var12;
  font = (const __CTFont *)[v8 font];
  double v10 = (const __CTFont *)[v8 flippedFont];
  double v11 = *((double *)a4 + 4);
  double v12 = *((double *)a4 + 5);
  CGContextSaveGState(self->_context);
  context = self->_context;
  if ((*((unsigned char *)a4 + 25) & 0x20) != 0)
  {
    uint64_t v17 = sub_100152BE4((uint64_t)a4, 0);
    CGContextTranslateCTM(context, v12 + *(double *)(v17 + 8), v11);
  }
  else
  {
    double v14 = *((double *)a4 + 15);
    double v15 = *((double *)a4 + 17);
    uint64_t v16 = sub_100152BE4((uint64_t)a4, 0);
    CGContextTranslateCTM(context, v12 + *(double *)(v16 + 8), v11 + (v15 - v14 + *(double *)&qword_10166D9E8) * 0.5);
  }
  BOOL v37 = var12;
  CGContextSetTextPosition(self->_context, 0.0, 0.0);
  CGContextSetFillColorWithColor(self->_context, a5->var6);
  double v34 = v10;
  if (*((uint64_t *)a4 + 3) < 0) {
    unsigned int v18 = &xmmword_101176F48;
  }
  else {
    unsigned int v18 = (long long *)a4;
  }
  uint64_t v35 = *(void *)v18;
  uint64_t v36 = *((void *)v18 + 1);
  unint64_t v19 = (unint64_t)[v8 positionCount];
  size_t count = (size_t)[v8 flippedPositionCount];
  if ([v8 positionCount] != (id)v19 || objc_msgSend(v8, "flippedPositionCount") != (id)count)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CC5D0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101067E28();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CC5F0);
    }
    unint64_t v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer p_drawInvisiblesAdornments:lineFragment:state:]");
    CFIndex v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:1693 isFatal:0 description:"Invisibles mismatch"];
  }
  if ([v8 positionCount] == (id)v19 && objc_msgSend(v8, "flippedPositionCount") == (id)count)
  {
    if (!v37)
    {
      id v24 = a5->var3;
      CGColorRef v25 = v24;
      if (!v36
        || ![v24 isValid]
        || ![v25 containsCharacterAtIndex:v36 + v35 - 1])
      {

        goto LABEL_33;
      }
      BOOL v26 = [v8 type] == 2;

      if (!v26) {
        goto LABEL_33;
      }
    }
    if (v19 | count)
    {
      char v23 = self->_context;
      CGAffineTransformMakeScale(&transform, 1.0, -1.0);
      CGContextConcatCTM(v23, &transform);
      if ((*((unsigned char *)a4 + 25) & 0x20) != 0)
      {
        if (v19)
        {
          sub_10002B4CC(positions, v19);
          uint64_t v27 = 0;
          unint64_t v28 = v19;
          do
          {
            CGRect BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs(font, kCTFontOrientationHorizontal, (const CGGlyph *)((char *)[v8 glyphs] + v27 * 2), 0, 1);
            double y = BoundingRectsForGlyphs.origin.y;
            double height = BoundingRectsForGlyphs.size.height;
            double v31 = [v8 positions:BoundingRectsForGlyphs.origin.x];
            BOOL v32 = &positions[0][v27];
            v32->double x = v31[v27 * 2];
            v32->double y = -(y - height * -0.5);
            ++v27;
            --v28;
          }
          while (v28);
          double v33 = (const CGGlyph *)[v8 glyphs];
          CTFontDrawGlyphs(font, v33, positions[0], v19, self->_context);
          if (positions[0])
          {
            positions[1] = positions[0];
            operator delete(positions[0]);
          }
        }
      }
      else
      {
        if (v19) {
          CTFontDrawGlyphs(font, (const CGGlyph *)[v8 glyphs], (const CGPoint *)[v8 positions], v19, self->_context);
        }
        if (count) {
          CTFontDrawGlyphs(v34, (const CGGlyph *)[v8 flippedGlyphs], (const CGPoint *)[v8 flippedPositions], count, self->_context);
        }
      }
    }
  }
LABEL_33:
  CGContextRestoreGState(self->_context);
}

- (void)p_drawHiddenDeletionsAdornments:(id)a3 lineFragment:(const void *)a4 state:(const CRLWPDrawingState *)a5
{
  id v7 = a3;
  id v8 = (const __CTFont *)[v7 font];
  CGFloat v9 = *((double *)a4 + 4);
  double v10 = *((double *)a4 + 5);
  CGContextSaveGState(self->_context);
  context = self->_context;
  uint64_t v12 = sub_100152BE4((uint64_t)a4, 0);
  CGContextTranslateCTM(context, v10 + *(double *)(v12 + 8), v9);
  CGContextSetTextPosition(self->_context, 0.0, 0.0);
  CGContextSetFillColorWithColor(self->_context, (CGColorRef)[v7 color]);
  id v13 = [v7 positionCount];
  if (v13 == [v7 glyphCount])
  {
    id v14 = [v7 positionCount];
    if (v14)
    {
      double v15 = self->_context;
      CGAffineTransformMakeScale(&v16, 1.0, -1.0);
      CGContextConcatCTM(v15, &v16);
      CTFontDrawGlyphs(v8, (const CGGlyph *)[v7 glyphs], (const CGPoint *)[v7 positions], (size_t)v14, self->_context);
    }
  }
  CGContextRestoreGState(self->_context);
}

- (BOOL)p_canvasSelectionIncludesDrawableOfAttachmentAtCharIndex:(unint64_t)a3 state:(const CRLWPDrawingState *)a4
{
  return 0;
}

- (void)p_drawAttachmentAdornments:(id)a3 lineFragment:(const void *)a4 state:(const CRLWPDrawingState *)a5
{
  id v17 = a3;
  BOOL var12 = a5->var12;
  BOOL var11 = a5->var11;
  CGFloat v10 = *((double *)a4 + 4);
  double v11 = *((double *)a4 + 5);
  CGContextSaveGState(self->_context);
  context = self->_context;
  uint64_t v13 = sub_100152BE4((uint64_t)a4, 0);
  CGContextTranslateCTM(context, v11 + *(double *)(v13 + 8), v10);
  CGContextSetFillColorWithColor(self->_context, a5->var6);
  CGContextSetStrokeColorWithColor(self->_context, a5->var6);
  id v14 = (char *)[v17 attachmentPositionCount];
  double v15 = [v17 attachmentPositions];
  for (id i = a5->var3; v14; --v14)
  {
    if (var12
      || ([i containsCharacterAtIndex:*v15], !var11)
      && [(CRLWPRenderer *)self p_canvasSelectionIncludesDrawableOfAttachmentAtCharIndex:*v15 state:a5])
    {
      -[CRLWPRenderer p_drawAttachmentGlyphAtPosition:fragment:](self, "p_drawAttachmentGlyphAtPosition:fragment:", *v15, v15[1], a4);
    }
    v15 += 2;
  }
  CGContextRestoreGState(self->_context);
}

- (void)p_drawAdornmentGlyphs:(id)a3 lineFragment:(const void *)a4 state:(const CRLWPDrawingState *)a5
{
  id v7 = a3;
  id v43 = v7;
  id v8 = (const __CTFont *)[v7 font];
  CGFloat v9 = (CGColor *)[v7 color];
  id v10 = [v7 positionCount];
  double v11 = (const CGPoint *)[v7 positions];
  id v12 = [v7 glyphCount];
  uint64_t v13 = (const CGGlyph *)[v7 glyphs];
  if (v10 == v12)
  {
    id v14 = v13;
    double v15 = *((double *)a4 + 4);
    double v44 = *((double *)a4 + 5);
    [v7 textPosition];
    double v17 = v16;
    double v19 = v18;
    if ([v7 shouldRotate])
    {
      [v7 ascent];
      double v21 = v20;
      [v7 descent];
      double v23 = v22;
      [v7 ascent];
      [v7 advance];
      if (v10)
      {
        CGFloat v25 = v24;
        uint64_t v26 = 0;
        double v27 = v21 + v23;
        double v28 = v15 + v19;
        unsigned int v29 = 1;
        do
        {
          CGContextSaveGState(self->_context);
          CGContextSetFillColorWithColor(self->_context, v9);
          p_double x = &v11[v26].x;
          double v32 = *p_x;
          double v31 = p_x[1];
          uint64_t v33 = sub_100152BE4((uint64_t)a4, 0);
          CGContextTranslateCTM(self->_context, v32 + v17 + v44 + *(double *)(v33 + 8), v28 + v31 - v27);
          CGContextSetTextPosition(self->_context, 0.0, 0.0);
          context = self->_context;
          CGAffineTransformMakeScale(&transform, 1.0, -1.0);
          CGContextConcatCTM(context, &transform);
          uint64_t v35 = self->_context;
          CGAffineTransformMakeTranslation(&v47, v25, -v27);
          CGContextConcatCTM(v35, &v47);
          uint64_t v36 = self->_context;
          CGAffineTransformMakeRotation(&v46, 1.57079633);
          CGContextConcatCTM(v36, &v46);
          CGPoint positions = CGPointZero;
          CTFontDrawGlyphs(v8, &v14[v26], &positions, 1uLL, self->_context);
          CGContextRestoreGState(self->_context);
          uint64_t v26 = v29;
        }
        while ((unint64_t)v10 > v29++);
      }
    }
    else
    {
      CGContextSaveGState(self->_context);
      CGContextSetFillColorWithColor(self->_context, v9);
      uint64_t v41 = sub_100152BE4((uint64_t)a4, 0);
      CGContextTranslateCTM(self->_context, v17 + v44 + *(double *)(v41 + 8), v15 + v19);
      id v42 = self->_context;
      CGAffineTransformMakeScale(&v45, 1.0, -1.0);
      CGContextConcatCTM(v42, &v45);
      CGContextSetTextPosition(self->_context, 0.0, 0.0);
      CTFontDrawGlyphs(v8, v14, v11, (size_t)v10, self->_context);
      CGContextRestoreGState(self->_context);
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CC610);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101067EB0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CC630);
    }
    unint64_t v38 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    double v39 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRenderer p_drawAdornmentGlyphs:lineFragment:state:]");
    double v40 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRenderer.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v39 file:v40 lineNumber:1834 isFatal:0 description:"mismatched adornment counts"];
  }
}

- (void)p_drawAdornments:(id)a3 lineFragment:(const void *)a4 state:(const CRLWPDrawingState *)a5
{
  id v9 = a3;
  unsigned int v8 = [v9 type];
  if (v8 - 1 < 2)
  {
    if (!a5->var8 && a5->var10 && sub_1001597CC((uint64_t)a4)) {
      [(CRLWPRenderer *)self p_drawInvisiblesAdornments:v9 lineFragment:a4 state:a5];
    }
  }
  else if (v8 == 3)
  {
    if (!a5->var8 && a5->var10 && sub_1001597CC((uint64_t)a4)) {
      [(CRLWPRenderer *)self p_drawAttachmentAdornments:v9 lineFragment:a4 state:a5];
    }
  }
  else if (v8 == 6)
  {
    if (!a5->var8 && a5->var10) {
      [(CRLWPRenderer *)self p_drawHiddenDeletionsAdornments:v9 lineFragment:a4 state:a5];
    }
  }
  else
  {
    [(CRLWPRenderer *)self p_drawAdornmentGlyphs:v9 lineFragment:a4 state:a5];
  }
}

- (void)p_drawInvisiblesBreakLine:(id)a3 lineFragment:(const void *)a4 state:(const CRLWPDrawingState *)a5
{
  id v20 = a3;
  BOOL var12 = a5->var12;
  id v9 = &xmmword_101176F48;
  if (*((uint64_t *)a4 + 3) >= 0) {
    id v9 = (long long *)a4;
  }
  uint64_t v11 = *(void *)v9;
  uint64_t v10 = *((void *)v9 + 1);
  id v12 = a5->var3;
  unsigned int v13 = v10 != 0;
  if (!var12 && v10 != 0)
  {
    if (![v12 isValid]) {
      goto LABEL_14;
    }
    unsigned int v13 = [v12 containsCharacterAtIndex:v10 + v11 - 1];
  }
  if (v20 && v13)
  {
    CGFloat v16 = *((double *)a4 + 4);
    CGFloat v15 = *((double *)a4 + 5);
    CGContextSaveGState(self->_context);
    CGContextTranslateCTM(self->_context, v15, v16);
    double v17 = sub_100152D2C((uint64_t)a4);
    double v18 = v17;
    if (v17)
    {
      id v19 = [v17 copyWithColor:a5->var6];
      -[CRLWPRenderer p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:](self, "p_drawAdornmentLine:drawingState:lineFragment:lineFragmentStart:vertical:", v19, a5, a4, 0, CGPointZero.x, CGPointZero.y);
    }
    CGContextRestoreGState(self->_context);
  }
LABEL_14:
}

- (void)p_drawListLabelForFragment:(const void *)a3 drawingState:(const CRLWPDrawingState *)a4 lineDrawFlags:(unint64_t)a5
{
  __int16 v5 = a5;
  if (*((uint64_t *)a3 + 3) < 0) {
    id v9 = &xmmword_101176F48;
  }
  else {
    id v9 = (long long *)a3;
  }
  id v10 = *(id *)v9;
  uint64_t v11 = *((void *)v9 + 1);
  id v12 = sub_100152CD8((uint64_t)a3);
  unsigned int v13 = (char *)[a4->var4 type];
  if ([a4->var4 isValid]
    && ((unsigned __int8 v14 = [a4->var4 containsCharacterAtIndex:v10], v13 == (char *)2)
      ? (unsigned __int8 v15 = v14)
      : (unsigned __int8 v15 = 0),
        (v15 & 1) == 0))
  {
    if ([a4->var4 start] != v10) {
      goto LABEL_22;
    }
    BOOL v16 = (unint64_t)(v13 - 1) < 2;
    if (!v12) {
      goto LABEL_22;
    }
  }
  else
  {
    BOOL v16 = 1;
    if (!v12) {
      goto LABEL_22;
    }
  }
  if (v16
    && (!a4->var14
     || (v5 & 0x100) != 0
     || v11 != 1
     || (sub_1001CA284((uint64_t)[a4->var0 characterAtIndex:v10]) & 1) == 0))
  {
    double v17 = sub_100457AE4((uint64_t)self->_context);
    [v17 beginListLabel];
    CGContextSaveGState(self->_context);
    if (a4->var9)
    {
      double v18 = 0;
    }
    else
    {
      double v22 = [v12 shadow];
      double v18 = v22;
      if (v22 && [v22 isEnabled]) {
        [v18 applyToContext:self->_context viewScale:self->_flipShadows flipped:self->_viewScale];
      }
    }
    id v19 = [v12 textLine];
    if (v19)
    {
      double v20 = sub_100158924((uint64_t)a3);
      CGContextTranslateCTM(self->_context, v20, v21);
      [(CRLWPRenderer *)self p_setCTMAndTextPositionForFragment:a3 state:a4];
      sub_1001BAA00((uint64_t)v24, v19, 0x7FFFFFFFFFFFFFFFLL, 0, 0, CGPointZero.x, CGPointZero.y);
      LOBYTE(v23) = 0;
      -[CRLWPRenderer p_drawTextInRunsForLine:fragment:state:listLabel:tateChuYoko:ruby:baseRange:isFirstLineRef:](self, "p_drawTextInRunsForLine:fragment:state:listLabel:tateChuYoko:ruby:baseRange:isFirstLineRef:", v24, a3, a4, 1, [v12 isLabelTateChuYoko], 0, v10, 0, v23);
      sub_1001BAAFC(v24);
    }
    CGContextRestoreGState(self->_context);
    [v17 endListLabel];
  }
LABEL_22:
}

- (void)p_setCTMAndTextPositionForFragment:(const void *)a3 state:(const CRLWPDrawingState *)a4
{
  if (a4->var10 && (*((_WORD *)a3 + 13) & 0x880) == 0)
  {
    memset(&v13, 0, sizeof(v13));
    CGContextGetCTM(&v13, self->_context);
    CGAffineTransform v12 = v13;
    if (sub_10007F964(&v12.a))
    {
      memset(&v11, 0, sizeof(v11));
      float64x2_t v6 = vrndxq_f64(*(float64x2_t *)&v13.tx);
      CGAffineTransform v10 = v13;
      CGAffineTransformInvert(&v11, &v10);
      context = self->_context;
      *(_OWORD *)&t1.a = *(_OWORD *)&v13.a;
      *(_OWORD *)&t1.c = *(_OWORD *)&v13.c;
      *(float64x2_t *)&t1.tdouble x = v6;
      CGAffineTransform t2 = v11;
      CGAffineTransformConcat(&transform, &t1, &t2);
      CGContextConcatCTM(context, &transform);
    }
  }
  CGContextSetTextPosition(self->_context, 0.0, 0.0);
}

- (CGContext)context
{
  return self->_context;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

- (BOOL)flipShadows
{
  return self->_flipShadows;
}

- (void)setFlipShadows:(BOOL)a3
{
  self->_flipShadows = a3;
}

- (CRLBezierPath)interiorClippingPath
{
  return self->_interiorClippingPath;
}

- (void)setInteriorClippingPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
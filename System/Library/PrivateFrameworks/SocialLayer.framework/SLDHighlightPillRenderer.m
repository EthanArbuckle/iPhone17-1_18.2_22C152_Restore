@interface SLDHighlightPillRenderer
- (BOOL)isRTL;
- (CGImage)_newAvatarImageFromImageData:(id)a3;
- (NSArray)contactImages;
- (SLDHighlightPillRenderer)initWithStyle:(id)a3 tag:(id)a4;
- (SLDHighlightPillSlotTag)slotTag;
- (SLHighlightPillMetrics)metricsProvider;
- (UISSlotStyle)slotStyle;
- (__CTFont)font;
- (void)_drawAvatarImage:(CGImage *)a3 inContext:(CGContext *)a4 atRect:(CGRect)a5;
- (void)_drawKnockoutBorderWidth:(double)a3 atXPosition:(double)a4 aroundImageWithYPosition:(double)a5 diameter:(double)a6 inContext:(CGContext *)a7;
- (void)_renderAvatarsInContext:(CGContext *)a3;
- (void)dealloc;
- (void)renderInContext:(CGContext *)a3;
- (void)setContactImages:(id)a3;
- (void)setFont:(__CTFont *)a3;
- (void)setMetricsProvider:(id)a3;
- (void)setRTL:(BOOL)a3;
- (void)setSlotStyle:(id)a3;
- (void)setSlotTag:(id)a3;
@end

@implementation SLDHighlightPillRenderer

- (SLDHighlightPillRenderer)initWithStyle:(id)a3 tag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLDHighlightPillRenderer;
  v9 = [(SLDHighlightPillRenderer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_slotStyle, a3);
    objc_storeStrong((id *)&v10->_slotTag, a4);
    v11 = [[SLHighlightPillMetrics alloc] initWithSlotStyle:v7 tag:v8];
    metricsProvider = v10->_metricsProvider;
    v10->_metricsProvider = v11;

    v10->_RTL = [v7 layoutDirection] == 1;
    v10->_font = (__CTFont *)CFRetain([(SLHighlightPillMetrics *)v10->_metricsProvider baseFont]);
  }

  return v10;
}

- (void)renderInContext:(CGContext *)a3
{
  v5 = [(SLDHighlightPillRenderer *)self metricsProvider];
  char v6 = [v5 hasValidMetricsForDrawing];

  if (v6)
  {
    id v7 = SLGeneralTelemetryLogHandle();
    os_signpost_id_t v8 = os_signpost_id_generate(v7);

    v9 = SLGeneralTelemetryLogHandle();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      LOWORD(buf.a) = 0;
      _os_signpost_emit_with_name_impl(&dword_19BE17000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "DaemonHighlightPillRenderInContext", "", (uint8_t *)&buf, 2u);
    }

    v11 = [(SLDHighlightPillRenderer *)self slotStyle];
    double v12 = (double)[v11 displayScale];

    v13 = [(SLDHighlightPillRenderer *)self metricsProvider];
    [v13 pillSize];
    double v15 = SLRoundToScale(v14 * 0.5, v12);

    BOOL v16 = [(SLDHighlightPillRenderer *)self isRTL];
    [(SLDHighlightPillRenderer *)self _renderAvatarsInContext:a3];
    v17 = [(SLDHighlightPillRenderer *)self metricsProvider];
    if ([v17 useDoubleLinedLabel])
    {
      v18 = [(SLDHighlightPillRenderer *)self metricsProvider];
      uint64_t v19 = [v18 firstLine];

      if (v19)
      {
        v20 = [(SLDHighlightPillRenderer *)self metricsProvider];
        v21 = (const __CTLine *)[v20 firstLine];

        v22 = [(SLDHighlightPillRenderer *)self metricsProvider];
        v23 = (const __CTLine *)[v22 secondLine];

        CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v21, 0);
        double height = BoundsWithOptions.size.height;
        CGContextSaveGState(a3);
        double v25 = CTFontGetAscent([(SLDHighlightPillRenderer *)self font]);
        CGContextSetFontRenderingStyle();
        if (v23)
        {
          v26 = [(SLDHighlightPillRenderer *)self metricsProvider];
          [v26 margins];
          double v28 = v25 + v27;
        }
        else
        {
          double v55 = SLRoundToScale(height, v12);
          double v28 = SLRoundToScale(v25 + v15 + v55 * -0.5, v12);
        }
        v56 = [(SLDHighlightPillRenderer *)self metricsProvider];
        [v56 pillSize];
        if (v16)
        {
          double PenOffsetForFlush = CTLineGetPenOffsetForFlush(v21, 1.0, v57);
          double v59 = SLRoundToScale(PenOffsetForFlush, v12);

          v60 = [(SLDHighlightPillRenderer *)self metricsProvider];
          [v60 margins];
          double v62 = v59 - v61;
          v63 = [(SLDHighlightPillRenderer *)self metricsProvider];
          [v63 avatarContainerWidth];
          double v65 = v62 - v64;
          v66 = [(SLDHighlightPillRenderer *)self metricsProvider];
          [v66 labelHorizontalMargins];
          double v68 = v65 - v67;
        }
        else
        {
          double v69 = CTLineGetPenOffsetForFlush(v21, 0.0, v57);
          double v70 = SLRoundToScale(v69, v12);

          v60 = [(SLDHighlightPillRenderer *)self metricsProvider];
          [v60 margins];
          double v72 = v70 + v71;
          v63 = [(SLDHighlightPillRenderer *)self metricsProvider];
          [v63 avatarContainerWidth];
          double v74 = v72 + v73;
          v66 = [(SLDHighlightPillRenderer *)self metricsProvider];
          [v66 labelHorizontalMargins];
          double v68 = v74 + v75;
        }

        buf.a = 1.0;
        buf.b = 0.0;
        buf.c = 0.0;
        buf.d = -1.0;
        buf.tx = v68;
        buf.ty = v28;
        CGContextSetTextMatrix(a3, &buf);
        CTLineDraw(v21, a3);
        if (!v23) {
          goto LABEL_27;
        }
        v76 = [(SLDHighlightPillRenderer *)self metricsProvider];
        [v76 pillSize];
        if (v16)
        {
          double v78 = CTLineGetPenOffsetForFlush(v23, 1.0, v77);
          double v79 = SLRoundToScale(v78, v12);

          v80 = [(SLDHighlightPillRenderer *)self metricsProvider];
          [v80 margins];
          double v82 = v79 - v81;
          v83 = [(SLDHighlightPillRenderer *)self metricsProvider];
          [v83 avatarContainerWidth];
          double v85 = v82 - v84;
          v86 = [(SLDHighlightPillRenderer *)self metricsProvider];
          [v86 labelHorizontalMargins];
          double v88 = v85 - v87;
        }
        else
        {
          double v89 = CTLineGetPenOffsetForFlush(v23, 0.0, v77);
          double v90 = SLRoundToScale(v89, v12);

          v80 = [(SLDHighlightPillRenderer *)self metricsProvider];
          [v80 margins];
          double v92 = v90 + v91;
          v83 = [(SLDHighlightPillRenderer *)self metricsProvider];
          [v83 avatarContainerWidth];
          double v94 = v92 + v93;
          v86 = [(SLDHighlightPillRenderer *)self metricsProvider];
          [v86 labelHorizontalMargins];
          double v88 = v94 + v95;
        }

        double v96 = SLRoundToScale(height, v12);
        buf.a = 1.0;
        buf.b = 0.0;
        buf.c = 0.0;
        buf.d = -1.0;
        buf.tx = v88;
        buf.ty = v28 + v96;
        goto LABEL_26;
      }
    }
    else
    {
    }
    v30 = [(SLDHighlightPillRenderer *)self metricsProvider];
    uint64_t v31 = [v30 firstLine];

    if (!v31)
    {
LABEL_27:
      v97 = SLGeneralTelemetryLogHandle();
      v29 = v97;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v97))
      {
        LOWORD(buf.a) = 0;
        _os_signpost_emit_with_name_impl(&dword_19BE17000, v29, OS_SIGNPOST_INTERVAL_END, v8, "DaemonHighlightPillRenderInContext", "", (uint8_t *)&buf, 2u);
      }
      goto LABEL_30;
    }
    v32 = [(SLDHighlightPillRenderer *)self metricsProvider];
    v23 = (const __CTLine *)[v32 firstLine];

    CGContextSaveGState(a3);
    CGRect v101 = CTLineGetBoundsWithOptions(v23, 0);
    double v33 = v101.size.height;
    CGFloat ascent = 0.0;
    CTLineGetTypographicBounds(v23, &ascent, 0, 0);
    CGFloat ascent = SLRoundToScale(ascent, v12);
    double v34 = SLRoundToScale(v33, v12);
    v35 = [(SLDHighlightPillRenderer *)self metricsProvider];
    [v35 pillSize];
    double v37 = CTLineGetPenOffsetForFlush(v23, 0.0, v36);
    double v38 = SLRoundToScale(v37, v12);

    v39 = [(SLDHighlightPillRenderer *)self metricsProvider];
    [v39 margins];
    double v41 = v40;
    double v43 = v42;
    v44 = [(SLDHighlightPillRenderer *)self metricsProvider];
    v45 = v44;
    if (v16)
    {
      [v44 chevronSize];
      double v47 = v43 + v46;
      v48 = [(SLDHighlightPillRenderer *)self metricsProvider];
      [v48 labelHorizontalMargins];
      double v50 = v47 + v49;
    }
    else
    {
      [v44 avatarContainerWidth];
      double v52 = v41 + v51;
      v48 = [(SLDHighlightPillRenderer *)self metricsProvider];
      [v48 labelHorizontalMargins];
      double v50 = v52 + v53;
    }

    double v54 = SLRoundToScale(v15 + v34 * -0.5 + ascent, v12);
    CGContextSetFontRenderingStyle();
    buf.a = 1.0;
    buf.b = 0.0;
    buf.c = 0.0;
    buf.d = -1.0;
    buf.tx = v38 + v50;
    buf.ty = v54;
LABEL_26:
    CGContextSetTextMatrix(a3, &buf);
    CTLineDraw(v23, a3);
    CGContextRestoreGState(a3);
    goto LABEL_27;
  }
  v29 = SLDaemonLogHandle();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
    -[SLDHighlightPillRenderer renderInContext:]((uint64_t)self, v29);
  }
LABEL_30:
}

- (void)_renderAvatarsInContext:(CGContext *)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  v4 = [(SLDHighlightPillRenderer *)self metricsProvider];
  v5 = [(SLDHighlightPillRenderer *)self slotStyle];
  double v6 = (double)[v5 displayScale];

  [v4 avatarDiameter];
  double v8 = v7;
  [v4 overlappedAvatarKnockoutBorderWidth];
  double v10 = v9;
  [v4 pillSize];
  double v12 = v11 * 0.5;
  [v4 avatarDiameter];
  double v14 = SLRoundToScale(v12 - v13 * 0.5, v6);
  [v4 overlappedAvatarVisibleWidth];
  double v16 = v15;
  v17 = [(SLDHighlightPillRenderer *)self slotStyle];
  uint64_t v18 = [v17 layoutDirection];

  [v4 margins];
  double v20 = v19;
  [v4 avatarContainerWidth];
  double v22 = v20 + v21;
  if (v18 == 1) {
    double v23 = 1.0;
  }
  else {
    double v23 = -1.0;
  }
  if (v18 == 1)
  {
    [v4 pillSize];
    double v25 = v24 - v22;
  }
  else
  {
    double v25 = v22 - v8;
  }
  unint64_t v26 = [v4 imageCount];
  double v27 = [(SLDHighlightPillRenderer *)self slotTag];
  double v28 = [v27 pinnedSender];
  if (v28) {
    BOOL v29 = v26 > 1;
  }
  else {
    BOOL v29 = 0;
  }
  uint64_t v30 = v29;
  unint64_t v82 = v26;
  unint64_t v31 = v26 - v30;

  v32 = [(SLDHighlightPillRenderer *)self slotTag];
  double v33 = [v32 sendersToDisplay];

  if ([v33 count] > v31)
  {
    uint64_t v34 = objc_msgSend(v33, "subarrayWithRange:", 0, v31);

    double v33 = (void *)v34;
  }
  v35 = [(SLDHighlightPillRenderer *)self slotTag];
  uint64_t v36 = [v35 groupPhotoPath];
  double v84 = v33;
  if (v36)
  {
    double v37 = (void *)v36;
    double v38 = [(SLDHighlightPillRenderer *)self slotTag];
    v39 = [v38 groupID];

    if (v39)
    {
      double v40 = [(SLDHighlightPillRenderer *)self slotTag];
      double v41 = [v40 groupID];
      double v42 = SLDCreateGroupPhotoImageWithGroupID(v41);

      if (v42) {
        goto LABEL_21;
      }
      double v43 = SLDaemonLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)CGAffineTransform buf = 138412290;
        double v93 = self;
        _os_log_impl(&dword_19BE17000, v43, OS_LOG_TYPE_INFO, "[%@] SLDHighlightPillRenderer Failed to get avatar image from IMSPI. Trying with groupPhotoFileURL.", buf, 0xCu);
      }

      v44 = (void *)MEMORY[0x1E4F1C9B8];
      v45 = [(SLDHighlightPillRenderer *)self slotTag];
      double v46 = [v45 groupPhotoPath];
      double v47 = [v44 dataWithContentsOfURL:v46 options:1 error:0];

      double v42 = [(SLDHighlightPillRenderer *)self _newAvatarImageFromImageData:v47];
      if (v42)
      {
LABEL_21:
        -[SLDHighlightPillRenderer _drawAvatarImage:inContext:atRect:](self, "_drawAvatarImage:inContext:atRect:", v42, a3, v25, v14, v8, v8);
        CGImageRelease(v42);
      }
      else
      {
        double v77 = [(SLDHighlightPillRenderer *)self slotStyle];
        double v78 = [(SLDHighlightPillRenderer *)self metricsProvider];
        [v78 pillSize];
        SLDRenderContactSilhouetteInContextAtRect(v77, a3, 1, v79, v25, v14, v8, v8);
      }
      double v25 = v25 + v16 * v23;
      unint64_t v48 = 1;
      char v49 = 1;
      goto LABEL_44;
    }
  }
  else
  {
  }
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = [v33 reverseObjectEnumerator];
  uint64_t v50 = [obj countByEnumeratingWithState:&v87 objects:v91 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    v80 = v4;
    unint64_t v81 = v31;
    unint64_t v48 = 0;
    char v49 = 0;
    uint64_t v52 = *(void *)v88;
    while (2)
    {
      uint64_t v53 = 0;
      unint64_t v83 = v48;
      if (v81 >= v48) {
        unint64_t v54 = v81 - v48;
      }
      else {
        unint64_t v54 = 0;
      }
      do
      {
        if (*(void *)v88 != v52) {
          objc_enumerationMutation(obj);
        }
        if (v54 == v53)
        {
          unint64_t v48 = v83 + v53;
          goto LABEL_41;
        }
        double v55 = *(void **)(*((void *)&v87 + 1) + 8 * v53);
        v56 = [v55 thumbnailImageData];
        double v57 = [(SLDHighlightPillRenderer *)self _newAvatarImageFromImageData:v56];
        if (v49) {
          [(SLDHighlightPillRenderer *)self _drawKnockoutBorderWidth:a3 atXPosition:v10 aroundImageWithYPosition:v25 - v10 diameter:v14 inContext:v8];
        }
        if (v57)
        {
          -[SLDHighlightPillRenderer _drawAvatarImage:inContext:atRect:](self, "_drawAvatarImage:inContext:atRect:", v57, a3, v25, v14, v8, v8);
          CGImageRelease(v57);
        }
        else
        {
          v58 = [v55 contact];
          double v59 = [(SLDHighlightPillRenderer *)self slotStyle];
          v60 = [(SLDHighlightPillRenderer *)self metricsProvider];
          [v60 pillSize];
          SLDRenderContactMonogramInContextAtRect(v59, v58, a3, 1, v61, v25, v14, v8, v8);
        }
        double v25 = v25 + v16 * v23;

        ++v53;
        char v49 = 1;
      }
      while (v51 != v53);
      uint64_t v51 = [obj countByEnumeratingWithState:&v87 objects:v91 count:16];
      unint64_t v48 = v83 + v53;
      if (v51) {
        continue;
      }
      break;
    }
LABEL_41:
    v4 = v80;
  }
  else
  {
    unint64_t v48 = 0;
    char v49 = 0;
  }

LABEL_44:
  double v62 = [(SLDHighlightPillRenderer *)self metricsProvider];
  if (![v62 shouldDisplayPin])
  {
LABEL_50:

    goto LABEL_51;
  }
  v63 = [(SLDHighlightPillRenderer *)self slotTag];
  double v64 = [v63 pinnedSender];

  if (v64 && v48 < v82)
  {
    if (v49) {
      [(SLDHighlightPillRenderer *)self _drawKnockoutBorderWidth:a3 atXPosition:v10 aroundImageWithYPosition:v25 - v10 diameter:v14 inContext:v8];
    }
    double v65 = [(SLDHighlightPillRenderer *)self slotStyle];
    v66 = SLDCreateColorNamed(v65, @"HighlightStarColor");

    CGContextSetFillColorWithColor(a3, v66);
    CGColorRelease(v66);
    v95.origin.x = v25;
    v95.origin.y = v14;
    v95.size.width = v8;
    v95.size.double height = v8;
    CGContextFillEllipseInRect(a3, v95);
    double v67 = SLRoundToScale(v8 * 0.68, v6);
    double v68 = [(SLDHighlightPillRenderer *)self slotStyle];
    double v62 = SLDSystemVectorGlyphWithSlotStyle(v68, @"pin.fill", 1, 4, v67);

    [v62 contentBounds];
    double v70 = v69;
    [v62 contentBounds];
    double v72 = SLRectCenteredInRectToScale(v25, v14, v70, v71, v25, v14, v8, v8, v6);
    double v74 = v73;
    id v75 = objc_alloc(MEMORY[0x1E4FB34A0]);
    v76 = (void *)[v75 initWithVectorGlyph:v62 tintColor:CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E4F1DCB8])];
    CGContextSaveGState(a3);
    objc_msgSend(v76, "drawInContext:atPoint:", a3, v72, v74);
    CGContextRestoreGState(a3);

    goto LABEL_50;
  }
LABEL_51:
}

- (CGImage)_newAvatarImageFromImageData:(id)a3
{
  CFDataRef v3 = (const __CFData *)a3;
  CFDataRef v4 = v3;
  if (!v3) {
    goto LABEL_5;
  }
  v5 = CGDataProviderCreateWithCFData(v3);
  CGImageRef ImageAtIndex = v5;
  if (v5)
  {
    double v7 = CGImageSourceCreateWithDataProvider(v5, 0);
    CFRelease(ImageAtIndex);
    if (v7)
    {
      CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, 0);
      CFRelease(v7);
      goto LABEL_6;
    }
LABEL_5:
    CGImageRef ImageAtIndex = 0;
  }
LABEL_6:

  return ImageAtIndex;
}

- (void)_drawAvatarImage:(CGImage *)a3 inContext:(CGContext *)a4 atRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGImageRetain(a3);
  CGContextSaveGState(a4);
  double v12 = [(SLDHighlightPillRenderer *)self metricsProvider];
  [v12 pillSize];
  CGContextTranslateCTM(a4, 0.0, v13);

  CGContextScaleCTM(a4, 1.0, -1.0);
  CGContextBeginPath(a4);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGContextAddEllipseInRect(a4, v15);
  CGContextClip(a4);
  CGContextClosePath(a4);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGContextDrawImage(a4, v16, a3);
  CGContextRestoreGState(a4);
  CGImageRelease(a3);
}

- (void)_drawKnockoutBorderWidth:(double)a3 atXPosition:(double)a4 aroundImageWithYPosition:(double)a5 diameter:(double)a6 inContext:(CGContext *)a7
{
  CGContextSaveGState(a7);
  ConstantColor = CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E4F1DB68]);
  CGContextSetFillColorWithColor(a7, ConstantColor);
  CGContextSetBlendMode(a7, kCGBlendModeClear);
  CGContextBeginPath(a7);
  v14.origin.CGFloat x = a4;
  v14.origin.CGFloat y = a5 - a3;
  v14.size.CGFloat width = a6 + a3 * 2.0;
  v14.size.CGFloat height = v14.size.width;
  CGContextAddEllipseInRect(a7, v14);
  CGContextDrawPath(a7, kCGPathFill);
  CGContextRestoreGState(a7);
}

- (void)dealloc
{
  CFRelease(self->_font);
  v3.receiver = self;
  v3.super_class = (Class)SLDHighlightPillRenderer;
  [(SLDHighlightPillRenderer *)&v3 dealloc];
}

- (UISSlotStyle)slotStyle
{
  return self->_slotStyle;
}

- (void)setSlotStyle:(id)a3
{
}

- (SLDHighlightPillSlotTag)slotTag
{
  return self->_slotTag;
}

- (void)setSlotTag:(id)a3
{
}

- (SLHighlightPillMetrics)metricsProvider
{
  return self->_metricsProvider;
}

- (void)setMetricsProvider:(id)a3
{
}

- (__CTFont)font
{
  return self->_font;
}

- (void)setFont:(__CTFont *)a3
{
  self->_font = a3;
}

- (NSArray)contactImages
{
  return self->_contactImages;
}

- (void)setContactImages:(id)a3
{
}

- (BOOL)isRTL
{
  return self->_RTL;
}

- (void)setRTL:(BOOL)a3
{
  self->_RTL = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactImages, 0);
  objc_storeStrong((id *)&self->_metricsProvider, 0);
  objc_storeStrong((id *)&self->_slotTag, 0);
  objc_storeStrong((id *)&self->_slotStyle, 0);
}

- (void)renderInContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "[SLDHighlightPillRenderer: %p] Invalid drawing metrics. This could mean the client has provided an invalid size to render in. No contents will be drawn.", (uint8_t *)&v2, 0xCu);
}

@end
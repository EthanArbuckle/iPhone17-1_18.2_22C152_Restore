@interface SLDHighlightDisambiguationPillRenderer
- (BOOL)isRTL;
- (NSArray)contactImages;
- (SLDHighlightDisambiguationPillRenderer)initWithStyle:(id)a3 tag:(id)a4;
- (SLDHighlightDisambiguationPillSlotTag)slotTag;
- (SLHighlightDisambiguationPillMetrics)metricsProvider;
- (UISSlotStyle)slotStyle;
- (void)_renderAvatarInContext:(CGContext *)a3;
- (void)renderInContext:(CGContext *)a3;
- (void)setContactImages:(id)a3;
- (void)setMetricsProvider:(id)a3;
- (void)setRTL:(BOOL)a3;
- (void)setSlotStyle:(id)a3;
- (void)setSlotTag:(id)a3;
@end

@implementation SLDHighlightDisambiguationPillRenderer

- (SLDHighlightDisambiguationPillRenderer)initWithStyle:(id)a3 tag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLDHighlightDisambiguationPillRenderer;
  v9 = [(SLDHighlightDisambiguationPillRenderer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_slotStyle, a3);
    objc_storeStrong((id *)&v10->_slotTag, a4);
    v11 = [[SLHighlightDisambiguationPillMetrics alloc] initWithSlotStyle:v7 tag:v8];
    metricsProvider = v10->_metricsProvider;
    v10->_metricsProvider = v11;

    v10->_RTL = [v7 layoutDirection] == 1;
  }

  return v10;
}

- (void)renderInContext:(CGContext *)a3
{
  v5 = SLGeneralTelemetryLogHandle();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = SLGeneralTelemetryLogHandle();
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_19BE17000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "DaemonHighlightDisambiguationPillRenderInContext", "", (uint8_t *)&buf, 2u);
  }

  v9 = [(SLDHighlightDisambiguationPillRenderer *)self slotStyle];
  double v10 = (double)[v9 displayScale];

  v11 = [(SLDHighlightDisambiguationPillRenderer *)self metricsProvider];
  [v11 pillSize];
  double v13 = SLRoundToScale(v12 * 0.5, v10);
  BOOL v14 = [(SLDHighlightDisambiguationPillRenderer *)self isRTL];
  [(SLDHighlightDisambiguationPillRenderer *)self _renderAvatarInContext:a3];
  int v15 = [v11 useSingleLineLayout];
  v16 = [v11 firstLineAttributedString];
  if (v15)
  {
    [v11 firstLineSize];
    v17 = (const __CTLine *)objc_msgSend(v11, "lineFrom:maxWidth:", v16);

    CGContextSaveGState(a3);
    CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v17, 0);
    double height = BoundsWithOptions.size.height;
    CGFloat ascent = 0.0;
    objc_msgSend(v11, "pillSize", CTLineGetTypographicBounds(v17, &ascent, 0, 0));
    if (v14)
    {
      double PenOffsetForFlush = CTLineGetPenOffsetForFlush(v17, 1.0, v19);
      double v21 = SLRoundToScale(PenOffsetForFlush, v10);
      [v11 margins];
      double v23 = v21 - v22;
      [v11 avatarDiameter];
      double v25 = v23 - v24;
      [v11 labelHorizontalMargins];
      double v27 = v25 - v26;
    }
    else
    {
      double v51 = CTLineGetPenOffsetForFlush(v17, 0.0, v19);
      double v52 = SLRoundToScale(v51, v10);
      [v11 margins];
      double v54 = v53;
      [v11 avatarDiameter];
      double v56 = v54 + v55;
      [v11 labelHorizontalMargins];
      double v27 = v52 + v56 + v57;
    }
    CGFloat v58 = v13 + height * -0.5 + ascent;
    CGContextSetFontRenderingStyle();
    buf.a = 1.0;
    buf.b = 0.0;
    buf.c = 0.0;
    buf.d = -1.0;
    buf.tx = v27;
    buf.ty = v58;
    CGContextSetTextMatrix(a3, &buf);
    CTLineDraw(v17, a3);
    CGContextRestoreGState(a3);
  }
  else
  {
    v28 = [v11 secondLineAttributedString];
    [v11 firstLineSize];
    v29 = (const __CTLine *)objc_msgSend(v11, "lineFrom:maxWidth:", v16);
    [v11 secondLineSize];
    v30 = (const __CTLine *)objc_msgSend(v11, "lineFrom:maxWidth:", v28);
    CGRect v98 = CTLineGetBoundsWithOptions(v29, 0);
    double v31 = v98.size.height;
    CGContextSaveGState(a3);
    double v32 = CTFontGetAscent((CTFontRef)[v11 firstLineFont]);
    if (v14)
    {
      [v11 pillSize];
      double v34 = CTLineGetPenOffsetForFlush(v29, 1.0, v33);
      double v35 = SLRoundToScale(v34, v10);
      [v11 pillSize];
      double v37 = CTLineGetPenOffsetForFlush(v30, 1.0, v36);
      double v38 = SLRoundToScale(v37, v10);
      [v11 margins];
      double v40 = v35 - v39;
      [v11 avatarDiameter];
      double v42 = v40 - v41;
      [v11 labelHorizontalMargins];
      double v44 = v42 - v43;
      [v11 margins];
      double v46 = v38 - v45;
      [v11 avatarDiameter];
      double v48 = v46 - v47;
      [v11 labelHorizontalMargins];
      double v50 = v48 - v49;
    }
    else
    {
      [v11 margins];
      double v60 = v59;
      [v11 avatarDiameter];
      double v62 = v60 + v61;
      [v11 labelHorizontalMargins];
      double v64 = v62 + v63;
      [v11 pillSize];
      double v44 = v64 + CTLineGetPenOffsetForFlush(v29, 0.0, v65);
      [v11 margins];
      double v67 = v66;
      [v11 avatarDiameter];
      double v69 = v67 + v68;
      [v11 labelHorizontalMargins];
      double v71 = v69 + v70;
      [v11 pillSize];
      double v50 = v71 + CTLineGetPenOffsetForFlush(v30, 0.0, v72);
    }
    [v11 margins];
    CGFloat v74 = v32 + v73;
    double v75 = v31 + v74;
    CGContextSetFontRenderingStyle();
    buf.a = 1.0;
    buf.b = 0.0;
    buf.c = 0.0;
    buf.d = -1.0;
    buf.tx = v44;
    buf.ty = v74;
    CGContextSetTextMatrix(a3, &buf);
    CTLineDraw(v29, a3);
    buf.a = 1.0;
    buf.b = 0.0;
    buf.c = 0.0;
    buf.d = -1.0;
    buf.tx = v50;
    buf.ty = v31 + v74;
    CGContextSetTextMatrix(a3, &buf);
    CTLineDraw(v30, a3);
    CGContextRestoreGState(a3);
    if ([v11 useChevron])
    {
      uint64_t v76 = [v11 chevronImage];
      if (v76)
      {
        v77 = (CGImage *)v76;
        CGContextSaveGState(a3);
        [v11 chevronSize];
        double v79 = v78;
        CGFloat v81 = v80;
        [v11 margins];
        double v83 = v82;
        [v11 avatarDiameter];
        double v85 = v83 + v84;
        [v11 labelHorizontalMargins];
        double v87 = v85 + v86;
        [v11 secondLineSize];
        double v89 = v87 + v88;
        [v11 chevronLeadingMargin];
        double v91 = v90 + v89;
        if (v14)
        {
          [v11 pillSize];
          double v91 = v92 - v91 - v79;
        }
        buf.a = 1.0;
        buf.b = 0.0;
        buf.c = 0.0;
        buf.d = -1.0;
        buf.tx = v91;
        buf.ty = v75;
        CGContextConcatCTM(a3, &buf);
        SLDRenderTintedImageInContext(a3, v77, (CGColor *)[v11 secondLineColor], 0.0, 0.0, v79, v81);
        CGContextRestoreGState(a3);
      }
    }
  }
  v93 = SLGeneralTelemetryLogHandle();
  v94 = v93;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v93))
  {
    LOWORD(buf.a) = 0;
    _os_signpost_emit_with_name_impl(&dword_19BE17000, v94, OS_SIGNPOST_INTERVAL_END, v6, "DaemonHighlightDisambiguationPillRenderInContext", "", (uint8_t *)&buf, 2u);
  }
}

- (void)_renderAvatarInContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  id v31 = [(SLDHighlightDisambiguationPillRenderer *)self metricsProvider];
  [v31 avatarDiameter];
  CGFloat v6 = v5;
  [v31 margins];
  double v8 = v7;
  [v31 pillSize];
  double v10 = v9 * 0.5;
  [v31 avatarDiameter];
  double v12 = v10 - v11 * 0.5;
  double v13 = [(SLDHighlightDisambiguationPillRenderer *)self slotStyle];
  double v14 = SLRoundToScale(v12, (double)[v13 displayScale]);

  if ([(SLDHighlightDisambiguationPillRenderer *)self isRTL])
  {
    [v31 pillSize];
    double v16 = v15 - v8;
    [v31 avatarDiameter];
    double v8 = v16 - v17;
  }
  v18 = [(SLDHighlightDisambiguationPillRenderer *)self slotTag];
  double v19 = [v18 sender];
  CFDataRef v20 = [v19 thumbnailImageData];

  if (v20
    && (double v21 = CGDataProviderCreateWithCFData(v20)) != 0
    && (double v22 = v21, v23 = CGImageSourceCreateWithDataProvider(v21, 0), CFRelease(v22), v23)
    && (ImageAtIndex = CGImageSourceCreateImageAtIndex(v23, 0, 0), CFRelease(v23), ImageAtIndex))
  {
    [v31 pillSize];
    CGContextTranslateCTM(a3, 0.0, v25);
    CGContextScaleCTM(a3, 1.0, -1.0);
    CGContextBeginPath(a3);
    v33.origin.x = v8;
    v33.origin.y = v14;
    v33.size.width = v6;
    v33.size.double height = v6;
    CGContextAddEllipseInRect(a3, v33);
    CGContextClip(a3);
    CGContextClosePath(a3);
    v34.origin.x = v8;
    v34.origin.y = v14;
    v34.size.width = v6;
    v34.size.double height = v6;
    CGContextDrawImage(a3, v34, ImageAtIndex);
    CGImageRelease(ImageAtIndex);
  }
  else
  {
    double v26 = [(SLDHighlightDisambiguationPillRenderer *)self slotTag];
    double v27 = [v26 sender];
    v28 = [v27 contact];

    v29 = [(SLDHighlightDisambiguationPillRenderer *)self slotStyle];
    [v31 pillSize];
    SLDRenderContactMonogramInContextAtRect(v29, v28, a3, 1, v30, v8, v14, v6, v6);
  }
  CGContextRestoreGState(a3);
}

- (UISSlotStyle)slotStyle
{
  return self->_slotStyle;
}

- (void)setSlotStyle:(id)a3
{
}

- (SLDHighlightDisambiguationPillSlotTag)slotTag
{
  return self->_slotTag;
}

- (void)setSlotTag:(id)a3
{
}

- (SLHighlightDisambiguationPillMetrics)metricsProvider
{
  return self->_metricsProvider;
}

- (void)setMetricsProvider:(id)a3
{
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

@end
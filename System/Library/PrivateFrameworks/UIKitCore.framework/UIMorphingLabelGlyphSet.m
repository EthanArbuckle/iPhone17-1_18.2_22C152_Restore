@interface UIMorphingLabelGlyphSet
- (CGPoint)lineOrigin;
- (CGRect)boundingRectForGlyphsInRange:(_NSRange)a3;
- (NSArray)glyphViews;
- (NSAttributedString)attributedString;
- (UIMorphingLabelGlyphSet)initWithLabel:(id)a3 attributedString:(id)a4;
- (const)glyphFrames;
- (const)glyphPositions;
- (const)glyphs;
- (double)lineWidth;
- (unint64_t)glyphCount;
- (void)buildGlyphViews;
- (void)dealloc;
- (void)placeGlyphs;
- (void)removeGlyphs;
@end

@implementation UIMorphingLabelGlyphSet

- (UIMorphingLabelGlyphSet)initWithLabel:(id)a3 attributedString:(id)a4
{
  id v6 = a3;
  CFAttributedStringRef v7 = (const __CFAttributedString *)a4;
  v22.receiver = self;
  v22.super_class = (Class)UIMorphingLabelGlyphSet;
  v8 = [(UIMorphingLabelGlyphSet *)&v22 init];
  v9 = v8;
  if (v8)
  {
    id v10 = objc_storeWeak((id *)&v8->_label, v6);
    [v6 bounds];
    double v12 = v11;

    v13 = +[_NSAttributedStringIntentResolver attributedStringByResolvingString:v7];
    uint64_t v14 = [v13 copy];
    attributedString = v9->_attributedString;
    v9->_attributedString = (NSAttributedString *)v14;

    v9->_line = CTLineCreateWithAttributedString(v7);
    if ([(__CFAttributedString *)v7 length])
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
      v17 = [(__CFAttributedString *)v7 attributesAtIndex:[(__CFAttributedString *)v7 length] - 1 effectiveRange:0];
      CFAttributedStringRef v18 = (const __CFAttributedString *)[v16 initWithString:@"…" attributes:v17];

      v19 = CTLineCreateWithAttributedString(v18);
      CTLineRef TruncatedLine = CTLineCreateTruncatedLine(v9->_line, v12, kCTLineTruncationEnd, v19);
      CFRelease(v19);
      if (TruncatedLine)
      {
        CFRelease(v9->_line);
        v9->_line = TruncatedLine;
      }
    }
    [(UIMorphingLabelGlyphSet *)v9 buildGlyphViews];
  }

  return v9;
}

- (void)dealloc
{
  line = self->_line;
  if (line) {
    CFRelease(line);
  }
  glyphs = self->_glyphs;
  if (glyphs) {
    free(glyphs);
  }
  glyphFrames = self->_glyphFrames;
  if (glyphFrames) {
    free(glyphFrames);
  }
  glyphPositions = self->_glyphPositions;
  if (glyphPositions) {
    free(glyphPositions);
  }
  v7.receiver = self;
  v7.super_class = (Class)UIMorphingLabelGlyphSet;
  [(UIMorphingLabelGlyphSet *)&v7 dealloc];
}

- (void)buildGlyphViews
{
  uint64_t v143 = *MEMORY[0x1E4F143B8];
  CFIndex GlyphCount = CTLineGetGlyphCount(self->_line);
  self->_glyphCFIndex Count = GlyphCount;
  if (GlyphCount)
  {
    self->_glyphs = (unsigned __int16 *)malloc_type_malloc(2 * GlyphCount, 0x1000040BDFB0063uLL);
    self->_glyphFrames = (CGRect *)malloc_type_malloc(32 * self->_glyphCount, 0x1000040E0EAB150uLL);
    v4 = (CGPoint *)malloc_type_malloc(16 * self->_glyphCount, 0x1000040451B5BE8uLL);
    self->_glyphPositions = v4;
    MEMORY[0x1F4188790](v4);
    id v6 = (double *)(&v124 - 2 * v5);
    MEMORY[0x1F4188790](v7);
    v9 = &v124 - v8;
    MEMORY[0x1F4188790](v10);
    v132 = (char *)&v124 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    p_label = (id *)&self->_label;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_label);
    v13 = [WeakRetained window];
    uint64_t v14 = [v13 screen];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = +[UIScreen mainScreen];
    }
    v21 = v16;
    id v125 = v16;

    [v21 scale];
    double v23 = v22;
    CFArrayRef GlyphRuns = CTLineGetGlyphRuns(self->_line);
    CFIndex Count = CFArrayGetCount(GlyphRuns);
    v26 = (CGFloat *)MEMORY[0x1E4F1DB28];
    v126 = &v124;
    CFArrayRef v127 = GlyphRuns;
    if (!Count) {
      goto LABEL_21;
    }
    uint64_t v27 = 0;
    unint64_t v28 = 0;
    unint64_t v29 = 0;
    do
    {
      double v130 = *(double *)&v29;
      unint64_t v131 = v28;
      ValueAtIndedouble x = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v29);
      CFIndex v31 = CTRunGetGlyphCount(ValueAtIndex);
      Font = (const __CTFont *)CTRunGetFont();
      CTFontSymbolicTraits SymbolicTraits = CTFontGetSymbolicTraits(Font);
      v144.location = 0;
      v144.length = v31;
      CTRunGetGlyphs(ValueAtIndex, v144, &self->_glyphs[v27]);
      CTFontGetBoundingRectsForGlyphs(Font, kCTFontOrientationDefault, &self->_glyphs[v27], &self->_glyphFrames[v27], v31);
      v145.location = 0;
      v145.length = v31;
      CTRunGetPositions(ValueAtIndex, v145, &self->_glyphPositions[v27]);
      if (v31)
      {
        int v34 = (SymbolicTraits >> 13) & 1;
        *(void *)&long long v128 = v31 + v27;
        glyphPositions = self->_glyphPositions;
        unint64_t v36 = 32 * v27;
        *(void *)&long long v129 = v31;
        uint64_t v37 = (16 * v27) | 8;
        do
        {
          CGRect v148 = CGRectOffset(self->_glyphFrames[v36 / 0x20], *(CGFloat *)((char *)glyphPositions + v37 - 8), *(CGFloat *)((char *)&glyphPositions->x + v37));
          v149.origin.double x = UIRectIntegralWithScale(v148.origin.x, v148.origin.y, v148.size.width, v148.size.height, v23);
          self->_glyphFrames[v36 / 0x20] = CGRectInset(v149, -2.0 / v23, -1.0 / v23);
          if (v27) {
            CGRectGetMaxX(*(CGRect *)&v6[v36 / 8 - 4]);
          }
          id v38 = objc_loadWeakRetained(p_label);
          UICeilToViewScale(v38);
          CGFloat v40 = v39;

          *(CGRect *)&v6[v36 / 8] = CGRectOffset(self->_glyphFrames[v36 / 0x20], v40, 0.0);
          v41 = (double *)((char *)v9 + v37);
          glyphPositions = self->_glyphPositions;
          uint64_t v42 = *(void *)((char *)&glyphPositions->x + v37);
          CGFloat v43 = v40 + *(double *)((char *)glyphPositions + v37 - 8);
          v132[v27] = v34;
          *(v41 - 1) = v43;
          *(void *)v41 = v42;
          ++v27;
          v36 += 32;
          v37 += 16;
          --v31;
        }
        while (v31);
        unint64_t v28 = v129 + v131;
        CFArrayRef GlyphRuns = v127;
        uint64_t v27 = v128;
      }
      else
      {
        unint64_t v28 = v131;
      }
      unint64_t v29 = *(void *)&v130 + 1;
    }
    while (v29 < CFArrayGetCount(GlyphRuns));
    v26 = (CGFloat *)MEMORY[0x1E4F1DB28];
    if (v28)
    {
      CGFloat v45 = *v6;
      double v44 = v6[1];
      CGFloat v47 = v6[2];
      double v46 = v6[3];
      if (self->_glyphCount >= 2)
      {
        v48 = (char *)(v6 + 7);
        unint64_t v49 = 1;
        do
        {
          CGFloat v50 = v45;
          CGFloat v51 = v47;
          *(CGRect *)(&v44 - 1) = CGRectUnion(*(CGRect *)(&v44 - 1), *(CGRect *)(v48 - 24));
          CGFloat v45 = v52;
          CGFloat v47 = v53;
          ++v49;
          v48 += 32;
        }
        while (v49 < self->_glyphCount);
      }
    }
    else
    {
LABEL_21:
      unint64_t v28 = 0;
      CGFloat v45 = *v26;
      double v44 = v26[1];
      CGFloat v47 = v26[2];
      double v46 = v26[3];
    }
    unint64_t v131 = v28;
    CGFloat v54 = 1.0 / v23 + v46;
    CGFloat v55 = v44 - 1.0 / v23;
    CGAffineTransformMakeScale(&v142, 1.0, -1.0);
    v150.origin.double x = v45;
    v150.origin.double y = v55;
    v150.size.double width = v47;
    v150.size.double height = v54;
    CGRect v151 = CGRectApplyAffineTransform(v150, &v142);
    *(_OWORD *)&v151.size.double height = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v141.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v141.c = *(_OWORD *)&v151.size.height;
    *(_OWORD *)&v141.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v128 = *(_OWORD *)&v151.size.height;
    long long v129 = *(_OWORD *)&v141.a;
    *(_OWORD *)&v140.a = *(_OWORD *)&v141.a;
    *(_OWORD *)&v140.c = *(_OWORD *)&v151.size.height;
    long long v124 = *(_OWORD *)&v141.tx;
    *(_OWORD *)&v140.tdouble x = *(_OWORD *)&v141.tx;
    CGAffineTransformTranslate(&v141, &v140, -v151.origin.x, -v151.origin.y);
    CGAffineTransform v139 = v141;
    CGAffineTransformScale(&v140, &v139, 1.0, -1.0);
    CGAffineTransform v141 = v140;
    _UIGraphicsBeginImageContextWithOptions(0, 0, v47, v54, v23);
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      v57 = 0;
    }
    else {
      v57 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    CGContextSaveGState(v57);
    CGAffineTransform v140 = v141;
    CGContextConcatCTM(v57, &v140);
    v58 = +[UIColor whiteColor];
    [v58 set];

    CFArrayRef v59 = v127;
    if (CFArrayGetCount(v127))
    {
      uint64_t v60 = 0;
      unint64_t v61 = 0;
      do
      {
        v62 = (const __CTRun *)CFArrayGetValueAtIndex(v59, v61);
        v63 = (const __CTFont *)CTRunGetFont();
        size_t v64 = CTRunGetGlyphCount(v62);
        CTFontDrawGlyphs(v63, &self->_glyphs[v60], (const CGPoint *)&v9[v60], v64, v57);
        v60 += v64;
        ++v61;
      }
      while (v61 < CFArrayGetCount(v59));
    }
    CGContextRestoreGState(v57);
    v65 = _UIGraphicsGetImageFromCurrentImageContext(0);
    UIGraphicsEndImageContext();
    v66 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    glyphViews = self->_glyphViews;
    self->_glyphViews = v66;

    unint64_t v68 = v131;
    if (self->_glyphCount)
    {
      unint64_t v69 = 0;
      double v70 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v130 = *MEMORY[0x1E4F1DB28];
      v71 = v6 + 2;
      double v73 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v72 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      do
      {
        double height = v72;
        double width = v73;
        double y = v70;
        double x = v130;
        if (v68 > v69)
        {
          CGRect v152 = *(CGRect *)(v71 - 1);
          CGAffineTransform v140 = v141;
          CGRect v153 = CGRectApplyAffineTransform(v152, &v140);
          double x = v153.origin.x;
          double y = v153.origin.y;
          double width = v153.size.width;
          double height = v153.size.height;
        }
        CGAffineTransformMakeScale(&v138, v23, v23);
        v154.origin.double x = x;
        v154.origin.double y = y;
        v154.size.double width = width;
        v154.size.double height = height;
        CGRect v155 = CGRectApplyAffineTransform(v154, &v138);
        UIRectIntegralWithScale(v155.origin.x, v155.origin.y, v155.size.width, v155.size.height, 1.0);
        v78 = objc_alloc_init(UIMorphingLabelImage);
        [(UIMorphingLabelImage *)v78 setImage:v65];
        -[UIMorphingLabelImage setContentsRect:](v78, "setContentsRect:", x, y, width, height);
        if (v68 > v69)
        {
          id v79 = objc_loadWeakRetained(p_label);
          v80 = [v79 glyphViewWithImage:v78 isColorGlyph:v132[v69]];

          unint64_t v68 = v131;
          if (v80)
          {
            [(NSMutableArray *)self->_glyphViews addObject:v80];
          }
        }

        ++v69;
        v71 += 2;
      }
      while (v69 < self->_glyphCount);
    }
    v81 = p_label;
    id v82 = objc_loadWeakRetained(p_label);
    [v82 bounds];
    double v84 = v83;
    double v86 = v85;

    line = self->_line;
    id v88 = objc_loadWeakRetained(v81);
    [v88 flushAmount];
    self->_lineOrigin.double x = CTLineGetPenOffsetForFlush(line, v89, v84);

    CGFloat v136 = 0.0;
    CGFloat v137 = 0.0;
    CGFloat v135 = 0.0;
    self->_lineWidth = CTLineGetTypographicBounds(self->_line, &v137, &v136, &v135);
    double v90 = self->_lineWidth - CTLineGetTrailingWhitespaceWidth(self->_line);
    self->_lineOrigin.double y = v137 + (v86 - (v137 + v136)) * 0.5;
    self->_lineWidth = v90;
    id v91 = objc_loadWeakRetained(v81);
    UIRoundToViewScale(v91);
    self->_lineOrigin.double x = v92;

    id v93 = objc_loadWeakRetained(v81);
    UIRoundToViewScale(v93);
    self->_lineOrigin.double y = v94;

    *(_OWORD *)&v140.a = v129;
    *(_OWORD *)&v140.c = v128;
    *(_OWORD *)&v140.tdouble x = v124;
    CGFloat v95 = self->_lineOrigin.x;
    CGFloat v96 = self->_lineOrigin.y;
    *(_OWORD *)&v139.a = v129;
    *(_OWORD *)&v139.c = v128;
    *(_OWORD *)&v139.tdouble x = v124;
    CGAffineTransformTranslate(&v140, &v139, v95, v96);
    CGAffineTransform v134 = v140;
    CGAffineTransformScale(&v139, &v134, 1.0, -1.0);
    CGAffineTransform v140 = v139;
    unint64_t v97 = v68;
    v98 = (CGRect *)MEMORY[0x1E4F1DB28];
    if (self->_glyphCount)
    {
      uint64_t v99 = 0;
      unint64_t v100 = 0;
      uint64_t v101 = 8;
      do
      {
        p_double height = &v98->size.height;
        p_double width = &v98->size.width;
        p_double y = &v98->origin.y;
        v105 = &self->_glyphFrames[v99];
        if (v97 > v100) {
          v106 = &self->_glyphFrames[v99];
        }
        else {
          v106 = v98;
        }
        if (v97 > v100)
        {
          p_double y = &v105->origin.y;
          p_double width = &v105->size.width;
          p_double height = &v105->size.height;
        }
        v156.size.double height = *p_height;
        v156.size.double width = *p_width;
        v156.origin.double y = *p_y;
        v156.origin.double x = v106->origin.x;
        CGAffineTransform v139 = v140;
        CGRect v157 = CGRectApplyAffineTransform(v156, &v139);
        CGFloat v107 = v157.origin.x;
        CGFloat v108 = v157.origin.y;
        CGFloat v109 = v157.size.width;
        CGFloat v110 = v157.size.height;
        CGRect *v105 = v157;
        v111 = [(NSMutableArray *)self->_glyphViews objectAtIndexedSubscript:v100];
        v112 = &self->_glyphFrames[v99];
        double v113 = v112->size.width;
        double v114 = v112->size.height;
        v115 = [v111 layer];
        objc_msgSend(v115, "setBounds:", 0.0, 0.0, v113, v114);

        v116 = (double *)((char *)&self->_glyphPositions->x + v101);
        v158.origin.double x = v107;
        v158.origin.double y = v108;
        v158.size.double width = v109;
        v158.size.double height = v110;
        double MinX = CGRectGetMinX(v158);
        v159.origin.double x = v107;
        v159.origin.double y = v108;
        v159.size.double width = v109;
        v159.size.double height = v110;
        CGFloat MaxX = CGRectGetMaxX(v159);
        CGFloat v119 = self->_lineOrigin.y;
        *(v116 - 1) = MinX * 0.95 + MaxX * 0.05;
        double *v116 = v119;
        double v120 = self->_lineOrigin.y;
        double MinY = CGRectGetMinY(self->_glyphFrames[v99]);
        double v122 = (v120 - MinY) / (CGRectGetMaxY(self->_glyphFrames[v99]) - MinY);
        v123 = [v111 layer];
        objc_msgSend(v123, "setAnchorPoint:", 0.05, v122);

        ++v100;
        ++v99;
        v101 += 16;
      }
      while (v100 < self->_glyphCount);
    }
  }
  else
  {
    id v17 = objc_loadWeakRetained((id *)&self->_label);
    [v17 bounds];
    CGFloat MidX = CGRectGetMidX(v146);
    id v19 = objc_loadWeakRetained((id *)&self->_label);
    [v19 bounds];
    CGFloat MidY = CGRectGetMidY(v147);
    self->_lineOrigin.double x = MidX;
    self->_lineOrigin.double y = MidY;

    self->_lineWidth = 0.0;
  }
}

- (void)removeGlyphs
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_glyphViews;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    p_label = &self->_label;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        id WeakRetained = objc_loadWeakRetained((id *)p_label);
        objc_msgSend(WeakRetained, "hideGlyph:", v9, (void)v11);

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)placeGlyphs
{
  if (self->_glyphCount)
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    long long v16 = *MEMORY[0x1E4F39B10];
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    do
    {
      uint64_t v5 = -[NSMutableArray objectAtIndex:](self->_glyphViews, "objectAtIndex:", v4, v13, v14, v15, v16, v17, v18, v19, v20);
      uint64_t v6 = &self->_glyphPositions[v3];
      double x = v6->x;
      double y = v6->y;
      uint64_t v9 = [v5 layer];
      objc_msgSend(v9, "setPosition:", x, y);

      uint64_t v10 = [v5 layer];
      v21[4] = v20;
      v21[5] = v19;
      v21[6] = v18;
      v21[7] = v17;
      v21[0] = v16;
      v21[1] = v15;
      v21[2] = v14;
      v21[3] = v13;
      [v10 setTransform:v21];

      long long v11 = [v5 layer];
      LODWORD(v12) = 1.0;
      [v11 setOpacity:v12];

      [v5 setHidden:0];
      ++v4;
      ++v3;
    }
    while (v4 < self->_glyphCount);
  }
}

- (CGRect)boundingRectForGlyphsInRange:(_NSRange)a3
{
  if (a3.length)
  {
    unint64_t v4 = &self->_glyphFrames[a3.location];
    CGFloat x = v4->origin.x;
    double y = v4->origin.y;
    double width = v4->size.width;
    double height = v4->size.height;
    if (a3.location + 1 < a3.location + a3.length)
    {
      NSUInteger v9 = a3.length - 1;
      NSUInteger location = a3.location;
      do
      {
        *(CGRect *)&CGFloat x = CGRectUnion(*(CGRect *)&x, self->_glyphFrames[++location]);
        --v9;
      }
      while (v9);
    }
  }
  else
  {
    CGFloat x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.CGFloat x = x;
  return result;
}

- (unint64_t)glyphCount
{
  return self->_glyphCount;
}

- (const)glyphs
{
  return self->_glyphs;
}

- (const)glyphFrames
{
  return self->_glyphFrames;
}

- (const)glyphPositions
{
  return self->_glyphPositions;
}

- (NSArray)glyphViews
{
  return &self->_glyphViews->super;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (CGPoint)lineOrigin
{
  double x = self->_lineOrigin.x;
  double y = self->_lineOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphViews, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_destroyWeak((id *)&self->_label);
}

@end
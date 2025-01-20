@interface AEHighlightedTextLabel
+ (CGSize)sizeForAnnotation:(id)a3 font:(id)a4 width:(double)a5 numberOfLines:(unint64_t)a6 useSelectedText:(BOOL)a7;
+ (__CTParagraphStyle)createParagraphStyleForFont:(__CTFont *)a3;
+ (double)adjustedLeadingForFont:(__CTFont *)a3;
+ (unint64_t)possibleLineLengthForAnnotation:(id)a3 size:(CGSize)a4;
+ (void)collapseNewlinesForMutableAttributedString:(id)a3;
- (AEAnnotation)annotation;
- (AEHighlightRenderingController)renderingController;
- (AEHighlightedTextLabel)initWithFrame:(CGRect)a3;
- (AEHighlightedTextLabel)initWithFrame:(CGRect)a3 generateHighlight:(BOOL)a4 generateHighlightAsynchronously:(BOOL)a5;
- (BOOL)isHighlighted;
- (BOOL)shouldInvertContent;
- (BOOL)useSelectedText;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)annotationAttributedString;
- (UIColor)bk_backgroundColor;
- (UIColor)highlightedTextColor;
- (UIColor)textColor;
- (UIFont)font;
- (double)fullLineWidth;
- (int)annotationBlendMode;
- (int)highlightedAnnotationBlendMode;
- (int64_t)numberOfLines;
- (int64_t)pageTheme;
- (void)_updateBackgroundColors;
- (void)clearHighlights;
- (void)drawLabelInRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)p_renderHighlightLayer:(id)a3 inContext:(CGContext *)a4 flippingOriginWithY:(double)a5;
- (void)setAnnotation:(id)a3;
- (void)setAnnotationBlendMode:(int)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBk_backgroundColor:(id)a3;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFullLineWidth:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedAnnotationBlendMode:(int)a3;
- (void)setHighlightedTextColor:(id)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setPageTheme:(int64_t)a3;
- (void)setRenderingController:(id)a3;
- (void)setShouldInvertContent:(BOOL)a3;
- (void)setTextColor:(id)a3;
- (void)setUseSelectedText:(BOOL)a3;
@end

@implementation AEHighlightedTextLabel

+ (unint64_t)possibleLineLengthForAnnotation:(id)a3 size:(CGSize)a4
{
  return 45;
}

- (AEHighlightedTextLabel)initWithFrame:(CGRect)a3 generateHighlight:(BOOL)a4 generateHighlightAsynchronously:(BOOL)a5
{
  v17.receiver = self;
  v17.super_class = (Class)AEHighlightedTextLabel;
  v7 = -[AEHighlightedTextLabel initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v7)
  {
    v8 = objc_alloc_init(AEHighlightRenderingController);
    renderingController = v7->_renderingController;
    v7->_renderingController = v8;

    [(AEHighlightRenderingController *)v7->_renderingController setCanUseFilters:1];
    v7->_numberOfLines = 2;
    v7->_generateHighlight = a4;
    v7->_generateHighlightAsynchronously = a5;
    v7->_annotationBlendMode = 0;
    v7->_highlightedAnnotationBlendMode = 3;
    [(AEHighlightedTextLabel *)v7 setContentMode:3];
    [(AEHighlightedTextLabel *)v7 setUserInteractionEnabled:0];
    v7->_fullLineWidth = 1.79769313e308;
    uint64_t v10 = +[UIColor blackColor];
    textColor = v7->_textColor;
    v7->_textColor = (UIColor *)v10;

    v12 = [AEHighlightedTextLabelTextView alloc];
    [(AEHighlightedTextLabel *)v7 bounds];
    v13 = -[AEHighlightedTextLabelTextView initWithFrame:](v12, "initWithFrame:");
    textView = v7->_textView;
    v7->_textView = v13;

    [(AEHighlightedTextLabelTextView *)v7->_textView setOpaque:[(AEHighlightedTextLabel *)v7 isOpaque]];
    [(AEHighlightedTextLabelTextView *)v7->_textView setDelegate:v7];
    [(AEHighlightedTextLabel *)v7 addSubview:v7->_textView];
    v15 = +[UIColor clearColor];
    [(AEHighlightedTextLabelTextView *)v7->_textView setBackgroundColor:v15];
    [(AEHighlightedTextLabel *)v7 setBackgroundColor:v15];
    [(AEHighlightedTextLabel *)v7 setUseSelectedText:0];
  }
  return v7;
}

- (AEHighlightedTextLabel)initWithFrame:(CGRect)a3
{
  return -[AEHighlightedTextLabel initWithFrame:generateHighlight:generateHighlightAsynchronously:](self, "initWithFrame:generateHighlight:generateHighlightAsynchronously:", 1, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v5 = objc_opt_class();
  v6 = [(AEHighlightedTextLabel *)self annotation];
  v7 = [(AEHighlightedTextLabel *)self font];
  [v5 sizeForAnnotation:v6 font:v7 width:-[AEHighlightedTextLabel numberOfLines](self, "numberOfLines") useSelectedText:-[AEHighlightedTextLabel useSelectedText](self, "useSelectedText") width:width];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.double width = v12;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AEHighlightedTextLabel;
  [(AEHighlightedTextLabel *)&v3 layoutSubviews];
  [(AEHighlightedTextLabel *)self bounds];
  -[AEHighlightedTextLabelTextView setFrame:](self->_textView, "setFrame:");
}

+ (double)adjustedLeadingForFont:(__CTFont *)a3
{
  double Ascent = CTFontGetAscent(a3);
  double Descent = CTFontGetDescent(a3);
  double result = CTFontGetLeading(a3);
  if (result < (Ascent + Descent) * 0.2) {
    return (Ascent + Descent) * 0.2;
  }
  return result;
}

+ (__CTParagraphStyle)createParagraphStyleForFont:(__CTFont *)a3
{
  double Ascent = CTFontGetAscent(a3);
  double Descent = CTFontGetDescent(a3);
  [a1 adjustedLeadingForFont:a3];
  double v10 = v7;
  double v9 = Ascent + Descent + v7;
  settings.spec = kCTParagraphStyleSpecifierMinimumLineSpacing;
  settings.valueSize = 8;
  settings.value = &v10;
  int v12 = 14;
  uint64_t v13 = 8;
  v14 = &v10;
  int v15 = 8;
  uint64_t v16 = 8;
  objc_super v17 = &v9;
  return CTParagraphStyleCreate(&settings, 3uLL);
}

- (void)drawLabelInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v144.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v144.c = v9;
  *(_OWORD *)&v144.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGContextSetTextMatrix(CurrentContext, &v144);
  memset(&v144, 0, sizeof(v144));
  v152.origin.double x = x;
  v152.origin.double y = y;
  v152.size.double width = width;
  v152.size.double height = height;
  CGFloat v10 = CGRectGetHeight(v152);
  CGAffineTransformMakeTranslation(&v144, 0.0, v10);
  CGAffineTransform v142 = v144;
  CGAffineTransformScale(&transform, &v142, 1.0, -1.0);
  CGAffineTransform v144 = transform;
  c = CurrentContext;
  CGContextConcatCTM(CurrentContext, &transform);
  double v11 = [(AEHighlightedTextLabel *)self annotation];
  int v12 = [(AEHighlightedTextLabel *)self renderingController];
  uint64_t v13 = [v11 annotationUuid];
  [v12 removeHighlightForData:v13];

  if ([(AEHighlightedTextLabel *)self useSelectedText]) {
    +[AEAnnotation annotatedAttributedStringForAnnotation:v11];
  }
  else {
  v14 = [AEAnnotation annotatedAttributedStringForAnnotation:v11 withPossibleLength:[self numberOfLines]*[objc_opt_class() possibleLineLengthForAnnotation:v11 size:CGSizeZero.width, CGSizeZero.height]];
  }
  id v15 = [v14 mutableCopy];

  if (v15)
  {
    uint64_t v16 = [(AEHighlightedTextLabel *)self font];
    objc_super v17 = [v16 fontName];
    v18 = [(AEHighlightedTextLabel *)self font];
    [v18 pointSize];
    CTFontRef v20 = CTFontCreateWithName(v17, v19, 0);

    id v21 = [(id)objc_opt_class() createParagraphStyleForFont:v20];
    if (v21)
    {
      v22 = v21;
      [v15 addAttribute:kCTParagraphStyleAttributeName value:v21 range:0, [v15 length]];
      CFRelease(v22);
    }
    id v104 = objc_alloc_init((Class)NSMutableArray);
    if (self->_highlighted) {
      v23 = &OBJC_IVAR___AEHighlightedTextLabel__highlightedTextColor;
    }
    else {
      v23 = &OBJC_IVAR___AEHighlightedTextLabel__textColor;
    }
    v24 = (UIColor *)*(id *)((char *)&self->super.super.super.isa + *v23);
    if (!v24) {
      v24 = self->_textColor;
    }
    v101 = v11;
    id v25 = objc_alloc((Class)NSDictionary);
    v99 = v24;
    CTFontRef v102 = v20;
    id v26 = [v25 initWithObjectsAndKeys:v20, kCTFontAttributeName, [v99 CGColor], kCTForegroundColorAttributeName, 0];
    [v15 addAttributes:v26 range:0, [v15 length]];
    [(id)objc_opt_class() collapseNewlinesForMutableAttributedString:v15];
    v27 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)v15);
    +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", x, y, width, height);
    id v28 = objc_claimAutoreleasedReturnValue();
    v29 = (const CGPath *)[v28 CGPath];
    cf = v27;
    v148.CFIndex location = 0;
    v148.length = 0;
    v30 = CTFramesetterCreateFrame(v27, v148, v29, 0);

    frame = v30;
    id v31 = [(__CFArray *)CTFrameGetLines(v30) mutableCopy];
    v96.size.double width = width;
    v96.size.double height = height;
    v96.origin.double x = x;
    v96.origin.double y = y;
    id v100 = v15;
    if ([v31 count])
    {
      v32 = self;
      v33 = (const __CTLine *)[v31 lastObject];
      v34 = [v15 attributesAtIndex:0 effectiveRange:0];

      id v35 = [v34 mutableCopy];
      [v35 setValue:0 forKey:@"kAEAnnotationStyleAttributeName"];
      v36 = IMCommonCoreBundle();
      v37 = [v36 localizedStringForKey:@"\\U2026" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
      CFAttributedStringRef v38 = CFAttributedStringCreate(0, v37, (CFDictionaryRef)v35);

      v39 = CTLineCreateWithAttributedString(v38);
      if (v38) {
        CFRelease(v38);
      }
      CFIndex location = CTLineGetStringRange(v33).location;
      v151.length = (CFIndex)[v15 length] - location;
      v151.CFIndex location = location;
      CFAttributedStringRef v41 = CFAttributedStringCreateWithSubstring(0, (CFAttributedStringRef)v15, v151);
      v42 = CTLineCreateWithAttributedString(v41);
      v153.origin.double x = x;
      v153.origin.double y = y;
      v153.size.double width = width;
      v153.size.double height = height;
      double v43 = CGRectGetWidth(v153);
      CTLineRef TruncatedLine = CTLineCreateTruncatedLine(v42, v43, kCTLineTruncationEnd, v39);
      if (TruncatedLine)
      {
        CTLineRef v45 = TruncatedLine;
        [v31 replaceObjectAtIndex:[v31 count] - 1 withObject:TruncatedLine];
        CFRelease(v45);
      }
      if (v42) {
        CFRelease(v42);
      }
      if (v41) {
        CFRelease(v41);
      }
      if (v39) {
        CFRelease(v39);
      }

      v97 = v34;
      self = v32;
    }
    else
    {
      v97 = v26;
    }
    v46 = (CGPoint *)malloc_type_malloc(16 * (void)[v31 count], 0x1000040451B5BE8uLL);
    v149.CFIndex location = 0;
    v149.length = 0;
    CTFrameGetLineOrigins(frame, v149, v46);
    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    id obj = v31;
    id v109 = [obj countByEnumeratingWithState:&v138 objects:v147 count:16];
    if (v109)
    {
      LODWORD(v47) = 0;
      uint64_t v106 = *(void *)v139;
      CGFloat v112 = CGRectNull.origin.y;
      CGFloat v110 = CGRectNull.size.height;
      CGFloat v111 = CGRectNull.size.width;
      v107 = v46;
      v108 = self;
      do
      {
        v48 = 0;
        uint64_t v47 = (int)v47;
        do
        {
          if (*(void *)v139 != v106) {
            objc_enumerationMutation(obj);
          }
          v49 = *(const __CTLine **)(*((void *)&v138 + 1) + 8 * (void)v48);
          uint64_t v113 = v47;
          p_double x = &v46[v47].x;
          CGContextSetTextPosition(c, *p_x, p_x[1]);
          v142.a = 0.0;
          CGFloat leading = 0.0;
          CGFloat descent = 0.0;
          double TypographicBounds = CTLineGetTypographicBounds(v49, &v142.a, &descent, &leading);
          float v51 = p_x[1] - descent;
          double v52 = floorf(v51);
          [(AEHighlightedTextLabel *)self bounds];
          float v53 = CGRectGetWidth(v154);
          CGFloat v54 = ceilf(v53);
          float v55 = v142.a + descent;
          CGFloat v118 = v54;
          double v119 = ceilf(v55);
          v56 = CTLineGetGlyphRuns(v49);
          long long v132 = 0u;
          long long v133 = 0u;
          long long v134 = 0u;
          long long v135 = 0u;
          id v57 = [v56 countByEnumeratingWithState:&v132 objects:v146 count:16];
          CGFloat v58 = v110;
          double v59 = v111;
          CGFloat v60 = v112;
          double v61 = CGRectNull.origin.x;
          if (v57)
          {
            id v62 = v57;
            uint64_t v63 = *(void *)v133;
            CGFloat v58 = v110;
            double v59 = v111;
            CGFloat v60 = v112;
            double v61 = CGRectNull.origin.x;
            double v116 = v52;
            do
            {
              for (i = 0; i != v62; i = (char *)i + 1)
              {
                if (*(void *)v133 != v63) {
                  objc_enumerationMutation(v56);
                }
                v65 = *(const __CTRun **)(*((void *)&v132 + 1) + 8 * i);
                v66 = CTRunGetAttributes(v65);
                v67 = [v66 objectForKey:@"kAEAnnotationStyleAttributeName"];

                if (v67)
                {
                  char Status = CTRunGetStatus(v65);
                  if ([v56 count] == (char *)&def_7D91C + 1)
                  {
                    double v59 = CTLineGetTypographicBounds(v49, 0, 0, 0);
                    double v61 = 0.0;
                    if (Status)
                    {
                      v159.origin.double x = 0.0;
                      v159.origin.double y = v52;
                      v159.size.double width = v118;
                      CGFloat v58 = v119;
                      v159.size.double height = v119;
                      double MaxX = CGRectGetMaxX(v159);
                      v160.origin.double x = 0.0;
                      v160.origin.double y = v52;
                      v160.size.double width = v59;
                      v160.size.double height = v119;
                      double v61 = MaxX - CGRectGetWidth(v160);
                    }
                    else
                    {
                      CGFloat v58 = v119;
                    }
                    CGFloat v60 = v52;
                  }
                  else
                  {
                    CGFloat v117 = v58;
                    CFIndex v69 = CTRunGetStringRange(v65).location;
                    OffsetForStringIndedouble x = CTLineGetOffsetForStringIndex(v49, v69, 0);
                    v150.CFIndex location = 0;
                    v150.length = 0;
                    double v71 = CTRunGetTypographicBounds(v65, v150, 0, 0, 0);
                    if (Status)
                    {
                      v155.origin.double x = 0.0;
                      v155.origin.double y = v52;
                      v155.size.double width = v118;
                      v155.size.double height = v119;
                      OffsetForStringIndedouble x = CGRectGetMaxX(v155) - (TypographicBounds - OffsetForStringIndex + v71);
                    }
                    v156.origin.double x = 0.0;
                    v156.origin.double y = v52;
                    v156.size.double width = v118;
                    v156.size.double height = v119;
                    CGFloat v58 = CGRectGetHeight(v156);
                    v157.origin.double x = 0.0;
                    v157.origin.double y = v52;
                    v157.size.double width = v118;
                    v157.size.double height = v119;
                    CGFloat MinY = CGRectGetMinY(v157);
                    v158.origin.double x = v61;
                    v158.origin.double y = v60;
                    v158.size.double width = v59;
                    v158.size.double height = v117;
                    if (CGRectIsNull(v158))
                    {
                      double v59 = v71;
                      CGFloat v60 = MinY;
                      double v61 = OffsetForStringIndex;
                    }
                    else
                    {
                      v161.origin.double x = v61;
                      v161.origin.double y = v60;
                      v161.size.double width = v59;
                      v161.size.double height = v117;
                      v172.origin.double x = OffsetForStringIndex;
                      v172.origin.double y = MinY;
                      v172.size.double width = v71;
                      v172.size.double height = v58;
                      CGRect v162 = CGRectUnion(v161, v172);
                      double v61 = v162.origin.x;
                      CGFloat v60 = v162.origin.y;
                      double v59 = v162.size.width;
                      CGFloat v58 = v162.size.height;
                    }
                    double v52 = v116;
                  }
                }
              }
              id v62 = [v56 countByEnumeratingWithState:&v132 objects:v146 count:16];
            }
            while (v62);
          }
          CTLineDraw(v49, c);
          self = v108;
          if (v108->_generateHighlight)
          {
            v163.origin.double x = v61;
            v163.origin.double y = v60;
            v163.size.double width = v59;
            v163.size.double height = v58;
            if (!CGRectIsNull(v163))
            {
              CGAffineTransform transform = v144;
              v164.origin.double x = 0.0;
              v164.origin.double y = v52;
              v164.size.double width = v118;
              v164.size.double height = v119;
              CGRect v165 = CGRectApplyAffineTransform(v164, &transform);
              CGFloat v74 = v165.origin.x;
              CGFloat v75 = v165.origin.y;
              CGFloat v76 = v165.size.width;
              CGFloat v77 = v165.size.height;
              CGAffineTransform transform = v144;
              v165.origin.double x = v61;
              v165.origin.double y = v60;
              v165.size.double width = v59;
              v165.size.double height = v58;
              CGRect v166 = CGRectApplyAffineTransform(v165, &transform);
              CGFloat v78 = v166.origin.x;
              CGFloat v79 = v166.size.width;
              CGFloat v80 = v166.origin.y + -3.0;
              CGFloat v81 = v166.size.height + 2.0;
              v82 = objc_alloc_init(AEHighlightLine);
              v167.origin.double x = v74;
              v167.origin.double y = v75;
              v167.size.double width = v76;
              v167.size.double height = v77;
              CGRect v168 = CGRectIntegral(v167);
              -[AEHighlightLine setFullLineRect:](v82, "setFullLineRect:", v168.origin.x, v168.origin.y, v168.size.width, v168.size.height);
              v169.origin.double x = v78;
              v169.origin.double y = v80;
              v169.size.double width = v79;
              v169.size.double height = v81;
              CGRect v170 = CGRectIntegral(v169);
              -[AEHighlightLine setCurrentLineRect:](v82, "setCurrentLineRect:", v170.origin.x, v170.origin.y, v170.size.width, v170.size.height);
              [(AEHighlightLine *)v82 setLightenBlend:v108->_shouldInvertContent];
              [(AEHighlightLine *)v82 setMultiplyImage:0];
              v171.origin.double x = v78;
              v171.origin.double y = v80;
              v171.size.double width = v79;
              v171.size.double height = v81;
              [(AEHighlightLine *)v82 setUnderlinePosition:CGRectGetMaxY(v171)];
              [v104 addObject:v82];
            }
          }
          uint64_t v47 = v113 + 1;

          v48 = (char *)v48 + 1;
          v46 = v107;
        }
        while (v48 != v109);
        id v109 = [obj countByEnumeratingWithState:&v138 objects:v147 count:16];
      }
      while (v109);
    }

    id v15 = v100;
    double v11 = v101;
    CTFontRef v83 = v102;
    if ([v104 count])
    {
      v84 = objc_alloc_init(AEHighlight);
      [(AEHighlight *)v84 setAnnotation:v101];
      [(AEHighlight *)v84 setLines:v104];
      if (self->_generateHighlightAsynchronously)
      {
        v85 = dispatch_get_global_queue(2, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_4B788;
        block[3] = &unk_2C56D0;
        block[4] = self;
        v125 = v84;
        id v126 = v101;
        v127 = c;
        CGFloat v128 = v96.origin.x;
        CGFloat v129 = v96.origin.y;
        CGFloat v130 = v96.size.width;
        CGFloat v131 = v96.size.height;
        dispatch_async(v85, block);
      }
      else
      {
        v86 = v46;
        v87 = [(AEHighlightedTextLabel *)self renderingController];
        v88 = [v101 annotationUuid];
        [v87 addHighlight:v84 forData:v88];

        v89 = [(AEHighlightedTextLabel *)self renderingController];
        v90 = [v89 highlightLayers];

        long long v122 = 0u;
        long long v123 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        id v91 = v90;
        id v92 = [v91 countByEnumeratingWithState:&v120 objects:v145 count:16];
        if (v92)
        {
          id v93 = v92;
          uint64_t v94 = *(void *)v121;
          do
          {
            for (j = 0; j != v93; j = (char *)j + 1)
            {
              if (*(void *)v121 != v94) {
                objc_enumerationMutation(v91);
              }
              [(AEHighlightedTextLabel *)self p_renderHighlightLayer:*(void *)(*((void *)&v120 + 1) + 8 * (void)j) inContext:c flippingOriginWithY:CGRectGetHeight(v96)];
            }
            id v93 = [v91 countByEnumeratingWithState:&v120 objects:v145 count:16];
          }
          while (v93);
        }

        CTFontRef v83 = v102;
        v46 = v86;
      }
    }
    CFRelease(frame);
    if (cf) {
      CFRelease(cf);
    }
    if (v83) {
      CFRelease(v83);
    }
    if (v46) {
      free(v46);
    }
  }
}

- (void)p_renderHighlightLayer:(id)a3 inContext:(CGContext *)a4 flippingOriginWithY:(double)a5
{
  id v7 = a3;
  double v8 = [v7 valueForKey:@"kAEHighlightLayerCurrentRectKey"];
  [v8 CGRectValue];
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  CGContextSaveGState(a4);
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&v15, 0.0, a5);
  CGAffineTransform v13 = v15;
  CGAffineTransformScale(&transform, &v13, 1.0, -1.0);
  CGAffineTransform v15 = transform;
  CGContextConcatCTM(a4, &transform);
  memset(&transform, 0, sizeof(transform));
  CGAffineTransformMakeTranslation(&transform, v10, v12);
  CGAffineTransform v13 = transform;
  CGContextConcatCTM(a4, &v13);
  [v7 renderInContext:a4];

  CGContextRestoreGState(a4);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(id)objc_opt_class() areAnimationsEnabled];
  [(id)objc_opt_class() setAnimationsEnabled:0];
  v9.receiver = self;
  v9.super_class = (Class)AEHighlightedTextLabel;
  -[AEHighlightedTextLabel setFrame:](&v9, "setFrame:", x, y, width, height);
  [(id)objc_opt_class() setAnimationsEnabled:v8];
}

- (UIFont)font
{
  v2 = self->_font;
  if (!v2)
  {
    v2 = +[UIFont systemFontOfSize:14.0];
  }

  return v2;
}

+ (void)collapseNewlinesForMutableAttributedString:(id)a3
{
  id v3 = a3;
  uint64_t v6 = 0;
  v4 = +[NSRegularExpression regularExpressionWithPattern:@"[\r\n]+" options:0 error:&v6];
  if (v4)
  {
    v5 = [v3 mutableString];
    [v4 replaceMatchesInString:v5 options:0 range:NSMakeRange([v3 length], 1) withTemplate:@"\n"];
  }
}

+ (CGSize)sizeForAnnotation:(id)a3 font:(id)a4 width:(double)a5 numberOfLines:(unint64_t)a6 useSelectedText:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  if (a7) {
    +[AEAnnotation annotatedAttributedStringForAnnotation:v12];
  }
  else {
  v14 = [AEAnnotation annotatedAttributedStringForAnnotation:v12 withPossibleLength:[a1 possibleLineLengthForAnnotation:v12 size:CGSizeZero.width, CGSizeZero.height] * a6];
  }
  id v15 = [v14 mutableCopy];

  if (v15)
  {
    [a1 collapseNewlinesForMutableAttributedString:v15];
    uint64_t v16 = [v13 fontName];
    [v13 pointSize];
    v18 = CTFontCreateWithName(v16, v17, 0);

    double Ascent = CTFontGetAscent(v18);
    double Descent = CTFontGetDescent(v18);
    [(id)objc_opt_class() adjustedLeadingForFont:v18];
    double v22 = v21;
    [v15 addAttribute:kCTFontAttributeName value:v18 range:0, [v15 length]];
    id v23 = [(id)objc_opt_class() createParagraphStyleForFont:v18];
    if (v23)
    {
      v24 = v23;
      [v15 addAttribute:kCTParagraphStyleAttributeName value:v23 range:0, [v15 length]];
      CFRelease(v24);
    }
    double v25 = (ceil(Ascent + Descent) + ceil(v22)) * (double)a6;
    id v26 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)v15);
    +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", 0.0, 0.0, a5, v25);
    id v27 = objc_claimAutoreleasedReturnValue();
    id v28 = (const CGPath *)[v27 CGPath];
    v51.CFIndex location = 0;
    v51.length = 0;
    Frame = CTFramesetterCreateFrame(v26, v51, v28, 0);

    v30 = CTFrameGetLines(Frame);
    uint64_t v47 = 0;
    v48 = (double *)&v47;
    uint64_t v49 = 0x2020000000;
    uint64_t v50 = 0;
    uint64_t v43 = 0;
    v44 = (double *)&v43;
    uint64_t v45 = 0x2020000000;
    double v46 = v25;
    [v30 count];
    id v31 = (CGPoint *)&v42[-2 * __chkstk_darwin() - 1];
    bzero(v31, v32);
    v52.CFIndex location = 0;
    v52.length = 0;
    CTFrameGetLineOrigins(Frame, v52, v31);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_4C078;
    v42[3] = &unk_2C56F8;
    v42[6] = a6;
    v42[7] = v31;
    v42[4] = &v47;
    v42[5] = &v43;
    [v30 enumerateObjectsUsingBlock:v42];
    if (Frame) {
      CFRelease(Frame);
    }
    double v33 = v48[3];
    double v34 = v44[3];
    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v47, 8);

    if (v26) {
      CFRelease(v26);
    }
    float v35 = v33;
    double width = ceilf(v35);
    float v37 = v34 + -0.5;
    double height = v25 - floorf(v37) + 5.0;
    if (v18) {
      CFRelease(v18);
    }
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }

  double v39 = width;
  double v40 = height;
  result.double height = v40;
  result.double width = v39;
  return result;
}

- (void)setAnnotation:(id)a3
{
  v5 = (AEAnnotation *)a3;
  if (self->_annotation != v5)
  {
    id v8 = v5;
    uint64_t v6 = [(AEHighlightedTextLabel *)self renderingController];
    id v7 = [(AEAnnotation *)self->_annotation annotationUuid];
    [v6 removeHighlightForData:v7];

    objc_storeStrong((id *)&self->_annotation, a3);
    [(AEHighlightedTextLabelTextView *)self->_textView setNeedsDisplay];
    v5 = v8;
  }
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v4 = +[UIColor blackColor];
  }
  objc_storeStrong((id *)&self->_textColor, v4);
  if (!v5) {

  }
  if (!self->_highlightedTextColor) {
    objc_storeStrong((id *)&self->_highlightedTextColor, self->_textColor);
  }
  [(AEHighlightedTextLabelTextView *)self->_textView setNeedsDisplay];
}

- (void)setHighlightedTextColor:(id)a3
{
  textColor = a3;
  if (!a3) {
    textColor = self->_textColor;
  }
  objc_storeStrong((id *)&self->_highlightedTextColor, textColor);
  id v6 = a3;
  [(AEHighlightedTextLabelTextView *)self->_textView setNeedsDisplay];
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_bk_backgroundColor, a3);
  id v5 = a3;
  id v6 = +[UIColor clearColor];
  v7.receiver = self;
  v7.super_class = (Class)AEHighlightedTextLabel;
  [(AEHighlightedTextLabel *)&v7 setBackgroundColor:v6];

  [(AEHighlightedTextLabel *)self _updateBackgroundColors];
}

- (void)_updateBackgroundColors
{
  if (self->_highlighted)
  {
    id v3 = +[UIColor clearColor];
  }
  else
  {
    id v3 = self->_bk_backgroundColor;
  }
  id v4 = v3;
  [(AEHighlightedTextLabelTextView *)self->_textView setBackgroundColor:v3];
  [(AEHighlightedTextLabelTextView *)self->_textView setNeedsDisplay];
}

- (int64_t)pageTheme
{
  return [(AEHighlightRenderingController *)self->_renderingController pageTheme];
}

- (void)setPageTheme:(int64_t)a3
{
  if ([(AEHighlightRenderingController *)self->_renderingController pageTheme] != a3)
  {
    [(AEHighlightRenderingController *)self->_renderingController setPageTheme:a3];
    textView = self->_textView;
    [(AEHighlightedTextLabelTextView *)textView setNeedsDisplay];
  }
}

- (void)setAnnotationBlendMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_annotationBlendMode = a3;
  if ([(AEHighlightRenderingController *)self->_renderingController annotationBlendMode] != a3)
  {
    [(AEHighlightRenderingController *)self->_renderingController setAnnotationBlendMode:v3];
    textView = self->_textView;
    [(AEHighlightedTextLabelTextView *)textView setNeedsDisplay];
  }
}

- (void)setHighlightedAnnotationBlendMode:(int)a3
{
  self->_highlightedAnnotationBlendMode = a3;
  [(AEHighlightedTextLabelTextView *)self->_textView setNeedsDisplay];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    id v4 = &OBJC_IVAR___AEHighlightedTextLabel__annotationBlendMode;
    if (a3) {
      id v4 = &OBJC_IVAR___AEHighlightedTextLabel__highlightedAnnotationBlendMode;
    }
    [(AEHighlightRenderingController *)self->_renderingController setAnnotationBlendMode:*(unsigned int *)((char *)&self->super.super.super.isa + *v4)];
    [(AEHighlightedTextLabel *)self _updateBackgroundColors];
  }
}

- (NSAttributedString)annotationAttributedString
{
  uint64_t v3 = [(AEHighlightedTextLabel *)self annotation];
  if ([(AEHighlightedTextLabel *)self useSelectedText]) {
    +[AEAnnotation annotatedAttributedStringForAnnotation:v3];
  }
  else {
  id v4 = [AEAnnotation annotatedAttributedStringForAnnotation:v3 withPossibleLength:[self numberOfLines]*[objc_opt_class() possibleLineLengthForAnnotation:v3 size:CGSizeZero.width, CGSizeZero.height]];
  }
  id v5 = [v4 mutableCopy];

  return (NSAttributedString *)v5;
}

- (void)clearHighlights
{
  id v5 = [(AEHighlightedTextLabel *)self renderingController];
  uint64_t v3 = [(AEHighlightedTextLabel *)self annotation];
  id v4 = [v3 annotationUuid];
  [v5 removeHighlightForData:v4];
}

- (AEAnnotation)annotation
{
  return self->_annotation;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setNumberOfLines:(int64_t)a3
{
  self->_numberOfLines = a3;
}

- (double)fullLineWidth
{
  return self->_fullLineWidth;
}

- (void)setFullLineWidth:(double)a3
{
  self->_fullLineWidth = a3;
}

- (BOOL)shouldInvertContent
{
  return self->_shouldInvertContent;
}

- (void)setShouldInvertContent:(BOOL)a3
{
  self->_shouldInvertContent = a3;
}

- (void)setFont:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)highlightedTextColor
{
  return self->_highlightedTextColor;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (int)annotationBlendMode
{
  return self->_annotationBlendMode;
}

- (int)highlightedAnnotationBlendMode
{
  return self->_highlightedAnnotationBlendMode;
}

- (BOOL)useSelectedText
{
  return self->_useSelectedText;
}

- (void)setUseSelectedText:(BOOL)a3
{
  self->_useSelectedText = a3;
}

- (AEHighlightRenderingController)renderingController
{
  return self->_renderingController;
}

- (void)setRenderingController:(id)a3
{
}

- (UIColor)bk_backgroundColor
{
  return self->_bk_backgroundColor;
}

- (void)setBk_backgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bk_backgroundColor, 0);
  objc_storeStrong((id *)&self->_renderingController, 0);
  objc_storeStrong((id *)&self->_highlightedTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_annotation, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end
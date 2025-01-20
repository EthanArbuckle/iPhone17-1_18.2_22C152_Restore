@interface BKTOCRangeAnnotationTableCell
+ (CGRect)dateLabelFrameForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 minY:(double)a6 layoutDirection:(int64_t)a7;
+ (CGRect)dateLabelFrameInPopoverForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 minY:(double)a6 pageLabelFrame:(CGRect)a7 layoutDirection:(int64_t)a8;
+ (CGRect)highlightedTextFrameForAnnotation:(id)a3 font:(id)a4 bounds:(CGRect)a5 letMargin:(double)a6 numberOfLines:(int)a7 pageLabelFrame:(CGRect)a8 layoutDirection:(int64_t)a9;
+ (CGRect)highlightedTextFrameForAnnotation:(id)a3 font:(id)a4 bounds:(CGRect)a5 pageLabelFrame:(CGRect)a6 layoutDirection:(int64_t)a7;
+ (CGRect)highlightedTextFrameInPopoverForAnnotation:(id)a3 font:(id)a4 bounds:(CGRect)a5 pageLabelFrame:(CGRect)a6 layoutDirection:(int64_t)a7;
+ (CGRect)pageLabelFrameInPopoverForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 layoutDirection:(int64_t)a6;
+ (double)bottomPadding;
+ (double)cellHeightInPopoverForBounds:(CGRect)a3 highlightFont:(id)a4 annotation:(id)a5 dateString:(id)a6 pageString:(id)a7 layoutDirection:(int64_t)a8;
+ (double)highlightedTextSizeInPopover;
+ (double)noteTextFrameForString:(CGFloat)a3 font:(CGFloat)a4 bounds:(double)a5 spacingToItemAbove:(uint64_t)a6 numberOfLines:(uint64_t)a7 matchesWidthOfHighlightedText:(void *)a8 highlightedTextFrame:(void *)a9 pageLabelFrame:(int)a10;
+ (double)pageNumberAndHighlightedTextFontSize;
+ (id)noteFontForPopover;
+ (id)noteTextFrameForString:(double)a3 font:(double)a4 bounds:(double)a5 highlightedTextFrame:(double)a6 pageLabelFrame:(double)a7;
+ (id)noteTextFrameInPopoverForString:(double)a3 font:(double)a4 bounds:(double)a5 highlightedTextFrame:(double)a6 pageLabelFrame:(double)a7;
- (AEHighlightedTextLabel)highlightedTextLabel;
- (void)layoutSubviewsNotEditingWithBounds:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation BKTOCRangeAnnotationTableCell

- (void)layoutSubviewsNotEditingWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unsigned int v8 = [(BKTOCTableViewCell *)self usesPopoverStyle];
  v9 = objc_opt_class();
  v10 = [(BKTOCTableViewCell *)self pageLabel];
  v11 = [v10 text];
  v12 = [(BKTOCTableViewCell *)self pageLabel];
  v13 = [v12 font];
  id v14 = [(BKTOCRangeAnnotationTableCell *)self effectiveUserInterfaceLayoutDirection];
  if (v8)
  {
    [v9 pageLabelFrameInPopoverForString:v11 font:v13 bounds:v14 layoutDirection:x, y, width, height];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v169 = height;
    double v22 = v21;
    v23 = [(BKTOCTableViewCell *)self pageLabel];
    [v23 setFrame:v16, v18, v20, v22];

    v24 = objc_opt_class();
    v25 = [(BKTOCRangeAnnotationTableCell *)self highlightedTextLabel];
    v26 = [v25 annotation];
    v27 = [(BKTOCRangeAnnotationTableCell *)self highlightedTextLabel];
    v28 = [v27 font];
    v29 = [(BKTOCTableViewCell *)self pageLabel];
    [v29 frame];
    [v24 highlightedTextFrameInPopoverForAnnotation:v26 font:v28 bounds:x, y, width, v169, v30, v31, v32, v33 layoutDirection:[self effectiveUserInterfaceLayoutDirection]];
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    v42 = [(BKTOCRangeAnnotationTableCell *)self highlightedTextLabel];
    [v42 setFrame:v35, v37, v39, v41];

    v43 = [(BKTOCRangeAnnotationTableCell *)self highlightedTextLabel];
    [v43 frame];
    double v44 = CGRectGetWidth(v171);
    v45 = [(BKTOCRangeAnnotationTableCell *)self highlightedTextLabel];
    [v45 setFullLineWidth:v44];

    v46 = objc_opt_class();
    v47 = [(BKTOCAnnotationTableCell *)self noteLabel];
    v48 = [v47 text];
    v49 = [(BKTOCAnnotationTableCell *)self noteLabel];
    v50 = [v49 font];
    v51 = [(BKTOCRangeAnnotationTableCell *)self highlightedTextLabel];
    [v51 frame];
    double v53 = v52;
    double v55 = v54;
    double v57 = v56;
    double v59 = v58;
    v60 = [(BKTOCTableViewCell *)self pageLabel];
    [v60 frame];
    [v46 noteTextFrameInPopoverForString:v48 font:v50 bounds:x, y, width, v169, v53, v55, v57, v59, v61, v62, v63, v64];
    double v66 = v65;
    double v68 = v67;
    double v70 = v69;
    double v72 = v71;
    v73 = [(BKTOCAnnotationTableCell *)self noteLabel];
    [v73 setFrame:v66, v68, v70, v72];

    v74 = objc_opt_class();
    v75 = [(BKTOCAnnotationTableCell *)self dateLabel];
    v76 = [v75 text];
    v77 = [(BKTOCAnnotationTableCell *)self dateLabel];
    v78 = [v77 font];
    v79 = [(BKTOCAnnotationTableCell *)self noteLabel];
    [v79 frame];
    double MaxY = CGRectGetMaxY(v172);

    v81 = [(BKTOCRangeAnnotationTableCell *)self highlightedTextLabel];
    [v81 frame];
    double v82 = CGRectGetMaxY(v173);

    if (MaxY < v82) {
      double MaxY = v82;
    }
    v83 = [(BKTOCTableViewCell *)self pageLabel];
    [v83 frame];
    double height = v169;
    [v74 dateLabelFrameInPopoverForString:v76 font:v78 bounds:-[BKTOCRangeAnnotationTableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") minY:x pageLabelFrame:y width:width MaxY:v169 layoutDirection:v84 pageLabelFrame:v85 pageLabelFrame:v86 pageLabelFrame:v87];
    double v89 = v88;
    double v91 = v90;
    double v93 = v92;
    double v95 = v94;
    v96 = [(BKTOCAnnotationTableCell *)self dateLabel];
    [v96 setFrame:v89, v91, v93, v95];
  }
  else
  {
    [v9 pageLabelFrameForString:v11 font:v13 bounds:v14 layoutDirection:x, y, width, height];
    double v98 = v97;
    double v100 = v99;
    double v102 = v101;
    double v104 = v103;
    v105 = [(BKTOCTableViewCell *)self pageLabel];
    [v105 setFrame:v98, v100, v102, v104];

    v106 = objc_opt_class();
    v107 = [(BKTOCRangeAnnotationTableCell *)self highlightedTextLabel];
    v108 = [v107 annotation];
    v109 = [(BKTOCRangeAnnotationTableCell *)self highlightedTextLabel];
    v110 = [v109 font];
    v111 = [(BKTOCTableViewCell *)self pageLabel];
    [v111 frame];
    [v106 highlightedTextFrameForAnnotation:v108 font:v110 bounds:x, y, width, height pageLabelFrame:v112 layoutDirection:[self effectiveUserInterfaceLayoutDirection]];
    double v117 = v116;
    double v119 = v118;
    double v121 = v120;
    double v123 = v122;
    v124 = [(BKTOCRangeAnnotationTableCell *)self highlightedTextLabel];
    [v124 setFrame:v117, v119, v121, v123];

    v125 = [(BKTOCRangeAnnotationTableCell *)self highlightedTextLabel];
    [v125 frame];
    double v126 = CGRectGetWidth(v174);
    v127 = [(BKTOCRangeAnnotationTableCell *)self highlightedTextLabel];
    [v127 setFullLineWidth:v126];

    v128 = objc_opt_class();
    v129 = [(BKTOCAnnotationTableCell *)self noteLabel];
    v130 = [v129 text];
    v131 = [(BKTOCAnnotationTableCell *)self noteLabel];
    v132 = [v131 font];
    v133 = [(BKTOCRangeAnnotationTableCell *)self highlightedTextLabel];
    [v133 frame];
    double v135 = v134;
    double v137 = v136;
    double v139 = v138;
    double v141 = v140;
    v142 = [(BKTOCTableViewCell *)self pageLabel];
    [v142 frame];
    [v128 noteTextFrameForString:v130 font:v132 bounds:CGRectMake(x, y, width, height) highlightedTextFrame:v135 pageLabelFrame:v137];
    double v148 = v147;
    double v150 = v149;
    double v152 = v151;
    double v154 = v153;
    v155 = [(BKTOCAnnotationTableCell *)self noteLabel];
    [v155 setFrame:v148, v150, v152, v154];

    v156 = objc_opt_class();
    v75 = [(BKTOCAnnotationTableCell *)self dateLabel];
    v76 = [v75 text];
    v77 = [(BKTOCAnnotationTableCell *)self dateLabel];
    v78 = [v77 font];
    v157 = [(BKTOCAnnotationTableCell *)self noteLabel];
    [v157 frame];
    double v158 = CGRectGetMaxY(v175);

    v159 = [(BKTOCRangeAnnotationTableCell *)self highlightedTextLabel];
    [v159 frame];
    double v160 = CGRectGetMaxY(v176);

    if (v158 < v160) {
      double v158 = v160;
    }
    [v156 dateLabelFrameForString:v76 font:v78 bounds:-[BKTOCRangeAnnotationTableCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") x:x y:y width:width height:height v158];
    double v162 = v161;
    double v164 = v163;
    double v166 = v165;
    double v168 = v167;
    v83 = [(BKTOCAnnotationTableCell *)self dateLabel];
    [v83 setFrame:v162, v164, v166, v168];
  }

  v170.receiver = self;
  v170.super_class = (Class)BKTOCRangeAnnotationTableCell;
  -[BKTOCAnnotationTableCell layoutSubviewsNotEditingWithBounds:](&v170, "layoutSubviewsNotEditingWithBounds:", x, y, width, height);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)BKTOCRangeAnnotationTableCell;
  [(BKTOCAnnotationTableCell *)&v4 prepareForReuse];
  [(AEHighlightedTextLabel *)self->_highlightedTextLabel removeFromSuperview];
  highlightedTextLabel = self->_highlightedTextLabel;
  self->_highlightedTextLabel = 0;
}

- (AEHighlightedTextLabel)highlightedTextLabel
{
  highlightedTextLabel = self->_highlightedTextLabel;
  if (!highlightedTextLabel)
  {
    objc_super v4 = (AEHighlightedTextLabel *)objc_alloc_init((Class)AEHighlightedTextLabel);
    v5 = self->_highlightedTextLabel;
    self->_highlightedTextLabel = v4;

    if ([(BKTOCTableViewCell *)self usesPopoverStyle]) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 2;
    }
    [(AEHighlightedTextLabel *)self->_highlightedTextLabel setNumberOfLines:v6];
    [(AEHighlightedTextLabel *)self->_highlightedTextLabel setOpaque:0];
    v7 = [(BKTOCRangeAnnotationTableCell *)self contentView];
    [v7 addSubview:self->_highlightedTextLabel];

    highlightedTextLabel = self->_highlightedTextLabel;
  }

  return highlightedTextLabel;
}

+ (double)highlightedTextSizeInPopover
{
  return 13.0;
}

+ (id)noteFontForPopover
{
  v2 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleBody];
  v3 = +[UITraitCollection currentTraitCollectionLimitedToSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
  objc_super v4 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v3];

  [v4 pointSize];
  v5 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
  uint64_t v6 = [v2 scaledFontForFont:v5];

  return v6;
}

+ (double)pageNumberAndHighlightedTextFontSize
{
  v2 = objc_opt_class();

  [v2 pageNumberFontSize];
  return result;
}

+ (CGRect)pageLabelFrameInPopoverForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 layoutDirection:(int64_t)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v12 = a4;
  id v13 = a3;
  [objc_opt_class() pageLabelFrameForString:v13 font:v12 bounds:a6 topMargin:x layoutDirection:y width:width height:height];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

+ (CGRect)highlightedTextFrameInPopoverForAnnotation:(id)a3 font:(id)a4 bounds:(CGRect)a5 pageLabelFrame:(CGRect)a6 layoutDirection:(int64_t)a7
{
  [a1 highlightedTextFrameForAnnotation:a3 font:a4 bounds:3 a7:a5.origin.x a5.origin.y a5.size.width a5.size.height 8.0 a6.origin.x a6.origin.y a6.size.width a6.size.height];
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

+ (CGRect)highlightedTextFrameForAnnotation:(id)a3 font:(id)a4 bounds:(CGRect)a5 pageLabelFrame:(CGRect)a6 layoutDirection:(int64_t)a7
{
  [a1 highlightedTextFrameForAnnotation:a3 font:a4 bounds:2 a7 numberOfLines:a5.origin.x a5.origin.y a5.size.width a5.size.height 15.0 *(void *)&a6.origin.x *(void *)&a6.origin.y *(void *)&a6.size.width *(void *)&a6.size.height];
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

+ (CGRect)highlightedTextFrameForAnnotation:(id)a3 font:(id)a4 bounds:(CGRect)a5 letMargin:(double)a6 numberOfLines:(int)a7 pageLabelFrame:(CGRect)a8 layoutDirection:(int64_t)a9
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v16 = a3;
  id v17 = a4;
  CGFloat v32 = CGRectZero.size.height;
  CGFloat MinY = CGRectGetMinY(a8);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v35);
  if (CGRectGetWidth(a8) <= 0.0)
  {
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    double v21 = CGRectGetWidth(v37);
    CGFloat v20 = v32;
    CGFloat v19 = MinY;
  }
  else
  {
    if (a9 == 1)
    {
      v36.origin.CGFloat x = x;
      v36.origin.CGFloat y = y;
      v36.size.CGFloat width = width;
      v36.size.CGFloat height = height;
      double rect = CGRectGetWidth(v36);
      double v18 = rect - CGRectGetMaxX(a8);
      CGFloat v20 = v32;
      CGFloat v19 = MinY;
    }
    else
    {
      CGFloat recta = CGRectZero.size.width;
      double v22 = CGRectGetMinX(a8);
      CGFloat v19 = MinY;
      v38.origin.CGFloat x = MinX;
      v38.origin.CGFloat y = MinY;
      v38.size.CGFloat width = recta;
      CGFloat v20 = v32;
      v38.size.CGFloat height = v32;
      double v18 = v22 - CGRectGetMinX(v38);
    }
    double v21 = v18 - a6;
  }
  double v23 = MinX;
  if (v16)
  {
    v39.origin.CGFloat x = MinX;
    v39.origin.CGFloat y = v19;
    v39.size.CGFloat width = v21;
    v39.size.CGFloat height = v20;
    +[AEHighlightedTextLabel sizeForAnnotation:v16 font:v17 width:a7 numberOfLines:0 useSelectedText:CGRectGetWidth(v39)];
    CGFloat v20 = v24;
  }
  if (a9 == 1)
  {
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    double v23 = CGRectGetMaxX(v40) - v21;
  }

  double v25 = v23;
  double v26 = v19;
  double v27 = v21;
  double v28 = v20;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

+ (id)noteTextFrameInPopoverForString:(double)a3 font:(double)a4 bounds:(double)a5 highlightedTextFrame:(double)a6 pageLabelFrame:(double)a7
{
  return [a1 noteTextFrameForString:a11 font:a12 bounds:3, 0, a2, a3, a4, a5, 5.0, *(void *)&a6, *(void *)&a7, *(void *)&a8, *(void *)&a9, a17, a18, a19];
}

+ (id)noteTextFrameForString:(double)a3 font:(double)a4 bounds:(double)a5 highlightedTextFrame:(double)a6 pageLabelFrame:(double)a7
{
  return [a1 noteTextFrameForString:a11 font:a12 bounds:3, 0, a2, a3, a4, a5, 15.0, *(void *)&a6, *(void *)&a7, *(void *)&a8, *(void *)&a9, a17, a18, a19];
}

+ (double)noteTextFrameForString:(CGFloat)a3 font:(CGFloat)a4 bounds:(double)a5 spacingToItemAbove:(uint64_t)a6 numberOfLines:(uint64_t)a7 matchesWidthOfHighlightedText:(void *)a8 highlightedTextFrame:(void *)a9 pageLabelFrame:(int)a10
{
  double v29 = a17;
  double v28 = a18;
  double v31 = a15;
  double v30 = a16;
  id v32 = a8;
  id v33 = a9;
  CGFloat height = CGRectZero.size.height;
  v50.origin.CGFloat x = a15;
  v50.origin.CGFloat y = a16;
  v50.size.CGFloat width = a17;
  v50.size.CGFloat height = a18;
  double MaxY = CGRectGetMaxY(v50);
  v51.origin.CGFloat x = a1;
  v51.origin.CGFloat y = a2;
  v51.size.CGFloat width = a3;
  v51.size.CGFloat height = a4;
  CGFloat MinX = CGRectGetMinX(v51);
  if ([v32 isNotWhitespace])
  {
    if ((a11 & 1) == 0)
    {
      v52.origin.CGFloat x = a15;
      v52.origin.CGFloat y = a16;
      v52.size.CGFloat width = a17;
      v52.size.CGFloat height = a18;
      double v43 = CGRectGetMaxY(v52);
      v53.origin.CGFloat x = a19;
      v53.origin.CGFloat y = a20;
      v53.size.CGFloat width = a21;
      v53.size.CGFloat height = a22;
      if (v43 >= CGRectGetMaxY(v53))
      {
        double v28 = a4;
        double v29 = a3;
        double v30 = a2;
        double v31 = a1;
      }
    }
    v54.origin.CGFloat x = v31;
    v54.origin.CGFloat y = v30;
    v54.size.CGFloat width = v29;
    v54.size.CGFloat height = v28;
    CGFloat Width = CGRectGetWidth(v54);
    [v33 lineHeight];
    double v36 = v35;
    id v37 = objc_alloc_init((Class)NSStringDrawingContext);
    v55.size.CGFloat height = height;
    double v38 = MinX;
    v55.origin.CGFloat x = MinX;
    v55.origin.CGFloat y = MaxY + a5;
    v55.size.CGFloat width = Width;
    double v39 = CGRectGetWidth(v55);
    double v40 = v36 * (double)a10;
    NSAttributedStringKey v48 = NSFontAttributeName;
    id v49 = v33;
    double v41 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    [v32 boundingRectWithSize:35 options:v41 attributes:v37 context:v39];
  }
  else
  {
    double v38 = MinX;
  }

  return v38;
}

+ (CGRect)dateLabelFrameForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 minY:(double)a6 layoutDirection:(int64_t)a7
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v14 = a6 + 3.0;
  id v15 = a4;
  id v16 = a3;
  [v15 ascender];
  double v18 = v17;
  [v15 descender];
  *(float *)&double v19 = v14 + (v18 - v19) * 0.200000003;
  double v20 = floorf(*(float *)&v19);
  [a1 dateLabelSizeForString:v16 font:v15 bounds:x, y, width, height];
  CGFloat v22 = v21;

  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  if (a7 == 1)
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v23);
    v32.origin.double x = CGRectZero.origin.x;
    v32.origin.double y = v20;
    v32.size.double width = width;
    v32.size.double height = v22;
    double MinX = MaxX - CGRectGetWidth(v32);
  }
  else
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v23);
  }
  double v29 = v20 + 5.0;
  double v30 = width;
  double v31 = v22;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.double y = v29;
  result.origin.double x = MinX;
  return result;
}

+ (CGRect)dateLabelFrameInPopoverForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 minY:(double)a6 pageLabelFrame:(CGRect)a7 layoutDirection:(int64_t)a8
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v12 = a6 + 5.0;
  [a1 dateLabelSizeForString:a3 font:a4 bounds:a8 origin.x];
  CGFloat v14 = v13;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v20);
  v21.origin.CGFloat x = CGRectZero.origin.x;
  v21.origin.CGFloat y = v12;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = v14;
  double v16 = MaxX - CGRectGetWidth(v21);
  double v17 = v12;
  double v18 = width;
  double v19 = v14;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

+ (double)bottomPadding
{
  int v2 = isPhone();
  double result = 19.0;
  if (v2) {
    return 15.0;
  }
  return result;
}

+ (double)cellHeightInPopoverForBounds:(CGRect)a3 highlightFont:(id)a4 annotation:(id)a5 dateString:(id)a6 pageString:(id)a7 layoutDirection:(int64_t)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v58 = a3.origin.x;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  CGRect v21 = [a1 pageNumberFontForPopover];
  [a1 pageLabelFrameInPopoverForString:v17 font:v21 bounds:a8 layoutDirection:x, y, width, height];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  double v60 = v25;
  double v61 = v23;
  double v59 = v29;
  [a1 highlightedTextFrameInPopoverForAnnotation:v19 font:v20 bounds:a8 pageLabelFrame:x y:y width:width height:height layoutDirection:v23 pageLabelFrame:v25 pageLabelFrame:v27 pageLabelFrame:v29];
  double v56 = v31;
  double v57 = v30;
  double v54 = v33;
  double v55 = v32;
  double v34 = v33;

  double v35 = [a1 noteFontForPopover];
  double v36 = [v19 annotationNote];

  [a1 noteTextFrameInPopoverForString:v36 font:v35 bounds:v58 highlightedTextFrame:y width:width height:height pageLabelFrame:v57 pageLabelFrame:v56 pageLabelFrame:v55 pageLabelFrame:v34 pageLabelFrame:v23 pageLabelFrame:v25 pageLabelFrame:v27 pageLabelFrame:v29];
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat v42 = v41;
  double v44 = v43;

  v45 = [a1 dateFontForPopover];
  v62.origin.double x = v38;
  v62.origin.double y = v40;
  v62.size.double width = v42;
  v62.size.double height = v44;
  double MaxY = CGRectGetMaxY(v62);
  v63.origin.double x = v57;
  v63.origin.double y = v56;
  v63.size.double width = v55;
  v63.size.double height = v54;
  double v47 = CGRectGetMaxY(v63);
  if (MaxY >= v47) {
    double v48 = MaxY;
  }
  else {
    double v48 = v47;
  }
  [a1 dateLabelFrameInPopoverForString:v18 font:v45 bounds:a8 minY:v58 pageLabelFrame:y width:width height:height layoutDirection:v48 pageLabelFrame:v27];
  double v50 = v49;

  double v51 = v44 + 5.0;
  if (v44 <= 0.0) {
    double v51 = 0.0;
  }
  double v52 = v54 + 8.0 + 5.0 + v51 + v50 + 8.0;

  return v52;
}

- (void).cxx_destruct
{
}

@end
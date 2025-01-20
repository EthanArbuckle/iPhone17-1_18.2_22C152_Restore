@interface BKTOCPointAnnotationTableCell
+ (CGRect)chapterTitleFrameForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 pageLabelFrame:(CGRect)a6 layoutDirection:(int64_t)a7;
+ (CGRect)chapterTitleFrameForString:(id)a3 font:(id)a4 letMargin:(double)a5 numberOfLines:(int)a6 bounds:(CGRect)a7 pageLabelFrame:(CGRect)a8 layoutDirection:(int64_t)a9;
+ (CGRect)chapterTitleFrameInPopoverForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 pageLabelFrame:(CGRect)a6 layoutDirection:(int64_t)a7;
+ (CGRect)dateLabelFrameForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 pageLabelFrame:(CGRect)a6 layoutDirection:(int64_t)a7;
+ (CGRect)dateLabelFrameInPopoverForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 minY:(double)a6 pageLabelFrame:(CGRect)a7 layoutDirection:(int64_t)a8;
+ (CGRect)pageLabelFrameInPopoverForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 layoutDirection:(int64_t)a6;
+ (CGSize)sizeForString:(id)a3 font:(id)a4 width:(double)a5 numberOfLines:(int)a6;
+ (double)cellHeightForCellWidth:(double)a3 chapterString:(id)a4 dateString:(id)a5 pageString:(id)a6 layoutDirection:(int64_t)a7;
+ (id)chapterFontForPopover;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (void)layoutSubviewsNotEditingWithBounds:(CGRect)a3;
@end

@implementation BKTOCPointAnnotationTableCell

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
  id v14 = [(BKTOCPointAnnotationTableCell *)self effectiveUserInterfaceLayoutDirection];
  if (v8)
  {
    [v9 pageLabelFrameInPopoverForString:v11 font:v13 bounds:v14 layoutDirection:x, y, width, height];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v105 = height;
    double v22 = v21;
    v23 = [(BKTOCTableViewCell *)self pageLabel];
    [v23 setFrame:v16, v18, v20, v22];

    v24 = objc_opt_class();
    v25 = [(BKTOCAnnotationTableCell *)self noteLabel];
    v26 = [v25 text];
    v27 = [(BKTOCAnnotationTableCell *)self noteLabel];
    v28 = [v27 font];
    v29 = [(BKTOCTableViewCell *)self pageLabel];
    [v29 frame];
    [v24 chapterTitleFrameInPopoverForString:v26 font:v28 bounds:x, y, width, v105, v30, v31, v32, v33 layoutDirection:[self effectiveUserInterfaceLayoutDirection]];
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    v42 = [(BKTOCAnnotationTableCell *)self noteLabel];
    [v42 setFrame:v35, v37, v39, v41];

    v43 = objc_opt_class();
    v44 = [(BKTOCAnnotationTableCell *)self dateLabel];
    v45 = [v44 text];
    v46 = [(BKTOCAnnotationTableCell *)self dateLabel];
    v47 = [v46 font];
    v48 = [(BKTOCAnnotationTableCell *)self noteLabel];
    [v48 frame];
    double MaxY = CGRectGetMaxY(v107);
    v50 = [(BKTOCTableViewCell *)self pageLabel];
    [v50 frame];
    double height = v105;
    [v43 dateLabelFrameInPopoverForString:v45 font:v47 bounds:x, y, width, v105, MaxY, v51, v52, v53, v54];
    double v56 = v55;
    double v58 = v57;
    double v60 = v59;
    double v62 = v61;
    v63 = [(BKTOCAnnotationTableCell *)self dateLabel];
    [v63 setFrame:v56, v58, v60, v62];
  }
  else
  {
    [v9 pageLabelFrameForString:v11 font:v13 bounds:v14 layoutDirection:x y:y width:width height:height];
    double v65 = v64;
    double v67 = v66;
    double v69 = v68;
    double v71 = v70;
    v72 = [(BKTOCTableViewCell *)self pageLabel];
    [v72 setFrame:v65, v67, v69, v71];

    v73 = objc_opt_class();
    v74 = [(BKTOCAnnotationTableCell *)self noteLabel];
    v75 = [v74 text];
    v76 = [(BKTOCAnnotationTableCell *)self noteLabel];
    v77 = [v76 font];
    v78 = [(BKTOCTableViewCell *)self pageLabel];
    [v78 frame];
    [v73 chapterTitleFrameForString:v75 font:v77 bounds:x, y, width, height pageLabelFrame:v79 layoutDirection:[self effectiveUserInterfaceLayoutDirection] v80, v81, v82];
    double v84 = v83;
    double v86 = v85;
    double v88 = v87;
    double v90 = v89;
    v91 = [(BKTOCAnnotationTableCell *)self noteLabel];
    [v91 setFrame:v84, v86, v88, v90];

    v92 = objc_opt_class();
    v44 = [(BKTOCAnnotationTableCell *)self dateLabel];
    v45 = [v44 text];
    v46 = [(BKTOCAnnotationTableCell *)self dateLabel];
    v47 = [v46 font];
    v48 = [(BKTOCTableViewCell *)self pageLabel];
    [v48 frame];
    [v92 dateLabelFrameForString:v45 font:v47 bounds:x, y, width, height pageLabelFrame:v93 layoutDirection:[self effectiveUserInterfaceLayoutDirection]];
    double v98 = v97;
    double v100 = v99;
    double v102 = v101;
    double v104 = v103;
    v50 = [(BKTOCAnnotationTableCell *)self dateLabel];
    [v50 setFrame:v98, v100, v102, v104];
  }

  v106.receiver = self;
  v106.super_class = (Class)BKTOCPointAnnotationTableCell;
  -[BKTOCAnnotationTableCell layoutSubviewsNotEditingWithBounds:](&v106, "layoutSubviewsNotEditingWithBounds:", x, y, width, height);
}

+ (CGRect)chapterTitleFrameForString:(id)a3 font:(id)a4 letMargin:(double)a5 numberOfLines:(int)a6 bounds:(CGRect)a7 pageLabelFrame:(CGRect)a8 layoutDirection:(int64_t)a9
{
  CGFloat rect = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  uint64_t v13 = *(void *)&a6;
  id v17 = a3;
  id v18 = a4;
  double v29 = a5;
  CGFloat MinY = CGRectGetMinY(a8);
  CGFloat v31 = width;
  if (a9 == 1)
  {
    double MinX = CGRectGetMaxX(a8) + a5;
  }
  else
  {
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = rect;
    double MinX = CGRectGetMinX(v34);
  }
  double v20 = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  if (objc_msgSend(v17, "length", *(void *)&v29))
  {
    if (CGRectGetWidth(a8) <= 0.0)
    {
      v36.origin.CGFloat x = x;
      v36.origin.CGFloat y = y;
      v36.size.CGFloat width = v31;
      v36.size.CGFloat height = rect;
      double v20 = CGRectGetWidth(v36);
    }
    else
    {
      if (a9 != 1)
      {
        double v23 = CGRectGetMinX(a8);
        v37.origin.CGFloat x = MinX;
        CGFloat v22 = MinY;
        v37.origin.CGFloat y = MinY;
        v37.size.CGFloat width = v20;
        v37.size.CGFloat height = height;
        double v20 = v23 - CGRectGetMinX(v37) - v30;
        goto LABEL_12;
      }
      v35.origin.CGFloat x = x;
      v35.origin.CGFloat y = y;
      v35.size.CGFloat width = v31;
      v35.size.CGFloat height = rect;
      double v20 = CGRectGetWidth(v35) - v20 - v30 - a8.size.width;
    }
    CGFloat v22 = MinY;
LABEL_12:
    v38.origin.CGFloat x = MinX;
    v38.origin.CGFloat y = v22;
    v38.size.CGFloat width = v20;
    v38.size.CGFloat height = height;
    [a1 sizeForString:v17 font:v18 width:v13 numberOfLines:CGRectGetWidth(v38)];
    CGFloat height = v24;
    goto LABEL_13;
  }
  CGFloat v22 = MinY;
LABEL_13:

  double v25 = MinX;
  double v26 = v22;
  double v27 = v20;
  double v28 = height;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

+ (CGRect)chapterTitleFrameInPopoverForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 pageLabelFrame:(CGRect)a6 layoutDirection:(int64_t)a7
{
  [a1 chapterTitleFrameForString:a3 font:a4 letMargin:2 numberOfLines:a7 bounds:CGRectMake(a5.origin.x, a5.origin.y, a5.size.width, a5.size.height) pageLabelFrame:CGRectMake(*(void *)&a6.origin.x, *(void *)&a6.origin.y, *(void *)&a6.size.width, *(void *)&a6.size.height) layoutDirection:];
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

+ (CGRect)chapterTitleFrameForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 pageLabelFrame:(CGRect)a6 layoutDirection:(int64_t)a7
{
  [a1 chapterTitleFrameForString:a3 font:a4 letMargin:1 numberOfLines:a7 bounds:CGRectMake(a5.origin.x, a5.origin.y, a5.size.width, a5.size.height) pageLabelFrame:CGRectMake(*(void *)&a6.origin.x, *(void *)&a6.origin.y, *(void *)&a6.size.width, *(void *)&a6.size.height) layoutDirection:15.0];
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v9;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v7;
  return result;
}

+ (CGRect)pageLabelFrameInPopoverForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 layoutDirection:(int64_t)a6
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___BKTOCPointAnnotationTableCell;
  [super pageLabelFrameForString:a3 font:a4 bounds:a6 topMargin:a5.origin.x layoutDirection:a5.origin.y];
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

+ (CGRect)dateLabelFrameForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 pageLabelFrame:(CGRect)a6 layoutDirection:(int64_t)a7
{
  CGFloat height = a6.size.height;
  double width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  double rect = a5.size.height;
  double v12 = a5.size.width;
  double v13 = a5.origin.y;
  double v14 = a5.origin.x;
  double v31 = CGRectZero.size.width;
  if (a7 == 1)
  {
    id v17 = a4;
    id v18 = a3;
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.double width = width;
    v33.size.CGFloat height = height;
    double MinX = CGRectGetMaxX(v33) + 15.0;
    v34.origin.CGFloat x = v14;
    v34.origin.CGFloat y = v13;
    v34.size.double width = v12;
    v34.size.CGFloat height = rect;
    double v20 = CGRectGetWidth(v34) - v31 - 15.0 - width;
  }
  else
  {
    CGFloat v30 = CGRectZero.size.height;
    id v21 = a4;
    id v22 = a3;
    v35.origin.CGFloat x = v14;
    v35.origin.CGFloat y = v13;
    v35.size.double width = v12;
    v35.size.CGFloat height = rect;
    double MinX = CGRectGetMinX(v35);
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.double width = width;
    v36.size.CGFloat height = height;
    double v23 = CGRectGetMinX(v36);
    v37.origin.CGFloat y = 41.0;
    v37.origin.CGFloat x = MinX;
    v37.size.CGFloat height = v30;
    v37.size.double width = v31;
    double v20 = v23 - CGRectGetMinX(v37) - 15.0;
  }
  [a1 dateLabelSizeForString:a3 font:a4 bounds:v14, v13, v12, rect];
  double v25 = v24;

  double v26 = 41.0;
  double v27 = MinX;
  double v28 = v20;
  double v29 = v25;
  result.size.CGFloat height = v29;
  result.size.double width = v28;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v27;
  return result;
}

+ (CGRect)dateLabelFrameInPopoverForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 minY:(double)a6 pageLabelFrame:(CGRect)a7 layoutDirection:(int64_t)a8
{
  double width = a5.size.width;
  double height = a5.size.height;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v29 = CGRectZero.size.width;
  double v13 = a6 + 3.0;
  if (a8 == 1)
  {
    id v14 = a4;
    id v15 = a3;
    double MinX = CGRectGetMaxX(a7) + 8.0;
    v32.origin.double x = x;
    v32.origin.double y = y;
    v32.size.double width = width;
    v32.size.double height = height;
    double v17 = CGRectGetWidth(v32) - v29 + -8.0 - a7.size.width;
  }
  else
  {
    CGFloat v28 = CGRectZero.size.height;
    id v18 = a4;
    id v19 = a3;
    v33.origin.double x = x;
    v33.origin.double y = y;
    v33.size.double width = width;
    v33.size.double height = height;
    double MinX = CGRectGetMinX(v33);
    double v20 = CGRectGetMinX(a7);
    v34.origin.double x = MinX;
    v34.origin.double y = v13;
    v34.size.double height = v28;
    v34.size.double width = v29;
    double v17 = v20 - CGRectGetMinX(v34) + -8.0;
  }
  double v21 = v13;
  [a1 dateLabelSizeForString:a3 font:a4 bounds:x, y, width, height, *(void *)&v28];
  double v23 = v22;

  double v24 = MinX;
  double v25 = v21;
  double v26 = v17;
  double v27 = v23;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (id)accessibilityLabel
{
  v3 = [(BKTOCAnnotationTableCell *)self noteLabel];
  v4 = [v3 accessibilityLabel];

  v5 = [(BKTOCAnnotationTableCell *)self dateLabel];
  double v6 = [v5 accessibilityLabel];

  double v7 = [(BKTOCTableViewCell *)self pageLabel];
  double v8 = [v7 accessibilityLabel];

  if ([v8 length])
  {
    double v9 = AEAXLocString(@"page.num %@");
    uint64_t v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v8);

    v11 = +[NSString stringWithFormat:@"%@, %@, %@", v4, v6, v10];
    double v8 = (void *)v10;
  }
  else
  {
    v11 = +[NSString stringWithFormat:@"%@, %@", v4, v6];
  }

  return v11;
}

- (id)accessibilityUserInputLabels
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = [(BKTOCTableViewCell *)self pageLabel];
  v5 = [v4 accessibilityLabel];

  if ([v5 length])
  {
    double v6 = AEAXLocString(@"page.num %@");
    uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v5);

    [v3 addObject:v7];
    v5 = (void *)v7;
  }
  double v8 = [(BKTOCAnnotationTableCell *)self noteLabel];
  double v9 = [v8 accessibilityLabel];

  if ([v9 length]) {
    [v3 addObject:v9];
  }
  v12.receiver = self;
  v12.super_class = (Class)BKTOCPointAnnotationTableCell;
  uint64_t v10 = [(BKTOCPointAnnotationTableCell *)&v12 accessibilityUserInputLabels];
  if (v10) {
    [v3 addObjectsFromArray:v10];
  }

  return v3;
}

+ (double)cellHeightForCellWidth:(double)a3 chapterString:(id)a4 dateString:(id)a5 pageString:(id)a6 layoutDirection:(int64_t)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = [a1 pageNumberFontForPopover];
  double v40 = a3;
  [a1 pageLabelFrameInPopoverForString:v12 font:v15 bounds:a7 layoutDirection:0.0, 0.0, a3, 1.79769313e308];
  double v17 = v16;
  double v39 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = [a1 chapterFontForPopover];
  [a1 chapterTitleFrameInPopoverForString:v14 font:v24 bounds:a7 pageLabelFrame:0.0, 0.0, a3 layoutDirection:1.79769313e308 v17, v19, v21, v23];
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  double v32 = v31;

  CGRect v33 = [a1 dateFontForPopover];
  v41.origin.double x = v26;
  v41.origin.double y = v28;
  v41.size.double width = v30;
  v41.size.double height = v32;
  [a1 dateLabelFrameInPopoverForString:v13 font:v33 bounds:a7 minY:0.0 pageLabelFrame:v40 layoutDirection:1.79769313e308 maxY:CGRectGetMaxY(v41) pageLabelFrame:v39 layoutDirection:v19 layoutDirection:v21 layoutDirection:v23];
  double v35 = v34;

  float v36 = v32;
  float v37 = v35;
  return ceilf(v36) + 8.0 + 3.0 + ceilf(v37) + 8.0;
}

+ (id)chapterFontForPopover
{
  v2 = +[UITraitCollection currentTraitCollectionLimitedToSizeCategory:UIContentSizeCategoryAccessibilityLarge];
  id v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline compatibleWithTraitCollection:v2];

  return v3;
}

+ (CGSize)sizeForString:(id)a3 font:(id)a4 width:(double)a5 numberOfLines:(int)a6
{
  id v9 = a4;
  id v10 = a3;
  [v9 lineHeight];
  double v12 = v11;
  if (a6 >= 2)
  {
    [v9 leading];
    double v12 = (v12 + v13) * (double)a6;
  }
  +[UILabel bkSizeForString:constrainedToSize:font:lineBreakMode:](UILabel, "bkSizeForString:constrainedToSize:font:lineBreakMode:", v10, v9, 0, a5, v12);
  double v15 = v14;
  double v17 = v16;

  float v18 = v15;
  double v19 = ceilf(v18);
  float v20 = v17;
  double v21 = ceilf(v20);
  result.double height = v21;
  result.double width = v19;
  return result;
}

@end
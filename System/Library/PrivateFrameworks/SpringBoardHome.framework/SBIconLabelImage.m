@interface SBIconLabelImage
+ (BOOL)attributedText:(id)a3 fitsInRect:(CGRect)a4 textRect:(CGRect *)a5;
+ (BOOL)needsLegibilityImageForParameters:(id)a3;
+ (CGSize)_maxLegibilityImageSizeForLabelSize:(CGSize)a3;
+ (double)legibilityStrengthForLegibilityStyle:(int64_t)a3;
+ (id)imageWithParameters:(id)a3;
+ (id)imageWithParameters:(id)a3 pool:(id)a4;
+ (void)applyKerning:(double)a3 whitespaceKerning:(double)a4 toAttributedString:(id)a5;
- (BOOL)hasBaseline;
- (SBIconLabelImageParameters)parameters;
- (UIEdgeInsets)alignmentRectInsets;
- (double)baselineOffsetFromBottom;
- (id)_initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5 parameters:(id)a6 alignmentRectInsets:(UIEdgeInsets)a7 baselineOffsetFromBottom:(double)a8;
- (id)description;
@end

@implementation SBIconLabelImage

- (BOOL)hasBaseline
{
  return 1;
}

- (double)baselineOffsetFromBottom
{
  return self->_baselineOffsetFromBottom;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top = self->_alignmentRectInsets.top;
  double left = self->_alignmentRectInsets.left;
  double bottom = self->_alignmentRectInsets.bottom;
  double right = self->_alignmentRectInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
}

+ (double)legibilityStrengthForLegibilityStyle:(int64_t)a3
{
  double result = 0.3;
  if (a3 != 1) {
    return 0.0;
  }
  return result;
}

- (id)_initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(int64_t)a5 parameters:(id)a6 alignmentRectInsets:(UIEdgeInsets)a7 baselineOffsetFromBottom:(double)a8
{
  CGFloat right = a7.right;
  CGFloat bottom = a7.bottom;
  CGFloat left = a7.left;
  CGFloat top = a7.top;
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SBIconLabelImage;
  v18 = [(SBIconLabelImage *)&v22 initWithCGImage:a3 scale:a5 orientation:a4];
  if (v18)
  {
    uint64_t v19 = [v17 copy];
    parameters = v18->_parameters;
    v18->_parameters = (SBIconLabelImageParameters *)v19;

    v18->_alignmentRectInsets.CGFloat top = top;
    v18->_alignmentRectInsets.CGFloat left = left;
    v18->_alignmentRectInsets.CGFloat bottom = bottom;
    v18->_alignmentRectInsets.CGFloat right = right;
    v18->_baselineOffsetFromBottom = a8;
  }

  return v18;
}

+ (id)imageWithParameters:(id)a3 pool:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 overrideTraitCollection];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
    [MEMORY[0x1E4FB1E20] setCurrentTraitCollection:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = [v6 text];
  v110 = v10;
  if ((unint64_t)[v10 length] >= 0x65)
  {
    v110 = objc_msgSend(v10, "substringToIndex:", objc_msgSend(v10, "rangeOfComposedCharacterSequenceAtIndex:", 100));
  }
  v11 = [v6 contentSizeCategory];
  v103 = (void *)v8;
  v104 = v7;
  v101 = v11;
  v102 = v10;
  if (v11)
  {
    NSComparisonResult v12 = UIContentSizeCategoryCompareToCategory(v11, (UIContentSizeCategory)*MEMORY[0x1E4FB27D0]);
    uint64_t v13 = [v6 font];
    if (v12 == NSOrderedDescending)
    {
      int v14 = 1;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v13 = [v6 font];
  }
  int v14 = [v6 canTruncate];
  LODWORD(v12) = 0;
LABEL_11:
  int v15 = [v6 canTighten];
  id v16 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  id v17 = v16;
  if (v14) {
    uint64_t v18 = 4;
  }
  else {
    uint64_t v18 = 2;
  }
  [v16 setLineBreakMode:v18];
  [v17 setAlignment:0];
  id v19 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v100 = (void *)v13;
  v20 = objc_msgSend(v19, "initWithObjectsAndKeys:", v13, *MEMORY[0x1E4FB06F8], v17, *MEMORY[0x1E4FB0738], 0);
  uint64_t v21 = [v6 textColor];
  if (v21) {
    [v20 setObject:v21 forKey:*MEMORY[0x1E4FB0700]];
  }
  v99 = (void *)v21;
  [v6 textInsets];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  [v6 maxSize];
  double v106 = v30;
  double v108 = v31;
  double v32 = v30 - (v25 + v29);
  double v33 = v31 - (v23 + v27);
  [v6 scale];
  double v111 = v34;
  v139.origin.x = v25 + 0.0;
  v139.origin.y = v23 + 0.0;
  v139.size.width = v32;
  v139.size.CGFloat height = v33;
  CGFloat v35 = CGRectGetWidth(v139) + 50.0;
  v140.origin.x = v25 + 0.0;
  v140.origin.y = v23 + 0.0;
  v140.size.width = v32;
  v140.size.CGFloat height = v33;
  objc_msgSend(v110, "boundingRectWithSize:options:attributes:context:", 0, v20, 0, v35, CGRectGetHeight(v140));
  v40 = 0;
  v137.origin.x = v36;
  v137.origin.y = v37;
  v137.size.width = v38;
  v137.size.CGFloat height = v39;
  if ((v14 | v15) == 1)
  {
    double Width = CGRectGetWidth(*(CGRect *)&v36);
    v141.origin.x = v25 + 0.0;
    v141.origin.y = v23 + 0.0;
    v141.size.width = v32;
    v141.size.CGFloat height = v33;
    if (Width <= CGRectGetWidth(v141))
    {
      v40 = 0;
    }
    else
    {
      uint64_t v42 = v9;
      v40 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v110 attributes:v20];
      unint64_t v43 = 0;
      if (v12 | v14 ^ 1) {
        uint64_t v44 = 15;
      }
      else {
        uint64_t v44 = 10;
      }
      if (v12) {
        double v45 = 1.5;
      }
      else {
        double v45 = 3.0;
      }
      while (v44 != v43)
      {
        ++v43;
        [a1 applyKerning:v40 whitespaceKerning:(double)v43 * -0.1 toAttributedString:v45 * ((double)v43 * -0.1)];
        if (objc_msgSend(a1, "attributedText:fitsInRect:textRect:", v40, &v137, v25 + 0.0, v23 + 0.0, v32, v33))
        {
          uint64_t v9 = v42;
          goto LABEL_28;
        }
      }
      uint64_t v9 = v42;
      if (v14)
      {
        objc_msgSend(v40, "boundingRectWithSize:options:context:", 0, 0, v32, v33);
        v137.origin.x = v90;
        v137.origin.y = v91;
        v137.size.width = v92;
        v137.size.CGFloat height = v93;
      }
    }
  }
LABEL_28:
  double v46 = SBHEdgeInsetsInvert(v23);
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  [v6 fontLanguageInsets];
  uint64_t v97 = v48;
  double v98 = v46;
  uint64_t v95 = v52;
  uint64_t v96 = v50;
  UIEdgeInsetsAdd();
  UIRectIntegralWithScale();
  CGFloat v53 = v142.size.width;
  CGFloat height = v142.size.height;
  v142.origin.x = 0.0;
  v142.origin.y = 0.0;
  if (CGRectGetHeight(v142) <= v108
    && (v143.origin.x = 0.0,
        v143.origin.y = 0.0,
        v143.size.width = v53,
        v143.size.CGFloat height = height,
        CGRectGetWidth(v143) <= v106))
  {
    double v55 = v106;
  }
  else
  {
    UIRectGetCenter();
    double v55 = v106;
    UIRectCenteredAboutPoint();
    SBHEdgeInsetsForTransformingRectIntoRect(0.0, 0.0, v53, height, v56, v57, v58, v59);
  }
  UIEdgeInsetsAdd();
  double v61 = SBHEdgeInsetsInvert(v60);
  uint64_t v63 = v62;
  uint64_t v105 = v65;
  uint64_t v107 = v64;
  UIRectIntegralWithScale();
  CGFloat v66 = v144.size.width;
  CGFloat v67 = v144.size.height;
  v144.origin.x = 0.0;
  v144.origin.y = 0.0;
  double v68 = v108;
  if (CGRectGetWidth(v144) <= v55
    && (v145.origin.x = 0.0,
        v145.origin.y = 0.0,
        v145.size.width = v66,
        v145.size.CGFloat height = v67,
        CGRectGetHeight(v145) <= v108))
  {
    uint64_t v69 = v63;
    v70 = (void *)v9;
    double v55 = v66;
    double v68 = v67;
  }
  else
  {
    uint64_t v69 = v63;
    v70 = (void *)v9;
  }
  uint64_t v94 = v69;
  UIRectIntegralWithScale();
  CGFloat v72 = v71;
  CGFloat v74 = v73;
  double v109 = v61;
  CGFloat v75 = v137.size.width;
  CGFloat v76 = v137.size.height;
  v146.origin.x = 0.0;
  v146.origin.y = 0.0;
  v146.size.width = v55;
  v146.size.CGFloat height = v68;
  double MaxY = CGRectGetMaxY(v146);
  v147.origin.x = v72;
  v147.origin.y = v74;
  v147.size.width = v75;
  v147.size.CGFloat height = v76;
  double v78 = CGRectGetMaxY(v147);
  double v79 = MaxY - (v78 + CGRectGetMinY(v137));
  v80 = [v6 focusHighlightColor];
  if ([v6 isColorspaceGrayscale]) {
    uint64_t v81 = 4;
  }
  else {
    uint64_t v81 = 0;
  }
  v82 = (void *)MEMORY[0x1E4FB1818];
  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = __45__SBIconLabelImage_imageWithParameters_pool___block_invoke;
  v120[3] = &unk_1E6AAFDC0;
  id v83 = v80;
  id v121 = v83;
  CGFloat v125 = v72;
  CGFloat v126 = v74;
  CGFloat v127 = v75;
  CGFloat v128 = v76;
  double v129 = v98;
  uint64_t v130 = v97;
  uint64_t v131 = v96;
  uint64_t v132 = v95;
  uint64_t v133 = 0;
  uint64_t v134 = 0;
  double v135 = v55;
  double v136 = v68;
  id v84 = v40;
  id v122 = v84;
  id v85 = v110;
  id v123 = v85;
  id v86 = v20;
  id v124 = v86;
  v112[0] = MEMORY[0x1E4F143A8];
  v112[1] = 3221225472;
  v112[2] = __45__SBIconLabelImage_imageWithParameters_pool___block_invoke_2;
  v112[3] = &unk_1E6AAFDE8;
  id v114 = a1;
  id v87 = v6;
  id v113 = v87;
  double v115 = v109;
  uint64_t v116 = v94;
  uint64_t v117 = v107;
  uint64_t v118 = v105;
  double v119 = v79;
  v88 = objc_msgSend(v82, "sbf_imageFromContextWithSize:scale:type:pool:drawing:encapsulation:", v81, v104, v120, v112, v55, v68, v111);
  if (v70) {
    [MEMORY[0x1E4FB1E20] setCurrentTraitCollection:v70];
  }

  return v88;
}

uint64_t __45__SBIconLabelImage_imageWithParameters_pool___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    double v2 = *(double *)(a1 + 96);
    double v3 = *(double *)(a1 + 104);
    v18.origin.x = *(double *)(a1 + 64) + v3;
    v18.origin.y = *(double *)(a1 + 72) + v2;
    v18.size.width = *(double *)(a1 + 80) - (v3 + *(double *)(a1 + 120));
    v18.size.CGFloat height = *(double *)(a1 + 88) - (v2 + *(double *)(a1 + 112));
    CGRect v19 = CGRectIntersection(v18, *(CGRect *)(a1 + 128));
    v4 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height, 4.0);
    [*(id *)(a1 + 32) setFill];
    [v4 fill];
  }
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    double v6 = *(double *)(a1 + 64);
    double v7 = *(double *)(a1 + 72);
    double v8 = *(double *)(a1 + 80);
    double v9 = *(double *)(a1 + 88);
    return objc_msgSend(v5, "drawWithRect:options:context:", 1, 0, v6, v7, v8, v9);
  }
  else
  {
    v11 = *(void **)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    double v13 = *(double *)(a1 + 64);
    double v14 = *(double *)(a1 + 72);
    double v15 = *(double *)(a1 + 80);
    double v16 = *(double *)(a1 + 88);
    return objc_msgSend(v11, "drawWithRect:options:attributes:context:", 1, v12, 0, v13, v14, v15, v16);
  }
}

id __45__SBIconLabelImage_imageWithParameters_pool___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  v4 = objc_msgSend(objc_alloc(*(Class *)(a1 + 40)), "_initWithCGImage:scale:orientation:parameters:alignmentRectInsets:baselineOffsetFromBottom:", a2, a3, *(void *)(a1 + 32), a4, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  return v4;
}

+ (id)imageWithParameters:(id)a3
{
  return (id)[a1 imageWithParameters:a3 pool:0];
}

+ (CGSize)_maxLegibilityImageSizeForLabelSize:(CGSize)a3
{
  MEMORY[0x1F415C658](2, a2, (__n128)a3, *(__n128 *)&a3.height);
  result.CGFloat height = v4;
  result.width = v3;
  return result;
}

+ (BOOL)needsLegibilityImageForParameters:(id)a3
{
  return BSFloatIsZero() ^ 1;
}

+ (BOOL)attributedText:(id)a3 fitsInRect:(CGRect)a4 textRect:(CGRect *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  objc_msgSend(a3, "boundingRectWithSize:options:context:", 0, 0, 1.79769313e308, 1.79769313e308);
  if (a5)
  {
    a5->origin.CGFloat x = v10;
    a5->origin.CGFloat y = v11;
    a5->size.CGFloat width = v12;
    a5->size.CGFloat height = v13;
  }
  CGFloat v14 = round(CGRectGetWidth(*(CGRect *)&v10));
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  return v14 <= CGRectGetWidth(v16);
}

+ (void)applyKerning:(double)a3 whitespaceKerning:(double)a4 toAttributedString:(id)a5
{
  id v20 = a5;
  double v7 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  double v8 = [v20 string];
  uint64_t v9 = [v20 length];
  uint64_t v10 = [v8 rangeOfCharacterFromSet:v7];
  uint64_t v12 = v11;
  uint64_t v13 = 0;
  uint64_t v14 = *MEMORY[0x1E4FB0710];
  while (1)
  {
    uint64_t v15 = v10 == 0x7FFFFFFFFFFFFFFFLL ? v9 : v10;
    uint64_t v16 = v15 - v13;
    id v17 = [NSNumber numberWithDouble:a3];
    CGRect v18 = [NSNumber numberWithDouble:a4];
    objc_msgSend(v20, "addAttribute:value:range:", v14, v17, v13, v16);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    objc_msgSend(v20, "addAttribute:value:range:", v14, v18, v10, v12);
    uint64_t v13 = v10 + v12;
    uint64_t v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v7, 0, v10 + v12, v9 - (v10 + v12));
    uint64_t v12 = v19;
  }
}

- (id)description
{
  double v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [(SBIconLabelImage *)self size];
  id v4 = (id)objc_msgSend(v3, "appendSize:withName:", @"size");
  [(SBIconLabelImage *)self scale];
  id v5 = (id)objc_msgSend(v3, "appendFloat:withName:", @"scale");
  double v6 = NSStringFromUIEdgeInsets(self->_alignmentRectInsets);
  id v7 = (id)[v3 appendObject:v6 withName:@"alignmentRectInsets"];

  id v8 = (id)[v3 appendObject:self->_parameters withName:@"parameters"];
  id v9 = (id)[v3 appendFloat:@"baselineOffsetFromBottom" withName:self->_baselineOffsetFromBottom];
  uint64_t v10 = [v3 build];

  return v10;
}

- (SBIconLabelImageParameters)parameters
{
  return self->_parameters;
}

@end
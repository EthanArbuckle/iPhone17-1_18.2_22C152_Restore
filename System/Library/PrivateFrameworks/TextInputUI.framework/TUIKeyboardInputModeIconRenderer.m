@interface TUIKeyboardInputModeIconRenderer
- (id)attributedStringForPrimaryLabel:(id)a3 secondaryLabel:(id)a4 withTintColor:(id)a5 detailTintColor:(id)a6 language:(id)a7;
- (id)attributedStringWithText:(id)a3 color:(id)a4;
- (id)imageForPrimaryLabel:(id)a3 secondaryLabel:(id)a4 withConfiguration:(id)a5;
- (void)drawPrimaryLabel:(id)a3 secondaryLabel:(id)a4 withConfiguration:(id)a5 inContext:(CGContext *)a6;
@end

@implementation TUIKeyboardInputModeIconRenderer

- (id)imageForPrimaryLabel:(id)a3 secondaryLabel:(id)a4 withConfiguration:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v8 size];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v15 scale];
  double v17 = v16;

  if (v17 >= 1.0) {
    double v18 = v17;
  }
  else {
    double v18 = 1.0;
  }
  v22.width = v12;
  v22.height = v14;
  UIGraphicsBeginImageContextWithOptions(v22, 0, v18);
  [(TUIKeyboardInputModeIconRenderer *)self drawPrimaryLabel:v10 secondaryLabel:v9 withConfiguration:v8 inContext:UIGraphicsGetCurrentContext()];

  v19 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v19;
}

- (void)drawPrimaryLabel:(id)a3 secondaryLabel:(id)a4 withConfiguration:(id)a5 inContext:(CGContext *)a6
{
  v119[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v14 = *MEMORY[0x1E4F1DAD8];
  double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v12 size];
  double v16 = v15;
  double v18 = v17;
  uint64_t v19 = [v12 style];
  if (v19 == 3)
  {
    v124.origin.CGFloat x = v14;
    v124.origin.CGFloat y = v13;
    v124.size.CGFloat width = v16;
    v124.size.CGFloat height = v18;
    CGRect v125 = CGRectInset(v124, v18 / 3.0, 2.5);
    CGFloat x = v125.origin.x;
    CGFloat y = v125.origin.y;
    CGFloat width = v125.size.width;
    CGFloat height = v125.size.height;
    UIGraphicsPushContext(a6);
    v32 = (void *)MEMORY[0x1E4FB14C0];
    v126.origin.CGFloat x = v14;
    v126.origin.CGFloat y = v13;
    v126.size.CGFloat width = v16;
    v126.size.CGFloat height = v18;
    CGRect v127 = CGRectInset(v126, 0.75, 0.75);
    uint64_t v33 = objc_msgSend(v32, "_bezierPathWithPillRect:cornerRadius:", v127.origin.x, v127.origin.y, v127.size.width, v127.size.height, v18 * 0.5);
LABEL_7:
    v30 = (void *)v33;
    v40 = [v12 backgroundColor];
    [v40 setFill];

    [v30 fill];
    goto LABEL_8;
  }
  if (v19 == 2)
  {
    v128.origin.CGFloat x = v14;
    v128.origin.CGFloat y = v13;
    v128.size.CGFloat width = v16;
    v128.size.CGFloat height = v18;
    CGRect v129 = CGRectInset(v128, 2.5, 2.5);
    CGFloat x = v129.origin.x;
    CGFloat y = v129.origin.y;
    CGFloat width = v129.size.width;
    CGFloat height = v129.size.height;
    UIGraphicsPushContext(a6);
    v34 = (void *)MEMORY[0x1E4FB14C0];
    v130.origin.CGFloat x = v14;
    v130.origin.CGFloat y = v13;
    v130.size.CGFloat width = v16;
    v130.size.CGFloat height = v18;
    CGRect v131 = CGRectInset(v130, 0.75, 0.75);
    double v35 = v131.origin.x;
    double v36 = v131.origin.y;
    double v37 = v131.size.width;
    double v38 = v131.size.height;
    [v12 backgroundCornerRadius];
    uint64_t v33 = objc_msgSend(v34, "_bezierPathWithArcRoundedRect:cornerRadius:", v35, v36, v37, v38, v39);
    goto LABEL_7;
  }
  if (v19 != 1) {
    goto LABEL_9;
  }
  v120.origin.CGFloat x = v14;
  v120.origin.CGFloat y = v13;
  v120.size.CGFloat width = v16;
  v120.size.CGFloat height = v18;
  CGRect v121 = CGRectInset(v120, 2.5, 2.5);
  CGFloat x = v121.origin.x;
  CGFloat y = v121.origin.y;
  CGFloat width = v121.size.width;
  CGFloat height = v121.size.height;
  UIGraphicsPushContext(a6);
  v24 = (void *)MEMORY[0x1E4FB14C0];
  v122.origin.CGFloat x = v14;
  v122.origin.CGFloat y = v13;
  v122.size.CGFloat width = v16;
  v122.size.CGFloat height = v18;
  CGRect v123 = CGRectInset(v122, 0.75, 0.75);
  double v25 = v123.origin.x;
  double v26 = v123.origin.y;
  double v27 = v123.size.width;
  double v28 = v123.size.height;
  [v12 backgroundCornerRadius];
  v30 = objc_msgSend(v24, "_bezierPathWithPillRect:cornerRadius:", v25, v26, v27, v28, v29);
  v31 = [v12 backgroundColor];
  [v31 setStroke];

  [v30 setLineWidth:1.5];
  [v30 stroke];
LABEL_8:
  double v14 = x;
  double v13 = y;
  double v16 = width;
  double v18 = height;
  UIGraphicsPopContext();

LABEL_9:
  v41 = [v12 artwork];

  if (v41)
  {
    v42 = (void *)MEMORY[0x1E4FB1818];
    v43 = [v12 artwork];
    v44 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v45 = [v42 imageNamed:v43 inBundle:v44];

    v46 = [v12 tintColor];
    v47 = [v45 imageWithTintColor:v46 renderingMode:2];

    [v47 size];
    double v49 = v48;
    [v47 size];
    double v52 = v51;
    if (v18 >= v49)
    {
      double v66 = v50;
      [v12 baseFontSize];
      double v68 = v67 / 17.0 * (v18 / v52);
      double v69 = v66 * v68;
      double v70 = v52 * v68;
      double v71 = 0.5;
      double v72 = v14 + (v16 - v69) * 0.5;
      double v73 = v18 - v70;
    }
    else
    {
      double v53 = v51 * 0.62;
      [v47 size];
      if (v18 >= v53)
      {
        double v56 = v54;
        double v57 = v55;
      }
      else
      {
        double v56 = v16 / 0.62;
        double v57 = v18 / 0.62;
      }
      v132.origin.CGFloat x = v14;
      v132.origin.CGFloat y = v13;
      v132.size.CGFloat width = v16;
      v132.size.CGFloat height = v18;
      CGRect v133 = CGRectInset(v132, (v56 - v16) * -0.5, (v57 - v18) * -0.5);
      double v74 = v133.origin.x;
      double v13 = v133.origin.y;
      double v75 = v133.size.width;
      double v76 = v133.size.height;
      [v12 baseFontSize];
      double v78 = v77 / 17.0 * (v76 / v57);
      double v69 = v56 * v78;
      double v70 = v57 * v78;
      double v71 = 0.5;
      double v72 = v74 + (v75 - v69) * 0.5;
      double v73 = v76 - v70;
    }
    double v79 = v13 + v73 * v71;
    UIGraphicsPushContext(a6);
    objc_msgSend(v47, "drawInRect:", v72, v79, v69, v70);
    UIGraphicsPopContext();
  }
  else
  {
    [v12 baseFontSize];
    double v59 = v58;
    v60 = [v12 tintColor];
    v61 = [v12 tintColor];
    [v12 detailLabelAlpha];
    v62 = objc_msgSend(v61, "colorWithAlphaComponent:");
    v63 = [v12 language];
    v64 = [(TUIKeyboardInputModeIconRenderer *)self attributedStringForPrimaryLabel:v10 secondaryLabel:v11 withTintColor:v60 detailTintColor:v62 language:v63];

    if ((unint64_t)[v64 length] > 1) {
      double v59 = v59 + -1.0;
    }
    id v108 = v11;
    id v109 = v10;
    if ((unint64_t)[v64 length] >= 2)
    {
      if ([v64 length] == 2)
      {
        double v65 = 100.0;
      }
      else if ([v64 length] == 3)
      {
        double v65 = 65.0;
      }
      else if ((unint64_t)[v11 length] >= 2)
      {
        double v65 = 30.0;
      }
      else
      {
        double v65 = 40.0;
      }
    }
    else
    {
      double v65 = 110.0;
    }
    id v80 = objc_alloc(MEMORY[0x1E4FB08E8]);
    v118[0] = *MEMORY[0x1E4F24620];
    uint64_t v81 = *MEMORY[0x1E4F24660];
    v117[0] = *MEMORY[0x1E4F24640];
    uint64_t v82 = *MEMORY[0x1E4F246D8];
    v116[0] = v81;
    v116[1] = v82;
    v83 = [NSNumber numberWithDouble:*MEMORY[0x1E4F246C8]];
    v117[1] = v83;
    v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v117 forKeys:v116 count:2];
    v119[0] = v84;
    v118[1] = *MEMORY[0x1E4F24670];
    v114[0] = &unk_1EDC79938;
    v85 = [NSNumber numberWithDouble:v65];
    v114[1] = &unk_1EDC79950;
    v115[0] = v85;
    v86 = [NSNumber numberWithDouble:v18];
    v115[1] = v86;
    v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:v114 count:2];
    v119[1] = v87;
    v88 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:v118 count:2];
    v89 = (void *)[v80 initWithFontAttributes:v88];

    v90 = [v12 fontFamily];

    if (v90)
    {
      v91 = [v12 fontFamily];
      uint64_t v92 = [v89 fontDescriptorWithFamily:v91];

      v89 = (void *)v92;
    }
    uint64_t v93 = *MEMORY[0x1E4FB06F8];
    uint64_t v94 = 5;
    while (1)
    {
      v95 = objc_msgSend(MEMORY[0x1E4FB08E0], "fontWithDescriptor:size:", v89, v59, v108, v109);
      objc_msgSend(v64, "addAttribute:value:range:", v93, v95, 0, objc_msgSend(v64, "length"));
      [v64 size];
      double v97 = v96 / v16;
      double v99 = v98 / v18;
      if (v97 <= 1.0 && v99 <= 1.0) {
        break;
      }
      if (v97 < v99) {
        double v97 = v99;
      }
      double v101 = v59 / v97;
      if (v59 + -0.5 >= v101) {
        double v59 = v101;
      }
      else {
        double v59 = v59 + -0.5;
      }

      if (!--v94) {
        goto LABEL_42;
      }
    }

LABEL_42:
    v102 = CTLineCreateWithAttributedString((CFAttributedStringRef)v64);
    CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v102, 0x80uLL);
    double v103 = BoundsWithOptions.size.width;
    CGRect v135 = CTLineGetBoundsWithOptions(v102, 8uLL);
    v135.size = *(CGSize *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v113.a = *MEMORY[0x1E4F1DAB8];
    *(CGSize *)&v113.c = v135.size;
    *(_OWORD *)&v113.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v104 = v14 + (v16 - v103) * 0.5;
    double v105 = v13 + v135.origin.y + (v18 + v135.size.height) * 0.5;
    *(_OWORD *)&transform.a = *(_OWORD *)&v113.a;
    *(CGSize *)&transform.c = v135.size;
    *(_OWORD *)&transform.tCGFloat x = *(_OWORD *)&v113.tx;
    CGAffineTransformScale(&v113, &transform, 1.0, -1.0);
    CGAffineTransform v111 = v113;
    CGAffineTransformTranslate(&transform, &v111, 0.0, v18);
    CGAffineTransform v113 = transform;
    CGAffineTransformInvert(&v110, &transform);
    CGFloat v106 = v110.tx + v105 * v110.c + v110.a * v104;
    CGFloat v107 = v110.ty + v105 * v110.d + v110.b * v104;
    CGContextSaveGState(a6);
    CGAffineTransform transform = v113;
    CGContextConcatCTM(a6, &transform);
    CGContextSetTextPosition(a6, v106, v107);
    CTLineDraw(v102, a6);
    CGContextRestoreGState(a6);
    CFRelease(v102);

    id v11 = v108;
    id v10 = v109;
  }
}

- (id)attributedStringForPrimaryLabel:(id)a3 secondaryLabel:(id)a4 withTintColor:(id)a5 detailTintColor:(id)a6 language:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v14)
  {
    id v14 = [MEMORY[0x1E4FB1618] labelColor];
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  uint64_t v18 = [v13 length];
  id v19 = v12;
  if (v18)
  {
    v20 = [(TUIKeyboardInputModeIconRenderer *)self attributedStringWithText:v12 color:v15];
    [v17 appendAttributedString:v20];

    v21 = [(TUIKeyboardInputModeIconRenderer *)self attributedStringWithText:@" " color:v14];
    [v17 appendAttributedString:v21];

    id v19 = v13;
  }
  CGSize v22 = [(TUIKeyboardInputModeIconRenderer *)self attributedStringWithText:v19 color:v14];
  [v17 appendAttributedString:v22];

  if (v16) {
    objc_msgSend(v17, "addAttribute:value:range:", *MEMORY[0x1E4F284F8], v16, 0, objc_msgSend(v17, "length"));
  }

  return v17;
}

- (id)attributedStringWithText:(id)a3 color:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)MEMORY[0x1E4F28B18];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  uint64_t v12 = *MEMORY[0x1E4FB0700];
  v13[0] = v6;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  id v10 = (void *)[v8 initWithString:v7 attributes:v9];
  return v10;
}

@end
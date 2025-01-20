@interface NSAttributedString(NSExtendedStringDrawing)
- (double)boundingRectWithSize:()NSExtendedStringDrawing options:context:;
- (id)_ui_attributedSubstringFromRange:()NSExtendedStringDrawing scaledByScaleFactor:;
- (id)_ui_attributedSubstringFromRange:()NSExtendedStringDrawing withTrackingAdjustment:;
- (uint64_t)boundingRectWithSize:()NSExtendedStringDrawing options:;
- (uint64_t)drawWithRect:()NSExtendedStringDrawing options:;
- (uint64_t)hasColorGlyphsInRange:()NSExtendedStringDrawing;
- (void)drawWithRect:()NSExtendedStringDrawing options:context:;
@end

@implementation NSAttributedString(NSExtendedStringDrawing)

- (double)boundingRectWithSize:()NSExtendedStringDrawing options:context:
{
  double v11 = MEMORY[0x192FAD920](0.15);
  double v12 = MEMORY[0x192FAD930](0.0);
  uint64_t v13 = objc_msgSend((id)-[__CFString string](a1, "string"), "length");
  if (!a6) {
    goto LABEL_19;
  }
  unint64_t v14 = v13;
  if (!v13) {
    goto LABEL_19;
  }
  [a6 minimumScaleFactor];
  if (v15 <= 0.0) {
    goto LABEL_19;
  }
  uint64_t v77 = 0;
  uint64_t v78 = 0;
  id v16 = (id)objc_msgSend((id)-[__CFString attribute:atIndex:longestEffectiveRange:inRange:](a1, "attribute:atIndex:longestEffectiveRange:inRange:", @"NSParagraphStyle", 0, &v77, 0, objc_msgSend((id)-[__CFString string](a1, "string"), "length")), "mutableCopy");
  if (v16)
  {
    if ((v17 = v16, [v16 lineBreakMode] <= 1) && objc_msgSend(a6, "maximumNumberOfLines") != 1
      || (uint64_t v18 = v78, v18 != objc_msgSend((id)-[__CFString string](a1, "string"), "length"))
      || ([v17 firstLineHeadIndent], v19 != 0.0))
    {
LABEL_19:
      double v41 = __NSStringDrawingEngine(a1, 0, a5, 0, a6, 0, 0, 0.0, 0.0, a2, a3, 0.0);
      goto LABEL_20;
    }
  }
  double v71 = v11;
  [a6 setWantsBaselineOffset:1];
  uint64_t v20 = [a6 maximumNumberOfLines];
  if (v20 == 1) {
    double v21 = 9000000.0;
  }
  else {
    double v21 = a2;
  }
  CGFloat v74 = v21;
  double v72 = __NSStringDrawingEngine(a1, 0, a5, 0, a6, 0, 0, 0.0, 0.0, v21, 9000000.0, 0.0);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  uint64_t v28 = [a6 maximumNumberOfLines];
  unint64_t v29 = v28;
  BOOL v30 = 0;
  unsigned __int8 v76 = 0;
  double v70 = v12;
  double v31 = v27;
  double v32 = v25;
  if (v20 != 1 && v28)
  {
    objc_msgSend(a6, "setMaximumNumberOfLines:", objc_msgSend(a6, "maximumNumberOfLines") + 1);
    double v33 = __NSStringDrawingEngine(a1, 0, a5, 0, a6, 0, &v76, 0.0, 0.0, v74, 9000000.0, 0.0);
    double v32 = v34;
    double v31 = v35;
    BOOL v36 = objc_msgSend(a6, "numberOfLineFragments", v33) > v29;
    if (v14 >= 0x201) {
      BOOL v30 = v36;
    }
    else {
      BOOL v30 = (v76 | v36) != 0;
    }
  }
  [a6 minimumScaleFactor];
  double v38 = v37;
  [a6 baselineOffset];
  double v73 = v39;
  if (v20 == 1)
  {
    double v40 = a2 / v32;
    if (v40 > 1.0)
    {
      if (boundingRectWithSize_options_context__onceToken != -1) {
        dispatch_once(&boundingRectWithSize_options_context__onceToken, &__block_literal_global_335);
      }
      if (boundingRectWithSize_options_context__scaleSingleLineWithHeight) {
        double v40 = a3 / v31;
      }
    }
  }
  else
  {
    double v40 = a3 / v31;
  }
  if (v40 <= 1.0) {
    double v44 = v40;
  }
  else {
    double v44 = 1.0;
  }
  if (v44 >= v38) {
    double v45 = v44;
  }
  else {
    double v45 = v38;
  }
  uint64_t v46 = [a6 cachesLayout];
  [a6 setCachesLayout:0];
  int v47 = v45 < 1.0 || v30;
  double v48 = v73;
  if (v47 != 1) {
    goto LABEL_39;
  }
  uint64_t v49 = [(__CFString *)a1 length];
  double v50 = fmax(v38, 0.0);
  double v45 = 1.0;
  if (vabdd_f64(1.0, v50) < 0.00000011920929) {
    goto LABEL_39;
  }
  if (v50 <= 1.0)
  {
    uint64_t v53 = v49;
    uint64_t v77 = 0;
    uint64_t v78 = 0;
    v54 = (void *)[(__CFString *)a1 attributesAtIndex:0 effectiveRange:&v77];
    if (v77 || v78 != v53)
    {
      if (v50 <= 0.01)
      {
        v56 = 0;
        v57 = 0;
        goto LABEL_57;
      }
      v58 = (__CFString *)-[NSAttributedString _ui_scaledStringWithAttributes:font:scale:](a1, 0, 0, v50);
      v57 = 0;
    }
    else
    {
      v55 = v54;
      v56 = (void *)[v54 mutableCopy];
      v57 = (void *)[v55 objectForKeyedSubscript:@"NSFont"];
      if (v50 <= 0.01) {
        goto LABEL_57;
      }
      v58 = (__CFString *)-[NSAttributedString _ui_scaledStringWithAttributes:font:scale:](a1, v56, v57, v50);
      if (v56)
      {
        if (objc_msgSend((id)objc_msgSend(v56, "objectForKeyedSubscript:", @"NSFont"), "isEqual:", v57))
        {
LABEL_57:
          unsigned int v69 = v46;
          int v59 = 0;
          double v60 = 1.0;
          double v61 = 1.0 - v50;
          uint64_t v62 = -20;
          do
          {
            double v45 = v60 + v61 * -0.5;
            v58 = (__CFString *)-[NSAttributedString _ui_scaledStringWithAttributes:font:scale:](a1, v56, v57, v45);
            BOOL v63 = __NSScaledTextOversized(v58, v14, v56, a5, a6, v29, a2, a3, 0.0, 0.0, v74, 9000000.0);
            if (!v63) {
              double v50 = v45;
            }
            if (__CFADD__(v62++, 1)) {
              break;
            }
            if (v63) {
              double v60 = v45;
            }
            v59 |= !v63;
            double v61 = v60 - v50;
          }
          while ((v59 & 1) == 0 || v61 >= 0.01);
          double v48 = v73;
          uint64_t v46 = v69;
          if (v45 == v50) {
            goto LABEL_68;
          }
          v58 = (__CFString *)-[NSAttributedString _ui_scaledStringWithAttributes:font:scale:](a1, v56, v57, v50);
LABEL_67:
          double v45 = v50;
LABEL_68:
          [a6 setMaximumNumberOfLines:v29];
          double v75 = v48;
          double v51 = v27;
          if (v58 != a1)
          {
            double v72 = __NSStringDrawingEngine(v58, v56, a5, 0, a6, 0, 0, 0.0, 0.0, a2, a3, 0.0);
            double v23 = v65;
            double v25 = v66;
            double v51 = v67;
            [a6 baselineOffset];
            double v75 = v68;
          }
          if (v56) {

          }
          double v41 = v72;
          double v52 = v75;
          goto LABEL_40;
        }
LABEL_54:
        if (__NSScaledTextOversized(v58, v14, v56, a5, a6, v29, a2, a3, 0.0, 0.0, v74, 9000000.0)) {
          goto LABEL_67;
        }
        goto LABEL_57;
      }
    }
    v56 = 0;
    if ([(__CFString *)v58 isEqual:a1]) {
      goto LABEL_57;
    }
    goto LABEL_54;
  }
  double v45 = v50;
LABEL_39:
  [a6 setMaximumNumberOfLines:v29];
  double v51 = v27;
  double v52 = v73;
  double v41 = v72;
LABEL_40:
  [a6 setCachesLayout:v46];
  [a6 setActualScaleFactor:v45];
  if ([a6 wantsScaledLineHeight]) {
    [a6 setScaledLineHeight:v51];
  }
  objc_msgSend(a6, "setTotalBounds:", v41, v23, v25, v27);
  double v11 = v71;
  if ([a6 wantsScaledBaselineOffset]) {
    [a6 setScaledBaselineOffset:v52];
  }
  [a6 setBaselineOffset:v48];
  double v12 = v70;
LABEL_20:
  uint64_t v42 = MEMORY[0x192FAD920](v11);
  MEMORY[0x192FAD930](v42, v12);
  return v41;
}

- (void)drawWithRect:()NSExtendedStringDrawing options:context:
{
  double v15 = MEMORY[0x192FAD920](0.15);
  double v16 = MEMORY[0x192FAD930](0.0);
  _NSStringDrawingCore(a1, 0, a7, 0, a2, a3, a4, a5, 0.0, v17, a8);
  uint64_t v18 = MEMORY[0x192FAD920](v15);
  MEMORY[0x192FAD930](v18, v16);
}

- (id)_ui_attributedSubstringFromRange:()NSExtendedStringDrawing scaledByScaleFactor:
{
  v3 = objc_msgSend(a1, "attributedSubstringFromRange:");

  return -[NSAttributedString _ui_attributedStringScaledByScaleFactor:](v3, a2);
}

- (uint64_t)hasColorGlyphsInRange:()NSExtendedStringDrawing
{
  v7 = (void *)[objc_allocWithZone((Class)_NSCachedAttributedString) initWithAttributedString:a1];
  uint64_t v8 = [v7 copyCachedInstance];
  if (v8)
  {
    v9 = (void *)v8;

    v7 = v9;
  }
  else
  {
    objc_msgSend(v7, "fixAttributesInRange:", a3, a4);
    if (a4 == [a1 length]) {
      [v7 cache];
    }
  }
  uint64_t v10 = objc_msgSend(v7, "hasColorGlyphsInRange:", a3, a4);

  return v10;
}

- (id)_ui_attributedSubstringFromRange:()NSExtendedStringDrawing withTrackingAdjustment:
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:a1];
  uint64_t v5 = [a1 length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __103__NSAttributedString_NSExtendedStringDrawing___ui_attributedSubstringFromRange_withTrackingAdjustment___block_invoke;
  v7[3] = &unk_1E55C7570;
  *(double *)&v7[5] = a2;
  v7[4] = v4;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", @"NSKern", 0, v5, 0, v7);
  return v4;
}

- (uint64_t)drawWithRect:()NSExtendedStringDrawing options:
{
  return objc_msgSend(a1, "drawWithRect:options:context:", a3, 0);
}

- (uint64_t)boundingRectWithSize:()NSExtendedStringDrawing options:
{
  return objc_msgSend(a1, "boundingRectWithSize:options:context:", a3, 0);
}

@end
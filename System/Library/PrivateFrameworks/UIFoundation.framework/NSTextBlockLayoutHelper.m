@interface NSTextBlockLayoutHelper
- (char)initWithTextBlock:(uint64_t)a3 charIndex:(void *)a4 text:(void *)a5 layoutManager:(int)a6 containerWidth:(double)a7 collapseBorders:;
- (char)initWithTextBlock:(uint64_t)a3 charRange:(uint64_t)a4 glyphRange:(uint64_t)a5 layoutRect:(uint64_t)a6 boundsRect:(int)a7 containerWidth:(int)a8 allowMargins:(double)a9 collapseBorders:(double)a10 allowPadding:(double)a11;
- (char)initWithTextBlock:(uint64_t)a3 charRange:(uint64_t)a4 text:(double)a5 layoutManager:(uint64_t)a6 containerWidth:(void *)a7 collapseBorders:(int)a8;
- (char)initWithTextTable:(uint64_t)a3 charIndex:(void *)a4 text:(void *)a5 layoutManager:(char)a6 containerWidth:(double)a7 collapseBorders:;
- (id)description;
- (void)dealloc;
@end

@implementation NSTextBlockLayoutHelper

- (char)initWithTextBlock:(uint64_t)a3 charRange:(uint64_t)a4 glyphRange:(uint64_t)a5 layoutRect:(uint64_t)a6 boundsRect:(int)a7 containerWidth:(int)a8 allowMargins:(double)a9 collapseBorders:(double)a10 allowPadding:(double)a11
{
  if (!a1) {
    return 0;
  }
  v95.receiver = a1;
  v95.super_class = (Class)NSTextBlockLayoutHelper;
  v33 = (char *)objc_msgSendSuper2(&v95, sel_init);
  id v34 = a2;
  *((void *)v33 + 1) = v34;
  *((void *)v33 + 2) = a3;
  *((void *)v33 + 3) = a4;
  *((void *)v33 + 4) = a5;
  *((void *)v33 + 5) = a6;
  *((double *)v33 + 6) = a9;
  *((double *)v33 + 7) = a10;
  *((double *)v33 + 8) = a11;
  *((double *)v33 + 9) = a12;
  *((double *)v33 + 10) = a13;
  *((double *)v33 + 11) = a14;
  uint64_t v35 = 0;
  *((double *)v33 + 12) = a15;
  *((double *)v33 + 13) = a16;
  if (a7)
  {
    [v34 widthForLayer:1 edge:0];
    id v34 = (id)*((void *)v33 + 1);
  }
  else
  {
    uint64_t v36 = 0;
  }
  *((void *)v33 + 14) = v36;
  [v34 widthForLayer:0 edge:0];
  *((void *)v33 + 15) = v37;
  if (a18)
  {
    [*((id *)v33 + 1) widthForLayer:-1 edge:0];
    uint64_t v35 = v38;
  }
  *((void *)v33 + 16) = v35;
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  if (a7) {
    objc_msgSend(*((id *)v33 + 1), "widthForLayer:edge:", 1, 1, 0.0);
  }
  *((void *)v33 + 17) = v40;
  [*((id *)v33 + 1) widthForLayer:0 edge:1];
  *((void *)v33 + 18) = v41;
  if (a18)
  {
    [*((id *)v33 + 1) widthForLayer:-1 edge:1];
    uint64_t v39 = v42;
  }
  *((void *)v33 + 19) = v39;
  [*((id *)v33 + 1) valueForDimension:0];
  *((void *)v33 + 20) = v43;
  [*((id *)v33 + 1) valueForDimension:4];
  *((void *)v33 + 21) = v44;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  if (a18) {
    objc_msgSend(*((id *)v33 + 1), "widthForLayer:edge:", -1, 2, 0.0);
  }
  *((void *)v33 + 22) = v46;
  [*((id *)v33 + 1) widthForLayer:0 edge:2];
  *((void *)v33 + 23) = v47;
  if (a7)
  {
    [*((id *)v33 + 1) widthForLayer:1 edge:2];
    uint64_t v45 = v48;
  }
  *((void *)v33 + 24) = v45;
  double v49 = 0.0;
  uint64_t v50 = 0;
  if (a18) {
    objc_msgSend(*((id *)v33 + 1), "widthForLayer:edge:", -1, 3, 0.0);
  }
  *((void *)v33 + 25) = v50;
  [*((id *)v33 + 1) widthForLayer:0 edge:3];
  *((void *)v33 + 26) = v51;
  if (a7)
  {
    [*((id *)v33 + 1) widthForLayer:1 edge:3];
    double v49 = v52;
  }
  *((double *)v33 + 27) = v49;
  if (*((double *)v33 + 14) < 0.0) {
    *((void *)v33 + 14) = 0;
  }
  if (*((double *)v33 + 15) < 0.0) {
    *((void *)v33 + 15) = 0;
  }
  if (*((double *)v33 + 16) < 0.0) {
    *((void *)v33 + 16) = 0;
  }
  if (*((double *)v33 + 17) < 0.0) {
    *((void *)v33 + 17) = 0;
  }
  if (*((double *)v33 + 18) < 0.0) {
    *((void *)v33 + 18) = 0;
  }
  if (*((double *)v33 + 19) < 0.0) {
    *((void *)v33 + 19) = 0;
  }
  if (*((double *)v33 + 20) < 0.0) {
    *((void *)v33 + 20) = 0;
  }
  if (*((double *)v33 + 21) < 0.0) {
    *((void *)v33 + 21) = 0;
  }
  if (*((double *)v33 + 22) < 0.0) {
    *((void *)v33 + 22) = 0;
  }
  if (*((double *)v33 + 23) < 0.0) {
    *((void *)v33 + 23) = 0;
  }
  if (*((double *)v33 + 24) < 0.0) {
    *((void *)v33 + 24) = 0;
  }
  if (*((double *)v33 + 25) < 0.0) {
    *((void *)v33 + 25) = 0;
  }
  if (*((double *)v33 + 26) < 0.0) {
    *((void *)v33 + 26) = 0;
  }
  double v53 = a17;
  if (v49 < 0.0) {
    *((void *)v33 + 27) = 0;
  }
  if (a17 <= 0.0 && !NSIsEmptyRect(*(NSRect *)(v33 + 48)) && !NSIsEmptyRect(*(NSRect *)(v33 + 80)))
  {
    uint64_t v54 = [*((id *)v33 + 1) widthValueTypeForLayer:1 edge:0];
    double v55 = *((double *)v33 + 14);
    double v56 = v55 + 0.0;
    if (v54 == 1) {
      double v57 = v55 + 0.0;
    }
    else {
      double v57 = 0.0;
    }
    uint64_t v58 = [*((id *)v33 + 1) widthValueTypeForLayer:0 edge:0];
    double v59 = *((double *)v33 + 15);
    if (v58 == 1) {
      double v60 = *((double *)v33 + 15);
    }
    else {
      double v60 = -0.0;
    }
    double v61 = v57 + v60;
    uint64_t v62 = [*((id *)v33 + 1) widthValueTypeForLayer:-1 edge:0];
    double v63 = *((double *)v33 + 16);
    if (v62 == 1) {
      double v64 = *((double *)v33 + 16);
    }
    else {
      double v64 = -0.0;
    }
    double v65 = v61 + v64;
    uint64_t v66 = [*((id *)v33 + 1) widthValueTypeForLayer:-1 edge:2];
    double v67 = *((double *)v33 + 22);
    if (v66 == 1) {
      double v68 = *((double *)v33 + 22);
    }
    else {
      double v68 = -0.0;
    }
    double v69 = v65 + v68;
    uint64_t v70 = [*((id *)v33 + 1) widthValueTypeForLayer:0 edge:2];
    double v71 = *((double *)v33 + 23);
    if (v70 == 1) {
      double v72 = *((double *)v33 + 23);
    }
    else {
      double v72 = -0.0;
    }
    double v73 = v69 + v72;
    uint64_t v74 = [*((id *)v33 + 1) widthValueTypeForLayer:1 edge:2];
    double v75 = *((double *)v33 + 24);
    if (v74 == 1) {
      double v76 = *((double *)v33 + 24);
    }
    else {
      double v76 = -0.0;
    }
    double v77 = v73 + v76;
    if (v77 > 0.0)
    {
      if (v54 == 1) {
        double v78 = 0.0;
      }
      else {
        double v78 = v56;
      }
      if (v58 == 1) {
        double v79 = -0.0;
      }
      else {
        double v79 = v59;
      }
      double v80 = v78 + v79;
      if (v62 == 1) {
        double v81 = -0.0;
      }
      else {
        double v81 = v63;
      }
      double v82 = v80 + v81;
      if (v66 == 1) {
        double v83 = -0.0;
      }
      else {
        double v83 = v67;
      }
      double v84 = v82 + v83;
      if (v70 == 1) {
        double v85 = -0.0;
      }
      else {
        double v85 = v71;
      }
      double v86 = v84 + v85;
      if (v74 == 1) {
        double v75 = -0.0;
      }
      double v53 = (*((double *)v33 + 12) - *((double *)v33 + 8) - (v86 + v75)) * 100.0 / v77;
    }
    if (v53 < 0.0) {
      double v53 = 0.0;
    }
  }
  if ([*((id *)v33 + 1) widthValueTypeForLayer:1 edge:0] == 1) {
    *((double *)v33 + 14) = v53 / 100.0 * *((double *)v33 + 14);
  }
  if ([*((id *)v33 + 1) widthValueTypeForLayer:0 edge:0] == 1) {
    *((double *)v33 + 15) = v53 / 100.0 * *((double *)v33 + 15);
  }
  if ([*((id *)v33 + 1) widthValueTypeForLayer:-1 edge:0] == 1) {
    *((double *)v33 + 16) = v53 / 100.0 * *((double *)v33 + 16);
  }
  if ([*((id *)v33 + 1) widthValueTypeForLayer:1 edge:1] == 1) {
    *((double *)v33 + 17) = v53 / 100.0 * *((double *)v33 + 17);
  }
  if ([*((id *)v33 + 1) widthValueTypeForLayer:0 edge:1] == 1) {
    *((double *)v33 + 18) = v53 / 100.0 * *((double *)v33 + 18);
  }
  if ([*((id *)v33 + 1) widthValueTypeForLayer:-1 edge:1] == 1) {
    *((double *)v33 + 19) = v53 / 100.0 * *((double *)v33 + 19);
  }
  if ([*((id *)v33 + 1) valueTypeForDimension:0] == 1) {
    *((double *)v33 + 20) = v53 / 100.0 * *((double *)v33 + 20);
  }
  if ([*((id *)v33 + 1) valueTypeForDimension:4] == 1) {
    *((double *)v33 + 21) = v53 / 100.0 * *((double *)v33 + 21);
  }
  if ([*((id *)v33 + 1) widthValueTypeForLayer:-1 edge:2] == 1) {
    *((double *)v33 + 22) = v53 / 100.0 * *((double *)v33 + 22);
  }
  if ([*((id *)v33 + 1) widthValueTypeForLayer:0 edge:2] == 1) {
    *((double *)v33 + 23) = v53 / 100.0 * *((double *)v33 + 23);
  }
  if ([*((id *)v33 + 1) widthValueTypeForLayer:1 edge:2] == 1) {
    *((double *)v33 + 24) = v53 / 100.0 * *((double *)v33 + 24);
  }
  if ([*((id *)v33 + 1) widthValueTypeForLayer:-1 edge:3] == 1) {
    *((double *)v33 + 25) = v53 / 100.0 * *((double *)v33 + 25);
  }
  if ([*((id *)v33 + 1) widthValueTypeForLayer:0 edge:3] == 1) {
    *((double *)v33 + 26) = v53 / 100.0 * *((double *)v33 + 26);
  }
  uint64_t v87 = [*((id *)v33 + 1) widthValueTypeForLayer:1 edge:3];
  double v88 = *((double *)v33 + 27);
  if (v87 == 1) {
    double v88 = v53 / 100.0 * v88;
  }
  *((double *)v33 + 14) = ceil(*((double *)v33 + 14));
  float64x2_t v89 = vrndpq_f64(*(float64x2_t *)(v33 + 120));
  *(float64x2_t *)(v33 + 120) = v89;
  *((double *)v33 + 17) = ceil(*((double *)v33 + 17));
  float64x2_t v90 = vrndpq_f64(*((float64x2_t *)v33 + 9));
  float64x2_t v91 = vrndpq_f64(*((float64x2_t *)v33 + 10));
  *((float64x2_t *)v33 + 9) = v90;
  *((float64x2_t *)v33 + 10) = v91;
  *((double *)v33 + 22) = ceil(*((double *)v33 + 22));
  float64x2_t v92 = vrndpq_f64(*(float64x2_t *)(v33 + 184));
  *(float64x2_t *)(v33 + 184) = v92;
  double v93 = ceil(*((double *)v33 + 26));
  *((double *)v33 + 25) = ceil(*((double *)v33 + 25));
  *((double *)v33 + 26) = v93;
  *((double *)v33 + 27) = ceil(v88);
  if (a8)
  {
    *((double *)v33 + 15) = 0.5 * v89.f64[0];
    *((double *)v33 + 18) = 0.5 * v90.f64[0];
    *((double *)v33 + 23) = 0.5 * v92.f64[0];
    *((double *)v33 + 26) = v93 * 0.5;
  }
  return v33;
}

- (char)initWithTextBlock:(uint64_t)a3 charRange:(uint64_t)a4 text:(double)a5 layoutManager:(uint64_t)a6 containerWidth:(void *)a7 collapseBorders:(int)a8
{
  if (result)
  {
    v14 = result;
    if (a7)
    {
      uint64_t v15 = objc_msgSend(a7, "glyphRangeForCharacterRange:actualCharacterRange:", a3, a4, 0);
      uint64_t v17 = v16;
      [a7 layoutRectForTextBlock:a2 atIndex:v15 effectiveRange:0];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      [a7 boundsRectForTextBlock:a2 atIndex:v15 effectiveRange:0];
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
    }
    else
    {
      double v31 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
      double v33 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
      double v25 = v33;
      double v23 = v31;
      double v27 = *MEMORY[0x1E4F28AD8];
      double v29 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
      double v21 = v29;
      double v19 = *MEMORY[0x1E4F28AD8];
      uint64_t v17 = a4;
      uint64_t v15 = a3;
    }
    return -[NSTextBlockLayoutHelper initWithTextBlock:charRange:glyphRange:layoutRect:boundsRect:containerWidth:allowMargins:collapseBorders:allowPadding:](v14, a2, a3, a4, v15, v17, a8 ^ 1u, a8, v19, v21, v23, v25, v27, v29, v31, v33, a5, 1);
  }
  return result;
}

- (char)initWithTextBlock:(uint64_t)a3 charIndex:(void *)a4 text:(void *)a5 layoutManager:(int)a6 containerWidth:(double)a7 collapseBorders:
{
  if (result)
  {
    v12 = result;
    long long v38 = xmmword_18E5F72A0;
    if (a5)
    {
      uint64_t v13 = objc_msgSend(a5, "glyphRangeForCharacterRange:actualCharacterRange:", a3, 1, 0);
      [a5 layoutRectForTextBlock:a2 atIndex:v13 effectiveRange:&v38];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      [a5 boundsRectForTextBlock:a2 atIndex:v13 effectiveRange:0];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      if (*((void *)&v38 + 1))
      {
        uint64_t v30 = [a5 characterRangeForGlyphRange:v38 actualGlyphRange:0];
        uint64_t v32 = v31;
        uint64_t v34 = *((void *)&v38 + 1);
        uint64_t v33 = v38;
        return -[NSTextBlockLayoutHelper initWithTextBlock:charRange:glyphRange:layoutRect:boundsRect:containerWidth:allowMargins:collapseBorders:allowPadding:](v12, a2, v30, v32, v33, v34, a6 ^ 1u, a6, v15, v17, v19, v21, v23, v25, v27, v29, a7, 1);
      }
    }
    else
    {
      double v15 = *MEMORY[0x1E4F28AD8];
      double v17 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
      double v19 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
      double v21 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
      double v23 = *MEMORY[0x1E4F28AD8];
      double v25 = v17;
      double v27 = v19;
      double v29 = v21;
    }
    uint64_t v30 = [a4 rangeOfTextBlock:a2 atIndex:a3];
    uint64_t v32 = v35;
    uint64_t v33 = objc_msgSend(a5, "glyphRangeForCharacterRange:actualCharacterRange:", v30, v35, 0);
    uint64_t v34 = v36;
    *(void *)&long long v38 = v33;
    *((void *)&v38 + 1) = v36;
    return -[NSTextBlockLayoutHelper initWithTextBlock:charRange:glyphRange:layoutRect:boundsRect:containerWidth:allowMargins:collapseBorders:allowPadding:](v12, a2, v30, v32, v33, v34, a6 ^ 1u, a6, v15, v17, v19, v21, v23, v25, v27, v29, a7, 1);
  }
  return result;
}

- (char)initWithTextTable:(uint64_t)a3 charIndex:(void *)a4 text:(void *)a5 layoutManager:(char)a6 containerWidth:(double)a7 collapseBorders:
{
  if (result)
  {
    v12 = result;
    long long v38 = xmmword_18E5F72A0;
    if (a5)
    {
      uint64_t v13 = objc_msgSend(a5, "glyphRangeForCharacterRange:actualCharacterRange:", a3, 1, 0);
      [a5 layoutRectForTextBlock:a2 atIndex:v13 effectiveRange:&v38];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      [a5 boundsRectForTextBlock:a2 atIndex:v13 effectiveRange:0];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      if (*((void *)&v38 + 1))
      {
        uint64_t v30 = [a5 characterRangeForGlyphRange:v38 actualGlyphRange:0];
        uint64_t v32 = v31;
        uint64_t v34 = *((void *)&v38 + 1);
        uint64_t v33 = v38;
        return -[NSTextBlockLayoutHelper initWithTextBlock:charRange:glyphRange:layoutRect:boundsRect:containerWidth:allowMargins:collapseBorders:allowPadding:](v12, a2, v30, v32, v33, v34, 1, 0, v15, v17, v19, v21, v23, v25, v27, v29, a7, a6 ^ 1u);
      }
    }
    else
    {
      double v15 = *MEMORY[0x1E4F28AD8];
      double v17 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
      double v19 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
      double v21 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
      double v23 = *MEMORY[0x1E4F28AD8];
      double v25 = v17;
      double v27 = v19;
      double v29 = v21;
    }
    uint64_t v30 = [a4 rangeOfTextTable:a2 atIndex:a3];
    uint64_t v32 = v35;
    uint64_t v33 = objc_msgSend(a5, "glyphRangeForCharacterRange:actualCharacterRange:", v30, v35, 0);
    uint64_t v34 = v36;
    *(void *)&long long v38 = v33;
    *((void *)&v38 + 1) = v36;
    return -[NSTextBlockLayoutHelper initWithTextBlock:charRange:glyphRange:layoutRect:boundsRect:containerWidth:allowMargins:collapseBorders:allowPadding:](v12, a2, v30, v32, v33, v34, 1, 0, v15, v17, v19, v21, v23, v25, v27, v29, a7, a6 ^ 1u);
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  block = self->_block;
  v5 = NSStringFromRange(self->_charRange);
  v6 = NSStringFromRange(self->_glyphRange);
  v7 = NSStringFromRect(self->_layoutRect);
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<NSTextBlockLayoutHelper %p for block %p (cr %@ gr %@ lr %@ br %@ w %g h %g m %g %g %g %g b %g %g %g %g p %g %g %g %g)>", self, block, v5, v6, v7, NSStringFromRect(self->_boundsRect), *(void *)&self->_width, *(void *)&self->_height, *(void *)&self->_tMargin, *(void *)&self->_rMargin, *(void *)&self->_bMargin, *(void *)&self->_lMargin, *(void *)&self->_tBorder, *(void *)&self->_rBorder, *(void *)&self->_bBorder, *(void *)&self->_lBorder,
               *(void *)&self->_tPadding,
               *(void *)&self->_rPadding,
               *(void *)&self->_bPadding,
               *(void *)&self->_lPadding);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSTextBlockLayoutHelper;
  [(NSTextBlockLayoutHelper *)&v3 dealloc];
}

@end
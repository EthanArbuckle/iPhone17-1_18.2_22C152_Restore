@interface TUIFlickSelectorView
- (BOOL)topRowHasTrailingAlignment;
- (TUIFlickSelectorView)initWithKey:(id)a3 renderTraits:(id)a4;
- (UIEdgeInsets)stackLayoutMargins;
- (double)flickPopupOffset;
- (id)alignmentConstraintsForKey:(id)a3;
- (id)backgroundBezierPath;
- (id)backgroundPathForFlick;
- (id)backgroundPathForLongPress;
- (id)cellViewsInSubtreeOrder;
- (id)orderedVariantIndicesForKey;
- (id)variantCellWithString:(id)a3 annotation:(id)a4;
- (int64_t)flickDirection;
- (int64_t)variantViewAlignment;
- (unint64_t)countNonNullVariantEntriesForKey:(id)a3;
- (unint64_t)maxVariantsPerRowForKey:(id)a3;
- (unint64_t)totalVariants;
- (unint64_t)variantRowLimitForLayout;
- (void)addVariantsForKey:(id)a3 toView:(id)a4 isNonVariantPaddle:(BOOL)a5;
- (void)setFlickDirection:(int64_t)a3;
- (void)setTopRowHasTrailingAlignment:(BOOL)a3;
- (void)setTotalVariants:(unint64_t)a3;
- (void)updateVariantViewPropertiesForKey:(id)a3 isNonVariantPaddle:(BOOL)a4;
- (void)updateVariantsIfNeededForKey:(id)a3;
@end

@implementation TUIFlickSelectorView

- (void)setFlickDirection:(int64_t)a3
{
  self->_flickDirection = a3;
}

- (int64_t)flickDirection
{
  return self->_flickDirection;
}

- (void)setTotalVariants:(unint64_t)a3
{
  self->_totalVariants = a3;
}

- (unint64_t)totalVariants
{
  return self->_totalVariants;
}

- (void)setTopRowHasTrailingAlignment:(BOOL)a3
{
  self->_topRowHasTrailingAlignment = a3;
}

- (BOOL)topRowHasTrailingAlignment
{
  return self->_topRowHasTrailingAlignment;
}

- (id)backgroundPathForFlick
{
  v3 = [MEMORY[0x1E4FB14C0] bezierPath];
  v4 = [(TUIKeyPopupView *)self variantView];
  [v4 frame];
  double v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  int64_t v13 = [(TUIFlickSelectorView *)self flickDirection];
  v14 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
  [v14 layoutFrame];
  CGFloat MidX = CGRectGetMidX(v58);
  v16 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
  [v16 layoutFrame];
  double MidY = CGRectGetMidY(v59);

  v60.origin.x = v6;
  v60.origin.y = v8;
  v60.size.width = v10;
  v60.size.height = v12;
  double MinX = CGRectGetMinX(v60);
  v61.origin.x = v6;
  v61.origin.y = v8;
  v61.size.width = v10;
  v61.size.height = v12;
  double MaxY = CGRectGetMaxY(v61);
  v62.origin.x = v6;
  v62.origin.y = v8;
  v62.size.width = v10;
  v62.size.height = v12;
  double v56 = CGRectGetMinX(v62);
  v63.origin.x = v6;
  v63.origin.y = v8;
  v63.size.width = v10;
  v63.size.height = v12;
  double MinY = CGRectGetMinY(v63);
  v64.origin.x = v6;
  v64.origin.y = v8;
  v64.size.width = v10;
  v64.size.height = v12;
  double MaxX = CGRectGetMaxX(v64);
  v65.origin.x = v6;
  v65.origin.y = v8;
  v65.size.width = v10;
  v65.size.height = v12;
  double v51 = CGRectGetMinY(v65);
  v66.origin.x = v6;
  v66.origin.y = v8;
  v66.size.width = v10;
  v66.size.height = v12;
  double v19 = CGRectGetMaxX(v66);
  v67.origin.x = v6;
  v67.origin.y = v8;
  v67.size.width = v10;
  v67.size.height = v12;
  double v20 = CGRectGetMaxY(v67);
  double v21 = MidX;
  double v22 = 6.0;
  double v23 = 8.0;
  double v24 = -3.0;
  double v25 = MaxY;
  double v26 = MinX;
  double v27 = v20;
  double v28 = 24.0;
  double v29 = v19;
  switch(v13)
  {
    case 0:
      double v46 = v19;
      double v49 = v21;
      double v30 = v21 + -3.0;
      double v31 = MaxX;
      double v32 = MidY + -16.0;
      double v33 = 6.0;
      double v43 = v20;
      double v34 = v51;
      goto LABEL_5;
    case 1:
      goto LABEL_7;
    case 2:
      double v49 = v21;
      double v30 = v21 + 3.0;
      double v32 = MidY + 16.0;
      double v33 = -6.0;
      double v43 = MinY;
      double v46 = v56;
      double v34 = MaxY;
      double v31 = MinX;
      double v23 = -8.0;
      double MinY = v20;
      double v56 = v19;
      double MaxY = v51;
      double MinX = MaxX;
      goto LABEL_5;
    case 3:
      double v22 = -6.0;
      double v23 = -8.0;
      double v24 = 3.0;
      double v25 = v51;
      double v26 = MaxX;
      double v27 = MinY;
      double v29 = v56;
      double v28 = -24.0;
      double v51 = MaxY;
      double MaxX = MinX;
      double MinY = v20;
      double v56 = v19;
LABEL_7:
      double v41 = v21 + v28;
      double v50 = MidY + v24;
      objc_msgSend(v3, "moveToPoint:", v21 + v28, *(void *)&v26, *(void *)&v25);
      objc_msgSend(v3, "addLineToPoint:", v56 - v22, v22 + MinY);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", v22 * 0.5 + v56, MinY, v56 - v22 * 0.5, MinY);
      objc_msgSend(v3, "addLineToPoint:", MaxX - v23, v51);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", MaxX, v23 + v51, MaxX, v51);
      objc_msgSend(v3, "addLineToPoint:", v29, v27 - v23);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", v29 - v23, v27, v29, v27);
      objc_msgSend(v3, "addLineToPoint:", v22 * 0.5 + v45, v48);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", v45 - v22, v48 - v22, v45 - v22 * 0.5, v48);
      objc_msgSend(v3, "addLineToPoint:", v41, MidY + v22 * 0.5);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", v41, v50, v41 + v22 / -3.0, MidY);
      v38 = v3;
      double v39 = v41;
      double v40 = v50;
      break;
    default:
      double v35 = v20;
      uint64_t v36 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v6, 6.0, v20, v19, 5.0);

      double v33 = 6.0;
      double v30 = 8.0;
      double v43 = v35;
      double v46 = v19;
      double v49 = 8.0;
      double v23 = 8.0;
      double v34 = v51;
      double v31 = MaxX;
      v3 = (void *)v36;
      double v32 = MidY;
LABEL_5:
      double v54 = v30;
      double v37 = v32;
      objc_msgSend(v3, "moveToPoint:", *(void *)&v43, *(void *)&v46);
      objc_msgSend(v3, "addLineToPoint:", v33 + MinX, v33 + MaxY);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", MinX, MaxY - v33 * 0.5, MinX, v33 * 0.5 + MaxY);
      objc_msgSend(v3, "addLineToPoint:", v56, v23 + MinY);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", v23 + v56, MinY, v56, MinY);
      objc_msgSend(v3, "addLineToPoint:", v31 - v23, v34);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", v31, v23 + v34, v31, v34);
      objc_msgSend(v3, "addLineToPoint:", v47, v44 - v33 * 0.5);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", v47 - v33, v33 + v44, v47, v33 * 0.5 + v44);
      objc_msgSend(v3, "addLineToPoint:", v49 + v33 * 0.5, v37);
      objc_msgSend(v3, "addQuadCurveToPoint:controlPoint:", v54, v37, v49, v37 + v33 / 3.0);
      v38 = v3;
      double v39 = v54;
      double v40 = v37;
      break;
  }
  objc_msgSend(v38, "moveToPoint:", v39, v40);
  [v3 closePath];
  return v3;
}

- (id)backgroundPathForLongPress
{
  [(TUIKeyPopupView *)self roundRectRadius];
  double v4 = v3;
  double v5 = [(TUIFlickSelectorView *)self cellViewsInTopDownLTROrder];
  uint64_t v6 = [v5 count];
  double v7 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
  [v7 layoutFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v16 = [MEMORY[0x1E4FB14C0] bezierPath];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__TUIFlickSelectorView_backgroundPathForLongPress__block_invoke;
  aBlock[3] = &unk_1E5593E50;
  id v17 = v16;
  id v45 = v17;
  v18 = (void (**)(void *, uint64_t, uint64_t, double, double, double, double, double, double))_Block_copy(aBlock);
  double v19 = v11 - v15;
  v46.origin.x = v9;
  v46.origin.y = v11 - v15;
  v46.size.width = v13;
  v46.size.height = v15;
  double MinX = CGRectGetMinX(v46);
  v47.origin.x = v9;
  v47.origin.y = v11 - v15;
  v47.size.width = v13;
  v47.size.height = v15;
  CGFloat MinY = CGRectGetMinY(v47);
  v18[2](v18, 1, 1, MinX, MinY, 0.0, 0.0, v4, v4);
  v48.origin.x = v9;
  v48.origin.y = v11 - v15;
  v48.size.width = v13;
  v48.size.height = v15;
  double v22 = CGRectGetMinX(v48);
  v49.origin.x = v9;
  v49.origin.y = v11 - v15;
  v49.size.width = v13;
  v49.size.height = v15;
  objc_msgSend(v17, "addLineToPoint:", v22, CGRectGetMaxY(v49));
  v50.origin.x = v9 - v13;
  v50.origin.y = v11;
  v50.size.width = v13;
  v50.size.height = v15;
  double v23 = CGRectGetMinX(v50);
  v51.origin.x = v9 - v13;
  v51.origin.y = v11;
  v51.size.width = v13;
  v51.size.height = v15;
  CGFloat v24 = CGRectGetMinY(v51);
  v18[2](v18, 1, 1, v23, v24, 0.0, 0.0, v4, v4);
  v52.origin.x = v9 - v13;
  v52.origin.y = v11;
  v52.size.width = v13;
  v52.size.height = v15;
  double v25 = CGRectGetMinX(v52);
  v53.origin.x = v9 - v13;
  v53.origin.y = v11;
  v53.size.width = v13;
  v53.size.height = v15;
  CGFloat MaxY = CGRectGetMaxY(v53);
  v18[2](v18, 4, 1, v25, MaxY, 0.0, 0.0, v4, v4);
  if (v6 == 5)
  {
    v56.origin.x = v9;
    v56.origin.y = v11 + v15;
    v56.size.width = v13;
    v56.size.height = v15;
    double v29 = CGRectGetMinX(v56);
    v57.origin.x = v9;
    v57.origin.y = v11 + v15;
    v57.size.width = v13;
    v57.size.height = v15;
    objc_msgSend(v17, "addLineToPoint:", v29, CGRectGetMinY(v57));
    v58.origin.x = v9;
    v58.origin.y = v11 + v15;
    v58.size.width = v13;
    v58.size.height = v15;
    double v30 = CGRectGetMinX(v58);
    v59.origin.x = v9;
    v59.origin.y = v11 + v15;
    v59.size.width = v13;
    v59.size.height = v15;
    CGFloat v31 = CGRectGetMaxY(v59);
    v18[2](v18, 4, 1, v30, v31, 0.0, 0.0, v4, v4);
    v60.origin.x = v9;
    v60.origin.y = v11 + v15;
    v60.size.width = v13;
    v60.size.height = v15;
    double MaxX = CGRectGetMaxX(v60);
    v61.origin.x = v9;
    v61.origin.y = v11 + v15;
    v61.size.width = v13;
    v61.size.height = v15;
    CGFloat v33 = CGRectGetMaxY(v61);
    v18[2](v18, 8, 1, MaxX, v33, 0.0, 0.0, v4, v4);
    v62.origin.x = v9;
    v62.origin.y = v11 + v15;
    v62.size.width = v13;
    v62.size.height = v15;
    double v34 = CGRectGetMaxX(v62);
    v63.origin.x = v9;
    v63.origin.y = v11 + v15;
    v63.size.width = v13;
    v63.size.height = v15;
    objc_msgSend(v17, "addLineToPoint:", v34, CGRectGetMinY(v63));
    goto LABEL_6;
  }
  if (v6 != 3)
  {
    if ((v6 & 0xFFFFFFFFFFFFFFFELL) != 4) {
      goto LABEL_7;
    }
LABEL_6:
    v64.origin.x = v9 + v13;
    v64.origin.y = v11;
    v64.size.width = v13;
    v64.size.height = v15;
    double v35 = CGRectGetMaxX(v64);
    v65.origin.x = v9 + v13;
    v65.origin.y = v11;
    v65.size.width = v13;
    v65.size.height = v15;
    CGFloat v36 = CGRectGetMaxY(v65);
    v18[2](v18, 8, 1, v35, v36, 0.0, 0.0, v4, v4);
    v66.origin.x = v9 + v13;
    v66.origin.y = v11;
    v66.size.width = v13;
    v66.size.height = v15;
    double v37 = CGRectGetMaxX(v66);
    v67.origin.x = v9 + v13;
    v67.origin.y = v11;
    v67.size.width = v13;
    v67.size.height = v15;
    CGFloat v38 = CGRectGetMinY(v67);
    v18[2](v18, 2, 1, v37, v38, 0.0, 0.0, v4, v4);
    v68.origin.x = v9 + v13;
    v68.origin.y = v11;
    v68.size.width = v13;
    v68.size.height = v15;
    double v39 = CGRectGetMinX(v68);
    v69.origin.x = v9 + v13;
    v69.origin.y = v11;
    v69.size.width = v13;
    v69.size.height = v15;
    objc_msgSend(v17, "addLineToPoint:", v39, CGRectGetMinY(v69));
    goto LABEL_7;
  }
  v54.origin.x = v9;
  v54.origin.y = v11;
  v54.size.width = v13;
  v54.size.height = v15;
  double v27 = CGRectGetMaxX(v54);
  v55.origin.x = v9;
  v55.origin.y = v11;
  v55.size.width = v13;
  v55.size.height = v15;
  CGFloat v28 = CGRectGetMaxY(v55);
  v18[2](v18, 8, 1, v27, v28, 0.0, 0.0, v4, v4);
LABEL_7:
  v70.origin.x = v9;
  v70.origin.y = v11 - v15;
  v70.size.width = v13;
  v70.size.height = v15;
  double v40 = CGRectGetMaxX(v70);
  v71.origin.x = v9;
  v71.origin.y = v19;
  v71.size.width = v13;
  v71.size.height = v15;
  CGFloat v41 = CGRectGetMinY(v71);
  v18[2](v18, 2, 1, v40, v41, 0.0, 0.0, v4, v4);
  [v17 closePath];
  id v42 = v17;

  return v42;
}

uint64_t __50__TUIFlickSelectorView_backgroundPathForLongPress__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", a4 + a6, a5 + a7);
  v16 = *(void **)(a1 + 32);
  return objc_msgSend(v16, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", a2, a3, a4, a5, a8, a9);
}

- (id)backgroundBezierPath
{
  if ([(TUIFlickSelectorView *)self flickDirection] == -1) {
    [(TUIFlickSelectorView *)self backgroundPathForLongPress];
  }
  else {
  double v3 = [(TUIFlickSelectorView *)self backgroundPathForFlick];
  }
  return v3;
}

- (id)cellViewsInSubtreeOrder
{
  double v3 = [(TUIFlickSelectorView *)self cellViewsInTopDownLTROrder];
  double v4 = [(TUIKeyPopupView *)self associatedTree];
  double v5 = [v4 subtrees];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([&unk_1EDC79AD0 count])
  {
    unint64_t v7 = 0;
    do
    {
      double v8 = [&unk_1EDC79AD0 objectAtIndex:v7];
      int v9 = [v8 intValue];

      if ([v3 count] > (unint64_t)v9)
      {
        double v10 = [v3 objectAtIndex:v9];
        [v6 addObject:v10];
      }
      ++v7;
    }
    while (v7 < [&unk_1EDC79AD0 count]);
  }

  return v6;
}

- (unint64_t)maxVariantsPerRowForKey:(id)a3
{
  id v4 = a3;
  if ([v4 flickDirection] == -1)
  {
    unint64_t v5 = [(TUIFlickSelectorView *)self variantRowLimitForLayout];
    if (v4)
    {
      id v6 = [v4 subtrees];
      if ([v6 count] > v5)
      {
        int64_t v7 = [(TUIKeyPopupView *)self layoutStyle];

        if (v7 != 1) {
          goto LABEL_8;
        }
        id v6 = [v4 subtrees];
        unint64_t v5 = vcvtpd_u64_f64((double)(unint64_t)[v6 count] * 0.5);
      }
    }
  }
  else
  {
    unint64_t v5 = 1;
  }
LABEL_8:

  return v5;
}

- (id)orderedVariantIndicesForKey
{
  return &unk_1EDC79AB8;
}

- (unint64_t)variantRowLimitForLayout
{
  if ([(TUIKeyPopupView *)self layoutStyle] == 1) {
    return 3;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)updateVariantViewPropertiesForKey:(id)a3 isNonVariantPaddle:(BOOL)a4
{
  if (a4)
  {
    uint64_t v5 = 1;
  }
  else
  {
    unint64_t v6 = [(TUIFlickSelectorView *)self totalVariants];
    uint64_t v5 = 1;
    switch(v6)
    {
      case 2uLL:
        break;
      case 3uLL:
        self->_topRowHasTrailingAlignment = 1;
        goto LABEL_5;
      case 4uLL:
LABEL_5:
        uint64_t v5 = 2;
        break;
      case 5uLL:
        uint64_t v5 = 3;
        break;
      default:
        uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
        break;
    }
  }
  [(TUIKeyPopupView *)self setVariantViewRows:v5];
}

- (unint64_t)countNonNullVariantEntriesForKey:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v3 = objc_msgSend(a3, "subtrees", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        int v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        double v10 = [MEMORY[0x1E4F1CA98] null];
        LODWORD(v9) = [v9 isEqual:v10];

        v6 += v9 ^ 1;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (int64_t)variantViewAlignment
{
  if (self->_topRowHasTrailingAlignment) {
    return 4;
  }
  else {
    return 3;
  }
}

- (double)flickPopupOffset
{
  int64_t v2 = [(TUIFlickSelectorView *)self flickDirection];
  double result = 0.0;
  if ((v2 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
    return 10.0;
  }
  return result;
}

- (UIEdgeInsets)stackLayoutMargins
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)variantCellWithString:(id)a3 annotation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [TUIFlickVariantCell alloc];
  int v9 = [(TUIKeyPopupView *)self renderTraits];
  double v10 = -[TUIVariantCell initWithFrame:string:annotation:traits:](v8, "initWithFrame:string:annotation:traits:", v7, v6, v9, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v10;
}

- (void)addVariantsForKey:(id)a3 toView:(id)a4 isNonVariantPaddle:(BOOL)a5
{
  BOOL v5 = a5;
  v67[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v9 && [(TUIKeyPopupView *)self needsPopup])
  {
    double v10 = [v8 subtrees];
    uint64_t v11 = [v10 count];
    long long v12 = [(TUIKeyPopupView *)self arrangedVariantCells];
    if (v11 == [v12 count])
    {
      long long v13 = [(TUIKeyPopupView *)self arrangedVariantCells];
      uint64_t v14 = [v13 count];

      if (v14) {
        goto LABEL_48;
      }
    }
    else
    {
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v16 = [(TUIFlickSelectorView *)self orderedVariantIndicesForKey];
    uint64_t v17 = v16;
    CGRect v65 = v16;
    if (v5)
    {
      unint64_t v18 = [v8 flickDirection];
      double v19 = [v8 subtrees];
      unint64_t v20 = [v19 count];

      if (v18 >= v20)
      {
        [v15 addObject:v8];
      }
      else
      {
        double v21 = [v8 subtrees];
        double v22 = objc_msgSend(v21, "objectAtIndex:", objc_msgSend(v8, "flickDirection") + 1);
        [v15 addObject:v22];
      }
      uint64_t v56 = 0;
    }
    else if ([v16 count])
    {
      unint64_t v23 = 0;
      uint64_t v56 = 2;
      do
      {
        CGFloat v24 = [v17 objectAtIndex:v23];
        double v25 = [v8 subtrees];
        double v26 = objc_msgSend(v25, "objectAtIndex:", (int)objc_msgSend(v24, "intValue"));
        [v15 addObject:v26];

        uint64_t v17 = v65;
        ++v23;
      }
      while (v23 < [v65 count]);
    }
    else
    {
      uint64_t v56 = 2;
    }
    id v51 = v9;
    id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v62 = [(TUIFlickSelectorView *)self maxVariantsPerRowForKey:v8];
    double v27 = [(TUIKeyPopupView *)self arrangedVariantRows];
    CGRect v63 = [v27 objectEnumerator];

    if ([v15 count])
    {
      unint64_t v28 = 0;
      uint64_t v64 = 0;
      double v29 = 0;
      id v55 = v8;
      BOOL v54 = v5;
      id v53 = v15;
      uint64_t v30 = v56;
      while (1)
      {
        if (v29)
        {
          if ((v30 + v28) % v62) {
            goto LABEL_23;
          }
          ++v64;
        }
        uint64_t v31 = objc_msgSend(v63, "nextObject", v51);

        double v29 = (void *)v31;
LABEL_23:
        uint64_t v32 = objc_msgSend(v15, "objectAtIndex:", v28, v51);
        CGFloat v33 = (void *)v32;
        CGRect v66 = v29;
        if (v29)
        {
          if (v32)
          {
            double v34 = [MEMORY[0x1E4F1CA98] null];
            char v35 = [v33 isEqual:v34];

            if ((v35 & 1) == 0)
            {
              CGFloat v36 = [v33 variantDisplayString];
              if (!v36 || v5)
              {
                uint64_t v37 = [v33 displayString];

                CGFloat v36 = (void *)v37;
              }
              CGFloat v38 = [(TUIFlickSelectorView *)self variantCellWithString:v36 annotation:0];
              if (!v5)
              {
                if (v64)
                {
                  if (v64 == 1)
                  {
                    if (v28 == 1)
                    {
                      uint64_t v39 = 5;
                    }
                    else if (v28 == 2)
                    {
                      uint64_t v39 = 8 * ([(TUIFlickSelectorView *)self totalVariants] == 3);
                    }
                    else
                    {
                      uint64_t v39 = 10;
                    }
                  }
                  else
                  {
                    uint64_t v39 = 12;
                  }
                }
                else
                {
                  uint64_t v39 = 3;
                }
                [v38 setCurvedCorners:v39];
              }
              objc_msgSend(v38, "setUserInteractionEnabled:", -[TUIKeyPopupView wantsUserInteractionEnabled](self, "wantsUserInteractionEnabled"));
              double v40 = [v8 subtrees];
              objc_msgSend(v38, "setIndexNumber:", objc_msgSend(v40, "indexOfObject:", v33));

              BOOL v41 = [(TUIKeyPopupView *)self shouldProvideDefaultSelection];
              BOOL v42 = 0;
              CGRect v61 = v36;
              if (v41 && !v5) {
                BOOL v42 = objc_msgSend(v38, "indexNumber", 0) == 0;
              }
              [v38 setPrimaryVariant:v42];
              [v66 addArrangedSubview:v38];
              double v43 = [(TUIKeyPopupView *)self arrangedVariantCells];
              [v43 addObject:v38];

              CGRect v59 = [v38 heightAnchor];
              CGRect v60 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
              CGRect v58 = [v60 heightAnchor];
              double v44 = [v59 constraintEqualToAnchor:v58];
              v67[0] = v44;
              id v45 = [v38 widthAnchor];
              CGRect v46 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
              CGRect v47 = [v46 widthAnchor];
              CGRect v48 = [v45 constraintEqualToAnchor:v47];
              v67[1] = v48;
              [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
              v50 = CGRect v49 = self;
              [v57 addObjectsFromArray:v50];

              self = v49;
              id v8 = v55;
              uint64_t v30 = v56;
              BOOL v5 = v54;
              id v15 = v53;
              uint64_t v17 = v65;
            }
          }
        }

        ++v28;
        double v29 = v66;
        if ([v15 count] <= v28) {
          goto LABEL_47;
        }
      }
    }
    double v29 = 0;
LABEL_47:
    objc_msgSend(MEMORY[0x1E4F28DC8], "activateConstraints:", v57, v51);

    id v9 = v52;
  }
LABEL_48:
  [(TUIKeyPopupView *)self setInitialHighlight];
  [(TUIFlickSelectorView *)self layoutIfNeeded];
}

- (id)alignmentConstraintsForKey:(id)a3
{
  v93[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4
    && ([(TUIKeyPopupView *)self associatedTree],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    id v82 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v81 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = [(TUIKeyPopupView *)self variantView];
    v85 = [v6 leadingAnchor];

    id v7 = [(TUIKeyPopupView *)self variantView];
    uint64_t v8 = [v7 trailingAnchor];

    id v9 = [(TUIKeyPopupView *)self variantView];
    uint64_t v10 = [v9 topAnchor];

    uint64_t v11 = [(TUIKeyPopupView *)self variantView];
    uint64_t v12 = [v11 bottomAnchor];

    v83 = (void *)v8;
    v84 = (void *)v10;
    v80 = (void *)v12;
    switch(self->_totalVariants)
    {
      case 1uLL:
        switch([v4 flickDirection])
        {
          case 0:
            CGRect v65 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
            long long v13 = [v65 topAnchor];
            uint64_t v14 = [(TUIKeyPopupView *)self variantView];
            v74 = [v14 bottomAnchor];
            [(TUIFlickSelectorView *)self flickPopupOffset];
            CGRect v69 = objc_msgSend(v13, "constraintEqualToAnchor:constant:", v74);
            v93[0] = v69;
            id v15 = [(TUIKeyPopupView *)self variantView];
            v16 = [v15 centerXAnchor];
            uint64_t v17 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
            unint64_t v18 = [v17 centerXAnchor];
            double v19 = [v16 constraintEqualToAnchor:v18];
            v93[1] = v19;
            unint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:2];
            [v81 addObjectsFromArray:v20];

            double v21 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
            [v21 bottomAnchor];
            v80 = double v22 = v80;
            goto LABEL_11;
          case 1:
            CGRect v66 = [(TUIKeyPopupView *)self variantView];
            BOOL v41 = [v66 leftAnchor];
            BOOL v42 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
            v77 = [v42 rightAnchor];
            [(TUIFlickSelectorView *)self flickPopupOffset];
            CGRect v71 = objc_msgSend(v41, "constraintEqualToAnchor:constant:", v77);
            v90[0] = v71;
            double v43 = [(TUIKeyPopupView *)self variantView];
            double v44 = [v43 centerYAnchor];
            id v45 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
            CGRect v46 = [v45 centerYAnchor];
            CGRect v47 = [v44 constraintEqualToAnchor:v46];
            v90[1] = v47;
            CGRect v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
            [v81 addObjectsFromArray:v48];

            double v21 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
            [v21 leadingAnchor];
            v85 = double v22 = v85;
            goto LABEL_11;
          case 2:
            CGRect v67 = [(TUIKeyPopupView *)self variantView];
            CGRect v49 = [v67 topAnchor];
            CGRect v50 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
            v78 = [v50 bottomAnchor];
            [(TUIFlickSelectorView *)self flickPopupOffset];
            v72 = objc_msgSend(v49, "constraintEqualToAnchor:constant:", v78);
            v91[0] = v72;
            id v51 = [(TUIKeyPopupView *)self variantView];
            CGRect v52 = [v51 centerXAnchor];
            id v53 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
            BOOL v54 = [v53 centerXAnchor];
            id v55 = [v52 constraintEqualToAnchor:v54];
            v91[1] = v55;
            uint64_t v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:2];
            [v81 addObjectsFromArray:v56];

            double v21 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
            [v21 topAnchor];
            v84 = double v22 = v84;
            goto LABEL_11;
          case 3:
            CGRect v68 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
            id v57 = [v68 leftAnchor];
            CGRect v58 = [(TUIKeyPopupView *)self variantView];
            v79 = [v58 rightAnchor];
            [(TUIFlickSelectorView *)self flickPopupOffset];
            v73 = objc_msgSend(v57, "constraintEqualToAnchor:constant:", v79);
            v92[0] = v73;
            CGRect v59 = [(TUIKeyPopupView *)self variantView];
            CGRect v60 = [v59 centerYAnchor];
            CGRect v61 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
            unint64_t v62 = [v61 centerYAnchor];
            CGRect v63 = [v60 constraintEqualToAnchor:v62];
            v92[1] = v63;
            uint64_t v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:2];
            [v81 addObjectsFromArray:v64];

            double v21 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
            [v21 trailingAnchor];
            v83 = double v22 = v83;
            goto LABEL_11;
          default:
            goto LABEL_12;
        }
        break;
      case 3uLL:
        double v21 = [(TUIFlickSelectorView *)self trailingAnchor];
        double v22 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
        v75 = [v22 trailingAnchor];
        CGFloat v24 = [v21 constraintEqualToAnchor:v75];
        v89[0] = v24;
        double v25 = [(TUIFlickSelectorView *)self bottomAnchor];
        double v26 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
        double v27 = [v26 bottomAnchor];
        unint64_t v28 = [v25 constraintEqualToAnchor:v27];
        v89[1] = v28;
        double v29 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v30 = v89;
        goto LABEL_10;
      case 4uLL:
        double v21 = [(TUIFlickSelectorView *)self centerXAnchor];
        double v22 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
        v75 = [v22 centerXAnchor];
        CGFloat v24 = [v21 constraintEqualToAnchor:v75];
        v88[0] = v24;
        double v25 = [(TUIFlickSelectorView *)self bottomAnchor];
        double v26 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
        double v27 = [v26 bottomAnchor];
        unint64_t v28 = [v25 constraintEqualToAnchor:v27];
        v88[1] = v28;
        double v29 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v30 = v88;
        goto LABEL_10;
      case 5uLL:
        double v21 = [(TUIFlickSelectorView *)self centerXAnchor];
        double v22 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
        v75 = [v22 centerXAnchor];
        CGFloat v24 = [v21 constraintEqualToAnchor:v75];
        v87[0] = v24;
        double v25 = [(TUIFlickSelectorView *)self centerYAnchor];
        double v26 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
        double v27 = [v26 centerYAnchor];
        unint64_t v28 = [v25 constraintEqualToAnchor:v27];
        v87[1] = v28;
        double v29 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v30 = v87;
LABEL_10:
        uint64_t v31 = [v29 arrayWithObjects:v30 count:2];
        [v82 addObjectsFromArray:v31];

LABEL_11:
        break;
      default:
        break;
    }
LABEL_12:
    v76 = [(TUIFlickSelectorView *)self leadingAnchor];
    CGRect v70 = [v85 constraintEqualToAnchor:v76 constant:0.0];
    v86[0] = v70;
    uint64_t v32 = [(TUIFlickSelectorView *)self trailingAnchor];
    CGFloat v33 = [v32 constraintEqualToAnchor:v83 constant:0.0];
    v86[1] = v33;
    double v34 = [(TUIFlickSelectorView *)self topAnchor];
    char v35 = [v84 constraintEqualToAnchor:v34 constant:0.0];
    v86[2] = v35;
    CGFloat v36 = [(TUIFlickSelectorView *)self bottomAnchor];
    uint64_t v37 = [v36 constraintEqualToAnchor:v80 constant:0.0];
    v86[3] = v37;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:4];
    uint64_t v39 = v38 = v4;
    unint64_t v23 = v82;
    [v82 addObjectsFromArray:v39];

    id v4 = v38;
    [v82 addObjectsFromArray:v81];
  }
  else
  {
    unint64_t v23 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v23;
}

- (void)updateVariantsIfNeededForKey:(id)a3
{
  id v4 = a3;
  -[TUIFlickSelectorView setFlickDirection:](self, "setFlickDirection:", [v4 flickDirection]);
  if ([v4 flickDirection] == -1) {
    unint64_t v5 = [(TUIFlickSelectorView *)self countNonNullVariantEntriesForKey:v4];
  }
  else {
    unint64_t v5 = 1;
  }
  [(TUIFlickSelectorView *)self setTotalVariants:v5];
  v6.receiver = self;
  v6.super_class = (Class)TUIFlickSelectorView;
  [(TUIKeyPopupView *)&v6 updateVariantsIfNeededForKey:v4];
}

- (TUIFlickSelectorView)initWithKey:(id)a3 renderTraits:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIFlickSelectorView;
  id v7 = [(TUIKeyPopupView *)&v11 initWithKey:v6 renderTraits:a4];
  if (v7)
  {
    uint64_t v8 = [v6 backingTree];
    v7->_flickDirection = [v8 flickDirection];

    v7->_topRowHasTrailingAlignment = 0;
    id v9 = [(TUIKeyPopupView *)v7 associatedTree];
    v7->_totalVariants = [(TUIFlickSelectorView *)v7 countNonNullVariantEntriesForKey:v9];
  }
  return v7;
}

@end
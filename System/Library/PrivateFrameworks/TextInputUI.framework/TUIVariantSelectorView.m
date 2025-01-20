@interface TUIVariantSelectorView
+ (double)minCellDimension;
- (BOOL)baseKeyOnRight;
- (BOOL)drawsShadows;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)originRectRadius;
- (CGSize)paddleRadius;
- (TUIVariantSelectorView)initWithKey:(id)a3 renderTraits:(id)a4;
- (id)alignmentConstraintsForKey:(id)a3;
- (id)backgroundBezierPath;
- (id)cellViewsInSubtreeOrder;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)variantCellWithString:(id)a3 annotation:(id)a4;
- (id)widthConstraintsForVariantCell:(id)a3 previousCell:(id)a4;
- (void)addVariantsForKey:(id)a3 toView:(id)a4 isNonVariantPaddle:(BOOL)a5;
- (void)setBaseKeyOnRight:(BOOL)a3;
- (void)updateVariantsIfNeededForKey:(id)a3;
@end

@implementation TUIVariantSelectorView

- (void)setBaseKeyOnRight:(BOOL)a3
{
  self->_baseKeyOnRight = a3;
}

- (BOOL)baseKeyOnRight
{
  return self->_baseKeyOnRight;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(TUIKeyPopupView *)self associatedTree];
  int v9 = [v8 interactionType];

  if (v9 == 9)
  {
    if (!-[TUIVariantSelectorView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
    {
      v10 = [(TUIKeyPopupView *)self popupDelegate];
      [v10 tappedToDismissSelector];
    }
    v11 = self;
  }
  else
  {
    [(TUIKeyPopupView *)self finishVariantSelection];
    v11 = [(TUIKeyPopupView *)self touchesForwardingView];
  }
  v12 = v11;

  return v12;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TUIVariantSelectorView;
  unsigned __int8 v8 = -[TUIKeyPopupView pointInside:withEvent:](&v13, sel_pointInside_withEvent_, v7, x, y);
  int v9 = [(TUIKeyPopupView *)self associatedTree];
  if ([v9 interactionType] != 9) {
    goto LABEL_4;
  }
  v10 = [(TUIKeyPopupView *)self associatedTree];
  int v11 = [v10 state];

  if (v11 == 16)
  {
    int v9 = [(TUIKeyPopupView *)self variantView];
    unsigned __int8 v8 = objc_msgSend(v9, "pointInside:withEvent:", v7, x, y);
LABEL_4:
  }
  return v8;
}

- (id)backgroundBezierPath
{
  [(TUIVariantSelectorView *)self paddleRadius];
  double v93 = v3;
  double v91 = v4;
  [(TUIVariantSelectorView *)self originRectRadius];
  double v92 = v5;
  double v7 = v6;
  unsigned __int8 v8 = [(TUIKeyPopupView *)self variantView];
  [v8 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v97 = v15;

  v16 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
  [v16 layoutFrame];
  UIRectInset();
  CGFloat v18 = v17;
  double v20 = v19;
  CGFloat rect = v21;
  double v23 = v22;

  if ([(TUIKeyPopupView *)self layoutStyle] == 1)
  {
    v106.origin.double x = v10;
    v106.origin.double y = v12;
    v106.size.width = v14;
    v106.size.height = v97;
    double v90 = v7;
    double MaxY = CGRectGetMaxY(v106);
    v107.origin.double x = v18;
    CGFloat v96 = v18;
    CGFloat v25 = v14;
    CGFloat v26 = v12;
    CGFloat v27 = v10;
    v107.origin.double y = v20;
    v107.size.width = rect;
    v107.size.height = v23;
    double v28 = MaxY - CGRectGetMinY(v107);
    double v94 = v20 + v28;
    double v95 = v23 - v28;
    v29 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
    [v29 layoutFrame];
    double MinX = CGRectGetMinX(v108);
    v109.origin.double x = v10;
    v109.origin.double y = v26;
    v109.size.width = v25;
    v109.size.height = v97;
    double v31 = vabdd_f64(MinX, CGRectGetMinX(v109));

    double v84 = round(v31);
    if (v84 >= v93 + -3.0) {
      double v32 = v93;
    }
    else {
      double v32 = 0.0;
    }
    double v88 = v32;
    v33 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
    [v33 layoutFrame];
    double MaxX = CGRectGetMaxX(v110);
    v111.origin.double x = v10;
    v111.origin.double y = v26;
    v111.size.width = v25;
    v111.size.height = v97;
    double v35 = vabdd_f64(MaxX, CGRectGetMaxX(v111));

    double v87 = round(v35);
    if (v87 >= v93 + -3.0) {
      double v36 = v93;
    }
    else {
      double v36 = 0.0;
    }
    double v89 = v36;
    v37 = [MEMORY[0x1E4FB14C0] bezierPath];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__TUIVariantSelectorView_backgroundBezierPath__block_invoke;
    aBlock[3] = &unk_1E5593E50;
    id v38 = v37;
    id v104 = v38;
    v39 = (void (**)(void *, uint64_t, uint64_t, double, double, double, double, double, double))_Block_copy(aBlock);
    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = __46__TUIVariantSelectorView_backgroundBezierPath__block_invoke_2;
    v99[3] = &unk_1E5593BC0;
    double v101 = v93;
    double v102 = v91;
    id v40 = v38;
    id v100 = v40;
    v41 = (void (**)(void *, void, double, double, double, double))_Block_copy(v99);
    v112.origin.double x = v96;
    v112.origin.double y = v94;
    v112.size.width = rect;
    v112.size.height = v95;
    double v42 = CGRectGetMinX(v112);
    v113.origin.double x = v96;
    v113.origin.double y = v94;
    v113.size.width = rect;
    v113.size.height = v95;
    double v43 = CGRectGetMaxY(v113);
    objc_msgSend(v40, "moveToPoint:", v92 + v42, v43);
    objc_msgSend(v40, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", 4, 0, v42, v43, v92, v90);
    if (v88 == 0.0)
    {
      CGFloat v44 = v97;
      double v45 = v93;
      v114.origin.double x = v10;
      v114.origin.double y = v26;
      v114.size.width = v25;
      v114.size.height = v97;
      objc_msgSend(v40, "addLineToPoint:", v42, CGRectGetMaxY(v114));
      double v46 = v91;
    }
    else
    {
      double v45 = v93;
      if (v85 <= v93
        || ([(TUIKeyPopupView *)self arrangedVariantCells],
            v49 = objc_claimAutoreleasedReturnValue(),
            uint64_t v50 = [v49 count],
            v49,
            v50 == 1))
      {
        v115.size.height = v95;
        v115.origin.double x = v96;
        v115.origin.double y = v94;
        v115.size.width = rect;
        double MinY = CGRectGetMinY(v115);
        v116.origin.double x = v10;
        v116.origin.double y = v26;
        v116.size.width = v25;
        CGFloat v44 = v97;
        v116.size.height = v97;
        double v52 = CGRectGetMinX(v116);
        v117.origin.double x = v27;
        v117.origin.double y = v26;
        v117.size.width = v25;
        v117.size.height = v97;
        CGFloat v53 = CGRectGetMaxY(v117);
        v41[2](v41, 0, v42, MinY, v52, v53);
        double v46 = v91;
      }
      else
      {
        v118.origin.double x = v96;
        v118.origin.double y = v94;
        v118.size.width = rect;
        v118.size.height = v95;
        double v86 = CGRectGetMinX(v118);
        v119.origin.double x = v96;
        v119.origin.double y = v94;
        v119.size.width = rect;
        v119.size.height = v95;
        CGFloat v54 = CGRectGetMinY(v119);
        double v46 = v91;
        v39[2](v39, 2, 1, v86, v54, 0.0, v91, v88, v91);
        v120.origin.double x = v27;
        v120.origin.double y = v26;
        v120.size.width = v25;
        CGFloat v44 = v97;
        v120.size.height = v97;
        double v55 = CGRectGetMinX(v120);
        v121.origin.double x = v27;
        v121.origin.double y = v26;
        v121.size.width = v25;
        v121.size.height = v97;
        CGFloat v56 = CGRectGetMaxY(v121);
        v39[2](v39, 4, 0, v55, v56, v88, 0.0, v88, v91);
      }
      v122.origin.double x = v27;
      v122.origin.double y = v26;
      v122.size.width = v25;
      v122.size.height = v44;
      double v42 = CGRectGetMinX(v122);
    }
    v123.origin.double x = v27;
    v123.origin.double y = v26;
    v123.size.width = v25;
    v123.size.height = v44;
    CGFloat v57 = CGRectGetMinY(v123);
    v39[2](v39, 1, 0, v42, v57, 0.0, v46, v45, v46);
    double v59 = v95;
    CGFloat v58 = v96;
    if (v89 != 0.0) {
      CGFloat v58 = v27;
    }
    double v60 = v94;
    if (v89 != 0.0) {
      double v60 = v26;
    }
    double v61 = rect;
    if (v89 != 0.0)
    {
      double v61 = v25;
      double v59 = v44;
    }
    double v62 = CGRectGetMaxX(*(CGRect *)&v58);
    v124.origin.double x = v27;
    v124.origin.double y = v26;
    v124.size.width = v25;
    v124.size.height = v44;
    CGFloat v63 = CGRectGetMinY(v124);
    v39[2](v39, 2, 0, v62, v63, -v45, 0.0, v45, v46);
    if (v89 == 0.0)
    {
      v125.origin.double x = v27;
      v125.origin.double y = v26;
      v125.size.width = v25;
      v125.size.height = v44;
      objc_msgSend(v40, "addLineToPoint:", v62, CGRectGetMaxY(v125));
      double v64 = v92;
      CGFloat v66 = v94;
      CGFloat v65 = v95;
      CGFloat v67 = rect;
      double v68 = v90;
      CGFloat v69 = v96;
    }
    else
    {
      if (v87 <= v45
        || ([(TUIKeyPopupView *)self arrangedVariantCells],
            v70 = objc_claimAutoreleasedReturnValue(),
            uint64_t v71 = [v70 count],
            v70,
            v71 == 1))
      {
        v126.origin.double x = v27;
        v126.origin.double y = v26;
        v126.size.width = v25;
        v126.size.height = v44;
        double v72 = CGRectGetMaxX(v126);
        v127.origin.double x = v27;
        v127.origin.double y = v26;
        v127.size.width = v25;
        v127.size.height = v44;
        double v73 = CGRectGetMaxY(v127);
        CGFloat v65 = v95;
        CGFloat v69 = v96;
        v128.origin.double x = v96;
        CGFloat v66 = v94;
        v128.origin.double y = v94;
        CGFloat v67 = rect;
        v128.size.width = rect;
        v128.size.height = v95;
        double v74 = CGRectGetMaxX(v128);
        v129.origin.double x = v96;
        v129.origin.double y = v94;
        v129.size.width = rect;
        v129.size.height = v95;
        CGFloat v75 = CGRectGetMinY(v129);
        v41[2](v41, 1, v72, v73, v74, v75);
      }
      else
      {
        v130.origin.double x = v27;
        v130.origin.double y = v26;
        v130.size.width = v25;
        v130.size.height = v44;
        double v76 = CGRectGetMaxX(v130);
        v131.origin.double x = v27;
        v131.origin.double y = v26;
        v131.size.width = v25;
        v131.size.height = v44;
        double v77 = CGRectGetMaxY(v131);
        double v78 = v46;
        v39[2](v39, 8, 0, v76, v77, 0.0, -v46, v89, v46);
        CGFloat v65 = v95;
        CGFloat v69 = v96;
        v132.origin.double x = v96;
        CGFloat v66 = v94;
        v132.origin.double y = v94;
        CGFloat v67 = rect;
        v132.size.width = rect;
        v132.size.height = v95;
        double v79 = CGRectGetMaxX(v132);
        v133.origin.double x = v96;
        v133.origin.double y = v94;
        v133.size.width = rect;
        v133.size.height = v95;
        CGFloat v80 = CGRectGetMinY(v133);
        v39[2](v39, 1, 1, v79, v80, v89, 0.0, v89, v78);
      }
      double v64 = v92;
      double v68 = v90;
    }
    v134.origin.double x = v69;
    v134.origin.double y = v66;
    v134.size.width = v67;
    v134.size.height = v65;
    double v81 = CGRectGetMaxX(v134);
    v135.origin.double x = v69;
    v135.origin.double y = v66;
    v135.size.width = v67;
    v135.size.height = v65;
    CGFloat v82 = CGRectGetMaxY(v135);
    v39[2](v39, 8, 0, v81, v82, 0.0, -v68, v64, v68);
    [v40 closePath];
    id v48 = v40;
  }
  else
  {
    v47 = (void *)MEMORY[0x1E4FB14C0];
    UIRectInset();
    objc_msgSend(v47, "bezierPathWithRoundedRect:cornerRadius:");
    id v48 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v48;
}

uint64_t __46__TUIVariantSelectorView_backgroundBezierPath__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", a4 + a6, a5 + a7);
  v16 = *(void **)(a1 + 32);
  return objc_msgSend(v16, "_addRoundedCornerWithTrueCorner:radius:corner:clockwise:", a2, a3, a4, a5, a8, a9);
}

uint64_t __46__TUIVariantSelectorView_backgroundBezierPath__block_invoke_2(uint64_t a1, int a2, double a3, double a4, double a5, double a6)
{
  if (a2) {
    double v11 = -*(double *)(a1 + 48);
  }
  else {
    double v11 = *(double *)(a1 + 48);
  }
  objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", a3, a4 + v11);
  CGFloat v12 = *(void **)(a1 + 32);
  return objc_msgSend(v12, "addCurveToPoint:controlPoint1:controlPoint2:", a5, a6 - v11, a3, a6, a5, a4);
}

- (BOOL)drawsShadows
{
  v2 = [(TUIKeyPopupView *)self renderTraits];
  char v3 = [v2 usesDarkAppearance] ^ 1;

  return v3;
}

- (id)cellViewsInSubtreeOrder
{
  BOOL v3 = [(TUIVariantSelectorView *)self baseKeyOnRight];
  double v4 = [(TUIKeyPopupView *)self arrangedVariantCells];
  double v5 = v4;
  if (v3)
  {
    double v6 = [v4 reverseObjectEnumerator];
    uint64_t v7 = [v6 allObjects];

    double v5 = (void *)v7;
  }
  return v5;
}

- (CGSize)originRectRadius
{
  double v2 = 6.0;
  double v3 = 6.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)paddleRadius
{
  double v2 = 12.0;
  double v3 = 12.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)widthConstraintsForVariantCell:(id)a3 previousCell:(id)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v7)
  {
    double v9 = [v6 widthAnchor];
    CGFloat v10 = [v7 widthAnchor];
    double v11 = [v9 constraintEqualToAnchor:v10];
    [v8 addObject:v11];
  }
  CGFloat v12 = [v6 widthAnchor];
  double v13 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
  CGFloat v14 = [v13 widthAnchor];
  double v15 = [v12 constraintGreaterThanOrEqualToAnchor:v14];

  v16 = [v6 widthAnchor];
  double v17 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
  CGFloat v18 = [v17 widthAnchor];
  double v19 = [v16 constraintEqualToAnchor:v18];

  LODWORD(v20) = 1144766464;
  [v19 setPriority:v20];
  v23[0] = v15;
  v23[1] = v19;
  double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  [v8 addObjectsFromArray:v21];

  return v8;
}

- (id)variantCellWithString:(id)a3 annotation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [TUIVariantCell alloc];
  double v9 = [(TUIKeyPopupView *)self renderTraits];
  CGFloat v10 = -[TUIVariantCell initWithFrame:string:annotation:traits:](v8, "initWithFrame:string:annotation:traits:", v7, v6, v9, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v10;
}

- (void)addVariantsForKey:(id)a3 toView:(id)a4 isNonVariantPaddle:(BOOL)a5
{
  BOOL v5 = a5;
  v79[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v9 && [(TUIKeyPopupView *)self needsPopup])
  {
    BOOL v71 = v5;
    CGFloat v10 = [v8 subtrees];
    uint64_t v11 = [v10 count];
    CGFloat v12 = [(TUIKeyPopupView *)self arrangedVariantCells];
    if (v11 == [v12 count])
    {
      double v13 = [(TUIKeyPopupView *)self arrangedVariantCells];
      uint64_t v14 = [v13 count];

      BOOL v15 = v71;
      if (v14) {
        goto LABEL_58;
      }
    }
    else
    {

      BOOL v15 = v71;
    }
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v78 = v16;
    if (v15)
    {
      [v16 addObject:v8];
    }
    else
    {
      BOOL v17 = [(TUIVariantSelectorView *)self baseKeyOnRight];
      CGFloat v18 = [v8 subtrees];
      double v19 = v18;
      if (v17)
      {
        uint64_t v20 = [v18 count];

        if (v20)
        {
          unint64_t v21 = 0;
          do
          {
            double v22 = [v8 subtrees];
            double v23 = [v22 objectAtIndex:v21];
            [v78 insertObject:v23 atIndex:0];

            ++v21;
            v24 = [v8 subtrees];
            unint64_t v25 = [v24 count];
          }
          while (v21 < v25);
        }
      }
      else
      {
        [v78 addObjectsFromArray:v18];
      }
    }
    unint64_t v26 = [(TUIKeyPopupView *)self maxVariantsPerRowForKey:v8];
    if ([(TUIVariantSelectorView *)self baseKeyOnRight])
    {
      unint64_t v27 = [v78 count];
      unint64_t v72 = v26 + v27 / v26 * v26 - v27;
    }
    else
    {
      unint64_t v72 = 0;
    }
    BOOL v28 = [(TUIVariantSelectorView *)self baseKeyOnRight];
    v29 = [(TUIKeyPopupView *)self arrangedVariantRows];
    v30 = v29;
    if (v28) {
      [v29 objectEnumerator];
    }
    else {
    double v73 = [v29 reverseObjectEnumerator];
    }
    BOOL v31 = v71;
    id v68 = v9;

    id v74 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v32 = v78;
    if ([v78 count])
    {
      unint64_t v77 = v26;
      unint64_t v33 = 0;
      v34 = 0;
      double v35 = 0;
      id v70 = v8;
      do
      {
        if (!v35 || !((v72 + v33) % v77))
        {
          uint64_t v36 = objc_msgSend(v73, "nextObject", v68);

          double v35 = (void *)v36;
        }
        v37 = objc_msgSend(v32, "objectAtIndex:", v33, v68);
        id v38 = v37;
        if (v35 && v37)
        {
          v39 = [v37 variantDisplayString];
          if (!v39 || v31)
          {
            if ([v8 displayType] == 8
              && ([v38 overrideDisplayString],
                  id v40 = objc_claimAutoreleasedReturnValue(),
                  v40,
                  v40))
            {
              uint64_t v41 = [v38 overrideDisplayString];
            }
            else
            {
              uint64_t v41 = [v38 displayString];
            }
            double v43 = (void *)v41;

            v39 = v43;
          }
          CGFloat v44 = [v38 secondaryDisplayStrings];
          uint64_t v45 = [v44 count];

          if (v45)
          {
            double v46 = [v38 secondaryDisplayStrings];
            uint64_t v47 = [v46 firstObject];
          }
          else
          {
            uint64_t v47 = 0;
          }
          double v76 = v39;
          double v42 = [(TUIVariantSelectorView *)self variantCellWithString:v39 annotation:v47];
          objc_msgSend(v42, "setUserInteractionEnabled:", -[TUIKeyPopupView wantsUserInteractionEnabled](self, "wantsUserInteractionEnabled"));
          id v48 = [v8 subtrees];
          objc_msgSend(v42, "setIndexNumber:", objc_msgSend(v48, "indexOfObject:", v38));

          BOOL v49 = [(TUIKeyPopupView *)self shouldProvideDefaultSelection];
          BOOL v50 = 0;
          CGFloat v75 = (void *)v47;
          if (v49 && !v31)
          {
            uint64_t v51 = objc_msgSend(v8, "selectedVariantIndex", 0);
            BOOL v50 = v51 == [v42 indexNumber];
          }
          [v42 setPrimaryVariant:v50];
          [v35 addArrangedSubview:v42];
          double v52 = [(TUIKeyPopupView *)self arrangedVariantCells];
          [v52 addObject:v42];

          if (!v33 && ![(TUIVariantSelectorView *)self baseKeyOnRight]
            || v33 % v77 == [v78 count] - 1
            && [(TUIVariantSelectorView *)self baseKeyOnRight])
          {
            CGFloat v53 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
            CGFloat v54 = [v53 centerXAnchor];
            double v55 = [v42 centerXAnchor];
            CGFloat v56 = [v54 constraintEqualToAnchor:v55];

            BOOL v31 = v71;
            if (v71 || (uint64_t v58 = [v78 count], LODWORD(v57) = 1144750080, v58 == 1)) {
              LODWORD(v57) = 1148829696;
            }
            [v56 setPriority:v57];
            [v74 addObject:v56];
          }
          int64_t v59 = [(TUIKeyPopupView *)self layoutStyle];
          double v60 = [v42 heightAnchor];
          if (v59 == 1)
          {
            [(id)objc_opt_class() minCellDimension];
            double v61 = objc_msgSend(v60, "constraintGreaterThanOrEqualToConstant:");

            LODWORD(v62) = 1144750080;
            [v61 setPriority:v62];
            LODWORD(v63) = 1144766464;
            [v42 setContentCompressionResistancePriority:1 forAxis:v63];
          }
          else
          {
            double v64 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
            CGFloat v65 = [v64 heightAnchor];
            double v61 = [v60 constraintEqualToAnchor:v65 multiplier:1.3];

            BOOL v31 = v71;
          }
          v79[0] = v61;
          CGFloat v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:1];
          [v74 addObjectsFromArray:v66];

          CGFloat v67 = [(TUIVariantSelectorView *)self widthConstraintsForVariantCell:v42 previousCell:v34];
          [v74 addObjectsFromArray:v67];

          id v8 = v70;
          double v32 = v78;
        }
        else
        {
          double v42 = v34;
        }

        ++v33;
        v34 = v42;
      }
      while ([v32 count] > v33);
    }
    else
    {
      double v35 = 0;
      double v42 = 0;
    }
    objc_msgSend(MEMORY[0x1E4F28DC8], "activateConstraints:", v74, v68);

    id v9 = v69;
  }
LABEL_58:
  [(TUIKeyPopupView *)self setInitialHighlight];
  [(TUIVariantSelectorView *)self layoutIfNeeded];
}

- (void)updateVariantsIfNeededForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 subtrees];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    if ([(TUIKeyPopupView *)self layoutStyle] == 1
      && [(TUIKeyPopupView *)self shouldProvideDefaultSelection])
    {
      uint64_t v7 = 0;
    }
    [v4 setSelectedVariantIndex:v7];
    if ([v4 state] == 16) {
      [(TUIKeyPopupView *)self setNeedsPopup:1];
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)TUIVariantSelectorView;
  [(TUIKeyPopupView *)&v8 updateVariantsIfNeededForKey:v4];
}

- (id)alignmentConstraintsForKey:(id)a3
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4
    && ([(TUIKeyPopupView *)self associatedTree],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    id v44 = v4;
    id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = [(TUIKeyPopupView *)self associatedTree];
    int v7 = [v6 interactionType];

    unint64_t v8 = 0x1E4F1C000;
    if (v7 == 2)
    {
      double v42 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
      id v9 = [v42 leadingAnchor];
      id v40 = [(TUIKeyPopupView *)self variantView];
      CGFloat v10 = [v40 leadingAnchor];
      uint64_t v11 = [v9 constraintGreaterThanOrEqualToAnchor:v10];
      v47[0] = v11;
      CGFloat v12 = [(TUIKeyPopupView *)self variantView];
      double v13 = [v12 trailingAnchor];
      uint64_t v14 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
      BOOL v15 = [v14 trailingAnchor];
      id v16 = [v13 constraintGreaterThanOrEqualToAnchor:v15];
      v47[1] = v16;
      BOOL v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];

      unint64_t v8 = 0x1E4F1C000uLL;
      [v45 addObjectsFromArray:v17];
    }
    double v43 = [(TUIKeyPopupView *)self variantView];
    uint64_t v41 = [v43 leadingAnchor];
    v39 = [(TUIVariantSelectorView *)self leadingAnchor];
    id v38 = [v41 constraintEqualToAnchor:v39 constant:0.0];
    v46[0] = v38;
    uint64_t v36 = [(TUIVariantSelectorView *)self trailingAnchor];
    v37 = [(TUIKeyPopupView *)self variantView];
    double v35 = [v37 trailingAnchor];
    v34 = [v36 constraintEqualToAnchor:v35 constant:0.0];
    v46[1] = v34;
    unint64_t v33 = [(TUIKeyPopupView *)self variantView];
    double v32 = [v33 topAnchor];
    BOOL v31 = [(TUIVariantSelectorView *)self topAnchor];
    v30 = [v32 constraintEqualToAnchor:v31 constant:0.0];
    v46[2] = v30;
    v29 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
    CGFloat v18 = [v29 topAnchor];
    double v19 = [(TUIKeyPopupView *)self variantView];
    uint64_t v20 = [v19 bottomAnchor];
    [(TUIKeyPopupView *)self variantViewBottomSpacing];
    unint64_t v21 = objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20);
    v46[3] = v21;
    [(TUIVariantSelectorView *)self bottomAnchor];
    v23 = double v22 = v45;
    v24 = [(TUIKeyPopupView *)self baseKeyLayoutGuide];
    unint64_t v25 = [v24 bottomAnchor];
    unint64_t v26 = [v23 constraintEqualToAnchor:v25];
    v46[4] = v26;
    unint64_t v27 = [*(id *)(v8 + 2424) arrayWithObjects:v46 count:5];
    [v45 addObjectsFromArray:v27];

    id v4 = v44;
  }
  else
  {
    double v22 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v22;
}

- (TUIVariantSelectorView)initWithKey:(id)a3 renderTraits:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUIVariantSelectorView;
  int v7 = [(TUIKeyPopupView *)&v10 initWithKey:v6 renderTraits:a4];
  if (v7)
  {
    unint64_t v8 = [v6 backingTree];
    v7->_baseKeyOnRight = [v8 dynamicDisplayCorner] == 8;
  }
  return v7;
}

+ (double)minCellDimension
{
  return 60.0;
}

@end
@interface SUUIInteractiveSegmentedControl
- (BOOL)_setSelectionProgress:(double)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)segments;
- (SUUIInteractiveSegmentedControl)initWithFrame:(CGRect)a3;
- (double)dividerWidth;
- (double)relativeSelectionProgressForSelectionProgress:(double)a3 segmentIndex:(int64_t)a4;
- (double)selectionProgress;
- (double)selectionProgressForRelativeSectionProgress:(double)a3 segmentIndex:(int64_t)a4;
- (double)selectionProgressForSelectedSegmentAtIndex:(int64_t)a3;
- (id)_createDividerViewWithFrame:(CGRect)a3;
- (id)dividerCreationBlock;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)selectedSegmentIndexForSelectionProgress:(double)a3;
- (void)_applySelectionProgressToSegments;
- (void)_notifyClientsOfSelectionProgressChange;
- (void)_registerForObservationOfSegment:(id)a3;
- (void)_segmentControlTouchUpInsideAction:(id)a3;
- (void)_unregisterForObservationOfSegment:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setDividerCreationBlock:(id)a3;
- (void)setDividerWidth:(double)a3;
- (void)setSegments:(id)a3;
@end

@implementation SUUIInteractiveSegmentedControl

- (SUUIInteractiveSegmentedControl)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIInteractiveSegmentedControl;
  result = -[SUUIInteractiveSegmentedControl initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_dividerWidth = 1.0;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_segments;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [(SUUIInteractiveSegmentedControl *)self _unregisterForObservationOfSegment:*(void *)(*((void *)&v9 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SUUIInteractiveSegmentedControl;
  [(SUUIInteractiveSegmentedControl *)&v8 dealloc];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)SUUIInteractiveSegmentedControl;
  -[SUUIInteractiveSegmentedControl hitTest:withEvent:](&v29, sel_hitTest_withEvent_, v7, x, y);
  objc_super v8 = (SUUIInteractiveSegmentedControl *)objc_claimAutoreleasedReturnValue();
  int v9 = [(NSMutableArray *)self->_dividerViews containsObject:v8];
  if (v8 == self || v9 != 0)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v11 = self->_segments;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v26;
      double v16 = 1.79769313e308;
LABEL_7:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v11);
        }
        v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
        if (objc_msgSend(v18, "isEnabled", (void)v25))
        {
          if ([v18 isUserInteractionEnabled])
          {
            [v18 frame];
            UIDistanceBetweenPointAndRect();
            double v20 = v19;
            if (v19 - v16 <= 0.00000011920929)
            {
              v21 = v18;

              uint64_t v14 = v21;
              double v16 = v20;
              if (v20 <= 0.00000011920929) {
                break;
              }
            }
          }
        }
        if (v13 == ++v17)
        {
          uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
          v21 = v14;
          if (v13) {
            goto LABEL_7;
          }
          break;
        }
      }
    }
    else
    {
      v21 = 0;
    }

    if (v21) {
      v22 = v21;
    }
    else {
      v22 = self;
    }
    v23 = v22;

    objc_super v8 = v23;
  }

  return v8;
}

- (void)layoutSubviews
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  v59.receiver = self;
  v59.super_class = (Class)SUUIInteractiveSegmentedControl;
  [(SUUIInteractiveSegmentedControl *)&v59 layoutSubviews];
  [(SUUIInteractiveSegmentedControl *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  long long v11 = [(SUUIInteractiveSegmentedControl *)self traitCollection];
  [v11 displayScale];
  double v13 = v12;

  if (v13 < 0.00000011920929)
  {
    uint64_t v14 = [MEMORY[0x263F82B60] mainScreen];
    [v14 scale];
    double v13 = v15;
  }
  unint64_t v16 = [(NSArray *)self->_segments count];
  v62.origin.double x = v4;
  v62.origin.double y = v6;
  v62.size.width = v8;
  v62.size.height = v10;
  double v17 = CGRectGetWidth(v62) - (double)(v16 - 1) * self->_dividerWidth;
  UIFloorToViewScale();
  double v19 = v18;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  v58[3] = llround(v13 * (v17 - v18 * (double)v16));
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  v57[3] = 0;
  uint64_t v53 = 0;
  v54 = (double *)&v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  uint64_t v49 = 0;
  v50 = (double *)&v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v48[3] = 0;
  segments = self->_segments;
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __49__SUUIInteractiveSegmentedControl_layoutSubviews__block_invoke;
  v47[3] = &unk_2654072B8;
  *(double *)&v47[7] = v17;
  *(CGFloat *)&v47[8] = v4;
  *(CGFloat *)&v47[9] = v6;
  *(CGFloat *)&v47[10] = v8;
  *(CGFloat *)&v47[11] = v10;
  *(double *)&v47[12] = v18;
  v47[4] = &v49;
  v47[5] = &v53;
  v47[6] = v48;
  [(NSArray *)segments enumerateObjectsUsingBlock:v47];
  double v21 = v50[3] - v17;
  if (v21 > 0.0) {
    v54[3] = v54[3] - v21;
  }
  v22 = (void *)[(NSMutableArray *)self->_dividerViews mutableCopy];
  v23 = self->_segments;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __49__SUUIInteractiveSegmentedControl_layoutSubviews__block_invoke_2;
  v33[3] = &unk_2654072E0;
  double v39 = v17;
  CGFloat v40 = v4;
  CGFloat v41 = v6;
  CGFloat v42 = v8;
  CGFloat v43 = v10;
  double v44 = v19;
  v35 = v57;
  v36 = v48;
  v33[4] = self;
  v37 = &v53;
  v38 = v58;
  double v45 = v21;
  double v46 = v13;
  id v24 = v22;
  id v34 = v24;
  [(NSArray *)v23 enumerateObjectsUsingBlock:v33];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v25 = v24;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v29 objects:v60 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(v25);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v26 = [v25 countByEnumeratingWithState:&v29 objects:v60 count:16];
    }
    while (v26);
  }

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v58, 8);
}

void __49__SUUIInteractiveSegmentedControl_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 56);
  CGFloat v4 = *(double *)(a1 + 64);
  CGFloat v5 = *(double *)(a1 + 72);
  CGFloat v6 = *(double *)(a1 + 80);
  CGFloat v7 = *(double *)(a1 + 88);
  id v8 = a2;
  v12.origin.double x = v4;
  v12.origin.double y = v5;
  v12.size.width = v6;
  v12.size.height = v7;
  objc_msgSend(v8, "sizeThatFits:", v3, CGRectGetHeight(v12));
  double v10 = v9;

  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v10
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  double v11 = *(double *)(a1 + 96);
  if (v10 > v11)
  {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10
                                                                - v11
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

void __49__SUUIInteractiveSegmentedControl_layoutSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  id v29 = a2;
  uint64_t v3 = [v29 segmentPosition];
  [v29 frame];
  objc_msgSend(v29, "sizeThatFits:", *(double *)(a1 + 80), CGRectGetHeight(*(CGRect *)(a1 + 88)));
  double v5 = v4;
  CGFloat v6 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  CGFloat Height = CGRectGetHeight(*(CGRect *)(a1 + 88));
  double v8 = *(double *)(a1 + 120);
  double v9 = 0.0;
  v31.origin.double y = 0.0;
  v31.origin.double x = v6;
  v31.size.width = v8;
  v31.size.height = Height;
  if (v5 <= CGRectGetWidth(v31))
  {
    if (*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) > 0.0)
    {
      [*(id *)(*(void *)(a1 + 32) + 480) count];
      UIFloorToViewScale();
      double v12 = v11;
      v32.origin.double y = 0.0;
      v32.origin.double x = v6;
      v32.size.width = v8;
      v32.size.height = Height;
      double v13 = CGRectGetWidth(v32) - v5;
      if (v12 < v13) {
        double v13 = v12;
      }
      double v8 = v8 - v13;
      *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                              + 24)
                                                                  - v13;
    }
  }
  else
  {
    if (*(double *)(a1 + 128) > 0.0)
    {
      UIFloorToViewScale();
      double v9 = v10;
    }
    double v8 = v5 - v9;
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v15 = *(void *)(v14 + 24);
  BOOL v16 = v15 < 1;
  uint64_t v17 = v15 - 1;
  if (!v16)
  {
    double v8 = v8 + 1.0 / *(double *)(a1 + 136);
    *(void *)(v14 + 24) = v17;
  }
  objc_msgSend(v29, "setFrame:", SUUIRectByApplyingUserInterfaceLayoutDirectionInRect(v6, 0.0, v8, Height, *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 104), *(CGFloat *)(a1 + 112)));
  v33.origin.double y = 0.0;
  v33.origin.double x = v6;
  v33.size.width = v8;
  v33.size.height = Height;
  CGFloat Width = CGRectGetWidth(v33);
  double v19 = v29;
  *(CGFloat *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = Width
                                                               + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                           + 24);
  if ((unint64_t)(v3 - 1) <= 1)
  {
    CGFloat v20 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    CGFloat v21 = *(double *)(*(void *)(a1 + 32) + 472);
    CGFloat v22 = CGRectGetHeight(*(CGRect *)(a1 + 88));
    uint64_t v23 = [*(id *)(a1 + 40) firstObject];
    if (v23)
    {
      id v24 = (void *)v23;
      [*(id *)(a1 + 40) removeObjectAtIndex:0];
      objc_msgSend(v24, "setFrame:", SUUIRectByApplyingUserInterfaceLayoutDirectionInRect(v20, 0.0, v21, v22, *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 104), *(CGFloat *)(a1 + 112)));
    }
    else
    {
      id v24 = objc_msgSend(*(id *)(a1 + 32), "_createDividerViewWithFrame:", v20, 0.0, v21, v22);
      [*(id *)(a1 + 32) addSubview:v24];
      id v25 = *(void **)(*(void *)(a1 + 32) + 456);
      if (!v25)
      {
        uint64_t v26 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
        uint64_t v27 = *(void *)(a1 + 32);
        long long v28 = *(void **)(v27 + 456);
        *(void *)(v27 + 456) = v26;

        id v25 = *(void **)(*(void *)(a1 + 32) + 456);
      }
      [v25 addObject:v24];
    }
    v34.origin.double x = v20;
    v34.origin.double y = 0.0;
    v34.size.width = v21;
    v34.size.height = v22;
    *(CGFloat *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = CGRectGetWidth(v34)
                                                                 + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                             + 24);

    double v19 = v29;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v22 = *MEMORY[0x263EF8340];
  [(NSArray *)self->_segments count];
  UIFloorToViewScale();
  double v7 = v6;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v8 = self->_segments;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  double v10 = 0.0;
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v13), "sizeThatFits:", v7, height, (void)v17);
        if (v14 >= v7) {
          double v14 = v7;
        }
        if (v10 < v14) {
          double v10 = v14;
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  UICeilToViewScale();
  if (width < v15) {
    double v15 = width;
  }
  double v16 = height;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)setDividerCreationBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_dividerCreationBlock != a3)
  {
    double v4 = (void *)[a3 copy];
    id dividerCreationBlock = self->_dividerCreationBlock;
    self->_id dividerCreationBlock = v4;

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v6 = self->_dividerViews;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10++), "removeFromSuperview", (void)v12);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    dividerViews = self->_dividerViews;
    self->_dividerViews = 0;

    [(SUUIInteractiveSegmentedControl *)self setNeedsLayout];
  }
}

- (void)setDividerWidth:(double)a3
{
  if (vabdd_f64(self->_dividerWidth, a3) > 0.00000011920929)
  {
    self->_dividerCGFloat Width = a3;
    [(SUUIInteractiveSegmentedControl *)self setNeedsLayout];
  }
}

- (void)setSegments:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  double v4 = (NSArray *)a3;
  segments = self->_segments;
  if (segments != v4 && ![(NSArray *)segments isEqualToArray:v4])
  {
    int64_t v6 = [(SUUIInteractiveSegmentedControl *)self selectedSegmentIndexForSelectionProgress:self->_selectionProgress];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v34 = 0;
      double v7 = 0.0;
    }
    else
    {
      int64_t v8 = v6;
      uint64_t v34 = [(NSArray *)self->_segments objectAtIndex:v6];
      [(SUUIInteractiveSegmentedControl *)self relativeSelectionProgressForSelectionProgress:v8 segmentIndex:self->_selectionProgress];
      double v7 = v9;
    }
    uint64_t v10 = self->_segments;
    uint64_t v11 = (void *)[(NSArray *)v10 mutableCopy];
    long long v12 = (NSArray *)[(NSArray *)v4 copy];
    long long v13 = self->_segments;
    self->_segments = v12;

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v14 = self->_segments;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v41 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          objc_msgSend(v11, "removeObject:", v19, v34);
          if (![(NSArray *)v10 containsObject:v19])
          {
            [(SUUIInteractiveSegmentedControl *)self _registerForObservationOfSegment:v19];
            [(SUUIInteractiveSegmentedControl *)self addSubview:v19];
          }
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v16);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v20 = v11;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(v20);
          }
          id v25 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          -[SUUIInteractiveSegmentedControl _unregisterForObservationOfSegment:](self, "_unregisterForObservationOfSegment:", v25, v34);
          if ([v25 isDescendantOfView:self]) {
            [v25 removeFromSuperview];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v22);
    }

    NSUInteger v26 = [(NSArray *)self->_segments count];
    uint64_t v27 = self->_segments;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __47__SUUIInteractiveSegmentedControl_setSegments___block_invoke;
    v35[3] = &__block_descriptor_40_e53_v32__0__UIControl_SUUIInteractiveSegmenting__8Q16_B24l;
    v35[4] = v26;
    [(NSArray *)v27 enumerateObjectsUsingBlock:v35];
    long long v28 = (void *)v34;
    if (v34)
    {
      id v29 = self->_segments;
      double v30 = 0.0;
      if (v29)
      {
        uint64_t v31 = [(NSArray *)v29 indexOfObject:v34];
        if (v31 != 0x7FFFFFFFFFFFFFFFLL)
        {
          [(SUUIInteractiveSegmentedControl *)self selectionProgressForRelativeSectionProgress:v31 segmentIndex:v7];
          double v30 = v32;
        }
      }
      BOOL v33 = -[SUUIInteractiveSegmentedControl _setSelectionProgress:](self, "_setSelectionProgress:", v30, v34);
      [(SUUIInteractiveSegmentedControl *)self _applySelectionProgressToSegments];
      if (v33) {
        [(SUUIInteractiveSegmentedControl *)self _notifyClientsOfSelectionProgressChange];
      }
    }
    [(SUUIInteractiveSegmentedControl *)self setNeedsLayout];
  }
}

uint64_t __47__SUUIInteractiveSegmentedControl_setSegments___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(a1 + 32);
  if (v3 < 2)
  {
    uint64_t v6 = 0;
  }
  else
  {
    BOOL v4 = v3 - 1 == a3;
    uint64_t v5 = 2;
    if (v4) {
      uint64_t v5 = 3;
    }
    if (a3) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 1;
    }
  }
  return [a2 setSegmentPosition:v6];
}

- (double)relativeSelectionProgressForSelectionProgress:(double)a3 segmentIndex:(int64_t)a4
{
  NSUInteger v7 = [(NSArray *)self->_segments count];
  if (!v7) {
    return 0.0;
  }
  unint64_t v8 = v7;
  [(SUUIInteractiveSegmentedControl *)self selectionProgressForSelectedSegmentAtIndex:a4];
  double result = fmax((a3 - v9) / (1.0 / (double)v8), -1.0);
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (double)selectionProgressForRelativeSectionProgress:(double)a3 segmentIndex:(int64_t)a4
{
  unint64_t v7 = [(NSArray *)self->_segments count];
  if (!v7) {
    return 0.0;
  }
  double v8 = fmax(a3, -1.0);
  if (v8 > 1.0) {
    double v8 = 1.0;
  }
  double v9 = v8 * (1.0 / (double)v7);
  [(SUUIInteractiveSegmentedControl *)self selectionProgressForSelectedSegmentAtIndex:a4];
  return v9 + v10;
}

- (double)selectionProgressForSelectedSegmentAtIndex:(int64_t)a3
{
  unint64_t v4 = [(NSArray *)self->_segments count];
  if (v4) {
    return 1.0 / (double)v4 * 0.5 + (double)a3 * (1.0 / (double)v4);
  }
  else {
    return 0.0;
  }
}

- (int64_t)selectedSegmentIndexForSelectionProgress:(double)a3
{
  unint64_t v4 = [(NSArray *)self->_segments count];
  if (v4) {
    return llround((a3 + -1.0 / (double)v4 * 0.5) * (double)(v4 - 1));
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)_segmentControlTouchUpInsideAction:(id)a3
{
  id v4 = a3;
  uint64_t segments = (uint64_t)self->_segments;
  if (segments)
  {
    id v6 = v4;
    uint64_t segments = [(id)segments indexOfObject:v4];
    id v4 = v6;
    if (segments != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(SUUIInteractiveSegmentedControl *)self selectionProgressForSelectedSegmentAtIndex:segments];
      uint64_t segments = -[SUUIInteractiveSegmentedControl _setSelectionProgress:](self, "_setSelectionProgress:");
      id v4 = v6;
      if (segments)
      {
        uint64_t segments = [(SUUIInteractiveSegmentedControl *)self _notifyClientsOfSelectionProgressChange];
        id v4 = v6;
      }
    }
  }
  MEMORY[0x270F9A758](segments, v4);
}

- (void)_applySelectionProgressToSegments
{
  uint64_t segments = self->_segments;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __68__SUUIInteractiveSegmentedControl__applySelectionProgressToSegments__block_invoke;
  v3[3] = &unk_265407328;
  v3[4] = self;
  [(NSArray *)segments enumerateObjectsUsingBlock:v3];
}

void __68__SUUIInteractiveSegmentedControl__applySelectionProgressToSegments__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(double **)(a1 + 32);
  double v5 = v4[61];
  id v6 = a2;
  [v4 relativeSelectionProgressForSelectionProgress:a3 segmentIndex:v5];
  objc_msgSend(v6, "setRelativeSelectionProgress:");
}

- (id)_createDividerViewWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id dividerCreationBlock = (void (**)(id, SUUIInteractiveSegmentedControl *, __n128, __n128, __n128, __n128))self->_dividerCreationBlock;
  if (!dividerCreationBlock
    || (dividerCreationBlock[2](dividerCreationBlock, self, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height), (double v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v9 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", x, y, width, height);
    double v10 = [MEMORY[0x263F825C8] clearColor];
    [v9 setBackgroundColor:v10];
  }
  return v9;
}

- (void)_notifyClientsOfSelectionProgressChange
{
}

- (void)_registerForObservationOfSegment:(id)a3
{
  if (a3) {
    [a3 addTarget:self action:sel__segmentControlTouchUpInsideAction_ forControlEvents:64];
  }
}

- (BOOL)_setSelectionProgress:(double)a3
{
  double v3 = vabdd_f64(self->_selectionProgress, a3);
  if (v3 > 0.00000011920929)
  {
    self->_selectionProgress = a3;
    [(SUUIInteractiveSegmentedControl *)self _applySelectionProgressToSegments];
  }
  return v3 > 0.00000011920929;
}

- (void)_unregisterForObservationOfSegment:(id)a3
{
  if (a3) {
    [a3 removeTarget:self action:sel__segmentControlTouchUpInsideAction_ forControlEvents:64];
  }
}

- (id)dividerCreationBlock
{
  return self->_dividerCreationBlock;
}

- (double)dividerWidth
{
  return self->_dividerWidth;
}

- (NSArray)segments
{
  return self->_segments;
}

- (double)selectionProgress
{
  return self->_selectionProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong(&self->_dividerCreationBlock, 0);
  objc_storeStrong((id *)&self->_dividerViews, 0);
}

@end
@interface UIIndexBarAccessoryView
+ (void)makeIndexBarView:(id *)a3 scrollAccessoryContainerView:(id *)a4 forTraits:(id)a5;
- (BOOL)_selectEntry:(id)a3 atIndex:(int64_t)a4;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)overlay;
- (UIScrollView)scrollView;
- (id)displayEntryNearestToContentOffset:(CGPoint)a3;
- (int64_t)edge;
- (void)_horizontalSizeClassDidChange;
- (void)setEdge:(int64_t)a3;
- (void)setEntries:(id)a3;
- (void)setScrollView:(id)a3;
- (void)update;
@end

@implementation UIIndexBarAccessoryView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"contents"])
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIIndexBarAccessoryView;
    BOOL v5 = [(UIView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)setEntries:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIIndexBarAccessoryView;
  [(UIIndexBarView *)&v5 setEntries:a3];
  id v4 = [(UIIndexBarAccessoryView *)self scrollView];
  [v4 _updateAccessories];
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)update
{
  id v59 = [(UIIndexBarView *)self visualStyle];
  if (objc_opt_respondsToSelector())
  {
    v3 = [(UIIndexBarView *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v4 = [(UIIndexBarView *)self entries];
      uint64_t v5 = [v4 count];

      if (v5)
      {
        int64_t v6 = [(UIIndexBarAccessoryView *)self edge];
        BOOL v7 = v6 != 2;
        BOOL v8 = v6 != 4;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
        [WeakRetained _minimumContentOffset];
        double v11 = v10;
        double v13 = v12;

        id v14 = objc_loadWeakRetained((id *)&self->_scrollView);
        [v14 _maximumContentOffset];
        double v16 = v15;
        double v18 = v17;

        BOOL v19 = v7 && v8;
        if (v7 && v8) {
          double v20 = v18;
        }
        else {
          double v20 = v16;
        }
        if (v7 && v8) {
          double v21 = v13;
        }
        else {
          double v21 = v11;
        }
        double v22 = v20 - v21;
        double v23 = -1.0;
        if (v20 - v21 > 0.0)
        {
          id v24 = objc_loadWeakRetained((id *)&self->_scrollView);
          [v24 contentOffset];
          double v26 = v25;
          double v28 = v27;

          double v29 = v7 && v8 ? v28 : v26;
          double v30 = (v29 - v21) / v22;
          double v23 = -2.0;
          if (v30 >= 0.0)
          {
            if (v30 <= 1.0)
            {
              v31 = [(UIIndexBarView *)self entries];
              uint64_t v32 = [v31 count] - 1;

              if (v32 < 2)
              {
                uint64_t v33 = 0;
                double v35 = 0.0;
                double v36 = INFINITY;
              }
              else
              {
                uint64_t v33 = 0;
                unint64_t v34 = llround(v30 * (double)v32);
                double v35 = 0.0;
                double v36 = INFINITY;
                do
                {
                  v37 = [(UIIndexBarView *)self delegate];
                  v38 = [(UIIndexBarView *)self entries];
                  v39 = [v38 objectAtIndexedSubscript:v34];
                  [v37 indexBarAccessoryView:self contentOffsetForEntry:v39 atIndex:v34];
                  double v41 = v40;
                  double v43 = v42;

                  if (v19) {
                    double v44 = v43;
                  }
                  else {
                    double v44 = v41;
                  }
                  if (v44 >= v29)
                  {
                    if (v44 <= v29)
                    {
                      uint64_t v33 = v34;
                      uint64_t v32 = v34;
                    }
                    else
                    {
                      uint64_t v32 = v34--;
                      double v36 = v44;
                    }
                  }
                  else
                  {
                    uint64_t v33 = v34++;
                    double v35 = v44;
                  }
                }
                while (v32 - v33 > 1);
              }
              if (v32 == v33)
              {
                double v23 = (double)v33;
              }
              else if (v32 >= v33)
              {
                if (v35 == 0.0)
                {
                  v45 = [(UIIndexBarView *)self delegate];
                  v46 = [(UIIndexBarView *)self entries];
                  v47 = [v46 objectAtIndexedSubscript:v33];
                  [v45 indexBarAccessoryView:self contentOffsetForEntry:v47 atIndex:v33];
                  double v49 = v48;
                  double v51 = v50;

                  if (v19) {
                    double v35 = v51;
                  }
                  else {
                    double v35 = v49;
                  }
                }
                if (v36 == INFINITY)
                {
                  v52 = [(UIIndexBarView *)self delegate];
                  v53 = [(UIIndexBarView *)self entries];
                  v54 = [v53 objectAtIndexedSubscript:v32];
                  [v52 indexBarAccessoryView:self contentOffsetForEntry:v54 atIndex:v32];
                  double v56 = v55;
                  double v58 = v57;

                  if (v19) {
                    double v36 = v58;
                  }
                  else {
                    double v36 = v56;
                  }
                }
                if (v29 >= v35)
                {
                  double v23 = -3.0;
                  if (v29 <= v36) {
                    double v23 = (v29 - v35) / (v36 - v35) + (double)v33;
                  }
                }
              }
              else
              {
                double v23 = (double)v33 + 0.5;
              }
            }
            else
            {
              double v23 = -3.0;
            }
          }
        }
        [(UIIndexBarView *)self setHighlightedIndex:v23];
      }
      return;
    }
  }
}

- (void)setEdge:(int64_t)a3
{
  self->_edge = a3;
}

+ (void)makeIndexBarView:(id *)a3 scrollAccessoryContainerView:(id *)a4 forTraits:(id)a5
{
  id v9 = a5;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"UIIndexBarAccessoryView.m", 25, @"Invalid parameter not satisfying: %@", @"indexBarView != nil" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  double v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, a1, @"UIIndexBarAccessoryView.m", 26, @"Invalid parameter not satisfying: %@", @"containerView != nil" object file lineNumber description];

LABEL_3:
  id v18 = 0;
  id v19 = 0;
  [a1 makeIndexBarView:&v19 containerView:&v18 forTraits:v9];
  double v10 = (_UIIndexBarScrollAccessoryContainerAdapterView *)v19;
  double v11 = (_UIIndexBarScrollAccessoryContainerAdapterView *)v18;
  double v12 = v10;
  if (v10 != v11)
  {
    double v13 = v11;
    if (objc_opt_respondsToSelector())
    {
      double v12 = v13;
    }
    else
    {
      double v12 = [[_UIIndexBarScrollAccessoryContainerAdapterView alloc] initWithContents:v13 delegatingToView:v10];
    }
  }
  id v14 = v10;
  *a3 = v14;
  double v15 = v12;
  *a4 = v15;
}

- (BOOL)overlay
{
  v2 = [(UIIndexBarView *)self visualStyle];
  char v3 = [v2 overlay];

  return v3;
}

- (int64_t)edge
{
  return self->_edge;
}

- (void)setScrollView:(id)a3
{
}

- (BOOL)_selectEntry:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(UIIndexBarView *)self delegate];
  if (!v7) {
    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector())
  {
    char v8 = [v7 indexBarView:self didSelectEntry:v6 atIndex:a4];
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_9:
    char v8 = 0;
    goto LABEL_10;
  }
  id v9 = [(UIIndexBarAccessoryView *)self scrollView];
  double v10 = [(UIIndexBarView *)self delegate];
  [v10 indexBarAccessoryView:self contentOffsetForEntry:v6 atIndex:a4];
  double v12 = v11;
  double v14 = v13;

  [v9 contentOffset];
  double v16 = v15;
  double v18 = v17;
  objc_msgSend(v9, "setContentOffset:animated:", 0, v12, v14);
  [v9 contentOffset];
  BOOL v21 = vabdd_f64(v19, v16) >= 0.00000011920929;
  char v8 = vabdd_f64(v20, v18) >= 0.00000011920929 || v21;

LABEL_10:
  return v8;
}

- (id)displayEntryNearestToContentOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x3032000000;
  double v15 = __Block_byref_object_copy__236;
  double v16 = __Block_byref_object_dispose__236;
  id v17 = 0;
  id v6 = [(UIIndexBarView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [(UIIndexBarView *)self displayEntries];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__UIIndexBarAccessoryView_displayEntryNearestToContentOffset___block_invoke;
    v11[3] = &unk_1E530F2D8;
    *(CGFloat *)&v11[6] = x;
    *(CGFloat *)&v11[7] = y;
    v11[4] = self;
    v11[5] = &v12;
    [v8 enumerateObjectsUsingBlock:v11];
  }
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __62__UIIndexBarAccessoryView_displayEntryNearestToContentOffset___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  char v7 = [v12 entry];
  char v8 = v7;
  if (v7 && [v7 type] != 1)
  {
    id v9 = [*(id *)(a1 + 32) delegate];
    objc_msgSend(v9, "indexBarAccessoryView:contentOffsetForEntry:atIndex:", *(void *)(a1 + 32), v8, objc_msgSend(v12, "entryIndex"));
    double v11 = v10;

    if (v11 <= *(double *)(a1 + 56)) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    }
    else {
      *a4 = 1;
    }
  }
}

- (void)_horizontalSizeClassDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)UIIndexBarAccessoryView;
  [(UIIndexBarView *)&v4 _horizontalSizeClassDidChange];
  char v3 = [(UIIndexBarAccessoryView *)self scrollView];
  [v3 _updateAccessories];
}

- (void).cxx_destruct
{
}

@end
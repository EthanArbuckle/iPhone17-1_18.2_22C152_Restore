@interface TLKSelectableGridView
+ (unint64_t)idealNumberOfColumnsForTitles:(id)a3 fittingSize:(CGSize)a4 containerView:(id)a5;
+ (unint64_t)maxColumns;
- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5;
- (NSArray)tuples;
- (NSMutableArray)buttons;
- (TLKSelectableGridViewDelegate)delegate;
- (double)lastMeasuredWidth;
- (id)_createButton;
- (id)arrangedEntrySubviews;
- (id)setupContentView;
- (int64_t)selectedIndex;
- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5;
- (void)observedPropertiesChanged;
- (void)selectableGridButtonPressed:(id)a3;
- (void)setButtons:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastMeasuredWidth:(double)a3;
- (void)setSelectedIndex:(int64_t)a3;
- (void)setTuples:(id)a3;
@end

@implementation TLKSelectableGridView

- (id)setupContentView
{
  [(TLKSelectableGridView *)self setSelectedIndex:-1];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F4BEF8]) initWithArrangedSubviewRows:0];
  [v3 setHorizontalDistribution:1];
  [v3 setHorizontalAlignment:3];
  [v3 setVerticalAlignment:1];
  [v3 setRowSpacing:14.0];
  [v3 setColumnSpacing:12.0];
  [v3 setDelegate:self];
  v4 = objc_opt_new();
  [(TLKSelectableGridView *)self setButtons:v4];

  return v3;
}

- (void)setTuples:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_tuples = &self->_tuples;
  if (objc_opt_respondsToSelector())
  {
    [(NSArray *)*p_tuples setObserver:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v5;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v7 = *p_tuples;
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v30;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
            if (objc_opt_respondsToSelector()) {
              [v12 setObserver:0];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v9);
      }

      id v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_tuples, a3);
  if (objc_opt_respondsToSelector())
  {
    [(NSArray *)*p_tuples setObserver:self];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v13 = *p_tuples;
      uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
            if (objc_opt_respondsToSelector()) {
              [v18 setObserver:self];
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v15);
      }
    }
  }
  uint64_t v19 = [(TLKView *)self observer];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(TLKView *)self observer];
    uint64_t v22 = [v21 batchUpdateCount];

    if (!v22)
    {
      v23 = [(TLKView *)self observer];
      [v23 propertiesDidChange];
    }
  }
}

- (void)observedPropertiesChanged
{
  v3 = [(TLKSelectableGridView *)self tuples];
  unint64_t v4 = [v3 count];
  id v5 = [(TLKSelectableGridView *)self buttons];
  unint64_t v6 = [v5 count];

  if (v4 > v6)
  {
    v7 = [(TLKSelectableGridView *)self buttons];
    unint64_t v8 = [v7 count];

    while (1)
    {
      uint64_t v9 = [(TLKSelectableGridView *)self tuples];
      uint64_t v10 = [v9 count];
      unint64_t v11 = [(id)objc_opt_class() maxColumns] + v10;

      if (v8 >= v11) {
        break;
      }
      v12 = [(TLKSelectableGridView *)self buttons];
      v13 = [(TLKSelectableGridView *)self _createButton];
      [v12 addObject:v13];

      ++v8;
    }
  }
  uint64_t v14 = [(TLKView *)self contentView];
  [v14 invalidateIntrinsicContentSize];

  [(TLKSelectableGridView *)self setNeedsLayout];
}

- (void)containerView:(id)a3 willMeasureArrangedSubviewsFittingSize:(CGSize)a4 forReason:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v54 = a3;
  if (!a5 || ([(TLKSelectableGridView *)self lastMeasuredWidth], v9 != width))
  {
    [(TLKSelectableGridView *)self setLastMeasuredWidth:width];
    uint64_t v10 = objc_opt_class();
    unint64_t v11 = [(TLKSelectableGridView *)self tuples];
    unint64_t v12 = objc_msgSend(v10, "idealNumberOfColumnsForTitles:fittingSize:containerView:", v11, v54, width, height);

    if (v12)
    {
      v13 = [(TLKSelectableGridView *)self tuples];
      unint64_t v14 = [v13 count] / v12;
    }
    else
    {
      unint64_t v14 = 0;
    }
    uint64_t v15 = [(TLKSelectableGridView *)self tuples];
    unint64_t v16 = [v15 count] % v12;

    if (v16) {
      unint64_t v17 = v14 + 1;
    }
    else {
      unint64_t v17 = v14;
    }
    if ([v54 numberOfRows])
    {
      uint64_t v18 = [v54 numberOfRows];
      if (v18)
      {
        uint64_t v19 = v18;
        do
        {
          [v54 removeRowAtIndex:0];
          --v19;
        }
        while (v19);
      }
    }
    if (v17)
    {
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      do
      {
        uint64_t v22 = [(TLKSelectableGridView *)self buttons];
        v23 = [(TLKSelectableGridView *)self buttons];
        unint64_t v24 = [v23 count] + v20;

        if (v12 >= v24) {
          unint64_t v25 = v24;
        }
        else {
          unint64_t v25 = v12;
        }
        long long v26 = objc_msgSend(v22, "subarrayWithRange:", v21, v25);
        id v27 = (id)[v54 addRowWithArrangedSubviews:v26];

        v21 += v12;
        v20 -= v12;
        --v17;
      }
      while (v17);
    }
    long long v28 = [(TLKSelectableGridView *)self buttons];
    uint64_t v29 = [v28 count];

    if (v29)
    {
      unint64_t v30 = 0;
      int v31 = 0;
      do
      {
        long long v32 = [(TLKSelectableGridView *)self buttons];
        v33 = [v32 objectAtIndexedSubscript:v30];

        v34 = [(TLKSelectableGridView *)self tuples];
        unint64_t v35 = [v34 count];

        if (v30 >= v35)
        {
          [v33 setHidden:1];
        }
        else
        {
          [v33 setHidden:0];
          objc_msgSend(v33, "setCustomHighlight:", v30 == -[TLKSelectableGridView selectedIndex](self, "selectedIndex"));
          v36 = [(TLKSelectableGridView *)self tuples];
          v37 = [v36 objectAtIndexedSubscript:v30];
          v38 = [v37 subtitle];

          v39 = [(TLKSelectableGridView *)self tuples];
          v40 = [v39 objectAtIndexedSubscript:v30];
          v41 = [v40 title];
          [v33 setTitle:v41 subtitle:v38];

          v31 |= [v38 length] != 0;
        }

        ++v30;
        v42 = [(TLKSelectableGridView *)self buttons];
        unint64_t v43 = [v42 count];
      }
      while (v30 < v43);
    }
    else
    {
      int v31 = 0;
    }
    v44 = [(TLKSelectableGridView *)self buttons];
    uint64_t v45 = [v44 count];

    if (v45)
    {
      unint64_t v46 = 0;
      do
      {
        v47 = [(TLKSelectableGridView *)self buttons];
        v48 = [v47 objectAtIndexedSubscript:v46];

        v49 = [(TLKSelectableGridView *)self tuples];
        unint64_t v50 = [v49 count];

        if (v46 < v50)
        {
          v51 = [v48 bottomLabel];
          [v51 setHidden:(v31 ^ 1) & 1];
        }
        ++v46;
        v52 = [(TLKSelectableGridView *)self buttons];
        unint64_t v53 = [v52 count];
      }
      while (v46 < v53);
    }
  }
}

+ (unint64_t)maxColumns
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v2 userInterfaceIdiom] == 1) {
    unint64_t v3 = 6;
  }
  else {
    unint64_t v3 = 4;
  }

  return v3;
}

+ (unint64_t)idealNumberOfColumnsForTitles:(id)a3 fittingSize:(CGSize)a4 containerView:(id)a5
{
  CGFloat height = a4.height;
  double width = a4.width;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INTERACTIVE, 0);
  size_t v11 = [v8 count];
  unint64_t v12 = dispatch_queue_create("concurrent", v10);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__TLKSelectableGridView_idealNumberOfColumnsForTitles_fittingSize_containerView___block_invoke;
  block[3] = &unk_1E5FD3300;
  id v13 = v8;
  id v33 = v13;
  double v34 = width;
  CGFloat v35 = height;
  dispatch_apply(v11, v12, block);

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    double v18 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "size", (void)v28);
        if (v18 < v20) {
          double v18 = v20;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v16);
    double v21 = v18 + 10.0;
  }
  else
  {
    double v21 = 10.0;
  }

  [v9 layoutMargins];
  double v23 = width + v22 * -2.0;
  [v9 columnSpacing];
  double v25 = floor(v23 / (v21 + v24));
  unint64_t v26 = [(id)objc_opt_class() maxColumns];
  if (v25 >= (double)v26) {
    double v25 = (double)v26;
  }

  return (unint64_t)v25;
}

void __81__TLKSelectableGridView_idealNumberOfColumnsForTitles_fittingSize_containerView___block_invoke(uint64_t a1, uint64_t a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  id v5 = [v4 title];
  uint64_t v24 = *MEMORY[0x1E4FB12B0];
  uint64_t v6 = v24;
  v7 = +[TLKFontUtilities subheadFont];
  v25[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
  objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v10 = v9;
  size_t v11 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  [v11 setSize:v10];

  unint64_t v12 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  [v12 size];
  double v14 = v13;

  uint64_t v15 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v16 = [v15 subtitle];
  uint64_t v22 = v6;
  uint64_t v17 = +[TLKFontUtilities footnoteFont];
  double v23 = v17;
  double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  objc_msgSend(v16, "boundingRectWithSize:options:attributes:context:", 1, v18, 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v20 = v19;

  if (v14 < v20) {
    double v14 = v20;
  }
  double v21 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  [v21 setSize:v14];
}

- (id)_createButton
{
  unint64_t v3 = +[TLKSelectableGridButton selectableGridButton];
  [v3 addTarget:self action:sel_selectableGridButtonPressed_ forControlEvents:64];
  return v3;
}

- (void)setSelectedIndex:(int64_t)a3
{
  if (self->_selectedIndex != a3)
  {
    self->_selectedIndex = a3;
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      id v6 = objc_loadWeakRetained((id *)p_delegate);
      [v6 selectableGridView:self didChangeSelectedIndex:self->_selectedIndex];
    }
    id v7 = [(TLKView *)self observer];
    [v7 propertiesDidChange];
  }
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)selectableGridButtonPressed:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TLKView *)self contentView];
  uint64_t v6 = [v5 numberOfRows];

  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      id v8 = [(TLKView *)self contentView];
      double v9 = [v8 rowAtIndex:i];
      double v10 = [v9 arrangedSubviews];

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = 0;
        uint64_t v15 = *(void *)v21;
        while (2)
        {
          uint64_t v16 = 0;
          uint64_t v17 = v14 + v13;
          do
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v11);
            }
            if ([*(id *)(*((void *)&v20 + 1) + 8 * v16) isEqual:v4])
            {
              double v18 = [(TLKView *)self contentView];
              uint64_t v19 = v14 + [v18 numberOfColumns] * i + v16;

              [(TLKSelectableGridView *)self setSelectedIndex:v19];
              goto LABEL_14;
            }
            ++v16;
          }
          while (v13 != v16);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
          uint64_t v14 = v17;
          if (v13) {
            continue;
          }
          break;
        }
      }
    }
  }
LABEL_14:
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  objc_msgSend(a5, "systemLayoutSizeFittingSize:", a3, a4.width, a4.height);
  if (v5 < 58.0) {
    double v5 = 58.0;
  }
  result.CGFloat height = v6;
  result.double width = v5;
  return result;
}

- (id)arrangedEntrySubviews
{
  v2 = [(TLKView *)self contentView];
  unint64_t v3 = [v2 arrangedSubviews];

  return v3;
}

- (NSArray)tuples
{
  return self->_tuples;
}

- (TLKSelectableGridViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TLKSelectableGridViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (double)lastMeasuredWidth
{
  return self->_lastMeasuredWidth;
}

- (void)setLastMeasuredWidth:(double)a3
{
  self->_lastMeasuredWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tuples, 0);
}

@end
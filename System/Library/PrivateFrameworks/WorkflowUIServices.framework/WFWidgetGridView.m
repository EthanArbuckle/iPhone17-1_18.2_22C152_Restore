@interface WFWidgetGridView
- (BOOL)cellExistsAtIndex:(unint64_t)a3;
- (BOOL)maybeNeedsLayoutWithActions:(id)a3;
- (CGSize)lastKnownSize;
- (NSArray)actions;
- (NSString)lastKnownContentSizeCategory;
- (OS_os_log)log;
- (WFColor)homeScreenTintColor;
- (WFWidgetGridView)initWithFamily:(int64_t)a3 widgetType:(int64_t)a4 cornerRadius:(double)a5 log:(id)a6;
- (WFWidgetGridViewDelegate)delegate;
- (double)cornerRadius;
- (id)actionsForVisibleCells;
- (id)cellAtIndex:(unint64_t)a3;
- (id)cellForSystemAction:(id)a3;
- (int64_t)family;
- (int64_t)widgetType;
- (void)disableAllCellsExceptCell:(id)a3;
- (void)enableAllCells;
- (void)layoutWithActions:(id)a3 dataSource:(id)a4;
- (void)setActions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHomeScreenTintColor:(id)a3;
- (void)setLastKnownContentSizeCategory:(id)a3;
- (void)setLastKnownSize:(CGSize)a3;
- (void)tintWithHomeScreenTintColor:(id)a3;
- (void)widgetCellDidTransitionToState:(int64_t)a3;
- (void)widgetCellWasTapped:(id)a3;
@end

@implementation WFWidgetGridView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_homeScreenTintColor, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setLastKnownContentSizeCategory:(id)a3
{
}

- (NSString)lastKnownContentSizeCategory
{
  return self->_lastKnownContentSizeCategory;
}

- (OS_os_log)log
{
  return self->_log;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)widgetType
{
  return self->_widgetType;
}

- (int64_t)family
{
  return self->_family;
}

- (void)setLastKnownSize:(CGSize)a3
{
  self->_lastKnownSize = a3;
}

- (CGSize)lastKnownSize
{
  double width = self->_lastKnownSize.width;
  double height = self->_lastKnownSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setHomeScreenTintColor:(id)a3
{
}

- (WFColor)homeScreenTintColor
{
  return self->_homeScreenTintColor;
}

- (void)setActions:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setDelegate:(id)a3
{
}

- (WFWidgetGridViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFWidgetGridViewDelegate *)WeakRetained;
}

- (void)widgetCellDidTransitionToState:(int64_t)a3
{
  if (a3 == 3 || !a3) {
    [(WFWidgetGridView *)self enableAllCells];
  }
  id v5 = [(WFWidgetGridView *)self delegate];
  [v5 gridView:self cellDidTransitionToRunningState:a3];
}

- (void)widgetCellWasTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWidgetGridView *)self delegate];
  [v5 gridView:self didTapCell:v4];
}

- (id)cellAtIndex:(unint64_t)a3
{
  if (-[WFWidgetGridView cellExistsAtIndex:](self, "cellExistsAtIndex:"))
  {
    id v5 = [(WFWidgetGridView *)self subviews];
    v6 = [v5 objectAtIndex:a3];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)cellExistsAtIndex:(unint64_t)a3
{
  id v5 = [(WFWidgetGridView *)self subviews];
  if ([v5 count])
  {
    v6 = [(WFWidgetGridView *)self subviews];
    BOOL v7 = [v6 count] - 1 >= a3;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)layoutWithActions:(id)a3 dataSource:(id)a4
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v72 = a4;
  BOOL v7 = [MEMORY[0x263F82438] sharedApplication];
  v8 = [v7 preferredContentSizeCategory];

  [(WFWidgetGridView *)self lastKnownSize];
  BOOL v11 = v10 == *(double *)(MEMORY[0x263F001B0] + 8) && v9 == *MEMORY[0x263F001B0];
  [(WFWidgetGridView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  [(WFWidgetGridView *)self lastKnownSize];
  BOOL v18 = v15 == v17 && v13 == v16;
  v19 = [(WFWidgetGridView *)self actions];
  v69 = v6;
  if (![v6 isEqualToArray:v19] || !v18) {
    goto LABEL_19;
  }
  id v20 = [(WFWidgetGridView *)self lastKnownContentSizeCategory];
  id v21 = v8;
  v22 = v21;
  if (v20 == v21)
  {

    goto LABEL_15;
  }
  if (v21 && v20)
  {
    char v23 = [v20 isEqualToString:v21];

    if ((v23 & 1) == 0) {
      goto LABEL_18;
    }
LABEL_15:
    BOOL v24 = [(WFWidgetGridView *)self maybeNeedsLayoutWithActions:v69];

    if (!v24) {
      goto LABEL_71;
    }
    goto LABEL_20;
  }

LABEL_18:
LABEL_19:

LABEL_20:
  [(WFWidgetGridView *)self setActions:v69];
  uint64_t v71 = [v69 count];
  [(WFWidgetGridView *)self bounds];
  double v26 = v25;
  double size = v27;
  -[WFWidgetGridView setLastKnownSize:](self, "setLastKnownSize:", v27, v25);
  [(WFWidgetGridView *)self setLastKnownContentSizeCategory:v8];
  v28 = [(WFWidgetGridView *)self log];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    MEMORY[0x21D44DCA0]([(WFWidgetGridView *)self family]);
    v29 = (WFWidgetGridView *)objc_claimAutoreleasedReturnValue();
    v88.double width = size;
    v88.double height = v26;
    v30 = NSStringFromCGSize(v88);
    *(_DWORD *)buf = 138543874;
    v80 = v29;
    __int16 v81 = 2114;
    double v82 = *(double *)&v30;
    __int16 v83 = 2048;
    double v84 = *(double *)&v71;
    _os_log_impl(&dword_2177E0000, v28, OS_LOG_TYPE_DEFAULT, "Starting a %{public}@ layout in bounds: %{public}@, item count: %lu", buf, 0x20u);
  }
  v65 = v8;
  if ([(WFWidgetGridView *)self widgetType] == 2)
  {
    int64_t v31 = [(WFWidgetGridView *)self family];
    uint64_t v32 = v31;
    switch(v31)
    {
      case 1:
        char v33 = 0;
        int v67 = 1;
        double v34 = 8.0;
        uint64_t v35 = 2;
        break;
      case 2:
      case 4:
        int v67 = 0;
        char v33 = 1;
        double v34 = 8.0;
        uint64_t v35 = v31;
        break;
      case 3:
        int v67 = 0;
        char v33 = 1;
        double v34 = 8.0;
        uint64_t v32 = 2;
        uint64_t v35 = 4;
        break;
      default:
        char v33 = 0;
        uint64_t v35 = 1;
        double v34 = 0.0;
        goto LABEL_28;
    }
  }
  else
  {
    double v34 = 0.0;
    if ([(WFWidgetGridView *)self widgetType] == 1) {
      [(WFWidgetGridView *)self family];
    }
    char v33 = 0;
    uint64_t v35 = 1;
LABEL_28:
    int v67 = 1;
    uint64_t v32 = 1;
  }
  double v36 = (size - v34 * (double)(v32 + 1)) / (double)v32;
  double v37 = (v26 - v34) / (double)v35;
  v38 = [(WFWidgetGridView *)self traitCollection];
  uint64_t v39 = [v38 layoutDirection];

  uint64_t v70 = v39;
  if (v39 == 1) {
    double v40 = v36 + v34 * 2.0;
  }
  else {
    double v40 = v34;
  }
  if ([(WFWidgetGridView *)self family] == 1) {
    double v40 = v34;
  }
  v41 = [(WFWidgetGridView *)self log];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219264;
    v80 = (WFWidgetGridView *)v35;
    __int16 v81 = 2048;
    double v82 = *(double *)&v32;
    __int16 v83 = 2048;
    double v84 = v34;
    __int16 v85 = 1024;
    *(_DWORD *)v86 = v70 == 1;
    *(_WORD *)&v86[4] = 2048;
    *(double *)&v86[6] = v40;
    *(_WORD *)&v86[14] = 2048;
    *(double *)&v86[16] = v34;
    _os_log_impl(&dword_2177E0000, v41, OS_LOG_TYPE_DEFAULT, "Grid will layout with %li rows, %li columns, %f padding, isRTL: %i. Starting at %f, %f", buf, 0x3Au);
  }
  double v42 = v37 - v34;

  v43 = [(WFWidgetGridView *)self log];
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = (objc_class *)objc_opt_class();
    v45 = NSStringFromClass(v44);
    v46 = [(WFWidgetGridView *)self homeScreenTintColor];
    *(_DWORD *)buf = 134218498;
    v80 = self;
    __int16 v81 = 2112;
    double v82 = *(double *)&v45;
    __int16 v83 = 2112;
    double v84 = *(double *)&v46;
    _os_log_impl(&dword_2177E0000, v43, OS_LOG_TYPE_DEFAULT, "<%p %@> Configuring cells with home screen tint color %@", buf, 0x20u);
  }
  BOOL v47 = v11 || v18;
  uint64_t v48 = v32 * v35;

  v49 = 0;
  double v50 = v34 + v42;
  char v66 = v33 ^ 1;
  double v51 = v34;
  do
  {
    v52 = [(WFWidgetGridView *)self cellAtIndex:v49];
    if (!v52)
    {
      v52 = objc_alloc_init(WFWidgetCell);
      [(WFWidgetCell *)v52 setDelegate:self];
    }
    if ((uint64_t)v49 >= v71)
    {
      v53 = 0;
    }
    else
    {
      v53 = [v69 objectAtIndex:v49];
    }
    [(WFWidgetGridView *)self cornerRadius];
    double v55 = v54 - v34;
    int64_t v56 = [(WFWidgetGridView *)self widgetType];
    int64_t v57 = [(WFWidgetGridView *)self family];
    v58 = [(WFWidgetGridView *)self homeScreenTintColor];
    [(WFWidgetCell *)v52 configureWithAction:v53 dataSource:v72 cornerRadius:v56 widgetType:v57 family:v58 homeScreenTintColor:v55];

    if (v49)
    {
      if (v70 == 1)
      {
        if (v67)
        {
          double v51 = v50 + v51;
          double v40 = v34;
        }
        else
        {
          BOOL v60 = v40 - v36 - v34 == v34;
          if (v40 - v36 - v34 == v34) {
            double v40 = v34;
          }
          else {
            double v40 = v36 + v34 * 2.0;
          }
          if (!v60) {
            double v51 = v50 + v51;
          }
        }
      }
      else
      {
        if (v34 + v36 + v40 >= size) {
          char v59 = 1;
        }
        else {
          char v59 = v66;
        }
        if (v59) {
          double v40 = v34;
        }
        else {
          double v40 = v34 + v36 + v40;
        }
        if (v59) {
          double v51 = v50 + v51;
        }
      }
    }
    if (![(WFWidgetGridView *)self cellExistsAtIndex:v49]) {
      [(WFWidgetGridView *)self addSubview:v52];
    }
    v61 = [(WFWidgetGridView *)self log];
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v62 = [(WFWidgetCell *)v52 enabled];
      *(_DWORD *)buf = 134219264;
      v80 = v49;
      __int16 v81 = 2048;
      double v82 = v40;
      __int16 v83 = 2048;
      double v84 = v51;
      __int16 v85 = 2048;
      *(double *)v86 = v36;
      *(_WORD *)&v86[8] = 2048;
      *(double *)&v86[10] = v42;
      *(_WORD *)&v86[18] = 1024;
      *(_DWORD *)&v86[20] = v62;
      _os_log_impl(&dword_2177E0000, v61, OS_LOG_TYPE_DEFAULT, "Placing cell %li at {%f, %f}, w: %f, h: %f, cell enabled: %i", buf, 0x3Au);
    }

    if (v47)
    {
      -[WFWidgetCell setFrame:](v52, "setFrame:", v40, v51, v36, v42);
    }
    else
    {
      v63 = (void *)MEMORY[0x263F82E00];
      v73[0] = MEMORY[0x263EF8330];
      v73[1] = 3221225472;
      v73[2] = __49__WFWidgetGridView_layoutWithActions_dataSource___block_invoke;
      v73[3] = &unk_2642A5AB0;
      v74 = v52;
      double v75 = v40;
      double v76 = v51;
      double v77 = v36;
      double v78 = v42;
      [v63 animateWithDuration:v73 animations:0.3];
    }
    v49 = (WFWidgetGridView *)((char *)v49 + 1);
  }
  while ((WFWidgetGridView *)v48 != v49);
  v64 = [(WFWidgetGridView *)self delegate];
  [v64 gridViewDidFinishLayout:self];

  v8 = v65;
LABEL_71:
}

uint64_t __49__WFWidgetGridView_layoutWithActions_dataSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)maybeNeedsLayoutWithActions:(id)a3
{
  v3 = objc_msgSend(a3, "if_objectsPassingTest:", &__block_literal_global_49);
  BOOL v4 = [v3 count] != 0;

  return v4;
}

uint64_t __48__WFWidgetGridView_maybeNeedsLayoutWithActions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)actionsForVisibleCells
{
  id v2 = [(WFWidgetGridView *)self subviews];
  v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_1534);

  return v3;
}

id __42__WFWidgetGridView_actionsForVisibleCells__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v3 = v2;
    }
    else {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  id v4 = v3;
  id v5 = [v4 action];

  return v5;
}

- (id)cellForSystemAction:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(WFWidgetGridView *)self subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(id *)(*((void *)&v16 + 1) + 8 * v9);
      if (v10)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [v10 action];
          id v12 = v4;
          double v13 = v12;
          if (v11 == v12)
          {

            goto LABEL_21;
          }
          if (v4 && v11)
          {
            char v14 = [v11 isEqual:v12];

            if (v14) {
              goto LABEL_21;
            }
            goto LABEL_17;
          }
        }
        else
        {
          id v11 = v10;
          id v10 = 0;
        }
      }
      else
      {
        id v11 = 0;
      }

LABEL_17:
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  id v10 = 0;
LABEL_21:

  return v10;
}

- (void)tintWithHomeScreenTintColor:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(WFWidgetGridView *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 134218498;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    char v23 = v8;
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_impl(&dword_2177E0000, v6, OS_LOG_TYPE_DEFAULT, "<%p %@> Received home screen tint color %@", buf, 0x20u);
  }
  objc_storeStrong((id *)&self->_homeScreenTintColor, a3);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [(WFWidgetGridView *)self subviews];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v15 + 1) + 8 * v13);
        if (v14)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v14 setHomeScreenTintColor:v5];
          }
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)enableAllCells
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(WFWidgetGridView *)self subviews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v8 = [v7 action];

        if (v8) {
          [v7 setEnabled:1];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)disableAllCellsExceptCell:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [(WFWidgetGridView *)self subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v11 = [v10 action];
        long long v12 = [v4 action];
        id v13 = v11;
        id v14 = v12;
        if (v13 == v14)
        {

          continue;
        }
        long long v15 = v14;
        if (v13) {
          BOOL v16 = v14 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (v16)
        {

LABEL_15:
          [v10 setEnabled:0];
          continue;
        }
        char v17 = [v13 isEqual:v14];

        if ((v17 & 1) == 0) {
          goto LABEL_15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
}

- (WFWidgetGridView)initWithFamily:(int64_t)a3 widgetType:(int64_t)a4 cornerRadius:(double)a5 log:(id)a6
{
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)WFWidgetGridView;
  long long v12 = [(WFWidgetGridView *)&v16 init];
  id v13 = v12;
  if (v12)
  {
    v12->_family = a3;
    v12->_widgetType = a4;
    v12->_cornerRadius = a5;
    objc_storeStrong((id *)&v12->_log, a6);
    id v14 = v13;
  }

  return v13;
}

@end
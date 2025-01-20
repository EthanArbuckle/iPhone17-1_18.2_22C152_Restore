@interface TTRIDividedGridViewController
+ (id)dividerColor;
- (CGSize)intrinsicContentSize;
- (NSArray)allCells;
- (NSArray)buttonAccessibilityLabels;
- (NSArray)buttonTitles;
- (NSArray)weekViews;
- (TTRIDividedGridViewController)initWithType:(int64_t)a3 buttonTitles:(id)a4 buttonAccessibilityLabels:(id)a5 cellBackgroundColor:(id)a6;
- (TTRIDividedGridViewController)initWithType:(int64_t)a3 buttonTitles:(id)a4 cellBackgroundColor:(id)a5;
- (TTRIDividedGridViewControllerDelegate)delegate;
- (double)_defaultButtonWidthForButtonAtIndex:(int64_t)a3;
- (double)_neededHeight;
- (double)_rowHeightForWidth:(double)a3;
- (double)preferredWidth;
- (id)_newDividerView;
- (void)cellTapped:(id)a3;
- (void)loadView;
- (void)setAllCells:(id)a3;
- (void)setButtonTitles:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreferredWidth:(double)a3;
- (void)setWeekViews:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillLayoutSubviews;
@end

@implementation TTRIDividedGridViewController

+ (id)dividerColor
{
  if (dividerColor_onceToken != -1) {
    dispatch_once(&dividerColor_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)dividerColor___dividerColor;

  return v2;
}

void __45__TTRIDividedGridViewController_dividerColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] separatorColor];
  v1 = (void *)dividerColor___dividerColor;
  dividerColor___dividerColor = v0;
}

- (TTRIDividedGridViewController)initWithType:(int64_t)a3 buttonTitles:(id)a4 cellBackgroundColor:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TTRIDividedGridViewController;
  v11 = [(TTRIDividedGridViewController *)&v14 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_buttonTitles, a4);
    objc_storeStrong((id *)&v12->_cellBackgroundColor, a5);
  }

  return v12;
}

- (TTRIDividedGridViewController)initWithType:(int64_t)a3 buttonTitles:(id)a4 buttonAccessibilityLabels:(id)a5 cellBackgroundColor:(id)a6
{
  id v11 = a5;
  v12 = [(TTRIDividedGridViewController *)self initWithType:a3 buttonTitles:a4 cellBackgroundColor:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_buttonAccessibilityLabels, a5);
  }

  return v13;
}

- (void)loadView
{
  v2 = self;
  v93[1] = *MEMORY[0x1E4F143B8];
  int64_t type = self->_type;
  uint64_t v4 = 7;
  if (type != 1) {
    uint64_t v4 = 0;
  }
  if (type) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 4;
  }
  v78 = objc_opt_new();
  id obj = (id)objc_opt_new();
  v92 = @"dividerWidth";
  v6 = NSNumber;
  v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 scale];
  id v9 = [v6 numberWithDouble:1.0 / v8];
  v93[0] = v9;
  v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:&v92 count:1];

  id v10 = [(TTRIDividedGridViewController *)v2 buttonTitles];
  uint64_t v11 = [v10 count];

  v86 = v2;
  if (v11)
  {
    v79 = 0;
    v12 = 0;
    v13 = 0;
    unint64_t v14 = 0;
    do
    {
      unint64_t v15 = v14 + 1;
      v80 = v12;
      if ((v14 + 1) % v5)
      {
        v16 = [(TTRIDividedGridViewController *)v2 buttonTitles];
        BOOL v83 = v14 == [v16 count] - 1;
      }
      else
      {
        BOOL v83 = 1;
      }
      unint64_t v17 = v14 % v5;
      if (!(v14 % v5))
      {
        uint64_t v18 = objc_opt_new();

        uint64_t v19 = objc_opt_new();
        [obj addObject:v18];
        v79 = (void *)v18;
        v80 = (void *)v19;
      }
      v20 = [TTRIUIDividedGridViewCell alloc];
      v21 = v20;
      if (v2->_cellBackgroundColor)
      {
        v22 = -[TTRIUIDividedGridViewCell initWithBackgroundColor:](v20, "initWithBackgroundColor:");
      }
      else
      {
        v23 = [MEMORY[0x1E4FB1618] tableCellGroupedBackgroundColor];
        v22 = [(TTRIUIDividedGridViewCell *)v21 initWithBackgroundColor:v23];
      }
      [(TTRIUIDividedGridViewCell *)v22 setViewController:v2];
      [(TTRIUIDividedGridViewCell *)v22 setTranslatesAutoresizingMaskIntoConstraints:0];
      v24 = [(TTRIDividedGridViewController *)v2 buttonTitles];
      v25 = [v24 objectAtIndexedSubscript:v14];
      v26 = [(TTRIUIDividedGridViewCell *)v22 label];
      [v26 setText:v25];

      v2 = v86;
      v27 = [(TTRIDividedGridViewController *)v86 buttonAccessibilityLabels];
      if ([v27 count] <= v14) {
        [(TTRIDividedGridViewController *)v86 buttonTitles];
      }
      else {
      v28 = [(TTRIDividedGridViewController *)v86 buttonAccessibilityLabels];
      }
      v29 = [v28 objectAtIndexedSubscript:v14];
      [(TTRIUIDividedGridViewCell *)v22 setAccessibilityLabel:v29];

      [v78 addObject:v22];
      [v79 addSubview:v22];
      v30 = [MEMORY[0x1E4F28DC8] constraintWithItem:v22 attribute:8 relatedBy:0 toItem:v79 attribute:8 multiplier:1.0 constant:0.0];
      [v80 addObject:v30];

      v31 = [MEMORY[0x1E4F28DC8] constraintWithItem:v22 attribute:3 relatedBy:0 toItem:v79 attribute:3 multiplier:1.0 constant:0.0];
      [v80 addObject:v31];

      id v32 = [(TTRIDividedGridViewController *)v86 _newDividerView];
      [v79 addSubview:v32];
      v33 = [MEMORY[0x1E4F28DC8] constraintWithItem:v32 attribute:8 relatedBy:0 toItem:v79 attribute:8 multiplier:1.0 constant:0.0];
      [v80 addObject:v33];

      [(TTRIDividedGridViewController *)v86 _defaultButtonWidthForButtonAtIndex:v17];
      v35 = [MEMORY[0x1E4F28DC8] constraintWithItem:v22 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v34];
      [(TTRIUIDividedGridViewCell *)v22 setWidthConstraint:v35];

      v36 = [(TTRIUIDividedGridViewCell *)v22 widthConstraint];
      [(TTRIUIDividedGridViewCell *)v22 addConstraint:v36];

      v37 = (void *)MEMORY[0x1E4F28DC8];
      if (v17)
      {
        v38 = _NSDictionaryOfVariableBindings(&cfstr_Previousbutton.isa, v13, v32, v22, 0);
        v39 = v37;
        v40 = @"H:[previousButton][dividerView(==dividerWidth)][buttonView]";
      }
      else
      {
        v38 = _NSDictionaryOfVariableBindings(&cfstr_DividerviewBut.isa, v32, v22, 0);
        v39 = v37;
        v40 = @"H:|[dividerView(==dividerWidth)][buttonView]";
      }
      v41 = [v39 constraintsWithVisualFormat:v40 options:1024 metrics:v85 views:v38];
      v12 = v80;
      [v80 addObjectsFromArray:v41];

      if (v83)
      {
        id v42 = [(TTRIDividedGridViewController *)v86 _newDividerView];
        [v79 addSubview:v42];
        v43 = [MEMORY[0x1E4F28DC8] constraintWithItem:v42 attribute:8 relatedBy:0 toItem:v79 attribute:8 multiplier:1.0 constant:0.0];
        [v80 addObject:v43];

        v44 = (void *)MEMORY[0x1E4F28DC8];
        v45 = _NSDictionaryOfVariableBindings(&cfstr_ButtonviewEndo.isa, v22, v42, 0);
        v46 = [v44 constraintsWithVisualFormat:@"H:[buttonView][endOfWeekDivider(==dividerWidth)]|" options:1024 metrics:v85 views:v45];
        [v80 addObjectsFromArray:v46];

        v2 = v86;
      }
      v47 = [v79 buttonViews];
      [v47 addObject:v22];

      [v79 addConstraints:v80];
      v48 = [(TTRIDividedGridViewController *)v2 buttonTitles];
      unint64_t v49 = [v48 count];

      v13 = v22;
      unint64_t v14 = v15;
    }
    while (v15 < v49);
  }
  else
  {
    v79 = 0;
    v80 = 0;
  }
  v50 = objc_opt_new();
  [v50 setViewController:v2];
  v51 = objc_opt_new();
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obja = obj;
  uint64_t v52 = [obja countByEnumeratingWithState:&v87 objects:v91 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    id v54 = 0;
    uint64_t v84 = *(void *)v88;
    do
    {
      uint64_t v55 = 0;
      v56 = v54;
      do
      {
        if (*(void *)v88 != v84) {
          objc_enumerationMutation(obja);
        }
        v57 = *(void **)(*((void *)&v87 + 1) + 8 * v55);
        id v54 = [(TTRIDividedGridViewController *)v86 _newDividerView];
        [v50 addSubview:v54];
        [v57 setTranslatesAutoresizingMaskIntoConstraints:0];
        v58 = [MEMORY[0x1E4F28DC8] constraintWithItem:v57 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:43.5];
        [v57 setHeightConstraint:v58];

        v59 = [v57 heightConstraint];
        [v57 addConstraint:v59];

        [v50 addSubview:v57];
        v60 = (void *)MEMORY[0x1E4F28DC8];
        v61 = _NSDictionaryOfVariableBindings(&cfstr_Weekview.isa, v57, 0);
        v62 = [v60 constraintsWithVisualFormat:@"H:|[weekView]" options:0 metrics:0 views:v61];
        [v51 addObjectsFromArray:v62];

        v63 = (void *)MEMORY[0x1E4F28DC8];
        v64 = _NSDictionaryOfVariableBindings(&cfstr_Bottomdividerv.isa, v54, 0);
        v65 = [v63 constraintsWithVisualFormat:@"H:|[bottomDividerView]" options:0 metrics:0 views:v64];
        [v51 addObjectsFromArray:v65];

        v66 = [MEMORY[0x1E4F28DC8] constraintWithItem:v50 attribute:7 relatedBy:1 toItem:v57 attribute:7 multiplier:1.0 constant:0.0];
        [v51 addObject:v66];

        v67 = [MEMORY[0x1E4F28DC8] constraintWithItem:v54 attribute:7 relatedBy:0 toItem:v57 attribute:7 multiplier:1.0 constant:0.0];
        [v51 addObject:v67];

        v68 = (void *)MEMORY[0x1E4F28DC8];
        v69 = _NSDictionaryOfVariableBindings(&cfstr_Bottomdividerv_0.isa, v54, v57, 0);
        v70 = [v68 constraintsWithVisualFormat:@"V:[weekView][bottomDividerView(==dividerWidth)]" options:0 metrics:v85 views:v69];
        [v51 addObjectsFromArray:v70];

        if (v56)
        {
          v71 = (void *)MEMORY[0x1E4F28DC8];
          v72 = _NSDictionaryOfVariableBindings(&cfstr_PreviousviewWe.isa, v56, v57, 0);
          v73 = [v71 constraintsWithVisualFormat:@"V:[previousView][weekView]" options:0 metrics:0 views:v72];
          [v51 addObjectsFromArray:v73];
        }
        ++v55;
        v56 = v54;
      }
      while (v53 != v55);
      uint64_t v53 = [obja countByEnumeratingWithState:&v87 objects:v91 count:16];
    }
    while (v53);
  }
  else
  {
    id v54 = 0;
  }

  v74 = (void *)MEMORY[0x1E4F28DC8];
  v75 = [obja objectAtIndexedSubscript:0];
  v76 = [v74 constraintWithItem:v50 attribute:3 relatedBy:0 toItem:v75 attribute:3 multiplier:1.0 constant:0.0];
  [v51 addObject:v76];

  v77 = [MEMORY[0x1E4F28DC8] constraintWithItem:v50 attribute:4 relatedBy:0 toItem:v54 attribute:4 multiplier:1.0 constant:0.0];
  [v51 addObject:v77];

  [v50 addConstraints:v51];
  [(TTRIDividedGridViewController *)v86 setView:v50];
  [(TTRIDividedGridViewController *)v86 setAllCells:v78];
  [(TTRIDividedGridViewController *)v86 setWeekViews:obja];
}

- (id)_newDividerView
{
  v2 = objc_opt_new();
  v3 = +[TTRIDividedGridViewController dividerColor];
  [v2 setBackgroundColor:v3];

  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v2;
}

- (double)_defaultButtonWidthForButtonAtIndex:(int64_t)a3
{
  int64_t type = self->_type;
  if (type == 1)
  {
    if (a3) {
      BOOL v5 = a3 == 6;
    }
    else {
      BOOL v5 = 1;
    }
    double result = 45.0;
    double v6 = 46.0;
  }
  else
  {
    if (type) {
      return result;
    }
    double result = 80.0;
    if (a3 == 3) {
      double result = 79.0;
    }
    BOOL v5 = a3 == 0;
    double v6 = 79.5;
  }
  if (v5) {
    return v6;
  }
  return result;
}

- (void)cellTapped:(id)a3
{
  id v4 = a3;
  id v6 = [(TTRIDividedGridViewController *)self delegate];
  BOOL v5 = [(TTRIDividedGridViewController *)self allCells];
  objc_msgSend(v6, "dividedGridViewController:didSelectCell:atIndex:", self, v4, objc_msgSend(v5, "indexOfObject:", v4));
}

- (void)viewWillLayoutSubviews
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  [(TTRIDividedGridViewController *)self preferredWidth];
  double v4 = v3;
  BOOL v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 scale];
  double v7 = 1.0 / v6;

  int64_t type = self->_type;
  if (type == 1)
  {
    double v4 = v4 + v7 * -6.0;
    double v9 = 7.0;
  }
  else if (type)
  {
    double v9 = 0.0;
  }
  else
  {
    double v4 = v4 + v7 * -3.0;
    double v9 = 4.0;
  }
  CalFloorToScreenScale();
  double v11 = v10;
  CalCeilToScreenScale();
  double v13 = v12;
  unint64_t v14 = objc_opt_new();
  if (v9 > 0.0)
  {
    int v15 = 1;
    do
    {
      v16 = [NSNumber numberWithDouble:v11];
      [v14 addObject:v16];

      double v17 = (double)v15++;
    }
    while (v9 > v17);
  }
  uint64_t v18 = [v14 valueForKeyPath:@"@sum.self"];
  [v18 doubleValue];
  double v20 = v19;

  if (v20 < v4)
  {
    char v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = (uint64_t)(v9 + -1.0);
    do
    {
      if (v9 <= (double)v22 || v23 < 1 || v22 >= v23) {
        break;
      }
      v26 = [NSNumber numberWithDouble:v13];
      if (v21)
      {
        [v14 setObject:v26 atIndexedSubscript:v22];

        ++v22;
      }
      else
      {
        [v14 setObject:v26 atIndexedSubscript:v23];

        --v23;
      }
      v21 ^= 1u;
      v27 = [v14 valueForKeyPath:@"@sum.self"];
      [v27 doubleValue];
      double v29 = v28;
    }
    while (v29 < v4);
  }
  [(TTRIDividedGridViewController *)self _rowHeightForWidth:v13];
  double v31 = v30;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v32 = [(TTRIDividedGridViewController *)self weekViews];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v51 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v38 = [v37 buttonViews];
        uint64_t v39 = [v38 count];

        if (v39)
        {
          unint64_t v40 = 0;
          do
          {
            v41 = [v37 buttonViews];
            id v42 = [v41 objectAtIndexedSubscript:v40];

            v43 = [v14 objectAtIndexedSubscript:v40];
            [v43 doubleValue];
            double v45 = v44;
            v46 = [v42 widthConstraint];
            [v46 setConstant:v45];

            ++v40;
            v47 = [v37 buttonViews];
            unint64_t v48 = [v47 count];
          }
          while (v48 > v40);
        }
        unint64_t v49 = [v37 heightConstraint];
        [v49 setConstant:v31];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v50 objects:v54 count:16];
    }
    while (v34);
  }
}

- (void)viewDidLayoutSubviews
{
  id v3 = [(TTRIDividedGridViewController *)self delegate];
  [v3 dividedGridViewControllerDidLayout:self];
}

- (double)_neededHeight
{
  id v3 = [(TTRIDividedGridViewController *)self weekViews];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    double v5 = (double)v4;
    double v6 = [(TTRIDividedGridViewController *)self weekViews];
    double v7 = [v6 objectAtIndexedSubscript:0];
    double v8 = [v7 heightConstraint];
    [v8 constant];
    double v10 = v9;
    double v11 = (double)(v4 + 1);
    double v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v12 scale];
    double v14 = 1.0 / v13 * v11 + v5 * v10;
  }
  else
  {
    [(TTRIDividedGridViewController *)self preferredWidth];
    double v16 = v15;
    double v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 scale];
    double v14 = v16 + 1.0 / v17 * 2.0;
  }

  return v14;
}

- (double)_rowHeightForWidth:(double)a3
{
  MEMORY[0x1F40E0828](self, a2, 43.5);
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(TTRIDividedGridViewController *)self preferredWidth];
  double v4 = v3;
  [(TTRIDividedGridViewController *)self _neededHeight];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)setPreferredWidth:(double)a3
{
  if (self->_preferredWidth != a3)
  {
    self->_preferredWidth = a3;
    double v4 = [(TTRIDividedGridViewController *)self view];
    [v4 setNeedsLayout];

    id v5 = [(TTRIDividedGridViewController *)self view];
    [v5 invalidateIntrinsicContentSize];
  }
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (NSArray)buttonTitles
{
  return self->_buttonTitles;
}

- (void)setButtonTitles:(id)a3
{
}

- (NSArray)buttonAccessibilityLabels
{
  return (NSArray *)objc_getProperty(self, a2, 1008, 1);
}

- (NSArray)allCells
{
  return (NSArray *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setAllCells:(id)a3
{
}

- (TTRIDividedGridViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TTRIDividedGridViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)weekViews
{
  return (NSArray *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setWeekViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weekViews, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allCells, 0);
  objc_storeStrong((id *)&self->_buttonAccessibilityLabels, 0);
  objc_storeStrong((id *)&self->_buttonTitles, 0);

  objc_storeStrong((id *)&self->_cellBackgroundColor, 0);
}

@end
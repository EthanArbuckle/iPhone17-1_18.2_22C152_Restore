@interface PREditingAmbientColorPickerViewController
- (BOOL)needsScrollToSelectedItem;
- (PREditingAmbientColorPickerViewController)initWithColorPickerConfiguration:(id)a3 width:(double)a4 changeHandler:(id)a5;
- (PREditingColorItemView)selectedItemView;
- (PREditorColorPickerConfiguration)colorPickerConfiguration;
- (UIScrollView)scrollView;
- (UIStackView)stackView;
- (id)changeHandler;
- (void)didSelectColorItem:(id)a3;
- (void)didTapColorItemView:(id)a3;
- (void)loadView;
- (void)scrollToSelectedItemAnimated:(BOOL)a3;
- (void)setNeedsScrollToSelectedItem:(BOOL)a3;
- (void)setScrollView:(id)a3;
- (void)setSelectedItemView:(id)a3;
- (void)setStackView:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PREditingAmbientColorPickerViewController

- (PREditingAmbientColorPickerViewController)initWithColorPickerConfiguration:(id)a3 width:(double)a4 changeHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PREditingAmbientColorPickerViewController;
  v11 = [(PREditingAmbientColorPickerViewController *)&v19 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_colorPickerConfiguration, a3);
    uint64_t v13 = [v10 copy];
    id changeHandler = v12->_changeHandler;
    v12->_id changeHandler = (id)v13;

    -[PREditingAmbientColorPickerViewController setPreferredContentSize:](v12, "setPreferredContentSize:", a4, 64.0);
    v15 = [v9 prompt];
    if (v15)
    {
      [(PREditingAmbientColorPickerViewController *)v12 setTitle:v15];
    }
    else
    {
      v16 = PRBundle();
      v17 = [v16 localizedStringForKey:@"EDIT_COLOR_PICKER_DEFAULT_PROMPT" value:&stru_1ED9A3120 table:@"PosterKit"];
      [(PREditingAmbientColorPickerViewController *)v12 setTitle:v17];
    }
  }

  return v12;
}

- (void)loadView
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v46 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1BE0]);
  objc_msgSend(v3, "setContentInset:", 0.0, 20.0, 20.0, 20.0);
  [v3 setShowsVerticalScrollIndicator:0];
  [v3 setShowsHorizontalScrollIndicator:0];
  v45 = v3;
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
  [v4 setAxis:0];
  [v4 setAlignment:1];
  [v4 setSpacing:14.0];
  v5 = v4;
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v50 = self;
  v6 = [(PREditingAmbientColorPickerViewController *)self colorPickerConfiguration];
  v51 = [v6 selectedColor];
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = [v6 context];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v44 = v6;
  v8 = [v6 colorPalette];
  id v9 = [v8 colors];

  id obj = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v53;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v53 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v52 + 1) + 8 * v13);
        v15 = [[PREditorColorPickerConstantColor alloc] initWithColor:v14 initialVariation:0.0];
        v16 = [[PREditingColorItem alloc] initWithPickerColor:v15 variation:v7 context:0.0];
        v17 = [[PREditingColorItemView alloc] initWithColorItem:v16];
        if (v51 && [v14 isEquivalentToColor:v51]) {
          [(PRSelectableEditingItemView *)v17 setSelected:1];
        }
        [v49 addObject:v17];
        v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v50 action:sel_didTapColorItemView_];
        [(PREditingColorItemView *)v17 addGestureRecognizer:v18];
        [v5 addArrangedSubview:v17];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v11);
  }

  [v45 addSubview:v5];
  [v46 addSubview:v45];
  v34 = (void *)MEMORY[0x1E4F28DC8];
  id obja = [v5 leadingAnchor];
  v43 = [v45 leadingAnchor];
  v42 = [obja constraintEqualToAnchor:v43];
  v56[0] = v42;
  v41 = [v5 trailingAnchor];
  v40 = [v45 trailingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v56[1] = v39;
  v38 = [v5 topAnchor];
  v37 = [v45 topAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v56[2] = v36;
  v35 = [v5 bottomAnchor];
  v33 = [v45 bottomAnchor];
  v32 = [v35 constraintEqualToAnchor:v33];
  v56[3] = v32;
  v31 = [v46 leadingAnchor];
  v30 = [v45 leadingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v56[4] = v29;
  v28 = [v46 trailingAnchor];
  v27 = [v45 trailingAnchor];
  objc_super v19 = [v28 constraintEqualToAnchor:v27];
  v56[5] = v19;
  v20 = [v46 topAnchor];
  v21 = [v45 topAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v56[6] = v22;
  v23 = [v46 bottomAnchor];
  v24 = [v45 bottomAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v56[7] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:8];
  [v34 activateConstraints:v26];

  [(PREditingAmbientColorPickerViewController *)v50 setView:v46];
}

- (void)didTapColorItemView:(id)a3
{
  id v6 = [a3 view];
  id v4 = [v6 colorItem];
  [(PREditingAmbientColorPickerViewController *)self didSelectColorItem:v4];
  v5 = [(PREditingAmbientColorPickerViewController *)self selectedItemView];
  [v5 setSelected:0];

  [v6 setSelected:1];
  [(PREditingAmbientColorPickerViewController *)self setSelectedItemView:v6];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PREditingAmbientColorPickerViewController;
  [(PREditingAmbientColorPickerViewController *)&v4 viewWillAppear:a3];
  [(PREditingAmbientColorPickerViewController *)self setNeedsScrollToSelectedItem:1];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PREditingAmbientColorPickerViewController;
  [(PREditingAmbientColorPickerViewController *)&v4 viewDidLayoutSubviews];
  if ([(PREditingAmbientColorPickerViewController *)self needsScrollToSelectedItem])
  {
    id v3 = [(PREditingAmbientColorPickerViewController *)self stackView];
    [v3 layoutIfNeeded];

    [(PREditingAmbientColorPickerViewController *)self scrollToSelectedItemAnimated:0];
    [(PREditingAmbientColorPickerViewController *)self setNeedsScrollToSelectedItem:0];
  }
}

- (void)didSelectColorItem:(id)a3
{
  objc_super v4 = [a3 color];
  id v6 = [v4 color];

  v5 = [(PREditingAmbientColorPickerViewController *)self changeHandler];
  ((void (**)(void, id))v5)[2](v5, v6);
}

- (void)scrollToSelectedItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (double *)MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v18 = [(PREditingAmbientColorPickerViewController *)self selectedItemView];
  uint64_t v7 = [(PREditingAmbientColorPickerViewController *)self scrollView];
  [v7 bounds];
  if (v18)
  {
    double v9 = v8;
    [v18 frame];
    double v11 = v10;
    [v18 bounds];
    double v13 = v11 + (v9 - v12) * -0.5;
    [v7 contentSize];
    double v15 = v14 - (v9 + -20.0);
    if (v15 >= v13) {
      double v15 = v13;
    }
    double v16 = fmax(v15, -20.0);
  }
  else
  {
    double v16 = *v5;
  }
  v17 = [(PREditingAmbientColorPickerViewController *)self scrollView];
  objc_msgSend(v17, "setContentOffset:animated:", v3, v16, v6);
}

- (PREditorColorPickerConfiguration)colorPickerConfiguration
{
  return self->_colorPickerConfiguration;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (PREditingColorItemView)selectedItemView
{
  return self->_selectedItemView;
}

- (void)setSelectedItemView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (BOOL)needsScrollToSelectedItem
{
  return self->_needsScrollToSelectedItem;
}

- (void)setNeedsScrollToSelectedItem:(BOOL)a3
{
  self->_needsScrollToSelectedItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_selectedItemView, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_colorPickerConfiguration, 0);
}

@end
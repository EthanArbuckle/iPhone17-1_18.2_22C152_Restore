@interface PREditingAmbientContentStylePickerViewController
- (BOOL)needsScrollToSelectedItem;
- (NSArray)styleCoordinators;
- (PREditingAmbientContentStylePickerViewController)initWithContentStylePickerConfiguration:(id)a3 width:(double)a4 changeHandler:(id)a5;
- (PREditingAmbientContentStylePickerViewControllerDelegate)delegate;
- (PREditingContentStyleItemView)selectedItemView;
- (PREditorContentStylePickerConfiguration)stylePickerConfiguration;
- (PRPosterContentStyle)selectedContentStyle;
- (UIScrollView)scrollView;
- (UIStackView)stackView;
- (id)changeHandler;
- (void)didSelectStyle:(id)a3;
- (void)didTapContentStyleItemView:(id)a3;
- (void)loadView;
- (void)scrollToSelectedItemAnimated:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setNeedsScrollToSelectedItem:(BOOL)a3;
- (void)setSelectedContentStyle:(id)a3;
- (void)setSelectedItemView:(id)a3;
- (void)setStyleCoordinators:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PREditingAmbientContentStylePickerViewController

- (PREditingAmbientContentStylePickerViewController)initWithContentStylePickerConfiguration:(id)a3 width:(double)a4 changeHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PREditingAmbientContentStylePickerViewController;
  v11 = [(PREditingAmbientContentStylePickerViewController *)&v19 initWithNibName:0 bundle:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_stylePickerConfiguration, a3);
    uint64_t v13 = [v10 copy];
    id changeHandler = v12->_changeHandler;
    v12->_id changeHandler = (id)v13;

    -[PREditingAmbientContentStylePickerViewController setPreferredContentSize:](v12, "setPreferredContentSize:", a4, 84.0);
    v15 = [v9 prompt];
    if (v15)
    {
      [(PREditingAmbientContentStylePickerViewController *)v12 setTitle:v15];
    }
    else
    {
      v16 = PRBundle();
      v17 = [v16 localizedStringForKey:@"EDIT_COLOR_PICKER_DEFAULT_PROMPT" value:&stru_1ED9A3120 table:@"PosterKit"];
      [(PREditingAmbientContentStylePickerViewController *)v12 setTitle:v17];
    }
  }

  return v12;
}

- (void)loadView
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v48 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1BE0]);
  objc_msgSend(v3, "setContentInset:", 20.0, 20.0, 20.0, 20.0);
  [v3 setShowsVerticalScrollIndicator:0];
  [v3 setShowsHorizontalScrollIndicator:0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v47 = v3;
  objc_storeStrong((id *)&self->_scrollView, v3);
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
  [v4 setAxis:0];
  [v4 setAlignment:1];
  [v4 setSpacing:14.0];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = v4;
  objc_storeStrong((id *)&self->_stackView, v4);
  v6 = [(PREditingAmbientContentStylePickerViewController *)self stylePickerConfiguration];
  v7 = [v6 selectedStyle];
  v46 = v6;
  v8 = [v6 stylePalette];
  id v9 = [v8 styles];

  v50 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v52;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v52 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v51 + 1) + 8 * v13);
        v15 = [(PREditingAmbientContentStylePickerViewController *)self delegate];
        v16 = [v15 coordinatorForContentStyle:v14 forAmbientStylePicker:self];

        if (v16
          || (v16 = [[PREditingPosterContentStyleCoordinator alloc] initWithInitialStyle:v14 suggested:0]) != 0)
        {
          [v50 addObject:v16];
          v17 = [[PREditingContentStyleItemView alloc] initWithContentStyleCoordinator:v16];
          if (v7 && [v14 isEqual:v7])
          {
            [(PRSelectableEditingItemView *)v17 setSelected:1];
            objc_storeStrong((id *)&self->_selectedItemView, v17);
          }
          v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_didTapContentStyleItemView_];
          [(PREditingContentStyleItemView *)v17 addGestureRecognizer:v18];
          [v5 addArrangedSubview:v17];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v11);
  }

  [v47 addSubview:v5];
  [v48 addSubview:v47];
  v35 = (void *)MEMORY[0x1E4F28DC8];
  v45 = [v5 leadingAnchor];
  v44 = [v47 leadingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v55[0] = v43;
  v42 = [v5 trailingAnchor];
  v41 = [v47 trailingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v55[1] = v40;
  v25 = v5;
  v39 = [v5 topAnchor];
  v38 = [v47 topAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v55[2] = v37;
  v36 = [v5 bottomAnchor];
  v34 = [v47 bottomAnchor];
  v33 = [v36 constraintEqualToAnchor:v34];
  v55[3] = v33;
  v32 = [v48 leadingAnchor];
  v31 = [v47 leadingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v55[4] = v30;
  v29 = [v48 trailingAnchor];
  v28 = [v47 trailingAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v55[5] = v27;
  v26 = [v48 topAnchor];
  objc_super v19 = [v47 topAnchor];
  v20 = [v26 constraintEqualToAnchor:v19];
  v55[6] = v20;
  v21 = [v48 bottomAnchor];
  v22 = [v47 bottomAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v55[7] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:8];
  [v35 activateConstraints:v24];

  [(PREditingAmbientContentStylePickerViewController *)self setView:v48];
}

- (void)didTapContentStyleItemView:(id)a3
{
  id v7 = [a3 view];
  id v4 = [v7 contentStyleCoordinator];
  v5 = [v4 style];

  [(PREditingAmbientContentStylePickerViewController *)self didSelectStyle:v5];
  v6 = [(PREditingAmbientContentStylePickerViewController *)self selectedItemView];
  [v6 setSelected:0];

  [v7 setSelected:1];
  [(PREditingAmbientContentStylePickerViewController *)self setSelectedItemView:v7];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PREditingAmbientContentStylePickerViewController;
  [(PREditingAmbientContentStylePickerViewController *)&v4 viewWillAppear:a3];
  [(PREditingAmbientContentStylePickerViewController *)self setNeedsScrollToSelectedItem:1];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PREditingAmbientContentStylePickerViewController;
  [(PREditingAmbientContentStylePickerViewController *)&v4 viewDidLayoutSubviews];
  if ([(PREditingAmbientContentStylePickerViewController *)self needsScrollToSelectedItem])
  {
    id v3 = [(PREditingAmbientContentStylePickerViewController *)self stackView];
    [v3 layoutIfNeeded];

    [(PREditingAmbientContentStylePickerViewController *)self scrollToSelectedItemAnimated:0];
    [(PREditingAmbientContentStylePickerViewController *)self setNeedsScrollToSelectedItem:0];
  }
}

- (void)didSelectStyle:(id)a3
{
  id v4 = a3;
  v5 = [(PREditingAmbientContentStylePickerViewController *)self changeHandler];
  v5[2](v5, v4);
}

- (void)scrollToSelectedItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (double *)MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v18 = [(PREditingAmbientContentStylePickerViewController *)self selectedItemView];
  id v7 = [(PREditingAmbientContentStylePickerViewController *)self scrollView];
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
  v17 = [(PREditingAmbientContentStylePickerViewController *)self scrollView];
  objc_msgSend(v17, "setContentOffset:animated:", v3, v16, v6);
}

- (PREditingAmbientContentStylePickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PREditingAmbientContentStylePickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PREditorContentStylePickerConfiguration)stylePickerConfiguration
{
  return self->_stylePickerConfiguration;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (NSArray)styleCoordinators
{
  return self->_styleCoordinators;
}

- (void)setStyleCoordinators:(id)a3
{
}

- (PREditingContentStyleItemView)selectedItemView
{
  return self->_selectedItemView;
}

- (void)setSelectedItemView:(id)a3
{
}

- (PRPosterContentStyle)selectedContentStyle
{
  return self->_selectedContentStyle;
}

- (void)setSelectedContentStyle:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (UIStackView)stackView
{
  return self->_stackView;
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
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_selectedContentStyle, 0);
  objc_storeStrong((id *)&self->_selectedItemView, 0);
  objc_storeStrong((id *)&self->_styleCoordinators, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_stylePickerConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
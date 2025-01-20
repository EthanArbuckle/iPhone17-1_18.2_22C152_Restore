@interface WFTriggerOptionSelectionViewContainer
- (BOOL)leftViewSelected;
- (BOOL)rightViewSelected;
- (UIImpactFeedbackGenerator)feedbackGenerator;
- (UIStackView)stackView;
- (WFTriggerOptionSelectionView)leftView;
- (WFTriggerOptionSelectionView)rightView;
- (WFTriggerOptionSelectionViewContainer)init;
- (WFTriggerOptionSelectionViewContainerDelegate)delegate;
- (void)handleMultiSelectViewPressWithRecognizer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLeftOptionImage:(id)a3 selectedImage:(id)a4 label:(id)a5 selected:(BOOL)a6 tintColor:(id)a7;
- (void)setLeftViewSelected:(BOOL)a3;
- (void)setRightOptionImage:(id)a3 selectedImage:(id)a4 label:(id)a5 selected:(BOOL)a6 tintColor:(id)a7;
- (void)setRightViewSelected:(BOOL)a3;
- (void)setSelectedImageTintColor:(id)a3;
@end

@implementation WFTriggerOptionSelectionViewContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_rightView, 0);
  objc_storeStrong((id *)&self->_leftView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (WFTriggerOptionSelectionView)rightView
{
  return self->_rightView;
}

- (WFTriggerOptionSelectionView)leftView
{
  return self->_leftView;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setDelegate:(id)a3
{
}

- (WFTriggerOptionSelectionViewContainerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFTriggerOptionSelectionViewContainerDelegate *)WeakRetained;
}

- (void)setRightOptionImage:(id)a3 selectedImage:(id)a4 label:(id)a5 selected:(BOOL)a6 tintColor:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(WFTriggerOptionSelectionViewContainer *)self rightView];
  [v16 setDefaultImage:v15];

  v17 = [(WFTriggerOptionSelectionViewContainer *)self rightView];
  [v17 setSelectedImage:v14];

  v18 = [(WFTriggerOptionSelectionViewContainer *)self rightView];
  [v18 setDefaultImageTintColor:v12];

  v19 = [(WFTriggerOptionSelectionViewContainer *)self rightView];
  v20 = [v19 label];
  [v20 setText:v13];

  v21 = [(WFTriggerOptionSelectionViewContainer *)self rightView];
  [v21 setSelected:v7];

  [(WFTriggerOptionSelectionViewContainer *)self setNeedsUpdateConstraints];
}

- (void)setLeftOptionImage:(id)a3 selectedImage:(id)a4 label:(id)a5 selected:(BOOL)a6 tintColor:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(WFTriggerOptionSelectionViewContainer *)self leftView];
  [v16 setDefaultImage:v15];

  v17 = [(WFTriggerOptionSelectionViewContainer *)self leftView];
  [v17 setSelectedImage:v14];

  v18 = [(WFTriggerOptionSelectionViewContainer *)self leftView];
  [v18 setDefaultImageTintColor:v12];

  v19 = [(WFTriggerOptionSelectionViewContainer *)self leftView];
  v20 = [v19 label];
  [v20 setText:v13];

  v21 = [(WFTriggerOptionSelectionViewContainer *)self leftView];
  [v21 setSelected:v7];

  [(WFTriggerOptionSelectionViewContainer *)self setNeedsUpdateConstraints];
}

- (void)setSelectedImageTintColor:(id)a3
{
  id v4 = a3;
  v5 = [(WFTriggerOptionSelectionViewContainer *)self leftView];
  [v5 setSelectedStateImageTintColor:v4];

  id v6 = [(WFTriggerOptionSelectionViewContainer *)self rightView];
  [v6 setSelectedStateImageTintColor:v4];
}

- (void)setRightViewSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WFTriggerOptionSelectionViewContainer *)self rightView];
  [v4 setSelected:v3];
}

- (BOOL)rightViewSelected
{
  v2 = [(WFTriggerOptionSelectionViewContainer *)self rightView];
  char v3 = [v2 selected];

  return v3;
}

- (void)setLeftViewSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WFTriggerOptionSelectionViewContainer *)self leftView];
  [v4 setSelected:v3];
}

- (BOOL)leftViewSelected
{
  v2 = [(WFTriggerOptionSelectionViewContainer *)self leftView];
  char v3 = [v2 selected];

  return v3;
}

- (void)handleMultiSelectViewPressWithRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  if (v5 == 1)
  {
    id v6 = [(WFTriggerOptionSelectionViewContainer *)self feedbackGenerator];
    [v6 prepare];
  }
  id v17 = [v4 view];
  [v4 locationInView:v17];
  double v8 = v7;
  double v10 = v9;

  unsigned int v11 = objc_msgSend(v17, "pointInside:withEvent:", 0, v8, v10);
  unsigned int v12 = v11;
  if ((unint64_t)(v5 - 1) < 2) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = 0;
  }
  [v17 setHighlighted:v13];
  if (v5 == 3 && v12)
  {
    [(UIImpactFeedbackGenerator *)self->_feedbackGenerator impactOccurred];
    id v14 = [(WFTriggerOptionSelectionViewContainer *)self leftView];

    id v15 = [(WFTriggerOptionSelectionViewContainer *)self delegate];
    if (v17 == v14)
    {
      objc_msgSend(v15, "view:didSelectOptionWithLeftViewCurrentlySelected:", self, -[WFTriggerOptionSelectionViewContainer leftViewSelected](self, "leftViewSelected"));
    }
    else
    {
      v16 = [(WFTriggerOptionSelectionViewContainer *)self rightView];
      objc_msgSend(v15, "view:didSelectOptionWithRightViewCurrentlySelected:", self, objc_msgSend(v16, "selected"));
    }
  }
}

- (WFTriggerOptionSelectionViewContainer)init
{
  v40[4] = *MEMORY[0x263EF8340];
  v38.receiver = self;
  v38.super_class = (Class)WFTriggerOptionSelectionViewContainer;
  v2 = [(WFTriggerOptionSelectionViewContainer *)&v38 init];
  if (v2)
  {
    char v3 = (UIStackView *)objc_alloc_init(MEMORY[0x263F82BF8]);
    stackView = v2->_stackView;
    v2->_stackView = v3;

    [(UIStackView *)v2->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v2->_stackView setDistribution:1];
    [(UIStackView *)v2->_stackView setAxis:0];
    uint64_t v5 = objc_alloc_init(WFTriggerOptionSelectionView);
    leftView = v2->_leftView;
    v2->_leftView = v5;

    double v7 = objc_alloc_init(WFTriggerOptionSelectionView);
    rightView = v2->_rightView;
    v2->_rightView = v7;

    [(WFTriggerOptionSelectionViewContainer *)v2 addSubview:v2->_stackView];
    v28 = (void *)MEMORY[0x263F08938];
    v33 = [(UIStackView *)v2->_stackView topAnchor];
    v32 = [(WFTriggerOptionSelectionViewContainer *)v2 topAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v40[0] = v31;
    v30 = [(UIStackView *)v2->_stackView bottomAnchor];
    v29 = [(WFTriggerOptionSelectionViewContainer *)v2 bottomAnchor];
    double v9 = [v30 constraintEqualToAnchor:v29];
    v40[1] = v9;
    double v10 = [(UIStackView *)v2->_stackView leadingAnchor];
    unsigned int v11 = [(WFTriggerOptionSelectionViewContainer *)v2 leadingAnchor];
    unsigned int v12 = [v10 constraintEqualToAnchor:v11];
    v40[2] = v12;
    uint64_t v13 = [(UIStackView *)v2->_stackView trailingAnchor];
    id v14 = [(WFTriggerOptionSelectionViewContainer *)v2 trailingAnchor];
    id v15 = [v13 constraintEqualToAnchor:v14];
    v40[3] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:4];
    [v28 activateConstraints:v16];

    id v17 = [(WFTriggerOptionSelectionViewContainer *)v2 stackView];
    [v17 addArrangedSubview:v2->_leftView];

    v18 = [(WFTriggerOptionSelectionViewContainer *)v2 stackView];
    [v18 addArrangedSubview:v2->_rightView];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v19 = [(UIStackView *)v2->_stackView arrangedSubviews];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v35 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v25 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:v2 action:sel_handleMultiSelectViewPressWithRecognizer_];
          [v25 setMinimumPressDuration:0.0];
          [v25 setCancelPastAllowableMovement:1];
          [v25 setDelegate:v2];
          [v24 addGestureRecognizer:v25];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v21);
    }

    v26 = v2;
  }

  return v2;
}

@end
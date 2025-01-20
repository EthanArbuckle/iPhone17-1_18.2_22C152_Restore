@interface _UIFindNavigatorViewLayout_Mac
- (BOOL)showsReplaceInOptionsMenu;
- (CGSize)preferredContentSize;
- (UISegmentedControl)nextPreviousSegmentedControl;
- (UISegmentedControl)replaceReplaceAllSegmentedControl;
- (UISwitch)replaceToggleSwitch;
- (_UIFindNavigatorViewLayout_Mac)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForLayout;
- (void)setNextPreviousSegmentedControl:(id)a3;
- (void)setReplaceFieldVisible:(BOOL)a3;
- (void)setReplaceReplaceAllSegmentedControl:(id)a3;
- (void)setReplaceToggleSwitch:(id)a3;
@end

@implementation _UIFindNavigatorViewLayout_Mac

- (_UIFindNavigatorViewLayout_Mac)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)_UIFindNavigatorViewLayout_Mac;
  v3 = -[UIView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIStackView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = -[UIStackView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    verticalStackView = v3->_verticalStackView;
    v3->_verticalStackView = (UIStackView *)v9;

    [(UIStackView *)v3->_verticalStackView setSpacing:12.0];
    [(UIStackView *)v3->_verticalStackView setAxis:1];
    [(UIStackView *)v3->_verticalStackView setDistribution:1];
    [(UIView *)v3 addSubview:v3->_verticalStackView];
    v11 = -[UIStackView initWithFrame:]([UIStackView alloc], "initWithFrame:", v5, v6, v7, v8);
    findStackView = v3->_findStackView;
    v3->_findStackView = v11;

    [(UIStackView *)v3->_findStackView setSpacing:12.0];
    [(UIStackView *)v3->_findStackView setAxis:0];
    [(UIStackView *)v3->_findStackView setAlignment:3];
    [(UIStackView *)v3->_verticalStackView addArrangedSubview:v3->_findStackView];
    v13 = -[UIStackView initWithFrame:]([UIStackView alloc], "initWithFrame:", v5, v6, v7, v8);
    replaceStackView = v3->_replaceStackView;
    v3->_replaceStackView = v13;

    [(UIStackView *)v3->_replaceStackView setSpacing:12.0];
    [(UIStackView *)v3->_replaceStackView setAxis:0];
    [(UIStackView *)v3->_verticalStackView addArrangedSubview:v3->_replaceStackView];
    v15 = -[UIStackView initWithFrame:]([UIStackView alloc], "initWithFrame:", v5, v6, v7, v8);
    firstLineControlsStackView = v3->_firstLineControlsStackView;
    v3->_firstLineControlsStackView = v15;

    [(UIStackView *)v3->_firstLineControlsStackView setSpacing:12.0];
    v17 = -[UIStackView initWithFrame:]([UIStackView alloc], "initWithFrame:", v5, v6, v7, v8);
    secondLineControlsStackView = v3->_secondLineControlsStackView;
    v3->_secondLineControlsStackView = v17;

    [(UIStackView *)v3->_secondLineControlsStackView setSpacing:12.0];
    uint64_t v19 = makeSpacerView();
    doneButtonSpacer = v3->_doneButtonSpacer;
    v3->_doneButtonSpacer = (UIView *)v19;
  }
  return v3;
}

- (CGSize)preferredContentSize
{
  v3 = [(_UIFindNavigatorViewLayout *)self searchTextField];
  [v3 intrinsicContentSize];
  double v5 = v4;

  BOOL v6 = [(_UIFindNavigatorViewLayout *)self replaceFieldVisible];
  double v7 = v5 + 12.0;
  if (!v6) {
    double v7 = -0.0;
  }
  double v8 = v5 + v7 + 8.0;
  double v9 = -1.0;
  result.height = v8;
  result.width = v9;
  return result;
}

- (BOOL)showsReplaceInOptionsMenu
{
  return 0;
}

- (void)prepareForLayout
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  findStackView = self->_findStackView;
  double v4 = [(_UIFindNavigatorViewLayout *)self searchTextField];
  [(UIStackView *)findStackView addArrangedSubview:v4];

  [(UIStackView *)self->_findStackView addArrangedSubview:self->_firstLineControlsStackView];
  [(UIView *)self->_doneButtonSpacer setHidden:1];
  firstLineControlsStackView = self->_firstLineControlsStackView;
  BOOL v6 = [(_UIFindNavigatorViewLayout_Mac *)self nextPreviousSegmentedControl];
  [(UIStackView *)firstLineControlsStackView addArrangedSubview:v6];

  double v7 = self->_firstLineControlsStackView;
  double v8 = [(_UIFindNavigatorViewLayout *)self doneButton];
  [(UIStackView *)v7 addArrangedSubview:v8];

  [(UIStackView *)self->_firstLineControlsStackView addArrangedSubview:self->_doneButtonSpacer];
  double v9 = self->_firstLineControlsStackView;
  v10 = [(_UIFindNavigatorViewLayout_Mac *)self replaceToggleSwitch];
  [(UIStackView *)v9 addArrangedSubview:v10];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v11 = [(UIStackView *)self->_firstLineControlsStackView arrangedSubviews];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v11);
        }
        v17 = *(UIView **)(*((void *)&v41 + 1) + 8 * i);
        if (v17 != self->_doneButtonSpacer)
        {
          LODWORD(v13) = 1148846080;
          [(UIView *)v17 setContentHuggingPriority:0 forAxis:v13];
        }
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v14);
  }

  replaceStackView = self->_replaceStackView;
  uint64_t v19 = [(_UIFindNavigatorViewLayout *)self replaceTextField];
  [(UIStackView *)replaceStackView addArrangedSubview:v19];

  [(UIStackView *)self->_replaceStackView addArrangedSubview:self->_secondLineControlsStackView];
  v20 = [(_UIFindNavigatorViewLayout *)self doneButton];
  LODWORD(v21) = 1148846080;
  [v20 setContentCompressionResistancePriority:0 forAxis:v21];

  objc_super v22 = [(_UIFindNavigatorViewLayout_Mac *)self replaceReplaceAllSegmentedControl];
  LODWORD(v23) = 1148846080;
  [v22 setContentCompressionResistancePriority:0 forAxis:v23];

  secondLineControlsStackView = self->_secondLineControlsStackView;
  v25 = [(_UIFindNavigatorViewLayout_Mac *)self replaceReplaceAllSegmentedControl];
  [(UIStackView *)secondLineControlsStackView addArrangedSubview:v25];

  LODWORD(v26) = 1148846080;
  [(UIView *)self->_secondLineControlsStackView setContentHuggingPriority:0 forAxis:v26];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v27 = [(UIStackView *)self->_secondLineControlsStackView arrangedSubviews];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v28)
  {
    uint64_t v30 = v28;
    uint64_t v31 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v38 != v31) {
          objc_enumerationMutation(v27);
        }
        LODWORD(v29) = 1148846080;
        [*(id *)(*((void *)&v37 + 1) + 8 * j) setContentHuggingPriority:0 forAxis:v29];
      }
      uint64_t v30 = [v27 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v30);
  }

  v33 = [(UIView *)self->_secondLineControlsStackView widthAnchor];
  v34 = [(UIView *)self->_firstLineControlsStackView widthAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  lineEqualWidthsConstraint = self->_lineEqualWidthsConstraint;
  self->_lineEqualWidthsConstraint = v35;
}

- (void)setReplaceFieldVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFindNavigatorViewLayout_Mac;
  -[_UIFindNavigatorViewLayout setReplaceFieldVisible:](&v10, sel_setReplaceFieldVisible_);
  [(UIView *)self->_replaceStackView setHidden:v3 ^ 1];
  [(UIView *)self->_doneButtonSpacer setHidden:v3 ^ 1];
  [(NSLayoutConstraint *)self->_lineEqualWidthsConstraint setActive:v3];
  [(UISwitch *)self->_replaceToggleSwitch setOn:v3];
  if (!v3)
  {
    double v7 = [(UIStackView *)self->_firstLineControlsStackView arrangedSubviews];
    uint64_t v8 = [v7 indexOfObject:self->_doneButtonSpacer];

    firstLineControlsStackView = self->_firstLineControlsStackView;
    BOOL v6 = [(_UIFindNavigatorViewLayout *)self doneButton];
    [(UIStackView *)firstLineControlsStackView insertArrangedSubview:v6 atIndex:v8 - 1];
  }
  else
  {
    secondLineControlsStackView = self->_secondLineControlsStackView;
    BOOL v6 = [(_UIFindNavigatorViewLayout *)self doneButton];
    [(UIStackView *)secondLineControlsStackView addArrangedSubview:v6];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFindNavigatorViewLayout_Mac;
  [(UIView *)&v3 layoutSubviews];
  [(UIView *)self bounds];
  -[UIView setFrame:](self->_verticalStackView, "setFrame:");
}

- (UISwitch)replaceToggleSwitch
{
  return self->_replaceToggleSwitch;
}

- (void)setReplaceToggleSwitch:(id)a3
{
}

- (UISegmentedControl)nextPreviousSegmentedControl
{
  return self->_nextPreviousSegmentedControl;
}

- (void)setNextPreviousSegmentedControl:(id)a3
{
}

- (UISegmentedControl)replaceReplaceAllSegmentedControl
{
  return self->_replaceReplaceAllSegmentedControl;
}

- (void)setReplaceReplaceAllSegmentedControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceReplaceAllSegmentedControl, 0);
  objc_storeStrong((id *)&self->_nextPreviousSegmentedControl, 0);
  objc_storeStrong((id *)&self->_replaceToggleSwitch, 0);
  objc_storeStrong((id *)&self->_lineEqualWidthsConstraint, 0);
  objc_storeStrong((id *)&self->_doneButtonSpacer, 0);
  objc_storeStrong((id *)&self->_secondLineControlsStackView, 0);
  objc_storeStrong((id *)&self->_firstLineControlsStackView, 0);
  objc_storeStrong((id *)&self->_replaceStackView, 0);
  objc_storeStrong((id *)&self->_findStackView, 0);
  objc_storeStrong((id *)&self->_verticalStackView, 0);
}

@end
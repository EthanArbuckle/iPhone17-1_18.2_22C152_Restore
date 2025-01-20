@interface OBWelcomeFullCenterContentController
- (NSArray)floatingConstraintGroup;
- (NSArray)pinnedConstraintGroup;
- (NSLayoutConstraint)contentViewOptionalHeightAnchor;
- (UIView)centerContentView;
- (double)_availablePreScrollContentHeight;
- (double)contentViewMaxHeight;
- (void)insertCenterContentView;
- (void)recalculateLayoutForTraitCollectionChange;
- (void)setCenterContentView:(id)a3;
- (void)setCenteredContentView:(id)a3;
- (void)setContentViewMaxHeight:(double)a3;
- (void)setContentViewOptionalHeightAnchor:(id)a3;
- (void)setFloatingConstraintGroup:(id)a3;
- (void)setPinnedConstraintGroup:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation OBWelcomeFullCenterContentController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)OBWelcomeFullCenterContentController;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  [(OBWelcomeFullCenterContentController *)self insertCenterContentView];
}

- (void)setCenteredContentView:(id)a3
{
  id v9 = a3;
  id v4 = [(OBWelcomeFullCenterContentController *)self centerContentView];

  if (v4 != v9)
  {
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(OBWelcomeFullCenterContentController *)self centerContentView];
    v6 = [v5 superview];
    v7 = [(OBWelcomeController *)self contentView];

    if (v6 == v7)
    {
      v8 = [(OBWelcomeFullCenterContentController *)self centerContentView];
      [v8 removeFromSuperview];
    }
    [(OBWelcomeFullCenterContentController *)self setCenterContentView:v9];
  }
  if ([(OBWelcomeFullCenterContentController *)self isViewLoaded]) {
    [(OBWelcomeFullCenterContentController *)self insertCenterContentView];
  }
}

- (void)insertCenterContentView
{
  v46[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(OBWelcomeFullCenterContentController *)self centerContentView];
  id v4 = [v3 superview];
  v5 = [(OBWelcomeController *)self contentView];

  if (v4 != v5)
  {
    v6 = [(OBWelcomeFullCenterContentController *)self centerContentView];
    [v6 removeFromSuperview];

    v7 = [(OBWelcomeController *)self contentView];
    v8 = [(OBWelcomeFullCenterContentController *)self centerContentView];
    [v7 addSubview:v8];

    v45 = [(OBWelcomeFullCenterContentController *)self centerContentView];
    v43 = [v45 centerXAnchor];
    v44 = [(OBWelcomeController *)self contentView];
    v42 = [v44 centerXAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v46[0] = v41;
    v40 = [(OBWelcomeFullCenterContentController *)self centerContentView];
    v38 = [v40 centerYAnchor];
    v39 = [(OBWelcomeController *)self contentView];
    v37 = [v39 centerYAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v46[1] = v36;
    v35 = [(OBWelcomeController *)self contentView];
    v34 = [v35 bottomAnchor];
    id v9 = [(OBWelcomeFullCenterContentController *)self centerContentView];
    v10 = [v9 bottomAnchor];
    v11 = [v34 constraintGreaterThanOrEqualToAnchor:v10];
    v46[2] = v11;
    v12 = [(OBWelcomeController *)self contentView];
    v13 = [v12 topAnchor];
    v14 = [(OBWelcomeFullCenterContentController *)self centerContentView];
    v15 = [v14 topAnchor];
    v16 = [v13 constraintLessThanOrEqualToAnchor:v15];
    v46[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
    [(OBWelcomeFullCenterContentController *)self setFloatingConstraintGroup:v17];

    v18 = [(OBWelcomeController *)self contentView];
    v19 = [v18 heightAnchor];
    [(OBWelcomeFullCenterContentController *)self _availablePreScrollContentHeight];
    v20 = objc_msgSend(v19, "constraintEqualToConstant:");
    [(OBWelcomeFullCenterContentController *)self setContentViewOptionalHeightAnchor:v20];

    v21 = [(OBWelcomeFullCenterContentController *)self contentViewOptionalHeightAnchor];
    [v21 setActive:1];

    v22 = [(OBWelcomeFullCenterContentController *)self contentViewOptionalHeightAnchor];
    LODWORD(v23) = 1132068864;
    [v22 setPriority:v23];

    v24 = (void *)MEMORY[0x1E4F28DC8];
    v25 = [(OBWelcomeFullCenterContentController *)self floatingConstraintGroup];
    [v24 activateConstraints:v25];

    v26 = [(OBWelcomeFullCenterContentController *)self centerContentView];
    v27 = [v26 widthAnchor];
    v28 = [(OBWelcomeController *)self contentView];
    v29 = [v28 widthAnchor];
    v30 = [v27 constraintLessThanOrEqualToAnchor:v29];
    [v30 setActive:1];

    v31 = [(OBWelcomeFullCenterContentController *)self centerContentView];
    v32 = [(OBWelcomeController *)self contentView];
    v33 = objc_msgSend(v31, "ob_pinToEdgesConstraints:", v32);
    [(OBWelcomeFullCenterContentController *)self setPinnedConstraintGroup:v33];
  }
}

- (void)viewDidLayoutSubviews
{
  [(OBWelcomeFullCenterContentController *)self _availablePreScrollContentHeight];
  double v4 = v3;
  v5 = [(OBWelcomeFullCenterContentController *)self contentViewOptionalHeightAnchor];
  [v5 setConstant:v4];

  v14.receiver = self;
  v14.super_class = (Class)OBWelcomeFullCenterContentController;
  [(OBWelcomeController *)&v14 viewDidLayoutSubviews];
  [(OBWelcomeFullCenterContentController *)self recalculateLayoutForTraitCollectionChange];
  v6 = [(OBWelcomeController *)self headerView];
  [v6 frame];
  if (v7 == 0.0)
  {
    v8 = [(OBWelcomeController *)self headerView];
    id v9 = [v8 headerLabel];
    v10 = [v9 text];
    if (v10)
    {
    }
    else
    {
      v11 = [(OBWelcomeController *)self headerView];
      v12 = [v11 detailLabel];
      v13 = [v12 text];

      if (!v13) {
        return;
      }
    }
    v6 = [(OBWelcomeFullCenterContentController *)self view];
    [v6 setNeedsLayout];
  }
}

- (double)_availablePreScrollContentHeight
{
  double v3 = [(OBWelcomeController *)self scrollView];
  [v3 bounds];
  double v5 = v4;

  v6 = [(OBWelcomeController *)self contentView];
  [v6 frame];
  double v8 = v5 - v7;

  id v9 = [(OBWelcomeController *)self buttonTray];
  [v9 bounds];
  double v11 = v8 - v10;

  return v11;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OBWelcomeFullCenterContentController;
  [(OBWelcomeController *)&v4 traitCollectionDidChange:a3];
  [(OBWelcomeFullCenterContentController *)self recalculateLayoutForTraitCollectionChange];
}

- (void)recalculateLayoutForTraitCollectionChange
{
  double v3 = [(OBWelcomeFullCenterContentController *)self centerContentView];
  [v3 bounds];
  double v5 = v4;
  [(OBWelcomeFullCenterContentController *)self _availablePreScrollContentHeight];
  if (v5 <= v6)
  {
  }
  else
  {
    double v7 = [(OBWelcomeFullCenterContentController *)self floatingConstraintGroup];
    double v8 = [v7 firstObject];
    int v9 = [v8 isActive];

    if (v9)
    {
      double v10 = (void *)MEMORY[0x1E4F28DC8];
      double v11 = [(OBWelcomeFullCenterContentController *)self floatingConstraintGroup];
      [v10 deactivateConstraints:v11];

      v12 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v13 = [(OBWelcomeFullCenterContentController *)self pinnedConstraintGroup];
LABEL_8:
      id v22 = (id)v13;
      [v12 activateConstraints:v13];
      goto LABEL_9;
    }
  }
  id v22 = [(OBWelcomeFullCenterContentController *)self centerContentView];
  [v22 bounds];
  double v15 = v14;
  [(OBWelcomeFullCenterContentController *)self _availablePreScrollContentHeight];
  if (v15 < v16)
  {
    v17 = [(OBWelcomeFullCenterContentController *)self pinnedConstraintGroup];
    v18 = [v17 firstObject];
    int v19 = [v18 isActive];

    if (!v19) {
      return;
    }
    v20 = (void *)MEMORY[0x1E4F28DC8];
    v21 = [(OBWelcomeFullCenterContentController *)self pinnedConstraintGroup];
    [v20 deactivateConstraints:v21];

    v12 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v13 = [(OBWelcomeFullCenterContentController *)self floatingConstraintGroup];
    goto LABEL_8;
  }
LABEL_9:
}

- (UIView)centerContentView
{
  return self->_centerContentView;
}

- (void)setCenterContentView:(id)a3
{
}

- (NSLayoutConstraint)contentViewOptionalHeightAnchor
{
  return self->_contentViewOptionalHeightAnchor;
}

- (void)setContentViewOptionalHeightAnchor:(id)a3
{
}

- (double)contentViewMaxHeight
{
  return self->_contentViewMaxHeight;
}

- (void)setContentViewMaxHeight:(double)a3
{
  self->_contentViewMaxHeight = a3;
}

- (NSArray)floatingConstraintGroup
{
  return self->_floatingConstraintGroup;
}

- (void)setFloatingConstraintGroup:(id)a3
{
}

- (NSArray)pinnedConstraintGroup
{
  return self->_pinnedConstraintGroup;
}

- (void)setPinnedConstraintGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinnedConstraintGroup, 0);
  objc_storeStrong((id *)&self->_floatingConstraintGroup, 0);
  objc_storeStrong((id *)&self->_contentViewOptionalHeightAnchor, 0);
  objc_storeStrong((id *)&self->_centerContentView, 0);
}

@end
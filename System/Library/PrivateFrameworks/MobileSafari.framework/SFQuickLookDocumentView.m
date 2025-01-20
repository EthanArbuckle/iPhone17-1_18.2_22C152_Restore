@interface SFQuickLookDocumentView
- (CGRect)frameForButtonAtIndex:(unint64_t)a3;
- (SFQuickLookDocumentView)initWithFrame:(CGRect)a3;
- (SFQuickLookDocumentViewDelegate)quickLookDocumentViewDelegate;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (void)_actionButtonTapped:(id)a3;
- (void)_setUpLayoutConstraints;
- (void)_updateOrientationBasedConstraints;
- (void)_updatePropertiesDefinedByContentSizeCategory;
- (void)setQuickLookDocumentViewDelegate:(id)a3;
- (void)updateActionTitles:(id)a3;
- (void)updateDocumentFileName:(id)a3;
- (void)updateDocumentFileSize:(id)a3;
- (void)updateDocumentFileType:(id)a3;
- (void)updateDocumentIcon:(id)a3;
@end

@implementation SFQuickLookDocumentView

- (SFQuickLookDocumentView)initWithFrame:(CGRect)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)SFQuickLookDocumentView;
  v3 = -[SFQuickLookDocumentView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
    [(SFQuickLookDocumentView *)v3 setBackgroundColor:v4];

    v5 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_safariAccentColor");
    [(SFQuickLookDocumentView *)v3 setTintColor:v5];

    [(SFQuickLookDocumentView *)v3 setAccessibilityIdentifier:@"QuickLookDocumentView"];
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    wrapperView = v3->_wrapperView;
    v3->_wrapperView = v6;

    [(UIView *)v3->_wrapperView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFQuickLookDocumentView *)v3 addSubview:v3->_wrapperView];
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    contentView = v3->_contentView;
    v3->_contentView = v8;

    [(UIView *)v3->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_wrapperView addSubview:v3->_contentView];
    v10 = objc_alloc_init(SFQuickLookDocumentInfoView);
    documentInfoView = v3->_documentInfoView;
    v3->_documentInfoView = v10;

    [(SFQuickLookDocumentInfoView *)v3->_documentInfoView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFQuickLookDocumentInfoView *)v3->_documentInfoView setUserInteractionEnabled:1];
    v12 = v3->_documentInfoView;
    v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1708]) initWithDelegate:v3];
    [(SFQuickLookDocumentInfoView *)v12 addInteraction:v13];

    [(UIView *)v3->_contentView addSubview:v3->_documentInfoView];
    v14 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    actionButtonsView = v3->_actionButtonsView;
    v3->_actionButtonsView = v14;

    [(UIStackView *)v3->_actionButtonsView setAxis:1];
    [(UIStackView *)v3->_actionButtonsView setBaselineRelativeArrangement:1];
    [(UIStackView *)v3->_actionButtonsView setDistribution:3];
    [(UIStackView *)v3->_actionButtonsView setSpacing:32.0];
    [(UIStackView *)v3->_actionButtonsView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_contentView addSubview:v3->_actionButtonsView];
    [(SFQuickLookDocumentView *)v3 _setUpLayoutConstraints];
    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v3 selector:sel__updatePropertiesDefinedByContentSizeCategory name:*MEMORY[0x1E4FB27A8] object:0];

    [(SFQuickLookDocumentView *)v3 _updatePropertiesDefinedByContentSizeCategory];
    v22[0] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    id v18 = (id)[(SFQuickLookDocumentView *)v3 registerForTraitChanges:v17 withTarget:v3 action:sel__updateOrientationBasedConstraints];

    v19 = v3;
  }

  return v3;
}

- (void)updateActionTitles:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __46__SFQuickLookDocumentView_updateActionTitles___block_invoke;
  v25[3] = &unk_1E54ECD38;
  v25[4] = self;
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", v25);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  actionButtons = self->_actionButtons;
  self->_actionButtons = v4;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = [(UIStackView *)self->_actionButtonsView arrangedSubviews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v11 removeTarget:self action:0 forControlEvents:0];
        [(UIStackView *)self->_actionButtonsView removeArrangedSubview:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v12 = self->_actionButtons;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        -[UIStackView addArrangedSubview:](self->_actionButtonsView, "addArrangedSubview:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v26 count:16];
    }
    while (v14);
  }

  [(SFQuickLookDocumentView *)self _updatePropertiesDefinedByContentSizeCategory];
}

id __46__SFQuickLookDocumentView_updateActionTitles___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4FB14D0];
  id v4 = a2;
  v5 = [v3 buttonWithType:1];
  [v5 setTitle:v4 forState:0];

  [v5 addTarget:*(void *)(a1 + 32) action:sel__actionButtonTapped_ forControlEvents:0x2000];

  return v5;
}

- (void)updateDocumentFileName:(id)a3
{
}

- (void)updateDocumentFileSize:(id)a3
{
}

- (void)updateDocumentFileType:(id)a3
{
}

- (void)updateDocumentIcon:(id)a3
{
  documentInfoView = self->_documentInfoView;
  id v4 = a3;
  id v5 = [(SFQuickLookDocumentInfoView *)documentInfoView iconImageView];
  [v5 setImage:v4];
}

- (CGRect)frameForButtonAtIndex:(unint64_t)a3
{
  id v4 = [(NSArray *)self->_actionButtons objectAtIndexedSubscript:a3];
  [v4 bounds];
  -[SFQuickLookDocumentView convertRect:fromView:](self, "convertRect:fromView:", v4);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_setUpLayoutConstraints
{
  v64[19] = *MEMORY[0x1E4F143B8];
  v3 = [(UIStackView *)self->_actionButtonsView topAnchor];
  id v4 = [(SFQuickLookDocumentInfoView *)self->_documentInfoView bottomAnchor];
  double v5 = [v3 constraintEqualToAnchor:v4];
  documentInfoViewBottomAnchorConstraint = self->_documentInfoViewBottomAnchorConstraint;
  self->_documentInfoViewBottomAnchorConstraint = v5;

  v42 = (void *)MEMORY[0x1E4F28DC8];
  v63 = [(UIView *)self->_wrapperView topAnchor];
  v62 = [(SFQuickLookDocumentView *)self topAnchor];
  v61 = [v63 constraintEqualToAnchor:v62];
  v64[0] = v61;
  v60 = [(UIView *)self->_wrapperView bottomAnchor];
  v59 = [(SFQuickLookDocumentView *)self bottomAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v64[1] = v58;
  v57 = [(UIView *)self->_wrapperView leadingAnchor];
  v56 = [(SFQuickLookDocumentView *)self leadingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v64[2] = v55;
  v54 = [(UIView *)self->_wrapperView trailingAnchor];
  v53 = [(SFQuickLookDocumentView *)self trailingAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v64[3] = v52;
  v51 = [(UIView *)self->_wrapperView centerXAnchor];
  v50 = [(SFQuickLookDocumentView *)self centerXAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v64[4] = v49;
  v48 = [(UIView *)self->_wrapperView heightAnchor];
  v47 = [(SFQuickLookDocumentView *)self heightAnchor];
  v46 = [v48 constraintGreaterThanOrEqualToAnchor:v47];
  v64[5] = v46;
  v45 = [(UIView *)self->_contentView topAnchor];
  v44 = [(UIView *)self->_wrapperView topAnchor];
  v43 = [v45 constraintGreaterThanOrEqualToAnchor:v44 constant:16.0];
  v64[6] = v43;
  v41 = [(UIView *)self->_contentView bottomAnchor];
  v40 = [(UIView *)self->_wrapperView bottomAnchor];
  v39 = [v41 constraintLessThanOrEqualToAnchor:v40 constant:-16.0];
  v64[7] = v39;
  v38 = [(UIView *)self->_contentView leadingAnchor];
  v37 = [(UIView *)self->_wrapperView leadingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37 constant:10.0];
  v64[8] = v36;
  v35 = [(UIView *)self->_contentView trailingAnchor];
  v34 = [(UIView *)self->_wrapperView trailingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34 constant:-10.0];
  v64[9] = v33;
  v32 = [(UIView *)self->_contentView centerXAnchor];
  v31 = [(UIView *)self->_wrapperView centerXAnchor];
  v30 = [v32 constraintEqualToAnchor:v31];
  v64[10] = v30;
  v29 = [(UIView *)self->_contentView centerYAnchor];
  uint64_t v28 = [(UIView *)self->_wrapperView centerYAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  double v7 = self->_documentInfoViewBottomAnchorConstraint;
  v64[11] = v27;
  v64[12] = v7;
  v26 = [(SFQuickLookDocumentInfoView *)self->_documentInfoView centerXAnchor];
  v25 = [(UIView *)self->_contentView centerXAnchor];
  long long v24 = [v26 constraintEqualToAnchor:v25];
  v64[13] = v24;
  long long v23 = [(SFQuickLookDocumentInfoView *)self->_documentInfoView topAnchor];
  long long v22 = [(UIView *)self->_contentView topAnchor];
  long long v21 = [v23 constraintEqualToAnchor:v22];
  v64[14] = v21;
  long long v20 = [(SFQuickLookDocumentInfoView *)self->_documentInfoView widthAnchor];
  long long v19 = [(UIView *)self->_contentView widthAnchor];
  long long v18 = [v20 constraintLessThanOrEqualToAnchor:v19];
  v64[15] = v18;
  long long v17 = [(UIStackView *)self->_actionButtonsView centerXAnchor];
  double v8 = [(UIView *)self->_contentView centerXAnchor];
  double v9 = [v17 constraintEqualToAnchor:v8];
  v64[16] = v9;
  double v10 = [(UIStackView *)self->_actionButtonsView widthAnchor];
  double v11 = [(UIView *)self->_contentView widthAnchor];
  double v12 = [v10 constraintLessThanOrEqualToAnchor:v11];
  v64[17] = v12;
  double v13 = [(UIStackView *)self->_actionButtonsView bottomAnchor];
  double v14 = [(UIView *)self->_contentView bottomAnchor];
  double v15 = [v13 constraintLessThanOrEqualToAnchor:v14];
  v64[18] = v15;
  double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:19];
  [v42 activateConstraints:v16];

  [(SFQuickLookDocumentView *)self _updateOrientationBasedConstraints];
}

- (void)_updateOrientationBasedConstraints
{
  v3 = [(SFQuickLookDocumentView *)self traitCollection];
  uint64_t v4 = [v3 verticalSizeClass];

  double v5 = 56.0;
  if (v4 == 1) {
    double v5 = 32.0;
  }
  documentInfoViewBottomAnchorConstraint = self->_documentInfoViewBottomAnchorConstraint;

  [(NSLayoutConstraint *)documentInfoViewBottomAnchorConstraint setConstant:v5];
}

- (void)_updatePropertiesDefinedByContentSizeCategory
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:0 options:3];
  uint64_t v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v3 size:0.0];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v5 = self->_actionButtons;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "titleLabel", (void)v11);
        [v10 setFont:v4];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [v4 _scaledValueForValue:32.0];
  -[UIStackView setSpacing:](self->_actionButtonsView, "setSpacing:");
}

- (void)_actionButtonTapped:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_quickLookDocumentViewDelegate);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "quickLookDocumentView:didSelectActionAtIndex:", self, -[NSArray indexOfObjectIdenticalTo:](self->_actionButtons, "indexOfObjectIdenticalTo:", v5));
  }
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_quickLookDocumentViewDelegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [WeakRetained itemProviderForQuickLookDocumentView:self];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v6];
    v10[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1720]);
  uint64_t v7 = [MEMORY[0x1E4FB1618] clearColor];
  [v6 setBackgroundColor:v7];

  id v8 = objc_alloc(MEMORY[0x1E4FB1D40]);
  uint64_t v9 = [(SFQuickLookDocumentInfoView *)self->_documentInfoView iconImageView];
  double v10 = (void *)[v8 initWithView:v9 parameters:v6];

  return v10;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_quickLookDocumentViewDelegate);
  int64_t v6 = [WeakRetained dataOwnerForQuickLookDocumentView:self];

  return v6;
}

- (SFQuickLookDocumentViewDelegate)quickLookDocumentViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_quickLookDocumentViewDelegate);

  return (SFQuickLookDocumentViewDelegate *)WeakRetained;
}

- (void)setQuickLookDocumentViewDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_quickLookDocumentViewDelegate);
  objc_storeStrong((id *)&self->_documentInfoViewBottomAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_actionButtonsView, 0);
  objc_storeStrong((id *)&self->_actionButtons, 0);
  objc_storeStrong((id *)&self->_documentInfoView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_wrapperView, 0);
}

@end
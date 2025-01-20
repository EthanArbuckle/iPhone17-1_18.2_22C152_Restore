@interface SFHighlightContactList
- (NSArray)contacts;
- (SFHighlightContactList)initWithContacts:(id)a3;
- (id)infoViewControllerHandler;
- (id)manageHandler;
- (id)resizeHandler;
- (id)rowTapHandler;
- (void)_didTapManage:(id)a3;
- (void)_setNeedsResizeAfterLayout;
- (void)_updateList;
- (void)cellDidReceiveTap:(id)a3;
- (void)layoutSubviews;
- (void)setContacts:(id)a3;
- (void)setInfoViewControllerHandler:(id)a3;
- (void)setManageHandler:(id)a3;
- (void)setResizeHandler:(id)a3;
- (void)setRowTapHandler:(id)a3;
@end

@implementation SFHighlightContactList

- (SFHighlightContactList)initWithContacts:(id)a3
{
  v69[10] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)SFHighlightContactList;
  v5 = -[SFHighlightContactList initWithFrame:](&v67, sel_initWithFrame_, 0.0, 0.0, 240.0, 1000.0);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contacts = v5->_contacts;
    v5->_contacts = (NSArray *)v6;

    v8 = (UIStackView *)objc_alloc_init(MEMORY[0x1E4FB1C60]);
    stackView = v5->_stackView;
    v5->_stackView = v8;

    [(UIStackView *)v5->_stackView setAxis:1];
    [(UIStackView *)v5->_stackView setLayoutMarginsRelativeArrangement:1];
    [(UIStackView *)v5->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
    [(UIStackView *)v5->_stackView setBackgroundColor:v10];

    [(UIStackView *)v5->_stackView _setContinuousCornerRadius:12.0];
    [(UIStackView *)v5->_stackView sizeToFit];
    [(SFHighlightContactList *)v5 addSubview:v5->_stackView];
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    headerLabel = v5->_headerLabel;
    v5->_headerLabel = v11;

    id v66 = v4;
    v13 = _WBSLocalizedString();
    [(UILabel *)v5->_headerLabel setText:v13];

    [(UILabel *)v5->_headerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    [(UILabel *)v5->_headerLabel setFont:v14];

    [(UILabel *)v5->_headerLabel setAdjustsFontForContentSizeCategory:1];
    v15 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v5->_headerLabel setTextColor:v15];

    [(SFHighlightContactList *)v5 addSubview:v5->_headerLabel];
    v16 = objc_alloc_init(SFHighlightContactListButton);
    manageButton = v5->_manageButton;
    v5->_manageButton = v16;

    [(SFHighlightContactListButton *)v5->_manageButton _setContinuousCornerRadius:12.0];
    -[SFHighlightContactListButton setDirectionalLayoutMargins:](v5->_manageButton, "setDirectionalLayoutMargins:", 8.0, 16.0, 8.0, 16.0);
    v18 = _WBSLocalizedString();
    [(SFHighlightContactListButton *)v5->_manageButton setTitle:v18];

    [(SFHighlightContactListButton *)v5->_manageButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFHighlightContactListButton *)v5->_manageButton addTarget:v5 action:sel__didTapManage_ forControlEvents:64];
    [(SFHighlightContactList *)v5 addSubview:v5->_manageButton];
    v19 = [(SFHighlightContactListButton *)v5->_manageButton topAnchor];
    v20 = [(SFHighlightContactList *)v5 topAnchor];
    uint64_t v21 = [v19 constraintEqualToAnchor:v20];
    manageButtonTopConstraintForEmptyList = v5->_manageButtonTopConstraintForEmptyList;
    v5->_manageButtonTopConstraintForEmptyList = (NSLayoutConstraint *)v21;

    v23 = [(SFHighlightContactListButton *)v5->_manageButton topAnchor];
    v24 = [(UIStackView *)v5->_stackView bottomAnchor];
    uint64_t v25 = [v23 constraintEqualToSystemSpacingBelowAnchor:v24 multiplier:2.0];
    manageButtonTopConstraintForNonEmptyList = v5->_manageButtonTopConstraintForNonEmptyList;
    v5->_manageButtonTopConstraintForNonEmptyList = (NSLayoutConstraint *)v25;

    v27 = [(SFHighlightContactList *)v5 layoutMarginsGuide];
    v28 = [(SFHighlightContactListButton *)v5->_manageButton layoutMarginsGuide];
    v51 = (void *)MEMORY[0x1E4F28DC8];
    v64 = [(UILabel *)v5->_headerLabel topAnchor];
    v63 = [(SFHighlightContactList *)v5 topAnchor];
    v62 = [v64 constraintEqualToAnchor:v63];
    v69[0] = v62;
    v65 = v28;
    v61 = [v28 leadingAnchor];
    v60 = [(UILabel *)v5->_headerLabel leadingAnchor];
    v59 = [v61 constraintEqualToAnchor:v60 constant:8.0];
    v69[1] = v59;
    v58 = [(UILabel *)v5->_headerLabel trailingAnchor];
    v57 = [v28 trailingAnchor];
    v56 = [v58 constraintEqualToAnchor:v57];
    v69[2] = v56;
    v55 = [v27 leadingAnchor];
    v54 = [(UIStackView *)v5->_stackView leadingAnchor];
    v53 = [v55 constraintEqualToAnchor:v54 constant:8.0];
    v69[3] = v53;
    v50 = [(UIStackView *)v5->_stackView trailingAnchor];
    v49 = [v27 trailingAnchor];
    v48 = [v50 constraintEqualToAnchor:v49 constant:8.0];
    v69[4] = v48;
    v47 = [(UIStackView *)v5->_stackView topAnchor];
    v46 = [(UILabel *)v5->_headerLabel bottomAnchor];
    v45 = [v47 constraintEqualToAnchor:v46 constant:4.0];
    v69[5] = v45;
    v44 = [v27 leadingAnchor];
    v43 = [(SFHighlightContactListButton *)v5->_manageButton leadingAnchor];
    v42 = [v44 constraintEqualToAnchor:v43 constant:8.0];
    v69[6] = v42;
    v29 = [(SFHighlightContactListButton *)v5->_manageButton trailingAnchor];
    v52 = v27;
    v30 = [v27 trailingAnchor];
    v31 = [v29 constraintEqualToAnchor:v30 constant:8.0];
    v69[7] = v31;
    v32 = [(SFHighlightContactListButton *)v5->_manageButton heightAnchor];
    v33 = [v32 constraintGreaterThanOrEqualToConstant:44.0];
    v69[8] = v33;
    v34 = [(SFHighlightContactListButton *)v5->_manageButton bottomAnchor];
    v35 = [v27 bottomAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    v69[9] = v36;
    v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:10];
    [v51 activateConstraints:v37];

    id v4 = v66;
    -[SFHighlightContactList setDirectionalLayoutMargins:](v5, "setDirectionalLayoutMargins:", *MEMORY[0x1E4FB3310], 8.0, *MEMORY[0x1E4FB3310], 8.0);
    [(SFHighlightContactList *)v5 _updateList];
    uint64_t v68 = objc_opt_class();
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
    id v39 = (id)[(SFHighlightContactList *)v5 registerForTraitChanges:v38 withTarget:v5 action:sel__setNeedsResizeAfterLayout];

    v40 = v5;
  }

  return v5;
}

- (void)setInfoViewControllerHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _Block_copy(v4);
  uint64_t v6 = _Block_copy(self->_infoViewControllerHandler);
  char v7 = WBSIsEqual();

  if ((v7 & 1) == 0)
  {
    v8 = (void *)[v4 copy];
    id infoViewControllerHandler = self->_infoViewControllerHandler;
    self->_id infoViewControllerHandler = v8;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v10 = [(UIStackView *)self->_stackView arrangedSubviews];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * v14++) setInfoViewControllerHandler:v4];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
}

- (void)setContacts:(id)a3
{
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    id v4 = (NSArray *)[v6 copy];
    contacts = self->_contacts;
    self->_contacts = v4;

    [(SFHighlightContactList *)self _updateList];
  }
}

- (void)_updateList
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v3 = [(UIStackView *)self->_stackView arrangedSubviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v39 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v5);
  }

  contacts = self->_contacts;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __37__SFHighlightContactList__updateList__block_invoke;
  v38[3] = &unk_1E54ECD60;
  v38[4] = self;
  v9 = [(NSArray *)contacts safari_mapObjectsUsingBlock:v38];
  v10 = [MEMORY[0x1E4F1B8F8] comparatorForNameSortOrder:1];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __37__SFHighlightContactList__updateList__block_invoke_2;
  v36[3] = &unk_1E54ECD88;
  id v11 = v10;
  id v37 = v11;
  uint64_t v12 = [v9 sortedArrayUsingComparator:v36];

  uint64_t v13 = [v12 firstObject];
  [v13 setFirstInList:1];

  uint64_t v14 = [v12 lastObject];
  [v14 setLastInList:1];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        -[UIStackView addArrangedSubview:](self->_stackView, "addArrangedSubview:", *(void *)(*((void *)&v32 + 1) + 8 * j), (void)v32);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v43 count:16];
    }
    while (v17);
  }

  [(SFHighlightContactList *)self layoutIfNeeded];
  uint64_t v20 = [v15 count];
  BOOL v21 = v20 != 0;
  BOOL v22 = v20 == 0;
  if (v20) {
    v23 = @"person.crop.circle.badge.checkmark";
  }
  else {
    v23 = @"person.crop.circle.badge.plus";
  }
  -[UILabel setHidden:](self->_headerLabel, "setHidden:", v22, (void)v32);
  v24 = [MEMORY[0x1E4FB1818] systemImageNamed:v23];
  [(SFHighlightContactListButton *)self->_manageButton setImage:v24];

  [(NSLayoutConstraint *)self->_manageButtonTopConstraintForEmptyList setActive:v22];
  [(NSLayoutConstraint *)self->_manageButtonTopConstraintForNonEmptyList setActive:v21];
  [(SFHighlightContactList *)self frame];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  -[SFHighlightContactList systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  -[SFHighlightContactList setFrame:](self, "setFrame:", v26, v28, v30, v31);
}

SFHighlightContactListCell *__37__SFHighlightContactList__updateList__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[SFHighlightContactListCell alloc] initWithContact:v3];

  [(SFHighlightContactListCell *)v4 _setContinuousCornerRadius:12.0];
  -[SFHighlightContactListCell setDirectionalLayoutMargins:](v4, "setDirectionalLayoutMargins:", 8.0, 16.0, 8.0, 16.0);
  [(SFHighlightContactListCell *)v4 setDelegate:*(void *)(a1 + 32)];
  [(SFHighlightContactListCell *)v4 setInfoViewControllerHandler:*(void *)(*(void *)(a1 + 32) + 456)];

  return v4;
}

uint64_t __37__SFHighlightContactList__updateList__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  uint64_t v6 = [a2 contact];
  char v7 = [v5 contact];

  uint64_t v8 = (*(uint64_t (**)(uint64_t, void *, void *))(v4 + 16))(v4, v6, v7);
  return v8;
}

- (void)_setNeedsResizeAfterLayout
{
  self->_needsResizeAfterLayout = 1;
  [(SFHighlightContactList *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)SFHighlightContactList;
  [(SFHighlightContactList *)&v11 layoutSubviews];
  if (self->_needsResizeAfterLayout)
  {
    self->_needsResizeAfterLayout = 0;
    [(SFHighlightContactList *)self frame];
    double x = v12.origin.x;
    double y = v12.origin.y;
    double width = v12.size.width;
    CGFloat v6 = CGRectGetWidth(v12);
    LODWORD(v7) = 1148846080;
    LODWORD(v8) = 1112014848;
    -[SFHighlightContactList systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, 0.0, v7, v8);
    -[SFHighlightContactList setFrame:](self, "setFrame:", x, y, width, v9);
    resizeHandler = (void (**)(id, SFHighlightContactList *))self->_resizeHandler;
    if (resizeHandler) {
      resizeHandler[2](resizeHandler, self);
    }
  }
}

- (void)_didTapManage:(id)a3
{
  manageHandler = (void (**)(void))self->_manageHandler;
  if (manageHandler) {
    manageHandler[2]();
  }
}

- (void)cellDidReceiveTap:(id)a3
{
  rowTapHandler = (void (**)(id, id, uint64_t))self->_rowTapHandler;
  if (rowTapHandler)
  {
    id v5 = a3;
    id v8 = [v5 contact];
    contacts = self->_contacts;
    double v7 = [v5 contact];

    rowTapHandler[2](rowTapHandler, v8, [(NSArray *)contacts indexOfObject:v7]);
  }
}

- (id)infoViewControllerHandler
{
  return self->_infoViewControllerHandler;
}

- (id)rowTapHandler
{
  return self->_rowTapHandler;
}

- (void)setRowTapHandler:(id)a3
{
}

- (id)manageHandler
{
  return self->_manageHandler;
}

- (void)setManageHandler:(id)a3
{
}

- (id)resizeHandler
{
  return self->_resizeHandler;
}

- (void)setResizeHandler:(id)a3
{
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong(&self->_resizeHandler, 0);
  objc_storeStrong(&self->_manageHandler, 0);
  objc_storeStrong(&self->_rowTapHandler, 0);
  objc_storeStrong(&self->_infoViewControllerHandler, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_manageButtonTopConstraintForNonEmptyList, 0);
  objc_storeStrong((id *)&self->_manageButtonTopConstraintForEmptyList, 0);
  objc_storeStrong((id *)&self->_manageButton, 0);

  objc_storeStrong((id *)&self->_headerLabel, 0);
}

@end
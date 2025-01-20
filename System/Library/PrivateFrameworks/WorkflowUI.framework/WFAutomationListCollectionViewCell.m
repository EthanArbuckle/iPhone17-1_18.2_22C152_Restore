@interface WFAutomationListCollectionViewCell
- (BOOL)showsSeparator;
- (HFTriggerItem)homeTrigger;
- (NSLayoutConstraint)separatorViewHeightConstraint;
- (NSString)identifier;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (UIView)separatorView;
- (WFAutomationListCollectionViewCell)initWithFrame:(CGRect)a3;
- (WFAutomationSummaryIconsView)summaryIconsView;
- (WFConfiguredTrigger)configuredTrigger;
- (WFWorkflow)workflow;
- (unint64_t)maskedCorners;
- (void)prepareForReuse;
- (void)setConfiguredTrigger:(id)a3;
- (void)setConfiguredTrigger:(id)a3 workflow:(id)a4;
- (void)setHomeTrigger:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setShowsSeparator:(BOOL)a3;
- (void)setWorkflow:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateUI;
@end

@implementation WFAutomationListCollectionViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_summaryIconsView, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_homeTrigger, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_configuredTrigger, 0);
}

- (NSLayoutConstraint)separatorViewHeightConstraint
{
  return self->_separatorViewHeightConstraint;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (WFAutomationSummaryIconsView)summaryIconsView
{
  return self->_summaryIconsView;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setHomeTrigger:(id)a3
{
}

- (HFTriggerItem)homeTrigger
{
  return self->_homeTrigger;
}

- (void)setWorkflow:(id)a3
{
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (void)setConfiguredTrigger:(id)a3
{
}

- (WFConfiguredTrigger)configuredTrigger
{
  return self->_configuredTrigger;
}

- (void)traitCollectionDidChange:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)WFAutomationListCollectionViewCell;
  id v4 = a3;
  [(WFAutomationListCollectionViewCell *)&v14 traitCollectionDidChange:v4];
  v5 = [(WFAutomationListCollectionViewCell *)self traitCollection];
  [v5 displayScale];
  double v7 = v6;
  [v4 displayScale];
  double v9 = v8;

  if (v7 != v9)
  {
    v10 = [(WFAutomationListCollectionViewCell *)self traitCollection];
    [v10 displayScale];
    double v12 = 1.0 / v11;
    v13 = [(WFAutomationListCollectionViewCell *)self separatorViewHeightConstraint];
    [v13 setConstant:v12];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)WFAutomationListCollectionViewCell;
  [(WFAutomationListCollectionViewCell *)&v3 prepareForReuse];
  [(WFAutomationListCollectionViewCell *)self setConfiguredTrigger:0 workflow:0];
  [(WFAutomationListCollectionViewCell *)self setHomeTrigger:0];
  [(WFAutomationListCollectionViewCell *)self setMaskedCorners:0];
}

- (void)updateUI
{
  objc_super v3 = [(WFAutomationListCollectionViewCell *)self configuredTrigger];

  if (v3)
  {
    [(WFAutomationListCollectionViewCell *)self setTintColor:0];
    id v4 = [(WFAutomationListCollectionViewCell *)self configuredTrigger];
    id v48 = [v4 trigger];

    v5 = [v48 localizedDescriptionWithConfigurationSummary];
    double v6 = [(WFAutomationListCollectionViewCell *)self titleLabel];
    [v6 setText:v5];

    double v7 = [(WFAutomationListCollectionViewCell *)self configuredTrigger];
    LODWORD(v6) = [v7 isEnabled];

    if (v6)
    {
      double v8 = [(WFAutomationListCollectionViewCell *)self workflow];
      double v9 = [v8 actionsDescription];
      v10 = [(WFAutomationListCollectionViewCell *)self descriptionLabel];
      [v10 setText:v9];
    }
    else
    {
      double v8 = WFLocalizedString(@"Disabled");
      double v9 = [(WFAutomationListCollectionViewCell *)self descriptionLabel];
      [v9 setText:v8];
    }

    v29 = [(WFAutomationListCollectionViewCell *)self summaryIconsView];
    v30 = [v48 displayGlyph];
    v31 = [v30 UIImage];
    v32 = [v48 displayGlyphTintColor];
    v33 = [v32 UIColor];
    v34 = [(WFAutomationListCollectionViewCell *)self configuredTrigger];
    v35 = [v34 trigger];
    [v29 setTriggerIcon:v31 tintColor:v33 withTrigger:v35];

    v36 = [(WFAutomationListCollectionViewCell *)self workflow];
    v37 = [v36 actions];
    v38 = [(WFAutomationListCollectionViewCell *)self workflow];
    v39 = [v38 actions];
    unint64_t v40 = [v39 count];

    if (v40 >= 6) {
      uint64_t v41 = 6;
    }
    else {
      uint64_t v41 = v40;
    }
    v42 = objc_msgSend(v37, "subarrayWithRange:", 0, v41);

    v43 = objc_msgSend(v42, "if_compactMap:", &__block_literal_global_4998);
    v44 = [(WFAutomationListCollectionViewCell *)self summaryIconsView];
    [v44 setActionIcons:v43];
  }
  else
  {
    double v11 = [(WFAutomationListCollectionViewCell *)self homeTrigger];

    if (v11)
    {
      double v12 = objc_msgSend(MEMORY[0x263F825C8], "wf_homeTintColor");
      [(WFAutomationListCollectionViewCell *)self setTintColor:v12];

      id v13 = objc_alloc(getHFTriggerUISummaryClass_5000());
      objc_super v14 = [(WFAutomationListCollectionViewCell *)self homeTrigger];
      v15 = [v14 trigger];
      v16 = [(WFAutomationListCollectionViewCell *)self homeTrigger];
      v17 = [v16 home];
      id v48 = (id)[v13 initWithTrigger:v15 inHome:v17 forceDisabled:0];

      v18 = [v48 triggerDisplayTitle];
      v19 = [(WFAutomationListCollectionViewCell *)self titleLabel];
      [v19 setText:v18];

      v20 = [v48 triggerDescription];
      v21 = [(WFAutomationListCollectionViewCell *)self descriptionLabel];
      [v21 setText:v20];

      Class HFTriggerIconFactoryClass_5001 = getHFTriggerIconFactoryClass_5001();
      v23 = [(WFAutomationListCollectionViewCell *)self homeTrigger];
      v24 = [v23 trigger];
      v25 = [(objc_class *)HFTriggerIconFactoryClass_5001 iconDescriptorForTrigger:v24];

      v26 = [(WFAutomationListCollectionViewCell *)self summaryIconsView];
      [v26 setHomeTriggerIcon:v25];

      v27 = [v48 triggerSummaryIconDescriptors];
      v28 = [(WFAutomationListCollectionViewCell *)self summaryIconsView];
      [v28 setHomeActionIcons:v27];
    }
    else
    {
      v45 = [(WFAutomationListCollectionViewCell *)self titleLabel];
      [v45 setText:0];

      v46 = [(WFAutomationListCollectionViewCell *)self descriptionLabel];
      [v46 setText:0];

      v47 = [(WFAutomationListCollectionViewCell *)self summaryIconsView];
      [v47 setTriggerIcon:0 tintColor:0 withTrigger:0];

      id v48 = [(WFAutomationListCollectionViewCell *)self summaryIconsView];
      [v48 setActionIcons:MEMORY[0x263EFFA68]];
    }
  }
}

uint64_t __46__WFAutomationListCollectionViewCell_updateUI__block_invoke(uint64_t a1, void *a2)
{
  return [a2 icon];
}

- (void)setMaskedCorners:(unint64_t)a3
{
  id v4 = [(WFAutomationListCollectionViewCell *)self layer];
  [v4 setMaskedCorners:a3];
}

- (unint64_t)maskedCorners
{
  v2 = [(WFAutomationListCollectionViewCell *)self layer];
  unint64_t v3 = [v2 maskedCorners];

  return v3;
}

- (void)setConfiguredTrigger:(id)a3 workflow:(id)a4
{
  id v6 = a4;
  [(WFAutomationListCollectionViewCell *)self setConfiguredTrigger:a3];
  [(WFAutomationListCollectionViewCell *)self setWorkflow:v6];

  [(WFAutomationListCollectionViewCell *)self updateUI];
}

- (WFAutomationListCollectionViewCell)initWithFrame:(CGRect)a3
{
  v89[2] = *MEMORY[0x263EF8340];
  v87.receiver = self;
  v87.super_class = (Class)WFAutomationListCollectionViewCell;
  unint64_t v3 = -[WFAutomationListCollectionViewCell initWithFrame:](&v87, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    v5 = [(WFAutomationListCollectionViewCell *)v3 layer];
    [v5 setMasksToBounds:1];

    uint64_t v6 = *MEMORY[0x263F15A20];
    double v7 = [(WFAutomationListCollectionViewCell *)v4 layer];
    [v7 setCornerCurve:v6];

    double v8 = [(WFAutomationListCollectionViewCell *)v4 layer];
    [v8 setCornerRadius:16.0];

    double v9 = [(WFAutomationListCollectionViewCell *)v4 layer];
    [v9 setMaskedCorners:0];

    v10 = [(WFAutomationListCollectionViewCell *)v4 contentView];
    objc_msgSend(v10, "setDirectionalLayoutMargins:", 16.0, 18.0, 14.0, 8.0);

    id v86 = objc_alloc_init(MEMORY[0x263F82E00]);
    double v11 = objc_msgSend(MEMORY[0x263F825C8], "wf_tableCellDefaultSelectionTintColor");
    [v86 setBackgroundColor:v11];

    [(WFAutomationListCollectionViewCell *)v4 setSelectedBackgroundView:v86];
    id v12 = objc_alloc_init(MEMORY[0x263F82BF8]);
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v12 setAxis:1];
    [v12 setAlignment:0];
    [v12 setDistribution:0];
    [v12 setSpacing:4.0];
    id v13 = objc_alloc_init(WFAutomationSummaryIconsView);
    summaryIconsView = v4->_summaryIconsView;
    v4->_summaryIconsView = v13;

    [(WFAutomationSummaryIconsView *)v4->_summaryIconsView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v15) = 1148846080;
    [(WFAutomationSummaryIconsView *)v4->_summaryIconsView setContentCompressionResistancePriority:1 forAxis:v15];
    [v12 addArrangedSubview:v4->_summaryIconsView];
    [v12 setCustomSpacing:v4->_summaryIconsView afterView:12.0];
    id v16 = objc_alloc(MEMORY[0x263F828E0]);
    double v17 = *MEMORY[0x263F001A8];
    double v18 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v19 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v20 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v21 = objc_msgSend(v16, "initWithFrame:", *MEMORY[0x263F001A8], v18, v19, v20);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v21;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_titleLabel setNumberOfLines:2];
    v23 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
    [(UILabel *)v4->_titleLabel setFont:v23];

    LODWORD(v24) = 1148846080;
    [(UILabel *)v4->_titleLabel setContentCompressionResistancePriority:1 forAxis:v24];
    [v12 addArrangedSubview:v4->_titleLabel];
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v17, v18, v19, v20);
    descriptionLabel = v4->_descriptionLabel;
    v4->_descriptionLabel = (UILabel *)v25;

    [(UILabel *)v4->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_descriptionLabel setNumberOfLines:3];
    v27 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
    [(UILabel *)v4->_descriptionLabel setFont:v27];

    v28 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v4->_descriptionLabel setTextColor:v28];

    LODWORD(v29) = 1148846080;
    [(UILabel *)v4->_descriptionLabel setContentCompressionResistancePriority:1 forAxis:v29];
    v84 = v12;
    [v12 addArrangedSubview:v4->_descriptionLabel];
    v30 = [MEMORY[0x263F827E8] systemImageNamed:@"chevron.right"];
    v31 = [MEMORY[0x263F825C8] tertiaryLabelColor];
    v32 = [v30 imageWithTintColor:v31];
    v33 = [v32 imageWithRenderingMode:1];
    v85 = [v33 imageFlippedForRightToLeftLayoutDirection];

    v34 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v85];
    LODWORD(v35) = 1148829696;
    [v34 setContentCompressionResistancePriority:0 forAxis:v35];
    LODWORD(v36) = 1148829696;
    [v34 setContentHuggingPriority:0 forAxis:v36];
    id v37 = objc_alloc(MEMORY[0x263F82BF8]);
    v89[0] = v84;
    v89[1] = v34;
    v82 = v34;
    v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:2];
    v39 = (void *)[v37 initWithArrangedSubviews:v38];

    [v39 setAxis:0];
    [v39 setSpacing:8.0];
    [v39 setAlignment:3];
    unint64_t v40 = [(WFAutomationListCollectionViewCell *)v4 contentView];
    v83 = v39;
    [v40 addSubview:v39];

    uint64_t v41 = [(WFAutomationListCollectionViewCell *)v4 contentView];
    v42 = [v41 layoutMarginsGuide];
    id v43 = (id)objc_msgSend(v39, "wf_addConstraintsToFillLayoutGuide:", v42);

    v44 = [v34 trailingAnchor];
    v45 = [(WFAutomationListCollectionViewCell *)v4 contentView];
    v46 = [v45 layoutMarginsGuide];
    v47 = [v46 trailingAnchor];
    id v48 = [v44 constraintEqualToAnchor:v47];
    [v48 setActive:1];

    v49 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v49;

    v51 = [(WFAutomationListCollectionViewCell *)v4 separatorView];
    [v51 setTranslatesAutoresizingMaskIntoConstraints:0];

    v52 = [MEMORY[0x263F825C8] separatorColor];
    v53 = [(WFAutomationListCollectionViewCell *)v4 separatorView];
    [v53 setBackgroundColor:v52];

    v54 = [(WFAutomationListCollectionViewCell *)v4 separatorView];
    v55 = [v54 heightAnchor];
    v56 = [(WFAutomationListCollectionViewCell *)v4 traitCollection];
    [v56 displayScale];
    uint64_t v58 = [v55 constraintEqualToConstant:1.0 / v57];
    separatorViewHeightConstraint = v4->_separatorViewHeightConstraint;
    v4->_separatorViewHeightConstraint = (NSLayoutConstraint *)v58;

    v60 = [(WFAutomationListCollectionViewCell *)v4 contentView];
    v61 = [(WFAutomationListCollectionViewCell *)v4 separatorView];
    [v60 addSubview:v61];

    v74 = (void *)MEMORY[0x263F08938];
    v81 = [(WFAutomationListCollectionViewCell *)v4 separatorView];
    v79 = [v81 leadingAnchor];
    v80 = [(WFAutomationListCollectionViewCell *)v4 contentView];
    v78 = [v80 layoutMarginsGuide];
    v77 = [v78 leadingAnchor];
    v76 = [v79 constraintEqualToAnchor:v77];
    v88[0] = v76;
    v75 = [(WFAutomationListCollectionViewCell *)v4 separatorView];
    v73 = [v75 trailingAnchor];
    v62 = [(WFAutomationListCollectionViewCell *)v4 contentView];
    v63 = [v62 trailingAnchor];
    v64 = [v73 constraintEqualToAnchor:v63];
    v88[1] = v64;
    v65 = [(WFAutomationListCollectionViewCell *)v4 separatorView];
    v66 = [v65 bottomAnchor];
    v67 = [(WFAutomationListCollectionViewCell *)v4 contentView];
    v68 = [v67 bottomAnchor];
    v69 = [v66 constraintEqualToAnchor:v68];
    v88[2] = v69;
    v88[3] = v4->_separatorViewHeightConstraint;
    v70 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:4];
    [v74 activateConstraints:v70];

    v71 = v4;
  }

  return v4;
}

- (void)setShowsSeparator:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(WFAutomationListCollectionViewCell *)self separatorView];
  [v4 setHidden:v3];
}

- (BOOL)showsSeparator
{
  v2 = [(WFAutomationListCollectionViewCell *)self separatorView];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

@end
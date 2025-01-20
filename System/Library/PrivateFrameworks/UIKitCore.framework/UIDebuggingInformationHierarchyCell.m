@interface UIDebuggingInformationHierarchyCell
- (BOOL)disclosureIndicatorHidden;
- (NSIndexPath)indexPath;
- (NSString)name;
- (UIButton)infoButton;
- (UIDebuggingInformationHierarchyCellDelegate)delegate;
- (void)applyLayoutAttributes:(id)a3;
- (void)deliverToggle;
- (void)displayDetailsForCell;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setDisclosureIndicatorHidden:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation UIDebuggingInformationHierarchyCell

- (void)layoutSubviews
{
  if (!self->_disclosureButton)
  {
    v3 = [UIButton alloc];
    [(UIView *)self bounds];
    v4 = -[UIButton initWithFrame:](v3, "initWithFrame:");
    [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [off_1E52D39B8 fontWithName:@"Menlo" size:12.0];
    v6 = [(UIButton *)v4 titleLabel];
    [v6 setFont:v5];

    v7 = [(UICollectionViewCell *)self contentView];
    [v7 addSubview:v4];

    v8 = [(UIView *)v4 leadingAnchor];
    v9 = [(UICollectionViewCell *)self contentView];
    v10 = [v9 leadingAnchor];
    v11 = [v8 constraintEqualToSystemSpacingAfterAnchor:v10 multiplier:1.0];
    [v11 setActive:1];

    v12 = [(UIView *)v4 widthAnchor];
    v13 = [v12 constraintEqualToConstant:10.0];
    [v13 setActive:1];

    v14 = [(UIView *)v4 topAnchor];
    v15 = [(UICollectionViewCell *)self contentView];
    v16 = [v15 topAnchor];
    v17 = [v14 constraintEqualToAnchor:v16];
    [v17 setActive:1];

    v18 = [(UIView *)v4 bottomAnchor];
    v19 = [(UICollectionViewCell *)self contentView];
    v20 = [v19 bottomAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    [(UIButton *)v4 setTitle:@"▶︎" forState:0];
    [(UIControl *)v4 addTarget:self action:sel_deliverToggle forControlEvents:64];
    v22 = +[UIColor blackColor];
    [(UIButton *)v4 setTitleColor:v22 forState:0];

    disclosureButton = self->_disclosureButton;
    self->_disclosureButton = v4;
  }
  if (self->_collapsedBeneath)
  {
    long long v24 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v78.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v78.c = v24;
    *(_OWORD *)&v78.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  else
  {
    CGAffineTransformMakeRotation(&v78, 1.57079633);
  }
  v25 = self->_disclosureButton;
  CGAffineTransform v77 = v78;
  [(UIView *)v25 setTransform:&v77];
  [(UIView *)self->_disclosureButton setHidden:self->_disclosureIndicatorHidden];
  if (!self->_infoButton)
  {
    v26 = [UIButton alloc];
    v27 = -[UIButton initWithFrame:](v26, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v28 = +[UIImage kitImageNamed:@"UIAccessoryButtonInfo"];
    [(UIButton *)v27 setImage:v28 forState:0];
    [(UIView *)v27 setTranslatesAutoresizingMaskIntoConstraints:0];
    v29 = [(UICollectionViewCell *)self contentView];
    [v29 addSubview:v27];

    v30 = [(UIView *)v27 trailingAnchor];
    v31 = [(UIView *)self trailingAnchor];
    v32 = [v30 constraintEqualToAnchor:v31 constant:-8.0];
    [v32 setActive:1];

    v33 = [(UIView *)v27 centerYAnchor];
    v34 = [(UICollectionViewCell *)self contentView];
    v35 = [v34 centerYAnchor];
    v36 = [v33 constraintEqualToAnchor:v35];
    [v36 setActive:1];

    v37 = [(UIView *)v27 heightAnchor];
    v38 = [v37 constraintEqualToConstant:24.0];
    [v38 setActive:1];

    v39 = [(UIView *)v27 widthAnchor];
    v40 = [v39 constraintEqualToConstant:24.0];
    [v40 setActive:1];

    [(UIControl *)v27 addTarget:self action:sel_displayDetailsForCell forControlEvents:64];
    infoButton = self->_infoButton;
    self->_infoButton = v27;
  }
  mainLabel = self->_mainLabel;
  if (!mainLabel)
  {
    v43 = [UILabel alloc];
    [(UIView *)self bounds];
    v44 = -[UILabel initWithFrame:](v43, "initWithFrame:");
    [(UIView *)v44 setTranslatesAutoresizingMaskIntoConstraints:0];
    v45 = [off_1E52D39B8 fontWithName:@"Menlo" size:12.0];
    [(UILabel *)v44 setFont:v45];

    v46 = [(UICollectionViewCell *)self contentView];
    [v46 addSubview:v44];

    v47 = [(UIView *)v44 leadingAnchor];
    v48 = [(UIView *)self->_disclosureButton trailingAnchor];
    v49 = [v47 constraintEqualToAnchor:v48 constant:3.0];
    disclosureButtonAvailableConstraint = self->_disclosureButtonAvailableConstraint;
    self->_disclosureButtonAvailableConstraint = v49;

    v51 = [(UIView *)v44 leadingAnchor];
    v52 = [(UIView *)self leadingAnchor];
    v53 = [v51 constraintEqualToAnchor:v52 constant:8.0];
    disclosureButtonUnavailableConstraint = self->_disclosureButtonUnavailableConstraint;
    self->_disclosureButtonUnavailableConstraint = v53;

    v55 = [(UIView *)v44 trailingAnchor];
    v56 = [(UIView *)self->_infoButton trailingAnchor];
    v57 = [v55 constraintEqualToAnchor:v56 constant:-3.0];
    [v57 setActive:1];

    v58 = [(UIView *)v44 topAnchor];
    v59 = [(UICollectionViewCell *)self contentView];
    v60 = [v59 topAnchor];
    v61 = [v58 constraintEqualToAnchor:v60];
    [v61 setActive:1];

    v62 = [(UIView *)v44 bottomAnchor];
    v63 = [(UICollectionViewCell *)self contentView];
    v64 = [v63 bottomAnchor];
    v65 = [v62 constraintEqualToAnchor:v64];
    [v65 setActive:1];

    v66 = self->_mainLabel;
    self->_mainLabel = v44;

    mainLabel = self->_mainLabel;
  }
  [(UILabel *)mainLabel setText:self->_name];
  v67 = +[UIColor colorWithWhite:0.9 alpha:1.0];
  [(UICollectionViewCell *)self setBackgroundColor:v67];

  id v68 = +[UIColor redColor];
  uint64_t v69 = [v68 CGColor];
  v70 = [(UIView *)self layer];
  [v70 setBorderColor:v69];

  if ([(UICollectionViewCell *)self isSelected]
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        int v72 = [WeakRetained shouldHighlightSelectedCells],
        WeakRetained,
        v72))
  {
    v73 = [(UIView *)self layer];
    v74 = v73;
    double v75 = 2.0;
  }
  else
  {
    v73 = [(UIView *)self layer];
    v74 = v73;
    double v75 = 0.0;
  }
  [v73 setBorderWidth:v75];

  [(NSLayoutConstraint *)self->_disclosureButtonUnavailableConstraint setActive:self->_disclosureIndicatorHidden];
  [(NSLayoutConstraint *)self->_disclosureButtonAvailableConstraint setActive:!self->_disclosureIndicatorHidden];
  v76 = [(UICollectionViewCell *)self contentView];
  [v76 bringSubviewToFront:self->_disclosureButton];
}

- (void)deliverToggle
{
  BOOL collapsedBeneath = self->_collapsedBeneath;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (collapsedBeneath) {
    [WeakRetained expandBeneathCell:self];
  }
  else {
    [WeakRetained collapseBeneathCell:self];
  }

  self->_collapsedBeneath ^= 1u;
  [(UIView *)self setNeedsLayout];
}

- (void)displayDetailsForCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained displayDetailsForCell:self];
}

- (UIButton)infoButton
{
  return self->_infoButton;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
  [(UIView *)self setNeedsLayout];
}

- (void)setDisclosureIndicatorHidden:(BOOL)a3
{
  self->_disclosureIndicatorHidden = a3;
  [(UIView *)self setNeedsLayout];
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)applyLayoutAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIDebuggingInformationHierarchyCell;
  id v4 = a3;
  [(UICollectionReusableView *)&v7 applyLayoutAttributes:v4];
  objc_msgSend(v4, "indexPath", v7.receiver, v7.super_class);
  v5 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();

  indexPath = self->_indexPath;
  self->_indexPath = v5;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)UIDebuggingInformationHierarchyCell;
  [(UICollectionViewCell *)&v5 prepareForReuse];
  [(UIView *)self->_mainLabel removeFromSuperview];
  mainLabel = self->_mainLabel;
  self->_mainLabel = 0;

  indexPath = self->_indexPath;
  self->_indexPath = 0;

  self->_disclosureIndicatorHidden = 0;
}

- (NSString)name
{
  return self->_name;
}

- (UIDebuggingInformationHierarchyCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIDebuggingInformationHierarchyCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)disclosureIndicatorHidden
{
  return self->_disclosureIndicatorHidden;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_disclosureButtonUnavailableConstraint, 0);
  objc_storeStrong((id *)&self->_disclosureButtonAvailableConstraint, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_mainLabel, 0);
  objc_storeStrong((id *)&self->_disclosureButton, 0);
}

@end
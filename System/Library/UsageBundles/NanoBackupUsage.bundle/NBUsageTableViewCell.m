@interface NBUsageTableViewCell
- (NBUsageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (NSLayoutConstraint)textBottomConstraint;
- (NSLayoutConstraint)textLeadingConstraint;
- (UILabel)detailTextLabel;
- (UILabel)sizeLabel;
- (UILabel)textLabel;
- (void)prepareForReuse;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4;
- (void)setDetailTextLabel:(id)a3;
- (void)setSizeLabel:(id)a3;
- (void)setTextBottomConstraint:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setTextLeadingConstraint:(id)a3;
- (void)updateConstraints;
@end

@implementation NBUsageTableViewCell

- (NBUsageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v86.receiver = self;
  v86.super_class = (Class)NBUsageTableViewCell;
  v9 = [(NBUsageTableViewCell *)&v86 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    [(NBUsageTableViewCell *)v9 setSpecifier:v8];
    id v85 = v8;
    id v11 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v15 = objc_msgSend(v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(NBUsageTableViewCell *)v10 setTextLabel:v15];

    v16 = [(NBUsageTableViewCell *)v10 textLabel];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    v17 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v18 = [(NBUsageTableViewCell *)v10 textLabel];
    [v18 setFont:v17];

    v19 = [(NBUsageTableViewCell *)v10 textLabel];
    LODWORD(v20) = 1148846080;
    [v19 setContentHuggingPriority:1 forAxis:v20];

    v21 = [(NBUsageTableViewCell *)v10 textLabel];
    LODWORD(v22) = 1148846080;
    [v21 setContentCompressionResistancePriority:1 forAxis:v22];

    v23 = [(NBUsageTableViewCell *)v10 contentView];
    v24 = [(NBUsageTableViewCell *)v10 textLabel];
    [v23 addSubview:v24];

    id v25 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(NBUsageTableViewCell *)v10 setDetailTextLabel:v25];

    v26 = [(NBUsageTableViewCell *)v10 detailTextLabel];
    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

    v27 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    v28 = [(NBUsageTableViewCell *)v10 detailTextLabel];
    [v28 setFont:v27];

    v29 = [(NBUsageTableViewCell *)v10 detailTextLabel];
    LODWORD(v30) = 1148846080;
    [v29 setContentHuggingPriority:1 forAxis:v30];

    v31 = [(NBUsageTableViewCell *)v10 detailTextLabel];
    LODWORD(v32) = 1148846080;
    [v31 setContentCompressionResistancePriority:1 forAxis:v32];

    v33 = [(NBUsageTableViewCell *)v10 contentView];
    v34 = [(NBUsageTableViewCell *)v10 detailTextLabel];
    [v33 addSubview:v34];

    id v35 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    [(NBUsageTableViewCell *)v10 setSizeLabel:v35];

    v36 = [(NBUsageTableViewCell *)v10 sizeLabel];
    [v36 setTranslatesAutoresizingMaskIntoConstraints:0];

    v37 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v38 = [(NBUsageTableViewCell *)v10 sizeLabel];
    [v38 setFont:v37];

    v39 = +[UIColor lightGrayColor];
    v40 = [(NBUsageTableViewCell *)v10 sizeLabel];
    [v40 setTextColor:v39];

    v41 = [(NBUsageTableViewCell *)v10 sizeLabel];
    LODWORD(v42) = 1148846080;
    [v41 setContentHuggingPriority:1 forAxis:v42];

    v43 = [(NBUsageTableViewCell *)v10 sizeLabel];
    LODWORD(v44) = 1148846080;
    [v43 setContentCompressionResistancePriority:1 forAxis:v44];

    v45 = [(NBUsageTableViewCell *)v10 sizeLabel];
    LODWORD(v46) = 1148846080;
    [v45 setContentCompressionResistancePriority:0 forAxis:v46];

    v47 = [(NBUsageTableViewCell *)v10 contentView];
    v48 = [(NBUsageTableViewCell *)v10 sizeLabel];
    [v47 addSubview:v48];

    v49 = [(NBUsageTableViewCell *)v10 contentView];
    v84 = +[NSLayoutConstraint constraintWithItem:v49 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:44.0];

    v50 = [(NBUsageTableViewCell *)v10 contentView];
    [v50 addConstraint:v84];

    v51 = [(NBUsageTableViewCell *)v10 textLabel];
    v52 = [(NBUsageTableViewCell *)v10 contentView];
    v83 = +[NSLayoutConstraint constraintWithItem:v51 attribute:3 relatedBy:1 toItem:v52 attribute:3 multiplier:1.0 constant:0.0];

    v53 = [(NBUsageTableViewCell *)v10 textLabel];
    v54 = [(NBUsageTableViewCell *)v10 contentView];
    uint64_t v55 = +[NSLayoutConstraint constraintWithItem:v53 attribute:5 relatedBy:0 toItem:v54 attribute:6 multiplier:1.0 constant:16.0];
    textLeadingConstraint = v10->_textLeadingConstraint;
    v10->_textLeadingConstraint = (NSLayoutConstraint *)v55;

    v57 = [(NBUsageTableViewCell *)v10 textLabel];
    v82 = +[NSLayoutConstraint constraintWithItem:v57 attribute:6 relatedBy:-1 toItem:v10->_sizeLabel attribute:5 multiplier:1.0 constant:-8.0];

    v58 = [(NBUsageTableViewCell *)v10 contentView];
    v89[0] = v83;
    v89[1] = v10->_textLeadingConstraint;
    v89[2] = v82;
    v59 = +[NSArray arrayWithObjects:v89 count:3];
    [v58 addConstraints:v59];

    v60 = [(NBUsageTableViewCell *)v10 detailTextLabel];
    v61 = [(NBUsageTableViewCell *)v10 textLabel];
    v81 = +[NSLayoutConstraint constraintWithItem:v60 attribute:3 relatedBy:0 toItem:v61 attribute:4 multiplier:1.0 constant:0.0];

    v62 = [(NBUsageTableViewCell *)v10 detailTextLabel];
    v63 = [(NBUsageTableViewCell *)v10 contentView];
    v64 = +[NSLayoutConstraint constraintWithItem:v62 attribute:4 relatedBy:-1 toItem:v63 attribute:4 multiplier:1.0 constant:0.0];

    v65 = [(NBUsageTableViewCell *)v10 detailTextLabel];
    v66 = [(NBUsageTableViewCell *)v10 textLabel];
    v67 = +[NSLayoutConstraint constraintWithItem:v65 attribute:5 relatedBy:0 toItem:v66 attribute:5 multiplier:1.0 constant:0.0];

    v68 = [(NBUsageTableViewCell *)v10 detailTextLabel];
    v69 = +[NSLayoutConstraint constraintWithItem:v68 attribute:6 relatedBy:-1 toItem:v10->_sizeLabel attribute:5 multiplier:1.0 constant:-8.0];

    v70 = [(NBUsageTableViewCell *)v10 contentView];
    v88[0] = v81;
    v88[1] = v64;
    v88[2] = v67;
    v88[3] = v69;
    v71 = +[NSArray arrayWithObjects:v88 count:4];
    [v70 addConstraints:v71];

    sizeLabel = v10->_sizeLabel;
    v73 = [(NBUsageTableViewCell *)v10 contentView];
    v74 = +[NSLayoutConstraint constraintWithItem:sizeLabel attribute:10 relatedBy:0 toItem:v73 attribute:10 multiplier:1.0 constant:0.0];

    v75 = v10->_sizeLabel;
    v76 = [(NBUsageTableViewCell *)v10 contentView];
    v77 = +[NSLayoutConstraint constraintWithItem:v75 attribute:6 relatedBy:0 toItem:v76 attribute:6 multiplier:1.0 constant:-8.0];

    v78 = [(NBUsageTableViewCell *)v10 contentView];
    v87[0] = v74;
    v87[1] = v77;
    v79 = +[NSArray arrayWithObjects:v87 count:2];
    [v78 addConstraints:v79];

    id v8 = v85;
  }

  return v10;
}

- (void)updateConstraints
{
  textBottomConstraint = self->_textBottomConstraint;
  if (textBottomConstraint)
  {
    [(NSLayoutConstraint *)textBottomConstraint setActive:0];
    v4 = self->_textBottomConstraint;
    self->_textBottomConstraint = 0;
  }
  v5 = [(NBUsageTableViewCell *)self detailTextLabel];
  v6 = [v5 text];
  if ([v6 length]) {
    uint64_t v7 = 11;
  }
  else {
    uint64_t v7 = 10;
  }

  id v8 = [(NBUsageTableViewCell *)self textLabel];
  v9 = [(NBUsageTableViewCell *)self contentView];
  v10 = +[NSLayoutConstraint constraintWithItem:v8 attribute:v7 relatedBy:0 toItem:v9 attribute:10 multiplier:1.0 constant:0.0];
  id v11 = self->_textBottomConstraint;
  self->_textBottomConstraint = v10;

  [(NSLayoutConstraint *)self->_textBottomConstraint setActive:1];
  textLeadingConstraint = self->_textLeadingConstraint;
  if (textLeadingConstraint)
  {
    [(NSLayoutConstraint *)textLeadingConstraint setActive:0];
    v13 = self->_textLeadingConstraint;
    self->_textLeadingConstraint = 0;
  }
  v14 = [(NBUsageTableViewCell *)self textLabel];
  id v15 = [(NBUsageTableViewCell *)self contentView];
  v16 = +[NSLayoutConstraint constraintWithItem:v14 attribute:5 relatedBy:0 toItem:v15 attribute:5 multiplier:1.0 constant:16.0];
  v17 = self->_textLeadingConstraint;
  self->_textLeadingConstraint = v16;

  [(NSLayoutConstraint *)self->_textLeadingConstraint setActive:1];
  v18.receiver = self;
  v18.super_class = (Class)NBUsageTableViewCell;
  [(NBUsageTableViewCell *)&v18 updateConstraints];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)NBUsageTableViewCell;
  [(NBUsageTableViewCell *)&v5 prepareForReuse];
  v3 = [(NBUsageTableViewCell *)self textLabel];
  [v3 setText:0];

  v4 = [(NBUsageTableViewCell *)self detailTextLabel];
  [v4 setText:0];

  [(UILabel *)self->_sizeLabel setText:0];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
}

- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  [(NBUsageTableViewCell *)self setSpecifier:v5];
  id v33 = [v5 propertyForKey:@"NBBackup"];
  v6 = [(NBUsageTableViewCell *)self specifier];
  uint64_t v7 = *(void *)&v6[OBJC_IVAR___PSSpecifier_getter];

  id v8 = [(NBUsageTableViewCell *)self specifier];
  id WeakRetained = objc_loadWeakRetained((id *)&v8[OBJC_IVAR___PSSpecifier_target]);
  v10 = (void (*)(id, uint64_t, void *))[WeakRetained methodForSelector:v7];

  id v11 = [(NBUsageTableViewCell *)self specifier];
  id v12 = objc_loadWeakRetained((id *)&v11[OBJC_IVAR___PSSpecifier_target]);
  v13 = [(NBUsageTableViewCell *)self specifier];
  uint64_t v14 = *(void *)&v13[OBJC_IVAR___PSSpecifier_getter];
  id v15 = [(NBUsageTableViewCell *)self specifier];
  v16 = v10(v12, v14, v15);

  v17 = [v33 name];
  objc_super v18 = [(NBUsageTableViewCell *)self textLabel];
  [v18 setText:v17];

  v19 = [v33 productType];
  double v20 = BPSLocalizedVariantSizeForProductType();

  v21 = [v33 topEnclosureMaterial];
  [v21 integerValue];

  BPSPBMaterialForMGMaterial();
  double v22 = BPSLocalizedNameForMaterial();
  id v23 = objc_alloc_init((Class)NSDateFormatter);
  [v23 setTimeStyle:0];
  [v23 setDateStyle:1];
  v24 = [v33 lastModificationDate];
  id v25 = [v23 stringFromDate:v24];

  v26 = +[NSBundle bundleForClass:objc_opt_class()];
  v27 = [v26 localizedStringForKey:@"DESCRIPTION_FORMAT_%@_%@_%@" value:&stru_8480 table:@"Localization"];
  v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v20, v22, v25);
  v29 = [(NBUsageTableViewCell *)self detailTextLabel];
  [v29 setText:v28];

  double v30 = +[UIColor colorWithRed:0.556862745 green:0.556862745 blue:0.576470588 alpha:1.0];
  v31 = [(NBUsageTableViewCell *)self detailTextLabel];
  [v31 setTextColor:v30];

  id v32 = +[UIColor systemGrayColor];
  [(UILabel *)self->_sizeLabel setText:v16];
  [(NBUsageTableViewCell *)self setAccessoryType:0];
  [(NBUsageTableViewCell *)self setSelectionStyle:0];
  [(NBUsageTableViewCell *)self setNeedsUpdateConstraints];
}

- (UILabel)textLabel
{
  return self->textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (UILabel)detailTextLabel
{
  return self->detailTextLabel;
}

- (void)setDetailTextLabel:(id)a3
{
}

- (UILabel)sizeLabel
{
  return self->_sizeLabel;
}

- (void)setSizeLabel:(id)a3
{
}

- (NSLayoutConstraint)textBottomConstraint
{
  return self->_textBottomConstraint;
}

- (void)setTextBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)textLeadingConstraint
{
  return self->_textLeadingConstraint;
}

- (void)setTextLeadingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_textBottomConstraint, 0);
  objc_storeStrong((id *)&self->_sizeLabel, 0);
  objc_storeStrong((id *)&self->detailTextLabel, 0);

  objc_storeStrong((id *)&self->textLabel, 0);
}

@end
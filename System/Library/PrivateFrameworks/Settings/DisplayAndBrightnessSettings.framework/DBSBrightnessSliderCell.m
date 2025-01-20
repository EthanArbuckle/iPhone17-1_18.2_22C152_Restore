@interface DBSBrightnessSliderCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (DBSBrightnessSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (NSMutableArray)controlAndWarningLayoutConstraints;
- (UILabel)referenceWarningLabel;
- (UIView)warningContainerView;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setControlAndWarningLayoutConstraints:(id)a3;
- (void)setReferenceWarningLabel:(id)a3;
- (void)setWarningContainerView:(id)a3;
@end

@implementation DBSBrightnessSliderCell

- (DBSBrightnessSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)DBSBrightnessSliderCell;
  v5 = [(PSSliderTableCell *)&v9 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    controlAndWarningLayoutConstraints = v5->_controlAndWarningLayoutConstraints;
    v5->_controlAndWarningLayoutConstraints = (NSMutableArray *)v6;
  }
  return v5;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v99[4] = *MEMORY[0x263EF8340];
  v97.receiver = self;
  v97.super_class = (Class)DBSBrightnessSliderCell;
  [(PSSliderTableCell *)&v97 refreshCellContentsWithSpecifier:a3];
  v4 = (void *)MEMORY[0x263F08938];
  v5 = [(DBSBrightnessSliderCell *)self controlAndWarningLayoutConstraints];
  [v4 deactivateConstraints:v5];

  uint64_t v6 = [(DBSBrightnessSliderCell *)self controlAndWarningLayoutConstraints];
  [v6 removeAllObjects];

  v7 = [(DBSBrightnessSliderCell *)self warningContainerView];
  [v7 removeFromSuperview];

  [(DBSBrightnessSliderCell *)self setWarningContainerView:0];
  [(DBSBrightnessSliderCell *)self setReferenceWarningLabel:0];
  v8 = [(PSTableCell *)self specifier];
  objc_super v9 = [v8 objectForKeyedSubscript:@"brightnessLimited"];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    v96 = [MEMORY[0x263F827E8] systemImageNamed:@"exclamationmark.triangle.fill"];
    v11 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v96];
    v12 = [MEMORY[0x263F825C8] systemYellowColor];
    [v11 setTintColor:v12];

    v13 = [(DBSBrightnessSliderCell *)self textLabel];
    uint64_t v14 = [v13 font];

    id v15 = objc_alloc_init(MEMORY[0x263F828E0]);
    v94 = (void *)v14;
    [v15 setFont:v14];
    v16 = DBS_LocalizedStringForDisplays(@"REFERENCE_WARNING");
    [v15 setText:v16];

    v17 = [MEMORY[0x263F5FBC0] appearance];
    v18 = [v17 altTextColor];
    v19 = [(DBSBrightnessSliderCell *)self _accessibilityHigherContrastTintColorForColor:v18];
    [v15 setTextColor:v19];

    [v15 setNumberOfLines:0];
    [v15 setLineBreakMode:0];
    v20 = objc_opt_new();
    [v20 addSubview:v11];
    [v20 addSubview:v15];
    v21 = [(DBSBrightnessSliderCell *)self contentView];
    [v21 addSubview:v20];

    v22 = [(PSControlTableCell *)self control];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [(DBSBrightnessSliderCell *)self controlAndWarningLayoutConstraints];
    v24 = (void *)MEMORY[0x263F08938];
    v25 = _NSDictionaryOfVariableBindings(&cfstr_Warningsymboli.isa, v11, v15, 0);
    v26 = [v24 constraintsWithVisualFormat:@"H:|-0-[warningSymbolImageView]-10-[referenceWarningLabel]-0-|" options:0 metrics:0 views:v25];
    [v23 addObjectsFromArray:v26];

    v27 = [(DBSBrightnessSliderCell *)self controlAndWarningLayoutConstraints];
    v28 = (void *)MEMORY[0x263F08938];
    id v89 = v15;
    v29 = _NSDictionaryOfVariableBindings(&cfstr_Referencewarni.isa, v15, 0);
    v30 = [v28 constraintsWithVisualFormat:@"V:|-0-[referenceWarningLabel]-0-|" options:0 metrics:0 views:v29];
    [v27 addObjectsFromArray:v30];

    v31 = [(DBSBrightnessSliderCell *)self controlAndWarningLayoutConstraints];
    v32 = (void *)MEMORY[0x263F08938];
    v33 = _NSDictionaryOfVariableBindings(&cfstr_ControlWarning.isa, v22, v20, 0);
    v34 = [v32 constraintsWithVisualFormat:@"V:|-8-[control]-0-[warningContainerView]-8-|" options:0 metrics:0 views:v33];
    [v31 addObjectsFromArray:v34];

    v35 = [(DBSBrightnessSliderCell *)self controlAndWarningLayoutConstraints];
    v36 = (void *)MEMORY[0x263F08938];
    v93 = v22;
    v87 = v20;
    v37 = _NSDictionaryOfVariableBindings(&cfstr_Warningcontain.isa, v20, v22, 0);
    v38 = [v36 constraintsWithVisualFormat:@"H:[warningContainerView(<=control)]" options:0 metrics:0 views:v37];
    [v35 addObjectsFromArray:v38];

    v91 = [(DBSBrightnessSliderCell *)self controlAndWarningLayoutConstraints];
    v85 = [(PSControlTableCell *)self control];
    v81 = [v85 leadingAnchor];
    v83 = [(DBSBrightnessSliderCell *)self contentView];
    v79 = [v83 layoutMarginsGuide];
    v77 = [v79 leadingAnchor];
    v75 = [v81 constraintEqualToAnchor:v77];
    v99[0] = v75;
    v73 = [(DBSBrightnessSliderCell *)self contentView];
    v72 = [v73 layoutMarginsGuide];
    v70 = [v72 trailingAnchor];
    v71 = [(PSControlTableCell *)self control];
    v69 = [v71 trailingAnchor];
    v68 = [v70 constraintEqualToAnchor:v69];
    v99[1] = v68;
    v39 = [(DBSBrightnessSliderCell *)self contentView];
    v40 = [v39 layoutMarginsGuide];
    v41 = [v40 centerXAnchor];
    v42 = [v20 centerXAnchor];
    v43 = [v41 constraintEqualToAnchor:v42];
    v99[2] = v43;
    v44 = [v15 centerYAnchor];
    v95 = v11;
    v45 = [v11 centerYAnchor];
    v46 = [v44 constraintEqualToAnchor:v45];
    v99[3] = v46;
    v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v99 count:4];
    [v91 addObjectsFromArray:v47];

    v48 = (void *)MEMORY[0x263F08938];
    v49 = [(DBSBrightnessSliderCell *)self controlAndWarningLayoutConstraints];
    v50 = v48;
    v51 = v89;
    [v50 activateConstraints:v49];

    [(DBSBrightnessSliderCell *)self setReferenceWarningLabel:v89];
    v52 = self;
    v53 = v87;
    [(DBSBrightnessSliderCell *)v52 setWarningContainerView:v87];
  }
  else
  {
    v54 = [(PSControlTableCell *)self control];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return;
    }
    v56 = [(PSControlTableCell *)self control];
    [v56 setTranslatesAutoresizingMaskIntoConstraints:0];

    v84 = (void *)MEMORY[0x263F08938];
    v96 = [(PSControlTableCell *)self control];
    v57 = [v96 leadingAnchor];
    v94 = [(DBSBrightnessSliderCell *)self contentView];
    v90 = [v94 layoutMarginsGuide];
    uint64_t v88 = [v90 leadingAnchor];
    v95 = v57;
    v93 = [v57 constraintEqualToAnchor:v88];
    v98[0] = v93;
    v92 = [(DBSBrightnessSliderCell *)self contentView];
    v86 = [v92 layoutMarginsGuide];
    v80 = [v86 trailingAnchor];
    v82 = [(PSControlTableCell *)self control];
    v78 = [v82 trailingAnchor];
    v76 = [v80 constraintEqualToAnchor:v78];
    v98[1] = v76;
    v74 = [(PSControlTableCell *)self control];
    v58 = [v74 topAnchor];
    v59 = [(DBSBrightnessSliderCell *)self contentView];
    v60 = [v59 topAnchor];
    v61 = [v58 constraintLessThanOrEqualToSystemSpacingBelowAnchor:v60 multiplier:1.0];
    v98[2] = v61;
    v62 = [(DBSBrightnessSliderCell *)self contentView];
    v63 = [v62 bottomAnchor];
    v64 = [(PSControlTableCell *)self control];
    v65 = [v64 bottomAnchor];
    v66 = [v63 constraintLessThanOrEqualToSystemSpacingBelowAnchor:v65 multiplier:1.0];
    v98[3] = v66;
    v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:4];
    [v84 activateConstraints:v67];

    v53 = (void *)v88;
    v51 = v90;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v14.receiver = self;
  v14.super_class = (Class)DBSBrightnessSliderCell;
  -[DBSBrightnessSliderCell sizeThatFits:](&v14, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  v8 = [(PSTableCell *)self specifier];
  objc_super v9 = [v8 objectForKeyedSubscript:@"brightnessLimited"];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    [(UILabel *)self->_referenceWarningLabel intrinsicContentSize];
    double v7 = v7 + v11 + 16.0;
  }
  double v12 = v5;
  double v13 = v7;
  result.height = v13;
  result.width = v12;
  return result;
}

- (NSMutableArray)controlAndWarningLayoutConstraints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setControlAndWarningLayoutConstraints:(id)a3
{
}

- (UILabel)referenceWarningLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setReferenceWarningLabel:(id)a3
{
}

- (UIView)warningContainerView
{
  return (UIView *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setWarningContainerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warningContainerView, 0);
  objc_storeStrong((id *)&self->_referenceWarningLabel, 0);
  objc_storeStrong((id *)&self->_controlAndWarningLayoutConstraints, 0);
}

@end
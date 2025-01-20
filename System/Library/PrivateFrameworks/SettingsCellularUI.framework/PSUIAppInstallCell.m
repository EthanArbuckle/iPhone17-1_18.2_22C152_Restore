@interface PSUIAppInstallCell
+ (id)specifierForAppWithDescription:(id)a3 target:(id)a4 action:(SEL)a5;
- (NSLayoutConstraint)availableConstraint;
- (NSLayoutConstraint)installButtonHeightConstraint;
- (NSLayoutConstraint)installButtonWidthConstraint;
- (NSLayoutConstraint)installedConstraint;
- (NSLayoutConstraint)labelPaddingBottom;
- (NSLayoutConstraint)labelPaddingTop;
- (NSMutableArray)constraints;
- (PSUIAppInstallCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (SUUIItemOfferButton)installButton;
- (UIImageView)iconView;
- (UILabel)installedLabel;
- (UILabel)nameLabel;
- (UILabel)publisherLabel;
- (UIView)labelContainerView;
- (id)getLogger;
- (int)installState;
- (void)_updateCellWithInstallState;
- (void)layoutSubviews;
- (void)setAvailableConstraint:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setIconView:(id)a3;
- (void)setInstallButton:(id)a3;
- (void)setInstallButtonHeightConstraint:(id)a3;
- (void)setInstallButtonWidthConstraint:(id)a3;
- (void)setInstallState:(int)a3;
- (void)setInstalledConstraint:(id)a3;
- (void)setInstalledLabel:(id)a3;
- (void)setLabelContainerView:(id)a3;
- (void)setLabelPaddingBottom:(id)a3;
- (void)setLabelPaddingTop:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setPublisherLabel:(id)a3;
- (void)updateConstraints;
@end

@implementation PSUIAppInstallCell

+ (id)specifierForAppWithDescription:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v7 = a3;
  id v8 = a4;
  SEL v22 = a5;
  if (MobileStoreUILibraryCore_0())
  {
    v9 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:4 edit:0];
    v10 = [NSNumber numberWithDouble:*MEMORY[0x263F839B8]];
    [v9 setProperty:v10 forKey:*MEMORY[0x263F602A8]];

    [v9 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    v11 = [v7 icon];
    [v9 setProperty:v11 forKey:@"PSUIAppIcon"];

    v12 = [v7 name];
    [v9 setProperty:v12 forKey:@"PSUIAppName"];

    v13 = [v7 publisher];
    [v9 setProperty:v13 forKey:@"PSUIAppPublisher"];

    [v9 setProperty:v8 forKey:@"PSUIAppButtonTarget"];
    v14 = [MEMORY[0x263F08D40] valueWithBytes:&v22 objCType:":"];
    [v9 setProperty:v14 forKey:@"PSUIAppButtonAction"];

    [v9 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
    if ([v7 installed])
    {
      uint64_t v15 = MEMORY[0x263EFFA88];
      v16 = v9;
    }
    else
    {
      v16 = v9;
      uint64_t v15 = 0;
    }
    [v16 setProperty:v15 forKey:@"PSUIAppInstalled"];
    v18 = [v7 installedLabel];

    if (v18)
    {
      v17 = [v7 installedLabel];
      [v9 setProperty:v17 forKey:@"PSUIAppInstalledLabel"];
    }
    else
    {
      v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = [v17 localizedStringForKey:@"INSTALLED" value:&stru_26D410CA0 table:@"AppInstallCell"];
      [v9 setProperty:v19 forKey:@"PSUIAppInstalledLabel"];
    }
  }
  else
  {
    v17 = [MEMORY[0x263F67EB0] loggerWithCategory:@"AppInstallCell"];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v17, OS_LOG_TYPE_DEFAULT, "MobileStoreUI Framework not available. Will not return AppInstallCell.", buf, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (PSUIAppInstallCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a4;
  v117.receiver = self;
  v117.super_class = (Class)PSUIAppInstallCell;
  id v116 = a5;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v117, sel_initWithStyle_reuseIdentifier_specifier_, a3, v8);
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x263F82828]);
    v11 = [v116 propertyForKey:@"PSUIAppIcon"];
    uint64_t v12 = [v10 initWithImage:v11];
    iconView = v9->_iconView;
    v9->_iconView = (UIImageView *)v12;

    [(UIImageView *)v9->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v14) = 1144766464;
    [(UIImageView *)v9->_iconView setContentCompressionResistancePriority:0 forAxis:v14];
    uint64_t v15 = [(PSUIAppInstallCell *)v9 contentView];
    [v15 addSubview:v9->_iconView];

    v16 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    nameLabel = v9->_nameLabel;
    v9->_nameLabel = v16;

    v18 = [v116 propertyForKey:@"PSUIAppName"];
    [(UILabel *)v9->_nameLabel setText:v18];

    v19 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
    [(UILabel *)v9->_nameLabel setFont:v19];

    [(UILabel *)v9->_nameLabel setOpaque:0];
    [(UILabel *)v9->_nameLabel setBackgroundColor:0];
    [(UILabel *)v9->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v20) = 1148846080;
    [(UILabel *)v9->_nameLabel setContentHuggingPriority:1 forAxis:v20];
    v21 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    publisherLabel = v9->_publisherLabel;
    v9->_publisherLabel = v21;

    v23 = [v116 propertyForKey:@"PSUIAppPublisher"];
    [(UILabel *)v9->_publisherLabel setText:v23];

    uint64_t v24 = *MEMORY[0x263F835B8];
    v25 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
    [(UILabel *)v9->_publisherLabel setFont:v25];

    [(UILabel *)v9->_publisherLabel setOpaque:0];
    [(UILabel *)v9->_publisherLabel setBackgroundColor:0];
    [(UILabel *)v9->_publisherLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v26) = 1148846080;
    [(UILabel *)v9->_publisherLabel setContentHuggingPriority:1 forAxis:v26];
    v27 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    installedLabel = v9->_installedLabel;
    v9->_installedLabel = v27;

    v29 = [v116 propertyForKey:@"PSUIAppInstalledLabel"];
    [(UILabel *)v9->_installedLabel setText:v29];

    v30 = [MEMORY[0x263F81708] preferredFontForTextStyle:v24];
    [(UILabel *)v9->_installedLabel setFont:v30];

    [(UILabel *)v9->_installedLabel setOpaque:0];
    [(UILabel *)v9->_installedLabel setBackgroundColor:0];
    [(UILabel *)v9->_installedLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v31) = 1148846080;
    [(UILabel *)v9->_installedLabel setContentHuggingPriority:1 forAxis:v31];
    v32 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    labelContainerView = v9->_labelContainerView;
    v9->_labelContainerView = v32;

    [(UIView *)v9->_labelContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v9->_labelContainerView addSubview:v9->_nameLabel];
    [(UIView *)v9->_labelContainerView addSubview:v9->_publisherLabel];
    [(UIView *)v9->_labelContainerView addSubview:v9->_installedLabel];
    LODWORD(v34) = 1148846080;
    [(UIView *)v9->_labelContainerView setContentHuggingPriority:1 forAxis:v34];
    v35 = [(PSUIAppInstallCell *)v9 contentView];
    [v35 addSubview:v9->_labelContainerView];

    uint64_t v119 = 0;
    v120 = &v119;
    uint64_t v121 = 0x2050000000;
    v36 = (void *)getSUUIItemOfferButtonClass_softClass;
    uint64_t v122 = getSUUIItemOfferButtonClass_softClass;
    if (!getSUUIItemOfferButtonClass_softClass)
    {
      v118[0] = MEMORY[0x263EF8330];
      v118[1] = 3221225472;
      v118[2] = __getSUUIItemOfferButtonClass_block_invoke;
      v118[3] = &unk_2645E0D98;
      v118[4] = &v119;
      __getSUUIItemOfferButtonClass_block_invoke((uint64_t)v118);
      v36 = (void *)v120[3];
    }
    v37 = v36;
    _Block_object_dispose(&v119, 8);
    v38 = (SUUIItemOfferButton *)objc_alloc_init(v37);
    installButton = v9->_installButton;
    v9->_installButton = v38;

    v40 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v41 = [v40 localizedStringForKey:@"OPEN" value:&stru_26D410CA0 table:@"AppInstallCell"];
    [(SUUIItemOfferButton *)v9->_installButton setTitle:v41];

    [(SUUIItemOfferButton *)v9->_installButton setEnabled:1];
    [(SUUIItemOfferButton *)v9->_installButton setAlpha:1.0];
    LODWORD(v42) = -0.5;
    [(SUUIItemOfferButton *)v9->_installButton setCharge:v42];
    v43 = [MEMORY[0x263F825C8] clearColor];
    [(SUUIItemOfferButton *)v9->_installButton setBackgroundColor:v43];

    [(SUUIItemOfferButton *)v9->_installButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v44 = [(PSUIAppInstallCell *)v9 contentView];
    [v44 addSubview:v9->_installButton];

    v118[0] = 0;
    v45 = [v116 propertyForKey:@"PSUIAppButtonAction"];
    [v45 getValue:v118];

    v46 = v9->_installButton;
    v47 = [v116 propertyForKey:@"PSUIAppButtonTarget"];
    [(SUUIItemOfferButton *)v46 addTarget:v47 action:v118[0] forControlEvents:64];

    uint64_t v48 = [MEMORY[0x263EFF980] array];
    constraints = v9->_constraints;
    v9->_constraints = (NSMutableArray *)v48;

    uint64_t v50 = _NSDictionaryOfVariableBindings(&cfstr_IconviewNamela.isa, v9->_iconView, v9->_nameLabel, v9->_publisherLabel, v9->_installedLabel, v9->_labelContainerView, v9->_installButton, 0);
    v51 = v9->_constraints;
    v115 = (void *)v50;
    uint64_t v52 = v50;
    v53 = objc_msgSend(MEMORY[0x263F08938], "constraintsWithVisualFormat:options:metrics:views:", @"H:|-15-[_iconView]-8-[_labelContainerView]-(>=10)-[_installButton]-12-|", 0, 0);
    [(NSMutableArray *)v51 addObjectsFromArray:v53];

    v54 = v9->_constraints;
    v55 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[_nameLabel]-2-[_publisherLabel]-3-[_installedLabel]" options:0 metrics:0 views:v52];
    [(NSMutableArray *)v54 addObjectsFromArray:v55];

    v56 = [(UIImageView *)v9->_iconView widthAnchor];
    v57 = [(UIImageView *)v9->_iconView heightAnchor];
    v58 = [v56 constraintEqualToAnchor:v57 multiplier:1.0];
    [v58 setActive:1];

    v59 = [(UILabel *)v9->_installedLabel bottomAnchor];
    v60 = [(UIView *)v9->_labelContainerView bottomAnchor];
    uint64_t v61 = [v59 constraintEqualToAnchor:v60];
    installedConstraint = v9->_installedConstraint;
    v9->_installedConstraint = (NSLayoutConstraint *)v61;

    [(NSLayoutConstraint *)v9->_installedConstraint setActive:1];
    v63 = [(UILabel *)v9->_publisherLabel bottomAnchor];
    v64 = [(UIView *)v9->_labelContainerView bottomAnchor];
    uint64_t v65 = [v63 constraintEqualToAnchor:v64];
    availableConstraint = v9->_availableConstraint;
    v9->_availableConstraint = (NSLayoutConstraint *)v65;

    [(NSLayoutConstraint *)v9->_availableConstraint setActive:0];
    v67 = [(UIImageView *)v9->_iconView centerYAnchor];
    v68 = [(PSUIAppInstallCell *)v9 contentView];
    v69 = [v68 centerYAnchor];
    v70 = [v67 constraintEqualToAnchor:v69];
    [v70 setActive:1];

    v71 = [(UIView *)v9->_labelContainerView centerYAnchor];
    v72 = [(PSUIAppInstallCell *)v9 contentView];
    v73 = [v72 centerYAnchor];
    v74 = [v71 constraintEqualToAnchor:v73];
    [v74 setActive:1];

    v75 = [(SUUIItemOfferButton *)v9->_installButton centerYAnchor];
    v76 = [(PSUIAppInstallCell *)v9 contentView];
    v77 = [v76 centerYAnchor];
    v78 = [v75 constraintEqualToAnchor:v77];
    [v78 setActive:1];

    v79 = [(UIView *)v9->_labelContainerView leadingAnchor];
    v80 = [(UILabel *)v9->_nameLabel leadingAnchor];
    v81 = [v79 constraintEqualToAnchor:v80];
    [v81 setActive:1];

    v82 = [(UIView *)v9->_labelContainerView leadingAnchor];
    v83 = [(UILabel *)v9->_publisherLabel leadingAnchor];
    v84 = [v82 constraintEqualToAnchor:v83];
    [v84 setActive:1];

    v85 = [(UIView *)v9->_labelContainerView leadingAnchor];
    v86 = [(UILabel *)v9->_installedLabel leadingAnchor];
    v87 = [v85 constraintEqualToAnchor:v86];
    [v87 setActive:1];

    v88 = [(UIView *)v9->_labelContainerView trailingAnchor];
    v89 = [(UILabel *)v9->_nameLabel trailingAnchor];
    v90 = [v88 constraintGreaterThanOrEqualToAnchor:v89];
    [v90 setActive:1];

    v91 = [(UIView *)v9->_labelContainerView trailingAnchor];
    v92 = [(UILabel *)v9->_publisherLabel trailingAnchor];
    v93 = [v91 constraintGreaterThanOrEqualToAnchor:v92];
    [v93 setActive:1];

    v94 = [(UIView *)v9->_labelContainerView trailingAnchor];
    v95 = [(UILabel *)v9->_installedLabel trailingAnchor];
    v96 = [v94 constraintGreaterThanOrEqualToAnchor:v95];
    [v96 setActive:1];

    v97 = [(UIView *)v9->_labelContainerView topAnchor];
    v98 = [(PSUIAppInstallCell *)v9 contentView];
    v99 = [v98 topAnchor];
    uint64_t v100 = [v97 constraintGreaterThanOrEqualToAnchor:v99 constant:15.0];
    labelPaddingTop = v9->_labelPaddingTop;
    v9->_labelPaddingTop = (NSLayoutConstraint *)v100;

    [(NSLayoutConstraint *)v9->_labelPaddingTop setActive:1];
    v102 = [(UIView *)v9->_labelContainerView bottomAnchor];
    v103 = [(PSUIAppInstallCell *)v9 contentView];
    v104 = [v103 bottomAnchor];
    uint64_t v105 = [v102 constraintGreaterThanOrEqualToAnchor:v104 constant:-15.0];
    labelPaddingBottom = v9->_labelPaddingBottom;
    v9->_labelPaddingBottom = (NSLayoutConstraint *)v105;

    [(NSLayoutConstraint *)v9->_labelPaddingBottom setActive:1];
    v107 = [(SUUIItemOfferButton *)v9->_installButton widthAnchor];
    uint64_t v108 = [v107 constraintEqualToConstant:59.0];
    installButtonWidthConstraint = v9->_installButtonWidthConstraint;
    v9->_installButtonWidthConstraint = (NSLayoutConstraint *)v108;

    v110 = [(SUUIItemOfferButton *)v9->_installButton heightAnchor];
    uint64_t v111 = [v110 constraintEqualToConstant:26.0];
    installButtonHeightConstraint = v9->_installButtonHeightConstraint;
    v9->_installButtonHeightConstraint = (NSLayoutConstraint *)v111;

    [MEMORY[0x263F08938] activateConstraints:v9->_constraints];
    v113 = [v116 propertyForKey:@"PSUIAppInstalled"];

    v9->_installState = v113 != 0;
    [(PSUIAppInstallCell *)v9 _updateCellWithInstallState];
  }
  return v9;
}

- (void)setInstallState:(int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5 = [(PSUIAppInstallCell *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[PSUIAppInstallCell setInstallState:]";
    __int16 v8 = 1024;
    int v9 = a3;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s setting app install state to %i", (uint8_t *)&v6, 0x12u);
  }

  self->_installState = a3;
  [(PSUIAppInstallCell *)self setNeedsUpdateConstraints];
  [(PSUIAppInstallCell *)self setNeedsLayout];
}

- (void)updateConstraints
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(PSUIAppInstallCell *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[PSUIAppInstallCell updateConstraints]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = &OBJC_IVAR___PSUIAppInstallCell__installedConstraint;
  int installState = self->_installState;
  if (!installState)
  {
    int v6 = &OBJC_IVAR___PSUIAppInstallCell__availableConstraint;
    double v7 = -21.0;
    double v8 = 21.0;
    goto LABEL_7;
  }
  if (installState == 1)
  {
    int v6 = &OBJC_IVAR___PSUIAppInstallCell__installedConstraint;
    v4 = &OBJC_IVAR___PSUIAppInstallCell__availableConstraint;
    double v7 = -15.0;
    double v8 = 15.0;
LABEL_7:
    [(NSLayoutConstraint *)self->_labelPaddingTop setConstant:v8];
    [(NSLayoutConstraint *)self->_labelPaddingBottom setConstant:v7];
    [*(id *)((char *)&self->super.super.super.super.super.isa + *v4) setActive:0];
    [*(id *)((char *)&self->super.super.super.super.super.isa + *v6) setActive:1];
  }
  v9.receiver = self;
  v9.super_class = (Class)PSUIAppInstallCell;
  [(PSUIAppInstallCell *)&v9 updateConstraints];
}

- (void)layoutSubviews
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = [(PSUIAppInstallCell *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v8 = "-[PSUIAppInstallCell layoutSubviews]";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)PSUIAppInstallCell;
  [(PSTableCell *)&v6 layoutSubviews];
  [(PSUIAppInstallCell *)self _updateCellWithInstallState];
  if (![(NSLayoutConstraint *)self->_installButtonWidthConstraint isActive])
  {
    [(SUUIItemOfferButton *)self->_installButton sizeToFit];
    [(SUUIItemOfferButton *)self->_installButton bounds];
    [(NSLayoutConstraint *)self->_installButtonWidthConstraint setConstant:v4];
    [(SUUIItemOfferButton *)self->_installButton bounds];
    [(NSLayoutConstraint *)self->_installButtonHeightConstraint setConstant:v5];
    [(NSLayoutConstraint *)self->_installButtonWidthConstraint setActive:1];
    [(NSLayoutConstraint *)self->_installButtonHeightConstraint setActive:1];
  }
}

- (void)_updateCellWithInstallState
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [(PSUIAppInstallCell *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int installState = self->_installState;
    int v9 = 136315394;
    uint64_t v10 = "-[PSUIAppInstallCell _updateCellWithInstallState]";
    __int16 v11 = 1024;
    int v12 = installState;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s updating UI view state with install state %i", (uint8_t *)&v9, 0x12u);
  }

  int v5 = self->_installState;
  if (v5 == 1)
  {
    objc_super v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v7 = [v6 localizedStringForKey:@"OPEN" value:&stru_26D410CA0 table:@"AppInstallCell"];
    uint64_t v8 = 0;
  }
  else
  {
    if (v5) {
      return;
    }
    objc_super v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v7 = [v6 localizedStringForKey:@"INSTALL" value:&stru_26D410CA0 table:@"AppInstallCell"];
    uint64_t v8 = 1;
  }
  [(SUUIItemOfferButton *)self->_installButton setTitle:v7];

  [(UILabel *)self->_installedLabel setHidden:v8];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"AppInstallCell"];
}

- (int)installState
{
  return self->_installState;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)publisherLabel
{
  return self->_publisherLabel;
}

- (void)setPublisherLabel:(id)a3
{
}

- (UILabel)installedLabel
{
  return self->_installedLabel;
}

- (void)setInstalledLabel:(id)a3
{
}

- (UIView)labelContainerView
{
  return self->_labelContainerView;
}

- (void)setLabelContainerView:(id)a3
{
}

- (NSLayoutConstraint)installedConstraint
{
  return self->_installedConstraint;
}

- (void)setInstalledConstraint:(id)a3
{
}

- (NSLayoutConstraint)availableConstraint
{
  return self->_availableConstraint;
}

- (void)setAvailableConstraint:(id)a3
{
}

- (NSLayoutConstraint)labelPaddingTop
{
  return self->_labelPaddingTop;
}

- (void)setLabelPaddingTop:(id)a3
{
}

- (NSLayoutConstraint)labelPaddingBottom
{
  return self->_labelPaddingBottom;
}

- (void)setLabelPaddingBottom:(id)a3
{
}

- (SUUIItemOfferButton)installButton
{
  return self->_installButton;
}

- (void)setInstallButton:(id)a3
{
}

- (NSLayoutConstraint)installButtonWidthConstraint
{
  return self->_installButtonWidthConstraint;
}

- (void)setInstallButtonWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)installButtonHeightConstraint
{
  return self->_installButtonHeightConstraint;
}

- (void)setInstallButtonHeightConstraint:(id)a3
{
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_installButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_installButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_installButton, 0);
  objc_storeStrong((id *)&self->_labelPaddingBottom, 0);
  objc_storeStrong((id *)&self->_labelPaddingTop, 0);
  objc_storeStrong((id *)&self->_availableConstraint, 0);
  objc_storeStrong((id *)&self->_installedConstraint, 0);
  objc_storeStrong((id *)&self->_labelContainerView, 0);
  objc_storeStrong((id *)&self->_installedLabel, 0);
  objc_storeStrong((id *)&self->_publisherLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

@end
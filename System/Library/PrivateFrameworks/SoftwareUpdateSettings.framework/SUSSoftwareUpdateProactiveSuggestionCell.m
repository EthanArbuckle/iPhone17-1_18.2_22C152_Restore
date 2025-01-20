@interface SUSSoftwareUpdateProactiveSuggestionCell
- (SUSSoftwareUpdateProactiveSuggestionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)_configureContentLabel;
- (id)_configureIconImage;
- (id)_configureTitleLabel;
- (id)content;
- (id)title;
- (void)_setupView;
- (void)setContent:(id)a3;
- (void)setSystemIconNamed:(id)a3 withTintColor:(id)a4;
- (void)setTitle:(id)a3;
@end

@implementation SUSSoftwareUpdateProactiveSuggestionCell

- (SUSSoftwareUpdateProactiveSuggestionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v15 = self;
  SEL v14 = a2;
  int64_t v13 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v11 = 0;
  objc_storeStrong(&v11, a5);
  v5 = v15;
  v15 = 0;
  v10.receiver = v5;
  v10.super_class = (Class)SUSSoftwareUpdateProactiveSuggestionCell;
  v9 = [(PSTableCell *)&v10 initWithStyle:v13 reuseIdentifier:location specifier:v11];
  v15 = v9;
  objc_storeStrong((id *)&v15, v9);
  if (v9)
  {
    [(SUSSoftwareUpdateProactiveSuggestionCell *)v15 setSelectionStyle:0];
    [(SUSSoftwareUpdateProactiveSuggestionCell *)v15 setHoverStyle:0];
    [(SUSSoftwareUpdateProactiveSuggestionCell *)v15 _setupView];
  }
  v7 = v15;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v7;
}

- (void)_setupView
{
  if (!self->_titleLabel && !self->_contentLabel && !self->_iconImage)
  {
    v2 = (UILabel *)[(SUSSoftwareUpdateProactiveSuggestionCell *)self _configureTitleLabel];
    titleLabel = self->_titleLabel;
    self->_titleLabel = v2;

    v4 = (UIImageView *)[(SUSSoftwareUpdateProactiveSuggestionCell *)self _configureIconImage];
    iconImage = self->_iconImage;
    self->_iconImage = v4;

    v6 = (UILabel *)[(SUSSoftwareUpdateProactiveSuggestionCell *)self _configureContentLabel];
    contentLabel = self->_contentLabel;
    self->_contentLabel = v6;

    id v12 = (id)[(SUSSoftwareUpdateProactiveSuggestionCell *)self contentView];
    [v12 addSubview:self->_titleLabel];

    id v13 = (id)[(SUSSoftwareUpdateProactiveSuggestionCell *)self contentView];
    [v13 addSubview:self->_iconImage];

    id v14 = (id)[(SUSSoftwareUpdateProactiveSuggestionCell *)self contentView];
    [v14 addSubview:self->_contentLabel];

    id v18 = (id)[(SUSSoftwareUpdateProactiveSuggestionCell *)self contentView];
    v15 = (void *)MEMORY[0x263F08938];
    v17 = _NSDictionaryOfVariableBindings(&cfstr_TitlelabelIcon.isa, self->_titleLabel, self->_iconImage, 0);
    id v16 = (id)objc_msgSend(v15, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-(margin)-[_titleLabel]-(>=iconToTitleSpacing)-[_iconImage(iconWidth)]-(margin)-|");
    objc_msgSend(v18, "addConstraints:");

    id v20 = (id)[(SUSSoftwareUpdateProactiveSuggestionCell *)self contentView];
    id v19 = (id)objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_iconImage, 10, 0, self->_titleLabel, 1.0, 0.0);
    objc_msgSend(v20, "addConstraint:");

    v21 = (void *)MEMORY[0x263F08938];
    v22 = _NSDictionaryOfVariableBindings(&cfstr_TitlelabelCont.isa, self->_titleLabel, self->_contentLabel, 0);
    v8 = (NSArray *)(id)objc_msgSend(v21, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(margin)-[_titleLabel]-(spacing)-[_contentLabel]-(margin)-|", 0, &unk_26EF092A0);
    titleAndContentVerticalConstaints = self->_titleAndContentVerticalConstaints;
    self->_titleAndContentVerticalConstaints = v8;

    v23 = (void *)MEMORY[0x263F08938];
    v24 = _NSDictionaryOfVariableBindings(&cfstr_Titlelabel.isa, self->_titleLabel, 0);
    objc_super v10 = (NSArray *)(id)objc_msgSend(v23, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(margin)-[_titleLabel]-(margin)-|", 0, &unk_26EF092C8);
    titleOnlyVerticalConstaints = self->_titleOnlyVerticalConstaints;
    self->_titleOnlyVerticalConstaints = v10;

    id v28 = (id)[(SUSSoftwareUpdateProactiveSuggestionCell *)self contentView];
    v25 = (void *)MEMORY[0x263F08938];
    v27 = _NSDictionaryOfVariableBindings(&cfstr_Contentlabel.isa, self->_contentLabel, 0);
    id v26 = (id)objc_msgSend(v25, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-(margin)-[_contentLabel]-(margin)-|", 0, &unk_26EF092F0);
    objc_msgSend(v28, "addConstraints:");

    id v29 = (id)[(SUSSoftwareUpdateProactiveSuggestionCell *)self contentView];
    [v29 addConstraints:self->_titleAndContentVerticalConstaints];

    id v30 = (id)[(SUSSoftwareUpdateProactiveSuggestionCell *)self contentView];
    [v30 addConstraints:self->_titleOnlyVerticalConstaints];

    [MEMORY[0x263F08938] activateConstraints:self->_titleOnlyVerticalConstaints];
    [MEMORY[0x263F08938] deactivateConstraints:self->_titleAndContentVerticalConstaints];
  }
}

- (id)_configureTitleLabel
{
  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = objc_alloc_init(MEMORY[0x263F828E0]);
  id v4 = v7[0];
  id v5 = (id)[MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  objc_msgSend(v4, "setFont:");

  [v7[0] setNumberOfLines:0];
  [v7[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7[0] setAdjustsFontForContentSizeCategory:1];
  objc_msgSend(v7[0], "setContentCompressionResistancePriority:forAxis:");
  LODWORD(v2) = 1148846080;
  [v7[0] setContentHuggingPriority:1 forAxis:v2];
  [v7[0] setAccessibilityIdentifier:@"SUProactiveSuggestionCellTitle"];
  id v6 = v7[0];
  objc_storeStrong(v7, 0);
  return v6;
}

- (id)_configureIconImage
{
  v8[2] = self;
  v8[1] = (id)a2;
  v8[0] = objc_alloc_init(MEMORY[0x263F82828]);
  [v8[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8[0] setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  [v8[0] setContentMode:2];
  id v4 = v8[0];
  v3 = (void *)MEMORY[0x263F82818];
  id v6 = (id)[MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  id v5 = (id)objc_msgSend(v3, "configurationWithFont:");
  objc_msgSend(v4, "setSymbolConfiguration:");

  [v8[0] sizeToFit];
  [v8[0] setAccessibilityIdentifier:@"SUProactiveSuggestionCellIcon"];
  id v7 = v8[0];
  objc_storeStrong(v8, 0);
  return v7;
}

- (id)_configureContentLabel
{
  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = objc_alloc_init(MEMORY[0x263F828E0]);
  id v4 = v7[0];
  id v5 = (id)[MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  objc_msgSend(v4, "setFont:");

  [v7[0] setNumberOfLines:0];
  [v7[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7[0] setAdjustsFontForContentSizeCategory:1];
  objc_msgSend(v7[0], "setContentCompressionResistancePriority:forAxis:");
  LODWORD(v2) = 1148846080;
  [v7[0] setContentHuggingPriority:1 forAxis:v2];
  [v7[0] setAccessibilityIdentifier:@"SUProactiveSuggestionCellContent"];
  id v6 = v7[0];
  objc_storeStrong(v7, 0);
  return v6;
}

- (id)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(UILabel *)v4->_titleLabel setText:location[0]];
  objc_storeStrong(location, 0);
}

- (id)content
{
  return [(UILabel *)self->_contentLabel text];
}

- (void)setContent:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(UILabel *)v5->_contentLabel setText:location[0]];
  if (!location[0] || ([location[0] isEqualToString:&stru_26EF052F8] & 1) != 0)
  {
    objc_msgSend(MEMORY[0x263F08938], "activateConstraints:", v5->_titleOnlyVerticalConstaints, 0x263F08000uLL);
    [*(id *)(v3 + 2360) deactivateConstraints:v5->_titleAndContentVerticalConstaints];
  }
  else
  {
    [MEMORY[0x263F08938] deactivateConstraints:v5->_titleOnlyVerticalConstaints];
    [MEMORY[0x263F08938] activateConstraints:v5->_titleAndContentVerticalConstaints];
  }
  objc_storeStrong(location, 0);
}

- (void)setSystemIconNamed:(id)a3 withTintColor:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v6 = (void *)MEMORY[0x263F827E8];
  id v5 = location[0];
  id v7 = (id)[MEMORY[0x263F82818] configurationWithWeight:2];
  id v8 = (id)objc_msgSend(v6, "systemImageNamed:withConfiguration:", v5);

  [(UIImageView *)v11->_iconImage setImage:v8];
  [(UIImageView *)v11->_iconImage setTintColor:v9];
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
}

@end
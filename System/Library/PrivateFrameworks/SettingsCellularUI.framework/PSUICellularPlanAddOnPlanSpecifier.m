@interface PSUICellularPlanAddOnPlanSpecifier
- (PSUICellularPlanAddOnPlanSpecifier)initWithTarget:(id)a3 action:(SEL)a4 displayPlan:(id)a5;
- (UIButton)addButton;
- (void)setProperty:(id)a3 forKey:(id)a4;
@end

@implementation PSUICellularPlanAddOnPlanSpecifier

- (PSUICellularPlanAddOnPlanSpecifier)initWithTarget:(id)a3 action:(SEL)a4 displayPlan:(id)a5
{
  id v9 = a3;
  SEL v25 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PSUICellularPlanAddOnPlanSpecifier;
  v11 = [(PSUICellularPlanAddOnPlanSpecifier *)&v24 initWithName:0 target:0 set:0 get:0 detail:0 cell:4 edit:0];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_target, a3);
    objc_storeStrong((id *)&v12->_displayPlan, a5);
    v23.receiver = v12;
    v23.super_class = (Class)PSUICellularPlanAddOnPlanSpecifier;
    [(PSUICellularPlanAddOnPlanSpecifier *)&v23 setUserInfo:v10];
    v13 = [MEMORY[0x263F08D40] valueWithBytes:&v25 objCType:":"];
    uint64_t v14 = *MEMORY[0x263F5FF70];
    v22.receiver = v12;
    v22.super_class = (Class)PSUICellularPlanAddOnPlanSpecifier;
    [(PSUICellularPlanAddOnPlanSpecifier *)&v22 setProperty:v13 forKey:v14];

    uint64_t v15 = [MEMORY[0x263F824E8] buttonWithType:1];
    addButton = v12->_addButton;
    v12->_addButton = (UIButton *)v15;

    v17 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    nameLabel = v12->_nameLabel;
    v12->_nameLabel = v17;

    v19 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    numberLabel = v12->_numberLabel;
    v12->_numberLabel = v19;
  }
  return v12;
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = &selRef_dismiss;
  if ([(id)*MEMORY[0x263F602B0] isEqualToString:v7])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      addButton = self->_addButton;
      id v66 = v6;
      id v10 = v6;
      v11 = [(UIButton *)addButton titleLabel];
      uint64_t v12 = *MEMORY[0x263F83570];
      v13 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
      [v11 setFont:v13];

      uint64_t v14 = self->_addButton;
      uint64_t v15 = NSString;
      v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v17 = [v16 localizedStringForKey:@"ADD_ADD_ON_PLAN" value:&stru_26D410CA0 table:@"Cellular"];
      v18 = [v15 stringWithFormat:v17];
      [(UIButton *)v14 setTitle:v18 forState:0];

      uint64_t v69 = 0;
      uint64_t v19 = *MEMORY[0x263F5FF70];
      v68.receiver = self;
      v68.super_class = (Class)PSUICellularPlanAddOnPlanSpecifier;
      v20 = [(PSUICellularPlanAddOnPlanSpecifier *)&v68 propertyForKey:v19];
      [v20 getValue:&v69];

      [(UIButton *)self->_addButton addTarget:self->_target action:v69 forEvents:64];
      v21 = [v10 contentView];
      [v21 addSubview:self->_addButton];

      [(UIButton *)self->_addButton setTranslatesAutoresizingMaskIntoConstraints:0];
      objc_super v22 = [(UIButton *)self->_addButton rightAnchor];
      objc_super v23 = [v10 contentView];
      objc_super v24 = [v23 rightAnchor];
      SEL v25 = [v22 constraintEqualToAnchor:v24];
      [v25 setActive:1];

      v26 = [(UIButton *)self->_addButton centerYAnchor];
      v27 = [v10 contentView];
      v28 = [v27 centerYAnchor];
      v29 = [v26 constraintEqualToAnchor:v28];
      [v29 setActive:1];

      v30 = NSString;
      v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v32 = [v31 localizedStringForKey:@"ADD_ON_PLAN_CARRIER_%@" value:&stru_26D410CA0 table:@"Cellular"];
      v33 = [(CTDisplayPlan *)self->_displayPlan carrierName];
      v34 = objc_msgSend(v30, "stringWithFormat:", v32, v33);
      [(UILabel *)self->_nameLabel setText:v34];

      v35 = [MEMORY[0x263F81708] preferredFontForTextStyle:v12];
      [(UILabel *)self->_nameLabel setFont:v35];

      [(UILabel *)self->_nameLabel setAdjustsFontForContentSizeCategory:1];
      [(UILabel *)self->_nameLabel setNumberOfLines:0];
      [(UILabel *)self->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v36 = [v10 contentView];
      [v36 addSubview:self->_nameLabel];

      v37 = [(UILabel *)self->_nameLabel firstBaselineAnchor];
      v38 = [v10 contentView];
      v39 = [v38 topAnchor];
      v40 = [v37 constraintEqualToSystemSpacingBelowAnchor:v39 multiplier:1.0];
      [v40 setActive:1];

      v41 = [(UILabel *)self->_nameLabel leadingAnchor];
      v42 = [v10 contentView];
      v43 = [v42 layoutMarginsGuide];
      v44 = [v43 leadingAnchor];
      v45 = [v41 constraintEqualToAnchor:v44];
      [v45 setActive:1];

      v46 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
      [(UILabel *)self->_numberLabel setFont:v46];

      v47 = [(CTDisplayPlan *)self->_displayPlan phoneNumber];
      [(UILabel *)self->_numberLabel setText:v47];

      [(UILabel *)self->_numberLabel setNumberOfLines:0];
      [(UILabel *)self->_numberLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v48 = [MEMORY[0x263F825C8] systemGrayColor];
      [(UILabel *)self->_numberLabel setTextColor:v48];

      v49 = [v10 contentView];
      [v49 addSubview:self->_numberLabel];

      v50 = [(UILabel *)self->_numberLabel firstBaselineAnchor];
      v51 = [(UILabel *)self->_nameLabel lastBaselineAnchor];
      v52 = [v50 constraintEqualToSystemSpacingBelowAnchor:v51 multiplier:1.0];
      [v52 setActive:1];

      v53 = [(UILabel *)self->_numberLabel leadingAnchor];
      v54 = [(UILabel *)self->_nameLabel leadingAnchor];
      v55 = [v53 constraintEqualToAnchor:v54];
      [v55 setActive:1];

      v56 = [(UILabel *)self->_numberLabel trailingAnchor];
      v57 = [v10 contentView];
      v58 = [v57 layoutMarginsGuide];
      v59 = [v58 trailingAnchor];
      v60 = [v56 constraintLessThanOrEqualToAnchor:v59];
      [v60 setActive:1];

      v61 = [v10 contentView];

      v62 = [v61 bottomAnchor];
      v8 = &selRef_dismiss;
      v63 = [(UILabel *)self->_numberLabel lastBaselineAnchor];
      v64 = [v62 constraintEqualToSystemSpacingBelowAnchor:v63 multiplier:1.0];
      [v64 setActive:1];

      id v6 = v66;
    }
  }
  v65 = (objc_class *)v8[179];
  v67.receiver = self;
  v67.super_class = v65;
  [(PSUICellularPlanAddOnPlanSpecifier *)&v67 setProperty:v6 forKey:v7];
}

- (UIButton)addButton
{
  return self->_addButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_numberLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_displayPlan, 0);
  objc_storeStrong(&self->_target, 0);
}

@end
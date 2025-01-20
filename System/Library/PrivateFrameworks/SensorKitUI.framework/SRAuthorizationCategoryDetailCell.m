@interface SRAuthorizationCategoryDetailCell
+ (id)categoryDetailCellForAuthGroup:(id)a3 bundle:(id)a4 titleFont:(id)a5 bodyFont:(id)a6 textColor:(id)a7 OBKStyle:(BOOL)a8;
- (BOOL)OBKStyle;
- (BOOL)showAppUsage;
- (NSArray)collectedLabels;
- (NSArray)notCollectedLabels;
- (NSArray)whatIsSharedLabels;
- (NSArray)whenSharedLabels;
- (SRAuthorizationCategoryDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 titleFont:(id)a5 bodyFont:(id)a6 fontColor:(id)a7 OBKStyle:(BOOL)a8;
- (UIColor)fontColor;
- (UIFont)bodyFont;
- (UIFont)titleFont;
- (UILabel)appUsageBodyLabel;
- (UILabel)appUsageTitleLabel;
- (UILabel)categorySubTitleLabel;
- (UILabel)categoryTitleLabel;
- (UILabel)collectedTitleLabel;
- (UILabel)notCollectedTitleLabel;
- (UILabel)whatIsSharedTitleLabel;
- (UILabel)whenSharedTitleLabel;
- (UIStackView)appUsageStack;
- (UIStackView)categoryStack;
- (UIStackView)stacks;
- (id)addBulletStackViewForTitleLabel:(id)a3 count:(int64_t)a4;
- (id)dynamicHeightLabel;
- (id)stackViewForSubviews:(id)a3 spacing:(double)a4;
- (int64_t)numberOfCollectedLabels;
- (int64_t)numberOfNotCollectedLabels;
- (int64_t)numberOfWhatIsSharedLabels;
- (int64_t)numberOfWhenSharedLabels;
- (void)dealloc;
- (void)setAppUsageStack:(id)a3;
- (void)setBodyFont:(id)a3;
- (void)setCategoryStack:(id)a3;
- (void)setCollectedLabels:(id)a3;
- (void)setFontColor:(id)a3;
- (void)setNotCollectedLabels:(id)a3;
- (void)setNumberOfCollectedLabels:(int64_t)a3;
- (void)setNumberOfNotCollectedLabels:(int64_t)a3;
- (void)setNumberOfWhatIsSharedLabels:(int64_t)a3;
- (void)setNumberOfWhenSharedLabels:(int64_t)a3;
- (void)setOBKStyle:(BOOL)a3;
- (void)setShowAppUsage:(BOOL)a3;
- (void)setStacks:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setWhatIsSharedLabels:(id)a3;
- (void)setWhenSharedLabels:(id)a3;
@end

@implementation SRAuthorizationCategoryDetailCell

- (SRAuthorizationCategoryDetailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 titleFont:(id)a5 bodyFont:(id)a6 fontColor:(id)a7 OBKStyle:(BOOL)a8
{
  v28[2] = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)SRAuthorizationCategoryDetailCell;
  v12 = [(SRAuthorizationCategoryDetailCell *)&v24 initWithStyle:a3 reuseIdentifier:a4];
  v13 = v12;
  if (v12)
  {
    [(SRAuthorizationCategoryDetailCell *)v12 setSelectionStyle:0];
    v13->_titleFont = (UIFont *)a5;
    v13->_bodyFont = (UIFont *)a6;
    v13->_fontColor = (UIColor *)a7;
    v13->_OBKStyle = a8;
    v13->_categorySubTitleLabel = (UILabel *)[(SRAuthorizationCategoryDetailCell *)v13 dynamicHeightLabel];
    -[UILabel setFont:](v13->_categorySubTitleLabel, "setFont:", objc_msgSend(MEMORY[0x263F1C658], "fontWithDescriptor:size:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C660], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x263F1D280]), "fontDescriptorWithSymbolicTraits:", 2), 0.0));
    -[UILabel setTextColor:](v13->_categorySubTitleLabel, "setTextColor:", [MEMORY[0x263F1C550] secondaryLabelColor]);
    v13->_categoryTitleLabel = (UILabel *)[(SRAuthorizationCategoryDetailCell *)v13 dynamicHeightLabel];
    -[UILabel setFont:](v13->_categoryTitleLabel, "setFont:", objc_msgSend(MEMORY[0x263F1C658], "fontWithDescriptor:size:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C660], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x263F1D2B0]), "fontDescriptorWithSymbolicTraits:", 2), 0.0));
    v14 = (UILabel *)[(SRAuthorizationCategoryDetailCell *)v13 dynamicHeightLabel];
    v13->_appUsageTitleLabel = v14;
    [(UILabel *)v14 setFont:v13->_titleFont];
    v15 = (UILabel *)[(SRAuthorizationCategoryDetailCell *)v13 dynamicHeightLabel];
    v13->_appUsageBodyLabel = v15;
    [(UILabel *)v15 setFont:v13->_bodyFont];
    v16 = (UILabel *)[(SRAuthorizationCategoryDetailCell *)v13 dynamicHeightLabel];
    v13->_collectedTitleLabel = v16;
    [(UILabel *)v16 setFont:v13->_titleFont];
    v17 = (UILabel *)[(SRAuthorizationCategoryDetailCell *)v13 dynamicHeightLabel];
    v13->_notCollectedTitleLabel = v17;
    [(UILabel *)v17 setFont:v13->_titleFont];
    v18 = (UILabel *)[(SRAuthorizationCategoryDetailCell *)v13 dynamicHeightLabel];
    v13->_whenSharedTitleLabel = v18;
    [(UILabel *)v18 setFont:v13->_titleFont];
    v19 = (UILabel *)[(SRAuthorizationCategoryDetailCell *)v13 dynamicHeightLabel];
    v13->_whatIsSharedTitleLabel = v19;
    [(UILabel *)v19 setFont:v13->_titleFont];
    v28[0] = v13->_appUsageTitleLabel;
    v28[1] = v13->_appUsageBodyLabel;
    v20 = (UIStackView *)-[SRAuthorizationCategoryDetailCell stackViewForSubviews:spacing:](v13, "stackViewForSubviews:spacing:", [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2], 6.0);
    v13->_appUsageStack = v20;
    v27 = v20;
    v13->_stacks = (UIStackView *)-[SRAuthorizationCategoryDetailCell stackViewForSubviews:spacing:](v13, "stackViewForSubviews:spacing:", [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1], 22.0);
    if (v13->_OBKStyle)
    {
      v26[0] = v13->_categorySubTitleLabel;
      v26[1] = v13->_categoryTitleLabel;
      v21 = (UIStackView *)-[SRAuthorizationCategoryDetailCell stackViewForSubviews:spacing:](v13, "stackViewForSubviews:spacing:", [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2], 0.0);
      v13->_categoryStack = v21;
      [(UIStackView *)v13->_stacks insertArrangedSubview:v21 atIndex:0];
      [(UIStackView *)v13->_stacks setCustomSpacing:v13->_categoryStack afterView:15.0];
    }
    objc_msgSend((id)-[SRAuthorizationCategoryDetailCell contentView](v13, "contentView"), "addSubview:", v13->_stacks);
    v22 = (void *)MEMORY[0x263F08938];
    v25[0] = objc_msgSend((id)-[UIStackView topAnchor](v13->_stacks, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)objc_msgSend((id)-[SRAuthorizationCategoryDetailCell contentView](v13, "contentView"), "layoutMarginsGuide"), "topAnchor"));
    v25[1] = objc_msgSend((id)-[UIStackView leadingAnchor](v13->_stacks, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)objc_msgSend((id)-[SRAuthorizationCategoryDetailCell contentView](v13, "contentView"), "layoutMarginsGuide"), "leadingAnchor"));
    v25[2] = objc_msgSend((id)-[UIStackView trailingAnchor](v13->_stacks, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)objc_msgSend((id)-[SRAuthorizationCategoryDetailCell contentView](v13, "contentView"), "layoutMarginsGuide"), "trailingAnchor"));
    v25[3] = objc_msgSend((id)-[UIStackView bottomAnchor](v13->_stacks, "bottomAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)objc_msgSend((id)-[SRAuthorizationCategoryDetailCell contentView](v13, "contentView"), "layoutMarginsGuide"), "bottomAnchor"));
    objc_msgSend(v22, "activateConstraints:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v25, 4));
  }
  return v13;
}

- (void)dealloc
{
  self->_categorySubTitleLabel = 0;
  self->_categoryTitleLabel = 0;

  self->_appUsageTitleLabel = 0;
  self->_appUsageBodyLabel = 0;

  self->_collectedTitleLabel = 0;
  self->_notCollectedTitleLabel = 0;

  self->_whenSharedTitleLabel = 0;
  [(SRAuthorizationCategoryDetailCell *)self setCollectedLabels:0];
  [(SRAuthorizationCategoryDetailCell *)self setNotCollectedLabels:0];
  [(SRAuthorizationCategoryDetailCell *)self setWhenSharedLabels:0];
  [(SRAuthorizationCategoryDetailCell *)self setWhatIsSharedLabels:0];
  [(SRAuthorizationCategoryDetailCell *)self setCategoryStack:0];
  [(SRAuthorizationCategoryDetailCell *)self setAppUsageStack:0];
  [(SRAuthorizationCategoryDetailCell *)self setStacks:0];
  [(SRAuthorizationCategoryDetailCell *)self setTitleFont:0];
  [(SRAuthorizationCategoryDetailCell *)self setBodyFont:0];
  [(SRAuthorizationCategoryDetailCell *)self setFontColor:0];
  v3.receiver = self;
  v3.super_class = (Class)SRAuthorizationCategoryDetailCell;
  [(SRAuthorizationCategoryDetailCell *)&v3 dealloc];
}

- (id)dynamicHeightLabel
{
  id v3 = (id)objc_opt_new();
  [v3 setLineBreakMode:0];
  [v3 setNumberOfLines:0];
  objc_msgSend(v3, "setTextColor:", -[SRAuthorizationCategoryDetailCell fontColor](self, "fontColor"));
  return v3;
}

- (id)stackViewForSubviews:(id)a3 spacing:(double)a4
{
  id v5 = (id)[objc_alloc(MEMORY[0x263F1C9B8]) initWithArrangedSubviews:a3];
  [v5 setAxis:1];
  [v5 setSpacing:a4];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v5;
}

- (id)addBulletStackViewForTitleLabel:(id)a3 count:(int64_t)a4
{
  int64_t v4 = a4;
  v29[1] = *MEMORY[0x263EF8340];
  v7 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:a4];
  v8 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v4 + 1];
  [v8 addObject:a3];
  if (v4 >= 1)
  {
    uint64_t v9 = *MEMORY[0x263F1C238];
    do
    {
      if ([(SRAuthorizationCategoryDetailCell *)self OBKStyle])
      {
        v10 = objc_msgSend(MEMORY[0x263F1C6B0], "skui_bulletImage");
        id v11 = (id)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v10];
        [v11 setContentMode:1];
        uint64_t v12 = [v11 widthAnchor];
        [v10 size];
        v14 = (void *)v12;
      }
      else
      {
        id v11 = [(SRAuthorizationCategoryDetailCell *)self dynamicHeightLabel];
        [v11 setText:@"•"];
        objc_msgSend(v11, "setFont:", -[SRAuthorizationCategoryDetailCell bodyFont](self, "bodyFont"));
        v15 = (void *)[v11 text];
        uint64_t v28 = v9;
        v29[0] = [v11 font];
        objc_msgSend(v15, "sizeWithAttributes:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, &v28, 1));
        double v17 = v16;
        v14 = (void *)[v11 widthAnchor];
        double v13 = v17;
      }
      objc_msgSend((id)objc_msgSend(v14, "constraintEqualToConstant:", v13), "setActive:", 1);
      id v18 = [(SRAuthorizationCategoryDetailCell *)self dynamicHeightLabel];
      objc_msgSend(v18, "setFont:", -[SRAuthorizationCategoryDetailCell bodyFont](self, "bodyFont"));
      [v7 addObject:v18];
      id v19 = objc_alloc(MEMORY[0x263F1C9B8]);
      v27[0] = v11;
      v27[1] = v18;
      id v20 = (id)objc_msgSend(v19, "initWithArrangedSubviews:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v27, 2));
      [v20 layoutMargins];
      objc_msgSend(v20, "setLayoutMargins:");
      [v20 setLayoutMarginsRelativeArrangement:1];
      [v20 setAxis:0];
      if ([(SRAuthorizationCategoryDetailCell *)self OBKStyle]) {
        double v21 = 14.0;
      }
      else {
        double v21 = 6.0;
      }
      [v20 setSpacing:v21];
      [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
      if (![(SRAuthorizationCategoryDetailCell *)self OBKStyle]) {
        [v20 setAlignment:2];
      }
      [v8 addObject:v20];
      --v4;
    }
    while (v4);
  }
  BOOL v22 = [(SRAuthorizationCategoryDetailCell *)self OBKStyle];
  double v23 = 10.0;
  double v24 = 16.0;
  if (v22) {
    double v23 = 16.0;
  }
  id v25 = [(SRAuthorizationCategoryDetailCell *)self stackViewForSubviews:v8 spacing:v23];
  if (![(SRAuthorizationCategoryDetailCell *)self OBKStyle]) {
    double v24 = 12.0;
  }
  objc_msgSend(v25, "setCustomSpacing:afterView:", objc_msgSend((id)objc_msgSend(v25, "subviews"), "firstObject"), v24);
  [v25 setShouldGroupAccessibilityChildren:1];
  [(UIStackView *)[(SRAuthorizationCategoryDetailCell *)self stacks] addArrangedSubview:v25];
  return v7;
}

- (void)setShowAppUsage:(BOOL)a3
{
  self->_showAppUsage = a3;
  BOOL v3 = !a3;
  int64_t v4 = [(SRAuthorizationCategoryDetailCell *)self appUsageStack];
  [(UIStackView *)v4 setHidden:v3];
}

- (void)setNumberOfCollectedLabels:(int64_t)a3
{
  self->_numberOfCollectedLabels = a3;
  id v4 = [(SRAuthorizationCategoryDetailCell *)self addBulletStackViewForTitleLabel:[(SRAuthorizationCategoryDetailCell *)self collectedTitleLabel] count:a3];
  [(SRAuthorizationCategoryDetailCell *)self setCollectedLabels:v4];
}

- (void)setNumberOfNotCollectedLabels:(int64_t)a3
{
  self->_numberOfNotCollectedLabels = a3;
  id v4 = [(SRAuthorizationCategoryDetailCell *)self addBulletStackViewForTitleLabel:[(SRAuthorizationCategoryDetailCell *)self notCollectedTitleLabel] count:a3];
  [(SRAuthorizationCategoryDetailCell *)self setNotCollectedLabels:v4];
}

- (void)setNumberOfWhenSharedLabels:(int64_t)a3
{
  self->_numberOfWhenSharedLabels = a3;
  id v4 = [(SRAuthorizationCategoryDetailCell *)self addBulletStackViewForTitleLabel:[(SRAuthorizationCategoryDetailCell *)self whenSharedTitleLabel] count:a3];
  [(SRAuthorizationCategoryDetailCell *)self setWhenSharedLabels:v4];
}

- (void)setNumberOfWhatIsSharedLabels:(int64_t)a3
{
  self->_numberOfWhatIsSharedLabels = a3;
  id v4 = [(SRAuthorizationCategoryDetailCell *)self addBulletStackViewForTitleLabel:[(SRAuthorizationCategoryDetailCell *)self whatIsSharedTitleLabel] count:a3];
  [(SRAuthorizationCategoryDetailCell *)self setWhatIsSharedLabels:v4];
}

+ (id)categoryDetailCellForAuthGroup:(id)a3 bundle:(id)a4 titleFont:(id)a5 bodyFont:(id)a6 textColor:(id)a7 OBKStyle:(BOOL)a8
{
  BOOL v8 = a8;
  v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F176A8], "sensorDescriptionsForAuthorizationService:", objc_msgSend(a3, "authorizationService")), "firstObject");
  if (!v14) {
    return 0;
  }
  uint64_t v15 = objc_msgSend((id)objc_msgSend(a4, "sk_perCategoryDetailDescription"), "objectForKeyedSubscript:", objc_msgSend(v14, "infoPlistAuthorizationCategory"));
  double v16 = [SRAuthorizationCategoryDetailCell alloc];
  double v17 = (objc_class *)objc_opt_class();
  id v18 = [(SRAuthorizationCategoryDetailCell *)v16 initWithStyle:0 reuseIdentifier:NSStringFromClass(v17) titleFont:a5 bodyFont:a6 fontColor:a7 OBKStyle:v8];
  [(SRAuthorizationCategoryDetailCell *)v18 setShowAppUsage:v15 != 0];
  if ([(SRAuthorizationCategoryDetailCell *)v18 showAppUsage])
  {
    -[UILabel setText:](-[SRAuthorizationCategoryDetailCell appUsageTitleLabel](v18, "appUsageTitleLabel"), "setText:", objc_msgSend(NSString, "srui_localizedStringForCode:", 36));
    [(UILabel *)[(SRAuthorizationCategoryDetailCell *)v18 appUsageBodyLabel] setText:v15];
  }
  -[UILabel setText:](-[SRAuthorizationCategoryDetailCell collectedTitleLabel](v18, "collectedTitleLabel"), "setText:", objc_msgSend(NSString, "srui_localizedStringForCode:", 6));
  -[UILabel setText:](-[SRAuthorizationCategoryDetailCell notCollectedTitleLabel](v18, "notCollectedTitleLabel"), "setText:", objc_msgSend(NSString, "srui_localizedStringForCode:", 7));
  id v19 = (void *)[a3 localizedCollectedData];
  id v20 = (void *)[a3 localizedNotCollectedData];
  double v21 = (void *)[a3 localizedWhenShared];
  BOOL v22 = (void *)[a3 localizedWhatIsShared];
  if ([v22 count])
  {
    -[UILabel setText:](-[SRAuthorizationCategoryDetailCell whatIsSharedTitleLabel](v18, "whatIsSharedTitleLabel"), "setText:", objc_msgSend(NSString, "srui_localizedStringForCode:", 94));
    -[SRAuthorizationCategoryDetailCell setNumberOfWhatIsSharedLabels:](v18, "setNumberOfWhatIsSharedLabels:", [v22 count]);
  }
  -[SRAuthorizationCategoryDetailCell setNumberOfCollectedLabels:](v18, "setNumberOfCollectedLabels:", [v19 count]);
  -[SRAuthorizationCategoryDetailCell setNumberOfNotCollectedLabels:](v18, "setNumberOfNotCollectedLabels:", [v20 count]);
  if ([v21 count])
  {
    -[UILabel setText:](-[SRAuthorizationCategoryDetailCell whenSharedTitleLabel](v18, "whenSharedTitleLabel"), "setText:", objc_msgSend(NSString, "srui_localizedStringForCode:", 90));
    -[SRAuthorizationCategoryDetailCell setNumberOfWhenSharedLabels:](v18, "setNumberOfWhenSharedLabels:", [v21 count]);
  }
  uint64_t v23 = [(NSArray *)[(SRAuthorizationCategoryDetailCell *)v18 collectedLabels] count];
  if (v23 == [v19 count])
  {
    uint64_t v24 = [(NSArray *)[(SRAuthorizationCategoryDetailCell *)v18 notCollectedLabels] count];
    if (v24 == [v20 count])
    {
      id v25 = [(SRAuthorizationCategoryDetailCell *)v18 whatIsSharedLabels];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __113__SRAuthorizationCategoryDetailCell_categoryDetailCellForAuthGroup_bundle_titleFont_bodyFont_textColor_OBKStyle___block_invoke;
      v33[3] = &unk_264BA3108;
      v33[4] = v22;
      [(NSArray *)v25 enumerateObjectsUsingBlock:v33];
      v26 = [(SRAuthorizationCategoryDetailCell *)v18 collectedLabels];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __113__SRAuthorizationCategoryDetailCell_categoryDetailCellForAuthGroup_bundle_titleFont_bodyFont_textColor_OBKStyle___block_invoke_2;
      v32[3] = &unk_264BA3108;
      v32[4] = v19;
      [(NSArray *)v26 enumerateObjectsUsingBlock:v32];
      v27 = [(SRAuthorizationCategoryDetailCell *)v18 notCollectedLabels];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __113__SRAuthorizationCategoryDetailCell_categoryDetailCellForAuthGroup_bundle_titleFont_bodyFont_textColor_OBKStyle___block_invoke_3;
      v31[3] = &unk_264BA3108;
      v31[4] = v20;
      [(NSArray *)v27 enumerateObjectsUsingBlock:v31];
      uint64_t v28 = [(SRAuthorizationCategoryDetailCell *)v18 whenSharedLabels];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __113__SRAuthorizationCategoryDetailCell_categoryDetailCellForAuthGroup_bundle_titleFont_bodyFont_textColor_OBKStyle___block_invoke_4;
      v30[3] = &unk_264BA3108;
      v30[4] = v21;
      [(NSArray *)v28 enumerateObjectsUsingBlock:v30];
    }
  }
  return v18;
}

uint64_t __113__SRAuthorizationCategoryDetailCell_categoryDetailCellForAuthGroup_bundle_titleFont_bodyFont_textColor_OBKStyle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  return [a2 setText:v3];
}

uint64_t __113__SRAuthorizationCategoryDetailCell_categoryDetailCellForAuthGroup_bundle_titleFont_bodyFont_textColor_OBKStyle___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  return [a2 setText:v3];
}

uint64_t __113__SRAuthorizationCategoryDetailCell_categoryDetailCellForAuthGroup_bundle_titleFont_bodyFont_textColor_OBKStyle___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  return [a2 setText:v3];
}

uint64_t __113__SRAuthorizationCategoryDetailCell_categoryDetailCellForAuthGroup_bundle_titleFont_bodyFont_textColor_OBKStyle___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  return [a2 setText:v3];
}

- (UILabel)categorySubTitleLabel
{
  return self->_categorySubTitleLabel;
}

- (UILabel)categoryTitleLabel
{
  return self->_categoryTitleLabel;
}

- (UILabel)appUsageTitleLabel
{
  return self->_appUsageTitleLabel;
}

- (UILabel)appUsageBodyLabel
{
  return self->_appUsageBodyLabel;
}

- (UILabel)collectedTitleLabel
{
  return self->_collectedTitleLabel;
}

- (UILabel)notCollectedTitleLabel
{
  return self->_notCollectedTitleLabel;
}

- (UILabel)whenSharedTitleLabel
{
  return self->_whenSharedTitleLabel;
}

- (UILabel)whatIsSharedTitleLabel
{
  return self->_whatIsSharedTitleLabel;
}

- (NSArray)collectedLabels
{
  return self->_collectedLabels;
}

- (void)setCollectedLabels:(id)a3
{
}

- (NSArray)notCollectedLabels
{
  return self->_notCollectedLabels;
}

- (void)setNotCollectedLabels:(id)a3
{
}

- (BOOL)showAppUsage
{
  return self->_showAppUsage;
}

- (int64_t)numberOfCollectedLabels
{
  return self->_numberOfCollectedLabels;
}

- (int64_t)numberOfNotCollectedLabels
{
  return self->_numberOfNotCollectedLabels;
}

- (int64_t)numberOfWhenSharedLabels
{
  return self->_numberOfWhenSharedLabels;
}

- (int64_t)numberOfWhatIsSharedLabels
{
  return self->_numberOfWhatIsSharedLabels;
}

- (NSArray)whenSharedLabels
{
  return self->_whenSharedLabels;
}

- (void)setWhenSharedLabels:(id)a3
{
}

- (NSArray)whatIsSharedLabels
{
  return self->_whatIsSharedLabels;
}

- (void)setWhatIsSharedLabels:(id)a3
{
}

- (UIStackView)categoryStack
{
  return self->_categoryStack;
}

- (void)setCategoryStack:(id)a3
{
}

- (UIStackView)appUsageStack
{
  return self->_appUsageStack;
}

- (void)setAppUsageStack:(id)a3
{
}

- (UIStackView)stacks
{
  return self->_stacks;
}

- (void)setStacks:(id)a3
{
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
}

- (UIFont)bodyFont
{
  return self->_bodyFont;
}

- (void)setBodyFont:(id)a3
{
}

- (UIColor)fontColor
{
  return self->_fontColor;
}

- (void)setFontColor:(id)a3
{
}

- (BOOL)OBKStyle
{
  return self->_OBKStyle;
}

- (void)setOBKStyle:(BOOL)a3
{
  self->_OBKStyle = a3;
}

@end
@interface STDatePickerBar
- (STDatePickerBar)initWithCoder:(id)a3;
- (STDatePickerBar)initWithFrame:(CGRect)a3;
- (STRootViewModelCoordinator)coordinator;
- (STUsageReport)usageReport;
- (UIButton)leftArrowButton;
- (UIButton)rightArrowButton;
- (UIImage)horizontalLineImage;
- (UIImageView)bottomBorderLine;
- (UILabel)dateLabel;
- (void)_configureArrowButton:(id)a3 isLeft:(BOOL)a4 isLayoutDirectionRightToLeft:(BOOL)a5;
- (void)_leftDatePickerBarButtonTapped:(id)a3;
- (void)_rightDatePickerBarButtonTapped:(id)a3;
- (void)_stDatePickerBarCommonInit;
- (void)setCoordinator:(id)a3;
- (void)setUsageReport:(id)a3;
- (void)updateWithCoordinator:(id)a3;
@end

@implementation STDatePickerBar

- (STDatePickerBar)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STDatePickerBar;
  v3 = -[STDatePickerBar initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(STDatePickerBar *)v3 _stDatePickerBarCommonInit];
  return v3;
}

- (STDatePickerBar)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STDatePickerBar;
  v3 = [(STDatePickerBar *)&v5 initWithCoder:a3];
  [(STDatePickerBar *)v3 _stDatePickerBarCommonInit];
  return v3;
}

- (void)_stDatePickerBarCommonInit
{
  v68[18] = *MEMORY[0x263EF8340];
  [(STDatePickerBar *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  [(STDatePickerBar *)self setAlpha:0.0];
  v65 = [MEMORY[0x263F824D8] effectWithStyle:10];
  v3 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v65];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = v3;
  [(STDatePickerBar *)self addSubview:v3];
  objc_super v5 = (UILabel *)objc_opt_new();
  dateLabel = self->_dateLabel;
  self->_dateLabel = v5;

  [(UILabel *)self->_dateLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [(UILabel *)self->_dateLabel setFont:v7];

  [(UILabel *)self->_dateLabel setNumberOfLines:0];
  [(UILabel *)self->_dateLabel setLineBreakMode:0];
  [(UILabel *)self->_dateLabel setTextAlignment:1];
  [(STDatePickerBar *)self addSubview:self->_dateLabel];
  v8 = (UIButton *)objc_opt_new();
  leftArrowButton = self->_leftArrowButton;
  self->_leftArrowButton = v8;

  BOOL v10 = [(STDatePickerBar *)self effectiveUserInterfaceLayoutDirection] == 1;
  [(STDatePickerBar *)self _configureArrowButton:self->_leftArrowButton isLeft:1 isLayoutDirectionRightToLeft:v10];
  [(STDatePickerBar *)self addSubview:self->_leftArrowButton];
  [(UIButton *)self->_leftArrowButton addTarget:self action:sel__leftDatePickerBarButtonTapped_ forEvents:0x2000];
  v11 = (UIButton *)objc_opt_new();
  rightArrowButton = self->_rightArrowButton;
  self->_rightArrowButton = v11;

  [(STDatePickerBar *)self _configureArrowButton:self->_rightArrowButton isLeft:0 isLayoutDirectionRightToLeft:v10];
  [(STDatePickerBar *)self addSubview:self->_rightArrowButton];
  [(UIButton *)self->_rightArrowButton addTarget:self action:sel__rightDatePickerBarButtonTapped_ forEvents:0x2000];
  id v13 = objc_alloc(MEMORY[0x263F82828]);
  v14 = [(STDatePickerBar *)self horizontalLineImage];
  v15 = (UIImageView *)[v13 initWithImage:v14];
  bottomBorderLine = self->_bottomBorderLine;
  self->_bottomBorderLine = v15;

  [(UIImageView *)self->_bottomBorderLine setTranslatesAutoresizingMaskIntoConstraints:0];
  [(STDatePickerBar *)self addSubview:self->_bottomBorderLine];
  uint64_t v17 = [(STDatePickerBar *)self topAnchor];
  uint64_t v18 = [(STDatePickerBar *)self leadingAnchor];
  v66 = [(STDatePickerBar *)self bottomAnchor];
  uint64_t v19 = [(STDatePickerBar *)self trailingAnchor];
  v67 = [(STDatePickerBar *)self centerYAnchor];
  v48 = (void *)MEMORY[0x263F08938];
  v64 = [v4 topAnchor];
  v62 = [v64 constraintEqualToAnchor:v17];
  v63 = v4;
  v68[0] = v62;
  v61 = [v4 leadingAnchor];
  v60 = [v61 constraintEqualToAnchor:v18];
  v68[1] = v60;
  v59 = [v4 bottomAnchor];
  v58 = [v59 constraintEqualToAnchor:v66];
  v68[2] = v58;
  v57 = [v4 trailingAnchor];
  v20 = (void *)v19;
  v56 = [v57 constraintEqualToAnchor:v19];
  v68[3] = v56;
  v55 = [(UIButton *)self->_leftArrowButton leadingAnchor];
  v44 = (void *)v18;
  v54 = [v55 constraintEqualToSystemSpacingAfterAnchor:v18 multiplier:2.0];
  v68[4] = v54;
  v53 = [(UIButton *)self->_leftArrowButton centerYAnchor];
  v52 = [v53 constraintEqualToAnchor:v67];
  v68[5] = v52;
  v50 = [(UILabel *)self->_dateLabel topAnchor];
  v51 = (void *)v17;
  v49 = [v50 constraintEqualToSystemSpacingBelowAnchor:v17 multiplier:2.0];
  v68[6] = v49;
  v47 = [(UILabel *)self->_dateLabel leadingAnchor];
  v46 = [(UIButton *)self->_leftArrowButton trailingAnchor];
  v45 = [v47 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v46 multiplier:2.0];
  v68[7] = v45;
  v43 = [(UILabel *)self->_dateLabel centerYAnchor];
  v42 = [v43 constraintEqualToAnchor:v67];
  v68[8] = v42;
  v41 = [(UILabel *)self->_dateLabel centerXAnchor];
  v40 = [(STDatePickerBar *)self centerXAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v68[9] = v39;
  v38 = [(UIButton *)self->_rightArrowButton topAnchor];
  v37 = [v38 constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:v17 multiplier:2.0];
  v68[10] = v37;
  v36 = [(UIButton *)self->_rightArrowButton leadingAnchor];
  v35 = [(UILabel *)self->_dateLabel trailingAnchor];
  v34 = [v36 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v35 multiplier:2.0];
  v68[11] = v34;
  v33 = [(UIButton *)self->_rightArrowButton centerYAnchor];
  v32 = [v33 constraintEqualToAnchor:v67];
  v68[12] = v32;
  v31 = [(UIImageView *)self->_bottomBorderLine leadingAnchor];
  v30 = [v31 constraintEqualToAnchor:v18];
  v68[13] = v30;
  v21 = [(UIImageView *)self->_bottomBorderLine trailingAnchor];
  v22 = [v21 constraintEqualToAnchor:v20];
  v68[14] = v22;
  v23 = [(UIImageView *)self->_bottomBorderLine bottomAnchor];
  v24 = [v23 constraintEqualToAnchor:v66];
  v68[15] = v24;
  v25 = [(UILabel *)self->_dateLabel bottomAnchor];
  v26 = [v66 constraintEqualToSystemSpacingBelowAnchor:v25 multiplier:2.0];
  v68[16] = v26;
  v27 = [(UIButton *)self->_rightArrowButton trailingAnchor];
  v28 = [v20 constraintEqualToSystemSpacingAfterAnchor:v27 multiplier:2.0];
  v68[17] = v28;
  v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:18];
  [v48 activateConstraints:v29];
}

- (void)_configureArrowButton:(id)a3 isLeft:(BOOL)a4 isLayoutDirectionRightToLeft:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v7 = (void *)MEMORY[0x263F82ED0];
  id v8 = a3;
  id v16 = [v7 plainButtonConfiguration];
  v9 = @"chevron.right.circle.fill";
  if (v5) {
    BOOL v10 = @"chevron.left.circle.fill";
  }
  else {
    BOOL v10 = @"chevron.right.circle.fill";
  }
  if (!v5) {
    v9 = @"chevron.left.circle.fill";
  }
  if (v6) {
    v11 = v9;
  }
  else {
    v11 = v10;
  }
  v12 = [MEMORY[0x263F827E8] systemImageNamed:v11];
  [v16 setImage:v12];

  id v13 = [MEMORY[0x263F825C8] systemBlueColor];
  [v16 setImageTintColor:v13];

  v14 = [MEMORY[0x263F82818] configurationWithScale:3];
  [v16 setPreferredSymbolConfigurationForImage:v14];

  [v8 _setConfiguration:v16];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v15) = 1144766464;
  [v8 setContentCompressionResistancePriority:0 forAxis:v15];
}

- (UIImage)horizontalLineImage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__STDatePickerBar_horizontalLineImage__block_invoke;
  block[3] = &unk_264766F30;
  block[4] = self;
  if (horizontalLineImage_onceToken_0 != -1) {
    dispatch_once(&horizontalLineImage_onceToken_0, block);
  }
  return (UIImage *)(id)horizontalLineImage_horizontalLineImage_0;
}

void __38__STDatePickerBar_horizontalLineImage__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) traitCollection];
  [v1 displayScale];
  double v3 = 1.0 / v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", v3, v3);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__STDatePickerBar_horizontalLineImage__block_invoke_2;
  v9[3] = &__block_descriptor_40_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v9[4] = v3;
  uint64_t v5 = [v4 imageWithActions:v9];
  BOOL v6 = (void *)horizontalLineImage_horizontalLineImage_0;
  horizontalLineImage_horizontalLineImage_0 = v5;

  uint64_t v7 = objc_msgSend((id)horizontalLineImage_horizontalLineImage_0, "resizableImageWithCapInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  id v8 = (void *)horizontalLineImage_horizontalLineImage_0;
  horizontalLineImage_horizontalLineImage_0 = v7;
}

void __38__STDatePickerBar_horizontalLineImage__block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = (CGContext *)[a2 CGContext];
  id v4 = [MEMORY[0x263F825C8] separatorColor];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v4 CGColor]);

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = v5;

  CGContextFillRect(v3, *(CGRect *)&v6);
}

- (void)updateWithCoordinator:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 usageDetailsCoordinator];
  uint64_t v6 = [v5 viewModel];
  id v8 = [v6 selectedUsageReport];

  uint64_t v7 = [(STDatePickerBar *)self usageReport];
  +[STUsageDetailListController selectedUsageReportDidChangeFrom:v7 to:v8 datePickerBar:self coordinator:v4];

  [(STDatePickerBar *)self setUsageReport:v8];
  [(STDatePickerBar *)self setCoordinator:v4];
}

- (void)_leftDatePickerBarButtonTapped:(id)a3
{
  double v3 = [(STDatePickerBar *)self coordinator];
  id v4 = [v3 usageDetailsCoordinator];
  id v12 = [v4 viewModel];

  uint64_t v5 = [v12 selectedUsageReport];
  uint64_t v6 = [v5 type];

  if (v6 == 1)
  {
    uint64_t v8 = [v12 selectedDay];
    v9 = [MEMORY[0x263EFF8F0] currentCalendar];
    if (v8 == [v9 firstWeekday]) {
      objc_msgSend(v12, "setSelectedWeek:", objc_msgSend(v12, "selectedWeek") + 1);
    }
    if (v8 == [v9 maximumRangeOfUnit:512]) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = v8 - 1;
    }
    [v12 setSelectedDay:v11];
  }
  else
  {
    uint64_t v7 = v12;
    if (v6) {
      goto LABEL_11;
    }
    objc_msgSend(v12, "setSelectedWeek:", objc_msgSend(v12, "selectedWeek") + 1);
  }
  uint64_t v7 = v12;
LABEL_11:
}

- (void)_rightDatePickerBarButtonTapped:(id)a3
{
  double v3 = [(STDatePickerBar *)self coordinator];
  id v4 = [v3 usageDetailsCoordinator];
  id v16 = [v4 viewModel];

  uint64_t v5 = [v16 selectedUsageReport];
  uint64_t v6 = [v5 type];

  if (v6 == 1)
  {
    uint64_t v8 = [v16 selectedDay];
    v9 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v10 = [v9 firstWeekday];
    uint64_t v12 = [v9 maximumRangeOfUnit:512];
    uint64_t v13 = v11;
    uint64_t v14 = v10 - 1;
    if (v10 == v12) {
      uint64_t v14 = v11;
    }
    if (v8 == v14) {
      objc_msgSend(v16, "setSelectedWeek:", objc_msgSend(v16, "selectedWeek") - 1);
    }
    if (v8 == v13) {
      uint64_t v15 = v12;
    }
    else {
      uint64_t v15 = v8 + 1;
    }
    [v16 setSelectedDay:v15];
  }
  else
  {
    uint64_t v7 = v16;
    if (v6) {
      goto LABEL_13;
    }
    objc_msgSend(v16, "setSelectedWeek:", objc_msgSend(v16, "selectedWeek") - 1);
  }
  uint64_t v7 = v16;
LABEL_13:
}

- (UILabel)dateLabel
{
  return (UILabel *)objc_getProperty(self, a2, 408, 1);
}

- (UIButton)leftArrowButton
{
  return (UIButton *)objc_getProperty(self, a2, 416, 1);
}

- (UIButton)rightArrowButton
{
  return (UIButton *)objc_getProperty(self, a2, 424, 1);
}

- (UIImageView)bottomBorderLine
{
  return (UIImageView *)objc_getProperty(self, a2, 432, 1);
}

- (STUsageReport)usageReport
{
  return (STUsageReport *)objc_getProperty(self, a2, 440, 1);
}

- (void)setUsageReport:(id)a3
{
}

- (STRootViewModelCoordinator)coordinator
{
  return (STRootViewModelCoordinator *)objc_getProperty(self, a2, 448, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_usageReport, 0);
  objc_storeStrong((id *)&self->_bottomBorderLine, 0);
  objc_storeStrong((id *)&self->_rightArrowButton, 0);
  objc_storeStrong((id *)&self->_leftArrowButton, 0);

  objc_storeStrong((id *)&self->_dateLabel, 0);
}

@end
@interface PSDateTimePickerCell
+ (double)preferredHeight;
- (PSDateTimePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)datePicker;
- (void)dealloc;
- (void)setTitle:(id)a3;
- (void)timeZoneChanged:(id)a3;
@end

@implementation PSDateTimePickerCell

+ (double)preferredHeight
{
  return *MEMORY[0x1E4F43D18];
}

- (PSDateTimePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v94.receiver = self;
  v94.super_class = (Class)PSDateTimePickerCell;
  v9 = [(PSDateTimePickerCell *)&v94 initWithStyle:a3 reuseIdentifier:a4];
  if (!v9) {
    goto LABEL_16;
  }
  v10 = [v8 target];
  if (([v10 conformsToProtocol:&unk_1EFBD3AB0] & 1) == 0)
  {

    goto LABEL_6;
  }
  v11 = [v8 target];
  char v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) == 0)
  {
LABEL_6:
    id v16 = objc_alloc(MEMORY[0x1E4F42928]);
    uint64_t v17 = objc_msgSend(v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    datePicker = v9->_datePicker;
    v9->_datePicker = (UIDatePicker *)v17;

    v19 = v9->_datePicker;
    v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:2145988800.0];
    [(UIDatePicker *)v19 setMaximumDate:v20];

    v21 = v9->_datePicker;
    v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
    [(UIDatePicker *)v21 setMinimumDate:v22];

    [(UIDatePicker *)v9->_datePicker setDatePickerMode:2];
    [(UIDatePicker *)v9->_datePicker setPreferredDatePickerStyle:3];
    v23 = v9->_datePicker;
    v13 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
    [(UIDatePicker *)v23 setTimeZone:v13];
    goto LABEL_7;
  }
  v13 = [v8 target];
  uint64_t v14 = [v13 datePickerForSpecifier:v8];
  v15 = v9->_datePicker;
  v9->_datePicker = (UIDatePicker *)v14;

LABEL_7:
  v24 = v9->_datePicker;
  v25 = (void *)MEMORY[0x1E4F426E8];
  v91[0] = MEMORY[0x1E4F143A8];
  v91[1] = 3221225472;
  v91[2] = __64__PSDateTimePickerCell_initWithStyle_reuseIdentifier_specifier___block_invoke;
  v91[3] = &unk_1E5C5E2C8;
  v26 = v9;
  v92 = v26;
  id v90 = v8;
  id v27 = v8;
  id v93 = v27;
  v28 = [v25 actionWithHandler:v91];
  [(UIDatePicker *)v24 addAction:v28 forControlEvents:4096];

  uint64_t v29 = objc_opt_new();
  id v30 = v26[150];
  v26[150] = (id)v29;

  v31 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [v26[150] setFont:v31];

  v32 = [MEMORY[0x1E4F428B8] labelColor];
  [v26[150] setTextColor:v32];

  [v26[150] setTranslatesAutoresizingMaskIntoConstraints:0];
  v33 = [v26 contentView];
  [v33 addSubview:v26[150]];

  [(UIDatePicker *)v9->_datePicker setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIDatePicker *)v9->_datePicker setClipsToBounds:1];
  v34 = [v26 contentView];
  [v34 addSubview:v9->_datePicker];

  v35 = [v27 propertyForKey:@"InlineDatePicker"];
  int v36 = [v35 BOOLValue];

  v37 = [MEMORY[0x1E4F42738] sharedApplication];
  v38 = [v37 preferredContentSizeCategory];
  int v39 = 0;
  if (UIContentSizeCategoryIsAccessibilityCategory(v38))
  {
    v40 = [MEMORY[0x1E4F42948] currentDevice];
    int v39 = objc_msgSend(v40, "sf_isiPhone") & v36;
  }
  v41 = [v26 contentView];
  v42 = [v41 layoutMarginsGuide];

  v43 = [v26 contentView];
  if (v39)
  {
    [v26[150] setNumberOfLines:0];
    v44 = [v26[150] topAnchor];
    v45 = [v42 topAnchor];
    v46 = [v44 constraintEqualToSystemSpacingBelowAnchor:v45 multiplier:1.0];
    [v46 setActive:1];

    v47 = [v26[150] leadingAnchor];
    v48 = [v42 leadingAnchor];
    v49 = [v47 constraintEqualToAnchor:v48];
    [v49 setActive:1];

    v50 = [v26[150] trailingAnchor];
    v51 = [v42 trailingAnchor];
    v52 = [v50 constraintEqualToAnchor:v51];
    [v52 setActive:1];

    v53 = [(UIDatePicker *)v9->_datePicker topAnchor];
    v54 = [v26[150] bottomAnchor];
    v55 = [v53 constraintEqualToSystemSpacingBelowAnchor:v54 multiplier:1.0];
    [v55 setActive:1];

    v56 = [(UIDatePicker *)v9->_datePicker leadingAnchor];
    v57 = [v43 leadingAnchor];
    v58 = [v56 constraintEqualToAnchor:v57];
    [v58 setActive:1];

    v59 = [(UIDatePicker *)v9->_datePicker trailingAnchor];
    v60 = [v43 trailingAnchor];
    v61 = [v59 constraintEqualToAnchor:v60];
    [v61 setActive:1];

    v62 = [v43 bottomAnchor];
    v63 = [(UIDatePicker *)v9->_datePicker bottomAnchor];
    v64 = [v62 constraintEqualToSystemSpacingBelowAnchor:v63 multiplier:1.0];
  }
  else
  {
    if (v36)
    {
      v65 = [v27 objectForKeyedSubscript:@"allowMultilineTitleKey"];
      objc_msgSend(v26[150], "setNumberOfLines:", objc_msgSend(v65, "BOOLValue") ^ 1);

      v66 = [v26[150] topAnchor];
      v67 = [v42 topAnchor];
      v68 = [v66 constraintEqualToAnchor:v67];
      [v68 setActive:1];

      v69 = [v26[150] leadingAnchor];
      v70 = [v42 leadingAnchor];
      v71 = [v69 constraintEqualToAnchor:v70];
      [v71 setActive:1];

      v72 = [v26[150] bottomAnchor];
      v73 = [v42 bottomAnchor];
      v74 = [v72 constraintEqualToAnchor:v73];
      [v74 setActive:1];

      v75 = [(UIDatePicker *)v9->_datePicker topAnchor];
      v76 = [v43 topAnchor];
      v77 = [v75 constraintEqualToAnchor:v76];
      [v77 setActive:1];

      v78 = [(UIDatePicker *)v9->_datePicker leadingAnchor];
      v79 = [v26[150] trailingAnchor];
      [v78 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v79 multiplier:1.0];
    }
    else
    {
      [v26[150] setHidden:1];
      v80 = [(UIDatePicker *)v9->_datePicker topAnchor];
      v81 = [v43 topAnchor];
      v82 = [v80 constraintEqualToAnchor:v81];
      [v82 setActive:1];

      v78 = [(UIDatePicker *)v9->_datePicker leadingAnchor];
      v79 = [v43 leadingAnchor];
      [v78 constraintEqualToAnchor:v79];
    v83 = };
    [v83 setActive:1];

    v84 = [(UIDatePicker *)v9->_datePicker trailingAnchor];
    v85 = [v43 trailingAnchor];
    v86 = [v84 constraintEqualToAnchor:v85];
    [v86 setActive:1];

    v62 = [(UIDatePicker *)v9->_datePicker bottomAnchor];
    v63 = [v43 bottomAnchor];
    v64 = [v62 constraintEqualToAnchor:v63];
  }
  v87 = v64;
  [v64 setActive:1];

  v88 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v88 addObserver:v26 selector:sel_timeZoneChanged_ name:*MEMORY[0x1E4F1C4F8] object:0];

  id v8 = v90;
LABEL_16:

  return v9;
}

void __64__PSDateTimePickerCell_initWithStyle_reuseIdentifier_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  v3 = [*(id *)(a1 + 32) cellTarget];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) cellTarget];
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
  }
  else
  {
    v7 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v7);
  }
  id v8 = [v15 sender];
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);

  [MEMORY[0x1E4F9AA08] trackingControlValueChanged:v6 sender:v10];
  v11 = [*(id *)(a1 + 40) target];
  int v12 = [v11 conformsToProtocol:&unk_1EFBD3AB0];

  if (v12)
  {
    v13 = [*(id *)(a1 + 40) target];
    uint64_t v14 = [v15 sender];
    [v13 datePickerChanged:v14];
  }
}

- (void)timeZoneChanged:(id)a3
{
  datePicker = self->_datePicker;
  objc_msgSend(MEMORY[0x1E4F1CAF0], "systemTimeZone", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UIDatePicker *)datePicker setTimeZone:v4];
}

- (void)setTitle:(id)a3
{
}

- (id)datePicker
{
  return self->_datePicker;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSDateTimePickerCell;
  [(PSTableCell *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
}

@end
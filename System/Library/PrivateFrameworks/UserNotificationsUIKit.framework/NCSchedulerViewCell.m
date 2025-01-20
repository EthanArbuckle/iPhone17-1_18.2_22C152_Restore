@interface NCSchedulerViewCell
+ (double)_widthForHour:(unint64_t)a3;
+ (double)preferredHeightForText:(id)a3 width:(double)a4;
+ (id)_drawingContext;
+ (id)_font;
+ (id)reuseIdentifier;
- (NCSchedulerViewCell)initWithFrame:(CGRect)a3;
- (NCSchedulerViewCellDelegate)delegate;
- (double)_buttonSymbolSize;
- (void)_buttonPressed:(id)a3;
- (void)_timeChanged:(id)a3;
- (void)configureWithSymbolName:(id)a3 symbolColor:(id)a4 title:(id)a5 timeOfDay:(id)a6 delegate:(id)a7 top:(BOOL)a8 bottom:(BOOL)a9;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
@end

@implementation NCSchedulerViewCell

+ (id)reuseIdentifier
{
  return @"NCSchedulerViewCell";
}

+ (double)preferredHeightForText:(id)a3 width:(double)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a1 _font];
  [a1 _widthForHour:0];
  double v9 = v8;
  [a1 _widthForHour:12];
  if (v9 >= v10) {
    double v10 = v9;
  }
  double v11 = fmax(a4 - v10 + -8.0 + -38.0, 0.0);
  uint64_t v25 = *MEMORY[0x1E4FB06F8];
  v26[0] = v7;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  v13 = [(id)objc_opt_class() _drawingContext];
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v12, v13, v11, 0.0);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v27.origin.x = v15;
  v27.origin.y = v17;
  v27.size.width = v19;
  v27.size.height = v21;
  CGRectGetHeight(v27);

  _NCMainScreenScale();
  UICeilToScale();
  double v23 = v22;

  return v23;
}

- (void)configureWithSymbolName:(id)a3 symbolColor:(id)a4 title:(id)a5 timeOfDay:(id)a6 delegate:(id)a7 top:(BOOL)a8 bottom:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v15 = a9;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v33 = v16;
  id v21 = v17;
  button = self->_button;
  if (v33 && v21)
  {
    [(NCSymbolButton *)button setSymbolNamed:v33 color:v21 pointSize:9.0 backgroundDiameter:17.0];
    double v23 = 38.0;
  }
  else
  {
    [(NCSymbolButton *)button clearSymbol];
    double v23 = 16.0;
  }
  [(NSLayoutConstraint *)self->_labelLeadingConstraint setConstant:v23];
  [(UILabel *)self->_label setText:v18];
  if (v19)
  {
    v24 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v25 = [v19 hour];
    uint64_t v26 = [v19 minute];
    [MEMORY[0x1E4F1C9C8] now];
    id v27 = v18;
    v29 = BOOL v28 = v9;
    v30 = [v24 dateBySettingHour:v25 minute:v26 second:0 ofDate:v29 options:0];

    [(UIDatePicker *)self->_datePicker setDate:v30];
    BOOL v9 = v28;
    id v18 = v27;
    BOOL v15 = a9;
    [(UIDatePicker *)self->_datePicker setHidden:0];
  }
  else
  {
    [(UIDatePicker *)self->_datePicker setHidden:1];
  }
  if (v9) {
    double v31 = 16.0;
  }
  else {
    double v31 = 0.0;
  }
  [(NSLayoutConstraint *)self->_backgroundViewTopConstraint setConstant:v31];
  if (v15) {
    double v32 = 16.0;
  }
  else {
    double v32 = 0.0;
  }
  [(NSLayoutConstraint *)self->_backgroundViewBottomConstraint setConstant:v32];
  [(UIView *)self->_bottomLineView setHidden:v15];
  [(NCSchedulerViewCell *)self setDelegate:v20];
  [(NCSchedulerViewCell *)self setNeedsLayout];
}

- (NCSchedulerViewCell)initWithFrame:(CGRect)a3
{
  v148.receiver = self;
  v148.super_class = (Class)NCSchedulerViewCell;
  v3 = -[NCSchedulerViewCell initWithFrame:](&v148, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(NCSchedulerViewCell *)v3 traitCollection];
    if ([v5 userInterfaceStyle] == 2) {
      [MEMORY[0x1E4FB1618] systemGray5Color];
    }
    else {
    uint64_t v6 = [MEMORY[0x1E4FB1618] systemGray6Color];
    }

    v7 = [(NCSchedulerViewCell *)v4 traitCollection];
    if ([v7 userInterfaceStyle] == 2) {
      [MEMORY[0x1E4FB1618] systemGray3Color];
    }
    else {
    v146 = [MEMORY[0x1E4FB1618] systemGray4Color];
    }

    id v8 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], v10, v11, v12);
    topCornersView = v4->_topCornersView;
    v4->_topCornersView = (UIView *)v13;

    [(UIView *)v4->_topCornersView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_topCornersView _setContinuousCornerRadius:16.0];
    [(UIView *)v4->_topCornersView setBackgroundColor:v6];
    BOOL v15 = [(NCSchedulerViewCell *)v4 contentView];
    [v15 addSubview:v4->_topCornersView];

    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v9, v10, v11, v12);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (UIView *)v16;

    [(UIView *)v4->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_backgroundView setBackgroundColor:v6];
    id v18 = [(NCSchedulerViewCell *)v4 contentView];
    [v18 addSubview:v4->_backgroundView];

    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v9, v10, v11, v12);
    bottomCornersView = v4->_bottomCornersView;
    v4->_bottomCornersView = (UIView *)v19;

    [(UIView *)v4->_bottomCornersView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_bottomCornersView _setContinuousCornerRadius:16.0];
    [(UIView *)v4->_bottomCornersView setBackgroundColor:v6];
    id v21 = [(NCSchedulerViewCell *)v4 contentView];
    [v21 addSubview:v4->_bottomCornersView];

    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v9, v10, v11, v12);
    bottomLineView = v4->_bottomLineView;
    v4->_bottomLineView = (UIView *)v22;

    [(UIView *)v4->_bottomLineView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_bottomLineView setBackgroundColor:v146];
    v24 = [(NCSchedulerViewCell *)v4 contentView];
    [v24 addSubview:v4->_bottomLineView];

    uint64_t v25 = +[NCSymbolButton button];
    button = v4->_button;
    v4->_button = (NCSymbolButton *)v25;

    [(NCSymbolButton *)v4->_button setTranslatesAutoresizingMaskIntoConstraints:0];
    [(NCSymbolButton *)v4->_button addTarget:v4 action:sel__buttonPressed_ forControlEvents:64];
    id v27 = [(NCSchedulerViewCell *)v4 contentView];
    [v27 addSubview:v4->_button];

    uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v9, v10, v11, v12);
    label = v4->_label;
    v4->_label = (UILabel *)v28;

    [(UILabel *)v4->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v30 = v4->_label;
    double v31 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v30 setHighlightedTextColor:v31];

    double v32 = v4->_label;
    id v33 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v32 setTextColor:v33];

    [(UILabel *)v4->_label setNumberOfLines:0];
    v34 = v4->_label;
    v35 = [(id)objc_opt_class() _font];
    [(UILabel *)v34 setFont:v35];

    [(UILabel *)v4->_label setMinimumScaleFactor:0.5];
    [(UILabel *)v4->_label setAdjustsFontSizeToFitWidth:1];
    v36 = [(NCSchedulerViewCell *)v4 contentView];
    [v36 addSubview:v4->_label];

    uint64_t v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB16B0]), "initWithFrame:", v9, v10, v11, v12);
    datePicker = v4->_datePicker;
    v4->_datePicker = (UIDatePicker *)v37;

    [(UIDatePicker *)v4->_datePicker setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIDatePicker *)v4->_datePicker setDatePickerMode:0];
    [(UIDatePicker *)v4->_datePicker setPreferredDatePickerStyle:3];
    [(UIDatePicker *)v4->_datePicker setClipsToBounds:1];
    [(UIDatePicker *)v4->_datePicker addTarget:v4 action:sel__timeChanged_ forControlEvents:0x40000];
    v39 = [(NCSchedulerViewCell *)v4 contentView];
    [v39 addSubview:v4->_datePicker];

    id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v41 = [(UIView *)v4->_topCornersView topAnchor];
    v42 = [(NCSchedulerViewCell *)v4 contentView];
    [v42 topAnchor];
    v43 = v147 = (void *)v6;
    v44 = [v41 constraintEqualToAnchor:v43];
    [v40 addObject:v44];

    v45 = [(UIView *)v4->_topCornersView heightAnchor];
    v46 = [v45 constraintEqualToConstant:32.0];
    [v40 addObject:v46];

    v47 = [(UIView *)v4->_topCornersView leadingAnchor];
    v48 = [(NCSchedulerViewCell *)v4 contentView];
    v49 = [v48 leadingAnchor];
    v50 = [v47 constraintEqualToAnchor:v49];
    [v40 addObject:v50];

    v51 = [(NCSchedulerViewCell *)v4 contentView];
    v52 = [v51 trailingAnchor];
    v53 = [(UIView *)v4->_topCornersView trailingAnchor];
    v54 = [v52 constraintEqualToAnchor:v53];
    [v40 addObject:v54];

    v55 = [(UIView *)v4->_backgroundView topAnchor];
    v56 = [(NCSchedulerViewCell *)v4 contentView];
    v57 = [v56 topAnchor];
    uint64_t v58 = [v55 constraintEqualToAnchor:v57];
    backgroundViewTopConstraint = v4->_backgroundViewTopConstraint;
    v4->_backgroundViewTopConstraint = (NSLayoutConstraint *)v58;

    [v40 addObject:v4->_backgroundViewTopConstraint];
    v60 = [(NCSchedulerViewCell *)v4 contentView];
    v61 = [v60 bottomAnchor];
    v62 = [(UIView *)v4->_backgroundView bottomAnchor];
    uint64_t v63 = [v61 constraintEqualToAnchor:v62];
    backgroundViewBottomConstraint = v4->_backgroundViewBottomConstraint;
    v4->_backgroundViewBottomConstraint = (NSLayoutConstraint *)v63;

    [v40 addObject:v4->_backgroundViewBottomConstraint];
    v65 = [(UIView *)v4->_backgroundView leadingAnchor];
    v66 = [(NCSchedulerViewCell *)v4 contentView];
    v67 = [v66 leadingAnchor];
    v68 = [v65 constraintEqualToAnchor:v67];
    [v40 addObject:v68];

    v69 = [(NCSchedulerViewCell *)v4 contentView];
    v70 = [v69 trailingAnchor];
    v71 = [(UIView *)v4->_backgroundView trailingAnchor];
    v72 = [v70 constraintEqualToAnchor:v71];
    [v40 addObject:v72];

    v73 = [(NCSchedulerViewCell *)v4 contentView];
    v74 = [v73 bottomAnchor];
    v75 = [(UIView *)v4->_bottomCornersView bottomAnchor];
    v76 = [v74 constraintEqualToAnchor:v75];
    [v40 addObject:v76];

    v77 = [(UIView *)v4->_bottomCornersView heightAnchor];
    v78 = [v77 constraintEqualToConstant:32.0];
    [v40 addObject:v78];

    v79 = [(UIView *)v4->_bottomCornersView leadingAnchor];
    v80 = [(NCSchedulerViewCell *)v4 contentView];
    v81 = [v80 leadingAnchor];
    v82 = [v79 constraintEqualToAnchor:v81];
    [v40 addObject:v82];

    v83 = [(NCSchedulerViewCell *)v4 contentView];
    v84 = [v83 trailingAnchor];
    v85 = [(UIView *)v4->_bottomCornersView trailingAnchor];
    v86 = [v84 constraintEqualToAnchor:v85];
    [v40 addObject:v86];

    v87 = [(NCSchedulerViewCell *)v4 contentView];
    v88 = [v87 bottomAnchor];
    v89 = [(UIView *)v4->_bottomLineView bottomAnchor];
    v90 = [v88 constraintEqualToAnchor:v89];
    [v40 addObject:v90];

    v91 = [(UIView *)v4->_bottomLineView heightAnchor];
    v92 = [v91 constraintEqualToConstant:0.5];
    [v40 addObject:v92];

    v93 = [(UIView *)v4->_bottomLineView leadingAnchor];
    v94 = [(NCSchedulerViewCell *)v4 contentView];
    v95 = [v94 leadingAnchor];
    v96 = [v93 constraintEqualToAnchor:v95 constant:16.0];
    [v40 addObject:v96];

    v97 = [(NCSchedulerViewCell *)v4 contentView];
    v98 = [v97 trailingAnchor];
    v99 = [(UIView *)v4->_bottomLineView trailingAnchor];
    v100 = [v98 constraintEqualToAnchor:v99];
    [v40 addObject:v100];

    v101 = [(NCSymbolButton *)v4->_button topAnchor];
    v102 = [(NCSchedulerViewCell *)v4 contentView];
    v103 = [v102 topAnchor];
    v104 = [v101 constraintEqualToAnchor:v103];
    [v40 addObject:v104];

    v105 = [(NCSymbolButton *)v4->_button bottomAnchor];
    v106 = [(NCSchedulerViewCell *)v4 contentView];
    v107 = [v106 bottomAnchor];
    v108 = [v105 constraintEqualToAnchor:v107];
    [v40 addObject:v108];

    v109 = [(NCSymbolButton *)v4->_button widthAnchor];
    v110 = [v109 constraintEqualToConstant:44.0];
    [v40 addObject:v110];

    v111 = [(NCSymbolButton *)v4->_button leadingAnchor];
    v112 = [(NCSchedulerViewCell *)v4 contentView];
    v113 = [v112 leadingAnchor];
    v114 = [v111 constraintEqualToAnchor:v113 constant:-3.0];
    [v40 addObject:v114];

    v115 = [(UILabel *)v4->_label leadingAnchor];
    v116 = [(NCSchedulerViewCell *)v4 contentView];
    v117 = [v116 leadingAnchor];
    uint64_t v118 = [v115 constraintEqualToAnchor:v117];
    labelLeadingConstraint = v4->_labelLeadingConstraint;
    v4->_labelLeadingConstraint = (NSLayoutConstraint *)v118;

    [v40 addObject:v4->_labelLeadingConstraint];
    v120 = [(UILabel *)v4->_label centerYAnchor];
    v121 = [(NCSchedulerViewCell *)v4 contentView];
    v122 = [v121 centerYAnchor];
    v123 = [v120 constraintEqualToAnchor:v122];
    [v40 addObject:v123];

    v124 = [(UILabel *)v4->_label topAnchor];
    v125 = [(NCSchedulerViewCell *)v4 contentView];
    v126 = [v125 topAnchor];
    v127 = [v124 constraintGreaterThanOrEqualToAnchor:v126 constant:8.0];
    [v40 addObject:v127];

    v128 = [(NCSchedulerViewCell *)v4 contentView];
    v129 = [v128 bottomAnchor];
    v130 = [(UILabel *)v4->_label bottomAnchor];
    v131 = [v129 constraintGreaterThanOrEqualToAnchor:v130 constant:8.0];
    [v40 addObject:v131];

    v132 = [(NCSchedulerViewCell *)v4 contentView];
    v133 = [v132 trailingAnchor];
    v134 = [(UILabel *)v4->_label trailingAnchor];
    uint64_t v135 = [v133 constraintEqualToAnchor:v134 constant:0.0];
    labelTrailingConstraint = v4->_labelTrailingConstraint;
    v4->_labelTrailingConstraint = (NSLayoutConstraint *)v135;

    [v40 addObject:v4->_labelTrailingConstraint];
    v137 = [(UIDatePicker *)v4->_datePicker centerYAnchor];
    v138 = [(NCSchedulerViewCell *)v4 contentView];
    v139 = [v138 centerYAnchor];
    v140 = [v137 constraintEqualToAnchor:v139];
    [v40 addObject:v140];

    v141 = [(NCSchedulerViewCell *)v4 contentView];
    v142 = [v141 trailingAnchor];
    v143 = [(UIDatePicker *)v4->_datePicker trailingAnchor];
    v144 = [v142 constraintEqualToAnchor:v143 constant:0.0];
    [v40 addObject:v144];

    [MEMORY[0x1E4F28DC8] activateConstraints:v40];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)NCSchedulerViewCell;
  [(NCSchedulerViewCell *)&v3 prepareForReuse];
  [(NCSymbolButton *)self->_button clearSymbol];
  [(UILabel *)self->_label setText:0];
  [(NCSchedulerViewCell *)self setDelegate:0];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)NCSchedulerViewCell;
  [(NCSchedulerViewCell *)&v6 layoutSubviews];
  [(UIDatePicker *)self->_datePicker layoutIfNeeded];
  double v3 = 0.0;
  if (([(UIDatePicker *)self->_datePicker isHidden] & 1) == 0)
  {
    [(UIDatePicker *)self->_datePicker frame];
    double v3 = v4 + 8.0;
  }
  [(NSLayoutConstraint *)self->_labelTrailingConstraint constant];
  if (v3 != v5) {
    [(NSLayoutConstraint *)self->_labelTrailingConstraint setConstant:v3];
  }
}

+ (id)_drawingContext
{
  v2 = (void *)_drawingContext___drawingContext;
  if (!_drawingContext___drawingContext)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FB0860]);
    double v4 = (void *)_drawingContext___drawingContext;
    _drawingContext___drawingContext = (uint64_t)v3;

    [(id)_drawingContext___drawingContext setWantsNumberOfLineFragments:1];
    v2 = (void *)_drawingContext___drawingContext;
  }

  return v2;
}

+ (double)_widthForHour:(unint64_t)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v4 setHour:a3];
  [v4 setMinute:0];
  double v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v7 = (void *)MEMORY[0x1E4F28C10];
  id v8 = [MEMORY[0x1E4F1CA20] currentLocale];
  double v9 = [v7 dateFormatFromTemplate:@"j" options:0 locale:v8];

  double v10 = @"jmm";
  if ([v9 rangeOfString:@"a"] != 0x7FFFFFFFFFFFFFFFLL && !objc_msgSend(v4, "minute")) {
    double v10 = @"j";
  }
  [v6 setLocalizedDateFormatFromTemplate:v10];
  double v11 = [v5 dateFromComponents:v4];
  double v12 = [v6 stringFromDate:v11];
  uint64_t v19 = *MEMORY[0x1E4FB06F8];
  uint64_t v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  v20[0] = v13;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  BOOL v15 = [(id)objc_opt_class() _drawingContext];
  objc_msgSend(v12, "boundingRectWithSize:options:attributes:context:", 1, v14, v15, 0.0, 0.0);
  double Width = CGRectGetWidth(v21);

  if (Width <= 0.0) {
    double v17 = 0.0;
  }
  else {
    double v17 = Width * 1.25;
  }

  return v17;
}

- (void)_timeChanged:(id)a3
{
  id v7 = [(NCSchedulerViewCell *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    double v5 = [(UIDatePicker *)self->_datePicker date];
    id v6 = [v4 components:96 fromDate:v5];

    [v7 schedulerCell:self didChangeTime:v6];
  }
}

- (void)_buttonPressed:(id)a3
{
  id v4 = [(NCSchedulerViewCell *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 schedulerCellButtonPressed:self];
  }
}

- (double)_buttonSymbolSize
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  [v2 pointSize];
  double v4 = v3;

  return v4;
}

+ (id)_font
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

- (NCSchedulerViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCSchedulerViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomLineView, 0);
  objc_storeStrong((id *)&self->_bottomCornersView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_topCornersView, 0);
  objc_storeStrong((id *)&self->_labelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_labelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end
@interface SCLHistoryItemView
- (NSArray)unconditionalConstraints;
- (NSArray)verticalLayoutConstraints;
- (SCLHistoryGroup)historyGroup;
- (SCLHistoryItemView)initWithFrame:(CGRect)a3;
- (SCLTimeIntervalsFormatter)intervalsFormatter;
- (SCLUnlockHistoryItemFormatter)historyItemFormatter;
- (UILabel)intervalLabel;
- (UILabel)label;
- (id)viewForFirstBaselineLayout;
- (void)setHistoryGroup:(id)a3;
- (void)setHistoryItemFormatter:(id)a3;
- (void)setIntervalLabel:(id)a3;
- (void)setIntervalsFormatter:(id)a3;
- (void)setLabel:(id)a3;
- (void)setUnconditionalConstraints:(id)a3;
- (void)setVerticalLayoutConstraints:(id)a3;
- (void)updateConstraints;
@end

@implementation SCLHistoryItemView

- (SCLHistoryItemView)initWithFrame:(CGRect)a3
{
  v76[14] = *MEMORY[0x263EF8340];
  v74.receiver = self;
  v74.super_class = (Class)SCLHistoryItemView;
  v3 = -[SCLHistoryItemView initWithFrame:](&v74, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    [(SCLHistoryItemView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_label setNumberOfLines:0];
    LODWORD(v7) = 1144733696;
    [(UILabel *)v3->_label setContentCompressionResistancePriority:0 forAxis:v7];
    LODWORD(v8) = 1144733696;
    [(UILabel *)v3->_label setContentHuggingPriority:0 forAxis:v8];
    [(SCLHistoryItemView *)v3 addSubview:v3->_label];
    id v9 = objc_alloc(MEMORY[0x263F1C768]);
    [(SCLHistoryItemView *)v3 bounds];
    uint64_t v10 = objc_msgSend(v9, "initWithFrame:");
    intervalLabel = v3->_intervalLabel;
    v3->_intervalLabel = (UILabel *)v10;

    v12 = v3->_intervalLabel;
    v13 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    [(UILabel *)v12 setFont:v13];

    [(UILabel *)v3->_intervalLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_intervalLabel setNumberOfLines:0];
    [(SCLHistoryItemView *)v3 addSubview:v3->_intervalLabel];
    id v14 = objc_alloc_init(MEMORY[0x263F1C778]);
    [v14 setIdentifier:@"horizontalContentGuide"];
    [(SCLHistoryItemView *)v3 addLayoutGuide:v14];
    id v15 = objc_alloc_init(MEMORY[0x263F1C778]);
    [v15 setIdentifier:@"textAlignmentGuide"];
    [(SCLHistoryItemView *)v3 addLayoutGuide:v15];
    v16 = [v14 leadingAnchor];
    v17 = [(SCLHistoryItemView *)v3 leadingAnchor];
    v73 = [v16 constraintEqualToAnchor:v17 constant:15.0];

    [v73 setIdentifier:@"contentGuide.leading"];
    v18 = [v14 trailingAnchor];
    v19 = [(SCLHistoryItemView *)v3 trailingAnchor];
    v72 = [v18 constraintEqualToAnchor:v19 constant:-15.0];

    [v72 setIdentifier:@"contentGuide.trailing"];
    v20 = [v14 heightAnchor];
    v71 = [v20 constraintEqualToConstant:0.0];

    [v71 setIdentifier:@"contentGuide.height"];
    v21 = [v14 topAnchor];
    v22 = [(SCLHistoryItemView *)v3 topAnchor];
    v70 = [v21 constraintEqualToAnchor:v22];

    [v70 setIdentifier:@"contentGuide.top"];
    v23 = [v15 centerYAnchor];
    v24 = [(SCLHistoryItemView *)v3 topAnchor];
    v69 = [v23 constraintEqualToAnchor:v24];

    [v69 setIdentifier:@"textAlignment.centerY"];
    v25 = [v15 centerXAnchor];
    v26 = [v14 centerXAnchor];
    v68 = [v25 constraintEqualToAnchor:v26];

    [v68 setIdentifier:@"textAlignment.centerX"];
    v27 = [v15 heightAnchor];
    v66 = [v27 constraintEqualToConstant:0.0];

    [v66 setIdentifier:@"textAlignment.height"];
    v67 = v15;
    v28 = [v15 widthAnchor];
    v65 = [v28 constraintEqualToConstant:20.0];

    [v65 setIdentifier:@"textAlignment.width"];
    v29 = [(UILabel *)v3->_intervalLabel leadingAnchor];
    v30 = [v14 leadingAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];

    [v31 setIdentifier:@"intervalLabel.leading"];
    v32 = [(UILabel *)v3->_intervalLabel topAnchor];
    v33 = [(SCLHistoryItemView *)v3 topAnchor];
    v64 = [v32 constraintEqualToSystemSpacingBelowAnchor:v33 multiplier:1.0];

    [v64 setIdentifier:@"intervalLabel.top"];
    v34 = [(UILabel *)v3->_intervalLabel trailingAnchor];
    v35 = [v15 leadingAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];

    [v36 setIdentifier:@"intervalLabel.trailing"];
    LODWORD(v37) = 1132068864;
    v38 = v36;
    [v36 setPriority:v37];
    v39 = [(SCLHistoryItemView *)v3 bottomAnchor];
    v40 = [(UILabel *)v3->_label bottomAnchor];
    v63 = [v39 constraintEqualToSystemSpacingBelowAnchor:v40 multiplier:1.0];

    LODWORD(v41) = 1144750080;
    [v63 setPriority:v41];
    v42 = [(UILabel *)v3->_intervalLabel widthAnchor];
    v43 = [v14 widthAnchor];
    v44 = [v42 constraintLessThanOrEqualToAnchor:v43];

    [v44 setIdentifier:@"intervalLabel.width"];
    v45 = [(UILabel *)v3->_label widthAnchor];
    v46 = [v14 widthAnchor];
    v47 = [v45 constraintLessThanOrEqualToAnchor:v46];

    [v47 setIdentifier:@"itemLabel.width"];
    v76[0] = v73;
    v76[1] = v72;
    v76[2] = v70;
    v76[3] = v71;
    v76[4] = v68;
    v76[5] = v69;
    v76[6] = v66;
    v76[7] = v65;
    v76[8] = v31;
    v76[9] = v64;
    v76[10] = v38;
    v76[11] = v63;
    v76[12] = v44;
    v76[13] = v47;
    uint64_t v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:14];
    unconditionalConstraints = v3->_unconditionalConstraints;
    v3->_unconditionalConstraints = (NSArray *)v48;

    [MEMORY[0x263F08938] activateConstraints:v3->_unconditionalConstraints];
    v50 = [(UILabel *)v3->_label leadingAnchor];
    v51 = [v14 leadingAnchor];
    v52 = [v50 constraintEqualToAnchor:v51];

    v53 = [(UILabel *)v3->_label trailingAnchor];
    v54 = [v14 trailingAnchor];
    v55 = [v53 constraintLessThanOrEqualToAnchor:v54];

    LODWORD(v56) = 1144750080;
    [v55 setPriority:v56];
    v57 = [(UILabel *)v3->_label topAnchor];
    v58 = [(UILabel *)v3->_intervalLabel bottomAnchor];
    v59 = [v57 constraintEqualToSystemSpacingBelowAnchor:v58 multiplier:1.0];

    v75[0] = v52;
    v75[1] = v55;
    v75[2] = v59;
    uint64_t v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:v75 count:3];
    verticalLayoutConstraints = v3->_verticalLayoutConstraints;
    v3->_verticalLayoutConstraints = (NSArray *)v60;

    [MEMORY[0x263F08938] activateConstraints:v3->_verticalLayoutConstraints];
  }
  return v3;
}

- (void)updateConstraints
{
  v2.receiver = self;
  v2.super_class = (Class)SCLHistoryItemView;
  [(SCLHistoryItemView *)&v2 updateConstraints];
}

- (id)viewForFirstBaselineLayout
{
  return self->_intervalLabel;
}

- (SCLUnlockHistoryItemFormatter)historyItemFormatter
{
  historyItemFormatter = self->_historyItemFormatter;
  if (!historyItemFormatter)
  {
    id v4 = objc_alloc_init(SCLUnlockHistoryItemFormatter);
    uint64_t v5 = self->_historyItemFormatter;
    self->_historyItemFormatter = v4;

    historyItemFormatter = self->_historyItemFormatter;
  }

  return historyItemFormatter;
}

- (SCLTimeIntervalsFormatter)intervalsFormatter
{
  intervalsFormatter = self->_intervalsFormatter;
  if (!intervalsFormatter)
  {
    id v4 = (SCLTimeIntervalsFormatter *)objc_alloc_init(MEMORY[0x263F66FA8]);
    uint64_t v5 = self->_intervalsFormatter;
    self->_intervalsFormatter = v4;

    intervalsFormatter = self->_intervalsFormatter;
  }

  return intervalsFormatter;
}

- (void)setHistoryGroup:(id)a3
{
  v53[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_historyGroup, a3);
  uint64_t v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  unint64_t v7 = 0x263F08000uLL;
  id v8 = objc_alloc_init(MEMORY[0x263F089B8]);
  [v8 beginEditing];
  v44 = v5;
  id v9 = [v5 items];
  unint64_t v10 = 0x263F08000uLL;
  v42 = v9;
  if ([v9 count])
  {
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"UNLOCK_HISTORY_UNLOCKED_SECTION_TITLE" value:&stru_26E283B80 table:@"SchoolTimeSettings"];

    id v13 = objc_alloc(MEMORY[0x263F086A0]);
    [v12 stringByAppendingString:@"\n"];
    v15 = id v14 = v9;
    uint64_t v16 = *MEMORY[0x263F814F0];
    v53[0] = v6;
    uint64_t v17 = *MEMORY[0x263F81500];
    uint64_t v43 = v16;
    v52[0] = v16;
    v52[1] = v17;
    uint64_t v41 = v17;
    v18 = [MEMORY[0x263F1C550] whiteColor];
    v53[1] = v18;
    [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];
    v20 = v19 = self;
    v21 = (void *)[v13 initWithString:v15 attributes:v20];

    self = v19;
    [v8 appendAttributedString:v21];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __38__SCLHistoryItemView_setHistoryGroup___block_invoke;
    v45[3] = &unk_2649FA9F8;
    v45[4] = v19;
    id v46 = v8;
    id v22 = v14;
    unint64_t v10 = 0x263F08000;
    id v47 = v22;
    [v22 enumerateObjectsUsingBlock:v45];

    unint64_t v7 = 0x263F08000;
  }
  else
  {
    uint64_t v43 = *MEMORY[0x263F814F0];
    uint64_t v41 = *MEMORY[0x263F81500];
  }
  [v8 endEditing];
  [(UILabel *)self->_label setAttributedText:v8];
  id v23 = objc_alloc_init(*(Class *)(v7 + 2488));
  id v24 = objc_alloc(MEMORY[0x263F086A0]);
  v25 = [*(id *)(v10 + 1760) bundleForClass:objc_opt_class()];
  v26 = [v25 localizedStringForKey:@"UNLOCK_HISTORY_SCHEDULE_SECTION_TITLE" value:&stru_26E283B80 table:@"SchoolTimeSettings"];
  v40 = (void *)v6;
  v51[0] = v6;
  v50[0] = v43;
  v50[1] = v41;
  [MEMORY[0x263F1C550] whiteColor];
  v28 = v27 = self;
  v51[1] = v28;
  v29 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
  v30 = (void *)[v24 initWithString:v26 attributes:v29];
  [v23 appendAttributedString:v30];

  v31 = [v23 mutableString];
  [v31 appendString:@"\n"];

  v32 = [(SCLHistoryItemView *)v27 intervalsFormatter];
  v33 = [v44 effectiveSchedule];
  v34 = [v33 uniformTimeIntervals];
  v35 = [v32 stringFromTimeIntervals:v34];

  id v36 = objc_alloc(MEMORY[0x263F086A0]);
  v48[1] = v41;
  v49[0] = v40;
  v48[0] = v43;
  double v37 = [MEMORY[0x263F1C550] tableCellGrayTextColor];
  v49[1] = v37;
  v38 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
  v39 = (void *)[v36 initWithString:v35 attributes:v38];
  [v23 appendAttributedString:v39];

  [(UILabel *)v27->_intervalLabel setAttributedText:v23];
  [(SCLHistoryItemView *)v27 setNeedsUpdateConstraints];
  [(SCLHistoryItemView *)v27 setNeedsLayout];
}

void __38__SCLHistoryItemView_setHistoryGroup___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  unint64_t v7 = [v5 historyItemFormatter];
  id v9 = [v7 attributedStringForObjectValue:v6 withDefaultAttributes:0];

  [*(id *)(a1 + 40) appendAttributedString:v9];
  if (a3 + 1 < (unint64_t)[*(id *)(a1 + 48) count])
  {
    id v8 = [*(id *)(a1 + 40) mutableString];
    [v8 appendString:@"\n"];
  }
}

- (void)setHistoryItemFormatter:(id)a3
{
}

- (void)setIntervalsFormatter:(id)a3
{
}

- (SCLHistoryGroup)historyGroup
{
  return self->_historyGroup;
}

- (NSArray)verticalLayoutConstraints
{
  return self->_verticalLayoutConstraints;
}

- (void)setVerticalLayoutConstraints:(id)a3
{
}

- (NSArray)unconditionalConstraints
{
  return self->_unconditionalConstraints;
}

- (void)setUnconditionalConstraints:(id)a3
{
}

- (UILabel)intervalLabel
{
  return self->_intervalLabel;
}

- (void)setIntervalLabel:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_intervalLabel, 0);
  objc_storeStrong((id *)&self->_unconditionalConstraints, 0);
  objc_storeStrong((id *)&self->_verticalLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_historyGroup, 0);
  objc_storeStrong((id *)&self->_intervalsFormatter, 0);

  objc_storeStrong((id *)&self->_historyItemFormatter, 0);
}

@end
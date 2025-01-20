@interface ICSBackupCardCell
+ (_NSRange)_rangeForLinkFromSpecifier:(id)a3;
+ (id)_attributedStringFromSpecifier:(id)a3;
+ (id)_subTitleAttributes;
+ (id)_subTitleFont;
+ (int64_t)cellStyle;
- (ICSBackupCardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)headerImageView;
- (UILabel)headerTitleLabel;
- (UITextView)headerSubTitleTextView;
- (void)_setupViews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setHeaderImageView:(id)a3;
- (void)setHeaderSubTitleTextView:(id)a3;
- (void)setHeaderTitleLabel:(id)a3;
@end

@implementation ICSBackupCardCell

- (ICSBackupCardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ICSBackupCardCell;
  v4 = [(ICSBackupCardCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(ICSBackupCardCell *)v4 setSelectionStyle:0];
    [(ICSBackupCardCell *)v5 _setupViews];
  }
  return v5;
}

+ (int64_t)cellStyle
{
  return 0;
}

- (void)_setupViews
{
  v98[12] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F82828]);
  [(ICSBackupCardCell *)self setHeaderImageView:v3];

  v4 = [(ICSBackupCardCell *)self headerImageView];
  [v4 setContentMode:1];

  v5 = [(ICSBackupCardCell *)self headerImageView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(ICSBackupCardCell *)self headerImageView];
  LODWORD(v7) = 1132068864;
  [v6 setContentCompressionResistancePriority:1 forAxis:v7];

  id v8 = objc_alloc_init(MEMORY[0x263F828E0]);
  [(ICSBackupCardCell *)self setHeaderTitleLabel:v8];

  v9 = [(ICSBackupCardCell *)self headerTitleLabel];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(ICSBackupCardCell *)self headerTitleLabel];
  v11 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83618] weight:*MEMORY[0x263F81800]];
  [v10 setFont:v11];

  v12 = [(ICSBackupCardCell *)self headerTitleLabel];
  v13 = [MEMORY[0x263F825C8] labelColor];
  [v12 setTextColor:v13];

  v14 = [(ICSBackupCardCell *)self headerTitleLabel];
  [v14 setNumberOfLines:5];

  v15 = [(ICSBackupCardCell *)self headerTitleLabel];
  [v15 setTextAlignment:1];

  v16 = [(ICSBackupCardCell *)self headerTitleLabel];
  LODWORD(v17) = 1148846080;
  [v16 setContentCompressionResistancePriority:1 forAxis:v17];

  id v18 = objc_alloc_init(MEMORY[0x263F82D60]);
  [(ICSBackupCardCell *)self setHeaderSubTitleTextView:v18];

  v19 = [(ICSBackupCardCell *)self headerSubTitleTextView];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

  v20 = +[ICSBackupCardCell _subTitleFont];
  v21 = [(ICSBackupCardCell *)self headerSubTitleTextView];
  [v21 setFont:v20];

  double v22 = *MEMORY[0x263F834E8];
  double v23 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v24 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v25 = *(double *)(MEMORY[0x263F834E8] + 24);
  v26 = [(ICSBackupCardCell *)self headerSubTitleTextView];
  objc_msgSend(v26, "setLayoutMargins:", v22, v23, v24, v25);

  v27 = [(ICSBackupCardCell *)self headerSubTitleTextView];
  objc_msgSend(v27, "setTextContainerInset:", v22, v23, v24, v25);

  v28 = [(ICSBackupCardCell *)self headerSubTitleTextView];
  [v28 setTextAlignment:1];

  v29 = [(ICSBackupCardCell *)self headerSubTitleTextView];
  [v29 setScrollEnabled:0];

  v30 = [(ICSBackupCardCell *)self headerSubTitleTextView];
  [v30 setSelectable:1];

  v31 = [(ICSBackupCardCell *)self headerSubTitleTextView];
  [v31 setEditable:0];

  v32 = [MEMORY[0x263F825C8] clearColor];
  v33 = [(ICSBackupCardCell *)self headerSubTitleTextView];
  [v33 setBackgroundColor:v32];

  v34 = [(ICSBackupCardCell *)self contentView];
  v35 = [(ICSBackupCardCell *)self headerImageView];
  [v34 addSubview:v35];

  v36 = [(ICSBackupCardCell *)self contentView];
  v37 = [(ICSBackupCardCell *)self headerTitleLabel];
  [v36 addSubview:v37];

  v38 = [(ICSBackupCardCell *)self contentView];
  v39 = [(ICSBackupCardCell *)self headerSubTitleTextView];
  [v38 addSubview:v39];

  v75 = (void *)MEMORY[0x263F08938];
  v97 = [(ICSBackupCardCell *)self headerImageView];
  v96 = [v97 heightAnchor];
  v95 = [v96 constraintEqualToConstant:56.0];
  v98[0] = v95;
  v94 = [(ICSBackupCardCell *)self headerImageView];
  v93 = [v94 widthAnchor];
  v92 = [v93 constraintEqualToConstant:56.0];
  v98[1] = v92;
  v91 = [(ICSBackupCardCell *)self headerImageView];
  v89 = [v91 leadingAnchor];
  v90 = [(ICSBackupCardCell *)self contentView];
  v88 = [v90 leadingAnchor];
  v87 = [v89 constraintEqualToAnchor:v88 constant:24.0];
  v98[2] = v87;
  v86 = [(ICSBackupCardCell *)self headerImageView];
  v84 = [v86 centerXAnchor];
  v85 = [(ICSBackupCardCell *)self contentView];
  v83 = [v85 centerXAnchor];
  v82 = [v84 constraintEqualToAnchor:v83];
  v98[3] = v82;
  v81 = [(ICSBackupCardCell *)self headerImageView];
  v79 = [v81 topAnchor];
  v80 = [(ICSBackupCardCell *)self contentView];
  v78 = [v80 topAnchor];
  v77 = [v79 constraintEqualToAnchor:v78 constant:32.0];
  v98[4] = v77;
  v76 = [(ICSBackupCardCell *)self headerImageView];
  v73 = [v76 bottomAnchor];
  v74 = [(ICSBackupCardCell *)self headerTitleLabel];
  v72 = [v74 topAnchor];
  v71 = [v73 constraintEqualToAnchor:v72 constant:-16.0];
  v98[5] = v71;
  v70 = [(ICSBackupCardCell *)self headerTitleLabel];
  v68 = [v70 leadingAnchor];
  v69 = [(ICSBackupCardCell *)self contentView];
  v67 = [v69 leadingAnchor];
  v66 = [v68 constraintEqualToAnchor:v67 constant:24.0];
  v98[6] = v66;
  v65 = [(ICSBackupCardCell *)self headerTitleLabel];
  v63 = [v65 centerXAnchor];
  v64 = [(ICSBackupCardCell *)self contentView];
  v62 = [v64 centerXAnchor];
  v61 = [v63 constraintEqualToAnchor:v62];
  v98[7] = v61;
  v60 = [(ICSBackupCardCell *)self headerTitleLabel];
  v58 = [v60 bottomAnchor];
  v59 = [(ICSBackupCardCell *)self headerSubTitleTextView];
  v57 = [v59 topAnchor];
  v56 = [v58 constraintEqualToAnchor:v57 constant:-8.0];
  v98[8] = v56;
  v55 = [(ICSBackupCardCell *)self headerSubTitleTextView];
  v53 = [v55 leadingAnchor];
  v54 = [(ICSBackupCardCell *)self contentView];
  v52 = [v54 leadingAnchor];
  v51 = [v53 constraintEqualToAnchor:v52 constant:24.0];
  v98[9] = v51;
  v50 = [(ICSBackupCardCell *)self headerSubTitleTextView];
  v40 = [v50 centerXAnchor];
  v41 = [(ICSBackupCardCell *)self contentView];
  v42 = [v41 centerXAnchor];
  v43 = [v40 constraintEqualToAnchor:v42];
  v98[10] = v43;
  v44 = [(ICSBackupCardCell *)self headerSubTitleTextView];
  v45 = [v44 bottomAnchor];
  v46 = [(ICSBackupCardCell *)self contentView];
  v47 = [v46 bottomAnchor];
  v48 = [v45 constraintEqualToAnchor:v47 constant:-12.0];
  v98[11] = v48;
  v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:12];
  [v75 activateConstraints:v49];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICSBackupCardCell;
  [(PSTableCell *)&v15 refreshCellContentsWithSpecifier:v4];
  v5 = [(PSTableCell *)self titleLabel];
  [v5 setText:&stru_270DEF3F8];

  v6 = [(ICSBackupCardCell *)self imageView];
  [v6 setImage:0];

  double v7 = [(ICSBackupCardCell *)self headerImageView];
  id v8 = [v4 propertyForKey:*MEMORY[0x263F60140]];
  [v7 setImage:v8];

  v9 = [(ICSBackupCardCell *)self headerTitleLabel];
  v10 = [v4 propertyForKey:*MEMORY[0x263F602D0]];
  [v9 setText:v10];

  v11 = +[ICSBackupCardCell _attributedStringFromSpecifier:v4];
  v12 = [(ICSBackupCardCell *)self headerSubTitleTextView];
  v13 = v12;
  if (v11)
  {
    [v12 setAttributedText:v11];
  }
  else
  {
    v14 = [v4 propertyForKey:*MEMORY[0x263F602C8]];
    [v13 setText:v14];
  }
  [(ICSBackupCardCell *)self setNeedsLayout];
}

+ (id)_subTitleFont
{
  return (id)[MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F835F0] weight:*MEMORY[0x263F81838]];
}

+ (id)_subTitleAttributes
{
  v8[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F81650]);
  [v3 setAlignment:1];
  v7[0] = *MEMORY[0x263F814F0];
  id v4 = [a1 _subTitleFont];
  v7[1] = *MEMORY[0x263F81540];
  v8[0] = v4;
  v8[1] = v3;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (_NSRange)_rangeForLinkFromSpecifier:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F602C8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:v3];
  v6 = [v4 objectForKeyedSubscript:ICQUILearnMoreTextKey];
  double v7 = [v4 objectForKeyedSubscript:ICQUILearnMoreLinkKey];

  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || v7 == 0)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  else
  {
    v12 = [v5 componentsSeparatedByString:@"%@"];
    if ([v12 count] == 2)
    {
      v13 = [v12 objectAtIndexedSubscript:0];
      uint64_t v10 = [v13 length];
      uint64_t v11 = [v7 length];
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
    }
  }
  NSUInteger v14 = v10;
  NSUInteger v15 = v11;
  result.length = v15;
  result.location = v14;
  return result;
}

+ (id)_attributedStringFromSpecifier:(id)a3
{
  v29[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F602C8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:v4];
  double v7 = [v5 objectForKeyedSubscript:ICQUILearnMoreTextKey];
  BOOL v8 = [v5 objectForKeyedSubscript:ICQUILearnMoreLinkKey];

  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v8 == 0)
  {
    uint64_t v11 = 0;
  }
  else
  {
    v12 = [v6 componentsSeparatedByString:@"%@"];
    if ([v12 count] == 2)
    {
      double v25 = [v12 objectAtIndexedSubscript:0];
      double v23 = [v12 objectAtIndexedSubscript:1];
      uint64_t v28 = *MEMORY[0x263F81500];
      uint64_t v13 = v28;
      NSUInteger v14 = [MEMORY[0x263F825C8] labelColor];
      v29[0] = v14;
      double v24 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];

      NSUInteger v15 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v25 attributes:v24];
      v26[0] = v13;
      v16 = [MEMORY[0x263F825C8] systemBlueColor];
      v27[0] = v16;
      v26[1] = *MEMORY[0x263F81520];
      double v17 = [NSURL URLWithString:v8];
      v27[1] = v17;
      id v18 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];

      v19 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v7 attributes:v18];
      [v15 appendAttributedString:v19];
      v20 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v23];
      [v15 appendAttributedString:v20];
      v21 = [a1 _subTitleAttributes];
      objc_msgSend(v15, "addAttributes:range:", v21, 0, objc_msgSend(v15, "length"));

      uint64_t v11 = (void *)[v15 copy];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }

  return v11;
}

- (UIImageView)headerImageView
{
  return self->_headerImageView;
}

- (void)setHeaderImageView:(id)a3
{
}

- (UILabel)headerTitleLabel
{
  return self->_headerTitleLabel;
}

- (void)setHeaderTitleLabel:(id)a3
{
}

- (UITextView)headerSubTitleTextView
{
  return self->_headerSubTitleTextView;
}

- (void)setHeaderSubTitleTextView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerSubTitleTextView, 0);
  objc_storeStrong((id *)&self->_headerTitleLabel, 0);

  objc_storeStrong((id *)&self->_headerImageView, 0);
}

@end
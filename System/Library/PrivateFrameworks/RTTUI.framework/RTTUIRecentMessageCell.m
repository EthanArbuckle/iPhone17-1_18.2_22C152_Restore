@interface RTTUIRecentMessageCell
- (UILabel)label;
- (int64_t)selectionStyle;
- (void)configureWithUtterance:(id)a3 needsPrefix:(BOOL)a4 otherContactDisplayName:(id)a5;
- (void)setLabel:(id)a3;
@end

@implementation RTTUIRecentMessageCell

- (int64_t)selectionStyle
{
  return 0;
}

- (void)configureWithUtterance:(id)a3 needsPrefix:(BOOL)a4 otherContactDisplayName:(id)a5
{
  BOOL v6 = a4;
  v88[8] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v84 = a5;
  v9 = [(RTTUIRecentMessageCell *)self label];

  BOOL v85 = v6;
  if (!v9)
  {
    id v10 = objc_alloc(MEMORY[0x263F1CB98]);
    v11 = (void *)MEMORY[0x263F1CB58];
    v12 = [MEMORY[0x263F1C480] effectWithStyle:9];
    v13 = [v11 effectForBlurEffect:v12 style:0];
    v14 = (void *)[v10 initWithEffect:v13];

    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = objc_opt_new();
    [(RTTUIRecentMessageCell *)self setLabel:v15];

    v16 = [(RTTUIRecentMessageCell *)self label];
    [v16 setNumberOfLines:0];

    v17 = [(RTTUIRecentMessageCell *)self label];
    [v17 setAdjustsFontForContentSizeCategory:1];

    v18 = [(RTTUIRecentMessageCell *)self label];
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

    v19 = [(RTTUIRecentMessageCell *)self contentView];
    [v19 addSubview:v14];

    v20 = [v14 contentView];
    v21 = [(RTTUIRecentMessageCell *)self label];
    [v20 addSubview:v21];

    v66 = (void *)MEMORY[0x263F08938];
    v81 = [v14 leadingAnchor];
    v82 = [(RTTUIRecentMessageCell *)self contentView];
    v80 = [v82 leadingAnchor];
    v79 = [v81 constraintEqualToAnchor:v80];
    v88[0] = v79;
    v77 = [v14 topAnchor];
    v78 = [(RTTUIRecentMessageCell *)self contentView];
    v76 = [v78 topAnchor];
    v75 = [v77 constraintEqualToAnchor:v76];
    v88[1] = v75;
    v73 = [v14 trailingAnchor];
    v74 = [(RTTUIRecentMessageCell *)self contentView];
    v72 = [v74 trailingAnchor];
    v71 = [v73 constraintEqualToAnchor:v72];
    v88[2] = v71;
    v69 = [v14 bottomAnchor];
    v70 = [(RTTUIRecentMessageCell *)self contentView];
    v68 = [v70 bottomAnchor];
    v67 = [v69 constraintEqualToAnchor:v68];
    v88[3] = v67;
    v65 = [(RTTUIRecentMessageCell *)self label];
    v63 = [v65 leadingAnchor];
    v64 = [v14 contentView];
    v62 = [v64 leadingAnchor];
    v61 = [v63 constraintEqualToAnchor:v62];
    v88[4] = v61;
    v60 = [(RTTUIRecentMessageCell *)self label];
    v58 = [v60 topAnchor];
    v59 = [v14 contentView];
    v57 = [v59 topAnchor];
    v56 = [v58 constraintEqualToAnchor:v57];
    v88[5] = v56;
    v55 = [(RTTUIRecentMessageCell *)self label];
    v53 = [v55 trailingAnchor];
    v54 = [v14 contentView];
    v22 = [v54 trailingAnchor];
    v23 = [v53 constraintEqualToAnchor:v22];
    v88[6] = v23;
    v24 = [(RTTUIRecentMessageCell *)self label];
    [v24 bottomAnchor];
    v25 = id v83 = v8;
    v26 = [v14 contentView];
    v27 = [v26 bottomAnchor];
    v28 = [v25 constraintEqualToAnchor:v27];
    v88[7] = v28;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v88 count:8];
    [v66 activateConstraints:v29];

    id v8 = v83;
    BOOL v6 = v85;
  }
  v30 = [MEMORY[0x263F1C460] clearConfiguration];
  [(RTTUIRecentMessageCell *)self setBackgroundConfiguration:v30];

  if ([v8 isMe]) {
    [MEMORY[0x263F1C550] secondaryLabelColor];
  }
  else {
  v31 = [MEMORY[0x263F1C550] labelColor];
  }
  uint64_t v32 = *MEMORY[0x263F1D260];
  v33 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  v34 = [MEMORY[0x263F1C658] _preferredFontForTextStyle:v32 weight:*MEMORY[0x263F1D340]];
  v35 = [v8 text];
  if ([v8 isTranscription])
  {
    v36 = [v33 fontDescriptor];
    v37 = [v36 fontDescriptorWithSymbolicTraits:1];

    v38 = (void *)MEMORY[0x263F1C658];
    [v33 pointSize];
    uint64_t v39 = objc_msgSend(v38, "fontWithDescriptor:size:", v37);

    v33 = (void *)v39;
  }
  if (v6)
  {
    if ([v8 isMe])
    {
      v40 = ttyLocString();
      v41 = [v8 text];
      id v52 = v41;
    }
    else
    {
      v40 = ttyLocString();
      v41 = [v8 text];
      id v52 = v84;
    }
    v43 = AXCFormattedString();

    v44 = objc_msgSend(v8, "text", v52);
    uint64_t v45 = [v43 rangeOfString:v44];

    if (v45 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v42 = 0;
    }
    else {
      uint64_t v42 = v45;
    }
    v35 = v43;
  }
  else
  {
    uint64_t v42 = 0;
  }
  id v46 = objc_alloc(MEMORY[0x263F089B8]);
  uint64_t v47 = *MEMORY[0x263F1C238];
  uint64_t v48 = *MEMORY[0x263F1C240];
  v86[0] = *MEMORY[0x263F1C238];
  v86[1] = v48;
  v87[0] = v33;
  v87[1] = v31;
  v49 = [NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:2];
  v50 = (void *)[v46 initWithString:v35 attributes:v49];

  if (v85 && v42) {
    objc_msgSend(v50, "addAttribute:value:range:", v47, v34, 0, v42);
  }
  v51 = [(RTTUIRecentMessageCell *)self label];
  [v51 setAttributedText:v50];
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
}

@end
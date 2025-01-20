@interface RTTUIAbbreviationView
+ (void)warningSquelcher;
- (BOOL)canBecomeFocused;
- (BOOL)drawLeftBorder;
- (BOOL)isAccessibilityElement;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDictionary)abbreviationData;
- (NSString)abbreviationText;
- (RTTUIAbbreviationView)initWithFrame:(CGRect)a3;
- (UILabel)abbreviation;
- (UILabel)hint;
- (UIView)highlightView;
- (UIView)leftBorderView;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (void)setAbbreviation:(id)a3;
- (void)setAbbreviationData:(id)a3;
- (void)setDrawLeftBorder:(BOOL)a3;
- (void)setHighlightView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHint:(id)a3;
- (void)setLeftBorderView:(id)a3;
@end

@implementation RTTUIAbbreviationView

+ (void)warningSquelcher
{
}

- (RTTUIAbbreviationView)initWithFrame:(CGRect)a3
{
  v97[4] = *MEMORY[0x263EF8340];
  v93.receiver = self;
  v93.super_class = (Class)RTTUIAbbreviationView;
  v3 = -[RTTUIAbbreviationView initWithFrame:](&v93, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
    [(RTTUIAbbreviationView *)v3 setHighlightView:v9];

    v10 = [(RTTUIAbbreviationView *)v3 highlightView];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    v11 = [(RTTUIAbbreviationView *)v3 highlightView];
    [v11 _setContinuousCornerRadius:8.0];

    v12 = [MEMORY[0x263F1C550] systemDarkGrayColor];
    v13 = [(RTTUIAbbreviationView *)v3 highlightView];
    [v13 setBackgroundColor:v12];

    v14 = [(RTTUIAbbreviationView *)v3 highlightView];
    [v14 setHidden:1];

    v15 = [(RTTUIAbbreviationView *)v3 highlightView];
    [(RTTUIAbbreviationView *)v3 addSubview:v15];

    v16 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v5, v6, v7, v8);
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(RTTUIAbbreviationView *)v3 addSubview:v16];
    id firstValue = objc_alloc_init(MEMORY[0x263F1C768]);
    [firstValue setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [MEMORY[0x263F1C550] whiteColor];
    [firstValue setTextColor:v17];

    [firstValue setTextAlignment:1];
    v18 = [MEMORY[0x263F1C658] systemFontOfSize:16.0];
    [firstValue setFont:v18];

    v19 = [MEMORY[0x263F1C550] clearColor];
    [firstValue setBackgroundColor:v19];

    v92 = v16;
    [v16 addSubview:firstValue];
    [(RTTUIAbbreviationView *)v3 setAbbreviation:firstValue];
    id v90 = objc_alloc_init(MEMORY[0x263F1C768]);
    [v90 setTranslatesAutoresizingMaskIntoConstraints:0];
    v20 = [MEMORY[0x263F1C550] whiteColor];
    [v90 setTextColor:v20];

    [v90 setTextAlignment:1];
    v21 = [MEMORY[0x263F1C658] systemFontOfSize:12.0];
    [v90 setFont:v21];

    [v90 setAdjustsFontSizeToFitWidth:1];
    [v90 setAllowsDefaultTighteningForTruncation:1];
    [v90 setMinimumScaleFactor:0.800000012];
    v22 = [MEMORY[0x263F1C550] clearColor];
    [v90 setBackgroundColor:v22];

    [v16 addSubview:v90];
    [(RTTUIAbbreviationView *)v3 setHint:v90];
    v23 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v5, v6, v7, v8);
    [(RTTUIAbbreviationView *)v3 setLeftBorderView:v23];

    v24 = [(RTTUIAbbreviationView *)v3 leftBorderView];
    [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

    v25 = [MEMORY[0x263F1C550] systemGrayColor];
    v26 = [v25 colorWithAlphaComponent:0.35];
    v27 = [(RTTUIAbbreviationView *)v3 leftBorderView];
    [v27 setBackgroundColor:v26];

    v28 = [(RTTUIAbbreviationView *)v3 leftBorderView];
    [v28 setHidden:1];

    v29 = [(RTTUIAbbreviationView *)v3 leftBorderView];
    [(RTTUIAbbreviationView *)v3 addSubview:v29];

    v30 = (void *)MEMORY[0x263F08938];
    v86 = [(RTTUIAbbreviationView *)v3 leftBorderView];
    v31 = [v30 constraintWithItem:v86 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:1.0];
    v97[0] = v31;
    v32 = (void *)MEMORY[0x263F08938];
    v33 = [(RTTUIAbbreviationView *)v3 leftBorderView];
    v34 = [v32 constraintWithItem:v33 attribute:8 relatedBy:0 toItem:v3 attribute:8 multiplier:0.65 constant:0.0];
    v97[1] = v34;
    v35 = (void *)MEMORY[0x263F08938];
    v36 = [(RTTUIAbbreviationView *)v3 leftBorderView];
    v37 = [v35 constraintWithItem:v36 attribute:9 relatedBy:0 toItem:v3 attribute:1 multiplier:1.0 constant:-1.0];
    v97[2] = v37;
    v38 = (void *)MEMORY[0x263F08938];
    v39 = [(RTTUIAbbreviationView *)v3 leftBorderView];
    v40 = [v38 constraintWithItem:v39 attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:0.0];
    v97[3] = v40;
    v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v97 count:4];
    [v30 activateConstraints:v41];

    v78 = (void *)MEMORY[0x263F08938];
    v87 = [(RTTUIAbbreviationView *)v3 highlightView];
    v84 = [v87 widthAnchor];
    v83 = [v92 widthAnchor];
    v82 = [v84 constraintEqualToAnchor:v83 multiplier:0.95];
    v96[0] = v82;
    v81 = [(RTTUIAbbreviationView *)v3 highlightView];
    v80 = [v81 heightAnchor];
    v79 = [v92 heightAnchor];
    v77 = [v80 constraintEqualToAnchor:v79 multiplier:1.0];
    v96[1] = v77;
    v42 = [(RTTUIAbbreviationView *)v3 highlightView];
    v43 = [v42 centerXAnchor];
    v44 = [v92 centerXAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    v96[2] = v45;
    v46 = [(RTTUIAbbreviationView *)v3 highlightView];
    v47 = [v46 centerYAnchor];
    v48 = [v92 centerYAnchor];
    v49 = [v47 constraintEqualToAnchor:v48];
    v96[3] = v49;
    v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:4];
    [v78 activateConstraints:v50];

    v85 = (void *)MEMORY[0x263F08938];
    v88 = [v92 widthAnchor];
    v51 = [(RTTUIAbbreviationView *)v3 widthAnchor];
    v52 = [v88 constraintEqualToAnchor:v51 multiplier:1.0];
    v95[0] = v52;
    v53 = [v92 centerXAnchor];
    v54 = [(RTTUIAbbreviationView *)v3 centerXAnchor];
    v55 = [v53 constraintEqualToAnchor:v54];
    v95[1] = v55;
    v56 = [v92 centerYAnchor];
    v57 = [(RTTUIAbbreviationView *)v3 centerYAnchor];
    v58 = [v56 constraintEqualToAnchor:v57];
    v95[2] = v58;
    v59 = [MEMORY[0x263EFF8C0] arrayWithObjects:v95 count:3];
    [v85 activateConstraints:v59];

    v89 = (void *)MEMORY[0x263F08938];
    v60 = [firstValue topAnchor];
    v61 = [v92 topAnchor];
    v62 = [v60 constraintEqualToAnchor:v61];
    v94[0] = v62;
    v63 = [v90 bottomAnchor];
    v64 = [v92 bottomAnchor];
    v65 = [v63 constraintEqualToAnchor:v64];
    v94[1] = v65;
    v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:2];
    [v89 activateConstraints:v66];

    v67 = (void *)MEMORY[0x263F08938];
    v68 = _NSDictionaryOfVariableBindings(&cfstr_AbbrHint.isa, firstValue, v90, 0);
    v69 = [v67 constraintsWithVisualFormat:@"V:|[abbr]-2-[hint]|" options:0 metrics:0 views:v68];
    [v92 addConstraints:v69];

    v70 = (void *)MEMORY[0x263F08938];
    v71 = _NSDictionaryOfVariableBindings(&cfstr_AbbrHint.isa, firstValue, v90, 0);
    v72 = [v70 constraintsWithVisualFormat:@"H:|[abbr]|" options:0 metrics:0 views:v71];
    [v92 addConstraints:v72];

    v73 = (void *)MEMORY[0x263F08938];
    v74 = _NSDictionaryOfVariableBindings(&cfstr_AbbrHint.isa, firstValue, v90, 0);
    v75 = [v73 constraintsWithVisualFormat:@"H:|[hint]|" options:0 metrics:0 views:v74];
    [v92 addConstraints:v75];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  double v5 = [(RTTUIAbbreviationView *)self hint];
  [v5 frame];
  double v7 = v6;

  double v8 = [(RTTUIAbbreviationView *)self abbreviation];
  [v8 frame];
  double v10 = v9;

  if (v7 >= v10) {
    double v11 = v7;
  }
  else {
    double v11 = v10;
  }
  double v12 = v11 + 50.0;
  double v13 = height;
  result.CGFloat height = v13;
  result.width = v12;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(RTTUIAbbreviationView *)self highlightView];
  [v4 setHidden:v3];
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)setDrawLeftBorder:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(RTTUIAbbreviationView *)self leftBorderView];
  [v4 setHidden:v3];
}

- (void)setAbbreviationData:(id)a3
{
  id v4 = a3;
  id v11 = [v4 objectForKey:@"abbr"];
  double v5 = [v4 objectForKey:@"hint"];

  double v6 = [(RTTUIAbbreviationView *)self abbreviation];
  [v6 setText:v11];

  double v7 = [(RTTUIAbbreviationView *)self hint];
  double v8 = [NSString stringWithFormat:@"(%@)", v5];
  [v7 setText:v8];

  double v9 = [(RTTUIAbbreviationView *)self abbreviation];
  [v9 sizeToFit];

  double v10 = [(RTTUIAbbreviationView *)self hint];
  [v10 sizeToFit];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  BOOL v3 = [(RTTUIAbbreviationView *)self abbreviation];
  double v6 = [(RTTUIAbbreviationView *)self hint];
  id v4 = __AXStringForVariables();

  return v4;
}

- (id)accessibilityIdentifier
{
  v2 = [(RTTUIAbbreviationView *)self abbreviation];
  BOOL v3 = [v2 text];

  return v3;
}

- (NSString)abbreviationText
{
  v2 = [(RTTUIAbbreviationView *)self abbreviation];
  BOOL v3 = [v2 text];

  return (NSString *)v3;
}

- (NSDictionary)abbreviationData
{
  return self->_abbreviationData;
}

- (BOOL)drawLeftBorder
{
  return self->_drawLeftBorder;
}

- (UILabel)abbreviation
{
  return self->_abbreviation;
}

- (void)setAbbreviation:(id)a3
{
}

- (UILabel)hint
{
  return self->_hint;
}

- (void)setHint:(id)a3
{
}

- (UIView)leftBorderView
{
  return self->_leftBorderView;
}

- (void)setLeftBorderView:(id)a3
{
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_leftBorderView, 0);
  objc_storeStrong((id *)&self->_hint, 0);
  objc_storeStrong((id *)&self->_abbreviation, 0);
  objc_storeStrong((id *)&self->_abbreviationData, 0);
}

@end
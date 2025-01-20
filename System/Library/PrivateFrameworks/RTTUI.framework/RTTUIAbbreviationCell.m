@interface RTTUIAbbreviationCell
- (BOOL)accessibilityIgnoresInvertColors;
- (BOOL)isAccessibilityElement;
- (RTTUIAbbreviationCell)initWithFrame:(CGRect)a3;
- (UILabel)abbreviation;
- (UILabel)hint;
- (id)abbreviationText;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAbbreviation:(id)a3;
- (void)setAbbreviationData:(id)a3;
- (void)setHint:(id)a3;
@end

@implementation RTTUIAbbreviationCell

- (RTTUIAbbreviationCell)initWithFrame:(CGRect)a3
{
  v56.receiver = self;
  v56.super_class = (Class)RTTUIAbbreviationCell;
  v3 = -[RTTUIAbbreviationCell initWithFrame:](&v56, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (UIAccessibilityIsReduceTransparencyEnabled())
    {
      v4 = [MEMORY[0x263F1C550] blackColor];
      [(RTTUIAbbreviationCell *)v3 setBackgroundColor:v4];
    }
    else
    {
      id v5 = objc_alloc(MEMORY[0x263F1CB60]);
      [(RTTUIAbbreviationCell *)v3 bounds];
      v4 = objc_msgSend(v5, "initWithFrame:");
      [v4 setAutoresizingMask:18];
      v6 = [(RTTUIAbbreviationCell *)v3 contentView];
      [v6 setAutoresizesSubviews:1];

      v7 = [(RTTUIAbbreviationCell *)v3 contentView];
      [v7 addSubview:v4];

      v8 = (void *)[objc_alloc(MEMORY[0x263F1CBE8]) initWithPrivateStyle:2030];
      [v8 setGroupName:@"RTTUIAbbreviationCell"];
      v9 = [(RTTUIAbbreviationCell *)v3 contentView];
      [v9 addSubview:v8];
    }
    uint64_t v10 = objc_opt_new();
    abbreviationContainer = v3->_abbreviationContainer;
    v3->_abbreviationContainer = (UIView *)v10;

    [(UIView *)v3->_abbreviationContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [(RTTUIAbbreviationCell *)v3 contentView];
    [v12 addSubview:v3->_abbreviationContainer];

    id v13 = objc_alloc(MEMORY[0x263F1CB98]);
    v14 = [MEMORY[0x263F1CB58] controlCenterSecondaryVibrancyEffect];
    uint64_t v15 = [v13 initWithEffect:v14];
    hintContainer = v3->_hintContainer;
    v3->_hintContainer = (UIVisualEffectView *)v15;

    [(UIVisualEffectView *)v3->_hintContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [(RTTUIAbbreviationCell *)v3 contentView];
    [v17 addSubview:v3->_hintContainer];

    id v18 = objc_alloc_init(MEMORY[0x263F1C768]);
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = [MEMORY[0x263F1C550] whiteColor];
    [v18 setTextColor:v19];

    [v18 setTextAlignment:1];
    v20 = [MEMORY[0x263F1C658] systemFontOfSize:14.0];
    [v18 setFont:v20];

    v21 = [MEMORY[0x263F1C550] clearColor];
    [v18 setBackgroundColor:v21];

    [(UIView *)v3->_abbreviationContainer addSubview:v18];
    [(RTTUIAbbreviationCell *)v3 setAbbreviation:v18];
    id v22 = objc_alloc_init(MEMORY[0x263F1C768]);
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [MEMORY[0x263F1C550] whiteColor];
    [v22 setTextColor:v23];

    [v22 setTextAlignment:1];
    v24 = [MEMORY[0x263F1C658] systemFontOfSize:14.0];
    [v22 setFont:v24];

    [v22 setAdjustsFontSizeToFitWidth:1];
    [v22 setMinimumScaleFactor:0.800000012];
    v25 = [MEMORY[0x263F1C550] clearColor];
    [v22 setBackgroundColor:v25];

    v26 = [(UIVisualEffectView *)v3->_hintContainer contentView];
    [v26 addSubview:v22];

    [(RTTUIAbbreviationCell *)v3 setHint:v22];
    v27 = v3->_abbreviationContainer;
    v28 = (void *)MEMORY[0x263F08938];
    v29 = _NSDictionaryOfVariableBindings(&cfstr_Abbr.isa, v18, 0);
    v30 = [v28 constraintsWithVisualFormat:@"H:|[abbr]|" options:0 metrics:0 views:v29];
    [(UIView *)v27 addConstraints:v30];

    v31 = v3->_abbreviationContainer;
    v32 = (void *)MEMORY[0x263F08938];
    v33 = _NSDictionaryOfVariableBindings(&cfstr_Abbr.isa, v18, 0);
    v34 = [v32 constraintsWithVisualFormat:@"V:|[abbr]|" options:0 metrics:0 views:v33];
    [(UIView *)v31 addConstraints:v34];

    v35 = v3->_hintContainer;
    v36 = (void *)MEMORY[0x263F08938];
    v37 = _NSDictionaryOfVariableBindings(&cfstr_Hint.isa, v22, 0);
    v38 = [v36 constraintsWithVisualFormat:@"H:|[hint]|" options:0 metrics:0 views:v37];
    [(UIVisualEffectView *)v35 addConstraints:v38];

    v39 = v3->_hintContainer;
    v40 = (void *)MEMORY[0x263F08938];
    v41 = _NSDictionaryOfVariableBindings(&cfstr_Hint.isa, v22, 0);
    v42 = [v40 constraintsWithVisualFormat:@"V:|[hint]|" options:0 metrics:0 views:v41];
    [(UIVisualEffectView *)v39 addConstraints:v42];

    v43 = [(RTTUIAbbreviationCell *)v3 contentView];
    v44 = (void *)MEMORY[0x263F08938];
    v45 = _NSDictionaryOfVariableBindings(&cfstr_Abbreviationco.isa, v3->_abbreviationContainer, 0);
    v46 = [v44 constraintsWithVisualFormat:@"H:|[_abbreviationContainer]|" options:0 metrics:0 views:v45];
    [v43 addConstraints:v46];

    v47 = [(RTTUIAbbreviationCell *)v3 contentView];
    v48 = (void *)MEMORY[0x263F08938];
    v49 = _NSDictionaryOfVariableBindings(&cfstr_Hintcontainer.isa, v3->_hintContainer, 0);
    v50 = [v48 constraintsWithVisualFormat:@"H:|[_hintContainer]|" options:0 metrics:0 views:v49];
    [v47 addConstraints:v50];

    v51 = [(RTTUIAbbreviationCell *)v3 contentView];
    v52 = (void *)MEMORY[0x263F08938];
    v53 = _NSDictionaryOfVariableBindings(&cfstr_Abbreviationco_0.isa, v3->_abbreviationContainer, v3->_hintContainer, 0);
    v54 = [v52 constraintsWithVisualFormat:@"V:|-(5.0)-[_abbreviationContainer][_hintContainer]-(3.0)-|" options:0 metrics:0 views:v53];
    [v51 addConstraints:v54];
  }
  return v3;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)RTTUIAbbreviationCell;
  [(RTTUIAbbreviationCell *)&v2 layoutSubviews];
}

- (void)setAbbreviationData:(id)a3
{
  id v4 = a3;
  id v9 = [v4 objectForKey:@"abbr"];
  id v5 = [v4 objectForKey:@"hint"];

  v6 = [(RTTUIAbbreviationCell *)self abbreviation];
  [v6 setText:v9];

  v7 = [(RTTUIAbbreviationCell *)self hint];
  v8 = [NSString stringWithFormat:@"(%@)", v5];
  [v7 setText:v8];
}

- (id)abbreviationText
{
  objc_super v2 = [(RTTUIAbbreviationCell *)self abbreviation];
  v3 = [v2 text];

  return v3;
}

- (void)dealloc
{
  [(RTTUIAbbreviationCell *)self setAbbreviation:0];
  [(RTTUIAbbreviationCell *)self setHint:0];
  v3.receiver = self;
  v3.super_class = (Class)RTTUIAbbreviationCell;
  [(RTTUIAbbreviationCell *)&v3 dealloc];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_super v3 = [(RTTUIAbbreviationCell *)self abbreviation];
  v6 = [(RTTUIAbbreviationCell *)self hint];
  id v4 = __AXStringForVariables();

  return v4;
}

- (id)accessibilityIdentifier
{
  objc_super v2 = [(RTTUIAbbreviationCell *)self abbreviation];
  objc_super v3 = [v2 text];

  return v3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hint, 0);
  objc_storeStrong((id *)&self->_abbreviation, 0);
  objc_storeStrong((id *)&self->_hintContainer, 0);
  objc_storeStrong((id *)&self->_abbreviationContainer, 0);
}

@end
@interface _UIKeyShortcutHUDShortcutInputView
- (BOOL)isInputStyledAsSingleCharacterOrSymbol;
- (BOOL)wantsCompressedWidth;
- (NSLayoutConstraint)inputLabelWidthConstraint;
- (NSLayoutConstraint)modifiersLabelWidthConstraint;
- (NSLayoutConstraint)reservedInputWidthConstraint;
- (NSLayoutConstraint)reservedInputWidthSpacingConstraint;
- (UIColor)textColor;
- (UILabel)inputLabel;
- (UILabel)modifiersLabel;
- (UIStackView)labelStackView;
- (UIView)inputLabelContainer;
- (_UIKeyShortcutHUDShortcut)shortcut;
- (_UIKeyShortcutHUDShortcutInputView)initWithCoder:(id)a3;
- (_UIKeyShortcutHUDShortcutInputView)initWithFrame:(CGRect)a3;
- (double)inputLabelWidth;
- (double)modifiersLabelWidth;
- (uint64_t)_shouldAlignShortcutModifiersAndInputInColumn;
- (void)_commonInit;
- (void)_updateInputLabelSpacing:(id)a3;
- (void)_updateInputLabelStyle:(id)a3;
- (void)dealloc;
- (void)setInputLabel:(id)a3;
- (void)setInputLabelContainer:(id)a3;
- (void)setInputLabelWidthConstraint:(id)a3;
- (void)setInputStyledAsSingleCharacterOrSymbol:(BOOL)a3;
- (void)setLabelStackView:(id)a3;
- (void)setModifiersLabel:(id)a3;
- (void)setModifiersLabelWidthConstraint:(id)a3;
- (void)setModifiersWidth:(double)a3 inputWidth:(double)a4;
- (void)setReservedInputWidthConstraint:(id)a3;
- (void)setReservedInputWidthSpacingConstraint:(id)a3;
- (void)setShortcut:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setWantsCompressedWidth:(BOOL)a3;
@end

@implementation _UIKeyShortcutHUDShortcutInputView

- (_UIKeyShortcutHUDShortcutInputView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDShortcutInputView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_UIKeyShortcutHUDShortcutInputView *)v3 _commonInit];
  }
  return v4;
}

- (_UIKeyShortcutHUDShortcutInputView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDShortcutInputView;
  v3 = [(UIView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(_UIKeyShortcutHUDShortcutInputView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v62[5] = *MEMORY[0x1E4F143B8];
  [(_UIKeyShortcutHUDShortcutInputView *)self setInputStyledAsSingleCharacterOrSymbol:1];
  [(_UIKeyShortcutHUDShortcutInputView *)self setWantsCompressedWidth:0];
  v3 = (UILabel *)objc_opt_new();
  modifiersLabel = self->_modifiersLabel;
  self->_modifiersLabel = v3;

  v5 = +[UIKeyShortcutHUDMetrics currentMetrics];
  objc_super v6 = [v5 keyShortcutModifiersFont];
  [(UILabel *)self->_modifiersLabel setFont:v6];

  [(UILabel *)self->_modifiersLabel setAdjustsFontForContentSizeCategory:1];
  [(UILabel *)self->_modifiersLabel setTextAlignment:2];
  v7 = +[UIKeyShortcutHUDMetrics currentMetrics];
  v8 = [v7 standardHUDTextColor];
  [(UILabel *)self->_modifiersLabel setTextColor:v8];

  [(UIView *)self->_modifiersLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = (UILabel *)objc_opt_new();
  inputLabel = self->_inputLabel;
  self->_inputLabel = v9;

  v11 = +[UIKeyShortcutHUDMetrics currentMetrics];
  v12 = [v11 keyShortcutInputCharacterFont];
  [(UILabel *)self->_inputLabel setFont:v12];

  [(UILabel *)self->_inputLabel setAdjustsFontForContentSizeCategory:1];
  -[UILabel setTextAlignment:](self->_inputLabel, "setTextAlignment:", -[_UIKeyShortcutHUDShortcutInputView _shouldAlignShortcutModifiersAndInputInColumn]((uint64_t)self) ^ 1);
  v13 = +[UIKeyShortcutHUDMetrics currentMetrics];
  v14 = [v13 standardHUDTextColor];
  [(UILabel *)self->_inputLabel setTextColor:v14];

  [(UIView *)self->_inputLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = (UIView *)objc_opt_new();
  inputLabelContainer = self->_inputLabelContainer;
  self->_inputLabelContainer = v15;

  [(UIView *)self->_inputLabelContainer addSubview:self->_inputLabel];
  [(UIView *)self->_inputLabelContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = [(UIView *)self->_inputLabelContainer widthAnchor];
  v18 = [(UIView *)self->_inputLabel widthAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];

  LODWORD(v20) = 1144750080;
  v59 = v19;
  [v19 setPriority:v20];
  char shouldAlignShortcutModifiersAndInputIn = -[_UIKeyShortcutHUDShortcutInputView _shouldAlignShortcutModifiersAndInputInColumn]((uint64_t)self);
  v22 = self->_inputLabelContainer;
  if (shouldAlignShortcutModifiersAndInputIn)
  {
    v23 = [(UIView *)v22 rightAnchor];
    [(UIView *)self->_inputLabel rightAnchor];
  }
  else
  {
    v23 = [(UIView *)v22 centerXAnchor];
    [(UIView *)self->_inputLabel centerXAnchor];
  v24 = };
  v58 = [v23 constraintEqualToAnchor:v24];

  v25 = [(UIView *)self->_inputLabelContainer widthAnchor];
  v26 = [v25 constraintGreaterThanOrEqualToConstant:0.0];
  reservedInputWidthConstraint = self->_reservedInputWidthConstraint;
  self->_reservedInputWidthConstraint = v26;

  v28 = [(UIView *)self->_inputLabelContainer widthAnchor];
  v29 = [(UIView *)self->_inputLabel widthAnchor];
  v30 = [v28 constraintEqualToAnchor:v29 constant:0.0];
  reservedInputWidthSpacingConstraint = self->_reservedInputWidthSpacingConstraint;
  self->_reservedInputWidthSpacingConstraint = v30;

  v32 = (void *)MEMORY[0x1E4F5B268];
  v62[0] = v58;
  v33 = [(UIView *)self->_inputLabelContainer centerYAnchor];
  v34 = [(UIView *)self->_inputLabel centerYAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  v62[1] = v35;
  v62[2] = v59;
  v36 = self->_reservedInputWidthConstraint;
  v62[3] = self->_reservedInputWidthSpacingConstraint;
  v62[4] = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:5];
  [v32 activateConstraints:v37];

  v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v38 addObserver:self selector:sel__updateInputLabelSpacing_ name:@"UIContentSizeCategoryDidChangeNotification" object:0];

  v39 = [UIStackView alloc];
  v40 = self->_inputLabelContainer;
  v61[0] = self->_modifiersLabel;
  v61[1] = v40;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  v42 = [(UIStackView *)v39 initWithArrangedSubviews:v41];
  labelStackView = self->_labelStackView;
  self->_labelStackView = v42;

  [(UIView *)self->_labelStackView setSemanticContentAttribute:3];
  [(UIStackView *)self->_labelStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self addSubview:self->_labelStackView];
  v53 = (void *)MEMORY[0x1E4F5B268];
  v57 = [(UIView *)self->_labelStackView topAnchor];
  v56 = [(UIView *)self topAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v60[0] = v55;
  v54 = [(UIView *)self->_labelStackView leadingAnchor];
  v44 = [(UIView *)self leadingAnchor];
  v45 = [v54 constraintEqualToAnchor:v44];
  v60[1] = v45;
  v46 = [(UIView *)self->_labelStackView trailingAnchor];
  v47 = [(UIView *)self trailingAnchor];
  v48 = [v46 constraintEqualToAnchor:v47];
  v60[2] = v48;
  v49 = [(UIView *)self->_labelStackView bottomAnchor];
  v50 = [(UIView *)self bottomAnchor];
  v51 = [v49 constraintEqualToAnchor:v50];
  v60[3] = v51;
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:4];
  [v53 activateConstraints:v52];

  [(_UIKeyShortcutHUDShortcutInputView *)self _updateInputLabelSpacing:0];
}

- (uint64_t)_shouldAlignShortcutModifiersAndInputInColumn
{
  if (result)
  {
    v1 = +[UIKeyShortcutHUDMetrics currentMetrics];
    uint64_t v2 = [v1 shouldAlignShortcutModifiersAndInputInColumn];

    return v2;
  }
  return result;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIContentSizeCategoryDidChangeNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIKeyShortcutHUDShortcutInputView;
  [(UIView *)&v4 dealloc];
}

- (void)setShortcut:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shortcut);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_shortcut, v4);
    objc_super v6 = +[_UIKeyShortcutHUDUtilities modifiersAttributedStringForShortcut:]((uint64_t)_UIKeyShortcutHUDUtilities, v4);
    [(UILabel *)self->_modifiersLabel setAttributedText:v6];

    unsigned __int8 v8 = 0;
    v7 = +[_UIKeyShortcutHUDUtilities inputAttributedStringForShortcut:outShouldStyleAsSingleCharacterOrSymbol:]((uint64_t)_UIKeyShortcutHUDUtilities, v4, &v8);
    [(UILabel *)self->_inputLabel setAttributedText:v7];

    [(_UIKeyShortcutHUDShortcutInputView *)self setInputStyledAsSingleCharacterOrSymbol:v8];
    [(_UIKeyShortcutHUDShortcutInputView *)self _updateInputLabelSpacing:0];
  }
}

- (void)setTextColor:(id)a3
{
  modifiersLabel = self->_modifiersLabel;
  id v5 = a3;
  [(UILabel *)modifiersLabel setTextColor:v5];
  [(UILabel *)self->_inputLabel setTextColor:v5];
}

- (UIColor)textColor
{
  return [(UILabel *)self->_modifiersLabel textColor];
}

- (void)setWantsCompressedWidth:(BOOL)a3
{
  if (self->_wantsCompressedWidth != a3)
  {
    self->_wantsCompressedWidth = a3;
    [(_UIKeyShortcutHUDShortcutInputView *)self _updateInputLabelSpacing:0];
  }
}

- (void)setInputStyledAsSingleCharacterOrSymbol:(BOOL)a3
{
  if (self->_inputStyledAsSingleCharacterOrSymbol != a3)
  {
    self->_inputStyledAsSingleCharacterOrSymbol = a3;
    [(_UIKeyShortcutHUDShortcutInputView *)self _updateInputLabelStyle:0];
  }
}

- (double)modifiersLabelWidth
{
  [(UIView *)self->_modifiersLabel bounds];
  return CGRectGetWidth(*(CGRect *)&v2);
}

- (double)inputLabelWidth
{
  [(UIView *)self->_inputLabelContainer bounds];
  return CGRectGetWidth(*(CGRect *)&v2);
}

- (void)setModifiersWidth:(double)a3 inputWidth:(double)a4
{
  modifiersLabelWidthConstraint = self->_modifiersLabelWidthConstraint;
  if (!modifiersLabelWidthConstraint) {
    goto LABEL_6;
  }
  [(NSLayoutConstraint *)modifiersLabelWidthConstraint constant];
  if (v8 == a3)
  {
    inputLabelWidthConstraint = self->_inputLabelWidthConstraint;
    if (inputLabelWidthConstraint)
    {
      [(NSLayoutConstraint *)inputLabelWidthConstraint constant];
      if (v10 == a4) {
        return;
      }
    }
  }
  v11 = self->_modifiersLabelWidthConstraint;
  if (!v11)
  {
LABEL_6:
    v12 = [(UIView *)self->_modifiersLabel widthAnchor];
    v13 = [v12 constraintEqualToConstant:0.0];
    v14 = self->_modifiersLabelWidthConstraint;
    self->_modifiersLabelWidthConstraint = v13;

    [(NSLayoutConstraint *)self->_modifiersLabelWidthConstraint setActive:1];
    v11 = self->_modifiersLabelWidthConstraint;
  }
  [(NSLayoutConstraint *)v11 setConstant:a3];
  v15 = self->_inputLabelWidthConstraint;
  if (!v15)
  {
    v16 = [(UIView *)self->_inputLabel widthAnchor];
    v17 = [v16 constraintEqualToConstant:0.0];
    v18 = self->_inputLabelWidthConstraint;
    self->_inputLabelWidthConstraint = v17;

    [(NSLayoutConstraint *)self->_inputLabelWidthConstraint setActive:1];
    v15 = self->_inputLabelWidthConstraint;
  }
  [(NSLayoutConstraint *)v15 setConstant:a4];
  [(_UIKeyShortcutHUDShortcutInputView *)self _updateInputLabelSpacing:0];
}

- (void)_updateInputLabelStyle:(id)a3
{
  BOOL v4 = [(_UIKeyShortcutHUDShortcutInputView *)self isInputStyledAsSingleCharacterOrSymbol];
  id v5 = +[UIKeyShortcutHUDMetrics currentMetrics];
  id v7 = v5;
  if (v4) {
    [v5 keyShortcutInputCharacterFont];
  }
  else {
  objc_super v6 = [v5 keyShortcutInputWordFont];
  }
  [(UILabel *)self->_inputLabel setFont:v6];
}

- (void)_updateInputLabelSpacing:(id)a3
{
  id v25 = +[UIFontMetrics metricsForTextStyle:@"UICTFontTextStyleBody"];
  BOOL v4 = +[UIKeyShortcutHUDMetrics currentMetrics];
  if ([(_UIKeyShortcutHUDShortcutInputView *)self wantsCompressedWidth]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = -[_UIKeyShortcutHUDShortcutInputView _shouldAlignShortcutModifiersAndInputInColumn]((uint64_t)self) ^ 1;
  }
  [(NSLayoutConstraint *)self->_reservedInputWidthConstraint setActive:v5];
  [v4 standardShortcutInputReservedWidth];
  double v7 = v6;
  double v8 = [(UIView *)self traitCollection];
  [v25 scaledValueForValue:v8 compatibleWithTraitCollection:v7];
  -[NSLayoutConstraint setConstant:](self->_reservedInputWidthConstraint, "setConstant:");

  if (-[_UIKeyShortcutHUDShortcutInputView isInputStyledAsSingleCharacterOrSymbol](self, "isInputStyledAsSingleCharacterOrSymbol")&& (+[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics"), v9 = objc_claimAutoreleasedReturnValue(), int v10 = [v9 shouldAlignShortcutModifiersAndInputInColumn], v9, !v10))
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = [(_UIKeyShortcutHUDShortcutInputView *)self wantsCompressedWidth] ^ 1;
  }
  [(NSLayoutConstraint *)self->_reservedInputWidthSpacingConstraint setActive:v11];
  [v4 standardShortcutModifierInputMinimumSpacing];
  double v13 = v12;
  v14 = [(UIView *)self traitCollection];
  [v25 scaledValueForValue:v14 compatibleWithTraitCollection:v13];
  double v16 = v15;

  v17 = +[UIKeyShortcutHUDMetrics currentMetrics];
  int v18 = [v17 shouldAlignShortcutModifiersAndInputInColumn];

  if (v18)
  {
    modifiersLabelWidthConstraint = self->_modifiersLabelWidthConstraint;
    if (!modifiersLabelWidthConstraint
      || ([(NSLayoutConstraint *)modifiersLabelWidthConstraint constant], v22 = v21, double v19 = 0.0, v22 != 0.0)
      && (double v19 = v16, !self->_modifiersLabelWidthConstraint))
    {
      v23 = [(UILabel *)self->_modifiersLabel text];
      uint64_t v24 = [v23 length];

      double v19 = 0.0;
      if (v24) {
        double v19 = v16;
      }
    }
  }
  else
  {
    double v19 = v16 + v16;
  }
  [(NSLayoutConstraint *)self->_reservedInputWidthSpacingConstraint setConstant:v19];
}

- (_UIKeyShortcutHUDShortcut)shortcut
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shortcut);
  return (_UIKeyShortcutHUDShortcut *)WeakRetained;
}

- (BOOL)wantsCompressedWidth
{
  return self->_wantsCompressedWidth;
}

- (UILabel)modifiersLabel
{
  return self->_modifiersLabel;
}

- (void)setModifiersLabel:(id)a3
{
}

- (UILabel)inputLabel
{
  return self->_inputLabel;
}

- (void)setInputLabel:(id)a3
{
}

- (UIView)inputLabelContainer
{
  return self->_inputLabelContainer;
}

- (void)setInputLabelContainer:(id)a3
{
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
}

- (NSLayoutConstraint)reservedInputWidthConstraint
{
  return self->_reservedInputWidthConstraint;
}

- (void)setReservedInputWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)reservedInputWidthSpacingConstraint
{
  return self->_reservedInputWidthSpacingConstraint;
}

- (void)setReservedInputWidthSpacingConstraint:(id)a3
{
}

- (NSLayoutConstraint)modifiersLabelWidthConstraint
{
  return self->_modifiersLabelWidthConstraint;
}

- (void)setModifiersLabelWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)inputLabelWidthConstraint
{
  return self->_inputLabelWidthConstraint;
}

- (void)setInputLabelWidthConstraint:(id)a3
{
}

- (BOOL)isInputStyledAsSingleCharacterOrSymbol
{
  return self->_inputStyledAsSingleCharacterOrSymbol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_modifiersLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_reservedInputWidthSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_reservedInputWidthConstraint, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_inputLabelContainer, 0);
  objc_storeStrong((id *)&self->_inputLabel, 0);
  objc_storeStrong((id *)&self->_modifiersLabel, 0);
  objc_destroyWeak((id *)&self->_shortcut);
}

@end
@interface UIPrintMessageAndSpinnerView
- (BOOL)spinSpinner;
- (BOOL)spinnerHidden;
- (NSArray)currentHorizontalConstraints;
- (NSString)messageText;
- (UIActivityIndicatorView)spinner;
- (UILabel)label;
- (UIPrintMessageAndSpinnerView)initWithFrame:(CGRect)a3;
- (void)setCurrentHorizontalConstraints:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMessageText:(id)a3;
- (void)setSpinSpinner:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)setSpinnerHidden:(BOOL)a3;
- (void)updateConstraints;
- (void)updateFont;
@end

@implementation UIPrintMessageAndSpinnerView

- (UIPrintMessageAndSpinnerView)initWithFrame:(CGRect)a3
{
  double width = a3.size.width;
  v16.receiver = self;
  v16.super_class = (Class)UIPrintMessageAndSpinnerView;
  v4 = -[UIPrintMessageAndSpinnerView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    [(UIPrintMessageAndSpinnerView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v5->_label;
    v5->_label = v6;

    v8 = (void *)MEMORY[0x1E4FB1798];
    v9 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v9 _scaledValueForValue:17.0];
    v10 = objc_msgSend(v8, "systemFontOfSize:");
    [(UILabel *)v5->_label setFont:v10];

    [(UILabel *)v5->_label setNumberOfLines:0];
    [(UILabel *)v5->_label setTextAlignment:1];
    [(UILabel *)v5->_label setLineBreakMode:0];
    v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v5->_label setTextColor:v11];

    [(UILabel *)v5->_label setBackgroundColor:0];
    [(UILabel *)v5->_label setOpaque:0];
    [(UILabel *)v5->_label setPreferredMaxLayoutWidth:width + -40.0];
    [(UIPrintMessageAndSpinnerView *)v5 addSubview:v5->_label];
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = v5->_spinner;
    v5->_spinner = (UIActivityIndicatorView *)v12;

    v14 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [(UIActivityIndicatorView *)v5->_spinner setColor:v14];

    [(UILabel *)v5->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v5->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIPrintMessageAndSpinnerView *)v5 setNeedsUpdateConstraints];
  }
  return v5;
}

- (void)updateFont
{
  v3 = (void *)MEMORY[0x1E4FB1798];
  id v5 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v5 _scaledValueForValue:17.0];
  v4 = objc_msgSend(v3, "systemFontOfSize:");
  [(UILabel *)self->_label setFont:v4];
}

- (void)updateConstraints
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int v3 = ![(UIPrintMessageAndSpinnerView *)self spinnerHidden];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v4 = [(UIPrintMessageAndSpinnerView *)self constraints];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
  unint64_t v6 = 0x1EAD80000;
  if (!v5)
  {

    goto LABEL_25;
  }
  uint64_t v7 = v5;
  uint64_t v8 = *(void *)v28;
  char v9 = 1;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v28 != v8) {
        objc_enumerationMutation(v4);
      }
      v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      uint64_t v12 = [v11 firstItem];
      v13 = [(UIPrintMessageAndSpinnerView *)self label];
      if (v12 == v13)
      {
        uint64_t v14 = [v11 firstAttribute];

        if (v14 == 10)
        {
          char v9 = 0;
          continue;
        }
      }
      else
      {
      }
      v15 = [v11 firstItem];
      objc_super v16 = [(UIPrintMessageAndSpinnerView *)self spinner];
      if (v15 == v16)
      {
        BOOL v17 = [v11 firstAttribute] != 10;

        LOBYTE(v3) = v17 & v3;
      }
      else
      {
      }
    }
    uint64_t v7 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v7);

  unint64_t v6 = 0x1EAD80000uLL;
  if ((v9 & 1) == 0)
  {
    if (v3) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }
LABEL_25:
  v25 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_label attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
  [(UIPrintMessageAndSpinnerView *)self addConstraint:v25];

  if (v3)
  {
LABEL_17:
    v18 = [MEMORY[0x1E4F28DC8] constraintWithItem:*(Class *)((char *)&self->super.super.super.isa + *(int *)(v6 + 1828)) attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
    [(UIPrintMessageAndSpinnerView *)self addConstraint:v18];
  }
LABEL_18:
  v19 = [(UIPrintMessageAndSpinnerView *)self currentHorizontalConstraints];

  if (v19)
  {
    v20 = [(UIPrintMessageAndSpinnerView *)self currentHorizontalConstraints];
    [(UIPrintMessageAndSpinnerView *)self removeConstraints:v20];

    [(UIPrintMessageAndSpinnerView *)self setCurrentHorizontalConstraints:0];
  }
  v21 = _NSDictionaryOfVariableBindings(&cfstr_LabelSpinner.isa, self->_label, *(Class *)((char *)&self->super.super.super.isa + *(int *)(v6 + 1828)), 0);
  if ([(UIPrintMessageAndSpinnerView *)self spinnerHidden]) {
    v22 = @"H:|[_label]|";
  }
  else {
    v22 = @"H:|[_label]-indicatorGap-[_spinner]|";
  }
  v23 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:v22 options:0 metrics:&unk_1F3CB1C08 views:v21];
  [(UIPrintMessageAndSpinnerView *)self setCurrentHorizontalConstraints:v23];

  v24 = [(UIPrintMessageAndSpinnerView *)self currentHorizontalConstraints];
  [(UIPrintMessageAndSpinnerView *)self addConstraints:v24];

  v26.receiver = self;
  v26.super_class = (Class)UIPrintMessageAndSpinnerView;
  [(UIPrintMessageAndSpinnerView *)&v26 updateConstraints];
}

- (NSString)messageText
{
  v2 = [(UIPrintMessageAndSpinnerView *)self label];
  int v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setMessageText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIPrintMessageAndSpinnerView *)self label];
  [v5 setText:v4];

  [(UIPrintMessageAndSpinnerView *)self setNeedsLayout];
}

- (BOOL)spinSpinner
{
  v2 = [(UIPrintMessageAndSpinnerView *)self spinner];
  char v3 = [v2 isAnimating];

  return v3;
}

- (void)setSpinSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIPrintMessageAndSpinnerView *)self spinner];
  id v5 = v4;
  if (v3) {
    [v4 startAnimating];
  }
  else {
    [v4 stopAnimating];
  }
}

- (BOOL)spinnerHidden
{
  v2 = self;
  BOOL v3 = [(UIPrintMessageAndSpinnerView *)self spinner];
  id v4 = [v3 superview];
  LOBYTE(v2) = v4 != v2;

  return (char)v2;
}

- (void)setSpinnerHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIPrintMessageAndSpinnerView *)self spinnerHidden] != a3)
  {
    id v5 = [(UIPrintMessageAndSpinnerView *)self spinner];
    unint64_t v6 = v5;
    if (v3) {
      [v5 removeFromSuperview];
    }
    else {
      [(UIPrintMessageAndSpinnerView *)self addSubview:v5];
    }

    [(UIPrintMessageAndSpinnerView *)self setNeedsUpdateConstraints];
    [(UIPrintMessageAndSpinnerView *)self setNeedsLayout];
  }
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (NSArray)currentHorizontalConstraints
{
  return self->_currentHorizontalConstraints;
}

- (void)setCurrentHorizontalConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentHorizontalConstraints, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
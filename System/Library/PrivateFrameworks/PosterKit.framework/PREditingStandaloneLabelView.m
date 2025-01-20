@interface PREditingStandaloneLabelView
+ (id)newLabel;
- (CGSize)intrinsicContentSize;
- (NSString)text;
- (PREditingStandaloneLabelView)initWithFrame:(CGRect)a3;
- (PREditingStandaloneLabelViewInteractiveTransition)currentTransition;
- (UILabel)label;
- (id)beginInteractiveTransitionToText:(id)a3;
- (void)interactiveTransition:(id)a3 didFinishSuccessfully:(BOOL)a4;
- (void)interactiveTransition:(id)a3 didUpdate:(double)a4;
- (void)setCurrentTransition:(id)a3;
- (void)setDisplayedText:(id)a3;
- (void)setText:(id)a3;
@end

@implementation PREditingStandaloneLabelView

+ (id)newLabel
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v2 setNumberOfLines:1];
  [v2 setTextAlignment:1];
  v3 = [MEMORY[0x1E4FB1618] whiteColor];
  [v2 setTextColor:v3];

  v4 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] weight:*MEMORY[0x1E4FB09D0]];
  [v2 setFont:v4];

  [v2 setAdjustsFontSizeToFitWidth:1];
  [v2 setMinimumScaleFactor:0.5];
  [v2 setMaximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v2;
}

- (PREditingStandaloneLabelView)initWithFrame:(CGRect)a3
{
  v24[4] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)PREditingStandaloneLabelView;
  v3 = -[PREditingStandaloneLabelView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    text = v3->_text;
    v3->_text = (NSString *)&stru_1ED9A3120;

    uint64_t v6 = [(id)objc_opt_class() newLabel];
    label = v4->_label;
    v4->_label = (UILabel *)v6;

    [(PREditingStandaloneLabelView *)v4 addSubview:v4->_label];
    v18 = (void *)MEMORY[0x1E4F28DC8];
    v22 = [(PREditingStandaloneLabelView *)v4 topAnchor];
    v21 = [(UILabel *)v4->_label topAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v24[0] = v20;
    v19 = [(PREditingStandaloneLabelView *)v4 leftAnchor];
    v8 = [(UILabel *)v4->_label leftAnchor];
    v9 = [v19 constraintEqualToAnchor:v8];
    v24[1] = v9;
    v10 = [(PREditingStandaloneLabelView *)v4 rightAnchor];
    v11 = [(UILabel *)v4->_label rightAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v24[2] = v12;
    v13 = [(PREditingStandaloneLabelView *)v4 bottomAnchor];
    v14 = [(UILabel *)v4->_label bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v24[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    [v18 activateConstraints:v16];
  }
  return v4;
}

- (void)setText:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSString *)[v6 copy];
    text = self->_text;
    self->_text = v4;

    [(PREditingStandaloneLabelView *)self setDisplayedText:v6];
  }
}

- (void)setDisplayedText:(id)a3
{
  id v4 = a3;
  v5 = [(PREditingStandaloneLabelView *)self label];
  [v5 setText:v4];

  [(PREditingStandaloneLabelView *)self invalidateIntrinsicContentSize];
}

- (id)beginInteractiveTransitionToText:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PREditingStandaloneLabelView.m", 74, @"Invalid parameter not satisfying: %@", @"text" object file lineNumber description];
  }
  id v6 = [PREditingStandaloneLabelViewInteractiveTransition alloc];
  v7 = [(PREditingStandaloneLabelView *)self text];
  v8 = [(PREditingStandaloneLabelViewInteractiveTransition *)v6 initWithLabel:self currentText:v7 transitionText:v5];

  [(PREditingStandaloneLabelView *)self setCurrentTransition:v8];
  [(PREditingStandaloneLabelView *)self invalidateIntrinsicContentSize];

  return v8;
}

- (void)interactiveTransition:(id)a3 didUpdate:(double)a4
{
  id v9 = a3;
  id v6 = [(PREditingStandaloneLabelView *)self currentTransition];

  v7 = v9;
  if (v6 == v9)
  {
    if (a4 >= 0.5) {
      [v9 transitionText];
    }
    else {
    v8 = [v9 currentText];
    }
    [(PREditingStandaloneLabelView *)self setDisplayedText:v8];

    v7 = v9;
  }
}

- (void)interactiveTransition:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  id v9 = a3;
  id v6 = [(PREditingStandaloneLabelView *)self currentTransition];

  v7 = v9;
  if (v6 == v9)
  {
    if (a4) {
      [v9 transitionText];
    }
    else {
    v8 = [v9 currentText];
    }
    [(PREditingStandaloneLabelView *)self setText:v8];
    [(PREditingStandaloneLabelView *)self setCurrentTransition:0];
    [(PREditingStandaloneLabelView *)self invalidateIntrinsicContentSize];

    v7 = v9;
  }
}

- (CGSize)intrinsicContentSize
{
  id v2 = [(PREditingStandaloneLabelView *)self label];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSString)text
{
  return self->_text;
}

- (UILabel)label
{
  return self->_label;
}

- (PREditingStandaloneLabelViewInteractiveTransition)currentTransition
{
  return self->_currentTransition;
}

- (void)setCurrentTransition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
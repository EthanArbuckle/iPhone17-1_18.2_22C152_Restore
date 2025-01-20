@interface COSHorizontalCheckmarkChoiceView
- (CGSize)intrinsicContentSize;
- (COSHorizontalCheckmarkChoiceView)initWithLeftTitle:(id)a3 rightTitle:(id)a4;
- (COSHorizontalCheckmarkChoiceViewDelegate)delegate;
- (unint64_t)selectedChoice;
- (void)didTapChoiceView:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setSelectedChoice:(unint64_t)a3;
@end

@implementation COSHorizontalCheckmarkChoiceView

- (COSHorizontalCheckmarkChoiceView)initWithLeftTitle:(id)a3 rightTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)COSHorizontalCheckmarkChoiceView;
  v8 = [(COSHorizontalCheckmarkChoiceView *)&v16 init];
  v9 = v8;
  if (v8)
  {
    v8->_selectedChoice = 0;
    v10 = [[CheckmarkChoiceView alloc] initWithTitle:v6];
    leftChoice = v9->_leftChoice;
    v9->_leftChoice = v10;

    [(CheckmarkChoiceView *)v9->_leftChoice sizeToFit];
    [(COSHorizontalCheckmarkChoiceView *)v9 addSubview:v9->_leftChoice];
    v12 = [[CheckmarkChoiceView alloc] initWithTitle:v7];
    rightChoice = v9->_rightChoice;
    v9->_rightChoice = v12;

    [(CheckmarkChoiceView *)v9->_rightChoice sizeToFit];
    [(COSHorizontalCheckmarkChoiceView *)v9 addSubview:v9->_rightChoice];
    id v14 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v9 action:"didTapChoiceView:"];
    [(COSHorizontalCheckmarkChoiceView *)v9 addGestureRecognizer:v14];
  }
  return v9;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)COSHorizontalCheckmarkChoiceView;
  [(COSHorizontalCheckmarkChoiceView *)&v9 layoutSubviews];
  [(COSHorizontalCheckmarkChoiceView *)self frame];
  double v4 = v3;
  [(COSHorizontalCheckmarkChoiceView *)self frame];
  double v6 = v5;
  double v7 = v4 * 0.45 * -0.5;
  double v8 = v5 * -0.5 + v5 * 0.5;
  -[CheckmarkChoiceView setFrame:](self->_leftChoice, "setFrame:", v7 + v4 * 0.25, v8, v4 * 0.45);
  -[CheckmarkChoiceView setFrame:](self->_rightChoice, "setFrame:", v7 + v4 * 0.75, v8, v4 * 0.45, v6);
}

- (CGSize)intrinsicContentSize
{
  double v2 = UIViewNoIntrinsicMetric;
  double v3 = 66.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)didTapChoiceView:(id)a3
{
  [a3 locationInView:self];
  double v5 = v4;
  [(COSHorizontalCheckmarkChoiceView *)self bounds];
  float v6 = CGRectGetWidth(v9) * 0.5;
  if (v5 <= floorf(v6)) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }

  [(COSHorizontalCheckmarkChoiceView *)self setSelectedChoice:v7];
}

- (void)setSelectedChoice:(unint64_t)a3
{
  self->_selectedChoice = a3;
  BOOL v5 = a3 == 2;
  BOOL v6 = a3 == 1;
  BOOL v7 = a3 == 1;
  BOOL v8 = !v6 && v5;
  [(CheckmarkChoiceView *)self->_leftChoice setSelected:v7];
  [(CheckmarkChoiceView *)self->_rightChoice setSelected:v8];
  id v9 = [(COSHorizontalCheckmarkChoiceView *)self delegate];
  [v9 choiceView:self didSelectChoice:a3];
}

- (COSHorizontalCheckmarkChoiceViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSHorizontalCheckmarkChoiceViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)selectedChoice
{
  return self->_selectedChoice;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rightChoice, 0);

  objc_storeStrong((id *)&self->_leftChoice, 0);
}

@end
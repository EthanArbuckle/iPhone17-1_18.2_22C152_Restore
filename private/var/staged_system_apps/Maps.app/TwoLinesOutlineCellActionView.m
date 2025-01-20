@interface TwoLinesOutlineCellActionView
- (TwoLinesOutlineCell)outlineCell;
- (TwoLinesOutlineCellActionModel)viewModel;
- (TwoLinesOutlineCellActionView)initWithFrame:(CGRect)a3 twoLinesOutlineCell:(id)a4;
- (void)_buttonTapped:(id)a3;
- (void)_updateConstraintsWithAxis:(int64_t)a3;
- (void)_updateFromModel;
- (void)layoutSubviews;
- (void)setViewModel:(id)a3;
@end

@implementation TwoLinesOutlineCellActionView

- (TwoLinesOutlineCellActionView)initWithFrame:(CGRect)a3 twoLinesOutlineCell:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TwoLinesOutlineCellActionView;
  v10 = -[TwoLinesOutlineCellActionView initWithFrame:](&v17, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_outlineCell, v9);
    uint64_t v12 = +[UIButton buttonWithType:1];
    button1 = v11->_button1;
    v11->_button1 = (UIButton *)v12;

    [(UIButton *)v11->_button1 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v11->_button1 addTarget:v11 action:"_buttonTapped:" forControlEvents:64];
    [(TwoLinesOutlineCellActionView *)v11 addSubview:v11->_button1];
    uint64_t v14 = +[UIButton buttonWithType:1];
    button2 = v11->_button2;
    v11->_button2 = (UIButton *)v14;

    [(UIButton *)v11->_button2 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v11->_button2 addTarget:v11 action:"_buttonTapped:" forControlEvents:64];
    [(TwoLinesOutlineCellActionView *)v11 addSubview:v11->_button2];
    [(TwoLinesOutlineCellActionView *)v11 _updateConstraintsWithAxis:v11->_axis];
  }

  return v11;
}

- (void)_updateConstraintsWithAxis:(int64_t)a3
{
  constraints = self->_constraints;
  if (!constraints || self->_axis != a3)
  {
    if ([(NSArray *)constraints count]) {
      +[NSLayoutConstraint deactivateConstraints:self->_constraints];
    }
    self->_axis = a3;
    v6 = [(UIButton *)self->_button1 topAnchor];
    v43 = [(TwoLinesOutlineCellActionView *)self topAnchor];
    v44 = v6;
    uint64_t v7 = [v6 constraintEqualToAnchor:v43];
    v42 = (void *)v7;
    if (a3 == 1)
    {
      v46[0] = v7;
      v8 = [(UIButton *)self->_button2 topAnchor];
      v40 = [(UIButton *)self->_button1 bottomAnchor];
      v41 = v8;
      v39 = [v8 constraintEqualToAnchor:v40 constant:8.0];
      v46[1] = v39;
      id v9 = [(UIButton *)self->_button2 bottomAnchor];
      v37 = [(TwoLinesOutlineCellActionView *)self bottomAnchor];
      v38 = v9;
      v36 = [v9 constraintEqualToAnchor:v37];
      v46[2] = v36;
      v10 = [(UIButton *)self->_button1 leadingAnchor];
      v34 = [(TwoLinesOutlineCellActionView *)self leadingAnchor];
      v35 = v10;
      v33 = [v10 constraintEqualToAnchor:v34];
      v46[3] = v33;
      v11 = [(UIButton *)self->_button1 trailingAnchor];
      v32 = [(TwoLinesOutlineCellActionView *)self trailingAnchor];
      v31 = [v11 constraintEqualToAnchor:-8.0];
      v46[4] = v31;
      uint64_t v12 = [(UIButton *)self->_button2 leadingAnchor];
      v13 = [(TwoLinesOutlineCellActionView *)self leadingAnchor];
      v30 = v12;
      uint64_t v14 = [v12 constraintEqualToAnchor:v13];
      v46[5] = v14;
      v15 = [(UIButton *)self->_button2 trailingAnchor];
      v16 = [(TwoLinesOutlineCellActionView *)self trailingAnchor];
      objc_super v17 = [v15 constraintEqualToAnchor:v16 constant:-8.0];
      v46[6] = v17;
      v18 = +[NSArray arrayWithObjects:v46 count:7];
      v19 = self->_constraints;
      self->_constraints = v18;
    }
    else
    {
      v45[0] = v7;
      v20 = [(UIButton *)self->_button1 bottomAnchor];
      v40 = [(TwoLinesOutlineCellActionView *)self bottomAnchor];
      v41 = v20;
      v39 = [v20 constraintEqualToAnchor:v40];
      v45[1] = v39;
      v21 = [(UIButton *)self->_button2 topAnchor];
      v37 = [(TwoLinesOutlineCellActionView *)self topAnchor];
      v38 = v21;
      v36 = [v21 constraintEqualToAnchor:v37];
      v45[2] = v36;
      v22 = [(UIButton *)self->_button2 bottomAnchor];
      v34 = [(TwoLinesOutlineCellActionView *)self bottomAnchor];
      v35 = v22;
      v33 = [v22 constraintEqualToAnchor:v34];
      v45[3] = v33;
      v29 = [(UIButton *)self->_button1 leadingAnchor];
      v32 = [(TwoLinesOutlineCellActionView *)self leadingAnchor];
      v31 = [v29 constraintEqualToAnchor:];
      v45[4] = v31;
      v23 = [(UIButton *)self->_button2 leadingAnchor];
      v13 = [(UIButton *)self->_button1 trailingAnchor];
      v30 = v23;
      uint64_t v14 = [v23 constraintEqualToAnchor:v13 constant:10.0];
      v45[5] = v14;
      v15 = [(UIButton *)self->_button2 trailingAnchor];
      v16 = [(TwoLinesOutlineCellActionView *)self trailingAnchor];
      objc_super v17 = [v15 constraintLessThanOrEqualToAnchor:v16 constant:-8.0];
      v45[6] = v17;
      v19 = [(UIButton *)self->_button2 widthAnchor];
      v24 = [(UIButton *)self->_button1 widthAnchor];
      LODWORD(v25) = 1132134400;
      v26 = [v19 constraintEqualToAnchor:v24 multiplier:1.0 priority:v25];
      v45[7] = v26;
      v27 = +[NSArray arrayWithObjects:v45 count:8];
      v28 = self->_constraints;
      self->_constraints = v27;

      v11 = v29;
    }

    +[NSLayoutConstraint activateConstraints:self->_constraints];
  }
}

- (void)layoutSubviews
{
  [(UIButton *)self->_button1 intrinsicContentSize];
  double v4 = v3;
  [(UIButton *)self->_button2 intrinsicContentSize];
  double v6 = v4 + 10.0 + v5;
  [(TwoLinesOutlineCellActionView *)self bounds];
  [(TwoLinesOutlineCellActionView *)self _updateConstraintsWithAxis:v6 > v7];
  v8.receiver = self;
  v8.super_class = (Class)TwoLinesOutlineCellActionView;
  [(TwoLinesOutlineCellActionView *)&v8 layoutSubviews];
}

- (void)setViewModel:(id)a3
{
  double v5 = (TwoLinesOutlineCellActionModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    objc_super v8 = v5;
    unsigned __int8 v7 = [(TwoLinesOutlineCellActionModel *)viewModel isEqual:v5];
    double v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewModel, a3);
      [(TwoLinesOutlineCellActionView *)self _updateFromModel];
      double v5 = v8;
    }
  }
}

- (void)_updateFromModel
{
  button1 = self->_button1;
  double v4 = [(TwoLinesOutlineCellActionModel *)self->_viewModel buttonTitle1];
  [(UIButton *)button1 setTitle:v4 forState:0];

  button2 = self->_button2;
  double v6 = [(TwoLinesOutlineCellActionModel *)self->_viewModel buttonTitle2];
  [(UIButton *)button2 setTitle:v6 forState:0];

  [(TwoLinesOutlineCellActionView *)self setNeedsLayout];
}

- (void)_buttonTapped:(id)a3
{
  viewModel = self->_viewModel;
  double v5 = (UIButton *)a3;
  id v8 = [(TwoLinesOutlineCellActionModel *)viewModel delegate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_outlineCell);
  BOOL v7 = self->_button1 != v5;

  [v8 twoLinesOutlineCell:WeakRetained tappedActionButtonAtIndex:v7];
}

- (TwoLinesOutlineCell)outlineCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_outlineCell);

  return (TwoLinesOutlineCell *)WeakRetained;
}

- (TwoLinesOutlineCellActionModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_outlineCell);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_button2, 0);

  objc_storeStrong((id *)&self->_button1, 0);
}

@end
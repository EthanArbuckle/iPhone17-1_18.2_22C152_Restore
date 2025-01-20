@interface _UIPageIndicatorProgressView
- (UIView)backgroundView;
- (UIView)filledView;
- (_UIPageIndicatorProgressView)initWithCoder:(id)a3;
- (_UIPageIndicatorProgressView)initWithFrame:(CGRect)a3;
- (_UIPageIndicatorView)indicatorView;
- (void)layoutSubviews;
- (void)prepare;
- (void)setIndicatorView:(id)a3;
@end

@implementation _UIPageIndicatorProgressView

- (_UIPageIndicatorProgressView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPageIndicatorProgressView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_UIPageIndicatorProgressView *)v3 prepare];
  }
  return v4;
}

- (_UIPageIndicatorProgressView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPageIndicatorProgressView;
  v3 = [(UIView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(_UIPageIndicatorProgressView *)v3 prepare];
  }
  return v4;
}

- (void)prepare
{
  [(UIView *)self setClipsToBounds:1];
  v3 = [(UIView *)self layer];
  [v3 setAllowsEdgeAntialiasing:1];

  v4 = [UIView alloc];
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v9 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v9;

  [(UIView *)self addSubview:self->_backgroundView];
  v11 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v5, v6, v7, v8);
  filledView = self->_filledView;
  self->_filledView = v11;

  v13 = [(UIView *)self->_filledView layer];
  [v13 setAllowsEdgeAntialiasing:1];

  v14 = self->_filledView;
  [(UIView *)self addSubview:v14];
}

- (void)layoutSubviews
{
  v48.receiver = self;
  v48.super_class = (Class)_UIPageIndicatorProgressView;
  [(UIView *)&v48 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  [(UIView *)self bounds];
  double v6 = fmin(v4, v5) * 0.5;
  [(UIView *)self _setContinuousCornerRadius:v6];
  double v7 = [(_UIPageIndicatorProgressView *)self filledView];
  [v7 _setContinuousCornerRadius:v6];

  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(_UIPageIndicatorProgressView *)self backgroundView];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  v17 = [(_UIPageIndicatorProgressView *)self indicatorView];
  uint64_t v18 = [v17 direction];

  v19 = [(_UIPageIndicatorProgressView *)self indicatorView];
  uint64_t v20 = [v19 _transitionDirection];

  v21 = [(_UIPageIndicatorProgressView *)self indicatorView];
  [v21 currentProgress];
  double v23 = v22;

  v24 = [(_UIPageIndicatorProgressView *)self indicatorView];
  [v24 _adjustedDefaultModeSize];
  double v26 = v25;
  double v28 = v27;

  v29 = [(_UIPageIndicatorProgressView *)self indicatorView];
  [v29 _adjustedExpandedModeSize];
  double v31 = v30;
  double v33 = v32;

  double v35 = *MEMORY[0x1E4F1DAD8];
  double v34 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v36 = [(_UIPageIndicatorProgressView *)self indicatorView];
  unint64_t v37 = [v36 direction];

  double v38 = (1.0 - v23) * v26 + v31 * v23;
  if (v37 <= 1) {
    double v39 = v33;
  }
  else {
    double v39 = (1.0 - v23) * v28 + v33 * v23;
  }
  if (v37 <= 1) {
    double v40 = v38;
  }
  else {
    double v40 = v31;
  }
  switch(v18)
  {
    case 0:
      if (v20 == 1)
      {
        [(UIView *)self bounds];
        double Width = CGRectGetWidth(v49);
        v50.origin.x = v35;
        v50.origin.y = v34;
        v50.size.width = v31;
        v50.size.height = v33;
        double v38 = CGRectGetWidth(v50);
        double v35 = Width - v38;
      }
      break;
    case 1:
      if (v20 == 1)
      {
        v54.origin.x = v35;
        v54.origin.y = v34;
        v54.size.width = v31;
        v54.size.height = v33;
        double MaxX = CGRectGetWidth(v54);
      }
      else
      {
        [(UIView *)self bounds];
        double MaxX = CGRectGetMaxX(v57);
      }
      double v46 = MaxX;
      v58.origin.x = v35;
      v58.origin.y = v34;
      v58.size.width = v40;
      v58.size.height = v39;
      double v38 = CGRectGetWidth(v58);
      double v35 = v46 - v38;
      break;
    case 2:
      if (v20 == 1)
      {
        [(UIView *)self bounds];
        double Height = CGRectGetHeight(v51);
        v52.origin.x = v35;
        v52.origin.y = v34;
        v52.size.width = v31;
        v52.size.height = v33;
        double v38 = CGRectGetHeight(v52);
        double v34 = Height - v38;
      }
      break;
    case 3:
      if (v20 == 1)
      {
        v53.origin.x = v35;
        v53.origin.y = v34;
        v53.size.width = v31;
        v53.size.height = v33;
        double MaxY = CGRectGetHeight(v53);
      }
      else
      {
        [(UIView *)self bounds];
        double MaxY = CGRectGetMaxY(v55);
      }
      double v45 = MaxY;
      v56.origin.x = v35;
      v56.origin.y = v34;
      v56.size.width = v40;
      v56.size.height = v39;
      double v38 = CGRectGetHeight(v56);
      double v34 = v45 - v38;
      break;
    default:
      break;
  }
  v47 = [(_UIPageIndicatorProgressView *)self filledView];
  objc_msgSend(v47, "setFrame:", v35, v34, v40, v39);
}

- (_UIPageIndicatorView)indicatorView
{
  return self->_indicatorView;
}

- (void)setIndicatorView:(id)a3
{
  self->_indicatorView = (_UIPageIndicatorView *)a3;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)filledView
{
  return self->_filledView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filledView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
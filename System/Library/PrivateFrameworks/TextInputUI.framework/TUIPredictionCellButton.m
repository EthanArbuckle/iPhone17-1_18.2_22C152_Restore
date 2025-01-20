@interface TUIPredictionCellButton
- (TUIPredictionCellButton)initWithFrame:(CGRect)a3;
- (TUIPredictionViewCell)cellView;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation TUIPredictionCellButton

- (void).cxx_destruct
{
}

- (TUIPredictionViewCell)cellView
{
  return self->_cellView;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TUIPredictionCellButton;
  -[TUIPredictionCellButton setHighlighted:](&v5, sel_setHighlighted_);
  [(TUIPredictionViewCell *)self->_cellView setHighlighted:v3];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TUIPredictionCellButton;
  [(TUIPredictionCellButton *)&v3 layoutSubviews];
  [(TUIPredictionCellButton *)self bounds];
  -[TUIPredictionViewCell setFrame:](self->_cellView, "setFrame:");
}

- (TUIPredictionCellButton)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TUIPredictionCellButton;
  objc_super v3 = -[TUIPredictionCellButton initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [TUIPredictionViewCell alloc];
    uint64_t v5 = -[TUIPredictionViewCell initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    cellView = v3->_cellView;
    v3->_cellView = (TUIPredictionViewCell *)v5;

    [(TUIPredictionViewCell *)v3->_cellView setUserInteractionEnabled:0];
    [(TUIPredictionCellButton *)v3 addSubview:v3->_cellView];
  }
  return v3;
}

@end
@interface UIInputSwitcherSegmentedTableCell
+ (CGSize)preferredSizeWithSegmentCount:(unint64_t)a3;
- (UIInputSwitcherSegmentControl)segmentControl;
- (UIInputSwitcherSegmentedTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setUsesDarkTheme:(BOOL)a3;
- (void)updateSelectionWithPoint:(CGPoint)a3;
@end

@implementation UIInputSwitcherSegmentedTableCell

- (UIInputSwitcherSegmentedTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)UIInputSwitcherSegmentedTableCell;
  v4 = [(UIInputSwitcherTableCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [UIInputSwitcherSegmentControl alloc];
    uint64_t v6 = -[UIInputSwitcherSegmentControl initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    segmentControl = v4->_segmentControl;
    v4->_segmentControl = (UIInputSwitcherSegmentControl *)v6;

    [(UIInputSwitcherSegmentControl *)v4->_segmentControl setSelectedSegmentIndex:-1];
    [(UIInputSwitcherSegmentControl *)v4->_segmentControl setUsesDarkTheme:[(UIInputSwitcherTableCell *)v4 usesDarkTheme]];
    [(UIView *)v4 addSubview:v4->_segmentControl];
  }
  return v4;
}

+ (CGSize)preferredSizeWithSegmentCount:(unint64_t)a3
{
  double v3 = (double)a3 * 64.0 + (double)(a3 + 1) * 9.0;
  double v4 = 51.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)UIInputSwitcherSegmentedTableCell;
  [(UIInputSwitcherTableCell *)&v4 setSelected:0 animated:a4];
}

- (void)updateSelectionWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIInputSwitcherSegmentedTableCell *)self setSelected:1 animated:0];
  id v6 = [(UIInputSwitcherSegmentedTableCell *)self segmentControl];
  objc_msgSend(v6, "updateSelectionWithPoint:", x, y);
}

- (void)layoutSubviews
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5 + 9.0;
  double v8 = v7 + -18.0;
  double v10 = v9 + 0.0;
  id v11 = [(UIInputSwitcherSegmentedTableCell *)self segmentControl];
  objc_msgSend(v11, "setFrame:", v6, v10, v8, v4);
}

- (void)setUsesDarkTheme:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIInputSwitcherSegmentedTableCell;
  -[UIInputSwitcherTableCell setUsesDarkTheme:](&v6, sel_setUsesDarkTheme_);
  double v5 = [(UIInputSwitcherSegmentedTableCell *)self segmentControl];
  [v5 setUsesDarkTheme:v3];
}

- (UIInputSwitcherSegmentControl)segmentControl
{
  return self->_segmentControl;
}

- (void).cxx_destruct
{
}

@end
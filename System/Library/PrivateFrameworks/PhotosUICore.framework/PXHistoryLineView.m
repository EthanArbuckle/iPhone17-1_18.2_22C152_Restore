@interface PXHistoryLineView
- (PXHistoryLineView)initWithHistoryLine:(id)a3;
- (void)layoutSubviews;
- (void)setHistoryLine:(id)a3;
@end

@implementation PXHistoryLineView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasonLabel, 0);
  objc_storeStrong((id *)&self->_stateBadgeView, 0);
}

- (void)setHistoryLine:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"state"];
  [(PXStateBadgeView *)self->_stateBadgeView setState:v5];

  v6 = NSString;
  v7 = [v4 objectForKeyedSubscript:@"stage"];
  v8 = [v4 objectForKeyedSubscript:@"agent"];
  v9 = [v4 objectForKeyedSubscript:@"reason"];

  id v10 = [v6 stringWithFormat:@"%@ (%@): %@", v7, v8, v9];

  [(UILabel *)self->_reasonLabel setText:v10];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PXHistoryLineView;
  [(PXHistoryLineView *)&v4 layoutSubviews];
  -[PXStateBadgeView setFrame:](self->_stateBadgeView, "setFrame:", 2.0, 3.0, 16.0, 16.0);
  -[UILabel setFrame:](self->_reasonLabel, "setFrame:", 22.0, 0.0, 300.0, 38.0);
  v3 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
  [(UILabel *)self->_reasonLabel setFont:v3];
}

- (PXHistoryLineView)initWithHistoryLine:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXHistoryLineView;
  v5 = [(PXHistoryLineView *)&v11 init];
  if (v5)
  {
    v6 = [[PXStateBadgeView alloc] initWithState:0];
    stateBadgeView = v5->_stateBadgeView;
    v5->_stateBadgeView = v6;

    [(PXHistoryLineView *)v5 addSubview:v5->_stateBadgeView];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    reasonLabel = v5->_reasonLabel;
    v5->_reasonLabel = v8;

    [(UILabel *)v5->_reasonLabel setNumberOfLines:2];
    [(PXHistoryLineView *)v5 addSubview:v5->_reasonLabel];
    [(PXHistoryLineView *)v5 setHistoryLine:v4];
  }

  return v5;
}

@end
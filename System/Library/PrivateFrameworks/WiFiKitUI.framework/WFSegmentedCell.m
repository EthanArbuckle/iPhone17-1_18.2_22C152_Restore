@interface WFSegmentedCell
- (UISegmentedControl)segmentedControl;
- (id)handler;
- (void)_segmentedControlDidChange:(id)a3;
- (void)addSubview:(id)a3;
- (void)awakeFromNib;
- (void)setHandler:(id)a3;
- (void)setSegmentedControl:(id)a3;
@end

@implementation WFSegmentedCell

- (void)awakeFromNib
{
  v4.receiver = self;
  v4.super_class = (Class)WFSegmentedCell;
  [(WFSegmentedCell *)&v4 awakeFromNib];
  v3 = [(WFSegmentedCell *)self segmentedControl];
  [v3 addTarget:self action:sel__segmentedControlDidChange_ forControlEvents:4096];
}

- (void)_segmentedControlDidChange:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(WFSegmentedCell *)self handler];

  if (v4)
  {
    v5 = [(WFSegmentedCell *)self handler];
    v5[2](v5, [v6 selectedSegmentIndex]);
  }
}

- (void)addSubview:(id)a3
{
  id v4 = a3;
  [v4 frame];
  double Height = CGRectGetHeight(v10);
  id v6 = [MEMORY[0x263F82B60] mainScreen];
  [v6 scale];
  double v8 = Height * v7;

  if (v8 != 1.0)
  {
    v9.receiver = self;
    v9.super_class = (Class)WFSegmentedCell;
    [(WFSegmentedCell *)&v9 addSubview:v4];
  }
}

- (UISegmentedControl)segmentedControl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_segmentedControl);
  return (UISegmentedControl *)WeakRetained;
}

- (void)setSegmentedControl:(id)a3
{
}

- (id)handler
{
  return objc_getProperty(self, a2, 1024, 1);
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_destroyWeak((id *)&self->_segmentedControl);
}

@end
@interface WFParameterEditorHostingCell
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIViewController)containingViewController;
- (WFParameterEditorHostingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (WFParameterEditorHostingCellDelegate)delegate;
- (WFParameterEditorModel)model;
- (WFParameterHostingView)modernHostingView;
- (double)lastWidth;
- (void)layoutSubviews;
- (void)parameterAttributesDidChange:(id)a3;
- (void)reconfigureModernView;
- (void)setContainingViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastWidth:(double)a3;
- (void)setModernHostingView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateContext;
- (void)updateModel:(id)a3;
- (void)updatedParameterState:(id)a3 isUIUpdate:(BOOL)a4;
@end

@implementation WFParameterEditorHostingCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modernHostingView, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_containingViewController);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setLastWidth:(double)a3
{
  self->_lastWidth = a3;
}

- (double)lastWidth
{
  return self->_lastWidth;
}

- (void)setModernHostingView:(id)a3
{
}

- (WFParameterHostingView)modernHostingView
{
  return self->_modernHostingView;
}

- (WFParameterEditorModel)model
{
  return self->_model;
}

- (UIViewController)containingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WFParameterEditorHostingCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFParameterEditorHostingCellDelegate *)WeakRetained;
}

- (void)parameterAttributesDidChange:(id)a3
{
  id v4 = [(WFParameterEditorHostingCell *)self delegate];
  [v4 parameterEditorCellDidInvalidateSize:self];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFParameterEditorHostingCell;
  [(WFParameterEditorHostingCell *)&v8 traitCollectionDidChange:v4];
  v5 = [(WFParameterEditorHostingCell *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(WFParameterEditorHostingCell *)self updateContext];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v5 = [(WFParameterEditorHostingCell *)self contentView];
  [v5 bounds];
  if (width >= v6)
  {
    uint64_t v7 = [(WFParameterEditorHostingCell *)self contentView];
    [v7 bounds];
    double width = v8;
  }
  v9 = [(WFParameterEditorHostingCell *)self modernHostingView];
  objc_msgSend(v9, "sizeThatFits:", width, 1.79769313e308);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.double width = v14;
  return result;
}

- (void)updatedParameterState:(id)a3 isUIUpdate:(BOOL)a4
{
  id v6 = a3;
  if (!a4)
  {
    uint64_t v7 = [(WFParameterEditorHostingCell *)self delegate];
    [v7 parameterEditorCell:self didUpdateParameterState:v6];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__WFParameterEditorHostingCell_updatedParameterState_isUIUpdate___block_invoke;
  block[3] = &unk_264BFDBA0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __65__WFParameterEditorHostingCell_updatedParameterState_isUIUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 parameterEditorCellDidInvalidateSize:*(void *)(a1 + 32)];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_isEqual(a3, sel_updatedParameterState_isUIUpdate_))
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFParameterEditorHostingCell;
    BOOL v7 = [(WFParameterEditorHostingCell *)&v9 canPerformAction:a3 withSender:v6];
  }

  return v7;
}

- (void)reconfigureModernView
{
  v3 = [(WFParameterEditorHostingCell *)self model];
  if (v3)
  {
    id v4 = [(WFParameterEditorHostingCell *)self modernHostingView];
    v5 = [v3 parameter];
    id v6 = [v3 state];
    uint64_t v7 = [v3 becomeFirstResponder];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __53__WFParameterEditorHostingCell_reconfigureModernView__block_invoke;
    v8[3] = &unk_264BFD118;
    v8[4] = self;
    [v4 configureViewForRuntimeUIWithParameter:v5 state:v6 processing:1 shouldFocus:v7 variableProvider:0 updateBlock:v8];
  }
}

uint64_t __53__WFParameterEditorHostingCell_reconfigureModernView__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) updatedParameterState:a2 isUIUpdate:a3];
}

- (void)updateModel:(id)a3
{
  v5 = (WFParameterEditorModel *)a3;
  model = self->_model;
  objc_super v9 = v5;
  if (model != v5)
  {
    uint64_t v7 = [(WFParameterEditorModel *)model parameter];
    [v7 removeEventObserver:self];

    objc_storeStrong((id *)&self->_model, a3);
    double v8 = [(WFParameterEditorModel *)v9 parameter];
    [v8 addEventObserver:self];

    [(WFParameterEditorHostingCell *)self reconfigureModernView];
  }
}

- (void)updateContext
{
  v3 = [(WFParameterEditorHostingCell *)self containingViewController];

  id v4 = [(WFParameterEditorHostingCell *)self modernHostingView];
  v5 = v4;
  if (v3)
  {
    id v6 = [(WFParameterEditorHostingCell *)self containingViewController];
    [v5 attachToParentViewController:v6];
  }
  else
  {
    [v4 detachFromParentViewController];
  }

  [(WFParameterEditorHostingCell *)self reconfigureModernView];
}

- (void)setContainingViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingViewController);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_containingViewController, obj);
    [(WFParameterEditorHostingCell *)self updateContext];
  }
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)WFParameterEditorHostingCell;
  [(WFParameterEditorHostingCell *)&v18 layoutSubviews];
  v3 = [(WFParameterEditorHostingCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;

  v19.origin.double x = v5;
  v19.origin.double y = v7;
  v19.size.double width = v9;
  v19.size.double height = v11;
  CGRect v20 = CGRectIntegral(v19);
  double x = v20.origin.x;
  double y = v20.origin.y;
  double width = v20.size.width;
  double height = v20.size.height;
  v16 = [(WFParameterEditorHostingCell *)self modernHostingView];
  objc_msgSend(v16, "setFrame:", x, y, width, height);

  if (v9 != self->_lastWidth)
  {
    self->_lastWidth = v9;
    v17 = [(WFParameterEditorHostingCell *)self delegate];
    [v17 parameterEditorCellDidInvalidateSize:self];
  }
}

- (WFParameterEditorHostingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WFParameterEditorHostingCell;
  double v4 = [(WFParameterEditorHostingCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    CGFloat v5 = objc_alloc_init(WFParameterHostingView);
    double v6 = [(WFParameterEditorHostingCell *)v4 contentView];
    [v6 addSubview:v5];

    [(WFParameterEditorHostingCell *)v4 setModernHostingView:v5];
    CGFloat v7 = v4;
  }
  return v4;
}

@end
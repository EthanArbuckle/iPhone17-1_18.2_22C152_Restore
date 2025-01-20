@interface PXGInteraction
- (PXGHitTestEnvironment)view;
- (PXGLayout)layout;
- (PXScrollViewController)scrollViewController;
- (void)setLayout:(id)a3;
- (void)setScrollViewController:(id)a3;
- (void)setView:(id)a3;
@end

@implementation PXGInteraction

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollViewController);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_layout);
}

- (PXScrollViewController)scrollViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewController);
  return (PXScrollViewController *)WeakRetained;
}

- (PXGHitTestEnvironment)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (PXGHitTestEnvironment *)WeakRetained;
}

- (PXGLayout)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  return (PXGLayout *)WeakRetained;
}

- (void)setScrollViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_scrollViewController, obj);
    [(PXGInteraction *)self scrollViewControllerDidChange];
    v5 = obj;
  }
}

- (void)setView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (WeakRetained != obj)
  {
    [(PXGInteraction *)self viewWillChange];
    objc_storeWeak((id *)&self->_view, obj);
    [(PXGInteraction *)self viewDidChange];
  }
}

- (void)setLayout:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_layout, obj);
    [(PXGInteraction *)self layoutDidChange];
    v5 = obj;
  }
}

@end
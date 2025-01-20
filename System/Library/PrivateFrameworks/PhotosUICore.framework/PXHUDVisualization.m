@interface PXHUDVisualization
- (NSString)title;
- (PXHUDVisualizationDelegate)delegate;
- (UIColor)color;
- (void)_notifyDelegateVisualizationDidChange;
- (void)setColor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXHUDVisualization

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PXHUDVisualizationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXHUDVisualizationDelegate *)WeakRetained;
}

- (NSString)title
{
  return self->_title;
}

- (void)_notifyDelegateVisualizationDidChange
{
  v3 = [(PXHUDVisualization *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PXHUDVisualization *)self delegate];
    [v5 visualizationDidChange:self];
  }
}

- (void)setColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_color != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_color, a3);
    [(PXHUDVisualization *)self _notifyDelegateVisualizationDidChange];
    id v5 = v6;
  }
}

- (UIColor)color
{
  color = self->_color;
  if (color)
  {
    v3 = color;
  }
  else
  {
    v3 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  if (self->_title != a3)
  {
    char v4 = (NSString *)[a3 copy];
    title = self->_title;
    self->_title = v4;

    [(PXHUDVisualization *)self _notifyDelegateVisualizationDidChange];
  }
}

@end
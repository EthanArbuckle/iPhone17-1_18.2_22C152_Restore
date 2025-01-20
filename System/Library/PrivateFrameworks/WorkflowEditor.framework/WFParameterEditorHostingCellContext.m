@interface WFParameterEditorHostingCellContext
- (UITraitCollection)traitCollection;
- (WFParameterEditorHostingCell)cell;
- (void)setCell:(id)a3;
- (void)setTraitCollection:(id)a3;
@end

@implementation WFParameterEditorHostingCellContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_destroyWeak((id *)&self->_cell);
}

- (void)setTraitCollection:(id)a3
{
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setCell:(id)a3
{
}

- (WFParameterEditorHostingCell)cell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  return (WFParameterEditorHostingCell *)WeakRetained;
}

@end
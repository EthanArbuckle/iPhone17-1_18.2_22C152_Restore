@interface SearchUICollectionViewAttributes
- (BOOL)disableEmphasizedSelection;
- (BOOL)hasFooter;
- (BOOL)inPreviewPlatter;
- (BOOL)selectionShouldFillWidth;
- (BOOL)shouldUseInsetRoundedSections;
- (SearchUICommandEnvironment)commandEnvironment;
- (SearchUIHeaderDelegate)headerDelegate;
- (TLKAppearance)appearance;
- (void)setAppearance:(id)a3;
- (void)setCommandEnvironment:(id)a3;
- (void)setDisableEmphasizedSelection:(BOOL)a3;
- (void)setHasFooter:(BOOL)a3;
- (void)setHeaderDelegate:(id)a3;
- (void)setInPreviewPlatter:(BOOL)a3;
- (void)setSelectionShouldFillWidth:(BOOL)a3;
- (void)setShouldUseInsetRoundedSections:(BOOL)a3;
@end

@implementation SearchUICollectionViewAttributes

- (BOOL)inPreviewPlatter
{
  return self->_inPreviewPlatter;
}

- (BOOL)shouldUseInsetRoundedSections
{
  return self->_shouldUseInsetRoundedSections;
}

- (void)setCommandEnvironment:(id)a3
{
}

- (TLKAppearance)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(id)a3
{
}

- (void)setShouldUseInsetRoundedSections:(BOOL)a3
{
  self->_shouldUseInsetRoundedSections = a3;
}

- (void)setInPreviewPlatter:(BOOL)a3
{
  self->_inPreviewPlatter = a3;
}

- (BOOL)hasFooter
{
  return self->_hasFooter;
}

- (void)setHasFooter:(BOOL)a3
{
  self->_hasFooter = a3;
}

- (BOOL)selectionShouldFillWidth
{
  return self->_selectionShouldFillWidth;
}

- (void)setSelectionShouldFillWidth:(BOOL)a3
{
  self->_selectionShouldFillWidth = a3;
}

- (BOOL)disableEmphasizedSelection
{
  return self->_disableEmphasizedSelection;
}

- (void)setDisableEmphasizedSelection:(BOOL)a3
{
  self->_disableEmphasizedSelection = a3;
}

- (SearchUICommandEnvironment)commandEnvironment
{
  return (SearchUICommandEnvironment *)objc_getProperty(self, a2, 24, 1);
}

- (SearchUIHeaderDelegate)headerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerDelegate);
  return (SearchUIHeaderDelegate *)WeakRetained;
}

- (void)setHeaderDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_headerDelegate);
  objc_storeStrong((id *)&self->_commandEnvironment, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
}

@end
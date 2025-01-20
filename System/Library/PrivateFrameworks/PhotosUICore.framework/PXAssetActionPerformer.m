@interface PXAssetActionPerformer
- (BOOL)shouldExitSelectModeForState:(unint64_t)a3;
- (PXSectionedSelectionManager)selectionManager;
- (PXSelectionSnapshot)selectionSnapshot;
- (void)setSelectionManager:(id)a3;
- (void)setSelectionSnapshot:(id)a3;
@end

@implementation PXAssetActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
}

- (void)setSelectionManager:(id)a3
{
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (void)setSelectionSnapshot:(id)a3
{
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (BOOL)shouldExitSelectModeForState:(unint64_t)a3
{
  return a3 == 30 && [(PXActionPerformer *)self success];
}

@end
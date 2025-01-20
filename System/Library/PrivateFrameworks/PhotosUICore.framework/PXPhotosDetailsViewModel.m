@interface PXPhotosDetailsViewModel
- (BOOL)isFaceModeEnabled;
- (BOOL)isSelecting;
- (BOOL)supportsFaceMode;
- (BOOL)supportsSelection;
- (NSSet)disabledActionTypes;
- (PXSectionedSelectionManager)selectionManager;
- (void)performChanges:(id)a3;
- (void)setDisabledActionTypes:(id)a3;
- (void)setFaceModeEnabled:(BOOL)a3;
- (void)setSelecting:(BOOL)a3;
- (void)setSelectionManager:(id)a3;
- (void)setSupportsFaceMode:(BOOL)a3;
- (void)setSupportsSelection:(BOOL)a3;
@end

@implementation PXPhotosDetailsViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledActionTypes, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
}

- (NSSet)disabledActionTypes
{
  return self->_disabledActionTypes;
}

- (BOOL)isFaceModeEnabled
{
  return self->_faceModeEnabled;
}

- (BOOL)supportsFaceMode
{
  return self->_supportsFaceMode;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (BOOL)supportsSelection
{
  return self->_supportsSelection;
}

- (BOOL)isSelecting
{
  return self->_selecting;
}

- (void)setDisabledActionTypes:(id)a3
{
  v8 = (NSSet *)a3;
  v5 = self->_disabledActionTypes;
  if (v5 == v8)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [(NSSet *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_disabledActionTypes, a3);
      [(PXPhotosDetailsViewModel *)self signalChange:32];
    }
  }
}

- (void)setFaceModeEnabled:(BOOL)a3
{
  if (self->_faceModeEnabled != a3)
  {
    self->_faceModeEnabled = a3;
    [(PXPhotosDetailsViewModel *)self signalChange:16];
  }
}

- (void)setSupportsFaceMode:(BOOL)a3
{
  if (self->_supportsFaceMode != a3)
  {
    self->_supportsFaceMode = a3;
    [(PXPhotosDetailsViewModel *)self signalChange:8];
  }
}

- (void)setSelectionManager:(id)a3
{
  v5 = (PXSectionedSelectionManager *)a3;
  if (self->_selectionManager != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectionManager, a3);
    [(PXPhotosDetailsViewModel *)self signalChange:4];
    v5 = v6;
  }
}

- (void)setSupportsSelection:(BOOL)a3
{
  if (self->_supportsSelection != a3)
  {
    self->_supportsSelection = a3;
    [(PXPhotosDetailsViewModel *)self signalChange:2];
  }
}

- (void)setSelecting:(BOOL)a3
{
  if (self->_selecting != a3)
  {
    self->_selecting = a3;
    if (!a3) {
      [(PXPhotosDetailsViewModel *)self setFaceModeEnabled:0];
    }
    [(PXPhotosDetailsViewModel *)self signalChange:1];
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsViewModel;
  [(PXPhotosDetailsViewModel *)&v3 performChanges:a3];
}

@end
@interface PXPhotosRootLayout
- (BOOL)_isOverlayVisible;
- (PXPhotosLayout)photosLayout;
- (PXPhotosOverlayController)overlayController;
- (PXPhotosRootLayout)initWithPhotosLayout:(id)a3 overlayController:(id)a4;
- (id)hitTestResultForSpriteIndex:(unsigned int)a3;
- (int64_t)objectReferenceLookup;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (void)setOverlayController:(id)a3;
- (void)setPhotosLayout:(id)a3;
@end

@implementation PXPhotosRootLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_photosLayout, 0);
}

- (void)setOverlayController:(id)a3
{
}

- (PXPhotosOverlayController)overlayController
{
  return self->_overlayController;
}

- (void)setPhotosLayout:(id)a3
{
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v7 = a3;
  *a5 = v7;
  id v8 = v7;
  v9 = [(PXPhotosRootLayout *)self overlayController];
  int v10 = [v9 canHandleObjectReference:v8];

  v11 = [(PXGLayout *)self sublayoutDataStore];
  if (v10) {
    [(PXGSplitLayout *)self firstSublayout];
  }
  else {
  v12 = [(PXGSplitLayout *)self secondSublayout];
  }
  int64_t v13 = [v11 indexOfSublayout:v12];

  return v13;
}

- (BOOL)_isOverlayVisible
{
  v3 = [(PXPhotosRootLayout *)self photosLayout];
  v4 = [v3 viewModel];
  v5 = [v4 viewOptionsModel];

  v6 = [(PXPhotosRootLayout *)self overlayController];
  id v7 = [v6 availableLenses];
  id v8 = [v5 selectedLensControlItem];
  char v9 = [v7 containsObject:v8];

  return v9;
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  int64_t v5 = [(PXGLayout *)self sublayoutIndexForSpriteIndex:"sublayoutIndexForSpriteIndex:"];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = [(PXGLayout *)self sublayoutAtIndex:v5 loadIfNeeded:0];
    id v7 = [(PXPhotosRootLayout *)self photosLayout];
    if (v6 == v7)
    {
      BOOL v8 = [(PXPhotosRootLayout *)self _isOverlayVisible];

      if (v8)
      {
        char v9 = 0;
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosRootLayout;
  char v9 = [(PXGLayout *)&v11 hitTestResultForSpriteIndex:v3];
LABEL_7:
  return v9;
}

- (int64_t)objectReferenceLookup
{
  if ([(PXPhotosRootLayout *)self _isOverlayVisible]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (PXPhotosLayout)photosLayout
{
  v4 = [(PXGSplitLayout *)self secondSublayout];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    char v9 = (objc_class *)objc_opt_class();
    BOOL v8 = NSStringFromClass(v9);
    int v10 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
    [v6 handleFailureInMethod:a2, self, @"PXPhotosLayout.m", 207, @"%@ should be an instance inheriting from %@, but it is %@", @"self.secondSublayout", v8, v10 object file lineNumber description];
  }
  else
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    id v7 = (objc_class *)objc_opt_class();
    BOOL v8 = NSStringFromClass(v7);
    [v6 handleFailureInMethod:a2, self, @"PXPhotosLayout.m", 207, @"%@ should be an instance inheriting from %@, but it is nil", @"self.secondSublayout", v8 object file lineNumber description];
  }

LABEL_3:
  return (PXPhotosLayout *)v4;
}

- (PXPhotosRootLayout)initWithPhotosLayout:(id)a3 overlayController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PXPhotosRootLayout;
  char v9 = [(PXGLayout *)&v15 init];
  int v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photosLayout, a3);
    objc_storeStrong((id *)&v10->_overlayController, a4);
    [(PXGSplitLayout *)v10 setMode:6];
    objc_super v11 = [v8 overlayLayoutProvider];

    if (v11)
    {
      v12 = [v8 overlayLayoutProvider];
      int64_t v13 = v12[2]();
      [(PXGSplitLayout *)v10 setFirstSublayout:v13];
    }
    [(PXGSplitLayout *)v10 setSecondSublayout:v10->_photosLayout];
    [(PXGLayout *)v10 setReferenceDepth:10.0];
    [(PXGSplitLayout *)v10 setAdjustSublayoutZPositions:1];
  }

  return v10;
}

@end
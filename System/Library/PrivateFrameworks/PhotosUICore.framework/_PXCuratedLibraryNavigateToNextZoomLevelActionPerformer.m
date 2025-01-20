@interface _PXCuratedLibraryNavigateToNextZoomLevelActionPerformer
- (PXGLayout)layout;
- (PXGSpriteReference)hitSpriteReference;
- (_PXCuratedLibraryNavigateToNextZoomLevelActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4;
- (_PXCuratedLibraryNavigateToNextZoomLevelActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4 layout:(id)a5 hitSpriteReference:(id)a6;
- (void)performUserInteractionTask;
@end

@implementation _PXCuratedLibraryNavigateToNextZoomLevelActionPerformer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hitSpriteReference, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

- (PXGSpriteReference)hitSpriteReference
{
  return self->_hitSpriteReference;
}

- (PXGLayout)layout
{
  return self->_layout;
}

- (void)performUserInteractionTask
{
  v4 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  uint64_t v5 = objc_msgSend(v4, "zoomLevelInDirection:fromZoomLevel:", 1, -[PXCuratedLibraryActionPerformer actionZoomLevel](self, "actionZoomLevel"));

  if (v5)
  {
    v6 = [(_PXCuratedLibraryNavigateToNextZoomLevelActionPerformer *)self layout];
    v7 = [v6 rootLayout];

    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = [MEMORY[0x1E4F28B00] currentHandler];
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        v13 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
        [v10 handleFailureInMethod:a2, self, @"PXCuratedLibraryActionManager.m", 573, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.layout.rootLayout", v12, v13 object file lineNumber description];
      }
    }
    [v7 clearLastVisibleAreaAnchoringInformation];
    v8 = [(_PXCuratedLibraryNavigateToNextZoomLevelActionPerformer *)self hitSpriteReference];
    [v7 setLastHitSpriteReference:v8];

    v9 = [(PXCuratedLibraryActionPerformer *)self viewModel];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85___PXCuratedLibraryNavigateToNextZoomLevelActionPerformer_performUserInteractionTask__block_invoke;
    v14[3] = &__block_descriptor_40_e43_v16__0___PXMutablePhotosLibraryViewModel__8l;
    v14[4] = v5;
    [v9 performChanges:v14];

    [v7 invalidateLastVisibleAreaAnchoringInformation];
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
  else
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:0];
  }
}

- (_PXCuratedLibraryNavigateToNextZoomLevelActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4 layout:(id)a5 hitSpriteReference:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_PXCuratedLibraryNavigateToNextZoomLevelActionPerformer;
  v13 = [(PXCuratedLibraryActionPerformer *)&v16 initWithActionType:a3 viewModel:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_layout, a5);
    objc_storeStrong((id *)&v14->_hitSpriteReference, a6);
  }

  return v14;
}

- (_PXCuratedLibraryNavigateToNextZoomLevelActionPerformer)initWithActionType:(id)a3 viewModel:(id)a4
{
  return [(_PXCuratedLibraryNavigateToNextZoomLevelActionPerformer *)self initWithActionType:a3 viewModel:a4 layout:0 hitSpriteReference:0];
}

@end
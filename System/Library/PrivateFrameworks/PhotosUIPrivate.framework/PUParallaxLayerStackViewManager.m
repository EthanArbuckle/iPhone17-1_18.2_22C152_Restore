@interface PUParallaxLayerStackViewManager
- (BOOL)_debugColorsEnabled;
- (NSArray)createdLayerViews;
- (NSMutableDictionary)viewsByLayerIdentifier;
- (PUParallaxDebugInfoView)debugInfoView;
- (PUParallaxLayerStackViewManager)init;
- (PUParallaxLayerStackViewManager)initWithViewModel:(id)a3;
- (PUParallaxLayerStackViewModel)viewModel;
- (PUParallaxVideoLayerView)videoLayerView;
- (id)_layerLayoutInfoForViewModel:(id)a3 animateChanges:(BOOL)a4;
- (id)viewForLayer:(id)a3;
- (id)viewForLayerID:(id)a3;
- (void)_layoutLayerView:(id)a3 animated:(BOOL)a4;
- (void)_layoutViewsAnimated:(BOOL)a3;
- (void)_updateViewContents;
- (void)layoutViewsAnimated:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)releaseVideoLayerView;
- (void)setDebugInfoView:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation PUParallaxLayerStackViewManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewsByLayerIdentifier, 0);
  objc_destroyWeak((id *)&self->_viewModel);
  objc_storeStrong((id *)&self->_debugInfoView, 0);
}

- (NSMutableDictionary)viewsByLayerIdentifier
{
  return self->_viewsByLayerIdentifier;
}

- (PUParallaxLayerStackViewModel)viewModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
  return (PUParallaxLayerStackViewModel *)WeakRetained;
}

- (void)setDebugInfoView:(id)a3
{
}

- (BOOL)_debugColorsEnabled
{
  return 0;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v9 = a3;
  if (a5 != "ViewModelObservationContext") {
    goto LABEL_14;
  }
  id v18 = v9;
  id v10 = v9;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v16);
    v17 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v13 handleFailureInMethod:a2, self, @"PUParallaxLayerStackViewManager.m", 239, @"%@ should be an instance inheriting from %@, but it is %@", @"observable", v15, v17 object file lineNumber description];
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v13 handleFailureInMethod:a2, self, @"PUParallaxLayerStackViewManager.m", 239, @"%@ should be an instance inheriting from %@, but it is nil", @"observable", v15 object file lineNumber description];
  }

LABEL_4:
  char v11 = [v10 currentLayerStackPropertiesChange];
  char v12 = [v10 stylePropertiesChange];
  if ((v6 & 4) != 0 && (v11 & 2) != 0) {
    [(PUParallaxLayerStackViewManager *)self _updateViewContents];
  }
  if ((v6 & 2) != 0) {
    [(PUParallaxLayerStackViewManager *)self _updateViewContents];
  }
  if ((*(void *)&v6 & 0x1A6660) != 0) {
    [(PUParallaxLayerStackViewManager *)self _layoutViewsAnimated:0];
  }
  if ((v12 & 6) != 0) {
    [(PUParallaxLayerStackViewManager *)self _layoutViewsAnimated:0];
  }

  id v9 = v18;
LABEL_14:
}

- (id)_layerLayoutInfoForViewModel:(id)a3 animateChanges:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 layoutOrder];
  [v5 visibilityAmount];
  double v8 = v7;
  uint64_t v9 = *MEMORY[0x1E4F1DB28];
  uint64_t v10 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
  uint64_t v11 = *(void *)(MEMORY[0x1E4F1DB28] + 16);
  uint64_t v12 = *(void *)(MEMORY[0x1E4F1DB28] + 24);
  double v68 = v7;
  if ([v5 settlingEffectEnabled] && v8 == 1.0)
  {
    v13 = [v5 currentLayerStack];
    v14 = [v13 settlingEffectLayer];
    [v14 frame];
    uint64_t v9 = v15;
    uint64_t v10 = v16;
    uint64_t v11 = v17;
    uint64_t v12 = v18;
  }
  uint64_t v67 = v9;
  v19 = [v5 currentLayerStack];
  v20 = [v19 layout];

  v21 = +[PUPosterHeadroomSettings sharedInstance];
  [v21 falloffHeight];

  [v20 extendedImageSize];
  [v20 extendedImageSize];
  [v20 imageSize];
  [v20 imageSize];
  PXRectWithOriginAndSize();
  uint64_t v62 = v23;
  uint64_t v63 = v22;
  uint64_t v60 = v25;
  uint64_t v61 = v24;
  v26 = [v5 style];
  if ([v26 hasTonalityMode]) {
    BOOL v27 = [v26 tonality] == 3;
  }
  else {
    BOOL v27 = 0;
  }
  if ([v26 hasHeadroomLook]) {
    BOOL v27 = [v26 headroomLook] == 2;
  }
  uint64_t v65 = v11;
  uint64_t v66 = v10;
  uint64_t v64 = v12;
  if ([v26 hasColorParameter])
  {
    v28 = (void *)MEMORY[0x1E4FB1618];
    v29 = [v26 color];
    v30 = objc_msgSend(v28, "colorWithCGColor:", objc_msgSend(v29, "CGColor"));
  }
  else
  {
    v30 = 0;
  }
  if (v6 == 1) {
    uint64_t v31 = 8;
  }
  else {
    uint64_t v31 = 2;
  }
  v32 = +[PUSuggestionsSettings sharedInstance];
  [v32 parallaxAmount];
  uint64_t v59 = v33;

  v34 = [PUParallaxLayerLayoutInfo alloc];
  uint64_t v35 = [v5 deviceOrientation];
  [v5 containerFrame];
  double v37 = v36;
  double v39 = v38;
  double v58 = v40;
  double v42 = v41;
  [v5 visibleFrame];
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  [v5 headroomVisibilityAmount];
  uint64_t v52 = v51;
  uint64_t v53 = [v5 canApplyParallax];
  [v5 parallaxVector];
  v56 = -[PUParallaxLayerLayoutInfo initWithDeviceOrientation:containerFrame:visibleFrame:settlingEffectFrame:headroomFrame:headroomVisibilityAmount:styleIsHighKey:primaryStyleColor:canApplyParallax:parallaxVector:parallaxAmount:visibilityAmount:visibilityEdge:animateChanges:](v34, "initWithDeviceOrientation:containerFrame:visibleFrame:settlingEffectFrame:headroomFrame:headroomVisibilityAmount:styleIsHighKey:primaryStyleColor:canApplyParallax:parallaxVector:parallaxAmount:visibilityAmount:visibilityEdge:animateChanges:", v35, v27, v30, v53, v31, v4, v37, v39, v58, v42, v44, v46, v48, v50, v67,
          v66,
          v65,
          v64,
          v63,
          v62,
          v61,
          v60,
          v52,
          v54,
          v55,
          v59,
          *(void *)&v68);

  return v56;
}

- (void)_layoutLayerView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(PUParallaxLayerStackViewManager *)self viewModel];
  id v8 = [(PUParallaxLayerStackViewManager *)self _layerLayoutInfoForViewModel:v7 animateChanges:v4];

  [v6 layoutWithInfo:v8];
}

- (void)_layoutViewsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(PUParallaxLayerStackViewManager *)self viewsByLayerIdentifier];
  id v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        [(PUParallaxLayerStackViewManager *)self _layoutLayerView:*(void *)(*((void *)&v14 + 1) + 8 * v10++) animated:v3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [(PUParallaxLayerStackViewManager *)self viewsByLayerIdentifier];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    v13 = [(PUParallaxLayerStackViewManager *)self debugInfoView];
    [(PUParallaxLayerStackViewManager *)self _layoutLayerView:v13 animated:v3];
  }
}

- (void)_updateViewContents
{
  BOOL v3 = [(PUParallaxLayerStackViewManager *)self viewModel];
  BOOL v4 = [v3 currentLayerStack];

  id v5 = [(PUParallaxLayerStackViewManager *)self viewsByLayerIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__PUParallaxLayerStackViewManager__updateViewContents__block_invoke;
  v7[3] = &unk_1E5F2D128;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __54__PUParallaxLayerStackViewManager__updateViewContents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) layerWithIdentifier:v15];
  int v7 = PFParallaxLayerIDIsSettlingVideo();
  id v8 = v5;
  if (v7)
  {
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    id v10 = v6;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    [v9 setParallaxVideoLayer:v11];
  }
  else
  {
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    id v12 = v6;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    [v9 setParallaxImageLayer:v13];
    if (PFParallaxLayerIDIsForeground())
    {
      uint64_t v14 = [*(id *)(a1 + 32) foregroundBackfillLayer];
    }
    else
    {
      if (!PFParallaxLayerIDIsBackground()) {
        goto LABEL_25;
      }
      uint64_t v14 = [*(id *)(a1 + 32) backgroundBackfillLayer];
    }
    id v11 = (id)v14;
    [v9 setBackfillParallaxImageLayer:v14];
  }

LABEL_25:
}

- (void)layoutViewsAnimated:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__PUParallaxLayerStackViewManager_layoutViewsAnimated___block_invoke;
  v3[3] = &unk_1E5F2ED10;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:a3 completion:0.3];
}

uint64_t __55__PUParallaxLayerStackViewManager_layoutViewsAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutViewsAnimated:1];
}

- (NSArray)createdLayerViews
{
  BOOL v3 = [(PUParallaxLayerStackViewManager *)self viewsByLayerIdentifier];
  BOOL v4 = [v3 allValues];
  id v5 = [(PUParallaxLayerStackViewManager *)self debugInfoView];
  id v6 = [v4 arrayByAddingObject:v5];

  return (NSArray *)v6;
}

- (PUParallaxDebugInfoView)debugInfoView
{
  debugInfoView = self->_debugInfoView;
  if (!debugInfoView)
  {
    BOOL v4 = [PUParallaxDebugInfoView alloc];
    id v5 = [(PUParallaxLayerStackViewManager *)self viewModel];
    id v6 = [(PUParallaxDebugInfoView *)v4 initWithViewModel:v5];
    int v7 = self->_debugInfoView;
    self->_debugInfoView = v6;

    debugInfoView = self->_debugInfoView;
  }
  [(PUParallaxLayerStackViewManager *)self _layoutLayerView:debugInfoView animated:0];
  id v8 = self->_debugInfoView;
  return v8;
}

- (void)releaseVideoLayerView
{
  BOOL v3 = [(PUParallaxLayerStackViewManager *)self viewModel];
  BOOL v4 = [v3 viewManager];
  id v8 = [v4 videoLayerView];

  if (v8)
  {
    [v8 removeFromSuperview];
    id v5 = [(PUParallaxLayerStackViewManager *)self viewsByLayerIdentifier];
    id v6 = [v8 parallaxVideoLayer];
    int v7 = [v6 identifier];
    [v5 removeObjectForKey:v7];
  }
}

- (PUParallaxVideoLayerView)videoLayerView
{
  BOOL v3 = [(PUParallaxLayerStackViewManager *)self viewModel];
  BOOL v4 = [v3 currentLayerStack];

  id v5 = [v4 settlingEffectLayer];
  id v6 = [(PUParallaxLayerStackViewManager *)self viewForLayer:v5];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return (PUParallaxVideoLayerView *)v7;
}

- (id)viewForLayerID:(id)a3
{
  id v4 = a3;
  id v5 = [(PUParallaxLayerStackViewManager *)self viewsByLayerIdentifier];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    id v7 = [(PUParallaxLayerStackViewManager *)self viewModel];
    uint64_t v8 = [v7 environment];

    int v9 = PFParallaxLayerIDIsSettlingVideo();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_viewModel);
    id v11 = [WeakRetained currentLayerStack];
    id v12 = [v11 layerWithIdentifier:v4];

    id v13 = v12;
    if (v9)
    {
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      {
        id v14 = v13;

        if (v14)
        {
          id v15 = [(PUParallaxLayerStackViewManager *)self viewModel];
          if (![v15 settlingEffectEnabled]
            || !PFPosterEnableSettlingEffect())
          {
            id v6 = 0;
            goto LABEL_26;
          }
          long long v16 = [(PUParallaxLayerStackViewManager *)self viewModel];
          int v17 = [v16 canCreateSettlingEffectLayerView];

          if (v17)
          {
            id v6 = [[PUParallaxVideoLayerView alloc] initWithParallaxVideoLayer:v14];
            if ([(PUParallaxLayerStackViewManager *)self _debugColorsEnabled])
            {
              uint64_t v18 = [(PUParallaxVideoLayerView *)v6 layer];
              [v18 setBorderWidth:12.0];

              id v15 = [MEMORY[0x1E4FB1618] yellowColor];
              uint64_t v19 = [v15 CGColor];
              v20 = [(PUParallaxVideoLayerView *)v6 layer];
              [v20 setBorderColor:v19];

LABEL_26:
            }
LABEL_27:

            if (!v6)
            {
LABEL_30:

              goto LABEL_31;
            }
            [(PUParallaxLayerStackViewManager *)self _layoutLayerView:v6 animated:0];
            id v14 = [(PUParallaxLayerStackViewManager *)self viewsByLayerIdentifier];
            [v14 setObject:v6 forKeyedSubscript:v4];
LABEL_29:

            goto LABEL_30;
          }
        }
      }
      else
      {

        id v14 = 0;
      }
      id v6 = 0;
      goto LABEL_29;
    }
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    id v6 = [[PUParallaxImageLayerView alloc] initWithParallaxImageLayer:v14 isEditing:v8 == 2];
    if (PFParallaxLayerIDIsForeground())
    {
      if ([(PUParallaxLayerStackViewManager *)self _debugColorsEnabled])
      {
        v21 = [(PUParallaxVideoLayerView *)v6 layer];
        [v21 setBorderWidth:4.0];

        id v22 = [MEMORY[0x1E4FB1618] blueColor];
        uint64_t v23 = [v22 CGColor];
        uint64_t v24 = [(PUParallaxVideoLayerView *)v6 layer];
        [v24 setBorderColor:v23];
      }
      id v25 = objc_loadWeakRetained((id *)&self->_viewModel);
      v26 = [v25 currentLayerStack];
      BOOL v27 = [v26 foregroundBackfillLayer];
      [(PUParallaxVideoLayerView *)v6 setBackfillParallaxImageLayer:v27];

      [(PUParallaxVideoLayerView *)v6 setBackfillMaskingEnabled:1];
      goto LABEL_27;
    }
    if (PFParallaxLayerIDIsBackground())
    {
      if ([(PUParallaxLayerStackViewManager *)self _debugColorsEnabled])
      {
        v28 = [(PUParallaxVideoLayerView *)v6 layer];
        [v28 setBorderWidth:8.0];

        id v29 = [MEMORY[0x1E4FB1618] redColor];
        uint64_t v30 = [v29 CGColor];
        uint64_t v31 = [(PUParallaxVideoLayerView *)v6 layer];
        [v31 setBorderColor:v30];
      }
      id v15 = objc_loadWeakRetained((id *)&self->_viewModel);
      v32 = [v15 currentLayerStack];
      uint64_t v33 = [v32 backgroundBackfillLayer];
      [(PUParallaxVideoLayerView *)v6 setBackfillParallaxImageLayer:v33];

      goto LABEL_26;
    }
    goto LABEL_27;
  }
LABEL_31:

  return v6;
}

- (id)viewForLayer:(id)a3
{
  if (a3)
  {
    id v4 = [a3 identifier];
    id v5 = [(PUParallaxLayerStackViewManager *)self viewForLayerID:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (PUParallaxLayerStackViewManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUParallaxLayerStackViewManager.m", 55, @"%s is not available as initializer", "-[PUParallaxLayerStackViewManager init]");

  abort();
}

- (PUParallaxLayerStackViewManager)initWithViewModel:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUParallaxLayerStackViewManager;
  id v5 = [(PUParallaxLayerStackViewManager *)&v10 init];
  if (v5)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    viewsByLayerIdentifier = v5->_viewsByLayerIdentifier;
    v5->_viewsByLayerIdentifier = v6;

    objc_storeWeak((id *)&v5->_viewModel, v4);
    [v4 registerChangeObserver:v5 context:"ViewModelObservationContext"];
    [(PUParallaxLayerStackViewManager *)v5 _layoutViewsAnimated:0];
    uint64_t v8 = +[PUPosterHeadroomSettings sharedInstance];
    [v8 addKeyObserver:v5];
  }
  return v5;
}

@end
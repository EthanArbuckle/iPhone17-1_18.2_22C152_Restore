@interface NTKGreenfieldHighlightableFaceContainerView
+ (id)_createFaceForDisplayingFrom:(id)a3;
- (NTKGreenfieldHighlightableFaceContainerView)initWithFace:(id)a3;
- (void)_toggleHighlight:(BOOL)a3 forComplicationWrapperViewAtSlot:(id)a4;
- (void)_updateTemplateForSlot:(id)a3;
- (void)layoutSubviews;
- (void)setComplicationDisplayViewState:(int64_t)a3 forSlot:(id)a4;
- (void)setTemplate:(id)a3 forSlot:(id)a4;
@end

@implementation NTKGreenfieldHighlightableFaceContainerView

- (NTKGreenfieldHighlightableFaceContainerView)initWithFace:(id)a3
{
  id v5 = a3;
  v6 = +[NTKGreenfieldHighlightableFaceContainerView _createFaceForDisplayingFrom:v5];
  v7 = [NTKFaceViewController alloc];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __60__NTKGreenfieldHighlightableFaceContainerView_initWithFace___block_invoke;
  v29[3] = &unk_1E62C1FE0;
  id v8 = v5;
  id v30 = v8;
  v9 = [(NTKFaceViewController *)v7 initWithFace:v6 configuration:v29];
  v10 = [(NTKFaceViewController *)v9 faceView];
  [v10 bounds];
  v28.receiver = self;
  v28.super_class = (Class)NTKGreenfieldHighlightableFaceContainerView;
  v11 = -[NTKGreenfieldHighlightableFaceContainerView initWithFrame:](&v28, sel_initWithFrame_);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_originalFace, a3);
    objc_storeStrong((id *)&v12->_faceViewController, v9);
    [(NTKGreenfieldHighlightableFaceContainerView *)v12 addSubview:v10];
    id v13 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [v10 bounds];
    uint64_t v14 = objc_msgSend(v13, "initWithFrame:");
    overlayView = v12->_overlayView;
    v12->_overlayView = (UIView *)v14;

    v16 = v12->_overlayView;
    v17 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v16 setBackgroundColor:v17];

    [(UIView *)v12->_overlayView setAlpha:0.8];
    [(UIView *)v12->_overlayView setHidden:1];
    [(NTKGreenfieldHighlightableFaceContainerView *)v12 addSubview:v12->_overlayView];
    id v18 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [v10 bounds];
    uint64_t v19 = objc_msgSend(v18, "initWithFrame:");
    highlightedDisplaysContainerView = v12->_highlightedDisplaysContainerView;
    v12->_highlightedDisplaysContainerView = (UIView *)v19;

    [(NTKGreenfieldHighlightableFaceContainerView *)v12 addSubview:v12->_highlightedDisplaysContainerView];
    uint64_t v21 = [MEMORY[0x1E4F1CA80] set];
    highlightedSlots = v12->_highlightedSlots;
    v12->_highlightedSlots = (NSMutableSet *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
    highlightedSlotToDisplayWrapperViewMapping = v12->_highlightedSlotToDisplayWrapperViewMapping;
    v12->_highlightedSlotToDisplayWrapperViewMapping = (NSMutableDictionary *)v23;

    uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
    slotToTemplateMapping = v12->_slotToTemplateMapping;
    v12->_slotToTemplateMapping = (NSMutableDictionary *)v25;

    [(NTKGreenfieldHighlightableFaceContainerView *)v12 setUserInteractionEnabled:0];
  }

  return v12;
}

void __60__NTKGreenfieldHighlightableFaceContainerView_initWithFace___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 setDataMode:3];
  [v8 setShouldShowSnapshot:0];
  [v8 setShowsCanonicalContent:1];
  [v8 setShouldUseSampleTemplate:1];
  v3 = [*(id *)(a1 + 32) device];
  if ([v3 deviceCategory] != 1)
  {
    [v3 screenCornerRadius];
    double v5 = v4;
    v6 = [v8 faceView];
    [v6 _setContinuousCornerRadius:v5];

    v7 = [v8 faceView];
    [v7 setClipsToBounds:1];
  }
}

- (void)setTemplate:(id)a3 forSlot:(id)a4
{
  slotToTemplateMapping = self->_slotToTemplateMapping;
  id v7 = a4;
  [(NSMutableDictionary *)slotToTemplateMapping setObject:a3 forKeyedSubscript:v7];
  [(NTKGreenfieldHighlightableFaceContainerView *)self _updateTemplateForSlot:v7];
}

- (void)setComplicationDisplayViewState:(int64_t)a3 forSlot:(id)a4
{
  id v19 = a4;
  v6 = [(NTKFaceViewController *)self->_faceViewController face];
  id v7 = [(NTKFace *)self->_originalFace complicationForSlot:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    v9 = [v8 complication];
    if ([v9 complicationType] == 31 || objc_msgSend(v9, "complicationType") == 56)
    {
      uint64_t v10 = [v8 complication];
      id v11 = +[NTKGreenfieldPlaceholderComplication placeholderWithComplication:v10];

      id v8 = (id)v10;
    }
    else
    {
      id v11 = v9;
    }

    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v6 preferredComplicationFamilyForComplication:v7 withSlot:v19];
    id v13 = +[NTKBundleComplicationManager sharedManager];
    uint64_t v14 = [v6 device];
    uint64_t v15 = [v13 dataSourceClassForBundleComplication:v7 withFamily:v12 andDevice:v14 factorInMigration:1];

    if (!v15)
    {
      id v11 = +[NTKGreenfieldPlaceholderComplication placeholderWithComplication:v7];
LABEL_10:

      id v7 = v11;
    }
  }
  if (a3 == 2)
  {
    [(NSMutableSet *)self->_highlightedSlots addObject:v19];
    [v6 setComplication:v7 forSlot:v19];
    [(NTKGreenfieldHighlightableFaceContainerView *)self _updateTemplateForSlot:v19];
    v16 = self;
    uint64_t v17 = 1;
LABEL_16:
    [(NTKGreenfieldHighlightableFaceContainerView *)v16 _toggleHighlight:v17 forComplicationWrapperViewAtSlot:v19];
    goto LABEL_18;
  }
  if (a3 != 1)
  {
    if (a3) {
      goto LABEL_18;
    }
    [(NSMutableSet *)self->_highlightedSlots removeObject:v19];
    [v6 setComplication:v7 forSlot:v19];
    [(NTKGreenfieldHighlightableFaceContainerView *)self _updateTemplateForSlot:v19];
    v16 = self;
    uint64_t v17 = 0;
    goto LABEL_16;
  }
  [(NTKGreenfieldHighlightableFaceContainerView *)self _toggleHighlight:0 forComplicationWrapperViewAtSlot:v19];
  id v18 = +[NTKComplication nullComplication];
  [v6 setComplication:v18 forSlot:v19];

LABEL_18:
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)NTKGreenfieldHighlightableFaceContainerView;
  [(NTKGreenfieldHighlightableFaceContainerView *)&v8 layoutSubviews];
  v3 = [(NTKFaceViewController *)self->_faceViewController faceView];
  [v3 layoutComplicationViews];
  highlightedSlotToDisplayWrapperViewMapping = self->_highlightedSlotToDisplayWrapperViewMapping;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__NTKGreenfieldHighlightableFaceContainerView_layoutSubviews__block_invoke;
  v6[3] = &unk_1E62C9118;
  id v7 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)highlightedSlotToDisplayWrapperViewMapping enumerateKeysAndObjectsUsingBlock:v6];
}

void __61__NTKGreenfieldHighlightableFaceContainerView_layoutSubviews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = [v5 normalComplicationDisplayWrapperForSlot:a2];
  id v7 = *(void **)(a1 + 32);
  [v8 bounds];
  objc_msgSend(v7, "convertRect:fromView:", v8);
  objc_msgSend(v6, "setFrame:");
}

- (void)_updateTemplateForSlot:(id)a3
{
  id v8 = a3;
  double v4 = [(NTKFaceViewController *)self->_faceViewController face];
  id v5 = [(NTKFaceViewController *)self->_faceViewController faceView];
  id v6 = [v5 normalComplicationDisplayWrapperForSlot:v8];
  if (v6)
  {
    id v7 = [(NSMutableDictionary *)self->_slotToTemplateMapping objectForKeyedSubscript:v8];
    if (v7) {
      [v6 setComplicationTemplate:v7 reason:0 animation:0];
    }
  }
}

- (void)_toggleHighlight:(BOOL)a3 forComplicationWrapperViewAtSlot:(id)a4
{
  BOOL v4 = a3;
  id v19 = a4;
  id v6 = [(NTKFaceViewController *)self->_faceViewController faceView];
  [v6 setNeedsLayout];
  [v6 layoutIfNeeded];
  id v7 = [(NTKFaceViewController *)self->_faceViewController face];
  id v8 = [v6 normalComplicationDisplayWrapperForSlot:v19];
  v9 = v8;
  if (v8)
  {
    [v8 setHidden:0];
    if (v4)
    {
      uint64_t v10 = [v7 complicationForSlot:v19];
      id v11 = +[NTKFaceViewController _controllerForComplication:v10 face:v7 slot:v19];
      uint64_t v12 = +[NTKFaceViewController _createNormalDisplayForComplicationController:v11 slot:v19 face:v7 faceView:v6];
      [v6 configureComplicationViewDisplayWrapper:v12 forSlot:v19];
      id v13 = [(NSMutableDictionary *)self->_slotToTemplateMapping objectForKeyedSubscript:v19];
      [v12 setComplicationTemplate:v13 reason:0 animation:0];

      uint64_t v14 = [v12 display];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v16 = [v12 display];
        uint64_t v17 = [MEMORY[0x1E4FB1618] whiteColor];
        [v16 setBezelTextColor:v17];
      }
      [(NSMutableDictionary *)self->_highlightedSlotToDisplayWrapperViewMapping setObject:v12 forKeyedSubscript:v19];
      [(UIView *)self->_highlightedDisplaysContainerView addSubview:v12];
      [(NTKGreenfieldHighlightableFaceContainerView *)self setNeedsLayout];
    }
    else
    {
      uint64_t v10 = [(NSMutableDictionary *)self->_highlightedSlotToDisplayWrapperViewMapping objectForKeyedSubscript:v19];
      [v10 removeFromSuperview];
      [(NSMutableDictionary *)self->_highlightedSlotToDisplayWrapperViewMapping setObject:0 forKeyedSubscript:v19];
    }

    BOOL v18 = [(NSMutableDictionary *)self->_highlightedSlotToDisplayWrapperViewMapping count] == 0;
    [(UIView *)self->_overlayView setHidden:v18];
    [(UIView *)self->_highlightedDisplaysContainerView setHidden:v18];
  }
}

+ (id)_createFaceForDisplayingFrom:(id)a3
{
  v3 = [a3 deepCopy];
  [v3 toggleComplicationChangeObservation:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__NTKGreenfieldHighlightableFaceContainerView__createFaceForDisplayingFrom___block_invoke;
  v6[3] = &unk_1E62C3800;
  id v4 = v3;
  id v7 = v4;
  [v4 enumerateComplicationSlotsWithBlock:v6];

  return v4;
}

void __76__NTKGreenfieldHighlightableFaceContainerView__createFaceForDisplayingFrom___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 complication];

    if (v5)
    {
      id v6 = [v4 complication];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v8 = [v4 complication];
        v9 = +[NTKGreenfieldPlaceholderComplication placeholderWithComplication:v8];

        uint64_t v10 = *(void **)(a1 + 32);
      }
      else
      {
        id v11 = *(void **)(a1 + 32);
        v9 = [v4 complication];
        uint64_t v10 = v11;
      }
      [v10 setComplication:v9 forSlot:v12];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotToTemplateMapping, 0);
  objc_storeStrong((id *)&self->_highlightedSlots, 0);
  objc_storeStrong((id *)&self->_highlightedSlotToDisplayWrapperViewMapping, 0);
  objc_storeStrong((id *)&self->_highlightedDisplaysContainerView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_faceViewController, 0);
  objc_storeStrong((id *)&self->_originalFace, 0);
}

@end
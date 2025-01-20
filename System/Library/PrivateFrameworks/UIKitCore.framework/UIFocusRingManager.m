@interface UIFocusRingManager
+ (BOOL)focusRingAvailable;
+ (Class)shapeLayerClassForItem:(id)a3 client:(id)a4;
+ (id)_currentFocusItemForClient:(id)a3;
+ (id)manager;
+ (void)_removeActiveFocusLayers;
+ (void)_updateActiveFocusLayers;
+ (void)moveRingToFocusItem:(id)a3;
+ (void)moveRingToFocusItem:(id)a3 forClient:(id)a4;
+ (void)removeRingFromFocusItem:(id)a3;
+ (void)removeRingFromFocusItem:(id)a3 forClient:(id)a4;
+ (void)updateRingForFocusItem:(id)a3;
+ (void)updateRingForFocusItem:(id)a3 forClient:(id)a4;
- (BOOL)_focusItemWantsFocusRing:(id)a3 forClient:(id)a4;
- (NSMutableDictionary)focusRingStateForClient;
- (id)_focusRingPathForItem:(id)a3 inView:(id)a4;
- (id)_viewToAddFocusLayerForItem:(id)a3 forClient:(id)a4;
- (id)activeFocusLayersForClient:(id)a3;
- (id)activeFocusLayersToItemsForClient:(id)a3;
- (id)description;
- (int64_t)_insertionIndexOfFocusLayerForFocusItem:(id)a3;
- (void)_addFocusLayer:(id)a3 toView:(id)a4 forItem:(id)a5;
- (void)_removeActiveFocusLayersForClient:(id)a3;
- (void)_updateFocusLayerFrames;
- (void)addFocusRingForItem:(id)a3 forClient:(id)a4;
- (void)addParentFocusRingForItem:(id)a3 forClient:(id)a4;
- (void)addSelectedFocusRingForItem:(id)a3 forClient:(id)a4;
- (void)addSelectedParentFocusRingForItem:(id)a3 forClient:(id)a4;
- (void)setFocusRingStateForClient:(id)a3;
@end

@implementation UIFocusRingManager

+ (void)updateRingForFocusItem:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  v7 = [a1 _currentFocusItemForClient:a4];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    id v9 = [a1 manager];
    [v9 _updateFocusLayerFrames];
  }
}

+ (void)updateRingForFocusItem:(id)a3
{
}

- (void)_removeActiveFocusLayersForClient:(id)a3
{
  id v3 = [(UIFocusRingManager *)self activeFocusLayersForClient:a3];
  if ([v3 count])
  {
    [v3 makeObjectsPerformSelector:sel_removeFromSuperlayer];
    [v3 removeAllObjects];
  }
}

+ (void)removeRingFromFocusItem:(id)a3 forClient:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [a1 manager];
  uint64_t v9 = [v8 focusRingStateForClient];
  if (!v9) {
    goto LABEL_3;
  }
  v10 = (void *)v9;
  v11 = [v8 focusRingStateForClient];
  v12 = [v11 objectForKey:v7];
  id v13 = [v12 currentFocusItem];

  if (v13 == v6)
  {
    [v8 _removeActiveFocusLayersForClient:v7];
  }
  else
  {
LABEL_3:
    v14 = [v8 activeFocusLayersForClient:v7];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      v16 = [v8 activeFocusLayersForClient:v7];
      v17 = (void *)[v16 copy];

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v28;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v28 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v27 + 1) + 8 * v22);
            v24 = objc_msgSend(v8, "activeFocusLayersToItemsForClient:", v7, (void)v27);
            v25 = [v24 objectForKey:v23];

            if (!v25)
            {
              [v23 removeFromSuperlayer];
              v26 = [v8 activeFocusLayersForClient:v7];
              [v26 removeObject:v23];
            }
            ++v22;
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v20);
      }
    }
  }
}

+ (id)_currentFocusItemForClient:(id)a3
{
  id v4 = a3;
  v5 = [a1 manager];
  id v6 = [v5 focusRingStateForClient];
  id v7 = [v6 objectForKey:v4];

  int v8 = [v7 currentFocusItem];

  return v8;
}

+ (id)manager
{
  if (_MergedGlobals_1175 != -1) {
    dispatch_once(&_MergedGlobals_1175, &__block_literal_global_410);
  }
  v2 = (void *)qword_1EB2620F0;
  return v2;
}

- (NSMutableDictionary)focusRingStateForClient
{
  return self->_focusRingStateForClient;
}

- (id)activeFocusLayersForClient:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_focusRingStateForClient objectForKeyedSubscript:v4];
  id v6 = [v5 activeFocusLayers];

  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
    int v8 = [(NSMutableDictionary *)self->_focusRingStateForClient objectForKeyedSubscript:v4];
    [v8 setActiveFocusLayers:v7];
  }
  uint64_t v9 = [(NSMutableDictionary *)self->_focusRingStateForClient objectForKeyedSubscript:v4];
  v10 = [v9 activeFocusLayers];

  return v10;
}

+ (void)removeRingFromFocusItem:(id)a3
{
}

void __29__UIFocusRingManager_manager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_1EB2620F0;
  qword_1EB2620F0 = v0;
}

+ (BOOL)focusRingAvailable
{
  v2 = _UIFocusBehaviorForScene(0);
  BOOL v3 = [v2 focusRingVisibility] != 0;

  return v3;
}

+ (Class)shapeLayerClassForItem:(id)a3 client:(id)a4
{
  return (Class)objc_opt_class();
}

- (id)activeFocusLayersToItemsForClient:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_focusRingStateForClient objectForKeyedSubscript:v4];
  id v6 = [v5 activeFocusLayersToItems];

  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    int v8 = [(NSMutableDictionary *)self->_focusRingStateForClient objectForKeyedSubscript:v4];
    [v8 setActiveFocusLayersToItems:v7];
  }
  uint64_t v9 = [(NSMutableDictionary *)self->_focusRingStateForClient objectForKeyedSubscript:v4];
  v10 = [v9 activeFocusLayersToItems];

  return v10;
}

+ (void)moveRingToFocusItem:(id)a3
{
}

+ (void)moveRingToFocusItem:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [a1 manager];
  uint64_t v9 = [v8 focusRingStateForClient];

  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA60] dictionary];
    [v8 setFocusRingStateForClient:v10];
  }
  v11 = [v8 focusRingStateForClient];
  v12 = [v11 objectForKeyedSubscript:v7];

  if (!v12)
  {
    id v13 = [v8 focusRingStateForClient];
    v14 = [[UIFocusRingClientState alloc] initWithClientID:v7];
    [v13 setObject:v14 forKey:v7];
  }
  uint64_t v15 = [v8 focusRingStateForClient];
  v16 = [v15 objectForKey:v7];
  [v16 setCurrentFocusItem:v6];

  [v8 _removeActiveFocusLayersForClient:v7];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v17 = _UIFocusBehaviorForEnvironment((uint64_t)v6);
  LODWORD(v16) = [v17 supportsParentFocusRings];

  if (v16)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__UIFocusRingManager_moveRingToFocusItem_forClient___block_invoke;
    v18[3] = &unk_1E52FF5B8;
    uint64_t v21 = &v22;
    id v19 = v8;
    id v20 = v7;
    _UIFocusEnvironmentEnumerateAncestorEnvironments(v6, v18);
  }
  if (*((unsigned char *)v23 + 24)) {
    [v8 addSelectedFocusRingForItem:v6 forClient:v7];
  }
  else {
    [v8 addFocusRingForItem:v6 forClient:v7];
  }
  [v8 _updateFocusLayerFrames];
  _Block_object_dispose(&v22, 8);
}

void __52__UIFocusRingManager_moveRingToFocusItem_forClient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v3 _drawsFocusRingWhenChildrenFocused])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(a1 + 32) addSelectedParentFocusRingForItem:v3 forClient:*(void *)(a1 + 40)];
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0 && [v3 canBecomeFocused])
  {
    [*(id *)(a1 + 32) addParentFocusRingForItem:v3 forClient:*(void *)(a1 + 40)];
  }
}

- (void)addFocusRingForItem:(id)a3 forClient:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(UIFocusRingManager *)self _viewToAddFocusLayerForItem:v13 forClient:v6];
  if (v7)
  {
    int v8 = (void *)[(id)objc_opt_class() shapeLayerClassForItem:v13 client:v6];
    uint64_t v9 = [v7 traitCollection];
    v10 = objc_msgSend(v8, "focusLayerForUserInterfaceStyle:", objc_msgSend(v9, "userInterfaceStyle"));

    [(UIFocusRingManager *)self _addFocusLayer:v10 toView:v7 forItem:v13];
    v11 = [(UIFocusRingManager *)self activeFocusLayersToItemsForClient:v6];
    [v11 setObject:v13 forKey:v10];

    v12 = [(UIFocusRingManager *)self activeFocusLayersForClient:v6];
    [v12 addObject:v10];
  }
}

- (void)addParentFocusRingForItem:(id)a3 forClient:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(UIFocusRingManager *)self _viewToAddFocusLayerForItem:v13 forClient:v6];
  if (v7)
  {
    int v8 = (void *)[(id)objc_opt_class() shapeLayerClassForItem:v13 client:v6];
    uint64_t v9 = [v7 traitCollection];
    v10 = objc_msgSend(v8, "parentLayerForUserInterfaceStyle:", objc_msgSend(v9, "userInterfaceStyle"));

    [(UIFocusRingManager *)self _addFocusLayer:v10 toView:v7 forItem:v13];
    v11 = [(UIFocusRingManager *)self activeFocusLayersToItemsForClient:v6];
    [v11 setObject:v13 forKey:v10];

    v12 = [(UIFocusRingManager *)self activeFocusLayersForClient:v6];
    [v12 addObject:v10];
  }
}

- (void)addSelectedFocusRingForItem:(id)a3 forClient:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(UIFocusRingManager *)self _viewToAddFocusLayerForItem:v14 forClient:v6];
  if (v7)
  {
    int v8 = (void *)[(id)objc_opt_class() shapeLayerClassForItem:v14 client:v6];
    uint64_t v9 = [v7 traitCollection];
    v10 = objc_msgSend(v8, "selectedLayerForUserInterfaceStyle:", objc_msgSend(v9, "userInterfaceStyle"));

    v11 = [v7 layer];
    [v11 addSublayer:v10];

    v12 = [(UIFocusRingManager *)self activeFocusLayersToItemsForClient:v6];
    [v12 setObject:v14 forKey:v10];

    id v13 = [(UIFocusRingManager *)self activeFocusLayersForClient:v6];
    [v13 addObject:v10];
  }
}

- (void)addSelectedParentFocusRingForItem:(id)a3 forClient:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(UIFocusRingManager *)self _viewToAddFocusLayerForItem:v13 forClient:v6];
  if (v7)
  {
    int v8 = (void *)[(id)objc_opt_class() shapeLayerClassForItem:v13 client:v6];
    uint64_t v9 = [v7 traitCollection];
    v10 = objc_msgSend(v8, "selectedParentLayerForUserInterfaceStyle:", objc_msgSend(v9, "userInterfaceStyle"));

    [(UIFocusRingManager *)self _addFocusLayer:v10 toView:v7 forItem:v13];
    v11 = [(UIFocusRingManager *)self activeFocusLayersToItemsForClient:v6];
    [v11 setObject:v13 forKey:v10];

    v12 = [(UIFocusRingManager *)self activeFocusLayersForClient:v6];
    [v12 addObject:v10];
  }
}

- (void)_addFocusLayer:(id)a3 toView:(id)a4 forItem:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  if (objc_opt_respondsToSelector())
  {
    v10 = [v8 tintColor];
    [v17 _updateWithTintColor:v10];
  }
  int64_t v11 = [(UIFocusRingManager *)self _insertionIndexOfFocusLayerForFocusItem:v9];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_5;
  }
  unint64_t v12 = v11;
  id v13 = [v8 layer];
  id v14 = [v13 sublayers];
  unint64_t v15 = [v14 count];

  if (v15 < v12)
  {
LABEL_5:
    v16 = [v8 layer];
    [v16 addSublayer:v17];
  }
  else
  {
    v16 = [v8 layer];
    [v16 insertSublayer:v17 atIndex:v12];
  }
}

- (BOOL)_focusItemWantsFocusRing:(id)a3 forClient:(id)a4
{
  id v4 = a3;
  v5 = _UIFocusBehaviorForEnvironment((uint64_t)v4);
  uint64_t v6 = [v5 focusRingVisibility];

  if ((unint64_t)(v6 - 2) >= 2)
  {
    BOOL v8 = v6 == 1;
  }
  else
  {
    id v7 = _UIFocusItemHaloEffect(v4);
    BOOL v8 = v7 != 0;
  }
  return v8;
}

- (id)_viewToAddFocusLayerForItem:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && [(UIFocusRingManager *)self _focusItemWantsFocusRing:v6 forClient:v7])
  {
    if (objc_opt_respondsToSelector())
    {
      BOOL v8 = [v6 _viewToAddFocusLayer];
    }
    else
    {
      v10 = _UIFocusEnvironmentContainingView(v6);
      -[UIView _addGeometryChangeObserver:](v10, self);
      BOOL v8 = [v10 superview];
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (int64_t)_insertionIndexOfFocusLayerForFocusItem:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    int64_t v4 = [v3 _insertionIndexOfFocusLayerInView];
  }
  else {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (id)_focusRingPathForItem:(id)a3 inView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _UIFocusItemHaloEffect(v5);
  BOOL v8 = v7;
  if (v7)
  {
    id v9 = [v7 _shape];
    v10 = _UIFocusEnvironmentContainingView(v5);
    int64_t v11 = [v10 coordinateSpace];

    unint64_t v12 = [v9 shapeConvertedFromCoordinateSpace:v11 toCoordinateSpace:v6];

    id v13 = [v12 outline];

    goto LABEL_14;
  }
  id v14 = [v6 coordinateSpace];
  double v15 = _UIFocusItemFrameInCoordinateSpace(v5, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  +[UIFocusRingStyle cornerRadius];
  double v23 = v22;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = v5;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unint64_t v12 = 0;
LABEL_12:
      uint64_t v29 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v15, v17, v19, v21, v23);
      goto LABEL_13;
    }
    id v24 = [v5 layer];
  }
  unint64_t v12 = v24;
  if (!v24) {
    goto LABEL_12;
  }
  [v24 cornerRadius];
  if (v25 <= 0.0) {
    goto LABEL_12;
  }
  [v12 cornerRadius];
  double v23 = v26;
  long long v27 = [v12 cornerCurve];
  int v28 = [v27 isEqualToString:*MEMORY[0x1E4F39EA8]];

  if (!v28) {
    goto LABEL_12;
  }
  uint64_t v29 = +[UIBezierPath _bezierPathWithPillRect:cornerRadius:](UIBezierPath, "_bezierPathWithPillRect:cornerRadius:", v15, v17, v19, v21, v23);
LABEL_13:
  id v13 = (void *)v29;
LABEL_14:

  return v13;
}

- (void)_updateFocusLayerFrames
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v2 = [(UIFocusRingManager *)self focusRingStateForClient];
  id v3 = [v2 allValues];

  obuint64_t j = v3;
  uint64_t v37 = [v3 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v48;
    double v4 = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v48 != v36) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        BOOL v8 = [v7 activeFocusLayersToItems];
        id v9 = (void *)[v8 copy];

        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v42 = [v9 keyEnumerator];
        uint64_t v10 = [v42 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (!v10)
        {
          v33 = v42;
          goto LABEL_35;
        }
        uint64_t v11 = v10;
        v38 = v7;
        uint64_t v39 = i;
        char v40 = 0;
        uint64_t v12 = *(void *)v44;
        while (2)
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v44 != v12) {
              objc_enumerationMutation(v42);
            }
            id v14 = *(void **)(*((void *)&v43 + 1) + 8 * j);
            double v15 = [v14 superlayer];

            if (!v15) {
              continue;
            }
            double v16 = [v9 objectForKey:v14];
            double v17 = _UIFocusEnvironmentContainingView(v16);
            double v18 = v17;
            if (!v16)
            {

              uint64_t i = v39;
              goto LABEL_34;
            }
            [v17 alpha];
            if (v19 == 0.0)
            {
              [v18 alpha];
              *(float *)&double v20 = v20;
            }
            else
            {
              [v14 opacity];
              float v21 = *(float *)&v20;
              LODWORD(v20) = 1.0;
              if (v21 != 0.0) {
                goto LABEL_17;
              }
            }
            [v14 setOpacity:v20];
LABEL_17:
            double v22 = objc_msgSend(v14, "superlayer", v20);
            double v23 = CALayerGetDelegate();

            if ((_IsKindOfUIView((uint64_t)v23) & 1) == 0)
            {
              uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
              [v32 handleFailureInMethod:a2 object:self file:@"UIFocusRingManager.m" lineNumber:404 description:@"Internal inconsistency: the layer owning the focus ring is no longer associated with a UIView."];
            }
            id v24 = v23;
            double v25 = [v24 _window];

            if (v25)
            {
              uint64_t v26 = v11;
              uint64_t v27 = v12;
              int v28 = [(UIFocusRingManager *)self _focusRingPathForItem:v16 inView:v24];
              [v28 bounds];
              if (v4 != v30 || v5 != v29)
              {
                [MEMORY[0x1E4F39CF8] setDisableActions:1];
                objc_msgSend(v14, "setPath:", objc_msgSend(v28, "CGPath"));
                [MEMORY[0x1E4F39CF8] setDisableActions:0];
              }

              uint64_t v12 = v27;
              uint64_t v11 = v26;
            }
            else
            {
              char v40 = 1;
            }

            if (!v25) {
              goto LABEL_30;
            }
          }
          uint64_t v11 = [v42 countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (v11) {
            continue;
          }
          break;
        }
LABEL_30:

        uint64_t i = v39;
        if ((v40 & 1) == 0) {
          goto LABEL_36;
        }
LABEL_34:
        v33 = [v38 clientID];
        [(UIFocusRingManager *)self _removeActiveFocusLayersForClient:v33];
LABEL_35:

LABEL_36:
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v37);
  }
}

+ (void)_removeActiveFocusLayers
{
  id v2 = [a1 manager];
  [v2 _removeActiveFocusLayersForClient:@"FocusEngineClient"];
}

+ (void)_updateActiveFocusLayers
{
  id v4 = [a1 manager];
  id v3 = [a1 _currentFocusItemForClient:@"FocusEngineClient"];
  if (v3) {
    [a1 moveRingToFocusItem:v3];
  }
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  id v6 = [(UIFocusRingManager *)self focusRingStateForClient];
  id v7 = [v3 stringWithFormat:@"<%@: %p, state: %@>", v5, self, v6];

  return v7;
}

- (void)setFocusRingStateForClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
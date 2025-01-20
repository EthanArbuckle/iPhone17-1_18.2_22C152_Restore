@interface _UIPointerInteractionAssistant
- (BOOL)_monitorsView:(id)a3;
- (CGPoint)request:(id)a3 locationInView:(id)a4;
- (UIView)previewContainer;
- (_UIPointerInteractionAssistant)init;
- (_UIPointerInteractionAssistant)initWithDelegate:(id)a3;
- (id)_assistantForView:(uint64_t)a1;
- (id)_monitoredWindow;
- (id)createPreviewTargetForView:(id)a3 center:(CGPoint)a4;
- (id)createRegionFromRect:(CGRect)a3 targetView:(id)a4 identifier:(id)a5 selected:(BOOL)a6;
- (id)createStyleForButton:(id)a3 shapeProvider:(id)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5;
- (void)_updatePointerInteractionForSubtree:(char)a3 suppressInteractions:;
- (void)_willMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setAssistedView:(id)a3 identifier:(id)a4;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIPointerInteractionAssistant

- (void)_willMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id obj = a4;
  v5 = -[_UIPointerInteractionAssistant _monitoredWindow]((id *)&self->super.super.isa);
  [v5 _unregisterSubtreeMonitor:self];

  if ([(NSMutableDictionary *)self->_assistants count]) {
    [obj _registerSubtreeMonitor:self];
  }
  id v6 = objc_storeWeakOrNil((id *)&self->_manual_weak_monitoredWindow, obj);
}

- (BOOL)_monitorsView:(id)a3
{
  v3 = -[_UIPointerInteractionAssistant _assistantForView:]((uint64_t)self, (uint64_t)a3);
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)_assistantForView:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v6 = 0;
    v7 = &v6;
    uint64_t v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__50;
    v10 = __Block_byref_object_dispose__50;
    id v11 = 0;
    v2 = *(void **)(a1 + 104);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52___UIPointerInteractionAssistant__assistantForView___block_invoke;
    v5[3] = &unk_1E52E7860;
    v5[4] = &v6;
    v5[5] = a2;
    [v2 enumerateKeysAndObjectsUsingBlock:v5];
    id v3 = (id)v7[5];
    _Block_object_dispose(&v6, 8);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)_updatePointerInteractionForSubtree:(char)a3 suppressInteractions:
{
  if (a1)
  {
    id v5 = a2;
    uint64_t v6 = [_UIViewBlockVisitor alloc];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __91___UIPointerInteractionAssistant__updatePointerInteractionForSubtree_suppressInteractions___block_invoke;
    v8[3] = &unk_1E52E7838;
    char v9 = a3;
    v8[4] = a1;
    v7 = [(_UIViewBlockVisitor *)v6 initWithTraversalDirection:2 visitorBlock:v8];
    [v5 _receiveVisitor:v7];
  }
}

- (UIView)previewContainer
{
  previewContainer = self->_previewContainer;
  if (!previewContainer)
  {
    BOOL v4 = (_UIPointerInteractionAssistantEffectContainerView *)objc_opt_new();
    id v5 = self->_previewContainer;
    self->_previewContainer = v4;

    [(UIView *)self->_previewContainer setUserInteractionEnabled:0];
    previewContainer = self->_previewContainer;
  }
  return (UIView *)previewContainer;
}

- (_UIPointerInteractionAssistant)init
{
  return [(_UIPointerInteractionAssistant *)self initWithDelegate:self];
}

- (_UIPointerInteractionAssistant)initWithDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPointerInteractionAssistant;
  return [(UIPointerInteraction *)&v4 initWithDelegate:self];
}

- (void)setAssistedView:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v28 = v8;
  if (!v8)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"_UIPointerInteractionAssistant.m" lineNumber:219 description:@"assistedView identifier must not be nil"];
  }
  assistants = self->_assistants;
  if (v7)
  {
    if (!assistants)
    {
      v16 = [_UIAssistantEntry alloc];
      id v17 = v7;
      if (v16)
      {
        v29.receiver = v16;
        v29.super_class = (Class)_UIAssistantEntry;
        id v18 = [(UIPointerInteraction *)&v29 init];
        v16 = (_UIAssistantEntry *)v18;
        if (v18) {
          objc_storeWeak((id *)v18 + 1, v17);
        }
      }

      v29.receiver = v16;
      v19 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithObjects:&v29 forKeys:&v28 count:1];
      v20 = self->_assistants;
      self->_assistants = v19;

      id v15 = 0;
      goto LABEL_20;
    }
    uint64_t v10 = [(NSMutableDictionary *)assistants objectForKeyedSubscript:v8];
    if (v10)
    {
      id v11 = (id *)v10;
      id WeakRetained = objc_loadWeakRetained((id *)(v10 + 8));
    }
    else
    {
      id v11 = (id *)objc_opt_new();
      [(NSMutableDictionary *)self->_assistants setObject:v11 forKeyedSubscript:v8];
      id WeakRetained = 0;
      id v15 = 0;
      if (!v11)
      {
LABEL_20:
        -[_UIPointerInteractionAssistant _updatePointerInteractionForSubtree:suppressInteractions:]((uint64_t)self, v7, 1);
        v21 = v15;
        goto LABEL_21;
      }
    }
    objc_storeWeak(v11 + 1, v7);

    id v15 = WeakRetained;
  }
  else
  {
    uint64_t v13 = [(NSMutableDictionary *)assistants objectForKeyedSubscript:v8];
    v14 = (void *)v13;
    if (v13) {
      id v15 = objc_loadWeakRetained((id *)(v13 + 8));
    }
    else {
      id v15 = 0;
    }

    [(NSMutableDictionary *)self->_assistants setObject:0 forKeyedSubscript:v8];
  }
  v21 = v7;
  if (v15 != v7)
  {
    if (v15) {
      -[_UIPointerInteractionAssistant _updatePointerInteractionForSubtree:suppressInteractions:]((uint64_t)self, v15, 0);
    }
    v21 = v15;
    if (v7) {
      goto LABEL_20;
    }
  }
LABEL_21:
  if ([(NSMutableDictionary *)self->_assistants count])
  {
    v22 = [(UIView *)self->_previewContainer window];
    id v23 = objc_storeWeakOrNil((id *)&self->_manual_weak_monitoredWindow, v22);

    v24 = -[_UIPointerInteractionAssistant _monitoredWindow]((id *)&self->super.super.isa);
    [v24 _registerSubtreeMonitor:self];
  }
  else
  {
    v25 = -[_UIPointerInteractionAssistant _monitoredWindow]((id *)&self->super.super.isa);
    [v25 _unregisterSubtreeMonitor:self];

    id v26 = objc_storeWeakOrNil((id *)&self->_manual_weak_monitoredWindow, 0);
  }
  [(UIPointerInteraction *)self invalidate];
}

- (id)_monitoredWindow
{
  if (a1)
  {
    objc_loadWeak(a1 + 12);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)willMoveToView:(id)a3
{
  id v4 = a3;
  id v5 = -[_UIPointerInteractionAssistant _monitoredWindow]((id *)&self->super.super.isa);
  uint64_t v6 = v5;
  if (!v4)
  {
    if (v5)
    {
      [v5 _unregisterSubtreeMonitor:self];
      if (self) {
        id v7 = objc_storeWeakOrNil((id *)&self->_manual_weak_monitoredWindow, 0);
      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIPointerInteractionAssistant;
  [(UIPointerInteraction *)&v8 willMoveToView:v4];
}

- (void)_monitoredView:(id)a3 willMoveFromSuperview:(id)a4 toSuperview:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  char v9 = _assistedButtonForView(a3);
  if (v9)
  {
    uint64_t v10 = -[_UIPointerInteractionAssistant _assistantForView:]((uint64_t)self, (uint64_t)v8);
    int shouldAssistantDescendent = _shouldAssistantDescendent((uint64_t)v10, v9);

    v12 = -[_UIPointerInteractionAssistant _assistantForView:]((uint64_t)self, (uint64_t)v15);
    int v13 = _shouldAssistantDescendent((uint64_t)v12, v9);

    if (shouldAssistantDescendent && !v13) {
      goto LABEL_4;
    }
    if (((shouldAssistantDescendent | v13 ^ 1) & 1) == 0)
    {
      v14 = [v9 _proxyPointerInteraction];

      if (v14 == self)
      {
        self = 0;
LABEL_4:
        [v9 _setProxyPointerInteraction:self];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistants, 0);
  objc_destroyWeak((id *)&self->_manual_weak_monitoredWindow);
  objc_storeStrong((id *)&self->_previewContainer, 0);
}

- (id)createPreviewTargetForView:(id)a3 center:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [a3 superview];
  objc_msgSend(v7, "convertPoint:toView:", self->_previewContainer, x, y);
  double v9 = v8;
  double v11 = v10;

  v12 = -[UIPreviewTarget initWithContainer:center:]([UIPreviewTarget alloc], "initWithContainer:center:", self->_previewContainer, v9, v11);
  return v12;
}

- (id)createRegionFromRect:(CGRect)a3 targetView:(id)a4 identifier:(id)a5 selected:(BOOL)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a5;
  id v15 = [(UIPointerInteraction *)self view];
  objc_msgSend(v13, "convertRect:toView:", v15, x, y, width, height);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  uint64_t v24 = +[UIPointerRegion regionWithRect:identifier:](_UIPointerAssistantRegion, "regionWithRect:identifier:", v14, v17, v19, v21, v23);

  if (v24)
  {
    objc_storeWeak((id *)(v24 + 80), v13);
    *(unsigned char *)(v24 + 72) = a6;
  }

  return (id)v24;
}

- (id)createStyleForButton:(id)a3 shapeProvider:(id)a4
{
  id v7 = a3;
  double v8 = (void (**)(id, id, _UIPointerInteractionAssistantEffectContainerView *, void *))a4;
  [v7 center];
  double v9 = -[_UIPointerInteractionAssistant createPreviewTargetForView:center:](self, "createPreviewTargetForView:center:", v7);
  double v10 = [UITargetedPreview alloc];
  double v11 = [v7 _pointerEffectPreviewParameters];
  uint64_t v12 = [(UITargetedPreview *)v10 initWithView:v7 parameters:v11 target:v9];

  id v13 = (void *)v12;
  id v14 = [v7 _pointerEffectWithPreview:v12];
  id v15 = [v7 _shapeInContainer:self->_previewContainer];
  if (v8)
  {
    v8[2](v8, v7, self->_previewContainer, v15);
    uint64_t v17 = v16 = v14;

    id v15 = (void *)v17;
    id v14 = v16;
  }
  uint64_t v18 = [v7 pointerStyleProvider];
  double v19 = (void *)v18;
  if (v18)
  {
    SEL v31 = a2;
    v32 = self;
    v35 = v14;
    double v20 = (*(void (**)(uint64_t, id, void *, void *))(v18 + 16))(v18, v7, v14, v15);
    double v21 = [v20 pointerEffect];
    double v22 = v21;
    if (v21)
    {
      [v21 preview];
      v24 = double v23 = v9;
      [v24 target];
      v25 = v34 = v8;
      [v25 container];
      id v26 = v33 = v13;
      v27 = [v23 container];

      double v8 = v34;
      double v9 = v23;
      BOOL v28 = v26 == v27;
      id v13 = v33;
      if (!v28)
      {
        v30 = [MEMORY[0x1E4F28B00] currentHandler];
        [v30 handleFailureInMethod:v31 object:v32 file:@"_UIPointerInteractionAssistant.m" lineNumber:202 description:@"UIButton pointer effect must use the same container as the UITargetedPreview provided with the proposedEffect when used as a custom view in a UINavigationBar or UIToolbar"];
      }
    }

    id v14 = v35;
  }
  else
  {
    double v20 = +[UIPointerStyle styleWithEffect:v14 shape:v15];
  }

  return v20;
}

- (CGPoint)request:(id)a3 locationInView:(id)a4
{
  id v6 = a4;
  [a3 location];
  double v8 = v7;
  double v10 = v9;
  double v11 = [(UIPointerInteraction *)self view];
  objc_msgSend(v6, "convertPoint:fromView:", v11, v8, v10);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v8 view];
  [v9 location];
  double v12 = objc_msgSend(v11, "hitTest:withEvent:", 0);
  uint64_t v30 = 0;
  SEL v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__50;
  v34 = __Block_byref_object_dispose__50;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__50;
  BOOL v28 = __Block_byref_object_dispose__50;
  id v29 = 0;
  assistants = self->_assistants;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __84___UIPointerInteractionAssistant_pointerInteraction_regionForRequest_defaultRegion___block_invoke;
  v20[3] = &unk_1E52E7888;
  id v14 = v12;
  id v21 = v14;
  double v22 = &v30;
  double v23 = &v24;
  [(NSMutableDictionary *)assistants enumerateKeysAndObjectsUsingBlock:v20];
  uint64_t v15 = v31[5];
  if (v15)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v15 + 8));
    [WeakRetained bounds];
    objc_msgSend(WeakRetained, "convertRect:toView:", v11);
    double v17 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v25[5]);
    uint64_t v18 = [(id)v31[5] pointerInteraction:v8 regionForRequest:v9 defaultRegion:v17];
  }
  else
  {
    uint64_t v18 = 0;
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v18;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  if (a4) {
    double v7 = (void *)*((void *)a4 + 11);
  }
  else {
    double v7 = 0;
  }
  id v8 = v7;
  id v9 = [v8 pointerInteraction:a3 styleForRegion:a4];
  id v10 = v9;
  if (self->_previewContainer) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11
    || ([v9 pointerEffect], double v12 = objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    id v23 = v10;
  }
  else
  {
    double v13 = [v10 pointerEffect];
    id v14 = [v13 preview];

    uint64_t v15 = [v14 target];
    double v16 = [v15 container];
    [v15 center];
    objc_msgSend(v16, "convertPoint:toView:", self->_previewContainer);
    double v18 = v17;
    double v20 = v19;

    id v21 = -[UIPreviewTarget initWithContainer:center:]([UIPreviewTarget alloc], "initWithContainer:center:", self->_previewContainer, v18, v20);
    double v22 = [v14 retargetedPreviewWithTarget:v21];
    id v23 = (id)[v10 copy];
    uint64_t v24 = [v23 pointerEffect];
    [v24 setPreview:v22];
  }
  return v23;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  if (a4) {
    id v5 = (void *)*((void *)a4 + 11);
  }
  else {
    id v5 = 0;
  }
  objc_msgSend(v5, "pointerInteraction:willEnterRegion:animator:", a3);
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  if (a4) {
    id v5 = (void *)*((void *)a4 + 11);
  }
  else {
    id v5 = 0;
  }
  objc_msgSend(v5, "pointerInteraction:willExitRegion:animator:", a3);
}

@end
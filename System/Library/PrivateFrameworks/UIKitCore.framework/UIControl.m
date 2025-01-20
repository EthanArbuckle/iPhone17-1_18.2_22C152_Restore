@interface UIControl
+ (BOOL)_allowActionsToQueue;
+ (unint64_t)_primaryStateForState:(unint64_t)a3;
- (BOOL)_accessibilityShouldActivateOnHUDLift;
- (BOOL)_allowsSymbolAnimations;
- (BOOL)_hasActionForEventMask:(unint64_t)a3;
- (BOOL)_hasActiveMenuPresentation;
- (BOOL)_providesCustomPointerInteraction;
- (BOOL)_touchHasHighlighted;
- (BOOL)_wasLastHighlightSuccessful;
- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)cancelMouseTracking;
- (BOOL)cancelTouchTracking;
- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event;
- (BOOL)hasOneOrMoreTargets;
- (BOOL)isContextMenuInteractionEnabled;
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)isPointerInteractionEnabled;
- (BOOL)isSelected;
- (BOOL)isSymbolAnimationEnabled;
- (BOOL)isTouchInside;
- (BOOL)isTracking;
- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)requiresDisplayOnTracking;
- (BOOL)shouldTrack;
- (BOOL)showsMenuAsPrimaryAction;
- (BOOL)touchDragged;
- (CGPoint)menuAttachmentPointForConfiguration:(UIContextMenuConfiguration *)configuration;
- (NSArray)actionsForTarget:(id)target forControlEvent:(UIControlEvents)controlEvent;
- (NSSet)allTargets;
- (NSString)toolTip;
- (UIContextMenuConfiguration)contextMenuInteraction:(UIContextMenuInteraction *)interaction configurationForMenuAtLocation:(CGPoint)location;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIControl)initWithCoder:(NSCoder *)coder;
- (UIControl)initWithFrame:(CGRect)frame;
- (UIControl)initWithFrame:(CGRect)frame primaryAction:(UIAction *)primaryAction;
- (UIControlContentHorizontalAlignment)contentHorizontalAlignment;
- (UIControlContentHorizontalAlignment)effectiveContentHorizontalAlignment;
- (UIControlContentVerticalAlignment)contentVerticalAlignment;
- (UIControlEvents)allControlEvents;
- (UIControlState)state;
- (UIPointerInteraction)_pointerInteraction;
- (UIPointerInteraction)_proxyPointerInteraction;
- (UIPointerInteraction)pointerInteraction;
- (UITargetedPreview)contextMenuInteraction:(UIContextMenuInteraction *)interaction previewForDismissingMenuWithConfiguration:(UIContextMenuConfiguration *)configuration;
- (UITargetedPreview)contextMenuInteraction:(UIContextMenuInteraction *)interaction previewForHighlightingMenuWithConfiguration:(UIContextMenuConfiguration *)configuration;
- (UIToolTipInteraction)toolTipInteraction;
- (double)_highlightCornerRadius;
- (id)__distributionStatisticsForUserInteractionDuration;
- (id)__scalarStatisticsForUserTouchUpInsideEvent;
- (id)__scalarStatisticsForUserValueChangedEvent;
- (id)_allTargetActions;
- (id)_contextMenuInteraction;
- (id)_contextMenuInteraction:(id)a3 configuration:(id)a4 interactionEffectForTargetedPreview:(id)a5;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)_createPointerInteraction;
- (id)_distributionStatisticsForUserInteractionDuration;
- (id)_proxySender;
- (id)_safeHoverStyle;
- (id)_scalarStatisticsForUserTouchUpInsideEvent;
- (id)_scalarStatisticsForUserValueChangedEvent;
- (id)_systemDefaultFocusGroupIdentifier;
- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)_focusedSound;
- (int64_t)_requiredButtonMask;
- (int64_t)_sceneDraggingBehaviorOnPan;
- (int64_t)effectiveContentVerticalAlignment;
- (unint64_t)_controlEventsForActionTriggered;
- (unint64_t)_stateForFocusUpdateContext:(id)a3;
- (void)_activateForAccessibilityHUDLiftAtPoint:(CGPoint)a3;
- (void)_addControlTargetAction:(id)a3;
- (void)_beginInteractionDurationStatisticMeasurements;
- (void)_commitInteractionDurationStatisticMeasurements;
- (void)_commonInitForPrimaryAction:(id)a3;
- (void)_connectInterfaceBuilderEventConnection:(id)a3;
- (void)_contextMenuInteraction:(id)a3 willBeginWithConfiguration:(id)a4;
- (void)_diagnoseFocusabilityForReport:(id)a3;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_incrementStatisticsForUserActionForEvents:(unint64_t)a3;
- (void)_invalidatePointerInteraction;
- (void)_registerCustomHoverStylePointerDriverIfNeeded;
- (void)_sendActionsForEvents:(unint64_t)a3 withEvent:(id)a4;
- (void)_setHasActiveMenuPresentation:(BOOL)a3;
- (void)_setHighlightOnMouseDown:(BOOL)a3;
- (void)_setHoverStyle:(void *)a1 implicit:(void *)a2;
- (void)_setImplicitHoverStyle:(id)a3;
- (void)_setLastHighlightSuccessful:(BOOL)a3;
- (void)_setProxyPointerInteraction:(id)a3;
- (void)_setProxySender:(id)a3;
- (void)_setRequiredButtonMask:(int64_t)a3;
- (void)_setTouchHasHighlighted:(BOOL)a3;
- (void)_unhighlight;
- (void)_willMoveToWindow:(id)a3;
- (void)addAction:(UIAction *)action forControlEvents:(UIControlEvents)controlEvents;
- (void)addTarget:(id)a3 action:(SEL)a4 forEvents:(int)a5;
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
- (void)cancelTrackingWithEvent:(UIEvent *)event;
- (void)contextMenuInteraction:(UIContextMenuInteraction *)interaction willEndForConfiguration:(UIContextMenuConfiguration *)configuration animator:(id)animator;
- (void)encodeWithCoder:(id)a3;
- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event;
- (void)enumerateEventHandlers:(void *)iterator;
- (void)performPrimaryAction;
- (void)removeAction:(UIAction *)action forControlEvents:(UIControlEvents)controlEvents;
- (void)removeActionForIdentifier:(UIActionIdentifier)actionIdentifier forControlEvents:(UIControlEvents)controlEvents;
- (void)removeTarget:(id)a3 forEvents:(int)a4;
- (void)removeTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event;
- (void)sendAction:(UIAction *)action;
- (void)sendActionsForControlEvents:(UIControlEvents)controlEvents;
- (void)setContentHorizontalAlignment:(UIControlContentHorizontalAlignment)contentHorizontalAlignment;
- (void)setContentVerticalAlignment:(UIControlContentVerticalAlignment)contentVerticalAlignment;
- (void)setContextMenuInteractionEnabled:(BOOL)contextMenuInteractionEnabled;
- (void)setEnabled:(BOOL)enabled;
- (void)setHighlighted:(BOOL)highlighted;
- (void)setHoverStyle:(id)a3;
- (void)setPointerInteractionEnabled:(BOOL)a3;
- (void)setRequiresDisplayOnTracking:(BOOL)a3;
- (void)setSelected:(BOOL)selected;
- (void)setShowsMenuAsPrimaryAction:(BOOL)showsMenuAsPrimaryAction;
- (void)setSymbolAnimationEnabled:(BOOL)symbolAnimationEnabled;
- (void)setTracking:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UIControl

- (UIControlState)state
{
  if ([(UIControl *)self isEnabled]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 2;
  }
  UIControlState v4 = v3 | [(UIControl *)self isHighlighted];
  if ([(UIControl *)self isSelected]) {
    v4 |= 4uLL;
  }
  if ([(UIView *)self isFocused]) {
    return v4 | 8;
  }
  else {
    return v4;
  }
}

- (BOOL)isEnabled
{
  return (*(unsigned char *)&self->_controlFlags & 1) == 0;
}

- (BOOL)isHighlighted
{
  return (*(unsigned char *)&self->_controlFlags >> 5) & 1;
}

- (BOOL)isSelected
{
  return (*((unsigned __int8 *)&self->_controlFlags + 1) >> 1) & 1;
}

- (UIControlContentHorizontalAlignment)contentHorizontalAlignment
{
  return (unint64_t)((unsigned __int16)*(_DWORD *)&self->_controlFlags >> 13);
}

- (BOOL)showsMenuAsPrimaryAction
{
  if ((*((unsigned char *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    v2 = objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
  }
  else
  {
    v2 = 0;
  }
  char v3 = [v2 _presentOnTouchDown];

  return v3;
}

- (id)_safeHoverStyle
{
  if (a1)
  {
    v2 = a1;
    if (dyld_program_sdk_at_least()) {
      [v2 hoverStyle];
    }
    else {
    a1 = -[UIView _hoverStyleStorage](v2);
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)_allowsSymbolAnimations
{
  if ((*((unsigned char *)&self->_controlFlags + 2) & 4) != 0)
  {
    char v3 = _UIKitUserDefaults();
    int v2 = [v3 BOOLForKey:@"DisableControlSymbolAnimations"] ^ 1;
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (BOOL)_touchHasHighlighted
{
  return (*((unsigned __int8 *)&self->_controlFlags + 2) >> 1) & 1;
}

- (void).cxx_destruct
{
}

- (UIControlContentVerticalAlignment)contentVerticalAlignment
{
  return ((unint64_t)self->_controlFlags >> 10) & 7;
}

- (void)setShowsMenuAsPrimaryAction:(BOOL)showsMenuAsPrimaryAction
{
  BOOL v3 = showsMenuAsPrimaryAction;
  if (showsMenuAsPrimaryAction)
  {
    UIControlState v4 = [(UIControl *)self contextMenuInteraction];
  }
  else if ((*((unsigned char *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    UIControlState v4 = objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
  }
  else
  {
    UIControlState v4 = 0;
  }
  id v5 = v4;
  [v4 _setPresentOnTouchDown:v3];
}

- (void)setContextMenuInteractionEnabled:(BOOL)contextMenuInteractionEnabled
{
  if (contextMenuInteractionEnabled)
  {
    id v7 = [(UIControl *)self contextMenuInteraction];
    UIControlState v4 = [v7 view];

    if (!v4) {
      [(UIView *)self addInteraction:v7];
    }
  }
  else
  {
    if ((*((unsigned char *)&self->_controlFlags + 2) & 0x20) != 0)
    {
      id v5 = objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
    }
    else
    {
      id v5 = 0;
    }
    id v7 = v5;
    v6 = [v5 view];

    if (v6 == self)
    {
      [(UIView *)self removeInteraction:v7];
      [(UIControl *)self _setHasActiveMenuPresentation:0];
    }
  }
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  if ((*((unsigned char *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
    id v5 = (_UIVariableGestureContextMenuInteraction *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = objc_opt_class();
    if (v3 == objc_opt_class()
      || (uint64_t v4 = [(UIControl *)self methodForSelector:sel_contextMenuInteraction_configurationForMenuAtLocation_], v4 == +[UIControl instanceMethodForSelector:sel_contextMenuInteraction_configurationForMenuAtLocation_]))
    {
      id v5 = 0;
    }
    else
    {
      id v5 = [[_UIVariableGestureContextMenuInteraction alloc] initWithDelegate:self];
      [(UIContextMenuInteraction *)v5 _setProxySender:self];
      objc_setAssociatedObject(self, &_UIControlContextMenuInteractionKey, v5, (void *)1);
      *(_DWORD *)&self->_controlFlags |= 0x200000u;
    }
  }
  return (UIContextMenuInteraction *)v5;
}

- (void)setEnabled:(BOOL)enabled
{
  if (((*(_DWORD *)&self->_controlFlags & 1) == 0) != enabled)
  {
    BOOL v3 = enabled;
    self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFFFFFE | !enabled);
    -[UIControl _safeHoverStyle](self);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v5 setEnabled:v3];
    [(UIView *)self setNeedsDisplay];
  }
}

- (void)setSelected:(BOOL)selected
{
  if (((((*(_DWORD *)&self->_controlFlags & 0x200) == 0) ^ selected) & 1) == 0)
  {
    if (selected) {
      int v4 = 512;
    }
    else {
      int v4 = 0;
    }
    self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFFFDFF | v4);
    [(UIControl *)self _invalidatePointerInteraction];
    [(UIView *)self setNeedsDisplay];
  }
}

- (void)_invalidatePointerInteraction
{
  BOOL v3 = [(UIControl *)self _proxyPointerInteraction];
  id v5 = v3;
  if (v3)
  {
    [v3 invalidate];
  }
  else
  {
    int v4 = [(UIControl *)self _pointerInteraction];
    [v4 invalidate];
  }
}

- (UIPointerInteraction)_proxyPointerInteraction
{
  if ((*((unsigned char *)&self->_controlFlags + 2) & 0x10) != 0)
  {
    int v2 = objc_getAssociatedObject(self, &_UIControlProxyPointerInteractionKey);
  }
  else
  {
    int v2 = 0;
  }
  return (UIPointerInteraction *)v2;
}

- (UIPointerInteraction)_pointerInteraction
{
  if ((*((unsigned char *)&self->_controlFlags + 2) & 8) != 0)
  {
    int v2 = objc_getAssociatedObject(self, &_UIControlPointerInteractionKey);
  }
  else
  {
    int v2 = 0;
  }
  return (UIPointerInteraction *)v2;
}

- (BOOL)isContextMenuInteractionEnabled
{
  if ((*((unsigned char *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    int v2 = objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
  }
  else
  {
    int v2 = 0;
  }
  BOOL v3 = [v2 view];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_hasActiveMenuPresentation
{
  return (*((unsigned __int8 *)&self->_controlFlags + 2) >> 6) & 1;
}

- (void)setSymbolAnimationEnabled:(BOOL)symbolAnimationEnabled
{
  if (symbolAnimationEnabled) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFBFFFF | v3);
}

- (UIControl)initWithFrame:(CGRect)frame
{
  v7.receiver = self;
  v7.super_class = (Class)UIControl;
  int v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  BOOL v4 = v3;
  if (v3)
  {
    *(_DWORD *)&v3->_controlFlags &= 0xFFFF03FF;
    if ([(id)objc_opt_class() _allowActionsToQueue]) {
      int v5 = 128;
    }
    else {
      int v5 = 0;
    }
    v4->_controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&v4->_controlFlags & 0xFFFFFF7F | v5);
    v4->_requiredButtonMask = 1;
  }
  return v4;
}

+ (BOOL)_allowActionsToQueue
{
  return 0;
}

- (UIControlContentHorizontalAlignment)effectiveContentHorizontalAlignment
{
  UIControlContentHorizontalAlignment result = (unint64_t)((unsigned __int16)*(_DWORD *)&self->_controlFlags >> 13);
  if (result == UIControlContentHorizontalAlignmentTrailing)
  {
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0) {
      return 1;
    }
    else {
      return 2;
    }
  }
  else if (result == UIControlContentHorizontalAlignmentLeading)
  {
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return result;
}

- (int64_t)effectiveContentVerticalAlignment
{
  $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = self->_controlFlags;
  if ((*(_WORD *)&controlFlags & 0x1800) != 0x1000) {
    return (*(unsigned int *)&controlFlags >> 10) & 7;
  }
  if (dyld_program_sdk_at_least())
  {
    $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = self->_controlFlags;
    return (*(unsigned int *)&controlFlags >> 10) & 7;
  }
  return 0;
}

- (void)addAction:(UIAction *)action forControlEvents:(UIControlEvents)controlEvents
{
  v12 = action;
  if (v12)
  {
    if (controlEvents) {
      goto LABEL_3;
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIControl.m", 812, @"Attempt to set nil action with event mask:%08lx", controlEvents);

    if (controlEvents) {
      goto LABEL_3;
    }
  }
  v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"UIControl.m", 813, @"Attempt to set action '%@' with no event mask set", v12 object file lineNumber description];

LABEL_3:
  objc_super v7 = objc_alloc_init(UIControlTargetAction);
  uint64_t v8 = [(UIAction *)v12 _immutableCopy];
  actionHandler = v7->_actionHandler;
  v7->_actionHandler = (UIAction *)v8;

  v7->_eventMask = controlEvents;
  [(UIControl *)self _addControlTargetAction:v7];
}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
  id v8 = target;
  if (!v8)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  char v9 = dyld_program_sdk_at_least();
  v10 = v8;
  if ((v9 & 1) == 0)
  {
    unsigned __int8 v11 = objc_msgSend(v8, sel_allowsWeakReference);
    v10 = v8;
    if ((v11 & 1) == 0)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __47__UIControl_addTarget_action_forControlEvents___block_invoke;
      v14[3] = &unk_1E52D9F98;
      id v15 = v8;
      v16 = self;
      if (addTarget_action_forControlEvents__once != -1) {
        dispatch_once(&addTarget_action_forControlEvents__once, v14);
      }

      goto LABEL_7;
    }
  }
LABEL_8:
  id v12 = v10;

  if (action && controlEvents)
  {
    v13 = objc_alloc_init(UIControlTargetAction);
    objc_storeWeak(&v13->_target, v12);
    v13->_action = action;
    v13->_eventMask = controlEvents;
    [(UIControl *)self _addControlTargetAction:v13];
  }
}

- (void)_addControlTargetAction:(id)a3
{
  v24 = a3;
  targetActions = self->_targetActions;
  if (!targetActions)
  {
    int v5 = (NSMutableArray *)objc_opt_new();
    v6 = self->_targetActions;
    self->_targetActions = v5;

    targetActions = self->_targetActions;
  }
  int v7 = [(NSMutableArray *)targetActions count];
  if (v7 >= 1)
  {
    id v8 = (id *)(v24 + 2);
    char v9 = v24 + 3;
    uint64_t v10 = v7 + 1;
    v23 = (id *)(v24 + 2);
    while (1)
    {
      unsigned __int8 v11 = -[NSMutableArray objectAtIndexedSubscript:](self->_targetActions, "objectAtIndexedSubscript:", (v10 - 2), v23);
      id v12 = v24;
      id v13 = v11;
      v14 = (void *)v24[1];
      uint64_t v15 = *((void *)v13 + 1);
      if (!v14) {
        break;
      }
      char v16 = [v14 isEqual:v15];

      if (v16) {
        goto LABEL_7;
      }
LABEL_12:

      if ((unint64_t)--v10 <= 1) {
        goto LABEL_23;
      }
    }
    if (v15) {
      goto LABEL_11;
    }
    id WeakRetained = objc_loadWeakRetained(v8);
    id v18 = objc_loadWeakRetained((id *)v13 + 2);
    if (WeakRetained != v18)
    {

LABEL_11:
      goto LABEL_12;
    }
    v19 = v9;
    if (*v9) {
      uint64_t v20 = *v9;
    }
    else {
      uint64_t v20 = 0;
    }
    if (*((void *)v13 + 3)) {
      uint64_t v21 = *((void *)v13 + 3);
    }
    else {
      uint64_t v21 = 0;
    }

    BOOL v22 = v20 == v21;
    char v9 = v19;
    id v8 = v23;
    if (!v22) {
      goto LABEL_12;
    }
LABEL_7:
    v24[4] |= *((void *)v13 + 4);
    [(NSMutableArray *)self->_targetActions removeObjectAtIndex:(v10 - 2)];
    goto LABEL_12;
  }
LABEL_23:
  [(NSMutableArray *)self->_targetActions addObject:v24];
}

- (void)removeTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
  id v15 = target;
  int v8 = [(NSMutableArray *)self->_targetActions count];
  if (v8 >= 1)
  {
    UIControlEvents v9 = ~controlEvents;
    unint64_t v10 = v8 + 1;
    do
    {
      uint64_t v11 = [(NSMutableArray *)self->_targetActions objectAtIndex:(v10 - 2)];
      if (!v15
        || (id WeakRetained = objc_loadWeakRetained((id *)(v11 + 16)), WeakRetained, WeakRetained == v15))
      {
        BOOL v13 = (*(void *)(v11 + 32) & v9) == 0;
        *(void *)(v11 + 32) &= v9;
        if (v13)
        {
          if (!action
            || (!*(void *)(v11 + 24) ? (v14 = 0) : (v14 = *(const char **)(v11 + 24)), sel_isEqual(v14, action)))
          {
            [(NSMutableArray *)self->_targetActions removeObjectAtIndex:(v10 - 2)];
          }
        }
      }

      --v10;
    }
    while (v10 > 1);
  }
}

- (void)_setProxyPointerInteraction:(id)a3
{
  id value = a3;
  id v4 = [(UIControl *)self _proxyPointerInteraction];
  if (v4 != value)
  {
    objc_setAssociatedObject(self, &_UIControlProxyPointerInteractionKey, value, (void *)1);
    self->_$115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFEFFFFF | ((value != 0) << 20));
    int v5 = [(UIControl *)self pointerInteraction];
    if (v5)
    {
      if ((*((unsigned char *)&self->_controlFlags + 2) & 0x10) != 0) {
        [(UIView *)self removeInteraction:v5];
      }
      else {
        [(UIView *)self addInteraction:v5];
      }
    }
  }
}

- (void)setPointerInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIControl *)self pointerInteraction];
  [v4 setEnabled:v3];
}

- (UIPointerInteraction)pointerInteraction
{
  if ([(UIControl *)self _providesCustomPointerInteraction])
  {
    if ((*((unsigned char *)&self->_controlFlags + 2) & 8) != 0) {
      objc_getAssociatedObject(self, &_UIControlPointerInteractionKey);
    }
    else {
    BOOL v3 = [(UIControl *)self _createPointerInteraction];
    }
  }
  else
  {
    BOOL v3 = 0;
  }
  return (UIPointerInteraction *)v3;
}

- (BOOL)_providesCustomPointerInteraction
{
  uint64_t v2 = objc_opt_class();
  return v2 != objc_opt_class();
}

- (id)_createPointerInteraction
{
  BOOL v3 = [[UIPointerInteraction alloc] initWithDelegate:self];
  [(UIPointerInteraction *)v3 setEnabled:0];
  if ((*((unsigned char *)&self->_controlFlags + 2) & 0x10) == 0) {
    [(UIView *)self addInteraction:v3];
  }
  objc_setAssociatedObject(self, &_UIControlPointerInteractionKey, v3, (void *)1);
  *(_DWORD *)&self->_controlFlags |= 0x80000u;
  return v3;
}

+ (unint64_t)_primaryStateForState:(unint64_t)a3
{
  unint64_t v3 = 8;
  unint64_t v4 = a3 & 2;
  if ((a3 & 4) != 0) {
    unint64_t v4 = 4;
  }
  if ((a3 & 8) == 0) {
    unint64_t v3 = v4;
  }
  if (a3) {
    return 1;
  }
  else {
    return v3;
  }
}

- (void)setHoverStyle:(id)a3
{
}

- (void)_commonInitForPrimaryAction:(id)a3
{
}

- (BOOL)cancelTouchTracking
{
  if ([(UIControl *)self isTracking]) {
    [(UIControl *)self cancelTrackingWithEvent:0];
  }
  return 1;
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)UIControl;
  -[UIView _didMoveFromWindow:toWindow:](&v6, sel__didMoveFromWindow_toWindow_, a3);
  if (!a4)
  {
    if ([(UIControl *)self isTracking]) {
      [(UIControl *)self cancelTouchTracking];
    }
  }
}

- (BOOL)isTracking
{
  return (*(unsigned char *)&self->_controlFlags >> 1) & 1;
}

- (void)_willMoveToWindow:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if ((*((unsigned char *)&self->_controlFlags + 2) & 0x20) != 0)
    {
      int v5 = objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
    }
    else
    {
      int v5 = 0;
    }
    [v5 dismissMenu];
  }
  v6.receiver = self;
  v6.super_class = (Class)UIControl;
  [(UIView *)&v6 _willMoveToWindow:v4];
}

- (void)setContentVerticalAlignment:(UIControlContentVerticalAlignment)contentVerticalAlignment
{
  self->_$115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFFE3FF | ((contentVerticalAlignment & 7) << 10));
}

- (void)setContentHorizontalAlignment:(UIControlContentHorizontalAlignment)contentHorizontalAlignment
{
  self->_$115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFF1FFF | ((contentHorizontalAlignment & 7) << 13));
}

- (void)addTarget:(id)a3 action:(SEL)a4 forEvents:(int)a5
{
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(UIControl *)self isEnabled])
  {
    v10.receiver = self;
    v10.super_class = (Class)UIControl;
    int v8 = -[UIView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (void)_setHoverStyle:(void *)a1 implicit:(void *)a2
{
  if (a1)
  {
    id v3 = a2;
    id v4 = [a1 hoverStyle];
    v5.receiver = a1;
    v5.super_class = (Class)UIControl;
    objc_msgSendSuper2(&v5, sel_setHoverStyle_, v3);

    if (v3)
    {
      if (v4 != v3) {
        [a1 _registerCustomHoverStylePointerDriverIfNeeded];
      }
    }
  }
}

- (void)_registerCustomHoverStylePointerDriverIfNeeded
{
  objc_super v6 = self;
  uint64_t v2 = [(UIView *)v6 hoverStyle];
  if (v2)
  {
    id v3 = v2;
    id v4 = v6;
    sub_18588D318(v4, (uint64_t)v8);
    sub_18588D7D8((uint64_t)v8, (uint64_t)v7);
    uint64_t v5 = swift_allocObject();
    sub_18588D9D0(v7, v5 + 16);
    sub_1856331C0(1, (uint64_t)sub_1856370C4, v5);

    swift_release();
    sub_18588C8BC((uint64_t)v8);
  }
  else
  {
  }
}

- (void)_setHasActiveMenuPresentation:(BOOL)a3
{
  $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = self->_controlFlags;
  if (((((*(_DWORD *)&controlFlags & 0x400000) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v4 = 0x400000;
    }
    else {
      int v4 = 0;
    }
    self->_$115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&controlFlags & 0xFFBFFFFF | v4);
    -[UIControl setHighlighted:](self, "setHighlighted:");
  }
}

- (void)_activateForAccessibilityHUDLiftAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (dyld_program_sdk_at_least()
    && [(UIControl *)self isContextMenuInteractionEnabled]
    && [(UIControl *)self showsMenuAsPrimaryAction]
    && ([(UIControl *)self contextMenuInteraction],
        objc_super v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = [(UIControl *)self contextMenuInteraction];
    objc_msgSend(v7, "_presentMenuAtLocation:", x, y);
  }
  else
  {
    [(UIControl *)self sendActionsForControlEvents:64];
  }
  [(UIControl *)self setHighlighted:1];
  dispatch_time_t v8 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__UIControl_UIAccessibilityHUDGestureManager___activateForAccessibilityHUDLiftAtPoint___block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_after(v8, MEMORY[0x1E4F14428], block);
}

uint64_t __87__UIControl_UIAccessibilityHUDGestureManager___activateForAccessibilityHUDLiftAtPoint___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHighlighted:0];
}

- (UIControl)initWithFrame:(CGRect)frame primaryAction:(UIAction *)primaryAction
{
  double height = frame.size.height;
  double width = frame.size.width;
  double y = frame.origin.y;
  double x = frame.origin.x;
  UIControlEvents v9 = primaryAction;
  objc_super v10 = -[UIControl initWithFrame:](self, "initWithFrame:", x, y, width, height);
  uint64_t v11 = v10;
  if (v10) {
    [(UIControl *)v10 _commonInitForPrimaryAction:v9];
  }

  return v11;
}

- (UIControl)initWithCoder:(NSCoder *)coder
{
  int v4 = coder;
  v18.receiver = self;
  v18.super_class = (Class)UIControl;
  uint64_t v5 = [(UIView *)&v18 initWithCoder:v4];
  if (!v5) {
    goto LABEL_33;
  }
  if ([(NSCoder *)v4 decodeBoolForKey:@"UIHighlighted"]) {
    int v6 = 32;
  }
  else {
    int v6 = 0;
  }
  v5->_int controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&v5->_controlFlags & 0xFFFFFFDF | v6);
  if ([(NSCoder *)v4 decodeBoolForKey:@"UISelected"]) {
    int v7 = 512;
  }
  else {
    int v7 = 0;
  }
  v5->_int controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&v5->_controlFlags & 0xFFFFFDFF | v7);
  v5->_int controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&v5->_controlFlags & 0xFFFFE3FE | [(NSCoder *)v4 decodeBoolForKey:@"UIDisabled"]);
  if ([(NSCoder *)v4 containsValueForKey:@"UIContentVerticalAlignment2"])
  {
    dispatch_time_t v8 = @"UIContentVerticalAlignment2";
  }
  else
  {
    if (![(NSCoder *)v4 containsValueForKey:@"UIContentVerticalAlignment"])
    {
      int controlFlags = (int)v5->_controlFlags;
      goto LABEL_14;
    }
    dispatch_time_t v8 = @"UIContentVerticalAlignment";
  }
  int controlFlags = *(_DWORD *)&v5->_controlFlags & 0xFFFFE3FF | (([(NSCoder *)v4 decodeIntegerForKey:v8] & 7) << 10);
LABEL_14:
  v5->_int controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(controlFlags & 0xFFFF1FFF);
  if ([(NSCoder *)v4 containsValueForKey:@"UIContentHorizontalAlignment"]) {
    v5->_int controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&v5->_controlFlags & 0xFFFF1FFF | (([(NSCoder *)v4 decodeIntegerForKey:@"UIContentHorizontalAlignment"] & 7) << 13));
  }
  if ([(id)objc_opt_class() _allowActionsToQueue]) {
    int v10 = 128;
  }
  else {
    int v10 = 0;
  }
  v5->_int controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&v5->_controlFlags & 0xFFFFFF7F | v10);
  if ([(NSCoder *)v4 containsValueForKey:@"UIToolTip"])
  {
    uint64_t v11 = [(NSCoder *)v4 decodeObjectForKey:@"UIToolTip"];
    if (v11) {
      [(UIControl *)v5 setToolTip:v11];
    }
  }
  v5->_requiredButtonMask = 1;
  if ([(NSCoder *)v4 containsValueForKey:@"UIPointerInteractionEnabled"]) {
    [(UIControl *)v5 setPointerInteractionEnabled:[(NSCoder *)v4 decodeBoolForKey:@"UIPointerInteractionEnabled"]];
  }
  if (dyld_program_sdk_at_least())
  {
    BOOL v12 = [(NSCoder *)v4 decodeBoolForKey:@"UIContextMenuIsEnabled"];
    uint64_t v13 = [(NSCoder *)v4 decodeBoolForKey:@"UIContextMenuIsPrimary"];
    uint64_t v14 = v13;
    if (v12 || v13)
    {
      [(UIControl *)v5 contextMenuInteraction];

      if ((*((unsigned char *)&v5->_controlFlags + 2) & 0x20) != 0)
      {
        uint64_t v15 = objc_getAssociatedObject(v5, &_UIControlContextMenuInteractionKey);
        if (v15)
        {
          char v16 = (void *)v15;
          if (v12) {
            [(UIView *)v5 addInteraction:v15];
          }
          [v16 _setPresentOnTouchDown:v14];
        }
      }
    }
  }
LABEL_33:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIControl;
  [(UIView *)&v12 encodeWithCoder:v4];
  $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = self->_controlFlags;
  if ((*(unsigned char *)&controlFlags & 0x20) != 0)
  {
    [v4 encodeBool:1 forKey:@"UIHighlighted"];
    $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = self->_controlFlags;
    if ((*(_WORD *)&controlFlags & 0x200) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&controlFlags & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(_WORD *)&controlFlags & 0x200) == 0)
  {
    goto LABEL_3;
  }
  [v4 encodeBool:1 forKey:@"UISelected"];
  $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = self->_controlFlags;
  if (*(unsigned char *)&controlFlags)
  {
LABEL_4:
    [v4 encodeBool:1 forKey:@"UIDisabled"];
    $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = self->_controlFlags;
  }
LABEL_5:
  unint64_t v6 = (*(unsigned int *)&controlFlags >> 10) & 7;
  if (v6)
  {
    if (((*(unsigned int *)&controlFlags >> 10) & 6) != 4)
    {
      objc_msgSend(v4, "encodeInteger:forKey:");
      unint64_t v6 = ((unint64_t)self->_controlFlags >> 10) & 7;
    }
    [v4 encodeInteger:v6 forKey:@"UIContentVerticalAlignment2"];
    $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = self->_controlFlags;
  }
  if (*(_WORD *)&controlFlags >> 13) {
    objc_msgSend(v4, "encodeInteger:forKey:");
  }
  if ([(UIControl *)self isPointerInteractionEnabled]) {
    [v4 encodeBool:1 forKey:@"UIPointerInteractionEnabled"];
  }
  if ((*((unsigned char *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    dispatch_time_t v8 = objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
    int v7 = v8;
    if (v8)
    {
      UIControlEvents v9 = [v8 view];

      if (v9) {
        [v4 encodeBool:1 forKey:@"UIContextMenuIsEnabled"];
      }
      if ([v7 _presentOnTouchDown]) {
        [v4 encodeBool:1 forKey:@"UIContextMenuIsPrimary"];
      }
    }
  }
  else
  {
    int v7 = 0;
  }
  int v10 = [(UIControl *)self toolTip];

  if (v10)
  {
    uint64_t v11 = [(UIControl *)self toolTip];
    [v4 encodeObject:v11 forKey:@"UIToolTip"];
  }
}

- (BOOL)isTouchInside
{
  return (*(unsigned char *)&self->_controlFlags >> 2) & 1;
}

- (BOOL)cancelMouseTracking
{
  if ([(UIControl *)self isTracking])
  {
    [(UIControl *)self setTracking:0];
    if ([(UIControl *)self isHighlighted]) {
      [(UIControl *)self setHighlighted:0];
    }
    [(UIControl *)self _sendActionsForEvents:256 withEvent:0];
  }
  return 1;
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
  return 1;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
  return 1;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
}

- (void)cancelTrackingWithEvent:(UIEvent *)event
{
  id v4 = event;
  [(UIControl *)self setTracking:0];
  if ([(UIControl *)self isHighlighted]) {
    [(UIControl *)self setHighlighted:0];
  }
  [(UIControl *)self _sendActionsForEvents:256 withEvent:v4];
}

- (void)setHighlighted:(BOOL)highlighted
{
  $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = self->_controlFlags;
  unsigned int v5 = highlighted | ((*(unsigned int *)&controlFlags & 0x400000) >> 22);
  if ((*(_WORD *)&controlFlags & 0x100) != 0)
  {
    self->_$115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&controlFlags & 0xFFFFFEFF);
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__unhighlight object:0];
    $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = self->_controlFlags;
  }
  if (((v5 ^ ((*(unsigned char *)&controlFlags & 0x20) == 0)) & 1) == 0 && (v5 & *(_DWORD *)&controlFlags & 1) == 0)
  {
    if (v5)
    {
      [(UIControl *)self _setLastHighlightSuccessful:0];
      $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = self->_controlFlags;
      int v6 = 32;
    }
    else
    {
      int v6 = 0;
    }
    self->_$115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&controlFlags & 0xFFFFFFDF | v6);
    if ([(UIControl *)self requiresDisplayOnTracking])
    {
      [(UIView *)self setNeedsDisplay];
    }
  }
}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  double y = a3.y;
  double x = a3.x;
  if ([(UIControl *)self isEnabled])
  {
    v10.receiver = self;
    v10.super_class = (Class)UIControl;
    dispatch_time_t v8 = -[UIView hitTest:forEvent:](&v10, sel_hitTest_forEvent_, a4, x, y);
  }
  else
  {
    dispatch_time_t v8 = 0;
  }
  return v8;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_UITouchesContainsTouchFromCarTouchpad(v6)) {
    goto LABEL_2;
  }
  int64_t v8 = [(UIControl *)self _requiredButtonMask];
  id v9 = v7;
  if ([v9 _buttonMask])
  {
    uint64_t v10 = [v9 _buttonMask] & v8;

    if (!v10)
    {
LABEL_2:
      -[UIResponder touchesBegan:withEvent:](&v15, sel_touchesBegan_withEvent_, v6, v7, v14.receiver, v14.super_class, self, UIControl);
      goto LABEL_16;
    }
  }
  else
  {
  }
  if ([(UIControl *)self shouldTrack])
  {
    uint64_t v11 = [v9 _firstTouchForView:self];
    if (v11)
    {
      objc_super v12 = (void *)v11;
      [(UIControl *)self setTracking:[(UIControl *)self beginTrackingWithTouch:v11 withEvent:v9]];
      if ([(UIControl *)self isTracking])
      {
        $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = self->_controlFlags;
        self->_$115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&controlFlags & 0xFFFFFFF3 | 4);
        if ((*(unsigned char *)&controlFlags & 0x40) == 0)
        {
          self->_downTime = CFAbsoluteTimeGetCurrent();
          [(UIControl *)self setHighlighted:1];
        }
        [(UIControl *)self _sendActionsForEvents:1 withEvent:v9];
        if ((unint64_t)[v12 tapCount] >= 2) {
          [(UIControl *)self _sendActionsForEvents:2 withEvent:v9];
        }
      }
      [(UIResponder *)self _controlTouchBegan:v12 withEvent:v9];
    }
  }
  else
  {
    -[UIResponder touchesBegan:withEvent:](&v14, sel_touchesBegan_withEvent_, v6, v9, self, UIControl, v15.receiver, v15.super_class);
  }
LABEL_16:
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIControl *)self isTracking])
  {
    uint64_t v8 = [v7 _firstTouchForView:self];
    if (v8)
    {
      id v9 = (void *)v8;
      [(UIControl *)self setTracking:[(UIControl *)self continueTrackingWithTouch:v8 withEvent:v7]];
      if ([(UIControl *)self isTracking])
      {
        [v9 locationInView:self];
        BOOL v10 = -[UIControl pointMostlyInside:withEvent:](self, "pointMostlyInside:withEvent:", v7);
        BOOL v11 = [(UIControl *)self isTouchInside];
        $115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = self->_controlFlags;
        if (v10) {
          int v13 = 4;
        }
        else {
          int v13 = 0;
        }
        self->_$115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&controlFlags & 0xFFFFFFFB | v13);
        if ((*(unsigned char *)&controlFlags & 0x40) == 0 || !v10) {
          [(UIControl *)self setHighlighted:v10];
        }
        if (v11 != [(UIControl *)self isTouchInside])
        {
          if ([(UIControl *)self isTouchInside]) {
            uint64_t v14 = 16;
          }
          else {
            uint64_t v14 = 32;
          }
          [(UIControl *)self _sendActionsForEvents:v14 withEvent:v7];
        }
        *(_DWORD *)&self->_controlFlags |= 8u;
        if ([(UIControl *)self isTouchInside]) {
          uint64_t v15 = 4;
        }
        else {
          uint64_t v15 = 8;
        }
        [(UIControl *)self _sendActionsForEvents:v15 withEvent:v7];
      }
      [(UIResponder *)self _controlTouchMoved:v9 withEvent:v7];
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)UIControl;
    [(UIResponder *)&v16 touchesMoved:v6 withEvent:v7];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(UIControl *)self isTracking])
  {
    v26.receiver = self;
    v26.super_class = (Class)UIControl;
    [(UIResponder *)&v26 touchesEnded:v6 withEvent:v7];
LABEL_30:
    [(UIControl *)self _setTouchHasHighlighted:0];
    goto LABEL_31;
  }
  uint64_t v8 = [v7 _firstTouchForView:self];
  if (v8)
  {
    id v9 = v8;
    [v8 locationInView:self];
    BOOL v10 = -[UIControl pointMostlyInside:withEvent:](self, "pointMostlyInside:withEvent:", v7);
    double Current = 0.0;
    if ([(UIControl *)self isHighlighted])
    {
      BOOL v12 = 0;
    }
    else
    {
      BOOL v12 = (*(unsigned char *)&self->_controlFlags & 0x40) == 0;
      if ((*(unsigned char *)&self->_controlFlags & 0x40) == 0 && v10)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        BOOL v12 = 1;
        [(UIControl *)self setHighlighted:1];
      }
    }
    if (v10 != [(UIControl *)self isTouchInside])
    {
      if (v10) {
        int v14 = 4;
      }
      else {
        int v14 = 0;
      }
      self->_$115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFFFFFB | v14);
      if ([(UIControl *)self isTouchInside]) {
        uint64_t v15 = 16;
      }
      else {
        uint64_t v15 = 32;
      }
      [(UIControl *)self _sendActionsForEvents:v15 withEvent:v7];
    }
    [(UIControl *)self endTrackingWithTouch:v9 withEvent:v7];
    [(UIControl *)self setTracking:0];
    *(_DWORD *)&self->_controlFlags &= ~8u;
    if (v10) {
      uint64_t v16 = 64;
    }
    else {
      uint64_t v16 = 128;
    }
    [(UIControl *)self _sendActionsForEvents:v16 withEvent:v7];
    v17 = +[UIEventSessionActionAnalytics sharedInstance];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v18 = v7;
    }
    else {
      objc_super v18 = 0;
    }
    v19 = [v18 _firstTouchForView:self];
    objc_msgSend(v17, "didTap:withSource:", self, +[_UIEventSessionAction getUIEventSourceForUITouchType:](_UIEventSessionAction, "getUIEventSourceForUITouchType:", objc_msgSend(v19, "type")));

    if (v12 && (double v20 = CFAbsoluteTimeGetCurrent() - Current, v20 < 0.12))
    {
      *(_DWORD *)&self->_controlFlags |= 0x100u;
      uint64_t v21 = (void *)MEMORY[0x1E4F1CA80];
      BOOL v22 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      v23 = [v22 currentMode];
      v24 = objc_msgSend(v21, "setWithObjects:", v23, *MEMORY[0x1E4F1C3A0], 0);

      v25 = [v24 allObjects];
      [(UIControl *)self performSelector:sel__unhighlight withObject:0 afterDelay:v25 inModes:0.12 - v20];
    }
    else
    {
      [(UIControl *)self _setLastHighlightSuccessful:v10];
      [(UIControl *)self setHighlighted:0];
    }
    *(_DWORD *)&self->_controlFlags &= ~4u;
    [(UIResponder *)self _controlTouchEnded:v9 withEvent:v7];

    goto LABEL_30;
  }
LABEL_31:
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  if ([(UIControl *)self isTracking]) {
    [(UIControl *)self cancelTrackingWithEvent:v5];
  }
  [(UIControl *)self _setTouchHasHighlighted:0];
}

void __47__UIControl_addTarget_action_forControlEvents___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_ContextMenuScrollTruncationDetentsEnabled_block_invoke___s_category)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "You are trying to set a deallocating object as a target. This will be a hard crash in the future. Offending object: %@ hostObject: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)removeAction:(UIAction *)action forControlEvents:(UIControlEvents)controlEvents
{
  int v13 = action;
  int v6 = [(NSMutableArray *)self->_targetActions count];
  if (v6 >= 1)
  {
    UIControlEvents v7 = ~controlEvents;
    unint64_t v8 = v6 + 1;
    do
    {
      uint64_t v9 = [(NSMutableArray *)self->_targetActions objectAtIndexedSubscript:(v8 - 2)];
      id v10 = *(id *)(v9 + 8);
      BOOL v11 = v10;
      if (v10)
      {
        if ([v10 isEqual:v13])
        {
          BOOL v12 = (*(void *)(v9 + 32) & v7) == 0;
          *(void *)(v9 + 32) &= v7;
          if (v12) {
            [(NSMutableArray *)self->_targetActions removeObjectAtIndex:(v8 - 2)];
          }
        }
      }

      --v8;
    }
    while (v8 > 1);
  }
}

- (void)removeActionForIdentifier:(UIActionIdentifier)actionIdentifier forControlEvents:(UIControlEvents)controlEvents
{
  v17 = actionIdentifier;
  if (!v17)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIControl.m", 853, @"Attempt to remove action handlers for a nil identifier with event mask:%08lx", controlEvents);
  }
  int v7 = [(NSMutableArray *)self->_targetActions count];
  if (v7 >= 1)
  {
    UIControlEvents v8 = ~controlEvents;
    unint64_t v9 = v7 + 1;
    do
    {
      uint64_t v10 = [(NSMutableArray *)self->_targetActions objectAtIndexedSubscript:(v9 - 2)];
      id v11 = *(id *)(v10 + 8);
      BOOL v12 = v11;
      if (v11)
      {
        int v13 = [v11 identifier];
        int v14 = [v13 isEqualToString:v17];

        if (v14)
        {
          BOOL v15 = (*(void *)(v10 + 32) & v8) == 0;
          *(void *)(v10 + 32) &= v8;
          if (v15) {
            [(NSMutableArray *)self->_targetActions removeObjectAtIndex:(v9 - 2)];
          }
        }
      }

      --v9;
    }
    while (v9 > 1);
  }
}

- (void)performPrimaryAction
{
  if ([(UIControl *)self showsMenuAsPrimaryAction])
  {
    if ((*((unsigned char *)&self->_controlFlags + 2) & 0x20) != 0)
    {
      uint64_t v3 = objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
    }
    else
    {
      uint64_t v3 = 0;
    }
    id v8 = (id)v3;
    [(UIView *)self bounds];
    objc_msgSend(v8, "_presentMenuAtLocation:", v5 + v4 * 0.5, v7 + v6 * 0.5);
  }
  else
  {
    [(UIControl *)self _sendActionsForEvents:0x2000 withEvent:0];
  }
}

- (id)_allTargetActions
{
  return self->_targetActions;
}

- (NSSet)allTargets
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v4 = self->_targetActions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
        id WeakRetained = objc_loadWeakRetained((id *)(v9 + 16));

        if (WeakRetained)
        {
          uint64_t v11 = (uint64_t)objc_loadWeakRetained((id *)(v9 + 16));
LABEL_8:
          BOOL v12 = (void *)v11;
          objc_msgSend(v3, "addObject:", v11, (void)v15);

          goto LABEL_10;
        }
        if (!*(void *)(v9 + 8))
        {
          uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", (void)v15);
          goto LABEL_8;
        }
LABEL_10:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v13 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v6 = v13;
    }
    while (v13);
  }

  return (NSSet *)v3;
}

- (UIControlEvents)allControlEvents
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = self->_targetActions;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    UIControlEvents v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= *(void *)(*(void *)(*((void *)&v9 + 1) + 8 * i) + 32);
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    UIControlEvents v5 = 0;
  }

  return v5;
}

- (NSArray)actionsForTarget:(id)target forControlEvent:(UIControlEvents)controlEvent
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = target;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = self->_targetActions;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v8)
  {
    long long v10 = 0;
    goto LABEL_22;
  }
  uint64_t v9 = v8;
  long long v10 = 0;
  uint64_t v11 = *(void *)v21;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
      id WeakRetained = objc_loadWeakRetained((id *)(v13 + 16));
      if (WeakRetained != v6)
      {
        long long v15 = WeakRetained;
LABEL_8:

        goto LABEL_9;
      }
      UIControlEvents v16 = controlEvent & ~*(void *)(v13 + 32);

      if (!v16)
      {
        if (*(void *)(v13 + 24)) {
          long long v17 = *(const char **)(v13 + 24);
        }
        else {
          long long v17 = 0;
        }
        long long v15 = NSStringFromSelector(v17);
        if (v15)
        {
          if (!v10)
          {
            long long v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", (void)v20);
          }
          objc_msgSend(v10, "addObject:", v15, (void)v20);
        }
        goto LABEL_8;
      }
LABEL_9:
      ++v12;
    }
    while (v9 != v12);
    uint64_t v18 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    uint64_t v9 = v18;
  }
  while (v18);
LABEL_22:

  return (NSArray *)v10;
}

- (void)enumerateEventHandlers:(void *)iterator
{
  uint64_t v4 = iterator;
  targetActions = self->_targetActions;
  if (targetActions)
  {
    id v6 = (void *)[(NSMutableArray *)targetActions copy];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__UIControl_enumerateEventHandlers___block_invoke;
    v7[3] = &unk_1E52EABE0;
    id v8 = v4;
    [v6 enumerateObjectsUsingBlock:v7];
  }
}

void __36__UIControl_enumerateEventHandlers___block_invoke(uint64_t a1, id *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2[1];
  uint64_t v4 = a2 + 2;
  UIControlEvents v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
  id v8 = target;
  uint64_t v9 = event;
  if (os_variant_has_internal_diagnostics())
  {
    if (!UIApp)
    {
      long long v10 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "UIApp is nil which means we cannot dispatch control actions to their targets. If this assert is hit, we probably got here without UIApplicationMain() being executed, which likely means this code is not running in an app (perhaps a unit test being run without a host app) and will not work as expected.", buf, 2u);
      }
    }
  }
  else if (!UIApp)
  {
    uint64_t v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &sendAction_to_forEvent____s_category) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "UIApp is nil which means we cannot dispatch control actions to their targets. If this assert is hit, we probably got here without UIApplicationMain() being executed, which likely means this code is not running in an app (perhaps a unit test being run without a host app) and will not work as expected.", v12, 2u);
    }
  }
  [(id)UIApp sendAction:action toTarget:v8 fromSender:self forEvent:v9];
}

- (void)sendAction:(UIAction *)action
{
}

- (void)sendActionsForControlEvents:(UIControlEvents)controlEvents
{
}

- (BOOL)canBecomeFirstResponder
{
  if (_UIDeviceHasExternalTouchInput()) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIControl;
  return [(UIResponder *)&v4 canBecomeFirstResponder];
}

- (double)_highlightCornerRadius
{
  [(UIControl *)self _clippedHighlightBounds];
  if (v2 >= v3) {
    double v4 = v3;
  }
  else {
    double v4 = v2;
  }
  return v4 * 0.5;
}

- (BOOL)_hasActionForEventMask:(unint64_t)a3
{
  int v5 = [(NSMutableArray *)self->_targetActions count];
  if (v5 < 1) {
    return 0;
  }
  id v6 = [(NSMutableArray *)self->_targetActions objectAtIndex:0];
  unint64_t v7 = v6[4] & a3;

  if (v7) {
    return 1;
  }
  uint64_t v9 = v5;
  uint64_t v10 = v5;
  uint64_t v11 = 1;
  do
  {
    uint64_t v12 = v11;
    if (v10 == v11) {
      break;
    }
    uint64_t v13 = [(NSMutableArray *)self->_targetActions objectAtIndex:v11];
    unint64_t v14 = v13[4] & a3;

    uint64_t v11 = v12 + 1;
  }
  while (!v14);
  return v12 < v9;
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 0;
}

- (void)_sendActionsForEvents:(unint64_t)a3 withEvent:(id)a4
{
  id v6 = a4;
  unint64_t v7 = _os_activity_create(&dword_1853B0000, "send control actions", MEMORY[0x1E4F144F8], OS_ACTIVITY_FLAG_DEFAULT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v7, &v16);
  if (([(UIControl *)self _controlEventsForActionTriggered] & a3) != 0) {
    +[UIViewController _sendPrepareForTapGesture:]((uint64_t)UIViewController, self);
  }
  [(UIControl *)self _incrementStatisticsForUserActionForEvents:a3];
  id v8 = (void *)[(NSMutableArray *)self->_targetActions copy];
  int v9 = [v8 count];
  if (v9 >= 1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = v9;
    do
    {
      uint64_t v12 = [v8 objectAtIndex:v10];
      uint64_t v13 = (void *)v12;
      if ((*(void *)(v12 + 32) & a3) != 0)
      {
        if (*(void *)(v12 + 8))
        {
          -[UIControl sendAction:](self, "sendAction:");
        }
        else
        {
          if (*(void *)(v12 + 24)) {
            uint64_t v14 = *(void *)(v12 + 24);
          }
          else {
            uint64_t v14 = 0;
          }
          id WeakRetained = objc_loadWeakRetained((id *)(v12 + 16));
          [(UIControl *)self sendAction:v14 to:WeakRetained forEvent:v6];
        }
      }

      ++v10;
    }
    while (v11 != v10);
  }
  os_activity_scope_leave(&v16);
  if (([(UIControl *)self _controlEventsForActionTriggered] & a3) != 0) {
    [(UIControl *)self _sendActionsForEvents:0x2000 withEvent:v6];
  }
}

- (void)_setHighlightOnMouseDown:(BOOL)a3
{
  if (a3) {
    int v3 = 0;
  }
  else {
    int v3 = 64;
  }
  self->_$115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFFFFBF | v3);
}

- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(UIView *)self _touchInsets];
  double v17 = v9 + v16;
  double v19 = v11 + v18;
  double v21 = v13 - (v16 + v20);
  double v23 = v15 - (v18 + v22);
  double v24 = _UIControlMostlyInsideEdgeInsets();
  CGFloat v25 = v19 + v24;
  CGFloat v28 = v21 - (v26 + v27);
  v33.size.double height = v23 - (v24 + v29);
  v33.origin.double x = v17 + v26;
  v33.origin.double y = v25;
  v33.size.double width = v28;
  v32.double x = x;
  v32.double y = y;
  BOOL v30 = CGRectContainsPoint(v33, v32) || -[UIView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y);

  return v30;
}

- (void)_setLastHighlightSuccessful:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFEFFFF | v3);
}

- (BOOL)_wasLastHighlightSuccessful
{
  return *((unsigned char *)&self->_controlFlags + 2) & 1;
}

- (void)_setTouchHasHighlighted:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFDFFFF | v3);
}

- (BOOL)shouldTrack
{
  BOOL v3 = [(UIControl *)self isEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(UIView *)self isUserInteractionEnabled];
  }
  return v3;
}

- (BOOL)touchDragged
{
  return (*(unsigned char *)&self->_controlFlags >> 3) & 1;
}

- (void)setRequiresDisplayOnTracking:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFFFFEF | v3);
}

- (BOOL)requiresDisplayOnTracking
{
  return (*(unsigned char *)&self->_controlFlags >> 4) & 1;
}

- (BOOL)hasOneOrMoreTargets
{
  return [(NSMutableArray *)self->_targetActions count] != 0;
}

- (void)removeTarget:(id)a3 forEvents:(int)a4
{
}

- (void)setTracking:(BOOL)a3
{
  if (((((*(_DWORD *)&self->_controlFlags & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v3 = 2;
    }
    else {
      int v3 = 0;
    }
    self->_$115ED1BCE1FB1BC1A4A0E4C8874C5931 controlFlags = ($115ED1BCE1FB1BC1A4A0E4C8874C5931)(*(_DWORD *)&self->_controlFlags & 0xFFFFFFFD | v3);
    if (a3) {
      [(UIControl *)self _beginInteractionDurationStatisticMeasurements];
    }
    else {
      [(UIControl *)self _commitInteractionDurationStatisticMeasurements];
    }
  }
}

- (void)_unhighlight
{
}

- (BOOL)canBecomeFocused
{
  int v3 = [(UIView *)self _focusBehavior];
  char v4 = [v3 controlCanBecomeFocused:self];

  return v4 & [(UIControl *)self isEnabled];
}

- (id)_systemDefaultFocusGroupIdentifier
{
  int v3 = [(UIView *)self _focusBehavior];
  char v4 = [v3 focusGroupContainmentBehavior];

  if ((v4 & 0x10) != 0)
  {
    int v5 = _UIFocusGroupIdentifierForInstance(self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIControl;
    int v5 = [(UIView *)&v7 _systemDefaultFocusGroupIdentifier];
  }
  return v5;
}

- (void)_diagnoseFocusabilityForReport:(id)a3
{
  id v5 = a3;
  if (([(UIControl *)self state] & 2) != 0)
  {
    char v4 = +[_UIDebugIssue issueWithDescription:@"This control is disabled."];
    [v5 addIssue:v4];
  }
}

- (int64_t)_focusedSound
{
  return 1;
}

- (unint64_t)_stateForFocusUpdateContext:(id)a3
{
  id v4 = a3;
  UIControlState v5 = [(UIControl *)self state];
  if (v4)
  {
    id v6 = [v4 nextFocusedView];
    BOOL v7 = v6 == self;
  }
  else
  {
    BOOL v7 = [(UIView *)self isFocused];
  }
  uint64_t v8 = 8;
  if (!v7) {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v8 | v5 & 0xFFFFFFFFFFFFFFF7;

  return v9;
}

- (BOOL)_accessibilityShouldActivateOnHUDLift
{
  return 0;
}

- (BOOL)isSymbolAnimationEnabled
{
  return (*((unsigned __int8 *)&self->_controlFlags + 2) >> 2) & 1;
}

- (BOOL)isPointerInteractionEnabled
{
  double v2 = [(UIControl *)self pointerInteraction];
  char v3 = [v2 isEnabled];

  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return 0;
}

- (void)_setImplicitHoverStyle:(id)a3
{
}

- (NSString)toolTip
{
  return 0;
}

- (UIToolTipInteraction)toolTipInteraction
{
  return 0;
}

- (id)_contextMenuInteraction
{
  if ((*((unsigned char *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    double v2 = objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
  }
  else
  {
    double v2 = 0;
  }
  return v2;
}

- (CGPoint)menuAttachmentPointForConfiguration:(UIContextMenuConfiguration *)configuration
{
  id v4 = configuration;
  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(UIView *)self window];
  -[UIView convertRect:toView:](self, "convertRect:toView:", v13, v6, v8, v10, v12);
  double v15 = v14;
  double v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  LODWORD(v13) = [(UIContextMenuConfiguration *)v4 prefersHorizontalAttachment];
  double v22 = [(UIView *)self window];
  double v23 = v22;
  if (v13) {
    double v24 = _UIControlMenuAttachmentPointForRectInContainerForHorizontalAttachment(v22, v15, v17, v19, v21);
  }
  else {
    double v24 = _UIControlMenuAttachmentPointForRectInContainer(v22, v15, v17, v19, v21);
  }
  double v26 = v24;
  double v27 = v25;

  double v28 = v26;
  double v29 = v27;
  result.double y = v29;
  result.double x = v28;
  return result;
}

- (id)_proxySender
{
  if ((*((unsigned char *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    double v2 = objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
  }
  else
  {
    double v2 = 0;
  }
  char v3 = [v2 _proxySender];

  return v3;
}

- (void)_setProxySender:(id)a3
{
  id v5 = a3;
  if ((*((unsigned char *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    id v4 = objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
  }
  else
  {
    id v4 = 0;
  }
  [v4 _setProxySender:v5];
}

- (UIContextMenuConfiguration)contextMenuInteraction:(UIContextMenuInteraction *)interaction configurationForMenuAtLocation:(CGPoint)location
{
  return 0;
}

- (UITargetedPreview)contextMenuInteraction:(UIContextMenuInteraction *)interaction previewForHighlightingMenuWithConfiguration:(UIContextMenuConfiguration *)configuration
{
  return 0;
}

- (UITargetedPreview)contextMenuInteraction:(UIContextMenuInteraction *)interaction previewForDismissingMenuWithConfiguration:(UIContextMenuConfiguration *)configuration
{
  return 0;
}

- (void)contextMenuInteraction:(UIContextMenuInteraction *)interaction willEndForConfiguration:(UIContextMenuConfiguration *)configuration animator:(id)animator
{
  double v11 = interaction;
  double v8 = configuration;
  id v9 = animator;
  if ((*((unsigned char *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
    double v10 = (UIContextMenuInteraction *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v10 = 0;
  }

  if (v8 && v10 == v11) {
    [(UIControl *)self _setHasActiveMenuPresentation:0];
  }
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((*((unsigned char *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }

  if (v8 == v6)
  {
    if (dyld_program_sdk_at_least())
    {
      double v10 = [(UIView *)self _containingScrollView];
      BOOL v11 = v10 != 0;
    }
    else
    {
      BOOL v11 = 0;
    }
    id v9 = _UIControlMenuSupportDefaultMenuStyle(v11);
    double v12 = [(UIControl *)self contextMenuInteraction];
    double v13 = [(UIControl *)self contextMenuInteraction:v12 previewForHighlightingMenuWithConfiguration:v7];

    [(UIControl *)self menuAttachmentPointForConfiguration:v7];
    double v15 = v14;
    double v17 = v16;
    if ([v7 prefersHorizontalAttachment]) {
      _UIControlMenuSupportUpdateStyleWithHorizontalPreference(v9, self, v13, v15, v17);
    }
    else {
      _UIControlMenuSupportUpdateStyle(v9, self, v13, v15, v17);
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_contextMenuInteraction:(id)a3 configuration:(id)a4 interactionEffectForTargetedPreview:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((*((unsigned char *)&self->_controlFlags + 2) & 0x20) != 0)
  {
    objc_getAssociatedObject(self, &_UIControlContextMenuInteractionKey);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  if (v11 == v8)
  {
    double v12 = +[_UINullClickHighlightEffect effectWithPreview:v10 continuingFromPreview:0];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (void)_contextMenuInteraction:(id)a3 willBeginWithConfiguration:(id)a4
{
  if (a4)
  {
    [(UIControl *)self _setHasActiveMenuPresentation:1];
    [(UIControl *)self sendActionsForControlEvents:0x4000];
  }
}

- (int64_t)_sceneDraggingBehaviorOnPan
{
  return 2;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = -[UIControl _safeHoverStyle](self);
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIView *)self hoverStyle];
    }
    else {
    id v6 = +[UIPointerStyle _makeStyleWithHoverStyle:v5 view:self convertAutomatic:0];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (int64_t)_requiredButtonMask
{
  return self->_requiredButtonMask;
}

- (void)_setRequiredButtonMask:(int64_t)a3
{
  self->_requiredButtonMask = a3;
}

- (void)_connectInterfaceBuilderEventConnection:(id)a3
{
  id v4 = a3;
  id v7 = [v4 target];
  uint64_t v5 = [v4 action];
  uint64_t v6 = [v4 eventMask];

  [(UIControl *)self addTarget:v7 action:v5 forControlEvents:v6];
}

- (id)__scalarStatisticsForUserTouchUpInsideEvent
{
  return 0;
}

- (id)__scalarStatisticsForUserValueChangedEvent
{
  return 0;
}

- (id)__distributionStatisticsForUserInteractionDuration
{
  return 0;
}

- (id)_scalarStatisticsForUserTouchUpInsideEvent
{
  if (_configureDefaultStatisticHandling_onceToken != -1) {
    dispatch_once(&_configureDefaultStatisticHandling_onceToken, &__block_literal_global_13_4);
  }
  return [(UIControl *)self __scalarStatisticsForUserTouchUpInsideEvent];
}

- (id)_scalarStatisticsForUserValueChangedEvent
{
  if (_configureDefaultStatisticHandling_onceToken != -1) {
    dispatch_once(&_configureDefaultStatisticHandling_onceToken, &__block_literal_global_13_4);
  }
  return [(UIControl *)self __scalarStatisticsForUserValueChangedEvent];
}

- (id)_distributionStatisticsForUserInteractionDuration
{
  if (_configureDefaultStatisticHandling_onceToken != -1) {
    dispatch_once(&_configureDefaultStatisticHandling_onceToken, &__block_literal_global_13_4);
  }
  return [(UIControl *)self __distributionStatisticsForUserInteractionDuration];
}

- (void)_incrementStatisticsForUserActionForEvents:(unint64_t)a3
{
  __int16 v3 = a3;
  if (_configureDefaultStatisticHandling_onceToken == -1)
  {
    if ((a3 & 0x40) == 0) {
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&_configureDefaultStatisticHandling_onceToken, &__block_literal_global_13_4);
    if ((v3 & 0x40) == 0) {
      goto LABEL_6;
    }
  }
  uint64_t v5 = [(UIControl *)self _scalarStatisticsForUserTouchUpInsideEvent];
  uint64_t v6 = v5;
  if (v5) {
    [v5 incrementValueBy:1];
  }

LABEL_6:
  if ((v3 & 0x1000) != 0)
  {
    id v7 = [(UIControl *)self _scalarStatisticsForUserValueChangedEvent];
    if (v7)
    {
      id v8 = v7;
      [v7 incrementValueBy:1];
      id v7 = v8;
    }
  }
}

- (void)_beginInteractionDurationStatisticMeasurements
{
  if (_configureDefaultStatisticHandling_onceToken != -1) {
    dispatch_once(&_configureDefaultStatisticHandling_onceToken, &__block_literal_global_13_4);
  }
  __int16 v3 = [(UIControl *)self _distributionStatisticsForUserInteractionDuration];
  if (v3)
  {
    id v4 = v3;
    [v3 startTimingForObject:self];
    __int16 v3 = v4;
  }
}

- (void)_commitInteractionDurationStatisticMeasurements
{
  if (_configureDefaultStatisticHandling_onceToken != -1) {
    dispatch_once(&_configureDefaultStatisticHandling_onceToken, &__block_literal_global_13_4);
  }
  __int16 v3 = [(UIControl *)self _distributionStatisticsForUserInteractionDuration];
  if (v3)
  {
    id v4 = v3;
    [v3 recordTimingForObject:self];
    __int16 v3 = v4;
  }
}

@end
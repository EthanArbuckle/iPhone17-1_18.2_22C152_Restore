@interface UIPencilInteraction
+ (BOOL)hasSeenPencilPairingUI;
+ (BOOL)hasUsedPassivePencil;
+ (BOOL)prefersHoverToolPreview;
+ (BOOL)prefersPencilOnlyDrawing;
+ (UIPencilPreferredAction)preferredTapAction;
+ (int64_t)preferredSqueezeAction;
+ (void)_setHasUsedPassivePencil:(BOOL)a3;
+ (void)_setPrefersPencilOnlyDrawing:(BOOL)a3;
- (BOOL)_shouldReceiveGestureType:(unint64_t)a3;
- (BOOL)isEnabled;
- (NSString)debugDescription;
- (UIHoverGestureRecognizer)_hoverGestureRecognizer;
- (UIPencilHoverPose)_hoverPoseForEvent:(uint64_t)a1;
- (UIPencilInteraction)init;
- (UIPencilInteraction)initWithDelegate:(id)a3;
- (UIView)view;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)delegate;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)_internalShouldReceiveEvent:(unsigned char *)a1;
- (uint64_t)_updateLastKnownHoverStateFromGesture:(uint64_t)result;
- (unint64_t)_dispatchBehavior;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_handleHoverGestureRecognizer:(id)a3;
- (void)_installHoverGestureIfNeeded;
- (void)_performCallbacksWithEvent:(unsigned char *)a1;
- (void)_registerWithEventIfAble;
- (void)_sendSqueezeFromEvent:(unsigned char *)a1;
- (void)_sendTapFromEvent:(unsigned char *)a1;
- (void)_uninstallHoverGestureIfNeeded;
- (void)_unregisterFromEvent;
- (void)_willMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_windowDidMoveToScene:(id)a3;
- (void)_windowWillMoveToScene:(id)a3;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setEnabled:(BOOL)enabled;
- (void)willMoveToView:(id)a3;
@end

@implementation UIPencilInteraction

+ (UIPencilPreferredAction)preferredTapAction
{
  return +[_UIPencilPreferences preferredTapAction]();
}

+ (int64_t)preferredSqueezeAction
{
  return +[_UIPencilPreferences preferredSqueezeAction]();
}

+ (BOOL)prefersPencilOnlyDrawing
{
  return +[_UIPencilPreferences prefersPencilOnlyDrawing]();
}

+ (void)_setPrefersPencilOnlyDrawing:(BOOL)a3
{
}

+ (BOOL)prefersHoverToolPreview
{
  return +[_UIPencilPreferences prefersHoverToolPreview]();
}

+ (BOOL)hasUsedPassivePencil
{
  return +[_UIPencilPreferences hasUsedPassivePencil]();
}

+ (void)_setHasUsedPassivePencil:(BOOL)a3
{
}

+ (BOOL)hasSeenPencilPairingUI
{
  return +[_UIPencilPreferences hasSeenPencilPairingUI]();
}

- (UIPencilInteraction)init
{
  v4.receiver = self;
  v4.super_class = (Class)UIPencilInteraction;
  result = [(UIPencilInteraction *)&v4 init];
  if (result)
  {
    result->_enabled = 1;
    uint64_t v3 = MEMORY[0x1E4F39B00];
    *(_OWORD *)&result->_lastKnownHoverLocation3D.x = *MEMORY[0x1E4F39B00];
    result->_lastKnownHoverLocation3D.z = *(double *)(v3 + 16);
  }
  return result;
}

- (UIPencilInteraction)initWithDelegate:(id)a3
{
  objc_super v4 = [(UIPencilInteraction *)self init];
  v5 = v4;
  if (v4) {
    [(UIPencilInteraction *)v4 setDelegate:a3];
  }
  return v5;
}

- (void)dealloc
{
  -[UIPencilInteraction _unregisterFromEvent]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)UIPencilInteraction;
  [(UIPencilInteraction *)&v3 dealloc];
}

- (void)_unregisterFromEvent
{
  v5[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v5[0] = 0x1ED1601C0;
    v5[1] = 0x1ED1601E0;
    objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
    -[NSNotificationCenter _uiRemoveObserver:names:](v2, (void *)a1, v3);

    *(unsigned char *)(a1 + 8) &= ~2u;
    [*(id *)(a1 + 24) invalidate];
    objc_super v4 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
}

- (unint64_t)_dispatchBehavior
{
  return 0;
}

- (void)setDelegate:(id)delegate
{
  if (objc_opt_respondsToSelector()) {
    char v5 = 4;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)&self->_interactionFlags = *(unsigned char *)&self->_interactionFlags & 0xFB | v5;
  if (objc_opt_respondsToSelector()) {
    char v6 = 8;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_interactionFlags = *(unsigned char *)&self->_interactionFlags & 0xF7 | v6;
  if (objc_opt_respondsToSelector()) {
    char v7 = 16;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)&self->_interactionFlags = *(unsigned char *)&self->_interactionFlags & 0xEF | v7;
  if (objc_opt_respondsToSelector()) {
    char v8 = 32;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_interactionFlags = *(unsigned char *)&self->_interactionFlags & 0xDF | v8;
  if (objc_opt_respondsToSelector()) {
    char v9 = 64;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)&self->_interactionFlags = *(unsigned char *)&self->_interactionFlags & 0xBF | v9;
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void)_sendTapFromEvent:(unsigned char *)a1
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    objc_super v4 = [a1 delegate];
    if ((a1[8] & 8) != 0)
    {
      char v6 = -[UIPencilInteraction _hoverPoseForEvent:]((uint64_t)a1, a2);
      self;
      char v7 = [UIPencilInteractionTap alloc];
      [a2 timestamp];
      char v9 = -[UIPencilInteractionTap _initWithTimestamp:hoverPose:](v7, v6, v8);

      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("PencilInteraction", &_MergedGlobals_1211);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v17 = *(id *)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = [v9 succinctDescription];
          v19 = NSString;
          v20 = a1;
          v21 = (objc_class *)objc_opt_class();
          v22 = NSStringFromClass(v21);
          v23 = [v19 stringWithFormat:@"<%@: %p>", v22, v20];

          v24 = v23;
          id v25 = v4;
          if (v25)
          {
            v26 = NSString;
            v27 = (objc_class *)objc_opt_class();
            v28 = NSStringFromClass(v27);
            v29 = [v26 stringWithFormat:@"<%@: %p>", v28, v25];
          }
          else
          {
            v29 = @"(nil)";
          }

          *(_DWORD *)buf = 138412802;
          id v56 = v18;
          __int16 v57 = 2112;
          v58 = v24;
          __int16 v59 = 2112;
          v60 = v29;
          _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Calling pencilInteraction:didReceiveTap: %@; interaction: %@; delegate: %@",
            buf,
            0x20u);
        }
      }
      [v4 pencilInteraction:a1 didReceiveTap:v9];
    }
    else
    {
      if ((a1[8] & 0x10) == 0)
      {
        if ((a1[8] & 4) != 0)
        {
          unint64_t v5 = __UILogGetCategoryCachedImpl("PencilInteraction", &qword_1EB262D50);
          if (*(unsigned char *)v5)
          {
            v43 = *(id *)(v5 + 8);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              v44 = NSString;
              v45 = a1;
              v46 = (objc_class *)objc_opt_class();
              v47 = NSStringFromClass(v46);
              v48 = [v44 stringWithFormat:@"<%@: %p>", v47, v45];

              id v49 = v48;
              id v50 = v4;
              if (v50)
              {
                v51 = NSString;
                v52 = (objc_class *)objc_opt_class();
                v53 = NSStringFromClass(v52);
                v54 = [v51 stringWithFormat:@"<%@: %p>", v53, v50];
              }
              else
              {
                v54 = @"(nil)";
              }

              *(_DWORD *)buf = 138412546;
              id v56 = v49;
              __int16 v57 = 2112;
              v58 = v54;
              _os_log_impl(&dword_1853B0000, v43, OS_LOG_TYPE_ERROR, "Calling pencilInteractionDidTap: %@; delegate: %@",
                buf,
                0x16u);
            }
          }
          [v4 pencilInteractionDidTap:a1];
        }
        goto LABEL_15;
      }
      char v9 = -[UIPencilInteraction _hoverPoseForEvent:]((uint64_t)a1, a2);
      v11 = +[_UIPencilHoverState _hoverStateFromHoverPose:]((uint64_t)_UIPencilHoverState, (uint64_t)v9);
      self;
      v12 = [_UIPencilInteractionTap alloc];
      [a2 timestamp];
      if (v12)
      {
        v14 = -[UIPencilInteractionTap _initWithTimestamp:hoverPose:](v12, v11, v13);
        v15 = v14;
        if (v14) {
          objc_storeStrong(v14 + 3, v11);
        }
      }
      else
      {
        v15 = 0;
      }

      unint64_t v16 = __UILogGetCategoryCachedImpl("PencilInteraction", &qword_1EB262D48);
      if (*(unsigned char *)v16)
      {
        v30 = *(id *)(v16 + 8);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = [v15 succinctDescription];
          v32 = NSString;
          v33 = a1;
          v34 = (objc_class *)objc_opt_class();
          v35 = NSStringFromClass(v34);
          v36 = [v32 stringWithFormat:@"<%@: %p>", v35, v33];

          v37 = v36;
          id v38 = v4;
          if (v38)
          {
            v39 = NSString;
            v40 = (objc_class *)objc_opt_class();
            v41 = NSStringFromClass(v40);
            v42 = [v39 stringWithFormat:@"<%@: %p>", v41, v38];
          }
          else
          {
            v42 = @"(nil)";
          }

          *(_DWORD *)buf = 138412802;
          id v56 = v31;
          __int16 v57 = 2112;
          v58 = v37;
          __int16 v59 = 2112;
          v60 = v42;
          _os_log_impl(&dword_1853B0000, v30, OS_LOG_TYPE_ERROR, "Calling _pencilInteraction:didReceiveTap: %@; interaction: %@; delegate: %@",
            buf,
            0x20u);
        }
      }
      [v4 _pencilInteraction:a1 didReceiveTap:v15];
    }
LABEL_15:
  }
}

- (UIPencilHoverPose)_hoverPoseForEvent:(uint64_t)a1
{
  uint64_t v3 = [a2 subtype];
  BOOL v4 = v3 != 251;
  if ((unint64_t)([*(id *)(a1 + 40) state] - 4) >= 0xFFFFFFFFFFFFFFFDLL) {
    BOOL v4 = 0;
  }
  if (v3 == 251) {
    char v5 = CAPoint3DEqualToPoint();
  }
  else {
    char v5 = 0;
  }
  char v6 = 0;
  if (*(void *)(a1 + 40)) {
    char v7 = v4;
  }
  else {
    char v7 = 1;
  }
  if ((v7 & 1) == 0 && (v5 & 1) == 0)
  {
    char v6 = [UIPencilHoverPose alloc];
    if (v6)
    {
      v10.receiver = v6;
      v10.super_class = (Class)UIPencilHoverPose;
      char v6 = (UIPencilHoverPose *)objc_msgSendSuper2(&v10, sel_init);
      if (v6)
      {
        double v8 = *(double *)(a1 + 120);
        *(_OWORD *)&v6->_location3D.x = *(_OWORD *)(a1 + 104);
        v6->_location3D.z = v8;
        v6->_zOffset = *(double *)(a1 + 48);
        v6->_azimuthAngle = *(double *)(a1 + 56);
        v6->_azimuthUnitVector = *(CGVector *)(a1 + 88);
        v6->_altitudeAngle = *(double *)(a1 + 64);
        v6->_rollAngle = *(double *)(a1 + 72);
      }
    }
  }
  return v6;
}

- (void)_sendSqueezeFromEvent:(unsigned char *)a1
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    BOOL v4 = [a1 delegate];
    char v5 = -[UIPencilInteraction _hoverPoseForEvent:]((uint64_t)a1, a2);
    if ((a1[8] & 0x20) != 0)
    {
      self;
      v14 = [UIPencilInteractionSqueeze alloc];
      [a2 timestamp];
      if (a2)
      {
        uint64_t v16 = *((void *)a2 + 19);
        double v17 = a2[20];
      }
      else
      {
        uint64_t v16 = 0;
        double v17 = 0.0;
      }
      v12 = (void *)-[UIPencilInteractionSqueeze _initWithTimestamp:eventPhase:normalizedForceVelocity:hoverPose:](v14, v16, v5, v15, v17);
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("PencilInteraction", &qword_1EB262D58);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        v19 = *(id *)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v45 = [v12 succinctDescription];
          v20 = NSString;
          v21 = a1;
          v22 = (objc_class *)objc_opt_class();
          v23 = NSStringFromClass(v22);
          v24 = [v20 stringWithFormat:@"<%@: %p>", v23, v21];

          id v25 = v24;
          id v26 = v4;
          if (v26)
          {
            v27 = NSString;
            v28 = (objc_class *)objc_opt_class();
            v29 = NSStringFromClass(v28);
            v30 = v26;
            v31 = [v27 stringWithFormat:@"<%@: %p>", v29, v26];
          }
          else
          {
            v30 = 0;
            v31 = @"(nil)";
          }

          *(_DWORD *)buf = 138412802;
          v47 = v45;
          __int16 v48 = 2112;
          id v49 = v25;
          __int16 v50 = 2112;
          v51 = v31;
          _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "Calling pencilInteraction:didReceiveSqueeze: %@; interaction: %@; delegate: %@",
            buf,
            0x20u);
        }
      }
      [v4 pencilInteraction:a1 didReceiveSqueeze:v12];
      goto LABEL_14;
    }
    if ((a1[8] & 0x40) == 0)
    {
LABEL_15:

      return;
    }
    char v6 = +[_UIPencilHoverState _hoverStateFromHoverPose:]((uint64_t)_UIPencilHoverState, (uint64_t)v5);
    self;
    char v7 = [_UIPencilInteractionSqueeze alloc];
    [a2 timestamp];
    if (a2)
    {
      uint64_t v9 = *((void *)a2 + 19);
      double v10 = a2[20];
      if (v7) {
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v9 = 0;
      double v10 = 0.0;
      if (v7)
      {
LABEL_6:
        uint64_t v11 = -[UIPencilInteractionSqueeze _initWithTimestamp:eventPhase:normalizedForceVelocity:hoverPose:](v7, v9, v6, v8, v10);
        v12 = (void *)v11;
        if (v11) {
          objc_storeStrong((id *)(v11 + 40), v6);
        }
        goto LABEL_8;
      }
    }
    v12 = 0;
LABEL_8:

    unint64_t v13 = __UILogGetCategoryCachedImpl("PencilInteraction", &qword_1EB262D60);
    if (*(unsigned char *)v13)
    {
      v32 = *(id *)(v13 + 8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = [v12 succinctDescription];
        v34 = NSString;
        v35 = a1;
        v36 = (objc_class *)objc_opt_class();
        v37 = NSStringFromClass(v36);
        id v38 = [v34 stringWithFormat:@"<%@: %p>", v37, v35];

        id v39 = v38;
        id v40 = v4;
        if (v40)
        {
          v41 = NSString;
          v42 = (objc_class *)objc_opt_class();
          v43 = NSStringFromClass(v42);
          v44 = [v41 stringWithFormat:@"<%@: %p>", v43, v40];
        }
        else
        {
          v44 = @"(nil)";
        }

        *(_DWORD *)buf = 138412802;
        v47 = v33;
        __int16 v48 = 2112;
        id v49 = v39;
        __int16 v50 = 2112;
        v51 = v44;
        _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_ERROR, "Calling _pencilInteraction:didReceiveSqueeze: %@; interaction: %@; delegate: %@",
          buf,
          0x20u);
      }
    }
    [v4 _pencilInteraction:a1 didReceiveSqueeze:v12];
LABEL_14:

    goto LABEL_15;
  }
}

- (void)_performCallbacksWithEvent:(unsigned char *)a1
{
  if (!a1) {
    return;
  }
  uint64_t v4 = [a2 subtype];
  if (v4 == 251)
  {
    -[UIPencilInteraction _sendSqueezeFromEvent:](a1, (double *)a2);
    if (!a2) {
      return;
    }
    goto LABEL_8;
  }
  if (v4 == 250) {
    -[UIPencilInteraction _sendTapFromEvent:](a1, a2);
  }
  if (a2)
  {
LABEL_8:
    if ((unint64_t)(a2[19] - 3) <= 1)
    {
      -[UIPencilInteraction _updateLastKnownHoverStateFromGesture:]((uint64_t)a1, 0);
    }
  }
}

- (uint64_t)_updateLastKnownHoverStateFromGesture:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (a2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(result + 16));
      [a2 _location3DInView:WeakRetained];
      *(void *)(v3 + 104) = v5;
      *(void *)(v3 + 112) = v6;
      *(void *)(v3 + 120) = v7;
    }
    else
    {
      uint64_t v8 = MEMORY[0x1E4F39B00];
      *(_OWORD *)(result + 104) = *MEMORY[0x1E4F39B00];
      *(void *)(result + 120) = *(void *)(v8 + 16);
    }
    [a2 zOffset];
    *(void *)(v3 + 48) = v9;
    id v10 = objc_loadWeakRetained((id *)(v3 + 16));
    [a2 azimuthAngleInView:v10];
    *(void *)(v3 + 56) = v11;

    id v12 = objc_loadWeakRetained((id *)(v3 + 16));
    [a2 azimuthUnitVectorInView:v12];
    *(void *)(v3 + 88) = v13;
    *(void *)(v3 + 96) = v14;

    [a2 altitudeAngle];
    *(void *)(v3 + 64) = v15;
    result = [a2 _rollAngle];
    *(void *)(v3 + 72) = v16;
  }
  return result;
}

- (BOOL)_shouldReceiveGestureType:(unint64_t)a3
{
  return 1;
}

- (uint64_t)_internalShouldReceiveEvent:(unsigned char *)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = [a2 subtype];
  if (v3 == 250)
  {
    if ((a1[8] & 0x1C) != 0)
    {
      uint64_t v4 = 0;
      goto LABEL_8;
    }
    return 0;
  }
  if (v3 != 251 || (a1[8] & 0x60) == 0) {
    return 0;
  }
  uint64_t v4 = 1;
LABEL_8:
  return [a1 _shouldReceiveGestureType:v4];
}

- (void)_handleHoverGestureRecognizer:(id)a3
{
  hoverGestureRecognizer = a3;
  if (self->_hoverGestureRecognizer != a3)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UIPencilInteraction.m", 895, @"%s: Received updates from an unknown hover gesture recognizer: %@", "-[UIPencilInteraction _handleHoverGestureRecognizer:]", hoverGestureRecognizer object file lineNumber description];

    hoverGestureRecognizer = self->_hoverGestureRecognizer;
  }
  uint64_t v5 = [hoverGestureRecognizer state];
  if (v5 < 3 || v5 == 4)
  {
    uint64_t v6 = self->_hoverGestureRecognizer;
    -[UIPencilInteraction _updateLastKnownHoverStateFromGesture:]((uint64_t)self, v6);
  }
}

- (void)_installHoverGestureIfNeeded
{
  if (a1)
  {
    v2 = (id *)(a1 + 16);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));

    if (WeakRetained)
    {
      if (!*(void *)(a1 + 40))
      {
        uint64_t v4 = [[UIHoverGestureRecognizer alloc] initWithTarget:a1 action:sel__handleHoverGestureRecognizer_];
        uint64_t v5 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = v4;

        uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"pencilInteraction.hover.%p", a1);
        [*(id *)(a1 + 40) setName:v6];

        [*(id *)(a1 + 40) setDelegate:a1];
        -[UIHoverGestureRecognizer _setAllowedTouchTypes:](*(id *)(a1 + 40), (uint64_t)&unk_1ED3F0EF8);
      }
      id v7 = objc_loadWeakRetained(v2);
      [v7 addGestureRecognizer:*(void *)(a1 + 40)];
    }
  }
}

- (void)_uninstallHoverGestureIfNeeded
{
  if (a1)
  {
    v2 = (id *)(a1 + 16);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    if (WeakRetained)
    {
      uint64_t v4 = *(void *)(a1 + 40);

      if (v4)
      {
        -[UIPencilInteraction _updateLastKnownHoverStateFromGesture:](a1, 0);
        id v5 = objc_loadWeakRetained(v2);
        [v5 removeGestureRecognizer:*(void *)(a1 + 40)];

        uint64_t v6 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = 0;
      }
    }
  }
}

- (void)_registerWithEventIfAble
{
  if (!a1) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  id v10 = [WeakRetained _window];

  uint64_t v3 = [v10 _windowHostingScene];
  char v4 = *(unsigned char *)(a1 + 8);
  if (v3)
  {
    *(unsigned char *)(a1 + 8) = v4 & 0xFD;
    id v5 = [(id)UIApp _mainEventEnvironment];
    id v6 = -[UIEventEnvironment _pencilEventForWindow:](v5, v10);

    uint64_t v7 = -[_UIPencilEvent registerInteraction:]((uint64_t)v6, a1);
    uint64_t v8 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v7;

    if ((v4 & 2) != 0) {
      goto LABEL_9;
    }
LABEL_7:
    if (v10)
    {
      uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 addObserver:a1 selector:sel__windowWillMoveToScene_ name:0x1ED1601C0 object:v10];
      [v9 addObserver:a1 selector:sel__windowDidMoveToScene_ name:0x1ED1601E0 object:v10];
    }
    goto LABEL_9;
  }
  if (v10)
  {
    *(unsigned char *)(a1 + 8) = v4 | 2;
    if ((v4 & 2) == 0) {
      goto LABEL_7;
    }
  }
LABEL_9:
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    if (enabled)
    {
      -[UIPencilInteraction _installHoverGestureIfNeeded]((uint64_t)self);
      -[UIPencilInteraction _registerWithEventIfAble]((uint64_t)self);
    }
    else
    {
      -[UIPencilInteraction _uninstallHoverGestureIfNeeded]((uint64_t)self);
      -[UIPencilInteraction _unregisterFromEvent]((uint64_t)self);
    }
  }
}

- (void)willMoveToView:(id)a3
{
  if (self)
  {
    -[UIPencilInteraction _uninstallHoverGestureIfNeeded]((uint64_t)self);
    -[UIPencilInteraction _unregisterFromEvent]((uint64_t)self);
  }
  objc_storeWeak((id *)&self->_view, 0);
}

- (void)didMoveToView:(id)a3
{
  id v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    BOOL enabled = self->_enabled;

    if (enabled)
    {
      -[UIPencilInteraction _installHoverGestureIfNeeded]((uint64_t)self);
      -[UIPencilInteraction _registerWithEventIfAble]((uint64_t)self);
    }
  }
}

- (void)_willMoveFromWindow:(id)a3 toWindow:(id)a4
{
  if (!self->_enabled) {
    return;
  }
  uint64_t v7 = [a4 _windowHostingScene];
  if (self->_eventRegistrationToken)
  {
    if (a3 && a4 && v7)
    {
      *(unsigned char *)&self->_interactionFlags |= 1u;
LABEL_7:
      uint64_t v8 = v7;
      -[UIPencilInteraction _unregisterFromEvent]((uint64_t)self);
      uint64_t v7 = v8;
      goto LABEL_11;
    }
    if (!a4 || !v7) {
      goto LABEL_7;
    }
  }
LABEL_11:
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  if (!self->_enabled) {
    return;
  }
  id v16 = [a3 _windowHostingScene];
  id v7 = [a4 _windowHostingScene];
  eventRegistrationToken = self->_eventRegistrationToken;
  unsigned __int8 interactionFlags = self->_interactionFlags;
  int v10 = (a3 != 0) & interactionFlags;
  if (!a4) {
    int v10 = 0;
  }
  if (!((unint64_t)a3 | (unint64_t)eventRegistrationToken)) {
    int v10 = 1;
  }
  if (eventRegistrationToken) {
    BOOL v11 = v16 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  int v14 = !v11 && v7 != 0 && v16 != v7;
  if (v10 == 1 && v7 != 0)
  {
    *(unsigned char *)&self->_unsigned __int8 interactionFlags = interactionFlags & 0xFE;
LABEL_30:
    -[UIPencilInteraction _registerWithEventIfAble]((uint64_t)self);
    goto LABEL_31;
  }
  if (!a3 && a4 && !eventRegistrationToken && !v7) {
    goto LABEL_30;
  }
  if (v14)
  {
    -[UIPencilInteraction _unregisterFromEvent]((uint64_t)self);
    goto LABEL_30;
  }
LABEL_31:
}

- (void)_windowWillMoveToScene:(id)a3
{
  id v5 = [a3 object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_7;
  }
  uint64_t v11 = [a3 object];

  if (!v11)
  {
LABEL_7:
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v7 = [WeakRetained _window];

  uint64_t v8 = (void *)v11;
  if (v7 == (void *)v11)
  {
    eventRegistrationToken = self->_eventRegistrationToken;
    if (eventRegistrationToken)
    {
      [(BSInvalidatable *)eventRegistrationToken invalidate];
      int v10 = self->_eventRegistrationToken;
      self->_eventRegistrationToken = 0;

      uint64_t v8 = (void *)v11;
      *(unsigned char *)&self->_interactionFlags |= 2u;
    }
  }
LABEL_8:
}

- (void)_windowDidMoveToScene:(id)a3
{
  id v5 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [a3 object];

    id v6 = (void *)v9;
    if (v9)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
      uint64_t v8 = [WeakRetained _window];

      id v6 = (void *)v9;
      if (v8 == (void *)v9 && !self->_eventRegistrationToken && (*(unsigned char *)&self->_interactionFlags & 2) != 0)
      {
        -[UIPencilInteraction _registerWithEventIfAble]((uint64_t)self);
        id v6 = (void *)v9;
      }
    }
  }
  else
  {

    id v6 = 0;
  }
}

- (NSString)debugDescription
{
  return (NSString *)[(UIPencilInteraction *)self debugDescriptionWithMultilinePrefix:&stru_1ED0E84C0];
}

- (id)succinctDescription
{
  v2 = [(UIPencilInteraction *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_enabled withName:@"enabled"];
  id v5 = objc_loadWeakRetained((id *)&self->_view);
  if (v5)
  {
    id v6 = NSString;
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    uint64_t v9 = [v6 stringWithFormat:@"<%@: %p>", v8, v5];
  }
  else
  {
    uint64_t v9 = @"(nil)";
  }

  id v10 = (id)[v3 appendObject:v9 withName:@"view"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v12)
    {
      uint64_t v13 = NSString;
      int v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      id v16 = [v13 stringWithFormat:@"<%@: %p>", v15, v12];
    }
    else
    {
      id v16 = @"(nil)";
    }

    id v17 = (id)[v3 appendObject:v16 withName:@"delegate"];
  }
  if (os_variant_has_internal_diagnostics())
  {
    if ((*(unsigned char *)&self->_interactionFlags & 0x80000000) != 0)
    {
      unint64_t cachedDispatchBehavior = self->_cachedDispatchBehavior;
    }
    else
    {
      unint64_t cachedDispatchBehavior = [(UIPencilInteraction *)self _dispatchBehavior];
      self->_unint64_t cachedDispatchBehavior = cachedDispatchBehavior;
    }
    if (cachedDispatchBehavior > 2) {
      v20 = &stru_1ED0E84C0;
    }
    else {
      v20 = off_1E5304CD8[cachedDispatchBehavior];
    }
    id v21 = (id)[v3 appendObject:v20 withName:@"dispatchBehavior"];
  }
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(UIPencilInteraction *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(UIPencilInteraction *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  char has_internal_diagnostics = os_variant_has_internal_diagnostics();
  id v6 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v6 setActiveMultilinePrefix:a3];
  id v7 = (id)[v6 appendBool:self->_enabled withName:@"enabled"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__UIPencilInteraction_descriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E52DC3D0;
  id v8 = v6;
  id v13 = v8;
  int v14 = self;
  char v15 = has_internal_diagnostics;
  id v9 = (id)[v8 modifyBody:v12];
  id v10 = v8;

  return v10;
}

void __61__UIPencilInteraction_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 activeMultilinePrefix];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__UIPencilInteraction_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E52DC3D0;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  char v9 = *(unsigned char *)(a1 + 48);
  [v2 appendBodySectionWithName:0 multilinePrefix:v3 block:v6];
}

id __61__UIPencilInteraction_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
  if (v3)
  {
    id v4 = NSString;
    uint64_t v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = [v4 stringWithFormat:@"<%@: %p>", v6, v3];
  }
  else
  {
    id v7 = @"(nil)";
  }

  id v8 = (id)[v2 appendObject:v7 withName:@"view"];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 80));

  if (WeakRetained)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 80));
    if (v11)
    {
      id v12 = NSString;
      id v13 = (objc_class *)objc_opt_class();
      int v14 = NSStringFromClass(v13);
      char v15 = [v12 stringWithFormat:@"<%@: %p>", v14, v11];
    }
    else
    {
      char v15 = @"(nil)";
    }

    id v16 = (id)[v10 appendObject:v15 withName:@"delegate"];
  }
  if (*(unsigned char *)(a1 + 48))
  {
    id v17 = *(void **)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 40);
    if (v18)
    {
      if (*(char *)(v18 + 8) < 0)
      {
        unint64_t v19 = *(void *)(v18 + 32);
      }
      else
      {
        unint64_t v19 = [*(id *)(a1 + 40) _dispatchBehavior];
        *(void *)(v18 + 32) = v19;
      }
      if (v19 > 2) {
        v20 = &stru_1ED0E84C0;
      }
      else {
        v20 = off_1E5304CD8[v19];
      }
    }
    else
    {
      v20 = @"default";
    }
    id v21 = (id)[v17 appendObject:v20 withName:@"dispatchBehavior"];
  }
  id v22 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned char *)(*(void *)(a1 + 40) + 8) & 1 withName:@"registrationPendingDidMoveToWindow" ifEqualTo:1];
  id result = (id)[*(id *)(a1 + 32) appendBool:(*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) >> 1) & 1 withName:@"registrationPendingWindowMoveToScene" ifEqualTo:1];
  if (*(unsigned char *)(a1 + 48))
  {
    id v24 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"registrationToken"];
    id v25 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendPoint3D:withName:", @"lastKnownHoverLocation3D", *(double *)(*(void *)(a1 + 40) + 104), *(double *)(*(void *)(a1 + 40) + 112), *(double *)(*(void *)(a1 + 40) + 120));
    id v26 = (id)[*(id *)(a1 + 32) appendFloat:@"lastKnownHoverZOffset" withName:3 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 48)];
    id v27 = (id)[*(id *)(a1 + 32) appendFloat:@"lastKnownHoverAzimuthAngle" withName:3 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 56)];
    id v28 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendVector:withName:decimalPrecision:", @"lastKnownHoverAzimuthUnitVector", 3, *(double *)(*(void *)(a1 + 40) + 88), *(double *)(*(void *)(a1 + 40) + 96));
    id v29 = (id)[*(id *)(a1 + 32) appendFloat:@"lastKnownHoverAltitudeAngle" withName:3 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 64)];
    return (id)[*(id *)(a1 + 32) appendFloat:@"lastKnownHoverRollAngle" withName:3 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 72)];
  }
  return result;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (UIHoverGestureRecognizer)_hoverGestureRecognizer
{
  return self->_hoverGestureRecognizer;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_eventRegistrationToken, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end
@interface TUIDragController
+ (BOOL)viewSupportsDrag:(id)a3;
+ (id)sharedInstance;
- (BOOL)_dragInteraction:(id)a3 sessionSupportsSystemDrag:(id)a4;
- (BOOL)_dragSession:(id)a3 containsView:(id)a4;
- (BOOL)isDragging;
- (TUIDragController)init;
- (UIColor)dragBackgroundColor;
- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dragInteractionWithActionHandlerDelegate:(id)a3 dragDelegate:(id)a4;
- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3;
- (void)_notifyDelegateOfViewDraggingStateForSession:(id)a3 interaction:(id)a4 dropOperation:(unint64_t)a5;
- (void)_notifyObserversWithSession:(id)a3;
- (void)_setAlpha:(double)a3 forSessionDragItems:(id)a4;
- (void)_updateDraggingState:(BOOL)a3;
- (void)addObserver:(id)a3;
- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)removeObserver:(id)a3;
- (void)setDragBackgroundColor:(id)a3;
@end

@implementation TUIDragController

+ (id)sharedInstance
{
  if (qword_2DF758 != -1) {
    dispatch_once(&qword_2DF758, &stru_256030);
  }
  v2 = (void *)qword_2DF750;

  return v2;
}

- (TUIDragController)init
{
  v7.receiver = self;
  v7.super_class = (Class)TUIDragController;
  v2 = [(TUIDragController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    observers = v3->_observers;
    v3->_observers = (NSMutableArray *)v4;
  }
  return v3;
}

- (void)addObserver:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  [(NSMutableArray *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (void)removeObserver:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  [(NSMutableArray *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (void)_setAlpha:(double)a3 forSessionDragItems:(id)a4
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [a4 items];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v9);
        uint64_t v11 = objc_opt_class();
        v12 = [v10 _privateLocalContext];
        v13 = TUIDynamicCast(v11, v12);

        v14 = [v13 view];
        [v14 setAlpha:a3];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)_updateDraggingState:(BOOL)a3
{
  self->_isDragging = a3;
}

- (id)dragInteractionWithActionHandlerDelegate:(id)a3 dragDelegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[_TUIDragInteraction alloc] initWithDelegate:self];
  [(_TUIDragInteraction *)v8 setActionHandlerDelegate:v7];

  [(_TUIDragInteraction *)v8 setDragDelegate:v6];

  return v8;
}

- (void)_notifyObserversWithSession:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_accessLock);
  id v5 = [(NSMutableArray *)self->_observers copy];
  os_unfair_lock_unlock(&self->_accessLock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) dragController:self dragSessionDidEnd:v4 v11];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_notifyDelegateOfViewDraggingStateForSession:(id)a3 interaction:(id)a4 dropOperation:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_opt_class();
  v22 = v8;
  v21 = TUIDynamicCast(v9, v8);
  v10 = [v21 actionHandlerDelegate];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v24 = v7;
  long long v11 = [v7 items];
  id v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v17 = objc_opt_class();
        long long v18 = [v16 _privateLocalContext];
        v19 = TUIDynamicCast(v17, v18);

        LODWORD(v18) = self->_isDragging;
        v20 = [v19 view];
        if (v18) {
          [v10 didBeginDraggingView:v20];
        }
        else {
          [v10 didEndDraggingView:v20];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  [v10 didEndDragSession:v24 dropOperation:a5];
}

- (BOOL)_dragSession:(id)a3 containsView:(id)a4
{
  id v5 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  [a3 items];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_opt_class();
        id v12 = [v10 _privateLocalContext];
        id v13 = TUIDynamicCast(v11, v12);

        id v14 = [v13 view];

        if (v14 == v5)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 view];
  [v6 locationInView:v8];
  uint64_t v9 = -[TUIDragController dragInteraction:itemsForAddingToSession:withTouchAtPoint:](self, "dragInteraction:itemsForAddingToSession:withTouchAtPoint:", v7, v6);

  return v9;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = objc_opt_class();
  v10 = [v7 _privateLocalContext];
  uint64_t v11 = TUIDynamicCast(v9, v10);

  id v12 = [v11 view];
  objc_opt_class();
  id v13 = TUIPlatformAncestorOfClass(v12);
  id v14 = [v13 feedControllerHost];
  long long v15 = [v14 hostingContainerView];

  long long v16 = [v12 superview];
  [v12 center];
  [v16 convertPoint:v15 toView:];
  double v18 = v17;
  double v20 = v19;

  dragBackgroundColor = self->_dragBackgroundColor;
  v22 = [v8 view];

  v23 = [v22 traitCollection];
  v24 = [(UIColor *)dragBackgroundColor resolvedColorWithTraitCollection:v23];

  long long v25 = sub_132CBC(v7, v15, v24, v18, v20);

  return v25;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  [(TUIDragController *)self _notifyObserversWithSession:v8];
  [(TUIDragController *)self _updateDraggingState:0];
  [(TUIDragController *)self _setAlpha:v8 forSessionDragItems:1.0];
  [(TUIDragController *)self _notifyDelegateOfViewDraggingStateForSession:v8 interaction:v9 dropOperation:a5];
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v9 view];
  id v12 = [v11 hitTest:0 withEvent:x, y];

  uint64_t v13 = objc_opt_class();
  uint64_t v14 = TUIPlatformAncestorOfClassAndProtocol(v12, v13, &OBJC_PROTOCOL___TUIReusableRenderView);
  if (v14)
  {
    long long v15 = (void *)v14;
    v45 = self;
    v46 = v12;
    id v47 = v10;
    v48 = v9;
    while (1)
    {
      id v16 = v15;
      uint64_t v17 = objc_opt_class();
      double v18 = [v16 layoutAttributes];

      double v19 = TUIDynamicCast(v17, v18);

      uint64_t v20 = objc_opt_class();
      v21 = [v19 renderModel];
      v22 = TUIDynamicCast(v20, v21);

      id v23 = v22;
      v24 = sub_1339C8(v23);
      if (v24)
      {
        long long v25 = [_TUIDragTriggerInfo alloc];
        long long v26 = [v23 actionHandler];
        long long v27 = [v26 actionObject];
        long long v28 = [v24 behavior];
        v29 = [v24 arguments];
        v30 = [(_TUIDragTriggerInfo *)v25 initWithActionObject:v27 behavior:v28 arguments:v29];
      }
      else
      {
        v30 = 0;
      }

      uint64_t v31 = [(_TUIDragTriggerInfo *)v30 behavior];
      if (v31) {
        break;
      }
      v32 = [v16 superview];
      uint64_t v33 = objc_opt_class();
      long long v15 = TUIPlatformAncestorOfClassAndProtocol(v32, v33, &OBJC_PROTOCOL___TUIReusableRenderView);

      if (!v15)
      {
        id v16 = 0;
        v34 = 0;
        v35 = 0;
        goto LABEL_15;
      }
    }
    v36 = (void *)v31;
    id v10 = v47;
    if ([(TUIDragController *)v45 _dragSession:v47 containsView:v16])
    {

      v34 = 0;
      v35 = 0;
      id v9 = v48;
      goto LABEL_16;
    }
    uint64_t v37 = objc_opt_class();
    v38 = TUIDynamicCast(v37, v48);
    v39 = [v38 actionHandlerDelegate];

    [v39 didBeginDraggingView:v16];
    v35 = [[_TUIDragPreviewInfo alloc] initWithDragInfo:v30 view:v16];
    v40 = [(_TUIDragTriggerInfo *)v30 actionObject];
    v41 = [(_TUIDragTriggerInfo *)v30 behavior];
    v42 = [(_TUIDragTriggerInfo *)v30 arguments];
    v43 = [v39 dragItemForObject:v40 withName:v41 arguments:v42];

    [v43 _setPrivateLocalContext:v35];
    if (v43)
    {
      v49 = v43;
      v34 = +[NSArray arrayWithObjects:&v49 count:1];
    }
    else
    {
      v34 = 0;
    }
LABEL_15:
    id v10 = v47;
    id v9 = v48;
LABEL_16:
    id v12 = v46;
  }
  else
  {
    id v16 = 0;
    v34 = 0;
    v35 = 0;
  }

  return v34;
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_opt_class();
  id v10 = TUIDynamicCast(v9, v7);
  uint64_t v11 = [v10 dragDelegate];
  id v12 = (char *)[v11 layoutDirection];

  if (v12 == (unsigned char *)&def_141F14 + 2)
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [v8 _privateLocalContext];
    long long v15 = TUIDynamicCast(v13, v14);

    id v16 = [v15 view];
    uint64_t v17 = [v16 window];
    double v18 = [v16 superview];
    [v16 center];
    [v18 convertPoint:v17 toView:];
    double x = v19;
    double y = v21;
  }
  else
  {
    uint64_t v17 = 0;
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }
  dragBackgroundColor = self->_dragBackgroundColor;
  v24 = [v7 view];
  long long v25 = [v24 traitCollection];
  long long v26 = [(UIColor *)dragBackgroundColor resolvedColorWithTraitCollection:v25];

  long long v27 = sub_132CBC(v8, v17, v26, x, y);

  return v27;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  [(TUIDragController *)self _updateDraggingState:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1335F4;
  v13[3] = &unk_256058;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  [v10 addCompletion:v13];
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = objc_opt_class();
  id v11 = [v8 _privateLocalContext];

  id v12 = TUIDynamicCast(v10, v11);

  uint64_t v13 = [v12 view];
  uint64_t v14 = objc_opt_class();
  id v15 = TUIDynamicCast(v14, v9);

  id v16 = [v15 dragDelegate];
  if ([v16 layoutDirection] == (char *)&def_141F14 + 2)
  {
    uint64_t v17 = [v13 window];
  }
  else
  {
    uint64_t v17 = 0;
  }

  [v17 setUserInteractionEnabled:0];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_133808;
  v20[3] = &unk_254FF0;
  id v21 = v13;
  id v22 = v17;
  id v18 = v17;
  id v19 = v13;
  [v7 addCompletion:v20];
}

- (void)_dragInteractionDidCancelLiftWithoutDragging:(id)a3
{
}

- (BOOL)_dragInteraction:(id)a3 sessionSupportsSystemDrag:(id)a4
{
  uint64_t v8 = kUINSUserActivityInternalType;
  id v4 = a4;
  id v5 = +[NSArray arrayWithObjects:&v8 count:1];
  unsigned __int8 v6 = [v4 hasItemsConformingToTypeIdentifiers:v5, v8];

  return v6;
}

+ (BOOL)viewSupportsDrag:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = [v3 layoutAttributes];

  unsigned __int8 v6 = TUIDynamicCast(v4, v5);

  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v6 renderModel];
  id v9 = TUIDynamicCast(v7, v8);

  uint64_t v10 = sub_1339C8(v9);
  LOBYTE(v8) = v10 != 0;

  return (char)v8;
}

- (UIColor)dragBackgroundColor
{
  return self->_dragBackgroundColor;
}

- (void)setDragBackgroundColor:(id)a3
{
}

- (BOOL)isDragging
{
  return self->_isDragging;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragBackgroundColor, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end
@interface _UIContextMenuPanController
- ($9638EFF0CCCAFE90921E224CC361F7AC)menuAnchor;
- (BOOL)_canBeginDraggingWithTranslation:(CAPoint3D)a3 location:(CAPoint3D)a4;
- (BOOL)_canSwipeDownToDismiss;
- (BOOL)_initialPointInPlatterIsValid;
- (BOOL)enabled;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)platterPivotRotationEnabled;
- (CAPoint3D)_rubberBandedTranslationForGestureTranslation:(CAPoint3D)a3;
- (CGPoint)originalMenuCenter;
- (CGPoint)originalPlatterCenter;
- (CGVector)_currentPlatterVelocity;
- (NSArray)accessoryViews;
- (NSArray)detents;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIView)containerView;
- (UIView)menuView;
- (UIView)platterView;
- (UIViewSpringAnimationBehavior)animationBehavior;
- (_UIContextMenuPanController)initWithContainerView:(id)a3 platterView:(id)a4 menuView:(id)a5;
- (_UIContextMenuPanControllerDelegate)delegate;
- (_UIVelocityIntegrator)velocityIntegrator;
- (double)_dragTearOffThreshold;
- (double)_rangeOfMotion;
- (double)_tearOffSpeedMultiplier;
- (id)_createAnimationBehaviorWithCriticalDamping:(BOOL)a3;
- (id)_currentPlatformMetrics;
- (id)criticallyDampedAnimationBehavior;
- (int)_nearestDetentWithTranslation:(CGPoint)a3;
- (int64_t)_userInterfaceIdiom;
- (unint64_t)rubberbandingEdges;
- (void)_animationsForActionsStyleWithLocation:(CAPoint3D)a3 ended:(BOOL)a4;
- (void)_animationsForAnyAttachedAccessoryViews;
- (void)_animationsForPreviewPlusActionsStyleWithTranslation:(CAPoint3D)a3 location:(CAPoint3D)a4;
- (void)_handlePanGesture:(id)a3;
- (void)_updateForGestureWithState:(int64_t)a3 translation:(CAPoint3D)a4 location:(CAPoint3D)a5 allowsDragging:(BOOL)a6;
- (void)_updateForSignificantLayoutChange;
- (void)_updateMenuScrubPathWithLocationIfNecessary:(CGPoint)a3;
- (void)_updatePlatterGestureDebugUIWithTranslation:(CGPoint)a3 location:(CGPoint)a4 invalidate:(BOOL)a5;
- (void)_updateViewPositionsWithTranslation:(CAPoint3D)a3 location:(CAPoint3D)a4 ended:(BOOL)a5 withVelocity:(BOOL)a6;
- (void)moveToDetentPosition:(int64_t)a3 updateScrubPath:(BOOL)a4;
- (void)scrollObservationInteraction:(id)a3 didUpdateWithTranslation:(CGPoint)a4 location:(CGPoint)a5 ended:(BOOL)a6;
- (void)scrollObservationInteraction:(id)a3 willBeginAtLocation:(CGPoint)a4;
- (void)setAccessoryViews:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetents:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setMenuAnchor:(id *)a3;
- (void)setMenuView:(id)a3;
- (void)setOriginalMenuCenter:(CGPoint)a3;
- (void)setOriginalPlatterCenter:(CGPoint)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setPlatterPivotRotationEnabled:(BOOL)a3;
- (void)setPlatterView:(id)a3;
- (void)setRubberbandingEdges:(unint64_t)a3;
- (void)setVelocityIntegrator:(id)a3;
@end

@implementation _UIContextMenuPanController

- (_UIContextMenuPanController)initWithContainerView:(id)a3 platterView:(id)a4 menuView:(id)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)_UIContextMenuPanController;
  v11 = [(_UIContextMenuPanController *)&v31 init];
  v12 = v11;
  if (v11)
  {
    [(_UIContextMenuPanController *)v11 setContainerView:v8];
    [(_UIContextMenuPanController *)v12 setPlatterView:v9];
    [(_UIContextMenuPanController *)v12 setMenuView:v10];
    v13 = [(_UIContextMenuPanController *)v12 containerView];
    v14 = [v13 traitCollection];
    uint64_t v15 = [v14 userInterfaceIdiom];

    v16 = off_1E52D5060;
    if (v15 != 6) {
      v16 = off_1E52D4348;
    }
    v17 = (void *)[objc_alloc(*v16) initWithTarget:v12 action:sel__handlePanGesture_];
    [v17 setName:@"com.apple.UIKit.PreviewPlatterPan"];
    [v17 setCancelsTouchesInView:0];
    [v17 setDelegate:v12];
    [v17 setMaximumNumberOfTouches:1];
    [v17 setAllowedScrollTypesMask:3];
    [v8 addGestureRecognizer:v17];
    [(_UIContextMenuPanController *)v12 setPanGestureRecognizer:v17];
    v18 = objc_opt_new();
    [(_UIContextMenuPanController *)v12 setVelocityIntegrator:v18];

    v12->_enabled = 1;
    long long v30 = *MEMORY[0x1E4F1DAD8];
    v19 = [MEMORY[0x1E4F29238] valueWithBytes:&v30 objCType:"{CGPoint=dd}"];
    v32[0] = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    detents = v12->_detents;
    v12->_detents = (NSArray *)v20;

    v12->_currentDetentIndex = 0;
    [v9 center];
    v12->_originalPlatterCenter.x = v22;
    v12->_originalPlatterCenter.y = v23;
    [v10 center];
    v12->_originalMenuCenter.x = v24;
    v12->_originalMenuCenter.y = v25;
    *(_OWORD *)&v12->_menuAnchor.attachment = xmmword_186B94020;
    v12->_menuAnchor.alignmentOffset = 0.0;
    v12->_menuAnchor.gravity = 0;
    v12->_menuAnchor.attachmentOffset = 0.0;
    v12->_rubberbandingEdges = 15;
    v12->_menuViewIsVisible = 1;
    v26 = [(_UIContextMenuPanController *)v12 _currentPlatformMetrics];
    [v26 baseMenuOffset];
    v12->_defaultZPosition = v27;

    v28 = +[_UIContextMenuScrollObservationInteraction interactionWithDelegate:v12];
    [v9 addInteraction:v28];
  }
  return v12;
}

- (void)moveToDetentPosition:(int64_t)a3 updateScrubPath:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(_UIContextMenuPanController *)self _canSwipeDownToDismiss]) {
    goto LABEL_10;
  }
  if (a3)
  {
    if (a3 != 2) {
      goto LABEL_10;
    }
    a3 = [(NSArray *)self->_detents count] - 1;
  }
  if (a3 != self->_currentDetentIndex)
  {
    NSUInteger v7 = [(NSArray *)self->_detents count];
    if (a3 >= v7 - 1) {
      unint64_t v8 = v7 - 1;
    }
    else {
      unint64_t v8 = a3;
    }
    self->_currentDetentIndex = v8;
    id v9 = -[NSArray objectAtIndexedSubscript:](self->_detents, "objectAtIndexedSubscript:");
    [v9 CGPointValue];
    double v11 = v10;
    double v13 = v12;

    self->_initialYTranslation = v13;
    v14 = [(_UIContextMenuPanController *)self platterView];
    [v14 frame];
    double v17 = v16 + v15 * 0.5;
    double v20 = v19 + v18 * 0.5;

    -[_UIContextMenuPanController _animationsForPreviewPlusActionsStyleWithTranslation:location:](self, "_animationsForPreviewPlusActionsStyleWithTranslation:location:", v11, v13, 0.0, v17, v20, 0.0);
    [(_UIContextMenuPanController *)self _animationsForAnyAttachedAccessoryViews];
  }
LABEL_10:
  if (v4)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __68___UIContextMenuPanController_moveToDetentPosition_updateScrubPath___block_invoke;
    v21[3] = &unk_1E52D9F70;
    v21[4] = self;
    +[UIView performWithoutAnimation:v21];
  }
}

- (void)setDetents:(id)a3
{
  v5 = (NSArray *)a3;
  if (self->_detents != v5)
  {
    NSUInteger v7 = v5;
    objc_storeStrong((id *)&self->_detents, a3);
    NSUInteger v6 = [(NSArray *)self->_detents count];
    v5 = v7;
    self->_currentDetentIndex = v6 - 1;
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    id v4 = [(_UIContextMenuPanController *)self panGestureRecognizer];
    [v4 setEnabled:v3];
  }
}

- (void)setOriginalPlatterCenter:(CGPoint)a3
{
  if (a3.x != self->_originalPlatterCenter.x || a3.y != self->_originalPlatterCenter.y)
  {
    self->_originalPlatterCenter = a3;
    [(_UIContextMenuPanController *)self _updateForSignificantLayoutChange];
  }
}

- (void)setOriginalMenuCenter:(CGPoint)a3
{
  if (a3.x != self->_originalMenuCenter.x || a3.y != self->_originalMenuCenter.y)
  {
    self->_originalMenuCenter = a3;
    [(_UIContextMenuPanController *)self _updateForSignificantLayoutChange];
  }
}

- (void)_updateForSignificantLayoutChange
{
  menuScrubPath = self->_menuScrubPath;
  self->_menuScrubPath = 0;
}

- (CGVector)_currentPlatterVelocity
{
  v2 = [(_UIContextMenuPanController *)self velocityIntegrator];
  [v2 velocity];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.dy = v8;
  result.dx = v7;
  return result;
}

- (double)_rangeOfMotion
{
  double v3 = [(NSArray *)self->_detents firstObject];
  [v3 CGPointValue];
  double v5 = v4;

  double v6 = [(NSArray *)self->_detents lastObject];
  [v6 CGPointValue];
  double v8 = v7;

  return v8 - v5;
}

- (int)_nearestDetentWithTranslation:(CGPoint)a3
{
  double y = a3.y;
  NSUInteger v5 = [(NSArray *)self->_detents count];
  int v6 = v5;
  if (y <= 250.0 && v5)
  {
    unint64_t v7 = 0;
    int v6 = 0;
    double v8 = 1.79769313e308;
    do
    {
      id v9 = [(NSArray *)self->_detents objectAtIndexedSubscript:v7];
      [v9 CGPointValue];
      double v11 = v10;

      if (vabdd_f64(v11, y) < fabs(v8))
      {
        int v6 = v7;
        double v8 = v11 - y;
      }
      ++v7;
    }
    while ([(NSArray *)self->_detents count] > v7);
  }
  return v6;
}

- (BOOL)_canSwipeDownToDismiss
{
  return self->_rubberbandingEdges != 15;
}

- (double)_dragTearOffThreshold
{
  double v3 = [(_UIContextMenuPanController *)self _currentPlatformMetrics];
  [v3 previewActionsStyleDragTearOffThreshold];
  double v5 = v4;

  if ([(_UIContextMenuPanController *)self _canSwipeDownToDismiss])
  {
    if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_PlatterPreviewPlusActionsDragTearOffThreshold, @"PlatterPreviewPlusActionsDragTearOffThreshold", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))return 50.0; {
    else
    }
      return *(double *)&qword_1E8FD5058;
  }
  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  id v5 = a4;
  if ([v5 type] == 10)
  {
    id v6 = v5;
    if ([(_UIContextMenuPanController *)self _canSwipeDownToDismiss])
    {
      unint64_t v7 = [(_UIContextMenuPanController *)self platterView];
      [v7 bounds];
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      double v16 = [(_UIContextMenuPanController *)self platterView];
      [v6 locationInView:v16];
      v21.x = v17;
      v21.double y = v18;
      v22.origin.x = v9;
      v22.origin.double y = v11;
      v22.size.width = v13;
      v22.size.height = v15;
      BOOL v19 = CGRectContainsPoint(v22, v21);
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 1;
  }

  return v19;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 phase] <= 0
    && ([(_UIContextMenuPanController *)self panGestureRecognizer],
        id v8 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        v8 == v6))
  {
    CGFloat v11 = [(_UIContextMenuPanController *)self platterView];
    [v11 bounds];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    double v20 = [(_UIContextMenuPanController *)self platterView];
    [v7 locationInView:v20];
    v28.x = v21;
    v28.double y = v22;
    v29.origin.x = v13;
    v29.origin.double y = v15;
    v29.size.width = v17;
    v29.size.height = v19;
    BOOL v9 = CGRectContainsPoint(v29, v28);

    CGFloat v23 = [(_UIContextMenuPanController *)self menuView];
    CGFloat v24 = [(_UIContextMenuPanController *)self menuView];
    [v7 locationInView:v24];
    CGFloat v25 = objc_msgSend(v23, "hitTest:withEvent:", 0);

    int64_t v26 = [(_UIContextMenuPanController *)self _userInterfaceIdiom];
    if (v26 != 6)
    {
      if (v26 == 1)
      {
        if (v25) {
          LOBYTE(v9) = 1;
        }
      }
      else
      {
        int v27 = [(_UIContextMenuPanController *)self _canSwipeDownToDismiss] || v9;
        if (v25) {
          LOBYTE(v9) = 1;
        }
        else {
          LOBYTE(v9) = v27;
        }
      }
    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIContextMenuPanController *)self panGestureRecognizer];

  BOOL v11 = 0;
  if (v8 == v7)
  {
    BOOL v9 = [v6 name];
    char v10 = [v9 isEqualToString:@"com.apple.UIKit.ContextMenuActionsListSelection"];

    if (v10) {
      BOOL v11 = 1;
    }
  }

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIContextMenuPanController *)self panGestureRecognizer];

  if (v8 == v7 && self->_currentDetentIndex && [v6 _isGestureType:8])
  {
    BOOL v11 = [v6 view];
    double v12 = [(_UIContextMenuPanController *)self menuView];
    char v9 = [v11 isDescendantOfView:v12];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)_handlePanGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContextMenuPanController *)self containerView];
  [v4 translationInView:v5];
  double v7 = v6;
  double v9 = v8;

  char v10 = [(_UIContextMenuPanController *)self containerView];
  [v4 locationInView:v10];
  double v12 = v11;
  double v14 = v13;

  CGFloat v15 = [v4 _activeEvents];
  double v16 = [v15 anyObject];
  uint64_t v17 = [v16 type];

  if (v17 == 10) {
    double v7 = 0.0;
  }
  uint64_t v18 = [v4 state];

  -[_UIContextMenuPanController _updateForGestureWithState:translation:location:allowsDragging:](self, "_updateForGestureWithState:translation:location:allowsDragging:", v18, v17 != 10, v7, v9, 0.0, v12, v14, 0.0);
}

- (void)_updateForGestureWithState:(int64_t)a3 translation:(CAPoint3D)a4 location:(CAPoint3D)a5 allowsDragging:(BOOL)a6
{
  BOOL v6 = a6;
  double z = a5.z;
  double y = a5.y;
  double x = a5.x;
  double v10 = a4.z;
  double v11 = a4.y;
  double v12 = a4.x;
  if ([(_UIContextMenuPanController *)self enabled])
  {
    id v48 = [(_UIContextMenuPanController *)self containerView];
    BOOL v15 = [(_UIContextMenuPanController *)self _canSwipeDownToDismiss];
    switch(a3)
    {
      case 1:
        double v16 = [(NSArray *)self->_detents objectAtIndexedSubscript:self->_currentDetentIndex];
        [v16 CGPointValue];
        self->_double initialYTranslation = v17;

        uint64_t v18 = [(_UIContextMenuPanController *)self velocityIntegrator];
        [v18 reset];

        if (!v15)
        {
          -[_UIContextMenuPanController _updateMenuScrubPathWithLocationIfNecessary:](self, "_updateMenuScrubPathWithLocationIfNecessary:", x, y);
          self->_initialLocationInsidePreview = (CGPoint)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        }
        CGFloat v19 = [(_UIContextMenuPanController *)self delegate];
        [v19 platterPanInteractionBegan:self allowSwipeToDismiss:&self->_clientAllowsDismissal];

        goto LABEL_6;
      case 2:
LABEL_6:
        double initialYTranslation = self->_initialYTranslation;
        if (!v15)
        {
          -[_UIContextMenuPanController _updateMenuScrubPathWithLocationIfNecessary:](self, "_updateMenuScrubPathWithLocationIfNecessary:", x, y);
          self->_currentDistanceToMenuScrubPath = UIDistanceBetweenPointAndPolygon(self->_menuScrubPath, x, y);
        }
        double v21 = v11 + initialYTranslation;
        if (v6
          && -[_UIContextMenuPanController _canBeginDraggingWithTranslation:location:](self, "_canBeginDraggingWithTranslation:location:", v12, v21, v10, x, y, z))
        {
          CGFloat v22 = [(_UIContextMenuPanController *)self delegate];
          [v22 platterPanControllerDidTearOff:self];
        }
        CGFloat v23 = [(_UIContextMenuPanController *)self velocityIntegrator];
        objc_msgSend(v23, "addSample:", x, y);

        CGFloat v24 = self;
        double v25 = v12;
        double v26 = v21;
        double v27 = v10;
        double v28 = x;
        uint64_t v29 = 0;
        double v30 = y;
        double v31 = z;
        uint64_t v32 = 0;
        goto LABEL_12;
      case 3:
        self->_currentDistanceToMenuScrubPath = 0.0;
        [(_UIContextMenuPanController *)self _currentPlatterVelocity];
        double v34 = v33;
        currentDetentIndedouble x = self->_currentDetentIndex;
        v36 = [(_UIContextMenuPanController *)self delegate];
        [v36 platterPanInteractionEnded:self];

        if (!v15) {
          goto LABEL_25;
        }
        if (v34 >= 2000.0)
        {
          currentDetentIndedouble x = [(NSArray *)self->_detents count];
          goto LABEL_25;
        }
        if (v34 > 300.0)
        {
          ++currentDetentIndex;
LABEL_25:
          uint64_t v39 = 1;
          goto LABEL_26;
        }
        if (v34 < -300.0)
        {
          if (currentDetentIndex <= 1) {
            int v38 = 1;
          }
          else {
            int v38 = currentDetentIndex;
          }
          currentDetentIndedouble x = v38 - 1;
          goto LABEL_25;
        }
        currentDetentIndedouble x = -[_UIContextMenuPanController _nearestDetentWithTranslation:](self, "_nearestDetentWithTranslation:", v12, v11 + self->_initialYTranslation);
        uint64_t v39 = 0;
LABEL_26:
        if (!self->_clientAllowsDismissal) {
          currentDetentIndedouble x = (int)fmax(fmin((double)currentDetentIndex, (double)([(NSArray *)self->_detents count] - 1)), 0.0);
        }
        if ([(NSArray *)self->_detents count] <= currentDetentIndex)
        {
          v37 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, fmax(fmin(v34, 4500.0), 0.0));
          v45 = [(_UIContextMenuPanController *)self platterView];
          [v45 _setVelocity:v37 forKey:@"position"];

          v46 = [(_UIContextMenuPanController *)self menuView];
          [v46 _setVelocity:v37 forKey:@"position"];

          v47 = [(_UIContextMenuPanController *)self delegate];
          [v47 platterPanControllerDidSwipeDown:self];

LABEL_31:
        }
        else
        {
          v40 = [(NSArray *)self->_detents objectAtIndexedSubscript:currentDetentIndex];
          [v40 CGPointValue];
          double v42 = v41;
          double v44 = v43;

          self->_currentDetentIndedouble x = currentDetentIndex;
          double v27 = 0.0;
          CGFloat v24 = self;
          double v25 = v42;
          double v26 = v44;
          double v28 = x;
          double v30 = y;
          double v31 = z;
          uint64_t v29 = 1;
          uint64_t v32 = v39;
LABEL_12:
          -[_UIContextMenuPanController _updateViewPositionsWithTranslation:location:ended:withVelocity:](v24, "_updateViewPositionsWithTranslation:location:ended:withVelocity:", v29, v32, v25, v26, v27, v28, v30, v31);
        }
LABEL_32:

        break;
      case 4:
        v37 = [(_UIContextMenuPanController *)self delegate];
        [v37 platterPanInteractionEnded:self];
        goto LABEL_31;
      default:
        goto LABEL_32;
    }
  }
}

- (void)_updateMenuScrubPathWithLocationIfNecessary:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = [(_UIContextMenuPanController *)self menuView];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  [(_UIContextMenuPanController *)self menuAnchor];
  uint64_t v15 = v177;
  if (v177 == 4 || v177 == 1)
  {
    v180.origin.double x = UIRectInsetEdges(v177, v8, v10, v12, v14, -48.0);
  }
  else
  {
    v179.origin.double x = v8;
    v179.origin.double y = v10;
    v179.size.double width = v12;
    v179.size.double height = v14;
    CGRect v180 = CGRectInset(v179, 0.0, -48.0);
  }
  double v17 = v180.origin.x;
  double v18 = v180.origin.y;
  double width = v180.size.width;
  double height = v180.size.height;
  v178.double x = x;
  v178.double y = y;
  BOOL v19 = CGRectContainsPoint(v180, v178);
  menuScrubPath = self->_menuScrubPath;
  if (menuScrubPath && v19)
  {
    if (self->_touchEverEnteredMenu) {
      return;
    }
  }
  else if (menuScrubPath)
  {
    return;
  }
  self->_touchEverEnteredMenu = v19;
  uint64_t v171 = 0;
  v172 = &v171;
  uint64_t v173 = 0x3032000000;
  v174 = __Block_byref_object_copy__51;
  v175 = __Block_byref_object_dispose__51;
  id v176 = 0;
  if (v19)
  {
    uint64_t v21 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v17, v18, width, height);
    CGFloat v22 = (void *)v172[5];
    v172[5] = v21;

    [(_UIContextMenuPanController *)self menuAnchor];
    uint64_t v23 = v170;
    CGFloat v24 = [(_UIContextMenuPanController *)self platterView];
    [v24 bounds];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    [(_UIContextMenuPanController *)self originalPlatterCenter];
    double v34 = v33;
    double v36 = v35;
    v37 = [(_UIContextMenuPanController *)self containerView];
    int v38 = [v37 _screen];
    [v38 scale];
    UIRectCenteredAboutPointScale(v26, v28, v30, v32, v34, v36, v39);
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    CGFloat v47 = v46;

    if (v15 == 4 || v15 == 1)
    {
      v181.origin.double x = v41;
      v181.origin.double y = v43;
      v181.size.double width = v45;
      v181.size.double height = v47;
      double v48 = CGRectGetHeight(v181);
    }
    else
    {
      v204.origin.double x = v41;
      v204.origin.double y = v43;
      v204.size.double width = v45;
      v204.size.double height = v47;
      double v48 = CGRectGetWidth(v204);
    }
    double v83 = round(v48 * 0.65);
    memset(&slice, 0, sizeof(slice));
    memset(&remainder, 0, sizeof(remainder));
    switch(v15)
    {
      case 1:
        CGRectEdge v84 = CGRectMinYEdge;
        break;
      case 4:
        CGRectEdge v84 = CGRectMaxYEdge;
        break;
      case 8:
        CGRectEdge v84 = CGRectMaxXEdge;
        break;
      default:
        CGRectEdge v84 = CGRectMinXEdge;
        break;
    }
    v205.origin.double x = v41;
    v205.origin.double y = v43;
    v205.size.double width = v45;
    v205.size.double height = v47;
    CGRectDivide(v205, &slice, &remainder, v83, v84);
    if (v15 == 4 || v15 == 1)
    {
      v206.origin.double x = v17;
      v206.origin.double y = v18;
      v206.size.double width = width;
      v206.size.double height = height;
      double v85 = CGRectGetWidth(v206);
    }
    else
    {
      v207.origin.double x = v17;
      v207.origin.double y = v18;
      v207.size.double width = width;
      v207.size.double height = height;
      double v85 = CGRectGetHeight(v207);
    }
    switch(v23)
    {
      case 1:
        CGRectEdge v86 = CGRectMinYEdge;
        break;
      case 4:
        CGRectEdge v86 = CGRectMaxYEdge;
        break;
      case 8:
        CGRectEdge v86 = CGRectMaxXEdge;
        break;
      default:
        CGRectEdge v86 = CGRectMinXEdge;
        break;
    }
    CGRectDivide(slice, &slice, &remainder, v85, v86);
    v87 = [(_UIContextMenuPanController *)self menuView];
    [v87 frame];
    double v92 = UIDistanceBetweenRects(v88, v89, v90, v91, v41, v43, v45, v47);

    slice.origin.double x = UIRectInsetEdges(v15, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height, -v92);
    slice.origin.double y = v93;
    slice.size.double width = v94;
    slice.size.double height = v95;
    v96 = (void *)v172[5];
    v97 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
    [v96 appendPath:v97];
  }
  else
  {
    v49 = [(_UIContextMenuPanController *)self _currentPlatformMetrics];
    [v49 previewActionsStyleDragTearOffThreshold];
    double v51 = v50;

    v52 = [(_UIContextMenuPanController *)self containerView];
    v53 = [v52 _screen];
    [v53 scale];
    UIRectCenteredAboutPointScale(0.0, 0.0, v51, v51, x, y, v54);
    CGFloat rect = v55;
    double v57 = v56;
    double v59 = v58;
    CGFloat v61 = v60;

    uint64_t v62 = objc_opt_new();
    v63 = (void *)v172[5];
    v172[5] = v62;

    switch(v15)
    {
      case 1:
        objc_msgSend((id)v172[5], "moveToPoint:", v17, v18);
        v64 = (void *)v172[5];
        v182.origin.double x = v17;
        v182.origin.double y = v18;
        v182.size.double width = width;
        v182.size.double height = height;
        double MaxX = CGRectGetMaxX(v182);
        v183.origin.double x = v17;
        v183.origin.double y = v18;
        v183.size.double width = width;
        v183.size.double height = height;
        objc_msgSend(v64, "addLineToPoint:", MaxX, CGRectGetMinY(v183));
        v66 = (void *)v172[5];
        v184.origin.double x = v17;
        v184.origin.double y = v18;
        v184.size.double width = width;
        v184.size.double height = height;
        double v67 = CGRectGetMaxX(v184);
        v185.origin.double x = v17;
        v185.origin.double y = v18;
        v185.size.double width = width;
        v185.size.double height = height;
        objc_msgSend(v66, "addLineToPoint:", v67, CGRectGetMaxY(v185));
        v68 = (void *)v172[5];
        v186.origin.double x = v17;
        v186.origin.double y = v18;
        v186.size.double width = width;
        v186.size.double height = height;
        double v153 = CGRectGetMaxX(v186);
        v187.origin.double x = v57;
        v187.origin.double y = v59;
        v187.size.double width = v61;
        v187.size.double height = rect;
        double v150 = CGRectGetMaxX(v187);
        v188.origin.double x = v17;
        v188.origin.double y = v18;
        v188.size.double width = width;
        v188.size.double height = height;
        double v69 = CGRectGetMaxX(v188);
        v189.origin.double x = v17;
        v189.origin.double y = v18;
        v189.size.double width = width;
        v189.size.double height = height;
        double MaxY = CGRectGetMaxY(v189);
        v190.origin.double x = v57;
        v190.origin.double y = v59;
        v190.size.double width = v61;
        v190.size.double height = rect;
        double v71 = CGRectGetMaxY(v190);
        v191.origin.double x = v17;
        v191.origin.double y = v18;
        v191.size.double width = width;
        v191.size.double height = height;
        objc_msgSend(v68, "addLineToPoint:", v153 + (v150 - v69) * 0.8, MaxY + (v71 - CGRectGetMaxY(v191)) * 0.25);
        v72 = (void *)v172[5];
        v192.origin.double x = v57;
        v192.origin.double y = v59;
        v192.size.double width = v61;
        v192.size.double height = rect;
        double v73 = CGRectGetMaxX(v192);
        v193.origin.double x = v57;
        v193.origin.double y = v59;
        v193.size.double width = v61;
        v193.size.double height = rect;
        objc_msgSend(v72, "addLineToPoint:", v73, CGRectGetMaxY(v193));
        v74 = (void *)v172[5];
        v194.origin.double x = v57;
        v194.origin.double y = v59;
        v194.size.double width = v61;
        v194.size.double height = rect;
        double MinX = CGRectGetMinX(v194);
        v195.origin.double x = v57;
        v195.origin.double y = v59;
        v195.size.double width = v61;
        v195.size.double height = rect;
        objc_msgSend(v74, "addLineToPoint:", MinX, CGRectGetMaxY(v195));
        v76 = (void *)v172[5];
        v196.origin.double x = v57;
        v196.origin.double y = v59;
        v196.size.double width = v61;
        v196.size.double height = rect;
        double v154 = CGRectGetMinX(v196);
        v197.origin.double x = v17;
        v197.origin.double y = v18;
        v197.size.double width = width;
        v197.size.double height = height;
        double v151 = CGRectGetMinX(v197);
        v198.origin.double x = v57;
        v198.origin.double y = v59;
        v198.size.double width = v61;
        v198.size.double height = rect;
        double v77 = CGRectGetMinX(v198);
        v199.origin.double x = v57;
        v199.origin.double y = v59;
        v199.size.double width = v61;
        v199.size.double height = rect;
        double v78 = CGRectGetMaxY(v199);
        v200.origin.double x = v17;
        v200.origin.double y = v18;
        v200.size.double width = width;
        v200.size.double height = height;
        double v79 = CGRectGetMaxY(v200);
        v201.origin.double x = v57;
        v201.origin.double y = v59;
        v201.size.double width = v61;
        v201.size.double height = rect;
        objc_msgSend(v76, "addLineToPoint:", v154 + (v151 - v77) * 0.25, v78 + (v79 - CGRectGetMaxY(v201)) * 0.75);
        v80 = (void *)v172[5];
        v202.origin.double x = v17;
        v202.origin.double y = v18;
        v202.size.double width = width;
        v202.size.double height = height;
        double v81 = CGRectGetMinX(v202);
        v203.origin.double x = v17;
        v203.origin.double y = v18;
        v203.size.double width = width;
        v203.size.double height = height;
        double v82 = CGRectGetMaxY(v203);
        goto LABEL_41;
      case 2:
        objc_msgSend((id)v172[5], "moveToPoint:", v17, v18);
        v98 = (void *)v172[5];
        v208.origin.double x = v17;
        v208.origin.double y = v18;
        v208.size.double width = width;
        v208.size.double height = height;
        double v99 = CGRectGetMaxX(v208);
        v209.origin.double x = v17;
        v209.origin.double y = v18;
        v209.size.double width = width;
        v209.size.double height = height;
        objc_msgSend(v98, "addLineToPoint:", v99, CGRectGetMinY(v209));
        v100 = (void *)v172[5];
        v210.origin.double x = v17;
        v210.origin.double y = v18;
        v210.size.double width = width;
        v210.size.double height = height;
        double v155 = CGRectGetMaxX(v210);
        v211.origin.double x = v57;
        v211.origin.double y = v59;
        v211.size.double width = v61;
        v211.size.double height = rect;
        double v152 = CGRectGetMaxX(v211);
        v212.origin.double x = v17;
        v212.origin.double y = v18;
        v212.size.double width = width;
        v212.size.double height = height;
        double v101 = CGRectGetMaxX(v212);
        v213.origin.double x = v17;
        v213.origin.double y = v18;
        v213.size.double width = width;
        v213.size.double height = height;
        double MinY = CGRectGetMinY(v213);
        v214.origin.double x = v57;
        v214.origin.double y = v59;
        v214.size.double width = v61;
        v214.size.double height = rect;
        double v103 = CGRectGetMinY(v214);
        v215.origin.double x = v17;
        v215.origin.double y = v18;
        v215.size.double width = width;
        v215.size.double height = height;
        objc_msgSend(v100, "addLineToPoint:", v155 + (v152 - v101) * 0.25, MinY + (v103 - CGRectGetMinY(v215)) * 0.75);
        v104 = (void *)v172[5];
        v216.origin.double x = v57;
        v216.origin.double y = v59;
        v216.size.double width = v61;
        v216.size.double height = rect;
        double v105 = CGRectGetMaxX(v216);
        v217.origin.double x = v57;
        v217.origin.double y = v59;
        v217.size.double width = v61;
        v217.size.double height = rect;
        objc_msgSend(v104, "addLineToPoint:", v105, CGRectGetMinY(v217));
        v106 = (void *)v172[5];
        v218.origin.double x = v57;
        v218.origin.double y = v59;
        v218.size.double width = v61;
        v218.size.double height = rect;
        double v107 = CGRectGetMaxX(v218);
        v219.origin.double x = v57;
        v219.origin.double y = v59;
        v219.size.double width = v61;
        v219.size.double height = rect;
        objc_msgSend(v106, "addLineToPoint:", v107, CGRectGetMaxY(v219));
        v108 = (void *)v172[5];
        v220.origin.double x = v57;
        v220.origin.double y = v59;
        v220.size.double width = v61;
        v220.size.double height = rect;
        double v156 = CGRectGetMaxX(v220);
        v221.origin.double x = v57;
        v221.origin.double y = v59;
        v221.size.double width = v61;
        v221.size.double height = rect;
        double v151 = CGRectGetMaxX(v221);
        v222.origin.double x = v17;
        v222.origin.double y = v18;
        v222.size.double width = width;
        v222.size.double height = height;
        double v109 = CGRectGetMaxX(v222);
        v223.origin.double x = v57;
        v223.origin.double y = v59;
        v223.size.double width = v61;
        v223.size.double height = rect;
        double v110 = CGRectGetMaxY(v223);
        v224.origin.double x = v57;
        v224.origin.double y = v59;
        v224.size.double width = v61;
        v224.size.double height = rect;
        double v111 = CGRectGetMaxY(v224);
        v225.origin.double x = v57;
        v225.origin.double y = v59;
        v225.size.double width = v61;
        v225.size.double height = rect;
        objc_msgSend(v108, "addLineToPoint:", v156 + (v151 - v109) * -0.75, v110 + (v111 - CGRectGetMaxY(v225)) * 0.25);
        v112 = (void *)v172[5];
        v226.origin.double x = v17;
        v226.origin.double y = v18;
        v226.size.double width = width;
        v226.size.double height = height;
        double v113 = CGRectGetMaxX(v226);
        v227.origin.double x = v17;
        v227.origin.double y = v18;
        v227.size.double width = width;
        v227.size.double height = height;
        objc_msgSend(v112, "addLineToPoint:", v113, CGRectGetMaxY(v227));
        v80 = (void *)v172[5];
        v228.origin.double x = v17;
        v228.origin.double y = v18;
        v228.size.double width = width;
        v228.size.double height = height;
        double v81 = CGRectGetMinX(v228);
        v229.origin.double x = v17;
        v229.origin.double y = v18;
        v229.size.double width = width;
        v229.size.double height = height;
        double v82 = CGRectGetMaxY(v229);
        goto LABEL_41;
      case 4:
        objc_msgSend((id)v172[5], "moveToPoint:", v57, v59);
        v114 = (void *)v172[5];
        v230.origin.double x = v57;
        v230.origin.double y = v59;
        v230.size.double width = v61;
        v230.size.double height = rect;
        double v115 = CGRectGetMaxX(v230);
        v231.origin.double x = v57;
        v231.origin.double y = v59;
        v231.size.double width = v61;
        v231.size.double height = rect;
        objc_msgSend(v114, "addLineToPoint:", v115, CGRectGetMinY(v231));
        v116 = (void *)v172[5];
        v232.origin.double x = v57;
        v232.origin.double y = v59;
        v232.size.double width = v61;
        v232.size.double height = rect;
        double v157 = CGRectGetMaxX(v232);
        v233.origin.double x = v17;
        v233.origin.double y = v18;
        v233.size.double width = width;
        v233.size.double height = height;
        double v151 = CGRectGetMaxX(v233);
        v234.origin.double x = v57;
        v234.origin.double y = v59;
        v234.size.double width = v61;
        v234.size.double height = rect;
        double v117 = CGRectGetMaxX(v234);
        v235.origin.double x = v57;
        v235.origin.double y = v59;
        v235.size.double width = v61;
        v235.size.double height = rect;
        double v118 = CGRectGetMinY(v235);
        v236.origin.double x = v17;
        v236.origin.double y = v18;
        v236.size.double width = width;
        v236.size.double height = height;
        double v119 = CGRectGetMinY(v236);
        v237.origin.double x = v57;
        v237.origin.double y = v59;
        v237.size.double width = v61;
        v237.size.double height = rect;
        objc_msgSend(v116, "addLineToPoint:", v157 + (v151 - v117) * 0.25, v118 + (v119 - CGRectGetMinY(v237)) * 0.75);
        v120 = (void *)v172[5];
        v238.origin.double x = v17;
        v238.origin.double y = v18;
        v238.size.double width = width;
        v238.size.double height = height;
        double v121 = CGRectGetMaxX(v238);
        v239.origin.double x = v17;
        v239.origin.double y = v18;
        v239.size.double width = width;
        v239.size.double height = height;
        objc_msgSend(v120, "addLineToPoint:", v121, CGRectGetMinY(v239));
        v122 = (void *)v172[5];
        v240.origin.double x = v17;
        v240.origin.double y = v18;
        v240.size.double width = width;
        v240.size.double height = height;
        double v123 = CGRectGetMaxX(v240);
        v241.origin.double x = v17;
        v241.origin.double y = v18;
        v241.size.double width = width;
        v241.size.double height = height;
        objc_msgSend(v122, "addLineToPoint:", v123, CGRectGetMaxY(v241));
        v124 = (void *)v172[5];
        v242.origin.double x = v17;
        v242.origin.double y = v18;
        v242.size.double width = width;
        v242.size.double height = height;
        double v125 = CGRectGetMinX(v242);
        v243.origin.double x = v17;
        v243.origin.double y = v18;
        v243.size.double width = width;
        v243.size.double height = height;
        objc_msgSend(v124, "addLineToPoint:", v125, CGRectGetMaxY(v243));
        objc_msgSend((id)v172[5], "addLineToPoint:", v17, v18);
        v80 = (void *)v172[5];
        v244.origin.double x = v17;
        v244.origin.double y = v18;
        v244.size.double width = width;
        v244.size.double height = height;
        double v158 = CGRectGetMinX(v244);
        v245.origin.double x = v57;
        v245.origin.double y = v59;
        v245.size.double width = v61;
        v245.size.double height = rect;
        double v126 = CGRectGetMinX(v245);
        v246.origin.double x = v17;
        v246.origin.double y = v18;
        v246.size.double width = width;
        v246.size.double height = height;
        double v127 = CGRectGetMinX(v246);
        v247.origin.double x = v17;
        v247.origin.double y = v18;
        v247.size.double width = width;
        v247.size.double height = height;
        double v128 = CGRectGetMinY(v247);
        v248.origin.double x = v57;
        v248.origin.double y = v59;
        v248.size.double width = v61;
        v248.size.double height = rect;
        double v129 = CGRectGetMinY(v248);
        v249.origin.double x = v17;
        v249.origin.double y = v18;
        v249.size.double width = width;
        v249.size.double height = height;
        double v81 = v158 + (v126 - v127) * 0.8;
        double v130 = v128 + (v129 - CGRectGetMinY(v249)) * 0.25;
        goto LABEL_42;
      case 8:
        objc_msgSend((id)v172[5], "moveToPoint:", v57, v59);
        v131 = (void *)v172[5];
        v250.origin.double x = v57;
        v250.origin.double y = v59;
        v250.size.double width = v61;
        v250.size.double height = rect;
        double v159 = CGRectGetMinX(v250);
        v251.origin.double x = v17;
        v251.origin.double y = v18;
        v251.size.double width = width;
        v251.size.double height = height;
        double v151 = CGRectGetMinX(v251);
        v252.origin.double x = v57;
        v252.origin.double y = v59;
        v252.size.double width = v61;
        v252.size.double height = rect;
        double v132 = CGRectGetMinX(v252);
        v253.origin.double x = v57;
        v253.origin.double y = v59;
        v253.size.double width = v61;
        v253.size.double height = rect;
        double v133 = CGRectGetMinY(v253);
        v254.origin.double x = v57;
        v254.origin.double y = v59;
        v254.size.double width = v61;
        v254.size.double height = rect;
        double v134 = CGRectGetMinY(v254);
        v255.origin.double x = v17;
        v255.origin.double y = v18;
        v255.size.double width = width;
        v255.size.double height = height;
        objc_msgSend(v131, "addLineToPoint:", v159 + (v151 - v132) * 0.75, v133 + (v134 - CGRectGetMinY(v255)) * -0.25);
        objc_msgSend((id)v172[5], "addLineToPoint:", v17, v18);
        v135 = (void *)v172[5];
        v256.origin.double x = v17;
        v256.origin.double y = v18;
        v256.size.double width = width;
        v256.size.double height = height;
        double v136 = CGRectGetMaxX(v256);
        v257.origin.double x = v17;
        v257.origin.double y = v18;
        v257.size.double width = width;
        v257.size.double height = height;
        objc_msgSend(v135, "addLineToPoint:", v136, CGRectGetMinY(v257));
        v137 = (void *)v172[5];
        v258.origin.double x = v17;
        v258.origin.double y = v18;
        v258.size.double width = width;
        v258.size.double height = height;
        double v138 = CGRectGetMaxX(v258);
        v259.origin.double x = v17;
        v259.origin.double y = v18;
        v259.size.double width = width;
        v259.size.double height = height;
        objc_msgSend(v137, "addLineToPoint:", v138, CGRectGetMaxY(v259));
        v139 = (void *)v172[5];
        v260.origin.double x = v17;
        v260.origin.double y = v18;
        v260.size.double width = width;
        v260.size.double height = height;
        double v140 = CGRectGetMinX(v260);
        v261.origin.double x = v17;
        v261.origin.double y = v18;
        v261.size.double width = width;
        v261.size.double height = height;
        objc_msgSend(v139, "addLineToPoint:", v140, CGRectGetMaxY(v261));
        v141 = (void *)v172[5];
        v262.origin.double x = v17;
        v262.origin.double y = v18;
        v262.size.double width = width;
        v262.size.double height = height;
        double v160 = CGRectGetMinX(v262);
        v263.origin.double x = v17;
        v263.origin.double y = v18;
        v263.size.double width = width;
        v263.size.double height = height;
        double v142 = CGRectGetMinX(v263);
        v264.origin.double x = v57;
        v264.origin.double y = v59;
        v264.size.double width = v61;
        v264.size.double height = rect;
        double v143 = CGRectGetMinX(v264);
        v265.origin.double x = v17;
        v265.origin.double y = v18;
        v265.size.double width = width;
        v265.size.double height = height;
        double v144 = CGRectGetMaxY(v265);
        v266.origin.double x = v17;
        v266.origin.double y = v18;
        v266.size.double width = width;
        v266.size.double height = height;
        double v145 = CGRectGetMaxY(v266);
        v267.origin.double x = v57;
        v267.origin.double y = v59;
        v267.size.double width = v61;
        v267.size.double height = rect;
        objc_msgSend(v141, "addLineToPoint:", v160 + (v142 - v143) * -0.25, v144 + (v145 - CGRectGetMaxY(v267)) * -0.75);
        v80 = (void *)v172[5];
        v268.origin.double x = v57;
        v268.origin.double y = v59;
        v268.size.double width = v61;
        v268.size.double height = rect;
        double v81 = CGRectGetMinX(v268);
        v269.origin.double x = v57;
        v269.origin.double y = v59;
        v269.size.double width = v61;
        v269.size.double height = rect;
        double v82 = CGRectGetMaxY(v269);
LABEL_41:
        double v130 = v82;
LABEL_42:
        objc_msgSend(v80, "addLineToPoint:", v81, v130, *(void *)&v151);
        [(id)v172[5] closePath];
        break;
      default:
        break;
    }
  }
  v146 = [(_UIContextMenuPanController *)self menuView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v148 = [(_UIContextMenuPanController *)self menuView];
    if ([v148 hierarchyStyle] == 2)
    {
      v149 = [v148 submenus];
      v164[0] = MEMORY[0x1E4F143A8];
      v164[1] = 3221225472;
      v164[2] = __75___UIContextMenuPanController__updateMenuScrubPathWithLocationIfNecessary___block_invoke;
      v164[3] = &unk_1E52DE7E8;
      id v165 = v148;
      v166 = self;
      v167 = &v171;
      [v149 enumerateNodes:v164];
    }
  }
  objc_storeStrong((id *)&self->_menuScrubPath, (id)v172[5]);
  -[_UIContextMenuPanController _updatePlatterGestureDebugUIWithTranslation:location:invalidate:](self, "_updatePlatterGestureDebugUIWithTranslation:location:invalidate:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  _Block_object_dispose(&v171, 8);
}

- (BOOL)_canBeginDraggingWithTranslation:(CAPoint3D)a3 location:(CAPoint3D)a4
{
  double z = a3.z;
  long double y = a3.y;
  long double x = a3.x;
  [(_UIContextMenuPanController *)self _dragTearOffThreshold];
  double v9 = v8;
  [(_UIContextMenuPanController *)self _tearOffSpeedMultiplier];
  double v11 = v9 * v10;
  if ([(_UIContextMenuPanController *)self _canSwipeDownToDismiss])
  {
    if ([(NSArray *)self->_detents count] <= 1) {
      double v12 = -v11;
    }
    else {
      double v12 = v11 * -2.0;
    }
    double v13 = [(NSArray *)self->_detents objectAtIndexedSubscript:0];
    [v13 CGPointValue];
    double v15 = v14;

    BOOL v16 = fabs(x) > v9;
    return y - v15 < v12 || v16;
  }
  else
  {
    double v18 = hypot(x, y);
    if ([(_UIContextMenuPanController *)self _userInterfaceIdiom] == 6)
    {
      BOOL v19 = v18 > v9;
      double v20 = [(_UIContextMenuPanController *)self _currentPlatformMetrics];
      [v20 previewActionsStyleDragZTearOffThreshold];
      double v22 = v21;

      return z > v22 || v19;
    }
    else
    {
      return self->_currentDistanceToMenuScrubPath > v11 && v18 > v9;
    }
  }
}

- (double)_tearOffSpeedMultiplier
{
  [(_UIContextMenuPanController *)self _currentPlatterVelocity];
  double v3 = fabs(v2);
  int v4 = _UIInternalPreferenceUsesDefault((int *)&_MergedGlobals_903, @"DragTearOffSpeedMultiplierCoefficient", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v5 = *(double *)&qword_1EB256F60;
  if (v4) {
    double v5 = 200.0;
  }
  double v6 = round(v3 / v5);
  int v7 = _UIInternalPreferenceUsesDefault((int *)algn_1EB256F68, @"DragTearOffSpeedMultiplierMax", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v8 = *(double *)&qword_1EB256F70;
  if (v7) {
    double v8 = 3.0;
  }
  return fmax(fmin(v6, v8), 1.0);
}

- (void)_updateViewPositionsWithTranslation:(CAPoint3D)a3 location:(CAPoint3D)a4 ended:(BOOL)a5 withVelocity:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a4.y;
  double x = a4.x;
  double v9 = a3.y;
  double v10 = a3.x;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95___UIContextMenuPanController__updateViewPositionsWithTranslation_location_ended_withVelocity___block_invoke;
  aBlock[3] = &unk_1E52E7900;
  aBlock[4] = self;
  CAPoint3D v18 = a3;
  CAPoint3D v19 = a4;
  BOOL v20 = a5;
  double v12 = _Block_copy(aBlock);
  double v13 = [(_UIContextMenuPanController *)self animationBehavior];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95___UIContextMenuPanController__updateViewPositionsWithTranslation_location_ended_withVelocity___block_invoke_2;
  v15[3] = &unk_1E52DA040;
  id v16 = v12;
  id v14 = v12;
  +[UIView _animateUsingSpringBehavior:v13 tracking:!v6 animations:v15 completion:0];

  -[_UIContextMenuPanController _updatePlatterGestureDebugUIWithTranslation:location:invalidate:](self, "_updatePlatterGestureDebugUIWithTranslation:location:invalidate:", 0, v10, v9, x, y);
}

- (id)_createAnimationBehaviorWithCriticalDamping:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = objc_opt_new();
  [v4 setInertialTargetSmoothing:0.15];
  [v4 setInertialProjectionDeceleration:0.996];
  double v5 = 0.85;
  if (v3)
  {
    double v5 = 1.0;
    double v6 = 1.0;
  }
  else
  {
    double v6 = 0.8;
  }
  [v4 setDampingRatio:v5 response:0.5];
  [v4 setTrackingDampingRatio:v6 response:0.4 dampingRatioSmoothing:0.08 responseSmoothing:0.08];
  return v4;
}

- (UIViewSpringAnimationBehavior)animationBehavior
{
  animationBehavior = self->_animationBehavior;
  if (!animationBehavior)
  {
    int v4 = [(_UIContextMenuPanController *)self _createAnimationBehaviorWithCriticalDamping:0];
    double v5 = self->_animationBehavior;
    self->_animationBehavior = v4;

    animationBehavior = self->_animationBehavior;
  }
  return animationBehavior;
}

- (id)criticallyDampedAnimationBehavior
{
  return [(_UIContextMenuPanController *)self _createAnimationBehaviorWithCriticalDamping:1];
}

- (void)_animationsForPreviewPlusActionsStyleWithTranslation:(CAPoint3D)a3 location:(CAPoint3D)a4
{
  double y = a4.y;
  double z = a3.z;
  double v6 = a3.y;
  double x = a3.x;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  double v9 = [(_UIContextMenuPanController *)self platterView];
  [v9 bounds];
  double Height = CGRectGetHeight(v71);
  [v9 bounds];
  double Width = CGRectGetWidth(v72);
  -[_UIContextMenuPanController _rubberBandedTranslationForGestureTranslation:](self, "_rubberBandedTranslationForGestureTranslation:", x, v6, z);
  CGFloat v14 = v13;
  CGFloat v15 = v12;
  double v17 = v16;
  long long v52 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v54 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v68.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v68.c = v52;
  long long v50 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v68.tdouble x = v50;
  if (v12 <= 0.0)
  {
    double v22 = fabs(v12) / (Height + -198.0);
    CGFloat v23 = fmax(fmin(1.0 - v22 + fmin(198.0 / Height, 1.0) * v22, 1.0), 0.35);
    CGAffineTransformMakeScale(&v68, v23, v23);
  }
  else
  {
    double v18 = fmax(fmin(1.0 - v12 / 250.0 + v12 / 250.0 * 0.7, 1.0), 0.7);
    [v9 center];
    double v20 = y - v19;
    CGAffineTransformMakeTranslation(&v68, 0.0, v20);
    CGAffineTransform v66 = v68;
    CGAffineTransformScale(&v67, &v66, v18, v18);
    CGAffineTransform v68 = v67;
    double v21 = -v20 / v18;
    if (v20 < 0.0) {
      double v21 = v18 * -v20;
    }
    CGAffineTransform v66 = v68;
    CGAffineTransformTranslate(&v67, &v66, 0.0, v21);
    CGAffineTransform v68 = v67;
  }
  CGAffineTransform v65 = v68;
  objc_msgSend(v9, "setTransform:", &v65, v50, v52, v54);
  memset(&v67, 0, sizeof(v67));
  CGAffineTransformMakeTranslation(&v67, v14, v15);
  [v9 frame];
  double v24 = (Height - CGRectGetHeight(v73)) * 0.5;
  if (v24 < 0.0) {
    double v24 = 0.0;
  }
  v67.tdouble y = v67.ty + v24;
  if (v67.ty < 0.0)
  {
    [(_UIContextMenuPanController *)self menuAnchor];
    if (v64 == 4)
    {
      [v9 frame];
      double v25 = (Width - CGRectGetWidth(v74)) * 0.5;
      if (v25 >= 0.0) {
        double v26 = v25;
      }
      else {
        double v26 = 0.0;
      }
      [(_UIContextMenuPanController *)self menuAnchor];
      if (v63 == 8)
      {
        double v27 = v26 + v67.tx;
      }
      else
      {
        if (v63 != 2) {
          goto LABEL_18;
        }
        double v27 = v67.tx - v26;
      }
      v67.tdouble x = v27;
    }
  }
LABEL_18:
  objc_msgSend(v9, "setCenter:", vaddq_f64(*(float64x2_t *)&v67.tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&v67.a, self->_originalPlatterCenter.x), vmulq_n_f64(*(float64x2_t *)&v67.c, self->_originalPlatterCenter.y))));
  double v28 = [v9 layer];
  [v28 setZPosition:v17];

  double v29 = [(_UIContextMenuPanController *)self menuView];
  if (v29)
  {
    [(_UIContextMenuPanController *)self originalMenuCenter];
    double v31 = v30;
    [(_UIContextMenuPanController *)self originalPlatterCenter];
    double v33 = v31 - v32;
    double v34 = Height * 0.5;
    if (v33 > 0.0) {
      double v34 = -(Height * 0.5);
    }
    double v35 = v33 + v34;
    [(_UIContextMenuPanController *)self menuAnchor];
    double v36 = 1.0;
    if (v61 == 4) {
      double v37 = 1.0;
    }
    else {
      double v37 = 0.5;
    }
    if (v61 == 1) {
      double v37 = 0.0;
    }
    if (v62 == 1) {
      double v37 = 0.0;
    }
    if (v62 == 4) {
      double v38 = 1.0;
    }
    else {
      double v38 = v37;
    }
    objc_msgSend(v29, "center", v37);
    double v40 = v39;
    [v9 frame];
    double MinY = CGRectGetMinY(v75);
    [v9 frame];
    double v42 = MinY + v38 * CGRectGetHeight(v76);
    *(_OWORD *)&v66.a = v55;
    *(_OWORD *)&v66.c = v53;
    *(_OWORD *)&v66.tdouble x = v51;
    if (self->_clientAllowsDismissal)
    {
      BOOL v43 = [(_UIContextMenuPanController *)self _canSwipeDownToDismiss];
      BOOL v44 = 1;
      if (v15 > 50.0 && v43)
      {
        CGAffineTransformMakeScale(&v66, 0.2, 0.2);
        BOOL v44 = 0;
        double v36 = 0.0;
      }
    }
    else
    {
      BOOL v44 = 1;
    }
    if (self->_menuViewIsVisible != v44)
    {
      self->_menuViewIsVisible = v44;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      CGFloat v45 = [(_UIContextMenuPanController *)self accessoryViews];
      uint64_t v46 = [v45 countByEnumeratingWithState:&v57 objects:v69 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v58 != v48) {
              objc_enumerationMutation(v45);
            }
            [*(id *)(*((void *)&v57 + 1) + 8 * i) setVisible:self->_menuViewIsVisible animated:1];
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v57 objects:v69 count:16];
        }
        while (v47);
      }
    }
    objc_msgSend(v29, "setCenter:", v40, v35 + v42);
    CGAffineTransform v56 = v66;
    [v29 setTransform:&v56];
    [v29 setAlpha:v36];
  }
}

- (void)_animationsForActionsStyleWithLocation:(CAPoint3D)a3 ended:(BOOL)a4
{
  BOOL v4 = a4;
  double z = a3.z;
  double y = a3.y;
  double x = a3.x;
  double v9 = [(_UIContextMenuPanController *)self platterView];
  double v10 = [(_UIContextMenuPanController *)self menuView];
  if (v4)
  {
    [(_UIContextMenuPanController *)self originalPlatterCenter];
    objc_msgSend(v9, "setCenter:");
    double defaultZPosition = self->_defaultZPosition;
    double v12 = [v9 layer];
    [v12 setZPosition:defaultZPosition];

    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v41[0] = *MEMORY[0x1E4F1DAB8];
    v41[1] = v13;
    v41[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v10 setTransform:v41];
  }
  else
  {
    if (![(_UIContextMenuPanController *)self _initialPointInPlatterIsValid])
    {
      [v9 frame];
      v42.double x = x;
      v42.double y = y;
      if (CGRectContainsPoint(v44, v42))
      {
        self->_initialLocationInsidePreview.double x = x;
        self->_initialLocationInsidePreview.double y = y;
      }
    }
    if ([(_UIContextMenuPanController *)self _initialPointInPlatterIsValid])
    {
      -[_UIContextMenuPanController _rubberBandedTranslationForGestureTranslation:](self, "_rubberBandedTranslationForGestureTranslation:", x - self->_initialLocationInsidePreview.x, y - self->_initialLocationInsidePreview.y, z - self->_defaultZPosition);
      memset(&v40, 0, sizeof(v40));
      CGAffineTransformMakeTranslation(&v40, v14, v15);
      [(_UIContextMenuPanController *)self originalPlatterCenter];
      double v18 = v40.tx + v16 * v40.a + v17 * v40.c;
      double v19 = v40.ty + v16 * v40.b + v17 * v40.d;
      [(_UIContextMenuPanController *)self originalPlatterCenter];
      double v21 = v20;
      double v23 = v22;
      [(_UIContextMenuPanController *)self originalMenuCenter];
      double v25 = v24;
      double v27 = v26;
      [(_UIContextMenuPanController *)self menuAnchor];
      double v28 = vabdd_f64(v27, v23);
      double v29 = vabdd_f64(v25, v21);
      switch(v39)
      {
        case 1:
          double v28 = v27 + v28;
          if (v19 < v28) {
            double v19 = v28;
          }
          break;
        case 2:
          double v28 = v25 + v29;
          if (v18 < v25 + v29) {
            double v18 = v25 + v29;
          }
          break;
        case 4:
          double v28 = v27 - v28;
          if (v19 >= v28) {
            double v19 = v28;
          }
          break;
        case 8:
          double v28 = v25 - v29;
          if (v18 >= v25 - v29) {
            double v18 = v25 - v29;
          }
          break;
        default:
          break;
      }
      objc_msgSend(v10, "frame", v28, v29);
      v43.double x = x;
      v43.double y = y;
      if (!CGRectContainsPoint(v45, v43)) {
        objc_msgSend(v9, "setCenter:", v18, v19);
      }
    }
    double v30 = [v10 traitCollection];
    double v31 = _UIContextMenuGetPlatformMetrics([v30 userInterfaceIdiom]);

    double currentDistanceToMenuScrubPath = self->_currentDistanceToMenuScrubPath;
    [(_UIContextMenuPanController *)self _dragTearOffThreshold];
    double v34 = currentDistanceToMenuScrubPath / v33;
    [v31 menuMinimumScale];
    CGFloat v36 = fmax(v35, fmin(1.0 - v34 + v34 * 0.95, 1.0));
    CGAffineTransformMakeScale(&v38, v36, v36);
    CGAffineTransform v37 = v38;
    [v10 setTransform:&v37];
  }
}

- (void)_animationsForAnyAttachedAccessoryViews
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  BOOL v3 = [(_UIContextMenuPanController *)self accessoryViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v39;
    double v35 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v36 = *MEMORY[0x1E4F1DB28];
    double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v34 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v39 != v6) {
        objc_enumerationMutation(v3);
      }
      double v8 = *(void **)(*((void *)&v38 + 1) + 8 * v7);
      if (!objc_msgSend(v8, "trackingAxis", *(void *)&v33, *(void *)&v34, *(void *)&v35, *(void *)&v36)) {
        break;
      }
      uint64_t v9 = [v8 location];
      if (v9 == 1)
      {
        CGFloat v14 = [(_UIContextMenuPanController *)self platterView];
      }
      else
      {
        if (v9 != 2)
        {
          CGFloat v10 = v33;
          CGFloat v11 = v34;
          CGFloat v12 = v35;
          CGFloat v13 = v36;
          if (!v9) {
            break;
          }
          goto LABEL_14;
        }
        CGFloat v14 = [(_UIContextMenuPanController *)self menuView];
      }
      CGFloat v15 = v14;
      [v14 frame];
      CGFloat v13 = v16;
      CGFloat v12 = v17;
      CGFloat v11 = v18;
      CGFloat v10 = v19;

LABEL_14:
      [v8 center];
      double v21 = v20;
      double v23 = v22;
      if (v8)
      {
        [v8 anchor];
        uint64_t v24 = v37 - 1;
        double v25 = 0.5;
        double v26 = 0.5;
        if ((unint64_t)(v37 - 1) <= 7)
        {
          double v25 = dbl_186B94058[v24];
          double v26 = dbl_186B94098[v24];
        }
      }
      else
      {
        double v25 = 0.5;
        double v26 = 0.5;
        long long v37 = 0u;
      }
      switch(*((void *)&v37 + 1))
      {
        case 1:
          double v25 = 0.0;
          break;
        case 2:
          double v26 = 0.0;
          break;
        case 4:
          double v25 = 1.0;
          break;
        case 8:
          double v26 = 1.0;
          break;
        default:
          break;
      }
      if ([v8 trackingAxis])
      {
        v44.origin.double x = v13;
        v44.origin.double y = v12;
        v44.size.double width = v11;
        v44.size.double height = v10;
        double MinX = CGRectGetMinX(v44);
        v45.origin.double x = v13;
        v45.origin.double y = v12;
        v45.size.double width = v11;
        v45.size.double height = v10;
        double v28 = MinX + v26 * CGRectGetWidth(v45);
        [v8 offset];
        double v21 = v28 + v29;
      }
      if (([v8 trackingAxis] & 2) != 0)
      {
        v46.origin.double x = v13;
        v46.origin.double y = v12;
        v46.size.double width = v11;
        v46.size.double height = v10;
        double MinY = CGRectGetMinY(v46);
        v47.origin.double x = v13;
        v47.origin.double y = v12;
        v47.size.double width = v11;
        v47.size.double height = v10;
        double v31 = MinY + v25 * CGRectGetHeight(v47);
        [v8 offset];
        double v23 = v31 + v32;
      }
      objc_msgSend(v8, "setCenter:", v21, v23);
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)_initialPointInPlatterIsValid
{
  return self->_initialLocationInsidePreview.y != 1.79769313e308
      || self->_initialLocationInsidePreview.x != 1.79769313e308;
}

- (void)scrollObservationInteraction:(id)a3 willBeginAtLocation:(CGPoint)a4
{
}

- (void)scrollObservationInteraction:(id)a3 didUpdateWithTranslation:(CGPoint)a4 location:(CGPoint)a5 ended:(BOOL)a6
{
  if (a6) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 2;
  }
  -[_UIContextMenuPanController _updateForGestureWithState:translation:location:allowsDragging:](self, "_updateForGestureWithState:translation:location:allowsDragging:", v6, 0, a4.x, a4.y, 0.0, a5.x, a5.y, 0.0);
}

- (int64_t)_userInterfaceIdiom
{
  double v2 = [(_UIContextMenuPanController *)self platterView];
  BOOL v3 = [v2 traitCollection];
  int64_t v4 = [v3 userInterfaceIdiom];

  return v4;
}

- (id)_currentPlatformMetrics
{
  uint64_t v2 = [(_UIContextMenuPanController *)self _userInterfaceIdiom];
  return _UIContextMenuGetPlatformMetrics(v2);
}

- (CAPoint3D)_rubberBandedTranslationForGestureTranslation:(CAPoint3D)a3
{
  double z = a3.z;
  double y = a3.y;
  double x = a3.x;
  [(_UIContextMenuPanController *)self _rangeOfMotion];
  double v8 = v7;
  [(_UIContextMenuPanController *)self _dragTearOffThreshold];
  double v10 = v9;
  if ([(_UIContextMenuPanController *)self rubberbandingEdges] == 15 || y < -v8)
  {
    double v14 = y + v8;
    double v15 = hypot(x, v14);
    double v16 = +[UIDevice currentDevice];
    double v17 = _UIContextMenuGetPlatformMetrics([v16 userInterfaceIdiom]);

    [v17 previewRubberbandingCoefficient];
    if (v15 <= 0.0)
    {
      if (v15 < 0.0) {
        double v15 = -((1.0 - 1.0 / (1.0 - v15 / v10 * v18)) * v10);
      }
    }
    else
    {
      double v15 = v10 * (1.0 - 1.0 / (v15 / v10 * v18 + 1.0));
    }

    double v19 = atan2(v14, x);
    __double2 v20 = __sincos_stret(v19);
    double x = v15 * v20.__cosval;
    double y = v15 * v20.__sinval - v8;
  }
  else
  {
    CGFloat v11 = +[UIDevice currentDevice];
    CGFloat v12 = _UIContextMenuGetPlatformMetrics([v11 userInterfaceIdiom]);

    [v12 previewRubberbandingCoefficient];
    if (x <= 0.0)
    {
      if (x < 0.0) {
        double x = -((1.0 - 1.0 / (1.0 - x / v10 * v13)) * v10);
      }
    }
    else
    {
      double x = v10 * (1.0 - 1.0 / (x / v10 * v13 + 1.0));
    }
  }
  double v21 = x;
  double v22 = y;
  double v23 = z;
  result.double z = v23;
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (void)_updatePlatterGestureDebugUIWithTranslation:(CGPoint)a3 location:(CGPoint)a4 invalidate:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_ClickUIDebugEnabled, @"ClickUIDebugEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| !byte_1E8FD4F1C)
  {
    return;
  }
  if (!_MergedGlobals_16)
  {
    CGFloat v11 = +[UIColor systemOrangeColor];
    uint64_t v12 = +[_UIDebugDot dotWithTitle:@"Translated Platter Center" color:v11];
    double v13 = (void *)_MergedGlobals_16;
    _MergedGlobals_16 = v12;

    BOOL v5 = 1;
  }
  if (!qword_1E8FDE298)
  {
    double v14 = +[UIColor blueColor];
    uint64_t v15 = +[_UIDebugDot dotWithTitle:@"Rubberbanded Platter Center" color:v14];
    double v16 = (void *)qword_1E8FDE298;
    qword_1E8FDE298 = v15;
  }
  if (!qword_1E8FDE2A0)
  {
    double v17 = +[UIColor brownColor];
    uint64_t v18 = +[_UIDebugDot dotWithTitle:@"Original Platter Center" color:v17];
    double v19 = (void *)qword_1E8FDE2A0;
    qword_1E8FDE2A0 = v18;
  }
  if (!qword_1E8FDE2A8)
  {
    __double2 v20 = +[UIColor redColor];
    uint64_t v21 = +[_UIDebugDot dotWithTitle:@"Actual Touch" color:v20];
    double v22 = (void *)qword_1E8FDE2A8;
    qword_1E8FDE2A8 = v21;
  }
  if (v5)
  {
    [(id)qword_1E8FDE2B0 removeFromSuperview];
    double v23 = (void *)qword_1E8FDE2B0;
    qword_1E8FDE2B0 = 0;
  }
  if (!qword_1E8FDE2B0)
  {
    uint64_t v24 = objc_opt_new();
    double v25 = (void *)qword_1E8FDE2B0;
    qword_1E8FDE2B0 = v24;

    id v26 = +[UIColor redColor];
    uint64_t v27 = [v26 CGColor];
    double v28 = [(id)qword_1E8FDE2B0 shapeLayer];
    [v28 setFillColor:v27];

    double v29 = [(UIBezierPath *)self->_menuScrubPath CGPath];
    double v30 = [(id)qword_1E8FDE2B0 shapeLayer];
    [v30 setPath:v29];

    [(id)qword_1E8FDE2B0 setAlpha:0.2];
  }
  if (![(_UIContextMenuPanController *)self _canSwipeDownToDismiss])
  {
    if (!qword_1E8FDE2B8)
    {
      uint64_t v31 = objc_opt_new();
      double v32 = (void *)qword_1E8FDE2B8;
      qword_1E8FDE2B8 = v31;

      double v33 = +[UIColor redColor];
      [(id)qword_1E8FDE2B8 setBackgroundColor:v33];

      double v34 = +[UIColor whiteColor];
      [(id)qword_1E8FDE2B8 setTextColor:v34];

      double v35 = [off_1E52D39B8 monospacedSystemFontOfSize:15.0 weight:*(double *)off_1E52D6BF0];
      [(id)qword_1E8FDE2B8 setFont:v35];
    }
    double v36 = [(_UIContextMenuPanController *)self containerView];
    [v36 addSubview:qword_1E8FDE2B8];

    long long v37 = [NSString stringWithFormat:@"Distance from path edge: %.2f", *(void *)&self->_currentDistanceToMenuScrubPath];
    [(id)qword_1E8FDE2B8 setText:v37];

    [(id)qword_1E8FDE2B8 setTextAlignment:1];
    [(id)qword_1E8FDE2B8 sizeToFit];
    [(id)qword_1E8FDE2B8 setClipsToBounds:1];
    [(id)qword_1E8FDE2B8 _setContinuousCornerRadius:4.0];
    long long v38 = [(_UIContextMenuPanController *)self containerView];
    [v38 safeAreaInsets];
    double v40 = v39;

    if (v40 < 8.0) {
      double v40 = 8.0;
    }
    long long v41 = [(_UIContextMenuPanController *)self containerView];
    [v41 safeAreaInsets];
    double v43 = v42;

    if (v43 < 8.0) {
      double v43 = 8.0;
    }
    [(id)qword_1E8FDE2B8 bounds];
    CGRect v68 = CGRectInset(v67, -4.0, -1.0);
    objc_msgSend((id)qword_1E8FDE2B8, "setFrame:", v40, v43, v68.size.width, v68.size.height);
  }
  if (qword_1E8FDE2C0)
  {
    if (v5)
    {
LABEL_25:
      CGRect v44 = [(_UIContextMenuPanController *)self platterView];
      [v44 center];
      objc_msgSend((id)qword_1E8FDE2A0, "setCenter:");

      CGRect v45 = [(_UIContextMenuPanController *)self platterView];
      [v45 center];
      objc_msgSend((id)qword_1E8FDE298, "setCenter:");

      CGRect v46 = [(_UIContextMenuPanController *)self platterView];
      [v46 center];
      objc_msgSend((id)_MergedGlobals_16, "setCenter:");

      goto LABEL_28;
    }
  }
  else
  {
    CGRect v47 = +[UIColor purpleColor];
    uint64_t v48 = +[_UIDebugDot dotWithTitle:@"Menu Anchor Point" color:v47];
    v49 = (void *)qword_1E8FDE2C0;
    qword_1E8FDE2C0 = v48;

    if (v5) {
      goto LABEL_25;
    }
  }
  -[_UIContextMenuPanController _rubberBandedTranslationForGestureTranslation:](self, "_rubberBandedTranslationForGestureTranslation:", v9, v8, 0.0);
  CGFloat v51 = v50;
  CGFloat v53 = v52;
  CGAffineTransformMakeTranslation(&v66, v9, v8);
  CGAffineTransform v65 = v66;
  [(id)_MergedGlobals_16 setTransform:&v65];
  CGAffineTransformMakeTranslation(&v64, v51, v53);
  CGAffineTransform v63 = v64;
  [(id)qword_1E8FDE298 setTransform:&v63];
  objc_msgSend((id)qword_1E8FDE2A8, "setCenter:", x, y);
LABEL_28:
  long long v54 = [(_UIContextMenuPanController *)self menuView];
  [v54 center];
  objc_msgSend((id)qword_1E8FDE2C0, "setCenter:");

  long long v55 = [(id)qword_1E8FDE2B0 superview];

  if (!v55)
  {
    CGAffineTransform v56 = [(_UIContextMenuPanController *)self platterView];
    long long v57 = [v56 superview];
    long long v58 = v57;
    if (v57)
    {
      id v59 = v57;
    }
    else
    {
      long long v60 = [(_UIContextMenuPanController *)self menuView];
      id v59 = [v60 superview];
    }
    [v59 addSubview:qword_1E8FDE2B0];
    [v59 addSubview:qword_1E8FDE2A8];
    uint64_t v61 = [(_UIContextMenuPanController *)self platterView];

    if (v61)
    {
      [v59 addSubview:qword_1E8FDE2A0];
      [v59 addSubview:qword_1E8FDE298];
      [v59 addSubview:_MergedGlobals_16];
    }
    uint64_t v62 = [(_UIContextMenuPanController *)self menuView];

    if (v62) {
      [v59 addSubview:qword_1E8FDE2C0];
    }
  }
}

- (_UIContextMenuPanControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIContextMenuPanControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)platterPivotRotationEnabled
{
  return self->_platterPivotRotationEnabled;
}

- (void)setPlatterPivotRotationEnabled:(BOOL)a3
{
  self->_platterPivotRotationEnabled = a3;
}

- (NSArray)detents
{
  return self->_detents;
}

- (CGPoint)originalPlatterCenter
{
  double x = self->_originalPlatterCenter.x;
  double y = self->_originalPlatterCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)originalMenuCenter
{
  double x = self->_originalMenuCenter.x;
  double y = self->_originalMenuCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- ($9638EFF0CCCAFE90921E224CC361F7AC)menuAnchor
{
  long long v3 = *(_OWORD *)&self[5].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[4].var3;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = *(void *)&self[5].var2;
  return self;
}

- (void)setMenuAnchor:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2;
  self->_menuAnchor.gravitdouble y = a3->var4;
  *(_OWORD *)&self->_menuAnchor.attachmentOffset = v4;
  *(_OWORD *)&self->_menuAnchor.attachment = v3;
}

- (unint64_t)rubberbandingEdges
{
  return self->_rubberbandingEdges;
}

- (void)setRubberbandingEdges:(unint64_t)a3
{
  self->_rubberbandingEdges = a3;
}

- (NSArray)accessoryViews
{
  return self->_accessoryViews;
}

- (void)setAccessoryViews:(id)a3
{
}

- (UIView)menuView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuView);
  return (UIView *)WeakRetained;
}

- (void)setMenuView:(id)a3
{
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  return (UIView *)WeakRetained;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)platterView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platterView);
  return (UIView *)WeakRetained;
}

- (void)setPlatterView:(id)a3
{
}

- (_UIVelocityIntegrator)velocityIntegrator
{
  return self->_velocityIntegrator;
}

- (void)setVelocityIntegrator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_velocityIntegrator, 0);
  objc_destroyWeak((id *)&self->_platterView);
  objc_destroyWeak((id *)&self->_containerView);
  objc_destroyWeak((id *)&self->_menuView);
  objc_storeStrong((id *)&self->_accessoryViews, 0);
  objc_storeStrong((id *)&self->_detents, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_animationBehavior, 0);
  objc_storeStrong((id *)&self->_menuScrubPath, 0);
}

@end
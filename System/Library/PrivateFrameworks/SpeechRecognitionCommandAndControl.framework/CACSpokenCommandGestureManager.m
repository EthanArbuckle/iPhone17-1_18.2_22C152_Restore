@interface CACSpokenCommandGestureManager
+ (id)allManagers;
+ (id)carScreenGestureManager;
+ (id)defaultGestureManager;
+ (id)mainScreenGestureManager;
+ (id)managerForDisplayID:(unsigned int)a3;
+ (void)initializeSharedManagerTable;
- (AXPIFingerController)fingerController;
- (BOOL)didStart3DTouch;
- (BOOL)didStartDrag;
- (BOOL)isIn3DTouchGesture;
- (BOOL)isInDragGesture;
- (BOOL)isInGesture;
- (BOOL)shouldHoldStartPointForDrag;
- (CACSpokenCommandGestureManager)initWithDisplayID:(unsigned int)a3;
- (CGPoint)_fingerControllerPointForPortraitUpPoint:(CGPoint)a3;
- (CGPoint)_pointForGestureGivenPortraitUpPoint:(CGPoint)a3;
- (CGPoint)_pointForGestureGivenPortraitUpPoint:(CGPoint)a3 shouldToggleSelectionOptions:(BOOL)a4;
- (CGPoint)defaultPortraitUpPointForGestures;
- (CGPoint)startPointFor3DTouch;
- (CGPoint)startPointForDrag;
- (void)_adjust3DTouchToForce:(double)a3;
- (void)_clearStateFlags;
- (void)_performGesture:(id)a3;
- (void)_startDragWithHold:(BOOL)a3 atPoint:(CGPoint)a4;
- (void)endDragAtPoint:(CGPoint)a3;
- (void)maximize3DTouch;
- (void)performDoubleTapAtPoint:(CGPoint)a3 numberOfFingers:(unint64_t)a4;
- (void)performLongPressAtPoint:(CGPoint)a3 numberOfFingers:(unint64_t)a4;
- (void)performPinchInGestureAtPoint:(CGPoint)a3;
- (void)performPinchOutGestureAtPoint:(CGPoint)a3;
- (void)performRotateLeftGestureAtPoint:(CGPoint)a3;
- (void)performRotateRightGestureAtPoint:(CGPoint)a3;
- (void)performSwipeGestureAtPoint:(CGPoint)a3 inDirection:(int64_t)a4 fast:(BOOL)a5 numberOfFingers:(unint64_t)a6;
- (void)performTapAtPoint:(CGPoint)a3 numberOfFingers:(unint64_t)a4;
- (void)resetState;
- (void)reveal3DTouchActions;
- (void)setDefaultPortraitUpPointForGestures:(CGPoint)a3;
- (void)setDidStart3DTouch:(BOOL)a3;
- (void)setDidStartDrag:(BOOL)a3;
- (void)setShouldHoldStartPointForDrag:(BOOL)a3;
- (void)setStartPointFor3DTouch:(CGPoint)a3;
- (void)setStartPointForDrag:(CGPoint)a3;
- (void)start3DTouchAtPoint:(CGPoint)a3;
- (void)startDragAtPoint:(CGPoint)a3;
- (void)startHoldAndDragAtPoint:(CGPoint)a3;
@end

@implementation CACSpokenCommandGestureManager

- (CACSpokenCommandGestureManager)initWithDisplayID:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CACSpokenCommandGestureManager;
  result = [(CACSpokenCommandGestureManager *)&v5 init];
  if (result) {
    result->_displayID = a3;
  }
  return result;
}

+ (void)initializeSharedManagerTable
{
  if (initializeSharedManagerTable_onceToken != -1) {
    dispatch_once(&initializeSharedManagerTable_onceToken, &__block_literal_global_11);
  }
}

uint64_t __62__CACSpokenCommandGestureManager_initializeSharedManagerTable__block_invoke()
{
  _sharedManagerTable = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)carScreenGestureManager
{
  v2 = +[CACDisplayManager sharedManager];
  uint64_t v3 = [v2 carPlayDisplayID];

  if (v3)
  {
    v4 = +[CACSpokenCommandGestureManager managerForDisplayID:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)mainScreenGestureManager
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
  uint64_t v3 = +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", [v2 _integerDisplayID]);

  return v3;
}

+ (id)allManagers
{
  [a1 initializeSharedManagerTable];
  id v2 = (id)_sharedManagerTable;
  objc_sync_enter(v2);
  uint64_t v3 = [(id)_sharedManagerTable allValues];
  objc_sync_exit(v2);

  return v3;
}

+ (id)defaultGestureManager
{
  uint64_t v3 = +[CACDisplayManager sharedManager];
  int v4 = [v3 carPlayConnected];

  if (v4) {
    [a1 carScreenGestureManager];
  }
  else {
  objc_super v5 = [a1 mainScreenGestureManager];
  }
  return v5;
}

+ (id)managerForDisplayID:(unsigned int)a3
{
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    [a1 initializeSharedManagerTable];
    id v4 = (id)_sharedManagerTable;
    objc_sync_enter(v4);
    objc_super v5 = (void *)_sharedManagerTable;
    v6 = [NSNumber numberWithUnsignedInt:v3];
    v7 = [v5 objectForKey:v6];

    if (!v7)
    {
      v7 = [[CACSpokenCommandGestureManager alloc] initWithDisplayID:v3];
      v8 = (void *)_sharedManagerTable;
      v9 = [NSNumber numberWithUnsignedInt:v3];
      [v8 setObject:v7 forKey:v9];
    }
    objc_sync_exit(v4);
  }
  else
  {
    v7 = [a1 defaultGestureManager];
  }
  return v7;
}

- (AXPIFingerController)fingerController
{
  fingerController = self->_fingerController;
  if (!fingerController)
  {
    id v4 = +[CACDisplayManager sharedManager];
    objc_super v5 = [v4 overlayViewForDisplayID:self->_displayID];

    id v6 = objc_alloc(MEMORY[0x263F21F08]);
    v7 = [v5 window];
    v8 = [v7 screen];
    v9 = [v8 displayConfiguration];
    v10 = [v9 hardwareIdentifier];
    v11 = (AXPIFingerController *)[v6 initWithDisplayUUID:v10];
    v12 = self->_fingerController;
    self->_fingerController = v11;

    v13 = [(AXPIFingerController *)self->_fingerController fingerContainerView];
    [v5 bounds];
    objc_msgSend(v13, "setFrame:");
    [v13 setAutoresizingMask:18];
    [v5 addSubview:v13];

    fingerController = self->_fingerController;
  }
  return fingerController;
}

- (CGPoint)_fingerControllerPointForPortraitUpPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  objc_super v5 = [(CACSpokenCommandGestureManager *)self fingerController];
  id v6 = [v5 fingerContainerView];
  double v7 = CACViewPointFromPortraitUpPoint(v6, x, y);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (void)_performGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(CACSpokenCommandGestureManager *)self fingerController];
  [v5 performGesture:v4];
}

- (void)performPinchInGestureAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v18 = [(CACSpokenCommandGestureManager *)self fingerController];
  id v6 = (void *)MEMORY[0x263F22900];
  -[CACSpokenCommandGestureManager _pointForGestureGivenPortraitUpPoint:](self, "_pointForGestureGivenPortraitUpPoint:", x, y);
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CACSpokenCommandGestureManager *)self fingerController];
  v12 = [v11 fingerContainerView];
  [v12 bounds];
  v17 = objc_msgSend(v6, "pinchInGestureWithPoint:bounds:", v8, v10, v13, v14, v15, v16);
  [v18 performGesture:v17];
}

- (void)performPinchOutGestureAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v18 = [(CACSpokenCommandGestureManager *)self fingerController];
  id v6 = (void *)MEMORY[0x263F22900];
  -[CACSpokenCommandGestureManager _pointForGestureGivenPortraitUpPoint:](self, "_pointForGestureGivenPortraitUpPoint:", x, y);
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CACSpokenCommandGestureManager *)self fingerController];
  v12 = [v11 fingerContainerView];
  [v12 bounds];
  v17 = objc_msgSend(v6, "pinchOutGestureWithPoint:bounds:", v8, v10, v13, v14, v15, v16);
  [v18 performGesture:v17];
}

- (void)performRotateRightGestureAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v18 = [(CACSpokenCommandGestureManager *)self fingerController];
  id v6 = (void *)MEMORY[0x263F22900];
  -[CACSpokenCommandGestureManager _pointForGestureGivenPortraitUpPoint:](self, "_pointForGestureGivenPortraitUpPoint:", x, y);
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CACSpokenCommandGestureManager *)self fingerController];
  v12 = [v11 fingerContainerView];
  [v12 bounds];
  v17 = objc_msgSend(v6, "rotateRightGestureWithPoint:bounds:", v8, v10, v13, v14, v15, v16);
  [v18 performGesture:v17];
}

- (void)performRotateLeftGestureAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v18 = [(CACSpokenCommandGestureManager *)self fingerController];
  id v6 = (void *)MEMORY[0x263F22900];
  -[CACSpokenCommandGestureManager _pointForGestureGivenPortraitUpPoint:](self, "_pointForGestureGivenPortraitUpPoint:", x, y);
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CACSpokenCommandGestureManager *)self fingerController];
  v12 = [v11 fingerContainerView];
  [v12 bounds];
  v17 = objc_msgSend(v6, "rotateLeftGestureWithPoint:bounds:", v8, v10, v13, v14, v15, v16);
  [v18 performGesture:v17];
}

- (CGPoint)_pointForGestureGivenPortraitUpPoint:(CGPoint)a3
{
  -[CACSpokenCommandGestureManager _pointForGestureGivenPortraitUpPoint:shouldToggleSelectionOptions:](self, "_pointForGestureGivenPortraitUpPoint:shouldToggleSelectionOptions:", 0, a3.x, a3.y);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)_pointForGestureGivenPortraitUpPoint:(CGPoint)a3 shouldToggleSelectionOptions:(BOOL)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = self;
  double v7 = *MEMORY[0x263F00148];
  double v8 = *(double *)(MEMORY[0x263F00148] + 8);
  if (a3.x != *MEMORY[0x263F00148] || a3.y != v8) {
    goto LABEL_20;
  }
  if (a4)
  {
    double v10 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    double v11 = [v10 focusedElement];

    if (v11)
    {
      uint64_t v12 = [v11 selectedTextRange];
      if (v12 != 0x7FFFFFFF)
      {
        objc_msgSend(v11, "boundsForTextRange:", v12, 0);
        CGFloat v13 = v26.origin.x;
        CGFloat v14 = v26.origin.y;
        CGFloat width = v26.size.width;
        CGFloat height = v26.size.height;
        BOOL v17 = CGRectEqualToRect(v26, *MEMORY[0x263F001A8]);
        double x = *MEMORY[0x263F001A0];
        double y = *(double *)(MEMORY[0x263F001A0] + 8);
        if (v17
          || (v27.origin.double x = v13,
              v27.origin.double y = v14,
              v27.size.CGFloat width = width,
              v27.size.CGFloat height = height,
              CGRectEqualToRect(v27, *MEMORY[0x263F001A0])))
        {
          [v11 performAction:2057];
        }
        else
        {
          AX_CGRectGetCenter();
          -[CACSpokenCommandGestureManager _fingerControllerPointForPortraitUpPoint:](v6, "_fingerControllerPointForPortraitUpPoint:");
          double x = v18;
          double y = v19;
        }
      }
    }
  }
  if (x == v7 && y == v8)
  {
    [(CACSpokenCommandGestureManager *)v6 defaultPortraitUpPointForGestures];
    self = v6;
LABEL_20:
    [(CACSpokenCommandGestureManager *)self _fingerControllerPointForPortraitUpPoint:a4];
    double x = v21;
    double y = v22;
  }
  double v23 = x;
  double v24 = y;
  result.double y = v24;
  result.double x = v23;
  return result;
}

- (void)performSwipeGestureAtPoint:(CGPoint)a3 inDirection:(int64_t)a4 fast:(BOOL)a5 numberOfFingers:(unint64_t)a6
{
  BOOL v7 = a5;
  v47[2] = *MEMORY[0x263EF8340];
  -[CACSpokenCommandGestureManager _pointForGestureGivenPortraitUpPoint:](self, "_pointForGestureGivenPortraitUpPoint:", a3.x, a3.y);
  double v11 = v10;
  double v13 = v12;
  if (!v7)
  {
    v29 = [(CACSpokenCommandGestureManager *)self fingerController];
    v30 = [v29 fingerContainerView];
    [v30 bounds];
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;

    v52.origin.double x = v32;
    v52.origin.double y = v34;
    v52.size.CGFloat width = v36;
    v52.size.CGFloat height = v38;
    double Width = CGRectGetWidth(v52);
    v53.origin.double x = v32;
    v53.origin.double y = v34;
    v53.size.CGFloat width = v36;
    v53.size.CGFloat height = v38;
    double Height = CGRectGetHeight(v53);
    if (Width < Height) {
      double Height = Width;
    }
    double v41 = Height * 0.25;
    switch(a4)
    {
      case 0:
        double v42 = v11 - fmin(v41, v11);
        goto LABEL_13;
      case 1:
        v54.origin.double x = v32;
        v54.origin.double y = v34;
        v54.size.CGFloat width = v36;
        v54.size.CGFloat height = v38;
        double v42 = v11 + fmin(v41, CGRectGetMaxX(v54) - v11);
LABEL_13:
        double v44 = v13;
        break;
      case 2:
        double v44 = v13 - fmin(v41, v13);
        goto LABEL_16;
      case 3:
        v55.origin.double x = v32;
        v55.origin.double y = v34;
        v55.size.CGFloat width = v36;
        v55.size.CGFloat height = v38;
        double v44 = v13 + fmin(v41, CGRectGetMaxY(v55) - v13);
LABEL_16:
        double v42 = v11;
        break;
      default:
        double v42 = 0.0;
        double v44 = 0.0;
        break;
    }
    v45 = (void *)MEMORY[0x263F22900];
    v50.double x = v11;
    v50.double y = v13;
    double v23 = NSStringFromCGPoint(v50);
    v46[0] = v23;
    v51.double x = v42;
    v51.double y = v44;
    double v24 = NSStringFromCGPoint(v51);
    v46[1] = v24;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
    double v28 = 0.6;
    CGRect v26 = v45;
    CGRect v27 = v25;
    goto LABEL_18;
  }
  double v14 = 0.0;
  if ((unint64_t)a4 <= 3) {
    double v14 = dbl_238415C00[a4];
  }
  double v15 = [(CACSpokenCommandGestureManager *)self fingerController];
  double v16 = [v15 fingerContainerView];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;

  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    __double2 v21 = __sincos_stret(v14);
    double v22 = (void *)MEMORY[0x263F22900];
    v48.double x = v11;
    v48.double y = v13;
    double v23 = NSStringFromCGPoint(v48);
    v47[0] = v23;
    v49.double x = v11 + v21.__cosval * 100.0;
    v49.double y = v13 + v21.__sinval * 100.0;
    double v24 = NSStringFromCGPoint(v49);
    v47[1] = v24;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];
    CGRect v26 = v22;
    CGRect v27 = v25;
    double v28 = fmax(v18 / v20 / 0.461538462, 1.0) * 0.1;
LABEL_18:
    v43 = [v26 lineGestureBetweenPoints:v27 duration:a6 numberOfFingers:v28];

    goto LABEL_19;
  }
  v43 = objc_msgSend(MEMORY[0x263F22900], "flickGestureAtPoint:angle:numberOfFingers:", a6, v11, v13, v14);
LABEL_19:
  [(CACSpokenCommandGestureManager *)self _performGesture:v43];
}

- (void)performTapAtPoint:(CGPoint)a3 numberOfFingers:(unint64_t)a4
{
  -[CACSpokenCommandGestureManager _pointForGestureGivenPortraitUpPoint:shouldToggleSelectionOptions:](self, "_pointForGestureGivenPortraitUpPoint:shouldToggleSelectionOptions:", a4 == 1, a3.x, a3.y);
  if (v7 != *MEMORY[0x263F001A0] || v6 != *(double *)(MEMORY[0x263F001A0] + 8))
  {
    objc_msgSend(MEMORY[0x263F22900], "tapGestureAtPoint:isDoubleTap:numberOfFingers:", 0, a4);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [(CACSpokenCommandGestureManager *)self _performGesture:v9];
  }
}

- (void)performDoubleTapAtPoint:(CGPoint)a3 numberOfFingers:(unint64_t)a4
{
  -[CACSpokenCommandGestureManager _pointForGestureGivenPortraitUpPoint:](self, "_pointForGestureGivenPortraitUpPoint:", a3.x, a3.y);
  objc_msgSend(MEMORY[0x263F22900], "tapGestureAtPoint:isDoubleTap:numberOfFingers:", 1, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(CACSpokenCommandGestureManager *)self _performGesture:v6];
}

- (void)performLongPressAtPoint:(CGPoint)a3 numberOfFingers:(unint64_t)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  -[CACSpokenCommandGestureManager _pointForGestureGivenPortraitUpPoint:](self, "_pointForGestureGivenPortraitUpPoint:", a3.x, a3.y);
  double v7 = v6;
  double v9 = v8;
  double v10 = (void *)MEMORY[0x263F21F18];
  double v11 = [(CACSpokenCommandGestureManager *)self fingerController];
  double v12 = [v11 fingerContainerView];
  [v12 bounds];
  double v17 = objc_msgSend(v10, "defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:", a4, v7, v9, v13, v14, v15, v16);

  double v18 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v17, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v19 = v17;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v32;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(v19);
        }
        double v24 = (void *)MEMORY[0x263F21F10];
        CGPoint v25 = CGPointFromString((NSString *)*(void *)(*((void *)&v31 + 1) + 8 * v23));
        CGRect v26 = objc_msgSend(v24, "fingerModelForLocation:", v25.x, v25.y);
        [v18 addObject:v26];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v21);
  }

  CGRect v27 = [(CACSpokenCommandGestureManager *)self fingerController];
  objc_msgSend(v27, "showFingerModels:animated:startPointForAnimation:", v18, 0, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

  double v28 = [(CACSpokenCommandGestureManager *)self fingerController];
  [v28 pressFingersDownAnimated:1];

  dispatch_time_t v29 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__CACSpokenCommandGestureManager_performLongPressAtPoint_numberOfFingers___block_invoke;
  block[3] = &unk_264D115D0;
  block[4] = self;
  dispatch_after(v29, MEMORY[0x263EF83A0], block);
}

void __74__CACSpokenCommandGestureManager_performLongPressAtPoint_numberOfFingers___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fingerController];
  [v2 liftFingersUpAnimated:1];

  id v3 = [*(id *)(a1 + 32) fingerController];
  objc_msgSend(v3, "clearAllFingersAnimated:endPointForAnimation:", 1, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

- (BOOL)isInDragGesture
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(CACSpokenCommandGestureManager *)v2 didStartDrag];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isIn3DTouchGesture
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(CACSpokenCommandGestureManager *)v2 didStart3DTouch];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isInGesture
{
  if ([(CACSpokenCommandGestureManager *)self isInDragGesture]) {
    return 1;
  }
  return [(CACSpokenCommandGestureManager *)self isIn3DTouchGesture];
}

- (void)setDidStartDrag:(BOOL)a3
{
  if (self->_didStartDrag != a3)
  {
    self->_didStartDrag = a3;
    id v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v3 synchronizeRecognizersWithReason:kSRUISyncReasonGestureStateChange];
  }
}

- (void)setDidStart3DTouch:(BOOL)a3
{
  if (self->_didStart3DTouch != a3)
  {
    self->_didStart3DTouch = a3;
    id v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v3 synchronizeRecognizersWithReason:kSRUISyncReasonGestureStateChange];
  }
}

- (void)startDragAtPoint:(CGPoint)a3
{
}

- (void)startHoldAndDragAtPoint:(CGPoint)a3
{
}

- (void)_startDragWithHold:(BOOL)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL v6 = a3;
  v18[1] = *MEMORY[0x263EF8340];
  double v7 = self;
  objc_sync_enter(v7);
  double v8 = *MEMORY[0x263F00148];
  double v9 = *(double *)(MEMORY[0x263F00148] + 8);
  if (x == *MEMORY[0x263F00148] && y == v9)
  {
    [(CACSpokenCommandGestureManager *)v7 defaultPortraitUpPointForGestures];
    double x = v11;
    double y = v12;
  }
  [(CACSpokenCommandGestureManager *)v7 setDidStartDrag:1];
  [(CACSpokenCommandGestureManager *)v7 setShouldHoldStartPointForDrag:v6];
  -[CACSpokenCommandGestureManager setStartPointForDrag:](v7, "setStartPointForDrag:", x, y);
  objc_sync_exit(v7);

  double v13 = [(CACSpokenCommandGestureManager *)v7 fingerController];
  double v14 = (void *)MEMORY[0x263F21F10];
  -[CACSpokenCommandGestureManager _fingerControllerPointForPortraitUpPoint:](v7, "_fingerControllerPointForPortraitUpPoint:", x, y);
  double v15 = objc_msgSend(v14, "fingerModelForLocation:");
  v18[0] = v15;
  double v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  objc_msgSend(v13, "showFingerModels:animated:startPointForAnimation:", v16, 1, v8, v9);

  if (v6)
  {
    double v17 = [(CACSpokenCommandGestureManager *)v7 fingerController];
    [v17 pressFingersDownAnimated:1];
  }
}

- (void)endDragAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v20[2] = *MEMORY[0x263EF8340];
  [(CACSpokenCommandGestureManager *)self _clearStateFlags];
  [(CACSpokenCommandGestureManager *)self startPointForDrag];
  AX_CGPointGetDistanceToPoint();
  double v7 = v6;
  double v8 = self;
  objc_sync_enter(v8);
  [(CACSpokenCommandGestureManager *)v8 startPointForDrag];
  double v10 = v9;
  double v12 = v11;
  BOOL v13 = [(CACSpokenCommandGestureManager *)v8 shouldHoldStartPointForDrag];
  objc_sync_exit(v8);

  double v14 = (void *)MEMORY[0x263F22900];
  -[CACSpokenCommandGestureManager _fingerControllerPointForPortraitUpPoint:](v8, "_fingerControllerPointForPortraitUpPoint:", v10, v12);
  double v15 = NSStringFromCGPoint(v21);
  v20[0] = v15;
  -[CACSpokenCommandGestureManager _fingerControllerPointForPortraitUpPoint:](v8, "_fingerControllerPointForPortraitUpPoint:", x, y);
  double v16 = NSStringFromCGPoint(v22);
  v20[1] = v16;
  double v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  double v18 = 0.0;
  if (v13) {
    double v18 = 0.5;
  }
  id v19 = [v14 lineGestureBetweenPoints:v17 duration:1 numberOfFingers:v7 / 140.0 initialHoldDuration:v18];
  [(CACSpokenCommandGestureManager *)v8 _performGesture:v19];
}

- (void)_adjust3DTouchToForce:(double)a3
{
  id v5 = [(CACSpokenCommandGestureManager *)self fingerController];
  double v6 = [v5 fingerModels];
  double v7 = [v6 firstObject];
  [v7 force];
  double v9 = v8;

  for (unint64_t i = 1; i != 11; ++i)
  {
    usleep(0xC350u);
    double v11 = [(CACSpokenCommandGestureManager *)self fingerController];
    double v12 = [v11 fingerModels];
    BOOL v13 = [v12 firstObject];
    [v13 setForce:v9 + (a3 - v9) * (double)i / 10.0];
  }
}

- (void)start3DTouchAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = self;
  objc_sync_enter(v5);
  [(CACSpokenCommandGestureManager *)v5 setDidStart3DTouch:1];
  -[CACSpokenCommandGestureManager setStartPointFor3DTouch:](v5, "setStartPointFor3DTouch:", x, y);
  objc_sync_exit(v5);

  -[CACSpokenCommandGestureManager _fingerControllerPointForPortraitUpPoint:](v5, "_fingerControllerPointForPortraitUpPoint:", x, y);
  double v7 = v6;
  double v9 = v8;
  double v10 = [(CACSpokenCommandGestureManager *)v5 fingerController];
  double v11 = objc_msgSend(MEMORY[0x263F21F10], "fingerModelForLocation:", v7, v9);
  v16[0] = v11;
  double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  objc_msgSend(v10, "showFingerModels:animated:startPointForAnimation:", v12, 1, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

  BOOL v13 = [(CACSpokenCommandGestureManager *)v5 fingerController];
  double v14 = [v13 fingerModels];
  double v15 = [v14 firstObject];
  [v15 setPressed:1];

  AXForceTouchThresholdPeek();
  -[CACSpokenCommandGestureManager _adjust3DTouchToForce:](v5, "_adjust3DTouchToForce:");
}

- (void)reveal3DTouchActions
{
  [(CACSpokenCommandGestureManager *)self _clearStateFlags];
  id v3 = self;
  objc_sync_enter(v3);
  [(CACSpokenCommandGestureManager *)v3 startPointFor3DTouch];
  -[CACSpokenCommandGestureManager _fingerControllerPointForPortraitUpPoint:](v3, "_fingerControllerPointForPortraitUpPoint:");
  double v5 = v4;
  double v7 = v6;
  objc_sync_exit(v3);

  double v8 = [(CACSpokenCommandGestureManager *)v3 fingerController];
  double v9 = objc_msgSend(MEMORY[0x263F22900], "flickGestureAtPoint:angle:", v5, v7, -1.57079633);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__CACSpokenCommandGestureManager_reveal3DTouchActions__block_invoke;
  v10[3] = &unk_264D11AD8;
  v10[4] = v3;
  [v8 performWithoutPreparingGesture:v9 completion:v10];
}

void __54__CACSpokenCommandGestureManager_reveal3DTouchActions__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) fingerController];
  objc_msgSend(v1, "clearAllFingersAnimated:endPointForAnimation:", 1, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

- (void)maximize3DTouch
{
  [(CACSpokenCommandGestureManager *)self _clearStateFlags];
  AXForceTouchThresholdPop();
  -[CACSpokenCommandGestureManager _adjust3DTouchToForce:](self, "_adjust3DTouchToForce:");
  id v3 = [(CACSpokenCommandGestureManager *)self fingerController];
  [v3 liftFingersUpAnimated:1];

  id v4 = [(CACSpokenCommandGestureManager *)self fingerController];
  objc_msgSend(v4, "clearAllFingersAnimated:endPointForAnimation:", 1, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

- (void)_clearStateFlags
{
  obj = self;
  objc_sync_enter(obj);
  [(CACSpokenCommandGestureManager *)obj setDidStartDrag:0];
  [(CACSpokenCommandGestureManager *)obj setDidStart3DTouch:0];
  [(CACSpokenCommandGestureManager *)obj setShouldHoldStartPointForDrag:0];
  objc_sync_exit(obj);
}

- (void)resetState
{
  [(CACSpokenCommandGestureManager *)self _clearStateFlags];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CACSpokenCommandGestureManager_resetState__block_invoke;
  block[3] = &unk_264D115D0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __44__CACSpokenCommandGestureManager_resetState__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) fingerController];
  objc_msgSend(v1, "clearAllFingersAnimated:endPointForAnimation:", 1, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

- (CGPoint)defaultPortraitUpPointForGestures
{
  double x = self->_defaultPortraitUpPointForGestures.x;
  double y = self->_defaultPortraitUpPointForGestures.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDefaultPortraitUpPointForGestures:(CGPoint)a3
{
  self->_defaultPortraitUpPointForGestures = a3;
}

- (BOOL)didStartDrag
{
  return self->_didStartDrag;
}

- (CGPoint)startPointForDrag
{
  double x = self->_startPointForDrag.x;
  double y = self->_startPointForDrag.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartPointForDrag:(CGPoint)a3
{
  self->_startPointForDrag = a3;
}

- (BOOL)shouldHoldStartPointForDrag
{
  return self->_shouldHoldStartPointForDrag;
}

- (void)setShouldHoldStartPointForDrag:(BOOL)a3
{
  self->_shouldHoldStartPointForDrag = a3;
}

- (BOOL)didStart3DTouch
{
  return self->_didStart3DTouch;
}

- (CGPoint)startPointFor3DTouch
{
  double x = self->_startPointFor3DTouch.x;
  double y = self->_startPointFor3DTouch.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartPointFor3DTouch:(CGPoint)a3
{
  self->_startPointFor3DTouch = a3;
}

- (void).cxx_destruct
{
}

@end
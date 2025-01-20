@interface TSDDynamicOperationController
- (BOOL)isInOperation;
- (BOOL)isInPossibleDynamicOperation;
- (BOOL)isOperationDynamic;
- (NSSet)allTransformedReps;
- (NSSet)currentlyTransformingReps;
- (TSDDynamicOperationController)initWithInteractiveCanvasController:(id)a3;
- (void)beginOperation;
- (void)beginPossibleDynamicOperation;
- (void)cancelOperation;
- (void)dealloc;
- (void)endOperation;
- (void)handleGestureRecognizer:(id)a3;
- (void)handleTrackerManipulator:(id)a3;
- (void)invalidateGuides;
- (void)p_beginDynamicOperationForReps:(id)a3;
- (void)p_cleanupOperation;
- (void)p_controllingTMDidResetInOperation:(id)a3;
- (void)startTransformingReps:(id)a3;
- (void)stopTransformingReps:(id)a3;
@end

@implementation TSDDynamicOperationController

- (TSDDynamicOperationController)initWithInteractiveCanvasController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDDynamicOperationController;
  result = [(TSDDynamicOperationController *)&v5 init];
  if (result)
  {
    result->mICC = (TSDInteractiveCanvasController *)a3;
    result->mResetGuides = 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDDynamicOperationController;
  [(TSDDynamicOperationController *)&v3 dealloc];
}

- (void)beginPossibleDynamicOperation
{
  if ([(TSDInteractiveCanvasController *)self->mICC isInDynamicOperation])
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDDynamicOperationController beginPossibleDynamicOperation]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 75, @"begin possible op with ICC in dynamic operation");
  }
  if (self->mPossibleDynamicOperation || self->mReps || self->mAllTransformedReps)
  {
    objc_super v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDDynamicOperationController beginPossibleDynamicOperation]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 76, @"beginning possible operation without ending previous operation");
  }
  self->mReps = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  self->mPossibleDynamicOperation = 1;
  *(_WORD *)&self->mResetGuides = 257;
}

- (void)beginOperation
{
  if ([(TSDInteractiveCanvasController *)self->mICC isInDynamicOperation])
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDDynamicOperationController beginOperation]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 93, @"begin op with ICC in dynamic operation");
  }
  if (!self->mPossibleDynamicOperation && (self->mReps || self->mAllTransformedReps))
  {
    objc_super v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDDynamicOperationController beginOperation]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 94, @"beginning operation without ending previous operation");
  }
  if (![(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] controllingTM])
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDDynamicOperationController beginOperation]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 95, @"No controlling TM when beginning operation");
  }
  v9 = (void *)[[(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] controllingTM] tracker];
  self->mSupportsAlignmentGuides = [v9 supportsAlignmentGuides];
  self->mOperationIsDynamic = [v9 operationShouldBeDynamic];
  if (self->mPossibleDynamicOperation)
  {
    self->mPossibleDynamicOperation = 0;
    self->mAllTransformedReps = (NSMutableSet *)(id)[MEMORY[0x263EFF9C0] setWithSet:self->mReps];
    if (!self->mOperationIsDynamic) {
      goto LABEL_15;
    }
    -[TSDDynamicOperationController p_beginDynamicOperationForReps:](self, "p_beginDynamicOperationForReps:", [MEMORY[0x263EFFA08] setWithSet:self->mReps]);
  }
  else
  {
    self->mReps = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    self->mAllTransformedReps = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    self->mResetGuides = 1;
  }
  if (self->mOperationIsDynamic) {
    [(TSDInteractiveCanvasController *)self->mICC beginDynamicOperation];
  }
LABEL_15:
  v10 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v10 addObserver:self selector:sel_p_controllingTMDidResetInOperation_ name:@"TSDControllingGRDidResetNotification" object:0];
}

- (void)p_beginDynamicOperationForReps:(id)a3
{
  uint64_t v4 = (void *)[[(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] controllingTM] tracker];
  if (objc_opt_respondsToSelector())
  {
    [v4 willBeginDynamicOperationForReps:a3];
  }
}

- (void)endOperation
{
  [(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] operationWillEnd];
  if ([(TSDDynamicOperationController *)self isInOperation])
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"TSDControllingGRDidResetNotification", 0);
    objc_super v3 = (void *)[[(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] controllingTM] tracker];
    if (v3) {
      [v3 commitChangesForReps:self->mAllTransformedReps];
    }
  }
  [(TSDDynamicOperationController *)self p_cleanupOperation];
  if ([(TSDInteractiveCanvasController *)self->mICC isInDynamicOperation])
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDDynamicOperationController endOperation]"];
    uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"];
    [v4 handleFailureInFunction:v5 file:v6 lineNumber:210 description:@"ending op with ICC still in dynamic operation"];
  }
}

- (BOOL)isInOperation
{
  return self->mReps && self->mAllTransformedReps && !self->mPossibleDynamicOperation;
}

- (BOOL)isInPossibleDynamicOperation
{
  return self->mPossibleDynamicOperation;
}

- (BOOL)isOperationDynamic
{
  return self->mOperationIsDynamic;
}

- (void)cancelOperation
{
  if (![(TSDDynamicOperationController *)self isInOperation])
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDDynamicOperationController cancelOperation]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 235, @"cancelling when not in operation");
  }

  [(TSDDynamicOperationController *)self p_cleanupOperation];
}

- (void)p_cleanupOperation
{
  if (self->mOperationIsDynamic) {
    [(TSDInteractiveCanvasController *)self->mICC endDynamicOperation];
  }
  [(TSDDynamicOperationController *)self p_resetGuidesForCleanup:1];
  [(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] operationDidEnd];
  self->mPossibleDynamicOperation = 0;

  self->mReps = 0;
  self->mAllTransformedReps = 0;
  self->mOperationIsDynamic = 0;
}

- (void)startTransformingReps:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (![(TSDDynamicOperationController *)self isInOperation] && !self->mPossibleDynamicOperation)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDDynamicOperationController startTransformingReps:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 270, @"cannot begin transforming reps until we are in a transform");
  }
  v7 = (void *)[MEMORY[0x263EFF9C0] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (([(NSMutableSet *)self->mReps containsObject:v12] & 1) == 0) {
          [(NSMutableSet *)self->mReps addObject:v12];
        }
        if (!self->mPossibleDynamicOperation
          && ([(NSMutableSet *)self->mAllTransformedReps containsObject:v12] & 1) == 0)
        {
          if (self->mOperationIsDynamic) {
            [v7 addObject:v12];
          }
          [(NSMutableSet *)self->mAllTransformedReps addObject:v12];
        }
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  if ([v7 count]) {
    [(TSDDynamicOperationController *)self p_beginDynamicOperationForReps:v7];
  }
  [(TSDDynamicOperationController *)self p_resetGuidesForCleanup:0];
  v13 = (void *)[[(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] controllingTM] tracker];
  if (objc_opt_respondsToSelector()) {
    [v13 didChangeCurrentlyTransformingReps];
  }
}

- (void)stopTransformingReps:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([a3 count])
  {
    [(NSMutableSet *)self->mReps minusSet:a3];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "layout"), "pauseDynamicTransformation");
        }
        while (v6 != v8);
        uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
    [(TSDDynamicOperationController *)self p_resetGuidesForCleanup:0];
    uint64_t v9 = (void *)[[(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] controllingTM] tracker];
    if (objc_opt_respondsToSelector()) {
      [v9 didChangeCurrentlyTransformingReps];
    }
  }
}

- (void)handleGestureRecognizer:(id)a3
{
  if ([(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] controllingTM] == a3)
  {
    if (![(TSDDynamicOperationController *)self isInOperation])
    {
      uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSDDynamicOperationController handleGestureRecognizer:]"];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"];
      uint64_t v8 = (objc_class *)objc_opt_class();
      [v5 handleFailureInFunction:v6, v7, 332, @"tracker is handling GR %@ when not in a transform", NSStringFromClass(v8) file lineNumber description];
    }
    if (self->mOperationIsDynamic != objc_msgSend((id)objc_msgSend(a3, "tracker"), "operationShouldBeDynamic"))
    {
      uint64_t v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSDDynamicOperationController handleGestureRecognizer:]"];
      [v9 handleFailureInFunction:v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 338, @"Controlling TM has different dynamic operation expectations than current operation (%@)", objc_msgSend(a3, "tracker") file lineNumber description];
    }
    if (self->mResetGuides) {
      [(TSDDynamicOperationController *)self p_resetGuidesForCleanup:0];
    }
    uint64_t v11 = [a3 state];
    if ((unint64_t)(v11 - 1) >= 2)
    {
      if (v11 == 3)
      {
        objc_msgSend((id)objc_msgSend(a3, "tracker"), "changeDynamicLayoutsForReps:", self->mReps);
        [(TSDDynamicOperationController *)self endOperation];
      }
    }
    else
    {
      long long v12 = (void *)[a3 tracker];
      mReps = self->mReps;
      [v12 changeDynamicLayoutsForReps:mReps];
    }
  }
}

- (void)p_controllingTMDidResetInOperation:(id)a3
{
  uint64_t v4 = (TSDTrackerManipulator *)[a3 object];
  if (![(TSDDynamicOperationController *)self isInOperation])
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDDynamicOperationController p_controllingTMDidResetInOperation:]"];
    [v5 handleFailureInFunction:v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 372, @"controlling GR reset in an operation, but we aren't in an operation! %@", v4 file lineNumber description];
  }
  if (v4 != [(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] controllingTM])
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDDynamicOperationController p_controllingTMDidResetInOperation:]"];
    [v7 handleFailureInFunction:v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"), 373, @"non-controlling GR is being reset with a notification %@ (%@ in control)", v4, -[TSDTrackerManipulatorCoordinator controllingTM](-[TSDInteractiveCanvasController tmCoordinator](self->mICC, "tmCoordinator"), "controllingTM") file lineNumber description];
  }
  if (v4 == [(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] controllingTM])
  {
    [(TSDDynamicOperationController *)self endOperation];
  }
}

- (void)handleTrackerManipulator:(id)a3
{
  if ([(TSDTrackerManipulatorCoordinator *)[(TSDInteractiveCanvasController *)self->mICC tmCoordinator] controllingTM] == a3)
  {
    if (![(TSDDynamicOperationController *)self isInOperation])
    {
      uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSDDynamicOperationController handleTrackerManipulator:]"];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"];
      uint64_t v8 = (objc_class *)objc_opt_class();
      [v5 handleFailureInFunction:v6, v7, 383, @"tracker is handling TM %@ when not in a transform", NSStringFromClass(v8) file lineNumber description];
    }
    if (self->mOperationIsDynamic != objc_msgSend((id)objc_msgSend(a3, "tracker"), "operationShouldBeDynamic"))
    {
      uint64_t v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[TSDDynamicOperationController handleTrackerManipulator:]"];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDynamicOperationController.m"];
      long long v12 = (objc_class *)objc_opt_class();
      [v9 handleFailureInFunction:v10, v11, 389, @"Controlling TM %@ has different dynamic operation expectations than current operation", NSStringFromClass(v12) file lineNumber description];
    }
    if (self->mResetGuides) {
      [(TSDDynamicOperationController *)self p_resetGuidesForCleanup:0];
    }
    objc_msgSend((id)objc_msgSend(a3, "tracker"), "changeDynamicLayoutsForReps:", self->mReps);
    if ([a3 readyToEndOperation])
    {
      [(TSDDynamicOperationController *)self endOperation];
    }
  }
}

- (void)invalidateGuides
{
  self->mResetGuides = 1;
}

- (NSSet)currentlyTransformingReps
{
  return &self->mReps->super;
}

- (NSSet)allTransformedReps
{
  return &self->mAllTransformedReps->super;
}

@end
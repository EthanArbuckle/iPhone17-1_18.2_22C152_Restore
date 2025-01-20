@interface TSDGestureDispatcher
- (BOOL)gestureActionShouldBegin:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handleGesture:(id)a3 withTarget:(id)a4;
- (TSDGestureDispatcher)initWithInteractiveCanvasController:(id)a3;
- (TSDInteractiveCanvasController)interactiveCanvasController;
- (id)p_getGestureTarget:(id)a3;
- (void)allowSimultaneousRecognitionByRecognizers:(id)a3;
- (void)dealloc;
- (void)gestureRemovedFromView:(id)a3;
- (void)handleGesture:(id)a3;
- (void)p_gestureNoLongerInFlight:(id)a3;
- (void)prioritizeRecognizer:(id)a3 overRecognizer:(id)a4;
- (void)setInteractiveCanvasController:(id)a3;
- (void)teardown;
@end

@implementation TSDGestureDispatcher

- (TSDGestureDispatcher)initWithInteractiveCanvasController:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSDGestureDispatcher;
  v4 = [(TSDGestureDispatcher *)&v8 init];
  if (v4)
  {
    if (!a3)
    {
      v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSDGestureDispatcher initWithInteractiveCanvasController:]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGestureDispatcher.m"), 243, @"invalid nil value for '%s'", "icc");
    }
    [(TSDGestureDispatcher *)v4 setInteractiveCanvasController:a3];
  }
  return v4;
}

- (void)dealloc
{
  self->_simultaneitySets = 0;
  self->_gesturesInFlight = 0;

  self->_targetsInFlight = 0;
  self->_priorityMap = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDGestureDispatcher;
  [(TSDGestureDispatcher *)&v3 dealloc];
}

- (void)teardown
{
  [(NSMutableArray *)self->_targetsInFlight removeAllObjects];
  gesturesInFlight = self->_gesturesInFlight;

  [(NSMutableArray *)gesturesInFlight removeAllObjects];
}

- (void)handleGesture:(id)a3
{
  uint64_t v5 = [a3 cachedGestureTarget];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    targetsInFlight = self->_targetsInFlight;
    if (!targetsInFlight)
    {
      targetsInFlight = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
      self->_targetsInFlight = targetsInFlight;
    }
    if (([(NSMutableArray *)targetsInFlight containsObject:v6] & 1) == 0)
    {
      if (objc_opt_respondsToSelector()) {
        [v6 gestureSequenceWillBegin];
      }
      [(NSMutableArray *)self->_targetsInFlight insertObject:v6 atIndex:0];
    }
    self->_gestureDidFire = 1;
    self->_runningTargetHandleGesture = 1;
    if (([v6 handleGesture:a3] & 1) == 0)
    {
      objc_super v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"-[TSDGestureDispatcher handleGesture:]"];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGestureDispatcher.m"];
      uint64_t v11 = [a3 gestureKind];
      v12 = (objc_class *)objc_opt_class();
      [v8 handleFailureInFunction:v9, v10, 296, @"canHandleGesture previously said YES, but it wasn't handled: %@ (target=<%@=%p>)", v11, NSStringFromClass(v12), v6 file lineNumber description];
    }
    self->_runningTargetHandleGesture = 0;
    if ([a3 isDone])
    {
      [a3 setTargetRep:0];
    }
  }
  else
  {
    v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"-[TSDGestureDispatcher handleGesture:]"];
    uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGestureDispatcher.m"];
    [v13 handleFailureInFunction:v14, v15, 275, @"gestureTarget should not be nil, shouldReceiveTouch should have failed this gesture" file lineNumber description];
  }
}

- (BOOL)handleGesture:(id)a3 withTarget:(id)a4
{
  if (!self->_runningTargetHandleGesture)
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDGestureDispatcher handleGesture:withTarget:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGestureDispatcher.m"), 307, @"handleGesture:withTarget: can only be called from a target's handleGesture: method");
  }
  [a3 setCachedGestureTarget:a4];

  return [a4 handleGesture:a3];
}

- (void)allowSimultaneousRecognitionByRecognizers:(id)a3
{
  char v5 = TSUSupportsTextInteraction();
  if (a3 || (v5 & 1) == 0)
  {
    uint64_t v9 = &v10;
    for (i = (void *)[MEMORY[0x263EFF9C0] setWithObject:a3]; ; objc_msgSend(i, "addObject:"))
    {
      uint64_t v7 = v9++;
      if (!*v7) {
        break;
      }
    }
    simultaneitySets = self->_simultaneitySets;
    if (!simultaneitySets)
    {
      simultaneitySets = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      self->_simultaneitySets = simultaneitySets;
    }
    [(NSMutableArray *)simultaneitySets addObject:i];
  }
}

- (void)prioritizeRecognizer:(id)a3 overRecognizer:(id)a4
{
  priorityMap = self->_priorityMap;
  if (!priorityMap)
  {
    priorityMap = (TSUNoCopyDictionary *)objc_alloc_init(MEMORY[0x263F7C880]);
    self->_priorityMap = priorityMap;
  }
  objc_super v8 = (void *)[(TSUNoCopyDictionary *)priorityMap objectForKey:a4];
  if (v8) {
    uint64_t v9 = [v8 setByAddingObject:a3];
  }
  else {
    uint64_t v9 = [MEMORY[0x263EFFA08] setWithObject:a3];
  }
  uint64_t v10 = v9;
  uint64_t v11 = self->_priorityMap;

  [(TSUNoCopyDictionary *)v11 setObject:v10 forUncopiedKey:a4];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if ([(TSDInteractiveCanvasController *)self->_interactiveCanvasController currentlyScrolling]
    || (id v5 = [(TSDGestureDispatcher *)self p_getGestureTarget:a3]) == 0)
  {
    if ((__CFString *)[a3 gestureKind] != @"TSWPUndefinedGestureKind"
      || (-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "asiOSCVC"), (objc_super v8 = (void *)TSUProtocolCast()) == 0)|| ![v8 gestureRecognizerShouldBegin:a3])
    {
LABEL_5:
      [a3 setCachedGestureTarget:0];
      return 0;
    }
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = v5;
    [a3 setCachedGestureTarget:v5];
  }
  priorityMap = self->_priorityMap;
  if (priorityMap)
  {
    uint64_t v10 = (void *)[(TSUNoCopyDictionary *)priorityMap objectForKey:a3];
    if (v10)
    {
      uint64_t v11 = v10;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v18;
LABEL_13:
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
          if ([v16 state])
          {
            if ([v16 state] != 5) {
              goto LABEL_5;
            }
          }
          if (v13 == ++v15)
          {
            uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
            if (v13) {
              goto LABEL_13;
            }
            break;
          }
        }
      }
    }
  }
  if (objc_opt_respondsToSelector()) {
    [v6 willBeginHandlingGesture:a3];
  }
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "asiOSCVC"), "shouldIgnoreTextGestures"))goto LABEL_2; {
  if ((__CFString *)[a3 gestureKind] == @"TSWPUndefinedGestureKind")
  }
  {
    uint64_t v7 = (void *)TSUProtocolCast();
    if (!v7) {
      return (char)v7;
    }
    LODWORD(v7) = [v7 gestureRecognizer:a3 shouldReceiveTouch:a4];
    if (!v7) {
      return (char)v7;
    }
  }
  else
  {
    objc_super v8 = (TSDCanvasView *)[a4 view];
    if (v8 != [(TSDInteractiveCanvasController *)self->_interactiveCanvasController canvasView]
      && (objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "asiOSCVC"), "allowTouchOutsideCanvasView:forGesture:", a4, a3) & 1) == 0)
    {
LABEL_2:
      LOBYTE(v7) = 0;
      return (char)v7;
    }
  }
  gesturesInFlight = self->_gesturesInFlight;
  if (!gesturesInFlight)
  {
    gesturesInFlight = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_gesturesInFlight = gesturesInFlight;
  }
  if ([(NSMutableArray *)gesturesInFlight indexOfObjectIdenticalTo:a3] == 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->_gesturesInFlight addObject:a3];
  }
  if ([(NSMutableArray *)self->_gesturesInFlight count] == 1)
  {
    self->_gestureDidFire = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSDTextGesturesWillBeginNotification", 0);
  }
  LOBYTE(v7) = 1;
  return (char)v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  simultaneitySets = self->_simultaneitySets;
  if (simultaneitySets)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [(NSMutableArray *)simultaneitySets countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(simultaneitySets);
          }
          uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
          if ([v11 containsObject:a3]
            && ([v11 containsObject:a4] & 1) != 0)
          {
            LOBYTE(v7) = 1;
            return v7;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v7 = [(NSMutableArray *)simultaneitySets countByEnumeratingWithState:&v13 objects:v17 count:16];
        uint64_t v8 = v7;
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (id)p_getGestureTarget:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = [(TSDInteractiveCanvasController *)[(TSDGestureDispatcher *)self interactiveCanvasController] gestureTargetStack:a3];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 canHandleGesture:a3]) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)gestureActionShouldBegin:(id)a3
{
  id v5 = -[TSDGestureDispatcher p_getGestureTarget:](self, "p_getGestureTarget:");
  if (v5)
  {
    [a3 setCachedGestureTarget:v5];
    return 1;
  }
  else if ((__CFString *)[a3 gestureKind] == @"TSWPUndefinedGestureKind" {
         && ([(TSDCanvasLayerHosting *)[(TSDInteractiveCanvasController *)self->_interactiveCanvasController layerHost] asiOSCVC], uint64_t v7 = (void *)TSUProtocolCast(), (objc_opt_respondsToSelector() & 1) != 0))
  }
  {
    return [v7 gestureActionShouldBegin:a3];
  }
  else
  {
    return 0;
  }
}

- (void)gestureRemovedFromView:(id)a3
{
  if (-[NSMutableArray indexOfObjectIdenticalTo:](self->_gesturesInFlight, "indexOfObjectIdenticalTo:") != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(TSDGestureDispatcher *)self p_gestureNoLongerInFlight:a3];
  }
}

- (void)p_gestureNoLongerInFlight:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [a3 setCachedGestureTarget:0];
  [(NSMutableArray *)self->_gesturesInFlight removeObjectIdenticalTo:a3];
  if (![(NSMutableArray *)self->_gesturesInFlight count])
  {
    if ([(NSMutableArray *)self->_targetsInFlight count])
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      targetsInFlight = self->_targetsInFlight;
      uint64_t v6 = [(NSMutableArray *)targetsInFlight countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(targetsInFlight);
            }
            uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v10 gestureSequenceDidEnd];
            }
          }
          uint64_t v7 = [(NSMutableArray *)targetsInFlight countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }
      [(NSMutableArray *)self->_targetsInFlight removeAllObjects];
    }
    long long v11 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    objc_msgSend(v11, "postNotificationName:object:", @"TSDTextGesturesDidEndNotification", objc_msgSend(NSNumber, "numberWithBool:", self->_gestureDidFire));
  }
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
  self->_interactiveCanvasController = (TSDInteractiveCanvasController *)a3;
}

@end
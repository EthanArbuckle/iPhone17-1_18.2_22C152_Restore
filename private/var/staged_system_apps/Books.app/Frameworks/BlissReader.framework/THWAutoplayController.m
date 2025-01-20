@interface THWAutoplayController
- (BOOL)bookOpened;
- (BOOL)inTwoPageMode;
- (BOOL)p_isInTwoPageMode:(id)a3;
- (BOOL)tornDown;
- (CGPoint)currentContentOffset;
- (NSMutableSet)autoplayableReps;
- (NSString)currentContentNodeGUID;
- (THWAutoplayController)init;
- (TSDInteractiveCanvasController)interactiveCanvasController;
- (double)stopScrollingDelay;
- (id)p_documentNavigatorFromNotification:(id)a3;
- (unint64_t)currentPageIndex;
- (unint64_t)generationCount;
- (void)dealloc;
- (void)handleNotificationVantageDidChange:(id)a3;
- (void)handleNotificationVantageWillChange:(id)a3;
- (void)p_autoplayStart;
- (void)p_autoplayStop:(id)a3;
- (void)p_recursivelyAddAutoplayableRepsForRep:(id)a3;
- (void)p_startAutoplayableDescendantsOfReps:(id)a3;
- (void)p_unpackNotification:(id)a3 outCurrentRelativePageIndex:(unint64_t *)a4 outTopLevelReps:(id *)a5;
- (void)setAutoplayableReps:(id)a3;
- (void)setBookOpened:(BOOL)a3;
- (void)setCurrentContentNodeGUID:(id)a3;
- (void)setCurrentContentOffset:(CGPoint)a3;
- (void)setCurrentPageIndex:(unint64_t)a3;
- (void)setInTwoPageMode:(BOOL)a3;
- (void)setInteractiveCanvasController:(id)a3;
- (void)setTornDown:(BOOL)a3;
- (void)stop;
- (void)teardown;
@end

@implementation THWAutoplayController

- (THWAutoplayController)init
{
  v4.receiver = self;
  v4.super_class = (Class)THWAutoplayController;
  v2 = [(THWAutoplayController *)&v4 init];
  if (v2)
  {
    v2->_autoplayableReps = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    [+[NSNotificationCenter defaultCenter] addObserver:v2 selector:"handleNotificationVantageDidChange:" name:@"THVantageDidChangeNotification" object:0];
    [+[NSNotificationCenter defaultCenter] addObserver:v2 selector:"handleNotificationVantageWillChange:" name:@"THVantageWillChangeNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  if (!self->_tornDown) {
    [(THWAutoplayController *)self teardown];
  }

  v3.receiver = self;
  v3.super_class = (Class)THWAutoplayController;
  [(THWAutoplayController *)&v3 dealloc];
}

- (void)teardown
{
  self->_tornDown = 1;
}

- (double)stopScrollingDelay
{
  return 0.1;
}

- (id)p_documentNavigatorFromNotification:(id)a3
{
  objc_opt_class();
  [a3 object];
  id result = (id)TSUDynamicCast();
  if (!result)
  {
    [a3 object];
    v5 = (void *)TSUProtocolCast();
    return [v5 documentNavigator];
  }
  return result;
}

- (void)stop
{
  autoplayableReps = self->_autoplayableReps;
  ++self->_generationCount;
  [(THWAutoplayController *)self p_autoplayStop:autoplayableReps];
}

- (void)handleNotificationVantageWillChange:(id)a3
{
  interactiveCanvasController = self->_interactiveCanvasController;
  if (interactiveCanvasController)
  {
    if (interactiveCanvasController == objc_msgSend(-[THWAutoplayController p_documentNavigatorFromNotification:](self, "p_documentNavigatorFromNotification:"), "interactiveCanvasController"))
    {
      id v6 = objc_msgSend(objc_msgSend(a3, "userInfo"), "valueForKey:", @"THVantageChangeReason");
      if (([v6 isEqualToString:@"THVantageChangeReasonTransitionToDVC"] & 1) == 0
        && ([v6 isEqualToString:@"THVantageChangeReasonScrolling"] & 1) == 0
        && ([v6 isEqualToString:@"THVantageChangeReasonWindowResize"] & 1) == 0)
      {
        autoplayableReps = self->_autoplayableReps;
        ++self->_generationCount;
        [(THWAutoplayController *)self p_autoplayStop:autoplayableReps];
      }
    }
  }
}

- (void)handleNotificationVantageDidChange:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "valueForKey:", @"THVantageChangeReason");
  if ([v5 isEqualToString:@"THVantageChangeReasonBookOpen"]) {
    [(THWAutoplayController *)self setBookOpened:1];
  }
  id v6 = [(THWAutoplayController *)self p_documentNavigatorFromNotification:a3];
  interactiveCanvasController = self->_interactiveCanvasController;
  if (interactiveCanvasController)
  {
    v8 = v6;
    if (interactiveCanvasController == [v6 interactiveCanvasController])
    {
      unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v16 = 0;
      [(THWAutoplayController *)self p_unpackNotification:a3 outCurrentRelativePageIndex:&v15 outTopLevelReps:&v16];
      objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController canvasView](self->_interactiveCanvasController, "canvasView"), "enclosingScrollView"), "contentOffset");
      double v10 = v9;
      double v12 = v11;
      id v13 = objc_msgSend(objc_msgSend(v8, "currentPageLocation"), "contentNodeGUID");
      if (![v5 isEqualToString:@"THVantageChangeReasonScrolling"]) {
        goto LABEL_17;
      }
      unint64_t v14 = v15;
      if (self->_currentPageIndex != v15)
      {
LABEL_19:
        if (v14 != 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(objc_msgSend(v8, "delegate"), "documentNavigatorIsOnActiveCanvas:", v8))
        {
          if ([(THWAutoplayController *)self bookOpened]) {
            [(THWAutoplayController *)self p_startAutoplayableDescendantsOfReps:v16];
          }
        }
        goto LABEL_23;
      }
      if (v10 == self->_currentContentOffset.x
        && v12 == self->_currentContentOffset.y
        && [(NSString *)self->_currentContentNodeGUID isEqualToString:v13])
      {
LABEL_17:
        if (([v5 isEqualToString:@"THVantageChangeReasonTransitionFromTOC"] & 1) == 0
          && ([v5 isEqualToString:@"THVantageChangeReasonRotation"] & 1) == 0
          && ([v5 isEqualToString:@"THVantageChangeReasonNavigation"] & 1) == 0
          && ([v5 isEqualToString:@"THVantageChangeReasonTransitionFromNotesVC"] & 1) == 0
          && ([v5 isEqualToString:@"THVantageChangeReasonTransitionFromStudyVC"] & 1) == 0
          && ([v5 isEqualToString:@"THVantageChangeReasonTransitionToDVC"] & 1) == 0
          && ([v5 isEqualToString:@"THVantageChangeReasonTransitionFromGlossary"] & 1) == 0
          && ![v5 isEqualToString:@"THVantageChangeReasonBookOpen"])
        {
LABEL_23:
          self->_currentPageIndex = v15;
          [(THWAutoplayController *)self setCurrentContentNodeGUID:v13];
          self->_currentContentOffset.x = v10;
          self->_currentContentOffset.y = v12;
          return;
        }
      }
      unint64_t v14 = v15;
      goto LABEL_19;
    }
  }
}

- (void)p_unpackNotification:(id)a3 outCurrentRelativePageIndex:(unint64_t *)a4 outTopLevelReps:(id *)a5
{
  id v8 = [(THWAutoplayController *)self p_documentNavigatorFromNotification:a3];
  if (v8)
  {
    double v9 = v8;
    id v10 = objc_msgSend(objc_msgSend(objc_msgSend(v8, "interactiveCanvasController"), "canvas"), "topLevelReps");
    BOOL v11 = [(THWAutoplayController *)self p_isInTwoPageMode:v9];
    self->_inTwoPageMode = v11;
    id v12 = objc_msgSend(objc_msgSend(v9, "currentPageInfoForBookmarksUsingViewCenter:", !v11), "relativePageIndexInParent");
    if (a5) {
      *a5 = v10;
    }
    if (a4) {
      *a4 = (unint64_t)v12;
    }
  }
}

- (BOOL)p_isInTwoPageMode:(id)a3
{
  return 0;
}

- (void)p_startAutoplayableDescendantsOfReps:(id)a3
{
  if (!self->_tornDown)
  {
    autoplayableReps = self->_autoplayableReps;
    ++self->_generationCount;
    id v6 = +[NSMutableSet setWithSet:autoplayableReps];
    [(NSMutableSet *)self->_autoplayableReps removeAllObjects];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(a3);
          }
          [(THWAutoplayController *)self p_recursivelyAddAutoplayableRepsForRep:*(void *)(*((void *)&v16 + 1) + 8 * (void)v10)];
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
    BOOL v11 = +[NSMutableSet setWithSet:self->_autoplayableReps];
    [(NSMutableSet *)v11 intersectSet:v6];
    [(NSMutableSet *)v6 minusSet:v11];
    if ([(NSMutableSet *)v6 count]) {
      [(THWAutoplayController *)self p_autoplayStop:v6];
    }
    if ([(NSMutableSet *)self->_autoplayableReps count])
    {
      unint64_t generationCount = self->_generationCount;
      [(THWAutoplayController *)self stopScrollingDelay];
      dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_189F28;
      v15[3] = &unk_457250;
      v15[4] = self;
      v15[5] = generationCount;
      dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, v15);
    }
  }
}

- (void)p_recursivelyAddAutoplayableRepsForRep:(id)a3
{
  if ([a3 conformsToProtocol:&OBJC_PROTOCOL___THWAutoplayable]
    && ([a3 hasBeenRemoved] & 1) == 0
    && [a3 isVisibleOnCanvas]
    && objc_msgSend(objc_msgSend(a3, "autoplayConfig"), "enabled")
    && [a3 autoplayAllowed])
  {
    [(NSMutableSet *)self->_autoplayableReps addObject:a3];
  }
  id v5 = (void *)TSUProtocolCast();
  if (v5)
  {
    id v6 = v5;
    if (![v5 masksToBounds] || objc_msgSend(v6, "isVisibleOnCanvas"))
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v7 = [v6 childReps];
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          BOOL v11 = 0;
          do
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            [(THWAutoplayController *)self p_recursivelyAddAutoplayableRepsForRep:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11)];
            BOOL v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }
    }
  }
}

- (void)p_autoplayStart
{
  if (([(TSDInteractiveCanvasController *)self->_interactiveCanvasController currentlyScrolling] & 1) == 0)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    autoplayableReps = self->_autoplayableReps;
    id v4 = [(NSMutableSet *)autoplayableReps countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(autoplayableReps);
          }
          id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if (([v8 hasBeenRemoved] & 1) == 0
            && objc_msgSend(objc_msgSend(v8, "autoplayConfig"), "enabled"))
          {
            if ([v8 autoplayAllowed]) {
              [v8 autoplayStart];
            }
          }
        }
        id v5 = [(NSMutableSet *)autoplayableReps countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (void)p_autoplayStop:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(a3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v8, "autoplayConfig"), "enabled")) {
          [v8 autoplayStop];
        }
      }
      id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [a3 removeAllObjects];
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
}

- (BOOL)tornDown
{
  return self->_tornDown;
}

- (void)setTornDown:(BOOL)a3
{
  self->_tornDown = a3;
}

- (unint64_t)currentPageIndex
{
  return self->_currentPageIndex;
}

- (void)setCurrentPageIndex:(unint64_t)a3
{
  self->_currentPageIndex = a3;
}

- (NSString)currentContentNodeGUID
{
  return self->_currentContentNodeGUID;
}

- (void)setCurrentContentNodeGUID:(id)a3
{
}

- (CGPoint)currentContentOffset
{
  double x = self->_currentContentOffset.x;
  double y = self->_currentContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentContentOffset:(CGPoint)a3
{
  self->_currentContentOffset = a3;
}

- (NSMutableSet)autoplayableReps
{
  return self->_autoplayableReps;
}

- (void)setAutoplayableReps:(id)a3
{
}

- (BOOL)inTwoPageMode
{
  return self->_inTwoPageMode;
}

- (void)setInTwoPageMode:(BOOL)a3
{
  self->_inTwoPageMode = a3;
}

- (unint64_t)generationCount
{
  return self->_generationCount;
}

- (BOOL)bookOpened
{
  return self->_bookOpened;
}

- (void)setBookOpened:(BOOL)a3
{
  self->_bookOpened = a3;
}

@end
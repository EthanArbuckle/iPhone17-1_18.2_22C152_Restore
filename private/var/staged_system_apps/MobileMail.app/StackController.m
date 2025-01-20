@interface StackController
- (BOOL)_shouldLoadDataForElement:(id)a3;
- (BOOL)animateStateTransitions;
- (BOOL)hasStackedItems;
- (BOOL)isAnimating;
- (BOOL)isAnyStackElementBeingStacked;
- (BOOL)isDataAvailableForStackElement:(id)a3 loadIfNeeded:(BOOL)a4;
- (BOOL)stackIsTerminating;
- (NSArray)itemsToDisplay;
- (StackController)init;
- (StackDataSource)dataSource;
- (StackDelegate)delegate;
- (UIEdgeInsets)stackContainerViewEdgeInsets;
- (id)keyForItem:(id)a3;
- (id)stackContainerView;
- (id)stackElementForItem:(id)a3 createIfNeeded:(BOOL)a4;
- (id)stackedViewForItem:(id)a3;
- (id)viewBelowStackElement:(id)a3;
- (id)viewForStackElement:(id)a3;
- (int64_t)maximumStackElementDepth;
- (unint64_t)maximumNumberOfVisibleStackElements;
- (void)_updateStackedViewFrameForElement:(id)a3;
- (void)addStackedItem:(id)a3;
- (void)beginTransaction;
- (void)displayStackedViewsForItems:(id)a3 animated:(BOOL)a4;
- (void)endTransaction;
- (void)removeStackElement:(id)a3;
- (void)removeStackedViews:(BOOL)a3;
- (void)setAnimateStateTransitions:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsAnimating:(BOOL)a3;
- (void)setItemsToDisplay:(id)a3;
- (void)setNeedsToUpdateDisplayedItems:(BOOL)a3 immediately:(BOOL)a4;
- (void)setNeedsToUpdateStackElements;
- (void)stackDataSourceDidLoadItemData:(id)a3;
- (void)stackElement:(id)a3 currentStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
- (void)stackElement:(id)a3 targetStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
- (void)stackElement:(id)a3 willRemoveView:(id)a4;
- (void)updateDisplayedItems;
- (void)updateIsAnimating;
- (void)updateStackElement:(id)a3;
- (void)updateStackElements;
- (void)updateStackedViewFrameForItem:(id)a3;
- (void)updateStackedViewsFrame;
@end

@implementation StackController

- (StackController)init
{
  v13.receiver = self;
  v13.super_class = (Class)StackController;
  v2 = [(StackController *)&v13 init];
  if (v2)
  {
    v3 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:50];
    stackedItems = v2->_stackedItems;
    v2->_stackedItems = v3;

    v5 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:50];
    orderedItems = v2->_orderedItems;
    v2->_orderedItems = v5;

    v7 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:50];
    stackElementsByItem = v2->_stackElementsByItem;
    v2->_stackElementsByItem = v7;

    v9 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:50];
    loadRequestDatesByItem = v2->_loadRequestDatesByItem;
    v2->_loadRequestDatesByItem = v9;

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"stackDataSourceDidLoadItemData:" name:@"StackDataSourceDidLoadItemData" object:0];
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (unint64_t)maximumNumberOfVisibleStackElements
{
  return 5;
}

- (int64_t)maximumStackElementDepth
{
  return 4;
}

- (void)displayStackedViewsForItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v18 = a3;
  self->_isTerminating = 0;
  stackContainerView = self->_stackContainerView;
  if (!stackContainerView)
  {
    v7 = [(StackController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v7 stackControllerWillStartStackingViews:self];
    }
    v8 = [(StackController *)self dataSource];
    v9 = [v8 stackContainerViewForStackController:self];
    v10 = self->_stackContainerView;
    self->_stackContainerView = v9;

    v11 = [(UIView *)self->_stackContainerView window];
    v12 = [v11 windowScene];
    objc_super v13 = (char *)[v12 interfaceOrientation];

    if ((unint64_t)(v13 - 3) <= 1) {
      [(UIView *)self->_stackContainerView setClipsToBounds:1];
    }
    [v8 stackContainerViewEdgeInsetsForStackController:self];
    self->_stackContainerViewEdgeInsets.top = v14;
    self->_stackContainerViewEdgeInsets.left = v15;
    self->_stackContainerViewEdgeInsets.bottom = v16;
    self->_stackContainerViewEdgeInsets.right = v17;
  }
  [(StackController *)self setAnimateStateTransitions:v4];
  [(StackController *)self setItemsToDisplay:v18];
  [(StackController *)self setNeedsToUpdateDisplayedItems:1 immediately:stackContainerView == 0];
}

- (void)setNeedsToUpdateDisplayedItems:(BOOL)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"updateDisplayedItems" object:0];
  if (v5)
  {
    if (v4)
    {
      [(StackController *)self updateDisplayedItems];
    }
    else
    {
      double v7 = 0.0;
      if ([(StackController *)self animateStateTransitions])
      {
        +[NSDate timeIntervalSinceReferenceDate];
        double v9 = v8 - self->_lastDisplayedItemsUpdateRequest;
        self->_lastDisplayedItemsUpdateRequest = v8;
        if (v9 < 0.3)
        {
          self->_isSuspended = 1;
          double v7 = 0.1;
        }
      }
      id v10 = +[NSArray arrayWithObject:NSRunLoopCommonModes];
      -[StackController performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", "updateDisplayedItems", 0, v7);
    }
  }
  else
  {
    self->_isSuspended = 0;
  }
}

- (void)addStackedItem:(id)a3
{
  id v9 = a3;
  id v4 = -[NSMutableArray indexOfObject:](self->_orderedItems, "indexOfObject:");
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_stackedItems addObject:v9];
    [(NSMutableArray *)self->_orderedItems addObject:v9];
  }
  else
  {
    unint64_t v5 = 0;
    do
    {
      unint64_t v6 = v5;
      if (v5 >= (unint64_t)[(NSMutableArray *)self->_stackedItems count]) {
        break;
      }
      double v7 = [(NSMutableArray *)self->_stackedItems objectAtIndex:v5];
      id v8 = [(NSMutableArray *)self->_orderedItems indexOfObject:v7];
      ++v5;
    }
    while (v8 <= v4);
    [(NSMutableArray *)self->_stackedItems insertObject:v9 atIndex:v6];
  }
}

- (void)updateDisplayedItems
{
  self->_isSuspended = 0;
  v33 = [(StackController *)self itemsToDisplay];
  id v32 = [(NSMutableArray *)self->_stackedItems copy];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v3 = v33;
  id v4 = [v3 countByEnumeratingWithState:&v58 objects:v67 count:16];
  id v5 = 0;
  if (v4)
  {
    uint64_t v6 = *(void *)v59;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v59 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        if ((-[NSMutableArray containsObject:](self->_stackedItems, "containsObject:", v8, v32) & 1) == 0)
        {
          [(StackController *)self addStackedItem:v8];
          if (!v5) {
            id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
          }
          [v5 addObject:v8];
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v4);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v32;
  id v9 = 0;
  id v10 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v55;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(void *)v55 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v54 + 1) + 8 * (void)j);
        if ((objc_msgSend(v3, "containsObject:", v13, v32) & 1) == 0)
        {
          [(NSMutableArray *)self->_stackedItems removeObject:v13];
          if (!v9) {
            id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
          }
          [v9 addObject:v13];
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v54 objects:v66 count:16];
    }
    while (v10);
  }

  [(StackController *)self beginTransaction];
  if ([v3 count])
  {
    long long v48 = 0uLL;
    long long v49 = 0uLL;
    long long v46 = 0uLL;
    long long v47 = 0uLL;
    id v35 = v5;
    id v14 = [v35 countByEnumeratingWithState:&v46 objects:v64 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v47;
      do
      {
        for (k = 0; k != v14; k = (char *)k + 1)
        {
          if (*(void *)v47 != v15) {
            objc_enumerationMutation(v35);
          }
          CGFloat v17 = -[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(void *)(*((void *)&v46 + 1) + 8 * (void)k), 1, v32);
          [v17 setTargetState:4];
        }
        id v14 = [v35 countByEnumeratingWithState:&v46 objects:v64 count:16];
      }
      while (v14);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v34 = v9;
    id v18 = [v34 countByEnumeratingWithState:&v42 objects:v63 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v43;
      do
      {
        for (m = 0; m != v18; m = (char *)m + 1)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v34);
          }
          v21 = -[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(void *)(*((void *)&v42 + 1) + 8 * (void)m), 0, v32);
          [v21 setTargetState:5];
        }
        id v18 = [v34 countByEnumeratingWithState:&v42 objects:v63 count:16];
      }
      while (v18);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v36 = [(NSMutableArray *)self->_stackedItems reverseObjectEnumerator];
    id v22 = [v36 countByEnumeratingWithState:&v38 objects:v62 count:16];
    if (v22)
    {
      unint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v25 = *(void *)v39;
      do
      {
        for (n = 0; n != v22; n = (char *)n + 1)
        {
          if (*(void *)v39 != v25) {
            objc_enumerationMutation(v36);
          }
          v27 = -[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(void *)(*((void *)&v38 + 1) + 8 * (void)n), 0, v32);
          [v27 setTargetDepth:(char *)n + v24];
          if (v23 > 4)
          {
            [v27 setTargetState:6];
          }
          else
          {
            [v27 setTargetState:4];
            ++v23;
          }
        }
        id v22 = [v36 countByEnumeratingWithState:&v38 objects:v62 count:16];
        v24 += (uint64_t)n;
      }
      while (v22);
    }
  }
  else
  {
    long long v52 = 0uLL;
    long long v53 = 0uLL;
    long long v50 = 0uLL;
    long long v51 = 0uLL;
    id v36 = v9;
    id v28 = [v36 countByEnumeratingWithState:&v50 objects:v65 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v51;
      do
      {
        for (ii = 0; ii != v28; ii = (char *)ii + 1)
        {
          if (*(void *)v51 != v29) {
            objc_enumerationMutation(v36);
          }
          v31 = -[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(void *)(*((void *)&v50 + 1) + 8 * (void)ii), 0, v32);
          [v31 setTargetState:5];
        }
        id v28 = [v36 countByEnumeratingWithState:&v50 objects:v65 count:16];
      }
      while (v28);
    }
  }

  [(StackController *)self endTransaction];
}

- (void)removeStackedViews:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isTerminating = 1;
  id v5 = [(NSMutableArray *)self->_stackedItems copy];
  [(NSMutableArray *)self->_stackedItems removeAllObjects];
  [(StackController *)self setAnimateStateTransitions:v3];
  [(StackController *)self setItemsToDisplay:0];
  [(StackController *)self setNeedsToUpdateDisplayedItems:0 immediately:1];
  [(StackController *)self beginTransaction];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = -[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v9), 0, (void)v13);
        [v10 setTargetState:1];
        if ([v10 currentState] == (id)1) {
          [(StackController *)self stackElement:v10 currentStateDidChangeFrom:1 to:1];
        }

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(StackController *)self endTransaction];
  if (![v6 count])
  {
    uint64_t v11 = [(StackController *)self delegate];
    v12 = self;
    if (objc_opt_respondsToSelector()) {
      [v11 stackControllerDidStopStackingViews:v12];
    }
  }
}

- (void)updateStackedViewsFrame
{
  id v3 = [(NSMutableArray *)self->_stackedItems copy];
  [(StackController *)self beginTransaction];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [v3 reverseObjectEnumerator];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [(StackController *)self stackElementForItem:*(void *)(*((void *)&v9 + 1) + 8 * (void)v7) createIfNeeded:0];
        if ([v8 currentState] != (id)1) {
          [(StackController *)self _updateStackedViewFrameForElement:v8];
        }

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(StackController *)self endTransaction];
}

- (void)updateStackedViewFrameForItem:(id)a3
{
  id v4 = [(StackController *)self stackElementForItem:a3 createIfNeeded:0];
  -[StackController _updateStackedViewFrameForElement:](self, "_updateStackedViewFrameForElement:");
}

- (void)_updateStackedViewFrameForElement:(id)a3
{
  id v14 = a3;
  id v4 = [(StackController *)self dataSource];
  id v5 = [v14 item];
  [v4 stackController:self rectForItem:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  [v14 updateViewFrame:v7, v9, v11, v13];
}

- (id)stackedViewForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(StackController *)self dataSource];
  double v6 = [v5 stackController:self viewForItem:v4];

  double v7 = [v6 superview];

  if (!v7)
  {
    double v8 = [(StackController *)self stackContainerView];
    [v8 addSubview:v6];

    [v6 setAlpha:0.0];
  }
  double v9 = [v6 layer];
  [v9 setCornerRadius:0.0];

  return v6;
}

- (id)keyForItem:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NSNull null];
  }
  double v6 = v5;

  return v6;
}

- (id)stackElementForItem:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(StackController *)self keyForItem:v6];
  double v8 = [(NSMutableDictionary *)self->_stackElementsByItem objectForKeyedSubscript:v7];
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !v4;
  }
  if (!v9)
  {
    double v8 = [[StackElement alloc] initWithItem:v6 state:1];
    [(StackElement *)v8 setDelegate:self];
    [(NSMutableDictionary *)self->_stackElementsByItem setObject:v8 forKeyedSubscript:v7];
  }

  return v8;
}

- (void)removeStackElement:(id)a3
{
  BOOL v4 = [a3 item];
  id v8 = [(StackController *)self keyForItem:v4];

  [(NSMutableDictionary *)self->_stackElementsByItem removeObjectForKey:v8];
  if (![(NSMutableDictionary *)self->_stackElementsByItem count])
  {
    [(UIView *)self->_stackContainerView setClipsToBounds:0];
    stackContainerView = self->_stackContainerView;
    self->_stackContainerView = 0;

    id v6 = [(StackController *)self delegate];
    double v7 = self;
    if (objc_opt_respondsToSelector()) {
      [v6 stackControllerDidStopStackingViews:v7];
    }
  }
}

- (BOOL)isDataAvailableForStackElement:(id)a3 loadIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [v6 item];
  id v8 = [(NSMutableArray *)self->_orderedItems lastObject];

  if (v7 == v8)
  {
    double v10 = [(StackController *)self dataSource];
    double v11 = [(StackController *)self keyForItem:v7];
    double v12 = [v6 itemView];
    unsigned int v9 = [v10 stackController:self isDataLoadedForItem:v7 inView:v12];
    if (((v9 | !v4) & 1) == 0) {
      [v10 stackController:self loadDataForItem:v7 inView:v12];
    }
    double v13 = [(NSMutableDictionary *)self->_loadRequestDatesByItem objectForKey:v11];
    id v14 = v13;
    if (v13)
    {
      if (v9)
      {
        LOBYTE(v9) = 1;
LABEL_15:

        goto LABEL_16;
      }
      [v13 timeIntervalSinceNow];
      if (v17 > -0.05)
      {
        LOBYTE(v9) = 0;
        goto LABEL_15;
      }
      long long v16 = [(StackController *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v16 stackController:self dataLoadTimedOutInView:v12 forItem:v7];
      }
      LOBYTE(v9) = 1;
    }
    else
    {
      loadRequestDatesByItem = self->_loadRequestDatesByItem;
      long long v16 = +[NSDate date];
      [(NSMutableDictionary *)loadRequestDatesByItem setObject:v16 forKey:v11];
    }

    goto LABEL_15;
  }
  LOBYTE(v9) = 1;
LABEL_16:

  return v9;
}

- (void)beginTransaction
{
}

- (void)endTransaction
{
  unint64_t v2 = self->_transactionCount - 1;
  self->_transactionCount = v2;
  if (!v2 && self->_updateNeeded)
  {
    self->_updateNeeded = 0;
    [(StackController *)self updateStackElements];
  }
}

- (void)setNeedsToUpdateStackElements
{
  if (self->_transactionCount) {
    self->_updateNeeded = 1;
  }
  else {
    [(StackController *)self updateStackElements];
  }
}

- (void)updateStackElements
{
  if (!self->_isSuspended)
  {
    self->_loadingData = 0;
    self->_itemsBecameStacked = 0;
    id v3 = [(NSMutableDictionary *)self->_stackElementsByItem allValues];
    if ([v3 count])
    {
      [(StackController *)self beginTransaction];
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      id v4 = v3;
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v9;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v9 != v6) {
              objc_enumerationMutation(v4);
            }
            -[StackController updateStackElement:](self, "updateStackElement:", *(void *)(*((void *)&v8 + 1) + 8 * i), (void)v8);
          }
          id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
        }
        while (v5);
      }

      [(StackController *)self endTransaction];
    }
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "setNeedsToUpdateStackElements", 0, (void)v8);
    if (self->_loadingData) {
      [(StackController *)self performSelector:"setNeedsToUpdateStackElements" withObject:0 afterDelay:0.05];
    }
    [(StackController *)self updateIsAnimating];
  }
}

- (void)updateStackElement:(id)a3
{
  id v16 = a3;
  uint64_t v4 = (uint64_t)[v16 nextState];
  id v5 = [v16 targetState];
  id v6 = [v16 nextDepth];
  id v7 = [v16 targetDepth];
  unint64_t v8 = (unint64_t)v7;
  if ((id)v4 != v5 || v6 != v7)
  {
    BOOL v9 = [(StackController *)self animateStateTransitions];
    if ([v16 isAnimating]) {
      unint64_t v8 = (unint64_t)v6;
    }
    uint64_t v10 = (uint64_t)v5;
    switch((unint64_t)v5)
    {
      case 1uLL:
      case 2uLL:
      case 6uLL:
        goto LABEL_14;
      case 3uLL:
        unsigned int v11 = [(StackController *)self isAnyStackElementBeingStacked];
        uint64_t v10 = 3;
        if (v11) {
          uint64_t v10 = v4;
        }
        goto LABEL_14;
      case 4uLL:
        if ([(StackController *)self isDataAvailableForStackElement:v16 loadIfNeeded:[(StackController *)self _shouldLoadDataForElement:v16]])
        {
          uint64_t v10 = 4;
LABEL_14:
          if (v10 != v4)
          {
            if (v10 == 4 && v5 == (id)4)
            {
              self->_itemsBecameStacked = 1;
              double v13 = [(StackController *)self delegate];
              if (objc_opt_respondsToSelector())
              {
                id v14 = [v16 itemView];
                long long v15 = [v16 item];
                [v13 stackController:self willDisplayView:v14 forItem:v15];
              }
              uint64_t v4 = 4;
            }
            else
            {
              uint64_t v4 = v10;
            }
            goto LABEL_27;
          }
        }
        else
        {
          self->_loadingData = 1;
        }
LABEL_15:
        BOOL v12 = (id)v8 != v6 && v4 == 4;
        if (v12 || !v9)
        {
LABEL_27:
          [v16 setNextState:v4 nextDepth:v8 animated:v9];
          break;
        }
        break;
      case 5uLL:
        uint64_t v10 = 5;
        if (v4 == 6 && v8 >= 5)
        {
          unint64_t v8 = [(StackController *)self maximumStackElementDepth];
          uint64_t v10 = 5;
        }
        goto LABEL_14;
      default:
        goto LABEL_15;
    }
  }
}

- (void)stackDataSourceDidLoadItemData:(id)a3
{
  id v5 = [a3 object];
  uint64_t v4 = -[StackController stackElementForItem:createIfNeeded:](self, "stackElementForItem:createIfNeeded:");

  if (v4) {
    [(StackController *)self setNeedsToUpdateStackElements];
  }
}

- (BOOL)isAnyStackElementBeingStacked
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(NSMutableArray *)self->_stackedItems reverseObjectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = [(StackController *)self stackElementForItem:*(void *)(*((void *)&v11 + 1) + 8 * i) createIfNeeded:0];
        unint64_t v8 = v7;
        if (v7 && [v7 nextState] == (id)4 && !objc_msgSend(v8, "currentState"))
        {

          BOOL v9 = 1;
          goto LABEL_13;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_13:

  return v9;
}

- (BOOL)hasStackedItems
{
  return [(NSMutableArray *)self->_stackedItems count] != 0;
}

- (void)setIsAnimating:(BOOL)a3
{
  if (self->_isAnimating != a3)
  {
    BOOL v3 = a3;
    self->_isAnimating = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (v3)
    {
      if (objc_opt_respondsToSelector()) {
        [WeakRetained stackControllerWillStartAnimatingViews:self];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [WeakRetained stackControllerDidStopAnimatingViews:self];
    }
  }
}

- (void)updateIsAnimating
{
  if (self->_isTerminating)
  {
    uint64_t v3 = 0;
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v4 = [(NSMutableDictionary *)self->_stackElementsByItem allValues];
    uint64_t v3 = (uint64_t)[v4 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v8;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isAnimating])
          {
            uint64_t v3 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v3 = (uint64_t)[v4 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  [(StackController *)self setIsAnimating:v3];
}

- (BOOL)_shouldLoadDataForElement:(id)a3
{
  return [a3 targetDepth] == 0;
}

- (id)stackContainerView
{
  return self->_stackContainerView;
}

- (UIEdgeInsets)stackContainerViewEdgeInsets
{
  double top = self->_stackContainerViewEdgeInsets.top;
  double left = self->_stackContainerViewEdgeInsets.left;
  double bottom = self->_stackContainerViewEdgeInsets.bottom;
  double right = self->_stackContainerViewEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)stackIsTerminating
{
  return self->_isTerminating;
}

- (id)viewForStackElement:(id)a3
{
  id v4 = [a3 item];
  uint64_t v5 = [(StackController *)self stackedViewForItem:v4];

  return v5;
}

- (id)viewBelowStackElement:(id)a3
{
  id v4 = [a3 item];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(NSMutableArray *)self->_orderedItems reverseObjectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    BOOL v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v7)
        {
          long long v11 = [(StackController *)self stackElementForItem:v10 createIfNeeded:0];
          long long v12 = [v11 itemViewCreateIfNeeded:0];

          if (v12) {
            goto LABEL_13;
          }
          BOOL v7 = 1;
        }
        else
        {
          BOOL v7 = v10 == v4;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  long long v12 = 0;
LABEL_13:

  return v12;
}

- (void)stackElement:(id)a3 willRemoveView:(id)a4
{
  id v12 = a3;
  uint64_t v5 = [v12 item];
  id v6 = [(StackController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 stackController:self willRemoveViewForItem:v5];
  }
  if (([(NSMutableArray *)self->_stackedItems containsObject:v5] & 1) == 0)
  {
    [(NSMutableArray *)self->_orderedItems removeObject:v5];
    if ([(NSMutableArray *)self->_stackedItems count])
    {
      BOOL v7 = [(NSMutableArray *)self->_stackedItems lastObject];
      uint64_t v8 = [(StackController *)self stackElementForItem:v7 createIfNeeded:0];
      long long v9 = v8;
      if (v8)
      {
        long long v10 = [v8 itemView];
        long long v11 = [(StackController *)self dataSource];
        if (([v11 stackController:self isDataLoadedForItem:v7 inView:v10] & 1) == 0
          && [(StackController *)self _shouldLoadDataForElement:v12])
        {
          [v11 stackController:self loadDataForItem:v7 inView:v10];
        }
      }
    }
  }
}

- (void)stackElement:(id)a3 currentStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  id v8 = a3;
  if ([v8 targetState] == (id)a5)
  {
    switch(a5)
    {
      case 1:
      case 5:
      case 6:
        long long v9 = [v8 item];
        [v8 removeView];
        if (([(NSMutableArray *)self->_stackedItems containsObject:v9] & 1) == 0) {
          [(StackController *)self removeStackElement:v8];
        }
        if (v9
          && ([(NSMutableArray *)self->_stackedItems containsObject:v9] & 1) == 0)
        {
          [(NSMutableArray *)self->_orderedItems removeObject:v9];
        }
        goto LABEL_8;
      case 2:
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100219648;
        block[3] = &unk_1006047A0;
        id v10 = v8;
        id v15 = v10;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        [(StackController *)self removeStackElement:v10];

        break;
      case 4:
        if ((a4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && [(NSMutableArray *)self->_orderedItems count])
        {
          long long v9 = [v8 item];
          long long v11 = [(NSMutableArray *)self->_orderedItems lastObject];

          if (v9 == v11)
          {
            id v12 = [(StackController *)self dataSource];
            long long v13 = [v8 itemView];
            if (([v12 stackController:self isDataLoadedForItem:v9 inView:v13] & 1) == 0
              && [(StackController *)self _shouldLoadDataForElement:v8])
            {
              [v12 stackController:self loadDataForItem:v9 inView:v13];
            }
          }
LABEL_8:
        }
        break;
      default:
        break;
    }
  }
  [(StackController *)self setNeedsToUpdateStackElements];
}

- (void)stackElement:(id)a3 targetStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  id v11 = a3;
  if (a4 == 1 && a5 == 4)
  {
    id v8 = [(StackController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      long long v9 = [v11 itemView];
      id v10 = [v11 item];
      [v8 stackController:self willStackView:v9 forItem:v10];
    }
  }
  [(StackController *)self setNeedsToUpdateStackElements];
}

- (StackDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (StackDataSource *)WeakRetained;
}

- (StackDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (StackDelegate *)WeakRetained;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (BOOL)animateStateTransitions
{
  return self->_animateStateTransitions;
}

- (void)setAnimateStateTransitions:(BOOL)a3
{
  self->_animateStateTransitions = a3;
}

- (NSArray)itemsToDisplay
{
  return self->_itemsToDisplay;
}

- (void)setItemsToDisplay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsToDisplay, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_loadRequestDatesByItem, 0);
  objc_storeStrong((id *)&self->_stackElementsByItem, 0);
  objc_storeStrong((id *)&self->_orderedItems, 0);
  objc_storeStrong((id *)&self->_stackedItems, 0);

  objc_storeStrong((id *)&self->_stackContainerView, 0);
}

@end
@interface CRLRepContainerAccessibilityElement
- (BOOL)crlaxIsReadyToLoadChildren;
- (BOOL)crlaxShouldCacheChildren;
- (BOOL)crlaxShouldSortChildrenUsingStandardAlgorithm;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (CRLCanvasRepAccessibility)_selectableRep;
- (CRLCanvasRepAccessibility)rep;
- (CRLRepContainerAccessibilityElement)initWithRep:(id)a3 accessibilityParent:(id)a4;
- (void)crlaxChildWillBeRemoved:(id)a3;
- (void)crlaxDidInvalidateChildren;
- (void)crlaxLoadChildrenIntoCollection:(id)a3;
- (void)dealloc;
- (void)setRep:(id)a3;
@end

@implementation CRLRepContainerAccessibilityElement

- (CRLRepContainerAccessibilityElement)initWithRep:(id)a3 accessibilityParent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CRLRepContainerAccessibilityElement;
  v8 = [(CRLAccessibilityElement *)&v17 initWithAccessibilityParent:v7];
  int ShouldPerformValidationChecks = CRLAccessibilityShouldPerformValidationChecks();
  if (v6 || !ShouldPerformValidationChecks)
  {
    if (v6) {
      objc_storeWeak((id *)&v8->_rep, v6);
    }
  }
  else
  {
    int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Cannot create a rep container with a nil rep!", v11, v12, v13, v14, v15, (uint64_t)v17.receiver))abort(); {
  }
    }

  return v8;
}

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(CRLRepContainerAccessibilityElement *)self crlaxChildren];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) setAccessibilityContainer:0];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  objc_storeWeak((id *)&self->_rep, 0);
  v8.receiver = self;
  v8.super_class = (Class)CRLRepContainerAccessibilityElement;
  [(CRLRepContainerAccessibilityElement *)&v8 dealloc];
}

- (BOOL)crlaxShouldCacheChildren
{
  return 0;
}

- (BOOL)crlaxIsReadyToLoadChildren
{
  v3 = [(CRLRepContainerAccessibilityElement *)self rep];
  if (v3)
  {
    id v4 = [(CRLRepContainerAccessibilityElement *)self rep];
    if ([v4 crlaxIsBeingRemoved])
    {
      BOOL v5 = 0;
    }
    else
    {
      uint64_t v6 = [(CRLRepContainerAccessibilityElement *)self rep];
      id v7 = [v6 crlaxInteractiveCanvasController];
      if ([v7 crlaxIsTearingDown]) {
        BOOL v5 = 0;
      }
      else {
        BOOL v5 = +[NSThread isMainThread];
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)crlaxLoadChildrenIntoCollection:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRLRepContainerAccessibilityElement *)self rep];
  [v4 addObject:v5];
  if ([v5 crlaxShouldCreateKnobs])
  {
    uint64_t v6 = [(CRLRepContainerAccessibilityElement *)self _selectableRep];
    id v7 = [v6 crlaxKnobAccessibilityElements];
    objc_super v8 = +[CRLCanvasKnobAccessibilityElement crlaxSortKnobElements:v7];
    [v4 addObjectsFromArray:v8];
  }
  if ([v5 isAccessibilityElement])
  {
    long long v9 = [v5 crlaxChildren];
    id v10 = [v9 count];

    if (v10)
    {
      long long v11 = [v5 crlaxChildren];
      [v4 addObjectsFromArray:v11];
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_super v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v17 crlaxEnsureChildrenAreLoaded];
        [v17 setAccessibilityContainer:self];
      }
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

- (void)crlaxChildWillBeRemoved:(id)a3
{
}

- (void)crlaxDidInvalidateChildren
{
}

- (BOOL)crlaxShouldSortChildrenUsingStandardAlgorithm
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (CGRect)accessibilityFrame
{
  v2 = [(CRLRepContainerAccessibilityElement *)self _selectableRep];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CRLCanvasRepAccessibility)_selectableRep
{
  p_rep = &self->_rep;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);
  double v4 = [WeakRetained crlaxRepForSelecting];

  if (!v4) {
    double v4 = objc_loadWeakRetained((id *)p_rep);
  }

  return (CRLCanvasRepAccessibility *)v4;
}

- (CRLCanvasRepAccessibility)rep
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rep);

  return (CRLCanvasRepAccessibility *)WeakRetained;
}

- (void)setRep:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
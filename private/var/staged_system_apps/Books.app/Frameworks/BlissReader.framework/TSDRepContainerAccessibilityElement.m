@interface TSDRepContainerAccessibilityElement
- (BOOL)isAccessibilityElement;
- (BOOL)tsaxIsReadyToLoadChildren;
- (BOOL)tsaxShouldCacheChildren;
- (BOOL)tsaxShouldSortChildrenUsingStandardAlgorithm;
- (CGRect)accessibilityFrame;
- (TSDRepAccessibility)_selectableRep;
- (TSDRepAccessibility)rep;
- (TSDRepContainerAccessibilityElement)initWithRep:(id)a3;
- (void)dealloc;
- (void)setRep:(id)a3;
- (void)tsaxChildWillBeRemoved:(id)a3;
- (void)tsaxDidInvalidateChildren;
- (void)tsaxLoadChildrenIntoCollection:(id)a3;
@end

@implementation TSDRepContainerAccessibilityElement

- (TSDRepContainerAccessibilityElement)initWithRep:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)TSDRepContainerAccessibilityElement;
  v4 = -[TSAccessibilityElement initWithAccessibilityParent:](&v13, "initWithAccessibilityParent:", objc_msgSend(objc_msgSend(a3, "tsaxCanvas"), "tsaxCanvasContainerView"));
  int ShouldPerformValidationChecks = TSAccessibilityShouldPerformValidationChecks();
  if (a3 || !ShouldPerformValidationChecks)
  {
    if (a3) {
      v4->_rep = (TSDRepAccessibility *)a3;
    }
  }
  else
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Cannot create a rep container with a nil rep!", v7, v8, v9, v10, v11, (uint64_t)v13.receiver))abort(); {
  }
    }
  return v4;
}

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(TSDRepContainerAccessibilityElement *)self tsaxChildren];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) setAccessibilityContainer:0];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  self->_rep = 0;
  v8.receiver = self;
  v8.super_class = (Class)TSDRepContainerAccessibilityElement;
  [(TSDRepContainerAccessibilityElement *)&v8 dealloc];
}

- (BOOL)tsaxShouldCacheChildren
{
  return 0;
}

- (BOOL)tsaxIsReadyToLoadChildren
{
  id v3 = [(TSDRepContainerAccessibilityElement *)self rep];
  if (v3)
  {
    if ([(TSDInteractiveCanvasControllerAccessibility *)[(TSDRepAccessibility *)[(TSDRepContainerAccessibilityElement *)self rep] tsaxInteractiveCanvasController] tsaxIsTearingDown])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      LODWORD(v3) = +[NSThread isMainThread];
      if (v3) {
        LOBYTE(v3) = [(TSDRepAccessibility *)[(TSDRepContainerAccessibilityElement *)self rep] tsaxCanvas] != 0;
      }
    }
  }
  return (char)v3;
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  id v5 = [(TSDRepContainerAccessibilityElement *)self rep];
  [a3 addObject:v5];
  if ([(TSDRepAccessibility *)v5 tsaxShouldCreateKnobs])
  {
    [a3 addObjectsFromArray:[-[TSDRepContainerAccessibilityElement _selectableRep](self, "_selectableRep") tsaxKnobAccessibilityElements]];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_253050;
    v15[3] = &unk_457B78;
    v15[4] = v5;
    [a3 sortUsingComparator:v15];
  }
  if ([(TSDRepAccessibility *)v5 isAccessibilityElement]
    && objc_msgSend(-[TSDRepAccessibility tsaxChildren](v5, "tsaxChildren"), "count"))
  {
    [a3 addObjectsFromArray:[v5 tsaxChildren]];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v10 tsaxEnsureChildrenAreLoaded];
        [v10 setAccessibilityContainer:self];
      }
      id v7 = [a3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)tsaxChildWillBeRemoved:(id)a3
{
}

- (void)tsaxDidInvalidateChildren
{
}

- (BOOL)tsaxShouldSortChildrenUsingStandardAlgorithm
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (CGRect)accessibilityFrame
{
  v2 = [(TSDRepContainerAccessibilityElement *)self _selectableRep];

  [(TSDRepAccessibility *)v2 accessibilityFrame];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (TSDRepAccessibility)_selectableRep
{
  CGRect result = [(TSDRepAccessibility *)self->_rep tsaxRepForSelecting];
  if (!result) {
    return self->_rep;
  }
  return result;
}

- (TSDRepAccessibility)rep
{
  return self->_rep;
}

- (void)setRep:(id)a3
{
  self->_rep = (TSDRepAccessibility *)a3;
}

@end
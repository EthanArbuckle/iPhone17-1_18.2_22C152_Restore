@interface _UIViewVisitor
+ (void)_addHierarchyTrackingVisitor:(id)a3;
+ (void)_removeHierarchyTrackingVisitor:(id)a3;
+ (void)_startTraversalOfVisitor:(id)a3 withView:(id)a4;
- (BOOL)_currentlyVisitingHierarchy;
- (BOOL)_prepareToVisitView:(id)a3 changedSubview:(id)a4 previousWindow:(id)a5 previousSuperview:(id)a6;
- (BOOL)_visitView:(id)a3;
- (BOOL)tracksHierarchy;
- (BOOL)visitMaskViews;
- (_UIViewVisitor)initWithTraversalDirection:(unint64_t)a3;
- (unint64_t)traversalDirection;
- (void)setTracksHierarchy:(BOOL)a3;
- (void)setVisitMaskViews:(BOOL)a3;
- (void)set_currentlyVisitingHierarchy:(BOOL)a3;
@end

@implementation _UIViewVisitor

- (BOOL)_currentlyVisitingHierarchy
{
  return self->__currentlyVisitingHierarchy;
}

- (BOOL)tracksHierarchy
{
  return self->_tracksHierarchy;
}

- (void)set_currentlyVisitingHierarchy:(BOOL)a3
{
  self->__currentlyVisitingHierarchy = a3;
}

- (BOOL)visitMaskViews
{
  return self->_visitMaskViews;
}

+ (void)_startTraversalOfVisitor:(id)a3 withView:(id)a4
{
  v8[5] = *(void **)MEMORY[0x1E4F143B8];
  if ([a3 tracksHierarchy]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"_UIViewVisitors.m", 233, @"Ancestor tracking visitors are not allowed to be used as requested traversal visitors");
  }
  if ([a3 _prepareToVisitView:a4 changedSubview:0 previousWindow:0 previousSuperview:0])
  {
    objc_msgSend(a3, "set_currentlyVisitingHierarchy:", 1);
    if (objc_msgSend(a3, "traversalDirection", a3, 0))
    {
      _UIViewVisitorEntertainAscendingVisitors((uint64_t)v8, 1, a4);
    }
    else if (([a3 traversalDirection] & 2) != 0)
    {
      _UIViewVisitorRecursivelyEntertainDescendingVisitors(v8, 1, a4, 0);
    }
    objc_msgSend(a3, "set_currentlyVisitingHierarchy:", 0);
  }
}

- (unint64_t)traversalDirection
{
  return self->_traversalDirection;
}

- (_UIViewVisitor)initWithTraversalDirection:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIViewVisitor;
  result = [(_UIViewVisitor *)&v5 init];
  if (result)
  {
    result->_visitMaskViews = 1;
    result->_traversalDirection = a3;
  }
  return result;
}

- (void)setVisitMaskViews:(BOOL)a3
{
  self->_visitMaskViews = a3;
}

- (BOOL)_prepareToVisitView:(id)a3 changedSubview:(id)a4 previousWindow:(id)a5 previousSuperview:(id)a6
{
  return 1;
}

+ (void)_addHierarchyTrackingVisitor:(id)a3
{
  if ([a3 traversalDirection])
  {
    v4 = &_MergedGlobals_15_7;
  }
  else
  {
    if (([a3 traversalDirection] & 2) == 0) {
      return;
    }
    v4 = &qword_1EB25EA98;
  }
  if (!*v4) {
    uint64_t *v4 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  }
  [a3 setTracksHierarchy:1];
  objc_super v5 = (void *)*v4;
  [v5 addObject:a3];
}

- (void)setTracksHierarchy:(BOOL)a3
{
  self->_tracksHierarchy = a3;
}

+ (void)_removeHierarchyTrackingVisitor:(id)a3
{
  if ([a3 traversalDirection])
  {
    v4 = &_MergedGlobals_15_7;
  }
  else
  {
    if (([a3 traversalDirection] & 2) == 0) {
      return;
    }
    v4 = &qword_1EB25EA98;
  }
  objc_super v5 = (void *)*v4;
  [v5 removeObject:a3];
}

- (BOOL)_visitView:(id)a3
{
  return 1;
}

@end
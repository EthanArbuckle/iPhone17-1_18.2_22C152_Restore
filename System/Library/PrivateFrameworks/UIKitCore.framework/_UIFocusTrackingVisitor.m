@interface _UIFocusTrackingVisitor
- (BOOL)_prepareToVisitView:(id)a3 changedSubview:(id)a4 previousWindow:(id)a5 previousSuperview:(id)a6;
- (BOOL)_visitView:(id)a3;
@end

@implementation _UIFocusTrackingVisitor

- (BOOL)_visitView:(id)a3
{
  BOOL subviewAddedToHierarchy = self->_subviewAddedToHierarchy;
  uint64_t v6 = [a3 _countOfFocusedAncestorTrackingViewsInSubtree];
  unint64_t countOfFocusedAncestorTrackingViewsInSubtree = self->_countOfFocusedAncestorTrackingViewsInSubtree;
  if (!subviewAddedToHierarchy) {
    unint64_t countOfFocusedAncestorTrackingViewsInSubtree = -(uint64_t)countOfFocusedAncestorTrackingViewsInSubtree;
  }
  [a3 _setCountOfFocusedAncestorTrackingViewsInSubtree:countOfFocusedAncestorTrackingViewsInSubtree + v6];
  return 1;
}

- (BOOL)_prepareToVisitView:(id)a3 changedSubview:(id)a4 previousWindow:(id)a5 previousSuperview:(id)a6
{
  uint64_t v9 = [a4 _countOfFocusedAncestorTrackingViewsInSubtree];
  if (v9)
  {
    self->_BOOL subviewAddedToHierarchy = [a4 superview] == (void)a3;
    self->_unint64_t countOfFocusedAncestorTrackingViewsInSubtree = [a4 _countOfFocusedAncestorTrackingViewsInSubtree];
  }
  return v9 != 0;
}

@end
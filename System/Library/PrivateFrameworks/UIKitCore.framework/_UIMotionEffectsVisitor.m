@interface _UIMotionEffectsVisitor
- (BOOL)_prepareToVisitView:(id)a3 changedSubview:(id)a4 previousWindow:(id)a5 previousSuperview:(id)a6;
- (BOOL)_visitView:(id)a3;
@end

@implementation _UIMotionEffectsVisitor

- (BOOL)_prepareToVisitView:(id)a3 changedSubview:(id)a4 previousWindow:(id)a5 previousSuperview:(id)a6
{
  uint64_t v9 = [a4 _countOfMotionEffectsInSubtree];
  if (v9)
  {
    self->_subviewAddedToHierarchy = [a4 superview] == (void)a3;
    self->_countOfMotionEffectsInSubview = [a4 _countOfMotionEffectsInSubtree];
  }
  return v9 != 0;
}

- (BOOL)_visitView:(id)a3
{
  BOOL subviewAddedToHierarchy = self->_subviewAddedToHierarchy;
  uint64_t v6 = [a3 _countOfMotionEffectsInSubtree];
  unint64_t countOfMotionEffectsInSubview = self->_countOfMotionEffectsInSubview;
  if (!subviewAddedToHierarchy) {
    unint64_t countOfMotionEffectsInSubview = -(uint64_t)countOfMotionEffectsInSubview;
  }
  [a3 _setCountOfMotionEffectsInSubtree:countOfMotionEffectsInSubview + v6];
  return 1;
}

@end
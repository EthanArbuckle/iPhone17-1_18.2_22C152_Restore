@interface SBSwitcherLayoutCalculationsCacheValidityToken
- (BOOL)isEqual:(id)a3;
- (CGRect)containerViewBounds;
- (SBSwitcherLayoutCalculationsCacheValidityToken)initWithAppLayoutsGenCount:(unint64_t)a3 continuousExposeIdentifiersGenCount:(unint64_t)a4 switcherInterfaceOrientation:(int64_t)a5 containerViewBounds:(CGRect)a6 modifierEventGenCount:(unint64_t)a7;
- (int64_t)switcherInterfaceOrientation;
- (unint64_t)appLayoutsGenCount;
- (unint64_t)continuousExposeIdentifiersGenCount;
- (unint64_t)modifierEventGenCount;
- (void)setAppLayoutsGenCount:(unint64_t)a3;
- (void)setContainerViewBounds:(CGRect)a3;
- (void)setContinuousExposeIdentifiersGenCount:(unint64_t)a3;
- (void)setModifierEventGenCount:(unint64_t)a3;
- (void)setSwitcherInterfaceOrientation:(int64_t)a3;
@end

@implementation SBSwitcherLayoutCalculationsCacheValidityToken

- (SBSwitcherLayoutCalculationsCacheValidityToken)initWithAppLayoutsGenCount:(unint64_t)a3 continuousExposeIdentifiersGenCount:(unint64_t)a4 switcherInterfaceOrientation:(int64_t)a5 containerViewBounds:(CGRect)a6 modifierEventGenCount:(unint64_t)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)SBSwitcherLayoutCalculationsCacheValidityToken;
  result = [(SBSwitcherLayoutCalculationsCacheValidityToken *)&v16 init];
  if (result)
  {
    result->_appLayoutsGenCount = a3;
    result->_continuousExposeIdentifiersGenCount = a4;
    result->_containerViewBounds.origin.CGFloat x = x;
    result->_containerViewBounds.origin.CGFloat y = y;
    result->_containerViewBounds.size.CGFloat width = width;
    result->_containerViewBounds.size.CGFloat height = height;
    result->_switcherInterfaceOrientation = a5;
    result->_modifierEventGenCount = a7;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBSwitcherLayoutCalculationsCacheValidityToken *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = v5;
      BOOL v7 = self->_appLayoutsGenCount == v5->_appLayoutsGenCount
        && self->_continuousExposeIdentifiersGenCount == v5->_continuousExposeIdentifiersGenCount
        && self->_switcherInterfaceOrientation == v5->_switcherInterfaceOrientation
        && CGRectEqualToRect(self->_containerViewBounds, v5->_containerViewBounds)
        && self->_modifierEventGenCount == v6->_modifierEventGenCount;
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)appLayoutsGenCount
{
  return self->_appLayoutsGenCount;
}

- (void)setAppLayoutsGenCount:(unint64_t)a3
{
  self->_appLayoutsGenCount = a3;
}

- (unint64_t)continuousExposeIdentifiersGenCount
{
  return self->_continuousExposeIdentifiersGenCount;
}

- (void)setContinuousExposeIdentifiersGenCount:(unint64_t)a3
{
  self->_continuousExposeIdentifiersGenCount = a3;
}

- (int64_t)switcherInterfaceOrientation
{
  return self->_switcherInterfaceOrientation;
}

- (void)setSwitcherInterfaceOrientation:(int64_t)a3
{
  self->_switcherInterfaceOrientation = a3;
}

- (CGRect)containerViewBounds
{
  double x = self->_containerViewBounds.origin.x;
  double y = self->_containerViewBounds.origin.y;
  double width = self->_containerViewBounds.size.width;
  double height = self->_containerViewBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContainerViewBounds:(CGRect)a3
{
  self->_containerViewBounds = a3;
}

- (unint64_t)modifierEventGenCount
{
  return self->_modifierEventGenCount;
}

- (void)setModifierEventGenCount:(unint64_t)a3
{
  self->_modifierEventGenCount = a3;
}

@end
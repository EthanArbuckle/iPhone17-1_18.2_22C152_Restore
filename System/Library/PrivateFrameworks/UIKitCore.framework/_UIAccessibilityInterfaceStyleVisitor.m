@interface _UIAccessibilityInterfaceStyleVisitor
- (BOOL)_prepareToVisitView:(id)a3 changedSubview:(id)a4 previousWindow:(id)a5 previousSuperview:(id)a6;
- (BOOL)_visitView:(id)a3;
@end

@implementation _UIAccessibilityInterfaceStyleVisitor

- (BOOL)_visitView:(id)a3
{
  v5 = (void *)[a3 superview];
  if ([a3 _accessibilityInterfaceStyleIntent] == 1
    && [a3 _accessibilityResolvedInterfaceStyle] != 1)
  {
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = [a3 _accessibilityInterfaceStyleIntent] == 2
      && [a3 _accessibilityResolvedInterfaceStyle] != 2;
  }
  objc_opt_class();
  BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
    && [a3 _accessibilityInterfaceStyleIntent] != 2
    && [a3 _accessibilityResolvedInterfaceStyle] == 2;
  if (v6 || v7)
  {
    if ([a3 _accessibilityInterfaceStyleIntent] == 2) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    goto LABEL_15;
  }
  if (v5)
  {
    if (![a3 _accessibilityInterfaceStyleIntent])
    {
      uint64_t v10 = [v5 _accessibilityResolvedInterfaceStyle];
      if (v10 != [a3 _accessibilityResolvedInterfaceStyle])
      {
        uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "superview"), "_accessibilityResolvedInterfaceStyle");
LABEL_15:
        [a3 _accessibilitySetResolvedInterfaceStyle:v8];
        [a3 _tintColorDidChange];
        return 1;
      }
    }
  }
  return self->_originalVisitedView == a3;
}

- (BOOL)_prepareToVisitView:(id)a3 changedSubview:(id)a4 previousWindow:(id)a5 previousSuperview:(id)a6
{
  if ([(_UIViewVisitor *)self tracksHierarchy]
    && (id)[a4 superview] != a3)
  {
    return 0;
  }
  self->_originalVisitedView = (UIView *)a3;
  return 1;
}

@end
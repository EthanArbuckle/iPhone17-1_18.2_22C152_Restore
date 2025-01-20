@interface SBOverrideInterfaceOrientationSwitcherModifier
- (CGRect)containerViewBounds;
- (CGRect)switcherViewBounds;
- (SBOverrideInterfaceOrientationSwitcherModifier)initWithInterfaceOrientation:(int64_t)a3;
- (int64_t)switcherInterfaceOrientation;
@end

@implementation SBOverrideInterfaceOrientationSwitcherModifier

- (SBOverrideInterfaceOrientationSwitcherModifier)initWithInterfaceOrientation:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBOverrideInterfaceOrientationSwitcherModifier;
  result = [(SBSwitcherModifier *)&v5 init];
  if (result) {
    result->_orientation = a3;
  }
  return result;
}

- (int64_t)switcherInterfaceOrientation
{
  return self->_orientation;
}

- (CGRect)containerViewBounds
{
  v17.receiver = self;
  v17.super_class = (Class)SBOverrideInterfaceOrientationSwitcherModifier;
  [(SBOverrideInterfaceOrientationSwitcherModifier *)&v17 containerViewBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v16.receiver = self;
  v16.super_class = (Class)SBOverrideInterfaceOrientationSwitcherModifier;
  int v11 = ((char *)[(SBOverrideInterfaceOrientationSwitcherModifier *)&v16 switcherInterfaceOrientation]- 1 < (char *)2) ^ ((unint64_t)(self->_orientation - 1) < 2);
  if (v11) {
    double v12 = v8;
  }
  else {
    double v12 = v10;
  }
  if (v11) {
    double v13 = v10;
  }
  else {
    double v13 = v8;
  }
  double v14 = v4;
  double v15 = v6;
  result.size.height = v12;
  result.size.width = v13;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)switcherViewBounds
{
  v17.receiver = self;
  v17.super_class = (Class)SBOverrideInterfaceOrientationSwitcherModifier;
  [(SBOverrideInterfaceOrientationSwitcherModifier *)&v17 switcherViewBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v16.receiver = self;
  v16.super_class = (Class)SBOverrideInterfaceOrientationSwitcherModifier;
  int v11 = ((char *)[(SBOverrideInterfaceOrientationSwitcherModifier *)&v16 switcherInterfaceOrientation]- 1 < (char *)2) ^ ((unint64_t)(self->_orientation - 1) < 2);
  if (v11) {
    double v12 = v8;
  }
  else {
    double v12 = v10;
  }
  if (v11) {
    double v13 = v10;
  }
  else {
    double v13 = v8;
  }
  double v14 = v4;
  double v15 = v6;
  result.size.height = v12;
  result.size.width = v13;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

@end
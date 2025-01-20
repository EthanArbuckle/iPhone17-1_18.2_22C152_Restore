@interface UIInterfaceActionGroupViewState
- (BOOL)_stateEqualToGroupViewState:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVerticalLayoutAxis;
- (UIInterfaceActionGroupViewState)init;
- (id)copyWithResolvedPresentationStyle:(int64_t)a3;
- (id)copyWithVerticalLayoutAxis:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)resolvedPresentationStyle;
- (void)_collectStateFromGroupViewState:(id)a3;
@end

@implementation UIInterfaceActionGroupViewState

- (UIInterfaceActionGroupViewState)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIInterfaceActionGroupViewState;
  result = [(UIInterfaceActionVisualStyleViewState *)&v3 init];
  if (result)
  {
    result->_isVerticalLayoutAxis = 1;
    result->_resolvedPresentationStyle = 0;
  }
  return result;
}

- (id)copyWithVerticalLayoutAxis:(BOOL)a3
{
  id result = (id)[(UIInterfaceActionGroupViewState *)self copy];
  *((unsigned char *)result + 32) = a3;
  return result;
}

- (id)copyWithResolvedPresentationStyle:(int64_t)a3
{
  id result = (id)[(UIInterfaceActionGroupViewState *)self copy];
  *((void *)result + 5) = a3;
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)UIInterfaceActionGroupViewState;
  v4 = [(UIInterfaceActionVisualStyleViewState *)&v9 description];
  v5 = [NSNumber numberWithBool:self->_isVerticalLayoutAxis];
  v6 = [NSNumber numberWithInteger:self->_resolvedPresentationStyle];
  v7 = [v3 stringWithFormat:@"%@ vertical = %@, resolvedPresentationStyle = %@", v4, v5, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIInterfaceActionGroupViewState;
  id v4 = [(UIInterfaceActionVisualStyleViewState *)&v6 copyWithZone:a3];
  [v4 _collectStateFromGroupViewState:self];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(UIInterfaceActionGroupViewState *)self _stateEqualToGroupViewState:v4];

  return v5;
}

- (void)_collectStateFromGroupViewState:(id)a3
{
  id v4 = a3;
  self->_isVerticalLayoutAxis = [v4 isVerticalLayoutAxis];
  int64_t v5 = [v4 resolvedPresentationStyle];

  self->_resolvedPresentationStyle = v5;
}

- (BOOL)_stateEqualToGroupViewState:(id)a3
{
  id v4 = a3;
  int isVerticalLayoutAxis = self->_isVerticalLayoutAxis;
  if (isVerticalLayoutAxis == [v4 isVerticalLayoutAxis])
  {
    int64_t resolvedPresentationStyle = self->_resolvedPresentationStyle;
    BOOL v7 = resolvedPresentationStyle == [v4 resolvedPresentationStyle];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isVerticalLayoutAxis
{
  return self->_isVerticalLayoutAxis;
}

- (int64_t)resolvedPresentationStyle
{
  return self->_resolvedPresentationStyle;
}

@end
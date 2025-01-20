@interface STUIStatusBarDisplayItemPlacementLocationGroup
- (STUIStatusBarDisplayItemPlacement)prominentPlacement;
- (STUIStatusBarDisplayItemPlacement)regularPlacement;
- (void)setProminentPlacement:(id)a3;
- (void)setRegularPlacement:(id)a3;
@end

@implementation STUIStatusBarDisplayItemPlacementLocationGroup

- (STUIStatusBarDisplayItemPlacement)regularPlacement
{
  return self->_regularPlacement;
}

- (STUIStatusBarDisplayItemPlacement)prominentPlacement
{
  return self->_prominentPlacement;
}

- (void)setRegularPlacement:(id)a3
{
}

- (void)setProminentPlacement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prominentPlacement, 0);
  objc_storeStrong((id *)&self->_regularPlacement, 0);
}

@end
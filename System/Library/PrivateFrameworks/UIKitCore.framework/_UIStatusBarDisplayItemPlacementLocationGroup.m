@interface _UIStatusBarDisplayItemPlacementLocationGroup
- (_UIStatusBarDisplayItemPlacement)prominentPlacement;
- (_UIStatusBarDisplayItemPlacement)regularPlacement;
- (void)setProminentPlacement:(id)a3;
- (void)setRegularPlacement:(id)a3;
@end

@implementation _UIStatusBarDisplayItemPlacementLocationGroup

- (_UIStatusBarDisplayItemPlacement)regularPlacement
{
  return self->_regularPlacement;
}

- (void)setRegularPlacement:(id)a3
{
}

- (_UIStatusBarDisplayItemPlacement)prominentPlacement
{
  return self->_prominentPlacement;
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
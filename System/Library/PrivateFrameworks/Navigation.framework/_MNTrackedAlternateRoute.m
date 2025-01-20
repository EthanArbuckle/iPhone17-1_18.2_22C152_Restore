@interface _MNTrackedAlternateRoute
- ($212C09783140BCCD23384160D545CE0D)divergenceCoordinate;
- (MNActiveRouteInfo)alternateRoute;
- (MNActiveRouteInfo)mainRoute;
- (void)setAlternateRoute:(id)a3;
- (void)setDivergenceCoordinate:(id)a3;
- (void)setMainRoute:(id)a3;
@end

@implementation _MNTrackedAlternateRoute

- (MNActiveRouteInfo)alternateRoute
{
  return self->_alternateRoute;
}

- (void)setAlternateRoute:(id)a3
{
}

- (MNActiveRouteInfo)mainRoute
{
  return self->_mainRoute;
}

- (void)setMainRoute:(id)a3
{
}

- ($212C09783140BCCD23384160D545CE0D)divergenceCoordinate
{
  return ($212C09783140BCCD23384160D545CE0D)self->_divergenceCoordinate;
}

- (void)setDivergenceCoordinate:(id)a3
{
  self->_divergenceCoordinate = ($604ECB7A8067A7300F159AE8ED6889F8)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainRoute, 0);
  objc_storeStrong((id *)&self->_alternateRoute, 0);
}

@end
@interface FMDAVRoute
- (BOOL)currentlyPicked;
- (NSDictionary)rawRouteInfo;
- (NSString)routeID;
- (NSString)routeSubType;
- (NSString)routeType;
- (id)description;
- (void)setCurrentlyPicked:(BOOL)a3;
- (void)setRawRouteInfo:(id)a3;
- (void)setRouteID:(id)a3;
- (void)setRouteSubType:(id)a3;
- (void)setRouteType:(id)a3;
@end

@implementation FMDAVRoute

- (id)description
{
  v3 = [(FMDAVRoute *)self routeID];
  v4 = [(FMDAVRoute *)self routeType];
  v5 = [(FMDAVRoute *)self routeSubType];
  unsigned int v6 = [(FMDAVRoute *)self currentlyPicked];
  CFStringRef v7 = @"NO";
  if (v6) {
    CFStringRef v7 = @"YES";
  }
  v8 = +[NSString stringWithFormat:@"Route ID: %@, Type: %@, Subtype: %@, CurrentlyPicked:%@", v3, v4, v5, v7];

  return v8;
}

- (NSString)routeID
{
  return self->_routeID;
}

- (void)setRouteID:(id)a3
{
}

- (NSString)routeType
{
  return self->_routeType;
}

- (void)setRouteType:(id)a3
{
}

- (NSString)routeSubType
{
  return self->_routeSubType;
}

- (void)setRouteSubType:(id)a3
{
}

- (BOOL)currentlyPicked
{
  return self->_currentlyPicked;
}

- (void)setCurrentlyPicked:(BOOL)a3
{
  self->_currentlyPicked = a3;
}

- (NSDictionary)rawRouteInfo
{
  return self->_rawRouteInfo;
}

- (void)setRawRouteInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawRouteInfo, 0);
  objc_storeStrong((id *)&self->_routeSubType, 0);
  objc_storeStrong((id *)&self->_routeType, 0);

  objc_storeStrong((id *)&self->_routeID, 0);
}

@end
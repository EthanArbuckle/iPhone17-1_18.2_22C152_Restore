@interface MRDAVRouteExtendedInfo
+ (id)extendedInfoWithRoute:(id)a3;
- (BOOL)canBeDefaultRoute;
- (BOOL)canBeSystemDefaultRoute;
- (BOOL)isInputRoute;
- (BOOL)isOutputRoute;
- (BOOL)requiresPIN;
- (MRDAVRouteExtendedInfo)initWithRoute:(id)a3;
- (NSDictionary)route;
- (NSString)deviceIdentifier;
- (NSString)modelName;
- (id)_extendedInfo;
@end

@implementation MRDAVRouteExtendedInfo

+ (id)extendedInfoWithRoute:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithRoute:v3];

  return v4;
}

- (MRDAVRouteExtendedInfo)initWithRoute:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRDAVRouteExtendedInfo;
  v5 = [(MRDAVRouteExtendedInfo *)&v9 init];
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    route = v5->_route;
    v5->_route = v6;
  }
  return v5;
}

- (BOOL)requiresPIN
{
  v2 = [(MRDAVRouteExtendedInfo *)self _extendedInfo];
  id v3 = [v2 objectForKey:@"systemFlags"];
  id v4 = v3;
  if (v3) {
    unsigned int v5 = ([v3 unsignedIntValue] >> 3) & 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (NSString)modelName
{
  v2 = [(MRDAVRouteExtendedInfo *)self _extendedInfo];
  id v3 = [v2 objectForKey:@"model"];

  return (NSString *)v3;
}

- (NSString)deviceIdentifier
{
  v2 = [(MRDAVRouteExtendedInfo *)self _extendedInfo];
  id v3 = [v2 objectForKey:@"deviceID"];

  return (NSString *)v3;
}

- (id)_extendedInfo
{
  return [(NSDictionary *)self->_route objectForKey:@"AirPlayPortExtendedInfo"];
}

- (NSDictionary)route
{
  return self->_route;
}

- (BOOL)canBeDefaultRoute
{
  return self->_canBeDefaultRoute;
}

- (BOOL)canBeSystemDefaultRoute
{
  return self->_canBeSystemDefaultRoute;
}

- (BOOL)isInputRoute
{
  return self->_inputRoute;
}

- (BOOL)isOutputRoute
{
  return self->_outputRoute;
}

- (void).cxx_destruct
{
}

@end
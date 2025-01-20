@interface MNNavigationServiceCallback_DidUpdateBackgroundWalkingRoute
+ (BOOL)supportsSecureCoding;
- (MNActiveRouteInfo)routeInfo;
- (MNNavigationServiceCallback_DidUpdateBackgroundWalkingRoute)initWithCoder:(id)a3;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setRouteInfo:(id)a3;
@end

@implementation MNNavigationServiceCallback_DidUpdateBackgroundWalkingRoute

- (unint64_t)type
{
  return 5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MNNavigationServiceCallback_DidUpdateBackgroundWalkingRoute)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNNavigationServiceCallback_DidUpdateBackgroundWalkingRoute;
  v5 = [(MNNavigationServiceCallbackParameters *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_routeInfo"];
    routeInfo = v5->_routeInfo;
    v5->_routeInfo = (MNActiveRouteInfo *)v6;

    v8 = v5;
  }

  return v5;
}

- (MNActiveRouteInfo)routeInfo
{
  return self->_routeInfo;
}

- (void)setRouteInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
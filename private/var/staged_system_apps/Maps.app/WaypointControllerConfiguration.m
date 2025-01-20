@interface WaypointControllerConfiguration
- (GEOMapServiceTraits)traits;
- (NSArray)requests;
- (WaypointControllerConfiguration)initWithRequests:(id)a3 traits:(id)a4;
- (WaypointRequest)destination;
- (WaypointRequest)origin;
- (id)debugDescription;
- (id)description;
@end

@implementation WaypointControllerConfiguration

- (WaypointControllerConfiguration)initWithRequests:(id)a3 traits:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ((unint64_t)[v7 count] <= 1)
  {
    v9 = sub_1005768D4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138412546;
      v17 = v11;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%@ is being initialized with insufficient waypoints(%@). This is not supported.", buf, 0x16u);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)WaypointControllerConfiguration;
  v12 = [(WaypointControllerConfiguration *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requests, a3);
    objc_storeStrong((id *)&v13->_traits, a4);
  }

  return v13;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v8.receiver = self;
  v8.super_class = (Class)WaypointControllerConfiguration;
  v4 = [(WaypointControllerConfiguration *)&v8 description];
  id v5 = [v3 initWithString:v4];

  [v5 appendFormat:@"\nrequests:(%@)", self->_requests];
  id v6 = [v5 copy];

  return v6;
}

- (id)debugDescription
{
  id v3 = objc_alloc((Class)NSMutableString);
  v4 = [(WaypointControllerConfiguration *)self description];
  id v5 = [v3 initWithString:v4];

  id v6 = +[GEOPlatform sharedPlatform];
  unsigned int v7 = [v6 isInternalInstall];

  if (v7) {
    [v5 appendFormat:@"\ntraits:(%@)", self->_traits];
  }
  id v8 = [v5 copy];

  return v8;
}

- (WaypointRequest)origin
{
  return (WaypointRequest *)[(NSArray *)self->_requests firstObject];
}

- (WaypointRequest)destination
{
  return (WaypointRequest *)[(NSArray *)self->_requests lastObject];
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (NSArray)requests
{
  return self->_requests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);

  objc_storeStrong((id *)&self->_traits, 0);
}

@end
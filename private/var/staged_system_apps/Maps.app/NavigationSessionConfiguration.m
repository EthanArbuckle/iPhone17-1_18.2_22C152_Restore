@interface NavigationSessionConfiguration
- (BOOL)isETAOnlyMode;
- (GEOMapServiceTraits)traits;
- (MNStartNavigationDetails)startNavigationDetails;
- (NavigationSessionConfiguration)initWithStartNavigationDetails:(id)a3 routeCollection:(id)a4 traits:(id)a5 isETAOnlyMode:(BOOL)a6;
- (RouteCollection)routeCollection;
- (SharedTripSuggestionsPrefetchContext)sharedTripPrefetchContext;
- (id)description;
- (void)setSharedTripPrefetchContext:(id)a3;
@end

@implementation NavigationSessionConfiguration

- (NavigationSessionConfiguration)initWithStartNavigationDetails:(id)a3 routeCollection:(id)a4 traits:(id)a5 isETAOnlyMode:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NavigationSessionConfiguration;
  v14 = [(NavigationSessionConfiguration *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_startNavigationDetails, a3);
    objc_storeStrong((id *)&v15->_routeCollection, a4);
    v16 = (GEOMapServiceTraits *)[v13 copy];
    traits = v15->_traits;
    v15->_traits = v16;

    v15->_isETAOnlyMode = a6;
  }

  return v15;
}

- (SharedTripSuggestionsPrefetchContext)sharedTripPrefetchContext
{
  sharedTripPrefetchContext = self->_sharedTripPrefetchContext;
  if (!sharedTripPrefetchContext)
  {
    v4 = objc_alloc_init(SharedTripSuggestionsPrefetchContext);
    v5 = self->_sharedTripPrefetchContext;
    self->_sharedTripPrefetchContext = v4;

    sharedTripPrefetchContext = self->_sharedTripPrefetchContext;
  }

  return sharedTripPrefetchContext;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@: %p, startNavigationDetails:%@, routeCollection:%@, isETAOnlyMode:%d>", v4, self, self->_startNavigationDetails, self->_routeCollection, self->_isETAOnlyMode];

  return v5;
}

- (RouteCollection)routeCollection
{
  return self->_routeCollection;
}

- (MNStartNavigationDetails)startNavigationDetails
{
  return self->_startNavigationDetails;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setSharedTripPrefetchContext:(id)a3
{
}

- (BOOL)isETAOnlyMode
{
  return self->_isETAOnlyMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedTripPrefetchContext, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_startNavigationDetails, 0);

  objc_storeStrong((id *)&self->_routeCollection, 0);
}

@end
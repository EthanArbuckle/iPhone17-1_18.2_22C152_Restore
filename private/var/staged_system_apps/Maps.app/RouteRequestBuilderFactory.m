@interface RouteRequestBuilderFactory
- (BOOL)isResumingMultipointRoute;
- (BOOL)useMetricSystem;
- (GEOComposedGeometryRoutePersistentData)persistentData;
- (GEOCountryConfiguration)countryConfiguration;
- (GEOLocation)currentUserLocation;
- (GEOMapServiceTraits)traits;
- (GEOResumeRouteHandle)resumeRouteHandle;
- (NSString)voiceLanguageIdentifier;
- (RouteRequestBuilderFactory)initWithTransportTypeRequestInfoProvider:(id)a3 waypointSet:(id)a4;
- (TransportTypeRequestInfoProvider)transportTypeRequestInfoProvider;
- (WaypointSet)waypointSet;
- (id)_routeAttributesBuilders;
- (id)makeRouteRequestBuilder;
- (unint64_t)initiator;
- (unint64_t)navigationMode;
- (void)setCountryConfiguration:(id)a3;
- (void)setInitiator:(unint64_t)a3;
- (void)setIsResumingMultipointRoute:(BOOL)a3;
- (void)setPersistentData:(id)a3;
- (void)setResumeRouteHandle:(id)a3;
- (void)setTraits:(id)a3;
- (void)setTransportTypeRequestInfoProvider:(id)a3;
- (void)setUseMetricSystem:(BOOL)a3;
- (void)setVoiceLanguageIdentifier:(id)a3;
- (void)setWaypointSet:(id)a3;
@end

@implementation RouteRequestBuilderFactory

- (RouteRequestBuilderFactory)initWithTransportTypeRequestInfoProvider:(id)a3 waypointSet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RouteRequestBuilderFactory;
  v9 = [(RouteRequestBuilderFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transportTypeRequestInfoProvider, a3);
    objc_storeStrong((id *)&v10->_waypointSet, a4);
  }

  return v10;
}

- (void)setUseMetricSystem:(BOOL)a3
{
  self->_useMetricSystemWasManuallySet = 1;
  self->_useMetricSystem = a3;
}

- (BOOL)useMetricSystem
{
  if (self->_useMetricSystemWasManuallySet) {
    return self->_useMetricSystem;
  }
  v3 = +[NSLocale currentLocale];
  unsigned __int8 v4 = [v3 _navigation_distanceUsesMetricSystem];

  return v4;
}

- (void)setCountryConfiguration:(id)a3
{
  v5 = (GEOCountryConfiguration *)a3;
  countryConfiguration = self->_countryConfiguration;
  p_countryConfiguration = &self->_countryConfiguration;
  if (countryConfiguration != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_countryConfiguration, a3);
    v5 = v8;
  }
}

- (GEOCountryConfiguration)countryConfiguration
{
  countryConfiguration = self->_countryConfiguration;
  if (countryConfiguration)
  {
    v3 = countryConfiguration;
  }
  else
  {
    v3 = +[GEOCountryConfiguration sharedConfiguration];
  }

  return v3;
}

- (void)setVoiceLanguageIdentifier:(id)a3
{
  unsigned __int8 v4 = (NSString *)a3;
  voiceLanguageIdentifier = self->_voiceLanguageIdentifier;
  if (voiceLanguageIdentifier != v4)
  {
    v9 = v4;
    unsigned __int8 v6 = [(NSString *)voiceLanguageIdentifier isEqualToString:v4];
    unsigned __int8 v4 = v9;
    if ((v6 & 1) == 0)
    {
      id v7 = (NSString *)[(NSString *)v9 copy];
      id v8 = self->_voiceLanguageIdentifier;
      self->_voiceLanguageIdentifier = v7;

      unsigned __int8 v4 = v9;
    }
  }
}

- (NSString)voiceLanguageIdentifier
{
  voiceLanguageIdentifier = self->_voiceLanguageIdentifier;
  if (voiceLanguageIdentifier)
  {
    v3 = voiceLanguageIdentifier;
  }
  else
  {
    unsigned __int8 v4 = +[MNNavigationService sharedService];
    v3 = [v4 currentVoiceLanguage];
  }

  return v3;
}

- (GEOLocation)currentUserLocation
{
  v2 = +[MKLocationManager sharedLocationManager];
  if ([v2 hasLocation] && (objc_msgSend(v2, "isLastLocationStale") & 1) == 0)
  {
    v3 = [v2 currentLocation];
  }
  else
  {
    v3 = 0;
  }

  return (GEOLocation *)v3;
}

- (unint64_t)navigationMode
{
  v2 = [(RouteRequestBuilderFactory *)self waypointSet];
  v3 = [v2 origin];
  unsigned int v4 = [v3 isCurrentLocation];

  return v4;
}

- (id)makeRouteRequestBuilder
{
  v16 = [RouteRequestBuilder alloc];
  v3 = [(RouteRequestBuilderFactory *)self waypointSet];
  unsigned int v4 = [(RouteRequestBuilderFactory *)self transportTypeRequestInfoProvider];
  id v5 = [v4 maximumRouteCount];
  unsigned __int8 v6 = [(RouteRequestBuilderFactory *)self _routeAttributesBuilders];
  id v7 = [(RouteRequestBuilderFactory *)self currentUserLocation];
  unint64_t v8 = [(RouteRequestBuilderFactory *)self initiator];
  v9 = [(RouteRequestBuilderFactory *)self traits];
  unsigned __int8 v10 = [(RouteRequestBuilderFactory *)self isResumingMultipointRoute];
  v11 = [(RouteRequestBuilderFactory *)self resumeRouteHandle];
  objc_super v12 = [(RouteRequestBuilderFactory *)self persistentData];
  LOBYTE(v15) = v10;
  v13 = [(RouteRequestBuilder *)v16 initWithWaypointSet:v3 maximumRouteCount:v5 routeAttributesBuilders:v6 currentUserLocation:v7 initiator:v8 traits:v9 isResumingMultipointRoute:v15 resumeRouteHandle:v11 persistentData:v12];

  return v13;
}

- (id)_routeAttributesBuilders
{
  v3 = +[NSMutableArray array];
  unsigned int v4 = [DefaultRouteAttributesBuilder alloc];
  id v5 = [(RouteRequestBuilderFactory *)self waypointSet];
  unsigned __int8 v6 = [v5 destination];
  id v7 = [(RouteRequestBuilderFactory *)self countryConfiguration];
  unint64_t v8 = [(RouteRequestBuilderFactory *)self voiceLanguageIdentifier];
  v9 = [(DefaultRouteAttributesBuilder *)v4 initWithDestination:v6 countryConfiguration:v7 voiceLanguageIdentifier:v8 useMetricSystem:[(RouteRequestBuilderFactory *)self useMetricSystem]];

  [v3 addObject:v9];
  unsigned __int8 v10 = [(RouteRequestBuilderFactory *)self transportTypeRequestInfoProvider];
  v11 = [v10 makeRouteAttributesBuilderWithNavigationMode:[self navigationMode]];

  [v3 addObject:v11];

  return v3;
}

- (TransportTypeRequestInfoProvider)transportTypeRequestInfoProvider
{
  return self->_transportTypeRequestInfoProvider;
}

- (void)setTransportTypeRequestInfoProvider:(id)a3
{
}

- (WaypointSet)waypointSet
{
  return self->_waypointSet;
}

- (void)setWaypointSet:(id)a3
{
}

- (unint64_t)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(unint64_t)a3
{
  self->_initiator = a3;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

- (void)setIsResumingMultipointRoute:(BOOL)a3
{
  self->_isResumingMultipointRoute = a3;
}

- (GEOResumeRouteHandle)resumeRouteHandle
{
  return self->_resumeRouteHandle;
}

- (void)setResumeRouteHandle:(id)a3
{
}

- (GEOComposedGeometryRoutePersistentData)persistentData
{
  return self->_persistentData;
}

- (void)setPersistentData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentData, 0);
  objc_storeStrong((id *)&self->_resumeRouteHandle, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_waypointSet, 0);
  objc_storeStrong((id *)&self->_transportTypeRequestInfoProvider, 0);
  objc_storeStrong((id *)&self->_voiceLanguageIdentifier, 0);

  objc_storeStrong((id *)&self->_countryConfiguration, 0);
}

@end
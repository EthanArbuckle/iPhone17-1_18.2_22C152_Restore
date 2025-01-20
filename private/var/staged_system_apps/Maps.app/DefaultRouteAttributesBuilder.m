@interface DefaultRouteAttributesBuilder
- (BOOL)useMetricSystem;
- (DefaultRouteAttributesBuilder)initWithDestination:(id)a3 countryConfiguration:(id)a4 voiceLanguageIdentifier:(id)a5 useMetricSystem:(BOOL)a6;
- (GEOComposedWaypoint)destinationWaypoint;
- (GEOCountryConfiguration)configuration;
- (NSString)voiceLanguageIdentifier;
- (void)fillRouteAttributes:(id)a3;
@end

@implementation DefaultRouteAttributesBuilder

- (DefaultRouteAttributesBuilder)initWithDestination:(id)a3 countryConfiguration:(id)a4 voiceLanguageIdentifier:(id)a5 useMetricSystem:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DefaultRouteAttributesBuilder;
  v13 = [(DefaultRouteAttributesBuilder *)&v19 init];
  if (v13)
  {
    v14 = (GEOComposedWaypoint *)[v10 copy];
    destinationWaypoint = v13->_destinationWaypoint;
    v13->_destinationWaypoint = v14;

    objc_storeStrong((id *)&v13->_configuration, a4);
    v16 = (NSString *)[v12 copy];
    voiceLanguageIdentifier = v13->_voiceLanguageIdentifier;
    v13->_voiceLanguageIdentifier = v16;

    v13->_useMetricSystem = a6;
  }

  return v13;
}

- (void)fillRouteAttributes:(id)a3
{
  id v9 = a3;
  v4 = [(DefaultRouteAttributesBuilder *)self configuration];
  [v9 setRoutePointTypeForTransportType:4 countryConfiguration:v4];

  [v9 setIncludeManeuverIcons:1];
  [v9 setIncludeTrafficAlongRoute:1];
  [v9 setIncludeTrafficIncidents:1];
  [v9 setIncludeLaneGuidance:1];
  v5 = +[GEOPlatform sharedPlatform];
  if ([v5 supportsAdvancedMap])
  {
    uint64_t IsEnabled = MapsFeature_IsEnabled();

    [v9 setIncludeLaneWidths:IsEnabled];
    if (IsEnabled)
    {
      uint64_t BOOL = GEOConfigGetBOOL();
      goto LABEL_6;
    }
  }
  else
  {

    [v9 setIncludeLaneWidths:0];
  }
  uint64_t BOOL = 0;
LABEL_6:
  [v9 setDirectZilchByLaneFlowlines:BOOL];
  [v9 addUiContext:2];
  [v9 addUiContext:1];
  v8 = [(DefaultRouteAttributesBuilder *)self voiceLanguageIdentifier];
  [v9 setPhoneticLocaleIdentifier:v8];

  [v9 setIncludeCrossLanguagePhonetics:GEOConfigGetBOOL()];
  [v9 setUseMetricThreshold:[self useMetricSystem]];
}

- (GEOComposedWaypoint)destinationWaypoint
{
  return self->_destinationWaypoint;
}

- (GEOCountryConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)voiceLanguageIdentifier
{
  return self->_voiceLanguageIdentifier;
}

- (BOOL)useMetricSystem
{
  return self->_useMetricSystem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceLanguageIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_destinationWaypoint, 0);
}

@end
@interface WFLocationParameter
- (BOOL)allowsCurrentLocation;
- (BOOL)allowsTextOnlyLocations;
- (BOOL)defaultToCurrentLocation;
- (BOOL)skipsProcessingCurrentLocation;
- (Class)singleStateClass;
- (WFLocationParameter)initWithDefinition:(id)a3;
- (double)currentLocationAccuracy;
- (id)defaultSerializedRepresentation;
@end

@implementation WFLocationParameter

- (BOOL)defaultToCurrentLocation
{
  return self->_defaultToCurrentLocation;
}

- (BOOL)skipsProcessingCurrentLocation
{
  return self->_skipsProcessingCurrentLocation;
}

- (BOOL)allowsCurrentLocation
{
  return self->_allowsCurrentLocation;
}

- (BOOL)allowsTextOnlyLocations
{
  return self->_allowsTextOnlyLocations;
}

- (id)defaultSerializedRepresentation
{
  if (self->_defaultToCurrentLocation)
  {
    v2 = [[WFLocationValue alloc] initWithCurrentLocation];
    v3 = [(WFLocationValue *)v2 serializedRepresentation];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (double)currentLocationAccuracy
{
  v2 = [(WFParameter *)self definition];
  v3 = [v2 objectForKey:@"CurrentLocationAccuracy"];
  uint64_t v4 = objc_opt_class();
  v5 = WFEnforceClass(v3, v4);

  if (v5) {
    WFCLLocationAccuracyFromWFLocationAccuracy(v5);
  }
  else {
    getkCLLocationAccuracyNearestTenMeters();
  }
  double v7 = v6;

  return v7;
}

- (WFLocationParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WFLocationParameter;
  v5 = [(WFParameter *)&v24 initWithDefinition:v4];
  if (v5)
  {
    double v6 = [v4 objectForKey:@"AllowTextOnly"];
    uint64_t v7 = objc_opt_class();
    v8 = WFEnforceClass(v6, v7);
    v5->_allowsTextOnlyLocations = [v8 BOOLValue];

    v9 = [v4 objectForKey:@"SkipProcessingCurrentLocation"];
    uint64_t v10 = objc_opt_class();
    v11 = WFEnforceClass(v9, v10);
    v5->_skipsProcessingCurrentLocation = [v11 BOOLValue];

    v12 = [v4 objectForKey:@"DefaultToCurrentLocation"];
    uint64_t v13 = objc_opt_class();
    v14 = WFEnforceClass(v12, v13);
    v5->_defaultToCurrentLocation = [v14 BOOLValue];

    v15 = [v4 objectForKey:@"AllowCurrentLocation"];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = WFEnforceClass(v15, v16);
    v18 = (void *)v17;
    v19 = (void *)MEMORY[0x1E4F1CC38];
    if (v17) {
      v19 = (void *)v17;
    }
    id v20 = v19;

    char v21 = [v20 BOOLValue];
    v5->_allowsCurrentLocation = v21;
    v22 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end
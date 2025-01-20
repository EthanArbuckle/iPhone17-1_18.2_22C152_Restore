@interface WFLocationValue
- (BOOL)isCurrentLocation;
- (CLPlacemark)placemark;
- (NSString)defaultSearchText;
- (NSString)displayString;
- (NSString)locationName;
- (WFLocationValue)initWithCurrentLocation;
- (WFLocationValue)initWithLegacyVariableString:(id)a3;
- (WFLocationValue)initWithLocationName:(id)a3;
- (WFLocationValue)initWithLocationName:(id)a3 placemark:(id)a4;
- (WFLocationValue)initWithPlacemark:(id)a3;
- (WFLocationValue)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFPropertyListObject)serializedRepresentation;
- (WFVariableString)legacyVariableString;
@end

@implementation WFLocationValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyVariableString, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
}

- (WFVariableString)legacyVariableString
{
  return self->_legacyVariableString;
}

- (BOOL)isCurrentLocation
{
  return self->_currentLocation;
}

- (CLPlacemark)placemark
{
  return self->_placemark;
}

- (NSString)locationName
{
  return self->_locationName;
}

- (WFPropertyListObject)serializedRepresentation
{
  v3 = objc_opt_new();
  if ([(WFLocationValue *)self isCurrentLocation]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"isCurrentLocation"];
  }
  v4 = [(WFLocationValue *)self locationName];
  [v3 setValue:v4 forKey:@"locationName"];

  v5 = [(WFLocationValue *)self placemark];
  v6 = WFSerializedPlacemarkFromCLPlacemark();
  [v3 setValue:v6 forKey:@"placemark"];

  v7 = [(WFLocationValue *)self legacyVariableString];
  v8 = [v7 serializedRepresentation];
  [v3 setValue:v8 forKey:@"legacyVariableString"];

  return (WFPropertyListObject *)v3;
}

- (WFLocationValue)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = objc_opt_class();
  v12 = WFEnforceClass(v10, v11);

  if (!v12)
  {
    v17 = 0;
    goto LABEL_11;
  }
  v13 = [v12 objectForKey:@"isCurrentLocation"];
  uint64_t v14 = objc_opt_class();
  v15 = WFEnforceClass(v13, v14);
  int v16 = [v15 BOOLValue];

  if (!v16)
  {
    v18 = [v12 objectForKey:@"placemark"];
    uint64_t v19 = objc_opt_class();
    v20 = WFEnforceClass(v18, v19);

    if (v20)
    {
      v21 = WFCLPlacemarkFromSerializedPlacemark();
      v22 = [(WFLocationValue *)self initWithPlacemark:v21];
    }
    else
    {
      v23 = [v12 objectForKey:@"locationName"];
      uint64_t v24 = objc_opt_class();
      v21 = WFEnforceClass(v23, v24);

      if (!v21)
      {
        v26 = [v12 objectForKey:@"legacyVariableString"];
        uint64_t v27 = objc_opt_class();
        v28 = WFEnforceClass(v26, v27);

        if (v28)
        {
          v29 = [[WFVariableString alloc] initWithSerializedRepresentation:v28 variableProvider:v8 parameter:v9];
          self = [(WFLocationValue *)self initWithLegacyVariableString:v29];

          v17 = self;
        }
        else
        {
          v17 = 0;
        }

        v21 = 0;
        goto LABEL_10;
      }
      v22 = [(WFLocationValue *)self initWithLocationName:v21];
    }
    self = v22;
    v17 = self;
LABEL_10:

    goto LABEL_11;
  }
  self = [(WFLocationValue *)self initWithCurrentLocation];
  v17 = self;
LABEL_11:

  return v17;
}

- (WFLocationValue)initWithLegacyVariableString:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLocationValue;
  v6 = [(WFLocationValue *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_legacyVariableString, a3);
    id v8 = v7;
  }

  return v7;
}

- (NSString)defaultSearchText
{
  v3 = [(WFLocationValue *)self locationName];

  if (v3)
  {
    id v4 = [(WFLocationValue *)self locationName];
    goto LABEL_11;
  }
  id v5 = [(WFLocationValue *)self placemark];

  if (v5)
  {
    v6 = [(WFLocationValue *)self placemark];
    v7 = [v6 name];
    id v8 = v7;
    if (v7)
    {
      id v4 = v7;
    }
    else
    {
      objc_super v10 = [(WFLocationValue *)self placemark];
      uint64_t v11 = [v10 postalAddress];
      id v4 = [v11 street];
    }
    goto LABEL_10;
  }
  id v9 = [(WFLocationValue *)self legacyVariableString];

  if (v9)
  {
    v6 = [(WFLocationValue *)self legacyVariableString];
    id v4 = [v6 stringByRemovingVariables];
LABEL_10:

    goto LABEL_11;
  }
  id v4 = 0;
LABEL_11:
  return (NSString *)v4;
}

- (NSString)displayString
{
  v3 = [(WFLocationValue *)self locationName];

  if (v3)
  {
    uint64_t v4 = [(WFLocationValue *)self locationName];
LABEL_3:
    id v5 = (id)v4;
    goto LABEL_12;
  }
  v6 = [(WFLocationValue *)self placemark];

  if (v6)
  {
    v7 = [(WFLocationValue *)self placemark];
    id v8 = [v7 name];
    id v9 = v8;
    if (v8)
    {
      id v5 = v8;
    }
    else
    {
      objc_super v10 = [(WFLocationValue *)self placemark];
      uint64_t v11 = [v10 postalAddress];
      id v5 = [v11 street];
    }
    goto LABEL_11;
  }
  if ([(WFLocationValue *)self isCurrentLocation])
  {
    uint64_t v4 = WFLocalizedString(@"Current Location");
    goto LABEL_3;
  }
  v13 = [(WFLocationValue *)self legacyVariableString];

  if (v13)
  {
    v7 = [(WFLocationValue *)self legacyVariableString];
    id v5 = [v7 stringByReplacingVariablesWithNames];
LABEL_11:

    goto LABEL_12;
  }
  id v5 = 0;
LABEL_12:
  return (NSString *)v5;
}

- (WFLocationValue)initWithCurrentLocation
{
  v6.receiver = self;
  v6.super_class = (Class)WFLocationValue;
  v2 = [(WFLocationValue *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentLocation = 1;
    uint64_t v4 = v2;
  }

  return v3;
}

- (WFLocationValue)initWithLocationName:(id)a3 placemark:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFLocationValue;
  id v8 = [(WFLocationValue *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    locationName = v8->_locationName;
    v8->_locationName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_placemark, a4);
    uint64_t v11 = v8;
  }

  return v8;
}

- (WFLocationValue)initWithPlacemark:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLocationValue;
  id v6 = [(WFLocationValue *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_placemark, a3);
    id v8 = v7;
  }

  return v7;
}

- (WFLocationValue)initWithLocationName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLocationValue;
  id v5 = [(WFLocationValue *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    locationName = v5->_locationName;
    v5->_locationName = (NSString *)v6;

    id v8 = v5;
  }

  return v5;
}

@end
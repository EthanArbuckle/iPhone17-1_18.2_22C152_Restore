@interface RouteMarkerFormatterInfo
- (GEOStyleAttributes)styleAttributes;
- (NSString)routeDescription;
- (RouteMarkerFormatterInfo)initWithRouteDescription:(id)a3 etaComparison:(unsigned __int8)a4 tollCurrency:(unsigned __int8)a5 styleAttributes:(id)a6;
- (RouteMarkerFormatterInfo)initWithRouteDescription:(id)a3 etaType:(int64_t)a4 etaComparison:(unsigned __int8)a5 tollCurrency:(unsigned __int8)a6 styleAttributes:(id)a7;
- (id)description;
- (int64_t)etaType;
- (unsigned)etaComparison;
- (unsigned)tollCurrency;
@end

@implementation RouteMarkerFormatterInfo

- (RouteMarkerFormatterInfo)initWithRouteDescription:(id)a3 etaComparison:(unsigned __int8)a4 tollCurrency:(unsigned __int8)a5 styleAttributes:(id)a6
{
  return [(RouteMarkerFormatterInfo *)self initWithRouteDescription:a3 etaType:0 etaComparison:a4 tollCurrency:a5 styleAttributes:a6];
}

- (RouteMarkerFormatterInfo)initWithRouteDescription:(id)a3 etaType:(int64_t)a4 etaComparison:(unsigned __int8)a5 tollCurrency:(unsigned __int8)a6 styleAttributes:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v18.receiver = self;
  v18.super_class = (Class)RouteMarkerFormatterInfo;
  v14 = [(RouteMarkerFormatterInfo *)&v18 init];
  if (v14)
  {
    v15 = (NSString *)[v12 copy];
    routeDescription = v14->_routeDescription;
    v14->_routeDescription = v15;

    v14->_etaType = a4;
    v14->_etaComparison = a5;
    v14->_tollCurrency = a6;
    objc_storeStrong((id *)&v14->_styleAttributes, a7);
  }

  return v14;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  v4 = v3;
  CFStringRef v5 = @"VKExitSign";
  switch(self->_etaType)
  {
    case 0:
      goto LABEL_9;
    case 1:
      goto LABEL_8;
    case 2:
      CFStringRef v5 = @"VKTrafficDelay";
      goto LABEL_8;
    case 3:
      CFStringRef v5 = @"VKRouteLegEta";
      goto LABEL_8;
    case 4:
      CFStringRef v5 = @"VKRouteName";
      goto LABEL_8;
    case 5:
      CFStringRef v5 = @"VKTravelDirection";
      goto LABEL_8;
    case 6:
      CFStringRef v5 = @"VKDebugAnnotation";
      goto LABEL_8;
    default:
      CFStringRef v5 = @"VKRouteEtaUnknown";
LABEL_8:
      [v3 appendFormat:@", etaType: %@", v5];
LABEL_9:
      v6 = @"Same";
      switch(self->_etaComparison)
      {
        case 0u:
          goto LABEL_14;
        case 1u:
          goto LABEL_13;
        case 2u:
          v6 = @"Slower";
          goto LABEL_13;
        case 3u:
          v6 = @"Faster";
          goto LABEL_13;
        default:
          v6 = +[NSString stringWithFormat:@"VKEtaComparison (%u)", self->_etaComparison];
LABEL_13:
          [v4 appendFormat:@", etaComparison: %@", v6];

LABEL_14:
          v7 = @"Usd";
          switch(self->_tollCurrency)
          {
            case 0u:
              goto LABEL_23;
            case 1u:
              goto LABEL_22;
            case 2u:
              v7 = @"Yen";
              goto LABEL_22;
            case 3u:
              v7 = @"Euro";
              goto LABEL_22;
            case 4u:
              v7 = @"Pound";
              goto LABEL_22;
            case 5u:
              v7 = @"Won";
              goto LABEL_22;
            case 6u:
              v7 = @"Rupee";
              goto LABEL_22;
            case 7u:
              v7 = @"Ruble";
              goto LABEL_22;
            default:
              v7 = +[NSString stringWithFormat:@"VKEtaTollCurrencyType (%u)", self->_tollCurrency];
LABEL_22:
              [v4 appendFormat:@", tollCurrency: %@", v7];

LABEL_23:
              CFStringRef v8 = @"YES";
              if (!self->_styleAttributes) {
                CFStringRef v8 = @"NO";
              }
              [v4 appendFormat:@", hasStyleAttributes: %@, routeDescription: %@>", v8, self->_routeDescription];
              return v4;
          }
      }
  }
}

- (NSString)routeDescription
{
  return self->_routeDescription;
}

- (int64_t)etaType
{
  return self->_etaType;
}

- (unsigned)etaComparison
{
  return self->_etaComparison;
}

- (unsigned)tollCurrency
{
  return self->_tollCurrency;
}

- (GEOStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);

  objc_storeStrong((id *)&self->_routeDescription, 0);
}

@end